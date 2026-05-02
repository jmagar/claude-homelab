Hooks Best Practices | Gemini CLI
[Skip to content](#_top)
# Hooks Best Practices
Copy as Markdown Copied!
This guide covers security considerations, performance optimization, debugging
techniques, and privacy considerations for developing and deploying hooks in
Gemini CLI.
## Performance
[Section titled “Performance”](#performance)
### Keep hooks fast
[Section titled “Keep hooks fast”](#keep-hooks-fast)
Hooks run synchronously—slow hooks delay the agent loop. Optimize for speed by
using parallel operations:
```
`
// Sequential operations are slower
const data1 = await fetch(url1).then((r) =\> r.json());
const data2 = await fetch(url2).then((r) =\> r.json());
// Prefer parallel operations for better performance
// Start requests concurrently
const p1 = fetch(url1).then((r) =\> r.json());
const p2 = fetch(url2).then((r) =\> r.json());
// Wait for all results
const [data1, data2] = await Promise.all([p1, p2]);
`
```
### Cache expensive operations
[Section titled “Cache expensive operations”](#cache-expensive-operations)
Store results between invocations to avoid repeated computation, especially for
hooks that run frequently (like `BeforeTool` or `AfterModel`).
```
`
const fs = require('fs');
const path = require('path');
const CACHE\_FILE = '.gemini/hook-cache.json';
function readCache() {
try {
return JSON.parse(fs.readFileSync(CACHE\_FILE, 'utf8'));
} catch {
return {};
}
}
function writeCache(data) {
fs.writeFileSync(CACHE\_FILE, JSON.stringify(data, null, 2));
}
async function main() {
const cache = readCache();
const cacheKey = `tool-list-${(Date.now() / 3600000) | 0}`; // Hourly cache
if (cache[cacheKey]) {
// Write JSON to stdout
console.log(JSON.stringify(cache[cacheKey]));
return;
}
// Expensive operation
const result = await computeExpensiveResult();
cache[cacheKey] = result;
writeCache(cache);
console.log(JSON.stringify(result));
}
`
```
### Use appropriate events
[Section titled “Use appropriate events”](#use-appropriate-events)
Choose hook events that match your use case to avoid unnecessary execution.
* **`AfterAgent`**: Fires **once** per turn after the model finishes its final
response. Use this for quality validation (Retries) or final logging.
* **`AfterModel`**: Fires after **every chunk** of LLM output. Use this for
real-time redaction, PII filtering, or monitoring output as it streams.
If you only need to check the final completion, use `AfterAgent` to save
performance.
### Filter with matchers
[Section titled “Filter with matchers”](#filter-with-matchers)
Use specific matchers to avoid unnecessary hook execution. Instead of matching
all tools with `\*`, specify only the tools you need. This saves the overhead of
spawning a process for irrelevant events.
```
`
{
"matcher": "write\_file|replace",
"hooks": [
{
"name": "validate-writes",
"type": "command",
"command": "./validate.sh"
}
]
}
`
```
### Optimize JSON parsing
[Section titled “Optimize JSON parsing”](#optimize-json-parsing)
For large inputs (like `AfterModel` receiving a large context), standard JSON
parsing can be slow. If you only need one field, consider streaming parsers or
lightweight extraction logic, though for most shell scripts `jq` is sufficient.
## Debugging
[Section titled “Debugging”](#debugging)
### The “Strict JSON” rule
[Section titled “The “Strict JSON” rule”](#the-strict-json-rule)
The most common cause of hook failure is “polluting” the standard output.
* **stdout** is for **JSON only**.
* **stderr** is for **logs and text**.
**Good:**
```
`
#!/bin/bash
echo "Starting check..." \>&2 # \<--- Redirect to stderr
echo '{"decision": "allow"}'
`
```
### Log to files
[Section titled “Log to files”](#log-to-files)
Since hooks run in the background, writing to a dedicated log file is often the
easiest way to debug complex logic.
```
`
#!/usr/bin/env bash
LOG\_FILE=".gemini/hooks/debug.log"
# Log with timestamp
log() {
echo "[$(date '+%Y-%m-%d %H:%M:%S')] $\*" \>\> "$LOG\_FILE"
}
input=$(cat)
log "Received input: ${input:0:100}..."
# Hook logic here
log "Hook completed successfully"
# Always output valid JSON to stdout at the end, even if just empty
echo "{}"
`
```
### Use stderr for errors
[Section titled “Use stderr for errors”](#use-stderr-for-errors)
Error messages on stderr are surfaced appropriately based on exit codes:
```
`
try {
const result = dangerousOperation();
console.log(JSON.stringify({ result }));
} catch (error) {
// Write the error description to stderr so the user/agent sees it
console.error(`Hook error: ${error.message}`);
process.exit(2); // Blocking error
}
`
```
### Test hooks independently
[Section titled “Test hooks independently”](#test-hooks-independently)
Run hook scripts manually with sample JSON input to verify they behave as
expected before hooking them up to the CLI.
**macOS/Linux**
Terminal window
```
`
# Create test input
cat \> test-input.json \<\< 'EOF'
{
"session\_id": "test-123",
"cwd": "/tmp/test",
"hook\_event\_name": "BeforeTool",
"tool\_name": "write\_file",
"tool\_input": {
"file\_path": "test.txt",
"content": "Test content"
}
}
EOF
# Test the hook
cat test-input.json | .gemini/hooks/my-hook.sh
# Check exit code
echo "Exit code: $?"
`
```
**Windows (PowerShell)**
Terminal window
```
`
# Create test input
@"
{
"session\_id": "test-123",
"cwd": "C:\\\\temp\\\\test",
"hook\_event\_name": "BeforeTool",
"tool\_name": "write\_file",
"tool\_input": {
"file\_path": "test.txt",
"content": "Test content"
}
}
"@ | Out-File -FilePath test-input.json -Encoding utf8
# Test the hook
Get-Content test-input.json | .\\.gemini\\hooks\\my-hook.ps1
# Check exit code
Write-Host "Exit code: $LASTEXITCODE"
`
```
### Check exit codes
[Section titled “Check exit codes”](#check-exit-codes)
Gemini CLI uses exit codes for high-level flow control:
* **Exit 0 (Success)**: The hook ran successfully. The CLI parses `stdout` for
JSON decisions.
* **Exit 2 (System Block)**: A critical block occurred. `stderr` is used as the
reason.
* For **Agent/Model** events, this aborts the turn.
* For **Tool** events, this blocks the tool but allows the agent to continue.
* For **AfterAgent**, this triggers an automatic retry turn.
>
**> TIP
**
>
**> Blocking vs. Stopping
**> : Use
`> decision: "deny"
`> (or Exit Code 2) to block a
**> specific action
**> . Use
`> {"continue": false}
`> in your JSON output to
**> killthe entire agent loop
**> immediately.
>
```
`
#!/usr/bin/env bash
set -e
# Hook logic
if process\_input; then
echo '{"decision": "allow"}'
exit 0
else
echo "Critical validation failure" \>&2
exit 2
fi
`
```
### Enable telemetry
[Section titled “Enable telemetry”](#enable-telemetry)
Hook execution is logged when `telemetry.logPrompts` is enabled. You can view
these logs to debug execution flow.
```
`
{
"telemetry": {
"logPrompts": true
}
}
`
```
### Use hook panel
[Section titled “Use hook panel”](#use-hook-panel)
The `/hooks panel` command inside the CLI shows execution status and recent
output:
Terminal window
```
`
/hooks panel
`
```
Check for:
* Hook execution counts
* Recent successes/failures
* Error messages
* Execution timing
## Development
[Section titled “Development”](#development)
### Start simple
[Section titled “Start simple”](#start-simple)
Begin with basic logging hooks before implementing complex logic:
```
`
#!/usr/bin/env bash
# Simple logging hook to understand input structure
input=$(cat)
echo "$input" \>\> .gemini/hook-inputs.log
# Always return valid JSON
echo "{}"
`
```
### Documenting your hooks
[Section titled “Documenting your hooks”](#documenting-your-hooks)
Maintainability is critical for complex hook systems. Use descriptions and
comments to help yourself and others understand why a hook exists.
**Use the `description` field**: This text is displayed in the `/hooks panel` UI
and helps diagnose issues.
```
`
{
"hooks": {
"BeforeTool": [
{
"matcher": "write\_file|replace",
"hooks": [
{
"name": "secret-scanner",
"type": "command",
"command": "$GEMINI\_PROJECT\_DIR/.gemini/hooks/block-secrets.sh",
"description": "Scans code changes for API keys and secrets before writing"
}
]
}
]
}
}
`
```
**Add comments in hook scripts**: Explain performance expectations and
dependencies.
```
`
#!/usr/bin/env node
/\*\*
\* RAG Tool Filter Hook
\*
\* Reduces the tool space by extracting keywords from the user's request.
\*
\* Performance: \~500ms average
\* Dependencies: @google/generative-ai
\*/
`
```
### Use JSON libraries
[Section titled “Use JSON libraries”](#use-json-libraries)
Parse JSON with proper libraries instead of text processing.
**Bad:**
Terminal window
```
`
# Fragile text parsing
tool\_name=$(echo "$input" | grep -oP '"tool\_name":\\s\*"\\K[^"]+')
`
```
**Good:**
Terminal window
```
`
# Robust JSON parsing
tool\_name=$(echo "$input" | jq -r '.tool\_name')
`
```
### Make scripts executable
[Section titled “Make scripts executable”](#make-scripts-executable)
Always make hook scripts executable on macOS/Linux:
Terminal window
```
`
chmod +x .gemini/hooks/\*.sh
chmod +x .gemini/hooks/\*.js
`
```
**Windows Note**: On Windows, PowerShell scripts (`.ps1`) don’t use `chmod`, but
you may need to ensure your execution policy allows them to run (for example,
`Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`).
### Version control
[Section titled “Version control”](#version-control)
Commit hooks to share with your team:
Terminal window
```
`
git add .gemini/hooks/
git add .gemini/settings.json
`
```
**`.gitignore` considerations:**
```
`
# Ignore hook cache and logs
.gemini/hook-cache.json
.gemini/hook-debug.log
.gemini/memory/session-\*.jsonl
# Keep hook scripts
!.gemini/hooks/\*.sh
!.gemini/hooks/\*.js
`
```
## Hook security
[Section titled “Hook security”](#hook-security)
### Threat Model
[Section titled “Threat Model”](#threat-model)
Understanding where hooks come from and what they can do is critical for secure
usage.
|Hook Source|Description|
|**System**|Configured by system administrators (for example, `/etc/gemini-cli/settings.json`, `/Library/...`). Assumed to be the **safest**.|
|**User** (`\~/.gemini/...`)|Configured by you. You are responsible for ensuring they are safe.|
|**Extensions**|You explicitly approve and install these. Security depends on the extension source (integrity).|
|**Project** (`./.gemini/...`)|**Untrusted by default.** Safest in trusted internal repos; higher risk in third-party/public repos.|
#### Project Hook Security
[Section titled “Project Hook Security”](#project-hook-security)
When you open a project with hooks defined in `.gemini/settings.json`:
1. **Detection**: Gemini CLI detects the hooks.
2. **Identification**: A unique identity is generated for each hook based on its
`name` and `command`.
3. **Warning**: If this specific hook identity has not been seen before, a
**warning** is displayed.
4. **Execution**: The hook is executed (unless specific security settings block
it).
5. **Trust**: The hook is marked as “trusted” for this project.
>
**> Modification detection
**> : If the
`> command
`> string of a project hook ischanged (for example, by a
`> git pull
`> ), its identity changes. Gemini CLI willtreat it as a
**> new, untrusted hook
**> and warn you again. This prevents> malicious actors from silently swapping a verified command for a maliciousone.
>
### Risks
[Section titled “Risks”](#risks)
|Risk|Description|
|**Arbitrary Code Execution**|Hooks run as your user. They can do anything you can do (delete files, install software).|
|**Data Exfiltration**|A hook could read your input (prompts), output (code), or environment variables (`GEMINI\_API\_KEY`) and send them to a remote server.|
|**Prompt Injection**|Malicious content in a file or web page could trick an LLM into running a tool that triggers a hook in an unexpected way.|
### Mitigation Strategies
[Section titled “Mitigation Strategies”](#mitigation-strategies)
#### Verify the source
[Section titled “Verify the source”](#verify-the-source)
**Verify the source** of any project hooks or extensions before enabling them.
* For open-source projects, a quick review of the hook scripts is recommended.
* For extensions, ensure you trust the author or publisher (for example,
verified publishers, well-known community members).
* Be cautious with obfuscated scripts or compiled binaries from unknown sources.
#### Sanitize environment
[Section titled “Sanitize environment”](#sanitize-environment)
Hooks inherit the environment of Gemini CLI process, which may include sensitive
API keys. Gemini CLI provides a
[redaction system](/docs/reference/configuration#environment-variable-redaction)
that automatically filters variables matching sensitive patterns (for example,
`KEY`, `TOKEN`).
>
**> Disabled by Default
**> : Environment redaction is currently
**> OFF bydefault
**> . We strongly recommend enabling it if you are running third-partyhooks or working in sensitive environments.
>
**Impact on hooks:**
* **Security**: Prevents your hook scripts from accidentally leaking secrets.
* **Troubleshooting**: If your hook depends on a specific environment variable
that is being blocked, you must explicitly allow it in `settings.json`.
```
`
{
"security": {
"environmentVariableRedaction": {
"enabled": true,
"allowed": ["MY\_REQUIRED\_TOOL\_KEY"]
}
}
}
`
```
**System administrators:** You can enforce redaction for all users in the system
configuration.
## Troubleshooting
[Section titled “Troubleshooting”](#troubleshooting)
### Hook not executing
[Section titled “Hook not executing”](#hook-not-executing)
**Check hook name in `/hooks panel`:** Verify the hook appears in the list and
is enabled.
**Verify matcher pattern:**
Terminal window
```
`
# Test regex pattern
echo "write\_file|replace" | grep -E "write\_.\*|replace"
`
```
**Check disabled list:** Verify the hook is not listed in your `settings.json`:
```
`
{
"hooks": {
"disabled": ["my-hook-name"]
}
}
`
```
**Ensure script is executable**: For macOS and Linux users, verify the script
has execution permissions:
Terminal window
```
`
ls -la .gemini/hooks/my-hook.sh
chmod +x .gemini/hooks/my-hook.sh
`
```
**Windows Note**: On Windows, ensure your execution policy allows running
scripts (for example, `Get-ExecutionPolicy`).
**Verify script path:** Ensure the path in `settings.json` resolves correctly.
Terminal window
```
`
# Check path expansion
echo "$GEMINI\_PROJECT\_DIR/.gemini/hooks/my-hook.sh"
# Verify file exists
test -f "$GEMINI\_PROJECT\_DIR/.gemini/hooks/my-hook.sh" && echo "File exists"
`
```
### Hook timing out
[Section titled “Hook timing out”](#hook-timing-out)
**Check configured timeout:** The default is 60000ms (1 minute). You can
increase this in `settings.json`:
```
`
{
"name": "slow-hook",
"timeout": 120000
}
`
```
**Optimize slow operations:** Move heavy processing to background tasks or use
caching.
### Invalid JSON output
[Section titled “Invalid JSON output”](#invalid-json-output)
**Validate JSON before outputting:**
```
`
#!/usr/bin/env bash
output='{"decision": "allow"}'
# Validate JSON
if echo "$output" | jq empty 2\>/dev/null; then
echo "$output"
else
echo "Invalid JSON generated" \>&2
exit 1
fi
`
```
### Environment variables not available
[Section titled “Environment variables not available”](#environment-variables-not-available)
**Check if variable is set:**
```
`
#!/usr/bin/env bash
if [ -z "$GEMINI\_PROJECT\_DIR" ]; then
echo "GEMINI\_PROJECT\_DIR not set" \>&2
exit 1
fi
`
```
**Debug available variables:**
Terminal window
```
`
env \> .gemini/hook-env.log
`
```
## Authoring secure hooks
[Section titled “Authoring secure hooks”](#authoring-secure-hooks)
When writing your own hooks, follow these practices to ensure they are robust
and secure.
### Validate all inputs
[Section titled “Validate all inputs”](#validate-all-inputs)
Never trust data from hooks without validation. Hook inputs often come from the
LLM or user prompts, which can be manipulated.
```
`
#!/usr/bin/env bash
input=$(cat)
# Validate JSON structure
if ! echo "$input" | jq empty 2\>/dev/null; then
echo "Invalid JSON input" \>&2
exit 1
fi
# Validate tool\_name explicitly
tool\_name=$(echo "$input" | jq -r '.tool\_name // empty')
if [[ "$tool\_name" != "write\_file" && "$tool\_name" != "read\_file" ]]; then
echo "Unexpected tool: $tool\_name" \>&2
exit 1
fi
`
```
### Use timeouts
[Section titled “Use timeouts”](#use-timeouts)
Prevent denial-of-service (hanging agents) by enforcing timeouts. Gemini CLI
defaults to 60 seconds, but you should set stricter limits for fast hooks.
```
`
{
"hooks": {
"BeforeTool": [
{
"matcher": "\*",
"hooks": [
{
"name": "fast-validator",
"type": "command",
"command": "./hooks/validate.sh",
"timeout": 5000 // 5 seconds
}
]
}
]
}
}
`
```
### Limit permissions
[Section titled “Limit permissions”](#limit-permissions)
Run hooks with minimal required permissions:
```
`
#!/usr/bin/env bash
# Don't run as root
if [ "$EUID" -eq 0 ]; then
echo "Hook should not run as root" \>&2
exit 1
fi
# Check file permissions before writing
if [ -w "$file\_path" ]; then
# Safe to write
else
echo "Insufficient permissions" \>&2
exit 1
fi
`
```
### Example: Secret Scanner
[Section titled “Example: Secret Scanner”](#example-secret-scanner)
Use `BeforeTool` hooks to prevent committing sensitive data. This is a powerful
pattern for enhancing security in your workflow.
```
`
const SECRET\_PATTERNS = [
/api[\_-]?key\\s\*[:=]\\s\*['"]?[a-zA-Z0-9\_-]{20,}['"]?/i,
/password\\s\*[:=]\\s\*['"]?[^\\s'"]{8,}['"]?/i,
/secret\\s\*[:=]\\s\*['"]?[a-zA-Z0-9\_-]{20,}['"]?/i,
/AKIA[0-9A-Z]{16}/, // AWS access key
/ghp\_[a-zA-Z0-9]{36}/, // GitHub personal access token
/sk-[a-zA-Z0-9]{48}/, // OpenAI API key
];
function containsSecret(content) {
return SECRET\_PATTERNS.some((pattern) =\> pattern.test(content));
}
`
```
## Privacy considerations
[Section titled “Privacy considerations”](#privacy-considerations)
Hook inputs and outputs may contain sensitive information.
### What data is collected
[Section titled “What data is collected”](#what-data-is-collected)
Hook telemetry may include inputs (prompts, code) and outputs (decisions,
reasons) unless disabled.
### Privacy settings
[Section titled “Privacy settings”](#privacy-settings)
**Disable PII logging:** If you are working with sensitive data, disable prompt
logging in your settings:
```
`
{
"telemetry": {
"logPrompts": false
}
}
`
```
**Suppress Output:** Individual hooks can request their metadata be hidden from
logs and telemetry by returning `"suppressOutput": true` in their JSON response.
>
**> Note
**
>
>
`> suppressOutput
`> only affects background logging. Any
`> systemMessage
`> or
`> reason
`> included in the JSON will still be displayed to the user in theterminal.
>
### Sensitive data in hooks
[Section titled “Sensitive data in hooks”](#sensitive-data-in-hooks)
If your hooks process sensitive data:
1. **Minimize logging:** Don’t write sensitive data to log files.
2. **Sanitize outputs:** Remove sensitive data before outputting JSON or writing
to stderr.
Last updated: Apr 10, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.