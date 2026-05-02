Provider compatibility · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Provider compatibility
Last validated: Apr 15, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Aperture routes LLM requests to multiple providers, each with different base URLs, authentication methods, and API formats. This reference lists the supported providers, their compatibility flags, authorization types, and pricing options.
This page is part of the [Aperture reference](/docs/aperture/reference) documentation. For field-level configuration details, refer to the [Aperture configuration reference](/docs/aperture/configuration). For step-by-step provider setup, refer to the [set up LLM providers](/docs/aperture/set-up-providers) guides. To configure coding agents to connect through Aperture, refer to the [set up LLM clients](/docs/aperture/use-your-tools) guides.
## [Provider matrix](#provider-matrix)
The following table summarizes how to configure each supported provider type:
|Provider|Base URL|Authorization|Compatibility flags|`cost\_basis`|Guide|
|[OpenAI](/docs/aperture/how-to/use-openai)|`https://api.openai.com/`|`bearer`|`openai\_chat`, `openai\_responses`|`openai`|[Set up](/docs/aperture/how-to/use-openai)|
|[Anthropic](/docs/aperture/how-to/use-anthropic)|`https://api.anthropic.com`|`x-api-key`|`anthropic\_messages`|`anthropic`|[Set up](/docs/aperture/how-to/use-anthropic)|
|[Google Gemini](/docs/aperture/how-to/use-google-gemini)|`https://generativelanguage.googleapis.com`|`x-goog-api-key`|`gemini\_generate\_content`|`google`|[Set up](/docs/aperture/how-to/use-google-gemini)|
|[Vertex AI (Gemini)](/docs/aperture/how-to/use-vertex-ai)|`https://aiplatform.googleapis.com`|`bearer`|`google\_generate\_content`|`vertex`|[Set up](/docs/aperture/how-to/use-vertex-ai)|
|[Vertex AI (Anthropic)](/docs/aperture/how-to/use-vertex-ai)|`https://aiplatform.googleapis.com`|`bearer`|`google\_raw\_predict`|`vertex`|[Set up](/docs/aperture/how-to/use-vertex-ai)|
|[Vertex AI Express](/docs/aperture/how-to/use-vertex-ai-express)|`https://aiplatform.googleapis.com`|`x-goog-api-key`|`google\_generate\_content`|`vertex`|[Set up](/docs/aperture/how-to/use-vertex-ai-express)|
|[Amazon Bedrock](/docs/aperture/how-to/use-amazon-bedrock)|`https://bedrock-runtime.\<region\>.amazonaws.com`|`bearer`|`bedrock\_model\_invoke`|`bedrock`|[Set up](/docs/aperture/how-to/use-amazon-bedrock)|
|[OpenRouter](/docs/aperture/how-to/use-openrouter)|`https://openrouter.ai/api/`|`bearer`|`openai\_chat` (default)|`openrouter`|[Set up](/docs/aperture/how-to/use-openrouter)|
|[Vercel AI Gateway](/docs/aperture/how-to/use-vercel)|`https://ai-gateway.vercel.sh`|`bearer`|`openai\_chat`, `openai\_responses`|`vercel`|[Set up](/docs/aperture/how-to/use-vercel)|
|[Self-hosted](/docs/aperture/how-to/use-self-hosted)|Your server URL|`bearer` (default)|`openai\_chat` (default)|N/A|[Set up](/docs/aperture/how-to/use-self-hosted)|
## [Compatibility flags](#compatibility-flags)
The `compatibility` object in a provider configuration specifies which API formats the provider supports. These flags determine which endpoints Aperture exposes for the provider's models.
|Flag|Type|Default|Description|
|`openai\_chat`|boolean|`true`|Supports `/v1/chat/completions`|
|`openai\_responses`|boolean|`false`|Supports `/v1/responses`|
|`anthropic\_messages`|boolean|`false`|Supports `/v1/messages`|
|`gemini\_generate\_content`|boolean|`false`|Supports the direct Gemini API (`generativelanguage.googleapis.com`)|
|`bedrock\_model\_invoke`|boolean|`false`|Supports Amazon Bedrock format|
|`google\_generate\_content`|boolean|`false`|Supports Vertex AI Gemini format (`aiplatform.googleapis.com`)|
|`google\_raw\_predict`|boolean|`false`|Supports Vertex AI raw predict for Anthropic models|
|`bedrock\_converse`|boolean|`false`|Supports Amazon Bedrock Converse API format|
|`experimental\_gemini\_cli\_vertex\_compat`|boolean|`false`|Rewrites short-form model paths for Gemini CLI compatibility with Vertex AI. Experimental; behavior may change.|
Enable the flags that match the API formats your provider supports. For providers that serve models from multiple vendors (such as Vertex AI with both Gemini and Anthropic models), enable multiple flags.
## [Additional provider fields](#additional-provider-fields)
In addition to `baseurl`, `apikey`, `authorization`, `models`, `compatibility`, `cost\_basis`, `name`, `add\_headers`, and `model\_cost\_map`, providers support the following optional fields:
|Field|Type|Default|Description|
|`description`|string|`""`|Human-readable description of the provider.|
|`preference`|integer|`0`|Routing priority. Higher values are preferred when multiple providers serve the same model.|
|`disabled`|boolean|`false`|Excludes the provider from routing and the `/v1/models` endpoint. Use to temporarily disable a provider without removing its configuration.|
## [Authorization types](#authorization-types)
Different providers require different authorization header formats. Set the `authorization` field on the provider to specify which format to use.
|Value|Header format|Used by|
|`bearer`|`Authorization: Bearer \<key\>`|OpenAI and most providers|
|`x-api-key`|`x-api-key: \<key\>`|Anthropic|
|`x-goog-api-key`|`x-goog-api-key: \<key\>`|Google Gemini, Vertex AI Express|
The `authorization` field is not required for all providers. For example, Vertex AI uses a service account key file instead of an API key (prefixed with `keyfile::`). Refer to [set up a Vertex AI provider](/docs/aperture/how-to/use-vertex-ai) for step-by-step configuration instructions. Vertex AI Express uses `x-goog-api-key` with a standard API key. Refer to [set up a Vertex AI Express provider](/docs/aperture/how-to/use-vertex-ai-express) for details.
### [Custom headers](#custom-headers)
Some providers require additional headers beyond the standard `authorization` field. Use `add\_headers` on the provider to include custom headers in every request Aperture sends to that provider. Each entry is a string in `"Header-Name: value"` format:
```
`{
"providers": {
"example-provider": {
"baseurl": "https://api.example.com/",
"apikey": "\<your-key\>",
"authorization": "bearer",
"models": ["model-name"],
"add\_headers": [
"Custom-Header: value"
]
}
}
}
`
```
Each string in the array must follow the `"Header-Name: value"` format.
## [Cost basis](#cost-basis)
Aperture estimates the dollar cost of every LLM request. Cost estimates power quotas, hook metadata, and the per-model pricing shown in the Aperture dashboard.
Aperture auto-infers pricing for known providers based on the provider's `compatibility` flags (for example, `anthropic\_messages` maps to Anthropic pricing). For providers where auto-inference does not apply, you can set `cost\_basis` explicitly on the provider.
|`cost\_basis` value|Pricing source|
|`anthropic`|Anthropic API list prices|
|`openai`|OpenAI API list prices|
|`google`|Google Gemini API list prices|
|`bedrock`|AWS Bedrock default pricing|
|`bedrock-us`|AWS Bedrock US-region pricing|
|`bedrock-eu`|AWS Bedrock EU-region pricing|
|`vertex`|Google Vertex AI pricing|
|`azure`|Azure OpenAI standard pricing|
|`azure-eu`|Azure OpenAI EU-region pricing|
|`openrouter`|OpenRouter pricing|
|`vercel`|Vercel AI Gateway pricing|
To disable auto-inference globally, set `auto\_cost\_basis` to `false` at the top level of the configuration.
```
`{
"auto\_cost\_basis": false,
"providers": {
"anthropic": {
"cost\_basis": "anthropic"
}
}
}
`
```
When `auto\_cost\_basis` is `false`, only providers with an explicit `cost\_basis` produce cost estimates.
### [Model cost map](#model-cost-map)
When a model name does not appear in the pricing database (for example, after adding a new or custom model), you can use `model\_cost\_map` to map it to a known model for pricing purposes:
```
`{
"providers": {
"anthropic": {
"cost\_basis": "anthropic",
"model\_cost\_map": [
{"match": "claude-opus-9-\*", "as": "claude-opus-4-6"},
{"match": "claude-\*-preview\*", "as": "claude-sonnet-4-5", "adjustment": 1.1}
]
}
}
}
`
```
In this example, requests to any `claude-opus-9-\*` model are priced like `claude-opus-4-6`, and preview models are priced like `claude-sonnet-4-5` with a 10% markup.
Each entry supports the following fields:
* `match`: Glob pattern against the model name. Uses Go's `path.Match` syntax, where `\*` matches any sequence of non-separator characters and `?` matches a single character.
* `as`: Replacement model name for the pricing lookup.
* `adjustment`: Price multiplier (optional, default `1.0`). Use `1.5` to mark up 50%.
Aperture uses the first matching entry.
On this page
* [Provider matrix](#provider-matrix)
* [Compatibility flags](#compatibility-flags)
* [Additional provider fields](#additional-provider-fields)
* [Authorization types](#authorization-types)
* [Custom headers](#custom-headers)
* [Cost basis](#cost-basis)
* [Model cost map](#model-cost-map)
Scroll to top