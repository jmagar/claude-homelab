Building with Realtime Mini
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ Home ](/cookbook)
### Topics
* [ Agents ](/cookbook/topic/agents)
* [ Evals ](/cookbook/topic/evals)
* [ Multimodal ](/cookbook/topic/multimodal)
* [ Text ](/cookbook/topic/text)
* [ Guardrails ](/cookbook/topic/guardrails)
* [ Optimization ](/cookbook/topic/optimization)
* [ ChatGPT ](/cookbook/topic/chatgpt)
* [ Codex ](/cookbook/topic/codex)
* [ gpt-oss ](/cookbook/topic/gpt-oss)
### Contribute
* [ Cookbook on GitHub ](https://github.com/openai/openai-cookbook)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Copy Page
Oct 11, 2025
# Building with Realtime Mini
[ CM ](https://www.linkedin.com/in/carter-mcclellan/)
[ Carter Mcclellan
(OpenAI)
](https://www.linkedin.com/in/carter-mcclellan/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/building_w_rt_mini/building_w_rt_mini.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/building_w_rt_mini/building_w_rt_mini.ipynb)
Growing up, I was fascinated by the idea of Jarvis—an intelligent assistant that could autonomously handle complex workflows. What I didn’t realize back then was that I was imagining the future of voice agents. OpenAI was the first to make this vision real with the launch of `4o-audio`, and more recently made it even more accessible—cutting costs by 70%—with the release of [GPT Realtime Mini](https://platform.openai.com/docs/models/gpt-realtime-mini), which offers lower latency and major improvements in tool calling.
Building with speech models, however, is fundamentally different from working with text-only interfaces. In addition to prompt engineering, audio models bring new challenges: they’re more latency-sensitive, require managing a WebRTC session, and introduce additional variability through voice activity detection (VAD).
To make this process easier, OpenAI has released the Agents SDK in both Python and TypeScript, along with detailed examples that showcase our recommended design patterns for building reliable voice agents.
Before diving into code, let’s map out exactly what we’ll be building—and how it fits into the broader agent handoff architecture.
## System Architecture
For our application today we are going to be building an extremely simple customer support app using the **“handoff architecture”**. **“Handoff Architecture”** means a **primary agent** acts as the orchestrator for all incoming customer queries. Rather than handling every request directly, the primary agent analyzes the intent behind the user’s message and **categorizes it into one of 2 core pathways**:
1. General questions and basic support (no authenticator required).
2. Specific questions (user authentication required before lookup is performed).
Based on this categorization, the primary agent **hands off the conversation** to the appropriate specialist agent designed for that specific task.
## Setup
Instead of starting from scratch we’re going to be working from the [openai-agents-js](https://github.com/openai/openai-agents-js/tree/main) repo, so lets start by cloning, installing the necessary dependencies, and building the web demo
```
`git clone https://github.com/openai/openai-agents-js/tree/main`
```
After cloning follow along with the steps in the readme to get started
```
`npm install @openai/agents zod@3
pnpm examples:realtime-next`
```
If everything works as expected you should see a simple chat interface
## Main Agent
Great! Now that we’ve cloned the repo, we are going to be modifying `openai-agents-js/examples/realtime-next/src/app/page.tsx`, starting with the **Main Agent**. Our **Main Agent** is the point of entry for the application stack. It acts as an intent classifier for any user query choosing how to re-route between different layers.
The implementation is fairly straightforward
```
`const mainAgent = new RealtimeAgent({
name: 'Main Agent',
instructions:
'You are the entry point for all customer queries. Default to the no-auth QA flow. If authentication is needed and validated, escalate to the Auth Layer by handing off to either the Flight Status Checker or Rebooking Agent. Do not answer policy questions from your own knowledge; rely on subordinate agents and tools.',
tools: [
checkFlightsTool,
],
handoffs: [qaAgent],
});`
```
## QA Agent
Now that we’ve built the main agent, the next step is to add a specialized supporting agent to handle a specific class of customer queries. For general airline policy questions, this will be the QA Agent.
In a real-world product, this agent would power a more sophisticated experience: it would ingest company-specific PDFs and other reference materials, embed them, and dynamically query those documents at runtime to provide accurate, policy-grounded answers.
```
`┌────────────┐ ┌────────────┐ ┌────────────────────────┐ ┌────────────┐
│ User Query │ ───► │ QA Agent │ ───► │ Vector DB / Retriever │ ───► │ LLM Answer │
└────────────┘ └────────────┘ └────────────────────────┘ └────────────┘
│ │
│ build search │ top-k context
▼ ▼
(semantic search) (grounded generation)
`
```
This would typically involve building a full vector database service that embeds the customer’s query and retrieves the most relevant results. For the sake of simplicity in this demo, we’ll mock that part of the pipeline.
If you’re interested in learning how to implement a fully featured retrieval system, take a look at our other cookbooks on the topic [here](https://cookbook.openai.com/examples/vector_databases/pinecone/readme).
```
`const documentLookupTool = tool({
name: 'document\_lookup\_tool',
description: 'Looks up answers from known airline documentation to handle general questions without authentication.',
parameters: z.object({
request: z.string(),
}),
execute: async ({ request }) =\> {
const mockDocument = `\*\*Airline Customer Support — Quick Reference\*\*
1. Each passenger may bring 1 carry-on (22 x 14 x 9) and 1 personal item.
2. Checked bags must be under 50 lbs; overweight fees apply.
3. Online check-in opens 24 hours before departure.
4. Seat upgrades can be requested up to 1 hour before boarding.
5. Wi‑Fi is complimentary on all flights over 2 hours.
6. Customers can change flights once for free within 24 hours of booking.
7. Exit rows offer extra legroom and require passengers to meet safety criteria.
8. Refunds can be requested for canceled or delayed flights exceeding 3 hours.
9. Pets are allowed in the cabin if under 20 lbs and in an approved carrier.
10. For additional help, contact our support team via chat or call center.`;
return mockDocument;
},
});`
```
Like before when we defined the Main Agent we are going to create another instance of `RealtimeAgent` but this time we are going to supply a `documentLookupTool`.
```
`const qaAgent = new RealtimeAgent({
name: 'QA Agent',
instructions:
'You handle general customer questions using the document lookup tool. Use only the document lookup for answers. If the request may involve personal data or operations (rebooking, flight status), call the auth check tool. If auth is required and validated, handoff to the appropriate Auth Layer agent.',
tools: [documentLookupTool],
});`
```
## Flight Status Agent
We’ve already built a powerful foundation: a main agent that can handle inbound customer queries, and a QA agent that searches our document store to provide accurate, policy-based answers.
What’s missing is a layer for customer-specific information—for example, queries like “What’s the status of my flight?” or “Which terminal should I go to?”. To support these kinds of personalized interactions, we need to embed an authentication layer into the workflow so the system can securely access and respond with user-specific data.
```
`┌────────────┐ ┌──────────────┐ ┌───────────────────────┐ ┌───────────────────────┐
│ User Query │ ───► │ Auth Layer │ ───► │ Customer Data Access │ ───► │ LLM Answer (Personal) │
└────────────┘ └──────────────┘ └───────────────────────┘ └───────────────────────┘
│ │
│ verify identity │ query flight / account
▼ ▼
(token, SSO, OTP, etc.) (e.g., flight status, profile info)`
```
Fortunately, the Agents SDK is designed to support this kind of use case. For customer support scenarios that involve sensitive, account-level information, we can ensure proper access control by using the `needsApproval` parameter within `tool`, which requires the user to authenticate before any protected data is accessed.
```
`const checkFlightsTool = tool({
name: 'checkFlightsTool',
description: 'Call this tool if the user queries about their current flight status',
parameters: z.object({}),
// Require approval so the UI can collect creds before executing.
needsApproval: true,
execute: async () =\> {
if (!credState.username || !credState.password) {
return 'Authentication missing.';
}
return `${credState.username} you are currently booked on the 8am flight from SFO to JFK`;
},
});`
```
When a tool is registered with `needsApproval`, it automatically emits a `tool\_approval\_requested` event during the session. This allows us to add logic inside the `RealtimeAgent` instantiation block of our web application to listen for these events and update the UI accordingly—for example, by prompting the user to approve or authenticate before continuing.
```
` const [credUsername, setCredUsername] = useState('');
const [credPassword, setCredPassword] = useState('');
const [pendingApproval, setPendingApproval] = useState\<any | null\>(null);
useEffect(() =\> {
session.current = new RealtimeSession(mainAgent, {
// other configs go here!
});
// various other event based logic goes here!
session.current.on(
'tool\_approval\_requested',
(\_context, \_agent, approvalRequest) =\> {
setPendingApproval(approvalRequest.approvalItem); // \<- Alterations to react state!
setCredUsername('');
setCredPassword('');
setCredOpen(true);
},
);
}, []);
// ....
return (
{credOpen && (
\<div className="fixed inset-0 z-50"\>
// ... remainder of component logic
\</div\>
)}
)`
```
## Final Code Snippet
And with that, we’re done! You’ve now built the core components of a customer support application:
* A generalist agent capable of handling a wide range of customer support queries
* An authentication workflow that verifies user identity and retrieves customer-specific information
With everything in place, the final version of `realtime-next/src/app/page.tsx` should look like this.
```
`'use client';
import {
RealtimeAgent,
RealtimeSession,
tool,
TransportEvent,
RealtimeOutputGuardrail,
OutputGuardrailTripwireTriggered,
RealtimeItem,
} from '@openai/agents/realtime';
import { useEffect, useRef, useState } from 'react';
import { z } from 'zod';
import { getToken } from './server/token.action';
import { App } from '@/components/App';
import { CameraCapture } from '@/components/CameraCapture';
// Demo-only credential store the tool can read at execution time
const credState: { username?: string; password?: string } = {};
// ---------------------------------------------
// Tools.
const documentLookupTool = tool({
name: 'document\_lookup\_tool',
description: 'Looks up answers from known airline documentation to handle general questions without authentication.',
parameters: z.object({
request: z.string(),
}),
execute: async ({ request }) =\> {
const mockDocument = `\*\*Airline Customer Support — Quick Reference\*\*
1. Each passenger may bring 1 carry-on (22 x 14 x 9) and 1 personal item.
2. Checked bags must be under 50 lbs; overweight fees apply.
3. Online check-in opens 24 hours before departure.
4. Seat upgrades can be requested up to 1 hour before boarding.
5. Wi‑Fi is complimentary on all flights over 2 hours.
6. Customers can change flights once for free within 24 hours of booking.
7. Exit rows offer extra legroom and require passengers to meet safety criteria.
8. Refunds can be requested for canceled or delayed flights exceeding 3 hours.
9. Pets are allowed in the cabin if under 20 lbs and in an approved carrier.
10. For additional help, contact our support team via chat or call center.`;
return mockDocument;
},
});
const checkFlightsTool = tool({
name: 'checkFlightsTool',
description: 'Call this tool if the user queries about their current flight status',
parameters: z.object({}),
// Require approval so the UI can collect creds before executing.
needsApproval: true,
execute: async () =\> {
if (!credState.username || !credState.password) {
return 'Authentication missing.';
}
return `${credState.username} you are currently booked on the 8am flight from SFO to JFK`;
},
});
// ---------------------------------------------
// Agents for each layer.
// 2. No-Auth Layer: QA Agent with doc lookup and auth check tool.
const qaAgent = new RealtimeAgent({
name: 'QA Agent',
instructions:
'You handle general customer questions using the document lookup tool. Use only the document lookup for answers. If the request may involve personal data or operations (rebooking, flight status), call the auth check tool. If auth is required and validated, handoff to the appropriate Auth Layer agent.',
tools: [documentLookupTool],
});
// 1. Main Agent: entry point and routing.
const mainAgent = new RealtimeAgent({
name: 'Main Agent',
instructions:
'You are the entry point for all customer queries. Default to the no-auth QA flow. If authentication is needed and validated, escalate to the Auth Layer by handing off to either the Flight Status Checker or Rebooking Agent. Do not answer policy questions from your own knowledge; rely on subordinate agents and tools.',
tools: [
checkFlightsTool,
],
handoffs: [qaAgent],
});
// Cross-handoffs so agents can return or escalate.
qaAgent.handoffs = [mainAgent];
export default function Home() {
const session = useRef\<RealtimeSession\<any\> | null\>(null);
const [isConnected, setIsConnected] = useState(false);
const [isMuted, setIsMuted] = useState(false);
const [outputGuardrailResult, setOutputGuardrailResult] =
useState\<OutputGuardrailTripwireTriggered\<any\> | null\>(null);
const [events, setEvents] = useState\<TransportEvent[]\>([]);
const [history, setHistory] = useState\<RealtimeItem[]\>([]);
const [mcpTools, setMcpTools] = useState\<string[]\>([]);
const [credOpen, setCredOpen] = useState(false);
const [credUsername, setCredUsername] = useState('');
const [credPassword, setCredPassword] = useState('');
const [pendingApproval, setPendingApproval] = useState\<any | null\>(null);
useEffect(() =\> {
session.current = new RealtimeSession(mainAgent, {
model: 'gpt-realtime-mini',
outputGuardrailSettings: {
debounceTextLength: 200,
},
config: {
audio: {
output: {
voice: 'cedar',
},
},
},
});
session.current.on('transport\_event', (event) =\> {
setEvents((events) =\> [...events, event]);
});
session.current.on('mcp\_tools\_changed', (tools) =\> {
setMcpTools(tools.map((t) =\> t.name));
});
session.current.on(
'guardrail\_tripped',
(\_context, \_agent, guardrailError) =\> {
setOutputGuardrailResult(guardrailError);
},
);
session.current.on('history\_updated', (history) =\> {
setHistory(history);
});
session.current.on(
'tool\_approval\_requested',
(\_context, \_agent, approvalRequest) =\> {
setPendingApproval(approvalRequest.approvalItem);
setCredUsername('');
setCredPassword('');
setCredOpen(true);
},
);
}, []);
async function connect() {
if (isConnected) {
await session.current?.close();
setIsConnected(false);
} else {
const token = await getToken();
try {
await session.current?.connect({
apiKey: token,
});
setIsConnected(true);
} catch (error) {
console.error('Error connecting to session', error);
}
}
}
async function toggleMute() {
if (isMuted) {
await session.current?.mute(false);
setIsMuted(false);
} else {
await session.current?.mute(true);
setIsMuted(true);
}
}
function handleCredCancel() {
const approval = pendingApproval;
setCredOpen(false);
setPendingApproval(null);
if (approval) session.current?.reject(approval);
}
function handleCredSubmit(e: React.FormEvent) {
e.preventDefault();
if (!credUsername || !credPassword) return;
// Store creds for the tool to read
credState.username = credUsername;
credState.password = credPassword;
const approval = pendingApproval;
setCredOpen(false);
setPendingApproval(null);
setCredUsername('');
setCredPassword('');
if (approval) session.current?.approve(approval);
}
return (
\<div className="relative"\>
{credOpen && (
\<div className="fixed inset-0 z-50"\>
\<div className="absolute inset-0 bg-black/50" /\>
\<div className="fixed top-0 left-0 right-0 flex justify-center p-4"\>
\<form
onSubmit={handleCredSubmit}
className="w-full max-w-sm rounded-lg bg-white p-4 shadow-xl"
\>
\<div className="mb-2 text-sm font-semibold"\>Authentication Required\</div\>
\<div className="mb-3 text-xs text-gray-600"\>
Enter username and password to continue.
\</div\>
\<input
className="mb-2 w-full rounded border border-gray-300 p-2 text-sm focus:border-gray-500 focus:outline-none"
placeholder="Username"
value={credUsername}
onChange={(e) =\> setCredUsername(e.target.value)}
/\>
\<input
type="password"
className="mb-3 w-full rounded border border-gray-300 p-2 text-sm focus:border-gray-500 focus:outline-none"
placeholder="Password"
value={credPassword}
onChange={(e) =\> setCredPassword(e.target.value)}
/\>
\<div className="flex justify-end gap-2"\>
\<button
type="button"
className="rounded bg-gray-100 px-3 py-1.5 text-sm hover:bg-gray-200"
onClick={handleCredCancel}
\>
Cancel
\</button\>
\<button
type="submit"
className="rounded bg-black px-3 py-1.5 text-sm text-white hover:bg-gray-800 disabled:opacity-50"
disabled={!credUsername || !credPassword}
\>
Continue
\</button\>
\</div\>
\</form\>
\</div\>
\</div\>
)}
\<App
isConnected={isConnected}
isMuted={isMuted}
toggleMute={toggleMute}
connect={connect}
history={history}
outputGuardrailResult={outputGuardrailResult}
events={events}
mcpTools={mcpTools}
/\>
\<div className="fixed bottom-4 right-4 z-50"\>
\<CameraCapture
disabled={!isConnected}
onCapture={(dataUrl) =\> {
if (!session.current) return;
session.current.addImage(dataUrl, { triggerResponse: false });
}}
/\>
\</div\>
\</div\>
);
}`
```