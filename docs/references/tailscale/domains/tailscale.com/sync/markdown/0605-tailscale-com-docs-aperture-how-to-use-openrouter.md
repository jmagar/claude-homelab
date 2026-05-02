Set up OpenRouter · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Set up OpenRouter
Last validated: Apr 15, 2026
Aperture by Tailscale is currently [in alpha](/docs/reference/tailscale-release-stages#alpha).
Configure an OpenRouter provider in Aperture so your team can access models from multiple LLM providers through a single API. OpenRouter aggregates models from providers like Google, Meta, and others, including open-source models.
Aperture routes requests based on the model name, not the LLM client. Any LLM client configured to use Aperture can access any provider your admin has set up. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of supported providers and API formats.
## [Prerequisites](#prerequisites)
Before you begin, you need:
* An Aperture instance accessible from your device. Refer to [get started with Aperture](/docs/aperture/get-started) if you have not set this up.
* An [OpenRouter API key](https://openrouter.ai/settings/keys).
## [Configure the provider](#configure-the-provider)
Add OpenRouter as a provider in your [Aperture configuration](/docs/aperture/configuration):
```
`{
"providers": {
"openrouter": {
"baseurl": "https://openrouter.ai/api/",
"apikey": "\<your-openrouter-key\>",
"models": [
"qwen/qwen3-235b-a22b-2507",
"google/gemini-2.5-pro-preview",
"x-ai/grok-code-fast-1"
]
}
}
}
`
```
OpenRouter uses OpenAI-compatible defaults (`bearer` authorization, `openai\_chat`), so no compatibility flags or authorization overrides are needed. OpenRouter does not support the Responses API (`openai\_responses`), only the chat completions API. This makes OpenRouter useful if you want to access models from multiple providers without configuring each one separately in Aperture.
Model names on OpenRouter use a `provider/model` prefix format. Browse the [OpenRouter model directory](https://openrouter.ai/models) to find available model names. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of flags.
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