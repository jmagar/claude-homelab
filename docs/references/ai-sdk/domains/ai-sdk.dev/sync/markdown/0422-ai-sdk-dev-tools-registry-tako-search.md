Tako Search
[](https://vercel.com/oss)
Menu
[Tako Search](https://tako.com)
[npm](https://www.npmjs.com/package/@takoviz/ai-sdk)[Learn More](https://github.com/TakoData/ai-sdk#readme)
searchdatavisualizationanalytics
Search Tako's knowledge base for data visualizations, insights, and well-sourced information with charts and analytics.
## Installation
pnpmnpmyarnbun
```
`
pnpm install @takoviz/ai-sdk
`
```
## API Key
[Get API Key](https://tako.com)
```
`
# Add to your .env file
TAKO\_API\_KEY=your\_api\_key\_here
`
```
## Usage
```
`
import { takoSearch } from '@takoviz/ai-sdk';
import { generateText, stepCountIs } from 'ai';
const { text } = await generateText({
model: 'openai/gpt-5.2',
prompt: 'What is the stock price of Nvidia?',
tools: {
takoSearch: takoSearch(),
},
stopWhen: stepCountIs(5),
});
console.log(text);
`
```