Design components – Apps SDK | OpenAI Developers
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
## Why components matter
UI components are the human-visible half of your connector. They let users view or edit data inline, switch to fullscreen when needed, and keep context synchronized between typed prompts and UI actions. Planning them early ensures your MCP server returns the right structured data and component metadata from day one.
Because ChatGPT implements the MCP Apps UI standard, a well-designed component
and data contract can be portable across MCP Apps-compatible hosts.
## Explore sample components
We publish reusable examples in [openai-apps-sdk-examples](https://github.com/openai/openai-apps-sdk-examples) so you can see common patterns before you build your own. The pizzaz gallery covers every default surface we provide today:
### List
Renders dynamic collections with empty-state handling. [View the code](https://github.com/openai/openai-apps-sdk-examples/tree/main/src/pizzaz-list).
### Map
Plots geo data with marker clustering and detail panes. [View the code](https://github.com/openai/openai-apps-sdk-examples/tree/main/src/pizzaz).
### Album
Showcases media grids with fullscreen transitions. [View the code](https://github.com/openai/openai-apps-sdk-examples/tree/main/src/pizzaz-albums).
### Carousel
Highlights featured content with swipe gestures. [View the code](https://github.com/openai/openai-apps-sdk-examples/tree/main/src/pizzaz-carousel).
### Shop
Demonstrates product browsing with checkout affordances. [View the code](https://github.com/openai/openai-apps-sdk-examples/tree/main/src/pizzaz-shop).
## Clarify the user interaction
For each use case, decide what the user needs to see and manipulate:
* **Viewer vs. editor** – is the component read-only (a chart, a dashboard) or should it support editing and writebacks (forms, kanban boards)?
* **Single-shot vs. multiturn** – will the user accomplish the task in one invocation, or should state persist across turns as they iterate?
* **Inline vs. fullscreen** – some tasks are comfortable in the default inline card, while others benefit from fullscreen or picture-in-picture modes. Sketch these states before you implement.
Write down the fields, affordances, and empty states you need so you can validate them with design partners and reviewers.
## Map data requirements
Components should receive everything they need in the tool response. When planning:
* **Structured content** – define the JSON payload that the component will parse.
* **Initial component state** – render from the latest `structuredContent` delivered over the MCP Apps bridge (for example, `ui/notifications/tool-result`). On UI-initiated tool calls (`tools/call`), render from the returned tool result. To keep the model in sync with UI state, use `ui/update-model-context`.
* **Auth context** – note whether the component should display linked-account information, or whether the model must prompt the user to connect first.
Feeding this data through the MCP response is simpler than adding ad-hoc APIs later.
## Design for responsive layouts
Components run inside an iframe on both desktop and mobile. Plan for:
* **Adaptive breakpoints** – set a max width and design layouts that collapse gracefully on small screens.
* **Accessible color and motion** – respect system dark mode (match color-scheme) and provide focus states for keyboard navigation.
* **Launcher transitions** – if the user opens your component from the launcher or expands to fullscreen, make sure navigation elements stay visible.
Document CSS variables, font stacks, and iconography up front so they are consistent across components.
## Define the state contract
Because components and the chat surface share conversation state, be explicit about what is stored where:
* **Component state** – use `ui/update-model-context` for model-visible UI state. If you want ChatGPT to persist UI-only state across widget re-renders (optional), you can also use `window.openai.setWidgetState` (selected record, scroll position, staged form data).
* **Server state** – store authoritative data in your backend or the built-in storage layer. Decide how to merge server changes back into component state after follow-up tool calls.
* **Model messages** – think about what human-readable updates the component should send back via `ui/message` so the transcript stays meaningful.
Capturing this state diagram early prevents hard-to-debug sync issues later.
## Plan telemetry and debugging hooks
Inline experiences are hardest to debug without instrumentation. Decide in advance how you will:
* Emit analytics events for component loads, button clicks, and validation errors.
* Log tool-call IDs alongside component telemetry so you can trace issues end to end.
* Provide fallbacks when the component fails to load (e.g., show the structured JSON and prompt the user to retry).
Once these plans are in place you are ready to move on to the implementation details in [Build a ChatGPT UI](/apps-sdk/build/chatgpt-ui).