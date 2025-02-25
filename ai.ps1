# Define the configuration file path and API endpoint
$CONFIG_FILE = "$HOME\.ai.conf"
$API_ENDPOINT = "https://api.openai.com/v1/chat/completions"

# Function to display usage instructions
function Show-Usage {
    Write-Host ""
    Write-Host "Usage: ai <prompt>"
    Write-Host ""
    Write-Host "Description:"
    Write-Host "  This command interprets a natural language prompt and generates"
    Write-Host "  the corresponding PowerShell command(s) to perform the requested task."
    Write-Host ""
    Write-Host "Examples:"
    Write-Host "  ai list all files in the current directory"
    Write-Host "  ai create a new directory called 'project' and cd into it"
    Write-Host "  ai find all .txt files modified in the last 7 days"
    Write-Host ""
}

# Function to prompt for API key and create config file
function Setup-Config {
    Write-Host ""
    Write-Host "API key not found. Please enter your OpenAI API key:"
    $API_KEY = Read-Host
    $API_KEY | Set-Content -Path $CONFIG_FILE
    Write-Host "Config file created at $CONFIG_FILE"

    # Check if PowerShell's Invoke-WebRequest is available, it should be by default
}

# Check if config file exists, if not, set it up
if (!(Test-Path -Path $CONFIG_FILE)) {
    Setup-Config
}

# Read the API key from the config file
$API_KEY = Get-Content -Path $CONFIG_FILE

# Check if a prompt was provided
if ($args.Count -eq 0) {
    Show-Usage
    exit 1
}

# Combine all arguments into a single prompt
$PROMPT = $args -join ' '

# Prepare the API request body
$REQUEST_BODY = @{
    model = "gpt-3.5-turbo"
    messages = @(
        @{
            role = "system"
            content = "You are a helpful assistant that provides PowerShell commands to accomplish tasks. Respond only with the exact PowerShell command(s) needed, without any explanation or markdown formatting."
        },
        @{
            role = "user"
            content = $PROMPT
        }
    )
} | ConvertTo-Json -Depth 100

# Send request to API and handle the response
try {
    $RESPONSE = Invoke-WebRequest -Uri $API_ENDPOINT -Method Post -Headers @{Authorization = "Bearer $API_KEY"; "Content-Type" = "application/json"} -Body $REQUEST_BODY
} catch {
    Write-Host "Error: API request failed with status code $($_.Exception.Response.StatusCode.value__)"
    Write-Host "Response: $($_.Exception.Response.StatusDescription)"
    exit 1
}

# Extract the command from the response
$RESPONSE_CONTENT = $RESPONSE.Content | ConvertFrom-Json
$COMMAND = $RESPONSE_CONTENT.choices[0].message.content

# Check if a command was returned
if ([string]::IsNullOrEmpty($COMMAND)) {
    Write-Host "Error: No command was returned by the API."
    exit 1
}

# Display the command
Write-Host ""
Write-Host $COMMAND
Write-Host ""

