Changelog – Apps SDK | OpenAI Developers
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
## March 2026
*
2026-03-25
### Plugin distribution guidance
#### Fixes & improvements
* Apps SDK docs now explain that OpenAI turns approved apps into plugins for Codex distribution, and that for now plugins are only available in Codex.
*
2026-03-24
### File library helpers in window.openai
#### Fixes & improvements
* `window.openai.selectFiles()` lets widgets pick existing files from the user’s ChatGPT file library when that library is available.
* `window.openai.uploadFile(file, { library: true })` lets widgets save uploads into the user’s ChatGPT file library when that library is available.
*
2026-03-09
### Non-image file uploads
#### Fixes & improvements
* `window.openai.uploadFile` now supports non-image file types.
## February 2026
*
2026-02-22
### MCP Apps compatibility
#### Fixes & improvements
* ChatGPT is now fully compatible with the [MCP Apps spec](https://apps.extensions.modelcontextprotocol.io/api/).
*
2026-02-02
### Apps SDK updates for redirects, widget descriptions, and follow-up scrolling
#### Fixes & improvements
* `window.openai.openExternal({ href, redirectUrl })` supports `redirectUrl: false`, which prevents the host from appending `?redirectUrl=...` to external links.
* `window.openai.setOpenInAppUrl({ href })` is the supported way to override the fullscreen “Open in ” destination; if you do not call it, ChatGPT keeps opening the widget’s current iframe path.
* `openai/widgetDescription` is honored during resource construction and takes precedence over `resource.description` when present.
* `window.openai.sendFollowUpMessage` supports a `scrollToBottom` parameter; it defaults to `true`, and you can pass `false` to opt out.
## January 2026
*
2026-01-21
### Company knowledge compatibility guidance
#### Fixes & improvements
* Added [company knowledge in ChatGPT](https://openai.com/index/introducing-company-knowledge/) compatibility guidance for the `search`/`fetch` tools. [Click here to learn more](/apps-sdk/build/mcp-server#company-knowledge-compatibility).
*
2026-01-15
### Session metadata for tool calls & requestModal template switching
#### Fixes & improvements
* Tool calls now include `\_meta["openai/session"]`, an anonymized conversation id you can use to correlate requests within a ChatGPT session.
* `window.openai.requestModal({ template })` now supports opening a different registered UI template by passing the template URI from `registerResource`.
## November 2025
*
2025-11-04
### Resources updates
#### Fixes & improvements
* Published a new [Apps SDK state management](/apps-sdk/build/state-management) guide.
* Added copy functionality to all code snippets.
* Launched a unified developers [changelog](/changelog).