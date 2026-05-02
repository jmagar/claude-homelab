Test your integration – Apps SDK | OpenAI Developers
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
## Goals
Testing validates that your connector behaves predictably before you expose it to users. Focus on three areas: tool correctness, component UX, and discovery precision.
## Unit test your tool handlers
* Exercise each tool function directly with representative inputs. Verify schema validation, error handling, and edge cases (empty results, missing IDs).
* Include automated tests for authentication flows if you issue tokens or require linking.
* Keep test fixtures close to your MCP code so they stay up to date as schemas evolve.
## Use MCP Inspector during development
The [MCP Inspector](https://modelcontextprotocol.io/docs/tools/inspector) is the fastest way to debug your server locally:
1. Run your MCP server.
2. Launch the inspector: `npx @modelcontextprotocol/inspector@latest`.
3. Enter your server URL (for example `http://127.0.0.1:2091/mcp`).
4. Click **List Tools** and **Call Tool** to inspect the raw requests and responses.
Inspector renders components inline and surfaces errors immediately. Capture screenshots for your launch review.
## Validate in ChatGPT developer mode
After your connector is reachable over HTTPS:
* Link it in **Settings → Connectors → Developer mode**.
* Toggle it on in a new conversation and run through your golden prompt set (direct, indirect, negative). Record when the model selects the right tool, what arguments it passed, and whether confirmation prompts appear as expected.
* Test mobile layouts by invoking the connector in the ChatGPT iOS or Android apps.
## Connect via the API Playground
If you need raw logs or want to test without the full ChatGPT UI, open the [API Playground](https://platform.openai.com/playground):
1. Choose **Tools → Add → MCP Server**.
2. Provide your HTTPS endpoint and connect.
3. Issue test prompts and inspect the JSON request/response pairs in the right-hand panel.
## Regression checklist before launch
* Tool list matches your documentation and unused prototypes are removed.
* Structured content matches the declared `outputSchema` for every tool.
* Widgets render without console errors, inject their own styling, and restore state correctly.
* OAuth or custom auth flows return valid tokens and reject invalid ones with meaningful messages.
* Discovery behaves as expected across your golden prompts and does not trigger on negative prompts.
Capture findings in a doc so you can compare results release over release. Consistent testing keeps your connector reliable as ChatGPT and your backend evolve.