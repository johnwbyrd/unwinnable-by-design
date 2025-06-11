# Module for handling all communication with the OpenRouter.ai API.

import os
import re
import requests
import json

# It's best practice to load your API key from an environment variable
# You can set this in your shell: export OPENROUTER_API_KEY='your_key_here'
API_KEY = os.getenv("OPENROUTER_API_KEY")
# API_BASE_URL is now passed as a parameter
HTTP_REFERER = "https://github.com/your-repo/unwinnable-by-design" # Recommended by OpenRouter
SITE_NAME = "Unwinnable By Design Generation Engine" # Recommended by OpenRouter

def call_openrouter_for_text(model_name: str, system_prompt: str, user_prompt: str, base_url: str, api_type: str) -> str:
    """
    Sends a request to the specified AI API (OpenRouter or Ollama) and returns the raw text response.
    This version does not enforce a JSON response format.
    """
    headers = {"Content-Type": "application/json"}
    # Ensure the endpoint is correctly formed, typically /chat/completions for OpenAI compatibility
    request_url = f"{base_url.rstrip('/')}/chat/completions"

    if api_type == "openrouter":
        if not API_KEY:
            raise ValueError("OPENROUTER_API_KEY environment variable not set for OpenRouter API call.")
        headers["Authorization"] = f"Bearer {API_KEY}"
        headers["HTTP-Referer"] = HTTP_REFERER
        headers["X-Title"] = SITE_NAME
    elif api_type == "ollama":
        # Ollama typically doesn't require auth for local access
        pass
    else:
        raise ValueError(f"Unsupported api_type: {api_type}")

    body = {
        "model": model_name,
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_prompt}
        ],
        "stream": False # Ensure we get a single response for Ollama
    }

    try:
        response = requests.post(
            request_url,
            headers=headers,
            data=json.dumps(body),
            timeout=90
        )
        response.raise_for_status()
        
        response_json = response.json()
        if api_type == "ollama" and "message" in response_json and "content" in response_json["message"]:
            return response_json['message']['content']
        elif 'choices' in response_json and response_json['choices'] and \
             'message' in response_json['choices'][0] and 'content' in response_json['choices'][0]['message']:
            return response_json['choices'][0]['message']['content']
        else:
            print(f"Unexpected text response structure from {api_type}: {response_json}")
            return None

    except requests.exceptions.RequestException as e:
        print(f"An API error occurred with {api_type} at {base_url}: {e}")
        return None


