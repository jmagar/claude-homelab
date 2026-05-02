Code Execution
[](https://vercel.com/oss)
Menu
[Code Execution](https://vercel.com/docs/vercel-sandbox)
[npm](https://www.npmjs.com/package/ai-sdk-tool-code-execution)[Learn More](https://vercel.com/docs/vercel-sandbox)
code-executionsandbox
Execute Python code in a sandboxed environment using Vercel Sandbox. Run calculations, data processing, and other computational tasks safely in an isolated environment with Python 3.13.
## Installation
pnpmnpmyarnbun
```
`
pnpm add ai-sdk-tool-code-execution
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
import { executeCode } from 'ai-sdk-tool-code-execution';
const { text } = await generateText({
model: 'openai/gpt-5.1-codex',
prompt: 'What is 5 + 5 minus 84 cubed?',
tools: {
executeCode: executeCode(),
},
stopWhen: stepCountIs(5),
});
console.log(text);
`
```