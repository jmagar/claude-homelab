Parallel
[](https://vercel.com/oss)
Menu
[Parallel](https://parallel.ai)
[npm](https://www.npmjs.com/package/@parallel-web/ai-sdk-tools)
searchwebextraction
Parallel gives AI agents best-in-class tools to search and extract context from the web. Web results returned by Parallel are compressed for optimal token efficiency at inference time.
## Installation
pnpmnpmyarnbun
```
`
pnpm add @parallel-web/ai-sdk-tools
`
```
## API Key
[Get API Key](https://platform.parallel.ai)
```
`
# Add to your .env file
PARALLEL\_API\_KEY=your\_api\_key\_here
`
```
## Usage
```
`
import { generateText, stepCountIs } from 'ai';
import { searchTool, extractTool } from '@parallel-web/ai-sdk-tools';
const { text } = await generateText({
model: 'google/gemini-3-pro-preview',
prompt: 'When was Vercel Ship AI?',
tools: {
webSearch: searchTool,
webExtract: extractTool,
},
stopWhen: stepCountIs(3),
});
console.log(text);
`
```