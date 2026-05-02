Create browser-based games | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Create browser-based games
Define a game plan and let Codex build and test it in a live browser.
Difficulty **Intermediate**
Time horizon **Long-running**
Use Codex to turn a game brief into first a well-defined plan, and then a real browser-based game. Use imagegen to generate visual assets, and let Codex test the game in a live browser to iterate on controls and UI.
## Best for
* Building a browser-based game from scratch
* Game builds where controls, visuals, and deployment all need repeated testing and tuning
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/browser-games/?export=pdf)
Use Codex to turn a game brief into first a well-defined plan, and then a real browser-based game. Use imagegen to generate visual assets, and let Codex test the game in a live browser to iterate on controls and UI.
Intermediate
Long-running
Related links
[ Custom instructions with AGENTS.md ](/codex/guides/agents-md)[ Codex skills ](/codex/skills)
##
Best for
* Building a browser-based game from scratch
* Game builds where controls, visuals, and deployment all need repeated testing and tuning
##
Skills & Plugins
*
[ Playwright ](https://github.com/openai/skills/tree/main/skills/.curated/playwright-interactive)
Play the game in a live browser, inspect the current state, and iterate on controls, timing, and UI feel against the real build.
*
ImageGen
Generate concept art, sprites, backgrounds, and UI assets, then keep the prompts reusable for later asset batches.
*
[ OpenAI Docs ](https://github.com/openai/skills/tree/main/skills/.curated/openai-docs)
Pull current official guidance before wiring OpenAI-powered features into the game.
|
Skill
|
Why use it
|
|[ Playwright ](https://github.com/openai/skills/tree/main/skills/.curated/playwright-interactive)| Play the game in a live browser, inspect the current state, and iterate on controls, timing, and UI feel against the real build. |
| ImageGen | Generate concept art, sprites, backgrounds, and UI assets, then keep the prompts reusable for later asset batches. |
|[ OpenAI Docs ](https://github.com/openai/skills/tree/main/skills/.curated/openai-docs)| Pull current official guidance before wiring OpenAI-powered features into the game. |
##
Starter prompt
Use $playwright-interactive, $imagegen, and $openai-docs to plan and build a browser game in this repo.
Implement PLAN.md, and log your work under `.logs/`.
[Open in the Codex app](<codex://new?prompt=Use+$playwright-interactive,+$imagegen,+and+$openai-docs+to+plan+and+build+a+browser+game+in+this+repo.
Implement+PLAN.md,+and+log+your+work+under+`.logs/`.>)
Use $playwright-interactive, $imagegen, and $openai-docs to plan and build a browser game in this repo.
Implement PLAN.md, and log your work under `.logs/`.
## Introduction
Building a game is one of the clearest examples of where Codex helps with more than code generation. A real game usually needs a written concept, a rendering layer, frontend shell work, backend state, asset production, and constant visual tuning
This use case works best when Codex starts by writing down exactly what the game should do, then iterates using Playwright interactive to test the game in a live browser.
## Start with the game plan
Before Codex scaffolds anything, ask it to create a `PLAN.md` that defines the game in concrete terms:
* the player goal
* the main loop
* inputs and controls
* win and fail states
* progression or difficulty
* visual direction
* the stack and hosting assumptions
* the milestone order
That plan matters because “build a game” is too vague on its own. Codex needs to know how to implement each part of the game, and often refer to the implementation details as it builds.
You can activate plan mode with the `/plan` slash command.
Take the output and save it to a `PLAN.md` file.
## Guide Codex’s behavior with AGENTS.md
To make sure Codex follows the plan, verifies its work and uses the right tools, define an `AGENTS.md` that looks like this:
```
`# Game name
\<Type of game\>
Tech Stack:
- NextJS for frontend (hosted on Vercel)
- \<insert technology\> for rendering
- Fastify for backend, websockets (hosted on \<hosting platform\>)
- Postgres for database (hosted on \<hosting platform\>)
- Redis for caching and pub/sub (hosted on \<hosting platform\>)
- OpenAI for generative AI features
Tips:
- Use build and test commands to verify your work as soon as you complete a feature or task
- Use the PLAN.md file to guide your work when building new features
- Log your work under .logs (create new log files as you see fit) to record your thought process and decisions, and reference them when iterating on features
- Use playwright to test the visual output of your work, and iterate if it doesn't look right or fit the vibe
- Use imagegen to generate visual assets for your work, and every time you generate a collection of assets, save the prompts you used to be able to continue generating more of the same assets later (create files in .prompts)
- Use Context7 MCP to fetch \<rendering framework\> docs`
```
This allows Codex to run independently for a long time, and use the relevant skills as needed.
## Leverage skills
Add the skills mentioned in the AGENTS.md file:
* Imagegen so Codex can generate visual assets for the game as needed
* Playwright interactive so Codex can test the game in a live browser
* OpenAI docs so Codex can fetch the latest OpenAI API documentation
* Optionally, you can add the Context7 MCP server to fetch the latest docs for the rendering framework
Learn more about how to add skills in the [skills documentation](/codex/skills).
**Tip**: Ask Codex to save prompts for image generation in a file so that
visual assets are all consistent. Give directions on the style of assets you
want to generate, and let Codex come up with detailed reusable prompts.
## Let Codex work and iterate
Codex will generate a first version of the game based on the initial plan.
If you have a lot of image assets that need to be generated, this first version can take a while, sometimes several hours. Since Codex can test its work and try the game in a live browser, it can go on for a long time without any input.
The more defined the plan, the better the final output after the first iteration.
As you test it out, iterate as needed by providing screenshots, asking for gameplay changes or updates to visual assets, until you are happy with the result.
##
Tech stack
Need
Default options
Why it's needed
Need
Web game stack
Default options
[ Next.js ](https://nextjs.org/) with [ Phaser ](https://phaser.io/) or [ PixiJS ](https://pixijs.com/)
Why it's needed
A practical default for browser-based game UI plus the rendering layer.
Need
Backend stack
Default options
[ Fastify ](https://fastify.dev/), WebSockets, [ Postgres ](https://www.postgresql.org/), and [ Redis ](https://redis.io/)
Why it's needed
A strong default when the game needs persistence, matchmaking, leaderboards, or pub/sub.
|
Need
|
Default options
|
Why it's needed
|
| Web game stack |[ Next.js ](https://nextjs.org/) with [ Phaser ](https://phaser.io/) or [ PixiJS ](https://pixijs.com/)| A practical default for browser-based game UI plus the rendering layer. |
| Backend stack |[ Fastify ](https://fastify.dev/), WebSockets, [ Postgres ](https://www.postgresql.org/), and [ Redis ](https://redis.io/)| A strong default when the game needs persistence, matchmaking, leaderboards, or pub/sub. |
##
Related use cases
[
### Add iOS app intents
Use Codex and the Build iOS Apps plugin to identify the actions and entities your app should...
iOS Code
](/codex/use-cases/ios-app-intents)[
### Adopt liquid glass
Use Codex and the Build iOS Apps plugin to audit existing iPhone and iPad UI, replace custom...
iOS Code
](/codex/use-cases/ios-liquid-glass)[
### Build a Mac app shell
Use Codex and the Build macOS Apps plugin to turn an app idea into a desktop-native...
macOS Code
](/codex/use-cases/macos-sidebar-detail-inspector)