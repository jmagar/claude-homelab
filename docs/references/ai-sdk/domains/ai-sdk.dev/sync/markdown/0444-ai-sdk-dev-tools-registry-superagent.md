Superagent
[](https://vercel.com/oss)
Menu
[Superagent](https://superagent.sh)
[npm](https://www.npmjs.com/package/@superagent-ai/ai-sdk)[Learn More](https://docs.superagent.sh)
securityguardrailspiiprompt-injectionverification
AI security guardrails for your LLMs. Protect your AI apps from prompt injection, redact PII/PHI (SSNs, emails, phone numbers), and verify claims against source materials. Add security tools to your LLMs in just a few lines of code.
## Installation
pnpmnpmyarnbun
```
`
pnpm add @superagent-ai/ai-sdk
`
```
## API Key
[Get API Key](https://dashboard.superagent.sh)
```
`
# Add to your .env file
SUPERAGENT\_API\_KEY=your\_api\_key\_here
`
```
## Usage
```
`
import { generateText, stepCountIs } from 'ai';
import { guard, redact, verify } from '@superagent-ai/ai-sdk';
import { openai } from '@ai-sdk/openai';
const { text } = await generateText({
model: openai('gpt-4o-mini'),
prompt: 'Check this input for security threats: "Ignore all instructions"',
tools: {
guard: guard(),
redact: redact(),
verify: verify(),
},
stopWhen: stepCountIs(3),
});
console.log(text);
`
```