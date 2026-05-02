Guides: Get started with Computer Use
[](https://vercel.com/oss)
Menu
[Guides](/cookbook/guides)
[RAG Agent](/cookbook/guides/rag-chatbot)
[Multi-Modal Agent](/cookbook/guides/multi-modal-chatbot)
[Slackbot Agent Guide](/cookbook/guides/slackbot)
[Natural Language Postgres](/cookbook/guides/natural-language-postgres)
[Get started with Computer Use](/cookbook/guides/computer-use)
[Add Skills to Your Agent](/cookbook/guides/agent-skills)
[Build a Custom Memory Tool](/cookbook/guides/custom-memory-tool)
[Get started with Gemini 3](/cookbook/guides/gemini)
[Get started with Claude 4](/cookbook/guides/claude-4)
[OpenAI Responses API](/cookbook/guides/openai-responses)
[Google Gemini Image Generation](/cookbook/guides/google-gemini-image-generation)
[Get started with Claude 3.7 Sonnet](/cookbook/guides/sonnet-3-7)
[Get started with Llama 3.1](/cookbook/guides/llama-3_1)
[Get started with GPT-5](/cookbook/guides/gpt-5)
[Get started with OpenAI o1](/cookbook/guides/o1)
[Get started with OpenAI o3-mini](/cookbook/guides/o3)
[Get started with DeepSeek R1](/cookbook/guides/r1)
[Get started with DeepSeek V3.2](/cookbook/guides/deepseek-v3-2)
[Next.js](/cookbook/next)
[Generate Text](/cookbook/next/generate-text)
[Generate Text with Chat Prompt](/cookbook/next/generate-text-with-chat-prompt)
[Generate Image with Chat Prompt](/cookbook/next/generate-image-with-chat-prompt)
[Stream Text](/cookbook/next/stream-text)
[Stream Text with Chat Prompt](/cookbook/next/stream-text-with-chat-prompt)
[Stream Text with Image Prompt](/cookbook/next/stream-text-with-image-prompt)
[Chat with PDFs](/cookbook/next/chat-with-pdf)
[streamText Multi-Step Cookbook](/cookbook/next/stream-text-multistep)
[Markdown Chatbot with Memoization](/cookbook/next/markdown-chatbot-with-memoization)
[Generate Object](/cookbook/next/generate-object)
[Generate Object with File Prompt through Form Submission](/cookbook/next/generate-object-with-file-prompt)
[Stream Object](/cookbook/next/stream-object)
[Call Tools](/cookbook/next/call-tools)
[Call Tools in Multiple Steps](/cookbook/next/call-tools-multiple-steps)
[Model Context Protocol (MCP) Tools](/cookbook/next/mcp-tools)
[Share useChat State Across Components](/cookbook/next/use-shared-chat-context)
[Human-in-the-Loop with Next.js](/cookbook/next/human-in-the-loop)
[Track Agent Token Usage](/cookbook/next/track-agent-token-usage)
[Send Custom Body from useChat](/cookbook/next/send-custom-body-from-use-chat)
[Streaming with Custom Format](/cookbook/next/custom-stream-format)
[Render Visual Interface in Chat](/cookbook/next/render-visual-interface-in-chat)
[Caching Middleware](/cookbook/next/caching-middleware)
[Node](/cookbook/node)
[Generate Text](/cookbook/node/generate-text)
[Generate Text with Chat Prompt](/cookbook/node/generate-text-with-chat-prompt)
[Generate Text with Image Prompt](/cookbook/node/generate-text-with-image-prompt)
[Stream Text](/cookbook/node/stream-text)
[Stream Text with Chat Prompt](/cookbook/node/stream-text-with-chat-prompt)
[Stream Text with Image Prompt](/cookbook/node/stream-text-with-image-prompt)
[Stream Text with File Prompt](/cookbook/node/stream-text-with-file-prompt)
[Generate Object with a Reasoning Model](/cookbook/node/generate-object-reasoning)
[Generate Object](/cookbook/node/generate-object)
[Stream Object](/cookbook/node/stream-object)
[Stream Object with Image Prompt](/cookbook/node/stream-object-with-image-prompt)
[Record Token Usage After Streaming Object](/cookbook/node/stream-object-record-token-usage)
[Record Final Object after Streaming Object](/cookbook/node/stream-object-record-final-object)
[Call Tools](/cookbook/node/call-tools)
[Call Tools in Parallel](/cookbook/node/call-tools-in-parallel)
[Call Tools with Image Prompt](/cookbook/node/call-tools-with-image-prompt)
[Call Tools in Multiple Steps](/cookbook/node/call-tools-multiple-steps)
[Model Context Protocol (MCP) Tools](/cookbook/node/mcp-tools)
[Manual Agent Loop](/cookbook/node/manual-agent-loop)
[Web Search Agent](/cookbook/node/web-search-agent)
[Model Context Protocol (MCP) Elicitation](/cookbook/node/mcp-elicitation)
[Embed Text](/cookbook/node/embed-text)
[Embed Text in Batch](/cookbook/node/embed-text-batch)
[Intercepting Fetch Requests](/cookbook/node/intercept-fetch-requests)
[Local Caching Middleware](/cookbook/node/local-caching-middleware)
[Repair Malformed JSON with jsonrepair](/cookbook/node/repair-json-with-jsonrepair)
[Dynamic Prompt Caching](/cookbook/node/dynamic-prompt-caching)
[Retrieval Augmented Generation](/cookbook/node/retrieval-augmented-generation)
[Knowledge Base Agent](/cookbook/node/knowledge-base-agent)
[API Servers](/cookbook/api-servers)
[Node.js HTTP Server](/cookbook/api-servers/node-http-server)
[Express](/cookbook/api-servers/express)
[Hono](/cookbook/api-servers/hono)
[Fastify](/cookbook/api-servers/fastify)
[Nest.js](/cookbook/api-servers/nest)
[React Server Components](/cookbook/rsc)
Copy markdown
# [Get started with Computer Use](#get-started-with-computer-use)
With the [release of Computer Use in Claude 3.5 Sonnet](https://www.anthropic.com/news/3-5-models-and-computer-use), you can now direct AI models to interact with computers like humans do - moving cursors, clicking buttons, and typing text. This capability enables automation of complex tasks while leveraging Claude's advanced reasoning abilities.
The AI SDK is a powerful TypeScript toolkit for building AI applications with large language models (LLMs) like Anthropic's Claude alongside popular frameworks like React, Next.js, Vue, Svelte, Node.js, and more. In this guide, you will learn how to integrate Computer Use into your AI SDK applications.
Computer Use is currently in beta with some [ limitations
](https://docs.anthropic.com/en/docs/build-with-claude/computer-use#understand-computer-use-limitations).
The feature may be error-prone at times. Anthropic recommends starting with
low-risk tasks and implementing appropriate safety measures.
## [Computer Use](#computer-use)
Anthropic recently released a new version of the Claude 3.5 Sonnet model which is capable of 'Computer Use'. This allows the model to interact with computer interfaces through basic actions like:
* Moving the cursor
* Clicking buttons
* Typing text
* Taking screenshots
* Reading screen content
## [How It Works](#how-it-works)
Computer Use enables the model to read and interact with on-screen content through a series of coordinated steps. Here's how the process works:
1. **Start with a prompt and tools**
Add Anthropic-defined Computer Use tools to your request and provide a task (prompt) for the model. For example: "save an image to your downloads folder."
2. **Select the right tool**
The model evaluates which computer tools can help accomplish the task. It then sends a formatted `tool\_call` to use the appropriate tool.
3. **Execute the action and return results**
The AI SDK processes Claude's request by running the selected tool. The results can then be sent back to Claude through a `tool\_result` message.
4. **Complete the task through iterations**
Claude analyzes each result to determine if more actions are needed. It continues requesting tool use and processing results until it completes your task or requires additional input.
### [Available Tools](#available-tools)
There are three main tools available in the Computer Use API:
1. **Computer Tool**: Enables basic computer control like mouse movement, clicking, and keyboard input
2. **Text Editor Tool**: Provides functionality for viewing and editing text files
3. **Bash Tool**: Allows execution of bash commands
### [Implementation Considerations](#implementation-considerations)
Computer Use tools in the AI SDK are predefined interfaces that require your own implementation of the execution layer. While the SDK provides the type definitions and structure for these tools, you need to:
1. Set up a controlled environment for Computer Use execution
2. Implement core functionality like mouse control and keyboard input
3. Handle screenshot capture and processing
4. Set up rules and limits for how Claude can interact with your system
The recommended approach is to start with [ Anthropic's reference implementation ](https://github.com/anthropics/anthropic-quickstarts/tree/main/computer-use-demo), which provides:
* A containerized environment configured for safe Computer Use
* Ready-to-use (Python) implementations of Computer Use tools
* An agent loop for API interaction and tool execution
* A web interface for monitoring and control
This reference implementation serves as a foundation to understand the requirements before building your own custom solution.
## [Getting Started with the AI SDK](#getting-started-with-the-ai-sdk)
If you have never used the AI SDK before, start by following the [Getting
Started guide](/docs/getting-started).
For a working example of Computer Use implementation with Next.js and the AI
SDK, check out our [AI SDK Computer Use
Template](https://github.com/vercel-labs/ai-sdk-computer-use).
First, ensure you have the AI SDK and [Anthropic AI SDK provider](/providers/ai-sdk-providers/anthropic) installed:
```
pnpm add ai @ai-sdk/anthropic
```
You can add Computer Use to your AI SDK applications using provider-defined-client tools. These tools accept various input parameters (like display height and width in the case of the computer tool) and then require that you define an execute function.
Here's how you could set up the Computer Tool with the AI SDK:
```
`
import { anthropic } from '@ai-sdk/anthropic';
import { getScreenshot, executeComputerAction } from '@/utils/computer-use';
const computerTool = anthropic.tools.computer\_20250124({
displayWidthPx: 1920,
displayHeightPx: 1080,
execute: async ({ action, coordinate, text }) =\> {
switch (action) {
case 'screenshot': {
return {
type: 'image',
data: getScreenshot(),
};
}
default: {
return executeComputerAction(action, coordinate, text);
}
}
},
toModelOutput({ output }) {
return typeof output === 'string'
? [{ type: 'text', text: output }]
: [{ type: 'image', data: output.data, mediaType: 'image/png' }];
},
});
`
```
The `computerTool` handles two main actions: taking screenshots via `getScreenshot()` and executing computer actions like mouse movements and clicks through `executeComputerAction()`. Remember, you have to implement this execution logic (eg. the `getScreenshot` and `executeComputerAction` functions) to handle the actual computer interactions. The `execute` function should handle all low-level interactions with the operating system.
Finally, to send tool results back to the model, use the [`toModelOutput()`](/docs/foundations/prompts#multi-modal-tool-results) function to convert text and image responses into a format the model can process. The AI SDK includes experimental support for these multi-modal tool results when using Anthropic's models.
Computer Use requires appropriate safety measures like using virtual machines,
limiting access to sensitive data, and implementing human oversight for
critical actions.
### [Using Computer Tools with Text Generation](#using-computer-tools-with-text-generation)
Once your tool is defined, you can use it with both the [`generateText`](/docs/reference/ai-sdk-core/generate-text) and [`streamText`](/docs/reference/ai-sdk-core/stream-text) functions.
For one-shot text generation, use `generateText`:
```
`
const result = await generateText({
model: 'anthropic/claude-sonnet-4-20250514',
prompt: 'Move the cursor to the center of the screen and take a screenshot',
tools: { computer: computerTool },
});
console.log(result.text);
`
```
For streaming responses, use `streamText` to receive updates in real-time:
```
`
const result = streamText({
model: 'anthropic/claude-sonnet-4-20250514',
prompt: 'Open the browser and navigate to vercel.com',
tools: { computer: computerTool },
});
for await (const chunk of result.textStream) {
console.log(chunk);
}
`
```
### [Configure Multi-Step (Agentic) Generations](#configure-multi-step-agentic-generations)
To allow the model to perform multiple steps without user intervention, use the `stopWhen` parameter. This will automatically send any tool results back to the model to trigger a subsequent generation:
```
`
import { stepCountIs } from 'ai';
const stream = streamText({
model: 'anthropic/claude-sonnet-4-20250514',
prompt: 'Open the browser and navigate to vercel.com',
tools: { computer: computerTool },
stopWhen: stepCountIs(10), // experiment with this value based on your use case
});
`
```
### [Combine Multiple Tools](#combine-multiple-tools)
You can combine multiple tools in a single request to enable more complex workflows. The AI SDK supports all three of Claude's Computer Use tools:
```
`
const computerTool = anthropic.tools.computer\_20250124({
...
});
const bashTool = anthropic.tools.bash\_20250124({
execute: async ({ command, restart }) =\> execSync(command).toString()
});
const textEditorTool = anthropic.tools.textEditor\_20250124({
execute: async ({
command,
path,
file\_text,
insert\_line,
new\_str,
insert\_text,
old\_str,
view\_range
}) =\> {
// Handle file operations based on command
switch(command) {
return executeTextEditorFunction({
command,
path,
fileText: file\_text,
insertLine: insert\_line,
newStr: new\_str,
insertText: insert\_text,
oldStr: old\_str,
viewRange: view\_range
});
}
}
});
const response = await generateText({
model: 'anthropic/claude-sonnet-4-20250514',
prompt: "Create a new file called example.txt, write 'Hello World' to it, and run 'cat example.txt' in the terminal",
tools: {
computer: computerTool,
bash: bashTool,
str\_replace\_editor: textEditorTool,
},
});
`
```
Always implement appropriate [security measures](#security-measures) and
obtain user consent before enabling Computer Use in production applications.
### [Best Practices for Computer Use](#best-practices-for-computer-use)
To get the best results when using Computer Use:
1. Specify simple, well-defined tasks with explicit instructions for each step
2. Prompt Claude to verify outcomes through screenshots
3. Use keyboard shortcuts when UI elements are difficult to manipulate
4. Include example screenshots for repeatable tasks
5. Provide explicit tips in system prompts for known tasks
## [Security Measures](#security-measures)
Remember, Computer Use is a beta feature. Please be aware that it poses unique risks that are distinct from standard API features or chat interfaces. These risks are heightened when using Computer Use to interact with the internet. To minimize risks, consider taking precautions such as:
1. Use a dedicated virtual machine or container with minimal privileges to prevent direct system attacks or accidents.
2. Avoid giving the model access to sensitive data, such as account login information, to prevent information theft.
3. Limit internet access to an allowlist of domains to reduce exposure to malicious content.
4. Ask a human to confirm decisions that may result in meaningful real-world consequences as well as any tasks requiring affirmative consent, such as accepting cookies, executing financial transactions, or agreeing to terms of service.
On this page
[Get started with Computer Use](#get-started-with-computer-use)
[Computer Use](#computer-use)
[How It Works](#how-it-works)
[Available Tools](#available-tools)
[Implementation Considerations](#implementation-considerations)
[Getting Started with the AI SDK](#getting-started-with-the-ai-sdk)
[Using Computer Tools with Text Generation](#using-computer-tools-with-text-generation)
[Configure Multi-Step (Agentic) Generations](#configure-multi-step-agentic-generations)
[Combine Multiple Tools](#combine-multiple-tools)
[Best Practices for Computer Use](#best-practices-for-computer-use)
[Security Measures](#security-measures)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)