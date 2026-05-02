Research use cases – Apps SDK | OpenAI Developers
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
## Why start with use cases
Every successful Apps SDK app starts with a crisp understanding of what the user is trying to accomplish. Discovery in ChatGPT is model-driven: the assistant chooses your app when your tool metadata, descriptions, and past usage align with the user’s prompt and memories. That only works if you have already mapped the tasks the model should recognize and the outcomes you can deliver.
Use this page to capture your hypotheses, pressure-test them with prompts, and align your team on scope before you define tools or build components.
## Gather inputs
Begin with qualitative and quantitative research:
* **User interviews and support requests** – capture the jobs-to-be-done, terminology, and data sources users rely on today.
* **Prompt sampling** – list direct asks (e.g., “show my Jira board”) and indirect intents (“what am I blocked on for the launch?”) that should route to your app.
* **System constraints** – note any compliance requirements, offline data, or rate limits that will influence tool design later.
Document the user persona, the context they are in when they reach for ChatGPT, and what success looks like in a single sentence for each scenario.
## Define evaluation prompts
Decision boundary tuning is easier when you have a golden set to iterate against. For each use case:
1. **Author at least five direct prompts** that explicitly reference your data, product name, or verbs you expect the user to say.
2. **Draft five indirect prompts** where the user states a goal but not the tool (“I need to keep our launch tasks organized”).
3. **Add negative prompts** that should *not* trigger your app so you can measure precision.
Use these prompts later in [Optimize metadata](/apps-sdk/guides/optimize-metadata) to hill-climb on recall and precision without overfitting to a single request.
## Scope the minimum lovable feature
For each use case decide:
* **What information must be visible inline** to answer the question or let the user act.
* **Which actions require write access** and whether they should be gated behind confirmation in developer mode.
* **What state needs to persist** between turns—for example, filters, selected rows, or draft content.
Rank the use cases based on user impact and implementation effort. A common pattern is to ship one P0 scenario with a high-confidence component, then expand to P1 scenarios once discovery data confirms engagement.
## Translate use cases into tooling
Once a scenario is in scope, draft the tool contract:
* Inputs: the parameters the model can safely provide. Keep them explicit, use enums when the set is constrained, and document defaults.
* Outputs: the structured content you will return. Add fields the model can reason about (IDs, timestamps, status) in addition to what your UI renders.
* Component intent: whether you need a read-only viewer, an editor, or a multiturn workspace. This influences the [component planning](/apps-sdk/plan/components) and storage model later.
Review these drafts with stakeholders—especially legal or compliance teams—before you invest in implementation. Many integrations require PII reviews or data processing agreements before they can ship to production.
## Prepare for iteration
Even with solid planning, expect to revise prompts and metadata after your first dogfood. Build time into your schedule for:
* Rotating through the golden prompt set weekly and logging tool selection accuracy.
* Collecting qualitative feedback from early testers in ChatGPT developer mode.
* Capturing analytics (tool calls, component interactions) so you can measure adoption.
These research artifacts become the backbone for your roadmap, changelog, and success metrics once the app is live.