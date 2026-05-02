MCP Apps compatibility in ChatGPT – Apps SDK | OpenAI Developers
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
## Overview
ChatGPT supports the [**MCP Apps**](https://modelcontextprotocol.io/docs/extensions/apps) open standard for embedded app UIs.
MCP Apps UIs run inside an iframe and communicate with the host over a standard bridge (`ui/\*` JSON-RPC over `postMessage`). ChatGPT implements this same iframe-and-bridge model, so you can build your UI once and run it in ChatGPT and other MCP Apps–compatible hosts.
Existing Apps SDK APIs remain supported, and new, experimental capabilities ship
first in the Apps SDK. OpenAI helped shape the MCP Apps standard from ChatGPT
Apps, and new capabilities move into the MCP spec after shape and functionality
validation.
Build with the MCP Apps standard keys and bridge by default. Use `window.openai` when you need ChatGPT-specific capabilities.
## Recommended approach
For new apps (and new UI surfaces inside existing apps), start with the MCP Apps standard:
1. **Declare your UI** using `\_meta.ui.resourceUri`.
2. **Use the standard host bridge** (`ui/\*` JSON-RPC over `postMessage`) for initialization, notifications, and host interaction.
Optional:
1. **Layer on ChatGPT extensions** via `window.openai` only when you need capabilities that aren’t covered by the shared spec.
### MCP Apps host bridge (`ui/\*`)
MCP Apps defines a standard iframe bridge:
* **Transport:** JSON-RPC 2.0 messages over `window.postMessage`
* **Namespace:** `ui/\*` methods and notifications for UIs ↔ host interaction
* **Tool calls:** use the MCP tool surface (for example, `tools/call`) rather than host-specific UI globals
## How this relates to the Apps SDK
The Apps SDK is a supported way to build and distribute ChatGPT Apps. ChatGPT also implements the MCP Apps UI standard, so your UI can run across MCP Apps-compatible hosts.
In practice:
* Use MCP Apps standard keys and bridge methods (`\_meta.ui.resourceUri`, `ui/\*`) when there’s an equivalent.
* Use OpenAI extensions only when you need ChatGPT-specific capabilities.
This is similar to the web platform: vendor-specific APIs can help ship early,
but once a standard exists, documentation should lead with the standard form.
That’s about portability, not deprecation.
## Optional ChatGPT extensions via `window.openai`
Some capabilities are specific to ChatGPT. When you use them, treat them as optional extensions that add power in ChatGPT—without preventing your UI from running in other MCP Apps hosts.
Examples include:
* Instant Checkout (`window.openai.requestCheckout`)
* File uploads (`window.openai.uploadFile`, `window.openai.getFileDownloadUrl`)
* Host modals (`window.openai.requestModal`)
## Migration and mapping guide
This section maps common Apps SDK patterns to MCP Apps standard equivalents.
### Tool metadata
|Goal|MCP Apps standard|ChatGPT compatibility alias|
|Link a tool to a UI resource|`\_meta.ui.resourceUri`|`\_meta["openai/outputTemplate"]`|
### Host bridge
|Goal|MCP Apps standard|ChatGPT extension (optional)|
|Receive tool input|`ui/initialize` + `ui/notifications/tool-input`|`window.openai.toolInput`|
|Receive tool results|`ui/notifications/tool-result`|`window.openai.toolOutput`|
|Call a tool from the UI|`tools/call`|`window.openai.callTool`|
|Send a follow-up message|`ui/message`|`window.openai.sendFollowUpMessage`|
|Update model-visible UI context|`ui/update-model-context`|`window.openai.setWidgetState`|
Build around the MCP Apps standard for portability, then layer on ChatGPT extensions where they improve the ChatGPT experience.
### Extension best practices
* **Feature-detect** before calling an extension.
* **Gracefully degrade** when the extension isn’t available.
```
`const openai = typeof window !== "undefined" ? window.openai : undefined;
if (openai?.requestModal) {
await openai.requestModal({
/\* ... \*/
});
} else {
// Fallback behavior for hosts without this extension.
}`
```