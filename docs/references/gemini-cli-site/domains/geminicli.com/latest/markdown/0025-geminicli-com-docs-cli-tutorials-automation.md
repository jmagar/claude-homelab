Automate tasks with headless mode | Gemini CLI
[Skip to content](#_top)
# Automate tasks with headless mode
Copy as Markdown Copied!
Automate tasks with Gemini CLI. Learn how to use headless mode, pipe data into
Gemini CLI, automate workflows with shell scripts, and generate structured JSON
output for other applications.
## Prerequisites
[Section titled “Prerequisites”](#prerequisites)
* Gemini CLI installed and authenticated.
* Familiarity with shell scripting (Bash/Zsh).
## Why headless mode?
[Section titled “Why headless mode?”](#why-headless-mode)
Headless mode runs Gemini CLI once and exits. It’s perfect for:
* **CI/CD:** Analyzing pull requests automatically.
* **Batch processing:** Summarizing a large number of log files.
* **Tool building:** Creating your own “AI wrapper” scripts.
## How to use headless mode
[Section titled “How to use headless mode”](#how-to-use-headless-mode)
Run Gemini CLI in headless mode by providing a prompt with the `-p` (or
`--prompt`) flag. This bypasses the interactive chat interface and prints the
response to standard output (stdout). Positional arguments without the flag
default to interactive mode, unless the input or output is piped or redirected.
Run a single command:
Terminal window
```
`
gemini -p "Write a poem about TypeScript"
`
```
## How to pipe input to Gemini CLI
[Section titled “How to pipe input to Gemini CLI”](#how-to-pipe-input-to-gemini-cli)
Feed data into Gemini using the standard Unix pipe `|`. Gemini reads the
standard input (stdin) as context and answers your question using standard
output.
Pipe a file:
**macOS/Linux**
Terminal window
```
`
cat error.log | gemini -p "Explain why this failed"
`
```
**Windows (PowerShell)**
Terminal window
```
`
Get-Content error.log | gemini -p "Explain why this failed"
`
```
Pipe a command:
Terminal window
```
`
git diff | gemini -p "Write a commit message for these changes"
`
```
## Use Gemini CLI output in scripts
[Section titled “Use Gemini CLI output in scripts”](#use-gemini-cli-output-in-scripts)
Because Gemini prints to stdout, you can chain it with other tools or save the
results to a file.
### Scenario: Bulk documentation generator
[Section titled “Scenario: Bulk documentation generator”](#scenario-bulk-documentation-generator)
You have a folder of Python scripts and want to generate a `README.md` for each
one.
1. Save the following code as `generate\_docs.sh` (or `generate\_docs.ps1` for
Windows):
**macOS/Linux (`generate\_docs.sh`)**
```
`
#!/bin/bash
# Loop through all Python files
for file in \*.py; do
echo "Generating docs for $file..."
# Ask Gemini CLI to generate the documentation and print it to stdout
gemini -p "Generate a Markdown documentation summary for @$file. Print the
result to standard output." \> "${file%.py}.md"
done
`
```
**Windows PowerShell (`generate\_docs.ps1`)**
Terminal window
```
`
# Loop through all Python files
Get-ChildItem -Filter \*.py | ForEach-Object {
Write-Host "Generating docs for $($\_.Name)..."
$newName = $\_.Name -replace '\\.py$', '.md'
# Ask Gemini CLI to generate the documentation and print it to stdout
gemini -p "Generate a Markdown documentation summary for @$($\_.Name). Print the result to standard output." | Out-File -FilePath $newName -Encoding utf8
}
`
```
2. Make the script executable and run it in your directory:
**macOS/Linux**
Terminal window
```
`
chmod +x generate\_docs.sh
./generate\_docs.sh
`
```
**Windows (PowerShell)**
Terminal window
```
`
.\\generate\_docs.ps1
`
```
This creates a corresponding Markdown file for every Python file in the
folder.
## Extract structured JSON data
[Section titled “Extract structured JSON data”](#extract-structured-json-data)
When writing a script, you often need structured data (JSON) to pass to tools
like `jq`. To get pure JSON data from the model, combine the
`--output-format json` flag with `jq` to parse the response field.
### Scenario: Extract and return structured data
[Section titled “Scenario: Extract and return structured data”](#scenario-extract-and-return-structured-data)
1. Save the following script as `generate\_json.sh` (or `generate\_json.ps1` for
Windows):
**macOS/Linux (`generate\_json.sh`)**
```
`
#!/bin/bash
# Ensure we are in a project root
if [ ! -f "package.json" ]; then
echo "Error: package.json not found."
exit 1
fi
# Extract data
gemini --output-format json "Return a raw JSON object with keys 'version' and 'deps' from @package.json" | jq -r '.response' \> data.json
`
```
**Windows PowerShell (`generate\_json.ps1`)**
Terminal window
```
`
# Ensure we are in a project root
if (-not (Test-Path "package.json")) {
Write-Error "Error: package.json not found."
exit 1
}
# Extract data (requires jq installed, or you can use ConvertFrom-Json)
$output = gemini --output-format json "Return a raw JSON object with keys 'version' and 'deps' from @package.json" | ConvertFrom-Json
$output.response | Out-File -FilePath data.json -Encoding utf8
`
```
2. Run the script:
**macOS/Linux**
Terminal window
```
`
chmod +x generate\_json.sh
./generate\_json.sh
`
```
**Windows (PowerShell)**
Terminal window
```
`
.\\generate\_json.ps1
`
```
3. Check `data.json`. The file should look like this:
```
`
{
"version": "1.0.0",
"deps": {
"react": "^18.2.0"
}
}
`
```
## Build your own custom AI tools
[Section titled “Build your own custom AI tools”](#build-your-own-custom-ai-tools)
Use headless mode to perform custom, automated AI tasks.
### Scenario: Create a “Smart Commit” alias
[Section titled “Scenario: Create a “Smart Commit” alias”](#scenario-create-a-smart-commit-alias)
You can add a function to your shell configuration to create a `git commit`
wrapper that writes the message for you.
**macOS/Linux (Bash/Zsh)**
1. Open your `.zshrc` file (or `.bashrc` if you use Bash) in your preferred
text editor.
Terminal window
```
`
nano \~/.zshrc
`
```
**Note**: If you use VS Code, you can run `code \~/.zshrc`.
2. Scroll to the very bottom of the file and paste this code:
Terminal window
```
`
function gcommit() {
# Get the diff of staged changes
diff=$(git diff --staged)
if [ -z "$diff" ]; then
echo "No staged changes to commit."
return 1
fi
# Ask Gemini to write the message
echo "Generating commit message..."
msg=$(echo "$diff" | gemini -p "Write a concise Conventional Commit message for this diff. Output ONLY the message.")
# Commit with the generated message
git commit -m "$msg"
}
`
```
Save your file and exit.
3. Run this command to make the function available immediately:
Terminal window
```
`
source \~/.zshrc
`
```
**Windows (PowerShell)**
1. Open your PowerShell profile in your preferred text editor.
Terminal window
```
`
notepad $PROFILE
`
```
2. Scroll to the very bottom of the file and paste this code:
Terminal window
```
`
function gcommit {
# Get the diff of staged changes
$diff = git diff --staged
if (-not $diff) {
Write-Host "No staged changes to commit."
return
}
# Ask Gemini to write the message
Write-Host "Generating commit message..."
$msg = $diff | gemini -p "Write a concise Conventional Commit message for this diff. Output ONLY the message."
# Commit with the generated message
git commit -m "$msg"
}
`
```
Save your file and exit.
3. Run this command to make the function available immediately:
Terminal window
```
`
. $PROFILE
`
```
4. Use your new command:
Terminal window
```
`
gcommit
`
```
Gemini CLI will analyze your staged changes and commit them with a generated
message.
## Next steps
[Section titled “Next steps”](#next-steps)
* Explore the [Headless mode reference](/docs/cli/headless) for full JSON
schema details.
* Learn about [Shell commands](/docs/cli/tutorials/shell-commands) to let the agent run scripts
instead of just writing them.
Last updated: Mar 9, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.