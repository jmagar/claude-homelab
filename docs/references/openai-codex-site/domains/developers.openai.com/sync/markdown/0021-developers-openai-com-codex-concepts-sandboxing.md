Sandbox – Codex | OpenAI Developers
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
The sandbox is the boundary that lets Codex act autonomously without giving it
unrestricted access to your machine. When Codex runs local commands in the
**Codex app**, **IDE extension**, or **CLI**, those commands run inside a
constrained environment instead of running with full access by default.
That environment defines what Codex can do on its own, such as which files it
can modify and whether commands can use the network. When a task stays inside
those boundaries, Codex can keep moving without stopping for confirmation. When
it needs to go beyond them, Codex falls back to the approval flow.
Sandboxing and approvals are different controls that work together. The
sandbox defines technical boundaries. The approval policy decides when Codex
must stop and ask before crossing them.
## What the sandbox does
The sandbox applies to spawned commands, not just to Codex’s built-in file
operations. If Codex runs tools like `git`, package managers, or test runners,
those commands inherit the same sandbox boundaries.
Codex uses platform-native enforcement on each OS. The implementation differs
between macOS, Linux, WSL2, and native Windows, but the idea is the same across
surfaces: give the agent a bounded place to work so routine tasks can run
autonomously inside clear limits.
## Why it matters
The sandbox reduces approval fatigue. Instead of asking you to confirm every
low-risk command, Codex can read files, make edits, and run routine project
commands within the boundary you already approved.
It also gives you a clearer trust model for agentic work. You aren’t just
trusting the agent’s intentions; you are trusting that the agent is operating
inside enforced limits. That makes it easier to let Codex work independently
while still knowing when it will stop and ask for help.
## Getting started
Codex applies sandboxing automatically when you use the default permissions
mode.
### Prerequisites
On **macOS**, sandboxing works out of the box using the built-in Seatbelt
framework.
On **Windows**, Codex uses the native [Windows
sandbox](/codex/windows#windows-sandbox) when you run in PowerShell and the
Linux sandbox implementation when you run in WSL2.
On **Linux and WSL2**, install `bubblewrap` with your package manager first:
Choose an option
Ubuntu/DebianFedora
```
`sudo apt install bubblewrap`
```
Codex uses the first `bwrap` executable it finds on `PATH`. If no `bwrap`
executable is available, Codex falls back to a bundled helper, but that helper
requires support for unprivileged user namespace creation. Installing the
distribution package that provides `bwrap` keeps this setup reliable.
Codex surfaces a startup warning when `bwrap` is missing or when the helper
can’t create the needed user namespace. On distributions that restrict this
AppArmor setting, prefer loading the `bwrap` AppArmor profile so `bwrap` can
keep working without disabling the restriction globally.
**Ubuntu AppArmor note:** On Ubuntu 25.04, installing `bubblewrap` from
Ubuntu’s package repository should work without extra AppArmor setup. The
`bwrap-userns-restrict` profile ships in the `apparmor` package at
`/etc/apparmor.d/bwrap-userns-restrict`.
On Ubuntu 24.04, Codex may still warn that it can’t create the needed user
namespace after `bubblewrap` is installed. Copy and load the extra profile:
```
`sudo apt update
sudo apt install apparmor-profiles apparmor-utils
sudo install -m 0644 \\
/usr/share/apparmor/extra-profiles/bwrap-userns-restrict \\
/etc/apparmor.d/bwrap-userns-restrict
sudo apparmor\_parser -r /etc/apparmor.d/bwrap-userns-restrict`
```
`apparmor\_parser -r` loads the profile into the kernel without a reboot. You
can also reload all AppArmor profiles:
```
`sudo systemctl reload apparmor.service`
```
If that profile is unavailable or does not resolve the issue, you can disable
the AppArmor unprivileged user namespace restriction with:
```
`sudo sysctl -w kernel.apparmor\_restrict\_unprivileged\_userns=0`
```
## How you control it
Most people start with the permissions controls in the product.
In the Codex app and IDE, you choose a mode from the permissions selector under
the composer or chat input. That selector lets you rely on Codex’s default
permissions, switch to full access, or use your custom configuration.
In the CLI, use [`/permissions`](/codex/cli/slash-commands#update-permissions-with-permissions)
to switch modes during a session.
## Configure defaults
If you want Codex to start with the same behavior every time, use a custom
configuration. Codex stores those defaults in `config.toml`, its local settings
file. [Config basics](/codex/config-basic) explains how it works, and the
[Configuration reference](/codex/config-reference) documents the exact keys for
`sandbox\_mode`, `approval\_policy`, and
`sandbox\_workspace\_write.writable\_roots`. Use those settings to decide how much
autonomy Codex gets by default, which directories it can write to, and when it
should pause for approval.
At a high level, the common sandbox modes are:
* `read-only`: Codex can inspect files, but it can’t edit files or run
commands without approval.
* `workspace-write`: Codex can read files, edit within the workspace, and run
routine local commands inside that boundary. This is the default low-friction
mode for local work.
* `danger-full-access`: Codex runs without sandbox restrictions. This removes
the filesystem and network boundaries and should be used only when you want
Codex to act with full access.
The common approval policies are:
* `untrusted`: Codex asks before running commands that aren’t in its trusted
set.
* `on-request`: Codex works inside the sandbox by default and asks when it
needs to go beyond that boundary.
* `never`: Codex doesn’t stop for approval prompts.
Full access means using `sandbox\_mode = "danger-full-access"` together with
`approval\_policy = "never"`. By contrast, the lower-risk local automation
preset is `sandbox\_mode = "workspace-write"` together with
`approval\_policy = "on-request"`, or the matching CLI flags
`--sandbox workspace-write --ask-for-approval on-request`.
If you need Codex to work across more than one directory, writable roots let
you extend the places it can modify without removing the sandbox entirely. If
you need a broader or narrower trust boundary, adjust the default sandbox mode
and approval policy instead of relying on one-off exceptions.
For reusable permission sets, set `default\_permissions` to a named profile and
define `[permissions.\<name\>.filesystem]` or `[permissions.\<name\>.network]`.
Managed network profiles use map tables such as
`[permissions.\<name\>.network.domains]` and
`[permissions.\<name\>.network.unix\_sockets]` for domain and socket rules.
Filesystem profiles can also deny reads for exact paths or glob patterns by
setting matching entries to `"none"`; use this to keep files such as local
secrets unreadable without turning off workspace writes.
When a workflow needs a specific exception, use [rules](/codex/rules). Rules
let you allow, prompt, or forbid command prefixes outside the sandbox, which is
often a better fit than broadly expanding access. For a higher-level overview
of approvals and sandbox behavior in the app, see
[Codex app features](/codex/app/features#approvals-and-sandboxing), and for the
IDE-specific settings entry points, see [Codex IDE extension settings](/codex/ide/settings).
Automatic review, when available, doesn’t change the sandbox boundary. It
reviews approval requests, such as sandbox escalations or network access, while
actions already allowed inside the sandbox run without extra review. See
[Automatic approval reviews](/codex/agent-approvals-security#automatic-approval-reviews)
for the policy behavior.
Platform details live in the platform-specific docs. For native Windows setup,
behavior, and troubleshooting, see [Windows](/codex/windows). For admin
requirements and organization-level constraints on sandboxing and approvals, see
[Agent approvals & security](/codex/agent-approvals-security).