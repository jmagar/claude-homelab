Valyu
[](https://vercel.com/oss)
Menu
[Valyu](https://valyu.ai)
[npm](https://www.npmjs.com/package/@valyu/ai-sdk)[Learn More](https://docs.valyu.ai/integrations/vercel-ai-sdk)
searchwebdomain-search
Valyu provides powerful search tools for AI agents. Web search for real-time information, plus specialized domain-specific searchtools: financeSearch (stock prices, earnings, income statements, cash flows, etc), paperSearch (full-text PubMed, arXiv, bioRxiv, medRxiv), bioSearch (clinical trials, FDA drug labels, PubMed, medRxiv, bioRxiv), patentSearch (USPTO patents), secSearch (10-k/10-Q/8-k), economicsSearch (BLS, FRED, World Bank data), and companyResearch (comprehensive company research reports).
## Installation
pnpmnpmyarnbun
```
`
pnpm add @valyu/ai-sdk
`
```
## API Key
[Get API Key](https://platform.valyu.ai)
```
`
# Add to your .env file
VALYU\_API\_KEY=your\_api\_key\_here
`
```
## Usage
```
`
import { generateText, stepCountIs } from 'ai';
import { webSearch } from '@valyu/ai-sdk';
// Available specialised search tools: financeSearch, paperSearch,
// bioSearch, patentSearch, secSearch, economicsSearch, companyResearch
const { text } = await generateText({
model: 'google/gemini-3-pro-preview',
prompt: 'Latest data center projects for AI inference?',
tools: {
webSearch: webSearch(),
},
stopWhen: stepCountIs(3),
});
console.log(text);
`
```