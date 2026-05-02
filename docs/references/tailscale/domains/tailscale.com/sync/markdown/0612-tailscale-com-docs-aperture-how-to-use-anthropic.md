Set up Anthropic · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Set up Anthropic
Last validated: Apr 15, 2026
Aperture by Tailscale is currently [in alpha](/docs/reference/tailscale-release-stages#alpha).
Configure an Anthropic provider in Aperture so your team can access Claude models through your tailnet. Anthropic uses the `x-api-key` authorization type and the `anthropic\_messages` compatibility flag, which differ from the defaults.
Aperture routes requests based on the model name, not the LLM client. Any LLM client configured to use Aperture can access any provider your admin has set up. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of supported providers and API formats.
## [Prerequisites](#prerequisites)
Before you begin, you need:
* An Aperture instance accessible from your device. Refer to [get started with Aperture](/docs/aperture/get-started) if you have not set this up.
* An [Anthropic API key](https://console.anthropic.com/settings/keys).
## [Configure the provider](#configure-the-provider)
Add Anthropic as a provider in your [Aperture configuration](/docs/aperture/configuration):
```
`{
"providers": {
"anthropic": {
"baseurl": "https://api.anthropic.com",
"apikey": "\<your-anthropic-key\>",
"authorization": "x-api-key",
"models": ["claude-sonnet-4-5", "claude-opus-4-5", "claude-haiku-4-5"],
"compatibility": {
"anthropic\_messages": true
}
}
}
}
`
```
The `authorization` field is set to `x-api-key` because Anthropic uses the `x-api-key` header instead of a bearer token. The `anthropic\_messages` flag tells Aperture to use the Anthropic message format instead of the default OpenAI chat completions format. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of flags.
After configuring the provider:
1. [Grant model access](/docs/aperture/how-to/grant-model-access) to the users or groups that need these models.
2. [Set up LLM clients](/docs/aperture/use-your-tools) to connect coding tools through Aperture.
## [Verify the provider](#verify-the-provider)
1. Open the Aperture dashboard and confirm the provider appears with the expected models.
2. Send a test request through a connected coding tool (such as Claude Code or Cursor), or use `curl`:
```
`curl http://\<aperture-address\>/v1/chat/completions \\
-H "Content-Type: application/json" \\
-d '{"model": "\<model-name\>", "messages": [{"role": "user", "content": "hello"}]}'
`
```
Replace `\<aperture-address\>` with your Aperture instance address and `\<model-name\>` with one of the models you configured for this provider.
3. Check the Aperture dashboard session list for a new entry. The session shows the model name, token counts, and timestamp.
If the request fails, refer to the [Aperture troubleshooting guide](/docs/aperture/troubleshooting).
On this page
* [Prerequisites](#prerequisites)
* [Configure the provider](#configure-the-provider)
* [Verify the provider](#verify-the-provider)
Scroll to top