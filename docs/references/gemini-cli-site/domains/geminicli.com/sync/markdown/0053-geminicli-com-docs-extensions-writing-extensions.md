Build Gemini CLI extensions | Gemini CLI
[Skip to content](#_top)
# Build Gemini CLI extensions
Copy as Markdown Copied!
Gemini CLI extensions let you expand the capabilities of Gemini CLI by adding
custom tools, commands, and context. This guide walks you through creating your
first extension, from setting up a template to adding custom functionality and
linking it for local development.
## Prerequisites
[Section titled “Prerequisites”](#prerequisites)
Before you start, ensure you have Gemini CLI installed and a basic understanding
of Node.js.
## Extension features
[Section titled “Extension features”](#extension-features)
Extensions offer several ways to customize Gemini CLI. Use this table to decide
which features your extension needs.
|Feature|What it is|When to use it|Invoked by|
|**[MCP server](/docs/extensions/reference#mcp-servers)**|A standard way to expose new tools and data sources to the model.|Use this when you want the model to be able to *do* new things, like fetching data from an internal API, querying a database, or controlling a local application. We also support MCP resources (which can replace custom commands) and system instructions (which can replace custom context)|Model|
|**[Custom commands](/docs/cli/custom-commands)**|A shortcut (like `/my-cmd`) that executes a pre-defined prompt or shell command.|Use this for repetitive tasks or to save long, complex prompts that you use frequently. Great for automation.|User|
|**[Context file (`GEMINI.md`)](/docs/extensions/reference#contextfilename)**|A markdown file containing instructions that are loaded into the model’s context at the start of every session.|Use this to define the “personality” of your extension, set coding standards, or provide essential knowledge that the model should always have.|CLI provides to model|
|**[Agent skills](/docs/cli/skills)**|A specialized set of instructions and workflows that the model activates only when needed.|Use this for complex, occasional tasks (like “create a PR” or “audit security”) to avoid cluttering the main context window when the skill isn’t being used.|Model|
|**[Hooks](/docs/hooks)**|A way to intercept and customize the CLI’s behavior at specific lifecycle events (for example, before/after a tool call).|Use this when you want to automate actions based on what the model is doing, like validating tool arguments, logging activity, or modifying the model’s input/output.|CLI|
|**[Custom themes](/docs/extensions/reference#themes)**|A set of color definitions to personalize the CLI UI.|Use this to provide a unique visual identity for your extension or to offer specialized high-contrast or thematic color schemes.|User (via /theme)|
## Step 1: Create a new extension
[Section titled “Step 1: Create a new extension”](#step-1-create-a-new-extension)
The easiest way to start is by using a built-in template. We’ll use the
`mcp-server` example as our foundation.
Run the following command to create a new directory called `my-first-extension`
with the template files:
Terminal window
```
`
gemini extensions new my-first-extension mcp-server
`
```
This creates a directory with the following structure:
```
`
my-first-extension/
├── example.js
├── gemini-extension.json
└── package.json
`
```
## Step 2: Understand the extension files
[Section titled “Step 2: Understand the extension files”](#step-2-understand-the-extension-files)
Your new extension contains several key files that define its behavior.
### `gemini-extension.json`
[Section titled “gemini-extension.json”](#gemini-extensionjson)
The manifest file tells Gemini CLI how to load and use your extension.
```
`
{
"name": "mcp-server-example",
"version": "1.0.0",
"mcpServers": {
"nodeServer": {
"command": "node",
"args": ["${extensionPath}${/}example.js"],
"cwd": "${extensionPath}"
}
}
}
`
```
* `name`: The unique name for your extension.
* `version`: The version of your extension.
* `mcpServers`: Defines Model Context Protocol (MCP) servers to add new tools.
* `command`, `args`, `cwd`: Specify how to start your server. The
`${extensionPath}` variable is replaced with the absolute path to your
extension’s directory.
### `example.js`
[Section titled “example.js”](#examplejs)
This file contains the source code for your MCP server. It uses the
`@modelcontextprotocol/sdk` to define tools.
```
`
/\*\*
\* @license
\* Copyright 2025 Google LLC
\* SPDX-License-Identifier: Apache-2.0
\*/
import { McpServer } from '@modelcontextprotocol/sdk/server/mcp.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import { z } from 'zod';
const server = new McpServer({
name: 'prompt-server',
version: '1.0.0',
});
// Registers a new tool named 'fetch\_posts'
server.registerTool(
'fetch\_posts',
{
description: 'Fetches a list of posts from a public API.',
inputSchema: z.object({}).shape,
},
async () =\> {
const apiResponse = await fetch(
'https://jsonplaceholder.typicode.com/posts',
);
const posts = await apiResponse.json();
const response = { posts: posts.slice(0, 5) };
return {
content: [
{
type: 'text',
text: JSON.stringify(response),
},
],
};
},
);
const transport = new StdioServerTransport();
await server.connect(transport);
`
```
### `package.json`
[Section titled “package.json”](#packagejson)
The standard configuration file for a Node.js project. It defines dependencies
and scripts for your extension.
## Step 3: Add extension settings
[Section titled “Step 3: Add extension settings”](#step-3-add-extension-settings)
Some extensions need configuration, such as API keys or user preferences. Let’s
add a setting for an API key.
1. Open `gemini-extension.json`.
2. Add a `settings` array to the configuration:
```
`
{
"name": "mcp-server-example",
"version": "1.0.0",
"settings": [
{
"name": "API Key",
"description": "The API key for the service.",
"envVar": "MY\_SERVICE\_API\_KEY",
"sensitive": true
}
],
"mcpServers": {
// ...
}
}
`
```
When a user installs this extension, Gemini CLI will prompt them to enter the
“API Key”. The value will be stored securely in the system keychain (because
`sensitive` is true) and injected into the MCP server’s process as the
`MY\_SERVICE\_API\_KEY` environment variable.
## Step 4: Link your extension
[Section titled “Step 4: Link your extension”](#step-4-link-your-extension)
Link your extension to your Gemini CLI installation for local development.
1. **Install dependencies:**
Terminal window
```
`
cd my-first-extension
npm install
`
```
2. **Link the extension:**
The `link` command creates a symbolic link from Gemini CLI extensions
directory to your development directory. Changes you make are reflected
immediately.
Terminal window
```
`
gemini extensions link .
`
```
Restart your Gemini CLI session to use the new `fetch\_posts` tool. Test it by
asking: “fetch posts”.
## Step 5: Add a custom command
[Section titled “Step 5: Add a custom command”](#step-5-add-a-custom-command)
Custom commands create shortcuts for complex prompts.
1. Create a `commands` directory and a subdirectory for your command group:
**macOS/Linux**
Terminal window
```
`
mkdir -p commands/fs
`
```
**Windows (PowerShell)**
Terminal window
```
`
New-Item -ItemType Directory -Force -Path "commands\\fs"
`
```
2. Create a file named `commands/fs/grep-code.toml`:
```
`
prompt = """
Please summarize the findings for the pattern `{{args}}`.
Search Results:
!{grep -r {{args}} .}
"""
`
```
This command, `/fs:grep-code`, takes an argument, runs the `grep` shell
command, and pipes the results into a prompt for summarization.
After saving the file, restart Gemini CLI. Run `/fs:grep-code "some pattern"` to
use your new command.
## Step 6: Add a custom `GEMINI.md`
[Section titled “Step 6: Add a custom GEMINI.md”](#step-6-add-a-custom-geminimd)
Provide persistent context to the model by adding a `GEMINI.md` file to your
extension. This is useful for setting behavior or providing essential tool
information.
1. Create a file named `GEMINI.md` in the root of your extension directory:
```
`
# My First Extension Instructions
You are an expert developer assistant. When the user asks you to fetch
posts, use the `fetch\_posts` tool. Be concise in your responses.
`
```
2. Update your `gemini-extension.json` to load this file:
```
`
{
"name": "my-first-extension",
"version": "1.0.0",
"contextFileName": "GEMINI.md",
"mcpServers": {
"nodeServer": {
"command": "node",
"args": ["${extensionPath}${/}example.js"],
"cwd": "${extensionPath}"
}
}
}
`
```
Restart Gemini CLI. The model now has the context from your `GEMINI.md` file in
every session where the extension is active.
## (Optional) Step 7: Add an Agent Skill
[Section titled “(Optional) Step 7: Add an Agent Skill”](#optional-step-7-add-an-agent-skill)
[Agent Skills](/docs/cli/skills) bundle specialized expertise and workflows.
Skills are activated only when needed, which saves context tokens.
1. Create a `skills` directory and a subdirectory for your skill:
**macOS/Linux**
Terminal window
```
`
mkdir -p skills/security-audit
`
```
**Windows (PowerShell)**
Terminal window
```
`
New-Item -ItemType Directory -Force -Path "skills\\security-audit"
`
```
2. Create a `skills/security-audit/SKILL.md` file:
```
`
---
name: security-audit
description:
Expertise in auditing code for security vulnerabilities. Use when the user
asks to "check for security issues" or "audit" their changes.
---
# Security Auditor
You are an expert security researcher. When auditing code:
1. Look for common vulnerabilities (OWASP Top 10).
2. Check for hardcoded secrets or API keys.
3. Suggest remediation steps for any findings.
`
```
Gemini CLI automatically discovers skills bundled with your extension. The model
activates them when it identifies a relevant task.
## Step 8: Release your extension
[Section titled “Step 8: Release your extension”](#step-8-release-your-extension)
When your extension is ready, share it with others via a Git repository or
GitHub Releases. Refer to the [Extension Releasing Guide](/docs/extensions/releasing) for
detailed instructions and learn how to list your extension in the gallery.
## Next steps
[Section titled “Next steps”](#next-steps)
* [Extension reference](/docs/extensions/reference): Deeply understand the extension format,
commands, and configuration.
* [Best practices](/docs/extensions/best-practices): Learn strategies for building great
extensions.
Last updated: Apr 10, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.