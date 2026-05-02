Example Servers - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
This page showcases various Model Context Protocol (MCP) servers that demonstrate the protocol’s capabilities and versatility. These servers enable Large Language Models (LLMs) to securely access tools and data sources.
##
[​
](#reference-implementations)
Reference implementations
These official reference servers demonstrate core MCP features and SDK usage:
###
[​
](#current-reference-servers)
Current reference servers
* **[Everything](https://github.com/modelcontextprotocol/servers/tree/main/src/everything)** - Reference / test server with prompts, resources, and tools
* **[Fetch](https://github.com/modelcontextprotocol/servers/tree/main/src/fetch)** - Web content fetching and conversion for efficient LLM usage
* **[Filesystem](https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem)** - Secure file operations with configurable access controls
* **[Git](https://github.com/modelcontextprotocol/servers/tree/main/src/git)** - Tools to read, search, and manipulate Git repositories
* **[Memory](https://github.com/modelcontextprotocol/servers/tree/main/src/memory)** - Knowledge graph-based persistent memory system
* **[Sequential Thinking](https://github.com/modelcontextprotocol/servers/tree/main/src/sequentialthinking)** - Dynamic and reflective problem-solving through thought sequences
* **[Time](https://github.com/modelcontextprotocol/servers/tree/main/src/time)** - Time and timezone conversion capabilities
###
[​
](#additional-example-servers-archived)
Additional example servers (archived)
Visit the [servers-archived repository](https://github.com/modelcontextprotocol/servers-archived) to get access to archived example servers that are no longer actively maintained.
They are provided for historical reference only.
##
[​
](#official-integrations)
Official integrations
Visit the [MCP Servers Repository (Official Integrations section)](https://github.com/modelcontextprotocol/servers?tab=readme-ov-file#️-official-integrations) for a list of MCP servers maintained by companies for their platforms.
##
[​
](#community-implementations)
Community implementations
Visit the [MCP Servers Repository (Community section)](https://github.com/modelcontextprotocol/servers?tab=readme-ov-file#-community-servers) for a list of MCP servers maintained by community members.
##
[​
](#getting-started)
Getting started
###
[​
](#using-reference-servers)
Using reference servers
TypeScript-based servers can be used directly with `npx`:
```
`npx -y @modelcontextprotocol/server-memory
`
```
Python-based servers can be used with `uvx` (recommended) or `pip`:
```
`# Using uvx
uvx mcp-server-git
# Using pip
pip install mcp-server-git
python -m mcp\_server\_git
`
```
###
[​
](#configuring-with-claude)
Configuring with Claude
To use an MCP server with Claude, add it to your configuration:
```
`{
"mcpServers": {
"memory": {
"command": "npx",
"args": ["-y", "@modelcontextprotocol/server-memory"]
},
"filesystem": {
"command": "npx",
"args": [
"-y",
"@modelcontextprotocol/server-filesystem",
"/path/to/allowed/files"
]
},
"github": {
"command": "npx",
"args": ["-y", "@modelcontextprotocol/server-github"],
"env": {
"GITHUB\_PERSONAL\_ACCESS\_TOKEN": "\<YOUR\_TOKEN\>"
}
}
}
}
`
```
##
[​
](#additional-resources)
Additional resources
Visit the [MCP Servers Repository (Resources section)](https://github.com/modelcontextprotocol/servers?tab=readme-ov-file#-resources) for a collection of other resources and projects related to MCP.
Visit our [GitHub Discussions](https://github.com/orgs/modelcontextprotocol/discussions) to engage with the MCP community.