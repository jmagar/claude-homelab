CLI launcher reference · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# CLI launcher reference
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
The Aperture launcher (`aperture-cli`) is a command-line interface (CLI) that configures and runs coding agents pre-connected to your [Aperture](/docs/aperture) proxy. It handles environment variables, configuration files, and provider type selection automatically, so you can start a coding session without editing configuration by hand.
This page is part of the [Aperture reference](/docs/aperture/reference) documentation.
## [Prerequisites](#prerequisites)
Before you use the launcher, confirm you have the following:
* A running Aperture proxy with at least one [configured provider](/docs/aperture/configuration).
* Network access to the Aperture host URL.
* At least one [supported coding agent](#supported-agents) installed on your device. If you don't have one, the launcher provides install commands for each agent.
* Go 1.26 or later installed on the device you plan to install the `aperture-cli` on.
## [Install the launcher](#install-the-launcher)
You can install the Aperture launcher using `go install` or by building the launcher from the [Aperture repository on GitHub](https://github.com/tailscale/aperture-cli). These instructions cover using `go install`.
1. Install the aperture-cli using `go install`:
```
`go install github.com/tailscale/aperture-cli/cmd/aperture@latest
`
```
2. Start the `aperture-cli` launcher:
```
`aperture
`
```
## [Connect to Aperture](#connect-to-aperture)
The launcher connects to your Aperture proxy on startup and verifies your provider configuration.
1. Run the launcher:
```
`aperture
`
```
By default, the launcher connects to `http://\<aperture-hostname\>`. To use a different host, open the settings menu and add or select an endpoint under **Aperture Endpoints**. The launcher persists your endpoint selection in `settings.json`.
2. Wait for the preflight check to complete.
The launcher queries the Aperture proxy for its list of configured providers and their API compatibility. If the host is unreachable, the launcher prompts you to enter a different URL.
3. After a successful connection, the launcher displays the main menu with your available coding agents.
The launcher saves the connected host to your settings and uses it automatically on the next launch.
### [Manage multiple endpoints](#manage-multiple-endpoints)
You can configure multiple Aperture proxy URLs and switch between them.
1. From the main menu, press `s` to open settings.
2. Select **Aperture Endpoints**.
3. Add or remove endpoints. Select an endpoint to make it the active host. The launcher uses the active endpoint on startup.
To delete an endpoint, highlight it and press `d`.
## [Launch a coding agent](#launch-a-coding-agent)
After the launcher connects to Aperture, select a coding agent and provider type to start a coding session.
### [Select an agent](#select-an-agent)
The main menu lists all coding agents that the launcher detected on your device. Agents without an installed binary do not appear.
```
`Connected to http://\<aperture-hostname\> (3 providers)
Which editor do you want to use?
[0] Last Used: Claude Code - Google Vertex
[1] Claude Code
[2] Gemini CLI
[3] OpenCode
[i] Install agents
[s] Settings
[q] Quit
Selection (default: 0):
`
```
The `[0] Last Used` shortcut launches the same agent and provider type combination from your previous session. Press `0` or `Enter` to relaunch it.
If an agent you expect is missing from the list, the launcher couldn't find its binary. Refer to the [troubleshooting section](#agent-binary-not-found) for resolution steps.
### [Select a provider type](#select-a-provider-type)
After selecting an agent, choose a provider type. The launcher displays only provider types that are compatible with your configured Aperture providers.
For example, if no provider in your Aperture configuration supports the Amazon Web Services (AWS) Bedrock API, the launcher hides the Bedrock option from the Claude Code provider type list.
### [Automatic selection](#automatic-selection)
If only one valid agent and provider type combination exists after filtering, the launcher skips the menu and launches the agent immediately.
### [What happens at launch](#what-happens-at-launch)
When you select an agent and provider type, the launcher:
1. Sets the environment variables the agent requires for the selected provider type. Some environment variable values include path suffixes (for example, `/v1` or `/bedrock`) appended to the Aperture host URL.
2. Writes temporary configuration files if the agent requires them.
3. Appends skip-permissions flags if you've enabled full-auto mode.
4. Saves your selection as the last-used combination.
5. Hands the full terminal to the coding agent.
When the agent exits, the launcher cleans up temporary files, re-checks the Aperture connection, and returns to the main menu.
## [Supported agents](#supported-agents)
The launcher supports four coding agents. Each agent declares which provider types it can use, and the launcher filters the list based on your Aperture configuration.
### [Claude Code](#claude-code)
[Claude Code](https://docs.anthropic.com/en/docs/claude-code) is Anthropic's terminal coding agent for Claude models. For setup instructions, refer to [Use Claude Code with Aperture](/docs/aperture/how-to/use-claude-code).
* **Binary**: `claude`
* **Provider types**: Anthropic API, AWS Bedrock, Google Vertex
* **Install**: `curl -fsSL https://claude.ai/install.sh | bash`
* **Full-auto flag**: `--dangerously-skip-permissions`
The launcher sets the following environment variables based on the selected provider type:
|Provider type|Environment variables|
|Anthropic API|`ANTHROPIC\_BASE\_URL`, `ANTHROPIC\_AUTH\_TOKEN`|
|AWS Bedrock|`ANTHROPIC\_BEDROCK\_BASE\_URL`, `CLAUDE\_CODE\_USE\_BEDROCK`, `CLAUDE\_CODE\_SKIP\_BEDROCK\_AUTH`|
|Google Vertex|`CLOUD\_ML\_REGION`, `CLAUDE\_CODE\_USE\_VERTEX`, `CLAUDE\_CODE\_SKIP\_VERTEX\_AUTH`, `ANTHROPIC\_VERTEX\_PROJECT\_ID`, `ANTHROPIC\_VERTEX\_BASE\_URL`|
When providers include model information, the launcher also sets model-tier variables (`ANTHROPIC\_DEFAULT\_OPUS\_MODEL`, `ANTHROPIC\_DEFAULT\_SONNET\_MODEL`, `ANTHROPIC\_DEFAULT\_HAIKU\_MODEL`) based on available models.
### [Gemini CLI](#gemini-cli)
[Gemini CLI](https://geminicli.com/) is Google's terminal coding agent for Gemini models.
* **Binary**: `gemini`
* **Provider types**: Google Vertex, Gemini API
* **Install**: `npm install -g @google/gemini-cli`
* **Full-auto flag**: `--yolo`
The launcher sets the following environment variables based on the selected provider type:
|Provider type|Environment variables|
|Google Vertex|`GOOGLE\_VERTEX\_BASE\_URL`, `GOOGLE\_API\_KEY`|
|Gemini API|`GEMINI\_API\_KEY`, `GEMINI\_BASE\_URL`|
The launcher also sets `GEMINI\_CLI\_HOME` to point to the launcher-managed configuration directory.
The launcher writes a persistent settings file at `\<config-dir\>/aperture/gemini-home/.gemini/settings.json` with the authentication type for the selected provider type. This file persists between sessions. Refer to [Persistent state](#persistent-state) for `\<config-dir\>` values by operating system.
### [OpenCode](#opencode)
[OpenCode](https://opencode.ai) is a terminal coding agent that supports multiple AI providers. For setup instructions, refer to [Use OpenCode with Aperture](/docs/aperture/how-to/use-opencode).
* **Binary**: `opencode`
* **Provider types**: Anthropic API, AWS Bedrock, Google Vertex, OpenAI Compatible
* **Install**: `curl -fsSL https://opencode.ai/install | bash`
The launcher sets the following environment variables for OpenCode:
|Provider type|Environment variables|
|Anthropic API|`ANTHROPIC\_BASE\_URL`, `ANTHROPIC\_AUTH\_TOKEN`|
|AWS Bedrock|`AWS\_ACCESS\_KEY\_ID`, `AWS\_SECRET\_ACCESS\_KEY`, `AWS\_REGION`|
|Google Vertex|`GOOGLE\_CLOUD\_PROJECT`, `GOOGLE\_CLOUD\_LOCATION`|
|OpenAI Compatible|`OPENAI\_API\_KEY`, `OPENAI\_BASE\_URL`|
For the Anthropic API provider type, the launcher sets `ANTHROPIC\_BASE\_URL` to the Aperture proxy's `/bedrock` path.
The launcher also sets `OPENCODE\_CONFIG` to point to the launcher-managed configuration file.
The launcher writes a temporary configuration file at `\~/.opencode/tmp\_aperture\_config.json` and deletes it when the agent exits.
### [OpenAI Codex](#openai-codex)
[OpenAI Codex](https://github.com/openai/codex) is OpenAI's terminal coding agent. For setup instructions, refer to [Use Codex with Aperture](/docs/aperture/how-to/use-codex).
* **Binary**: `codex`
* **Provider types**: OpenAI Compatible
* **Install**: `npm install -g @openai/codex`
* **Full-auto flag**: `--full-auto`
The launcher sets the following environment variables for Codex:
|Provider type|Environment variables|
|OpenAI Compatible|`OPENAI\_BASE\_URL`, `OPENAI\_API\_KEY`|
The launcher also sets `CODEX\_HOME` to point to the launcher-managed configuration directory.
The launcher writes a persistent auth file at `\<config-dir\>/aperture/codex-home/auth.json` to prevent Codex from prompting for interactive login on first run. Refer to [Persistent state](#persistent-state) for `\<config-dir\>` values by operating system.
## [Configure settings](#configure-settings)
Press `s` from the main menu to open the settings screen.
### [Manage Aperture endpoints](#manage-aperture-endpoints)
Add and remove Aperture proxy URLs. The active endpoint is the host the launcher connects to on startup.
1. Select **Aperture Endpoints** from the settings menu.
2. To add a new endpoint, select the add option and enter the URL.
3. To switch to a different endpoint, select it from the list.
4. To delete an endpoint, highlight it and press `d` or `Delete`.
### [Full-auto mode](#full-auto-mode)
Full-auto mode (labeled **YOLO mode** in the settings menu) appends skip-permissions flags when launching agents. When enabled, agents run without asking for confirmation before executing commands or making changes.
Each agent uses its own flag:
|Agent|Flag|
|Claude Code|`--dangerously-skip-permissions`|
|Gemini CLI|`--yolo`|
|OpenAI Codex|`--full-auto`|
To toggle full-auto mode:
1. Select **YOLO mode** from the settings menu.
2. Toggle the setting on or off.
The setting persists across sessions.
Full-auto mode grants agents broad permissions to execute commands and modify files without confirmation.
### [Install and uninstall agents](#install-and-uninstall-agents)
To install a coding agent:
1. Press `i` from the main menu, or select an agent marked as not installed.
2. The launcher displays the install command for the selected agent. Run the command in a separate terminal.
3. After installation, return to the launcher. The agent appears in the main menu on the next refresh.
To uninstall an agent:
1. Open settings and select **Uninstall**.
2. Select the agent to remove.
3. Confirm the uninstall.
## [Keyboard shortcuts](#keyboard-shortcuts)
The following keyboard shortcuts are available in the launcher:
|Key|Action|
|`Up`/`Down` or `j`/`k`|Move cursor|
|`Enter` or number key|Select item|
|`s`|Open settings|
|`i`|Install agents|
|`a`|Add endpoint (in endpoints menu)|
|`d` or `Delete`|Delete endpoint (in endpoints menu)|
|`Esc`|Go back|
|`q`|Quit|
|`Ctrl+C`|Quit from any screen|
## [Persistent state](#persistent-state)
The launcher stores settings and state in the OS default configuration directory under `aperture/`:
* **macOS**: `\~/Library/Application Support/aperture/`
* **Linux**: `\~/.config/aperture/`
|File|Purpose|
|`settings.json`|Aperture endpoint URLs and full-auto mode preference|
|`launcher.json`|Last-used agent and provider type combination|
The launcher creates these files automatically on first use.
## [Troubleshoot the launcher](#troubleshoot-the-launcher)
If the launcher doesn't behave as expected, check the following common issues. For general Aperture issues, refer to [Troubleshooting Aperture](/docs/aperture/troubleshooting).
### [Aperture host unreachable](#aperture-host-unreachable)
If the launcher can't connect to the Aperture host during the preflight check:
* Verify the Aperture proxy is running and accessible from your device.
* Confirm the host URL is correct.
* Check your network connection, firewall rules, and tailnet policy file rules.
The launcher prompts you to enter a different URL if the configured host is unreachable.
### [Agent binary not found](#agent-binary-not-found)
If a coding agent doesn't appear in the main menu:
* Verify the agent binary is installed by running `which \<binary-name\>` (for example, `which claude`).
* Confirm the binary is in your `$PATH`, or in one of the directories the launcher checks: `\~/.local/bin`, `\~/bin`, or `\~/.npm-global/bin`. The launcher finds binaries in system directories such as `/usr/local/bin` or `/opt/homebrew/bin` through your `$PATH`.
* Press `i` from the main menu to access install commands for each agent.
### [No compatible provider types available](#no-compatible-provider-types-available)
If a coding agent appears but offers no provider type options:
* Verify that your Aperture proxy has providers configured with the API types the agent requires. For example, Claude Code requires at least one provider with Anthropic Messages API, Bedrock Model Invoke, or Google Vertex Raw Predict compatibility.
* Check the [Aperture dashboard](/docs/aperture/reference/dashboard) to confirm provider configuration.
### [Agent exits immediately](#agent-exits-immediately)
If a coding agent launches but exits immediately:
* Run the launcher with the `-debug` flag to display the environment variables the launcher sets before launch:
```
`aperture -debug
`
```
* Check the agent's own logs for error messages.
* Verify the Aperture proxy forwards requests correctly for the selected provider type.
### [Conflicting environment variables in Claude Code settings](#conflicting-environment-variables-in-claude-code-settings)
If the launcher reports conflicting environment variables when launching Claude Code:
* Open `\~/.claude/settings.json` and check the `env` section.
* Remove any variables that the launcher manages automatically, such as `ANTHROPIC\_BASE\_URL`, `CLAUDE\_CODE\_USE\_BEDROCK`, or `CLAUDE\_CODE\_SKIP\_BEDROCK\_AUTH`.
* The launcher sets these variables for you based on the selected provider type.
## [Command-line reference](#command-line-reference)
The launcher accepts the following flags:
|Flag|Default|Description|
|`-version`|`false`|Print version and exit|
|`-debug`|`false`|Display environment variables before launching an agent|
On this page
* [Prerequisites](#prerequisites)
* [Install the launcher](#install-the-launcher)
* [Connect to Aperture](#connect-to-aperture)
* [Manage multiple endpoints](#manage-multiple-endpoints)
* [Launch a coding agent](#launch-a-coding-agent)
* [Select an agent](#select-an-agent)
* [Select a provider type](#select-a-provider-type)
* [Automatic selection](#automatic-selection)
* [What happens at launch](#what-happens-at-launch)
* [Supported agents](#supported-agents)
* [Claude Code](#claude-code)
* [Gemini CLI](#gemini-cli)
* [OpenCode](#opencode)
* [OpenAI Codex](#openai-codex)
* [Configure settings](#configure-settings)
* [Manage Aperture endpoints](#manage-aperture-endpoints)
* [Full-auto mode](#full-auto-mode)
* [Install and uninstall agents](#install-and-uninstall-agents)
* [Keyboard shortcuts](#keyboard-shortcuts)
* [Persistent state](#persistent-state)
* [Troubleshoot the launcher](#troubleshoot-the-launcher)
* [Aperture host unreachable](#aperture-host-unreachable)
* [Agent binary not found](#agent-binary-not-found)
* [No compatible provider types available](#no-compatible-provider-types-available)
* [Agent exits immediately](#agent-exits-immediately)
* [Conflicting environment variables in Claude Code settings](#conflicting-environment-variables-in-claude-code-settings)
* [Command-line reference](#command-line-reference)
Scroll to top