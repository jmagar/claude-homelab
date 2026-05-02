Exa
[](https://vercel.com/oss)
Menu
[Exa](https://exa.ai)
[npm](https://www.npmjs.com/package/@exalabs/ai-sdk)[Learn More](https://docs.exa.ai/reference/vercel)
searchwebextraction
Exa is a web search API that adds web search capabilities to your LLMs. Exa can search the web for code docs, current information, news, articles, and a lot more. Exa performs real-time web searches and can get page content from specific URLs. Add Exa web search tool to your LLMs in just a few lines of code.
## Installation
pnpmnpmyarnbun
```
`
pnpm add @exalabs/ai-sdk
`
```
## API Key
[Get API Key](https://dashboard.exa.ai/api-keys)
```
`
# Add to your .env file
EXA\_API\_KEY=your\_api\_key\_here
`
```
## Usage
```
`
import { generateText, stepCountIs } from 'ai';
import { webSearch } from '@exalabs/ai-sdk';
const { text } = await generateText({
model: 'google/gemini-3-pro-preview',
prompt: 'Tell me the latest developments in AI',
tools: {
webSearch: webSearch(),
},
stopWhen: stepCountIs(3),
});
console.log(text);
`
```