Reference – Apps SDK | OpenAI Developers
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
**Build once, run in many places.** ChatGPT implements the MCP
Apps standard for UI integration, informed by what we learned building ChatGPT
Apps. Apps SDK support is here to stay—we have no plans to deprecate it. Use
MCP Apps standard fields and the `ui/\*` bridge by default.
**OpenAI extensions are optional** and live in `window.openai`
when you want ChatGPT-specific capabilities.
## MCP Apps UI bridge
UI integrations use JSON-RPC 2.0 over `postMessage` with `ui/\*` methods and
notifications.
Common messages:
|Category|MCP Apps method/notification|Purpose|
|Tool inputs|`ui/notifications/tool-input`|Latest tool input that invoked the UI.|
|Tool results|`ui/notifications/tool-result`|Latest tool result (includes `structuredContent`, `content`, `\_meta`).|
|Tool calls|`tools/call`|Call an MCP tool directly from the UI.|
|Follow-up messages|`ui/message`|Ask the host to post a message.|
|Model context|`ui/update-model-context`|Update model-visible context from UI state.|
For an overview and a mapping guide from Apps SDK APIs, see
[MCP Apps compatibility in ChatGPT](/apps-sdk/mcp-apps-in-chatgpt).
## `window.openai` component bridge
ChatGPT provides `window.openai` as an Apps SDK compatibility layer and a set of
optional ChatGPT extensions.
See [build a ChatGPT UI](/apps-sdk/build/chatgpt-ui) for implementation walkthroughs.
### Capabilities
|Capability|What it does|Typical use|
|State & data|`window.openai.toolInput`|Arguments supplied when the tool was invoked.|
|State & data|`window.openai.toolOutput`|Your `structuredContent`. Keep fields concise; the model reads them verbatim.|
|State & data|`window.openai.toolResponseMetadata`|The `\_meta` payload; only the widget sees it, never the model.|
|State & data|`window.openai.widgetState`|Snapshot of UI state persisted between renders.|
|State & data|`window.openai.setWidgetState(state)`|Stores a new snapshot synchronously; call it after every meaningful UI interaction.|
|Widget runtime APIs|`window.openai.callTool(name, args)`|Invoke another MCP tool from the widget (mirrors model-initiated calls).|
|Widget runtime APIs|`window.openai.sendFollowUpMessage({ prompt, scrollToBottom })`|Ask ChatGPT to post a message authored by the component. `scrollToBottom` is optional, defaults to `true`, and can be set to `false` to prevent auto-scroll.|
|Widget runtime APIs|`window.openai.uploadFile(file, { library?: boolean })`|Upload a user-selected file and receive a `fileId`. Pass `{ library: true }` to also save the upload in the user’s ChatGPT file library when that library is available.|
|Widget runtime APIs|`window.openai.selectFiles()`|Open ChatGPT’s file library picker and return app-authorized files as `{ fileId, fileName, mimeType }[]`. Feature-detect this helper because the file library may not be available to all users.|
|Widget runtime APIs|`window.openai.getFileDownloadUrl({ fileId })`|Retrieve a temporary download URL for a file uploaded by the widget, selected from the file library, or provided via file params.|
|Widget runtime APIs|`window.openai.requestDisplayMode(...)`|Request PiP/fullscreen modes.|
|Widget runtime APIs|`window.openai.requestModal({ params, template })`|Spawn a modal owned by ChatGPT. Omit `template` to use the current template, or pass a registered template URI to switch modal content.|
|Widget runtime APIs|`window.openai.requestClose()`|Ask ChatGPT to close the current widget.|
|Widget runtime APIs|`window.openai.notifyIntrinsicHeight(...)`|Report dynamic widget heights to avoid scroll clipping.|
|Widget runtime APIs|`window.openai.openExternal({ href, redirectUrl })`|Open a vetted external link in the user’s browser. For allowlisted redirect targets, ChatGPT appends `?redirectUrl=...` by default; set `redirectUrl: false` to skip it.|
|Widget runtime APIs|`window.openai.setOpenInAppUrl({ href })`|Optionally override the fullscreen “Open in \<App\>” target. If unset, ChatGPT keeps the default behavior and opens the widget’s current iframe path.|
|Context|`window.openai.theme`, `window.openai.displayMode`, `window.openai.maxHeight`, `window.openai.safeArea`, `window.openai.view`, `window.openai.userAgent`, `window.openai.locale`|Environment signals you can read—or subscribe to via `useOpenAiGlobal`—to adapt visuals and copy.|
### `useOpenAiGlobal` helper
Many Apps SDK projects wrap `window.openai` access in small helper functions so views remain testable. This example helper listens for host `openai:set\_globals` events and lets React components subscribe to a single global value:
```
`export function useOpenAiGlobal\<K extends keyof WebplusGlobals\>(
key: K
): WebplusGlobals[K] {
return useSyncExternalStore(
(onChange) =\> {
const handleSetGlobal = (event: SetGlobalsEvent) =\> {
const value = event.detail.globals[key];
if (value === undefined) {
return;
}
onChange();
};
window.addEventListener(SET\_GLOBALS\_EVENT\_TYPE, handleSetGlobal, {
passive: true,
});
return () =\> {
window.removeEventListener(SET\_GLOBALS\_EVENT\_TYPE, handleSetGlobal);
};
},
() =\> window.openai[key]
);
}`
```
## File APIs
ChatGPT supports file upload/download helpers as optional `window.openai`
extensions.
|API|Purpose|Notes|
|`window.openai.uploadFile(file, { library?: boolean })`|Upload a user-selected file and receive a `fileId`.|Pass `{ library: true }` to also save the upload in the user’s ChatGPT file library when that library is available to the current user.|
|`window.openai.selectFiles()`|Open the file library picker for existing files.|Returns `[{ fileId, fileName, mimeType }]`. Feature-detect this helper because the file library may not be available to all users.|
|`window.openai.getFileDownloadUrl({ fileId })`|Request a temporary download URL for a file.|Works for files uploaded by the widget, selected from the file library, or passed via file params.|
The ChatGPT file library is optional and may not be available to every user.
Files returned from `window.openai.selectFiles()` are already authorized for
the current app when the helper is available. Use the returned `fileId` with
`window.openai.getFileDownloadUrl({ fileId })` or in a tool input that uses
file params.
When persisting widget state, use the structured shape (`modelContent`, `privateContent`, `imageIds`) if you want the model to see image IDs during follow-up turns.
## Tool descriptor parameters
Need more background on these fields? Check the [Advanced section of the MCP server guide](/apps-sdk/build/mcp-server#advanced).
By default, a tool description should include the fields listed [here](https://modelcontextprotocol.io/specification/2025-06-18/server/tools#tool).
### `\_meta` fields on tool descriptor
Use these `\_meta` fields on the tool descriptor. Prefer the MCP Apps standard
key `\_meta.ui.resourceUri` for linking a tool to a UI template. ChatGPT supports
OpenAI-specific metadata for compatibility and optional extensions.
|Key|Placement|Type|Limits|Purpose|
|`\_meta["securitySchemes"]`|Tool descriptor|array|None|Back-compat mirror for clients that only read `\_meta`.|
|`\_meta.ui.resourceUri`|Tool descriptor|string (URI)|None|Standard resource URI for the UI template.|
|`\_meta.ui.visibility`|Tool descriptor|string[]|default `["model", "app"]`|Controls whether a tool is available to the model, the UI (app), or both.|
|`\_meta["openai/outputTemplate"]`|Tool descriptor|string (URI)|None|OpenAI-specific optional/compatibility alias for `\_meta.ui.resourceUri` in ChatGPT.|
|`\_meta["openai/widgetAccessible"]`|Tool descriptor|boolean|default `false`|OpenAI-specific compatibility field used by existing Apps SDK apps; prefer `\_meta.ui.visibility` + `tools/call`.|
|`\_meta["openai/visibility"]`|Tool descriptor|string|`public` (default) or `private`|OpenAI-specific compatibility field used by existing Apps SDK apps; prefer `\_meta.ui.visibility`.|
|`\_meta["openai/toolInvocation/invoking"]`|Tool descriptor|string|≤ 64 chars|Short status text while the tool runs.|
|`\_meta["openai/toolInvocation/invoked"]`|Tool descriptor|string|≤ 64 chars|Short status text after the tool completes.|
|`\_meta["openai/fileParams"]`|Tool descriptor|string[]|None|List of top-level input fields that represent files (object shape `{ download\_url, file\_id }`).|
Example:
```
`import { registerAppTool } from "@modelcontextprotocol/ext-apps/server";
registerAppTool(
server,
"search",
{
title: "Public Search",
description: "Search public documents.",
inputSchema: {
type: "object",
properties: { q: { type: "string" } },
required: ["q"],
},
securitySchemes: [
{ type: "noauth" },
{ type: "oauth2", scopes: ["search.read"] },
],
\_meta: {
securitySchemes: [
{ type: "noauth" },
{ type: "oauth2", scopes: ["search.read"] },
],
ui: { resourceUri: "ui://widget/story.html" },
// Optional compatibility alias (ChatGPT only):
// "openai/outputTemplate": "ui://widget/story.html",
"openai/toolInvocation/invoking": "Searching…",
"openai/toolInvocation/invoked": "Results ready",
},
},
async ({ q }) =\> performSearch(q)
);`
```
### Annotations
To label a tool as “read-only,” please use the following [annotation](https://modelcontextprotocol.io/specification/2025-06-18/server/resources#annotations) on the tool descriptor:
|Key|Type|Required|Notes|
|`readOnlyHint`|boolean|Required|Signal that the tool only retrieves or computes information and doesn’t create, update, delete, or send data outside of ChatGPT.|
|`destructiveHint`|boolean|Required|Declare that the tool may delete or overwrite user data so ChatGPT knows to elicit explicit approval first.|
|`openWorldHint`|boolean|Required|Declare that the tool publishes content or reaches outside the current user’s account, prompting the client to summarize the impact before asking for approval.|
|`idempotentHint`|boolean|Optional|Declare that calling the tool with the same arguments has no extra effect on its environment.|
These hints only influence how ChatGPT frames the tool call to the user; servers must still enforce their own authorization logic.
Example:
```
`server.registerTool(
"list\_saved\_recipes",
{
title: "List saved recipes",
description: "Returns the user’s saved recipes without modifying them.",
inputSchema: {
type: "object",
properties: {},
additionalProperties: false,
},
annotations: { readOnlyHint: true },
},
async () =\> fetchSavedRecipes()
);`
```
Need more background on these fields? Check the [Advanced section of the MCP server guide](/apps-sdk/build/mcp-server#advanced).
## Component resource `\_meta` fields
More detail on these resource settings lives in the [Advanced section of the MCP server guide](/apps-sdk/build/mcp-server#advanced).
Set these keys on the resource template that serves your component (`registerResource`). They help ChatGPT describe and frame the rendered iframe without leaking metadata to other clients.
|Key|Placement|Type|Purpose|
|`\_meta.ui.prefersBorder`|Resource contents|boolean|Hint that the component should render inside a bordered card when supported.|
|`\_meta.ui.csp`|Resource contents|object|Preferred metadata surface for standard widget CSP fields: `connectDomains`, `resourceDomains`, and optional `frameDomains`.|
|`\_meta.ui.domain`|Resource contents|string (origin)|Dedicated origin for hosted components (required for app submission; must be unique per app). Defaults to `https://web-sandbox.oaiusercontent.com`.|
|`\_meta["openai/widgetDescription"]`|Resource contents|string|Human-readable summary surfaced to the model when the component loads, reducing redundant assistant narration.|
|`\_meta["openai/widgetPrefersBorder"]`|Resource contents|boolean|OpenAI-specific compatibility alias for `\_meta.ui.prefersBorder` in ChatGPT.|
|`\_meta["openai/widgetCSP"]`|Resource contents|object|Legacy ChatGPT compatibility key for widget CSP metadata. Standard CSP fields are superseded by `\_meta.ui.csp`, but `redirect\_domains` is still required for trusted `openExternal` destinations.|
|`\_meta["openai/widgetDomain"]`|Resource contents|string (origin)|OpenAI-specific compatibility alias for `\_meta.ui.domain` in ChatGPT.|
ChatGPT supports the legacy `\_meta["openai/widgetCSP"]` compatibility key with the following snake\_case field names:
* `connect\_domains`: `string[]`
* `resource\_domains`: `string[]`
* `frame\_domains?`: `string[]`
* `redirect\_domains?`: `string[]`. ChatGPT extension for `window.openai.openExternal` redirect targets.
The standard `\_meta.ui.csp` object is generally preferred for new apps and supports:
* `connectDomains`: `string[]`. Domains the widget may contact via fetch/XHR.
* `resourceDomains`: `string[]`. Domains for static assets (images, fonts, scripts, styles).
* `frameDomains?`: `string[]`. Optional list of origins allowed for iframe embeds. By default, widgets can’t render subframes; adding `frameDomains` opts in to iframe usage and triggers stricter app review.
However, `\_meta.ui.csp` does not support `redirect\_domains` for `window.openai.openExternal(...)` links. To allowlist redirect targets, you must still set `\_meta["openai/widgetCSP"].redirect\_domains`.
## Tool results
The [Advanced section of the MCP server guide](/apps-sdk/build/mcp-server#advanced) provides more guidance on shaping these response fields.
Tool results can contain the following [fields](https://modelcontextprotocol.io/specification/2025-06-18/server/tools#tool-result). Notably:
|Key|Type|Required|Notes|
|`structuredContent`|object|Optional|Surfaced to the model and the component. Must match the declared `outputSchema`, when provided.|
|`content`|string or `Content[]`|Optional|Surfaced to the model and the component.|
|`\_meta`|object|Optional|Delivered only to the component. Hidden from the model.|
Only `structuredContent` and `content` appear in the conversation transcript. The host forwards `\_meta` to the component so you can hydrate UI without exposing the data to the model.
Host-provided tool result metadata:
|Key|Placement|Type|Purpose|
|`\_meta["openai/widgetSessionId"]`|Tool result `\_meta` (from host)|string|Stable ID for the currently mounted widget instance; use it to correlate logs and tool calls until the widget unmounts.|
Example:
```
`import { registerAppTool } from "@modelcontextprotocol/ext-apps/server";
registerAppTool(
server,
"get\_zoo\_animals",
{
title: "get\_zoo\_animals",
inputSchema: { count: z.number().int().min(1).max(20).optional() },
\_meta: { ui: { resourceUri: "ui://widget/widget.html" } },
},
async ({ count = 10 }) =\> {
const animals = generateZooAnimals(count);
return {
structuredContent: { animals },
content: [{ type: "text", text: `Here are ${animals.length} animals.` }],
\_meta: {
allAnimalsById: Object.fromEntries(
animals.map((animal) =\> [animal.id, animal])
),
},
};
}
);`
```
### Error tool result
To return an error on the tool result, use the following `\_meta` key:
|Key|Purpose|Type|Notes|
|`\_meta["mcp/www\_authenticate"]`|Error result|string or string[]|RFC 7235 `WWW-Authenticate` challenges to trigger OAuth.|
## `\_meta` fields the client provides
See the [Advanced section of the MCP server guide](/apps-sdk/build/mcp-server#advanced) for broader context on these client-supplied hints.
|Key|When provided|Type|Purpose|
|`\_meta["openai/locale"]`|Initialize + tool calls|string (BCP 47)|Requested locale (older clients may send `\_meta["webplus/i18n"]`).|
|`\_meta["openai/userAgent"]`|Tool calls|string|User agent hint for analytics or formatting.|
|`\_meta["openai/userLocation"]`|Tool calls|object|Coarse location hint (`city`, `region`, `country`, `timezone`, `longitude`, `latitude`).|
|`\_meta["openai/subject"]`|Tool calls|string|Anonymized user id sent to MCP servers for the purposes of rate limiting and identification|
|`\_meta["openai/session"]`|Tool calls|string|Anonymized conversation id for correlating tool calls within the same ChatGPT session.|
|`\_meta["openai/organization"]`|Tool calls|string|Anonymized organization id associated with the current ChatGPT organization, when available.|
Operation-phase `\_meta["openai/userAgent"]` and `\_meta["openai/userLocation"]` are hints only; servers should never rely on them for authorization decisions and must tolerate their absence.
Example:
```
`server.registerTool(
"recommend\_cafe",
{
title: "Recommend a cafe",
inputSchema: { type: "object" },
},
async (\_args, { \_meta }) =\> {
const locale = \_meta?.["openai/locale"] ?? "en";
const location = \_meta?.["openai/userLocation"]?.city;
return {
content: [{ type: "text", text: formatIntro(locale, location) }],
structuredContent: await findNearbyCafes(location),
};
}
);`
```