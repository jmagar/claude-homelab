AI SDK
[](https://vercel.com/oss)
# Universal AI layer for building frameworks and agents
A unified TypeScript SDK for building AI apps with modern streaming, fallbacks, and multi-model support—powered by Vercel
For humansFor agents
$npm install ai
Text GenerationImage GenerationSpeechTranscriptionVideo Generation
Run it with
AI GatewayProviderCustom
```
`
import { generateText } from 'ai';
const { text } = await generateText({
model: "anthropic/claude-sonnet-4.6",
prompt: 'Explain the concept of quantum entanglement.',
});
console.log(text);
`
```
Explain quantum entanglement in simple terms.
Quantum entanglement is when two particles become linked so that measuring one instantly affects the other, no matter the distance between them.
See all [supported LLM models](https://vercel.com/ai-gateway/models)
12.3MWeekly downloads
23.9KGitHub stars
623+Contributors
100+Models supported
### The Framework Agnostic AI Toolkit
The open-source AI toolkit designed to help developers build AI-powered applications and agents with React, Next.js, Vue, Svelte, Node.js, and more.
Multi-provider support. Switch providers with one line of code.
Streaming that just works. Real-time responses without custom parsing.
Built-in fallbacks.
Reliable production behavior by default.
generate-text.ts
Run it with
AI GatewayProviderCustom
```
`
import { generateText } from 'ai';
const { text } = await generateText({
model: "openai/gpt-5.4",
prompt: 'Explain the concept of quantum entanglement.',
});
console.log(text);
`
```
Text GenerationSpeechTranscriptionImage GenerationVideo GenerationTool CallingError HandlingDevTools
AI SDK Core
A unified API for generating text, structured objects, tool calls, and building agents with LLMs.
AI SDK UI
A set of framework-agnostic hooks for quickly building chat and generative user interface.
[Go to playground](/playground)
Supports
+ [16 providers](https://vercel.com/ai-gateway/models)
### Scale with confidence
Plug the AI SDK into an entire ecosystem designed for the way modern AI applications that scale.
[](https://vercel.com/ai-gateway)
Vercel AI Gateway
Access 100+ models with no markup or having to manage multiple API keys.
```
npm i ai
```
[](https://vercel.com/sandbox)
Vercel Sandbox
Run agent generated code securely and at scale.
```
npm i @vercel/sandbox
```
[](https://vercel.com/workflow)
Workflows NEW
Build long running AI agents and apps that can suspend, resume, and survive function timeouts.
```
npm i workflow
```
[](https://elements.ai-sdk.dev/)
AI Elements
A UI component library and custom registry built to build AI-native applications faster.
```
npx ai-elements
```
We built a full AI agent with 40+ tools, resumable streams, and multi-step reasoning on AI SDK. Every hard problem we'd solved with duct tape before, streaming, tool call repair, message management, tool based UI, they already had a clean API for. It feels like their team hit every wall we did, just before us.
Adir DuchanSenior AI Engineer
OpenCode uses AI SDK.
Dax RaadCEO & Founder
### Build with our today
Get started with the AI SDK by using our cookbooks or templates.
[Visit Documentation](/docs)
```
npm i ai
```
Chatbot Starter Template
Learn how to build a full-featured AI chatbot with persistence, multi-modal chat, and more.
```
Copy install prompt
```
Build a Slackbot Agent
Learn how to build a Slackbot that responds to direct messages and mentions in channels.
```
Copy install prompt
```
Build a SQL Agent
Learn how to build an app that interacts with a PostgreSQL database using natural language.
```
Copy install prompt
```