import os
import json
import itertools
from . import api_client

class Stage:
    """Base class for a pipeline stage."""
    def __init__(self):
        self.name = self.__class__.__name__

    def execute(self, scene_data: dict, **kwargs) -> dict:
        """
        Executes the logic for this stage.
        This method should be overridden by subclasses.
        """
        raise NotImplementedError

class AIStage(Stage):
    """
    Base class for stages that call an AI model.
    Handles loading prompts and model configurations.
    """
    def __init__(self, role: str):
        super().__init__()
        self.role = role
        self.prompt = self._load_prompt()
        self.models = self._load_model_config()

    def _load_prompt(self) -> str:
        """Loads the system prompt for the given LLM role."""
        filepath = f"design/{self.role}.md"
        try:
            with open(filepath, 'r', encoding='utf-8') as f:
                return f.read()
        except FileNotFoundError:
            print(f"Error: System prompt file not found at '{filepath}'")
            return ""

    def _load_model_config(self) -> dict:
        """Loads the model names from the central config file."""
        try:
            with open("pipeline/configs/models.json", 'r', encoding='utf-8') as f:
                return json.load(f).get("staff", {})
        except (FileNotFoundError, json.JSONDecodeError):
            print("Model config not found or invalid. Returning empty config.")
            return {}

    def get_model_for_staff(self, staff: str) -> str:
        """Gets the appropriate model for the selected staff level."""
        return self.models.get(staff, {}).get(self.role, "mistralai/mistral-7b-instruct-free")


class ParseStage(AIStage):
    """
    The first stage of the pipeline. Reads the source .ni file for a scene
    and converts it into a structured JSON object.
    """
    def __init__(self):
        super().__init__(role="parser")

    def _get_scene_source_path(self, scene_name: str) -> str:
        """Finds the .ni source file corresponding to a scene name."""
        source_dir = "Unwinnable-By-Design.inform/Source"
        filename = scene_name.replace('-', ' ') + ".ni"
        return os.path.join(source_dir, filename)

    def execute(self, scene_data: dict, **kwargs) -> dict:
        """
        Executes the parsing logic.
        """
        staff = kwargs.get("staff", "cheap")
        model_name = self.get_model_for_staff(staff)

        if scene_data.get("approved") or (scene_data.get("entities") and scene_data.get("narrative_structure")):
            print("Scene data already parsed and approved. Skipping ParseStage.")
            return scene_data

        scene_name = scene_data["scene_name"]
        source_path = self._get_scene_source_path(scene_name)

        try:
            with open(source_path, 'r', encoding='utf-8') as f:
                source_content = f.read()
        except FileNotFoundError:
            print(f"Error: Source file not found for scene '{scene_name}' at '{source_path}'")
            raise

        print(f"Calling Parser LLM ('{model_name}') for scene '{scene_name}'...")
        parsed_data = api_client.call_openrouter(
            model_name,
            self.prompt,
            source_content
        )

        if not parsed_data:
            print("Parser LLM call failed. Cannot proceed.")
            raise RuntimeError("Failed to parse scene source from LLM.")

        scene_data.update(parsed_data)
        print("Successfully parsed scene source.")
        
        return scene_data

