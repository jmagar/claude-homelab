Use OpenCode with Aperture · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Use OpenCode with Aperture
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Configure [OpenCode](https://opencode.ai) to send requests through [Aperture by Tailscale](/docs/aperture) so your organization gets centralized API key management, usage tracking, and session logging.
## [Prerequisites](#prerequisites)
Before you begin, you need:
* An Aperture instance with at least one configured AI provider (such as Anthropic or OpenAI), accessible from your device. Refer to [get started with Aperture](/docs/aperture/get-started) if you have not set this up.
* The Aperture host URL accessible from your device. Use `http://`, not `https://`.
* [OpenCode](https://opencode.ai) installed on your device.
To avoid unexpected TLS issues, use `http://` for the Aperture URL when configuring LLM clients. All connections remain encrypted using WireGuard, even when HTTPS is not used.
Aperture routes requests based on the model name, not the LLM client. Any LLM client configured to use Aperture can access any provider your admin has set up. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of supported providers and API formats.
## [Configure OpenCode](#configure-opencode)
OpenCode requires two configuration changes: set the base URL to point at Aperture, and provide a placeholder API key for each provider.
### [Set the base URL](#set-the-base-url)
Point OpenCode at your Aperture instance by setting the base URL for each provider in the OpenCode configuration file.
1. Open or create the OpenCode configuration file. The file is usually named `opencode.json` and located in your home directory or the directory where you run OpenCode. Refer to the [OpenCode configuration documentation](https://opencode.ai/docs/config/) for details.
2. Add the following configuration to set Aperture as the base URL for your providers:
```
`{
"$schema": "https://opencode.ai/config.json",
"provider": {
"anthropic": {
"options": {
"baseURL": "http://\<aperture-hostname\>"
}
},
"openai": {
"options": {
"baseURL": "http://\<aperture-hostname\>/v1"
}
}
}
}
`
```
Replace `\<aperture-hostname\>` with your Aperture hostname. If you [connect through ts-unplug](/docs/aperture/connect-outside-tailnet), use `http://localhost:\<port-number\>` instead.
Include only the providers you have configured in Aperture. For example, if you only have Anthropic configured, omit the `openai` block.
3. Save the file.
### [Configure authentication](#configure-authentication)
OpenCode requires an authentication entry for each provider. Set a placeholder value for each provider you configured.
Aperture identifies users through Tailscale identity and injects the real API credentials when forwarding requests. The placeholder value is never sent to the provider.
1. Open or create the OpenCode authentication file.
2. Add the following placeholder keys:
```
`{
"anthropic": {
"type": "api",
"key": "-"
},
"openai": {
"type": "api",
"key": "-"
}
}
`
```
The dash character (`-`) satisfies OpenCode's authentication check.
3. Save the file.
Alternatively, enter the placeholder key interactively by running `/connect` inside OpenCode and selecting **Manually enter an API Key** for each provider.
## [Verify the connection](#verify-the-connection)
1. Send a test message in OpenCode.
2. Open the Aperture dashboard at `http://\<aperture-hostname\>/ui/` and confirm the request appears on the **Logs** page.
If the request does not appear, refer to the [Aperture troubleshooting guide](/docs/aperture/troubleshooting).
## [Next steps](#next-steps)
* [Grant model access to users](/docs/aperture/how-to/grant-model-access): Control which models each user or group can access through Aperture.
* [View your usage dashboards](/docs/aperture/reference/dashboard): Monitor token consumption, costs, and session activity across your organization.
* [Set per-user spending limits](/docs/aperture/how-to/set-per-user-spending-limits): Configure quota buckets to control costs for individual users.
On this page
* [Prerequisites](#prerequisites)
* [Configure OpenCode](#configure-opencode)
* [Set the base URL](#set-the-base-url)
* [Configure authentication](#configure-authentication)
* [Verify the connection](#verify-the-connection)
Scroll to top