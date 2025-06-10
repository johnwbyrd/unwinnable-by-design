import os
import re
import itertools
import json
from api_client import call_openrouter, call_openrouter_for_text

# --- Constants ---
INFORM_PROJECT_PATH = "Unwinnable-By-Design.inform"
SOURCE_DIR = os.path.join(INFORM_PROJECT_PATH, "Source")
SCENE_TAG_REGEX = re.compile(r"\[--\s*SCENE\s+'([^']+)'\s*--\]")
DIRECTOR_NOTE_REGEX = re.compile(r"\[--\s*DIRECTOR_NOTE:\s*(.*?)\s*--\]", re.DOTALL)

def find_scene_files() -> dict:
    """
    Scans the source directory for .ni files with scene tags.

    Returns:
        A dictionary mapping scene names to a tuple of (filepath, director_note).
    """
    scene_files = {}
    if not os.path.isdir(SOURCE_DIR):
        print(f"Error: Source directory not found at '{SOURCE_DIR}'")
        return scene_files

    for filename in os.listdir(SOURCE_DIR):
        if filename.endswith(".ni"):
            filepath = os.path.join(SOURCE_DIR, filename)
            try:
                with open(filepath, 'r', encoding='utf-8') as f:
                    content = f.read()
                    scene_match = SCENE_TAG_REGEX.search(content)
                    if scene_match:
                        scene_name = scene_match.group(1)
                        note_match = DIRECTOR_NOTE_REGEX.search(content)
                        director_note = note_match.group(1).strip() if note_match else None
                        scene_files[scene_name] = (filepath, director_note)
                        print(f"Found scene '{scene_name}' in '{filename}'")
                        if director_note:
                            print(f"  -> Found Director's Note for this scene.")
            except Exception as e:
                print(f"Error reading file {filename}: {e}")
    return scene_files

def get_system_prompt(role: str) -> str:
    """Loads the system prompt for a given LLM role from the design docs."""
    filepath = f"design/{role}.md"
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            return f.read()
    except FileNotFoundError:
        print(f"Error: System prompt file not found at '{filepath}'")
        return ""

def parse_scene_content(scene_name: str, filepath: str) -> dict:
    """
    Reads the content of a scene file and sends it to the Parser LLM.
    """
    print(f"\n--- Parsing Scene: {scene_name} ---")
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
    except Exception as e:
        print(f"Error reading file {filepath}: {e}")
        return None

    parser_prompt = get_system_prompt("parser")
    if not parser_prompt:
        return None

    # For now, let's use a fast and capable model for parsing
    parser_model = "anthropic/claude-3-haiku"

    print("Calling Parser LLM to get structured data...")
    structured_data = call_openrouter(parser_model, parser_prompt, content)

    if structured_data:
        print("Parser LLM call successful. Received structured data.")
        # print(json.dumps(structured_data, indent=2)) # Optional: for debugging
    else:
        print("Parser LLM call failed.")
    
    return structured_data

def generate_action_permutations(scene_data: dict) -> list:
    """
    Generates all possible action permutations for a given scene.
    """
    print("Generating action permutations...")
    
    # Define a list of common verbs. This could be expanded or moved to a config.
    verbs = [
        "taking", "examining", "attacking", "eating", "wearing", 
        "jumping", "kissing", "talking to", "giving", "showing", "using"
    ]
    
    entities = scene_data.get("entities", [])
    entity_names = [entity["name"] for entity in entities]
    
    # The player is always a potential performer
    performers = ["yourself"]
    # Add any NPCs as potential performers
    for entity in entities:
        if entity.get("type") == "person":
            performers.append(entity["name"])

    # Generate permutations for actions with one noun (e.g., > EAT SWORD)
    actions_one_noun = list(itertools.product(performers, verbs, entity_names))
    
    # Generate permutations for actions with two nouns (e.g., > GIVE SWORD TO NPC)
    actions_two_nouns = list(itertools.product(performers, verbs, entity_names, entity_names))

    print(f"Generated {len(actions_one_noun)} single-noun and {len(actions_two_nouns)} double-noun action permutations.")
    
    # For now, we'll just return the single-noun actions for simplicity
    # In the future, we'll combine and filter these more intelligently.
    return actions_one_noun

def clean_actor_dialogue(text: str) -> str:
    """
    Removes unwanted artifacts like stage directions from the Actor's response.
    """
    if not isinstance(text, str):
        return ""
    # Remove any text enclosed in asterisks (e.g., *sighs*)
    text = re.sub(r'\*.*?\*', '', text)
    # Strip leading/trailing whitespace that might be left over
    return text.strip()

