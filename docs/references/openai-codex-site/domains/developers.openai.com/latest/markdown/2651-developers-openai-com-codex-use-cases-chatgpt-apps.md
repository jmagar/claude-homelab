Bring your app to ChatGPT | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Bring your app to ChatGPT
Turn your use cases into focused apps for ChatGPT.
Difficulty **Advanced**
Time horizon **1h**
Build one narrow ChatGPT app outcome end to end: define the tools, scaffold the MCP server and optional widget, connect it in ChatGPT, and iterate until the core flow works.
## Best for
* Planning a first ChatGPT app around a user outcome
* Scaffolding an MCP server, tool metadata, and an optional widget without overbuilding
* Running a tight loop from local HTTPS testing to ChatGPT developer-mode verification
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/chatgpt-apps/?export=pdf)
Build one narrow ChatGPT app outcome end to end: define the tools, scaffold the MCP server and optional widget, connect it in ChatGPT, and iterate until the core flow works.
Advanced
1h
Related links
[ Apps SDK quickstart ](/apps-sdk/quickstart)[ Build an MCP server ](/apps-sdk/build/mcp-server)[ Testing ](/apps-sdk/deploy/testing)
##
Best for
* Planning a first ChatGPT app around a user outcome
* Scaffolding an MCP server, tool metadata, and an optional widget without overbuilding
* Running a tight loop from local HTTPS testing to ChatGPT developer-mode verification
##
Skills & Plugins
*
[ ChatGPT Apps ](https://github.com/openai/skills/tree/main/skills/.curated/chatgpt-apps)
Plan tools, wire MCP resources, and follow the current ChatGPT app build flow.
*
[ OpenAI Docs ](https://github.com/openai/skills/tree/main/skills/.curated/openai-docs)
Pull current official Apps SDK guidance before Codex writes code or suggests architecture.
*
[ Vercel ](https://github.com/openai/plugins/tree/main/plugins/vercel)
Bring Vercel ecosystem guidance into Codex with curated skills and the official Vercel MCP server.
|
Skill
|
Why use it
|
|[ ChatGPT Apps ](https://github.com/openai/skills/tree/main/skills/.curated/chatgpt-apps)| Plan tools, wire MCP resources, and follow the current ChatGPT app build flow. |
|[ OpenAI Docs ](https://github.com/openai/skills/tree/main/skills/.curated/openai-docs)| Pull current official Apps SDK guidance before Codex writes code or suggests architecture. |
|[ Vercel ](https://github.com/openai/plugins/tree/main/plugins/vercel)| Bring Vercel ecosystem guidance into Codex with curated skills and the official Vercel MCP server. |
##
Starter prompt
Use $chatgpt-apps with $openai-docs to plan a ChatGPT app for [use case] in this repo.
Requirements:
- Start with one core user outcome.
- Propose 3-5 tools with clear names, descriptions, inputs, and outputs.
- Recommend whether v1 needs a widget or can start data-only.
- Prefer TypeScript for the MCP server and React for the widget.
- Call out auth, deployment, and test requirements.
Output:
- Tool plan
- Proposed file tree
- Golden prompt set
- Risks and open questions
[Open in the Codex app](<codex://new?prompt=Use+$chatgpt-apps+with+$openai-docs+to+plan+a+ChatGPT+app+for+[use+case]+in+this+repo.
Requirements:
-+Start+with+one+core+user+outcome.
-+Propose+3-5+tools+with+clear+names,+descriptions,+inputs,+and+outputs.
-+Recommend+whether+v1+needs+a+widget+or+can+start+data-only.
-+Prefer+TypeScript+for+the+MCP+server+and+React+for+the+widget.
-+Call+out+auth,+deployment,+and+test+requirements.
Output:
-+Tool+plan
-+Proposed+file+tree
-+Golden+prompt+set
-+Risks+and+open+questions>)
Use $chatgpt-apps with $openai-docs to plan a ChatGPT app for [use case] in this repo.
Requirements:
- Start with one core user outcome.
- Propose 3-5 tools with clear names, descriptions, inputs, and outputs.
- Recommend whether v1 needs a widget or can start data-only.
- Prefer TypeScript for the MCP server and React for the widget.
- Call out auth, deployment, and test requirements.
Output:
- Tool plan
- Proposed file tree
- Golden prompt set
- Risks and open questions
## What you build
Every ChatGPT app has three parts:
* An MCP server that defines tools, returns data, enforces auth, and points ChatGPT at any UI resources.
* An optional web component that renders inside a ChatGPT iframe. You can build it with React or with plain HTML, CSS, and JavaScript.
* A model that decides when to call the app’s tools based on the metadata you provide.
Codex is most useful when it owns the repetitive engineering work around those parts:
* Planning the tool surface and metadata.
* Scaffolding the server and widget.
* Wiring local run scripts.
* Adding auth and deployment changes in focused passes.
* Writing the verification loop that proves the app works in ChatGPT.
## Why Codex is a strong fit
* ChatGPT apps already split cleanly into a server, an optional widget, and model-driven tool calls.
* Codex prompting works best when the task is explicit, scoped, and straightforward to verify, which matches app-building work well.
* Skills and `AGENTS.md` give Codex the reusable instructions and project rules it needs to stay grounded.
To learn more about how to install and use skills, see our [skills documentation](/codex/skills).
## How to use
## Prerequisites
* Start with one core user outcome instead of trying to port an entire product into chat.
* Choose the stack up front: TypeScript or Python for the server, and React or plain HTML, CSS, and JavaScript for the widget.
* Decide what HTTPS path you will use during development, such as `ngrok` or Cloudflare Tunnel.
* Current docs usually say app, but some older pages and settings still say connector. During local testing, treat them as the same setup object.
1. Start with one narrow app outcome and ask Codex to propose three to five tools with clear names, descriptions, inputs, and outputs.
2. Decide whether v1 can stay data-only or needs a widget, then scaffold the MCP server and optional widget using existing repo patterns before adding dependencies.
3. Run the app locally behind HTTPS, connect it in ChatGPT developer mode, and test it with a small direct, indirect, and negative prompt set.
4. Iterate on metadata, state handling, `structuredContent`, and `\_meta` payloads until the core read flow behaves reliably inside ChatGPT.
5. Add OAuth 2.1 only when user-specific data or write actions require it, while keeping anonymous or read-only flows simple where possible.
6. Prepare a hosted preview with a stable `/mcp` endpoint, verify streaming and widget asset hosting, and review the launch checklist before sharing or submitting the app.
## Suggested prompts
Strong prompts for this workflow share the same ingredients:
* One clear outcome: say what the app should help the user do inside ChatGPT.
* A concrete stack: say whether you want TypeScript or Python on the server, and whether the widget should use React or stay lightweight.
* Explicit tool boundaries: ask Codex to propose or build a small set of tools with one job per tool.
* Auth expectations: state whether the first version can be anonymous or whether it needs linked accounts and write actions.
* A local development path: mention the tunnel or hosting path you expect for HTTPS testing in ChatGPT.
* Verification steps: tell Codex what commands to run, what prompts to test, and what evidence to report back.
Avoid one giant prompt that asks for planning, implementation, auth, deployment, submission, and polish in one pass. Split the work into smaller milestones instead.
**Plan the App Before You Scaffold It**
Use $chatgpt-apps with $openai-docs to plan a ChatGPT app for [use case] in this repo.
Requirements:
- Start with one core user outcome.
- Propose 3-5 tools with clear names, descriptions, inputs, and outputs.
- Recommend whether v1 needs a widget or can start data-only.
- Prefer TypeScript for the MCP server and React for the widget.
- Call out auth, deployment, and test requirements.
Output:
- Tool plan
- Proposed file tree
- Golden prompt set
- Risks and open questions
**Scaffold the First Working Version**
Use $chatgpt-apps with $openai-docs to scaffold the first version of this ChatGPT app.
Stack:
- TypeScript MCP server
- React widget
- Vite build
- Local HTTPS via ngrok
Constraints:
- Keep the app narrow: one read flow and at most one write flow.
- Return concise structuredContent for the model and reserve widget-only data for \_meta.
- Make tool handlers idempotent.
- Reuse existing repo patterns before adding dependencies.
Verification:
- Start the local server
- Explain how to connect the app in ChatGPT developer mode
- List the exact prompts to test
**Add Auth Only After the Core Flow Works**
Use $chatgpt-apps with $openai-docs to add auth to this ChatGPT app.
Requirements:
- Keep read-only tools anonymous if possible.
- Add OAuth 2.1 only for user-specific data or write actions.
- Use an existing identity provider such as Auth0 or Stytch.
- Document scopes, token checks, and the developer-mode test flow.
Output:
- Auth flow summary
- Server changes
- Required environment variables
- End-to-end test plan
**Prepare the App for Deployment and Review**
Use $chatgpt-apps with $openai-docs and @vercel to prepare this ChatGPT app for a hosted preview.
Requirements:
- Expose a stable HTTPS /mcp endpoint.
- Keep streaming responses working on /mcp.
- Host widget assets correctly.
- Add a launch-readiness checklist covering metadata, tool hints, privacy, and test prompts.
Output:
- Deployment plan
- Preview URL or hosting steps
- Review checklist
- Remaining risks
## Launch readiness
* The app has one narrow outcome that is obvious to a user.
* The tool set stays small and has explicit metadata, inputs, and outputs.
* The MCP server works end to end and returns concise `structuredContent`, reserving widget-only data for `\_meta`.
* The widget, if needed, renders correctly inside ChatGPT.
* A local HTTPS testing loop works through ChatGPT developer mode.
* A small direct, indirect, and negative prompt set passes with the expected conversation flow and tool payloads.
* Auth is added only where user-specific data or write actions require it.
* A deployment plan and launch-readiness review cover metadata, tool hints, privacy, and test prompts before the app is shared or submitted.
## Common pitfalls
* Asking Codex to port the whole product into ChatGPT. Better move: ask for one core user outcome, three to five tools, and one narrow widget.
* Starting with a giant implementation prompt. Better move: split the work into planning, scaffold, auth, deployment, and review passes.
* Writing UI before the tool contract is clear. Better move: plan the tool surface and response schema first, then build the widget.
* Skipping official docs grounding. Better move: pair `$chatgpt-apps` with `$openai-docs` so the scaffold follows current Apps SDK guidance.
* Treating metadata as an afterthought. Better move: write tool descriptions and parameter docs early, then replay a prompt set against them.
* Adding auth before proving the anonymous or read-only path. Better move: get the core tool flow working first, then add OAuth for the tools that actually need it.
* Declaring the app done before testing inside ChatGPT. Better move: connect the app in developer mode, inspect tool payloads, and verify the real conversation flow.
##
Tech stack
Need
Default options
Why it's needed
Need
Widget framework
Default options
[ React ](https://react.dev/)
Why it's needed
A strong default for stateful widgets, especially when the UI needs filters, tables, or multi-step interaction.
Need
Hosting
Default options
[ Vercel ](https://vercel.com/docs)
Why it's needed
Quick deploys, preview environments, automatic HTTPS, and a clear path to hosted MCP endpoints.
|
Need
|
Default options
|
Why it's needed
|
| Widget framework |[ React ](https://react.dev/)| A strong default for stateful widgets, especially when the UI needs filters, tables, or multi-step interaction. |
| Hosting |[ Vercel ](https://vercel.com/docs)| Quick deploys, preview environments, automatic HTTPS, and a clear path to hosted MCP endpoints. |
##
Related use cases
[
### Deploy an app or website
Use Codex with Build Web Apps and Vercel to turn a repo, screenshot, design, or rough app...
Front-end Integrations
](/codex/use-cases/deploy-app-or-website)[
### Add iOS app intents
Use Codex and the Build iOS Apps plugin to identify the actions and entities your app should...
iOS Code
](/codex/use-cases/ios-app-intents)[
### Adopt liquid glass
Use Codex and the Build iOS Apps plugin to audit existing iPhone and iPad UI, replace custom...
iOS Code
](/codex/use-cases/ios-liquid-glass)