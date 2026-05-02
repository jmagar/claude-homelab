Integrate Oso with Aperture · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Integrate Oso with Aperture
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
[Oso](https://www.osohq.com/) is an authorization platform that provides fine-grained access control for AI agents. By connecting Aperture to Oso, you can send tool use data from LLM requests so Oso can make authorization decisions and provide observability into what your AI agents are doing.
Aperture sends data to Oso using the [hooks system](/docs/aperture/configuration#hooks). You configure a hook endpoint for Oso and a grant that specifies which requests trigger the hook and what data to include.
Oso uses asynchronous hooks (`tool\_call\_entire\_request`) that fire after the response completes. For synchronous pre-request enforcement that can block or modify requests before they reach the provider, refer to [guardrails](/docs/aperture/guardrails).
## [Prerequisites](#prerequisites)
Before you begin, ensure you have the following:
* A running [Aperture instance](/docs/aperture/get-started) accessible from your device.
* An [Oso](https://www.osohq.com/) account with an API key. If you don't have one, you can sign up from the Aperture dashboard.
## [Configure the Oso hook](#configure-the-oso-hook)
To integrate Oso with Aperture, configure a hook in Aperture that points to the Oso API endpoint. This lets you send tool use data to Oso for authorization decisions and observability.
1. Open the Aperture dashboard at `http://\<aperture-hostname\>/ui/`.
2. Go to the **Tool Use** page, then select **View Tool Use in Oso**.
3. Sign in to your Oso account (or sign up) and create an API key.
4. Select the **Settings** page and open the JSON editor.
5. Add an `oso` entry in the `hooks` section with your API key.
```
`"hooks": {
"oso": {
"url": "https://api.osohq.com/api/agents/v1/model-request",
"apikey": "\<oso-api-key\>"
}
}
`
```
Replace `\<oso-api-key\>` with the API key you created in step 3.
6. Add a grant with a `send\_hooks` entry that references the `oso` hook. The grant controls which requests trigger the hook and what data Aperture sends.
```
`"grants": [
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{
"send\_hooks": [
{
"name": "oso",
"events": ["tool\_call\_entire\_request"],
"send": ["user\_message", "tools", "request\_body", "response\_body"]
}
]
}
]
}
}
]
`
```
This configuration sends tool call data for all users. To limit which users' requests trigger the hook, replace `"\*"` in the `src` field with specific user identities or tags.
7. Save the configuration.
For details on hook events and send types, refer to the [hooks configuration reference](/docs/aperture/configuration#hooks).
## [Verify the integration](#verify-the-integration)
After configuring the Oso hook, verify that Aperture is sending data to Oso and that it appears in the Oso dashboard.
1. Send a request through Aperture that includes a tool call and matches your grant conditions.
2. Open the [Oso dashboard](https://www.osohq.com/) and confirm the tool use data appears.
If data doesn't appear, check that the `send\_hooks` name matches the key in your `hooks` section and that the grant's `src` field includes the user who made the request.
## [Next steps](#next-steps)
* [Build a custom webhook](/docs/aperture/how-to/build-custom-webhook) to send Aperture data to other services.
* Learn about hook events and data types in the [configuration reference](/docs/aperture/configuration#hooks).
* Explore other [external integrations](/docs/aperture/integrate) for Aperture.
On this page
* [Prerequisites](#prerequisites)
* [Configure the Oso hook](#configure-the-oso-hook)
* [Verify the integration](#verify-the-integration)
* [Next steps](#next-steps)
Scroll to top