Integrate Cribl with Aperture · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Integrate Cribl with Aperture
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
[Cribl](https://cribl.io/) is a data pipeline platform that routes, reduces, and enriches observability data. By connecting Aperture to Cribl, you can route AI usage data through your existing Cribl pipelines and forward it to any of Cribl's supported destinations (Splunk, Datadog, S3, and others).
Aperture sends data to Cribl using the [hooks system](/docs/aperture/configuration#hooks). You configure a webhook endpoint in Cribl, then add a hook in Aperture that sends event data to that endpoint when requests match your grant conditions.
## [Prerequisites](#prerequisites)
Before you begin, ensure you have the following:
* A running [Aperture instance](/docs/aperture/get-started) accessible from your device.
* A [Cribl Stream or Cribl Cloud](https://cribl.io/) deployment with a configured [webhook source](https://docs.cribl.io/stream/sources-webhook/).
## [Configure the Cribl webhook source](#configure-the-cribl-webhook-source)
Get the webhook URL and authentication token from your Cribl deployment. You'll use these to configure a hook in Aperture that sends data to Cribl.
1. In your Cribl deployment, create a webhook source to receive data from Aperture.
2. Note the webhook URL and any authentication token Cribl provides. You'll use these when configuring the hook in Aperture.
For details on configuring webhook sources in Cribl, refer to the [Cribl documentation](https://docs.cribl.io/).
## [Configure the Aperture hook](#configure-the-aperture-hook)
To integrate Cribl with Aperture, configure a hook in Aperture that points to your Cribl endpoint. This lets you send request data to Cribl for processing and routing.
1. Open the Aperture dashboard at `http://\<aperture-hostname\>/ui/`.
2. Go to the **Settings** page and open the JSON editor.
3. Add a `cribl` entry in the `hooks` section with the webhook URL from your Cribl source.
```
`"hooks": {
"cribl": {
"url": "\<cribl-webhook-url\>",
"apikey": "\<cribl-auth-token\>"
}
}
`
```
Replace `\<cribl-webhook-url\>` with the URL of your Cribl webhook source and `\<cribl-auth-token\>` with the authentication token from Cribl.
4. Add a grant with a `send\_hooks` entry that references the `cribl` hook. The grant controls which requests trigger the hook and what data Aperture sends.
```
`"grants": [
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{
"send\_hooks": [
{
"name": "cribl",
"events": ["entire\_request"],
"send": ["tools", "estimated\_cost", "request\_body", "response\_body"]
}
]
}
]
}
}
]
`
```
This configuration sends data for every request from all users. Adjust the `events` and `send` fields based on what data you want to route through Cribl. To limit which users' requests trigger the hook, replace `"\*"` in the `src` field with specific user identities or tags.
5. Save the configuration.
For details on hook events and send types, refer to the [hooks configuration reference](/docs/aperture/configuration#hooks).
## [Verify the integration](#verify-the-integration)
After configuring the Cribl hook, verify that Aperture is sending data to Cribl and that Cribl is routing it to the expected destination.
1. Send a request through Aperture that matches your grant conditions.
2. Check your Cribl deployment to confirm the event data arrives at the webhook source.
3. Verify that your Cribl pipeline routes the data to the expected destination.
If data doesn't appear, check that the `send\_hooks` name matches the key in your `hooks` section and that the grant's `src` field includes the user who made the request.
## [Next steps](#next-steps)
* [Build a custom webhook](/docs/aperture/how-to/build-custom-webhook) to send Aperture data to other services.
* Learn about hook events and data types in the [configuration reference](/docs/aperture/configuration#hooks).
* Explore other [external integrations](/docs/aperture/integrate) for Aperture.
On this page
* [Prerequisites](#prerequisites)
* [Configure the Cribl webhook source](#configure-the-cribl-webhook-source)
* [Configure the Aperture hook](#configure-the-aperture-hook)
* [Verify the integration](#verify-the-integration)
* [Next steps](#next-steps)
Scroll to top