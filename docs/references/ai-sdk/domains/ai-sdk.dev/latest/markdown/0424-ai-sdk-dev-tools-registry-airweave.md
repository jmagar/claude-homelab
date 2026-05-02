Airweave
[](https://vercel.com/oss)
Menu
[Airweave](https://airweave.ai)
[npm](https://www.npmjs.com/package/@airweave/vercel-ai-sdk)[Learn More](https://docs.airweave.ai)
searchragdata-sourcessemantic-search
Airweave is an open-source platform that makes any app searchable for your agent. Sync and search across 35+ data sources (Notion, Slack, Google Drive, databases, and more) with semantic search. Add unified search across all your connected data to your AI applications in just a few lines of code.
## Installation
pnpmnpmyarnbun
```
`
pnpm install @airweave/vercel-ai-sdk
`
```
## API Key
[Get API Key](https://app.airweave.ai/settings/api-keys)
```
`
# Add to your .env file
AIRWEAVE\_API\_KEY=your\_api\_key\_here
`
```
## Usage
```
`
import { generateText, stepCountIs } from 'ai';
import { airweaveSearch } from '@airweave/vercel-ai-sdk';
const { text } = await generateText({
model: 'anthropic/claude-sonnet-4.5',
prompt: 'What were the key decisions from last week?',
tools: {
search: airweaveSearch({
defaultCollection: 'my-knowledge-base',
}),
},
stopWhen: stepCountIs(3),
});
console.log(text);
`
```