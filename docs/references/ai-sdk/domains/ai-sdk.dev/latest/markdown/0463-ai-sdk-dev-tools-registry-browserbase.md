Browserbase
[](https://vercel.com/oss)
Menu
[Browserbase](https://www.browserbase.com)
[npm](https://www.npmjs.com/package/@browserbasehq/ai-sdk)[Learn More](https://docs.browserbase.com)
browserbrowser-automationwebextraction
Browserbase provides browser automation tools for AI agents powered by Stagehand. Navigate websites, take screenshots, click buttons, fill forms, extract structured data, and execute multi-step browser tasks in cloud-hosted sessions with built-in CAPTCHA solving and anti-bot stealth mode.
## Installation
pnpmnpmyarnbun
```
`
pnpm add @browserbasehq/ai-sdk
`
```
## API Key
[Get API Key](https://www.browserbase.com/settings)
```
`
# Add to your .env file
BROWSERBASE\_API\_KEY=your\_api\_key\_here
`
```
## Usage
```
`
import { generateText, stepCountIs } from 'ai';
import { createBrowserbaseTools } from '@browserbasehq/ai-sdk';
const browserbase = createBrowserbaseTools();
const { text } = await generateText({
model: 'google/gemini-3-pro-preview',
tools: browserbase.tools,
stopWhen: stepCountIs(10),
prompt: 'Open https://news.ycombinator.com and summarize the top 3 stories.',
});
console.log(text);
await browserbase.closeSession();
`
```