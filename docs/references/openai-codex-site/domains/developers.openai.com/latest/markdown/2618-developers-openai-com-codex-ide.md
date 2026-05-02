IDE extension – Codex | OpenAI Developers
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
Codex is OpenAI’s coding agent that can read, edit, and run code. It helps you build faster, squash bugs, and understand unfamiliar code. With the Codex VS Code extension, you can use Codex side by side in your IDE or delegate tasks to Codex Cloud.
ChatGPT Plus, Pro, Business, Edu, and Enterprise plans include Codex. Learn more about [what’s included](/codex/pricing).
## Extension setup
The Codex IDE extension works with VS Code forks like Cursor and Windsurf.
You can get the Codex extension from the [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/items?itemName=openai.chatgpt), or download it for your IDE:
* [Download for Visual Studio Code](vscode:extension/openai.chatgpt)
* [Download for Cursor](cursor:extension/openai.chatgpt)
* [Download for Windsurf](windsurf:extension/openai.chatgpt)
* [Download for Visual Studio Code Insiders](https://marketplace.visualstudio.com/items?itemName=openai.chatgpt)
* [Download for JetBrains IDEs](#jetbrains-ide-integration)
Codex IDE integrations for VS Code-compatible editors and JetBrains IDEs are
available on macOS, Windows, and Linux. On Windows, run Codex natively with
the Windows sandbox, or use WSL2 when you need a Linux-native environment. For
setup details, see the [Windows setup guide](/codex/windows).
After you install it, you’ll find Codex in your editor sidebar.
In VS Code, Codex opens in the right sidebar by default.
If you’re using VS Code, restart the editor if you don’t see Codex right away.
If you’re using Cursor, the activity bar displays horizontally by default. Collapsed items can hide Codex, so you can pin it and reorganize the order of the extensions.
## JetBrains IDE integration
If you want to use Codex in JetBrains IDEs like Rider, IntelliJ, PyCharm, or WebStorm, install the JetBrains IDE integration. It supports signing in with ChatGPT, an API key, or a JetBrains AI subscription.
[ Install Codex for JetBrains IDEs ](https://blog.jetbrains.com/ai/2026/01/codex-in-jetbrains-ides/)
### Move Codex to the right sidebar
In VS Code, Codex appears in the right sidebar automatically.
If you prefer it in the primary (left) sidebar, drag the Codex icon back to the left activity bar.
In VS Code forks like Cursor, you may need to move Codex to the right sidebar manually.
To do that, you may need to temporarily change the activity bar orientation first:
1. Open your editor settings and search for `activity bar` (in Workbench settings).
2. Change the orientation to `vertical`.
3. Restart your editor.
Now drag the Codex icon to the right sidebar (for example, next to your Cursor chat). Codex appears as another tab in the sidebar.
After you move it, reset the activity bar orientation to `horizontal` to restore the default behavior.
If you change your mind later, you can drag Codex back to the primary (left) sidebar at any time.
### Sign in
After you install the extension, it prompts you to sign in with your ChatGPT account or API key. Your ChatGPT plan includes usage credits, so you can use Codex without extra setup. Learn more on the [pricing page](/codex/pricing).
### Update the extension
The extension updates automatically, but you can also open the extension page in your IDE to check for updates.
### Set up keyboard shortcuts
Codex includes commands you can bind as keyboard shortcuts in your IDE settings (for example, toggle the Codex chat or add items to the Codex context).
To see all available commands and bind them as keyboard shortcuts, select the settings icon in the Codex chat and select **Keyboard shortcuts**.
You can also refer to the [Codex IDE extension commands](/codex/ide/commands) page.
For a list of supported slash commands, see [Codex IDE extension slash commands](/codex/ide/slash-commands).
If you’re new to Codex, read the [best practices guide](/codex/learn/best-practices).
## Work with the Codex IDE extension
[### Prompt with editor context
Use open files, selections, and `@file` references to get more relevant results with shorter prompts.
](/codex/ide/features#prompting-codex)[### Switch models
Use the default model or switch to other models to leverage their respective strengths.
](/codex/ide/features#switch-between-models)[### Adjust reasoning effort
Choose `low`, `medium`, or `high` to trade off speed and depth based on the task.
](/codex/ide/features#adjust-reasoning-effort)[### Image generation
Generate or edit images without leaving your editor, and use reference assets when you need iteration.
](/codex/ide/features#image-generation)[### Choose an approval mode
Switch between `Chat`, `Agent`, and `Agent (Full Access)` depending on how much autonomy you want Codex to have.
](/codex/ide/features#choose-an-approval-mode)[### Delegate to the cloud
Offload longer jobs to a cloud environment, then monitor progress and review results without leaving your IDE.
](/codex/ide/features#cloud-delegation)[### Follow up on cloud work
Preview cloud changes, ask for follow-ups, and apply the resulting diffs locally to test and finish.
](/codex/ide/features#cloud-task-follow-up)[### IDE extension commands
Browse the full list of commands you can run from the command palette and bind to keyboard shortcuts.
](/codex/ide/commands)[### Slash commands
Use slash commands to control how Codex behaves and quickly change common settings from chat.
](/codex/ide/slash-commands)[### Extension settings
Tune Codex to your workflow with editor settings for models, approvals, and other defaults.
](/codex/ide/settings)