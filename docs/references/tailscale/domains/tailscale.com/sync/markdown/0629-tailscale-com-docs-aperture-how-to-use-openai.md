Set up OpenAI · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Set up OpenAI
Last validated: Apr 15, 2026
Aperture by Tailscale is currently [in alpha](/docs/reference/tailscale-release-stages#alpha).
Configure an OpenAI provider in Aperture so your team can access GPT models through your tailnet. OpenAI is the default provider type in Aperture. When no compatibility block is specified, Aperture enables `openai\_chat` automatically, but `openai\_responses` is not enabled unless you set it explicitly.
Aperture routes requests based on the model name, not the LLM client. Any LLM client configured to use Aperture can access any provider your admin has set up. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of supported providers and API formats.
## [Prerequisites](#prerequisites)
Before you begin, you need:
* An Aperture instance accessible from your device. Refer to [get started with Aperture](/docs/aperture/get-started) if you have not set this up.
* An [OpenAI API key](https://platform.openai.com/api-keys).
## [Configure the provider](#configure-the-provider)
Add OpenAI as a provider in your [Aperture configuration](/docs/aperture/configuration):
```
`{
"providers": {
"openai": {
"baseurl": "https://api.openai.com/",
"apikey": "\<your-openai-key\>",
"models": ["gpt-5", "gpt-5-mini", "gpt-4.1"],
"name": "OpenAI",
"compatibility": {
"openai\_chat": true,
"openai\_responses": true
}
}
}
}
`
```
The `openai\_responses` flag enables the Responses API, which tools like OpenAI Codex use. When you include a `compatibility` block, set both flags explicitly. Without a compatibility block, Aperture enables only `openai\_chat` by default. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of flags.
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