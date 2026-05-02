MCP server proxying · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# MCP server proxying
Last validated: Mar 30, 2026
Aperture MCP server proxying is currently [in alpha](/docs/reference/tailscale-release-stages#alpha).
Aperture can aggregate tools and resources from multiple remote [Model Context Protocol](https://modelcontextprotocol.io/specification) (MCP) servers and expose them to AI agents through a single `/v1/mcp` endpoint. This lets you centralize MCP tool management behind your Aperture proxy with the same identity-based access control used for LLM providers.
Aperture acts as an MCP server when communicating with AI agent clients and as an MCP client when communicating with remote MCP servers. Clients connect to Aperture's `/v1/mcp` endpoint and access an aggregated view of all tools and resources from every configured remote server.
## [Use cases](#use-cases)
MCP server proxying addresses the following use cases:
* **Centralized tool access**: Aggregate tools from multiple MCP servers behind a single endpoint. AI agents connect to one URL instead of managing connections to each server individually.
* **Identity-based access control**: Control which users can access which MCP tools and resources using the same Tailscale identity and grants system used for LLM providers.
* **Dynamic tool discovery**: Register and unregister MCP servers at runtime. When a server comes online, its tools become available automatically. When it goes offline, Aperture removes its tools.
* **Protocol compatibility**: Connect MCP servers that use different protocol versions. Aperture auto-detects whether each server supports Streamable HTTP or legacy SSE and handles the translation.
## [Key MCP concepts](#key-mcp-concepts)
The [Model Context Protocol](https://modelcontextprotocol.io/specification) defines a standard way for AI agents to discover and use external capabilities. The following concepts are relevant to configuring MCP in Aperture:
* **Tools**: Functions that LLMs can discover and call, such as searching a database or running a command.
* **Resources**: Contextual data identified by URI that LLMs can read, such as file contents or API responses.
* **Streamable HTTP**: The current MCP transport protocol that uses a single HTTP endpoint for bidirectional communication.
* **Legacy SSE**: The deprecated MCP transport that uses Server-Sent Events. Aperture supports both transports for backward compatibility.
## [Prerequisites](#prerequisites)
Before you can use MCP server proxying, you need the following:
* Aperture enabled on your [tailnet](/docs/concepts/tailnet). Refer to [get started with Aperture](/docs/aperture#get-started) if you have not set this up.
* At least one remote MCP server accessible from the Aperture host (in the tailnet or on localhost).
* The URL of each MCP server's endpoint (for example, `http://localhost:8185/v1/mcp` or `http://mcp-server.example.ts.net:8080/v1/mcp`).
## [Get started](#get-started)
To configure MCP server proxying in Aperture, add remote servers, grant users access to MCP tools, and connect an MCP client.
### [Step 1: Configure MCP servers](#step-1-configure-mcp-servers)
Open the **Settings** page of the Aperture dashboard and add an `mcp` section to your configuration with one or more remote servers.
```
`{
"mcp": {
"servers": {
"local": {
"url": "http://localhost:8185/v1/mcp"
},
"remote": {
"url": "http://mcp-server.example.ts.net:8080/v1/mcp"
}
}
}
}
`
```
Each key in the `servers` map is a server ID that Aperture uses as a name prefix. For the configuration above:
* Tools from the `local` server are prefixed with `local\_` (for example, a tool named `search` becomes `local\_search`).
* Tools from the `remote` server are prefixed with `remote\_` (for example, `get\_user` becomes `remote\_get\_user`).
* Resources use a hyphen instead of an underscore (for example, `local-files://readme.md`).
Name prefixing prevents collisions when multiple servers expose tools with the same name. Clients receive the prefixed names and Aperture automatically strips the prefix when forwarding calls to the remote server.
The Aperture host uses its tailnet HTTP client for connections to remote MCP servers, so you can use tailnet hostnames (for example, `http://mcp-server.example.ts.net:8080/v1/mcp`) without additional network configuration.
### [Step 2: Grant access to MCP tools](#step-2-grant-access-to-mcp-tools)
Aperture is deny-by-default. Without MCP grants, users cannot access any MCP capabilities. Add MCP grants in the `grants` section of your configuration.
MCP grants use the same `"server/item"` pattern as model grants, where the first segment is the server ID and the second is the item name. The following example grants all users access to all tools from the `local` server:
```
`{
"grants": [
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{
"mcp\_tools": "local/\*"
}
]
}
}
]
}
`
```
The following table describes the available MCP grant fields:
|Field|Description|Example|
|`mcp\_tools`|Grant access to tools matching the pattern|`"local/\*"` (all tools from `local` server)|
|`mcp\_resources`|Grant access to resources matching the pattern|`"\*\*"` (all resources from all servers)|
You can use `\*` to match any characters within a segment and `\*\*` to match across segments. For example:
* `"local/search"` matches the `search` tool from the `local` server.
* `"local/\*"` matches all tools from the `local` server.
* `"\*/search"` matches the `search` tool from any server.
* `"\*\*"` matches all items from all servers.
Aperture checks grants when clients list available tools and resources. Users only access the items they have permission for.
Refer to the [grants configuration reference](/docs/aperture/configuration#grants) for the full grants syntax.
### [Step 3: Connect an MCP client](#step-3-connect-an-mcp-client)
Configure your MCP client (the AI agent host) to use the Aperture URL as the MCP server endpoint. For example, in an MCP client configuration file:
```
`{
"mcpServers": {
"aperture": {
"url": "http://\<aperture-hostname\>/v1/mcp"
}
}
}
`
```
Replace `\<aperture-hostname\>` with the [MagicDNS](/docs/features/magicdns) name of your Aperture instance.
Aperture automatically detects whether the client uses Streamable HTTP (the current MCP protocol) or legacy SSE and responds with the appropriate transport.
### [Step 4: Verify the connection](#step-4-verify-the-connection)
Connect your MCP client to `http://\<aperture-hostname\>/v1/mcp` and list available tools. The tool list should include prefixed names from all configured servers (for example, `local\_search`, `remote\_get\_user`).
## [Built-in tools](#built-in-tools)
Aperture registers a built-in `internal\_current\_time` tool that returns the current date and time. This tool appears in `tools/list` responses alongside tools from configured remote servers. To grant access to it, use a grant pattern that matches the `internal` server, such as `"internal/\*"`.
## [Common scenarios](#common-scenarios)
The following sections describe common tasks related to MCP server proxying.
### [Enable dynamic registration](#enable-dynamic-registration)
Dynamic registration lets MCP servers register themselves with Aperture at runtime instead of being configured statically. Set `accept\_registrations` to `true` in the `mcp` section.
```
`{
"mcp": {
"accept\_registrations": true,
"servers": {}
}
}
`
```
When dynamic registration is enabled, remote servers register by sending a POST request to `/v1/mcp/register` with a JSON body containing their URL:
```
`curl -X POST http://\<aperture-hostname\>/v1/mcp/register \\
-H "Content-Type: application/json" \\
-d '{"url": "http://my-mcp-server:8080/v1/mcp"}'
`
```
Aperture performs an initial capability fetch from the registering server, then responds with HTTP 200 and begins polling the server for capability changes. Each dynamically registered server receives a sequential ID (`auto1`, `auto2`, and so on) and its tools are prefixed accordingly (for example, `auto1\_search`).
The registration endpoint requires Tailscale authentication, the same as all other Aperture endpoints. The registering server must be accessible through the tailnet.
The registering server must keep the HTTP connection to `/v1/mcp/register` open. Aperture sends keepalive messages on this connection every second. When the server closes the connection, Aperture automatically unregisters all of its tools and resources.
You can combine static servers and dynamic registration in the same configuration. Static servers are always available, while dynamically registered servers come and go as they connect and disconnect.
## [MCP configuration reference](#mcp-configuration-reference)
Refer to the [Aperture configuration reference](/docs/aperture/configuration#mcp) for the full `mcp` configuration syntax. The following sections describe how Aperture handles transport detection and server availability.
### [Transport auto-detection](#transport-auto-detection)
Aperture automatically detects whether each remote MCP server supports Streamable HTTP (the current protocol) or legacy SSE. When connecting to a remote server, Aperture tries Streamable HTTP first and falls back to SSE if the server does not support it. Remote servers can be upgraded to a later protocol version without restarting Aperture.
The same auto-detection applies to clients connecting to Aperture's `/v1/mcp` endpoint. Aperture serves both Streamable HTTP and legacy SSE clients.
### [Capability polling](#capability-polling)
Aperture polls each configured remote MCP server every 5 seconds to detect capability changes. When a remote server adds or removes tools or resources, Aperture automatically updates the registrations, making the changes visible to connected clients.
If a remote server becomes unavailable, Aperture unregisters all of its tools and resources until the server recovers. Polling continues in the background, and Aperture re-registers capabilities when the server comes back online.
## [Limitations](#limitations)
MCP server proxying has the following limitations:
* **Experimental feature**: The MCP configuration syntax and grants format might change in future releases.
* **Polling-based discovery**: Aperture detects remote server capability changes through polling (every 5 seconds), not push notifications. There is a brief delay between a remote server adding a tool and that tool becoming available to clients.
* **No per-tool authorization on calls**: Grants control which tools appear in the tool list. There is no separate authorization check at tool call time. A user who knows a tool's prefixed name can call it even without a matching grant, because grant enforcement applies to listing, not calling.
## [Troubleshooting](#troubleshooting)
Use the following sections to diagnose and resolve common issues with MCP server configuration.
### [MCP tools do not appear](#mcp-tools-do-not-appear)
If tools from a configured MCP server are not visible:
1. Verify the URL in your configuration is correct and the MCP server is running.
2. Check that the MCP server is reachable from the Aperture host. Test with `curl -v \<your-mcp-server-url\>` from the Aperture host.
3. Verify your grants include `mcp\_tools` patterns that match the server and tool names. Without grants, users cannot access any MCP tools.
### [Connection refused or host not found](#connection-refused-or-host-not-found)
These errors indicate the MCP server URL is unreachable.
* **Connection refused**: The server is not running or is not listening on the configured port.
* **Host not found**: The hostname cannot be resolved. For tailnet hostnames, verify the MCP server device is connected to the tailnet and check with `tailscale status`.
### [Tools appear and then disappear](#tools-appear-and-then-disappear)
If tools are briefly visible and then become unavailable, the remote MCP server is likely crashing or restarting. Aperture automatically unregisters tools when a remote server becomes unreachable and re-registers them when the server recovers.
### [Dynamic registration fails](#dynamic-registration-fails)
If remote servers cannot register dynamically:
1. Verify `accept\_registrations` is set to `true` in your `mcp` configuration.
2. Ensure the remote server sends a valid POST request to `/v1/mcp/register` with a JSON body containing `{"url": "\<mcp-server-url\>"}`.
3. The remote server must keep the HTTP connection open after registration. If the connection closes, Aperture unregisters the server's tools immediately.
### [Tool calls time out](#tool-calls-time-out)
If tool calls fail with timeout errors, the remote MCP server is taking too long to respond. Aperture retries tool calls once on connection errors. Check the remote server's performance and ensure it can respond within a reasonable time.
On this page
* [Use cases](#use-cases)
* [Key MCP concepts](#key-mcp-concepts)
* [Prerequisites](#prerequisites)
* [Get started](#get-started)
* [Step 1: Configure MCP servers](#step-1-configure-mcp-servers)
* [Step 2: Grant access to MCP tools](#step-2-grant-access-to-mcp-tools)
* [Step 3: Connect an MCP client](#step-3-connect-an-mcp-client)
* [Step 4: Verify the connection](#step-4-verify-the-connection)
* [Built-in tools](#built-in-tools)
* [Common scenarios](#common-scenarios)
* [Enable dynamic registration](#enable-dynamic-registration)
* [MCP configuration reference](#mcp-configuration-reference)
* [Transport auto-detection](#transport-auto-detection)
* [Capability polling](#capability-polling)
* [Limitations](#limitations)
* [Troubleshooting](#troubleshooting)
* [MCP tools do not appear](#mcp-tools-do-not-appear)
* [Connection refused or host not found](#connection-refused-or-host-not-found)
* [Tools appear and then disappear](#tools-appear-and-then-disappear)
* [Dynamic registration fails](#dynamic-registration-fails)
* [Tool calls time out](#tool-calls-time-out)
Scroll to top