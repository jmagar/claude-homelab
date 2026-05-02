Set up a Vertex AI Express provider · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Set up a Vertex AI Express provider
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Configure a Vertex AI Express provider in Aperture so your team can access Google Gemini models through your tailnet. Vertex AI Express uses API key authentication instead of a service account, which simplifies setup when you need Gemini models without Anthropic support.
If you also need Anthropic Claude models through Vertex AI, use a [service account provider](/docs/aperture/how-to/use-vertex-ai) instead. The Vertex AI raw predict endpoint required by Anthropic models does not support API key authentication.
Any [LLM client configured to use Aperture](/docs/aperture/use-your-tools) can access models served by this provider. Aperture routes requests based on the model name, so you do not need to configure each client separately for Vertex AI.
## [Prerequisites](#prerequisites)
Before you begin, you need:
* An Aperture instance accessible from your device. Refer to [get started with Aperture](/docs/aperture/get-started) if you have not set this up.
* A Google Cloud project with the [Vertex AI API](https://console.cloud.google.com/apis/library/aiplatform.googleapis.com) enabled.
* Your Aperture hostname (Tailscale's [MagicDNS](/docs/features/magicdns) provides short hostnames like `ai` in your tailnet; for example, `aperture.example.ts.net`).
## [Step 1: Create an API key](#step-1-create-an-api-key)
Create a Google Cloud API key for your project using the Google Cloud console or the `gcloud` CLI.
### [Google Cloud console](#google-cloud-console)
Follow these steps to create an API key from the console:
1. Open the [API credentials page](https://console.cloud.google.com/apis/credentials) for your project.
2. Select **Create credentials**, then **API key**.
3. Copy the generated key.
### [`gcloud` CLI](#gcloud-cli)
Run the following command to create an API key:
```
`gcloud services api-keys create --display-name="Aperture Vertex AI Express"
`
```
The command outputs the key string. Copy it for the next step.
(Optional) Restrict the API key to the Vertex AI API. An unrestricted key works but has a broader scope than necessary.
## [Step 2: Configure the provider](#step-2-configure-the-provider)
Add a Vertex provider to your Aperture configuration using the [Aperture dashboard](/docs/aperture). Set the authorization type to `x-goog-api-key` and provide your API key directly (no `keyfile::` prefix).
The following example shows a Vertex Express provider configuration:
```
`{
"providers": {
"vertex-express": {
"baseurl": "https://aiplatform.googleapis.com",
"authorization": "x-goog-api-key",
"apikey": "\<your-api-key\>",
"models": [
"gemini-2.5-flash",
"gemini-2.5-pro",
"gemini-2.5-flash-lite"
],
"compatibility": {
"google\_generate\_content": true
}
}
}
}
`
```
Replace `\<your-api-key\>` with the API key from the previous step.
The `compatibility` section enables `google\_generate\_content`, which routes requests through the Vertex AI `generateContent` endpoint used by Google-published models such as Gemini.
Do not enable `google\_raw\_predict`. Third-party models (such as Anthropic Claude) use the raw predict endpoint, which requires service account authentication. API key authentication does not support this endpoint.
After configuring the provider, [grant model access](/docs/aperture/how-to/grant-model-access) to the users or groups that need the Gemini models.
## [Verify the provider](#verify-the-provider)
After configuring the provider, confirm it works:
1. Open the Aperture dashboard and confirm the Vertex Express provider appears with the expected models.
2. Send a test request through a connected tool, such as a Gemini CLI instance or another tool pointed at the Vertex AI endpoint.
3. Check the Aperture dashboard session list for a new entry corresponding to your request. The session shows the model name, token counts, and timestamp.
If the request fails, check that the API key is correct and that the Vertex AI API is enabled in your Google Cloud project. For additional help, refer to the [Aperture troubleshooting guide](/docs/aperture/troubleshooting).
## [Limitations compared to service account providers](#limitations-compared-to-service-account-providers)
Vertex AI Express mode requires less configuration but has fewer features than a service account provider:
* **Google models only.** Anthropic Claude models on Vertex AI use the raw predict endpoint, which requires service account authentication. Express mode does not support `google\_raw\_predict`.
* **No automatic project ID.** Clients that rely on Aperture to fill in the Vertex project ID from the keyfile (the `\_aperture\_auto\_vertex\_project\_id\_` placeholder) must instead provide the project ID directly in the request path.
## [Rotate the API key](#rotate-the-api-key)
To rotate the API key, create a new key, update the Aperture provider configuration, then delete the old key.
1. Create a new API key using the steps in [Step 1](#step-1-create-an-api-key).
2. Update the `apikey` field in your Aperture provider configuration with the new key.
3. Delete the old API key from the [API credentials page](https://console.cloud.google.com/apis/credentials) or with the `gcloud` CLI:
```
`gcloud services api-keys delete \<old-key-id\>
`
```
Requests that use the deleted key fail immediately after you delete it.
On this page
* [Prerequisites](#prerequisites)
* [Step 1: Create an API key](#step-1-create-an-api-key)
* [Google Cloud console](#google-cloud-console)
* [gcloud CLI](#gcloud-cli)
* [Step 2: Configure the provider](#step-2-configure-the-provider)
* [Verify the provider](#verify-the-provider)
* [Limitations compared to service account providers](#limitations-compared-to-service-account-providers)
* [Rotate the API key](#rotate-the-api-key)
Scroll to top