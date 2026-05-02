Guide to Using the Responses API's MCP Tool
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ Home ](/cookbook)
### Topics
* [ Agents ](/cookbook/topic/agents)
* [ Evals ](/cookbook/topic/evals)
* [ Multimodal ](/cookbook/topic/multimodal)
* [ Text ](/cookbook/topic/text)
* [ Guardrails ](/cookbook/topic/guardrails)
* [ Optimization ](/cookbook/topic/optimization)
* [ ChatGPT ](/cookbook/topic/chatgpt)
* [ Codex ](/cookbook/topic/codex)
* [ gpt-oss ](/cookbook/topic/gpt-oss)
### Contribute
* [ Cookbook on GitHub ](https://github.com/openai/openai-cookbook)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Copy Page
May 21, 2025
# Guide to Using the Responses API's MCP Tool
[ CJ ](https://www.linkedin.com/in/charu-j-8a866471)
[ Charu Jaiswal
(OpenAI)
](https://www.linkedin.com/in/charu-j-8a866471)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/mcp/mcp_tool_guide.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/mcp/mcp_tool_guide.ipynb)
Building agentic application often requires connecting to external services. Traditionally, this is done through function calling where every action makes a round-trip from the model to your backend, then to an external service, waits for a response, and finally returns the result to the model. This process introduces multiple network hops and significant latency, making it cumbersome to scale and manage.
The hosted Model Context Protocol (MCP) tool in the Responses API makes this easier. Instead of manually wiring each function call to specific services, you can configure your model once to point to an MCP server (or several!). That server acts as a centralized tool host, exposing standard commands like “search product catalog” or “add item to cart.” This allows for simpler orchestration and centralized management of tools. With MCP, the model interacts directly with the MCP server, reducing latency and eliminating backend coordination.
## Use cases simplified by the MCP tool
MCP significantly reduces the friction of building products that interact with external services, allowing you to tie different services together seamlessly. Here’s a sampler of use cases that once involved friction but are now much simpler since the model can communicate directly with remote MCP servers.
|**Domain**|**Use case unlocked by MCP tool**|**Previous friction**|
|**Commerce / payments**|- Add an item to a Shopify cart and hand back a checkout URL in one turn — `"Add the Allbirds Men’s Tree Dasher 2 in size 10"` → cart link
- Generate a Stripe payment link|Function calling meant you had to write a custom `cart\_add` or `create\_payment\_link` wrapper and host your own relay server.|
|**Dev-ops & code quality**|- Ask Sentry for the latest error in a particular file, then open a GitHub issue with a suggested fix in the same conversation|Chaining two different third-party APIs inside one assistive loop involved webhook glue and state juggling.|
|**Messaging / notifications**|- Grab the morning’s top soccer headlines via web-search and have Twilio text the summary to a phone number in a single call|Required stitching two tool calls in your backend and batching the final SMS payload yourself.|
## How the tool works
At a high level, here is how the MCP tool works:
1. Declare the server: When you add an MCP block to the `tools` array, the Responses API runtime first detects which transport the server speaks, either the newer “streamable HTTP” or the older HTTP-over-SSE variant, and uses that protocol for traffic.
2. Import the tool list: The runtime calls the server’s `tools/list`, passing any headers you provide (API key, OAuth token, etc.). It then writes the result to an `mcp\_list\_tools` item in the model’s context. While this item is present, the list won’t be fetched again. You can limit what the model sees using `allowed\_tools`.
OpenAI discards header values and all but the schema, domain, and subdomains of the MCP `server\_url` after each request. Authorization keys and the server URL must be included with every API call. These values won’t appear in response objects. Schemas use “strict” mode when possible, otherwise they’re loaded as-is.
3. Call and approve tools: Once the model knows the available actions, it can invoke one. Each invocation produces an `mcp\_tool\_call` item and by default the stream pauses for your explicit approval, but you can disable this once you trust the server.
After approval, the runtime executes the call, streams back the result, and the model decides whether to chain another tool or return a final answer.
## Best practices when building with MCP
MCP is still in its early stages, so here are best practices that can improve model performance and behavior as you build.
### Filter tools to avoid ballooning payloads
Remote servers often expose numerous tools without considering how models will interpret and use them. By default, this can result in dozens of endpoints being included, each accompanied by verbose definitions like names, descriptions, and JSON schemas that add hundreds of tokens to the model’s context and increase latency. Compounding this, many servers return entire data objects, such as full Stripe invoice records, even when only a few fields are relevant to the model’s task. To optimize for performance in production, use the `allowed\_tools` parameter in the Responses API to limit which tools are included from the server’s `mcp\_list\_tools`. This reduces token overhead, improves response time, and narrows the model’s decision space. You may also want to exclude certain tools altogether, such as those capable of write actions or those that have financial or security implications.
```
`curl https://api.openai.com/v1/responses -i \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"model": "gpt-4.1",
"tools": [
{
"type": "mcp",
"server\_label": "gitmcp",
"server\_url": "https://gitmcp.io/openai/tiktoken",
"allowed\_tools": ["search\_tiktoken\_documentation", "fetch\_tiktoken\_documentation"],
"require\_approval": "never"
}
],
"input": "how does tiktoken work?"
}'`
```
### Reduce latency and tokens via caching and reserve reasoning models for high complexity tasks
The first time the model connects to a server, a new item of the type `mcp\_list\_tools` is created for each MCP server you add. As long as this item is present in the model’s context, we will not call `tools/list` on the server again. This is akin to caching at the user-conversation level. If `mcp\_list\_tools` is not present, we import the list of tools from the MCP server again. Passing`previous\_response\_id` in subsequent API requests is one way of ensuring that the `mcp\_list\_tools` item is present in the model’s context on follow-up turns. Alternatively you can also pass in the items manually to new response. The other lever that will affect latency and the number of output tokens is whether you use a reasoning model, as reasoning models will produce far more output tokens, as well as reasoning tokens. Take for example the following two sample curls that compare the number of tokens produced with and without reasoning models:
Scenario 1: non-reasoning model
```
`curl https://api.openai.com/v1/responses \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"model": "gpt-4.1",
"tools": [
{
"type": "mcp",
"server\_label": "gitmcp",
"server\_url": "https://gitmcp.io/openai/tiktoken",
"require\_approval": "never"
}
],
"input": "how does tiktoken work?"
}'`
```
```
` "usage": {
"input\_tokens": 280,
"input\_tokens\_details": {
"cached\_tokens": 0
},
"output\_tokens": 665,
"output\_tokens\_details": {
"reasoning\_tokens": 0
},
"total\_tokens": 945
}`
```
Scenario 2: reasoning model without `previous\_response\_id`
```
`curl https://api.openai.com/v1/responses \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"model": "o4-mini",
"tools": [
{
"type": "mcp",
"server\_label": "gitmcp",
"server\_url": "https://gitmcp.io/openai/tiktoken",
"require\_approval": "never"
}
],
"input": "how does tiktoken work?",
"reasoning": {
"effort": "medium",
"summary": "auto"
}
}'`
```
```
` "usage": {
"input\_tokens": 36436,
"input\_tokens\_details": {
"cached\_tokens": 22964
},
"output\_tokens": 1586,
"output\_tokens\_details": {
"reasoning\_tokens": 576
},
"total\_tokens": 38022
}`
```
### Using MCP with other tools
The MCP tool is just another entry in the tools array, so the model can use it seamlessly with other hosted tools like `code\_interpreter`, `web\_search\_preview,` or `image\_generation`, and with any custom tools you define. You can also use multiple remote MCP servers together.
In this example, we’ll create an agent that is a pricing analyst for a fictional yoga attire store: it first pulls current competitor prices for women’s shorts, yoga pants, and tank tops from the Alo Yoga MCP server, then grabs the price for the same three categories from Uniqlo via the hosted web-search tool. Using Code Interpreter it analyzes last week’s sales from a CSV that was pre-loaded with the Files endpoint, in order to calculate per-item revenue and average order value. Then it measures each item’s price gap versus the newly fetched Uniqlo and Alo Yoga benchmarks. Any product priced 15 percent or more above or below market is flagged, and the agent delivers a concise text report summarizing the discrepancies and key revenue stats.
```
`system\_prompt= """You are a pricing analyst for my clothing company. Please use the MCP tool
to fetch prices from the Alo Yoga MCP server for the categories of women's
shorts, yoga pants, and tank tops. Use only the MCP server for Alo yoga data, don't search the web.
Next, use the web search tool to search for Uniqlo prices for women's shorts, yoga pants, and tank tops.
In each case for Alo Yoga and Uniqlo, extract the
price for the top result in each category. Also provide the full URLs
Using the uploaded CSV file of sales data from my store, and with the
code interpreter tool calculate revenue by product item, compute average order-value on a transaction level, and calculate the percentage price gap between the CSV data and Uniqlo/Alo Yoga prices.
Flag products priced 15% or more above or below the market.
Create and output a short report including the findings.
# Steps
1. \*\*Fetch Alo Yoga Prices:\*\*
- Use the Alo Yoga MCP server to fetch prices for the following products:
High-Waist Airlift Legging
Sway Bra Tank
5" Airlift Energy Short
- Ensure you find prices for each.
- Extract the price of the top result for each category.
- include URL links
2. \*\*Query Uniqlo Prices:\*\*
- Use the Web-Search tool to search non-sale prices for the following Uniqlo products:
Women's AIRism Soft Biker Shorts
Women's AIRism Soft Leggings
Women's AIRism Bra Sleeveless Top
- Ensure you find non-sale prices for each.
- Extract the price for the top result in each category.
- include URL links
3. \*\*Sales Data Analysis:\*\*
- Use the uploaded CSV sales data to calculate revenue across each
product item.
- Determine the average order-value on a transaction level.
- For each SKU, compute the percentage price gap between the
CSV data and Uniqlo/Alo Yoga prices.
- Flag products priced ≥ 15% above or below the market.
4. \*\*Report:\*\*
- Compile and output a report including the flagging results
# Output Format
- A short text report explaining:
- Any products that are priced ≥ 15% above or below the market,
with specific details. """`
```
Here’s a sample curl with a placeholder for the above system prompt.
```
`curl https://api.openai.com/v1/responses \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"model": "gpt-4.1",
"input": [
{
"role": "system",
"content": [
{
"type": "input\_text",
"text": "ABOVE\_SYSTEM\_PROMPT"
}
]
}
],
"tools": [
{
"type": "web\_search\_preview",
"user\_location": {
"type": "approximate",
"country": "US"
},
"search\_context\_size": "medium"
},
{
"type": "code\_interpreter",
"container": {
"type": "auto",
"file\_ids": [
"file-WTiyGcZySaU6n218gj4XxR"
]
}
},
{
"type": "mcp",
"server\_url": "https://www.aloyoga.com/api/mcp",
"server\_label": "aloyoga",
"allowed\_tools": [
"search\_shop\_catalog",
"get\_product\_details"
],
"require\_approval": "never"
}
],
"temperature": 1,
"max\_output\_tokens": 2048,
"top\_p": 1,
"store": true
}'`
```
The model is able to carry forward it’s results from the MCP tool and web search into the code interpreter steps to produce a report with the following content that is formatted for legibility:
#### **Pricing Comparison and Revenue Analysis Report**
**Your Store’s Sales & Price Analysis**
* **Revenue by Product:**
* Shorts: $6,060
* Tank tops: $6,150
* Yoga pants: $12,210
* **Average Order Value:** $872.14
* **Your Store’s Average Selling Price by Category:**
* Shorts: $60.00
* Tank tops: $75.00
* Yoga pants: $110.00
#### **Pricing Gaps vs Market**
|Category|Store Avg Price|vs Alo Yoga Gap (%)|Flagged (≥15%)|vs Uniqlo Gap (%)|Flagged (≥15%)|
|Shorts|$60.00|-31.8%|**YES**|+100.7%|**YES**|
|Tank tops|$75.00|-14.8%||+114.9%|**YES**|
|Yoga pants|$110.00|-14.1%||+267.9%|**YES**|
#### **Recommendations & Flags**
**Flagged products (≥15% price gap):**
* **Shorts:** Priced 31.8% below Alo Yoga, but 100.7% above Uniqlo.
* **Tank tops:** Priced over 114.9% above Uniqlo.
* **Yoga pants:** Priced 267.9% above Uniqlo.
Shorts are priced significantly below premium competitors (Alo Yoga), but far higher than budget alternatives (Uniqlo). If you want to compete in the premium segment, consider increasing your price. If you want to target budget buyers, a price decrease could be justifiable. Most of your tank tops and yoga pants are similarly positioned—much lower than Alo, but well above Uniqlo.
### Prompting guidelines to improve MCP tool calls
Depending on your use case you might find that the model invokes many MCP calls, for instance when using catalog-search tools. To avoid endless iterations over large product inventories it’s helpful to instruct the model to limit it’s search to N items and to offer to continue only when the user explicitly asks for more information. This keeps responses focused and snappy.
If the MCP servers you’re using include exhaustive `mcp\_list\_tools`, it’s also worth Including some targeted few-shot examples to show the model how to choose the correct server and to stop once it has what it needs, instead of issuing redundant calls.
Finally, adding guidance to remind the model that if essential information (size, color, product line, etc.) is missing from the user query, it should ask a follow-up question rather than launching a broad search. This small prompt nudge reduces unnecessary tool calls and improves answer quality. Here’s a sample prompt that shows how these guidelines come together:
```
`system\_prompt= """You are an AI assistant that can call the following MCP servers:
1. allbirds\_store
2. gitmcp
Steps
1. Use the MCP servers above to answer the user query, not every MCP server will relevant for a given query so you can choose which ones to invoke.
2. If the user’s request lacks essential details (size, color, etc.), ask a follow-up question first rather than guessing and using the MCP server tool prematurely.
3. If searching for products in a catalog, only return 4 results at a time before asking the user whether they want to see more.
### Few-shot examples
# EX1 — Direct product search, then fetch variant details
user: Do you have the Allbirds Tree Runner in men’s size 10?
assistant: {"name":"allbirds\_store.search\_shop\_catalog",
"arguments":{"query":"Tree Runner",
"context":"Men’s size 10 shoes"}}
# (assume the search returns product\_id "gid://shopify/Product/987")
assistant: {"name":"allbirds\_store.get\_product\_details",
"arguments":{"product\_id":"gid://shopify/Product/987",
"options":{"Size":"10"}}}
# EX2 — Clarify missing size, then two-step color variant lookup
user: I want the Tree Runner in blue.
assistant: Sure — what size do you need?
user: Size 10.
assistant: {"name":"allbirds\_store.search\_shop\_catalog",
"arguments":{"query":"Tree Runner",
"context":"Blue variant, size 10"}}
# (assume the search returns product\_id "gid://shopify/Product/987")
assistant: {"name":"allbirds\_store.get\_product\_details",
"arguments":{"product\_id":"gid://shopify/Product/987",
"options":{"Size":"10","Color":"Blue"}}}
# EX3 — Git docs: search then fetch specific file
user: Can you show me how tiktoken does byte-pair encoding?
assistant: {"name":"gitmcp.search\_website\_documentation",
"arguments":{"query":"tiktoken byte-pair encoding"}}
# (assume the search returns document\_id "docs/ENCODING.md")
assistant: {"name":"gitmcp.fetch\_website\_documentation",
"arguments":{"document\_id":"docs/ENCODING.md"}} """`
```
```
`curl https://api.openai.com/v1/responses \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"model": "gpt-4.1",
"input": [
{
"role": "system",
"content": [
{
"type": "input\_text",
"text": "ABOVE\_SYSTEM\_PROMPT"
}
]
},
{
"role": "user",
"content": [
{
"type": "input\_text",
"text": "find me womens tree loungers in size 8"
}
]
}
],
"tools": [
{
"type": "mcp",
"server\_url": "https://www.allbirds.com/api/mcp",
"server\_label": "allbirds",
"allowed\_tools": [
"search\_shop\_catalog",
"get\_cart",
"update\_cart",
"search\_shop\_policies\_and\_faqs",
"get\_product\_details"
],
"require\_approval": "never"
},
{
"type": "mcp",
"server\_label": "gitmcp",
"server\_url": "https://gitmcp.io/openai/tiktoken",
"allowed\_tools": [
"fetch\_tiktoken\_documentation",
"search\_tiktoken\_documentation",
"search\_tiktoken\_code",
"fetch\_generic\_url\_content"
],
"require\_approval": "never"
}
],
"temperature": 1,
"max\_output\_tokens": 2048
}'`
```
## Conclusion
The hosted MCP tool in the Responses API turns external-service access from a bespoke plumbing task into a first-class capability of the API. By connecting to a remote server, letting the runtime cache its tool list, and trimming that list with `allowed\_tools`, you eliminate the extra network hop, cut token overhead, and give the model a concise, discoverable action set. When combined with built-in tools such as `code\_interpreter`, `web\_search\_preview`, or `image\_gen`, MCP unlocks rich, multi-service workflows whether you’re analyzing sales data, triaging production errors, or automating checkout flows.