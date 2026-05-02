Set a team-wide budget · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Set a team-wide budget
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Per-user spending limits prevent individual overuse, but they do not cap total organizational spend. A team-wide budget creates a single shared quota bucket that all users draw from, so your organization's aggregate AI costs stay within a defined ceiling.
You can use a team-wide budget on its own or combine it with [per-user spending limits](/docs/aperture/how-to/set-per-user-spending-limits) for layered cost control. When a grant references multiple quota buckets, all buckets must have a positive balance for a request to proceed.
## [Prerequisites](#prerequisites)
Before you begin, ensure you have the following:
* An [Aperture instance](/docs/aperture/get-started) with at least one provider configured.
* Admin access to the [Aperture configuration](/docs/aperture/configuration).
## [Define a shared quota bucket](#define-a-shared-quota-bucket)
Open the **Settings** page in the [Aperture dashboard](/docs/aperture/reference/dashboard) and add a shared bucket to the `quotas` section of your configuration. A shared bucket uses a fixed name without template variables, so all requests draw from the same balance:
```
`"quotas": {
"team-monthly": {
"capacity": "$500.00",
"rate": "$500.00/month",
"on\_exceed": "reject"
}
}
`
```
This creates a single bucket called `team-monthly` with a $500 capacity that refills at $500 per month (30 days). Every request that references this bucket deducts from the same balance regardless of which user sent the request.
The `capacity` field sets the maximum balance the bucket can hold. This is also the starting balance. The `rate` field controls the refill speed. Supported time units are `min`, `hour`, `day`, `week`, and `month` (30 days). When `on\_exceed` is `"reject"`, Aperture blocks requests that would bring the bucket below zero and returns HTTP 429 with a `Retry-After` header.
`"reject"` is the only supported value for `on\_exceed`.
## [Attach the budget to a grant](#attach-the-budget-to-a-grant)
Add the shared bucket to the `quotas` array in your grant. The following example applies the team budget to all users and all models:
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
{"bucket": "team-monthly"}
]
}
]
}
}
]
`
```
## [Combine with per-user limits](#combine-with-per-user-limits)
To enforce both a per-user daily limit and a team-wide monthly cap, define both buckets and reference them in the same grant:
```
`"quotas": {
"daily:\<user\>": {
"capacity": "$10.00",
"rate": "$5.00/day",
"on\_exceed": "reject"
},
"team-monthly": {
"capacity": "$500.00",
"rate": "$500.00/month",
"on\_exceed": "reject"
}
},
"grants": [
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{ "role": "user" },
{
"models": "\*\*",
"quotas": [
{"bucket": "daily:\<user\>"},
{"bucket": "team-monthly"}
]
}
]
}
}
]
`
```
When a grant references multiple quota buckets, Aperture checks all of them before forwarding the request. If any single bucket is exhausted, Aperture rejects the request even if the other buckets have remaining balance. After the response completes, Aperture deducts the estimated cost from every referenced bucket.
## [Verify the configuration](#verify-the-configuration)
After saving the configuration, confirm the budget is active:
1. Send a test request through Aperture.
2. Check the [quota status](/docs/aperture/how-to/check-and-refill-budgets) using the API (`GET /api/quotas`) or the **Models** page in the Aperture dashboard. The `team-monthly` bucket should appear with the correct capacity and a balance reduced by the cost of your test request.
## [Next steps](#next-steps)
* [Set per-user spending limits](/docs/aperture/how-to/set-per-user-spending-limits) to prevent individual users from consuming a disproportionate share of the team budget.
* [Check and refill budgets](/docs/aperture/how-to/check-and-refill-budgets) to monitor the team bucket balance and manually add funds if needed.
* Refer to the [quotas configuration reference](/docs/aperture/configuration#quotas) for the complete field reference and additional examples.
On this page
* [Prerequisites](#prerequisites)
* [Define a shared quota bucket](#define-a-shared-quota-bucket)
* [Attach the budget to a grant](#attach-the-budget-to-a-grant)
* [Combine with per-user limits](#combine-with-per-user-limits)
* [Verify the configuration](#verify-the-configuration)
* [Next steps](#next-steps)
Scroll to top