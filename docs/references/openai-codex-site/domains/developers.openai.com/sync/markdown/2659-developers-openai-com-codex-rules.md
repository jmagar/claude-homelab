Rules – Codex | OpenAI Developers
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
### Getting Started
* [ Overview ](/codex)
* [ Quickstart ](/codex/quickstart)
* [ Explore use cases ](/codex/use-cases)
* [ Pricing ](/codex/pricing)
* Concepts
* [ Prompting ](/codex/prompting)
* [ Customization ](/codex/concepts/customization)
* [ Memories ](/codex/memories)
* [ Chronicle ](/codex/memories/chronicle)
* [ Sandboxing ](/codex/concepts/sandboxing)
* [ Subagents ](/codex/concepts/subagents)
* [ Workflows ](/codex/workflows)
* [ Models ](/codex/models)
* [ Cyber Safety ](/codex/concepts/cyber-safety)
### Using Codex
* App
* [ Overview ](/codex/app)
* [ Features ](/codex/app/features)
* [ Settings ](/codex/app/settings)
* [ Review ](/codex/app/review)
* [ Automations ](/codex/app/automations)
* [ Worktrees ](/codex/app/worktrees)
* [ Local Environments ](/codex/app/local-environments)
* [ In-app browser ](/codex/app/browser)
* [ Computer Use ](/codex/app/computer-use)
* [ Commands ](/codex/app/commands)
* [ Windows ](/codex/app/windows)
* [ Troubleshooting ](/codex/app/troubleshooting)
* IDE Extension
* [ Overview ](/codex/ide)
* [ Features ](/codex/ide/features)
* [ Settings ](/codex/ide/settings)
* [ IDE Commands ](/codex/ide/commands)
* [ Slash commands ](/codex/ide/slash-commands)
* CLI
* [ Overview ](/codex/cli)
* [ Features ](/codex/cli/features)
* [ Command Line Options ](/codex/cli/reference)
* [ Slash commands ](/codex/cli/slash-commands)
* Web
* [ Overview ](/codex/cloud)
* [ Environments ](/codex/cloud/environments)
* [ Internet Access ](/codex/cloud/internet-access)
* Integrations
* [ GitHub ](/codex/integrations/github)
* [ Slack ](/codex/integrations/slack)
* [ Linear ](/codex/integrations/linear)
* Codex Security
* [ Overview ](/codex/security)
* [ Setup ](/codex/security/setup)
* [ Improving the threat model ](/codex/security/threat-model)
* [ FAQ ](/codex/security/faq)
### Configuration
* Config File
* [ Config Basics ](/codex/config-basic)
* [ Advanced Config ](/codex/config-advanced)
* [ Config Reference ](/codex/config-reference)
* [ Sample Config ](/codex/config-sample)
* [ Speed ](/codex/speed)
* [ Rules ](/codex/rules)
* [ Hooks ](/codex/hooks)
* [ AGENTS.md ](/codex/guides/agents-md)
* [ MCP ](/codex/mcp)
* Plugins
* [ Overview ](/codex/plugins)
* [ Build plugins ](/codex/plugins/build)
* [ Skills ](/codex/skills)
* [ Subagents ](/codex/subagents)
### Administration
* [ Authentication ](/codex/auth)
* [ Agent approvals & security ](/codex/agent-approvals-security)
* [ Remote connections ](/codex/remote-connections)
* Enterprise
* [ Admin Setup ](/codex/enterprise/admin-setup)
* [ Governance ](/codex/enterprise/governance)
* [ Managed configuration ](/codex/enterprise/managed-configuration)
* [ Windows ](/codex/windows)
### Automation
* [ Non-interactive Mode ](/codex/noninteractive)
* [ Codex SDK ](/codex/sdk)
* [ App Server ](/codex/app-server)
* [ MCP Server ](/codex/guides/agents-sdk)
* [ GitHub Action ](/codex/github-action)
### Learn
* [ Best practices ](/codex/learn/best-practices)
* [ Videos ](/codex/videos)
* [ Community ](/community)
* Blog
* [ Using skills to accelerate OSS maintenance ](/blog/skills-agents-sdk)
* [ Building frontend UIs with Codex and Figma ](/blog/building-frontend-uis-with-codex-and-figma)
* [ View all ](/blog/topic/codex)
* Cookbooks
* [ Codex Prompting Guide ](/cookbook/examples/gpt-5/codex_prompting_guide)
* [ Modernizing your Codebase with Codex ](/cookbook/examples/codex/code_modernization)
* [ View all ](/cookbook/topic/codex)
* [ Building AI Teams ](/codex/guides/build-ai-native-engineering-team)
### Releases
* [ Changelog ](/codex/changelog)
* [ Feature Maturity ](/codex/feature-maturity)
* [ Open Source ](/codex/open-source)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Use rules to control which commands Codex can run outside the sandbox.
Rules are experimental and may change.
## Create a rules file
1. Create a `.rules` file under a `rules/` folder next to an active config layer (for example, `\~/.codex/rules/default.rules`).
2. Add a rule. This example prompts before allowing `gh pr view` to run outside the sandbox.
```
`# Prompt before running commands with the prefix `gh pr view` outside the sandbox.
prefix\_rule(
# The prefix to match.
pattern = ["gh", "pr", "view"],
# The action to take when Codex requests to run a matching command.
decision = "prompt",
# Optional rationale for why this rule exists.
justification = "Viewing PRs is allowed with approval",
# `match` and `not\_match` are optional "inline unit tests" where you can
# provide examples of commands that should (or should not) match this rule.
match = [
"gh pr view 7888",
"gh pr view --repo openai/codex",
"gh pr view 7888 --json title,body,comments",
],
not\_match = [
# Does not match because the `pattern` must be an exact prefix.
"gh pr --repo openai/codex view 7888",
],
)`
```
3. Restart Codex.
Codex scans `rules/` under every active config layer at startup, including [Team Config](/codex/enterprise/admin-setup#team-config) locations and the user layer at `\~/.codex/rules/`. Project-local rules under `\<repo\>/.codex/rules/` load only when the project `.codex/` layer is trusted.
When you add a command to the allow list in the TUI, Codex writes to the user layer at `\~/.codex/rules/default.rules` so future runs can skip the prompt.
When Smart approvals are enabled (the default), Codex may propose a
`prefix\_rule` for you during escalation requests. Review the suggested prefix
carefully before accepting it.
Admins can also enforce restrictive `prefix\_rule` entries from
[`requirements.toml`](/codex/enterprise/managed-configuration#admin-enforced-requirements-requirementstoml).
## Understand rule fields
`prefix\_rule()` supports these fields:
* `pattern` **(required)**: A non-empty list that defines the command prefix to match. Each element is either:
* A literal string (for example, `"pr"`).
* A union of literals (for example, `["view", "list"]`) to match alternatives at that argument position.
* `decision` **(defaults to `"allow"`)**: The action to take when the rule matches. Codex applies the most restrictive decision when more than one rule matches (`forbidden` \> `prompt` \> `allow`).
* `allow`: Run the command outside the sandbox without prompting.
* `prompt`: Prompt before each matching invocation.
* `forbidden`: Block the request without prompting.
* `justification` **(optional)**: A non-empty, human-readable reason for the rule. Codex may surface it in approval prompts or rejection messages. When you use `forbidden`, include a recommended alternative in the justification when appropriate (for example, `"Use \\`rg` instead of `grep`.”`).
* `match` and `not\_match` **(defaults to `[]`)**: Examples that Codex validates when it loads your rules. Use these to catch mistakes before a rule takes effect.
When Codex considers a command to run, it compares the command’s argument list to `pattern`. Internally, Codex treats the command as a list of arguments (like what `execvp(3)` receives).
## Shell wrappers and compound commands
Some tools wrap several shell commands into a single invocation, for example:
```
`["bash", "-lc", "git add . && rm -rf /"]`
```
Because this kind of command can hide multiple actions inside one string, Codex treats `bash -lc`, `bash -c`, and their `zsh` / `sh` equivalents specially.
### When Codex can safely split the script
If the shell script is a linear chain of commands made only of:
* plain words (no variable expansion, no `VAR=...`, `$FOO`, `\*`, etc.)
* joined by safe operators (`&&`, `||`, `;`, or `|`)
then Codex parses it (using tree-sitter) and splits it into individual commands before applying your rules.
The script above is treated as two separate commands:
* `["git", "add", "."]`
* `["rm", "-rf", "/"]`
Codex then evaluates each command against your rules, and the most restrictive result wins.
Even if you allow `pattern=["git", "add"]`, Codex won’t auto allow `git add . && rm -rf /`, because the `rm -rf /` portion is evaluated separately and prevents the whole invocation from being auto allowed.
This prevents dangerous commands from being smuggled in alongside safe ones.
### When Codex does not split the script
If the script uses more advanced shell features, such as:
* redirection (`\>`, `\>\>`, `\<`)
* substitutions (`$(...)`, `...`)
* environment variables (`FOO=bar`)
* wildcard patterns (`\*`, `?`)
* control flow (`if`, `for`, `&&` with assignments, etc.)
then Codex doesn’t try to interpret or split it.
In those cases, the entire invocation is treated as:
```
`["bash", "-lc", "\<full script\>"]`
```
and your rules are applied to that **single** invocation.
With this handling, you get the security of per-command evaluation when it’s safe to do so, and conservative behavior when it isn’t.
## Test a rule file
Use `codex execpolicy check` to test how your rules apply to a command:
```
`codex execpolicy check --pretty \\
--rules \~/.codex/rules/default.rules \\
-- gh pr view 7888 --json title,body,comments`
```
The command emits JSON showing the strictest decision and any matching rules, including any `justification` values from matched rules. Use more than one `--rules` flag to combine files, and add `--pretty` to format the output.
## Understand the rules language
The `.rules` file format uses `Starlark` (see the [language spec](https://github.com/bazelbuild/starlark/blob/master/spec.md)). Its syntax is like Python, but it’s designed to be safe to run: the rules engine can run it without side effects (for example, touching the filesystem).