bash-tool
[](https://vercel.com/oss)
Menu
[bash-tool](https://github.com/vercel/bash-tool)
[npm](https://www.npmjs.com/package/bash-tool)[Learn More](https://github.com/vercel/bash-tool)
bashfile-systemsandboxcode-execution
Provides bash, readFile, and writeFile tools for AI agents. Supports @vercel/sandbox for full VM isolation.
## Installation
pnpmnpmyarnbun
```
`
pnpm install bash-tool
`
```
## Usage
```
`
import { generateText, stepCountIs } from 'ai';
import { createBashTool } from 'bash-tool';
const { tools } = await createBashTool({
files: { 'src/index.ts': "export const hello = 'world';" },
});
const { text } = await generateText({
model: 'anthropic/claude-sonnet-4',
prompt: 'List the files in src/ and show me the contents of index.ts',
tools,
stopWhen: stepCountIs(5),
});
console.log(text);
`
```