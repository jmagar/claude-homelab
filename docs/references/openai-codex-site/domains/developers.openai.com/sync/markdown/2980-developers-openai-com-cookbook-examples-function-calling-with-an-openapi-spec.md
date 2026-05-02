Function calling with an OpenAPI specification
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
Oct 15, 2023
# Function calling with an OpenAPI specification
[ SA ](https://twitter.com/shyamalanadkat)[ SF ](https://twitter.com/simonpfish)
[ Shyamal Anadkat
(OpenAI)
, ](https://twitter.com/shyamalanadkat)[ Simón Fishman
(OpenAI)
](https://twitter.com/simonpfish)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Function_calling_with_an_OpenAPI_spec.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Function_calling_with_an_OpenAPI_spec.ipynb)
Much of the internet is powered by RESTful APIs. Giving GPT the ability to call them opens up a world of possibilities. This notebook demonstrates how GPTs can be used to intelligently call APIs. It leverages OpenAPI specifications and chained function calls.
The [OpenAPI Specification (OAS)](https://swagger.io/specification/) is a universally accepted standard for describing the details of RESTful APIs in a format that machines can read and interpret. It enables both humans and computers to understand the capabilities of a service, and it can be leveraged to show GPT how to call APIs.
This notebook is divided into two main sections:
1. How to convert a sample OpenAPI specification into a list of function definitions for the chat completions API.
2. How to use the chat completions API to intelligently invoke these functions based on user instructions.
We recommend familiariazing yourself with [function-calling](./How_to_call_functions_with_chat_models.ipynb) before proceding.
```
`!pip install -q jsonref # for resolving $ref's in the OpenAPI spec
!pip install -q openai`
```
```
`[33mDEPRECATION: textract 1.6.5 has a non-standard dependency specifier extract-msg\<=0.29.\*. pip 23.3 will enforce this behaviour change. A possible replacement is to upgrade to a newer version of textract or contact the author to suggest that they release a version with a conforming dependency specifiers. Discussion can be found at https://github.com/pypa/pip/issues/12063[0m[33m
[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m A new release of pip is available: [0m[31;49m23.2.1[0m[39;49m -\> [0m[32;49m23.3.1[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m To update, run: [0m[32;49mpip install --upgrade pip[0m
[33mDEPRECATION: textract 1.6.5 has a non-standard dependency specifier extract-msg\<=0.29.\*. pip 23.3 will enforce this behaviour change. A possible replacement is to upgrade to a newer version of textract or contact the author to suggest that they release a version with a conforming dependency specifiers. Discussion can be found at https://github.com/pypa/pip/issues/12063[0m[33m
[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m A new release of pip is available: [0m[31;49m23.2.1[0m[39;49m -\> [0m[32;49m23.3.1[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m To update, run: [0m[32;49mpip install --upgrade pip[0m`
```
```
`import os
import json
import jsonref
from openai import OpenAI
import requests
from pprint import pp
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))`
```
## How to convert an OpenAPI specification into function definitions
The example OpenAPI spec we use here was created using `gpt-4`. We will transform this sample spec into a set of function definitions that can be supplied to the chat completion API. The model, based on the provided user instructions, generates a JSON object containing the necessary arguments to call these functions.
Before we proceed, let’s inspect this generated spec. OpenAPI specs include details about the API’s endpoints, the operations they support, the parameters they accept, the requests they can handle, and the responses they return. The spec is defined in JSON format.
The endpoints in the spec include operations for:
* Listing all events
* Creating a new event
* Retrieving an event by ID
* Deleting an event by ID
* Updating an event name by ID
Each operation in the spec has an `operationId`, which we will use as the function name when we parse the spec into function specifications. The spec also includes schemas that define the data types and structures of the parameters for each operation.
You can see the schema here:
```
`with open('./data/example\_events\_openapi.json', 'r') as f:
openapi\_spec = jsonref.loads(f.read()) # it's important to load with jsonref, as explained below
display(openapi\_spec)`
```
```
`{'openapi': '3.0.0',
'info': {'version': '1.0.0',
'title': 'Event Management API',
'description': 'An API for managing event data'},
'paths': {'/events': {'get': {'summary': 'List all events',
'operationId': 'listEvents',
'responses': {'200': {'description': 'A list of events',
'content': {'application/json': {'schema': {'type': 'array',
'items': {'type': 'object',
'properties': {'id': {'type': 'string'},
'name': {'type': 'string'},
'date': {'type': 'string', 'format': 'date-time'},
'location': {'type': 'string'}},
'required': ['name', 'date', 'location']}}}}}}},
'post': {'summary': 'Create a new event',
'operationId': 'createEvent',
'requestBody': {'required': True,
'content': {'application/json': {'schema': {'type': 'object',
'properties': {'id': {'type': 'string'},
'name': {'type': 'string'},
'date': {'type': 'string', 'format': 'date-time'},
'location': {'type': 'string'}},
'required': ['name', 'date', 'location']}}}},
'responses': {'201': {'description': 'The event was created',
'content': {'application/json': {'schema': {'type': 'object',
'properties': {'id': {'type': 'string'},
'name': {'type': 'string'},
'date': {'type': 'string', 'format': 'date-time'},
'location': {'type': 'string'}},
'required': ['name', 'date', 'location']}}}}}}},
'/events/{id}': {'get': {'summary': 'Retrieve an event by ID',
'operationId': 'getEventById',
'parameters': [{'name': 'id',
'in': 'path',
'required': True,
'schema': {'type': 'string'}}],
'responses': {'200': {'description': 'The event',
'content': {'application/json': {'schema': {'type': 'object',
'properties': {'id': {'type': 'string'},
'name': {'type': 'string'},
'date': {'type': 'string', 'format': 'date-time'},
'location': {'type': 'string'}},
'required': ['name', 'date', 'location']}}}}}},
'delete': {'summary': 'Delete an event by ID',
'operationId': 'deleteEvent',
'parameters': [{'name': 'id',
'in': 'path',
'required': True,
'schema': {'type': 'string'}}],
'responses': {'204': {'description': 'The event was deleted'}}},
'patch': {'summary': "Update an event's details by ID",
'operationId': 'updateEventDetails',
'parameters': [{'name': 'id',
'in': 'path',
'required': True,
'schema': {'type': 'string'}}],
'requestBody': {'required': True,
'content': {'application/json': {'schema': {'type': 'object',
'properties': {'name': {'type': 'string'},
'date': {'type': 'string', 'format': 'date-time'},
'location': {'type': 'string'}},
'required': ['name', 'date', 'location']}}}},
'responses': {'200': {'description': "The event's details were updated",
'content': {'application/json': {'schema': {'type': 'object',
'properties': {'id': {'type': 'string'},
'name': {'type': 'string'},
'date': {'type': 'string', 'format': 'date-time'},
'location': {'type': 'string'}},
'required': ['name', 'date', 'location']}}}}}}}},
'components': {'schemas': {'Event': {'type': 'object',
'properties': {'id': {'type': 'string'},
'name': {'type': 'string'},
'date': {'type': 'string', 'format': 'date-time'},
'location': {'type': 'string'}},
'required': ['name', 'date', 'location']}}}}`
```
Now that we have a good understanding of the OpenAPI spec, we can proceed to parse it into function specifications.
We can write a simple `openapi\_to\_functions` function to generate a list of definitions, where each function is represented as a dictionary containing the following keys:
* `name`: This corresponds to the operation identifier of the API endpoint as defined in the OpenAPI specification.
* `description`: This is a brief description or summary of the function, providing an overview of what the function does.
* `parameters`: This is a schema that defines the expected input parameters for the function. It provides information about the type of each parameter, whether it is required or optional, and other related details.
For each of the endpoints defined in the schema, we need to do the following:
1. **Resolve JSON references**: In an OpenAPI specification, it’s common to use JSON references (also known as $ref) to avoid duplication. These references point to definitions that are used in multiple places. For example, if multiple API endpoints return the same object structure, that structure can be defined once and then referenced wherever it’s needed. We need to resolve and replace these references with the content they point to.
2. **Extract a name for the functions:** We will simply use the operationId as the function name. Alternatively, we could use the endpoint path and operation as the function name.
3. **Extract a description and parameters:** We will iterate through the `description`, `summary`, `requestBody` and `parameters` fields to populate the function’s description and parameters.
Here’s the implementation:
```
`def openapi\_to\_functions(openapi\_spec):
functions = []
for path, methods in openapi\_spec["paths"].items():
for method, spec\_with\_ref in methods.items():
# 1. Resolve JSON references.
spec = jsonref.replace\_refs(spec\_with\_ref)
# 2. Extract a name for the functions.
function\_name = spec.get("operationId")
# 3. Extract a description and parameters.
desc = spec.get("description") or spec.get("summary", "")
schema = {"type": "object", "properties": {}}
req\_body = (
spec.get("requestBody", {})
.get("content", {})
.get("application/json", {})
.get("schema")
)
if req\_body:
schema["properties"]["requestBody"] = req\_body
params = spec.get("parameters", [])
if params:
param\_properties = {
param["name"]: param["schema"]
for param in params
if "schema" in param
}
schema["properties"]["parameters"] = {
"type": "object",
"properties": param\_properties,
}
functions.append(
{"type": "function", "function": {"name": function\_name, "description": desc, "parameters": schema}}
)
return functions
functions = openapi\_to\_functions(openapi\_spec)
for function in functions:
pp(function)
print()`
```
```
`{'type': 'function',
'function': {'name': 'listEvents',
'description': 'List all events',
'parameters': {'type': 'object', 'properties': {}}}}
{'type': 'function',
'function': {'name': 'createEvent',
'description': 'Create a new event',
'parameters': {'type': 'object',
'properties': {'requestBody': {'type': 'object',
'properties': {'id': {'type': 'string'},
'name': {'type': 'string'},
'date': {'type': 'string',
'format': 'date-time'},
'location': {'type': 'string'}},
'required': ['name',
'date',
'location']}}}}}
{'type': 'function',
'function': {'name': 'getEventById',
'description': 'Retrieve an event by ID',
'parameters': {'type': 'object',
'properties': {'parameters': {'type': 'object',
'properties': {'id': {'type': 'string'}}}}}}}
{'type': 'function',
'function': {'name': 'deleteEvent',
'description': 'Delete an event by ID',
'parameters': {'type': 'object',
'properties': {'parameters': {'type': 'object',
'properties': {'id': {'type': 'string'}}}}}}}
{'type': 'function',
'function': {'name': 'updateEventDetails',
'description': "Update an event's details by ID",
'parameters': {'type': 'object',
'properties': {'requestBody': {'type': 'object',
'properties': {'name': {'type': 'string'},
'date': {'type': 'string',
'format': 'date-time'},
'location': {'type': 'string'}},
'required': ['name',
'date',
'location']},
'parameters': {'type': 'object',
'properties': {'id': {'type': 'string'}}}}}}}`
```
## How to call these functions with GPT
Now that we have these function definitions, we can leverage GPT to call them intelligently based on user inputs.
It’s important to note that the chat completions API does not execute the function; instead, it generates the JSON that you can use to call the function in your own code.
For more information on function-calling, refer to our dedicated [function-calling guide](./How_to_call_functions_with_chat_models.ipynb).
```
`SYSTEM\_MESSAGE = """
You are a helpful assistant.
Respond to the following prompt by using function\_call and then summarize actions.
Ask for clarification if a user request is ambiguous.
"""
# Maximum number of function calls allowed to prevent infinite or lengthy loops
MAX\_CALLS = 5
def get\_openai\_response(functions, messages):
return client.chat.completions.create(
model="gpt-3.5-turbo-16k",
tools=functions,
tool\_choice="auto", # "auto" means the model can pick between generating a message or calling a function.
temperature=0,
messages=messages,
)
def process\_user\_instruction(functions, instruction):
num\_calls = 0
messages = [
{"content": SYSTEM\_MESSAGE, "role": "system"},
{"content": instruction, "role": "user"},
]
while num\_calls \< MAX\_CALLS:
response = get\_openai\_response(functions, messages)
message = response.choices[0].message
print(message)
try:
print(f"\\n\>\> Function call #: {num\_calls + 1}\\n")
pp(message.tool\_calls)
messages.append(message)
# For the sake of this example, we'll simply add a message to simulate success.
# Normally, you'd want to call the function here, and append the results to messages.
messages.append(
{
"role": "tool",
"content": "success",
"tool\_call\_id": message.tool\_calls[0].id,
}
)
num\_calls += 1
except:
print("\\n\>\> Message:\\n")
print(message.content)
break
if num\_calls \>= MAX\_CALLS:
print(f"Reached max chained function calls: {MAX\_CALLS}")
USER\_INSTRUCTION = """
Instruction: Get all the events.
Then create a new event named AGI Party.
Then delete event with id 2456.
"""
process\_user\_instruction(functions, USER\_INSTRUCTION)`
```
```
`ChatCompletionMessage(content=None, role='assistant', function\_call=None, tool\_calls=[ChatCompletionMessageToolCall(id='call\_jmlvEyMRMvOtB80adX9RbqIV', function=Function(arguments='{}', name='listEvents'), type='function')])
\>\> Function call #: 1
[ChatCompletionMessageToolCall(id='call\_jmlvEyMRMvOtB80adX9RbqIV', function=Function(arguments='{}', name='listEvents'), type='function')]
ChatCompletionMessage(content=None, role='assistant', function\_call=None, tool\_calls=[ChatCompletionMessageToolCall(id='call\_OOPOY7IHMq3T7Ib71JozlUQJ', function=Function(arguments='{\\n "requestBody": {\\n "id": "1234",\\n "name": "AGI Party",\\n "date": "2022-12-31",\\n "location": "New York"\\n }\\n}', name='createEvent'), type='function')])
\>\> Function call #: 2
[ChatCompletionMessageToolCall(id='call\_OOPOY7IHMq3T7Ib71JozlUQJ', function=Function(arguments='{\\n "requestBody": {\\n "id": "1234",\\n "name": "AGI Party",\\n "date": "2022-12-31",\\n "location": "New York"\\n }\\n}', name='createEvent'), type='function')]
ChatCompletionMessage(content=None, role='assistant', function\_call=None, tool\_calls=[ChatCompletionMessageToolCall(id='call\_Kxluu3fJSOsZNNCn3JIlWAAM', function=Function(arguments='{\\n "parameters": {\\n "id": "2456"\\n }\\n}', name='deleteEvent'), type='function')])
\>\> Function call #: 3
[ChatCompletionMessageToolCall(id='call\_Kxluu3fJSOsZNNCn3JIlWAAM', function=Function(arguments='{\\n "parameters": {\\n "id": "2456"\\n }\\n}', name='deleteEvent'), type='function')]
ChatCompletionMessage(content='Here are the actions I performed:\\n\\n1. Retrieved all the events.\\n2. Created a new event named "AGI Party" with the ID "1234", scheduled for December 31, 2022, in New York.\\n3. Deleted the event with the ID "2456".', role='assistant', function\_call=None, tool\_calls=None)
\>\> Function call #: 4
None
\>\> Message:
Here are the actions I performed:
1. Retrieved all the events.
2. Created a new event named "AGI Party" with the ID "1234", scheduled for December 31, 2022, in New York.
3. Deleted the event with the ID "2456".`
```
### Conclusion
We have demonstrated how to convert OpenAPI specs into function specifications that can be given to GPT for it to intelligently call them, and shown how these can be chained together to perform complex operations.
Possible extensions of this system could include handling more complex user instructions that require conditional logic or looping, integrating with real APIs to perform actual operations, and improving error handling and validation to ensure the instructions are feasible and the function calls are successful.