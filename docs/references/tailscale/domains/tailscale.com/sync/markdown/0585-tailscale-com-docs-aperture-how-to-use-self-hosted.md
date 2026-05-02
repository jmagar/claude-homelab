Set up a self-hosted provider · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Set up a self-hosted provider
Last validated: Apr 15, 2026
Aperture by Tailscale is currently [in alpha](/docs/reference/tailscale-release-stages#alpha).
Configure a self-hosted LLM server as a provider in Aperture so your team can access private models through your tailnet. Any server that exposes an OpenAI-compatible chat completions endpoint works with the default configuration. Aperture supports both `/v1/chat/completions` and `/chat/completions` paths. Common servers include llama.cpp, vLLM, and Ollama.
Aperture routes requests based on the model name, not the LLM client. Any LLM client configured to use Aperture can access any provider your admin has set up. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of supported providers and API formats.
## [Prerequisites](#prerequisites)
Before you begin, you need:
* An Aperture instance accessible from your device. Refer to [get started with Aperture](/docs/aperture/get-started) if you have not set this up.
* A self-hosted LLM server accessible from the Aperture host (on the tailnet or localhost).
## [Configure the provider](#configure-the-provider)
Add your self-hosted server as a provider in your [Aperture configuration](/docs/aperture/configuration):
```
`{
"providers": {
"private": {
"baseurl": "http://100.64.0.1:8080/v1",
"models": ["qwen3-coder-30b", "llama-3.1-70b"]
}
}
}
`
```
Set `baseurl` to the full URL of your server's API endpoint, including the path prefix if your server uses one (for example, `http://100.64.0.1:8080/v1` for a vLLM server that serves at `/v1`). If your server serves at the root path without a version prefix, set `baseurl` to just the host and port (for example, `http://100.64.0.1:8080`). To find the correct model names, query your server's model list endpoint (typically `GET /v1/models`) and use the `id` field from the response.
Self-hosted providers use `openai\_chat` compatibility and `bearer` authorization by default, so no additional flags are needed for servers that expose an OpenAI-compatible API. If your server uses a different API format, set the appropriate [compatibility flags](/docs/aperture/provider-compatibility).
If your server does not require authentication, omit the `apikey` field. If your server requires a key, add `"apikey": "\<your-key\>"` to the provider block.
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