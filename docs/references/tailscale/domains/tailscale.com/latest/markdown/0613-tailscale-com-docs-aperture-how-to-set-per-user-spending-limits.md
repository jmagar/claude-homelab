Set per-user spending limits · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Set per-user spending limits
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
When multiple people use LLMs through Aperture, a single user can consume a disproportionate share of your AI budget. Per-user spending limits give each person an independent budget that refills automatically, so no one exhausts the team's resources.
Aperture uses quota buckets to enforce spending limits. Each bucket has a capacity (maximum balance), a refill rate, and a behavior when the limit is exceeded. Using the `\<user\>` template variable in the bucket name creates a separate bucket for each person who sends requests through Aperture.
## [Prerequisites](#prerequisites)
Before you begin, ensure you have the following:
* An [Aperture instance](/docs/aperture/get-started) with at least one provider configured.
* Admin access to the [Aperture configuration](/docs/aperture/configuration).
## [Define a per-user quota bucket](#define-a-per-user-quota-bucket)
Open the **Settings** page in the [Aperture dashboard](/docs/aperture/reference/dashboard) and add a `quotas` section to your configuration. The following example creates a per-user bucket with a $10 capacity that refills at $5 per day:
```
`"quotas": {
"daily:\<user\>": {
"capacity": "$10.00",
"rate": "$5.00/day",
"on\_exceed": "reject"
}
}
`
```
The `\<user\>` template expands to each caller's Tailscale login name at request time. For example, when `alice@example.com` sends a request, Aperture charges the bucket `daily:alice@example.com`. When `bob@example.com` sends a request, Aperture charges `daily:bob@example.com`. Each bucket tracks its balance independently.
The `capacity` field sets the maximum balance the bucket can hold. This is also the starting balance. The `rate` field controls how fast the bucket refills. Supported time units are `min`, `hour`, `day`, `week`, and `month` (30 days).
When `on\_exceed` is set to `"reject"`, Aperture blocks requests that would bring the bucket below zero and returns HTTP 429 with a `Retry-After` header. `"reject"` is the only supported value for `on\_exceed`.
## [Attach the quota to a grant](#attach-the-quota-to-a-grant)
A quota bucket has no effect until a grant references it. Add a `quotas` entry to the capability in your `grants` section that should enforce the limit:
```
`"grants": [
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{ "role": "user" },
{
"models": "\*\*",
"quotas": [
{"bucket": "daily:\<user\>"}
]
}
]
}
}
]
`
```
This grant applies the per-user quota to all models for all users. When a request matches the grant, Aperture checks the user's bucket balance before forwarding the request. After the response completes, Aperture deducts the estimated cost from the bucket.
## [Scope a quota to specific models](#scope-a-quota-to-specific-models)
To limit spending on expensive models while leaving others unmetered, create a quota that applies only to specific model patterns:
```
`"quotas": {
"opus:\<user\>": {
"capacity": "$5.00",
"rate": "$2.50/day",
"on\_exceed": "reject"
}
},
"grants": [
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{ "models": "\*\*" },
{
"models": "\*/claude-opus\*",
"quotas": [
{"bucket": "opus:\<user\>"}
]
}
]
}
}
]
`
```
In this configuration, requests to Opus models are metered against the `opus:\<user\>` bucket, while all other models have no spending limit.
## [Verify the configuration](#verify-the-configuration)
After saving the configuration, confirm the quota is active:
1. Send a test request through Aperture.
2. Check the [quota status](/docs/aperture/how-to/check-and-refill-budgets) using the API (`GET /api/quotas`) or the **Models** page in the Aperture dashboard. The quota bucket for your user should appear with the correct capacity and a balance reduced by the cost of your test request.
If a request exceeds the quota, Aperture returns an error formatted to match the provider's native error format (for example, `rate\_limit\_error` for Anthropic, `insufficient\_quota` for OpenAI). For troubleshooting details, refer to [Troubleshooting Aperture](/docs/aperture/troubleshooting).
## [Next steps](#next-steps)
* [Set a team-wide budget](/docs/aperture/how-to/set-team-budget) to add an organization-level spending cap alongside per-user limits.
* [Check and refill budgets](/docs/aperture/how-to/check-and-refill-budgets) to monitor bucket balances and manually add funds.
* Refer to the [quotas configuration reference](/docs/aperture/configuration#quotas) for the complete field reference and additional examples.
On this page
* [Prerequisites](#prerequisites)
* [Define a per-user quota bucket](#define-a-per-user-quota-bucket)
* [Attach the quota to a grant](#attach-the-quota-to-a-grant)
* [Scope a quota to specific models](#scope-a-quota-to-specific-models)
* [Verify the configuration](#verify-the-configuration)
* [Next steps](#next-steps)
Scroll to top