Connect from ChatGPT – Apps SDK | OpenAI Developers
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Apps SDK Commerce
* [ Home ](/apps-sdk)
* [ Quickstart ](/apps-sdk/quickstart)
### Core Concepts
* [ MCP Apps in ChatGPT ](/apps-sdk/mcp-apps-in-chatgpt)
* [ MCP Server ](/apps-sdk/concepts/mcp-server)
* [ UX principles ](/apps-sdk/concepts/ux-principles)
* [ UI guidelines ](/apps-sdk/concepts/ui-guidelines)
### Plan
* [ Research use cases ](/apps-sdk/plan/use-case)
* [ Define tools ](/apps-sdk/plan/tools)
* [ Design components ](/apps-sdk/plan/components)
### Build
* [ Set up your server ](/apps-sdk/build/mcp-server)
* [ Build your ChatGPT UI ](/apps-sdk/build/chatgpt-ui)
* [ Authenticate users ](/apps-sdk/build/auth)
* [ Manage state ](/apps-sdk/build/state-management)
* [ Monetize your app ](/apps-sdk/build/monetization)
* [ Examples ](/apps-sdk/build/examples)
### Deploy
* [ Deploy your app ](/apps-sdk/deploy)
* [ Connect from ChatGPT ](/apps-sdk/deploy/connect-chatgpt)
* [ Test your integration ](/apps-sdk/deploy/testing)
* [ Submit your app ](/apps-sdk/deploy/submission)
### Conversion apps
* [ Restaurant reservation spec ](/apps-sdk/guides/restaurant-reservation-conversion-spec)
* [ Product checkout spec ](/apps-sdk/guides/product-checkout-conversion-spec)
### Guides
* [ Optimize Metadata ](/apps-sdk/guides/optimize-metadata)
* [ Security & Privacy ](/apps-sdk/guides/security-privacy)
* [ Troubleshooting ](/apps-sdk/deploy/troubleshooting)
### Resources
* [ Changelog ](/apps-sdk/changelog)
* [ App submission guidelines ](/apps-sdk/app-submission-guidelines)
* [ Reference ](/apps-sdk/reference)
[API Dashboard](https://platform.openai.com/login)
Copy Page
## Before you begin
You can test your app in ChatGPT with your account using [developer mode](https://platform.openai.com/docs/guides/developer-mode).
Publishing your app for public access is now available through the submission process. You can learn more in our [ChatGPT app submission guidelines](/apps-sdk/app-submission-guidelines).
To turn on developer mode, navigate to **Settings → Apps & Connectors → Advanced settings (bottom of the page)**.
From there, you can toggle developer mode if your organization allows it.
Once developer mode is active, you’ll see a **Create** button under **Settings → Apps & Connectors**.
As of November 13th, 2025, ChatGPT Apps are supported on all plans, including
Business, Enterprise, and Education plans.
## Create a connector
Once you have developer mode enabled, you can create a connector for your app in ChatGPT.
1. Ensure your MCP server is reachable over HTTPS (for local development, you can expose a local server to the public internet via a tool such as [ngrok](https://ngrok.com/) or [Cloudflare Tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/)).
2. In ChatGPT, navigate to **Settings → Connectors → Create**.
3. Provide the metadata for your connector:
* **Connector name** – a user-facing title such as *Kanban board*.
* **Description** – explain what the connector does and when to use it. The model uses this text during discovery.
* **Connector URL** – the public `/mcp` endpoint of your server (for example `https://abc123.ngrok.app/mcp`).
* Click **Create**. If the connection succeeds you will see a list of the tools your server advertises. If it fails, refer to the [Testing](/apps-sdk/deploy/testing) guide to debug your app with MCP Inspector or the API Playground.
## Try the app
Once your connector is created, you can try it out in a new ChatGPT conversation.
1. Open a new chat in ChatGPT.
2. Click the **+** button near the message composer, and click **More**.
3. Choose the connector for your app in the list of available tools. This will add your app to the conversation context for the model to use.
4. Prompt the model to invoke tools by saying related to your app. For example, “What are my available tasks?” for a Kanban board app.
ChatGPT will display tool-call payloads in the UI so you can confirm inputs and outputs. Write tools will require manual confirmation unless you choose to remember approvals for the conversation.
## Refreshing metadata
Whenever you change your tools list or descriptions, you can refresh your MCP server’s metadata in ChatGPT.
1. Update your MCP server and redeploy it (unless you are using a local server).
2. In **Settings → Connectors**, click into your connector and choose **Refresh**.
3. Verify the tool list updates and try a few prompts to test the updated flows.
## Using other clients
You can connect to your MCP server on other clients.
* **API Playground** – visit the [platform playground](https://platform.openai.com/chat), and add your MCP server to the conversation: open **Tools → Add → MCP Server**, and paste the same HTTPS endpoint. This is useful when you want raw request/response logs.
* **Mobile clients** – once the connector is linked on ChatGPT web, it will be available on ChatGPT mobile apps as well. Test mobile layouts early if your component has custom controls.
With the connector linked you can move on to validation, experiments, and eventual rollout.