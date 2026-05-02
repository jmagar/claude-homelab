Control model access · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Control model access
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Aperture is deny-by-default. Without grants, users can connect to the Aperture device but cannot access any models. This guide covers how to configure network access to Aperture and set up grants that control which models each user or group can use.
For more information on how Aperture uses Tailscale identity for authentication and access control, refer to [How Aperture works](/docs/aperture/how-aperture-works).
## [Prerequisites](#prerequisites)
Before you begin, ensure you have the following:
* An [Aperture instance](/docs/aperture/get-started) with at least one configured provider.
* [Admin access](/docs/aperture/how-to/set-up-admin-access) to the Aperture dashboard.
* Access to the Tailscale admin console.
## [Step 1: Allow network access to the Aperture device](#step-1-allow-network-access-to-the-aperture-device)
Before users can access models, they need network connectivity to the Aperture device through your tailnet.
1. Sign in to the Tailscale admin console.
2. Go to the [Access controls](https://login.tailscale.com/admin/acls/file) page.
3. Confirm that your access control rules allow users to connect to the Aperture device.
The following example permits all users in `group:ai-users` to connect to the Aperture instance with the hostname `ai`:
```
`{
"groups": {
"group:ai-users": [
"dave@example.com",
"alice@example.com"
]
},
"hosts": {
"ai": "\<aperture-ip-address\>"
},
"grants": [
{
"src": ["group:ai-users"],
"dst": ["ai"],
"ip": ["tcp:80", "tcp:443", "icmp:\*"]
}
]
}
`
```
Replace `\<aperture-ip-address\>` with the Tailscale IP address of your Aperture device.
You can also use [Tailscale tags](/docs/features/tags) to manage access to the Aperture instance. Assign a tag (for example, `tag:ai`) to the Aperture device and use it as the `dst` in your grant rule.
## [Step 2: Configure grants to control model access](#step-2-configure-grants-to-control-model-access)
After users can reach the Aperture device, configure grants to define which models they can access. Open the **Settings** page of the Aperture dashboard and use the **Visual editor** or the **JSON editor**. You can also update grants through the API (`PUT http://\<aperture-hostname\>/api/config`).
The following example grants all users standard user access and allows them to use all Anthropic models:
```
`{
"grants": [
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{ "role": "user" },
{ "models": "anthropic/\*\*" }
]
}
}
]
}
`
```
To restrict access to specific users or groups, replace `"\*"` with individual login names (for example, `"alice@example.com"`) or Tailscale groups (for example, `"group:ai-users"`). Group matching requires the `tailscale.com/visible-groups` [node attribute](/docs/features/node-attributes) on the Aperture device. The following example grants members of `group:ai-users` access to all Anthropic models:
```
`{
"grants": [
{
"src": ["group:ai-users"],
"app": {
"tailscale.com/cap/aperture": [
{ "role": "user" },
{ "models": "anthropic/\*\*" }
]
}
}
]
}
`
```
Each capability entry under `tailscale.com/cap/aperture` has these fields:
* **`role`**: Required. Set to `"user"` for standard access or `"admin"` for administrative access. Without a `role` grant, users receive HTTP 403 responses even if they have model grants.
* **`models`**: A glob pattern that specifies which models the user can access, in `provider/model` format. For example, `"anthropic/\*\*"` matches all Anthropic models, and `"\*\*"` matches all models from all providers.
### [Model pattern examples](#model-pattern-examples)
The following examples show how to use patterns to grant access to specific models:
|Pattern|Matches|
|`"\*\*"`|All models from all providers|
|`"anthropic/\*\*"`|All Anthropic models|
|`"openai/gpt-5"`|Exactly `openai/gpt-5`|
|`"\*/claude-sonnet\*"`|Any `claude-sonnet\*` model from any single provider|
## [Verify access](#verify-access)
After configuring grants, verify that users can access the expected models. Send a test request from a device connected to the tailnet. You can do this with `curl` or any HTTP client. For example:
```
`curl -s http://\<aperture-hostname\>/v1/messages \\
-H "Content-Type: application/json" \\
-d '{
"model": "claude-sonnet-4-6",
"max\_tokens": 25,
"messages": [{"role": "user", "content": "respond with: hello"}]
}'
`
```
If the request returns a successful response, the grant is working. If you receive an HTTP 403 error, check that the user has both a `role` grant and a matching `models` grant. Refer to [Troubleshooting Aperture](/docs/aperture/troubleshooting) for help diagnosing access issues.
## [Next steps](#next-steps)
* [Grant access to MCP tools](/docs/aperture/how-to/grant-mcp-tool-access) to control which MCP tools users can access.
* [Set per-user spending limits](/docs/aperture/how-to/set-per-user-spending-limits) to manage costs.
* [Set up LLM clients](/docs/aperture/use-your-tools) to connect through Aperture.
On this page
* [Prerequisites](#prerequisites)
* [Step 1: Allow network access to the Aperture device](#step-1-allow-network-access-to-the-aperture-device)
* [Step 2: Configure grants to control model access](#step-2-configure-grants-to-control-model-access)
* [Model pattern examples](#model-pattern-examples)
* [Verify access](#verify-access)
* [Next steps](#next-steps)
Scroll to top