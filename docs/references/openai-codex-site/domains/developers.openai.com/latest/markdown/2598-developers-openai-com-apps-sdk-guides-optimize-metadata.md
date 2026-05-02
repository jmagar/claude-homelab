Optimize Metadata – Apps SDK | OpenAI Developers
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
## Why metadata matters
ChatGPT decides when to call your connector based on the metadata you provide. Well-crafted names, descriptions, and parameter docs increase recall on relevant prompts and reduce accidental activations. Treat metadata like product copy—it needs iteration, testing, and analytics.
## Gather a golden prompt set
Before you tune metadata, assemble a labelled dataset:
* **Direct prompts** – users explicitly name your product or data source.
* **Indirect prompts** – users describe the outcome they want without naming your tool.
* **Negative prompts** – cases where built-in tools or other connectors should handle the request.
Document the expected behaviour for each prompt (call your tool, do nothing, or use an alternative). You will reuse this set during regression testing.
## Draft metadata that guides the model
For each tool:
* **Name** – pair the domain with the action (`calendar.create\_event`).
* **Description** – start with “Use this when…” and call out disallowed cases (“Do not use for reminders”).
* **Parameter docs** – describe each argument, include examples, and use enums for constrained values.
* **Read-only hint** – annotate `readOnlyHint: true` on tools that only retrieve or compute information and never create, update, delete, or send data outside of ChatGPT.
* For tools that are not read-only:
* **Destructive hint** - annotate `destructiveHint: false` on tools that do not delete or overwrite user data.
* **Open-world hint** - annotate `openWorldHint: false` on tools that do not publish content or reach outside the user’s account.
## Evaluate in developer mode
1. Link your connector in ChatGPT developer mode.
2. Run through the golden prompt set and record the outcome: which tool was selected, what arguments were passed, and whether the component rendered.
3. For each prompt, track precision (did the right tool run?) and recall (did the tool run when it should?).
If the model picks the wrong tool, revise the descriptions to emphasise the intended scenario or narrow the tool’s scope.
## Iterate methodically
* Change one metadata field at a time so you can attribute improvements.
* Keep a log of revisions with timestamps and test results.
* Share diffs with reviewers to catch ambiguous copy before you deploy it.
After each revision, repeat the evaluation. Aim for high precision on negative prompts before chasing marginal recall improvements.
## Production monitoring
Once your connector is live:
* Review tool-call analytics weekly. Spikes in “wrong tool” confirmations usually indicate metadata drift.
* Capture user feedback and update descriptions to cover common misconceptions.
* Schedule periodic prompt replays, especially after adding new tools or changing structured fields.
Treat metadata as a living asset. The more intentional you are with wording and evaluation, the easier discovery and invocation become.