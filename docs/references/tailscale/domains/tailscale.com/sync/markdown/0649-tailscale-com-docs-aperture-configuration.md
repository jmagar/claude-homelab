Aperture by Tailscale configuration · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Aperture by Tailscale configuration
Last validated: Apr 22, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
During the alpha testing period, Aperture by Tailscale is available at no additional cost across [all Tailscale plans](/pricing). Request access at [`aperture.tailscale.com`](https://aperture.tailscale.com). Aperture by Tailscale comes with six free users. Contact Tailscale for pricing if you need more than six users.
[Aperture by Tailscale](/docs/aperture) uses a JSON configuration to specify LLM providers, access control policies, and optional integrations. The Aperture configuration controls which models are available, how requests authenticate with upstream providers, and who can access what. Admins can edit the configuration from the **Settings** page of the [Aperture dashboard](/docs/aperture/reference/dashboard) using the **Visual editor** (default) or the **JSON editor**.
This topic is part of the [Aperture reference](/docs/aperture/reference) documentation.
## [Minimal configuration](#minimal-configuration)
A minimal configuration requires at least one provider with a base URL and at least one model. The following example shows a minimal configuration:
```
`{
"providers": {
"anthropic": {
"baseurl": "https://api.anthropic.com",
"apikey": "\<anthropic-api-key\>",
"models": [
"claude-sonnet-4-5",
"claude-opus-4-5",
],
"authorization": "x-api-key",
"compatibility": {
"anthropic\_messages": true,
}
}
}
}
`
```
If you omit `apikey`, Aperture logs a warning at startup but continues to run. Most providers require an API key for authentication, so add one unless your provider handles authentication differently.
The `apikey` field requires an API key from the provider's developer platform. Consumer and business subscription plans (such as [Claude Pro or Claude Max](https://www.anthropic.com/pricing), [ChatGPT Plus, Pro, or Team](https://openai.com/chatgpt/pricing), or [Gemini Advanced](https://gemini.google.com)) do not provide API keys and are not compatible with Aperture.
## [Default configuration](#default-configuration)
New Aperture instances use a default configuration that includes OpenAI and Anthropic providers with common models. The default grants all users access to all models. The following shows the default configuration:
```
`{
"grants": [
// Grant admin access (permission to see the settings and all other
// users in the dashboard).
{
"src": [
// Explicitly identify certain users by their Tailscale login.
"example-user@example.com",
// Grant admin access to everyone by default.
// Remove this after you've configured explicit admin
// access for yourself.
// BE CAREFUL! If you remove this without granting explicit
// admin access to yourself, you'll lose your ability
// to edit this file.
"\*",
],
"app": {
"tailscale.com/cap/aperture": [
{ "role": "admin" },
],
},
},
// Every user who can access Aperture gets at least user-level access.
// Remove this and Aperture denies access entirely by default.
// Admin access in a separate grant takes precedence over this section.
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{ "role": "user" },
],
},
},
// Default: allow all users to access all models from all providers.
// Without this grant, users can't access any models (deny by default).
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{ "models": "\*\*" },
],
},
},
// This example hook sends traffic to Oso if it matches certain
// parameters. Configure Oso in the "hooks" section for this to work.
{
"src": [
// No users by default. Try "\*" to capture everyone's traffic.
],
"app": {
"tailscale.com/cap/aperture": [
{
"send\_hooks": [
{
"name": "oso",
// Capturing only tool calls
"events": ["tool\_call\_entire\_request"],
"send": ["user\_message", "tools", "request\_body", "response\_body"],
},
],
},
],
},
},
],
// Configure your LLM backends here.
// Fill your API keys in below to share these providers with your team.
// There's no limit to the number of providers you can configure.
"providers": {
"openai": {
"baseurl": "https://api.openai.com",
"name": "OpenAI",
"apikey": "\<openai-api-key\>",
"models": [
"gpt-5",
"gpt-5-mini",
"gpt-5-nano",
"gpt-4.1",
"gpt-4.1-nano",
"gpt-5.1-codex",
"gpt-5.1-codex-max",
],
"compatibility": {
"openai\_chat": true,
"openai\_responses": true,
"anthropic\_messages": false,
},
},
"anthropic": {
"baseurl": "https://api.anthropic.com",
"name": "Anthropic",
"apikey": "\<anthropic-api-key\>",
"models": [
"claude-sonnet-4-5",
"claude-sonnet-4-5-20250929",
"claude-haiku-4-5",
"claude-haiku-4-5-20251001",
"claude-opus-4-5",
"claude-opus-4-5-20251101",
],
"compatibility": {
"openai\_chat": false,
"openai\_responses": false,
"anthropic\_messages": true,
},
},
},
// Hooks are configured API endpoints that Aperture calls under certain
// conditions. The conditions themselves are configured in the
// "grants" section.
"hooks": {
"oso": {
"url": "https://api.osohq.com/api/agents/v1/model-request",
"apikey": "\<oso-api-key\>",
},
},
}
`
```
## [Configuration reference](#configuration-reference)
The Aperture configuration contains several top-level sections that control different aspects of Aperture's behavior. The following table describes the available top-level sections:
|Section|Required|Description|
|`providers`|Yes|Map of LLM provider configurations.|
|`grants`|No|Access control policies for users, models, and quotas. Uses the Tailscale grant structure.|
|`quotas`|No|Dollar-based spending limits using token buckets.|
|`hooks`|No|Webhook endpoint configurations.|
|`exporters`|No|LLM session log export configuration. Currently supports S3-compatible storage.|
|`auto\_cost\_basis`|No|Boolean (default `true`). When `true`, Aperture infers `cost\_basis` from a provider's compatibility flags when no explicit `cost\_basis` is set. Set to `false` to disable auto-inference, so only providers with an explicit `cost\_basis` produce cost estimates.|
### [`providers`](#providers)
The `providers` section specifies the LLM providers to which Aperture routes requests. A unique string key identifies each provider. The following example shows the basic structure:
```
`{
"providers": {
"openai": { ... },
"anthropic": { ... },
"private": { ... }
}
}
`
```
Each provider configuration accepts the following fields:
|Field|Type|Required|Default|Description|
|`baseurl`|string|Yes|N/A|Base URL for the provider's API.|
|`models`|array|Yes|N/A|List of model IDs available from this provider.|
|`apikey`|string|No|`""`|API key for authentication.|
|`authorization`|string|No|`"bearer"`|Authorization header type.|
|`name`|string|No|`""`|Display name for the UI.|
|`description`|string|No|`""`|Description shown in the UI.|
|`compatibility`|object|No|`openai\_chat` enabled, all others disabled|API compatibility flags. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for details.|
|`cost\_basis`|string|No|Auto-inferred|Override the pricing service used for cost estimation. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for valid values.|
|`preference`|int|No|`0`|Routing priority when a model is available from multiple providers. Higher value wins.|
|`disabled`|bool|No|`false`|Deactivates the provider without removing its configuration. Disabled providers are excluded from routing and `/v1/models`.|
|`add\_headers`|array|No|`[]`|Custom headers added to every upstream request for this provider. Each entry uses `"Header-Name: value"` format.|
|`model\_cost\_map`|array|No|`[]`|Map unknown model names to known models for pricing. Refer to [model cost map](/docs/aperture/provider-compatibility#model-cost-map).|
The `authorization` field is not required for all providers. For example, Vertex AI uses a service account key file instead of an API key (prefixed with `keyfile::`). Refer to [set up a Vertex AI provider](/docs/aperture/how-to/use-vertex-ai) for step-by-step configuration instructions.
#### [Authorization types](#authorization-types)
Different providers require different authorization header formats. The `authorization` field supports `bearer` (default, used by OpenAI and most providers), `x-api-key` (Anthropic), and `x-goog-api-key` (Google Gemini). For the full authorization types table and provider-specific details, refer to the [provider compatibility reference](/docs/aperture/provider-compatibility).
#### [Provider compatibility](#provider-compatibility)
The `compatibility` object specifies which API formats the provider supports. This determines which endpoints Aperture exposes for the provider's models. Flags include `openai\_chat` (default enabled), `openai\_responses`, `anthropic\_messages`, `gemini\_generate\_content`, `bedrock\_model\_invoke`, and others. For the complete compatibility flags table, provider matrix, and configuration examples for each provider, refer to the [provider compatibility reference](/docs/aperture/provider-compatibility).
#### [Provider examples](#provider-examples)
For complete configuration examples for each supported provider (OpenAI, Anthropic, Google Gemini, Vertex AI, Amazon Bedrock, OpenRouter, and self-hosted LLMs), refer to the [provider compatibility reference](/docs/aperture/provider-compatibility).
### [Pricing and cost estimation](#pricing-and-cost-estimation)
Aperture estimates the dollar cost of every LLM request. Cost estimates power quotas, hook metadata, and the per-model pricing shown in the Aperture dashboard. Aperture auto-infers pricing for known providers based on compatibility flags, but you can override this with the `cost\_basis` and `model\_cost\_map` provider fields. For the full list of `cost\_basis` values, model cost mapping syntax, and per-provider pricing details, refer to the [provider compatibility reference](/docs/aperture/provider-compatibility).
Aperture surfaces cost data in several places:
* **Models** page of the Aperture dashboard: Each model shows per-million-token pricing (input/output) with a tooltip that includes cache, reasoning, image, and web search rates.
* **CSV export**: The **Adoption** page's **Download CSV** button exports usage data including token counts per model, user, and date.
* **Hooks**: Include `"estimated\_cost"` in a hook's `send` array to receive dollar cost, cost basis, and token usage with every hook call. Refer to [hook send types](#hook-send-types) for details.
### [`grants`](#grants)
The `grants` section specifies access control policies that determine which users can access which models, what hooks fire, and which quotas apply. Grants use the [Tailscale grant structure](/docs/features/access-control/grants/grants-app-capabilities) with capabilities scoped under `"tailscale.com/cap/aperture"`. Aperture is deny-by-default: without a matching grant, a user cannot access any models.
For step-by-step instructions on configuring access, refer to [Control model access](/docs/aperture/how-to/grant-model-access) and [Set up admin access](/docs/aperture/how-to/set-up-admin-access).
The `grants` section replaces the deprecated `temp\_grants` syntax with a new structure. The `temp\_grants` syntax still works but is not recommended for new configurations.
Configure grants in the Aperture dashboard (**Settings** page) or through the API (`PUT http://\<aperture-hostname\>/api/config`).
#### [Basic structure](#basic-structure)
A grant specifies a source (`src`) and a set of app capabilities:
```
`"grants": [
{
"src": ["\*"], // who this grant applies to
"app": {
"tailscale.com/cap/aperture": [
// array of individual capabilities
{ "models": "\*\*" }, // allow access to all models
],
},
},
]
`
```
#### [Source match (`src`)](#source-match-src)
The `src` field determines which users a grant applies to:
* `"\*"`: Matches everyone.
* `"alice@example.com"`: Matches a specific Tailscale login name.
* `"group:engineering"`: Matches members of a Tailscale ACL group or SCIM group. Requires the `tailscale.com/visible-groups` [node attribute](/docs/features/node-attributes) on the Aperture device.
* `"engineering@example.com"`: Matches members of a SCIM group (by email). Requires the `tailscale.com/visible-groups` [node attribute](/docs/features/node-attributes) on the Aperture device.
* `"tag:ci-runner"`: Matches a tagged device.
* `"(loopback)"`: Matches local/loopback requests (useful for development).
#### [Model access](#model-access)
Each `models` field accepts a single glob pattern using fully-qualified `provider/model` format. To match multiple providers, use separate grant entries.
|Pattern|Matches|
|`"\*\*"`|All models from all providers|
|`"anthropic/\*\*"`|All Anthropic models|
|`"openai/gpt-5"`|Exactly `openai/gpt-5`|
|`"\*/claude-sonnet\*"`|Any `claude-sonnet\*` model from any single provider|
|`"aperture-\*/\*\*"`|Any model from a provider whose name starts with `aperture-`|
`\*` matches a single path segment. `\*\*` matches zero or more segments.
A grant with no `models` field is "floating," meaning it applies globally (useful for hooks and quotas that apply regardless of model).
#### [Role assignment](#role-assignment)
Roles determine a user's permission level:
```
`{ "role": "admin" } // full admin access
{ "role": "user" } // standard user access
`
```
Without a role grant, the user cannot access Aperture. If multiple grants match a given user, the highest-permissioned role (admin) wins.
#### [MCP access](#mcp-access)
Aperture's MCP server support is experimental. The MCP grants syntax may change.
Grant access to registered MCP items in the same way as models:
```
`{
"mcp\_tools": "local/\*", // tools from the "local" MCP server
"mcp\_resources": "\*\*", // all resources from all servers
"mcp\_templates": "remote/\*", // templates from "remote" server
}
`
```
#### [Additional capability fields](#additional-capability-fields)
Each capability object in the `tailscale.com/cap/aperture` array can also include these fields:
|Field|Type|Description|
|`add\_headers`|array|Custom headers prepended to upstream requests when this grant matches. Each entry uses `"Header-Name: value"` format.|
|`enable\_chat\_ui`|bool|Grants access to the chat UI feature.|
|`read\_metrics`|bool|Grants access to the `/metrics` Prometheus endpoint.|
#### [Custom app capabilities](#custom-app-capabilities)
Grants can include capability keys beyond `tailscale.com/cap/aperture`. Aperture passes these through to hooks when you include the `"grants"` send type:
```
`{
"src": ["admin@example.com"],
"app": {
"tailscale.com/cap/aperture": [
{ "role": "admin" },
{ "models": "\*\*" },
],
// Custom capability — forwarded to hooks via "grants" send type
"mycompany.com/cap/policy": [
{ "tier": "enterprise", "department": "engineering" },
],
},
},
`
```
When a hook includes `"grants"` in its `send` array, these custom capabilities appear in the hook metadata. External systems can use these capabilities to make authorization decisions.
### [`quotas`](#quotas)
The `quotas` section specifies dollar-based spending limits using token buckets. Each bucket has a capacity (maximum balance) and a refill rate. When a request's estimated cost would bring a bucket below zero, Aperture rejects the request with HTTP 429.
For step-by-step instructions, refer to [Set per-user spending limits](/docs/aperture/how-to/set-per-user-spending-limits) and [Set a team-wide budget](/docs/aperture/how-to/set-team-budget). To check and refill budgets, refer to [Check and refill budgets](/docs/aperture/how-to/check-and-refill-budgets).
```
`"quotas": {
// Per-user daily budget: refills $5/day, can burst up to $10
"daily:\<user\>": {
"capacity": "$10.00",
"rate": "$5.00/day",
"on\_exceed": "reject",
},
// Shared pool across all users who reference it
"eng-team-pool": {
"capacity": "$100.00",
"rate": "$100.00/day",
"on\_exceed": "reject",
},
// Per-user limit for expensive models
"opus:\<user\>": {
"capacity": "$5.00",
"rate": "$2.50/day",
"on\_exceed": "reject",
},
}
`
```
Each quota accepts the following fields:
|Field|Format|Description|
|`capacity`|`"$\<amount\>"`|Maximum balance the bucket can hold. Also the starting balance. Setting this to `"$0.00"` causes Aperture to reject all matching requests.|
|`rate`|`"$\<amount\>/\<unit\>"`|How fast the bucket refills. Units: `min`, `hour`, `day`, `week`, `month` (30 days).|
|`on\_exceed`|`"reject"`|Action when a request would bring the bucket below zero. The supported value is `"reject"` (HTTP 429).|
Quota configuration uses dollar strings (for example, `"$10.00"`). [Hook payloads](#hooks) represent the same values in nanodollars (1 dollar = 1,000,000,000 nanodollars).
#### [Template variables](#template-variables)
Quota names can include template variables that expand at request time:
|Template|Expands to|Example|
|`\<user\>`|Caller's Tailscale login name or tag combination|`daily:\<user\>` expands to `daily:alice@example.com`|
|`\<node\>`|Caller's node ID (a distinct quota for each node, even if nodes share the same user or tag)|`device:\<node\>` expands to `device:nXXXXXXXXXCNTRL`|
Quotas without a template variable (for example, `eng-team-pool`) create a single shared bucket.
#### [Attach quotas to grants](#attach-quotas-to-grants)
Quotas take effect only when attached to grants. A quota specified in the `quotas` section does nothing until a grant references it. When a request matches a grant, all quotas listed in that grant are charged at the same time:
```
`"grants": [
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{
"models": "\*\*",
"quotas": [
{"bucket": "daily:\<user\>"},
{"bucket": "eng-team-pool"},
],
},
],
},
},
]
`
```
#### [How multiple quotas interact](#how-multiple-quotas-interact)
When a grant references multiple quota buckets, all buckets must have a positive balance for the request to proceed. If any single bucket is exhausted, Aperture rejects the request, even if other buckets have remaining balance.
After the response completes, Aperture deducts the estimated cost from every referenced bucket at the same time.
A request can match multiple grants, each with their own quotas. Aperture collects and enforces all matching quotas together.
#### [Bucket lifecycle](#bucket-lifecycle)
Aperture persists quota bucket balances. When you update a quota definition (for example, changing the capacity or refill rate), Aperture adjusts existing balances to match the new settings and caps each balance at the new capacity. Aperture removes buckets whose quota definitions you delete from the configuration.
If you reduce a bucket's `capacity`, any existing balance above the new capacity is capped to the new value. The excess is not recoverable.
#### [Quota examples](#quota-examples)
The following examples show common quota configurations.
##### [Per-user quota](#per-user-quota)
Each user gets their own bucket with independent capacity and refill rate:
```
`"quotas": {
"daily:\<user\>": {
"capacity": "$10.00",
"rate": "$5.00/day",
"on\_exceed": "reject",
},
},
"grants": [
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{ "role": "user" },
{ "models": "\*\*",
"quotas": [{"bucket": "daily:\<user\>"}] },
],
},
},
]
`
```
This creates a separate bucket for each user (for example, `daily:alice@example.com`, `daily:bob@example.com`), each with $10 capacity and a $5/day refill.
##### [Quota scoped to specific models](#quota-scoped-to-specific-models)
Apply a quota only when the request targets specific models:
```
`"quotas": {
"opus:\<user\>": {
"capacity": "$5.00",
"rate": "$2.50/day",
"on\_exceed": "reject",
},
},
"grants": [
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
// General access — no quota
{ "models": "\*\*" },
// Additional quota for Opus models only
{
"models": "\*/claude-opus\*",
"quotas": [{"bucket": "opus:\<user\>"}],
},
],
},
},
]
`
```
The `opus:\<user\>` quota applies only when the request targets an Opus model. Other models are unmetered.
##### [Combine per-user and shared quotas](#combine-per-user-and-shared-quotas)
Charge each request against both a personal budget and a shared team pool:
```
`"quotas": {
"daily:\<user\>": {
"capacity": "$10.00",
"rate": "$5.00/day",
"on\_exceed": "reject",
},
"team-monthly": {
"capacity": "$500.00",
"rate": "$500.00/month",
"on\_exceed": "reject",
},
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
{"bucket": "team-monthly"},
],
},
],
},
},
]
`
```
In this example, every request deducts from both the user's daily bucket and the shared team-monthly bucket. A user who exhausts either bucket is blocked.
### [`hooks`](#hooks)
The `hooks` section specifies webhook endpoints that Aperture calls when conditions match. A unique string key identifies each hook, and grants reference this key. For step-by-step setup, refer to [Build a custom webhook](/docs/aperture/how-to/build-custom-webhook). For integration-specific guides, refer to [Integrate Oso with Aperture](/docs/aperture/how-to/integrate-oso) or [Integrate Cerbos with Aperture](/docs/aperture/how-to/integrate-cerbos).
The following example shows the hooks configuration:
```
`{
"hooks": {
"oso": {
"url": "https://api.osohq.com/api/agents/v1/model-request",
"apikey": "\<oso-api-key\>",
"timeout": "10s"
},
"my-webhook": {
"url": "https://example.com/webhook",
"apikey": "\<api-key\>"
}
}
}
`
```
Each hook configuration accepts the following fields:
|Field|Type|Required|Default|Description|
|`url`|string|Yes|N/A|HTTP or HTTPS endpoint to POST hook data to.|
|`apikey`|string|No|`""`|API key that Aperture sends to the hook endpoint using the method specified by `authorization`.|
|`authorization`|string|No|`"bearer"`|How Aperture sends the API key. Supports the same values as provider authorization: `bearer`, `x-api-key`, `x-goog-api-key`.|
|`timeout`|string|No|`"5s"`|Maximum duration to wait for the hook to respond.|
|`disabled`|boolean|No|`false`|Skips this hook when Aperture would otherwise call it. Useful for temporarily disabling a hook without removing its configuration.|
|`fail\_policy`|string|No|`"fail\_open"`|Behavior when the hook is unreachable or returns an error. `fail\_open` lets the request proceed. `fail\_closed` blocks the request. Applies to `pre\_request` hooks only.|
|`preference`|int|No|`0`|Execution priority among stacked hooks. Higher values run first. Hooks with equal preference run in alphabetical order by key. Not related to the provider-level `preference` field.|
The `timeout` field accepts Go duration strings such as `5s`, `30s`, or `1m`. Set to `0` to disable the timeout.
The `send\_hooks` entries in the `grants` section trigger hooks. A hook specified here does nothing until a grant references it.
### [Hook grants](#hook-grants)
To trigger a hook, add a `send\_hooks` entry to a capability in the `grants` section. Hook grants specify which requests trigger the hook and what data to send.
```
`{
"grants": [
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{
"models": "\*\*",
"send\_hooks": [
{
"name": "oso",
"events": ["tool\_call\_entire\_request"],
"send": ["tools", "user\_message", "request\_body", "response\_body"],
},
],
},
],
},
},
]
}
`
```
Each `send\_hooks` entry contains the following fields:
|Field|Type|Description|
|`name`|string|Key referencing a hook specified in the top-level `hooks` section.|
|`events`|array|Event types that trigger the hook.|
|`send`|array|List of data types to include in the hook payload.|
#### [Hook events](#hook-events)
|Event|Description|
|`pre\_request`|Fires before the provider call. Synchronous: Aperture waits for the hook response. The hook can allow, block, or modify the request.|
|`entire\_request`|Fires for every completed request. Asynchronous: does not affect the request or response.|
|`tool\_call\_entire\_request`|Fires once after the response completes if any message in the response contained tool calls. Asynchronous: does not affect the request or response.|
#### [Hook send types](#hook-send-types)
The `send` array specifies which data to include in the POST payload sent to the hook endpoint:
|Field|Description|
|`tools`|Array of tool calls extracted from the response.|
|`request\_body`|The original request body sent to the LLM.|
|`user\_message`|The user's message from the request.|
|`response\_body`|The reconstructed response body JSON.|
|`raw\_responses`|Array of raw SSE messages (for streaming) or single response object.|
|`estimated\_cost`|Dollar cost estimate, pricing basis, and token usage breakdown.|
|`grants`|Non-Aperture app capabilities from the user's grants (custom capabilities).|
|`quotas`|Current state of all quota buckets that applied to this request.|
#### [`estimated\_cost`](#estimated_cost)
Includes the dollar cost estimate, the pricing basis used, and a token usage breakdown. These fields appear inside the `metadata` object of the hook payload:
```
`{
"models": "\*\*",
"send\_hooks": [
{
"name": "audit",
"events": ["tool\_call\_entire\_request"],
"send": ["tools", "estimated\_cost"],
},
],
}
`
```
The hook receives the cost data inside `metadata`:
```
`{
"metadata": {
"login\_name": "user@example.com",
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
#### [`grants`](#grants-1)
Includes any non-Aperture app capabilities from the user's grants. This lets external systems (policy engines, audit logs) access custom capabilities attached to the user. The `grants` data appears inside the `metadata` object:
```
`{
"src": ["alice@example.com"],
"app": {
"tailscale.com/cap/aperture": [
{ "models": "\*\*" },
{
"send\_hooks": [
{
"name": "policy-engine",
"events": ["entire\_request"],
"send": ["estimated\_cost", "grants"],
},
],
},
],
"mycompany.com/cap/policy": [
{"tier": "enterprise", "max\_context": 200000},
],
},
}
`
```
The hook receives the custom capabilities inside `metadata`:
```
`{
"metadata": {
"login\_name": "alice@example.com",
"...": "...",
"grants": {
"mycompany.com/cap/policy": [
{"tier": "enterprise", "max\_context": 200000}
]
},
"estimated\_cost": { "..." }
}
}
`
```
#### [`quotas`](#quotas-1)
Includes the current state of all quota buckets that applied to the request. The `quotas` data appears inside the `metadata` object:
```
`"send": ["tools", "quotas"]
`
```
The hook receives the bucket state inside `metadata`:
```
`{
"metadata": {
"login\_name": "alice@example.com",
"...": "...",
"quotas": {
"daily:alice@example.com": {
"current": 7250000000,
"capacity": 10000000000,
"rate": "$5.00/day"
}
}
}
}
`
```
Values for `current` and `capacity` are in nanodollars (1 dollar = 1,000,000,000 nanodollars).
Every hook call automatically includes a `metadata` object with request context:
```
`{
"metadata": {
"login\_name": "user@example.com",
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
#### [Hook grant example](#hook-grant-example)
The following example sends tool call data and cost estimates to an audit service for all requests from a specific user:
```
`{
"grants": [
{
"src": ["developer@company.com"],
"app": {
"tailscale.com/cap/aperture": [
{
"models": "anthropic/\*\*",
"send\_hooks": [
{
"name": "my-webhook",
"events": ["tool\_call\_entire\_request"],
"send": ["tools", "user\_message", "estimated\_cost"],
},
],
},
{
"models": "openai/\*\*",
"send\_hooks": [
{
"name": "my-webhook",
"events": ["tool\_call\_entire\_request"],
"send": ["tools", "user\_message", "estimated\_cost"],
},
],
},
],
},
},
]
}
`
```
#### [Hook response format](#hook-response-format)
For `pre\_request` hooks, the hook endpoint must return a JSON response that tells Aperture how to handle the request. Asynchronous hooks (`entire\_request`, `tool\_call\_entire\_request`) ignore the response body; any valid JSON (including `{}`) is sufficient.
The response contains the following fields:
|Field|Type|Required|Default|Description|
|`action`|string|Yes|N/A|How to handle the request. Valid values: `allow`, `block`, `modify`.|
|`status\_code`|int|No|`403`|HTTP status code returned to the client. Applies to `block` only.|
|`message`|string|No|`"request blocked by guardrail"`|Error message returned to the client. Applies to `block` only.|
|`request\_body`|object|Required for `modify`|N/A|Replacement request body forwarded to the provider.|
The three actions:
* **`allow`** — The request proceeds unchanged. Aperture ignores other fields.
* **`block`** — Aperture rejects the request without forwarding it to the provider. The client receives a format-specific error response with the `status\_code` and `message`.
* **`modify`** — Aperture replaces the forwarded request body with the `request\_body` from the hook response and continues to the provider. The `request\_body` must be a JSON object. If the hook returns a non-object, Aperture treats the response as `allow`.
When a hook blocks a request, the client receives an error envelope that matches the API format of the original request:
|API format|Error envelope|
|OpenAI Chat / Responses|`{"error": {"message": "...", "type": "guardrail\_blocked"}}`|
|Anthropic Messages|`{"type": "error", "error": {"type": "invalid\_request\_error", "message": "..."}}`|
|Gemini / Vertex|`{"error": {"code": ..., "message": "...", "status": "PERMISSION\_DENIED"}}`|
|Bedrock Invoke/Converse|Header `x-amzn-ErrorType: AccessDeniedException`; body `{"message": "..."}`|
#### [Hook chains](#hook-chains)
When multiple `pre\_request` hooks match a request, Aperture calls them sequentially in a deterministic order.
**Ordering:** Hooks are sorted by descending `preference`, with alphabetical order by hook key as the tiebreak. A hook with `preference: 10` runs before one with `preference: 0` (the default). Hooks with equal preference run alphabetically: `audit-a` runs before `audit-z`.
**Chain execution:**
* **`allow`** is a no-op. The chain proceeds to the next hook with the current request body.
* **`modify`** rewrites the request body in place. The next hook in the chain receives the modified body, not the original.
* **`block`** terminates the chain immediately. Hooks later in the chain do not run, and the client receives the block response.
If a hook in the chain modifies the request and a later hook blocks it, the block takes effect and the modification is not forwarded to the provider. The blocking hook does receive the modified body when making its decision. To enforce a block independently of earlier modifications, give the blocking hook a higher `preference` so it runs first.
**Failure handling:** When a `pre\_request` hook fails (unreachable, timed out, non-2xx response, or unparseable body), the `fail\_policy` on the hook definition controls what happens. `fail\_open` proceeds to the next hook in the chain. `fail\_closed` blocks the request with HTTP 503 and no subsequent hooks run. Asynchronous hooks always fail open; errors are logged and requests proceed.
### [`exporters`](#exporters)
The `exporters` section configures periodic export of LLM session logs to external storage. Currently, Aperture supports exporting to S3-compatible storage (Amazon S3, Google Cloud Storage, MinIO, Backblaze B2, and others). For step-by-step setup, refer to [Export usage data to S3](/docs/aperture/how-to/export-usage-data-to-s3).
The following example shows the exporters configuration:
```
`{
"exporters": {
"s3": {
"endpoint": "https://your-s3-compatible-endpoint.url",
"bucket\_name": "aperture-exports",
"region": "us-east-1",
"prefix": "prod",
"access\_key\_id": "\<aws-access-key-id\>",
"access\_secret": "\<aws-secret-access-key\>",
"every": 3600,
"limit": 1000
}
}
}
`
```
Setting `bucket\_name` to a non-empty value enables the S3 exporter. Each S3 exporter configuration accepts the following fields:
|Field|Type|Required|Default|Description|
|`endpoint`|string|No|`""`|HTTP endpoint for an S3-compatible API. Required for non-AWS services (GCS, MinIO, Backblaze B2). Omit for Amazon S3, where Aperture infers the endpoint from `region`.|
|`bucket\_name`|string|Conditional|`null`|Name of the S3 bucket to upload exports to. Setting this field to a non-empty value enables the S3 exporter.|
|`region`|string|No|`"us-east-1"`|AWS region for the bucket. Required even for non-AWS endpoints because the AWS SDK validates this field.|
|`prefix`|string|No|`""`|Path prefix for new S3 objects. Must not end with `/`.|
|`access\_key\_id`|string|Conditional|`null`|AWS access key ID used to authenticate. Required and must be non-empty when `bucket\_name` is set and static credentials are used.|
|`access\_secret`|string|Conditional|`null`|Secret key used with `access\_key\_id` to authenticate. Required and must be non-empty when `access\_key\_id` is set.|
|`every`|int|No|`3600`|Number of seconds to wait after the last export before starting another. Default is one hour.|
|`limit`|int|No|`1000`|Maximum number of records per export. Aperture caps this value at `10000` and reduces higher values without a warning.|
### [MCP](#mcp)
Aperture's MCP server support is experimental. The MCP configuration syntax may change.
The `mcp` section configures MCP (Model Context Protocol) server proxying. Aperture connects to remote MCP servers, aggregates their tools, resources, and resource templates, and exposes them through a single `/v1/mcp` endpoint. Refer to [MCP server proxying](/docs/aperture/how-to/mcp-server) for setup instructions and troubleshooting.
```
`{
"mcp": {
"accept\_registrations": true,
"servers": {
"local": {
"url": "http://localhost:8185/v1/mcp"
},
"remote": {
"url": "http://mcp-server.example.ts.net:8080/v1/mcp"
}
}
}
}
`
```
#### [`mcp` fields](#mcp-fields)
|Field|Type|Default|Description|
|`accept\_registrations`|boolean|`false`|Allow backends to register dynamically through `POST /v1/mcp/register`. Backends POST `{"url": "http://..."}` and keep the connection open. Tools are unregistered when the connection closes.|
|`servers`|map|`{}`|Map of server ID to server configuration. The map key is the server ID, which becomes the name prefix for tools (`serverID\_toolname`), resources (`serverID-uri`), and resource templates (`serverID-uriTemplate`) from that backend.|
#### [`servers` fields](#servers-fields)
Each entry in the `servers` map accepts the following fields:
|Field|Type|Required|Description|
|`url`|string|Yes|The MCP server endpoint URL (for example, `http://localhost:8185/v1/mcp`).|
### [`database`](#database)
The `database` section configures data storage behavior, including retention policies for captured request and response data.
```
`{
"database": {
"retention": {
"duration": "30d",
"require\_export": false,
"purge": ["captures"]
}
}
}
`
```
#### [`database.retention` fields](#databaseretention-fields)
|Field|Type|Default|Description|
|`duration`|string|`""`|How long to keep capture data before purging. Examples: `"30d"`, `"720h"`. An empty string keeps data forever. Set to `"0"` for zero local retention (bodies are never written to disk, or are purged immediately after export). Minimum: 1 hour. Maximum: 3650 days.|
|`require\_export`|boolean|`false`|When `true`, Aperture only purges captures that have been successfully exported to an Amazon S3 compatible endpoint. Captures that have not been exported are retained regardless of `duration`.|
|`purge`|array|`["captures"]`|What to delete when purging. `["captures"]` deletes request and response bodies and headers but preserves tool use data. `["captures", "tools"]` also deletes tool use data. Metrics (token counts, model, cost, duration, status code) are always preserved regardless of this setting.|
When Aperture purges a capture, it removes the request body, response body, and headers. The metric record (token counts, model, cost estimate, duration, and status code) is always preserved. This means the dashboard continues to show usage analytics and cost data for purged records; only the full request and response detail is removed.
## [Quota enforcement](#quota-enforcement)
Aperture enforces quotas at request time by checking all referenced buckets before forwarding a request to the provider.
### [What happens when a request exceeds a quota](#what-happens-when-a-request-exceeds-a-quota)
When a request would exceed any of its quota buckets, Aperture:
1. Rejects the request with HTTP status **429 (Too Many Requests)**.
2. Sets a `Retry-After` header with the estimated seconds until enough budget refills.
3. Formats the error to match the provider's native error format.
4. Logs a warning with the bucket detail, login name, and model.
The following table describes the provider-specific error formats:
|Provider|Error format|
|Anthropic|`{"type":"error","error":{"type":"rate\_limit\_error","message":"..."}}`|
|OpenAI|`{"error":{"message":"...","type":"insufficient\_quota","code":"insufficient\_quota"}}`|
|Bedrock|`{"message":"..."}` with `x-amzn-ErrorType: ThrottlingException`|
|Google/Vertex|`{"error":{"code":429,"message":"...","status":"RESOURCE\_EXHAUSTED"}}`|
### [Where Aperture logs enforcement](#where-aperture-logs-enforcement)
Aperture logs quota exceeded events at the **Warn** level in the server log with the following fields:
* `detail`: Which buckets Aperture exhausted.
* `login\_name`: The user that Aperture blocked.
* `model`: The `provider/model` that the user requested.
## [Validation](#validation)
Aperture validates configuration at load time and reports problems. Some issues are fatal errors that prevent the configuration from loading, while others are warnings that let the configuration load but should be addressed. The following table describes the validations.
Aperture handles validation differently depending on how the configuration is loaded:
* **When Aperture loads configuration at startup or reload**: Aperture logs warnings but loads the configuration successfully. This lets Aperture start even with minor issues.
* **When saving through the API or the Settings page of the Aperture dashboard**: Aperture treats warnings as errors and rejects the save. This ensures that configurations saved through the UI are warning-free.
* **When using the validate endpoint (`POST /aperture/config:validate`)**: Aperture surfaces warnings as validation errors (the response sets `Valid: false`), matching the save behavior.
The admin lockout check only applies when saving — it prevents you from accidentally removing your own admin access.
|Condition|Message|Severity|
|No providers or MCP servers|`no providers or mcp servers defined; users will not be able to access any models`|Warning|
|Provider missing `baseurl`|`provider {id} has no baseurl configured`|Warning|
|Invalid `authorization` type|`provider {id} has invalid authorization type: {type}`|Warning|
|Unresolved environment variable|`unsubstituted macros: [var\_name]`|Error|
|Invalid JSON or HUJSON syntax|Parse error details|Error|
|Invalid quota definition|`quota {name}: {details}`|Error|
|**Structural / syntax**|||
|Duplicate keys in config|`duplicate config key "hostname"`|Warning|
|Unknown config keys|`unknown config key "basurl"`|Warning|
|Type mismatch in field value|Field name and `json.UnmarshalTypeError` details|Warning|
|**Provider**|||
|Invalid `add\_headers` format|`provider {id}: add\_headers entry "Bad-Entry" must be in "Header-Name: value" format`|Warning|
|**Quota**|||
|Invalid quota name template|`quota "{name}": quota name "{name}" has unsupported template "{template}" after colon`|Warning|
|**Grant**|||
|Unknown fields in grant|Strict JSON parsing error for the unrecognized field|Warning|
|Grant `models` references undefined provider|`models pattern "{pattern}" references provider "{name}" which does not match any declared provider`|Warning|
|Grant `mcp\_tools`, `mcp\_resources`, or `mcp\_templates` references undefined MCP server|`mcp\_tools pattern "{pattern}" references server "{name}" which does not match any declared MCP server`|Warning|
|Grant `send\_hooks` references undefined hook|`send\_hooks references undefined hook "{name}"`|Warning|
|Grant `quotas` references undefined quota|`quotas references undefined quota "{name}"`|Warning|
|Invalid quota bucket ref template in grant|`grants[{n}] grant {n} quotas[{n}]: bucket ref "{ref}" has unsupported template...`|Warning|
|Grant-level `add\_headers` invalid format|`add\_headers entry "{entry}" must be in "Header-Name: value" format`|Warning|
|**Hook**|||
|Hook missing URL|`hook {name} has no url configured`|Warning|
|Hook invalid URL scheme|`hook {name} has invalid URL scheme (must be http:// or https://): {url}`|Warning|
|Hook invalid authorization type|`hook {name} has invalid authorization type: {type}`|Warning|
|**Exporter**|||
|S3 prefix ends with `/`|`exporters.s3.prefix must not end with a slash`|Warning|
|**Structural warnings**|||
|No grants assign admin role|`no grant in grants or temp\_grants assigns role:admin; nobody will be able to manage this instance`|Warning|
|Providers configured but no grants defined|`providers are configured but no grants or temp\_grants defined; all access will be denied`|Warning|
|**Save-only**|||
|Empty configuration|`config must not be empty`|Error|
|Admin lockout prevention|Rejects saves that would remove the saving user's admin access|Error|
|**Exporter silent cap**|||
|S3 exporter `limit` exceeds 10000|Aperture silently reduces `limit` to `10000`|Silent|
For common validation issues and how to resolve them, refer to [troubleshooting](/docs/aperture/troubleshooting).
## [Complete example](#complete-example)
The following example shows a complete configuration with all sections:
```
`{
// Access control: who can use which models
"grants": [
// All users: access all models with per-user and org-wide quotas
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{ "role": "user" },
{
"models": "\*\*",
"quotas": [
{"bucket": "daily:\<user\>"},
{"bucket": "org-monthly"},
],
},
],
},
},
// Admin access for specific user with audit hook
{
"src": ["admin@company.com"],
"app": {
"tailscale.com/cap/aperture": [
{ "role": "admin" },
{
"models": "\*\*",
"send\_hooks": [
{
"name": "oso",
"events": ["tool\_call\_entire\_request"],
"send": ["tools", "estimated\_cost"],
},
],
},
],
},
},
],
// Dollar-based spending limits
"quotas": {
"daily:\<user\>": {
"capacity": "$10.00",
"rate": "$5.00/day",
"on\_exceed": "reject",
},
"org-monthly": {
"capacity": "$2000.00",
"rate": "$2000.00/month",
"on\_exceed": "reject",
},
},
// LLM session log export configuration
"exporters": {
"s3": {
// Required for S3-compatible services (GCS, MinIO, Backblaze B2, and others)
"endpoint": "https://your-s3-compatible-endpoint.url",
"bucket\_name": "aperture-exports",
"region": "us-west-2",
"prefix": "prod",
"access\_key\_id": "\<aws-access-key-id\>",
"access\_secret": "\<aws-secret-access-key\>",
"every": 3600,
"limit": 1000
}
},
// LLM providers
"providers": {
"openai": {
"baseurl": "https://api.openai.com/",
"apikey": "\<openai-api-key\>",
"models": ["gpt-5", "gpt-5-mini", "gpt-4.1"],
"name": "OpenAI",
"description": "OpenAI models for coding and chat",
"compatibility": {
"openai\_chat": true,
"openai\_responses": true
}
},
"anthropic": {
"baseurl": "https://api.anthropic.com",
"apikey": "\<proxy-anthropic-api-key\>",
"authorization": "x-api-key",
"models": ["claude-sonnet-4-5", "claude-haiku-4-5", "claude-opus-4-5"],
"name": "Anthropic",
"compatibility": {
"openai\_chat": false,
"anthropic\_messages": true
}
},
"gemini": {
"baseurl": "https://generativelanguage.googleapis.com",
"apikey": "\<proxy-gemini-api-key\>",
"authorization": "x-goog-api-key",
"models": ["gemini-2.5-flash", "gemini-2.5-pro"],
"name": "Google Gemini",
"compatibility": {
"openai\_chat": false,
"gemini\_generate\_content": true
}
},
"private": {
"baseurl": "\<private-llm-url\>",
"models": ["qwen3-coder-30b"]
}
},
// Hooks for external integrations
"hooks": {
"oso": {
"url": "https://api.osohq.com/api/agents/v1/model-request",
"apikey": "\<oso-api-key\>",
},
},
// MCP server proxying
"mcp": {
"accept\_registrations": true,
"servers": {
"tools": {
"url": "http://mcp-tools.example.ts.net:8080/v1/mcp",
},
},
},
}
`
```
On this page
* [Minimal configuration](#minimal-configuration)
* [Default configuration](#default-configuration)
* [Configuration reference](#configuration-reference)
* [providers](#providers)
* [Authorization types](#authorization-types)
* [Provider compatibility](#provider-compatibility)
* [Provider examples](#provider-examples)
* [Pricing and cost estimation](#pricing-and-cost-estimation)
* [grants](#grants)
* [Basic structure](#basic-structure)
* [Source match (src)](#source-match-src)
* [Model access](#model-access)
* [Role assignment](#role-assignment)
* [MCP access](#mcp-access)
* [Additional capability fields](#additional-capability-fields)
* [Custom app capabilities](#custom-app-capabilities)
* [quotas](#quotas)
* [Template variables](#template-variables)
* [Attach quotas to grants](#attach-quotas-to-grants)
* [How multiple quotas interact](#how-multiple-quotas-interact)
* [Bucket lifecycle](#bucket-lifecycle)
* [Quota examples](#quota-examples)
* [Per-user quota](#per-user-quota)
* [Quota scoped to specific models](#quota-scoped-to-specific-models)
* [Combine per-user and shared quotas](#combine-per-user-and-shared-quotas)
* [hooks](#hooks)
* [Hook grants](#hook-grants)
* [Hook events](#hook-events)
* [Hook send types](#hook-send-types)
* [estimated\_cost](#estimated_cost)
* [grants](#grants-1)
* [quotas](#quotas-1)
* [Hook grant example](#hook-grant-example)
* [Hook response format](#hook-response-format)
* [Hook chains](#hook-chains)
* [exporters](#exporters)
* [MCP](#mcp)
* [mcp fields](#mcp-fields)
* [servers fields](#servers-fields)
* [database](#database)
* [database.retention fields](#databaseretention-fields)
* [Quota enforcement](#quota-enforcement)
* [What happens when a request exceeds a quota](#what-happens-when-a-request-exceeds-a-quota)
* [Where Aperture logs enforcement](#where-aperture-logs-enforcement)
* [Validation](#validation)
* [Complete example](#complete-example)
Scroll to top