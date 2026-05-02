Upgrade your API integration | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Upgrade your API integration
Upgrade your app to the latest OpenAI API models.
Difficulty **Intermediate**
Time horizon **1h**
Use Codex to update your existing OpenAI API integration to the latest recommended models and API features, while checking for regressions before you ship.
## Best for
* Teams upgrading from older models or API surfaces
* Repos that need behavior-preserving migrations with explicit validation
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/api-integration-migrations/?export=pdf)
Use Codex to update your existing OpenAI API integration to the latest recommended models and API features, while checking for regressions before you ship.
Intermediate
1h
Related links
[ Latest model guide ](/api/docs/guides/latest-model)[ Prompt guidance ](/api/docs/guides/prompt-guidance)[ OpenAI Docs MCP ](/learn/docs-mcp)[ Evals guide ](/api/docs/guides/evals)
##
Best for
* Teams upgrading from older models or API surfaces
* Repos that need behavior-preserving migrations with explicit validation
##
Skills & Plugins
*
[ OpenAI Docs ](https://github.com/openai/skills/tree/main/skills/.curated/openai-docs)
Pull the current model, migration, and API guidance before Codex makes edits to your implementation.
|
Skill
|
Why use it
|
|[ OpenAI Docs ](https://github.com/openai/skills/tree/main/skills/.curated/openai-docs)| Pull the current model, migration, and API guidance before Codex makes edits to your implementation. |
##
Starter prompt
Use $openai-docs to upgrade this OpenAI integration to the latest recommended model and API features.
Specifically, look for the latest model and prompt guidance for this specific model.
Requirements:
- Start by inventorying the current models, endpoints, and tool assumptions in the repo.
- Identify the smallest migration plan that gets us onto the latest supported path.
- Preserve behavior unless a change is required by the new API or model.
- Update prompts using the latest model prompt guidance.
- Call out any prompt, tool, or response-shape changes we need to review manually.
[Open in the Codex app](<codex://new?prompt=Use+$openai-docs+to+upgrade+this+OpenAI+integration+to+the+latest+recommended+model+and+API+features.
Specifically,+look+for+the+latest+model+and+prompt+guidance+for+this+specific+model.
Requirements:
-+Start+by+inventorying+the+current+models,+endpoints,+and+tool+assumptions+in+the+repo.
-+Identify+the+smallest+migration+plan+that+gets+us+onto+the+latest+supported+path.
-+Preserve+behavior+unless+a+change+is+required+by+the+new+API+or+model.
-+Update+prompts+using+the+latest+model+prompt+guidance.+
-+Call+out+any+prompt,+tool,+or+response-shape+changes+we+need+to+review+manually.>)
Use $openai-docs to upgrade this OpenAI integration to the latest recommended model and API features.
Specifically, look for the latest model and prompt guidance for this specific model.
Requirements:
- Start by inventorying the current models, endpoints, and tool assumptions in the repo.
- Identify the smallest migration plan that gets us onto the latest supported path.
- Preserve behavior unless a change is required by the new API or model.
- Update prompts using the latest model prompt guidance.
- Call out any prompt, tool, or response-shape changes we need to review manually.
## Introduction
As we release new models and API features, we recommend upgrading your integration to benefit from the latest improvements.
Changing from one model to another is often not as simple as just updating the model name.
There might be changes to the API–for example, for the GPT-5.4 model, we added a new `phase` parameter to the assistant message that is important to include in your integration–but most importantly, model behavior can be different and require changes to your existing prompts.
When migrating to a new model, you should make sure to not only make the necessary code changes, but also evaluate the impact on your workflows.
## Leverage the OpenAI Docs skill
All the specifics about the new API features and model behavior are documented in our docs, in the [latest model](/api/docs/guides/latest-model) and [prompt guidance](/api/docs/guides/prompt-guidance) guides.
The OpenAI Docs skill also includes [specific guidance](https://github.com/openai/codex/blob/6323f0104d17d211029faab149231ba787f7da37/codex-rs/skills/src/assets/samples/openai-docs/references/upgrading-to-gpt-5p4.md) as reference, codifying how to upgrade to the latest model–currently [GPT-5.4](/api/docs/models/gpt-5.4).
Codex now automatically comes with the OpenAI Docs skill, so make sure to mention it in your prompt to access all the latest documentation and guidance when building with the OpenAI API.
## Build a robust evals pipeline
Codex can automatically update your prompts based on the latest prompt guidance, but you should have a way to automate verifying your integration is working as expected.
Make sure to build an evals pipeline that you can run every time you make changes to your integration, to verify there is no regression in behavior.
This [cookbook guide](/cookbook/examples/evaluation/building_resilient_prompts_using_an_evaluation_flywheel) covers in detail how to do this using our [Evals API](/api/docs/guides/evals).
##
Related use cases
[
### Add Mac telemetry
Use Codex and the Build macOS Apps plugin to add a few high-signal `Logger` events around...
macOS Code
](/codex/use-cases/macos-telemetry-logs)[
### Create a CLI Codex can use
Ask Codex to create a composable CLI it can run from any folder, combine with repo scripts...
Engineering Code
](/codex/use-cases/agent-friendly-clis)[
### Create browser-based games
Use Codex to turn a game brief into first a well-defined plan, and then a real browser-based...
Engineering Code
](/codex/use-cases/browser-games)