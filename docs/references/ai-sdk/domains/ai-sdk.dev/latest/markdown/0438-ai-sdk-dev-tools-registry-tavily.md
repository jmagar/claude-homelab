Tavily
[](https://vercel.com/oss)
Menu
[Tavily](https://tavily.com)
[npm](https://www.npmjs.com/package/@tavily/ai-sdk)[Learn More](https://docs.tavily.com/documentation/integrations/vercel)
searchextractcrawl
Tavily is a web intelligence platform offering real-time web search optimized for AI applications. Tavily provides comprehensive web research capabilities including search, content extraction, website crawling, and site mapping to power AI agents with current information.
## Installation
pnpmnpmyarnbun
```
`
pnpm add @tavily/ai-sdk
`
```
## API Key
[Get API Key](https://app.tavily.com/home)
```
`
# Add to your .env file
TAVILY\_API\_KEY=your\_api\_key\_here
`
```
## Usage
```
`
import { generateText, stepCountIs } from 'ai';
import { tavilySearch } from '@tavily/ai-sdk';
const { text } = await generateText({
model: 'google/gemini-3-pro-preview',
prompt: 'What are the latest developments in agentic search?',
tools: {
webSearch: tavilySearch,
},
stopWhen: stepCountIs(3),
});
console.log(text);
`
```