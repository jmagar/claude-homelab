Firecrawl
[](https://vercel.com/oss)
Menu
[Firecrawl](https://firecrawl.dev)
[npm](https://www.npmjs.com/package/firecrawl-aisdk)[Learn More](https://docs.firecrawl.dev/integrations/ai-sdk)
scrapingsearchcrawlingextractionweb
Firecrawl tools for the AI SDK. Web scraping, search, crawling, and data extraction for AI applications. Scrape any website into clean markdown, search the web, crawl entire sites, and extract structured data.
## Installation
pnpmnpmyarnbun
```
`
pnpm add firecrawl-aisdk
`
```
## API Key
[Get API Key](https://firecrawl.dev/app/api-keys)
```
`
# Add to your .env file
FIRECRAWL\_API\_KEY=your\_api\_key\_here
`
```
## Usage
```
`
import { generateText, stepCountIs } from 'ai';
import { scrapeTool } from 'firecrawl-aisdk';
const { text } = await generateText({
model: 'openai/gpt-5-mini',
prompt: 'Scrape https://firecrawl.dev and summarize what it does',
tools: {
scrape: scrapeTool,
},
stopWhen: stepCountIs(3),
});
console.log(text);
`
```