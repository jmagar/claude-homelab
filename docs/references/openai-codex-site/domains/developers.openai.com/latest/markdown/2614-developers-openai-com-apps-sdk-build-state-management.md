Managing State – Apps SDK | OpenAI Developers
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Apps SDK Commerce
* [ Home ](/apps-sdk)
* [ Quickstart ](/apps-sdk/quickstart)
### Core Concepts
* [ MCP Apps in ChatGPT ](/apps-sdk/mcp-apps-in-chatgpt)
* [ MCP Server ](/apps-sdk/concepts/mcp-server)
* [ UX principles ](/apps-sdk/concepts/ux-principles)
* [ UI guidelines ](/apps-sdk/concepts/ui-guidelines)
### Plan
* [ Research use cases ](/apps-sdk/plan/use-case)
* [ Define tools ](/apps-sdk/plan/tools)
* [ Design components ](/apps-sdk/plan/components)
### Build
* [ Set up your server ](/apps-sdk/build/mcp-server)
* [ Build your ChatGPT UI ](/apps-sdk/build/chatgpt-ui)
* [ Authenticate users ](/apps-sdk/build/auth)
* [ Manage state ](/apps-sdk/build/state-management)
* [ Monetize your app ](/apps-sdk/build/monetization)
* [ Examples ](/apps-sdk/build/examples)
### Deploy
* [ Deploy your app ](/apps-sdk/deploy)
* [ Connect from ChatGPT ](/apps-sdk/deploy/connect-chatgpt)
* [ Test your integration ](/apps-sdk/deploy/testing)
* [ Submit your app ](/apps-sdk/deploy/submission)
### Conversion apps
* [ Restaurant reservation spec ](/apps-sdk/guides/restaurant-reservation-conversion-spec)
* [ Product checkout spec ](/apps-sdk/guides/product-checkout-conversion-spec)
### Guides
* [ Optimize Metadata ](/apps-sdk/guides/optimize-metadata)
* [ Security & Privacy ](/apps-sdk/guides/security-privacy)
* [ Troubleshooting ](/apps-sdk/deploy/troubleshooting)
### Resources
* [ Changelog ](/apps-sdk/changelog)
* [ App submission guidelines ](/apps-sdk/app-submission-guidelines)
* [ Reference ](/apps-sdk/reference)
[API Dashboard](https://platform.openai.com/login)
Copy Page
## Managing State in ChatGPT Apps
This guide explains how to manage state for custom UI components rendered inside
ChatGPT when building an app using the Apps SDK and an MCP server. You’ll learn
how to decide where each piece of state belongs and how to persist it across
renders and conversations.
These patterns keep your UI host-agnostic, which is what enables the MCP Apps
“build once, run in many places” approach.
## Overview
State in a ChatGPT app falls into three categories:
|State type|Owned by|Lifetime|Examples|
|**Business data (authoritative)**|MCP server or backend service|Long-lived|Tasks, tickets, documents|
|**UI state (ephemeral)**|The widget instance inside ChatGPT|Only for the active widget|Selected row, expanded panel, sort order|
|**Cross-session state (durable)**|Your backend or storage|Cross-session and cross-conversation|Saved filters, view mode, workspace selection|
Place every piece of state where it belongs so the UI stays consistent and the chat matches the expected intent.
## How UI Components Live Inside ChatGPT
When your app returns a custom UI component, ChatGPT renders that component inside a widget that is tied to a specific message in the conversation. The widget persists as long as that message exists in the thread.
**Key behavior:**
* **Widgets are message-scoped:** Every response that returns a widget creates a fresh instance with its own UI state.
* **UI state sticks with the widget:** When you reopen or refresh the same message, the widget restores its saved state (selected row, expanded panel, etc.).
* **Server data drives the truth:** The widget only sees updated business data when a tool call completes, and then it reapplies its local UI state on top of that snapshot.
### Mental model
The widget’s UI and data layers work together like this:
```
`Server (MCP or backend)
│
├── Authoritative business data (source of truth)
│
▼
ChatGPT Widget
│
├── Ephemeral UI state (visual behavior)
│
└── Rendered view = authoritative data + UI state`
```
This separation keeps UI interaction smooth while ensuring data correctness.
## 1. Business State (Authoritative)
Business data is the **source of truth**. It should live on your MCP server or
backend, not inside the widget.
When the user takes an action:
1. The UI calls a server tool.
2. The server updates data.
3. The server returns the new authoritative snapshot.
4. The widget re-renders using that snapshot.
This prevents divergence between UI and server.
### Example: Returning authoritative state from an MCP server (Node.js)
```
`import { Server } from "@modelcontextprotocol/sdk/server";
import { jsonSchema } from "@modelcontextprotocol/sdk/schema";
const tasks = new Map(); // replace with your DB or external service
let nextId = 1;
const server = new Server({
tools: {
get\_tasks: {
description: "Return all tasks",
inputSchema: jsonSchema.object({}),
async run() {
return {
structuredContent: {
type: "taskList",
tasks: Array.from(tasks.values()),
},
};
},
},
add\_task: {
description: "Add a new task",
inputSchema: jsonSchema.object({ title: jsonSchema.string() }),
async run({ title }) {
const id = `task-${nextId++}`; // simple example id
tasks.set(id, { id, title, done: false });
// Always return updated authoritative state
return this.tools.get\_tasks.run({});
},
},
},
});
server.start();`
```
## 2. UI State (Ephemeral)
UI state describes **how** data is being viewed, not the data itself.
Widgets do not automatically re-sync UI state when new server data arrives. Instead, the widget keeps its UI state and re-applies it when authoritative data is refreshed.
Store UI state inside the widget instance using your UI framework’s state (React
state, signals, etc.). For new apps:
* Keep UI state local to the UI.
* When the model should see UI state (selected filters, staged edits), call
`ui/update-model-context`.
This keeps your core UI logic portable across MCP Apps-compatible hosts.
**ChatGPT extension (optional):** if you want ChatGPT to persist UI-only state
for the life of a widget, you can use:
* `window.openai.widgetState` – read the current widget-scoped state snapshot.
* `window.openai.setWidgetState(newState)` – write the next snapshot. The call
is synchronous; persistence happens in the background.
Because the host persists widget state asynchronously, there is nothing to `await` when you call `window.openai.setWidgetState`. Treat it just like updating local component state and call it immediately after every meaningful UI-state change.
### Example (React component)
This example shows ChatGPT widget-state persistence (optional). If you want to
use it in React, wrap `window.openai.widgetState` and `window.openai.setWidgetState`
in a small hook (for example, `useWidgetState`) and import it from your project.
```
`import { useWidgetState } from "./use-widget-state";
export function TaskList({ data }) {
const [widgetState, setWidgetState] = useWidgetState(() =\> ({
selectedId: null,
}));
const selectTask = (id) =\> {
setWidgetState((prev) =\> ({ ...prev, selectedId: id }));
};
return (
\<ul\>
{data.tasks.map((task) =\> (
\<li
key={task.id}
style={{
fontWeight: widgetState?.selectedId === task.id ? "bold" : "normal",
}}
onClick={() =\> selectTask(task.id)}
\>
{task.title}
\</li\>
))}
\</ul\>
);
}`
```
### Example (vanilla JS component)
```
`let tasks = [];
let widgetState = window.openai?.widgetState ?? { selectedId: null };
const updateFromToolResult = (toolResult) =\> {
const nextTasks = toolResult?.structuredContent?.tasks;
if (!nextTasks) return;
tasks = nextTasks;
renderTasks();
};
window.addEventListener(
"message",
(event) =\> {
if (event.source !== window.parent) return;
const message = event.data;
if (!message || message.jsonrpc !== "2.0") return;
if (message.method !== "ui/notifications/tool-result") return;
updateFromToolResult(message.params);
},
{ passive: true }
);
function selectTask(id) {
widgetState = { ...widgetState, selectedId: id };
window.openai?.setWidgetState?.(widgetState);
renderTasks();
}
function renderTasks() {
const list = document.querySelector("#task-list");
list.innerHTML = tasks
.map(
(task) =\> `
\<li
style="font-weight: ${widgetState.selectedId === task.id ? "bold" : "normal"}"
onclick="selectTask('${task.id}')"
\>
${task.title}
\</li\>
`
)
.join("");
}
renderTasks();`
```
### Image IDs in widget state (model-visible images, ChatGPT extension)
If your widget works with images, use the structured widget state shape and include an `imageIds` array. The host will expose these file IDs to the model on follow-up turns so the model can reason about the images.
The recommended shape is:
* `modelContent`: text or JSON the model should see.
* `privateContent`: UI-only state the model should not see.
* `imageIds`: list of file IDs uploaded by the widget, selected via `window.openai.selectFiles()` when the file library is available, or provided to your tool via file params.
```
`type StructuredWidgetState = {
modelContent: string | Record\<string, unknown\> | null;
privateContent: Record\<string, unknown\> | null;
imageIds: string[];
};
const [state, setState] = useWidgetState\<StructuredWidgetState\>(null);
setState({
modelContent: "Check out the latest updated image",
privateContent: {
currentView: "image-viewer",
filters: ["crop", "sharpen"],
},
imageIds: ["file\_123", "file\_456"],
});`
```
Only file IDs you uploaded with `window.openai.uploadFile`, selected with
`window.openai.selectFiles()` when available, or received via file params can
be included in `imageIds`.
## 3. Cross-session state
Preferences that must persist across conversations, devices, or sessions should be stored in your backend.
Apps SDK handles conversation state automatically, but most real-world apps also need durable storage. You might cache fetched data, keep track of user preferences, or persist artifacts created inside a component. Choosing to add a storage layer adds additional capabilities, but also complexity.
## Bring your own backend
If you already run an API or need multi-user collaboration, integrate with your existing storage layer. In this model:
* Authenticate the user via OAuth (see [Authentication](/apps-sdk/build/auth)) so you can map ChatGPT identities to your internal accounts.
* Use your backend’s APIs to fetch and mutate data. Keep latency low; users expect components to render in a few hundred milliseconds.
* Return sufficient structured content so the model can understand the data even if the component fails to load.
When you roll your own storage, plan for:
* **Data residency and compliance** – ensure you have agreements in place before transferring PII or regulated data.
* **Rate limits** – protect your APIs against bursty traffic from model retries or multiple active components.
* **Versioning** – include schema versions in stored objects so you can migrate them without breaking existing conversations.
### Example: Widget invokes a tool
This example assumes you have a JSON-RPC request/response helper (for example,
from the [Quickstart](/apps-sdk/quickstart#build-a-web-component)) that can send
`tools/call` requests.
```
`import { useState } from "react";
export function PreferencesForm({ userId, initialPreferences }) {
const [formState, setFormState] = useState(initialPreferences);
const [isSaving, setIsSaving] = useState(false);
async function savePreferences(next) {
setIsSaving(true);
setFormState(next);
// Use the MCP Apps bridge (`tools/call`) to invoke tools from the UI.
// Ensure the tool is visible to the UI (app) in its descriptor (see
// `\_meta.ui.visibility`).
const result = await rpcRequest("tools/call", {
name: "set\_preferences",
arguments: { userId, preferences: next },
});
const updated = result?.structuredContent?.preferences ?? next;
setFormState(updated);
setIsSaving(false);
}
return (
\<form\>
{/\* form fields bound to formState \*/}
\<button
type="button"
disabled={isSaving}
onClick={() =\> savePreferences(formState)}
\>
{isSaving ? "Saving…" : "Save preferences"}
\</button\>
\</form\>
);
}`
```
### Example: Server handles the tool (Node.js)
```
`import { Server } from "@modelcontextprotocol/sdk/server";
import { jsonSchema } from "@modelcontextprotocol/sdk/schema";
import { request } from "undici";
// Helpers that call your existing backend API
async function readPreferences(userId) {
const response = await request(
`https://api.example.com/users/${userId}/preferences`,
{
method: "GET",
headers: { Authorization: `Bearer ${process.env.API\_TOKEN}` },
}
);
if (response.statusCode === 404) return {};
if (response.statusCode \>= 400) throw new Error("Failed to load preferences");
return await response.body.json();
}
async function writePreferences(userId, preferences) {
const response = await request(
`https://api.example.com/users/${userId}/preferences`,
{
method: "PUT",
headers: {
Authorization: `Bearer ${process.env.API\_TOKEN}`,
"Content-Type": "application/json",
},
body: JSON.stringify(preferences),
}
);
if (response.statusCode \>= 400) throw new Error("Failed to save preferences");
return await response.body.json();
}
const server = new Server({
tools: {
get\_preferences: {
inputSchema: jsonSchema.object({ userId: jsonSchema.string() }),
async run({ userId }) {
const preferences = await readPreferences(userId);
return { structuredContent: { type: "preferences", preferences } };
},
},
set\_preferences: {
inputSchema: jsonSchema.object({
userId: jsonSchema.string(),
preferences: jsonSchema.object({}),
}),
async run({ userId, preferences }) {
const updated = await writePreferences(userId, preferences);
return {
structuredContent: { type: "preferences", preferences: updated },
};
},
},
},
});`
```
## Summary
* Store **business data** on the server.
* Store **UI state** inside the widget (React state, signals, etc.). Use `ui/update-model-context` when the model needs to see UI state, and use `window.openai.widgetState` / `window.openai.setWidgetState` only when you need ChatGPT widget-state persistence (optional).
* Store **cross-session state** in backend storage you control.
* Widget state persists only for the widget instance belonging to a specific message.
* Avoid using `localStorage` for core state.