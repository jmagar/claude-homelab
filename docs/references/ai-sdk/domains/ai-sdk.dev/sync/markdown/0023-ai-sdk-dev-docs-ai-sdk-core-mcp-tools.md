AI SDK Core: Model Context Protocol (MCP)
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
[Reference](/docs/reference)
[AI SDK Core](/docs/reference/ai-sdk-core)
[AI SDK UI](/docs/reference/ai-sdk-ui)
[AI SDK RSC](/docs/reference/ai-sdk-rsc)
[AI SDK Errors](/docs/reference/ai-sdk-errors)
[Migration Guides](/docs/migration-guides)
[Troubleshooting](/docs/troubleshooting)
Copy markdown
# [Model Context Protocol (MCP)](#model-context-protocol-mcp)
The AI SDK supports connecting to [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) servers to access their tools, resources, and prompts.
This enables your AI applications to discover and use capabilities across various services through a standardized interface.
If you're using OpenAI's Responses API, you can also use the built-in
`openai.tools.mcp` tool, which provides direct MCP server integration without
needing to convert tools. See the [OpenAI provider
documentation](/providers/ai-sdk-providers/openai#mcp-tool) for details.
## [Initializing an MCP Client](#initializing-an-mcp-client)
We recommend using HTTP transport (like `StreamableHTTPClientTransport`) for production deployments. The stdio transport should only be used for connecting to local servers as it cannot be deployed to production environments.
Create an MCP client using one of the following transport options:
* **HTTP transport (Recommended)**: Either configure HTTP directly via the client using `transport: { type: 'http', ... }`, or use MCP's official TypeScript SDK `StreamableHTTPClientTransport`
* SSE (Server-Sent Events): An alternative HTTP-based transport
* `stdio`: For local development only. Uses standard input/output streams for local MCP servers
### [HTTP Transport (Recommended)](#http-transport-recommended)
For production deployments, we recommend using the HTTP transport. You can configure it directly on the client:
```
`
import { createMCPClient } from '@ai-sdk/mcp';
const mcpClient = await createMCPClient({
transport: {
type: 'http',
url: 'https://your-server.com/mcp',
// optional: configure HTTP headers
headers: { Authorization: 'Bearer my-api-key' },
// optional: provide an OAuth client provider for automatic authorization
authProvider: myOAuthClientProvider,
// optional: reject redirect responses to prevent SSRF
redirect: 'error',
},
});
`
```
Alternatively, you can use `StreamableHTTPClientTransport` from MCP's official TypeScript SDK:
```
`
import { createMCPClient } from '@ai-sdk/mcp';
import { StreamableHTTPClientTransport } from '@modelcontextprotocol/sdk/client/streamableHttp.js';
const url = new URL('https://your-server.com/mcp');
const mcpClient = await createMCPClient({
transport: new StreamableHTTPClientTransport(url, {
sessionId: 'session\_123',
}),
});
`
```
### [SSE Transport](#sse-transport)
SSE provides an alternative HTTP-based transport option. Configure it with a `type` and `url` property. You can also provide an `authProvider` for OAuth:
```
`
import { createMCPClient } from '@ai-sdk/mcp';
const mcpClient = await createMCPClient({
transport: {
type: 'sse',
url: 'https://my-server.com/sse',
// optional: configure HTTP headers
headers: { Authorization: 'Bearer my-api-key' },
// optional: provide an OAuth client provider for automatic authorization
authProvider: myOAuthClientProvider,
// optional: reject redirect responses to prevent SSRF
redirect: 'error',
},
});
`
```
### [Stdio Transport (Local Servers)](#stdio-transport-local-servers)
The stdio transport should only be used for local servers.
The Stdio transport can be imported from either the MCP SDK or the AI SDK:
```
`
import { createMCPClient } from '@ai-sdk/mcp';
import { StdioClientTransport } from '@modelcontextprotocol/sdk/client/stdio.js';
// Or use the AI SDK's stdio transport:
// import { Experimental\_StdioMCPTransport as StdioClientTransport } from '@ai-sdk/mcp/mcp-stdio';
const mcpClient = await createMCPClient({
transport: new StdioClientTransport({
command: 'node',
args: ['src/stdio/dist/server.js'],
}),
});
`
```
### [Custom Transport](#custom-transport)
You can also bring your own transport by implementing the `MCPTransport` interface for specific requirements not covered by the standard transports.
The client returned by the `createMCPClient` function is a
lightweight client intended for use in tool conversion. It currently does not
support all features of the full MCP client, such as: session
management, resumable streams, and receiving notifications.
Authorization via OAuth is supported when using the AI SDK MCP HTTP or SSE
transports by providing an `authProvider`.
### [Closing the MCP Client](#closing-the-mcp-client)
After initialization, you should close the MCP client based on your usage pattern:
* For short-lived usage (e.g., single requests), close the client when the response is finished
* For long-running clients (e.g., command line apps), keep the client open but ensure it's closed when the application terminates
When streaming responses, you can close the client when the LLM response has finished. For example, when using `streamText`, you should use the `onFinish` callback:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const mcpClient = await createMCPClient({
// ...
});
const tools = await mcpClient.tools();
const result = await streamText({
model: "anthropic/claude-sonnet-4.5",
tools,
prompt: 'What is the weather in Brooklyn, New York?',
onFinish: async () =\> {
await mcpClient.close();
},
});
`
```
When generating responses without streaming, you can use try/finally or cleanup functions in your framework:
```
`
import { createMCPClient, type MCPClient } from '@ai-sdk/mcp';
let mcpClient: MCPClient | undefined;
try {
mcpClient = await createMCPClient({
// ...
});
} finally {
await mcpClient?.close();
}
`
```
## [Using MCP Tools](#using-mcp-tools)
The client's `tools` method acts as an adapter between MCP tools and AI SDK tools. It supports two approaches for working with tool schemas:
### [Schema Discovery](#schema-discovery)
With schema discovery, all tools offered by the server are automatically listed, and input parameter types are inferred based on the schemas provided by the server:
```
`
const tools = await mcpClient.tools();
`
```
This approach is simpler to implement and automatically stays in sync with server changes. However, you won't have TypeScript type safety during development, and all tools from the server will be loaded
### [Schema Definition](#schema-definition)
For better type safety and control, you can define the tools and their input schemas explicitly in your client code:
```
`
import { z } from 'zod';
const tools = await mcpClient.tools({
schemas: {
'get-data': {
inputSchema: z.object({
query: z.string().describe('The data query'),
format: z.enum(['json', 'text']).optional(),
}),
},
// For tools with zero inputs, you should use an empty object:
'tool-with-no-args': {
inputSchema: z.object({}),
},
},
});
`
```
This approach provides full TypeScript type safety and IDE autocompletion, letting you catch parameter mismatches during development. When you define `schemas`, the client only pulls the explicitly defined tools, keeping your application focused on the tools it needs
### [Typed Tool Outputs](#typed-tool-outputs)
When MCP servers return `structuredContent` (per the [MCP specification](https://modelcontextprotocol.io/specification/2025-06-18/server/tools#structured-content)), you can define an `outputSchema` to get typed tool results:
```
`
import { z } from 'zod';
const tools = await mcpClient.tools({
schemas: {
'get-weather': {
inputSchema: z.object({
location: z.string(),
}),
// Define outputSchema for typed results
outputSchema: z.object({
temperature: z.number(),
conditions: z.string(),
humidity: z.number(),
}),
},
},
});
const result = await tools['get-weather'].execute(
{ location: 'New York' },
{ messages: [], toolCallId: 'weather-1' },
);
console.log(`Temperature: ${result.temperature}°C`);
`
```
When `outputSchema` is provided:
* The client extracts `structuredContent` from the tool result
* The output is validated against your schema at runtime
* You get full TypeScript type safety for the result
If the server doesn't return `structuredContent`, the client falls back to parsing JSON from the text content. If neither is available or validation fails, an error is thrown.
Without `outputSchema`, the tool returns the raw `CallToolResult` object
containing `content` and optional `isError` fields.
## [Using MCP Resources](#using-mcp-resources)
According to the [MCP specification](https://modelcontextprotocol.io/docs/learn/server-concepts#resources), resources are **application-driven** data sources that provide context to the model. Unlike tools (which are model-controlled), your application decides when to fetch and pass resources as context.
The MCP client provides three methods for working with resources:
### [Listing Resources](#listing-resources)
List all available resources from the MCP server:
```
`
const resources = await mcpClient.listResources();
`
```
### [Reading Resource Contents](#reading-resource-contents)
Read the contents of a specific resource by its URI:
```
`
const resourceData = await mcpClient.readResource({
uri: 'file:///example/document.txt',
});
`
```
### [Listing Resource Templates](#listing-resource-templates)
Resource templates are dynamic URI patterns that allow flexible queries. List all available templates:
```
`
const templates = await mcpClient.listResourceTemplates();
`
```
## [Using MCP Prompts](#using-mcp-prompts)
MCP Prompts is an experimental feature and may change in the future.
According to the MCP specification, prompts are user-controlled templates that servers expose for clients to list and retrieve with optional arguments.
### [Listing Prompts](#listing-prompts)
```
`
const prompts = await mcpClient.experimental\_listPrompts();
`
```
### [Getting a Prompt](#getting-a-prompt)
Retrieve prompt messages, optionally passing arguments defined by the server:
```
`
const prompt = await mcpClient.experimental\_getPrompt({
name: 'code\_review',
arguments: { code: 'function add(a, b) { return a + b; }' },
});
`
```
## [Handling Elicitation Requests](#handling-elicitation-requests)
Elicitation is a mechanism where MCP servers can request additional information from the client during tool execution. For example, a server might need user input to complete a registration form or confirmation for a sensitive operation.
It is up to the client application to handle elicitation requests properly.
The MCP client simply surfaces these requests from the server to your
application code.
### [Enabling Elicitation Support](#enabling-elicitation-support)
To enable elicitation, you need to advertise the capability when creating the MCP client:
```
`
const mcpClient = await createMCPClient({
transport: {
type: 'sse',
url: 'https://your-server.com/sse',
},
capabilities: {
elicitation: {},
},
});
`
```
### [Registering an Elicitation Handler](#registering-an-elicitation-handler)
Use the `onElicitationRequest` method to register a handler that will be called when the server requests input:
```
`
import { ElicitationRequestSchema } from '@ai-sdk/mcp';
mcpClient.onElicitationRequest(ElicitationRequestSchema, async request =\> {
// request.params.message: A message describing what input is needed
// request.params.requestedSchema: JSON schema defining the expected input structure
// Get input from the user (implement according to your application's needs)
const userInput = await getInputFromUser(
request.params.message,
request.params.requestedSchema,
);
// Return the result with one of three actions:
return {
action: 'accept', // or 'decline' or 'cancel'
content: userInput, // only required when action is 'accept'
};
});
`
```
### [Elicitation Response Actions](#elicitation-response-actions)
Your handler must return an object with an `action` field that can be one of:
* `'accept'`: User provided the requested information. Must include `content` with the data.
* `'decline'`: User chose not to provide the information.
* `'cancel'`: User cancelled the operation entirely.
## [Examples](#examples)
You can see MCP in action in the following examples:
[
Learn to use MCP tools in Node.js
](/cookbook/node/mcp-tools)[
Learn to handle MCP elicitation requests in Node.js
](/cookbook/node/mcp-elicitation)
On this page
[Model Context Protocol (MCP)](#model-context-protocol-mcp)
[Initializing an MCP Client](#initializing-an-mcp-client)
[HTTP Transport (Recommended)](#http-transport-recommended)
[SSE Transport](#sse-transport)
[Stdio Transport (Local Servers)](#stdio-transport-local-servers)
[Custom Transport](#custom-transport)
[Closing the MCP Client](#closing-the-mcp-client)
[Using MCP Tools](#using-mcp-tools)
[Schema Discovery](#schema-discovery)
[Schema Definition](#schema-definition)
[Typed Tool Outputs](#typed-tool-outputs)
[Using MCP Resources](#using-mcp-resources)
[Listing Resources](#listing-resources)
[Reading Resource Contents](#reading-resource-contents)
[Listing Resource Templates](#listing-resource-templates)
[Using MCP Prompts](#using-mcp-prompts)
[Listing Prompts](#listing-prompts)
[Getting a Prompt](#getting-a-prompt)
[Handling Elicitation Requests](#handling-elicitation-requests)
[Enabling Elicitation Support](#enabling-elicitation-support)
[Registering an Elicitation Handler](#registering-an-elicitation-handler)
[Elicitation Response Actions](#elicitation-response-actions)
[Examples](#examples)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)