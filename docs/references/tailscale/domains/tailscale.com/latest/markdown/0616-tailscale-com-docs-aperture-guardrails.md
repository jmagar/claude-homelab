Guardrails · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Guardrails
Last validated: Apr 22, 2026
Aperture guardrails is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Guardrails are pre-request hooks that let you inspect, modify, or block LLM requests before data leaves your network. Use guardrails to enforce security policies, scrub PII, or restrict tool usage at the gateway level.
## [How guardrails work](#how-guardrails-work)
Guardrails fire when Aperture receives a request from a client, before Aperture forwards the request to the upstream provider. A guardrail is an HTTP endpoint you deploy that receives request data from Aperture and returns one of three actions: allow, block, or modify.
You define the guardrail endpoint in the Aperture configuration's [`hooks`](/docs/aperture/configuration#hooks) section, then wire it to requests using a grant with `send\_hooks` set to the `pre\_request` event. When a request matches the grant, Aperture calls your endpoint and waits for a response before proceeding.
## [Actions](#actions)
A guardrail returns one of three actions:
* **Allow**: The request proceeds unchanged. Use this when the guardrail inspects the request and finds nothing to act on.
* **Block**: Aperture rejects the request. The client receives an error response with a status code and message. The request never reaches the provider. Use this for hard enforcement, such as rejecting requests that contain PII or violate a compliance policy.
* **Modify**: The guardrail returns a replacement request body. Aperture forwards the modified body to the provider instead of the original. Use this to scrub sensitive data, remove tool declarations, or rewrite content before it reaches the LLM.
## [Hook chains](#hook-chains)
You can stack multiple guardrails on the same request. When multiple guardrails match, Aperture calls them sequentially:
1. Guardrails run in order of descending `preference` (higher values first), with alphabetical order by hook key as the tiebreak.
2. An `allow` response is a no-op: the chain proceeds to the next guardrail.
3. A `modify` response rewrites the request body in place. The next guardrail in the chain receives the modified body.
4. A `block` response terminates the chain. No subsequent guardrails run.
## [Failure behavior](#failure-behavior)
The `fail\_policy` setting on each hook definition controls what happens when Aperture cannot reach a guardrail endpoint or the endpoint returns an error:
* **`fail\_open`** (default): The request proceeds as if the guardrail returned `allow`. This preserves availability when a guardrail is unhealthy, at the cost of skipping enforcement.
* **`fail\_closed`**: Aperture blocks the request with an HTTP 503 error. This preserves enforcement at the cost of availability.
Choose `fail\_closed` for guardrails where enforcement is mandatory, such as PII scrubbing for compliance. Choose `fail\_open` (or accept the default) for guardrails where availability matters more than enforcement, such as content classification.
## [Guardrails versus integration hooks](#guardrails-versus-integration-hooks)
Guardrails use the `pre\_request` event, which is synchronous. Aperture waits for the guardrail response before forwarding the request, so the guardrail can block or modify it inline.
Integration hooks such as [Cerbos](/docs/aperture/how-to/integrate-cerbos) and [Oso](/docs/aperture/how-to/integrate-oso) use `entire\_request` or `tool\_call\_entire\_request` events. These are asynchronous: Aperture calls the hook in the background after the response completes. Asynchronous hooks cannot block or modify requests. They are designed for observation, authorization decisions, and audit logging.
If you need to enforce policies before the request reaches the provider, use a guardrail with `pre\_request`. If you need to observe completed requests or send data to an external authorization or logging system, use an integration hook with `entire\_request` or `tool\_call\_entire\_request`.
## [Limitations](#limitations)
The first edition of guardrails supports pre-request filtering only. Post-response guardrails (filtering LLM output after it returns from the provider) are not supported.
## [Next steps](#next-steps)
* [Set up a guardrail](/docs/aperture/how-to/set-up-guardrails) to configure a PII-scrubbing guardrail end-to-end.
* Review the [hooks configuration reference](/docs/aperture/configuration#hooks) for the full list of hook fields, response format, and chain ordering.
On this page
* [How guardrails work](#how-guardrails-work)
* [Actions](#actions)
* [Hook chains](#hook-chains)
* [Failure behavior](#failure-behavior)
* [Guardrails versus integration hooks](#guardrails-versus-integration-hooks)
* [Limitations](#limitations)
* [Next steps](#next-steps)
Scroll to top