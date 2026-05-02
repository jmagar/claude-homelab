Managing Agent Skills | Gemini CLI
[Skip to content](#_top)
# Managing Agent Skills
Copy as Markdown Copied!
Agent Skills provide Gemini CLI with specialized expertise on demand. This guide
covers advanced management techniques, including using slash commands, terminal
utilities, and understanding discovery tiers.
## Discovery tiers
[Section titled “Discovery tiers”](#discovery-tiers)
Gemini CLI discovers skills from several locations, following a specific order
of precedence (lowest to highest):
1. **Built-in Skills**: Included with Gemini CLI and always available.
2. **Extension Skills**: Bundled within [extensions](/docs/extensions).
3. **User Skills**: Located in `\~/.gemini/skills/` or the `\~/.agents/skills/`
alias. These are available across all your projects.
4. **Workspace Skills**: Located in `.gemini/skills/` or the `.agents/skills/`
alias within your current directory. These are project-specific.
>
**> Tip:
**> If multiple skills share the same name, the version from thehigher-precedence location is used.
>
## In-session management
[Section titled “In-session management”](#in-session-management)
Use the `/skills` slash command during an interactive session to manage your
available expertise.
* **List skills**: `/skills list` (shows discovered skills).
* Use `/skills list all` to include internal built-in skills.
* Use `/skills list nodesc` to hide descriptions.
* **Reload skills**: `/skills reload` (or `/skills refresh`) to scan for new or
modified skills without restarting the CLI.
* **Toggle status**:
* `/skills disable \<name\>`: Prevents a skill from being triggered.
* `/skills enable \<name\>`: Re-enables a disabled skill.
* **Link local skills**: `/skills link \<path\> [--scope user|workspace]` to
immediately use a skill you are developing.
## Terminal utilities
[Section titled “Terminal utilities”](#terminal-utilities)
The `gemini skills` command provides management utilities directly from your
system shell.
### Install a skill
[Section titled “Install a skill”](#install-a-skill)
To install a skill from a remote repository or a local `.skill` package:
Terminal window
```
`
gemini skills install https://github.com/user/my-awesome-skill
`
```
By default, this installs to your **user profile**. Use `--scope workspace` to
install it only for the current project.
### Link for development
[Section titled “Link for development”](#link-for-development)
If you are developing a skill, use the `link` command to create a reference to
your local directory:
Terminal window
```
`
gemini skills link ./path/to/my-skill
`
```
### Uninstall a skill
[Section titled “Uninstall a skill”](#uninstall-a-skill)
To completely remove an installed or linked skill:
Terminal window
```
`
gemini skills uninstall \<name\>
`
```
## Security and consent
[Section titled “Security and consent”](#security-and-consent)
Agent Skills can execute scripts and access your files. To protect your
environment:
1. **Installation consent**: When installing from a remote URL, you will be
asked to confirm the source.
2. **Activation consent**: Every time a skill is triggered during a session,
the agent must ask for permission to activate it and gain access to its
resources.
## Next steps
[Section titled “Next steps”](#next-steps)
* [Get started with Agent Skills](/docs/cli/tutorials/skills-getting-started): A
walkthrough for creating your first skill.
* [Creating Agent Skills](/docs/cli/creating-skills): Detailed guide on bundling
scripts and assets.
* [Skill best practices](/docs/cli/skills-best-practices): Strategies for building
reliable expertise.
Last updated: Apr 30, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.