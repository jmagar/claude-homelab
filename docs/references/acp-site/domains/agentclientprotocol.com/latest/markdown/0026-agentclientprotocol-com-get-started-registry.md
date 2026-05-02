ACP Registry - Agent Client Protocol
[Protocol
](/get-started/introduction)[RFDs
](/rfds/about)[Community
](/community/communication)[Publications
](/publications)[Updates
](/updates)[Brand
](/brand)
## > Documentation Index
> Fetch the complete documentation index at:
[> https://agentclientprotocol.com/llms.txt
](https://agentclientprotocol.com/llms.txt)
> Use this file to discover all available pages before exploring further.
##
[​
](#overview)
Overview
The ACP Registry is an easy way for developers to distribute their ACP-compatible agents to any client that speaks the protocol.
This is a curated set of agents, including only the ones that [support authentication](/rfds/auth-methods).
Visit [the registry repository on GitHub](https://github.com/agentclientprotocol/registry) to learn more about it.
##
[​
](#available-agents)
Available Agents
## Agoragentic
Agent marketplace with 174+ AI capabilities. Browse, invoke, and pay for agent services settled in USDC on Base L2.**1.3.0**, [](https://github.com/rhein1/agoragentic-integrations)
## Amp
ACP wrapper for Amp - the frontier coding agent**0.7.0**, [](https://github.com/tao12345666333/amp-acp)
## Auggie CLI
Augment Code’s powerful software agent, backed by industry-leading context engine**0.24.0**, [](https://github.com/augmentcode/auggie)
## Autohand Code
Autohand Code - AI coding agent powered by Autohand AI**0.2.1**, [](https://github.com/autohandai/autohand-acp)
## Claude Agent
ACP wrapper for Anthropic’s Claude**0.31.4**, [](https://github.com/agentclientprotocol/claude-agent-acp)
## Cline
Autonomous coding agent CLI - capable of creating/editing files, running commands, using the browser, and more**2.17.0**, [](https://github.com/cline/cline)
## Codebuddy Code
Tencent Cloud’s official intelligent coding tool**2.94.3**
## Codex CLI
ACP adapter for OpenAI’s coding assistant**0.12.0**, [](https://github.com/zed-industries/codex-acp)
## Corust Agent
Co-building with a seasoned Rust partner.**0.5.1**, [](https://github.com/Corust-ai/corust-agent-release)
## crow-cli
Minimal ACP Native Coding Agent**0.1.20**, [](https://github.com/crow-cli/crow-cli)
## Cursor
Cursor’s coding agent**2026.03.30**
## DeepAgents
Batteries-included AI coding and general purpose agent powered by LangChain.**0.1.7**, [](https://github.com/langchain-ai/deepagentsjs)
## DimCode
A coding agent that puts leading models at your command.**0.0.51**
## Dirac
Reduces API costs by more than 50%, produces better and faster work. Uses Hash anchored parallel edits, AST manipulation and a whole lot of neat optimizations. Fully Open Source.**0.3.4**, [](https://github.com/dirac-run/dirac)
## Factory Droid
Factory Droid - AI coding agent powered by Factory AI**0.112.0**
## fast-agent
Code and build agents with comprehensive multi-provider support**0.6.25**, [](https://github.com/evalstate/fast-agent)
## Gemini CLI
Google’s official CLI for Gemini**0.40.0**, [](https://github.com/google-gemini/gemini-cli)
## GitHub Copilot
GitHub’s AI pair programmer**1.0.39**, [](https://github.com/github/copilot-cli)
## GLM Agent
ACP agent powered by Zhipu AI’s GLM Coding Plan models (glm-5.1, glm-5-turbo, glm-4.7, glm-4.5-air). Supports streaming, tool calls, mid-session model switching, image input via Z.AI Coding Plan Vision MCP, and session load/fork/resume with on-disk persistence.**1.0.0**, [](https://github.com/stefandevo/glm-acp-agent)
## goose
A local, extensible, open source AI agent that automates engineering tasks**1.33.1**, [](https://github.com/block/goose)
## Junie
AI Coding Agent by JetBrains**1468.30.0**, [](https://github.com/JetBrains/junie)
## Kilo
The open source coding agent**7.2.25**, [](https://github.com/Kilo-Org/kilocode)
## Kimi CLI
Moonshot AI’s coding assistant**1.40.0**, [](https://github.com/MoonshotAI/kimi-cli)
## Minion Code
An enhanced AI code assistant built on the Minion framework with rich development tools**0.1.44**, [](https://github.com/femto/minion-code)
## Mistral Vibe
Mistral’s open-source coding assistant**2.9.0**, [](https://github.com/mistralai/mistral-vibe)
## Nova
Nova by Compass AI - a fully-fledged software engineer at your command**1.1.1**, [](https://github.com/Compass-Agentic-Platform/nova)
## OpenCode
The open source coding agent**1.14.29**, [](https://github.com/anomalyco/opencode)
## pi ACP
ACP adapter for pi coding agent**0.0.26**, [](https://github.com/svkozak/pi-acp)
## Poolside
Poolside’s coding agent**1.0.0**
## Qoder CLI
AI coding assistant with agentic capabilities**0.2.4**
## Qwen Code
Alibaba’s Qwen coding assistant**0.15.5**, [](https://github.com/QwenLM/qwen-code)
## Snowflake Cortex Code
Snowflake’s Cortex Code coding agent**1.0.58**, [](https://docs.snowflake.com/en/user-guide/cortex-code/cortex-code)
## Stakpak
Open-source DevOps agent in Rust with enterprise-grade security**0.3.78**, [](https://github.com/stakpak/agent)
## VT Code
An open-source coding agent with LLM-native code understanding and robust shell safety. Supports multiple LLM providers with automatic failover and efficient context management.**0.96.14**, [](https://github.com/vinhnx/VTCode)
##
[​
](#using-the-registry)
Using the Registry
Clients can fetch the registry programmatically:
```
`curl https://cdn.agentclientprotocol.com/registry/v1/latest/registry.json
`
```
The registry JSON contains all agent metadata including distribution information for automatic installation.
##
[​
](#submit-your-agent)
Submit your Agent
To add your agent to the registry:
1. Fork the [registry repository on GitHub](https://github.com/agentclientprotocol/registry)
2. Create a folder with your agent’s ID (lowercase, hyphens allowed)
3. Add an `agent.json` file following [the schema](https://github.com/agentclientprotocol/registry/blob/main/agent.schema.json)
4. Optionally add an `icon.svg` (16x16 recommended)
5. Submit a pull request
See the [contributing guide](https://github.com/agentclientprotocol/registry/blob/main/CONTRIBUTING.md) for details.