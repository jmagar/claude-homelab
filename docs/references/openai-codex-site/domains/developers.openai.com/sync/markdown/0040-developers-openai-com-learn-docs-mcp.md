Docs MCP | OpenAI Developers
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
[API Dashboard](https://platform.openai.com/login)
Copy Page
OpenAI hosts a public Model Context Protocol (MCP) server for developer documentation on developers.openai.com and platform.openai.com.
**Server URL (streamable HTTP):** `https://developers.openai.com/mcp`
## What it provides
* Read-only access to OpenAI developer documentation (search + page content).
* A way to pull documentation into your agent’s context while you work.
This MCP server is documentation-only. It does not call the OpenAI API on your
behalf.
## Quickstart
Choose an option
CodexVS CodeCursor
You can connect Codex to [MCP servers](/codex/mcp) in the [CLI](/codex/cli) or [IDE extension](/codex/ide). The configuration is shared between both so you only have to set it up once.
Add the server using the Codex CLI:
```
`codex mcp add openaiDeveloperDocs --url https://developers.openai.com/mcp`
```
Verify it’s configured:
```
`codex mcp list`
```
Alternatively, you can add it in `\~/.codex/config.toml` directly:
```
`[mcp\_servers.openaiDeveloperDocs]
url = "https://developers.openai.com/mcp"`
```
To have Codex reliably use the MCP server, add this snippet to your `AGENTS.md`:
```
`Always use the OpenAI developer documentation MCP server if you need to work with the OpenAI API, ChatGPT Apps SDK, Codex,… without me having to explicitly ask.`
```
## Tips
* If you don’t have the snippet in the AGENTS.md file, you need to explicitly tell your agent to consult the Docs MCP server for the answer.
* If you have more than one MCP server, keep server names short and descriptive to aid the agent in selecting the server.
## OpenAI Docs Skill
If you use skills in your AI tooling, pair this MCP server with the
[OpenAI Docs Skill](https://github.com/openai/skills/blob/main/skills/.curated/openai-docs/SKILL.md).
It tells the agent to use Docs MCP tools first for OpenAI questions, then fall back to official OpenAI domains.
1. Install the skill from the [OpenAI skills repository](https://github.com/openai/skills).
2. Confirm you configured this Docs MCP server at `https://developers.openai.com/mcp`.
3. Enable the skill for your project or session in your agent tooling.
4. Ask OpenAI product/API questions and request citations so answers stay traceable to docs sources.