def format_for_inform7(text: str) -> str:
    """
    Formats a raw string for Inform 7, converting newlines and special characters.
    """
    if not isinstance(text, str):
        return ""
    # First, handle the special characters that Inform 7 uses for its own syntax.
    text = text.replace('"', '[quotation mark]')
    text = text.replace("'", "[apostrophe]")
    # Now, handle newlines.
    text = text.replace('\n\n', '[paragraph break]')
    text = text.replace('\n', '[line break]')
    return text

def write_response_table_file(scene_name: str, table_rows: list):
    """Writes the generated response data to an Inform 7 extension file."""
    
    # Convert scene name to "Normal English Casing" for the filename
    filename = f"{scene_name}.i7x"
    # For now, let's keep the output in a dedicated folder to not clutter the source
    output_dir = "unwinnable-generator/output/extensions"
    os.makedirs(output_dir, exist_ok=True)
    filepath = os.path.join(output_dir, filename)

    print(f"\n--- Writing to file: {filepath} ---")

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(f'Version 1 of {scene_name} Responses by Unwinnable Engine begins here.\n\n')
        f.write(f'Table of {scene_name} Responses\n')
        f.write('performer\tverb\tfirst-noun\tsecond-noun\tpoints\tsaid-already\tis-final\ttriggers-compliance\tapproved\thandler_name\tresponse\n')
        
        for row in table_rows:
            # Ensure all fields are present and are strings for writing
            # Note: The response text itself will contain quotes, so we wrap it in double quotes for the table.
            f.write(f'"{row.get("performer", "")}"\t"{row.get("verb", "")}"\t"{row.get("first_noun", "")}"\t"{row.get("second_noun", "")}"\t{row.get("points", 0)}\t{str(row.get("said_already", "false")).lower()}\t{str(row.get("is_final", "false")).lower()}\t{str(row.get("triggers_compliance", "false")).lower()}\t{str(row.get("approved", "false")).lower()}\t"{row.get("handler_name", "")}"\t"{row.get("response", "")}"\n')

        f.write(f'\n{scene_name} Responses ends here.\n')
    
    print(f"Successfully wrote {len(table_rows)} rows to {filepath}")


def main():
    """Main function to orchestrate the content generation pipeline."""
    print("Starting content generation engine...")
    
    # --- Load all system prompts at the beginning ---
    prompts = {
        "parser": get_system_prompt("parser"),
        "director": get_system_prompt("director"),
        "actor": get_system_prompt("actor")
    }
    if any(not prompt for prompt in prompts.values()):
        print("Error: Could not load all system prompts. Exiting.")
        return

    scenes = find_scene_files()
    if not scenes:
        print("No scenes found. Exiting.")
        return

    for scene_name, (filepath, director_note) in scenes.items():
        scene_data = parse_scene_content(scene_name, filepath)
        if not scene_data:
            print(f"Could not process scene {scene_name}. Skipping.")
            continue
        
        actions = generate_action_permutations(scene_data)
        
        # --- Main Loop: Process actions through Director and Actor ---
        final_table_rows = []
        # Limit to first 5 actions for testing
        for i, action in enumerate(actions[:5]):
            performer, verb, noun1 = action
            print(f"\n--- Processing Action {i+1}/5: {performer}, {verb}, {noun1} ---")

            director_input = {
                "director_note": director_note,
                "scene_context": scene_data,
                "action": {"performer": performer, "verb": verb, "first_noun": noun1, "second_noun": ""},
                "repetition_count": 1 # Hardcoded for now
            }

            print("Calling Director LLM...")
            director_spec = call_openrouter("anthropic/claude-3-haiku", prompts["director"], json.dumps(director_input))

            if not director_spec or director_spec.get("outcome") == "unparseable":
                print("Director deemed action unparseable or failed. Skipping.")
                continue
            
            print("Director call successful. Calling Actor LLM...")
            actor_prompt = director_spec.get("actor_prompt", "Please provide a generic refusal.")
            
            # Use the simplified text-based client for the Actor
            dialogue = call_openrouter_for_text("anthropic/claude-3-haiku", prompts["actor"], actor_prompt)
            
            if not dialogue:
                print("Actor call failed. Skipping.")
                continue

            # Assemble the final row for the table
            outcome = director_spec.get("outcome", {})
            row = {
                "performer": performer,
                "verb": verb,
                "first_noun": noun1,
                "second_noun": "",
                "points": outcome.get("points_deducted", 0),
                "said_already": False,
                "is_final": False,
                "triggers_compliance": outcome.get("type") == "malicious-compliance",
                "approved": False,
                "handler_name": outcome.get("handler_name", ""),
                "response": format_for_inform7(dialogue)
            }
            final_table_rows.append(row)
            print(f"Successfully generated response for action.")

        if final_table_rows:
            write_response_table_file(scene_name.replace(" ", ""), final_table_rows)

if __name__ == "__main__":
    main()
