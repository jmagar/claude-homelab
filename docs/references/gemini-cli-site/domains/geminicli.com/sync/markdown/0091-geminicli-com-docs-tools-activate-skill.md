Activate skill tool (`activate\_skill`) | Gemini CLI
[Skip to content](#_top)
# Activate skill tool (`activate\_skill`)
Copy as Markdown Copied!
The `activate\_skill` tool lets Gemini CLI load specialized procedural expertise
and resources when they are relevant to your request.
## Description
[Section titled “Description”](#description)
Skills are packages of instructions and tools designed for specific engineering
tasks, such as reviewing code or creating pull requests. Gemini CLI uses this
tool to “activate” a skill, which provides it with detailed guidelines and
specialized tools tailored to that task.
### Arguments
[Section titled “Arguments”](#arguments)
`activate\_skill` takes one argument:
* `name` (enum, required): The name of the skill to activate (for example,
`code-reviewer`, `pr-creator`, or `docs-writer`).
## Usage
[Section titled “Usage”](#usage)
The `activate\_skill` tool is used exclusively by the Gemini agent. You cannot
invoke this tool manually.
When the agent identifies that a task matches a discovered skill, it requests to
activate that skill. Once activated, the agent’s behavior is guided by the
skill’s specific instructions until the task is complete.
## Behavior
[Section titled “Behavior”](#behavior)
The agent uses this tool to provide professional-grade assistance:
* **Specialized logic:** Skills contain expert-level procedures for complex
workflows.
* **Dynamic capability:** Activating a skill can grant the agent access to new,
task-specific tools.
* **Contextual awareness:** Skills help the agent focus on the most relevant
standards and conventions for a particular task.
## Next steps
[Section titled “Next steps”](#next-steps)
* Learn how to [Use Agent Skills](/docs/cli/skills).
* See the [Build agent skills](/docs/cli/creating-skills) guide.
Last updated: Apr 30, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.