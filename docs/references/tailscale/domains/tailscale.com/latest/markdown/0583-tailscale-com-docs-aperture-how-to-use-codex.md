Use Codex with Aperture · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Use Codex with Aperture
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Configure [Codex](https://github.com/openai/codex) to send requests through [Aperture by Tailscale](/docs/aperture) so your organization gets centralized API key management, usage tracking, and session logging.
## [Prerequisites](#prerequisites)
Before you begin, you need:
* An Aperture instance with at least one configured OpenAI-compatible provider, accessible from your device. Refer to [get started with Aperture](/docs/aperture/get-started) if you have not set this up.
* The Aperture host URL accessible from your device. Use `http://`, not `https://`.
* [Codex](https://github.com/openai/codex) installed on your device.
To avoid unexpected TLS issues, use `http://` for the Aperture URL when configuring LLM clients. All connections remain encrypted using WireGuard, even when HTTPS is not used.
Aperture routes requests based on the model name, not the LLM client. Any LLM client configured to use Aperture can access any provider your admin has set up. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of supported providers and API formats.
## [Configure Codex](#configure-codex)
To configure Codex to use Aperture, create or edit the Codex configuration file (`\~/.codex/config.toml`) to use the Aperture URL as the `base\_url` and set the model to a Codex-compatible model:
```
`model = "gpt-5.2-codex"
model\_provider = "llm-ai-ts-net"
model\_reasoning\_effort = "high"
[model\_providers.llm-ai-ts-net]
name = "Tailscale AI Gateway"
base\_url = "http://\<aperture-hostname\>/v1" # Required: Aperture URL
# Required for gpt-5-codex models
wire\_api = "responses"
`
```
The `wire\_api = "responses"` setting configures Codex to use the OpenAI Responses API format. You do not need to configure an API key because Aperture injects credentials automatically.
## [Verify the connection](#verify-the-connection)
1. Send a test message in Codex.
2. Open the Aperture dashboard at `http://\<aperture-hostname\>/ui/` and confirm the request appears on the **Logs** page.
If the request does not appear, refer to the [Aperture troubleshooting guide](/docs/aperture/troubleshooting).
## [Next steps](#next-steps)
* [Grant model access to users](/docs/aperture/how-to/grant-model-access): Control which models each user or group can access through Aperture.
* [View your usage dashboards](/docs/aperture/reference/dashboard): Monitor token consumption, costs, and session activity across your organization.
* [Set per-user spending limits](/docs/aperture/how-to/set-per-user-spending-limits): Configure quota buckets to control costs for individual users.
On this page
* [Prerequisites](#prerequisites)
* [Configure Codex](#configure-codex)
* [Verify the connection](#verify-the-connection)
Scroll to top