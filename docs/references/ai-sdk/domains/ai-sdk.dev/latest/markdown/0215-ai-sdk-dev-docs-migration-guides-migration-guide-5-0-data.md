Migration Guides: Migrate Your Data to AI SDK 5.0
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
[Versioning](/docs/migration-guides/versioning)
[Migrate AI SDK 5.x to 6.0](/docs/migration-guides/migration-guide-6-0)
[Migrate Your Data to AI SDK 5.0](/docs/migration-guides/migration-guide-5-0-data)
[Migrate AI SDK 4.x to 5.0](/docs/migration-guides/migration-guide-5-0)
[Migrate AI SDK 4.1 to 4.2](/docs/migration-guides/migration-guide-4-2)
[Migrate AI SDK 4.0 to 4.1](/docs/migration-guides/migration-guide-4-1)
[Migrate AI SDK 3.4 to 4.0](/docs/migration-guides/migration-guide-4-0)
[Migrate AI SDK 3.3 to 3.4](/docs/migration-guides/migration-guide-3-4)
[Migrate AI SDK 3.2 to 3.3](/docs/migration-guides/migration-guide-3-3)
[Migrate AI SDK 3.1 to 3.2](/docs/migration-guides/migration-guide-3-2)
[Migrate AI SDK 3.0 to 3.1](/docs/migration-guides/migration-guide-3-1)
[Troubleshooting](/docs/troubleshooting)
Copy markdown
# [Migrate Your Data to AI SDK 5.0](#migrate-your-data-to-ai-sdk-50)
AI SDK 5.0 introduces changes to the message structure and persistence patterns. Unlike code migrations that can often be automated with codemods, data migration depends on your specific persistence approach, database schema, and application requirements.
**This guide helps you get your application working with AI SDK 5.0 first** using a runtime conversion layer. This allows you to update your app immediately without database migrations blocking you. You can then migrate your data schema at your own pace.
## [Recommended Migration Process](#recommended-migration-process)
Follow this two-phase approach for a safe migration:
### [Phase 1: Get Your App Working (Runtime Conversion)](#phase-1-get-your-app-working-runtime-conversion)
**Goal:** Update your application to AI SDK 5.0 without touching your database.
1. Update dependencies (install v4 types alongside v5)
2. Add conversion functions to transform between v4 and v5 message formats
3. Update data fetching logic to convert messages when reading from the database
4. Update the rest of your application code to AI SDK 5.0 (see the [main migration guide](/docs/migration-guides/migration-guide-5-0))
Your database schema remains unchanged during Phase 1. You're only adding a conversion layer that transforms messages at runtime.
**Timeline:** Can be completed in hours or days.
### [Phase 2: Migrate to V5 Schema (Recommended)](#phase-2-migrate-to-v5-schema-recommended)
**Goal:** Migrate your data to a v5-compatible schema, eliminating the runtime conversion overhead.
While Phase 1 gets you working immediately, migrate your schema soon after completing Phase 1. This phase uses a side-by-side migration approach with an equivalent v5 schema:
1. Create `messages\_v5` table alongside existing `messages` table
2. Start dual-writing to both tables (with conversion)
3. Run a background migration to convert existing messages
4. Switch reads to the v5 schema
5. Remove conversion from your route handlers
6. Remove dual-write (write only to v5)
7. Drop old tables
**Timeline:** Do this soon after Phase 1.
**Why this matters:**
* Removes runtime conversion overhead
* Eliminates technical debt early
* Type safety with v5 message format
* Easier to maintain and extend
## [Understanding the Changes](#understanding-the-changes)
Before starting, understand the main persistence-related changes in AI SDK 5.0:
**AI SDK 4.0:**
* `content` field for text
* `reasoning` as a top-level property
* `toolInvocations` as a top-level property
* `parts` (optional) ordered array
**AI SDK 5.0:**
* `parts` array is the single source of truth
* `content` is removed (deprecated) and accessed via a `text` part
* `reasoning` is removed and replaced with a `reasoning` part
* `toolInvocations` is removed and replaced with `tool-${toolName}` parts with `input`/`output` (renamed from `args`/`result`)
* `data` role removed (use data parts instead)
## [Phase 1: Runtime Conversion Pattern](#phase-1-runtime-conversion-pattern)
This creates a conversion layer without making changes to your database schema.
### [Step 1: Update Dependencies](#step-1-update-dependencies)
To get proper TypeScript types for your v4 messages, install the v4 package alongside v5 using npm aliases:
package.json
```
`
{
"dependencies": {
"ai": "^5.0.0",
"ai-legacy": "npm:ai@^4.3.2"
}
}
`
```
Run:
```
`
pnpm install
`
```
Import v4 types for proper type safety:
```
`
import type { Message as V4Message } from 'ai-legacy';
import type { UIMessage } from 'ai';
`
```
### [Step 2: Add Conversion Functions](#step-2-add-conversion-functions)
Create type guards to detect which message format you're working with, and build a conversion function that handles all v4 message types:
```
`
import type {
ToolInvocation,
Message as V4Message,
UIMessage as LegacyUIMessage,
} from 'ai-legacy';
import type { ToolUIPart, UIMessage, UITools } from 'ai';
export type MyUIMessage = UIMessage\<unknown, { custom: any }, UITools\>;
type V4Part = NonNullable\<V4Message['parts']\>[number];
type V5Part = MyUIMessage['parts'][number];
// Type definitions for V4 parts
type V4ToolInvocationPart = Extract\<V4Part, { type: 'tool-invocation' }\>;
type V4ReasoningPart = Extract\<V4Part, { type: 'reasoning' }\>;
type V4SourcePart = Extract\<V4Part, { type: 'source' }\>;
type V4FilePart = Extract\<V4Part, { type: 'file' }\>;
// Type guards
function isV4Message(msg: V4Message | MyUIMessage): msg is V4Message {
return (
'toolInvocations' in msg ||
(msg?.parts?.some(p =\> p.type === 'tool-invocation') ?? false) ||
msg?.role === 'data' ||
('reasoning' in msg && typeof msg.reasoning === 'string') ||
(msg?.parts?.some(p =\> 'args' in p || 'result' in p) ?? false) ||
(msg?.parts?.some(p =\> 'reasoning' in p && 'details' in p) ?? false) ||
(msg?.parts?.some(
p =\> p.type === 'file' && 'mimeType' in p && 'data' in p,
) ??
false)
);
}
function isV4ToolInvocationPart(part: unknown): part is V4ToolInvocationPart {
return (
typeof part === 'object' &&
part !== null &&
'type' in part &&
part.type === 'tool-invocation' &&
'toolInvocation' in part
);
}
function isV4ReasoningPart(part: unknown): part is V4ReasoningPart {
return (
typeof part === 'object' &&
part !== null &&
'type' in part &&
part.type === 'reasoning' &&
'reasoning' in part
);
}
function isV4SourcePart(part: unknown): part is V4SourcePart {
return (
typeof part === 'object' &&
part !== null &&
'type' in part &&
part.type === 'source' &&
'source' in part
);
}
function isV4FilePart(part: unknown): part is V4FilePart {
return (
typeof part === 'object' &&
part !== null &&
'type' in part &&
part.type === 'file' &&
'mimeType' in part &&
'data' in part
);
}
// State mapping
const V4\_TO\_V5\_STATE\_MAP = {
'partial-call': 'input-streaming',
call: 'input-available',
result: 'output-available',
} as const;
function convertToolInvocationState(
v4State: ToolInvocation['state'],
): 'input-streaming' | 'input-available' | 'output-available' {
return V4\_TO\_V5\_STATE\_MAP[v4State] ?? 'output-available';
}
// Tool conversion
function convertV4ToolInvocationToV5ToolUIPart(
toolInvocation: ToolInvocation,
): ToolUIPart {
return {
type: `tool-${toolInvocation.toolName}`,
toolCallId: toolInvocation.toolCallId,
input: toolInvocation.args,
output:
toolInvocation.state === 'result' ? toolInvocation.result : undefined,
state: convertToolInvocationState(toolInvocation.state),
};
}
// Part converters
function convertV4ToolInvocationPart(part: V4ToolInvocationPart): V5Part {
return convertV4ToolInvocationToV5ToolUIPart(part.toolInvocation);
}
function convertV4ReasoningPart(part: V4ReasoningPart): V5Part {
return { type: 'reasoning', text: part.reasoning };
}
function convertV4SourcePart(part: V4SourcePart): V5Part {
return {
type: 'source-url',
url: part.source.url,
sourceId: part.source.id,
title: part.source.title,
};
}
function convertV4FilePart(part: V4FilePart): V5Part {
return {
type: 'file',
mediaType: part.mimeType,
url: part.data,
};
}
function convertPart(part: V4Part | V5Part): V5Part {
if (isV4ToolInvocationPart(part)) {
return convertV4ToolInvocationPart(part);
}
if (isV4ReasoningPart(part)) {
return convertV4ReasoningPart(part);
}
if (isV4SourcePart(part)) {
return convertV4SourcePart(part);
}
if (isV4FilePart(part)) {
return convertV4FilePart(part);
}
// Already V5 format
return part;
}
// Message conversion
function createBaseMessage(
msg: V4Message | MyUIMessage,
index: number,
): Pick\<MyUIMessage, 'id' | 'role'\> {
return {
id: msg.id || `msg-${index}`,
role: msg.role === 'data' ? 'assistant' : msg.role,
};
}
function convertDataMessage(msg: V4Message, index: number): MyUIMessage {
return {
...createBaseMessage(msg, index),
parts: [
{
type: 'data-custom',
data: msg.data || msg.content,
},
],
};
}
function buildPartsFromTopLevelFields(msg: V4Message): MyUIMessage['parts'] {
const parts: MyUIMessage['parts'] = [];
if (msg.reasoning) {
parts.push({ type: 'reasoning', text: msg.reasoning });
}
if (msg.toolInvocations) {
parts.push(
...msg.toolInvocations.map(convertV4ToolInvocationToV5ToolUIPart),
);
}
if (msg.content && typeof msg.content === 'string') {
parts.push({ type: 'text', text: msg.content });
}
return parts;
}
function convertPartsArray(parts: V4Part[]): MyUIMessage['parts'] {
return parts.map(convertPart);
}
export function convertV4MessageToV5(
msg: V4Message | MyUIMessage,
index: number,
): MyUIMessage {
if (!isV4Message(msg)) {
return msg as MyUIMessage;
}
if (msg.role === 'data') {
return convertDataMessage(msg, index);
}
const base = createBaseMessage(msg, index);
const parts = msg.parts
? convertPartsArray(msg.parts)
: buildPartsFromTopLevelFields(msg);
return { ...base, parts };
}
// V5 to V4 conversion
function convertV5ToolUIPartToV4ToolInvocation(
part: ToolUIPart,
): ToolInvocation {
const state =
part.state === 'input-streaming'
? 'partial-call'
: part.state === 'input-available'
? 'call'
: 'result';
const toolName = part.type.startsWith('tool-')
? part.type.slice(5)
: part.type;
const base = {
toolCallId: part.toolCallId,
toolName,
args: part.input,
state,
};
if (state === 'result' && part.output !== undefined) {
return { ...base, state: 'result' as const, result: part.output };
}
return base as ToolInvocation;
}
export function convertV5MessageToV4(msg: MyUIMessage): LegacyUIMessage {
const parts: V4Part[] = [];
const base: LegacyUIMessage = {
id: msg.id,
role: msg.role,
content: '',
parts,
};
let textContent = '';
let reasoning: string | undefined;
const toolInvocations: ToolInvocation[] = [];
for (const part of msg.parts) {
if (part.type === 'text') {
textContent = part.text;
parts.push({ type: 'text', text: part.text });
} else if (part.type === 'reasoning') {
reasoning = part.text;
parts.push({
type: 'reasoning',
reasoning: part.text,
details: [{ type: 'text', text: part.text }],
});
} else if (part.type.startsWith('tool-')) {
const toolInvocation = convertV5ToolUIPartToV4ToolInvocation(
part as ToolUIPart,
);
parts.push({ type: 'tool-invocation', toolInvocation: toolInvocation });
toolInvocations.push(toolInvocation);
} else if (part.type === 'source-url') {
parts.push({
type: 'source',
source: {
id: part.sourceId,
url: part.url,
title: part.title,
sourceType: 'url',
},
});
} else if (part.type === 'file') {
parts.push({
type: 'file',
mimeType: part.mediaType,
data: part.url,
});
} else if (part.type === 'data-custom') {
base.data = part.data;
}
}
if (textContent) {
base.content = textContent;
}
if (reasoning) {
base.reasoning = reasoning;
}
if (toolInvocations.length \> 0) {
base.toolInvocations = toolInvocations;
}
if (parts.length \> 0) {
base.parts = parts;
}
return base;
}
`
```
### [Step 3: Convert Messages When Reading](#step-3-convert-messages-when-reading)
Apply the conversion when loading messages from your database:
Adapt this code to your specific database and ORM.
```
`
import { convertV4MessageToV5, type MyUIMessage } from './conversion';
export async function loadChat(chatId: string): Promise\<MyUIMessage[]\> {
// Fetch messages from your database (pseudocode - update based on your data access layer)
const rawMessages = await db
.select()
.from(messages)
.where(eq(messages.chatId, chatId))
.orderBy(messages.createdAt);
// Convert on read
return rawMessages.map((msg, index) =\> convertV4MessageToV5(msg, index));
}
`
```
### [Step 4: Convert Messages When Saving](#step-4-convert-messages-when-saving)
In Phase 1, your application runs on v5 but your database stores v4 format. Convert messages inline in your route handlers before passing them to your database functions:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import {
convertV5MessageToV4,
convertV4MessageToV5,
type MyUIMessage,
} from './conversion';
import { upsertMessage, loadChat } from './db/actions';
import { streamText, generateId, convertToModelMessages } from 'ai';
export async function POST(req: Request) {
const { message, chatId }: { message: MyUIMessage; chatId: string } =
await req.json();
// Convert and save incoming user message (v5 to v4 inline)
await upsertMessage({
chatId,
id: message.id,
message: convertV5MessageToV4(message), // convert to v4
});
// Load previous messages (already in v5 format)
const previousMessages = await loadChat(chatId);
const messages = [...previousMessages, message];
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: convertToModelMessages(messages),
tools: {
// Your tools here
},
});
return result.toUIMessageStreamResponse({
generateMessageId: generateId,
originalMessages: messages,
onFinish: async ({ responseMessage }) =\> {
// Convert and save assistant response (v5 to v4 inline)
await upsertMessage({
chatId,
id: responseMessage.id,
message: convertV5MessageToV4(responseMessage),
});
},
});
}
`
```
Keep your `upsertMessage` (or equivalent) function unchanged to continue working with v4 messages.
With Steps 3 and 4 complete, you have a bidirectional conversion layer:
* **Reading:** v4 (database) → v5 (application)
* **Writing:** v5 (application) → v4 (database)
Your database schema remains unchanged, but your application now works with v5 format.
**What's next:** Follow the main migration guide to update the rest of your application code to AI SDK 5.0, including API routes, components, and other code that uses the AI SDK. Then proceed to Phase 2.
See the [main migration guide](/docs/migration-guides/migration-guide-5-0) for details.
## [Phase 2: Side-by-Side Schema Migration](#phase-2-side-by-side-schema-migration)
Now that your application is updated to AI SDK 5.0 and working with the runtime conversion layer from Phase 1, you have a fully functional system. However, **the conversion functions are only a temporary solution**. Your database still stores messages in the v4 format, which means:
* Every read operation requires runtime conversion overhead
* You maintain backward compatibility code indefinitely
* Future features require working with the legacy schema
**Phase 2 migrates your message history to the v5 schema**, eliminating the conversion layer and enabling better performance and long-term maintainability.
This phase uses a simplified approach: create a new `messages\_v5` table with the same structure as your current `messages` table, but storing v5-formatted message parts.
**Adapt phase 2 examples to your setup**
These code examples demonstrate migration patterns. Your implementation will differ based on your database (Postgres, MySQL, SQLite), ORM (Drizzle, Prisma, raw SQL), schema design, and data persistence patterns.
Use these examples as a guide, then adapt them to your specific setup.
### [Overview: Migration Strategy](#overview-migration-strategy)
1. **Create `messages\_v5` table** alongside existing `messages` table
2. **Dual-write** new messages to both schemas (with conversion)
3. **Background migration** to convert existing messages
4. **Verify** data integrity
5. **Update read functions** to use `messages\_v5` schema
6. **Remove conversion** from route handlers
7. **Remove dual-write** (write only to `messages\_v5`)
8. **Clean up** old tables
This ensures your application keeps running throughout the migration with no data loss risk.
### [Step 1: Create V5 Schema Alongside V4](#step-1-create-v5-schema-alongside-v4)
Create a new `messages\_v5` table with the same structure as your existing table, but designed to store v5 message parts:
**Existing v4 Schema (keep running):**
```
`
import { UIMessage } from 'ai-legacy';
export const messages = pgTable('messages', {
id: varchar()
.primaryKey()
.$defaultFn(() =\> nanoid()),
chatId: varchar()
.references(() =\> chats.id, { onDelete: 'cascade' })
.notNull(),
createdAt: timestamp().defaultNow().notNull(),
parts: jsonb().$type\<UIMessage['parts']\>().notNull(),
role: text().$type\<UIMessage['role']\>().notNull(),
});
`
```
**New v5 Schema (create alongside):**
```
`
import { MyUIMessage } from './conversion';
export const messages\_v5 = pgTable('messages\_v5', {
id: varchar()
.primaryKey()
.$defaultFn(() =\> nanoid()),
chatId: varchar()
.references(() =\> chats.id, { onDelete: 'cascade' })
.notNull(),
createdAt: timestamp().defaultNow().notNull(),
parts: jsonb().$type\<MyUIMessage['parts']\>().notNull(),
role: text().$type\<MyUIMessage['role']\>().notNull(),
});
`
```
Run your migration to create the new table:
```
`
pnpm drizzle-kit generate
pnpm drizzle-kit migrate
`
```
### [Step 2: Implement Dual-Write for New Messages](#step-2-implement-dual-write-for-new-messages)
Update your save functions to write to both schemas during the migration period. This ensures new messages are available in both formats:
```
`
import { convertV4MessageToV5 } from './conversion';
import { messages, messages\_v5 } from './schema';
import type { UIMessage } from 'ai-legacy';
export const upsertMessage = async ({
chatId,
message,
id,
}: {
id: string;
chatId: string;
message: UIMessage; // Still accepts v4 format
}) =\> {
return await db.transaction(async tx =\> {
// Write to v4 schema (existing)
const [result] = await tx
.insert(messages)
.values({
chatId,
parts: message.parts ?? [],
role: message.role,
id,
})
.onConflictDoUpdate({
target: messages.id,
set: {
parts: message.parts ?? [],
chatId,
},
})
.returning();
// Convert and write to v5 schema (new)
const v5Message = convertV4MessageToV5(
{
...message,
content: '',
},
0,
);
await tx
.insert(messages\_v5)
.values({
chatId,
parts: v5Message.parts ?? [],
role: v5Message.role,
id,
})
.onConflictDoUpdate({
target: messages\_v5.id,
set: {
parts: v5Message.parts ?? [],
chatId,
},
});
return result;
});
};
`
```
### [Step 3: Migrate Existing Messages](#step-3-migrate-existing-messages)
Create a script to migrate existing messages from v4 to v5 schema:
```
`
import { convertV4MessageToV5 } from './conversion';
import { db } from './db';
import { messages, messages\_v5 } from './db/schema';
async function migrateExistingMessages() {
console.log('Starting migration of existing messages...');
// Get all v4 messages that haven't been migrated yet
const migratedIds = await db.select({ id: messages\_v5.id }).from(messages\_v5);
const migratedIdSet = new Set(migratedIds.map(m =\> m.id));
const allMessages = await db.select().from(messages);
const unmigrated = allMessages.filter(msg =\> !migratedIdSet.has(msg.id));
console.log(`Found ${unmigrated.length} messages to migrate`);
let migrated = 0;
let errors = 0;
const batchSize = 100;
for (let i = 0; i \< unmigrated.length; i += batchSize) {
const batch = unmigrated.slice(i, i + batchSize);
await db.transaction(async tx =\> {
for (const msg of batch) {
try {
// Convert message to v5 format
const v5Message = convertV4MessageToV5(
{
id: msg.id,
content: '',
role: msg.role,
parts: msg.parts,
createdAt: msg.createdAt,
},
0,
);
// Insert into v5 messages table
await tx.insert(messages\_v5).values({
id: v5Message.id,
chatId: msg.chatId,
role: v5Message.role,
parts: v5Message.parts,
createdAt: msg.createdAt,
});
migrated++;
} catch (error) {
console.error(`Error migrating message ${msg.id}:`, error);
errors++;
}
}
});
console.log(`Progress: ${migrated}/${unmigrated.length} messages migrated`);
}
console.log(`Migration complete: ${migrated} migrated, ${errors} errors`);
}
// Run migration
migrateExistingMessages().catch(console.error);
`
```
This script:
* Only migrates messages that haven't been migrated yet
* Uses batching for better performance
* Can be run multiple times safely
* Can be stopped and resumed
### [Step 4: Verify Migration](#step-4-verify-migration)
Create a verification script to ensure data integrity:
```
`
import { count } from 'drizzle-orm';
import { db } from './db';
import { messages, messages\_v5 } from './db/schema';
async function verifyMigration() {
// Count messages in both schemas
const v4Count = await db.select({ count: count() }).from(messages);
const v5Count = await db.select({ count: count() }).from(messages\_v5);
console.log('Migration Status:');
console.log(`V4 Messages: ${v4Count[0].count}`);
console.log(`V5 Messages: ${v5Count[0].count}`);
console.log(
`Migration progress: ${((v5Count[0].count / v4Count[0].count) \* 100).toFixed(2)}%`,
);
}
verifyMigration().catch(console.error);
`
```
### [Step 5: Read from V5 Schema](#step-5-read-from-v5-schema)
Once migration is complete, update your read functions to use the new v5 schema. Since the data is now in v5 format, you don't need conversion:
```
`
import type { MyUIMessage } from './conversion';
export const loadChat = async (chatId: string): Promise\<MyUIMessage[]\> =\> {
// Load from v5 schema - no conversion needed
const messages = await db
.select()
.from(messages\_v5)
.where(eq(messages\_v5.chatId, chatId))
.orderBy(messages\_v5.createdAt);
return messages;
};
`
```
### [Step 6: Write to V5 Schema Only](#step-6-write-to-v5-schema-only)
Once your read functions work with v5 and your background migration is complete, stop dual-writing and only write to v5:
```
`
import type { MyUIMessage } from './conversion';
export const upsertMessage = async ({
chatId,
message,
id,
}: {
id: string;
chatId: string;
message: MyUIMessage; // Now accepts v5 format
}) =\> {
// Write to v5 schema only
const [result] = await db
.insert(messages\_v5)
.values({
chatId,
parts: message.parts ?? [],
role: message.role,
id,
})
.onConflictDoUpdate({
target: messages\_v5.id,
set: {
parts: message.parts ?? [],
chatId,
},
})
.returning();
return result;
};
`
```
Update your route handler to pass v5 messages directly:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
export async function POST(req: Request) {
const { message, chatId }: { message: MyUIMessage; chatId: string } =
await req.json();
// Pass v5 message directly - no conversion needed
await upsertMessage({
chatId,
id: message.id,
message,
});
const previousMessages = await loadChat(chatId);
const messages = [...previousMessages, message];
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: convertToModelMessages(messages),
tools: {
// Your tools here
},
});
return result.toUIMessageStreamResponse({
generateMessageId: generateId,
originalMessages: messages,
onFinish: async ({ responseMessage }) =\> {
await upsertMessage({
chatId,
id: responseMessage.id,
message: responseMessage, // No conversion needed
});
},
});
}
`
```
### [Step 7: Complete the Switch](#step-7-complete-the-switch)
Once verification passes and you're confident in the migration:
1. **Remove conversion functions**: Delete the v4↔v5 conversion utilities
2. **Remove `ai-legacy` dependency**: Uninstall the v4 types package
3. **Test thoroughly**: Ensure your application works correctly with v5 schema
4. **Monitor**: Watch for issues in production
5. **Clean up**: After a safe period (1-2 weeks), drop the old table
```
`
-- After confirming everything works
DROP TABLE messages;
-- Optionally rename v5 table to standard name
ALTER TABLE messages\_v5 RENAME TO messages;
`
```
**Phase 2 is now complete.** Your application is fully migrated to v5 schema with no runtime conversion overhead.
## [Community Resources](#community-resources)
The following community members have shared their migration experiences:
* [AI SDK Migration: Handling Previously Saved Messages](https://jhakim.com/blog/ai-sdk-migration-handling-previously-saved-messages) - Detailed transformation function implementation
* [How we migrated Atypica.ai to AI SDK v5 without breaking 10M+ chat histories](https://blog.web3nomad.com/p/how-we-migrated-atypicaai-to-ai-sdk-v5-without-breaking-10m-chat-histories) - Runtime conversion approach for large-scale migration
For more API change details, see the [main migration guide](/docs/migration-guides/migration-guide-5-0).
On this page
[Migrate Your Data to AI SDK 5.0](#migrate-your-data-to-ai-sdk-50)
[Recommended Migration Process](#recommended-migration-process)
[Phase 1: Get Your App Working (Runtime Conversion)](#phase-1-get-your-app-working-runtime-conversion)
[Phase 2: Migrate to V5 Schema (Recommended)](#phase-2-migrate-to-v5-schema-recommended)
[Understanding the Changes](#understanding-the-changes)
[Phase 1: Runtime Conversion Pattern](#phase-1-runtime-conversion-pattern)
[Step 1: Update Dependencies](#step-1-update-dependencies)
[Step 2: Add Conversion Functions](#step-2-add-conversion-functions)
[Step 3: Convert Messages When Reading](#step-3-convert-messages-when-reading)
[Step 4: Convert Messages When Saving](#step-4-convert-messages-when-saving)
[Phase 2: Side-by-Side Schema Migration](#phase-2-side-by-side-schema-migration)
[Overview: Migration Strategy](#overview-migration-strategy)
[Step 1: Create V5 Schema Alongside V4](#step-1-create-v5-schema-alongside-v4)
[Step 2: Implement Dual-Write for New Messages](#step-2-implement-dual-write-for-new-messages)
[Step 3: Migrate Existing Messages](#step-3-migrate-existing-messages)
[Step 4: Verify Migration](#step-4-verify-migration)
[Step 5: Read from V5 Schema](#step-5-read-from-v5-schema)
[Step 6: Write to V5 Schema Only](#step-6-write-to-v5-schema-only)
[Step 7: Complete the Switch](#step-7-complete-the-switch)
[Community Resources](#community-resources)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)