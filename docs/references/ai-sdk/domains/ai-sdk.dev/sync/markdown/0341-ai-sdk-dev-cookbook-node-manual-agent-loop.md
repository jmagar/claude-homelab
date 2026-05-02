Node: Manual Agent Loop
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
# [Manual Agent Loop](#manual-agent-loop)
When you need complete control over the agentic loop and tool execution, you can manage the agent flow yourself rather than using `prepareStep` and `stopWhen`. This approach gives you full flexibility over when and how tools are executed, message history management, and loop termination conditions.
This pattern is useful when you want to:
* Implement custom logic between tool calls
* Handle tool execution errors in specific ways
* Add custom logging or monitoring
* Integrate with external systems during the loop
* Have complete control over the conversation history
## [Example](#example)
```
`
import { ModelMessage, streamText, tool } from 'ai';
import 'dotenv/config';
import z from 'zod';
const getWeather = async ({ location }: { location: string }) =\> {
return `The weather in ${location} is ${Math.floor(Math.random() \* 100)} degrees.`;
};
const messages: ModelMessage[] = [
{
role: 'user',
content: 'Get the weather in New York and San Francisco',
},
];
async function main() {
while (true) {
const result = streamText({
model: 'openai/gpt-4o',
messages,
tools: {
getWeather: tool({
description: 'Get the current weather in a given location',
inputSchema: z.object({
location: z.string(),
}),
}),
// add more tools here, omitting the execute function so you handle it yourself
},
});
// Stream the response (only necessary for providing updates to the user)
for await (const chunk of result.fullStream) {
if (chunk.type === 'text-delta') {
process.stdout.write(chunk.text);
}
if (chunk.type === 'tool-call') {
console.log('\\\\nCalling tool:', chunk.toolName);
}
}
// Add LLM generated messages to the message history
const responseMessages = (await result.response).messages;
messages.push(...responseMessages);
const finishReason = await result.finishReason;
if (finishReason === 'tool-calls') {
const toolCalls = await result.toolCalls;
// Handle all tool call execution here
for (const toolCall of toolCalls) {
if (toolCall.toolName === 'getWeather') {
const toolOutput = await getWeather(toolCall.input);
messages.push({
role: 'tool',
content: [
{
toolName: toolCall.toolName,
toolCallId: toolCall.toolCallId,
type: 'tool-result',
output: { type: 'text', value: toolOutput }, // update depending on the tool's output format
},
],
});
}
// Handle other tool calls
}
} else {
// Exit the loop when the model doesn't request to use any more tools
console.log('\\\\n\\\\nFinal message history:');
console.dir(messages, { depth: null });
break;
}
}
}
main().catch(console.error);
`
```
## [Key Concepts](#key-concepts)
### [Message Management](#message-management)
The example maintains a `messages` array that tracks the entire conversation history. After each model response, the generated messages are added to this history:
```
`
const responseMessages = (await result.response).messages;
messages.push(...responseMessages);
`
```
### [Tool Execution Control](#tool-execution-control)
Tool execution is handled manually in the loop. When the model requests tool calls, you process each one individually:
```
`
if (finishReason === 'tool-calls') {
const toolCalls = await result.toolCalls;
for (const toolCall of toolCalls) {
if (toolCall.toolName === 'getWeather') {
const toolOutput = await getWeather(toolCall.input);
// Add tool result to message history
messages.push({
role: 'tool',
content: [
{
toolName: toolCall.toolName,
toolCallId: toolCall.toolCallId,
type: 'tool-result',
output: { type: 'text', value: toolOutput },
},
],
});
}
}
}
`
```
### [Loop Termination](#loop-termination)
The loop continues until the model stops requesting tool calls. You can customize this logic to implement your own termination conditions:
```
`
if (finishReason === 'tool-calls') {
// Continue the loop
} else {
// Exit the loop
break;
}
`
```
## [Extending This Example](#extending-this-example)
### [Custom Loop Control](#custom-loop-control)
Implement maximum iterations or time limits:
```
`
let iterations = 0;
const MAX\_ITERATIONS = 10;
while (iterations \< MAX\_ITERATIONS) {
iterations++;
// ... rest of the loop
}
`
```
### [Parallel Tool Execution](#parallel-tool-execution)
Execute multiple tools in parallel for better performance:
```
`
const toolPromises = toolCalls.map(async toolCall =\> {
if (toolCall.toolName === 'getWeather') {
const toolOutput = await getWeather(toolCall.input);
return {
role: 'tool' as const,
content: [
{
toolName: toolCall.toolName,
toolCallId: toolCall.toolCallId,
type: 'tool-result' as const,
output: { type: 'text' as const, value: toolOutput },
},
],
};
}
// Handle other tools
});
const toolResults = await Promise.all(toolPromises);
messages.push(...toolResults.filter(Boolean));
`
```
This manual approach gives you complete control over the agentic loop while still leveraging the AI SDK's powerful streaming and tool calling capabilities.
On this page
[Manual Agent Loop](#manual-agent-loop)
[Example](#example)
[Key Concepts](#key-concepts)
[Message Management](#message-management)
[Tool Execution Control](#tool-execution-control)
[Loop Termination](#loop-termination)
[Extending This Example](#extending-this-example)
[Custom Loop Control](#custom-loop-control)
[Parallel Tool Execution](#parallel-tool-execution)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)