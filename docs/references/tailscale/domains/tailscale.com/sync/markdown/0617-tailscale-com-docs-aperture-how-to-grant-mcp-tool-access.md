Grant access to MCP tools · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Grant access to MCP tools
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Aperture's MCP server support is experimental. The MCP grants syntax might change without notice.
When you register MCP servers with Aperture, users can access tools, resources, and templates through the Aperture proxy. Like model access, MCP access is deny-by-default. You need to configure grants that specify which MCP items each user or group can use.
This guide assumes you have already [configured model access grants](/docs/aperture/how-to/grant-model-access). MCP grants use the same structure, with additional capability fields for MCP items.
## [Prerequisites](#prerequisites)
Before you begin, ensure you have the following:
* An [Aperture instance](/docs/aperture/get-started) with at least one configured provider and at least one registered MCP server.
* [Admin access](/docs/aperture/how-to/set-up-admin-access) to the Aperture dashboard.
* Users who already have a `role` grant and network access to the Aperture device. If not, complete [Control model access](/docs/aperture/how-to/grant-model-access) first.
## [Configure MCP access grants](#configure-mcp-access-grants)
Add MCP capability fields to your grants to control which MCP items users can access. You can grant access to three types of MCP items: tools, resources, and templates.
Open the **Settings** page of the Aperture dashboard and add MCP fields to the `tailscale.com/cap/aperture` capability array.
The following example grants users in `group:ai-users` access to all tools from the `local` MCP server and all resources from any server:
```
`{
"grants": [
{
"src": ["group:ai-users"],
"app": {
"tailscale.com/cap/aperture": [
{ "role": "user" },
{ "models": "anthropic/\*\*" },
{ "mcp\_tools": "local/\*" },
{ "mcp\_resources": "\*\*" }
]
}
}
]
}
`
```
### [MCP capability fields](#mcp-capability-fields)
Each capability entry under `tailscale.com/cap/aperture` can include these MCP fields:
|Field|Description|
|`mcp\_tools`|Glob pattern for MCP tools, in `server/tool` format.|
|`mcp\_resources`|Glob pattern for MCP resources, in `server/resource` format.|
|`mcp\_templates`|Glob pattern for MCP resource templates, in `server/template` format.|
Patterns use the same glob syntax as model grants: `\*` matches a single path segment, and `\*\*` matches zero or more segments.
### [Pattern examples](#pattern-examples)
The following examples show how to use patterns to grant access to specific MCP items:
|Pattern|Matches|
|`"local/\*"`|All items from the `local` MCP server|
|`"\*\*"`|All items from all MCP servers|
|`"remote/search"`|Only the `search` tool from the `remote` server|
MCP grant patterns reference MCP server names defined in your [Aperture configuration](/docs/aperture/configuration). If a pattern references an undefined server, Aperture logs a warning.
## [Next steps](#next-steps)
* [Control model access](/docs/aperture/how-to/grant-model-access) to manage which LLM models users can access.
* Refer to the [grants configuration reference](/docs/aperture/configuration#grants) for the full grants syntax.
* [Set per-user spending limits](/docs/aperture/how-to/set-per-user-spending-limits) to manage costs across models and tools.
On this page
* [Prerequisites](#prerequisites)
* [Configure MCP access grants](#configure-mcp-access-grants)
* [MCP capability fields](#mcp-capability-fields)
* [Pattern examples](#pattern-examples)
* [Next steps](#next-steps)
Scroll to top