class GenerateActionsStage(Stage):
    """
    Generates all possible, grammatically valid action permutations for a scene
    based on the entities present and a master list of verbs.
    """
    def __init__(self):
        super().__init__()
        self.verbs = self._load_verbs()

    def _load_verbs(self) -> list:
        """Loads verb grammar from the config file."""
        try:
            with open("pipeline/configs/verbs.json", 'r', encoding='utf-8') as f:
                return json.load(f).get("verbs", [])
        except (FileNotFoundError, json.JSONDecodeError) as e:
            print(f"Error reading or parsing verbs.json: {e}")
            return []

    def execute(self, scene_data: dict, **kwargs) -> dict:
        """
        Executes the action generation logic. Skips if actions already exist.
        """
        if scene_data.get("actions"):
            print("Actions already exist for this scene. Skipping GenerateActionsStage.")
            return scene_data

        entities = scene_data.get("entities", [])
        if not entities:
            print("No entities found in scene data. Cannot generate actions.")
            return scene_data

        entity_names = [entity["name"] for entity in entities]
        performers = ["yourself"] + [e["name"] for e in entities if e.get("type") == "person"]

        generated_actions = []
        for verb_data in self.verbs:
            verb_name = verb_data["name"]
            for arity in verb_data["arities"]:
                permutations = []
                if arity == 0:
                    permutations = itertools.product(performers, [verb_name])
                elif arity == 1:
                    permutations = itertools.product(performers, [verb_name], entity_names)
                elif arity == 2:
                    permutations = itertools.product(performers, [verb_name], entity_names, entity_names)

                for p in permutations:
                    if len(p) > 3 and p[2] == p[3]:
                        continue
                    
                    action_id = "-".join(str(s).replace(" ", "_") for s in p if s)
                    action = {
                        "id": action_id,
                        "performer": p[0],
                        "verb": p[1],
                        "noun1": p[2] if len(p) > 2 else None,
                        "noun2": p[3] if len(p) > 3 else None,
                        "approved": False,
                        "dramaturg_notes": None,
                        "beat": []
                    }
                    generated_actions.append(action)
        
        scene_data["actions"] = generated_actions
        print(f"Generated {len(generated_actions)} action permutations.")
        return scene_data

class DramaturgStage(AIStage):
    """
    Analyzes actions, scores them for creativity, and designs the comedic
    beats and mechanical outcomes.
    """
    def __init__(self):
        super().__init__(role="dramaturg")

    def execute(self, scene_data: dict, **kwargs) -> dict:
        """
        Executes the Dramaturg logic for each un-approved action.
        """
        limit = kwargs.get("limit")
        staff = kwargs.get("staff", "cheap")
        model_name = self.get_model_for_staff(staff)

        if not scene_data.get("actions"):
            print("No actions found to process. Skipping DramaturgStage.")
            return scene_data

        actions_to_process = scene_data["actions"]
        if limit is not None:
            print(f"Limiting Dramaturg processing to {limit} actions.")
            actions_to_process = [a for a in actions_to_process if not a.get("dramaturg_notes")]
            actions_to_process = actions_to_process[:limit]

        for action in actions_to_process:
            if action.get("approved"):
                continue
            
            if action.get("dramaturg_notes") and action.get("beat"):
                continue

            print(f"Running Dramaturg ('{model_name}') for action: {action['id']}")

            dramaturg_input = {
                "scene_context": {
                    "scene_name": scene_data["scene_name"],
                    "completion_score": scene_data.get("completion_score"),
                    "narrative_structure": scene_data.get("narrative_structure"),
                    "entities": scene_data.get("entities")
                },
                "action_to_evaluate": action
            }

            response_data = api_client.call_openrouter(
                model_name,
                self.prompt,
                json.dumps(dramaturg_input)
            )

            if not response_data:
                print(f"Dramaturg LLM call failed for action {action['id']}. Skipping.")
                continue

            action["dramaturg_notes"] = response_data.get("dramaturg_notes")
            action["beat"] = response_data.get("beat")
            print(f"Successfully designed beat for action {action['id']}.")

        return scene_data

