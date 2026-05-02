Set up Amazon Bedrock · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Set up Amazon Bedrock
Last validated: Apr 15, 2026
Aperture by Tailscale is currently [in alpha](/docs/reference/tailscale-release-stages#alpha).
Configure an Amazon Bedrock provider in Aperture so your team can access AWS foundation models through your tailnet. Bedrock uses region-specific URLs and has its own model naming conventions, both of which you configure in the provider definition.
Aperture routes requests based on the model name, not the LLM client. Any LLM client configured to use Aperture can access any provider your admin has set up. Refer to the [provider compatibility reference](/docs/aperture/provider-compatibility) for the full list of supported providers and API formats.
## [Prerequisites](#prerequisites)
Before you begin, you need:
* An Aperture instance accessible from your device. Refer to [get started with Aperture](/docs/aperture/get-started) if you have not set this up.
* An AWS account with Bedrock model access enabled in your target region.
* A [Bedrock API key](https://docs.aws.amazon.com/bedrock/latest/userguide/api-keys.html). We recommend generating a long-term API key in the Amazon Bedrock console. Aperture sends this key as a bearer token in the `Authorization` header and does not perform AWS signature verification or generate temporary credentials.
## [Select a region](#select-a-region)
Bedrock URLs are region-specific. The base URL format is:
```
`https://bedrock-runtime.\<region\>.amazonaws.com
`
```
Choose the region where your desired models are enabled. Common regions include:
* `us-east-1` (US East, N. Virginia)
* `us-west-2` (US West, Oregon)
* `eu-west-1` (Europe, Ireland)
Model availability varies by region. Check the [AWS Bedrock documentation](https://docs.aws.amazon.com/bedrock/latest/userguide/models-regions.html) to confirm your target models are available in the region you select.
## [Understand model naming](#understand-model-naming)
Bedrock model names include a region prefix and a version suffix. The region prefix indicates where the model is available.
For example, the model name `us.anthropic.claude-haiku-4-5-20251001-v1:0` breaks down as:
* `us.` — US region availability prefix
* `anthropic.claude-haiku-4-5` — provider and model name
* `20251001` — model release date
* `v1:0` — version identifier
The following table shows commonly used Anthropic Claude models on Bedrock. Bedrock also supports models from other providers (such as Meta, Cohere, and Amazon). Check the [AWS Bedrock documentation](https://docs.aws.amazon.com/bedrock/latest/userguide/models-regions.html) for the full list of available models and their names in your region.
|Model|Bedrock model name|
|Claude Haiku 4.5|`us.anthropic.claude-haiku-4-5-20251001-v1:0`|
|Claude Sonnet 4.5|`us.anthropic.claude-sonnet-4-5-20250929-v1:0`|
|Claude Opus 4.5|`us.anthropic.claude-opus-4-5-20251101-v1:0`|
|Claude Opus 4.6|`us.anthropic.claude-opus-4-6-v1`|
Use these full model names in your provider configuration. The names must match exactly, including the region prefix and version suffix.
## [Configure the provider](#configure-the-provider)
Add Amazon Bedrock as a provider in your [Aperture configuration](/docs/aperture/configuration). The following example shows a configuration for the US East region with Anthropic Claude models.
```
`{
"providers": {
"bedrock": {
"baseurl": "https://bedrock-runtime.us-east-1.amazonaws.com",
"apikey": "\<your-bedrock-api-key\>",
"authorization": "bearer",
"models": [
"us.anthropic.claude-haiku-4-5-20251001-v1:0",
"us.anthropic.claude-sonnet-4-5-20250929-v1:0",
"us.anthropic.claude-opus-4-5-20251101-v1:0",
"us.anthropic.claude-opus-4-6-v1"
],
"cost\_basis": "bedrock-us",
"compatibility": {
"bedrock\_model\_invoke": true
}
}
}
}
`
```
Replace `\<your-bedrock-api-key\>` with your Bedrock API key.
The configuration fields work as follows:
* **`bedrock\_model\_invoke`** enables the Bedrock InvokeModel endpoint, which is the standard Bedrock API. Most coding tools use this endpoint. If your tools use the Bedrock Converse API instead, add `"bedrock\_converse": true` to the `compatibility` section. You can enable both flags simultaneously.
* **`cost\_basis`** controls how Aperture calculates costs for requests. Use `bedrock-us` for US-region pricing, `bedrock-eu` for EU-region pricing, or `bedrock` for default Bedrock pricing. You must set this field explicitly because Aperture cannot auto-infer pricing for Bedrock providers.
* **`authorization`** is set to `bearer` because Aperture passes the API key directly as a bearer token in the `Authorization` header.
For the full list of compatibility flags, refer to the [provider compatibility reference](/docs/aperture/provider-compatibility).
After configuring the provider:
1. [Grant model access](/docs/aperture/how-to/grant-model-access) to the users or groups that need the Bedrock models.
2. [Set up LLM clients](/docs/aperture/use-your-tools) to connect coding tools through Aperture.
## [Verify the provider](#verify-the-provider)
1. Open the Aperture dashboard and confirm the provider appears with the expected models.
2. Send a test request through a connected coding tool (such as Claude Code or Cursor), or use `curl`:
```
`curl http://\<aperture-address\>/v1/chat/completions \\
-H "Content-Type: application/json" \\
-d '{"model": "\<model-name\>", "messages": [{"role": "user", "content": "hello"}]}'
`
```
Replace `\<aperture-address\>` with your Aperture instance address and `\<model-name\>` with one of the models you configured for this provider.
3. Check the Aperture dashboard session list for a new entry. The session shows the model name, token counts, and timestamp.
If the request fails, refer to the [Aperture troubleshooting guide](/docs/aperture/troubleshooting).
## [Region considerations](#region-considerations)
If you serve users in multiple AWS regions, you can configure multiple Bedrock providers with different base URLs and cost basis values. Use distinct provider keys to differentiate them.
For example, you might create `bedrock-us` for US East and `bedrock-eu` for Europe:
```
`{
"providers": {
"bedrock-us": {
"baseurl": "https://bedrock-runtime.us-east-1.amazonaws.com",
"apikey": "\<your-us-token\>",
"authorization": "bearer",
"models": ["us.anthropic.claude-sonnet-4-5-20250929-v1:0"],
"cost\_basis": "bedrock-us",
"compatibility": {
"bedrock\_model\_invoke": true
}
},
"bedrock-eu": {
"baseurl": "https://bedrock-runtime.eu-west-1.amazonaws.com",
"apikey": "\<your-eu-token\>",
"authorization": "bearer",
"models": ["eu.anthropic.claude-sonnet-4-5-20250929-v1:0"],
"cost\_basis": "bedrock-eu",
"compatibility": {
"bedrock\_model\_invoke": true
}
}
}
}
`
```
Each provider operates independently with its own authentication token, model list, and cost basis.
## [Rotate credentials](#rotate-credentials)
To rotate the API key for a Bedrock provider:
1. Generate a new [Bedrock API key](https://docs.aws.amazon.com/bedrock/latest/userguide/api-keys.html) in the Amazon Bedrock console.
2. Update the `apikey` field in your Aperture provider configuration with the new key.
3. Verify that requests succeed with the new key.
If you have multiple Bedrock providers (for example, one per region), update each provider's `apikey` field independently.
On this page
* [Prerequisites](#prerequisites)
* [Select a region](#select-a-region)
* [Understand model naming](#understand-model-naming)
* [Configure the provider](#configure-the-provider)
* [Verify the provider](#verify-the-provider)
* [Region considerations](#region-considerations)
* [Rotate credentials](#rotate-credentials)
Scroll to top