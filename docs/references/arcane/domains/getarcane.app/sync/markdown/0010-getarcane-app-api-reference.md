API Reference
Arcane provides a REST API that allows you to programmatically manage your Docker resources. The API documentation is built into Arcane and available directly from your instance.
## Accessing the API Documentation
The full API reference is available within your Arcane instance:
1. Navigate to your Arcane instance (e.g., `https://arcane.example.com`)
2. Go to **Settings** → **API Keys** → **API Reference**
3. Browse the interactive documentation ## Generating an API Key
To use the API, you'll need to create an API key:
1. Navigate to **Settings** → **API Keys** in your Arcane instance
2. Click **Add API Key**
3. Enter a **Name** for the new API Key
4. Select an **Expires At** date (leave blank for no expiration)
5. Enter a **Description** for the new API Key
6. Click **Create API Key**
> [!IMPORTANT]Make sure you copy the API Key from the dialog window — it will not be shown again!
## Static Admin API Key
If you manage Arcane declaratively, you can provide a fixed admin API key at startup with `ADMIN\_STATIC\_API\_KEY`.
Arcane will reconcile that key for the built-in admin user automatically:
* create it when it does not exist yet
* rotate it when the configured value changes
* remove it when the setting is removed
Static keys are protected in the UI so they cannot be edited or deleted accidentally. They still work like normal API keys when you send them in the `X-Api-Key` header.
## Using the API
> [!TIP]You can use the API using the official
[> arcane-cli
](/docs/cli/install)> client.
All API endpoints require authentication using the `X-Api-Key` header:
`curl -X GET "https://arcane.example.com/api/environments/0/projects" -H "X-Api-Key: your-api-key-here"
`
> [!NOTE]Replace
`> arcane.example.com
`> with your actual Arcane instance URL and
`> your-api-key-here
`> with your generated API key.
## Inbound Webhooks
Arcane also supports inbound webhooks for simple external triggers.
Use a webhook when an external system, such as GitHub Actions or another CI job, needs to tell Arcane to do something without maintaining a logged-in session.
Current webhook targets include:
* a single container update
* a project redeploy
* an environment-wide updater run
* a Git Sync run
Webhook trigger requests use a tokenized public endpoint:
`curl -X POST "https://arcane.example.com/api/webhooks/trigger/arc\_wh\_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
`
Important details:
* the token in the URL is the credential
* webhook tokens are shown once when created
* Arcane stores only a hashed form of the token at rest
* disabled webhooks return `403`
* unknown or invalid tokens return `404`
Create and manage webhooks in **Settings → Webhooks**.