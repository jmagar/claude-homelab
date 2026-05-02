Use OpenAI-compatible tools with Aperture · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Use OpenAI-compatible tools with Aperture
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Configure OpenAI-compatible LLM clients to send requests through [Aperture by Tailscale](/docs/aperture). This guide covers any LLM client that supports a custom API base URL, including Gemini CLI, Roo Code, Cline, and custom applications.
For client-specific instructions, refer to the guides for [Claude Code](/docs/aperture/how-to/use-claude-code), [Codex](/docs/aperture/how-to/use-codex), and [OpenCode](/docs/aperture/how-to/use-opencode).
## [Prerequisites](#prerequisites)
Before you begin, you need:
* An Aperture instance with at least one configured provider, accessible from your device. Refer to [get started with Aperture](/docs/aperture/get-started) if you have not set this up.
* The Aperture host URL accessible from your device. Use `http://`, not `https://`.
To avoid unexpected TLS issues, use `http://` for the Aperture URL when configuring LLM clients. All connections remain encrypted using WireGuard, even when HTTPS is not used.
Aperture routes requests based on the model name, not the LLM client. Any LLM client configured to use Aperture can access any provider your admin has set up. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of supported providers and API formats.
## [Configure the client](#configure-the-client)
In your LLM client's settings, set the API base URL to your Aperture instance and provide a placeholder API key:
* **API Base URL**: `http://\<aperture-hostname\>/v1`
* **API Key**: Leave empty or set to any value (Aperture ignores client-provided keys and injects credentials automatically)
The exact setting names vary by client. Look for fields labeled "API Base URL," "Base URL," "API Endpoint," or similar.
## [Custom applications](#custom-applications)
You can point any HTTP client at the Aperture URL as long as it uses a [supported provider API format](/docs/aperture/provider-compatibility). For example, to send a request using the OpenAI chat completions API:
```
`curl -s http://\<aperture-hostname\>/v1/chat/completions \\
-H "Content-Type: application/json" \\
-d '{
"model": "gpt-4o",
"messages": [{"role": "user", "content": "Hello"}]
}'
`
```
Aperture routes the request to the appropriate provider based on the model name.
## [Verify the connection](#verify-the-connection)
1. Send a test request using your configured tool.
2. Open the Aperture dashboard at `http://\<aperture-hostname\>/ui/` and confirm the request appears on the **Logs** page.
If the request does not appear, refer to the [Aperture troubleshooting guide](/docs/aperture/troubleshooting).
## [Next steps](#next-steps)
* [Grant model access to users](/docs/aperture/how-to/grant-model-access): Control which models each user or group can access through Aperture.
* [View your usage dashboards](/docs/aperture/reference/dashboard): Monitor token consumption, costs, and session activity across your organization.
* [Set per-user spending limits](/docs/aperture/how-to/set-per-user-spending-limits): Configure quota buckets to control costs for individual users.
On this page
* [Prerequisites](#prerequisites)
* [Configure the client](#configure-the-client)
* [Custom applications](#custom-applications)
* [Verify the connection](#verify-the-connection)
Scroll to top