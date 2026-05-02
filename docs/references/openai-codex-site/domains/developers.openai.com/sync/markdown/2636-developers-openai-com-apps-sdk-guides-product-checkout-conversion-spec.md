Product checkout conversion spec – Apps SDK | OpenAI Developers
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
Product checkout conversion apps in ChatGPT are currently in beta and being
tested with approved partners. To apply for access, fill out this form
[
here
](https://chatgpt.com/merchants)
## Purpose
Our goal is to let ChatGPT directly invoke partner apps for high-intent use
cases such as product checkout.
Once partners provide us with a product feed for search, we can hook up their apps for
bottom-of-funnel conversion actions. To do this, partner apps need to follow a
standardized contract for widget name, tool name, and tool input.
If you want to build an app that follows this spec, apply for access through the
[ChatGPT merchants form](https://chatgpt.com/merchants/).
## User experience
When users search for products, the product entity sidebar can show **Open**
buttons for sellers. If a seller has a ChatGPT app, ChatGPT can open that app
inline for checkout instead of punching out to an external website.
## Required contract (today)
* Widget name: `ui://widget/checkout-session.html`
* Tool name: `checkout\_session`
`checkout\_session` must set:
```
`\_meta.ui.resourceUri = "ui://widget/checkout-session.html";`
```
Any tool called directly from a widget must set:
```
`\_meta["openai/widgetAccessible"] = true;`
```
## `checkout\_session` input
Current input shape:
```
`{
"checkout\_session": {
"items": [
{
"id": "string",
"quantity": 1,
"offerId": "string"
}
]
}
}`
```
This payload aligns with the Commerce checkout session shape documented
[here](https://developers.openai.com/commerce/specs/checkout/#post-checkout_sessions).