GPT Actions library - Zapier
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ Home ](/cookbook)
### Topics
* [ Agents ](/cookbook/topic/agents)
* [ Evals ](/cookbook/topic/evals)
* [ Multimodal ](/cookbook/topic/multimodal)
* [ Text ](/cookbook/topic/text)
* [ Guardrails ](/cookbook/topic/guardrails)
* [ Optimization ](/cookbook/topic/optimization)
* [ ChatGPT ](/cookbook/topic/chatgpt)
* [ Codex ](/cookbook/topic/codex)
* [ gpt-oss ](/cookbook/topic/gpt-oss)
### Contribute
* [ Cookbook on GitHub ](https://github.com/openai/openai-cookbook)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Copy Page
Aug 5, 2024
# GPT Actions library - Zapier
[ DH ](https://www.linkedin.com/in/dhalp/)
[ Daniel Halpern
(OpenAI)
](https://www.linkedin.com/in/dhalp/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/gpt_actions_library/gpt_action_zapier.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/chatgpt/gpt_actions_library/gpt_action_zapier.ipynb)
## Introduction
This page provides an instruction & guide for developers building a GPT Action for a specific application. Before you proceed, make sure to first familiarize yourself with the following information:
* [Introduction to GPT Actions](https://platform.openai.com/docs/actions)
* [Introduction to GPT Actions Library](https://platform.openai.com/docs/actions/actions-library)
* [Example of Building a GPT Action from Scratch](https://platform.openai.com/docs/actions/getting-started)
This GPT Action provides an overview of how to connect a GPT to **Zapier**. Because the majority of configuration occurs on Zapier, we recommend reviewing this ***[helpful guide from Zapier on connecting GPTs to custom Zapier Actions](https://actions.zapier.com/docs/platform/gpt)***.
### Value + Example Business Use Cases
**Value**: Users can now connect custom GPTs within ChatGPT to Zapier and get instant integration to 6,0000+ apps and 20,000+ actions across the tech stack.
**Example Use Cases**:
* An organization has already setup Zapier integrations, and would like to avoid additional integration work when connecting their tech ecosystem with ChatGPT
* Build a Calendar Assistant GPT which looks up calendar events, and provides additional context based on attendees’ LinkedIn profiles
* A CRM GPT to help connect Hubspot to ChatGPT allowing sales teams to update or review contacts and notes on the go
## Application Information
### Application Key Links
Check out these links from the application before you get started:
* Application Website: [https://zapier.com](https://zapier.com)
* AI Actions URL: [https://actions.zapier.com/gpt/actions/](https://actions.zapier.com/gpt/actions/)
* Automatic OpenAPI Configuration: [https://actions.zapier.com/gpt/api/v1/dynamic/openapi.json?tools=meta](https://actions.zapier.com/gpt/api/v1/dynamic/openapi.json?tools=meta)
### Application Prerequisites
Before you get started, make sure you go through the following step in your Zapier:
* Configure the desired AI Actions via the [AI Action Manager](https://actions.zapier.com/gpt/actions/)
### In ChatGPT
In ChatGPT, from the custom GPT creator screen, click on “Actions” and choose **“Import from URL”**. Enter in Zapier URL for provisioning GPTs: [https://actions.zapier.com/gpt/api/v1/dynamic/openapi.json?tools=meta](https://actions.zapier.com/gpt/api/v1/dynamic/openapi.json?tools=meta)
*Are there integrations that you’d like us to prioritize? Are there errors in our integrations? File a PR or issue in our github, and we’ll take a look.*