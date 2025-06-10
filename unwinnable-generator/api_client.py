# Module for handling all communication with the OpenRouter.ai API.

import os
import re
import requests
import json

# It's best practice to load your API key from an environment variable
# You can set this in your shell: export OPENROUTER_API_KEY='your_key_here'
API_KEY = os.getenv("OPENROUTER_API_KEY")
API_BASE_URL = "https://openrouter.ai/api/v1"
HTTP_REFERER = "https://github.com/your-repo/unwinnable-by-design" # Recommended by OpenRouter
SITE_NAME = "Unwinnable By Design Generation Engine" # Recommended by OpenRouter

def call_openrouter_for_text(model_name: str, system_prompt: str, user_prompt: str) -> str:
    """
    Sends a request to the OpenRouter.ai API and returns the raw text response.
    This version does not enforce a JSON response format.
    """
    if not API_KEY:
        raise ValueError("OPENROUTER_API_KEY environment variable not set.")

    headers = {
        "Authorization": f"Bearer {API_KEY}",
        "Content-Type": "application/json",
        "HTTP-Referer": HTTP_REFERER,
        "X-Title": SITE_NAME
    }

    body = {
        "model": model_name,
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_prompt}
        ]
    }

    try:
        response = requests.post(
            f"{API_BASE_URL}/chat/completions",
            headers=headers,
            data=json.dumps(body),
            timeout=90
        )
        response.raise_for_status()
        return response.json()['choices'][0]['message']['content']
    except requests.exceptions.RequestException as e:
        print(f"An API error occurred: {e}")
        return None


def call_openrouter(model_name: str, system_prompt: str, user_prompt: str) -> dict:
    """
    Sends a request to the OpenRouter.ai API and returns the JSON response.

    Args:
        model_name: The name of the model to use (e.g., "openai/gpt-4o").
        system_prompt: The system message to configure the LLM's role.
        user_prompt: The user message containing the specific request.

    Returns:
        A dictionary parsed from the API's JSON response, or None on failure.
    """
    if not API_KEY:
        raise ValueError("OPENROUTER_API_KEY environment variable not set.")

    headers = {
        "Authorization": f"Bearer {API_KEY}",
        "Content-Type": "application/json",
        "HTTP-Referer": HTTP_REFERER,
        "X-Title": SITE_NAME
    }

    body = {
        "model": model_name,
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_prompt}
        ],
        "response_format": {"type": "json_object"}
    }

    try:
        response = requests.post(
            f"{API_BASE_URL}/chat/completions",
            headers=headers,
            data=json.dumps(body),
            timeout=90
        )
        
        response.raise_for_status()
        
        response_content = response.json()['choices'][0]['message']['content']
        
        # A more robust method to find and extract a JSON object from a string
        # that might contain conversational text or markdown.
        # This regex looks for a string that starts with { and ends with },
        # and is tolerant of nested braces.
        json_match = re.search(r'\{.*\}', response_content, re.DOTALL)
        
        if json_match:
            json_str = json_match.group(0)
        else:
            print("Could not find any JSON-like object in the API response.")
            print(f"Raw response text: {response_content}")
            return None

        # The LLM sometimes adds comments or stage directions. We'll try to strip them.
        try:
            parsed_json = json.loads(json_str)
            if not isinstance(parsed_json, dict):
                 print("API response was valid JSON, but not a JSON object (dictionary).")
                 raise json.JSONDecodeError("Not a dictionary", json_str, 0)
            return parsed_json
        except json.JSONDecodeError:
            # If parsing fails, log the issue and return None
            print("Failed to decode JSON from the API response.")
            with open("unwinnable-generator/debug_log.txt", "a", encoding="utf-8") as log_file:
                log_file.write("--- JSON DECODE ERROR ---\n")
                log_file.write(f"MODEL: {model_name}\n")
                log_file.write("USER PROMPT (JSON DUMP):\n")
                log_file.write(user_prompt + "\n\n")
                log_file.write("RAW RESPONSE CONTENT:\n")
                log_file.write(response_content + "\n")
                log_file.write("-------------------------\n\n")
            return None

    except requests.exceptions.RequestException as e:
        print(f"An API error occurred: {e}")
        return None

if __name__ == '__main__':
    # Simple test to verify API connectivity
    print("Testing OpenRouter API client...")
    test_system_prompt = "You are a helpful assistant that only responds in JSON."
    test_user_prompt = "Please say hello."
    
    # Using a fast, free model for the test
    test_model = "mistralai/mistral-7b-instruct-free"
    
    result = call_openrouter(test_model, test_system_prompt, test_user_prompt)
    
    if result:
        print("API call successful!")
        print("Response:")
        print(json.dumps(result, indent=2))
    else:
        print("API call failed. Please check your API key and network connection.")
