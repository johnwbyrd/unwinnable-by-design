import os
import json
import re
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
        """Loads the model configurations from the central config file."""
        try:
            with open("pipeline/configs/models.json", 'r', encoding='utf-8') as f:
                return json.load(f)
        except (FileNotFoundError, json.JSONDecodeError):
            print("Model config not found or invalid. Returning empty config.")
            return {}

    def get_model_config_for_staff(self, staff: str) -> dict:
        """Gets the appropriate model configuration for the selected staff level and role."""
        staff_config = self.models.get("staff", {}).get(staff, {})
        role_config = staff_config.get(self.role)
        
        if role_config and isinstance(role_config, dict) and \
           all(k in role_config for k in ["model_name", "base_url", "api_type"]):
            return role_config
        
        default_config = self.models.get("default_model_config", {})
        if all(k in default_config for k in ["model_name", "base_url", "api_type"]):
            print(f"Warning: Using default model config for role '{self.role}' and staff '{staff}'.")
            return default_config
        
        print(f"Critical Warning: Default model config is missing or incomplete. Using hardcoded fallback for role '{self.role}'.")
        return {
            "model_name": "mistralai/mistral-7b-instruct-free",
            "base_url": "https://openrouter.ai/api/v1",
            "api_type": "openrouter"
        }


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
        staff = kwargs.get("staff", "cheap")
        model_config = self.get_model_config_for_staff(staff)
        model_name = model_config["model_name"]
        base_url = model_config["base_url"]
        api_type = model_config["api_type"]

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

        print(f"Calling Parser LLM ('{model_name}' via {api_type} at {base_url}) for scene '{scene_name}' (expecting text response)...")
        
        parser_user_prompt = source_content

        raw_response_text = api_client.call_openrouter_for_text(
            model_name=model_name,
            system_prompt=self.prompt,
            user_prompt=parser_user_prompt,
            base_url=base_url,
            api_type=api_type
        )

        if not raw_response_text:
            print("Parser LLM call (for text) failed. Cannot proceed.")
            raise RuntimeError("Failed to get text response from LLM for parsing.")

        parsed_data = None
        try:
            clean_text = raw_response_text.strip()
            if clean_text.startswith("```json"):
                clean_text = clean_text[7:]
            if clean_text.startswith("```"): 
                clean_text = clean_text[3:]
            if clean_text.endswith("```"):
                clean_text = clean_text[:-3]
            clean_text = clean_text.strip()
            
            parsed_data = json.loads(clean_text)
        except json.JSONDecodeError:
            print("Direct JSON parsing of parser response failed. Trying regex extraction.")
            json_match = re.search(r'\{[\s\S]*\}', clean_text) 
            if json_match:
                json_str = json_match.group(0)
                try:
                    parsed_data = json.loads(json_str)
                except json.JSONDecodeError as e_regex:
                    print(f"Failed to decode JSON from regex-extracted string: {e_regex}")
                    print(f"Regex extracted string was: {json_str}")
            else:
                print("Could not find any JSON-like object in the parser's text response via regex.")
        
        if not parsed_data or not isinstance(parsed_data, dict):
            print("Failed to parse valid JSON object from LLM text response. Cannot proceed.")
            print(f"Raw response was: {raw_response_text}")
            raise RuntimeError("Failed to parse scene source from LLM after attempting text and regex.")

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
        limit = kwargs.get("limit")
        staff = kwargs.get("staff", "cheap")
        model_config = self.get_model_config_for_staff(staff)
        model_name = model_config["model_name"]
        base_url = model_config["base_url"]
        api_type = model_config["api_type"]

        if not scene_data.get("actions"):
            print("No actions found to process. Skipping DramaturgStage.")
            return scene_data

        actions_to_process = scene_data["actions"]
        if limit is not None:
            print(f"Limiting Dramaturg processing to {limit} actions.")
            actions_to_process = [a for a in actions_to_process if not (a.get("dramaturg_notes") and a.get("beat"))] 
            actions_to_process = actions_to_process[:limit]

        for action in actions_to_process:
            if action.get("approved"): 
                continue
            
            if action.get("dramaturg_notes") and action.get("beat") and \
               action.get("dramaturg_notes", {}).get("approved") is not False and \
               all(s.get("approved") is not False for s in action.get("beat",[])): 
                continue

            print(f"Running Dramaturg ('{model_name}' via {api_type} at {base_url}) for action: {action['id']}")

            dramaturg_input = {
                "scene_context": {
                    "scene_name": scene_data["scene_name"],
                    "completion_score": scene_data.get("completion_score"),
                    "narrative_structure": scene_data.get("narrative_structure"),
                    "entities": scene_data.get("entities")
                },
                "action_to_evaluate": {key: val for key, val in action.items() if key not in ["dramaturg_notes", "beat"]} 
            }

            response_data = api_client.call_openrouter( 
                model_name=model_name,
                system_prompt=self.prompt,
                user_prompt=json.dumps(dramaturg_input),
                base_url=base_url,
                api_type=api_type
            )

            if not response_data:
                print(f"Dramaturg LLM call failed for action {action['id']}. Skipping.")
                continue

            action["dramaturg_notes"] = response_data.get("dramaturg_notes", {"approved": False}) 
            action["beat"] = response_data.get("beat", []) 
            if "approved" not in action["dramaturg_notes"]:
                action["dramaturg_notes"]["approved"] = False
            for step in action["beat"]:
                if "approved" not in step:
                    step["approved"] = False
            print(f"Successfully designed beat for action {action['id']}.")

        return scene_data

