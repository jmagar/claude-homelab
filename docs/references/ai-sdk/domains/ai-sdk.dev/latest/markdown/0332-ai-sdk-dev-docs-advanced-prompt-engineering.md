Advanced: Prompt Engineering
[](https://vercel.com/oss)
Menu
v6 (Latest)
AI SDK 6.x
[AI SDK by Vercel](/docs/introduction)
[Foundations](/docs/foundations)
[Overview](/docs/foundations/overview)
[Providers and Models](/docs/foundations/providers-and-models)
[Prompts](/docs/foundations/prompts)
[Tools](/docs/foundations/tools)
[Streaming](/docs/foundations/streaming)
[Provider Options](/docs/foundations/provider-options)
[Getting Started](/docs/getting-started)
[Choosing a Provider](/docs/getting-started/choosing-a-provider)
[Navigating the Library](/docs/getting-started/navigating-the-library)
[Next.js App Router](/docs/getting-started/nextjs-app-router)
[Next.js Pages Router](/docs/getting-started/nextjs-pages-router)
[Svelte](/docs/getting-started/svelte)
[Vue.js (Nuxt)](/docs/getting-started/nuxt)
[Node.js](/docs/getting-started/nodejs)
[Expo](/docs/getting-started/expo)
[TanStack Start](/docs/getting-started/tanstack-start)
[Coding Agents](/docs/getting-started/coding-agents)
[Agents](/docs/agents)
[Overview](/docs/agents/overview)
[Building Agents](/docs/agents/building-agents)
[Workflow Patterns](/docs/agents/workflows)
[Loop Control](/docs/agents/loop-control)
[Configuring Call Options](/docs/agents/configuring-call-options)
[Memory](/docs/agents/memory)
[Subagents](/docs/agents/subagents)
[AI SDK Core](/docs/ai-sdk-core)
[Overview](/docs/ai-sdk-core/overview)
[Generating Text](/docs/ai-sdk-core/generating-text)
[Generating Structured Data](/docs/ai-sdk-core/generating-structured-data)
[Tool Calling](/docs/ai-sdk-core/tools-and-tool-calling)
[Model Context Protocol (MCP)](/docs/ai-sdk-core/mcp-tools)
[Prompt Engineering](/docs/ai-sdk-core/prompt-engineering)
[Settings](/docs/ai-sdk-core/settings)
[Embeddings](/docs/ai-sdk-core/embeddings)
[Reranking](/docs/ai-sdk-core/reranking)
[Image Generation](/docs/ai-sdk-core/image-generation)
[Transcription](/docs/ai-sdk-core/transcription)
[Speech](/docs/ai-sdk-core/speech)
[Video Generation](/docs/ai-sdk-core/video-generation)
[Language Model Middleware](/docs/ai-sdk-core/middleware)
[Provider & Model Management](/docs/ai-sdk-core/provider-management)
[Error Handling](/docs/ai-sdk-core/error-handling)
[Testing](/docs/ai-sdk-core/testing)
[Telemetry](/docs/ai-sdk-core/telemetry)
[DevTools](/docs/ai-sdk-core/devtools)
[Event Callbacks](/docs/ai-sdk-core/event-listeners)
[AI SDK UI](/docs/ai-sdk-ui)
[Overview](/docs/ai-sdk-ui/overview)
[Chatbot](/docs/ai-sdk-ui/chatbot)
[Chatbot Message Persistence](/docs/ai-sdk-ui/chatbot-message-persistence)
[Chatbot Resume Streams](/docs/ai-sdk-ui/chatbot-resume-streams)
[Chatbot Tool Usage](/docs/ai-sdk-ui/chatbot-tool-usage)
[Generative User Interfaces](/docs/ai-sdk-ui/generative-user-interfaces)
[Completion](/docs/ai-sdk-ui/completion)
[Object Generation](/docs/ai-sdk-ui/object-generation)
[Streaming Custom Data](/docs/ai-sdk-ui/streaming-data)
[Error Handling](/docs/ai-sdk-ui/error-handling)
[Transport](/docs/ai-sdk-ui/transport)
[Reading UIMessage Streams](/docs/ai-sdk-ui/reading-ui-message-streams)
[Message Metadata](/docs/ai-sdk-ui/message-metadata)
[Stream Protocols](/docs/ai-sdk-ui/stream-protocol)
[AI SDK RSC](/docs/ai-sdk-rsc)
[Advanced](/docs/advanced)
[Prompt Engineering](/docs/advanced/prompt-engineering)
[Stopping Streams](/docs/advanced/stopping-streams)
[Backpressure](/docs/advanced/backpressure)
[Caching](/docs/advanced/caching)
[Multiple Streamables](/docs/advanced/multiple-streamables)
[Rate Limiting](/docs/advanced/rate-limiting)
[Rendering UI with Language Models](/docs/advanced/rendering-ui-with-language-models)
[Language Models as Routers](/docs/advanced/model-as-router)
[Multistep Interfaces](/docs/advanced/multistep-interfaces)
[Sequential Generations](/docs/advanced/sequential-generations)
[Vercel Deployment Guide](/docs/advanced/vercel-deployment-guide)
[Reference](/docs/reference)
[AI SDK Core](/docs/reference/ai-sdk-core)
[AI SDK UI](/docs/reference/ai-sdk-ui)
[AI SDK RSC](/docs/reference/ai-sdk-rsc)
[AI SDK Errors](/docs/reference/ai-sdk-errors)
[Migration Guides](/docs/migration-guides)
[Troubleshooting](/docs/troubleshooting)
Copy markdown
# [Prompt Engineering](#prompt-engineering)
## [What is a Large Language Model (LLM)?](#what-is-a-large-language-model-llm)
A Large Language Model is essentially a prediction engine that takes a sequence of words as input and aims to predict the most likely sequence to follow. It does this by assigning probabilities to potential next sequences and then selecting one. The model continues to generate sequences until it meets a specified stopping criterion.
These models learn by training on massive text corpuses, which means they will be better suited to some use cases than others. For example, a model trained on GitHub data would understand the probabilities of sequences in source code particularly well. However, it's crucial to understand that the generated sequences, while often seeming plausible, can sometimes be random and not grounded in reality. As these models become more accurate, many surprising abilities and applications emerge.
## [What is a prompt?](#what-is-a-prompt)
Prompts are the starting points for LLMs. They are the inputs that trigger the model to generate text. The scope of prompt engineering involves not just crafting these prompts but also understanding related concepts such as hidden prompts, tokens, token limits, and the potential for prompt hacking, which includes phenomena like jailbreaks and leaks.
## [Why is prompt engineering needed?](#why-is-prompt-engineering-needed)
Prompt engineering currently plays a pivotal role in shaping the responses of LLMs. It allows us to tweak the model to respond more effectively to a broader range of queries. This includes the use of techniques like semantic search, command grammars, and the ReActive model architecture. The performance, context window, and cost of LLMs varies between models and model providers which adds further constraints to the mix. For example, the GPT-4 model is more expensive than GPT-3.5-turbo and significantly slower, but it can also be more effective at certain tasks. And so, like many things in software engineering, there is a trade-offs between cost and performance.
To assist with comparing and tweaking LLMs, we've built an AI playground that allows you to compare the performance of different models side-by-side online. When you're ready, you can even generate code with the AI SDK to quickly use your prompt and your selected model into your own applications.
## [Example: Build a Slogan Generator](#example-build-a-slogan-generator)
### [Start with an instruction](#start-with-an-instruction)
Imagine you want to build a slogan generator for marketing campaigns. Creating catchy slogans isn't always straightforward!
First, you'll need a prompt that makes it clear what you want. Let's start with an instruction. Submit this prompt to generate your first completion.
Create a slogan for a coffee shop.
Generate
...
Not bad! Now, try making your instruction more specific.
Create a slogan for an organic coffee shop.
Generate
...
Introducing a single descriptive term to our prompt influences the completion. Essentially, crafting your prompt is the means by which you "instruct" or "program" the model.
### [Include examples](#include-examples)
Clear instructions are key for quality outcomes, but that might not always be enough. Let's try to enhance your instruction further.
Create three slogans for a coffee shop with live music.
Generate
...
These slogans are fine, but could be even better. It appears the model overlooked the 'live' part in our prompt. Let's change it slightly to generate more appropriate suggestions.
Often, it's beneficial to both demonstrate and tell the model your requirements. Incorporating examples in your prompt can aid in conveying patterns or subtleties. Test this prompt that carries a few examples.
Create three slogans for a business with unique features.
Business: Bookstore with cats
Slogans: "Purr-fect Pages", "Books and Whiskers", "Novels and Nuzzles"
Business: Gym with rock climbing
Slogans: "Peak Performance", "Reach New Heights", "Climb Your Way Fit"
Business: Coffee shop with live music
Slogans:
Generate
...
Great! Incorporating examples of expected output for a certain input prompted the model to generate the kind of names we aimed for.
### [Tweak your settings](#tweak-your-settings)
Apart from designing prompts, you can influence completions by tweaking model settings. A crucial setting is the **temperature**.
You might have seen that the same prompt, when repeated, yielded the same or nearly the same completions. This happens when your temperature is at 0.
Attempt to re-submit the identical prompt a few times with temperature set to 1.
Create three slogans for a business with unique features.
Business: Bookstore with cats
Slogans: "Purr-fect Pages", "Books and Whiskers", "Novels and Nuzzles"
Business: Gym with rock climbing
Slogans: "Peak Performance", "Reach New Heights", "Climb Your Way Fit"
Business: Coffee shop with live music
Slogans:
Generate
...
Notice the difference? With a temperature above 0, the same prompt delivers varied completions each time.
Keep in mind that the model forecasts the text most likely to follow the preceding text. Temperature, a value from 0 to 1, essentially governs the model's confidence level in making these predictions. A lower temperature implies lesser risks, leading to more precise and deterministic completions. A higher temperature yields a broader range of completions.
For your slogan generator, you might want a large pool of name suggestions. A moderate temperature of 0.6 should serve well.
## [Recommended Resources](#recommended-resources)
Prompt Engineering is evolving rapidly, with new methods and research papers surfacing every week. Here are some resources that we've found useful for learning about and experimenting with prompt engineering:
* [The Vercel AI Playground](/playground)
* [Brex Prompt Engineering](https://github.com/brexhq/prompt-engineering)
* [Prompt Engineering Guide by Dair AI](https://www.promptingguide.ai/)
On this page
[Prompt Engineering](#prompt-engineering)
[What is a Large Language Model (LLM)?](#what-is-a-large-language-model-llm)
[What is a prompt?](#what-is-a-prompt)
[Why is prompt engineering needed?](#why-is-prompt-engineering-needed)
[Example: Build a Slogan Generator](#example-build-a-slogan-generator)
[Start with an instruction](#start-with-an-instruction)
[Include examples](#include-examples)
[Tweak your settings](#tweak-your-settings)
[Recommended Resources](#recommended-resources)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)