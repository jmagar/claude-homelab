Define tools – Apps SDK | OpenAI Developers
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
## Tool-first thinking
In Apps SDK, tools are the contract between your MCP server and the model. They describe what the connector can do, how to call it, and what data comes back. Good tool design makes discovery accurate, invocation reliable, and downstream UX predictable.
Use the checklist below to turn your use cases into well-scoped tools before you touch the SDK.
## Draft the tool surface area
Start from the user journey defined in your [use case research](/apps-sdk/plan/use-case):
* **One job per tool** – keep each tool focused on a single read or write action (“fetch\_board”, “create\_ticket”), rather than a kitchen-sink endpoint. This helps the model decide between alternatives.
* **Explicit inputs** – define the shape of `inputSchema` now, including parameter names, data types, and enums. Document defaults and nullable fields so the model knows what is optional.
* **Predictable outputs** – enumerate the structured fields you will return, including machine-readable identifiers that the model can reuse in follow-up calls.
If you need both read and write behavior, create separate tools so ChatGPT can respect confirmation flows for write actions.
## Capture metadata for discovery
Discovery is driven almost entirely by metadata. For each tool, draft:
* **Name** – action oriented and unique inside your connector (`kanban.move\_task`).
* **Description** – one or two sentences that start with “Use this when…” so the model knows exactly when to pick the tool.
* **Parameter annotations** – describe each argument and call out safe ranges or enumerations. This context prevents malformed calls when the user prompt is ambiguous.
* **Global metadata** – confirm you have app-level name, icon, and descriptions ready for the directory and launcher.
Later, plug these into your MCP server and iterate using the [Optimize metadata](/apps-sdk/guides/optimize-metadata) workflow.
## Model-side guardrails
Think through how the model should behave once a tool is linked:
* **Prelinked vs. link-required** – if your app can work anonymously, mark tools as available without auth. Otherwise, make sure your connector enforces linking via the onboarding flow described in [Authentication](/apps-sdk/build/auth).
* **Read-only hints** – set the [`readOnlyHint` annotation](https://modelcontextprotocol.io/specification/2025-11-25/schema#toolannotations) to specify tools which cannot mutate state.
* **Destructive hints** – set the [`destructiveHint` annotation](https://modelcontextprotocol.io/specification/2025-11-25/schema#toolannotations) to specify which tools do delete or overwrite user data.
* **Open-world hints** – set the [`openWorldHint` annotation](https://modelcontextprotocol.io/specification/2025-11-25/schema#toolannotations) to specify which tools publish content or reach outside the user’s account.
* **Result components** – decide whether each tool should render a component, return JSON only, or both. Set `\_meta.ui.resourceUri` on the tool descriptor to advertise the UI template so the same UI can run across MCP Apps hosts (ChatGPT honors `\_meta["openai/outputTemplate"]` as an optional compatibility alias).
## Golden prompt rehearsal
Before you implement, sanity-check your tool set against the prompt list you captured earlier:
1. For every direct prompt, confirm you have exactly one tool that clearly addresses the request.
2. For indirect prompts, ensure the tool descriptions give the model enough context to select your connector instead of a built-in alternative.
3. For negative prompts, verify your metadata will keep the tool hidden unless the user explicitly opts in (e.g., by naming your product).
Capture any gaps or ambiguities now and adjust the plan—changing metadata before launch is much cheaper than refactoring code later.
## Handoff to implementation
When you are ready to implement, compile the following into a handoff document:
* Tool name, description, input schema, and expected output schema.
* Whether the tool should return a component, and if so which UI component should render it.
* Auth requirements, rate limits, and error handling expectations.
* Test prompts that should succeed (and ones that should fail).
Bring this plan into the [Set up your server](/apps-sdk/build/mcp-server) guide to translate it into code with the MCP SDK of your choice.