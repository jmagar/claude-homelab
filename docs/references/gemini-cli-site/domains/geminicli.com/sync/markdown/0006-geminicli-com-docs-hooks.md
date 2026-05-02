Gemini CLI hooks | Gemini CLI
[Skip to content](#_top)
# Gemini CLI hooks
Copy as Markdown Copied!
Hooks are scripts or programs that Gemini CLI executes at specific points in the
agentic loop, allowing you to intercept and customize behavior without modifying
the CLI’s source code.
## What are hooks?
[Section titled “What are hooks?”](#what-are-hooks)
Hooks run synchronously as part of the agent loop—when a hook event fires,
Gemini CLI waits for all matching hooks to complete before continuing.
With hooks, you can:
* **Add context:** Inject relevant information (like git history) before the
model processes a request.
* **Validate actions:** Review tool arguments and block potentially dangerous
operations.
* **Enforce policies:** Implement security scanners and compliance checks.
* **Log interactions:** Track tool usage and model responses for auditing.
* **Optimize behavior:** Dynamically filter available tools or adjust model
parameters.
### Getting started
[Section titled “Getting started”](#getting-started)
* **[Writing hooks guide](/docs/hooks/writing-hooks)**: A tutorial on creating
your first hook with comprehensive examples.
* **[Best practices](/docs/hooks/best-practices)**: Guidelines on security,
performance, and debugging.
* **[Hooks reference](/docs/hooks/reference)**: The definitive technical
specification of I/O schemas and exit codes.
## Core concepts
[Section titled “Core concepts”](#core-concepts)
### Hook events
[Section titled “Hook events”](#hook-events)
Hooks are triggered by specific events in Gemini CLI’s lifecycle.
|Event|When It Fires|Impact|Common Use Cases|
|`SessionStart`|When a session begins (startup, resume, clear)|Inject Context|Initialize resources, load context|
|`SessionEnd`|When a session ends (exit, clear)|Advisory|Clean up, save state|
|`BeforeAgent`|After user submits prompt, before planning|Block Turn / Context|Add context, validate prompts, block turns|
|`AfterAgent`|When agent loop ends|Retry / Halt|Review output, force retry or halt execution|
|`BeforeModel`|Before sending request to LLM|Block Turn / Mock|Modify prompts, swap models, mock responses|
|`AfterModel`|After receiving LLM response|Block Turn / Redact|Filter/redact responses, log interactions|
|`BeforeToolSelection`|Before LLM selects tools|Filter Tools|Filter available tools, optimize selection|
|`BeforeTool`|Before a tool executes|Block Tool / Rewrite|Validate arguments, block dangerous ops|
|`AfterTool`|After a tool executes|Block Result / Context|Process results, run tests, hide results|
|`PreCompress`|Before context compression|Advisory|Save state, notify user|
|`Notification`|When a system notification occurs|Advisory|Forward to desktop alerts, logging|
### Global mechanics
[Section titled “Global mechanics”](#global-mechanics)
Understanding these core principles is essential for building robust hooks.
#### Strict JSON requirements (The “Golden Rule”)
[Section titled “Strict JSON requirements (The “Golden Rule”)”](#strict-json-requirements-the-golden-rule)
Hooks communicate via `stdin` (Input) and `stdout` (Output).
1. **Silence is Mandatory**: Your script **must not** print any plain text to
`stdout` other than the final JSON object. **Even a single `echo` or `print`
call before the JSON will break parsing.**
2. **Pollution = Failure**: If `stdout` contains non-JSON text, parsing will
fail. The CLI will default to “Allow” and treat the entire output as a
`systemMessage`.
3. **Debug via Stderr**: Use `stderr` for **all** logging and debugging (for
example, `echo "debug" \>&2`). Gemini CLI captures `stderr` but never attempts
to parse it as JSON.
#### Exit codes
[Section titled “Exit codes”](#exit-codes)
Gemini CLI uses exit codes to determine the high-level outcome of a hook
execution:
|Exit Code|Label|Behavioral Impact|
|**0**|**Success**|The `stdout` is parsed as JSON. **Preferred code** for all logic, including intentional blocks (for example, `{"decision": "deny"}`).|
|**2**|**System Block**|**Critical Block**. The target action (tool, turn, or stop) is aborted. `stderr` is used as the rejection reason. High severity; used for security stops or script failures.|
|**Other**|**Warning**|Non-fatal failure. A warning is shown, but the interaction proceeds using original parameters.|
#### Matchers
[Section titled “Matchers”](#matchers)
You can filter which specific tools or triggers fire your hook using the
`matcher` field.
* **Tool events** (`BeforeTool`, `AfterTool`): Matchers are **Regular
Expressions**. (for example, `"write\_.\*"`).
* **Lifecycle events**: Matchers are **Exact Strings**. (for example,
`"startup"`).
* **Wildcards**: `"\*"` or `""` (empty string) matches all occurrences.
## Configuration
[Section titled “Configuration”](#configuration)
Hooks are configured in `settings.json`. Gemini CLI merges configurations from
multiple layers in the following order of precedence (highest to lowest):
1. **Project settings**: `.gemini/settings.json` in the current directory.
2. **User settings**: `\~/.gemini/settings.json`.
3. **System settings**: `/etc/gemini-cli/settings.json`.
4. **Extensions**: Hooks defined by installed extensions.
### Configuration schema
[Section titled “Configuration schema”](#configuration-schema)
```
`
{
"hooks": {
"BeforeTool": [
{
"matcher": "write\_file|replace",
"hooks": [
{
"name": "security-check",
"type": "command",
"command": "$GEMINI\_PROJECT\_DIR/.gemini/hooks/security.sh",
"timeout": 5000
}
]
}
]
}
}
`
```
#### Hook configuration fields
[Section titled “Hook configuration fields”](#hook-configuration-fields)
|Field|Type|Required|Description|
|`type`|string|**Yes**|The execution engine. Currently only `"command"` is supported.|
|`command`|string|**Yes\***|The shell command to execute. (Required when `type` is `"command"`).|
|`name`|string|No|A friendly name for identifying the hook in logs and CLI commands.|
|`timeout`|number|No|Execution timeout in milliseconds (default: 60000).|
|`description`|string|No|A brief explanation of the hook’s purpose.|
### Environment variables
[Section titled “Environment variables”](#environment-variables)
Hooks are executed with a sanitized environment.
* `GEMINI\_PROJECT\_DIR`: The absolute path to the project root.
* `GEMINI\_PLANS\_DIR`: The absolute path to the plans directory.
* `GEMINI\_SESSION\_ID`: The unique ID for the current session.
* `GEMINI\_CWD`: The current working directory.
* `CLAUDE\_PROJECT\_DIR`: (Alias) Provided for compatibility.
## Security and risks
[Section titled “Security and risks”](#security-and-risks)
Hooks execute arbitrary code with your user privileges. By
configuring hooks, you are allowing scripts to run shell commands on your
machine.
**Project-level hooks** are particularly risky when opening untrusted projects.
Gemini CLI **fingerprints** project hooks. If a hook’s name or command changes
(for example, via `git pull`), it is treated as a **new, untrusted hook** and
you will be warned before it executes.
See [Security Considerations](/docs/hooks/best-practices#using-hooks-securely)
for a detailed threat model.
## Managing hooks
[Section titled “Managing hooks”](#managing-hooks)
Use the CLI commands to manage hooks without editing JSON manually:
* **View hooks:** `/hooks panel`
* **Enable/Disable all:** `/hooks enable-all` or `/hooks disable-all`
* **Toggle individual:** `/hooks enable \<name\>` or `/hooks disable \<name\>`
Last updated: Apr 13, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.