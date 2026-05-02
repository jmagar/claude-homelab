Agent Skills | Gemini CLI
[Skip to content](#_top)
# Agent Skills
Copy as Markdown Copied!
Agent Skills let you extend Gemini CLI with specialized expertise, procedural
workflows, and task-specific resources. Based on the
[Agent Skills](https://agentskills.io) open standard, a “skill” is a
self-contained directory that packages instructions and assets into a
discoverable capability.
Unlike general context files ([GEMINI.md](/docs/cli/gemini-md)), which provide
persistent workspace-wide background, Skills represent **on-demand expertise**.
This lets Gemini CLI maintain a vast library of specialized capabilities—such as
security auditing, cloud deployments, or codebase migrations—without cluttering
the model’s immediate context window.
## How it works
[Section titled “How it works”](#how-it-works)
The lifecycle of an Agent Skill involves discovery, activation, and conditional
resource access.
1. **Discovery**: At the start of a session, Gemini CLI scans the discovery
tiers and injects the name and description of all enabled skills into the
system prompt.
2. **Activation**: When Gemini identifies a task matching a skill’s
description, it calls the `activate\_skill` tool.
3. **Consent**: You will see a confirmation prompt in the UI detailing the
skill’s name, purpose, and the directory path it will gain access to.
4. **Injection**: Upon your approval:
* The `SKILL.md` body and folder structure is added to the conversation
history.
* The skill’s directory is added to the agent’s allowed file paths, granting
it permission to read any bundled assets.
* **Execution**: The model proceeds with the specialized expertise active. It
is instructed to prioritize the skill’s procedural guidance within reason.
## Discovery tiers
[Section titled “Discovery tiers”](#discovery-tiers)
Gemini CLI discovers skills from several locations, following a specific order
of precedence (lowest to highest):
1. **Built-in skills**: Standard skills included with Gemini CLI that provide
foundational capabilities.
2. **Extension skills**: Skills bundled within installed
[extensions](/docs/extensions).
3. **User skills**: Located in `\~/.gemini/skills/` or the `\~/.agents/skills/`
alias.
4. **Workspace skills**: Located in `.gemini/skills/` or the `.agents/skills/`
alias. Workspace skills are shared with your team via version control.
### Precedence and aliases
[Section titled “Precedence and aliases”](#precedence-and-aliases)
If multiple skills share the same name, the version from the higher-precedence
location is used. Within the same tier (user or workspace), the
`.agents/skills/` alias takes precedence over the `.gemini/skills/` directory.
The `.agents/skills/` alias provides an interoperable path for managing
agent-specific expertise that remains compatible across different AI tools.
## Key benefits
[Section titled “Key benefits”](#key-benefits)
Agent Skills provide several advantages for managing specialized knowledge and
complex workflows.
* **Shared expertise**: Package complex workflows (like a specific team’s PR
review process) into a folder that anyone can use.
* **Repeatable workflows**: Ensure complex multi-step tasks are performed
consistently by providing a procedural framework.
* **Resource bundling**: Include scripts, templates, or example data alongside
instructions so the agent has everything it needs.
* **Progressive disclosure**: Only skill metadata (name and description) is
loaded initially. Detailed instructions and resources are only disclosed when
the model explicitly activates the skill, saving context tokens.
`/skills disable` and `/skills enable` default to the `user` scope. Use
`--scope workspace` to manage workspace-specific settings.
To see all available skills in your current session, use the `/skills list`
command.
## Managing skills
[Section titled “Managing skills”](#managing-skills)
You can manage Agent Skills through interactive session commands or directly
from your terminal.
### In an interactive session
[Section titled “In an interactive session”](#in-an-interactive-session)
Use the `/skills` slash command to view and manage available expertise:
* `/skills list [all] [nodesc]`: Shows discovered skills. Use `all` to include
built-in skills and `nodesc` to hide descriptions.
* `/skills link \<path\> [--scope user|workspace]`: Links skills from a local
directory.
* `/skills disable \<name\>`: Prevents a specific skill from being used.
* `/skills enable \<name\>`: Re-enables a disabled skill.
* `/skills reload` (or `/skills refresh`): Refreshes the list of discovered
skills from all tiers.
### From the terminal
[Section titled “From the terminal”](#from-the-terminal)
The `gemini skills` command provides management utilities:
Terminal window
```
`
# List all discovered skills. Use --all to include built-in skills.
gemini skills list --all
# Install a skill from a Git repository or local directory.
# Use --consent to skip the security confirmation prompt.
gemini skills install https://github.com/user/repo.git --consent
# Uninstall a skill.
gemini skills uninstall my-skill --scope workspace
`
```
#### Command options
[Section titled “Command options”](#command-options)
The skill management commands support several global and command-specific
options.
* `--scope`: Either `user` (global, default) or `workspace` (local to the
project).
* `--path`: The sub-directory within a Git repository containing the skill.
* `--consent`: Acknowledge security risks and skip the interactive confirmation
during installation.
For more details on CLI commands, see the
[CLI reference](/docs/cli/cli-reference#skills-management).
## Next steps
[Section titled “Next steps”](#next-steps)
Explore these resources to refine your skills and understand the framework
better.
* [Get started with Agent Skills](/docs/cli/tutorials/skills-getting-started): A
quick walkthrough of triggering and using skills.
* [Creating Agent Skills](/docs/cli/creating-skills): Create your first skill and
bundle custom logic.
* [Using Agent Skills](/docs/cli/using-agent-skills): Learn how to leverage built-in
and custom skills.
* [Best practices](/docs/cli/skills-best-practices): Learn strategies for building
effective skills.
Last updated: Apr 30, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.