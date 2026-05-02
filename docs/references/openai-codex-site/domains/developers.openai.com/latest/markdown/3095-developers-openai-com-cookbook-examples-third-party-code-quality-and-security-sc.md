Reasoning over Code Quality and Security in GitHub Pull Requests
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ Home ](/cookbook)
### Topics
* [ Agents ](/cookbook/topic/agents)
* [ Evals ](/cookbook/topic/evals)
* [ Multimodal ](/cookbook/topic/multimodal)
* [ Text ](/cookbook/topic/text)
* [ Guardrails ](/cookbook/topic/guardrails)
* [ Optimization ](/cookbook/topic/optimization)
* [ ChatGPT ](/cookbook/topic/chatgpt)
* [ Codex ](/cookbook/topic/codex)
* [ gpt-oss ](/cookbook/topic/gpt-oss)
### Contribute
* [ Cookbook on GitHub ](https://github.com/openai/openai-cookbook)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Copy Page
Dec 24, 2024
# Reasoning over Code Quality and Security in GitHub Pull Requests
[ KA ](https://github.com/alwell-kevin)
[ Kevin Alwell
(OpenAI)
](https://github.com/alwell-kevin)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/third_party/Code_quality_and_security_scan_with_GitHub_Actions.md) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/third_party/Code_quality_and_security_scan_with_GitHub_Actions.md)
## Introduction
This guide explains how to integrate OpenAI reasoning models into your GitHub Pull Request (PR) workflow to automatically review code for quality, security, and enterprise standards compliance. By leveraging AI-driven insights early in the development process, you can catch issues sooner, reduce manual effort, and maintain consistent best practices across your codebase.
## Why Integrate OpenAI Reasoning Models in PRs?
• Save time during code reviews by automatically detecting code smells, security vulnerabilities, and style inconsistencies.
• Enforce coding standards organization-wide for consistent, reliable code.
• Provide developers with prompt, AI-guided feedback on potential improvements.
## Example Use Cases
• A reviewer wants feedback on the security of a new code change before merging.
• A team seeks to enforce standard coding guidelines, ensuring consistent code quality across the organization.
## Prerequisites
### 1. Generate an OpenAI “Project Key”
1. Go to platform.openai.com/api-keys and click to create a new secret key.
2. Securely store the token in your GitHub repository secrets as OPENAI\_API\_KEY.
### 2. Choose Your OpenAI Model
Use [OpenAI Reasoning Models](https://platform.openai.com/docs/guides/reasoning) for in-depth analysis of code changes. Begin with the most advanced model and refine your prompt as needed.
### 3. Select a Pull Request
1. Confirm GitHub Actions is enabled for your repository.
2. Ensure you have permissions to configure repository secrets or variables (e.g., for your PROMPT, MODELNAME, and BEST\_PRACTICES variables).
### 4. Define Enterprise Coding Standards
Store your standards as a repository variable (BEST\_PRACTICES). These may include:
• Code style & formatting
• Readability & maintainability
• Security & compliance
• Error handling & logging
• Performance & scalability
• Testing & QA
• Documentation & version control
• Accessibility & internationalization
### 5. Define Prompt Content
Construct a meta-prompt to guide OpenAI toward security, quality, and best-practice checks. Include:
1. Code Quality & Standards
2. Security & Vulnerability Analysis
3. Fault Tolerance & Error Handling
4. Performance & Resource Management
5. Step-by-Step Validation
Encourage OpenAI to provide a thorough, line-by-line review with explicit recommendations.
## Create Your GitHub Actions Workflow
This GitHub Actions workflow is triggered on every pull request against the main branch and comprises two jobs. The first job gathers a diff of all changed files—excluding .json and .png files—and sends these changes to OpenAI for analysis. Any suggested fixes from OpenAI are included in a comment on the PR. The second job evaluates the PR against your defined enterprise standards and returns a markdown table that summarizes the code’s adherence to those standards. You can easily adjust or refine the workflow by updating variables such as the prompt, model name, and best practices.
```
`name: PR Quality and Security Check
on:
pull\_request:
branches: [main]
permissions:
contents: read
pull-requests: write
jobs:
quality-security-analysis:
runs-on: ubuntu-latest
steps:
- name: Check out code
uses: actions/checkout@v3
with:
fetch-depth: 0 # Ensure full history for proper diff
- name: Gather Full Code From Changed Files
run: |
CHANGED\_FILES=$(git diff --name-only origin/main...HEAD)
echo '{"original files": [' \> original\_files\_temp.json
for file in $CHANGED\_FILES; do
if [[ $file == \*.json ]] || [[ $file == \*.png ]]; then
continue
fi
if [ -f "$file" ]; then
CONTENT=$(jq -Rs . \< "$file")
echo "{\\"filename\\": \\"$file\\", \\"content\\": $CONTENT}," \>\> original\_files\_temp.json
fi
done
sed -i '$ s/,$//' original\_files\_temp.json
echo "]}" \>\> original\_files\_temp.json
- name: Display Processed Diff (Debug)
run: cat original\_files\_temp.json
- name: Get Diff
run: |
git diff origin/main...HEAD \\
| grep '^[+-]' \\
| grep -Ev '^(---|\\+\\+\\+)' \> code\_changes\_only.txt
jq -Rs '{diff: .}' code\_changes\_only.txt \> diff.json
if [ -f original\_files\_temp.json ]; then
jq -s '.[0] \* .[1]' diff.json original\_files\_temp.json \> combined.json
mv combined.json diff.json
- name: Display Processed Diff (Debug)
run: cat diff.json
- name: Analyze with OpenAI
env:
OPENAI\_API\_KEY: ${{ secrets.OPENAI\_API\_KEY }}
run: |
DIFF\_CONTENT=$(jq -r '.diff' diff.json)
ORIGINAL\_FILES=$(jq -r '."original files"' diff.json)
PROMPT="Please review the following code changes for any obvious quality or security issues. Provide a brief report in markdown format:\\n\\nDIFF:\\n${DIFF\_CONTENT}\\n\\nORIGINAL FILES:\\n${ORIGINAL\_FILES}"
jq -n --arg prompt "$PROMPT" '{
"model": "gpt-4",
"messages": [
{ "role": "system", "content": "You are a code reviewer." },
{ "role": "user", "content": $prompt }
]
}' \> request.json
curl -sS https://api.openai.com/v1/chat/completions \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer ${OPENAI\_API\_KEY}" \\
-d @request.json \> response.json
- name: Extract Review Message
id: extract\_message
run: |
ASSISTANT\_MSG=$(jq -r '.choices[0].message.content' response.json)
{
echo "message\<\<EOF"
echo "$ASSISTANT\_MSG"
echo "EOF"
} \>\> $GITHUB\_OUTPUT
- name: Post Comment to PR
env:
COMMENT: ${{ steps.extract\_message.outputs.message }}
GH\_TOKEN: ${{ github.token }}
run: |
gh api \\
repos/${{ github.repository }}/issues/${{ github.event.pull\_request.number }}/comments \\
-f body="$COMMENT"
enterprise-standard-check:
runs-on: ubuntu-latest
needs: [quality-security-analysis]
steps:
- name: Checkout code
uses: actions/checkout@v3
with:
fetch-depth: 0 # ensures we get both PR base and head
- name: Gather Full Code From Changed Files
run: |
# Identify changed files from the base (origin/main) to the pull request HEAD
CHANGED\_FILES=$(git diff --name-only origin/main...HEAD)
# Build a JSON array containing filenames and their content
echo '{"original files": [' \> original\_files\_temp.json
for file in $CHANGED\_FILES; do
# Skip .json and .txt files
if [[ $file == \*.json ]] || [[ $file == \*.txt ]]; then
continue
fi
# If the file still exists (i.e., wasn't deleted)
if [ -f "$file" ]; then
CONTENT=$(jq -Rs . \< "$file")
echo "{\\"filename\\": \\"$file\\", \\"content\\": $CONTENT}," \>\> original\_files\_temp.json
fi
done
# Remove trailing comma on the last file entry and close JSON
sed -i '$ s/,$//' original\_files\_temp.json
echo "]}" \>\> original\_files\_temp.json
- name: Analyze Code Against Best Practices
id: validate
env:
OPENAI\_API\_KEY: ${{ secrets.OPENAI\_API\_KEY }}
run: |
set -e
# Read captured code
ORIGINAL\_FILES=$(cat original\_files\_temp.json)
# Construct the prompt:
# - Summarize each best-practice category
# - Provide a rating for each category: 'extraordinary', 'acceptable', or 'poor'
# - Return a Markdown table titled 'Enterprise Standards'
PROMPT="You are an Enterprise Code Assistant. Review each code snippet below for its adherence to the following categories:
1) Code Style & Formatting
2) Security & Compliance
3) Error Handling & Logging
4) Readability & Maintainability
5) Performance & Scalability
6) Testing & Quality Assurance
7) Documentation & Version Control
8) Accessibility & Internationalization
Using \\${{ vars.BEST\_PRACTICES }} as a reference, assign a rating of 'extraordinary', 'acceptable', or 'poor' for each category. Return a markdown table titled 'Enterprise Standards' with rows for each category and columns for 'Category' and 'Rating'.
Here are the changed file contents to analyze:
$ORIGINAL\_FILES"
# Create JSON request for OpenAI
jq -n --arg system\_content "You are an Enterprise Code Assistant ensuring the code follows best practices." \\
--arg user\_content "$PROMPT" \\
'{
"model": "${{ vars.MODELNAME }}",
"messages": [
{
"role": "system",
"content": $system\_content
},
{
"role": "user",
"content": $user\_content
}
]
}' \> request.json
# Make the API call
curl -sS https://api.openai.com/v1/chat/completions \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d @request.json \> response.json
# Extract the model's message
ASSISTANT\_MSG=$(jq -r '.choices[0].message.content' response.json)
# Store for next step
{
echo "review\<\<EOF"
echo "$ASSISTANT\_MSG"
echo "EOF"
} \>\> $GITHUB\_OUTPUT
- name: Post Table Comment
env:
COMMENT: ${{ steps.validate.outputs.review }}
GH\_TOKEN: ${{ github.token }}
run: |
# If COMMENT is empty or null, skip posting
if [ -z "$COMMENT" ] || [ "$COMMENT" = "null" ]; then
echo "No comment to post."
exit 0
fi
gh api \\
repos/${{ github.repository }}/issues/${{ github.event.pull\_request.number }}/comments \\
-f body="$COMMENT"`
```
## Test the Workflow
Commit this workflow to your repository, then open a new PR. The workflow will run automatically, posting AI-generated feedback as a PR comment.
*For a public example, see the OpenAI-Forum repository’s workflow: [pr\_quality\_and\_security\_check.yml](https://github.com/alwell-kevin/OpenAI-Forum/blob/main/.github/workflows/pr_quality_and_security_check.yml).*