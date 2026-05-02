Set up Google Gemini · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Set up Google Gemini
Last validated: Apr 15, 2026
Aperture by Tailscale is currently [in alpha](/docs/reference/tailscale-release-stages#alpha).
Configure a Google Gemini provider in Aperture so your team can access Gemini models through your tailnet. This guide uses the direct Gemini API with API key authentication, which requires fewer configuration steps than Vertex AI but does not support Anthropic models.
For Vertex AI with service account authentication (which also supports Anthropic models), refer to [set up a Vertex AI provider](/docs/aperture/how-to/use-vertex-ai). For Vertex AI with API key authentication, refer to [set up a Vertex AI Express provider](/docs/aperture/how-to/use-vertex-ai-express).
Aperture routes requests based on the model name, not the LLM client. Any LLM client configured to use Aperture can access any provider your admin has set up. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of supported providers and API formats.
## [Prerequisites](#prerequisites)
Before you begin, you need:
* An Aperture instance accessible from your device. Refer to [get started with Aperture](/docs/aperture/get-started) if you have not set this up.
* A [Google AI Studio API key](https://aistudio.google.com/apikey).
## [Configure the provider](#configure-the-provider)
Add Google Gemini as a provider in your [Aperture configuration](/docs/aperture/configuration):
```
`{
"providers": {
"gemini": {
"baseurl": "https://generativelanguage.googleapis.com",
"apikey": "\<your-gemini-key\>",
"authorization": "x-goog-api-key",
"models": ["gemini-2.5-flash", "gemini-2.5-pro"],
"name": "Google Gemini",
"compatibility": {
"gemini\_generate\_content": true
}
}
}
}
`
```
The `authorization` field controls how Aperture sends the API key. The `x-goog-api-key` value sends the key in a `x-goog-api-key` header, which the direct Gemini API requires. The `gemini\_generate\_content` flag tells Aperture to use the Gemini API format instead of the default OpenAI chat completions format.
Google publishes `-latest` aliases (such as `gemini-flash-latest`) that resolve to the current stable version, so you can use either specific or alias model names. For the full list of available models, refer to the [Google AI documentation](https://ai.google.dev/gemini-api/docs/models). Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of flags.
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