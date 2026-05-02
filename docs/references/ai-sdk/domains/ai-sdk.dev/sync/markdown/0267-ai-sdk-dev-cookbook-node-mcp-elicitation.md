Node: Model Context Protocol (MCP) Elicitation
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
# [MCP Elicitation](#mcp-elicitation)
Elicitation is a mechanism where MCP servers can request additional information from the client during tool execution. This example demonstrates how to handle elicitation requests, such as collecting user registration information.
## [Example: User Registration](#example-user-registration)
This example shows how to set up an MCP client to handle elicitation requests from a server that needs to collect user input.
```
`
import { createMCPClient, ElicitationRequestSchema } from '@ai-sdk/mcp';
import { generateText } from 'ai';
// Create the MCP client with elicitation capability enabled
const mcpClient = await createMCPClient({
transport: {
type: 'sse',
url: 'http://localhost:8083/sse',
},
capabilities: {
elicitation: {},
},
});
// Register a handler for elicitation requests
mcpClient.onElicitationRequest(ElicitationRequestSchema, async request =\> {
console.log('Server is requesting:', request.params.message);
console.log('Expected schema:', request.params.requestedSchema);
// Collect user input according to the schema
// This is where you would implement your own logic to prompt the user
const userData = await promptUserForInput(request.params.requestedSchema);
// Return the result with one of three actions:
// - 'accept': User provided the requested information
// - 'decline': User chose not to provide the information
// - 'cancel': User cancelled the operation entirely
return {
action: 'accept',
content: userData,
};
});
try {
const tools = await mcpClient.tools();
const { text } = await generateText({
model: 'openai/gpt-4o-mini',
tools,
prompt: 'Register a new user account',
});
console.log('Response:', text);
} finally {
await mcpClient.close();
}
// Example implementation of promptUserForInput
async function promptUserForInput(
schema: unknown,
): Promise\<Record\<string, unknown\>\> {
// Implement your own logic to collect input based on the schema
// This could be:
// - A CLI prompt using readline
// - A web form
// - A GUI dialog
// - Any other input mechanism
// For this example, we'll return mock data
return {
username: 'johndoe',
email: 'john@example.com',
password: 'securepassword123',
newsletter: true,
};
}
`
```
## [Elicitation Response Actions](#elicitation-response-actions)
Your handler must return an object with an `action` field:
* **`'accept'`**: User provided the requested information. Must include `content` with the data.
* **`'decline'`**: User chose not to provide the information.
* **`'cancel'`**: User cancelled the operation entirely.
## [Important Notes](#important-notes)
It is up to the client application to handle elicitation requests properly.
The MCP client simply surfaces these requests from the server to your
application code.
The elicitation handler should:
1. Parse the `request.params.requestedSchema` to understand what data the server needs
2. Implement appropriate user input collection (CLI, web form, etc.)
3. Validate the input matches the requested schema
4. Return the appropriate action and content
On this page
[MCP Elicitation](#mcp-elicitation)
[Example: User Registration](#example-user-registration)
[Elicitation Response Actions](#elicitation-response-actions)
[Important Notes](#important-notes)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)