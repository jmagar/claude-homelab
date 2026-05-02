Orchestrating Agents: Routines and Handoffs
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
Oct 10, 2024
# Orchestrating Agents: Routines and Handoffs
[ IB ](https://twitter.com/ilanbigio)
[ Ilan Bigio
(OpenAI)
](https://twitter.com/ilanbigio)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Orchestrating_agents.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Orchestrating_agents.ipynb)
When working with language models, quite often all you need for solid performance is a good prompt and the right tools. However, when dealing with many unique flows, things may get hairy. This cookbook will walk through one way to tackle this.
We’ll introduce the notion of **routines** and **handoffs**, then walk through the implementation and show how they can be used to orchestrate multiple agents in a simple, powerful, and controllable way.
Finally, we provide a sample repo, [Swarm](https://github.com/openai/swarm), that implements these ideas along with examples.
Let’s start by setting up our imports.
```
`from openai import OpenAI
from pydantic import BaseModel
from typing import Optional
import json
client = OpenAI()`
```
# Routines
The notion of a “routine” is not strictly defined, and instead meant to capture the idea of a set of steps. Concretely, let’s define a routine to be a list of instructions in natural langauge (which we’ll represent with a system prompt), along with the tools necessary to complete them.
Let’s take a look at an example. Below, we’ve defined a routine for a customer service agent instructing it to triage the user issue, then either suggest a fix or provide a refund. We’ve also defined the necessary functions `execute\_refund` and `look\_up\_item`. We can call this a customer service routine, agent, assistant, etc – however the idea itself is the same: a set of steps and the tools to execute them.
```
`# Customer Service Routine
system\_message = (
"You are a customer support agent for ACME Inc."
"Always answer in a sentence or less."
"Follow the following routine with the user:"
"1. First, ask probing questions and understand the user's problem deeper.\\n"
" - unless the user has already provided a reason.\\n"
"2. Propose a fix (make one up).\\n"
"3. ONLY if not satisfied, offer a refund.\\n"
"4. If accepted, search for the ID and then execute refund."
""
)
def look\_up\_item(search\_query):
"""Use to find item ID.
Search query can be a description or keywords."""
# return hard-coded item ID - in reality would be a lookup
return "item\_132612938"
def execute\_refund(item\_id, reason="not provided"):
print("Summary:", item\_id, reason) # lazy summary
return "success"`
```
The main power of routines is their simplicity and robustness. Notice that these instructions contain conditionals much like a state machine or branching in code. LLMs can actually handle these cases quite robustly for small and medium sized routine, with the added benefit of having “soft” adherance – the LLM can naturally steer the conversation without getting stuck in dead-ends.
## Executing Routines
To execute a routine, let’s implement a simple loop that:
1. Gets user input.
2. Appends user message to `messages`.
3. Calls the model.
4. Appends model response to `messages`.
```
`def run\_full\_turn(system\_message, messages):
response = client.chat.completions.create(
model="gpt-4o-mini",
messages=[{"role": "system", "content": system\_message}] + messages,
)
message = response.choices[0].message
messages.append(message)
if message.content: print("Assistant:", message.content)
return message
messages = []
while True:
user = input("User: ")
messages.append({"role": "user", "content": user})
run\_full\_turn(system\_message, messages)`
```
As you can see, this currently ignores function calls, so let’s add that.
Models require functions to be formatted as a function schema. For convenience, we can define a helper function that turns python functions into the corresponding function schema.
```
`import inspect
def function\_to\_schema(func) -\> dict:
type\_map = {
str: "string",
int: "integer",
float: "number",
bool: "boolean",
list: "array",
dict: "object",
type(None): "null",
}
try:
signature = inspect.signature(func)
except ValueError as e:
raise ValueError(
f"Failed to get signature for function {func.\_\_name\_\_}: {str(e)}"
)
parameters = {}
for param in signature.parameters.values():
try:
param\_type = type\_map.get(param.annotation, "string")
except KeyError as e:
raise KeyError(
f"Unknown type annotation {param.annotation} for parameter {param.name}: {str(e)}"
)
parameters[param.name] = {"type": param\_type}
required = [
param.name
for param in signature.parameters.values()
if param.default == inspect.\_empty
]
return {
"type": "function",
"function": {
"name": func.\_\_name\_\_,
"description": (func.\_\_doc\_\_ or "").strip(),
"parameters": {
"type": "object",
"properties": parameters,
"required": required,
},
},
}`
```
For example:
```
`def sample\_function(param\_1, param\_2, the\_third\_one: int, some\_optional="John Doe"):
"""
This is my docstring. Call this function when you want.
"""
print("Hello, world")
schema = function\_to\_schema(sample\_function)
print(json.dumps(schema, indent=2))`
```
```
`{
"type": "function",
"function": {
"name": "sample\_function",
"description": "This is my docstring. Call this function when you want.",
"parameters": {
"type": "object",
"properties": {
"param\_1": {
"type": "string"
},
"param\_2": {
"type": "string"
},
"the\_third\_one": {
"type": "integer"
},
"some\_optional": {
"type": "string"
}
},
"required": [
"param\_1",
"param\_2",
"the\_third\_one"
]
}
}
}`
```
Now, we can use this function to pass the tools to the model when we call it.
```
`messages = []
tools = [execute\_refund, look\_up\_item]
tool\_schemas = [function\_to\_schema(tool) for tool in tools]
response = client.chat.completions.create(
model="gpt-4o-mini",
messages=[{"role": "user", "content": "Look up the black boot."}],
tools=tool\_schemas,
)
message = response.choices[0].message
message.tool\_calls[0].function`
```
```
`Function(arguments='{"search\_query":"black boot"}', name='look\_up\_item')`
```
Finally, when the model calls a tool we need to execute the corresponding function and provide the result back to the model.
We can do this by mapping the name of the tool to the python function in a `tool\_map`, then looking it up in `execute\_tool\_call` and calling it. Finally we add the result to the conversation.
```
`tools\_map = {tool.\_\_name\_\_: tool for tool in tools}
def execute\_tool\_call(tool\_call, tools\_map):
name = tool\_call.function.name
args = json.loads(tool\_call.function.arguments)
print(f"Assistant: {name}({args})")
# call corresponding function with provided arguments
return tools\_map[name](\*\*args)
for tool\_call in message.tool\_calls:
result = execute\_tool\_call(tool\_call, tools\_map)
# add result back to conversation
result\_message = {
"role": "tool",
"tool\_call\_id": tool\_call.id,
"content": result,
}
messages.append(result\_message)`
```
```
`Assistant: look\_up\_item({'search\_query': 'black boot'})`
```
In practice, we’ll also want to let the model use the result to produce another response. That response might *also* contain a tool call, so we can just run this in a loop until there are no more tool calls.
If we put everything together, it will look something like this:
```
`tools = [execute\_refund, look\_up\_item]
def run\_full\_turn(system\_message, tools, messages):
num\_init\_messages = len(messages)
messages = messages.copy()
while True:
# turn python functions into tools and save a reverse map
tool\_schemas = [function\_to\_schema(tool) for tool in tools]
tools\_map = {tool.\_\_name\_\_: tool for tool in tools}
# === 1. get openai completion ===
response = client.chat.completions.create(
model="gpt-4o-mini",
messages=[{"role": "system", "content": system\_message}] + messages,
tools=tool\_schemas or None,
)
message = response.choices[0].message
messages.append(message)
if message.content: # print assistant response
print("Assistant:", message.content)
if not message.tool\_calls: # if finished handling tool calls, break
break
# === 2. handle tool calls ===
for tool\_call in message.tool\_calls:
result = execute\_tool\_call(tool\_call, tools\_map)
result\_message = {
"role": "tool",
"tool\_call\_id": tool\_call.id,
"content": result,
}
messages.append(result\_message)
# ==== 3. return new messages =====
return messages[num\_init\_messages:]
def execute\_tool\_call(tool\_call, tools\_map):
name = tool\_call.function.name
args = json.loads(tool\_call.function.arguments)
print(f"Assistant: {name}({args})")
# call corresponding function with provided arguments
return tools\_map[name](\*\*args)
messages = []
while True:
user = input("User: ")
messages.append({"role": "user", "content": user})
new\_messages = run\_full\_turn(system\_message, tools, messages)
messages.extend(new\_messages)`
```
Now that we have a routine, let’s say we want to add more steps and more tools. We can up to a point, but eventually if we try growing the routine with too many different tasks it may start to struggle. This is where we can leverage the notion of multiple routines – given a user request, we can load the right routine with the appropriate steps and tools to address it.
Dynamically swapping system instructions and tools may seem daunting. However, if we view “routines” as “agents”, then this notion of **handoffs** allow us to represent these swaps simply – as one agent handing off a conversation to another.
# Handoffs
Let’s define a **handoff** as an agent (or routine) handing off an active conversation to another agent, much like when you get transfered to someone else on a phone call. Except in this case, the agents have complete knowledge of your prior conversation!
To see handoffs in action, let’s start by defining a basic class for an Agent.
```
`class Agent(BaseModel):
name: str = "Agent"
model: str = "gpt-4o-mini"
instructions: str = "You are a helpful Agent"
tools: list = []`
```
Now to make our code support it, we can change `run\_full\_turn` to take an `Agent` instead of separate `system\_message` and `tools`:
```
`def run\_full\_turn(agent, messages):
num\_init\_messages = len(messages)
messages = messages.copy()
while True:
# turn python functions into tools and save a reverse map
tool\_schemas = [function\_to\_schema(tool) for tool in agent.tools]
tools\_map = {tool.\_\_name\_\_: tool for tool in agent.tools}
# === 1. get openai completion ===
response = client.chat.completions.create(
model=agent.model,
messages=[{"role": "system", "content": agent.instructions}] + messages,
tools=tool\_schemas or None,
)
message = response.choices[0].message
messages.append(message)
if message.content: # print assistant response
print("Assistant:", message.content)
if not message.tool\_calls: # if finished handling tool calls, break
break
# === 2. handle tool calls ===
for tool\_call in message.tool\_calls:
result = execute\_tool\_call(tool\_call, tools\_map)
result\_message = {
"role": "tool",
"tool\_call\_id": tool\_call.id,
"content": result,
}
messages.append(result\_message)
# ==== 3. return new messages =====
return messages[num\_init\_messages:]
def execute\_tool\_call(tool\_call, tools\_map):
name = tool\_call.function.name
args = json.loads(tool\_call.function.arguments)
print(f"Assistant: {name}({args})")
# call corresponding function with provided arguments
return tools\_map[name](\*\*args)`
```
We can now run multiple agents easily:
```
`def execute\_refund(item\_name):
return "success"
refund\_agent = Agent(
name="Refund Agent",
instructions="You are a refund agent. Help the user with refunds.",
tools=[execute\_refund],
)
def place\_order(item\_name):
return "success"
sales\_assistant = Agent(
name="Sales Assistant",
instructions="You are a sales assistant. Sell the user a product.",
tools=[place\_order],
)
messages = []
user\_query = "Place an order for a black boot."
print("User:", user\_query)
messages.append({"role": "user", "content": user\_query})
response = run\_full\_turn(sales\_assistant, messages) # sales assistant
messages.extend(response)
user\_query = "Actually, I want a refund." # implicitly refers to the last item
print("User:", user\_query)
messages.append({"role": "user", "content": user\_query})
response = run\_full\_turn(refund\_agent, messages) # refund agent`
```
```
`User: Place an order for a black boot.
Assistant: place\_order({'item\_name': 'black boot'})
Assistant: Your order for a black boot has been successfully placed! If you need anything else, feel free to ask!
User: Actually, I want a refund.
Assistant: execute\_refund({'item\_name': 'black boot'})
Assistant: Your refund for the black boot has been successfully processed. If you need further assistance, just let me know!`
```
Great! But we did the handoff manually here – we want the agents themselves to decide when to perform a handoff. A simple, but surprisingly effective way to do this is by giving them a `transfer\_to\_XXX` function, where `XXX` is some agent. The model is smart enough to know to call this function when it makes sense to make a handoff!
### Handoff Functions
Now that agent can express the *intent* to make a handoff, we must make it actually happen. There’s many ways to do this, but there’s one particularly clean way.
For the agent functions we’ve defined so far, like `execute\_refund` or `place\_order` they return a string, which will be provided to the model. What if instead, we return an `Agent` object to indicate which agent we want to transfer to? Like so:
```
`refund\_agent = Agent(
name="Refund Agent",
instructions="You are a refund agent. Help the user with refunds.",
tools=[execute\_refund],
)
def transfer\_to\_refunds():
return refund\_agent
sales\_assistant = Agent(
name="Sales Assistant",
instructions="You are a sales assistant. Sell the user a product.",
tools=[place\_order],
)`
```
We can then update our code to check the return type of a function response, and if it’s an `Agent`, update the agent in use! Additionally, now `run\_full\_turn` will need to return the latest agent in use in case there are handoffs. (We can do this in a `Response` class to keep things neat.)
```
`class Response(BaseModel):
agent: Optional[Agent]
messages: list`
```
Now for the updated `run\_full\_turn`:
```
`def run\_full\_turn(agent, messages):
current\_agent = agent
num\_init\_messages = len(messages)
messages = messages.copy()
while True:
# turn python functions into tools and save a reverse map
tool\_schemas = [function\_to\_schema(tool) for tool in current\_agent.tools]
tools = {tool.\_\_name\_\_: tool for tool in current\_agent.tools}
# === 1. get openai completion ===
response = client.chat.completions.create(
model=agent.model,
messages=[{"role": "system", "content": current\_agent.instructions}]
+ messages,
tools=tool\_schemas or None,
)
message = response.choices[0].message
messages.append(message)
if message.content: # print agent response
print(f"{current\_agent.name}:", message.content)
if not message.tool\_calls: # if finished handling tool calls, break
break
# === 2. handle tool calls ===
for tool\_call in message.tool\_calls:
result = execute\_tool\_call(tool\_call, tools, current\_agent.name)
if type(result) is Agent: # if agent transfer, update current agent
current\_agent = result
result = (
f"Transfered to {current\_agent.name}. Adopt persona immediately."
)
result\_message = {
"role": "tool",
"tool\_call\_id": tool\_call.id,
"content": result,
}
messages.append(result\_message)
# ==== 3. return last agent used and new messages =====
return Response(agent=current\_agent, messages=messages[num\_init\_messages:])
def execute\_tool\_call(tool\_call, tools, agent\_name):
name = tool\_call.function.name
args = json.loads(tool\_call.function.arguments)
print(f"{agent\_name}:", f"{name}({args})")
return tools[name](\*\*args) # call corresponding function with provided arguments`
```
Let’s look at an example with more Agents.
```
`def escalate\_to\_human(summary):
"""Only call this if explicitly asked to."""
print("Escalating to human agent...")
print("\\n=== Escalation Report ===")
print(f"Summary: {summary}")
print("=========================\\n")
exit()
def transfer\_to\_sales\_agent():
"""User for anything sales or buying related."""
return sales\_agent
def transfer\_to\_issues\_and\_repairs():
"""User for issues, repairs, or refunds."""
return issues\_and\_repairs\_agent
def transfer\_back\_to\_triage():
"""Call this if the user brings up a topic outside of your purview,
including escalating to human."""
return triage\_agent
triage\_agent = Agent(
name="Triage Agent",
instructions=(
"You are a customer service bot for ACME Inc. "
"Introduce yourself. Always be very brief. "
"Gather information to direct the customer to the right department. "
"But make your questions subtle and natural."
),
tools=[transfer\_to\_sales\_agent, transfer\_to\_issues\_and\_repairs, escalate\_to\_human],
)
def execute\_order(product, price: int):
"""Price should be in USD."""
print("\\n\\n=== Order Summary ===")
print(f"Product: {product}")
print(f"Price: ${price}")
print("=================\\n")
confirm = input("Confirm order? y/n: ").strip().lower()
if confirm == "y":
print("Order execution successful!")
return "Success"
else:
print("Order cancelled!")
return "User cancelled order."
sales\_agent = Agent(
name="Sales Agent",
instructions=(
"You are a sales agent for ACME Inc."
"Always answer in a sentence or less."
"Follow the following routine with the user:"
"1. Ask them about any problems in their life related to catching roadrunners.\\n"
"2. Casually mention one of ACME's crazy made-up products can help.\\n"
" - Don't mention price.\\n"
"3. Once the user is bought in, drop a ridiculous price.\\n"
"4. Only after everything, and if the user says yes, "
"tell them a crazy caveat and execute their order.\\n"
""
),
tools=[execute\_order, transfer\_back\_to\_triage],
)
def look\_up\_item(search\_query):
"""Use to find item ID.
Search query can be a description or keywords."""
item\_id = "item\_132612938"
print("Found item:", item\_id)
return item\_id
def execute\_refund(item\_id, reason="not provided"):
print("\\n\\n=== Refund Summary ===")
print(f"Item ID: {item\_id}")
print(f"Reason: {reason}")
print("=================\\n")
print("Refund execution successful!")
return "success"
issues\_and\_repairs\_agent = Agent(
name="Issues and Repairs Agent",
instructions=(
"You are a customer support agent for ACME Inc."
"Always answer in a sentence or less."
"Follow the following routine with the user:"
"1. First, ask probing questions and understand the user's problem deeper.\\n"
" - unless the user has already provided a reason.\\n"
"2. Propose a fix (make one up).\\n"
"3. ONLY if not satesfied, offer a refund.\\n"
"4. If accepted, search for the ID and then execute refund."
""
),
tools=[execute\_refund, look\_up\_item, transfer\_back\_to\_triage],
)`
```
Finally, we can run this in a loop (this won’t run in python notebooks, so you can try this in a separate python file):
```
`agent = triage\_agent
messages = []
while True:
user = input("User: ")
messages.append({"role": "user", "content": user})
response = run\_full\_turn(agent, messages)
agent = response.agent
messages.extend(response.messages)`
```
# Swarm
As a proof of concept, we’ve packaged these ideas into a sample library called [Swarm](https://github.com/openai/swarm). It is meant as an example only, and should not be directly used in production. However, feel free to take the ideas and code to build your own!