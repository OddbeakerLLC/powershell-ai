# PowerShell AI Assistant

A PowerShell script that uses the OpenAI API to generate PowerShell commands based on natural language prompts.

## Requirements

* PowerShell 3 or later
* OpenAI API key (sign up for a free account on the [OpenAI website](https://www.openai.com/))

## Installation

1. Clone this repository to your local machine using `git clone https://github.com/your-username/PowerShell-AI-Assistant.git`
2. Navigate to the cloned repository using `cd PowerShell-AI-Assistant`
3. Run the script using `.\ai.ps1` 
4. Optional: Copy ai.ps1 to a directory in your path for convenience

## Usage

1. Run the script and follow the prompts to set up your OpenAI API key.
2. Once set up, you can use the script by running `.\ai.ps1 <prompt>`, replacing `<prompt>` with your natural language prompt.

Examples:

* `.\ai.ps1 list all files in the current directory`
* `.\ai.ps1 create a new directory called 'project' and cd into it`
* `.\ai.ps1 find all .txt files modified in the last 7 days`

## How it works

1. The script checks if a configuration file exists, and if not, prompts the user to set up their OpenAI API key.
2. The script reads the API key from the configuration file and uses it to send a request to the OpenAI API with the user's prompt.
3. The script receives the response from the OpenAI API and extracts the generated PowerShell command.
4. The script displays the generated command to the user.

## Notes

* This script uses the `gpt-3.5-turbo` model by default. You can modify the script to use a different model if needed.
* This script assumes that you have the necessary permissions to run PowerShell scripts on your system.
* Please use this script responsibly and in accordance with OpenAI's terms of service.