def call_openrouter(model_name: str, system_prompt: str, user_prompt: str, base_url: str, api_type: str) -> dict:
    """
    Sends a request to the specified AI API (OpenRouter or Ollama) and returns the JSON response.

    Args:
        model_name: The name of the model to use.
        system_prompt: The system message to configure the LLM's role.
        user_prompt: The user message containing the specific request (should be a string).
        base_url: The base URL for the API endpoint.
        api_type: The type of API ("openrouter" or "ollama").

    Returns:
        A dictionary parsed from the API's JSON response, or None on failure.
    """
    headers = {"Content-Type": "application/json"}
    request_url = f"{base_url.rstrip('/')}/chat/completions"

    if api_type == "openrouter":
        if not API_KEY:
            raise ValueError("OPENROUTER_API_KEY environment variable not set for OpenRouter API call.")
        headers["Authorization"] = f"Bearer {API_KEY}"
        headers["HTTP-Referer"] = HTTP_REFERER
        headers["X-Title"] = SITE_NAME
    elif api_type == "ollama":
        pass
    else:
        raise ValueError(f"Unsupported api_type: {api_type}")

    body = {
        "model": model_name,
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_prompt} # user_prompt is a string
        ],
        "stream": False
    }

    if api_type == "openrouter":
        body["response_format"] = {"type": "json_object"}
    elif api_type == "ollama":
        body["format"] = "json"

    try:
        response = requests.post(
            request_url,
            headers=headers,
            data=json.dumps(body),
            timeout=90
        )
        response.raise_for_status()
        
        raw_response_content = ""
        response_json_data = response.json()

        if api_type == "ollama" and "message" in response_json_data and "content" in response_json_data["message"]:
            raw_response_content = response_json_data['message']['content']
        elif 'choices' in response_json_data and response_json_data['choices'] and \
             'message' in response_json_data['choices'][0] and 'content' in response_json_data['choices'][0]['message']:
            raw_response_content = response_json_data['choices'][0]['message']['content']
        else:
            print(f"Unexpected JSON response structure from {api_type} before parsing: {response_json_data}")
            return None
        
        try:
            parsed_json = json.loads(raw_response_content)
            if not isinstance(parsed_json, dict):
                 print(f"API response from {api_type} was valid JSON, but not a JSON object (dictionary).")
                 print(f"Raw response text: {raw_response_content}")
                 raise json.JSONDecodeError("Not a dictionary", raw_response_content, 0)
            return parsed_json
        except json.JSONDecodeError:
            print(f"Direct JSON parsing failed for {api_type}. Trying regex extraction as fallback.")
            json_match = re.search(r'\{.*\}', raw_response_content, re.DOTALL)
            if json_match:
                json_str = json_match.group(0)
                try:
                    parsed_json = json.loads(json_str)
                    if not isinstance(parsed_json, dict):
                        print(f"API response from {api_type} (regex extracted) was valid JSON, but not a JSON object.")
                        raise json.JSONDecodeError("Not a dictionary (regex)", json_str, 0)
                    return parsed_json
                except json.JSONDecodeError:
                    print(f"Failed to decode JSON from the API response (regex extracted) for {api_type}.")
            else:
                print(f"Could not find any JSON-like object in the API response for {api_type} after regex.")

            debug_log_path = "pipeline/output/debug_log.txt"
            os.makedirs(os.path.dirname(debug_log_path), exist_ok=True)
            with open(debug_log_path, "a", encoding="utf-8") as log_file:
                log_file.write(f"--- JSON DECODE ERROR ({api_type} at {base_url}) ---\n")
                log_file.write(f"MODEL: {model_name}\n")
                log_file.write("USER PROMPT (string):\n")
                log_file.write(user_prompt + "\n\n")
                log_file.write("RAW RESPONSE CONTENT (that failed to parse):\n")
                log_file.write(raw_response_content + "\n")
                log_file.write("-------------------------\n\n")
            return None

    except requests.exceptions.RequestException as e:
        print(f"An API error occurred with {api_type} at {base_url}: {e}")
        return None

if __name__ == '__main__':
    print("Testing API client...")
    test_system_prompt = "You are a helpful assistant that only responds in JSON."
    test_user_prompt_for_json = "{\"instruction\": \"Please say hello and include a key 'greeting' with value 'hello'\"}"
    
    print("\n--- Testing OpenRouter (JSON Mode) ---")
    or_model = "mistralai/mistral-7b-instruct-free"
    or_base_url = "https://openrouter.ai/api/v1" 
    or_result_json = call_openrouter(or_model, test_system_prompt, test_user_prompt_for_json, or_base_url, "openrouter")
    if or_result_json:
        print("OpenRouter JSON API call successful!")
        print("Response:")
        print(json.dumps(or_result_json, indent=2))
    else:
        print("OpenRouter JSON API call failed. Check API key (OPENROUTER_API_KEY) and network.")

    print("\n--- Testing Ollama (JSON Mode) ---")
    ollama_model = "mistral:latest" 
    ollama_base_url = "http://localhost:11434/v1" 
    
    try:
        requests.get("http://localhost:11434", timeout=2) 
        ollama_result_json = call_openrouter(ollama_model, test_system_prompt, test_user_prompt_for_json, ollama_base_url, "ollama")
        if ollama_result_json:
            print("Ollama JSON API call successful!")
            print("Response:")
            print(json.dumps(ollama_result_json, indent=2))
        else:
            print(f"Ollama JSON API call failed. Ensure Ollama is running, model '{ollama_model}' is available, and it supports JSON mode.")
    except requests.exceptions.ConnectionError:
        print(f"Ollama not reachable at http://localhost:11434. Skipping Ollama JSON test.")
    
    print("\n--- Testing Text Generation (Ollama) ---")
    text_user_prompt = "Tell me a very short story about a robot."
    ollama_text_result = call_openrouter_for_text(ollama_model, "You are a storyteller.", text_user_prompt, ollama_base_url, "ollama")
    if ollama_text_result:
        print("Ollama text generation successful!")
        print("Response:", ollama_text_result)
    else:
        print("Ollama text generation failed for text.")

    if or_result_json or ollama_result_json or ollama_text_result:
        print("\nAt least one API call was successful.")
    else:
        print("\nAll API calls failed or were skipped.")
