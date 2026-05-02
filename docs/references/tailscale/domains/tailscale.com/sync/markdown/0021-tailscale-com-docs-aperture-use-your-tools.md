Set up LLM clients · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Set up LLM clients
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
After [setting up Aperture](/docs/aperture/get-started) and [configuring your providers](/docs/aperture/set-up-providers), set up your LLM clients to route requests through your Aperture instance.
Aperture sits between your LLM clients and your upstream providers and routes requests from each client to the appropriate provider. When a client sends a request specifying a model name, Aperture routes it to the provider that serves that model and automatically injects authentication. Any LLM client that supports a custom base URL can use Aperture.
Use the following guides to configure an LLM client to use your Aperture instance. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of supported providers and API formats.
[
#### Use Claude Code with Aperture
Configure Claude Code to route requests through your Aperture proxy.
](/docs/aperture/how-to/use-claude-code)
[
#### Use Codex with Aperture
Configure OpenAI Codex to route requests through your Aperture proxy.
](/docs/aperture/how-to/use-codex)
[
#### Use OpenCode with Aperture
Configure OpenCode to route requests through your Aperture proxy.
](/docs/aperture/how-to/use-opencode)
[
#### Use OpenAI-compatible tools with Aperture
Configure Gemini CLI, Roo Code, Cline, and other OpenAI-compatible tools to route requests through Aperture.
](/docs/aperture/how-to/use-openai-compatible-tools)
Scroll to top