class WriterStage(AIStage):
    """
    Generates the creative dialogue for each step in a beat.
    """
    def __init__(self):
        super().__init__(role="writer")

    def execute(self, scene_data: dict, **kwargs) -> dict:
        limit = kwargs.get("limit")
        staff = kwargs.get("staff", "cheap")
        model_config = self.get_model_config_for_staff(staff)
        model_name = model_config["model_name"]
        base_url = model_config["base_url"]
        api_type = model_config["api_type"]

        if not scene_data.get("actions"):
            print("No actions found to process. Skipping WriterStage.")
            return scene_data

        actions_processed_count = 0
        for action in scene_data["actions"]:
            if limit is not None and actions_processed_count >= limit:
                print(f"Writer processing limit of {limit} actions reached.")
                break

            if action.get("approved") or not action.get("beat"): 
                continue

            action_needs_writing = False
            for step in action["beat"]:
                if not step.get("approved") and not step.get("dialogue"):
                    action_needs_writing = True
                    break
            
            if not action_needs_writing:
                continue

            print(f"Processing Writer for action {action['id']}...")
            for step_idx, step in enumerate(action["beat"]):
                if step.get("approved") or step.get("dialogue"): 
                    continue

                print(f"Running Writer ('{model_name}' via {api_type} at {base_url}) for action {action['id']}, step {step.get('step', step_idx + 1)}...")

                writer_input = {
                    "scene_context": {
                        "scene_name": scene_data["scene_name"],
                        "narrative_structure": scene_data.get("narrative_structure"),
                    },
                    "action": {key: val for key, val in action.items() if key not in ["dramaturg_notes", "beat"]},
                    "beat_step": step,
                    "dramaturg_notes": action.get("dramaturg_notes")
                }

                dialogue = api_client.call_openrouter_for_text( 
                    model_name=model_name,
                    system_prompt=self.prompt,
                    user_prompt=json.dumps(writer_input),
                    base_url=base_url,
                    api_type=api_type
                )

                if not dialogue:
                    print(f"Writer LLM call failed for action {action['id']}, step {step.get('step', step_idx + 1)}. Skipping.")
                    continue
                
                step["dialogue"] = dialogue.strip() 
                if "approved" not in step: 
                    step["approved"] = False
                print(f"Successfully wrote dialogue for action {action['id']}, step {step.get('step', step_idx + 1)}.")
            
            actions_processed_count +=1

        return scene_data

class GenerateI7XStage(Stage):
    """
    Compiles the final, approved scene data into Inform 7 extension files.
    """
    def __init__(self):
        super().__init__()

    def _format_for_inform7(self, text: str) -> str:
        if not isinstance(text, str):
            return ""
        text = text.replace('"', '[quotation mark]')
        text = text.replace("'", "[apostrophe]") 
        text = text.replace('\r\n', '[line break]').replace('\n', '[line break]')
        return text

    def execute(self, scene_data: dict, **kwargs) -> dict:
        scene_name = scene_data["scene_name"]
        output_dir = "pipeline/output/extensions"
        os.makedirs(output_dir, exist_ok=True)
        
        i7_scene_name_prefix = scene_name.replace('-', ' ').title().replace(' ', '')

        responses_path = os.path.join(output_dir, f"{i7_scene_name_prefix} Responses.i7x")
        print(f"Generating responses file: {responses_path}")
        
        with open(responses_path, 'w', encoding='utf-8') as f:
            f.write(f'Version 1 of {i7_scene_name_prefix} Responses by Unwinnable Engine begins here.\n\n')
            f.write(f'Table of {i7_scene_name_prefix} Scene Responses\n') 
            f.write('performer (text)\tverb (text)\tfirst-noun (text)\tsecond-noun (text)\tpoints (number)\thandler_name (text)\tresponse (text)\n')

            for action in scene_data.get("actions", []):
                if not action.get("dramaturg_notes", {}).get("approved", False) and not action.get("approved", False): 
                    continue 
                
                dramaturg_approved = action.get("dramaturg_notes", {}).get("approved", False) or action.get("approved", False)

                for step in action.get("beat", []):
                    if not step.get("approved", False) and not dramaturg_approved : 
                        continue
                    
                    handler_name = action.get("dramaturg_notes", {}).get("special_handler_name", "")
                    performer = action.get("performer", "")
                    verb = action.get("verb", "")
                    noun1 = action.get("noun1", "")
                    noun2 = action.get("noun2", "")
                    points = step.get("points", 0)
                    dialogue = step.get("dialogue", "")

                    f.write(f'"{performer}"\t"{verb}"\t"{noun1}"\t"{noun2}"\t{points}\t"{handler_name}"\t"{self._format_for_inform7(dialogue)}"\n')

            f.write(f'\n{i7_scene_name_prefix} Responses ends here.\n')
        
        handlers_path = os.path.join(output_dir, f"{i7_scene_name_prefix} Handlers.i7x")
        print(f"Generating handlers file: {handlers_path}")

        with open(handlers_path, 'w', encoding='utf-8') as f:
            f.write(f'Version 1 of {i7_scene_name_prefix} Handlers by Unwinnable Engine begins here.\n\n')
            
            for action in scene_data.get("actions", []):
                notes = action.get("dramaturg_notes", {})
                if notes.get("approved", False) and notes.get("outcome") == "special-handling":
                    handler_name = notes.get("special_handler_name")
                    code_lines = notes.get("generated_i7_code", [])
                    if handler_name and code_lines:
                        f.write(f'To {handler_name}:\n')
                        for line in code_lines:
                            f.write(f'\t{line.strip()}\n') 
                        f.write('\n')

            f.write(f'{i7_scene_name_prefix} Handlers ends here.\n')
            
        print("I7X file generation complete.")
        return scene_data
