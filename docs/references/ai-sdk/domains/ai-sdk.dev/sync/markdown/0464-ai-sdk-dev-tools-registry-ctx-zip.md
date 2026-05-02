ctx-zip
[](https://vercel.com/oss)
Menu
[ctx-zip](https://github.com/karthikscale3/ctx-zip/blob/main/README.md)
[npm](https://www.npmjs.com/package/ctx-zip)[Learn More](https://github.com/karthikscale3/ctx-zip/blob/main/README.md)
code-executionsandboxmcpcode-mode
Transform MCP tools and AI SDK tools into code, write it to a Vercel sandbox file system and have the agent import the tools, write code, and execute it.
## Installation
pnpmnpmyarnbun
```
`
pnpm add ctx-zip
`
```
## API Key
[Get API Key](https://vercel.com/docs/vercel-sandbox#authentication)
```
`
# Add to your .env file
VERCEL\_OIDC\_TOKEN=your\_api\_key\_here
`
```
## Usage
```
`
import { generateText, stepCountIs } from 'ai';
import { createVercelSandboxCodeMode, SANDBOX\_SYSTEM\_PROMPT } from 'ctx-zip';
const { tools } = await createVercelSandboxCodeMode({
servers: [
{
name: 'vercel',
url: 'https://mcp.vercel.com',
useSSE: false,
headers: {
Authorization: `Bearer ${process.env.VERCEL\_API\_KEY}`,
},
},
],
standardTools: {
weather: weatherTool,
},
});
const { text } = await generateText({
model: 'openai/gpt-5.2',
tools,
stopWhen: stepCountIs(20),
system: SANDBOX\_SYSTEM\_PROMPT,
messages: [
{
role: 'user',
content: 'What tools are available from the Vercel MCP server?',
},
],
});
console.log(text);
`
```