class WriterStage(AIStage):
    """
    Generates the creative dialogue for each step in a beat.
    """
    def __init__(self):
        super().__init__(role="writer")

    def execute(self, scene_data: dict, **kwargs) -> dict:
        """
        Executes the Writer logic for each beat step that needs dialogue.
        """
        limit = kwargs.get("limit")
        staff = kwargs.get("staff", "cheap")
        model_name = self.get_model_for_staff(staff)

        if not scene_data.get("actions"):
            print("No actions found to process. Skipping WriterStage.")
            return scene_data

        actions_to_process = scene_data["actions"]
        if limit is not None:
            print(f"Limiting Writer processing to {limit} actions.")
            # A bit more complex: find the first N actions that have steps needing dialogue
            limited_actions = []
            count = 0
            for action in actions_to_process:
                if any(not step.get("dialogue") for step in action.get("beat", [])):
                    limited_actions.append(action)
                    count += 1
                    if count >= limit:
                        break
            actions_to_process = limited_actions


        for action in actions_to_process:
            if action.get("approved") or not action.get("beat"):
                continue

            for step in action["beat"]:
                if step.get("approved") or step.get("dialogue"):
                    continue

                print(f"Running Writer ('{model_name}') for action {action['id']}, step {step['step']}...")

                writer_input = {
                    "scene_context": {
                        "scene_name": scene_data["scene_name"],
                        "narrative_structure": scene_data.get("narrative_structure"),
                    },
                    "action": {
                        "performer": action["performer"],
                        "verb": action["verb"],
                        "noun1": action["noun1"],
                        "noun2": action["noun2"],
                    },
                    "beat_step": step,
                    "dramaturg_notes": action.get("dramaturg_notes")
                }

                dialogue = api_client.call_openrouter_for_text(
                    model_name,
                    self.prompt,
                    json.dumps(writer_input)
                )

                if not dialogue:
                    print(f"Writer LLM call failed for action {action['id']}, step {step['step']}. Skipping.")
                    continue
                
                step["dialogue"] = dialogue
                print(f"Successfully wrote dialogue for action {action['id']}, step {step['step']}.")

        return scene_data

class GenerateI7XStage(Stage):
    """
    Compiles the final, approved scene data into Inform 7 extension files.
    """
    def __init__(self):
        super().__init__()

    def _format_for_inform7(self, text: str) -> str:
        """Formats a raw string for Inform 7, converting newlines and special characters."""
        if not isinstance(text, str):
            return ""
        text = text.replace('"', '[quotation mark]')
        text = text.replace("'", "[apostrophe]")
        text = text.replace('\n\n', '[paragraph break]')
        text = text.replace('\n', '[line break]')
        return text

    def execute(self, scene_data: dict, **kwargs) -> dict:
        """
        Executes the I7X generation logic.
        """
        scene_name = scene_data["scene_name"]
        output_dir = "pipeline/output/extensions"
        os.makedirs(output_dir, exist_ok=True)
        
        responses_path = os.path.join(output_dir, f"{scene_name} Responses.i7x")
        print(f"Generating responses file: {responses_path}")
        
        with open(responses_path, 'w', encoding='utf-8') as f:
            f.write(f'Version 1 of {scene_name} Responses by Unwinnable Engine begins here.\n\n')
            f.write(f'Table of {scene_name} Responses\n')
            f.write('performer\tverb\tfirst-noun\tsecond-noun\tpoints\thandler_name\tresponse\n')

            for action in scene_data.get("actions", []):
                if not action.get("approved"):
                    continue
                
                for step in action.get("beat", []):
                    if not step.get("approved"):
                        continue
                    
                    handler_name = action.get("dramaturg_notes", {}).get("special_handler_name", "")
                    f.write(f'"{action["performer"]}"\t"{action["verb"]}"\t"{action.get("noun1") or ""}"\t"{action.get("noun2") or ""}"\t{step.get("points", 0)}\t"{handler_name}"\t"{self._format_for_inform7(step["dialogue"])}"\n')

            f.write(f'\n{scene_name} Responses ends here.\n')
        
        handlers_path = os.path.join(output_dir, f"{scene_name} Handlers.i7x")
        print(f"Generating handlers file: {handlers_path}")

        with open(handlers_path, 'w', encoding='utf-8') as f:
            f.write(f'Version 1 of {scene_name} Handlers by Unwinnable Engine begins here.\n\n')
            
            for action in scene_data.get("actions", []):
                notes = action.get("dramaturg_notes", {})
                if action.get("approved") and notes.get("outcome") == "special-handling":
                    handler_name = notes.get("special_handler_name")
                    code_lines = notes.get("generated_i7_code", [])
                    if handler_name and code_lines:
                        f.write(f'To {handler_name}:\n')
                        for line in code_lines:
                            f.write(f'\t{line}\n')
                        f.write('\n')

            f.write(f'{scene_name} Handlers ends here.\n')
            
        print("I7X file generation complete.")
        return scene_data
