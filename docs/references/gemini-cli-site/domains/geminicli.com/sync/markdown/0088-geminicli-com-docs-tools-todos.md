Todo tool (`write\_todos`) | Gemini CLI
[Skip to content](#_top)
# Todo tool (`write\_todos`)
Copy as Markdown Copied!
The `write\_todos` tool allows the Gemini agent to maintain an internal list of
subtasks for multi-step requests.
## Technical reference
[Section titled “Technical reference”](#technical-reference)
The agent uses this tool to manage its execution plan and provide progress
updates to the CLI interface.
### Arguments
[Section titled “Arguments”](#arguments)
* `todos` (array of objects, required): The complete list of tasks. Each object
includes:
* `description` (string): Technical description of the task.
* `status` (enum): `pending`, `in\_progress`, `completed`, `cancelled`, or
`blocked`.
## Technical behavior
[Section titled “Technical behavior”](#technical-behavior)
* **Interface:** Updates the progress indicator above the CLI input prompt.
* **Exclusivity:** Only one task can be marked `in\_progress` at any time.
* **Persistence:** Todo state is scoped to the current session.
* **Interaction:** Users can toggle the full list view using **Ctrl+T**.
## Use cases
[Section titled “Use cases”](#use-cases)
* Breaking down a complex feature implementation into manageable steps.
* Coordinating multi-file refactoring tasks.
* Providing visibility into the agent’s current focus during long-running tasks.
## Next steps
[Section titled “Next steps”](#next-steps)
* Follow the [Task planning tutorial](/docs/cli/tutorials/task-planning) for
usage details.
* Learn about [Session management](/docs/cli/session-management) for context.
Last updated: Mar 17, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.