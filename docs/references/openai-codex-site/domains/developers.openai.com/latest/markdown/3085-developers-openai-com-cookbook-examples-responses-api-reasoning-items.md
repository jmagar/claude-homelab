Better performance from reasoning models using the Responses API
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
May 11, 2025
# Better performance from reasoning models using the Responses API
[ BC ](https://www.linkedin.com/in/billchen99/)
[ Bill Chen
(OpenAI)
](https://www.linkedin.com/in/billchen99/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/responses_api/reasoning_items.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/responses_api/reasoning_items.ipynb)
## Better performance from reasoning models using the Responses API
### Overview
By leveraging the Responses API with OpenAI’s latest reasoning models, you can unlock higher intelligence, lower costs, and more efficient token usage in your applications. The API also enables access to reasoning summaries, supports features like hosted-tool use, and is designed to accommodate upcoming enhancements for even greater flexibility and performance.
We’ve recently released two new state-of-the-art reasoning models, o3 and o4-mini, that excel at combining reasoning capabilities with agentic tool use. What many folks don’t know is that you can improve their performance by fully leveraging our (relatively) new Responses API. This cookbook shows how to get the most out of these models and explores how reasoning and function calling work behind the scenes. By giving the model access to previous reasoning items, we can ensure it operates at maximum intelligence and lowest cost.
We introduced the Responses API with a separate [cookbook](https://cookbook.openai.com/examples/responses_api/responses_example) and [API reference](https://platform.openai.com/docs/api-reference/responses). The main takeaway: the Responses API is similar to the Completions API, but with improvements and added features. We’ve also rolled out encrypted content for Responses, making it even more useful for those who can’t use the API in a stateful way!
## How Reasoning Models work
Before we dive into how the Responses API can help, let’s quickly review how [reasoning models](https://platform.openai.com/docs/guides/reasoning?api-mode=responses) work. Models like o3 and o4-mini break problems down step by step, producing an internal chain of thought that encodes their reasoning. For safety, these reasoning tokens are only exposed to users in summarized form.
In a multistep conversation, the reasoning tokens are discarded after each turn while input and output tokens from each step are fed into the next
Diagram borrowed from our [doc](https://platform.openai.com/docs/guides/reasoning?api-mode=responses#how-reasoning-works)
Let us examine the response object being returned:
```
`from openai import OpenAI
import os
client = OpenAI(api\_key=os.getenv("OPENAI\_API\_KEY"))`
```
```
`response = client.responses.create(
model="o4-mini",
input="tell me a joke",
)`
```
```
`import json
print(json.dumps(response.model\_dump(), indent=2))`
```
```
`{
"id": "resp\_6820f382ee1c8191bc096bee70894d040ac5ba57aafcbac7",
"created\_at": 1746989954.0,
"error": null,
"incomplete\_details": null,
"instructions": null,
"metadata": {},
"model": "o4-mini-2025-04-16",
"object": "response",
"output": [
{
"id": "rs\_6820f383d7c08191846711c5df8233bc0ac5ba57aafcbac7",
"summary": [],
"type": "reasoning",
"status": null
},
{
"id": "msg\_6820f3854688819187769ff582b170a60ac5ba57aafcbac7",
"content": [
{
"annotations": [],
"text": "Why don\\u2019t scientists trust atoms? \\nBecause they make up everything!",
"type": "output\_text"
}
],
"role": "assistant",
"status": "completed",
"type": "message"
}
],
"parallel\_tool\_calls": true,
"temperature": 1.0,
"tool\_choice": "auto",
"tools": [],
"top\_p": 1.0,
"max\_output\_tokens": null,
"previous\_response\_id": null,
"reasoning": {
"effort": "medium",
"generate\_summary": null,
"summary": null
},
"status": "completed",
"text": {
"format": {
"type": "text"
}
},
"truncation": "disabled",
"usage": {
"input\_tokens": 10,
"input\_tokens\_details": {
"cached\_tokens": 0
},
"output\_tokens": 148,
"output\_tokens\_details": {
"reasoning\_tokens": 128
},
"total\_tokens": 158
},
"user": null,
"service\_tier": "default",
"store": true
}`
```
From the JSON dump of the response object, you can see that in addition to the `output\_text`, the model also produces a reasoning item. This item represents the model’s internal reasoning tokens and is exposed as an ID—here, for example, `rs\_6820f383d7c08191846711c5df8233bc0ac5ba57aafcbac7`. Because the Responses API is stateful, these reasoning tokens persist: just include their IDs in subsequent messages to give future responses access to the same reasoning items. If you use `previous\_response\_id` for multi-turn conversations, the model will automatically have access to all previously produced reasoning items.
You can also see how many reasoning tokens the model generated. For example, with 10 input tokens, the response included 148 output tokens—128 of which are reasoning tokens not shown in the final assistant message.
Wait—didn’t the diagram show that reasoning from previous turns is discarded? So why bother passing it back in later turns?
Great question! In typical multi-turn conversations, you don’t need to include reasoning items or tokens—the model is trained to produce the best output without them. However, things change when tool use is involved. If a turn includes a function call (which may require an extra round trip outside the API), you do need to include the reasoning items—either via `previous\_response\_id` or by explicitly adding the reasoning item to `input`. Let’s see how this works with a quick function-calling example.
```
`import requests
def get\_weather(latitude, longitude):
response = requests.get(f"https://api.open-meteo.com/v1/forecast?latitude={latitude}&longitude={longitude}&current=temperature\_2m,wind\_speed\_10m&hourly=temperature\_2m,relative\_humidity\_2m,wind\_speed\_10m")
data = response.json()
return data['current']['temperature\_2m']
tools = [{
"type": "function",
"name": "get\_weather",
"description": "Get current temperature for provided coordinates in celsius.",
"parameters": {
"type": "object",
"properties": {
"latitude": {"type": "number"},
"longitude": {"type": "number"}
},
"required": ["latitude", "longitude"],
"additionalProperties": False
},
"strict": True
}]
context = [{"role": "user", "content": "What's the weather like in Paris today?"}]
response = client.responses.create(
model="o4-mini",
input=context,
tools=tools,
)
response.output`
```
```
`[ResponseReasoningItem(id='rs\_68210c71a95c81919cc44afadb9d220400c77cc15fd2f785', summary=[], type='reasoning', status=None),
ResponseFunctionToolCall(arguments='{"latitude":48.8566,"longitude":2.3522}', call\_id='call\_9ylqPOZUyFEwhxvBwgpNDqPT', name='get\_weather', type='function\_call', id='fc\_68210c78357c8191977197499d5de6ca00c77cc15fd2f785', status='completed')]`
```
After some reasoning, the o4-mini model determines it needs more information and calls a function to get it. We can call the function and return its output to the model. Crucially, to maximize the model’s intelligence, we should include the reasoning item by simply adding all of the output back into the context for the next turn.
```
`context += response.output # Add the response to the context (including the reasoning item)
tool\_call = response.output[1]
args = json.loads(tool\_call.arguments)
# calling the function
result = get\_weather(args["latitude"], args["longitude"])
context.append({
"type": "function\_call\_output",
"call\_id": tool\_call.call\_id,
"output": str(result)
})
# we are calling the api again with the added function call output. Note that while this is another API call, we consider this as a single turn in the conversation.
response\_2 = client.responses.create(
model="o4-mini",
input=context,
tools=tools,
)
print(response\_2.output\_text)`
```
```
`The current temperature in Paris is 16.3°C. If you’d like more details—like humidity, wind speed, or a brief description of the sky—just let me know!`
```
While this toy example may not clearly show the benefits—since the model will likely perform well with or without the reasoning item—our own tests found otherwise. On a more rigorous benchmark like SWE-bench, including reasoning items led to about a **3% improvement** for the same prompt and setup.
## Caching
As shown above, reasoning models generate both reasoning tokens and completion tokens, which the API handles differently. This distinction affects how caching works and impacts both performance and latency. The following diagram illustrates these concepts:
In turn 2, any reasoning items from turn 1 are ignored and removed, since the model does not reuse reasoning items from previous turns. As a result, the fourth API call in the diagram cannot achieve a full cache hit, because those reasoning items are missing from the prompt. However, including them is harmless—the API will simply discard any reasoning items that aren’t relevant for the current turn. Keep in mind that caching only impacts prompts longer than 1024 tokens. In our tests, switching from the Completions API to the Responses API boosted cache utilization from 40% to 80%. Higher cache utilization leads to lower costs (for example, cached input tokens for `o4-mini` are 75% cheaper than uncached ones) and improved latency.
## Encrypted Reasoning Items
Some organizations—such as those with [Zero Data Retention (ZDR)](https://openai.com/enterprise-privacy/) requirements—cannot use the Responses API in a stateful way due to compliance or data retention policies. To support these cases, OpenAI offers [encrypted reasoning items](https://platform.openai.com/docs/guides/reasoning?api-mode=responses#encrypted-reasoning-items), allowing you to keep your workflow stateless while still benefiting from reasoning items.
To use encrypted reasoning items:
* Add `["reasoning.encrypted\_content"]` to the `include` field in your API call.
* The API will return an encrypted version of the reasoning tokens, which you can pass back in future requests just like regular reasoning items.
For ZDR organizations, OpenAI enforces `store=false` automatically. When a request includes `encrypted\_content`, it is decrypted in-memory (never written to disk), used for generating the next response, and then securely discarded. Any new reasoning tokens are immediately encrypted and returned to you, ensuring no intermediate state is ever persisted.
Here’s a quick code update to show how this works:
```
`context = [{"role": "user", "content": "What's the weather like in Paris today?"}]
response = client.responses.create(
model="o3",
input=context,
tools=tools,
store=False, #store=false, just like how ZDR is enforced
include=["reasoning.encrypted\_content"] # Encrypted chain of thought is passed back in the response
)`
```
```
`# take a look at the encrypted reasoning item
print(response.output[0])`
```
```
`ResponseReasoningItem(id='rs\_6821243503d481919e1b385c2a154d5103d2cbc5a14f3696', summary=[], type='reasoning', status=None, encrypted\_content='gAAAAABoISQ24OyVRYbkYfukdJoqdzWT-3uiErKInHDC-lgAaXeky44N77j7aibc2elHISjAvX7OmUwMU1r7NgaiHSVWL5BtWgXVBp4BMFkWZpXpZY7ff5pdPFnW3VieuF2cSo8Ay7tJ4aThGUnXkNM5QJqk6\_u5jwd-W9cTHjucw9ATGfGqD2qHrXyj6NEW9RmpWHV2SK41d5TpUYdN0xSuIUP98HBVZ2VGgD4MIocUm6Lx0xhRl9KUx19f7w4Sn7SCpKUQ0zwXze8UsQOVvv1HQxk\_yDosbIg1SylEj38H-DNLil6yUFlWI4vGWcPn1bALXphTR2EwYVR52nD1rCFEORUd7prS99i18MUMSAhghIVv9OrpbjmfxJh8bSQaHu1ZDTMWcfC58H3i8KnogmI7V\_h2TKAiLTgSQIkYRHnV3hz1XwaUqYAIhBvP6c5UxX-j\_tpYpB\_XCpD886L0XyJxCmfr9cwitipOhHr8zfLVwMI4ULu-P3ftw7QckIVzf71HFLNixrQlkdgTn-zM6aQl5BZcJgwwn3ylJ5ji4DQTS1H3AiTrFsEt4kyiBcE2d7tYA\_m3G8L-e4-TuTDdJZtLaz-q8J12onFaKknGSyU6px8Ki4IPqnWIJw8SaFMJ5fSUYJO\_\_myhp7lbbQwuOZHIQuvKutM-QUuR0cHus\_HtfWtZZksqvVCVNBYViBxD2\_KvKJvR-nN62zZ8sNiydIclt1yJfIMkiRErfRTzv92hQaUtdqz80UiW7FBcN2Lnzt8awXCz1pnGyWy\_hNQe8C7W35zRxJDwFdb-f3VpanJT0tNmU5bfEWSXcIVmiMZL1clwzVNryf9Gk482LaWPwhVYrhv2MkhKMPKdeAZWVhZbgm0eTT8a4DgbwcYRGhoXMGxrXWzOdvAY536DkrI\_0xsJk8-Szb5Y2EH0xPxN4-CdB\_fMPP60TPEQTOP1Qc64cJcQ9p2JE5Jfz59bubF\_QGajC9-FtHkD6Q5pT-6CbhuD6xrFJMgxQPcggSDaWL\_4260fZCdf6nzMlwPRD3wrfsxs6rFyd8pLC-2SOh9Iv297xAjes8xcnyqvMKSuCkjARr11gJCe0EXnx87NWt2rfW8ODUU0qFYbjFx8Rj9WJtnvQBNyqp7t5LLLf12S8pyyeKTv0ePqC3xDuWdFKmELDUZjarkkCyMHoO12EbXa6YCpY\_MpA01c2vV5plrcouVPSwRK0ahbPs0mQnQnDAkfi2XVS0Bzgk2GpNONGf7KWkzD7uTgDtg9UbWI0v\_-f-iiBM2kKDz\_dIb1opZfaxZEloyiQ2MnWQj2MRefL7WM\_0c3IyTAccICN-diGn2f1im82uL9maELcbYn')`
```
With `include=["reasoning.encrypted\_content"]` set, we now see an `encrypted\_content` field in the reasoning item being passed back. This encrypted content represents the model’s reasoning state, persisted entirely on the client side with OpenAI retaining no data. We can then pass this back just as we did with the reasoning item before.
```
`context += response.output # Add the response to the context (including the encrypted chain of thought)
tool\_call = response.output[1]
args = json.loads(tool\_call.arguments)
result = 20 #mocking the result of the function call
context.append({
"type": "function\_call\_output",
"call\_id": tool\_call.call\_id,
"output": str(result)
})
response\_2 = client.responses.create(
model="o3",
input=context,
tools=tools,
store=False,
include=["reasoning.encrypted\_content"]
)
print(response\_2.output\_text)`
```
```
`It’s currently about 20 °C in Paris.`
```
With a simple change to the `include` field, we can now pass back the encrypted reasoning item and use it to improve the model’s performance in intelligence, cost, and latency.
Now you should be fully equipped with the knowledge to fully utilize our latest reasoning models!
## Reasoning Summaries
Another useful feature in the Responses API is that it supports reasoning summaries. While we do not expose the raw chain of thought tokens, users can access their [summaries](https://platform.openai.com/docs/guides/reasoning?api-mode=responses#reasoning-summaries).
```
`# Make a hard call to o3 with reasoning summary included
response = client.responses.create(
model="o3",
input="What are the main differences between photosynthesis and cellular respiration?",
reasoning={"summary": "auto"},
)
# Extract the first reasoning summary text from the response object
first\_reasoning\_item = response.output[0] # Should be a ResponseReasoningItem
first\_summary\_text = first\_reasoning\_item.summary[0].text if first\_reasoning\_item.summary else None
print("First reasoning summary text:\\n", first\_summary\_text)`
```
```
`First reasoning summary text:
\*\*Analyzing biological processes\*\*
I think the user is looking for a clear explanation of the differences between certain processes. I should create a side-by-side comparison that lists out key elements like the formulas, energy flow, locations, reactants, products, organisms involved, electron carriers, and whether the processes are anabolic or catabolic. This structured approach will help in delivering a comprehensive answer. It’s crucial to cover all aspects to ensure the user understands the distinctions clearly.`
```
Reasoning summary text lets you give users a window into the model’s thought process. For example, during conversations with multiple function calls, users can see both which functions were called and the reasoning behind each call—without waiting for the final assistant message. This adds transparency and interactivity to your application’s user experience.
## Conclusion
By leveraging the OpenAI Responses API and the latest reasoning models, you can unlock higher intelligence, improved transparency, and greater efficiency in your applications. Whether you’re utilizing reasoning summaries, encrypted reasoning items for compliance, or optimizing for cost and latency, these tools empower you to build more robust and interactive AI experiences.
Happy building!