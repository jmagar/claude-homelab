Writing hooks for Gemini CLI | Gemini CLI
[Skip to content](#_top)
# Writing hooks for Gemini CLI
Copy as Markdown Copied!
This guide will walk you through creating hooks for Gemini CLI, from a simple
logging hook to a comprehensive workflow assistant.
## Prerequisites
[Section titled “Prerequisites”](#prerequisites)
Before you start, make sure you have:
* Gemini CLI installed and configured
* Basic understanding of shell scripting or JavaScript/Node.js
* Familiarity with JSON for hook input/output
## Quick start
[Section titled “Quick start”](#quick-start)
Let’s create a simple hook that logs all tool executions to understand the
basics.
**Crucial Rule:** Always write logs to `stderr`. Write only the final JSON to
`stdout`.
### Step 1: Create your hook script
[Section titled “Step 1: Create your hook script”](#step-1-create-your-hook-script)
Create a directory for hooks and a simple logging script.
>
**> Note
**> :
>
> This example uses
`> jq
`> to parse JSON. If you don’t have it installed, you canperform similar logic using Node.js or Python.
>
**macOS/Linux**
```
`
mkdir -p .gemini/hooks
cat \> .gemini/hooks/log-tools.sh \<\< 'EOF'
#!/usr/bin/env bash
# Read hook input from stdin
input=$(cat)
# Extract tool name (requires jq)
tool\_name=$(echo "$input" | jq -r '.tool\_name')
# Log to stderr (visible in terminal if hook fails, or captured in logs)
echo "Logging tool: $tool\_name" \>&2
# Log to file
echo "[$(date)] Tool executed: $tool\_name" \>\> .gemini/tool-log.txt
# Return success (exit 0) with empty JSON
echo "{}"
exit 0
EOF
chmod +x .gemini/hooks/log-tools.sh
`
```
**Windows (PowerShell)**
Terminal window
```
`
New-Item -ItemType Directory -Force -Path ".gemini\\hooks"
@"
# Read hook input from stdin
`$inputJson = `$input | Out-String | ConvertFrom-Json
# Extract tool name
`$toolName = `$inputJson.tool\_name
# Log to stderr (visible in terminal if hook fails, or captured in logs)
[Console]::Error.WriteLine("Logging tool: `$toolName")
# Log to file
"[`$(Get-Date -Format 'o')] Tool executed: `$toolName" | Out-File -FilePath ".gemini\\tool-log.txt" -Append -Encoding utf8
# Return success with empty JSON
"{}"
"@ | Out-File -FilePath ".gemini\\hooks\\log-tools.ps1" -Encoding utf8
`
```
## Exit Code Strategies
[Section titled “Exit Code Strategies”](#exit-code-strategies)
There are two ways to control or block an action in Gemini CLI:
|Strategy|Exit Code|Implementation|Best For|
|**Structured (Idiomatic)**|`0`|Return a JSON object like `{"decision": "deny", "reason": "..."}`.|Production hooks, custom user feedback, and complex logic.|
|**Emergency Brake**|`2`|Print the error message to `stderr` and exit.|Simple security gates, script errors, or rapid prototyping.|
## Practical examples
[Section titled “Practical examples”](#practical-examples)
### Security: Block secrets in commits
[Section titled “Security: Block secrets in commits”](#security-block-secrets-in-commits)
Prevent committing files containing API keys or passwords. Note that we use
**Exit Code 0** to provide a structured denial message to the agent.
**`.gemini/hooks/block-secrets.sh`:**
```
`
#!/usr/bin/env bash
input=$(cat)
# Extract content being written
content=$(echo "$input" | jq -r '.tool\_input.content // .tool\_input.new\_string // ""')
# Check for secrets
if echo "$content" | grep -qE 'api[\_-]?key|password|secret'; then
# Log to stderr
echo "Blocked potential secret" \>&2
# Return structured denial to stdout
cat \<\<EOF
{
"decision": "deny",
"reason": "Security Policy: Potential secret detected in content.",
"systemMessage": "🔒 Security scanner blocked operation"
}
EOF
exit 0
fi
# Allow
echo '{"decision": "allow"}'
exit 0
`
```
### Dynamic context injection (Git History)
[Section titled “Dynamic context injection (Git History)”](#dynamic-context-injection-git-history)
Add relevant project context before each agent interaction.
**`.gemini/hooks/inject-context.sh`:**
```
`
#!/usr/bin/env bash
# Get recent git commits for context
context=$(git log -5 --oneline 2\>/dev/null || echo "No git history")
# Return as JSON
cat \<\<EOF
{
"hookSpecificOutput": {
"hookEventName": "BeforeAgent",
"additionalContext": "Recent commits:\\n$context"
}
}
EOF
`
```
### RAG-based Tool Filtering (BeforeToolSelection)
[Section titled “RAG-based Tool Filtering (BeforeToolSelection)”](#rag-based-tool-filtering-beforetoolselection)
Use `BeforeToolSelection` to intelligently reduce the tool space. This example
uses a Node.js script to check the user’s prompt and allow only relevant tools.
**`.gemini/hooks/filter-tools.js`:**
```
`
#!/usr/bin/env node
const fs = require('fs');
async function main() {
const input = JSON.parse(fs.readFileSync(0, 'utf-8'));
const { llm\_request } = input;
// Decoupled API: Access messages from llm\_request
const messages = llm\_request.messages || [];
const lastUserMessage = messages
.slice()
.reverse()
.find((m) =\> m.role === 'user');
if (!lastUserMessage) {
console.log(JSON.stringify({})); // Do nothing
return;
}
const text = lastUserMessage.content;
const allowed = ['write\_todos']; // Always allow memory
// Simple keyword matching
if (text.includes('read') || text.includes('check')) {
allowed.push('read\_file', 'list\_directory');
}
if (text.includes('test')) {
allowed.push('run\_shell\_command');
}
// If we found specific intent, filter tools. Otherwise allow all.
if (allowed.length \> 1) {
console.log(
JSON.stringify({
hookSpecificOutput: {
hookEventName: 'BeforeToolSelection',
toolConfig: {
mode: 'ANY', // Force usage of one of these tools (or AUTO)
allowedFunctionNames: allowed,
},
},
}),
);
} else {
console.log(JSON.stringify({}));
}
}
main().catch((err) =\> {
console.error(err);
process.exit(1);
});
`
```
**`.gemini/settings.json`:**
```
`
{
"hooks": {
"BeforeToolSelection": [
{
"matcher": "\*",
"hooks": [
{
"name": "intent-filter",
"type": "command",
"command": "node .gemini/hooks/filter-tools.js"
}
]
}
]
}
}
`
```
>
**> TIP
**
>
**> Union Aggregation Strategy
**> :
`> BeforeToolSelection
`> is unique in that it> combines the results of all matching hooks. If you have multiple filteringhooks, the agent will receive the
**> union
**> of all whitelisted tools. Onlyusing
`> mode: "NONE"
`> will override other hooks to disable all tools.
>
## Complete example: Smart Development Workflow Assistant
[Section titled “Complete example: Smart Development Workflow Assistant”](#complete-example-smart-development-workflow-assistant)
This comprehensive example demonstrates all hook events working together. We
will build a system that maintains memory, filters tools, and checks for
security.
### Architecture
[Section titled “Architecture”](#architecture)
1. **SessionStart**: Load project memories.
2. **BeforeAgent**: Inject memories into context.
3. **BeforeToolSelection**: Filter tools based on intent.
4. **BeforeTool**: Scan for secrets.
5. **AfterModel**: Record interactions.
6. **AfterAgent**: Validate final response quality (Retry).
7. **SessionEnd**: Consolidate memories.
### Configuration (`.gemini/settings.json`)
[Section titled “Configuration (.gemini/settings.json)”](#configuration-geminisettingsjson)
```
`
{
"hooks": {
"SessionStart": [
{
"matcher": "startup",
"hooks": [
{
"name": "init",
"type": "command",
"command": "node .gemini/hooks/init.js"
}
]
}
],
"BeforeAgent": [
{
"matcher": "\*",
"hooks": [
{
"name": "memory",
"type": "command",
"command": "node .gemini/hooks/inject-memories.js"
}
]
}
],
"BeforeToolSelection": [
{
"matcher": "\*",
"hooks": [
{
"name": "filter",
"type": "command",
"command": "node .gemini/hooks/rag-filter.js"
}
]
}
],
"BeforeTool": [
{
"matcher": "write\_file",
"hooks": [
{
"name": "security",
"type": "command",
"command": "node .gemini/hooks/security.js"
}
]
}
],
"AfterModel": [
{
"matcher": "\*",
"hooks": [
{
"name": "record",
"type": "command",
"command": "node .gemini/hooks/record.js"
}
]
}
],
"AfterAgent": [
{
"matcher": "\*",
"hooks": [
{
"name": "validate",
"type": "command",
"command": "node .gemini/hooks/validate.js"
}
]
}
],
"SessionEnd": [
{
"matcher": "exit",
"hooks": [
{
"name": "save",
"type": "command",
"command": "node .gemini/hooks/consolidate.js"
}
]
}
]
}
}
`
```
### Hook Scripts
[Section titled “Hook Scripts”](#hook-scripts)
>
**> Note
**> : For brevity, these scripts use
`> console.error
`> for logging andstandard
`> console.log
`> for JSON output.
>
#### 1. Initialize (`init.js`)
[Section titled “1. Initialize (init.js)”](#1-initialize-initjs)
```
`
#!/usr/bin/env node
// Initialize DB or resources
console.error('Initializing assistant...');
// Output to user
console.log(
JSON.stringify({
systemMessage: '🧠 Smart Assistant Loaded',
}),
);
`
```
#### 2. Inject Memories (`inject-memories.js`)
[Section titled “2. Inject Memories (inject-memories.js)”](#2-inject-memories-inject-memoriesjs)
```
`
#!/usr/bin/env node
const fs = require('fs');
async function main() {
const input = JSON.parse(fs.readFileSync(0, 'utf-8'));
// Assume we fetch memories from a DB here
const memories = '- [Memory] Always use TypeScript for this project.';
console.log(
JSON.stringify({
hookSpecificOutput: {
hookEventName: 'BeforeAgent',
additionalContext: `\\n## Relevant Memories\\n${memories}`,
},
}),
);
}
main();
`
```
#### 3. Security Check (`security.js`)
[Section titled “3. Security Check (security.js)”](#3-security-check-securityjs)
```
`
#!/usr/bin/env node
const fs = require('fs');
const input = JSON.parse(fs.readFileSync(0));
const content = input.tool\_input.content || '';
if (content.includes('SECRET\_KEY')) {
console.log(
JSON.stringify({
decision: 'deny',
reason: 'Found SECRET\_KEY in content',
systemMessage: '🚨 Blocked sensitive commit',
}),
);
process.exit(0);
}
console.log(JSON.stringify({ decision: 'allow' }));
`
```
#### 4. Record Interaction (`record.js`)
[Section titled “4. Record Interaction (record.js)”](#4-record-interaction-recordjs)
```
`
#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const input = JSON.parse(fs.readFileSync(0));
const { llm\_request, llm\_response } = input;
const logFile = path.join(
process.env.GEMINI\_PROJECT\_DIR,
'.gemini/memory/session.jsonl',
);
fs.appendFileSync(
logFile,
JSON.stringify({
request: llm\_request,
response: llm\_response,
timestamp: new Date().toISOString(),
}) + '\\n',
);
console.log(JSON.stringify({}));
`
```
#### 5. Validate Response (`validate.js`)
[Section titled “5. Validate Response (validate.js)”](#5-validate-response-validatejs)
```
`
#!/usr/bin/env node
const fs = require('fs');
const input = JSON.parse(fs.readFileSync(0));
const response = input.prompt\_response;
// Example: Check if the agent forgot to include a summary
if (!response.includes('Summary:')) {
console.log(
JSON.stringify({
decision: 'block', // Triggers an automatic retry turn
reason: 'Your response is missing a Summary section. Please add one.',
systemMessage: '🔄 Requesting missing summary...',
}),
);
process.exit(0);
}
console.log(JSON.stringify({ decision: 'allow' }));
`
```
#### 6. Consolidate Memories (`consolidate.js`)
[Section titled “6. Consolidate Memories (consolidate.js)”](#6-consolidate-memories-consolidatejs)
```
`
#!/usr/bin/env node
// Logic to save final session state
console.error('Consolidating memories for session end...');
`
```
## Packaging as an extension
[Section titled “Packaging as an extension”](#packaging-as-an-extension)
While project-level hooks are great for specific repositories, you can share
your hooks across multiple projects by packaging them as a
[Gemini CLI extension](/docs/extensions). This provides version control,
easy distribution, and centralized management.
Last updated: Mar 20, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.