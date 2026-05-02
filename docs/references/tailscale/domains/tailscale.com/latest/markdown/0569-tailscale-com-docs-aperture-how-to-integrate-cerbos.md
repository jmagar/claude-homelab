Integrate Cerbos with Aperture · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Integrate Cerbos with Aperture
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
[Cerbos](https://www.cerbos.dev/) is a policy engine that provides fine-grained, context-aware authorization. By connecting Aperture to Cerbos, you can send LLM request data to Cerbos so it can enforce authorization policies on AI usage, such as controlling which users can access specific models or tools.
Aperture sends data to Cerbos using the [hooks system](/docs/aperture/configuration#hooks). You configure a hook endpoint for your Cerbos deployment and a grant that specifies which requests trigger the hook and what data to include.
Cerbos uses asynchronous hooks (`entire\_request`) that fire after the response completes. For synchronous pre-request enforcement that can block or modify requests before they reach the provider, refer to [guardrails](/docs/aperture/guardrails).
## [Prerequisites](#prerequisites)
Before you begin, ensure you have the following:
* A running [Aperture instance](/docs/aperture/get-started) accessible from your device.
* A [Cerbos](https://www.cerbos.dev/) deployment (self-hosted or Cerbos Hub) with an API endpoint that can receive webhook data.
## [Configure the Cerbos endpoint](#configure-the-cerbos-endpoint)
To integrate Cerbos with Aperture, configure the Cerbos endpoint so you can use it as a hook in Aperture and set up a grant to send request data to that hook. This lets Cerbos receive real-time data about LLM requests for authorization decisions.
1. In your Cerbos deployment, identify or create an endpoint that can receive HTTP POST requests from Aperture.
2. Note the endpoint URL and any API key or authentication token. You'll use these when configuring the hook in Aperture.
For details on setting up Cerbos, refer to the [Cerbos documentation](https://docs.cerbos.dev/).
## [Configure the Aperture hook](#configure-the-aperture-hook)
Configure a hook in Aperture that points to your Cerbos endpoint. This lets you send request data to Cerbos for authorization decisions.
1. Open the Aperture dashboard at `http://\<aperture-hostname\>/ui/`.
2. Select the **Settings** page and open the JSON editor.
3. Add a `cerbos` entry in the `hooks` section with the endpoint URL from your Cerbos deployment.
```
`"hooks": {
"cerbos": {
"url": "\<cerbos-endpoint-url\>",
"apikey": "\<cerbos-api-key\>"
}
}
`
```
Replace `\<cerbos-endpoint-url\>` with the URL of your Cerbos endpoint and `\<cerbos-api-key\>` with the API key from your Cerbos deployment.
4. Add a grant with a `send\_hooks` entry that references the `cerbos` hook. The grant controls which requests trigger the hook and what data Aperture sends.
```
`"grants": [
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{
"send\_hooks": [
{
"name": "cerbos",
"events": ["entire\_request"],
"send": ["tools", "user\_message", "grants"]
}
]
}
]
}
}
]
`
```
This configuration sends request data for all users. The `grants` send type includes the user's custom capabilities, which Cerbos can use for authorization decisions. To limit which users' requests trigger the hook, replace `"\*"` in the `src` field with specific user identities or tags.
5. Save the configuration.
For details on hook events and send types, refer to the [hooks configuration reference](/docs/aperture/configuration#hooks).
## [Verify the integration](#verify-the-integration)
After configuring the Cerbos hook, verify that Aperture is sending data to Cerbos and that Cerbos is evaluating it against your policies.
1. Send a request through Aperture that matches your grant conditions.
2. Check your Cerbos deployment to confirm the request data arrives.
3. Verify that Cerbos evaluates the data against your authorization policies.
If data doesn't appear, check that the `send\_hooks` name matches the key in your `hooks` section and that the grant's `src` field includes the user who made the request.
## [Next steps](#next-steps)
* [Build a custom webhook](/docs/aperture/how-to/build-custom-webhook) to send Aperture data to other services.
* Learn about hook events and data types in the [configuration reference](/docs/aperture/configuration#hooks).
* Explore other [external integrations](/docs/aperture/integrate) for Aperture.
On this page
* [Prerequisites](#prerequisites)
* [Configure the Cerbos endpoint](#configure-the-cerbos-endpoint)
* [Configure the Aperture hook](#configure-the-aperture-hook)
* [Verify the integration](#verify-the-integration)
* [Next steps](#next-steps)
Scroll to top