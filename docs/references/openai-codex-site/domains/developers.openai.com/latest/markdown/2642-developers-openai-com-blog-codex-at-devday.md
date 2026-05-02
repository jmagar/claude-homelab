How Codex ran OpenAI DevDay 2025
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ All posts ](/blog)
### Recent
* [ How Perplexity Brought Voice Search to Millions Using the Realtime API ](/blog/realtime-perplexity-computer)
* [ Designing delightful frontends with GPT-5.4 ](/blog/designing-delightful-frontends-with-gpt-5-4)
* [ From prompts to products: One year of Responses ](/blog/one-year-of-responses)
* [ Using skills to accelerate OSS maintenance ](/blog/skills-agents-sdk)
* [ Building frontend UIs with Codex and Figma ](/blog/building-frontend-uis-with-codex-and-figma)
### Topics
* [ General ](/blog/topic/general)
* [ API ](/blog/topic/api)
* [ Apps SDK ](/blog/topic/apps-sdk)
* [ Audio ](/blog/topic/audio)
* [ Codex ](/blog/topic/codex)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Copy Page
This week we wrapped up our third and largest OpenAI DevDay in San Francisco. The event was the result of the hard work of people across the company. But as we approached DevDay one thing came up again and again in discussions: “I couldn’t have done this without [Codex](/codex)”.
This year was the first DevDay with Codex. We used it in everything that we built: from stage demos (even those not about Codex), to the arcade machines in the community hall, to the products themselves, Codex was a key part of creating DevDay 2025.
Here’s a brief glimpse behind the scenes of a couple of ways that Codex helped us save time, problem solve, multi-task, prioritize, and get organized.
## Controlling cameras and creating a venue lighting MCP
Let’s start with the most obvious project: Romain Huet’s keynote demo of Codex. If you missed it, you can [check it out here](https://www.youtube.com/live/hS1YqcewH0c?si=gw-CPYc-bZ9f0huh&#38;t=2067).
As Romain mentioned, everything you see in this demo beyond using our [Realtime agents starter app](https://github.com/openai/openai-agents-js/tree/main/examples/realtime-next) was built by Codex.
The demo actually started with the idea of wanting to show how Realtime was controlling the camera and lights in the audience. But as Romain started digging into this project, he faced the challenge of programmatically controlling the camera and lights.
Codex was able to figure out a solution to control the network enabled camera using the VISCA protocol (a protocol from the early 90s!), implement the protocol entirely on its own, and even go ahead and build an MCP server to control the protocol of the lights.
Using the [Codex CLI](/codex/cli), Romain was able to work on both problems in parallel and have an initial version up and running in an afternoon without having to touch the keyboard–avoiding what would have otherwise been an extensive research and hacking session.
## Bringing the beats
One of the big launches at DevDay was the [Apps SDK](https://developers.openai.com/apps-sdk), which lets you build rich app experiences directly within ChatGPT. For Katia Gil Guzman’s Developer State of the Union demo, the idea was to build on the light MCP server that Codex had built for Romain and have a rich beat pad interface.
This meant building a visually pleasing interface that was also functionally working, including handling the connection with the lights MCP server to control the lights and allow for it to play different instruments.
Thanks to [Codex Cloud](/codex/cloud) and best-of-N, Katia was able to not only get a functional app out quickly, but iterate on multiple different designs in parallel. She tried out everything from more futuristic modern looks to more OpenAI DevDay branded UIs and even experimented with different features, all without wasting time and effort.
## Multi-tasking game design
If you wandered the hallways of DevDay, you might have seen ArcadeGPT, two arcade cabinets that let you customize your own video game by remixing a collection of existing video games using GPT-5.
As Kevin Whinnery started building the foundation, he needed a range of starting games for GPT-5 to remix–and he needed them fast. To create and iterate on them quickly, he had seven (!!) different terminals open, each with an instance of Codex CLI working on one single-file Phaser game implementation.
Thanks to Codex CLI, he could iterate on each of the games asynchronously, testing them all at the same time to provide attendees with a wide range of games to play and remix.
## Rebuilding demo apps
Personally, I used Codex for basically every task leading up to DevDay. It’s hard to cover every single moment that I felt grateful for Codex, but one stood out.
I had been working on the fine-tuning demo for my [Open Models talk](https://www.youtube.com/watch?v=1HL2YHRj270) and used Streamlit for all of it. But the Streamlit app felt convoluted, was hard to grasp for the audience, and had some behavioral bugs that weren’t easy to fix. After taking some screenshots and creating a quick initial design using v0, I downloaded the mock [Next.js](https://nextjs.org) app and put the Codex IDE extension to work.
I asked it to take my Streamlit app and create a FastAPI server that would perform the same work and connect it to my [Next.js](https://nextjs.org) front-end. After firing off the task, I went to lunch and came back to a fully implemented and working application. From there, I was able to have Codex work on additional tasks to create additional pages that helped me better illustrate the demo.
Without Codex, this demo would have never landed on time.
## Making it real
Erika Kettleson was able to save time by using the Codex IDE extension to turn an entire booth demo into reality. She started with a sketch that was fed into Codex to create the initial UI, and even had Codex write evals to help determine the best model to use to generate SVGs while trading off speed and quality. Codex helped Erika evaluate the tradeoffs of using a single or multi-agent architecture for the demo and then refactored the whole codebase to move to the single agent architecture.
And after building it all, Codex created detailed Mermaid diagrams that Erika used at the booth to explain to people how the app worked.
## Reviewing at scale
One part of the [AgentKit launch](https://openai.com/index/introducing-agentkit/) was the release of our new Guardrails SDKs for [Python](https://pypi.org/project/openai-guardrails/) and [TypeScript](https://www.npmjs.com/package/@openai/guardrails). These SDKs are designed to work with our Agents SDKs in [Python](https://openai.github.io/openai-agents-python) and [TypeScript](https://openai.github.io/openai-agents-js) and with Agent Builder. To ensure that developers had a great experience with the SDKs, Kazuhiro (Kaz) Sera came onto the project to help get the project over the finish line.
He used Codex to quickly ramp up with the codebase of the two SDKs, identify the root causes of some of the bugs that he and Codex identified, use the Codex CLI and IDE extension to fix them and leverage Codex code review to identify any outstanding bugs.
Thanks to Codex he was able to do all of that to help the team get the SDKs out while also using the same tools to polish the [ChatKit](https://platform.openai.com/docs/guides/chatkit) sample apps that we released the same day.
## Juggling multiple projects at once
Leading up to DevDay, a lot of us were working on increasing projects at the same time. Codex allowed us to delegate across both local and cloud tasks using the IDE extension and CLI to tackle several tasks at once.
Often you would see us run 3-4 completely independent tasks at the same time. For example, in my own case I had Codex at the same time: build Jupyter notebook support into the [gpt-oss server](https://github.com/openai/gpt-oss), refactor and fix some bugs on my agent demo, restructure some Codex docs, and debug my fine-tuning run.
To quickly context switch on our side, we wouldn’t spend a lot of time carefully crafting the right prompt–instead, we’d describe the problem in short sentences to Codex, fire off the task, immediately switch to the next one, and return later to check in on the status of Codex. Even leaving your desk quickly included the habit of “let me just send off one more Codex task” before getting up.
## Getting organized
Launching multiple new products for developers comes with a lot of new documentation that, in the early stages, gets written in documents all over the place: whether it’s inside GitHub repositories, in Google Docs, or in Notion. Often, these documents get iterated on until the very last minute. This launch was no different.
Thanks to Codex Cloud, the team was able to take the fragmented documents, hand them off to Codex with a rough description of how we wanted them to be broken up and organized across our docs, and let Codex handle the rest. Codex split up the files, converted them into MDX files, set up the necessary navigation structures and opened up a PR that we could share with teams for review and iteration thanks to deploy previews.
Without Codex, this would have normally taken hours (if not days) leading up to DevDay.
## Dealing with side quests
Lastly, we’ve all been there–you’re working on the most important task but suddenly you remember this one task you had been planning to do, but you keep getting distracted.
The night before DevDay wasn’t much different. Between rehearsals we were trying to get everything ready for the big day. Katia was getting ready to go onstage to rehearse her demo when she realized she hadn’t shipped an updated 404 page like she had planned.
She quickly opened up another tab on Codex Web and sent a task asking Codex to implement a new [developers.openai.com/404](https://developers.openai.com/404) while using the best-of-n feature to have Codex create two attempts at the same time.
Before Katia went on stage five minutes later, she was able to review the two options thanks to the preview screenshots in Codex, quickly check out the page to make a couple edits using the IDE extension, and ship the newly redesigned 404 page.
## Just scratching the surface
We could probably talk for hours about how Codex helped us shape DevDay, let alone how it helps every one of us on a day-to-day basis–but this is just a glimpse into how we’re using Codex across OpenAI.
If you want to learn more about how we use Codex and some best practices, [check out our DevDay talk about Codex](https://www.youtube.com/watch?v=Gr41tYOzE20) or [check out our documentation](https://developers.openai.com/codex).