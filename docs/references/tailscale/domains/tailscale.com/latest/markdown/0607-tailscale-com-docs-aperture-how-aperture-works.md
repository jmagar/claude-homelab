How Aperture works · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# How Aperture works
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Aperture routes all AI requests through a central proxy, giving organizations consistent visibility into AI usage. This page explains the four core mechanisms: identity and authentication, request routing by model, telemetry capture, and session tracking. Together, these enable auditing, cost awareness, and operational insight while letting teams safely adopt LLM clients.
## [Identity and authentication](#identity-and-authentication)
Traditional API proxies require clients to authenticate with tokens or API keys. Aperture eliminates this step by using [Tailscale's identity layer](/docs/concepts/tailscale-identity).
Every connection to a tailnet carries cryptographic proof of identity. When a request arrives at Aperture, the proxy queries Tailscale with the remote IP address. Tailscale responds with the user's login name (for example, `alice@example.com`), a persistent device identifier, and any tags assigned to that device.
This identity is trustworthy because it comes from Tailscale's control plane, not from the client. A user cannot forge their identity without compromising Tailscale's key exchange.
The identity flows through the entire system. Every metric record includes the login name and device ID. The dashboard filters by user. Access control uses roles derived from Tailscale tags.
Clients [connecting using ts-unplug](/docs/aperture/connect-outside-tailnet) also authenticate through Tailscale identity. Each ts-unplug instance joins the tailnet as its own device, so Aperture identifies requests by the ts-unplug device's login name. If each person runs their own ts-unplug instance, Aperture attributes activity to individual users. If multiple people share a single ts-unplug instance, all activity appears under the same identity.
### [Tagged device identity](#tagged-device-identity)
When a [tagged Tailscale device](/docs/features/tags) connects to Aperture, it does not have a user account associated with it. Instead, Aperture creates a synthetic identity from the device's tags.
Aperture sorts the device's tags alphabetically and joins them with commas to create a stable login name. For example, a device with the tags `tag:prod` and `tag:api` appears as `tag:api,tag:prod` in dashboards, logs, and session tracking.
If a device has no user profile and no tags, identity resolution fails, and the device is denied access.
To grant access to a tagged device, use this synthetic identity in the grant's `src` field (this applies to both `grants` and `temp\_grants` — they use the same `src` JSON field with identical matching behavior):
* A single-tagged device with `tag:ci-runner`:
```
`"src": ["tag:ci-runner"]
`
```
* A multi-tagged device with `tag:api` and `tag:prod`:
```
`"src": ["tag:api,tag:prod"]
`
```
* A wildcard that matches all nodes, including tagged nodes:
```
`"src": ["\*"]
`
```
**Finding the correct tag string**: To discover the exact tag string for a node, you can:
1. Temporarily set `src: ["\*"]` to allow the node to connect, then observe the synthetic identity in Aperture's dashboards and tighten grants to the exact tag string.
2. Construct it manually by sorting the node's tags alphabetically and joining them with commas.
3. Find the node's tags in the Tailscale admin console.
If all sessions from tagged nodes appear to come from the same user, refer to [all sessions appear to come from the same user](/docs/aperture/troubleshooting#all-sessions-appear-to-come-from-the-same-user) in the troubleshooting guide.
## [Request routing by model](#request-routing-by-model)
When a request arrives, Aperture extracts the model name from the request body (for example, `claude-sonnet-4-6` or `gpt-4o`). The proxy looks up which provider serves that model and forwards the request to that provider's API endpoint, injecting the correct authentication headers.
From the client's perspective, the proxy appears as if it were the LLM provider itself. Clients connect to the proxy URL and send standard API requests. The proxy handles the routing transparently.
The following table summarizes the supported API formats. For full provider details, including compatibility flags, refer to the [provider compatibility reference](/docs/aperture/provider-compatibility).
|Format|Endpoint|Providers|
|OpenAI Chat|`POST /v1/chat/completions`|OpenAI, OpenRouter, llama.cpp|
|OpenAI Responses|`POST /v1/responses`|OpenAI|
|Anthropic Messages|`POST /v1/messages`|Anthropic|
|Gemini|`POST /v1beta/models/{model}:generateContent`|Google|
|Amazon Bedrock|`POST /bedrock/model/{model}/invoke`|Amazon Bedrock|
|Vertex AI|`POST /v1/projects/{project}/locations/{region}/publishers/{publisher}/models/{model}`|Google Vertex AI|
## [Telemetry capture](#telemetry-capture)
The capture system records everything needed to reconstruct and analyze each LLM interaction:
* **Request data**: HTTP method, path, headers (with sensitive values redacted), and full request body.
* **Response data**: Status code, headers, and full response body.
* **Extracted metrics**: Token counts by type (input, output, cached, and reasoning), model name, request duration, and tool use count.
* **Session context**: Session ID linking related requests with supported providers and agents such as Claude Code and Codex.
The proxy processes telemetry asynchronously after the response completes, so clients receive responses without significant delay.
The proxy handles two technical challenges transparently:
* **Compression**: The proxy decompresses response bodies that arrive compressed (`gzip`, `deflate`, or Brotli) before storing them.
* **Streaming**: For streaming responses (Server-Sent Events), the proxy reconstructs a complete response object from the event stream for consistent metric extraction.
## [Session tracking](#session-tracking)
A single coding task or conversation typically involves many LLM requests. A developer using Claude Code can generate 50 or more requests while debugging one issue. Without grouping, these appear as 50 unrelated events. With session tracking, they form a coherent unit you can analyze as a whole.
Aperture groups related requests into sessions by detecting session identifiers from different client types. The following table describes how each client type identifies sessions:
|Client type|Identification method|
|Claude Code|Session ID included in each request body|
|OpenAI Codex|Session ID sent as HTTP header|
|OpenAI Chat|Fingerprint generated from conversation content|
|Other clients|Random identifier assigned|
Sessions enable conversation-level analysis. The [**Logs** page](/docs/aperture/reference/dashboard) of the Aperture dashboard groups requests by session, showing the full context of a coding session or chat conversation. You can review token costs per conversation rather than per request, trace how a coding assistant deconstructed a task, or identify which conversation consumed the most resources.
## [Next steps](#next-steps)
* [Get started with Aperture](/docs/aperture/get-started): sign up, configure providers, and connect your first LLM client.
* [Control AI access](/docs/aperture/control-access): set up grants that define which models each user can access.
* [Observe and export AI usage](/docs/aperture/observe-and-export): access dashboards and export usage data.
On this page
* [Identity and authentication](#identity-and-authentication)
* [Tagged device identity](#tagged-device-identity)
* [Request routing by model](#request-routing-by-model)
* [Telemetry capture](#telemetry-capture)
* [Session tracking](#session-tracking)
* [Next steps](#next-steps)
Scroll to top