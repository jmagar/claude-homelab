Guides: Add Skills to Your Agent
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
# [Add Skills to Your Agent](#add-skills-to-your-agent)
In this guide, you will learn how to extend your agent with [Agent Skills](https://agentskills.io), a lightweight, open format for adding specialized knowledge and workflows that load at runtime from markdown files.
At its core, a skill is a folder containing a `SKILL.md` file with metadata and instructions that tell an agent how to perform a specific task.
```
`
my-skill/
├── SKILL.md # Required: instructions + metadata
├── scripts/ # Optional: executable code
├── references/ # Optional: documentation
└── assets/ # Optional: templates, resources
`
```
## [How Skills Work](#how-skills-work)
Skills use **progressive disclosure** to manage context efficiently:
1. **Discovery**: At startup, agents load only the name and description of each available skill (just enough to know when it might be relevant)
2. **Activation**: When a task matches a skill's description, the agent reads the full `SKILL.md` instructions into context
3. **Execution**: The agent follows the instructions, optionally loading referenced files or executing bundled code as needed
This approach keeps agents fast while giving them access to more context on demand.
## [The SKILL.md File](#the-skillmd-file)
Every skill starts with a `SKILL.md` file containing YAML frontmatter and Markdown instructions:
```
`
---
name: pdf-processing
description: Extract text and tables from PDF files, fill forms, merge documents.
---
# PDF Processing
## When to use this skill
Use this skill when the user needs to work with PDF files...
## How to extract text
1. Use pdfplumber for text extraction...
## How to fill forms
...
`
```
The frontmatter requires:
* `name`: A short identifier
* `description`: Instructions for when to use this skill
The Markdown body contains the actual skill content with no restrictions on structure or content.
## [Prerequisites](#prerequisites)
To support skills, your agent needs:
1. **Filesystem access** to discover and load skill files (read files, read directories)
2. **A load skill tool** that reads the `SKILL.md` content into context
3. **Command execution** (optional) if skills bundle scripts (e.g. a full sandbox environment)
## [Step 1: Define a Sandbox Abstraction](#step-1-define-a-sandbox-abstraction)
This guide uses a generic sandbox abstraction for flexibility across
environments. If you're building for Node.js, you can use `fs/promises` and
`child\_process` directly instead.
Create a generic sandbox interface that provides a consistent way to interact with the filesystem. This abstraction lets you implement it differently depending on your environment (Node.js fs, a containerized sandbox, cloud storage, etc.):
```
`
interface Sandbox {
readFile(path: string, encoding: 'utf-8'): Promise\<string\>;
readdir(
path: string,
opts: { withFileTypes: true },
): Promise\<{ name: string; isDirectory(): boolean }[]\>;
exec(command: string): Promise\<{ stdout: string; stderr: string }\>;
}
`
```
## [Step 2: Discover Skills at Startup](#step-2-discover-skills-at-startup)
Scan skill directories and extract metadata from each `SKILL.md`:
```
`
interface SkillMetadata {
name: string;
description: string;
path: string;
}
async function discoverSkills(
sandbox: Sandbox,
directories: string[],
): Promise\<SkillMetadata[]\> {
const skills: SkillMetadata[] = [];
const seenNames = new Set\<string\>();
for (const dir of directories) {
let entries;
try {
entries = await sandbox.readdir(dir, { withFileTypes: true });
} catch {
continue; // Skip directories that don't exist
}
for (const entry of entries) {
if (!entry.isDirectory()) continue;
const skillDir = `${dir}/${entry.name}`;
const skillFile = `${skillDir}/SKILL.md`;
try {
const content = await sandbox.readFile(skillFile, 'utf-8');
const frontmatter = parseFrontmatter(content);
// First skill with a given name wins (allows project overrides)
if (seenNames.has(frontmatter.name)) continue;
seenNames.add(frontmatter.name);
skills.push({
name: frontmatter.name,
description: frontmatter.description,
path: skillDir,
});
} catch {
continue; // Skip skills without valid SKILL.md
}
}
}
return skills;
}
function parseFrontmatter(content: string) {
const match = content.match(/^---\\r?\\n([\\s\\S]\*?)\\r?\\n---/);
if (!match?.[1]) throw new Error('No frontmatter found');
// Parse YAML using your preferred library
return yaml.parse(match[1]);
}
`
```
## [Step 3: Build the System Prompt](#step-3-build-the-system-prompt)
Include discovered skills in the system prompt so the agent knows what's available:
```
`
function buildSkillsPrompt(skills: SkillMetadata[]): string {
const skillsList = skills
.map(s =\> `- ${s.name}: ${s.description}`)
.join('\\n');
return `
## Skills
Use the \\`loadSkill\\` tool to load a skill when the user's request
would benefit from specialized instructions.
Available skills:
${skillsList}
`;
}
`
```
The agent sees only names and descriptions. Full instructions stay out of the context window until loaded.
## [Step 4: Create the Load Skill Tool](#step-4-create-the-load-skill-tool)
The load skill tool reads the full `SKILL.md` and returns the body (without frontmatter):
```
`
function stripFrontmatter(content: string): string {
const match = content.match(/^---\\r?\\n[\\s\\S]\*?\\r?\\n---\\r?\\n?/);
return match ? content.slice(match[0].length).trim() : content.trim();
}
const loadSkillTool = tool({
description: 'Load a skill to get specialized instructions',
inputSchema: z.object({
name: z.string().describe('The skill name to load'),
}),
execute: async ({ name }, { experimental\_context }) =\> {
const { sandbox, skills } = experimental\_context as {
sandbox: Sandbox;
skills: SkillMetadata[];
};
const skill = skills.find(s =\> s.name.toLowerCase() === name.toLowerCase());
if (!skill) {
return { error: `Skill '${name}' not found` };
}
const skillFile = `${skill.path}/SKILL.md`;
const content = await sandbox.readFile(skillFile, 'utf-8');
const body = stripFrontmatter(content);
return {
skillDirectory: skill.path,
content: body,
};
},
});
`
```
The tool returns the skill directory path alongside the content so the agent can construct full paths to bundled resources.
## [Step 5: Create the Agent](#step-5-create-the-agent)
Wire up the sandbox and skills using `callOptionsSchema` and `prepareCall`:
```
`
const callOptionsSchema = z.object({
sandbox: z.custom\<Sandbox\>(),
skills: z.array(
z.object({
name: z.string(),
description: z.string(),
path: z.string(),
}),
),
});
const readFileTool = tool({
description: 'Read a file from the filesystem',
inputSchema: z.object({ path: z.string() }),
execute: async ({ path }, { experimental\_context }) =\> {
const { sandbox } = experimental\_context as { sandbox: Sandbox };
return sandbox.readFile(path, 'utf-8');
},
});
const bashTool = tool({
description: 'Execute a bash command',
inputSchema: z.object({ command: z.string() }),
execute: async ({ command }, { experimental\_context }) =\> {
const { sandbox } = experimental\_context as { sandbox: Sandbox };
return sandbox.exec(command);
},
});
const agent = new ToolLoopAgent({
model: yourModel,
tools: {
loadSkill: loadSkillTool,
readFile: readFileTool,
bash: bashTool,
},
callOptionsSchema,
prepareCall: ({ options, ...settings }) =\> ({
...settings,
instructions: `${settings.instructions}\\n\\n${buildSkillsPrompt(options.skills)}`,
experimental\_context: {
sandbox: options.sandbox,
skills: options.skills,
},
}),
});
`
```
## [Step 6: Run the Agent](#step-6-run-the-agent)
```
`
// Create sandbox (your filesystem/execution abstraction)
const sandbox = createSandbox({ workingDirectory: process.cwd() });
// Discover skills at startup
const skills = await discoverSkills(sandbox, [
'.agents/skills',
'\~/.config/agent/skills',
]);
// Run the agent
const result = await agent.run({
prompt: userMessage,
options: { sandbox, skills },
});
`
```
When a user asks something that matches a skill description, the agent calls `loadSkill`. The full instructions load into context, and the agent follows them using `bash` and `readFile` to access bundled resources.
## [Accessing Bundled Resources](#accessing-bundled-resources)
Skills can reference files relative to their directory. The agent uses existing tools to access them:
```
`
Skill directory: /path/to/.agents/skills/my-skill
# My Skill Instructions
Read the configuration template:
templates/config.json
Run the setup script:
bash scripts/setup.sh
`
```
The agent sees the skill directory path in the tool result and prepends it when accessing `templates/config.json` or `scripts/setup.sh`. No special resource loading mechanism is needed—the agent uses the same tools it uses for everything else.
## [Learn More](#learn-more)
* [Agent Skills specification](https://agentskills.io/specification) for the full format details
* [Example skills](https://github.com/anthropics/skills) on GitHub
* [Authoring best practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices) for writing effective skills
* [Reference library](https://github.com/agentskills/agentskills/tree/main/skills-ref) to validate skills and generate prompt XML
* [skills.sh](https://skills.sh) to browse and discover community skills
On this page
[Add Skills to Your Agent](#add-skills-to-your-agent)
[How Skills Work](#how-skills-work)
[The SKILL.md File](#the-skillmd-file)
[PDF Processing](#pdf-processing)
[When to use this skill](#when-to-use-this-skill)
[How to extract text](#how-to-extract-text)
[How to fill forms](#how-to-fill-forms)
[Prerequisites](#prerequisites)
[Step 1: Define a Sandbox Abstraction](#step-1-define-a-sandbox-abstraction)
[Step 2: Discover Skills at Startup](#step-2-discover-skills-at-startup)
[Step 3: Build the System Prompt](#step-3-build-the-system-prompt)
[Skills](#skills)
[Step 4: Create the Load Skill Tool](#step-4-create-the-load-skill-tool)
[Step 5: Create the Agent](#step-5-create-the-agent)
[Step 6: Run the Agent](#step-6-run-the-agent)
[Accessing Bundled Resources](#accessing-bundled-resources)
[My Skill Instructions](#my-skill-instructions)
[Learn More](#learn-more)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)