System Prompt Override (GEMINI\_SYSTEM\_MD) | Gemini CLI
[Skip to content](#_top)
# System Prompt Override (GEMINI\_SYSTEM\_MD)
Copy as Markdown Copied!
The core system instructions that guide Gemini CLI can be completely replaced
with your own Markdown file. This feature is controlled via the
`GEMINI\_SYSTEM\_MD` environment variable.
## Overview
[Section titled “Overview”](#overview)
The `GEMINI\_SYSTEM\_MD` variable instructs the CLI to use an external Markdown
file for its system prompt, completely overriding the built-in default. This is
a full replacement, not a merge. If you use a custom file, none of the original
core instructions will apply unless you include them yourself.
This feature is intended for advanced users who need to enforce strict,
project-specific behavior or create a customized persona.
You can export the current default system prompt to a file first, review
it, and then selectively modify or replace it (see
[“Export the default prompt”](#export-the-default-prompt-recommended)).
## How to enable
[Section titled “How to enable”](#how-to-enable)
You can set the environment variable temporarily in your shell, or persist it
via a `.gemini/.env` file. See
[Persisting Environment Variables](/docs/get-started/authentication#persisting-environment-variables).
* Use the project default path (`.gemini/system.md`):
* `GEMINI\_SYSTEM\_MD=true` or `GEMINI\_SYSTEM\_MD=1`
* The CLI reads `./.gemini/system.md` (relative to your current project
directory).
* Use a custom file path:
* `GEMINI\_SYSTEM\_MD=/absolute/path/to/my-system.md`
* Relative paths are supported and resolved from the current working
directory.
* Tilde expansion is supported (for example, `\~/my-system.md`).
* Disable the override (use built‑in prompt):
* `GEMINI\_SYSTEM\_MD=false` or `GEMINI\_SYSTEM\_MD=0` or unset the variable.
If the override is enabled but the target file does not exist, the CLI will
error with: `missing system prompt file '\<path\>'`.
## Quick examples
[Section titled “Quick examples”](#quick-examples)
* One‑off session using a project file:
* `GEMINI\_SYSTEM\_MD=1 gemini`
* Persist for a project using `.gemini/.env`:
* Create `.gemini/system.md`, then add to `.gemini/.env`:
* `GEMINI\_SYSTEM\_MD=1`
* Use a custom file under your home directory:
* `GEMINI\_SYSTEM\_MD=\~/prompts/system.md gemini`
## UI indicator
[Section titled “UI indicator”](#ui-indicator)
When `GEMINI\_SYSTEM\_MD` is active, the CLI shows a `|⌐■\_■|` indicator in the UI
to signal custom system‑prompt mode.
## Variable Substitution
[Section titled “Variable Substitution”](#variable-substitution)
When using a custom system prompt file, you can use the following variables to
dynamically include built-in content:
* `${AgentSkills}`: Injects a complete section (including header) of all
available agent skills.
* `${SubAgents}`: Injects a complete section (including header) of available
sub-agents.
* `${AvailableTools}`: Injects a bulleted list of all currently enabled tool
names.
* Tool Name Variables: Injects the actual name of a tool using the pattern:
`${toolName}\_ToolName` (for example, `${write\_file\_ToolName}`,
`${run\_shell\_command\_ToolName}`).
This pattern is generated dynamically for all available tools.
### Example
[Section titled “Example”](#example)
```
`
# Custom System Prompt
You are a helpful assistant. ${AgentSkills}
${SubAgents}
## Tooling
The following tools are available to you: ${AvailableTools}
You can use ${write\_file\_ToolName} to save logs.
`
```
## Export the default prompt (recommended)
[Section titled “Export the default prompt (recommended)”](#export-the-default-prompt-recommended)
Before overriding, export the current default prompt so you can review required
safety and workflow rules.
* Write the built‑in prompt to the project default path:
* `GEMINI\_WRITE\_SYSTEM\_MD=1 gemini`
* Or write to a custom path:
* `GEMINI\_WRITE\_SYSTEM\_MD=\~/prompts/DEFAULT\_SYSTEM.md gemini`
This creates the file and writes the current built‑in system prompt to it.
## Best practices: system.md vs GEMINI.md
[Section titled “Best practices: system.md vs GEMINI.md”](#best-practices-systemmd-vs-geminimd)
* system.md (firmware):
* Non‑negotiable operational rules: safety, tool‑use protocols, approvals, and
mechanics that keep the CLI reliable.
* Stable across tasks and projects (or per project when needed).
* GEMINI.md (strategy):
* Persona, goals, methodologies, and project/domain context.
* Evolves per task; relies on system.md for safe execution.
Keep system.md minimal but complete for safety and tool operation. Keep
GEMINI.md focused on high‑level guidance and project specifics.
## Troubleshooting
[Section titled “Troubleshooting”](#troubleshooting)
* Error: `missing system prompt file '…'`
* Ensure the referenced path exists and is readable.
* For `GEMINI\_SYSTEM\_MD=1|true`, create `./.gemini/system.md` in your project.
* Override not taking effect
* Confirm the variable is loaded (use `.gemini/.env` or export in your shell).
* Paths are resolved from the current working directory; try an absolute path.
* Restore defaults
* Unset `GEMINI\_SYSTEM\_MD` or set it to `0`/`false`.
Last updated: Apr 20, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.