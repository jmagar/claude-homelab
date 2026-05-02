Perplexity Search
[](https://vercel.com/oss)
Menu
[Perplexity Search](https://www.perplexity.ai)
[npm](https://www.npmjs.com/package/@perplexity-ai/ai-sdk)[Learn More](https://docs.perplexity.ai/guides/search-quickstart)
searchweb
Search the web with real-time results and advanced filtering powered by Perplexity's Search API. Provides ranked search results with domain, language, date range, and recency filters. Supports multi-query searches and regional search results.
## Installation
pnpmnpmyarnbun
```
`
pnpm add @perplexity-ai/ai-sdk
`
```
## API Key
[Get API Key](https://www.perplexity.ai/account/api/keys)
```
`
# Add to your .env file
PERPLEXITY\_API\_KEY=your\_api\_key\_here
`
```
## Usage
```
`
import { generateText, stepCountIs } from 'ai';
import { perplexitySearch } from '@perplexity-ai/ai-sdk';
const { text } = await generateText({
model: 'openai/gpt-5.2',
prompt: 'What are the latest AI developments? Use search to find current information.',
tools: {
search: perplexitySearch(),
},
stopWhen: stepCountIs(3),
});
console.log(text);
`
```