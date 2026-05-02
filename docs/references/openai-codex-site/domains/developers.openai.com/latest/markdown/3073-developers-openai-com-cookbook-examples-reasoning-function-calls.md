Handling Function Calls with Reasoning Models
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
Apr 25, 2025
# Handling Function Calls with Reasoning Models
[ TP ](https://www.linkedin.com/in/tom-pakeman/)
[ Tom Pakeman ](https://www.linkedin.com/in/tom-pakeman/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/reasoning_function_calls.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/reasoning_function_calls.ipynb)
OpenAI now offers function calling using [reasoning models](https://platform.openai.com/docs/guides/reasoning?api-mode=responses). Reasoning models are trained to follow logical chains of thought, making them better suited for complex or multi-step tasks.
>
*> Reasoning models like o3 and o4-mini are LLMs trained with reinforcement learning to perform reasoning. Reasoning models think before they answer, producing a long internal chain of thought before responding to the user. Reasoning models excel in complex problem solving, coding, scientific reasoning, and multi-step planning for agentic workflows. They’re also the best models for Codex CLI, our lightweight coding agent.
*
>
For the most part, using these models via the API is very simple and comparable to using familiar ‘chat’ models.
However, there are some nuances to bear in mind, particularly when it comes to using features such as function calling.
All examples in this notebook use the newer [Responses API](https://community.openai.com/t/introducing-the-responses-api/1140929) which provides convenient abstractions for managing conversation state. However the principles here are relevant when using the older chat completions API.
## Making API calls to reasoning models
```
`# pip install openai
# Import libraries
import json
from openai import OpenAI
from uuid import uuid4
from typing import Callable
client = OpenAI()
MODEL\_DEFAULTS = {
"model": "o4-mini", # 200,000 token context window
"reasoning": {"effort": "low", "summary": "auto"}, # Automatically summarise the reasoning process. Can also choose "detailed" or "none"
}`
```
Let’s make a simple call to a reasoning model using the Responses API.
We specify a low reasoning effort and retrieve the response with the helpful `output\_text` attribute.
We can ask follow up questions and use the `previous\_response\_id` to let OpenAI manage the conversation history automatically
```
`response = client.responses.create(
input="Which of the last four Olympic host cities has the highest average temperature?",
\*\*MODEL\_DEFAULTS
)
print(response.output\_text)
response = client.responses.create(
input="what about the lowest?",
previous\_response\_id=response.id,
\*\*MODEL\_DEFAULTS
)
print(response.output\_text)`
```
```
`Among the last four Summer Olympic host cities—Tokyo (2020), Rio de Janeiro (2016), London (2012) and Beijing (2008)—Rio de Janeiro has by far the warmest climate. Average annual temperatures are roughly:
• Rio de Janeiro: ≈ 23 °C
• Tokyo: ≈ 16 °C
• Beijing: ≈ 13 °C
• London: ≈ 11 °C
So Rio de Janeiro has the highest average temperature.
Among those four, London has the lowest average annual temperature, at about 11 °C.`
```
Nice and easy!
We’re asking relatively complex questions that may require the model to reason out a plan and proceed through it in steps, but this reasoning is hidden from us - we simply wait a little longer before being shown the response.
However, if we inspect the output we can see that the model has made use of a hidden set of ‘reasoning’ tokens that were included in the model context window, but not exposed to us as end users.
We can see these tokens and a summary of the reasoning (but not the literal tokens used) in the response.
```
`print(next(rx for rx in response.output if rx.type == 'reasoning').summary[0].text)
response.usage.to\_dict()`
```
```
`\*\*Determining lowest temperatures\*\*
The user is asking about the lowest average temperatures of the last four Olympic host cities: Tokyo, Rio, London, and Beijing. I see London has the lowest average temperature at around 11°C. If I double-check the annual averages: Rio is about 23°C, Tokyo is around 16°C, and Beijing is approximately 13°C. So, my final answer is London with an average of roughly 11°C. I could provide those approximate values clearly for the user.`
```
```
`{'input\_tokens': 136,
'input\_tokens\_details': {'cached\_tokens': 0},
'output\_tokens': 89,
'output\_tokens\_details': {'reasoning\_tokens': 64},
'total\_tokens': 225}`
```
It is important to know about these reasoning tokens, because it means we will consume our available context window more quickly than with traditional chat models.
## Calling custom functions
What happens if we ask the model a complex request that also requires the use of custom tools?
* Let’s imagine we have more questions about Olympic Cities, but we also have an internal database that contains IDs for each city.
* It’s possible that the model will need to invoke our tool partway through its reasoning process before returning a result.
* Let’s make a function that produces a random UUID and ask the model to reason about these UUIDs.
```
`
def get\_city\_uuid(city: str) -\> str:
"""Just a fake tool to return a fake UUID"""
uuid = str(uuid4())
return f"{city} ID: {uuid}"
# The tool schema that we will pass to the model
tools = [
{
"type": "function",
"name": "get\_city\_uuid",
"description": "Retrieve the internal ID for a city from the internal database. Only invoke this function if the user needs to know the internal ID for a city.",
"parameters": {
"type": "object",
"properties": {
"city": {"type": "string", "description": "The name of the city to get information about"}
},
"required": ["city"]
}
}
]
# This is a general practice - we need a mapping of the tool names we tell the model about, and the functions that implement them.
tool\_mapping = {
"get\_city\_uuid": get\_city\_uuid
}
# Let's add this to our defaults so we don't have to pass it every time
MODEL\_DEFAULTS["tools"] = tools
response = client.responses.create(
input="What's the internal ID for the lowest-temperature city?",
previous\_response\_id=response.id,
\*\*MODEL\_DEFAULTS)
print(response.output\_text)`
```
We didn’t get an `output\_text` this time. Let’s look at the response output
```
`response.output`
```
```
`[ResponseReasoningItem(id='rs\_68246219e8288191af051173b1d53b3f0c4fbdb0d4a46f3c', summary=[], type='reasoning', status=None),
ResponseFunctionToolCall(arguments='{"city":"London"}', call\_id='call\_Mx6pyTjCkSkmASETsVASogoC', name='get\_city\_uuid', type='function\_call', id='fc\_6824621b8f6c8191a8095df7230b611e0c4fbdb0d4a46f3c', status='completed')]`
```
Along with the reasoning step, the model has successfully identified the need for a tool call and passed back instructions to send to our function call.
Let’s invoke the function and send the results to the model so it can continue reasoning.
Function responses are a special kind of message, so we need to structure our next message as a special kind of input:
```
`{
"type": "function\_call\_output",
"call\_id": function\_call.call\_id,
"output": tool\_output
}`
```
```
`# Extract the function call(s) from the response
new\_conversation\_items = []
function\_calls = [rx for rx in response.output if rx.type == 'function\_call']
for function\_call in function\_calls:
target\_tool = tool\_mapping.get(function\_call.name)
if not target\_tool:
raise ValueError(f"No tool found for function call: {function\_call.name}")
arguments = json.loads(function\_call.arguments) # Load the arguments as a dictionary
tool\_output = target\_tool(\*\*arguments) # Invoke the tool with the arguments
new\_conversation\_items.append({
"type": "function\_call\_output",
"call\_id": function\_call.call\_id, # We map the response back to the original function call
"output": tool\_output
})`
```
```
`response = client.responses.create(
input=new\_conversation\_items,
previous\_response\_id=response.id,
\*\*MODEL\_DEFAULTS
)
print(response.output\_text)`
```
```
`The internal ID for London is 816bed76-b956-46c4-94ec-51d30b022725.`
```
This works great here - as we know that a single function call is all that is required for the model to respond - but we also need to account for situations where multiple tool calls might need to be executed for the reasoning to complete.
Let’s add a second call to run a web search.
OpenAI’s web search tool is not available out of the box with reasoning models (as of May 2025 - this may soon change) but it’s not too hard to create a custom web search function using 4o mini or another web search enabled model.
```
`def web\_search(query: str) -\> str:
"""Search the web for information and return back a summary of the results"""
result = client.responses.create(
model="gpt-4o-mini",
input=f"Search the web for '{query}' and reply with only the result.",
tools=[{"type": "web\_search\_preview"}],
)
return result.output\_text
tools.append({
"type": "function",
"name": "web\_search",
"description": "Search the web for information and return back a summary of the results",
"parameters": {
"type": "object",
"properties": {
"query": {"type": "string", "description": "The query to search the web for."}
},
"required": ["query"]
}
})
tool\_mapping["web\_search"] = web\_search`
```
## Executing multiple functions in series
Some OpenAI models support the parameter `parallel\_tool\_calls` which allows the model to return an array of functions which we can then execute in parallel. However, reasoning models may produce a sequence of function calls that must be made in series, particularly as some steps may depend on the results of previous ones.
As such, we ought to define a general pattern which we can use to handle arbitrarily complex reasoning workflows:
* At each step in the conversation, initialise a loop
* If the response contains function calls, we must assume the reasoning is ongoing and we should feed the function results (and any intermediate reasoning) back into the model for further inference
* If there are no function calls and we instead receive a Reponse.output with a type of ‘message’, we can safely assume the agent has finished reasoning and we can break out of the loop
```
`# Let's wrap our logic above into a function which we can use to invoke tool calls.
def invoke\_functions\_from\_response(response,
tool\_mapping: dict[str, Callable] = tool\_mapping
) -\> list[dict]:
"""Extract all function calls from the response, look up the corresponding tool function(s) and execute them.
(This would be a good place to handle asynchroneous tool calls, or ones that take a while to execute.)
This returns a list of messages to be added to the conversation history.
"""
intermediate\_messages = []
for response\_item in response.output:
if response\_item.type == 'function\_call':
target\_tool = tool\_mapping.get(response\_item.name)
if target\_tool:
try:
arguments = json.loads(response\_item.arguments)
print(f"Invoking tool: {response\_item.name}({arguments})")
tool\_output = target\_tool(\*\*arguments)
except Exception as e:
msg = f"Error executing function call: {response\_item.name}: {e}"
tool\_output = msg
print(msg)
else:
msg = f"ERROR - No tool registered for function call: {response\_item.name}"
tool\_output = msg
print(msg)
intermediate\_messages.append({
"type": "function\_call\_output",
"call\_id": response\_item.call\_id,
"output": tool\_output
})
elif response\_item.type == 'reasoning':
print(f'Reasoning step: {response\_item.summary}')
return intermediate\_messages`
```
Now let’s demonstrate the loop concept we discussed before.
```
`initial\_question = (
"What are the internal IDs for the cities that have hosted the Olympics in the last 20 years, "
"and which of those cities have recent news stories (in 2025) about the Olympics? "
"Use your internal tools to look up the IDs and the web search tool to find the news stories."
)
# We fetch a response and then kick off a loop to handle the response
response = client.responses.create(
input=initial\_question,
\*\*MODEL\_DEFAULTS,
)
while True:
function\_responses = invoke\_functions\_from\_response(response)
if len(function\_responses) == 0: # We're done reasoning
print(response.output\_text)
break
else:
print("More reasoning required, continuing...")
response = client.responses.create(
input=function\_responses,
previous\_response\_id=response.id,
\*\*MODEL\_DEFAULTS
)`
```
```
`Reasoning step: []
Invoking tool: get\_city\_uuid({'city': 'Beijing'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: get\_city\_uuid({'city': 'London'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: get\_city\_uuid({'city': 'Rio de Janeiro'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: get\_city\_uuid({'city': 'Tokyo'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: get\_city\_uuid({'city': 'Paris'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: get\_city\_uuid({'city': 'Turin'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: get\_city\_uuid({'city': 'Vancouver'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: get\_city\_uuid({'city': 'Sochi'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: get\_city\_uuid({'city': 'Pyeongchang'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: web\_search({'query': '2025 Beijing Olympics news'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: web\_search({'query': '2025 London Olympics news'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: web\_search({'query': '2025 Rio de Janeiro Olympics news'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: web\_search({'query': '2025 Tokyo Olympics news'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: web\_search({'query': '2025 Paris Olympics news'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: web\_search({'query': '2025 Turin Olympics news'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: web\_search({'query': '2025 Vancouver Olympics news'})
More reasoning required, continuing...
Reasoning step: [Summary(text='\*\*Focusing on Olympic News\*\*\\n\\nI need to clarify that the Invictus Games are not related to the Olympics, so I should exclude them from my search. That leaves me with Olympic-specific news focusing on Paris. I also want to consider past events, like Sochi and Pyeongchang, so I think it makes sense to search for news related to Sochi as well. Let’s focus on gathering relevant Olympic updates to keep things organized.', type='summary\_text')]
Invoking tool: web\_search({'query': '2025 Sochi Olympics news'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: web\_search({'query': '2025 Pyeongchang Olympics news'})
More reasoning required, continuing...
Reasoning step: []
Here are the internal IDs for all cities that have hosted Olympic Games in the last 20 years (2005–2025), along with those cities that have notable 2025 news stories specifically about the Olympics:
1. Beijing (2008 Summer; 2022 Winter)
• UUID: 5b058554-7253-4d9d-a434-5d4ccc87c78b
• 2025 Olympic News? No major Olympic-specific news in 2025
2. London (2012 Summer)
• UUID: 9a67392d-c319-4598-b69a-adc5ffdaaba2
• 2025 Olympic News? No
3. Rio de Janeiro (2016 Summer)
• UUID: ad5eaaae-b280-4c1d-9360-3a38b0c348c3
• 2025 Olympic News? No
4. Tokyo (2020 Summer)
• UUID: 66c3a62a-840c-417a-8fad-ce87b97bb6a3
• 2025 Olympic News? No
5. Paris (2024 Summer)
• UUID: a2da124e-3fad-402b-8ccf-173f63b4ff68
• 2025 Olympic News? Yes
– Olympic cauldron balloon to float annually over Paris into 2028 ([AP News])
– IOC to replace defective Paris 2024 medals ([NDTV Sports])
– IOC elects Kirsty Coventry as president at March 2025 session ([Wikipedia])
– MLB cancels its planned 2025 Paris regular-season games ([AP News])
6. Turin (2006 Winter)
• UUID: 3674750b-6b76-49dc-adf4-d4393fa7bcfa
• 2025 Olympic News? No (Host of Special Olympics World Winter Games, but not mainline Olympics)
7. Vancouver (2010 Winter)
• UUID: 22517787-5915-41c8-b9dd-a19aa2953210
• 2025 Olympic News? No
8. Sochi (2014 Winter)
• UUID: f7efa267-c7da-4cdc-a14f-a4844f47b888
• 2025 Olympic News? No
9. Pyeongchang (2018 Winter)
• UUID: ffb19c03-5212-42a9-a527-315d35efc5fc
• 2025 Olympic News? No
Summary of cities with 2025 Olympic-related news:
• Paris (a2da124e-3fad-402b-8ccf-173f63b4ff68)`
```
## Manual conversation orchestration
So far so good! It’s really cool to watch the model pause execution to run a function before continuing.
In practice the example above is quite trivial, and production use cases may be much more complex:
* Our context window may grow too large and we may wish to prune older and less relevant messages, or summarize the conversation so far
* We may wish to allow users to navigate back and forth through the conversation and re-generate answers
* We may wish to store messages in our own database for audit purposes rather than relying on OpenAI’s storage and orchestration
* etc.
In these situations we may wish to take full control of the conversation. Rather than using `previous\_message\_id` we can instead treat the API as ‘stateless’ and make and maintain an array of conversation items that we send to the model as input each time.
This poses some Reasoning model specific nuances to consider.
* In particular, it is essential that we preserve any reasoning and function call responses in our conversation history.
* This is how the model keeps track of what chain-of-thought steps it has run through. The API will error if these are not included.
Let’s run through the example above again, orchestrating the messages ourselves and tracking token usage.
*Note that the code below is structured for readibility - in practice you may wish to consider a more sophisticated workflow to handle edge cases*
```
`# Let's initialise our conversation with the first user message
total\_tokens\_used = 0
user\_messages = [
(
"Of those cities that have hosted the summer Olympic games in the last 20 years - "
"do any of them have IDs beginning with a number and a temperate climate? "
"Use your available tools to look up the IDs for each city and make sure to search the web to find out about the climate."
),
"Great thanks! We've just updated the IDs - could you please check again?"
]
conversation = []
for message in user\_messages:
conversation\_item = {
"role": "user",
"type": "message",
"content": message
}
print(f"{'\*' \* 79}\\nUser message: {message}\\n{'\*' \* 79}")
conversation.append(conversation\_item)
while True: # Response loop
response = client.responses.create(
input=conversation,
\*\*MODEL\_DEFAULTS
)
total\_tokens\_used += response.usage.total\_tokens
reasoning = [rx.to\_dict() for rx in response.output if rx.type == 'reasoning']
function\_calls = [rx.to\_dict() for rx in response.output if rx.type == 'function\_call']
messages = [rx.to\_dict() for rx in response.output if rx.type == 'message']
if len(reasoning) \> 0:
print("More reasoning required, continuing...")
# Ensure we capture any reasoning steps
conversation.extend(reasoning)
print('\\n'.join(s['text'] for r in reasoning for s in r['summary']))
if len(function\_calls) \> 0:
function\_outputs = invoke\_functions\_from\_response(response)
# Preserve order of function calls and outputs in case of multiple function calls (currently not supported by reasoning models, but worth considering)
interleaved = [val for pair in zip(function\_calls, function\_outputs) for val in pair]
conversation.extend(interleaved)
if len(messages) \> 0:
print(response.output\_text)
conversation.extend(messages)
if len(function\_calls) == 0: # No more functions = We're done reasoning and we're ready for the next user message
break
print(f"Total tokens used: {total\_tokens\_used} ({total\_tokens\_used / 200\_000:.2%} of o4-mini's context window)")`
```
```
`\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
User message: Of those cities that have hosted the summer Olympic games in the last 20 years - do any of them have IDs beginning with a number and a temperate climate? Use your available tools to look up the IDs for each city and make sure to search the web to find out about the climate.
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
More reasoning required, continuing...
\*\*Clarifying Olympic Cities\*\*
The user is asking about cities that hosted the Summer Olympics in the last 20 years. The relevant years to consider are 2004 Athens, 2008 Beijing, 2012 London, 2016 Rio de Janeiro, and 2020 Tokyo. If we're considering 2025, then 2004 would actually be 21 years ago, so I should focus instead on the years from 2005 onwards. Therefore, the cities to include are Beijing, London, Rio, and Tokyo. I’ll exclude Paris since it hasn’t hosted yet.
Reasoning step: [Summary(text="\*\*Clarifying Olympic Cities\*\*\\n\\nThe user is asking about cities that hosted the Summer Olympics in the last 20 years. The relevant years to consider are 2004 Athens, 2008 Beijing, 2012 London, 2016 Rio de Janeiro, and 2020 Tokyo. If we're considering 2025, then 2004 would actually be 21 years ago, so I should focus instead on the years from 2005 onwards. Therefore, the cities to include are Beijing, London, Rio, and Tokyo. I’ll exclude Paris since it hasn’t hosted yet.", type='summary\_text')]
Invoking tool: get\_city\_uuid({'city': 'Beijing'})
Invoking tool: get\_city\_uuid({'city': 'London'})
Invoking tool: get\_city\_uuid({'city': 'Rio de Janeiro'})
Invoking tool: get\_city\_uuid({'city': 'Tokyo'})
More reasoning required, continuing...
Reasoning step: []
Invoking tool: web\_search({'query': 'London climate'})
Invoking tool: web\_search({'query': 'Tokyo climate'})
More reasoning required, continuing...
I looked up the internal IDs and climates for each Summer-Olympics host of the last 20 years:
• Beijing
– ID: 937b336d-2708-4ad3-8c2f-85ea32057e1e (starts with “9”)
– Climate: humid continental (cold winters, hot summers) → not temperate
• London
– ID: ee57f35a-7d1b-4888-8833-4ace308fa004 (starts with “e”)
– Climate: temperate oceanic (mild, moderate rainfall)
• Rio de Janeiro
– ID: 2a70c45e-a5b4-4e42-8d2b-6c1dbb2aa2d9 (starts with “2”)
– Climate: tropical (hot/wet)
• Tokyo
– ID: e5de3686-a7d2-42b8-aca5-6b6e436083ff (starts with “e”)
– Climate: humid subtropical (hot, humid summers; mild winters)
The only IDs that begin with a numeral are Beijing (“9…”) and Rio (“2…”), but neither city has a temperate climate. Therefore, none of the last-20-years hosts combine an ID starting with a number with a temperate climate.
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
User message: Great thanks! We've just updated the IDs - could you please check again?
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
More reasoning required, continuing...
Reasoning step: []
Invoking tool: get\_city\_uuid({'city': 'Beijing'})
Invoking tool: get\_city\_uuid({'city': 'London'})
Invoking tool: get\_city\_uuid({'city': 'Rio de Janeiro'})
Invoking tool: get\_city\_uuid({'city': 'Tokyo'})
Here are the updated IDs along with their climates:
• Beijing
– ID: 8819a1fd-a958-40e6-8ba7-9f450b40fb13 (starts with “8”)
– Climate: humid continental → not temperate
• London
– ID: 50866ef9-6505-4939-90e7-e8b930815782 (starts with “5”)
– Climate: temperate oceanic
• Rio de Janeiro
– ID: 5bc1b2de-75da-4689-8bff-269e60af32cb (starts with “5”)
– Climate: tropical → not temperate
• Tokyo
– ID: 9d1c920e-e725-423e-b83c-ec7d97f2e79f (starts with “9”)
– Climate: humid subtropical → not temperate
Of these, the only city with a temperate climate is London, but its ID begins with “5” (a number) – so it does meet “ID beginning with a number AND temperate climate.”
Total tokens used: 17154 (8.58% of o4-mini's context window)`
```
## Summary
In this cookbook, we identified how to combine function calling with OpenAI’s reasoning models to demonstrate multi-step tasks that are dependent on external data sources., including searching the web.
Importantly, we covered reasoning-model specific nuances in the function calling process, specifically that:
* The model may choose to make multiple function calls or reasoning steps in series, and some steps may depend on the results of previous ones
* We cannot know how many of these steps there will be, so we must process responses with a loop
* The responses API makes orchestration easy using the `previous\_response\_id` parameter, but where manual control is needed, it’s important to maintain the correct order of conversation item to preserve the ‘chain-of-thought’
The examples used here are rather simple, but you can imagine how this technique could be extended to more real-world use cases, such as:
* Looking up a customer’s transaction history and recent correspondence to determine if they are eligible for a promotional offer
* Calling recent transaction logs, geolocation data, and device metadata to assess the likelihood of a transaction being fraudulent
* Reviewing internal HR databases to fetch an employee’s benefits usage, tenure, and recent policy changes to answer personalized HR questions
* Reading internal dashboards, competitor news feeds, and market analyses to compile a daily executive briefing tailored to their focus areas