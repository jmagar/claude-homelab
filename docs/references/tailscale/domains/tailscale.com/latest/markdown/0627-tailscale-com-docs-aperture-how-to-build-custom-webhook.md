Build a custom webhook · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Build a custom webhook
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Aperture can send real-time event data to external services through webhooks to feed LLM usage data into your own audit logs, cost dashboards, security tools, or policy engines. For each request that matches a grant, Aperture POSTs a JSON payload containing the metadata and data types you select.
## [Prerequisites](#prerequisites)
Before you begin, ensure you have the following:
* An [Aperture instance](/docs/aperture/get-started) with at least one provider configured.
* Admin access to the [Aperture configuration](/docs/aperture/configuration).
* An HTTP or HTTPS endpoint that accepts POST requests with JSON payloads.
## [Define a hook endpoint](#define-a-hook-endpoint)
Open the **Settings** page in the [Aperture dashboard](/docs/aperture/reference/dashboard) and add a `hooks` section to your configuration. Each hook has a unique key and specifies the endpoint URL:
```
`"hooks": {
"my-webhook": {
"url": "https://example.com/aperture-events",
"apikey": "\<api-key\>"
}
}
`
```
If your endpoint uses a non-Bearer authentication scheme, set the `authorization` field:
```
`"hooks": {
"my-webhook": {
"url": "https://example.com/aperture-events",
"apikey": "\<api-key\>",
"authorization": "x-api-key",
"timeout": "10s"
}
}
`
```
The `authorization` field supports `bearer` (default), `x-api-key`, and `x-goog-api-key`. The `timeout` field accepts Go duration strings such as `5s`, `30s`, or `1m` and defaults to `5s`.
A hook defined in the `hooks` section has no effect until a grant references it.
## [Trigger the hook from a grant](#trigger-the-hook-from-a-grant)
Add a `send\_hooks` entry to a capability in your `grants` section. This controls which requests trigger the hook and what data Aperture includes in the payload:
```
`"grants": [
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{
"models": "\*\*",
"send\_hooks": [
{
"name": "my-webhook",
"events": ["entire\_request"],
"send": ["estimated\_cost"]
}
]
}
]
}
}
]
`
```
### [Select hook events](#select-hook-events)
The `events` array specifies when Aperture calls the hook:
|Event|Description|
|`entire\_request`|Fires for every completed request.|
|`tool\_call\_entire\_request`|Fires once after the response completes if any message in the response contained tool calls.|
### [Select data types](#select-data-types)
The `send` array specifies which data to include in the POST payload:
|Type|Description|
|`tools`|Array of tool calls extracted from the response.|
|`request\_body`|The original request body sent to the LLM.|
|`user\_message`|The user's message from the request.|
|`response\_body`|The reconstructed response body JSON.|
|`raw\_responses`|Array of raw SSE messages (for streaming) or single response object.|
|`estimated\_cost`|Dollar cost estimate, pricing basis, and token usage breakdown.|
|`grants`|Non-Aperture app capabilities from the user's grants.|
|`quotas`|Current state of all quota buckets that applied to this request.|
## [Understand the payload format](#understand-the-payload-format)
Every hook call includes a `metadata` object with request context, regardless of what you specify in `send`:
```
`{
"metadata": {
"login\_name": "alice@example.com",
"user\_agent": "curl/8.0",
"url": "/v1/chat/completions",
"model": "gpt-5",
"provider": "openai",
"tailnet\_name": "example.com",
"stable\_node\_id": "n12345",
"request\_id": "abc123",
"session\_id": "oacc\_1a2b3c4d5e6f7890"
}
}
`
```
When you include data types in the `send` array, Aperture adds them to the payload alongside `metadata`. For example, with `"send": ["tools", "estimated\_cost"]`:
```
`{
"metadata": {
"login\_name": "alice@example.com",
"...": "...",
"estimated\_cost": {
"dollars": 0.0342,
"cost\_basis": "anthropic/claude-sonnet-4-5",
"usage": {
"input\_tokens": 1500,
"output\_tokens": 800,
"cached\_tokens": 200,
"reasoning\_tokens": 0
}
}
},
"tool\_calls": [...]
}
`
```
## [Verify the webhook](#verify-the-webhook)
After saving the configuration, send a test LLM request through Aperture and check that your endpoint receives the POST payload. If the webhook does not fire:
1. Confirm the hook name in `send\_hooks` matches the key in the `hooks` section.
2. Confirm the grant's `src` and `models` patterns match your test request.
3. Check the Aperture server logs for timeout or connection errors to the hook URL.
To temporarily disable a hook without removing it from the configuration, set `"disabled": true` in the hook definition.
## [Next steps](#next-steps)
* [Export usage data to S3](/docs/aperture/how-to/export-usage-data-to-s3) for long-term storage of session logs.
* [Integrate Oso with Aperture](/docs/aperture/how-to/integrate-oso) or [Integrate Cerbos with Aperture](/docs/aperture/how-to/integrate-cerbos) for policy engine integrations that use hooks.
* Refer to the [hooks configuration reference](/docs/aperture/configuration#hooks) for the complete field reference and additional examples.
On this page
* [Prerequisites](#prerequisites)
* [Define a hook endpoint](#define-a-hook-endpoint)
* [Trigger the hook from a grant](#trigger-the-hook-from-a-grant)
* [Select hook events](#select-hook-events)
* [Select data types](#select-data-types)
* [Understand the payload format](#understand-the-payload-format)
* [Verify the webhook](#verify-the-webhook)
* [Next steps](#next-steps)
Scroll to top