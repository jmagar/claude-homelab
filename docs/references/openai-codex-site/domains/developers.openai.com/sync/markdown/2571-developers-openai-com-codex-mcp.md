Model Context Protocol – Codex | OpenAI Developers
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
Model Context Protocol (MCP) connects models to tools and context. Use it to give Codex access to third-party documentation, or to let it interact with developer tools like your browser or Figma.
Codex supports MCP servers in both the CLI and the IDE extension.
## Supported MCP features
* **STDIO servers**: Servers that run as a local process (started by a command).
* Environment variables
* **Streamable HTTP servers**: Servers that you access at an address.
* Bearer token authentication
* OAuth authentication (run `codex mcp login \<server-name\>` for servers that support OAuth)
## Connect Codex to an MCP server
Codex stores MCP configuration in `config.toml` alongside other Codex configuration settings. By default this is `\~/.codex/config.toml`, but you can also scope MCP servers to a project with `.codex/config.toml` (trusted projects only).
The CLI and the IDE extension share this configuration. Once you configure your MCP servers, you can switch between the two Codex clients without redoing setup.
To configure MCP servers, choose one option:
1. **Use the CLI**: Run `codex mcp` to add and manage servers.
2. **Edit `config.toml`**: Update `\~/.codex/config.toml` (or a project-scoped `.codex/config.toml` in trusted projects) directly.
### Configure with the CLI
#### Add an MCP server
```
`codex mcp add \<server-name\> --env VAR1=VALUE1 --env VAR2=VALUE2 -- \<stdio server-command\>`
```
For example, to add Context7 (a free MCP server for developer documentation), you can run the following command:
```
`codex mcp add context7 -- npx -y @upstash/context7-mcp`
```
#### Other CLI commands
To see all available MCP commands, you can run `codex mcp --help`.
#### Terminal UI (TUI)
In the `codex` TUI, use `/mcp` to see your active MCP servers.
### Configure with config.toml
For more fine-grained control over MCP server options, edit `\~/.codex/config.toml` (or a project-scoped `.codex/config.toml`). In the IDE extension, select **MCP settings** \> **Open config.toml** from the gear menu.
Configure each MCP server with a `[mcp\_servers.\<server-name\>]` table in the configuration file.
#### STDIO servers
* `command` (required): The command that starts the server.
* `args` (optional): Arguments to pass to the server.
* `env` (optional): Environment variables to set for the server.
* `env\_vars` (optional): Environment variables to allow and forward.
* `cwd` (optional): Working directory to start the server from.
* `experimental\_environment` (optional): Set to `remote` to start the stdio
server through a remote executor environment when one is available.
`env\_vars` can contain plain variable names or objects with a source:
```
`env\_vars = ["LOCAL\_TOKEN", { name = "REMOTE\_TOKEN", source = "remote" }]`
```
String entries and `source = "local"` read from Codex’s local environment.
`source = "remote"` reads from the remote executor environment and requires
remote MCP stdio.
#### Streamable HTTP servers
* `url` (required): The server address.
* `bearer\_token\_env\_var` (optional): Environment variable name for a bearer token to send in `Authorization`.
* `http\_headers` (optional): Map of header names to static values.
* `env\_http\_headers` (optional): Map of header names to environment variable names (values pulled from the environment).
#### Other configuration options
* `startup\_timeout\_sec` (optional): Timeout (seconds) for the server to start. Default: `10`.
* `tool\_timeout\_sec` (optional): Timeout (seconds) for the server to run a tool. Default: `60`.
* `enabled` (optional): Set `false` to disable a server without deleting it.
* `required` (optional): Set `true` to make startup fail if this enabled server can’t initialize.
* `enabled\_tools` (optional): Tool allow list.
* `disabled\_tools` (optional): Tool deny list (applied after `enabled\_tools`).
If your OAuth provider requires a fixed callback port, set the top-level `mcp\_oauth\_callback\_port` in `config.toml`. If unset, Codex binds to an ephemeral port.
If your MCP OAuth flow must use a specific callback URL (for example, a remote Devbox ingress URL or a custom callback path), set `mcp\_oauth\_callback\_url`. Codex uses this value as the OAuth `redirect\_uri` while still using `mcp\_oauth\_callback\_port` for the callback listener port. Local callback URLs (for example `localhost`) bind on the local interface; non-local callback URLs bind on `0.0.0.0` so the callback can reach the host.
If the MCP server advertises `scopes\_supported`, Codex prefers those
server-advertised scopes during OAuth login. Otherwise, Codex falls back to the
scopes configured in `config.toml`.
#### config.toml examples
```
`[mcp\_servers.context7]
command = "npx"
args = ["-y", "@upstash/context7-mcp"]
env\_vars = ["LOCAL\_TOKEN"]
[mcp\_servers.context7.env]
MY\_ENV\_VAR = "MY\_ENV\_VALUE"`
```
```
`# Optional MCP OAuth callback overrides (used by `codex mcp login`)
mcp\_oauth\_callback\_port = 5555
mcp\_oauth\_callback\_url = "https://devbox.example.internal/callback"`
```
```
`[mcp\_servers.figma]
url = "https://mcp.figma.com/mcp"
bearer\_token\_env\_var = "FIGMA\_OAUTH\_TOKEN"
http\_headers = { "X-Figma-Region" = "us-east-1" }`
```
```
`[mcp\_servers.chrome\_devtools]
url = "http://localhost:3000/mcp"
enabled\_tools = ["open", "screenshot"]
disabled\_tools = ["screenshot"] # applied after enabled\_tools
startup\_timeout\_sec = 20
tool\_timeout\_sec = 45
enabled = true`
```
## Examples of useful MCP servers
The list of MCP servers keeps growing. Here are a few common ones:
* [OpenAI Docs MCP](/learn/docs-mcp): Search and read OpenAI developer docs.
* [Context7](https://github.com/upstash/context7): Connect to up-to-date developer documentation.
* Figma [Local](https://developers.figma.com/docs/figma-mcp-server/local-server-installation/) and [Remote](https://developers.figma.com/docs/figma-mcp-server/remote-server-installation/): Access your Figma designs.
* [Playwright](https://www.npmjs.com/package/@playwright/mcp): Control and inspect a browser using Playwright.
* [Chrome Developer Tools](https://github.com/ChromeDevTools/chrome-devtools-mcp/): Control and inspect Chrome.
* [Sentry](https://docs.sentry.io/product/sentry-mcp/#codex): Access Sentry logs.
* [GitHub](https://github.com/github/github-mcp-server): Manage GitHub beyond what `git` supports (for example, pull requests and issues).