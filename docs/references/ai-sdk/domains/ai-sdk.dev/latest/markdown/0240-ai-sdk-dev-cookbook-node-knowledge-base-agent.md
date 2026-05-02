Node: Knowledge Base Agent
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
In this recipe, you'll learn how to build an AI agent that can interact with a knowledge base using [Upstash Search](https://upstash.com/docs/search). The agent will be able to both retrieve information from the knowledge base and add new resources to it, leveraging AI SDK tools.
Upstash Search offers input enrichment, reranking, semantic search, and full-text search for highly accurate results. It also provides a built-in embedding service, eliminating the need for a separate embedding provider. This makes it convenient for building and managing simple knowledge bases.
This example uses [the following essay](https://raw.githubusercontent.com/run-llama/llama_index/main/docs/docs/examples/data/paul_graham/paul_graham_essay.txt) as input data (`essay.txt`).
For a more in-depth guide, check out the [RAG Agent Guide](/cookbook/guides/rag-chatbot), which shows you how to build a RAG Agent with [Next.js](https://nextjs.org), [Drizzle ORM](https://orm.drizzle.team/), and [Postgres](https://postgresql.org).
## [Getting Started](#getting-started)
Create an Upstash Search database on [Upstash Console](https://console.upstash.com/search). Once created, you will get a REST URL and a token. Set these in your environment variables:
```
`
UPSTASH\_SEARCH\_REST\_URL="\*\*\*"
UPSTASH\_SEARCH\_REST\_TOKEN="\*\*\*"
`
```
## [Project Setup](#project-setup)
Create a new empty directory for your project and initialize pnpm:
```
`
mkdir knowledge-base-agent
cd knowledge-base-agent
pnpm init
`
```
Install the AI SDK, OpenAI provider, Upstash Search packages, and tsx as a dev dependency:
```
`
pnpm i ai zod @ai-sdk/openai @upstash/search
pnpm i -D tsx
`
```
Finally, download and save the input essay:
```
`
curl -o essay.txt https://raw.githubusercontent.com/run-llama/llama\_index/main/docs/docs/examples/data/paul\_graham/paul\_graham\_essay.txt
`
```
## [Setting Up the Knowledge Base](#setting-up-the-knowledge-base)
Next, let's set up the initial knowledge base by reading a file and uploading its content to Upstash Search. Create a script called `setup.ts`:
setup.ts
```
`
import fs from 'fs';
import path from 'path';
import 'dotenv/config';
import { Search } from '@upstash/search';
type KnowledgeContent = {
text: string;
section: string;
title?: string;
};
// Initialize Upstash Search client
const search = new Search({
url: process.env.UPSTASH\_SEARCH\_REST\_URL!,
token: process.env.UPSTASH\_SEARCH\_REST\_TOKEN!,
});
const index = search.index\<KnowledgeContent\>('knowledge-base');
async function setupKnowledgeBase() {
// Read and process the source file
const content = fs.readFileSync(path.join(\_\_dirname, 'essay.txt'), 'utf8');
// Split content into meaningful chunks
const chunks = content
.split(/\\n\\s\*\\n/) // Split by double line breaks (paragraphs)
.map(chunk =\> chunk.trim())
.filter(chunk =\> chunk.length \> 50); // Only keep substantial chunks
// Upload chunks to Upstash Search in batches of 100
const batchSize = 100;
for (let i = 0; i \< chunks.length; i += batchSize) {
const batch = chunks.slice(i, i + batchSize).map((chunk, j) =\> ({
id: `chunk-${i + j}`,
content: {
text: chunk,
section: `section-${Math.floor((i + j) / 10)}`,
title: chunk.split('\\n')[0] || `Chunk ${i + j + 1}`,
},
}));
await index.upsert(batch);
console.log(
`Upserted ${Math.min(i + batch.length, chunks.length)} chunks out of ${chunks.length} chunks`,
);
}
}
// Run setup
setupKnowledgeBase().catch(console.error);
`
```
Run the setup script to populate your knowledge base:
```
`
pnpm tsx setup.ts
`
```
Navigate to the Upstash Console and check the data browser of your Search database. You should see the essay has been indexed.
## [Building the Knowledge Base Agent](#building-the-knowledge-base-agent)
Now let's create an agent that can interact with this knowledge base. Create a new file called `agent.ts`:
agent.ts
```
`
import { tool, stepCountIs, generateText, generateId } from 'ai';
import { z } from 'zod';
import { Search } from '@upstash/search';
import 'dotenv/config';
const search = new Search({
url: process.env.UPSTASH\_SEARCH\_REST\_URL!,
token: process.env.UPSTASH\_SEARCH\_REST\_TOKEN!,
});
type KnowledgeContent = {
text: string;
section: string;
title?: string;
};
const index = search.index\<KnowledgeContent\>('knowledge-base');
async function main(prompt: string) {
const { text } = await generateText({
model: 'openai/gpt-4o',
prompt,
stopWhen: stepCountIs(5),
tools: {
addResource: tool({
description:
'Add a new resource or piece of information to the knowledge base',
inputSchema: z.object({
resource: z
.string()
.describe('The content or resource to add to the knowledge base'),
title: z
.string()
.optional()
.describe('Optional title for the resource'),
}),
execute: async ({ resource, title }) =\> {
const id = generateId();
await index.upsert({
id,
content: {
text: resource,
section: 'user-added',
title: title || `Resource ${id.slice(0, 8)}`,
},
});
return `Successfully added resource "${title || 'Untitled'}" to knowledge base with ID: ${id}`;
},
}),
searchKnowledge: tool({
description:
'Search the knowledge base to find relevant information for answering questions',
inputSchema: z.object({
query: z
.string()
.describe('The search query to find relevant information'),
limit: z
.number()
.optional()
.describe('Maximum number of results to return (default: 3)'),
}),
execute: async ({ query, limit = 3 }) =\> {
const results = await index.search({
query,
limit,
reranking: true,
});
if (results.length === 0) {
return 'No relevant information found in the knowledge base.';
}
return results.map((hit, i) =\> ({
resourceId: hit.id,
rank: i + 1,
title: hit.content.title || 'Untitled',
content: hit.content.text || '',
section: hit.content.section || 'unknown',
score: hit.score,
}));
},
}),
deleteResource: tool({
description: 'Delete a resource from the knowledge base',
inputSchema: z.object({
resourceId: z.string().describe('The ID of the resource to delete'),
}),
execute: async ({ resourceId }) =\> {
try {
await index.delete({ ids: [resourceId] });
return `Successfully deleted resource with ID: ${resourceId}`;
} catch (error) {
return `Failed to delete resource: ${error instanceof Error ? error.message : 'Unknown error'}`;
}
},
}),
},
// log out intermediate steps
onStepFinish: ({ toolResults }) =\> {
if (toolResults.length \> 0) {
console.log('Tool results:');
console.dir(toolResults, { depth: null });
}
},
});
return text;
}
const question =
'What are the two main things I worked on before college? (utilize knowledge base)';
main(question).then(console.log).catch(console.error);
`
```
## [Running the Agent](#running-the-agent)
Now let's run the agent:
```
`
pnpm tsx agent.ts
`
```
The agent will utilize the knowledge base to answer questions, add new resources, and delete existing ones as needed. You can modify the `question` variable to test different queries and interactions with the knowledge base.
On this page
[Getting Started](#getting-started)
[Project Setup](#project-setup)
[Setting Up the Knowledge Base](#setting-up-the-knowledge-base)
[Building the Knowledge Base Agent](#building-the-knowledge-base-agent)
[Running the Agent](#running-the-agent)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)