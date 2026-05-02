Set up Vercel AI Gateway · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Set up Vercel AI Gateway
Last validated: Apr 15, 2026
Aperture by Tailscale is currently [in alpha](/docs/reference/tailscale-release-stages#alpha).
Configure a Vercel AI Gateway provider in Aperture so your team can access models from multiple LLM providers through a single gateway endpoint. Vercel AI Gateway aggregates providers like OpenAI and Anthropic behind one API, supporting both the chat completions and responses APIs.
Aperture routes requests based on the model name, not the LLM client. Any LLM client configured to use Aperture can access any provider your admin has set up. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of supported providers and API formats.
## [Prerequisites](#prerequisites)
Before you begin, you need:
* An Aperture instance accessible from your device. Refer to [get started with Aperture](/docs/aperture/get-started) if you have not set this up.
* A [Vercel API token](https://vercel.com/account/tokens).
## [Configure the provider](#configure-the-provider)
Add Vercel AI Gateway as a provider in your [Aperture configuration](/docs/aperture/configuration):
```
`{
"providers": {
"vercel": {
"baseurl": "https://ai-gateway.vercel.sh",
"apikey": "\<your-vercel-token\>",
"models": [
"anthropic/claude-sonnet-4-5",
"openai/gpt-5-nano"
],
"cost\_basis": "vercel",
"compatibility": {
"openai\_chat": true,
"openai\_responses": true
}
}
}
}
`
```
You must set `cost\_basis` to `"vercel"` because Aperture cannot auto-infer pricing for gateway providers. Without an explicit `cost\_basis`, Aperture does not produce cost estimates for requests to this provider.
Model names use a `provider/model` prefix format. The `openai\_chat` flag enables the chat completions API and `openai\_responses` enables the Responses API, which tools like OpenAI Codex use. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of flags.
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