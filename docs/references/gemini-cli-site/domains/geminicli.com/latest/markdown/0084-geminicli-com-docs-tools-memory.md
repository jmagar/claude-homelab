Memory tool (`save\_memory`) | Gemini CLI
[Skip to content](#_top)
# Memory tool (`save\_memory`)
Copy as Markdown Copied!
The `save\_memory` tool allows the Gemini agent to persist specific facts, user
preferences, and project details across sessions.
## Technical reference
[Section titled “Technical reference”](#technical-reference)
This tool appends information to the `## Gemini Added Memories` section of your
global `GEMINI.md` file (typically located at `\~/.gemini/GEMINI.md`).
### Arguments
[Section titled “Arguments”](#arguments)
* `fact` (string, required): A clear, self-contained statement in natural
language.
## Technical behavior
[Section titled “Technical behavior”](#technical-behavior)
* **Storage:** Appends to the global context file in the user’s home directory.
* **Loading:** The stored facts are automatically included in the hierarchical
context system for all future sessions.
* **Format:** Saves data as a bulleted list item within a dedicated Markdown
section.
## Use cases
[Section titled “Use cases”](#use-cases)
* Persisting user preferences (for example, “I prefer functional programming”).
* Saving project-wide architectural decisions.
* Storing frequently used aliases or system configurations.
## Next steps
[Section titled “Next steps”](#next-steps)
* Follow the [Memory management guide](/docs/cli/tutorials/memory-management)
for practical examples.
* Learn how the [Project context (GEMINI.md)](/docs/cli/gemini-md) system loads
this information.
Last updated: Feb 13, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.