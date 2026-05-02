Internal documentation tool (`get\_internal\_docs`) | Gemini CLI
[Skip to content](#_top)
# Internal documentation tool (`get\_internal\_docs`)
Copy as Markdown Copied!
The `get\_internal\_docs` tool lets Gemini CLI access its own technical
documentation to provide more accurate answers about its capabilities and usage.
## Description
[Section titled “Description”](#description)
This tool is used when Gemini CLI needs to verify specific details about Gemini
CLI’s internal features, built-in commands, or configuration options. It
provides direct access to the Markdown files in the `docs/` directory.
### Arguments
[Section titled “Arguments”](#arguments)
`get\_internal\_docs` takes one optional argument:
* `path` (string, optional): The relative path to a specific documentation file
(for example, `reference/commands.md`). If omitted, the tool returns a list of
all available documentation paths.
## Usage
[Section titled “Usage”](#usage)
The `get\_internal\_docs` tool is used exclusively by Gemini CLI. You cannot
invoke this tool manually.
When Gemini CLI uses this tool, it retrieves the content of the requested
documentation file and processes it to answer your question. This ensures that
the information provided by the AI is grounded in the latest project
documentation.
## Behavior
[Section titled “Behavior”](#behavior)
Gemini CLI uses this tool to ensure technical accuracy:
* **Capability discovery:** If Gemini CLI is unsure how a feature works, it can
lookup the corresponding documentation.
* **Reference lookup:** Gemini CLI can verify slash command sub-commands or
specific setting names.
* **Self-correction:** Gemini CLI can use the documentation to correct its
understanding of Gemini CLI’s system logic.
## Next steps
[Section titled “Next steps”](#next-steps)
* Explore the [Command reference](/docs/reference/commands) for a detailed guide
to slash commands.
* See the [Configuration guide](/docs/reference/configuration) for settings
reference.
Last updated: Feb 19, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.