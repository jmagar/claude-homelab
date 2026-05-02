Control AI access · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Control AI access
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Aperture uses [Tailscale's identity layer](/docs/concepts/tailscale-identity) to automatically authenticate users. Control which users can reach the Aperture instance through tailnet access control rules, then use Aperture grants to define which models each user or group can access. Aperture is deny-by-default: without grants, users can connect but cannot access any models.
For background on how identity and grants work, refer to [how Aperture works](/docs/aperture/how-aperture-works).
[
#### Control model access
Configure Aperture grants to control which models each user or group can access.
](/docs/aperture/how-to/grant-model-access)
[
#### Grant access to MCP tools
Configure Aperture grants to control which MCP tools, resources, and templates users can access.
](/docs/aperture/how-to/grant-mcp-tool-access)
[
#### Set up admin access
Configure administrator roles for managing Aperture settings and accessing all user data.
](/docs/aperture/how-to/set-up-admin-access)
Use guardrails to enforce policies on individual requests, such as scrubbing PII or blocking requests that violate compliance rules.
[
#### Guardrails
Inspect, modify, or block LLM requests before they reach the provider.
](/docs/aperture/guardrails)
[
#### Set up a guardrail
Configure a pre-request hook to inspect, modify, or block LLM requests before they reach the provider.
](/docs/aperture/how-to/set-up-guardrails)
Scroll to top