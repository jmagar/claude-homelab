Set up Vertex AI with Aperture · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Set up Vertex AI with Aperture
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
Configure a Vertex AI provider in Aperture so your team can access Google Gemini and Anthropic Claude models through Aperture. This guide walks through creating a Google Cloud service account, generating a key file, and adding the provider to your Aperture configuration.
Any [LLM client configured to use Aperture](/docs/aperture/use-your-tools) can access models served by this provider. Aperture routes requests based on the model name, so you do not need to configure each client separately for Vertex AI.
If you need Gemini models without Anthropic support, consider [Vertex AI Express mode](/docs/aperture/how-to/use-vertex-ai-express) with API key authentication instead of a service account.
## [Prerequisites](#prerequisites)
Before you begin, you need:
* An Aperture instance accessible from your device. Refer to [get started with Aperture](/docs/aperture/get-started) if you have not set this up.
* A Google Cloud project with the [Vertex AI API](https://console.cloud.google.com/apis/library/aiplatform.googleapis.com) enabled.
* The [Google Cloud CLI](https://cloud.google.com/sdk/docs/install) (`gcloud`) installed and authenticated.
* Your Aperture hostname (Tailscale's [MagicDNS](/docs/features/magicdns) provides short hostnames like `ai` in your tailnet; for example, `aperture.example.ts.net`). If you [connect through ts-unplug](/docs/aperture/connect-outside-tailnet), use `localhost:\<port-number\>` instead.
## [Step 1: Set your Google Cloud project](#step-1-set-your-google-cloud-project)
Set the active project for the `gcloud` commands that follow. Replace `\<your-project\>` with your Google Cloud project ID.
```
`gcloud config set project \<your-project\>
`
```
## [Step 2: Create a service account](#step-2-create-a-service-account)
Create a dedicated service account for Aperture to use when calling the Vertex AI API.
```
`gcloud iam service-accounts create aperture-vertex \\
--display-name="Aperture Vertex AI"
`
```
This creates a service account named `aperture-vertex` in your project. Aperture uses this account to authenticate with the Vertex AI API and generate bearer tokens for requests.
## [Step 3: Grant IAM roles](#step-3-grant-iam-roles)
The service account needs two IAM roles: one to call the Vertex AI API, and one to list available models.
1. Grant the `aiplatform.user` role, which lets the service account send requests to Vertex AI models:
```
`gcloud projects add-iam-policy-binding \<your-project\> \\
--member="serviceAccount:aperture-vertex@\<your-project\>.iam.gserviceaccount.com" \\
--role="roles/aiplatform.user"
`
```
2. Grant the `serviceUsageConsumer` role, which lets the service account list available models:
```
`gcloud projects add-iam-policy-binding \<your-project\> \\
--member="serviceAccount:aperture-vertex@\<your-project\>.iam.gserviceaccount.com" \\
--role="roles/serviceusage.serviceUsageConsumer"
`
```
## [Step 4: Generate a JSON key file](#step-4-generate-a-json-key-file)
Create a JSON key file for the service account. Aperture uses this key file to mint bearer tokens for Vertex AI requests.
```
`gcloud iam service-accounts keys create aperture-vertex-key.json \\
--iam-account=aperture-vertex@\<your-project\>.iam.gserviceaccount.com
`
```
This creates a file named `aperture-vertex-key.json` in your current directory. The file contains the private key and project metadata that Aperture needs to authenticate.
Store this file securely. You cannot recover the private key if lost, and anyone with access to the file can authenticate as the service account.
## [Step 5: Base64-encode the key file](#step-5-base64-encode-the-key-file)
Aperture expects the key file as a base64-encoded string in the provider configuration. Encode the key file and copy the result to your clipboard.
On macOS:
```
`cat aperture-vertex-key.json | base64 | pbcopy
`
```
On Linux:
```
`cat aperture-vertex-key.json | base64 -w 0
`
```
Use the encoded string in the next step as the value for the provider's `apikey` field.
## [Step 6: Configure the Vertex provider in Aperture](#step-6-configure-the-vertex-provider-in-aperture)
Add a Vertex provider to your Aperture configuration using the [Aperture dashboard](/docs/aperture). The following example shows the configuration with both Google and Anthropic models enabled.
```
`{
"providers": {
"vertex": {
"baseurl": "https://aiplatform.googleapis.com",
"apikey": "keyfile::\<base64-encoded-key\>",
"models": [
"gemini-2.5-flash",
"gemini-2.0-flash-exp",
"claude-opus-4-6",
"claude-sonnet-4-5@20250929",
"claude-haiku-4-5@20251001"
],
"compatibility": {
"google\_generate\_content": true,
"google\_raw\_predict": true,
"experimental\_gemini\_cli\_vertex\_compat": true
}
}
}
}
`
```
Replace `\<base64-encoded-key\>` with the base64-encoded string from the previous step. The `keyfile::` prefix tells Aperture that the value is a base64-encoded service account key file, not a plain API key. Aperture decodes the key file and extracts the `project\_id`, which it uses to rewrite request paths for Vertex AI (for example, filling in the `\_aperture\_auto\_vertex\_project\_id\_` placeholder).
You do not need the `authorization` field when using `keyfile::` authentication. Aperture generates OAuth bearer tokens from the key file automatically, bypassing the `authorization` field.
The `compatibility` flags control which Vertex AI API formats the provider accepts:
* `google\_generate\_content` enables the Vertex AI `generateContent` endpoint for Google-published models such as Gemini.
* `google\_raw\_predict` enables the Vertex AI raw predict endpoint for third-party models such as Anthropic Claude.
* `experimental\_gemini\_cli\_vertex\_compat` rewrites short-form Gemini CLI request paths to full Vertex AI paths and strips unsupported fields from request bodies.
Enable `google\_generate\_content` and `google\_raw\_predict` if your provider serves both Google and Anthropic models. If you serve only one type, enable the corresponding flag. For the full list of compatibility flags, refer to the [provider compatibility reference](/docs/aperture/provider-compatibility).
After configuring the provider, [grant model access](/docs/aperture/how-to/grant-model-access) to the users or groups that need the Vertex models.
## [Verify the provider](#verify-the-provider)
1. Open the Aperture dashboard and confirm the Vertex provider appears with the expected models.
2. Send a test request through a connected tool, such as Claude Code or another tool configured to use the Vertex provider.
3. Check the Aperture dashboard session list for a new entry corresponding to your request. The session shows the model name, token counts, and timestamp.
If the request succeeds and appears in the dashboard, your Vertex provider is configured correctly. If the request fails, refer to the [Aperture troubleshooting guide](/docs/aperture/troubleshooting).
## [Manage service account keys](#manage-service-account-keys)
List or revoke service account keys when rotating credentials or decommissioning a provider.
### [List keys for the service account](#list-keys-for-the-service-account)
Run the following command to list all keys associated with the service account:
```
`gcloud iam service-accounts keys list \\
--iam-account=aperture-vertex@\<your-project\>.iam.gserviceaccount.com
`
```
The output lists all keys for the service account. The `key-id` in the output matches the `private\_key\_id` field in your JSON key file.
### [Revoke a key](#revoke-a-key)
Delete a specific key by its `key-id`:
```
`gcloud iam service-accounts keys delete \<key-id\> \\
--iam-account=aperture-vertex@\<your-project\>.iam.gserviceaccount.com
`
```
After revoking a key, generate a new key file and update the base64-encoded value in your Aperture provider configuration. Requests that use the revoked key fail immediately.
On this page
* [Prerequisites](#prerequisites)
* [Step 1: Set your Google Cloud project](#step-1-set-your-google-cloud-project)
* [Step 2: Create a service account](#step-2-create-a-service-account)
* [Step 3: Grant IAM roles](#step-3-grant-iam-roles)
* [Step 4: Generate a JSON key file](#step-4-generate-a-json-key-file)
* [Step 5: Base64-encode the key file](#step-5-base64-encode-the-key-file)
* [Step 6: Configure the Vertex provider in Aperture](#step-6-configure-the-vertex-provider-in-aperture)
* [Verify the provider](#verify-the-provider)
* [Manage service account keys](#manage-service-account-keys)
* [List keys for the service account](#list-keys-for-the-service-account)
* [Revoke a key](#revoke-a-key)
Scroll to top