Get started with Aperture · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Get started with Aperture
Last validated: Apr 22, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
During the alpha testing period, Aperture by Tailscale is available at no additional cost with any Tailscale account, including free accounts created during Aperture signup. Request access at [`aperture.tailscale.com`](https://aperture.tailscale.com).
This guide walks you through signing up for Aperture, configuring your first LLM provider, and sending a test request to confirm everything works. To learn more about what Aperture does before you start, refer to [What is Aperture?](/docs/aperture/what-is-aperture).
## [Prerequisites](#prerequisites)
Before you begin, confirm you have the following:
* **An API key from an LLM provider's developer platform.** Aperture supports OpenAI, Anthropic, Google Gemini, OpenRouter, Amazon Bedrock, Vertex AI, and OpenAI-compatible APIs. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of supported providers and API formats. Get an API key from the provider's developer portal (for example, the [Anthropic Console](https://console.anthropic.com), [OpenAI Platform](https://platform.openai.com), or [Google AI Studio](https://aistudio.google.com)).
Consumer and business subscription plans (such as Claude Pro, ChatGPT Plus, or Gemini Advanced) do not provide API keys compatible with Aperture. You need an API key from the provider's developer platform.
* **A device connected to your tailnet.** Aperture listens on your [tailnet](/docs/concepts/tailnet) at `http://\<aperture-hostname\>`. Your device must be running Tailscale and connected to the same tailnet as your Aperture instance. If you need to connect a device that is not on the tailnet, refer to [Connect devices outside your tailnet](/docs/aperture/connect-outside-tailnet).
## [Step 1: Sign up for Aperture](#step-1-sign-up-for-aperture)
1. Visit [`aperture.tailscale.com`](https://aperture.tailscale.com) and complete the sign-up form. If you don't have a Tailscale account, the sign-up process creates a free one for you.
2. Confirm that your device can reach the Aperture dashboard at `http://\<aperture-hostname\>/ui`.
## [Step 2: Configure an LLM provider](#step-2-configure-an-llm-provider)
Open the [Aperture dashboard](/docs/aperture/reference/dashboard) at `http://\<aperture-hostname\>/ui` and go to the **Settings** page to add at least one LLM provider.
The **Settings** page offers two editing modes:
* **Visual editor** (default): Add a provider by filling in the provider name, base URL, API key, and model list through the form interface.
* **JSON editor**:Switch to the JSON editor to paste or write the configuration directly. The following example configures Anthropic with two Claude models:
```
`{
"providers": {
"anthropic": {
"baseurl": "https://api.anthropic.com",
"apikey": "\<anthropic-api-key\>",
"models": [
"claude-sonnet-4-5",
"claude-opus-4-5"
],
"authorization": "x-api-key",
"compatibility": {
"anthropic\_messages": true
}
}
}
}
`
```
For provider-specific instructions, refer to [Set up LLM providers](/docs/aperture/set-up-providers). For all available settings, refer to the [configuration reference](/docs/aperture/configuration).
If you skip this step, Aperture uses a [default configuration](/docs/aperture/configuration#default-configuration) that includes OpenAI and Anthropic with common models. You still need to add your own API keys before requests can succeed.
## [Step 3: Send a test request](#step-3-send-a-test-request)
Send a request from a device on your tailnet to confirm Aperture is routing to your provider. You can test with any of the supported API formats. Replace the model name with a model you configured in step 2.
**Anthropic API format**:
```
`curl -s http://\<aperture-hostname\>/v1/messages \\
-H "Content-Type: application/json" \\
-d '{
"model": "claude-haiku-4-5-20251001",
"max\_tokens": 25,
"messages": [{"role": "user", "content": "respond with: hello"}]
}'
`
```
**OpenAI Chat API format**:
```
`curl -s http://\<aperture-hostname\>/v1/chat/completions \\
-H "Content-Type: application/json" \\
-d '{
"model": "gpt-4o",
"messages": [{"role": "user", "content": "respond with: hello"}]
}'
`
```
**OpenAI Responses API format**:
```
`curl -s http://\<aperture-hostname\>/v1/responses \\
-H "Content-Type: application/json" \\
-d '{
"model": "gpt-4o",
"input": [{"role": "user", "content": "respond with: hello"}]
}'
`
```
If the request succeeds, Aperture is routing to your provider. Open the [Aperture dashboard](/docs/aperture/reference/dashboard) at `http://\<aperture-hostname\>/ui` to see the request in your usage history.
If your device is not on the tailnet, [connect through ts-unplug](/docs/aperture/connect-outside-tailnet) and replace `http://\<aperture-hostname\>` with `http://localhost:\<port-number\>` in the examples above.
## [Next steps](#next-steps)
After you confirm your provider is working, explore the following features to get the most out of Aperture:
* [Grant users access to models](/docs/aperture/how-to/grant-model-access) so team members can send requests through Aperture.
* [Set up LLM clients](/docs/aperture/use-your-tools) to route traffic from tools like Claude Code or Codex through Aperture.
* [Set spending limits](/docs/aperture/manage-spending) to control costs across your organization.
* [Connect devices outside your tailnet](/docs/aperture/connect-outside-tailnet) if team members need access from devices that aren't on the tailnet.
On this page
* [Prerequisites](#prerequisites)
* [Step 1: Sign up for Aperture](#step-1-sign-up-for-aperture)
* [Step 2: Configure an LLM provider](#step-2-configure-an-llm-provider)
* [Step 3: Send a test request](#step-3-send-a-test-request)
* [Next steps](#next-steps)
Scroll to top