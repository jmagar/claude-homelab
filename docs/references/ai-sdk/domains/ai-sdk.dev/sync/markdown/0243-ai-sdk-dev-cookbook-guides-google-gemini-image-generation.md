Guides: Google Gemini Image Generation
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
# [Generate and Edit Images with Google Gemini 2.5 Flash](#generate-and-edit-images-with-google-gemini-25-flash)
This guide will show you how to generate and edit images with the AI SDK and Google's latest multimodal language model Gemini 2.5 Flash Image.
## [Generating Images](#generating-images)
As Gemini 2.5 Flash Image is a language model with multimodal capabilities, you can use the `generateText` or `streamText` functions (not `generateImage`) to create images. The model determines which modality to respond in based on your prompt and configuration. Here's how to create your first image:
```
`
import { generateText } from 'ai';
import fs from 'node:fs';
import 'dotenv/config';
async function generateImage() {
const result = await generateText({
model: 'google/gemini-2.5-flash-image',
prompt:
'Create a picture of a nano banana dish in a fancy restaurant with a Gemini theme',
});
// Save generated images
for (const file of result.files) {
if (file.mediaType.startsWith('image/')) {
const timestamp = Date.now();
const fileName = `generated-${timestamp}.png`;
fs.mkdirSync('output', { recursive: true });
await fs.promises.writeFile(`output/${fileName}`, file.uint8Array);
console.log(`Generated and saved image: output/${fileName}`);
}
}
}
generateImage().catch(console.error);
`
```
Here are some key points to remember:
* Generated images are returned in the `result.files` array
* Images are returned as `Uint8Array` data
* The model leverages Gemini's world knowledge, so detailed prompts yield better results
## [Editing Images](#editing-images)
Gemini 2.5 Flash Image excels at editing existing images with natural language instructions. You can add elements, modify styles, or transform images while maintaining their core characteristics:
```
`
import { generateText } from 'ai';
import fs from 'node:fs';
import 'dotenv/config';
async function editImage() {
const editResult = await generateText({
model: 'google/gemini-2.5-flash-image',
prompt: [
{
role: 'user',
content: [
{
type: 'text',
text: 'Add a small wizard hat to this cat. Keep everything else the same.',
},
{
type: 'image',
// image: DataContent (string | Uint8Array | ArrayBuffer | Buffer) or URL
image: new URL(
'https://raw.githubusercontent.com/vercel/ai/refs/heads/main/examples/ai-functions/data/comic-cat.png',
),
mediaType: 'image/jpeg',
},
],
},
],
});
// Save the edited image
const timestamp = Date.now();
fs.mkdirSync('output', { recursive: true });
for (const file of editResult.files) {
if (file.mediaType.startsWith('image/')) {
await fs.promises.writeFile(
`output/edited-${timestamp}.png`,
file.uint8Array,
);
console.log(`Saved edited image: output/edited-${timestamp}.png`);
}
}
}
editImage().catch(console.error);
`
```
## [What's Next?](#whats-next)
You've learned how to generate new images from text prompts and edit existing images using natural language instructions with Google's Gemini 2.5 Flash Image model.
For more advanced techniques, integration patterns, and practical examples, check out our [Cookbook](/cookbook) where you'll find comprehensive guides for building sophisticated AI-powered applications.
On this page
[Generate and Edit Images with Google Gemini 2.5 Flash](#generate-and-edit-images-with-google-gemini-25-flash)
[Generating Images](#generating-images)
[Editing Images](#editing-images)
[What's Next?](#whats-next)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)