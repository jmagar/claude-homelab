Set up a guardrail · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Set up a guardrail
Last validated: Apr 22, 2026
Aperture guardrails is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Use [guardrails](/docs/aperture/guardrails) to enforce policies on LLM requests before they leave your network. This topic covers setting up a PII-scrubbing guardrail that detects and redacts sensitive data, such as Social Security numbers, in user messages before the request reaches the provider.
## [Prerequisites](#prerequisites)
Before you begin, ensure you have the following:
* A running [Aperture instance](/docs/aperture/get-started) accessible from your device.
* A guardrail hook endpoint: an HTTP service that receives request data from Aperture, scans it, and returns an allow, block, or modify decision. The endpoint must accept POST requests and return JSON. For details on the expected request and response format, refer to the [hook response format](/docs/aperture/configuration#hook-response-format) in the configuration reference.
## [Configure the hook endpoint](#configure-the-hook-endpoint)
Define the guardrail in the Aperture configuration so Aperture knows where to send request data for inspection.
1. Open the Aperture dashboard at `http://\<aperture-hostname\>/ui/`.
2. Select the **Settings** page and open the JSON editor.
3. Add an entry in the `hooks` section with the endpoint URL and credentials for your guardrail service.
```
`"hooks": {
"ssn-scrubber": {
"url": "http://ssn-guard.example.ts.net:8080/scrub",
"apikey": "\<guardrail-api-key\>",
"fail\_policy": "fail\_closed",
"timeout": "500ms",
"preference": 10
}
}
`
```
Replace `http://ssn-guard.example.ts.net:8080/scrub` with the URL of your guardrail service and `\<guardrail-api-key\>` with its API key.
* `fail\_policy` controls what happens when Aperture cannot reach the endpoint. `fail\_closed` blocks the request if the guardrail is unavailable, which is appropriate for PII scrubbing where enforcement is mandatory. Use `fail\_open` if you prefer requests to proceed when the guardrail is down.
* `timeout` sets the maximum time Aperture waits for a response. Keep this short (500ms to 2s) for `pre\_request` hooks to limit client-visible latency.
* `preference` controls execution order when multiple hooks match a request. Higher values run first.
## [Wire the hook to requests](#wire-the-hook-to-requests)
Connect the guardrail to incoming requests using a grant with a `send\_hooks` entry.
1. In the JSON editor, add a grant with a `send\_hooks` entry that references the hook you defined.
```
`"grants": [
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{
"models": "\*\*"
},
{
"send\_hooks": [
{
"name": "ssn-scrubber",
"events": ["pre\_request"],
"send": ["request\_body", "user\_message"]
}
]
}
]
}
}
]
`
```
* `name` references the hook key you defined in the `hooks` section.
* `events` must include `pre\_request` for the guardrail to fire before the request reaches the provider.
* `send` controls what data Aperture includes in the payload to your hook. `user\_message` is the last message the user sent, extracted from the request body regardless of API format. Use it as the scanning surface to detect PII. `request\_body` is the full request body. Use it as the modification surface: when the hook returns a `modify` action, the `request\_body` in the response replaces the original.
* Save the configuration.
## [Verify the guardrail](#verify-the-guardrail)
After configuring the hook, confirm that the guardrail intercepts and processes requests.
1. Send a test request through Aperture that contains a sample SSN, such as `123-45-6789`.
2. Check the response. If your guardrail modifies the request, the LLM should receive the scrubbed content (for example, `XXX-XX-XXXX`) instead of the original.
3. Open the Aperture dashboard and check the **Captures** view. The captured request body should show the modified content, not the original PII. Aperture stores the forwarded (modified) body in the capture record.
If the request passes through without modification, verify that the `name` in `send\_hooks` matches the key in your `hooks` section and that the grant's `src` field includes the user who sent the request.
## [Variations](#variations)
The PII-scrubbing example demonstrates a common use case for guardrails, but you can implement different policies by changing the hook logic and response. For example:
### [Block requests](#block-requests)
Instead of scrubbing PII, your guardrail can block requests entirely. When the hook detects a policy violation, return a block response:
```
`{"action": "block", "status\_code": 451, "message": "request contains PII"}
`
```
The client receives an error response and the request never reaches the provider.
### [Strip tool declarations](#strip-tool-declarations)
To prevent specific tools from being available to the LLM, the hook can return a modified `request\_body` with those tools removed from the `tools` array. The LLM receives the request without the stripped tools and cannot invoke them.
## [Next steps](#next-steps)
* Learn how guardrails work in [guardrails](/docs/aperture/guardrails).
* Review the [hook response format](/docs/aperture/configuration#hook-response-format) and [hook chains](/docs/aperture/configuration#hook-chains) in the configuration reference.
* For asynchronous observation and authorization hooks, refer to [integrate Cerbos with Aperture](/docs/aperture/how-to/integrate-cerbos) or [integrate Oso with Aperture](/docs/aperture/how-to/integrate-oso).
On this page
* [Prerequisites](#prerequisites)
* [Configure the hook endpoint](#configure-the-hook-endpoint)
* [Wire the hook to requests](#wire-the-hook-to-requests)
* [Verify the guardrail](#verify-the-guardrail)
* [Variations](#variations)
* [Block requests](#block-requests)
* [Strip tool declarations](#strip-tool-declarations)
* [Next steps](#next-steps)
Scroll to top