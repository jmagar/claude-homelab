Quickstart – Apps SDK | OpenAI Developers
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
## Introduction
Apps built with the Apps SDK use the [Model Context Protocol (MCP)](/apps-sdk/concepts/mcp-server) to connect to ChatGPT. To build an app for ChatGPT with the Apps SDK, you need:
1. A Model Context Protocol (MCP) server (required) that defines your app’s capabilities (tools) and exposes them to ChatGPT.
2. (Optional) A web component built with the framework of your choice, rendered in an iframe inside ChatGPT if you want a UI.
ChatGPT implements the open MCP Apps UI standard so you can build your UI once
and run it across MCP Apps-compatible hosts.
In this quickstart, we’ll build a simple to-do list app, contained in a single HTML file that keeps the markup, CSS, and JavaScript together.
To see more advanced examples using React, see the [examples repository on GitHub](https://github.com/openai/openai-apps-sdk-examples).
## Build a web component
This step is optional. If you only need tools and no ChatGPT UI, skip to
[Build an MCP server](#build-an-mcp-server) and do not register a UI resource.
Let’s start by creating a file called `public/todo-widget.html` in a new directory that will be the UI rendered by the Apps SDK in ChatGPT.
This file will contain the web component that will be rendered in the ChatGPT interface.
Add the following content:
```
`\<!DOCTYPE html\>
\<html lang="en"\>
\<head\>
\<meta charset="utf-8" /\>
\<title\>Todo list\</title\>
\<style\>
:root {
color: #0b0b0f;
font-family:
"Inter",
system-ui,
-apple-system,
sans-serif;
}
html,
body {
width: 100%;
min-height: 100%;
box-sizing: border-box;
}
body {
margin: 0;
padding: 16px;
background: #f6f8fb;
}
main {
width: 100%;
max-width: 360px;
min-height: 260px;
margin: 0 auto;
background: #fff;
border-radius: 16px;
padding: 20px;
box-shadow: 0 12px 24px rgba(15, 23, 42, 0.08);
}
h2 {
margin: 0 0 16px;
font-size: 1.25rem;
}
form {
display: flex;
gap: 8px;
margin-bottom: 16px;
}
form input {
flex: 1;
padding: 10px 12px;
border-radius: 10px;
border: 1px solid #cad3e0;
font-size: 0.95rem;
}
form button {
border: none;
border-radius: 10px;
background: #111bf5;
color: white;
font-weight: 600;
padding: 0 16px;
cursor: pointer;
}
form button:disabled {
opacity: 0.7;
cursor: not-allowed;
}
input[type="checkbox"] {
accent-color: #111bf5;
}
ul {
list-style: none;
padding: 0;
margin: 0;
display: flex;
flex-direction: column;
gap: 8px;
}
li {
background: #f2f4fb;
border-radius: 12px;
padding: 10px 14px;
display: flex;
align-items: center;
gap: 10px;
}
li span {
flex: 1;
}
li[data-completed="true"] span {
text-decoration: line-through;
color: #6c768a;
}
li[data-busy="true"] {
opacity: 0.7;
}
\</style\>
\</head\>
\<body\>
\<main\>
\<h2\>Todo list\</h2\>
\<form id="add-form" autocomplete="off"\>
\<input id="todo-input" name="title" placeholder="Add a task" /\>
\<button type="submit"\>Add\</button\>
\</form\>
\<ul id="todo-list"\>\</ul\>
\</main\>
\<script type="module"\>
const listEl = document.querySelector("#todo-list");
const formEl = document.querySelector("#add-form");
const inputEl = document.querySelector("#todo-input");
const addButtonEl = formEl.querySelector('button[type="submit"]');
const addButtonText = addButtonEl.textContent;
let tasks = [];
let isAdding = false;
const busyTodoIds = new Set();
const render = () =\> {
listEl.innerHTML = "";
tasks.forEach((task) =\> {
const li = document.createElement("li");
li.dataset.id = task.id;
li.dataset.completed = String(Boolean(task.completed));
li.dataset.busy = String(busyTodoIds.has(task.id));
const label = document.createElement("label");
label.style.display = "flex";
label.style.alignItems = "center";
label.style.gap = "10px";
const checkbox = document.createElement("input");
checkbox.type = "checkbox";
checkbox.checked = Boolean(task.completed);
checkbox.disabled = busyTodoIds.has(task.id);
const span = document.createElement("span");
span.textContent = task.title;
label.appendChild(checkbox);
label.appendChild(span);
li.appendChild(label);
listEl.appendChild(li);
});
};
const updateFromResponse = (response) =\> {
if (response?.structuredContent?.tasks) {
tasks = response.structuredContent.tasks;
render();
}
};
// MCP Apps standard bridge: JSON-RPC messages over postMessage.
//
// - Initialize the bridge with `ui/initialize`.
// - Confirm readiness with `ui/notifications/initialized`.
// - Call tools with `tools/call`.
// - Listen for `ui/notifications/tool-result` to react to model-initiated tool calls.
let rpcId = 0;
const pendingRequests = new Map();
const rpcNotify = (method, params) =\> {
window.parent.postMessage({ jsonrpc: "2.0", method, params }, "\*");
};
const rpcRequest = (method, params) =\>
new Promise((resolve, reject) =\> {
const id = ++rpcId;
pendingRequests.set(id, { resolve, reject });
window.parent.postMessage(
{ jsonrpc: "2.0", id, method, params },
"\*"
);
});
window.addEventListener(
"message",
(event) =\> {
if (event.source !== window.parent) return;
const message = event.data;
if (!message || message.jsonrpc !== "2.0") return;
// Responses
if (typeof message.id === "number") {
const pending = pendingRequests.get(message.id);
if (!pending) return;
pendingRequests.delete(message.id);
if (message.error) {
pending.reject(message.error);
return;
}
pending.resolve(message.result);
return;
}
// Notifications
if (typeof message.method !== "string") return;
if (message.method === "ui/notifications/tool-result") {
updateFromResponse(message.params);
}
},
{ passive: true }
);
const initializeBridge = async () =\> {
const appInfo = { name: "todo-widget", version: "0.1.0" };
const appCapabilities = {};
const protocolVersion = "2026-01-26";
try {
await rpcRequest("ui/initialize", {
appInfo,
appCapabilities,
protocolVersion,
});
rpcNotify("ui/notifications/initialized", {});
} catch (error) {
console.error("Failed to initialize the MCP Apps bridge:", error);
throw error;
}
};
const bridgeReady = initializeBridge();
const callTodoTool = async (name, payload) =\> {
await bridgeReady;
const response = await rpcRequest("tools/call", {
name,
arguments: payload,
});
updateFromResponse(response);
};
formEl.addEventListener("submit", async (event) =\> {
event.preventDefault();
const title = inputEl.value.trim();
if (!title || isAdding) return;
isAdding = true;
addButtonEl.disabled = true;
addButtonEl.textContent = "Adding…";
try {
await callTodoTool("add\_todo", { title });
inputEl.value = "";
} catch (error) {
console.error("Failed to add todo:", error);
} finally {
isAdding = false;
addButtonEl.disabled = false;
addButtonEl.textContent = addButtonText;
}
});
listEl.addEventListener("change", async (event) =\> {
const checkbox = event.target;
if (!checkbox.matches('input[type="checkbox"]')) return;
const id = checkbox.closest("li")?.dataset.id;
if (!id) return;
if (!checkbox.checked) {
checkbox.checked = true;
return;
}
if (busyTodoIds.has(id)) return;
busyTodoIds.add(id);
checkbox.disabled = true;
const rowEl = checkbox.closest("li");
if (rowEl) rowEl.dataset.busy = "true";
try {
await callTodoTool("complete\_todo", { id });
} catch (error) {
console.error("Failed to complete todo:", error);
} finally {
busyTodoIds.delete(id);
render();
}
});
render();
\</script\>
\</body\>
\</html\>`
```
### Using the Apps SDK in your web component
For new apps, use the MCP Apps host bridge: JSON-RPC over `postMessage`
with `ui/\*` notifications and methods such as `tools/call`.
ChatGPT continues to support Apps SDK compatibility and optional ChatGPT
extensions.
For details, see [MCP Apps compatibility in ChatGPT](/apps-sdk/mcp-apps-in-chatgpt).
## Build an MCP server
Install the official Python or Node MCP SDK to create a server and expose a `/mcp` endpoint.
In this quickstart, we’ll use the [Node SDK](https://github.com/modelcontextprotocol/typescript-sdk).
If you’re using Python, refer to our [examples repository on GitHub](https://github.com/openai/openai-apps-sdk-examples) to see an example MCP server with the Python SDK.
Install the Node SDK, MCP Apps helpers, and Zod with:
```
`npm install @modelcontextprotocol/sdk @modelcontextprotocol/ext-apps zod`
```
### MCP server with Apps SDK resources
Register a resource for your component bundle and the tools the model can call (e.g. `add\_todo` and `complete\_todo`) so ChatGPT can drive the UI.
Create a file named `server.js` and paste the following example that uses the Node SDK:
```
`import { createServer } from "node:http";
import { readFileSync } from "node:fs";
import {
registerAppResource,
registerAppTool,
RESOURCE\_MIME\_TYPE,
} from "@modelcontextprotocol/ext-apps/server";
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { StreamableHTTPServerTransport } from "@modelcontextprotocol/sdk/server/streamableHttp.js";
import { z } from "zod";
const todoHtml = readFileSync("public/todo-widget.html", "utf8");
const addTodoInputSchema = {
title: z.string().min(1),
};
const completeTodoInputSchema = {
id: z.string().min(1),
};
let todos = [];
let nextId = 1;
const replyWithTodos = (message) =\> ({
content: message ? [{ type: "text", text: message }] : [],
structuredContent: { tasks: todos },
});
function createTodoServer() {
const server = new McpServer({ name: "todo-app", version: "0.1.0" });
registerAppResource(
server,
"todo-widget",
"ui://widget/todo.html",
{},
async () =\> ({
contents: [
{
uri: "ui://widget/todo.html",
mimeType: RESOURCE\_MIME\_TYPE,
text: todoHtml,
},
],
})
);
registerAppTool(
server,
"add\_todo",
{
title: "Add todo",
description: "Creates a todo item with the given title.",
inputSchema: addTodoInputSchema,
\_meta: {
ui: { resourceUri: "ui://widget/todo.html" },
},
},
async (args) =\> {
const title = args?.title?.trim?.() ?? "";
if (!title) return replyWithTodos("Missing title.");
const todo = { id: `todo-${nextId++}`, title, completed: false };
todos = [...todos, todo];
return replyWithTodos(`Added "${todo.title}".`);
}
);
registerAppTool(
server,
"complete\_todo",
{
title: "Complete todo",
description: "Marks a todo as done by id.",
inputSchema: completeTodoInputSchema,
\_meta: {
ui: { resourceUri: "ui://widget/todo.html" },
},
},
async (args) =\> {
const id = args?.id;
if (!id) return replyWithTodos("Missing todo id.");
const todo = todos.find((task) =\> task.id === id);
if (!todo) {
return replyWithTodos(`Todo ${id} was not found.`);
}
todos = todos.map((task) =\>
task.id === id ? { ...task, completed: true } : task
);
return replyWithTodos(`Completed "${todo.title}".`);
}
);
return server;
}
const port = Number(process.env.PORT ?? 8787);
const MCP\_PATH = "/mcp";
const httpServer = createServer(async (req, res) =\> {
if (!req.url) {
res.writeHead(400).end("Missing URL");
return;
}
const url = new URL(req.url, `http://${req.headers.host ?? "localhost"}`);
if (req.method === "OPTIONS" && url.pathname === MCP\_PATH) {
res.writeHead(204, {
"Access-Control-Allow-Origin": "\*",
"Access-Control-Allow-Methods": "POST, GET, OPTIONS",
"Access-Control-Allow-Headers": "content-type, mcp-session-id",
"Access-Control-Expose-Headers": "Mcp-Session-Id",
});
res.end();
return;
}
if (req.method === "GET" && url.pathname === "/") {
res.writeHead(200, { "content-type": "text/plain" }).end("Todo MCP server");
return;
}
const MCP\_METHODS = new Set(["POST", "GET", "DELETE"]);
if (url.pathname === MCP\_PATH && req.method && MCP\_METHODS.has(req.method)) {
res.setHeader("Access-Control-Allow-Origin", "\*");
res.setHeader("Access-Control-Expose-Headers", "Mcp-Session-Id");
const server = createTodoServer();
const transport = new StreamableHTTPServerTransport({
sessionIdGenerator: undefined, // stateless mode
enableJsonResponse: true,
});
res.on("close", () =\> {
transport.close();
server.close();
});
try {
await server.connect(transport);
await transport.handleRequest(req, res);
} catch (error) {
console.error("Error handling MCP request:", error);
if (!res.headersSent) {
res.writeHead(500).end("Internal server error");
}
}
return;
}
res.writeHead(404).end("Not Found");
});
httpServer.listen(port, () =\> {
console.log(
`Todo MCP server listening on http://localhost:${port}${MCP\_PATH}`
);
});`
```
This snippet also responds to `GET /` for health checks, handles CORS preflight for `/mcp` and nested routes like `/mcp/actions`, and returns `404 Not Found` for OAuth discovery routes you are not using yet. That keeps ChatGPT’s connector wizard from surfacing 502 errors while you iterate without authentication.
## Run locally
If you’re using a web framework like React, build your component into static assets so the HTML template can inline them.
Usually, you can run a build command such as `npm run build` to produce a `dist` directory with your compiled assets.
In this quickstart, since we’re using vanilla HTML, no build step is required.
Start the MCP server on `http://localhost:\<port\>/mcp` from the directory that contains `server.js` (or `server.ts`).
Make sure you have `"type": "module"` in your `package.json` file:
```
`{
"type": "module",
"dependencies": {
"@modelcontextprotocol/sdk": "^1.20.2",
"@modelcontextprotocol/ext-apps": "^1.0.1",
"zod": "^3.25.76"
}
}`
```
Then run the server with the following command:
```
`node server.js`
```
The server should print `Todo MCP server listening on http://localhost:8787/mcp` once it is ready.
### Test with MCP Inspector
You can use the [MCP Inspector](https://modelcontextprotocol.io/docs/tools/inspector) to test your server locally.
```
`npx @modelcontextprotocol/inspector@latest --server-url http://localhost:8787/mcp --transport http`
```
This will open a browser window with the MCP Inspector interface. You can use this to test your server and see the tool responses.
### Expose your server to the public internet
For ChatGPT to access your server during development, you need to expose it to the public internet. You can use a tool such as [ngrok](https://ngrok.com/) to open a tunnel to your local server.
```
`ngrok http \<port\>`
```
This will give you a public URL like `https://\<subdomain\>.ngrok.app` that you can use to access your server from ChatGPT.
When you add your connector, provide the public URL with the `/mcp` path (e.g. `https://\<subdomain\>.ngrok.app/mcp`).
## Add your app to ChatGPT
Once you have your MCP server and web component working locally, you can add your app to ChatGPT with the following steps:
1. Enable [developer mode](https://platform.openai.com/docs/guides/developer-mode) under **Settings → Apps & Connectors → Advanced settings** in ChatGPT.
2. Click the **Create** button to add a connector under **Settings → Connectors** and paste the HTTPS + `/mcp` URL from your tunnel or deployment (e.g. `https://\<subdomain\>.ngrok.app/mcp`).
3. Name the connector, provide a short description and click **Create**.
1. Open a new chat, add your connector from the **More** menu (accessible after clicking the **+** button), and prompt the model (e.g., “Add a new task to read my book”). ChatGPT will stream tool payloads so you can confirm inputs and outputs.
## Next steps
From there, you can iterate on the UI/UX, prompts, tool metadata, and the overall experience.
Refresh the connector after each change to the MCP server (tools, metadata,
etc.) You can do this by clicking the **Refresh** button in **Settings →
Connectors** after selecting your connector.
When you’re preparing for submission, review the [ChatGPT app submission guidelines](/apps-sdk/app-submission-guidelines) and [research your use case](/apps-sdk/plan/use-case). If you’re building a UI, you can also review the [design guidelines](/apps-sdk/concepts/design-guidelines).
Once you understand the basics, you can leverage the Apps SDK to [build a ChatGPT UI](/apps-sdk/build/chatgpt-ui) using the Apps SDK primitives, [authenticate users](/apps-sdk/build/auth) if needed, and [persist state](/apps-sdk/build/storage).