Tracker tools (`tracker\_\*`) | Gemini CLI
[Skip to content](#_top)
# Tracker tools (`tracker\_\*`)
Copy as Markdown Copied!
This is an experimental feature currently under active development.
The `tracker\_\*` tools allow the Gemini agent to maintain an internal, persistent
graph of tasks and dependencies for multi-step requests. This suite of tools
provides a more robust and granular way to manage execution plans than the
legacy `write\_todos` tool.
## Technical reference
[Section titled “Technical reference”](#technical-reference)
The agent uses these tools to manage its execution plan, decompose complex goals
into actionable sub-tasks, and provide real-time progress updates to the CLI
interface. The task state is stored in the `.gemini/tmp/tracker/\<session-id\>`
directory, allowing the agent to manage its plan for the current session.
### Available Tools
[Section titled “Available Tools”](#available-tools)
* `tracker\_create\_task`: Creates a new task in the tracker. You can specify a
title, description, and task type (`epic`, `task`, `bug`).
* `tracker\_update\_task`: Updates an existing task’s status (`open`,
`in\_progress`, `blocked`, `closed`), description, or dependencies.
* `tracker\_get\_task`: Retrieves the full details of a specific task by its
6-character hex ID.
* `tracker\_list\_tasks`: Lists tasks in the tracker, optionally filtered by
status, type, or parent ID.
* `tracker\_add\_dependency`: Adds a dependency between two tasks, ensuring
topological execution.
* `tracker\_visualize`: Renders an ASCII tree visualization of the current task
graph.
## Technical behavior
[Section titled “Technical behavior”](#technical-behavior)
* **Interface:** Updates the progress indicator and task tree above the CLI
input prompt.
* **Persistence:** Task state is saved automatically to the
`.gemini/tmp/tracker/\<session-id\>` directory. Task states are session-specific
and do not persist across different sessions.
* **Dependencies:** Tasks can depend on other tasks, forming a directed acyclic
graph (DAG). The agent must resolve dependencies before starting blocked
tasks.
* **Interaction:** Users can view the current state of the tracker by asking the
agent to visualize it, or by running `gemini-cli` commands if implemented.
## Use cases
[Section titled “Use cases”](#use-cases)
* Coordinating multi-file refactoring projects.
* Breaking down a mission into a hierarchy of epics and tasks for better
visibility.
* Tracking bugs and feature requests directly within the context of an active
codebase.
* Providing visibility into the agent’s current focus and remaining work.
## Next steps
[Section titled “Next steps”](#next-steps)
* Follow the [Task planning tutorial](/docs/cli/tutorials/task-planning) for
usage details and migration from the legacy todo list.
* Learn about [Session management](/docs/cli/session-management) for context on
persistent state.
Last updated: Apr 20, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.