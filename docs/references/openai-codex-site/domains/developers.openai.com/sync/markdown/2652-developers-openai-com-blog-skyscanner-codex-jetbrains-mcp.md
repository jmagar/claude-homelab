Supercharging Codex with JetBrains MCP at Skyscanner | OpenAI Developers
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
*Learn how Skyscanner turbocharged OpenAI’s Codex CLI by integrating it with JetBrains IDEs, giving their AI assistant the same debugging and testing tools that human developers use.*
At Skyscanner, we’re always looking for ways to accelerate development without compromising quality. Over the past few months, I’ve been experimenting with OpenAI’s Codex as a pair programmer in my daily workflow.
The twist? I hooked the Codex CLI into JetBrains’ IDEs using their Model Context Protocol (MCP) server: essentially letting the AI see and use the IDE’s capabilities. This integration has been a game-changer. In this post, I’ll share how giving Codex access to JetBrains tools has improved its problem-solving skills and sped up our development.
## Giving Codex an IDE’s Context
Working with Codex using the [JetBrains MCP server](https://www.jetbrains.com/help/idea/mcp-server.html) means the AI can now tap into the rich context of my development environment—things it normally wouldn’t “see”.
With the JetBrains MCP, Codex can ask the IDE for extra context, for example:
* [*Find file problems*](https://www.jetbrains.com/help/idea/mcp-server.html#get_file_problems): analyse a file for errors and warnings using IntelliJ inspections and return the exact issues (with error messages and locations).
* [*Execute run configurations*](https://www.jetbrains.com/help/idea/mcp-server.html#execute_run_configuration): run predefined run configurations (like unit tests, linters, or formatters) and retrieve exit codes and output.
This has proved to be extremely powerful—by tapping into the same feedback loops human developers rely on when writing, compiling, and testing code, Codex can use the IDE’s context to check and verify its output more effectively, reducing iteration time.
### Catching Errors Faster: A Real-World Example
As I was writing unit tests for error handling in our code that uses Databricks’ Java SDK, I prompted Codex to help me stub out an exception scenario. It confidently produced a line of Java code which looked something like this:
```
`var stubError = new NotFound("dummy error");`
```
At first glance, that looks reasonable—we want to simulate a `NotFound` error. But moments later, IntelliJ highlighted that line with a big red underline.
The problem: the `NotFound` exception class in the Databricks SDK doesn’t have a constructor that takes a single string argument (you can see this in the Databricks SDK source: [NotFound.java](https://github.com/databricks/databricks-sdk-java/blob/4074f4e0ed2dc09f2feffddf14d7abdf20412119/databricks-sdk-java/src/main/java/com/databricks/sdk/core/error/platform/NotFound.java)). In other words, Codex’s suggested code was never going to compile.
By default, Codex wouldn’t know about this mistake. It might only realise something’s wrong later when trying to run tests. However, because of the JetBrains MCP integration, Codex immediately noticed the error. [Behind the scenes](https://github.com/Jack-Waller/.codex/blob/91acb8cf907bb91133cdf4d5e4e13253f6045873/AGENTS.md?plain=1#L100-L108), Codex called the IDE’s `get\_file\_problems` tool to inspect the file, which returned the compilation issue (no matching constructor) right away.
Without the MCP, the likely flow would have been:
1. Generate code
2. Determine how to run unit tests
3. Run the unit tests (potentially needing to escalate commands to the user)
4. Read and parse the failure message
5. Attempt to fix the error
With the JetBrains MCP, that loop is much tighter:
1. Generate code
2. Ask JetBrains for file problems
3. Fix the exact error that IntelliJ reports
This saved time and context, and it felt very much like pair programming with an engineer who immediately says, “Ah, that class doesn’t have a constructor like that—it actually requires something different. Let me quickly fix that”.
### Predefined testing and formatting
Another advantage I’ve enjoyed is letting Codex drive our existing build and test tooling directly from the IDE. For most of our projects, I have already defined local run configurations in my IDE, such as running tests, formatting and linting. With the JetBrains MCP, Codex can discover and run these configurations on demand.
In practice, this reduces the time and context required for Codex to figure out how to run this functionality, helping it maintain focus on the original problem. With this change, I’ve observed that Codex no longer stumbles when running tests, formatting or linting.
In my [custom agent instructions](https://github.com/Jack-Waller/.codex/blob/91acb8cf907bb91133cdf4d5e4e13253f6045873/AGENTS.md?plain=1#L93-L108), I therefore instruct Codex to run tests, linting and formatting after every change.
```
`## Code edit instructions
After you've finished editing
- Use the jetbrains mcp (if available) to find any problems
- Run format command if available
- Run lint command if available`
```
I’ve noticed Codex now often solves issues itself without me having to intervene. As a developer, that feels like a huge win:
* I don’t have to manually run tests, linting and formatting every time Codex changes something.
* I don’t have to copy-paste error messages back into the chat.
* Codex gets rapid, precise feedback on whether its changes actually work, reducing the number of feedback cycles.
This gives me more time to focus on the task at hand: delivering high-quality working software.
## What This Means for How We Build
Integrating Codex with JetBrains MCP has made our AI assistant markedly more capable and reliable in our development process. Some of the practical benefits we’ve seen are:
* **Faster feedback loops**: Codex gets immediate feedback from the IDE about compile errors and failing tests.
* **Fewer back-and-forth prompts**: Codex doesn’t always have to wait for me to run something and paste an error message—it can query the IDE directly.
* **Higher-quality suggestions**: Because Codex can see what the IDE sees, its fixes are more likely to compile and pass tests on the first try.
* **Better alignment with existing workflows**: Codex plugs into our existing tooling, instead of inventing its own.
Overall, it has turned Codex from a standalone tool into a more integrated part of our development ecosystem.
## Summary
For us at Skyscanner, the key insight has been simple: context is everything. Codex on its own is powerful, but Codex with IDE awareness is far more effective. This context gives Codex even more insight, enabling it to produce accurate fixes faster and further increasing my trust in its output.
We hope our story inspires others to experiment with these integrations. It truly feels much less like using a tool and much more like collaborating with an AI pair programmer that can see what we see.