Building frontend UIs with Codex and Figma | OpenAI Developers
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
Starting today, you can generate Figma design files from Codex using the Figma MCP server. The MCP server is built to support movement in both directions, bringing working UI onto the Figma canvas and back into code just as easily, so you can build on your best ideas, not just your first.
The Codex desktop application is purpose-built for agentic coding. It provides a focused interface for managing multiple agents in parallel across projects, tracking progress without losing context, and integrating external tools. That kind of fluidity feels familiar. In Figma, teams move just as easily. The canvas is designed for exploration and iteration. It’s a space where the best ideas have room to take shape. By connecting the Figma canvas to Codex, that spirit of exploration extends directly into the development workflow—unlocking a powerful new way for users to build everything from prototypes to production applications.
### Starting an app from a design
One of the core use cases of the Figma MCP server is retrieving context from Figma files and using that context in code generation. The Figma MCP server can capture information from Figma Design, Make, and FigJam files and pass it to Codex as part of the building process.
To get started, open the Figma file that you plan to build your application from. Choose a frame by right clicking and selecting “Copy as” and “Copy link to selection.”
Your browser does not support the video tag.
These selection URLs are linked directly to a frame or node on the Figma canvas. They could be a single element or a collection of components, but essentially it’s the source data that an agent will use for code generation. Selections can come from Figma Design, Make, or FigJam files. Once you have the URL, open Codex and select either a new project or existing one. From here you can instruct Codex with a prompt like:
```
`help me implement this Figma design in code, use my existing design system components as much as possible.`
```
Your browser does not support the video tag.
Prompts like this will instruct the agent to call the `get\_design\_context` tool from the Figma MCP server. This tool helps extract critical design information from Figma files like layouts, styles, and component information and then provides that context to Codex for code generation.
Beyond extracting design information, there are a number of other helpful tools available in the Figma MCP server; for a full list, be sure to [check out our documentation](https://developers.figma.com/docs/figma-mcp-server/tools-and-prompts/).
### From code to canvas
After iterating in code, you’ll want to bring your design back into the canvas to compare flows, explore alternatives, and validate your assumptions. The Figma MCP server makes it easy to bring those screens back into Figma without having to recreate them manually from the browser. With the `generate\_figma\_design` tool, you can turn a live, running interface into fully editable Figma frames in seconds—bringing real, functioning UI directly onto the canvas for deeper explorations and collaboration.
First you’ll need to render the UI of your application. This can be done either locally or via a publicly available web server. From there, ask Codex to help you generate a new Figma design file.
Your browser does not support the video tag.
Codex will then walk you through the following steps:
1. Decide to either create a new Figma file or use an existing one.
2. Determine which workspace to place the file in.
3. Set up the application for UI capture.
4. Open a new browser session of your application.
When the application reloads, you will see a new toolbar at the top of the page with the following options:
**Entire screen:** Capture the render of the entire screen currently displayed and send it to the Figma file.
**Select element:** Choose a specific component or element on the page to capture
**Open file:** Open the Figma file to inspect your new design layers
Your browser does not support the video tag.
After you’ve captured all the information that you want to transfer to Figma, you can choose to either open the file or return to Codex. Codex will have the Figma file URL waiting for you.
### There and back again, an MCP story
Now that you’ve built your app and set up your design file, you’re ready to iterate. Here you can take full advantage of what the Figma canvas has to offer, including:
* Adding design system components
* Updating styles, fonts, and colors to variables
* Adjusting layouts and adding annotation instructions
* Crafting various interactions and empty states
* Collaborating on multiple variations and explorations
Once you’ve completed refining the UI, you can follow the same steps that we outlined at the beginning of this blog to pull those changes back into your application via the MCP server.
When code and the canvas are connected, you can move fluidly between execution and exploration. This roundtrip process unlocks the true power of the Figma MCP server with Codex—the ability to start from anywhere to craft meaningful, high-quality application experiences without compromising on speed.
To learn more about the Figma MCP server, review our [documentation](https://developers.figma.com/docs/figma-mcp-server/) or get started by installing the Figma MCP server directly in the Codex desktop application.