import os
import json
import argparse
from .stages import ParseStage, GenerateActionsStage, DramaturgStage, WriterStage, GenerateI7XStage

class Pipeline:
    """
    Orchestrates the entire content generation process.
    It loads a scene, runs a series of stages on it, and saves the result.
    """
    def __init__(self, scene_name: str, limit: int = None, staff: str = "cheap"):
        self.scene_name = scene_name
        self.limit = limit
        self.staff = staff
        self.scene_file_path = f"pipeline/output/{self.scene_name}.json"
        self.debug_dir = f"pipeline/output/debug/{self.scene_name}"
        self.stages = []
        self.scene_data = None

    def add_stage(self, stage):
        """Adds a processing stage to the pipeline."""
        self.stages.append(stage)

    def load_scene_data(self):
        """Loads the scene data from its JSON file."""
        try:
            with open(self.scene_file_path, 'r', encoding='utf-8') as f:
                self.scene_data = json.load(f)
            print(f"Successfully loaded data for scene: {self.scene_name}")
        except FileNotFoundError:
            print(f"Scene data file not found for '{self.scene_name}'. Initializing new data.")
            self.scene_data = {"scene_name": self.scene_name, "approved": False, "actions": []}
        except json.JSONDecodeError:
            print(f"Error decoding JSON for scene '{self.scene_name}'. Aborting.")
            self.scene_data = None

    def save_debug_file(self, stage_name: str):
        """Saves the current state of the scene data for debugging."""
        if not os.path.exists(self.debug_dir):
            os.makedirs(self.debug_dir)
        
        debug_path = os.path.join(self.debug_dir, f"{len(os.listdir(self.debug_dir)):02d}-{stage_name}.json")
        with open(debug_path, 'w', encoding='utf-8') as f:
            json.dump(self.scene_data, f, indent=2)

    def save_scene_data(self):
        """Saves the processed scene data back to its JSON file."""
        if self.scene_data is None:
            print("No scene data to save.")
            return

        # Safe write: write to a temporary file first, then rename.
        temp_path = self.scene_file_path + ".tmp"
        with open(temp_path, 'w', encoding='utf-8') as f:
            json.dump(self.scene_data, f, indent=2)
        
        os.replace(temp_path, self.scene_file_path)
        print(f"Successfully saved scene data for: {self.scene_name}")

    def run(self):
        """Executes all stages in the pipeline in order."""
        self.load_scene_data()
        if self.scene_data is None:
            return

        for stage in self.stages:
            print(f"--- Running Stage: {stage.name} ---")
            try:
                # Pass the limit and staff to the execute method of stages that need it
                if isinstance(stage, (DramaturgStage, WriterStage, ParseStage)):
                     self.scene_data = stage.execute(self.scene_data, limit=self.limit, staff=self.staff)
                else:
                    self.scene_data = stage.execute(self.scene_data)
                
                self.save_debug_file(stage.name)
            except Exception as e:
                print(f"Error during stage '{stage.name}': {e}")
                return
        
        self.save_scene_data()
        print("--- Pipeline execution complete. ---")


def main():
    """
    Main entry point for the content generation pipeline.
    """
    parser = argparse.ArgumentParser(description="Run the Unwinnable by Design content generation pipeline.")
    parser.add_argument(
        "scene", 
        nargs='?', 
        default="Get-the-Quest", 
        help="The name of the scene to process (e.g., 'Get-the-Quest')."
    )
    parser.add_argument(
        "--limit", 
        type=int, 
        default=None, 
        help="Limit the number of actions processed by the Dramaturg and Writer stages."
    )
    parser.add_argument(
        "--staff",
        type=str,
        default="cheap",
        choices=["cheap", "expensive"],
        help="The 'staff' of AI models to use for generation."
    )
    args = parser.parse_args()

    pipeline = Pipeline(args.scene, limit=args.limit, staff=args.staff)

    # Add the stages to the pipeline
    pipeline.add_stage(ParseStage())
    pipeline.add_stage(GenerateActionsStage())
    pipeline.add_stage(DramaturgStage())
    pipeline.add_stage(WriterStage())
    pipeline.add_stage(GenerateI7XStage())

    print(f"Starting pipeline for scene: '{args.scene}'")
    pipeline.run()
