Next.js: Generate Object with File Prompt through Form Submission
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
# [Generate Object with File Prompt through Form Submission](#generate-object-with-file-prompt-through-form-submission)
This feature is limited to models/providers that support PDF inputs
([Anthropic](/providers/ai-sdk-providers/anthropic#pdf-support),
[OpenAI](/providers/ai-sdk-providers/openai#pdf-support), [Google
Gemini](/providers/ai-sdk-providers/google-generative-ai#file-inputs), and
[Google Vertex](/providers/ai-sdk-providers/google-vertex#file-inputs)).
With select models, you can send PDFs (files) as part of your prompt. Let's create a simple Next.js application that allows a user to upload a PDF send it to an LLM for summarization.
## [Client](#client)
On the frontend, create a form that allows the user to upload a PDF. When the form is submitted, send the PDF to the `/api/analyze` route.
```
`
'use client';
import { useState } from 'react';
export default function Page() {
const [description, setDescription] = useState\<string\>();
const [loading, setLoading] = useState(false);
return (
\<div\>
\<form
action={async formData =\> {
try {
setLoading(true);
const response = await fetch('/api/analyze', {
method: 'POST',
body: formData,
});
setLoading(false);
if (response.ok) {
setDescription(await response.text());
}
} catch (error) {
console.error('Analysis failed:', error);
}
}}
\>
\<div\>
\<label\>Upload Image\</label\>
\<input name="pdf" type="file" accept="application/pdf" /\>
\</div\>
\<button type="submit" disabled={loading}\>
Submit{loading && 'ing...'}
\</button\>
\</form\>
{description && (
\<pre\>{JSON.stringify(JSON.parse(description), null, 2)}\</pre\>
)}
\</div\>
);
}
`
```
## [Server](#server)
On the server, create an API route that receives the PDF, sends it to the LLM, and returns the result. This example uses the [ `generateText` ](/docs/reference/ai-sdk-core/generate-text) function with `Output.object` to generate the summary as part of a structured output.
```
`
import { generateText, Output } from 'ai';
import { z } from 'zod';
export async function POST(request: Request) {
const formData = await request.formData();
const file = formData.get('pdf') as File;
const arrayBuffer = await file.arrayBuffer();
const uint8Array = new Uint8Array(arrayBuffer);
const charArray = Array.from(uint8Array, byte =\> String.fromCharCode(byte));
const binaryString = charArray.join('');
const base64Data = btoa(binaryString);
const fileDataUrl = `data:application/pdf;base64,${base64Data}`;
const result = await generateText({
model: 'openai/gpt-4o',
messages: [
{
role: 'user',
content: [
{
type: 'text',
text: 'Analyze the following PDF and generate a summary.',
},
{
type: 'file',
data: fileDataUrl,
mediaType: 'application/pdf',
},
],
},
],
output: Output.object({
schema: z.object({
people: z
.object({
name: z.string().describe('The name of the person.'),
age: z.number().min(0).describe('The age of the person.'),
})
.array()
.describe('An array of people.'),
}),
}),
});
return Response.json(result.output);
}
`
```
On this page
[Generate Object with File Prompt through Form Submission](#generate-object-with-file-prompt-through-form-submission)
[Client](#client)
[Server](#server)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)