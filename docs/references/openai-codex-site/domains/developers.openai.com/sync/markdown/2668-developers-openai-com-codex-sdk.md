SDK – Codex | OpenAI Developers
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
If you use Codex through the Codex CLI, the IDE extension, or Codex Web, you can also control it programmatically.
Use the SDK when you need to:
* Control Codex as part of your CI/CD pipeline
* Create your own agent that can engage with Codex to perform complex engineering tasks
* Build Codex into your own internal tools and workflows
* Integrate Codex within your own application
## TypeScript library
The TypeScript library provides a way to control Codex from within your application that’s more comprehensive and flexible than non-interactive mode.
Use the library server-side; it requires Node.js 18 or later.
### Installation
To get started, install the Codex SDK using `npm`:
```
`npm install @openai/codex-sdk`
```
### Usage
Start a thread with Codex and run it with your prompt.
```
`import { Codex } from "@openai/codex-sdk";
const codex = new Codex();
const thread = codex.startThread();
const result = await thread.run(
"Make a plan to diagnose and fix the CI failures"
);
console.log(result);`
```
Call `run()` again to continue on the same thread, or resume a past thread by providing a thread ID.
```
`// running the same thread
const result = await thread.run("Implement the plan");
console.log(result);
// resuming past thread
const threadId = "\<thread-id\>";
const thread2 = codex.resumeThread(threadId);
const result2 = await thread2.run("Pick up where you left off");
console.log(result2);`
```
For more details, check out the [TypeScript repo](https://github.com/openai/codex/tree/main/sdk/typescript).
## Python library
The Python SDK is experimental and controls the local Codex app-server over JSON-RPC. It requires Python 3.10 or later and a local checkout of the open-source Codex repo.
### Installation
From the Codex repo root, install the SDK in editable mode:
```
`cd sdk/python
python -m pip install -e .`
```
For manual local SDK usage, pass `AppServerConfig(codex\_bin=...)` to point at a local `codex` binary, or use the repo examples and notebook bootstrap.
### Usage
Start Codex, create a thread, and run a prompt:
```
`from codex\_app\_server import Codex
with Codex() as codex:
thread = codex.thread\_start(model="gpt-5.4")
result = thread.run("Make a plan to diagnose and fix the CI failures")
print(result.final\_response)`
```
Use `AsyncCodex` when your application is already asynchronous:
```
`import asyncio
from codex\_app\_server import AsyncCodex
async def main() -\> None:
async with AsyncCodex() as codex:
thread = await codex.thread\_start(model="gpt-5.4")
result = await thread.run("Implement the plan")
print(result.final\_response)
asyncio.run(main())`
```
For more details, check out the [Python repo](https://github.com/openai/codex/tree/main/sdk/python).