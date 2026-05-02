Amazon Bedrock AgentCore
[](https://vercel.com/oss)
Menu
[Amazon Bedrock AgentCore](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/built-in-tools.html)
[npm](https://www.npmjs.com/package/bedrock-agentcore)[Learn More](https://github.com/aws/bedrock-agentcore-sdk-typescript)
code-executionbrowser-automationsandbox
Fully managed Browser and Code Interpreter tools for AI agents. Browser is a fast and secure cloud-based runtime for interacting with web applications, filling forms, navigating websites, and extracting information. Code Interpreter provides an isolated sandbox for executing Python, JavaScript, and TypeScript code to solve complex tasks.
## Installation
pnpmnpmyarnbun
```
`
pnpm add bedrock-agentcore
`
```
## API Key
[Get API Key](https://vercel.com/docs/oidc/aws)
```
`
# Add to your .env file
AWS\_ROLE\_ARN=your\_api\_key\_here
`
```
## Usage
```
`
import { generateText, stepCountIs } from 'ai';
import { bedrock } from '@ai-sdk/amazon-bedrock';
import { awsCredentialsProvider } from '@vercel/oidc-aws-credentials-provider';
import { CodeInterpreterTools } from 'bedrock-agentcore/code-interpreter/vercel-ai';
import { BrowserTools } from 'bedrock-agentcore/browser/vercel-ai';
const credentialsProvider = awsCredentialsProvider({
roleArn: process.env.AWS\_ROLE\_ARN!,
});
const codeInterpreter = new CodeInterpreterTools({ credentialsProvider });
const browser = new BrowserTools({ credentialsProvider });
try {
const { text } = await generateText({
model: bedrock('us.anthropic.claude-sonnet-4-20250514-v1:0'),
prompt: 'Go to https://news.ycombinator.com and get the first story title. Then use Python to reverse the string.',
tools: {
...codeInterpreter.tools,
...browser.tools,
},
stopWhen: stepCountIs(5),
});
console.log(text);
} finally {
await codeInterpreter.stopSession();
await browser.stopSession();
}
`
```