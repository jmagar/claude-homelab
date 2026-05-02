Windows – Codex | OpenAI Developers
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
Use Codex on Windows with the native [Codex app](/codex/app/windows), the
[CLI](/codex/cli), or the [IDE extension](/codex/ide).
The Codex app on Windows supports core workflows such as parallel agent threads,
worktrees, automations, Git functionality, the in-app browser, artifact previews,
plugins, and skills.
[
Use the Codex app on Windows
Work across projects, run parallel agent threads, and review results in one place with the native Windows app.
](/codex/app/windows)
Depending on the surface and your setup, Codex can run on Windows in three
practical ways:
* natively on Windows with the stronger `elevated` sandbox,
* natively on Windows with the fallback `unelevated` sandbox,
* or inside [Windows Subsystem for Linux 2](https://learn.microsoft.com/en-us/windows/wsl/install) (WSL2), which uses the Linux sandbox implementation.
## Windows sandbox
When you run Codex natively on Windows, agent mode uses a Windows sandbox to
block filesystem writes outside the working folder and prevent network access
without your explicit approval.
Native Windows sandbox support includes two modes that you can configure in
`config.toml`:
```
`[windows]
sandbox = "elevated" # or "unelevated"`
```
`elevated` is the preferred native Windows sandbox. It uses dedicated
lower-privilege sandbox users, filesystem permission boundaries, firewall
rules, and local policy changes needed for commands that run in the sandbox.
`unelevated` is the fallback native Windows sandbox. It runs commands with a
restricted Windows token derived from your current user, applies ACL-based
filesystem boundaries, and uses environment-level offline controls instead of
the dedicated offline-user firewall rule. It’s weaker than `elevated`, but it
is still useful when administrator-approved setup is blocked by local or
enterprise policy.
If both modes are available, use `elevated`. If the default native sandbox
doesn’t work in your environment, use `unelevated` as a fallback while you
troubleshoot the setup.
By default, both sandbox modes also use a private desktop for stronger UI
isolation. Set `windows.sandbox\_private\_desktop = false` only if you need the
older `Winsta0\\\\Default` behavior for compatibility.
### Sandbox permissions
Running Codex in full access mode means Codex is not limited to your project
directory and might perform unintentional destructive actions that can lead to
data loss. For safer automation, keep sandbox boundaries in place and use
[rules](/codex/rules) for specific exceptions, or set your [approval policy to
never](/codex/agent-approvals-security#run-without-approval-prompts) to have
Codex attempt to solve problems without asking for escalated permissions,
based on your [approval and security setup](/codex/agent-approvals-security).
### Windows version matrix
|Windows version|Support level|Notes|
|Windows 11|Recommended|Best baseline for Codex on Windows. Use this if you are standardizing an enterprise deployment.|
|Recent, fully updated Windows 10|Best effort|Can work, but is less reliable than Windows 11. For Windows 10, Codex depends on modern console support, including ConPTY. In practice, Windows 10 version 1809 or newer is required.|
|Older Windows 10 builds|Not recommended|More likely to miss required console components such as ConPTY and more likely to fail in enterprise setups.|
Additional environment assumptions:
* `winget` should be available. If it’s missing, update Windows or install
the Windows Package Manager before setting up Codex.
* The recommended native sandbox depends on administrator-approved setup.
* Some enterprise-managed devices block the required setup steps even when the
OS version itself is acceptable.
### Grant sandbox read access
When a command fails because the Windows sandbox can’t read a directory, use:
```
`/sandbox-add-read-dir C:\\absolute\\directory\\path`
```
The path must be an existing absolute directory. After the command succeeds, later commands that run in the sandbox can read that directory during the current session.
Use the native Windows sandbox by default. The native Windows sandbox offers the best performance and highest speeds while keeping the same security. Choose WSL2 when you
need a Linux-native environment on Windows, when your workflow already lives in
WSL2, or when neither native Windows sandbox mode meets your needs.
## Windows Subsystem for Linux
If you choose WSL2, Codex runs inside the Linux environment instead of using the
native Windows sandbox. This is useful if you need Linux-native tooling on
Windows, if your repositories and developer workflow already live in WSL2, or
if neither native Windows sandbox mode works for your environment.
WSL1 was supported through Codex `0.114`. Starting in Codex `0.115`, the Linux
sandbox moved to `bubblewrap`, so WSL1 is no longer supported.
### Launch VS Code from inside WSL
For step-by-step instructions, see the [official VS Code WSL tutorial](https://code.visualstudio.com/docs/remote/wsl-tutorial).
#### Prerequisites
* Windows with WSL installed. To install WSL, open PowerShell as an administrator, then run `wsl --install` (Ubuntu is a common choice).
* VS Code with the [WSL extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) installed.
#### Open VS Code from a WSL terminal
```
`# From your WSL shell
cd \~/code/your-project
code .`
```
This opens a WSL remote window, installs the VS Code Server if needed, and ensures integrated terminals run in Linux.
#### Confirm you’re connected to WSL
* Look for the green status bar that shows `WSL: \<distro\>`.
* Integrated terminals should display Linux paths (such as `/home/...`) instead of `C:\\`.
* You can verify with:
```
`echo $WSL\_DISTRO\_NAME`
```
This prints your distribution name.
If you don’t see “WSL: …” in the status bar, press `Ctrl+Shift+P`, pick
`WSL: Reopen Folder in WSL`, and keep your repository under `/home/...` (not
`C:\\`) for best performance.
If the Windows app or project picker does not show your WSL repository, type
`\\wsl$` into the file picker or Explorer, then navigate to your
distro’s home directory.
### Use Codex CLI with WSL
Run these commands from an elevated PowerShell or Windows Terminal:
```
`# Install default Linux distribution (like Ubuntu)
wsl --install
# Start a shell inside Windows Subsystem for Linux
wsl`
```
Then run these commands from your WSL shell:
```
`# https://learn.microsoft.com/en-us/windows/dev-environment/javascript/nodejs-on-wsl
# Install Node.js in WSL (via nvm)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
# In a new tab or after exiting and running `wsl` again to install Node.js
nvm install 22
# Install and run Codex in WSL
npm i -g @openai/codex
codex`
```
### Working on code inside WSL
* Working in Windows-mounted paths like `/mnt/c/…` can be slower than working in Windows-native paths. Keep your repositories under your Linux home directory (like `\~/code/my-app`) for faster I/O and fewer symlink and permission issues:
```
`mkdir -p \~/code && cd \~/code
git clone https://github.com/your/repo.git
cd repo`
```
* If you need Windows access to files, they’re under `\\wsl$\\Ubuntu\\home&lt;user\>` in Explorer.
## Troubleshooting and FAQ
If you are troubleshooting a managed Windows machine, start with the native
sandbox mode, Windows version, and any policy error shown by Codex. Most native
Windows support issues come from sandbox setup, logon rights, or filesystem
permissions rather than from the editor itself.
My native sandbox setup failed
If Codex cannot complete the `elevated` sandbox setup, the most common causes
are:
* the Windows UAC or administrator prompt was declined,
* the machine does not allow local user or group creation,
* the machine does not allow firewall rule changes,
* the machine blocks the logon rights needed by the sandbox users,
* or another enterprise policy blocks part of the setup flow.
What to try:
1. Try the `elevated` sandbox setup again and approve the administrator prompt
if your environment allows it.
2. If your company laptop blocks this, ask your IT team whether the machine
allows administrator-approved setup for local user/group creation, firewall
configuration, and the required sandbox-user logon rights.
3. If the default setup still fails, use the `unelevated` sandbox so you can
continue working while the issue is investigated.
Codex switched me to the unelevated sandbox
This means Codex could not finish the stronger `elevated` sandbox setup on your
machine.
* Codex can still run in a sandboxed mode.
* It still applies ACL-based filesystem boundaries, but it does not use the
separate sandbox-user boundary from `elevated` and has weaker network
isolation.
* This is a useful fallback, but not the preferred long-term enterprise
configuration.
If you are on a managed enterprise laptop, the best long-term fix is usually to
get the `elevated` sandbox working with help from your IT team.
I see Windows error 1385
If sandboxed commands fail with error `1385`, Windows is denying the logon type
the sandbox user needs in order to start the command.
In practice, this usually means Codex created the sandbox users successfully,
but Windows policy is still preventing those users from launching sandboxed
commands.
What to do:
1. Ask your IT team whether the device policy grants the required logon rights
to the Codex-created sandbox users.
2. Compare group policy or OU differences if the issue affects only some
machines or teams.
3. If you need to keep working immediately, use the `unelevated` sandbox while
the policy issue is investigated.
4. Send `CODEX\_HOME/.sandbox/sandbox.log` along with your Windows version and a
short description of the failure.
Codex warns that some folders are writable by Everyone
Codex may warn that some folders are writable by `Everyone`.
If you see this warning, Windows permissions on those folders are too broad for
the sandbox to fully protect them.
What to do:
1. Review the folders Codex lists in the warning.
2. Remove `Everyone` write access from those folders if that is appropriate in
your environment.
3. Restart Codex or re-run the sandbox setup after those permissions are
corrected.
If you are not sure how to change those permissions, ask your IT team for help.
Sandboxed commands cannot reach the network
Some Codex tasks are intentionally run without outbound network access,
depending on the permissions mode in use.
If a task fails because it cannot reach the network:
1. Check whether the task was supposed to run with network disabled.
2. If you expected network access, restart Codex and try again.
3. If the issue keeps happening, collect the sandbox log so the team can check
whether the machine is in a partial or broken sandbox state.
Sandboxing worked before and then stopped
This can happen after:
* moving a repo or workspace,
* changing machine permissions,
* changing Windows policies,
* or other system configuration changes.
What to try:
1. Restart Codex.
2. Try the `elevated` sandbox setup again.
3. If that does not fix it, use the `unelevated` sandbox as a temporary
fallback.
4. Collect the sandbox log for review.
I need to send diagnostics to OpenAI
If you still have problems, send:
* `CODEX\_HOME/.sandbox/sandbox.log`
It is also helpful to include:
* a short description of what you were trying to do,
* whether the `elevated` sandbox failed or the `unelevated` sandbox was used,
* any error message shown in the app,
* whether you saw `1385` or another Windows or PowerShell error,
* and whether you are on Windows 11 or Windows 10.
Do not send:
* the contents of `CODEX\_HOME/.sandbox-secrets/`
The IDE extension is installed but unresponsive
Your system may be missing C++ development tools, which some native dependencies require:
* Visual Studio Build Tools (C++ workload)
* Microsoft Visual C++ Redistributable (x64)
* With `winget`, run `winget install --id Microsoft.VisualStudio.2022.BuildTools -e`
Then fully restart VS Code after installation.
Large repositories feel slow in WSL
* Make sure you’re not working under `/mnt/c`. Move the repository to WSL (for example, `\~/code/…`).
* Increase memory and CPU for WSL if needed; update WSL to the latest version:
```
`wsl --update
wsl --shutdown`
```
VS Code in WSL cannot find codex
Verify the binary exists and is on PATH inside WSL:
```
`which codex || echo "codex not found"`
```
If the binary isn’t found, install it by [following the instructions](#use-codex-cli-with-wsl) above.