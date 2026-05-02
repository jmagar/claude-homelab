How to call functions with chat models
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
Jun 13, 2023
# How to call functions with chat models
[ CJ ](https://twitter.com/colintjarvis)[ JP ](https://www.linkedin.com/in/joe-palermo-99219237)
[ Colin Jarvis
(OpenAI)
, ](https://twitter.com/colintjarvis)[ Joe Palermo
(OpenAI)
](https://www.linkedin.com/in/joe-palermo-99219237)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/How_to_call_functions_with_chat_models.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/How_to_call_functions_with_chat_models.ipynb)
This notebook covers how to use the Chat Completions API in combination with external functions to extend the capabilities of GPT models.
`tools` is an optional parameter in the Chat Completion API which can be used to provide function specifications. The purpose of this is to enable models to generate function arguments which adhere to the provided specifications. Note that the API will not actually execute any function calls. It is up to developers to execute function calls using model outputs.
Within the `tools` parameter, if the `functions` parameter is provided then by default the model will decide when it is appropriate to use one of the functions. The API can be forced to use a specific function by setting the `tool\_choice` parameter to `{"type": "function", "function": {"name": "my\_function"}}`. The API can also be forced to not use any function by setting the `tool\_choice` parameter to `"none"`. If a function is used, the output will contain `"finish\_reason": "tool\_calls"` in the response, as well as a `tool\_calls` object that has the name of the function and the generated function arguments.
### Overview
This notebook contains the following 2 sections:
* **How to generate function arguments:** Specify a set of functions and use the API to generate function arguments.
* **How to call functions with model generated arguments:** Close the loop by actually executing functions with model generated arguments.
## How to generate function arguments
```
`!pip install scipy --quiet
!pip install tenacity --quiet
!pip install tiktoken --quiet
!pip install termcolor --quiet
!pip install openai --quiet`
```
```
`import json
from openai import OpenAI
from tenacity import retry, wait\_random\_exponential, stop\_after\_attempt
from termcolor import colored
GPT\_MODEL = "gpt-5"
client = OpenAI()`
```
### Utilities
First let’s define a few utilities for making calls to the Chat Completions API and for maintaining and keeping track of the conversation state.
```
`@retry(wait=wait\_random\_exponential(multiplier=1, max=40), stop=stop\_after\_attempt(3))
def chat\_completion\_request(messages, tools=None, tool\_choice=None, model=GPT\_MODEL):
try:
response = client.chat.completions.create(
model=model,
messages=messages,
tools=tools,
tool\_choice=tool\_choice,
)
return response
except Exception as e:
print("Unable to generate ChatCompletion response")
print(f"Exception: {e}")
return e`
```
```
`def pretty\_print\_conversation(messages):
role\_to\_color = {
"system": "red",
"user": "green",
"assistant": "blue",
"function": "magenta",
}
for message in messages:
if message["role"] == "system":
print(colored(f"system: {message['content']}\\n", role\_to\_color[message["role"]]))
elif message["role"] == "user":
print(colored(f"user: {message['content']}\\n", role\_to\_color[message["role"]]))
elif message["role"] == "assistant" and message.get("tool\_calls"):
print(colored(f"assistant: {message['tool\_calls']}\\n", role\_to\_color[message["role"]]))
elif message["role"] == "assistant" and not message.get("tool\_calls"):
print(colored(f"assistant: {message['content']}\\n", role\_to\_color[message["role"]]))
elif message["role"] == "function":
print(colored(f"function ({message['name']}): {message['content']}\\n", role\_to\_color[message["role"]]))`
```
### Basic concepts
Let’s create some function specifications to interface with a hypothetical weather API. We’ll pass these function specification to the Chat Completions API in order to generate function arguments that adhere to the specification.
```
`tools = [
{
"type": "function",
"function": {
"name": "get\_current\_weather",
"description": "Get the current weather",
"parameters": {
"type": "object",
"properties": {
"location": {
"type": "string",
"description": "The city and state, e.g. San Francisco, CA",
},
"format": {
"type": "string",
"enum": ["celsius", "fahrenheit"],
"description": "The temperature unit to use. Infer this unit from the forecast location.",
},
},
"required": ["location", "format"],
},
}
},
{
"type": "function",
"function": {
"name": "get\_n\_day\_weather\_forecast",
"description": "Get an N-day weather forecast",
"parameters": {
"type": "object",
"properties": {
"location": {
"type": "string",
"description": "The city and state, e.g. San Francisco, CA",
},
"format": {
"type": "string",
"enum": ["celsius", "fahrenheit"],
"description": "The temperature unit to use. Infer this unit from the forecast location.",
},
"num\_days": {
"type": "integer",
"description": "The number of days to forecast",
}
},
"required": ["location", "format", "num\_days"]
},
}
},
]`
```
If we prompt the model about the current weather, it will respond with some clarifying questions.
```
`messages = []
messages.append({"role": "system", "content": "Don't make assumptions about what values to plug into functions. Ask for clarification if a user request is ambiguous."})
messages.append({"role": "user", "content": "What's the weather like today"})
chat\_response = chat\_completion\_request(
messages, tools=tools
)
messages.append(chat\_response.choices[0].message.to\_dict())
pretty\_print\_conversation(messages)`
```
```
`[31msystem: Don't make assumptions about what values to plug into functions. Ask for clarification if a user request is ambiguous.
[0m
[32muser: What's the weather like today
[0m
[34massistant: Sure—what city and state (or country) should I check? Also, do you prefer Celsius or Fahrenheit?
[0m`
```
Once we provide the missing information, it will generate the appropriate function arguments for us.
```
`messages.append({"role": "user", "content": "I'm in Glasgow, Scotland."})
chat\_response = chat\_completion\_request(
messages, tools=tools
)
messages.append(chat\_response.choices[0].message.to\_dict())
pretty\_print\_conversation(messages)`
```
```
`[31msystem: Don't make assumptions about what values to plug into functions. Ask for clarification if a user request is ambiguous.
[0m
[32muser: What's the weather like today
[0m
[34massistant: Sure—what city and state (or country) should I check? Also, do you prefer Celsius or Fahrenheit?
[0m
[32muser: I'm in Glasgow, Scotland.
[0m
[34massistant: [{'id': 'call\_k2QgGc9GT9WjxD76GvR0Ot8q', 'function': {'arguments': '{"location": "Glasgow, Scotland", "format": "celsius"}', 'name': 'get\_current\_weather'}, 'type': 'function'}, {'id': 'call\_RtnXV5t49lqbWwhvGoEPZ7KY', 'function': {'arguments': '{"location": "Glasgow, Scotland", "format": "celsius", "num\_days": 1}', 'name': 'get\_n\_day\_weather\_forecast'}, 'type': 'function'}]
[0m`
```
By prompting it differently, we can get it to target the other function we’ve told it about.
```
`messages = []
messages.append({"role": "system", "content": "Don't make assumptions about what values to plug into functions. Ask for clarification if a user request is ambiguous."})
messages.append({"role": "user", "content": "what is the weather going to be like in Glasgow, Scotland over the next x days"})
chat\_response = chat\_completion\_request(
messages, tools=tools
)
messages.append(chat\_response.choices[0].message.to\_dict())
pretty\_print\_conversation(messages)`
```
```
`[31msystem: Don't make assumptions about what values to plug into functions. Ask for clarification if a user request is ambiguous.
[0m
[32muser: what is the weather going to be like in Glasgow, Scotland over the next x days
[0m
[34massistant: How many days would you like the forecast for in Glasgow, Scotland? For example: 3, 5, 7, 10, or 14.
[0m`
```
Once again, the model is asking us for clarification because it doesn’t have enough information yet. In this case it already knows the location for the forecast, but it needs to know how many days are required in the forecast.
```
`messages.append({"role": "user", "content": "5 days"})
chat\_response = chat\_completion\_request(
messages, tools=tools
)
messages.append(chat\_response.choices[0].message.to\_dict())
pretty\_print\_conversation(messages)`
```
```
`[31msystem: Don't make assumptions about what values to plug into functions. Ask for clarification if a user request is ambiguous.
[0m
[32muser: what is the weather going to be like in Glasgow, Scotland over the next x days
[0m
[34massistant: How many days would you like the forecast for in Glasgow, Scotland? For example: 3, 5, 7, 10, or 14.
[0m
[32muser: 5 days
[0m
[34massistant: [{'id': 'call\_lNzOVLrNSaSVjL3O3bN110af', 'function': {'arguments': '{"location":"Glasgow, Scotland","format":"celsius","num\_days":5}', 'name': 'get\_n\_day\_weather\_forecast'}, 'type': 'function'}]
[0m`
```
#### Forcing the use of specific functions or no function
We can force the model to use a specific function, for example get\_n\_day\_weather\_forecast by using the function\_call argument. By doing so, we force the model to make assumptions about how to use it.
```
`# in this cell we force the model to use get\_n\_day\_weather\_forecast
messages = []
messages.append({"role": "system", "content": "Don't make assumptions about what values to plug into functions. Ask for clarification if a user request is ambiguous."})
messages.append({"role": "user", "content": "Give me a weather report for Toronto, Canada."})
chat\_response = chat\_completion\_request(
messages, tools=tools, tool\_choice={"type": "function", "function": {"name": "get\_n\_day\_weather\_forecast"}}
)
messages.append(chat\_response.choices[0].message.to\_dict())
pretty\_print\_conversation(messages)`
```
```
`[31msystem: Don't make assumptions about what values to plug into functions. Ask for clarification if a user request is ambiguous.
[0m
[32muser: Give me a weather report for Toronto, Canada.
[0m
[34massistant: [{'id': 'call\_3hoMjl55OQ7LxfwhFyjxwv1T', 'function': {'arguments': '{"location":"Toronto, Canada","format":"celsius","num\_days":5}', 'name': 'get\_n\_day\_weather\_forecast'}, 'type': 'function'}]
[0m`
```
```
`# if we don't force the model to use get\_n\_day\_weather\_forecast it may not
messages = []
messages.append({"role": "system", "content": "Don't make assumptions about what values to plug into functions. Ask for clarification if a user request is ambiguous."})
messages.append({"role": "user", "content": "Give me a weather report for Toronto, Canada."})
chat\_response = chat\_completion\_request(
messages, tools=tools
)
messages.append(chat\_response.choices[0].message.to\_dict())
pretty\_print\_conversation(messages)`
```
```
`[31msystem: Don't make assumptions about what values to plug into functions. Ask for clarification if a user request is ambiguous.
[0m
[32muser: Give me a weather report for Toronto, Canada.
[0m
[34massistant: [{'id': 'call\_wv5mdjEQJnBPuSci3xw09Tom', 'function': {'arguments': '{"location":"Toronto, ON","format":"celsius"}', 'name': 'get\_current\_weather'}, 'type': 'function'}]
[0m`
```
We can also force the model to not use a function at all. By doing so we prevent it from producing a proper function call.
```
`messages = []
messages.append({"role": "system", "content": "Don't make assumptions about what values to plug into functions. Ask for clarification if a user request is ambiguous."})
messages.append({"role": "user", "content": "Give me the current weather (use Celcius) for Toronto, Canada."})
chat\_response = chat\_completion\_request(
messages, tools=tools, tool\_choice="none"
)
messages.append(chat\_response.choices[0].message.to\_dict())
pretty\_print\_conversation(messages)`
```
```
`[31msystem: Don't make assumptions about what values to plug into functions. Ask for clarification if a user request is ambiguous.
[0m
[32muser: Give me the current weather (use Celcius) for Toronto, Canada.
[0m
[34massistant: I don’t have live access to pull the current conditions right now. To get Toronto’s current weather in Celsius, check any of these quickly:
- Environment Canada: weather.gc.ca (search “Toronto”)
- The Weather Network: theweathernetwork.com/ca/weather/ontario/toronto
- Google: search “Toronto weather” (shows °C by default in Canada)
- AccuWeather or Weather.com (set units to °C)
If you paste the current readings here (temperature, feels-like, wind, precipitation), I can interpret them and advise on what to wear or plan for.
[0m`
```
### Parallel Function Calling
Newer models such as gpt-5, gpt-4.1 or gpt-4o can call multiple functions in one turn.
```
`messages = []
messages.append({"role": "system", "content": "Don't make assumptions about what values to plug into functions. Ask for clarification if a user request is ambiguous."})
messages.append({"role": "user", "content": "what is the weather going to be like in San Francisco and Glasgow over the next 4 days"})
chat\_response = chat\_completion\_request(
messages, tools=tools, model="gpt-4o"
)
assistant\_message = chat\_response.choices[0].message.tool\_calls
assistant\_message`
```
```
`[ChatCompletionMessageFunctionToolCall(id='call\_KlZ3Fqt3SviC6o66dVMYSa2Q', function=Function(arguments='{"location": "San Francisco, CA", "format": "fahrenheit", "num\_days": 4}', name='get\_n\_day\_weather\_forecast'), type='function'),
ChatCompletionMessageFunctionToolCall(id='call\_YAnH0VRB3oqjqivcGj3Cd8YA', function=Function(arguments='{"location": "Glasgow, UK", "format": "celsius", "num\_days": 4}', name='get\_n\_day\_weather\_forecast'), type='function')]`
```
## How to call functions with model generated arguments
In our next example, we’ll demonstrate how to execute functions whose inputs are model-generated, and use this to implement an agent that can answer questions for us about a database. For simplicity we’ll use the [Chinook sample database](https://www.sqlitetutorial.net/sqlite-sample-database/).
*Note:* SQL generation can be high-risk in a production environment since models are not perfectly reliable at generating correct SQL.
### Specifying a function to execute SQL queries
First let’s define some helpful utility functions to extract data from a SQLite database.
```
`import sqlite3
conn = sqlite3.connect("data/Chinook.db")
print("Opened database successfully")`
```
```
`Opened database successfully`
```
```
`def get\_table\_names(conn):
"""Return a list of table names."""
table\_names = []
tables = conn.execute("SELECT name FROM sqlite\_master WHERE type='table';")
for table in tables.fetchall():
table\_names.append(table[0])
return table\_names
def get\_column\_names(conn, table\_name):
"""Return a list of column names."""
column\_names = []
columns = conn.execute(f"PRAGMA table\_info('{table\_name}');").fetchall()
for col in columns:
column\_names.append(col[1])
return column\_names
def get\_database\_info(conn):
"""Return a list of dicts containing the table name and columns for each table in the database."""
table\_dicts = []
for table\_name in get\_table\_names(conn):
columns\_names = get\_column\_names(conn, table\_name)
table\_dicts.append({"table\_name": table\_name, "column\_names": columns\_names})
return table\_dicts`
```
Now we can use these utility functions to extract a representation of the database schema.
```
`database\_schema\_dict = get\_database\_info(conn)
database\_schema\_string = "\\n".join(
[
f"Table: {table['table\_name']}\\nColumns: {', '.join(table['column\_names'])}"
for table in database\_schema\_dict
]
)`
```
As before, we’ll define a function specification for the function we’d like the API to generate arguments for. Notice that we are inserting the database schema into the function specification. This will be important for the model to know about.
```
`tools = [
{
"type": "function",
"function": {
"name": "ask\_database",
"description": "Use this function to answer user questions about music. Input should be a fully formed SQL query.",
"parameters": {
"type": "object",
"properties": {
"query": {
"type": "string",
"description": f"""
SQL query extracting info to answer the user's question.
SQL should be written using this database schema:
{database\_schema\_string}
The query should be returned in plain text, not in JSON.
""",
}
},
"required": ["query"],
},
}
}
]`
```
### Executing SQL queries
Now let’s implement the function that will actually excute queries against the database.
```
`def ask\_database(conn, query):
"""Function to query SQLite database with a provided SQL query."""
try:
results = str(conn.execute(query).fetchall())
except Exception as e:
results = f"query failed with error: {e}"
return results`
```
##### Steps to invoke a function call using Chat Completions API:
**Step 1**: Prompt the model with content that may result in model selecting a tool to use. The description of the tools such as a function name and signature is defined in the ‘Tools’ list and passed to the model in API call. If selected, the function name and parameters are included in the response.
**Step 2**: Check programmatically if model wanted to call a function. If true, proceed to step 3.
**Step 3**: Extract the function name and parameters from response, call the function with parameters. Append the result to messages.
**Step 4**: Invoke the chat completions API with the message list to get the response.
```
`# Step #1: Prompt with content that may result in function call. In this case the model can identify the information requested by the user is potentially available in the database schema passed to the model in Tools description.
messages = [{
"role":"user",
"content": "What is the name of the album with the most tracks?"
}]
response = client.chat.completions.create(
model=GPT\_MODEL,
messages=messages,
tools=tools,
tool\_choice="auto"
)
# Append the message to messages list
response\_message = response.choices[0].message
messages.append(response\_message.to\_dict())
pretty\_print\_conversation(messages)`
```
```
`[32muser: What is the name of the album with the most tracks?
[0m
[34massistant: [{'id': 'call\_pGRtZZGfd2o41GHlZcEdB9he', 'function': {'arguments': '{"query":"WITH track\_counts AS (\\\\n SELECT a.AlbumId, a.Title, COUNT(t.TrackId) AS track\_count\\\\n FROM Album a\\\\n JOIN Track t ON t.AlbumId = a.AlbumId\\\\n GROUP BY a.AlbumId, a.Title\\\\n)\\\\nSELECT Title\\\\nFROM track\_counts\\\\nWHERE track\_count = (SELECT MAX(track\_count) FROM track\_counts);"}', 'name': 'ask\_database'}, 'type': 'function'}]
[0m`
```
```
`# Step 2: determine if the response from the model includes a tool call.
tool\_calls = response\_message.tool\_calls
if tool\_calls:
# If true the model will return the name of the tool / function to call and the argument(s)
tool\_call\_id = tool\_calls[0].id
tool\_function\_name = tool\_calls[0].function.name
tool\_query\_string = json.loads(tool\_calls[0].function.arguments)['query']
# Step 3: Call the function and retrieve results. Append the results to the messages list.
if tool\_function\_name == 'ask\_database':
results = ask\_database(conn, tool\_query\_string)
messages.append({
"role":"tool",
"tool\_call\_id":tool\_call\_id,
"name": tool\_function\_name,
"content":results
})
# Step 4: Invoke the chat completions API with the function response appended to the messages list
# Note that messages with role 'tool' must be a response to a preceding message with 'tool\_calls'
model\_response\_with\_function\_call = client.chat.completions.create(
model=GPT\_MODEL,
messages=messages,
) # get a new response from the model where it can see the function response
print(f"Result found in database: {model\_response\_with\_function\_call.choices[0].message.content}")
else:
print(f"Error: function {tool\_function\_name} does not exist")
else:
# Model did not identify a function to call, result can be returned to the user
print(response\_message.content)`
```
```
`Result found in database: Greatest Hits`
```
## Next Steps
See our other [notebook](How_to_call_functions_for_knowledge_retrieval.ipynb) that demonstrates how to use the Chat Completions API and functions for knowledge retrieval to interact conversationally with a knowledge base.