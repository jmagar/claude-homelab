Plugins – Codex | OpenAI Developers
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
## Overview
Plugins bundle skills, app integrations, and MCP servers into reusable
workflows for Codex.
Extend what Codex can do, for example:
* Install the Gmail plugin to let Codex read and manage Gmail.
* Install the Google Drive plugin to work across Drive, Docs, Sheets, and
Slides.
* Install the Slack plugin to summarize channels or draft replies.
A plugin can contain:
* **Skills:** reusable instructions for specific kinds of work. Codex can load
them when needed so it follows the right steps and uses the right references
or helper scripts for a task.
* **Apps:** connections to tools like GitHub, Slack, or Google Drive, so
Codex can read information from those tools and take actions in them.
* **MCP servers:** services that give Codex access to additional tools or
shared information, often from systems outside your local project.
More plugin capabilities are coming soon.
## Use and install plugins
### Plugin Directory in the Codex app
Open **Plugins** in the Codex app to browse and install curated plugins.
### Plugin directory in the CLI
In Codex CLI, run the following command to open the plugins list:
```
`codex
/plugins`
```
The CLI plugin browser groups plugins by marketplace. Use the marketplace tabs
to switch sources, open a plugin to inspect details, install or uninstall
marketplace entries, and press Space on an installed plugin to toggle
its enabled state.
### Install and use a plugin
Once you open the plugin directory:
1. Search or browse for a plugin, then open its details.
2. Select the install button. In the app, select the plus button or
**Add to Codex**. In the CLI, select `Install plugin`.
3. If the plugin needs an external app, connect it when prompted. Some plugins
ask you to authenticate during install. Others wait until the first time you
use them.
4. After installation, start a new thread and ask Codex to use the plugin.
After you install a plugin, you can use it directly in the prompt window:
Describe the task directly
Ask for the outcome you want, such as “Summarize unread Gmail threads
from today” or “Pull the latest launch notes from Google Drive.”
Use this when you want Codex to choose the right installed tools for the
task.
Choose a specific plugin
Type `@` to invoke the plugin or one of its bundled skills
explicitly.
Use this when you want to be specific about which plugin or skill Codex
should use. See [Codex app commands](/codex/app/commands) and
[Skills](/codex/skills).
### How permissions and data sharing work
Installing a plugin makes its workflows available in Codex, but your existing
[approval settings](/codex/agent-approvals-security) still apply. Any
connected external services remain subject to their own authentication,
privacy, and data-sharing policies.
* Bundled skills are available as soon as you install the plugin.
* If a plugin includes apps, Codex may prompt you to install or sign in to
those apps in ChatGPT during setup or the first time you use them.
* If a plugin includes MCP servers, they may require additional setup or
authentication before you can use them.
* When Codex sends data through a bundled app, that app’s terms and privacy
policy apply.
### Remove or turn off a plugin
To remove a plugin, reopen it from the plugin browser and select
**Uninstall plugin**.
Uninstalling a plugin removes the plugin bundle from Codex, but bundled apps
stay installed until you manage them in ChatGPT.
If you want to keep a plugin installed but turn it off, set its entry in
`\~/.codex/config.toml` to `enabled = false`, then restart Codex:
```
`[plugins."gmail@openai-curated"]
enabled = false`
```
## Build your own plugin
If you want to create, test, or distribute your own plugin, see
[Build plugins](/codex/plugins/build). That page covers local scaffolding,
manual marketplace setup, plugin manifests, and packaging guidance.