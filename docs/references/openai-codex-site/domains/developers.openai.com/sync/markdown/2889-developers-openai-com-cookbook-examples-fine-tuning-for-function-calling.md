Fine tuning for function calling
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
Nov 7, 2023
# Fine tuning for function calling
[ JH ](https://twitter.com/jamesmhills)[ IB ](https://twitter.com/ilanbigio)[ SA ](https://twitter.com/shyamalanadkat)[ TM ](https://www.linkedin.com/in/teodora-musatoiu/)
[ James Hills
(OpenAI)
, ](https://twitter.com/jamesmhills)[ Ilan Bigio
(OpenAI)
, ](https://twitter.com/ilanbigio)[ Shyamal Anadkat
(OpenAI)
, ](https://twitter.com/shyamalanadkat)[ Teodora Musatoiu
(OpenAI)
](https://www.linkedin.com/in/teodora-musatoiu/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Fine_tuning_for_function_calling.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Fine_tuning_for_function_calling.ipynb)
This notebook covers how to fine-tune to increase function calling accuracy and reliability. You can find more information on function calling [here](https://github.com/openai/openai-cookbook/blob/main/examples/How_to_call_functions_with_chat_models.ipynb), and on fine tuning [here](https://github.com/openai/openai-cookbook/blob/main/examples/How_to_finetune_chat_models.ipynb)
For context, from the function calling notebook above:
>
`> tools
`> is an optional parameter in the Chat Completion API which can be used to provide function specifications. The purpose of this is to enable models to generate function arguments which adhere to the provided specifications. Note that the API will not actually execute any function calls. It is up to developers to execute function calls using model outputs.
>
Function calling is a very powerful tool when it functions as intended. However, we have seen that as the number of functions increases, and the complexity of the task at hand increases, function calling becomes less accurate (e.g.: more hallucinated invocations, and incorrect invocations).
Before fine tuning for function calling, it’s best to begin with:
* Improvements to the function definitions. Make them more clear, and more distinct from one another.
* Experiment with prompt engineering: often a more detailed prompt can help the model call the correct function.
*If* the steps above fail to improve function calling to a satisfactory level, then you can try fine tuning for function calling.
### Overview
This notebook contains three sections
* **Assessing baseline function calling performance:** Evaluating an out-of-the-box `gpt-3.5-turbo` model on our given function (let’s assume that for latency + cost reasons we cannot use `gpt-4o` for a drone copilot)
* **Generating synthetic data:** Using `gpt-4o` to create ‘golden’ set of prompts and function invocations to use as training data
* **Fine-tuning**: Running the fine tuning job, and evaluating the fine-tuned model
Note: *This notebook provides an example of how to create synthetic training data for fine tuning for function calling given just a list of functions. While real-world production test evals are preferable, this method produces strong results and can be used in conjunction with real-world training data.*
# Getting baseline function calling performance
```
`#!pip install tenacity -q
#!pip install openai -q
#!pip install typing -q
# !pip install python-dotenv`
```
```
`import numpy as np
import json
import os
from IPython.display import display
import pandas as pd
from openai import OpenAI
import itertools
import time
import base64
from tenacity import retry, wait\_random\_exponential, stop\_after\_attempt
from typing import Any, Dict, List, Generator
import ast
%load\_ext dotenv
%dotenv
client = OpenAI(api\_key=os.environ.get("OPENAI\_BUILD\_HOUR\_KEY"))`
```
```
`The dotenv extension is already loaded. To reload it, use:
%reload\_ext dotenv`
```
### Utilities
Let’s define utility functions for making calls to the Chat Completions API, one to get the completion and one to get the function call.
```
`def get\_chat\_completion(
messages: list[dict[str, str]],
model: str = "gpt-3.5-turbo",
max\_tokens=500,
temperature=0.0,
stop=None,
tools=None,
seed=42,
functions=None,
tool\_choice=None,
) -\> str:
params = {
"model": model,
"messages": messages,
"max\_tokens": max\_tokens,
"temperature": temperature,
"stop": stop,
"tools": tools,
"seed": seed,
"tool\_choice": tool\_choice,
}
if functions:
params["functions"] = functions
completion = client.chat.completions.create(\*\*params)
return completion.choices[0].message, completion.usage
def eval(model: str, system\_prompt: str, function\_list, prompts\_to\_expected\_tool\_name):
"""
Evaluate the performance of a model in selecting the correct function based on given prompts.
Args:
model (str): The name of the model to be evaluated.
system\_prompt (str): The system prompt to be used in the chat completion.
function\_list (list): A list of functions that the model can call.
prompts\_to\_expected\_tool\_name (dict): A dictionary mapping prompts to their expected function names.
Returns:
None
"""
prompts\_to\_actual = []
latencies = []
tokens\_used = []
for prompt, expected\_function in prompts\_to\_expected\_tool\_name.items():
messages = [
{"role": "system", "content": system\_prompt},
{"role": "user", "content": prompt},
]
start\_time = time.time()
completion, usage = get\_chat\_completion(
model=model,
messages=messages,
seed=42,
tools=function\_list,
temperature=0.0,
tool\_choice="required",
)
end\_time = time.time()
latency = (end\_time - start\_time) \* 1000 # convert to milliseconds
latencies.append(latency)
prompts\_to\_actual.append(
{prompt: completion.tool\_calls[0].function.name})
# Calculate tokens used
tokens\_used.append(usage.total\_tokens)
total\_prompts = len(prompts\_to\_expected\_tool\_name)
# Calculate the number of matches
matches = sum(
1
for result in prompts\_to\_actual
if list(result.values())[0]
== prompts\_to\_expected\_tool\_name[list(result.keys())[0]]
)
match\_percentage = (matches / total\_prompts) \* 100
# Calculate average latency
avg\_latency = sum(latencies) / total\_prompts
# Calculate average tokens used
avg\_tokens\_used = sum(tokens\_used) / total\_prompts
# Create a DataFrame to store the results
results\_df = pd.DataFrame(columns=["Prompt", "Expected", "Match"])
results\_list = []
for result in prompts\_to\_actual:
prompt = list(result.keys())[0]
actual\_function = list(result.values())[0]
expected\_function = prompts\_to\_expected\_tool\_name[prompt]
match = actual\_function == expected\_function
results\_list.append(
{
"Prompt": prompt,
"Actual": actual\_function,
"Expected": expected\_function,
"Match": "Yes" if match else "No",
}
)
results\_df = pd.DataFrame(results\_list)
def style\_rows(row):
match = row["Match"]
background\_color = "red" if match == "No" else "white"
return ["background-color: {}; color: black".format(background\_color)] \* len(
row
)
styled\_results\_df = results\_df.style.apply(style\_rows, axis=1)
# Display the DataFrame as a table
display(styled\_results\_df)
print(
f"Number of matches: {matches} out of {total\_prompts} ({match\_percentage:.2f}%)"
)
print(f"Average latency per request: {avg\_latency:.2f} ms")
print(f"Average tokens used per request: {avg\_tokens\_used:.2f}")`
```
### Baseline testing
Let’s build an intelligent drone co-pilot. We want to be able to give the co-pilot commands, and have it either call the function
for that command, or deny that request if the command is unfeasible.
We can first define a system prompt for the copilot.
```
`DRONE\_SYSTEM\_PROMPT = """You are an intelligent AI that controls a drone. Given a command or request from the user,
call one of your functions to complete the request. If the request cannot be completed by your available functions, call the reject\_request function.
If the request is ambiguous or unclear, reject the request."""`
```
Now let’s define functions for all of the actions the copilot can take.
```
`function\_list = [
{
"type": "function",
"function": {
"name": "takeoff\_drone",
"description": "Initiate the drone's takeoff sequence.",
"parameters": {
"type": "object",
"properties": {
"altitude": {
"type": "integer",
"description": "Specifies the altitude in meters to which the drone should ascend.",
}
},
"required": ["altitude"],
},
},
},
{
"type": "function",
"function": {
"name": "land\_drone",
"description": "Land the drone at its current location or a specified landing point.",
"parameters": {
"type": "object",
"properties": {
"location": {
"type": "string",
"enum": ["current", "home\_base", "custom"],
"description": "Specifies the landing location for the drone.",
},
"coordinates": {
"type": "object",
"description": "GPS coordinates for custom landing location. Required if location is 'custom'.",
},
},
"required": ["location"],
},
},
},
{
"type": "function",
"function": {
"name": "control\_drone\_movement",
"description": "Direct the drone's movement in a specific direction.",
"parameters": {
"type": "object",
"properties": {
"direction": {
"type": "string",
"enum": ["forward", "backward", "left", "right", "up", "down"],
"description": "Direction in which the drone should move.",
},
"distance": {
"type": "integer",
"description": "Distance in meters the drone should travel in the specified direction.",
},
},
"required": ["direction", "distance"],
},
},
},
{
"type": "function",
"function": {
"name": "set\_drone\_speed",
"description": "Adjust the speed of the drone.",
"parameters": {
"type": "object",
"properties": {
"speed": {
"type": "integer",
"description": "Specifies the speed in km/h. Valid range is 0 to 100.",
"minimum": 0,
}
},
"required": ["speed"],
},
},
},
{
"type": "function",
"function": {
"name": "control\_camera",
"description": "Control the drone's camera to capture images or videos.",
"parameters": {
"type": "object",
"properties": {
"mode": {
"type": "string",
"enum": ["photo", "video", "panorama"],
"description": "Camera mode to capture content.",
},
"duration": {
"type": "integer",
"description": "Duration in seconds for video capture. Required if mode is 'video'.",
},
},
"required": ["mode"],
},
},
},
{
"type": "function",
"function": {
"name": "control\_gimbal",
"description": "Adjust the drone's gimbal for camera stabilization and direction.",
"parameters": {
"type": "object",
"properties": {
"tilt": {
"type": "integer",
"description": "Tilt angle for the gimbal in degrees.",
},
"pan": {
"type": "integer",
"description": "Pan angle for the gimbal in degrees.",
},
},
"required": ["tilt", "pan"],
},
},
},
{
"type": "function",
"function": {
"name": "set\_drone\_lighting",
"description": "Control the drone's lighting for visibility and signaling.",
"parameters": {
"type": "object",
"properties": {
"mode": {
"type": "string",
"enum": ["on", "off", "blink", "sos"],
"description": "Lighting mode for the drone.",
}
},
"required": ["mode"],
},
},
},
{
"type": "function",
"function": {
"name": "return\_to\_home",
"description": "Command the drone to return to its home or launch location.",
"parameters": {"type": "object", "properties": {}},
},
},
{
"type": "function",
"function": {
"name": "set\_battery\_saver\_mode",
"description": "Toggle battery saver mode.",
"parameters": {
"type": "object",
"properties": {
"status": {
"type": "string",
"enum": ["on", "off"],
"description": "Toggle battery saver mode.",
}
},
"required": ["status"],
},
},
},
{
"type": "function",
"function": {
"name": "set\_obstacle\_avoidance",
"description": "Configure obstacle avoidance settings.",
"parameters": {
"type": "object",
"properties": {
"mode": {
"type": "string",
"enum": ["on", "off"],
"description": "Toggle obstacle avoidance.",
}
},
"required": ["mode"],
},
},
},
{
"type": "function",
"function": {
"name": "set\_follow\_me\_mode",
"description": "Enable or disable 'follow me' mode.",
"parameters": {
"type": "object",
"properties": {
"status": {
"type": "string",
"enum": ["on", "off"],
"description": "Toggle 'follow me' mode.",
}
},
"required": ["status"],
},
},
},
{
"type": "function",
"function": {
"name": "calibrate\_sensors",
"description": "Initiate calibration sequence for drone's sensors.",
"parameters": {"type": "object", "properties": {}},
},
},
{
"type": "function",
"function": {
"name": "set\_autopilot",
"description": "Enable or disable autopilot mode.",
"parameters": {
"type": "object",
"properties": {
"status": {
"type": "string",
"enum": ["on", "off"],
"description": "Toggle autopilot mode.",
}
},
"required": ["status"],
},
},
},
{
"type": "function",
"function": {
"name": "configure\_led\_display",
"description": "Configure the drone's LED display pattern and colors.",
"parameters": {
"type": "object",
"properties": {
"pattern": {
"type": "string",
"enum": ["solid", "blink", "pulse", "rainbow"],
"description": "Pattern for the LED display.",
},
"color": {
"type": "string",
"enum": ["red", "blue", "green", "yellow", "white"],
"description": "Color for the LED display. Not required if pattern is 'rainbow'.",
},
},
"required": ["pattern"],
},
},
},
{
"type": "function",
"function": {
"name": "set\_home\_location",
"description": "Set or change the home location for the drone.",
"parameters": {
"type": "object",
"properties": {
"coordinates": {
"type": "object",
"description": "GPS coordinates for the home location.",
}
},
"required": ["coordinates"],
},
},
},
{
"type": "function",
"function": {
"name": "reject\_request",
"description": "Use this function if the request is not possible.",
"parameters": {"type": "object", "properties": {}},
},
},
]`
```
For starters, let’s see how function calling performs with some straight forward feasible prompts, and then couple of obviously impossible requests which call the ‘reject\_request’ function.
```
`straightforward\_prompts\_to\_expected = {
"Land the drone at the home base": "land\_drone",
"Take off the drone to 50 meters": "takeoff\_drone",
"Change speed to 15 kilometers per hour": "set\_drone\_speed",
"Turn into an elephant!": "reject\_request",
"Move the drone forward by 10 meters": "control\_drone\_movement",
"I want the LED display to blink in red": "configure\_led\_display",
"Can you take a photo?": "control\_camera",
"Can you detect obstacles?": "set\_obstacle\_avoidance",
"Can you dance for me?": "reject\_request",
"Can you follow me?": "set\_follow\_me\_mode",
}`
```
```
`# Evaluate the model with the given prompts
eval(
model="gpt-3.5-turbo",
system\_prompt=DRONE\_SYSTEM\_PROMPT,
function\_list=function\_list,
prompts\_to\_expected\_tool\_name=straightforward\_prompts\_to\_expected,
)`
```
| |Prompt|Actual|Expected|Match|
|0|Land the drone at the home base|land\_drone|land\_drone|Yes|
|1|Take off the drone to 50 meters|takeoff\_drone|takeoff\_drone|Yes|
|2|Change speed to 15 kilometers per hour|set\_drone\_speed|set\_drone\_speed|Yes|
|3|Turn into an elephant!|reject\_request|reject\_request|Yes|
|4|Move the drone forward by 10 meters|control\_drone\_movement|control\_drone\_movement|Yes|
|5|I want the LED display to blink in red|configure\_led\_display|configure\_led\_display|Yes|
|6|Can you take a photo?|control\_camera|control\_camera|Yes|
|7|Can you detect obstacles?|set\_obstacle\_avoidance|set\_obstacle\_avoidance|Yes|
|8|Can you dance for me?|reject\_request|reject\_request|Yes|
|9|Can you follow me?|set\_follow\_me\_mode|set\_follow\_me\_mode|Yes|
```
`Number of matches: 10 out of 10 (100.00%)
Average latency per request: 826.81 ms
Average tokens used per request: 796.20`
```
Nice! The model performs quite well with these requests. Now let’s try some more difficult requests: requests that are *almost* feasible and are drone-related, but that the drone cannot actually do, and the pilot should reject.
```
`challenging\_prompts\_to\_expected = {
"Play pre-recorded audio message": "reject\_request",
"Initiate following on social media": "reject\_request",
"Scan environment for heat signatures": "reject\_request",
"Bump into obstacles": "reject\_request",
"Change drone's paint job color": "reject\_request",
"Coordinate with nearby drones": "reject\_request",
"Change speed to negative 120 km/h": "reject\_request",
"Detect a person": "reject\_request",
"Please enable night vision": "reject\_request",
"Report on humidity levels around you": "reject\_request",
}`
```
```
`# Evaluate the model with the challenging prompts
eval(
model="gpt-3.5-turbo",
function\_list=function\_list,
system\_prompt=DRONE\_SYSTEM\_PROMPT,
prompts\_to\_expected\_tool\_name=challenging\_prompts\_to\_expected,
)`
```
| |Prompt|Actual|Expected|Match|
|0|Play pre-recorded audio message|reject\_request|reject\_request|Yes|
|1|Initiate following on social media|set\_follow\_me\_mode|reject\_request|No|
|2|Scan environment for heat signatures|reject\_request|reject\_request|Yes|
|3|Bump into obstacles|set\_obstacle\_avoidance|reject\_request|No|
|4|Change drone's paint job color|reject\_request|reject\_request|Yes|
|5|Coordinate with nearby drones|reject\_request|reject\_request|Yes|
|6|Change speed to negative 120 km/h|set\_drone\_speed|reject\_request|No|
|7|Detect a person|reject\_request|reject\_request|Yes|
|8|Please enable night vision|set\_drone\_lighting|reject\_request|No|
|9|Report on humidity levels around you|reject\_request|reject\_request|Yes|
```
`Number of matches: 6 out of 10 (60.00%)
Average latency per request: 610.26 ms
Average tokens used per request: 791.90`
```
Now we run into some problems.
The model here should reject all of these requests, as they are impossible/conflicting/ambiguous given the functions, however instead the model calls functions that are somewhat related to the request, but incorrect. For example, the model sets follow\_me\_mode when asked to initiate following on social media.
In this simple case, more prompt engineering may resolve some of these issues, but for the purpose of this example we will demonstrate how fine tuning can be used to improve performance. Additionally, while this case is relatively straightforward, as the number of and complexity of the functions increases, fine tuning becomes more and more impactful.
Again, our goal here is to improve performance and use less tokens, so fine-tuning allows us to:
* Omit function and parameter descriptions: remove the description field from function and parameters
* Omit parameters: remove the entire properties field from the parameters object
* Omit function entirely: remove the entire function object from the functions array
# Generating synthetic data
### Helper functions
We want to generate every invocation of every function, so that we have
full coverage of all potential invocations to create synthetic data for. Then, we will use `gpt-4o` to come up with prompts that would call each invocation, and we will use that prompt - function invocation pair as training data.
Generating every invocation for a function with fixed enums is more simple, but for a function such as
`control\_gimbal` we need to set the `tilt` and `pan` integer values, so to generate those synthetic invocations we will first set a placeholder, and then later use `gpt-4o` to come up with reasonable values.
```
`placeholder\_int = "fill\_in\_int"
placeholder\_string = "fill\_in\_string"`
```
The functions below take in all the functions from the function list, and look
at all the potential invocations of those functions given each function’s parameters.
The functions also account for `required` parameters, so that all the invocations
are actually feasible.
```
`def generate\_permutations(
params: Dict[str, Dict[str, Any]]
) -\> Generator[Dict[str, Any], None, None]:
"""
Generates all possible permutations for given parameters.
:param params: Parameter dictionary containing required and optional fields.
:return: A generator yielding each permutation.
"""
# Extract the required fields from the parameters
required\_fields = params.get("required", [])
# Generate permutations for required fields
required\_permutations = generate\_required\_permutations(params, required\_fields)
# Generate optional permutations based on each required permutation
for required\_perm in required\_permutations:
yield from generate\_optional\_permutations(params, required\_perm)
def generate\_required\_permutations(
params: Dict[str, Dict[str, Any]], required\_fields: List[str]
) -\> List[Dict[str, Any]]:
"""
Generates permutations for the required fields.
:param params: Parameter dictionary.
:param required\_fields: List of required fields.
:return: A list of permutations for required fields.
"""
# Get all possible values for each required field
required\_values = [get\_possible\_values(params, field) for field in required\_fields]
# Generate permutations from possible values
return [
dict(zip(required\_fields, values))
for values in itertools.product(\*required\_values)
]
def generate\_optional\_permutations(
params: Dict[str, Dict[str, Any]], base\_perm: Dict[str, Any]
) -\> Generator[Dict[str, Any], None, None]:
"""
Generates permutations for optional fields based on a base permutation.
:param params: Parameter dictionary.
:param base\_perm: Base permutation dictionary.
:return: A generator yielding each permutation for optional fields.
"""
# Determine the fields that are optional by subtracting the base permutation's fields from all properties
optional\_fields = set(params["properties"]) - set(base\_perm)
# Iterate through all combinations of optional fields
for field\_subset in itertools.chain.from\_iterable(
itertools.combinations(optional\_fields, r)
for r in range(len(optional\_fields) + 1)
):
# Generate product of possible values for the current subset of fields
for values in itertools.product(
\*(get\_possible\_values(params, field) for field in field\_subset)
):
# Create a new permutation by combining base permutation and current field values
new\_perm = {\*\*base\_perm, \*\*dict(zip(field\_subset, values))}
yield new\_perm
def get\_possible\_values(params: Dict[str, Dict[str, Any]], field: str) -\> List[Any]:
"""
Retrieves possible values for a given field.
:param params: Parameter dictionary.
:param field: The field for which to get possible values.
:return: A list of possible values.
"""
# Extract field information from the parameters
field\_info = params["properties"][field]
# Based on the field's type or presence of 'enum', determine and return the possible values
if "enum" in field\_info:
return field\_info["enum"]
elif field\_info["type"] == "integer":
return [placeholder\_int]
elif field\_info["type"] == "string":
return [placeholder\_string]
elif field\_info["type"] == "boolean":
return [True, False]
elif field\_info["type"] == "array" and "enum" in field\_info["items"]:
enum\_values = field\_info["items"]["enum"]
all\_combinations = [
list(combo)
for i in range(1, len(enum\_values) + 1)
for combo in itertools.combinations(enum\_values, i)
]
return all\_combinations
return []`
```
### Let’s generate every invocation for every function first
Prompts:
```
`INVOCATION\_FILLER\_PROMPT = """
1) Input reasonable values for 'fill\_in\_string' and 'fill\_in\_int' in the invocation here: {invocation}. Reasonable values are determined by the function definition. Use the
the entire function provided here :{function} to get context over what proper fill\_in\_string and fill\_in\_int values would be.
Example:
Input: invocation: {{
"name": "control\_camera",
"arguments": {{
"mode":"video",
"duration":"fill\_in\_int"
}}
}},
function:{function}
Output: invocation: {{
"name": "control\_camera",
"arguments": {{
"mode":"video",
"duration": 30
}}
}}
MAKE SURE output is just a dictionary with keys 'name' and 'arguments', no other text or response.
Input: {invocation}
Output:
"""
COMMAND\_GENERATION\_PROMPT = """
You are to output 2 commands, questions or statements that would generate the inputted function and parameters.
Please make the commands or questions natural, as a person would ask, and the command or questions should be varied and not repetitive.
It should not always mirror the exact technical terminology used in the function and parameters, rather reflect a conversational and intuitive request.
For instance, the prompt should not be 'turn on the dome light', as that is too technical, but rather 'turn on the inside lights'.
Another example, is the prompt should not be 'turn on the HVAC', but rather 'turn on the air conditioning'. Use language a normal driver would use, even if
it is technically incorrect but colloquially used.
RULES: ALWAYS put a backwards slash before an apostrophe or single quote '. For example, do not say don't but say don\\'t.
Prompts MUST be in double quotes as well.
Example
Input: {{'name': 'calibrate\_sensors','arguments': {{}}'' }}
Prompt: ["The sensors are out of whack, can you reset them", "The calibration of the drone is off, fix it please!"]
Input: {{'name': 'set\_autopilot','arguments': {{'status': 'off'}}}}
Prompt: ["OK, I want to take back pilot control now","Turn off the automatic pilot I'm ready control it"]
Input: {invocation}
Prompt:
"""`
```
In the below snippet, we generate the invocation of each function except for the `reject\_request` function.
To perform effective fine-tuning we need correctly labeled data. We could manually come up with examples and label the data,
or we can generate synthetic data with the help of `gpt-4o`
Empirically, `gpt-4o` needs a bit more help to get good realistic examples of prompts that would generate the `reject\_request` function, so we’ll do that next…
```
`input\_objects = []
all\_but\_reject = [f for f in function\_list if f.get("name") != "reject\_request"]
for function in all\_but\_reject:
func\_name = function["function"]["name"]
params = function["function"]["parameters"]
for arguments in generate\_permutations(params):
if any(val in arguments.values() for val in ["fill\_in\_int", "fill\_in\_str"]):
input\_object = {"name": func\_name, "arguments": arguments}
messages = [
{
"role": "user",
"content": INVOCATION\_FILLER\_PROMPT.format(
invocation=str(input\_object), function=function
),
}
]
input\_object, usage = get\_chat\_completion(
model="gpt-4o", messages=messages, max\_tokens=200, temperature=0.1
).content
else:
input\_object = {"name": func\_name, "arguments": arguments}
input\_objects.append(input\_object)`
```
Now that we have all the invocations, let’s use `gpt-4o` to generate prompts that would result in those invocations
```
`def remove\_sequences(input\_string):
# Replace the specific sequences with an empty string
cleaned\_string = input\_string.replace("```json", "") # Remove "```json" first
cleaned\_string = cleaned\_string.replace("```", "") # Then remove "```"
return json.loads(cleaned\_string)`
```
```
`def create\_commands(invocation\_list):
example\_list = []
for i, invocation in enumerate(invocation\_list):
if i \< 100:
print(
f"\\033[34m{np.round(100\*i/len(invocation\_list),1)}% complete\\033[0m")
if type(invocation) == str or "json" in invocation:
invocation = remove\_sequences(invocation)
print(invocation)
# Format the prompt with the invocation string
request\_prompt = COMMAND\_GENERATION\_PROMPT.format(
invocation=invocation)
messages = [{"role": "user", "content": f"{request\_prompt}"}]
completion, usage = get\_chat\_completion(messages, temperature=0.8)
command\_dict = {"Input": invocation, "Prompt": completion.content}
example\_list.append(command\_dict)
return example\_list`
```
```
`# Only printing the first 10 rows
training\_examples\_unformatted = create\_commands(input\_objects)`
```
```
`[34m0.0% complete[0m
{'name': 'takeoff\_drone', 'arguments': {'altitude': 100}}
[34m1.8% complete[0m
{'name': 'land\_drone', 'arguments': {'location': 'current'}}
[34m3.5% complete[0m
{'name': 'land\_drone', 'arguments': {'location': 'home\_base'}}
[34m5.3% complete[0m
{'name': 'land\_drone', 'arguments': {'location': 'custom'}}
[34m7.0% complete[0m
{'name': 'control\_drone\_movement', 'arguments': {'direction': 'forward', 'distance': 100}}
[34m8.8% complete[0m
{'name': 'control\_drone\_movement', 'arguments': {'direction': 'backward', 'distance': 50}}
[34m10.5% complete[0m
{'name': 'control\_drone\_movement', 'arguments': {'direction': 'left', 'distance': 10}}
[34m12.3% complete[0m
{'name': 'control\_drone\_movement', 'arguments': {'direction': 'right', 'distance': 10}}
[34m14.0% complete[0m
{'name': 'control\_drone\_movement', 'arguments': {'direction': 'up', 'distance': 10}}
[34m15.8% complete[0m
{'name': 'control\_drone\_movement', 'arguments': {'direction': 'down', 'distance': 10}}
[34m17.5% complete[0m
{'name': 'set\_drone\_speed', 'arguments': {'speed': 10}}
[34m19.3% complete[0m
{'name': 'control\_camera', 'arguments': {'mode': 'photo'}}
[34m21.1% complete[0m
{'name': 'control\_camera', 'arguments': {'mode': 'photo', 'duration': 10}}
[34m22.8% complete[0m
{'name': 'control\_camera', 'arguments': {'mode': 'video'}}
[34m24.6% complete[0m
{'name': 'control\_camera', 'arguments': {'mode': 'video', 'duration': 60}}
[34m26.3% complete[0m
{'name': 'control\_camera', 'arguments': {'mode': 'panorama'}}
[34m28.1% complete[0m
{'name': 'control\_camera', 'arguments': {'mode': 'panorama', 'duration': 60}}
[34m29.8% complete[0m
{'name': 'control\_gimbal', 'arguments': {'tilt': 45, 'pan': 90}}
[34m31.6% complete[0m
{'name': 'set\_drone\_lighting', 'arguments': {'mode': 'on'}}
[34m33.3% complete[0m
{'name': 'set\_drone\_lighting', 'arguments': {'mode': 'off'}}
[34m35.1% complete[0m
{'name': 'set\_drone\_lighting', 'arguments': {'mode': 'blink'}}
[34m36.8% complete[0m
{'name': 'set\_drone\_lighting', 'arguments': {'mode': 'sos'}}
[34m38.6% complete[0m
{'name': 'return\_to\_home', 'arguments': {}}
[34m40.4% complete[0m
{'name': 'set\_battery\_saver\_mode', 'arguments': {'status': 'on'}}
[34m42.1% complete[0m
{'name': 'set\_battery\_saver\_mode', 'arguments': {'status': 'off'}}
[34m43.9% complete[0m
{'name': 'set\_obstacle\_avoidance', 'arguments': {'mode': 'on'}}
[34m45.6% complete[0m
{'name': 'set\_obstacle\_avoidance', 'arguments': {'mode': 'off'}}
[34m47.4% complete[0m
{'name': 'set\_follow\_me\_mode', 'arguments': {'status': 'on'}}
[34m49.1% complete[0m
{'name': 'set\_follow\_me\_mode', 'arguments': {'status': 'off'}}
[34m50.9% complete[0m
{'name': 'calibrate\_sensors', 'arguments': {}}
[34m52.6% complete[0m
{'name': 'set\_autopilot', 'arguments': {'status': 'on'}}
[34m54.4% complete[0m
{'name': 'set\_autopilot', 'arguments': {'status': 'off'}}
[34m56.1% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'solid'}}
[34m57.9% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'solid', 'color': 'red'}}
[34m59.6% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'solid', 'color': 'blue'}}
[34m61.4% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'solid', 'color': 'green'}}
[34m63.2% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'solid', 'color': 'yellow'}}
[34m64.9% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'solid', 'color': 'white'}}
[34m66.7% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'blink'}}
[34m68.4% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'blink', 'color': 'red'}}
[34m70.2% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'blink', 'color': 'blue'}}
[34m71.9% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'blink', 'color': 'green'}}
[34m73.7% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'blink', 'color': 'yellow'}}
[34m75.4% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'blink', 'color': 'white'}}
[34m77.2% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'pulse'}}
[34m78.9% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'pulse', 'color': 'red'}}
[34m80.7% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'pulse', 'color': 'blue'}}
[34m82.5% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'pulse', 'color': 'green'}}
[34m84.2% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'pulse', 'color': 'yellow'}}
[34m86.0% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'pulse', 'color': 'white'}}
[34m87.7% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'rainbow'}}
[34m89.5% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'rainbow', 'color': 'red'}}
[34m91.2% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'rainbow', 'color': 'blue'}}
[34m93.0% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'rainbow', 'color': 'green'}}
[34m94.7% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'rainbow', 'color': 'yellow'}}
[34m96.5% complete[0m
{'name': 'configure\_led\_display', 'arguments': {'pattern': 'rainbow', 'color': 'white'}}
[34m98.2% complete[0m
{'name': 'reject\_request', 'arguments': {}}`
```
Now let’s format the training examples properly. For more documentation on the proper training data formatting for fine tuning for function calling, see here: [https://platform.openai.com/docs/guides/fine-tuning/fine-tuning-examples](https://platform.openai.com/docs/guides/fine-tuning/fine-tuning-examples)
```
`def remove\_descriptions(function\_list):
for function in function\_list:
func = function["function"]
if "description" in func:
del func["description"]
params = func["parameters"]
if "properties" in params:
for param in params["properties"].values():
if "description" in param:
del param["description"]
return function\_list
modified\_function\_list = remove\_descriptions(function\_list)`
```
```
`training\_examples = []
for prompt in training\_examples\_unformatted:
# adjust formatting for training data specs
# if its not a dict, convert to dict
if type(prompt["Input"]) != dict:
prompt["Input"] = ast.literal\_eval(prompt["Input"])
prompt["Input"]["arguments"] = json.dumps(prompt["Input"]["arguments"])
try:
prompt["Prompt"] = json.loads(prompt["Prompt"])
except:
continue
for p in prompt["Prompt"]:
print(p)
print(prompt["Input"])
tool\_calls = [
{"id": "call\_id", "type": "function", "function": prompt["Input"]}
]
training\_examples.append(
{
"messages": [
{"role": "system", "content": DRONE\_SYSTEM\_PROMPT},
{"role": "user", "content": p},
{"role": "assistant", "tool\_calls": tool\_calls},
],
"parallel\_tool\_calls": False,
"tools": modified\_function\_list,
}
)`
```
```
`Let's get the drone in the air, how high should it go?
{'name': 'takeoff\_drone', 'arguments': '{"altitude": 100}'}
Ready for takeoff, how high should the drone fly?
{'name': 'takeoff\_drone', 'arguments': '{"altitude": 100}'}
Can you bring the drone down to where we are?
{'name': 'land\_drone', 'arguments': '{"location": "current"}'}
Let's get the drone to land right here
{'name': 'land\_drone', 'arguments': '{"location": "current"}'}
Bring the drone back to base for landing
{'name': 'land\_drone', 'arguments': '{"location": "home\_base"}'}
Can you safely land the drone at home base
{'name': 'land\_drone', 'arguments': '{"location": "home\_base"}'}
Can you make the drone move to the left by 10 units?
{'name': 'control\_drone\_movement', 'arguments': '{"direction": "left", "distance": 10}'}
I need the drone to go left, could you move it 10 steps that way?
{'name': 'control\_drone\_movement', 'arguments': '{"direction": "left", "distance": 10}'}
Can you move the drone to the right by 10 feet?
{'name': 'control\_drone\_movement', 'arguments': '{"direction": "right", "distance": 10}'}
I need the drone to go 10 feet to the right, can you do that?
{'name': 'control\_drone\_movement', 'arguments': '{"direction": "right", "distance": 10}'}
Can you make the drone go upwards by 10 units?
{'name': 'control\_drone\_movement', 'arguments': '{"direction": "up", "distance": 10}'}
I need the drone to move up, can you do that for me?
{'name': 'control\_drone\_movement', 'arguments': '{"direction": "up", "distance": 10}'}
Can you bring the drone lower by 10 feet please?
{'name': 'control\_drone\_movement', 'arguments': '{"direction": "down", "distance": 10}'}
I need the drone to descend 10 units, can you make that happen?
{'name': 'control\_drone\_movement', 'arguments': '{"direction": "down", "distance": 10}'}
Can you make the drone go faster?
{'name': 'set\_drone\_speed', 'arguments': '{"speed": 10}'}
I think the drone should speed up a bit, don't you think?
{'name': 'set\_drone\_speed', 'arguments': '{"speed": 10}'}
I want to take a picture, can you switch the camera mode to photo
{'name': 'control\_camera', 'arguments': '{"mode": "photo"}'}
Let's capture this moment, switch the camera to photo mode please
{'name': 'control\_camera', 'arguments': '{"mode": "photo"}'}
Can you switch the camera to photo mode and take a picture for 10 seconds?
{'name': 'control\_camera', 'arguments': '{"mode": "photo", "duration": 10}'}
I need to capture something, can you set the camera to take photos for 10 seconds?
{'name': 'control\_camera', 'arguments': '{"mode": "photo", "duration": 10}'}
Can you switch the camera to video mode?
{'name': 'control\_camera', 'arguments': '{"mode": "video"}'}
I want to record, can you set the camera to video mode?
{'name': 'control\_camera', 'arguments': '{"mode": "video"}'}
Can you start recording a video with the camera for a minute
{'name': 'control\_camera', 'arguments': '{"mode": "video", "duration": 60}'}
I need to film something, can you put the camera in video mode for 60 seconds
{'name': 'control\_camera', 'arguments': '{"mode": "video", "duration": 60}'}
Can you switch the camera to panorama mode?
{'name': 'control\_camera', 'arguments': '{"mode": "panorama"}'}
I'd like to take a 360-degree photo, can you set the camera to panorama mode?
{'name': 'control\_camera', 'arguments': '{"mode": "panorama"}'}
Can you set the camera to take a panorama shot for a minute
{'name': 'control\_camera', 'arguments': '{"mode": "panorama", "duration": 60}'}
I'd like to switch the camera mode to panorama and have it last for a minute
{'name': 'control\_camera', 'arguments': '{"mode": "panorama", "duration": 60}'}
Can you adjust the camera angle up and to the right?
{'name': 'control\_gimbal', 'arguments': '{"tilt": 45, "pan": 90}'}
I need to tilt the camera up and pan it to the right, can you do that?
{'name': 'control\_gimbal', 'arguments': '{"tilt": 45, "pan": 90}'}
Can you turn on the lights for the drone
{'name': 'set\_drone\_lighting', 'arguments': '{"mode": "on"}'}
I need some extra light, can you activate it on the drone
{'name': 'set\_drone\_lighting', 'arguments': '{"mode": "on"}'}
Can you turn off the lights on the drone
{'name': 'set\_drone\_lighting', 'arguments': '{"mode": "off"}'}
I don't need the drone lights on, can you switch them off
{'name': 'set\_drone\_lighting', 'arguments': '{"mode": "off"}'}
Can you make the drone lights flash?
{'name': 'set\_drone\_lighting', 'arguments': '{"mode": "blink"}'}
I want the drone lights to blink, can you do that?
{'name': 'set\_drone\_lighting', 'arguments': '{"mode": "blink"}'}
Can you switch the drone lights to the SOS mode, just in case?
{'name': 'set\_drone\_lighting', 'arguments': '{"mode": "sos"}'}
I need the drone lights to flash SOS, can you set that up?
{'name': 'set\_drone\_lighting', 'arguments': '{"mode": "sos"}'}
Can you bring the drone back home now?
{'name': 'return\_to\_home', 'arguments': '{}'}
Is it time for the drone to return to base?
{'name': 'return\_to\_home', 'arguments': '{}'}
My phone battery is draining so fast, can you turn on battery saver mode
{'name': 'set\_battery\_saver\_mode', 'arguments': '{"status": "on"}'}
I need my laptop battery to last longer, can you switch on battery saver mode
{'name': 'set\_battery\_saver\_mode', 'arguments': '{"status": "on"}'}
My phone battery is draining too quickly, can you turn off the battery saver mode
{'name': 'set\_battery\_saver\_mode', 'arguments': '{"status": "off"}'}
I feel like my device is slower with battery saver on, can we turn it off?
{'name': 'set\_battery\_saver\_mode', 'arguments': '{"status": "off"}'}
I want the car to avoid obstacles, can you turn on that feature?
{'name': 'set\_obstacle\_avoidance', 'arguments': '{"mode": "on"}'}
Can you activate the obstacle avoidance mode for safety purposes?
{'name': 'set\_obstacle\_avoidance', 'arguments': '{"mode": "on"}'}
I'd like to turn off obstacle detection, how do I do that?
{'name': 'set\_obstacle\_avoidance', 'arguments': '{"mode": "off"}'}
Can you disable the obstacle avoidance feature for now?
{'name': 'set\_obstacle\_avoidance', 'arguments': '{"mode": "off"}'}
Can you activate the follow me mode?
{'name': 'set\_follow\_me\_mode', 'arguments': '{"status": "on"}'}
I want the car to follow me, can you turn on that feature?
{'name': 'set\_follow\_me\_mode', 'arguments': '{"status": "on"}'}
I don't want the drone following me anymore, can you turn that off?
{'name': 'set\_follow\_me\_mode', 'arguments': '{"status": "off"}'}
Can you disable the follow-me mode on the drone?
{'name': 'set\_follow\_me\_mode', 'arguments': '{"status": "off"}'}
The sensors are acting up, can you recalibrate them
{'name': 'calibrate\_sensors', 'arguments': '{}'}
My device doesn't seem to be sensing correctly, can you adjust it
{'name': 'calibrate\_sensors', 'arguments': '{}'}
I'm too tired to drive, can you turn on the autopilot
{'name': 'set\_autopilot', 'arguments': '{"status": "on"}'}
Let the car drive itself, turn on autopilot
{'name': 'set\_autopilot', 'arguments': '{"status": "on"}'}
I'm feeling more confident, turn off the autopilot
{'name': 'set\_autopilot', 'arguments': '{"status": "off"}'}
I think I can handle it, deactivate the automatic pilot
{'name': 'set\_autopilot', 'arguments': '{"status": "off"}'}
Can you set the display to a steady yellow color?
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "solid", "color": "yellow"}'}
I'd like the LED display to be a solid yellow, please.
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "solid", "color": "yellow"}'}
Can you make the lights flash on and off
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "blink"}'}
I want the LED display to blink, can you set that up
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "blink"}'}
Can you make the lights flash in red?
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "blink", "color": "red"}'}
How do I set the display to blink in red?
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "blink", "color": "red"}'}
Can you make the lights flash in yellow?
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "blink", "color": "yellow"}'}
How do I set the display to blink in yellow?
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "blink", "color": "yellow"}'}
Can you make the lights blink instead of staying steady
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "pulse"}'}
I want the LEDs to flash, not stay solid
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "pulse"}'}
Can you make the LED display pulse in red, please?
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "pulse", "color": "red"}'}
I'd like the LED display to flash in red, can you set that up?
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "pulse", "color": "red"}'}
I want the LED lights to flash in blue
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "pulse", "color": "blue"}'}
Can you set the display to pulse with a blue color
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "pulse", "color": "blue"}'}
Can you make the lights flash and change to green
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "pulse", "color": "green"}'}
Let's set the LEDs to blink and switch to green
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "pulse", "color": "green"}'}
Can you change the flashy lights to yellow and make them pulse
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "pulse", "color": "yellow"}'}
I want the LED display to blink in yellow, can you do that
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "pulse", "color": "yellow"}'}
Can you change the colors on the display to red and set it to a rainbow pattern?
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "rainbow", "color": "red"}'}
I want the LED display to show a rainbow pattern in red, can you set that up?
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "rainbow", "color": "red"}'}
Can you change the color and pattern of the lights to blue and rainbow?
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "rainbow", "color": "blue"}'}
I'm feeling like some colorful lights, can you set it to blue and rainbow?
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "rainbow", "color": "blue"}'}
Can you set the LED display to show a rainbow pattern in green color?
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "rainbow", "color": "green"}'}
I'd like the LED display to cycle through colors, starting with green
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "rainbow", "color": "green"}'}
Can you make the lights do a cool rainbow effect
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "rainbow", "color": "white"}'}
Change the color of the lights to white and make them change like a rainbow
{'name': 'configure\_led\_display', 'arguments': '{"pattern": "rainbow", "color": "white"}'}
I changed my mind, can you cancel that request
{'name': 'reject\_request', 'arguments': '{}'}
I don't want to proceed with the request anymore, can you reject it
{'name': 'reject\_request', 'arguments': '{}'}`
```
Now, back to the rejection function. Let’s generate some prompts that are *nearly* possible, but should result in the `reject\_request` function being called. To do so, we queried `gpt-4o` asking for requests that are related to, but not quite possible with, the given list of functions.
```
`reject\_list = [
"Translate broadcast message to another language",
"Automatically capture photos when face is detected",
"Detect nearby drones",
"Measure wind resistance",
"Capture slow motion video",
"Move the drone forward and backward by same distance at the same time.",
"Adjust drone's altitude to ground level changes",
"Display custom message on LED display",
"Sync drone's time with smartphone",
"Alert when drone travels out of designated area",
"Calibrate sensors and land simultaneously",
"Detect moisture levels",
"Automatically follow GPS tagged object",
"Toggle night vision mode",
"Maintain current altitude when battery is low",
"Decide best landing spot using AI",
"Program drone's route based on wind direction",
]`
```
```
`reject\_training\_list = []
for prompt in reject\_list:
# Adjust formatting
tool\_calls = [
{
"id": "call\_id",
"type": "function",
"function": {"name": "reject\_request", "arguments": "{}"},
}
]
reject\_training\_list.append(
{
"messages": [
{"role": "system", "content": DRONE\_SYSTEM\_PROMPT},
{"role": "user", "content": prompt},
{"role": "assistant", "tool\_calls": tool\_calls},
],
"parallel\_tool\_calls": False,
"tools": modified\_function\_list,
}
)`
```
Now combine all the training examples together
```
`training\_list\_total = training\_examples + reject\_training\_list`
```
```
`training\_file = "data/drone\_training.jsonl"
with open(training\_file, "w") as f:
for item in training\_list\_total:
json\_str = json.dumps(item)
f.write(f"{json\_str}\\n")`
```
# Fine tuning
Finally, we can kick off the fine-tuning job
```
`# Upload the training file
file = client.files.create(
file=open("data/drone\_training.jsonl", "rb"),
purpose="fine-tune",
)
file\_id = file.id
print(f"FileID: {file\_id}")
# Create a fine-tuning job
ft = client.fine\_tuning.jobs.create(
model="gpt-3.5-turbo",
training\_file=file\_id,
suffix="drone",
)
print(f"Fine-tuning job created: {ft}")`
```
```
`FileID: file-blg0IytwIivZQzc9mbfnS8Pm
Fine-tuning job created: FineTuningJob(id='ftjob-84PQg97hoIAKf21IPnhiNlU1', created\_at=1718580285, error=Error(code=None, message=None, param=None), fine\_tuned\_model=None, finished\_at=None, hyperparameters=Hyperparameters(n\_epochs='auto', batch\_size='auto', learning\_rate\_multiplier='auto'), model='gpt-3.5-turbo-0125', object='fine\_tuning.job', organization\_id='org-lb41cclBdkq5pm6BgDhx8DHP', result\_files=[], seed=1513865891, status='validating\_files', trained\_tokens=None, training\_file='file-blg0IytwIivZQzc9mbfnS8Pm', validation\_file=None, estimated\_finish=None, integrations=[], user\_provided\_suffix='drone')`
```
In addition to creating a fine-tuning job, you can also list existing jobs, retrieve the status of a job, or cancel a job.
```
`ftjob\_id = "ftjob-84PQg97hoIAKf21IPnhiNlU1"
# List 10 fine-tuning jobs
# client.fine\_tuning.jobs.list(limit=10)
# Retrieve the state of a fine-tune
client.fine\_tuning.jobs.retrieve(ftjob\_id)
# Cancel a job
# client.fine\_tuning.jobs.cancel("ftjob-abc123")
# List up to 10 events from a fine-tuning job
# client.fine\_tuning.jobs.list\_events(fine\_tuning\_job\_id="ftjob-abc123", limit=10)
# Delete a fine-tuned model (must be an owner of the org the model was created in)
# client.models.delete("ft:gpt-3.5-turbo:abc:suffix:abc123")`
```
```
`FineTuningJob(id='ftjob-84PQg97hoIAKf21IPnhiNlU1', created\_at=1718580285, error=Error(code=None, message=None, param=None), fine\_tuned\_model='ft:gpt-3.5-turbo-0125:openai-gtm:drone:9atiPjeC', finished\_at=1718581004, hyperparameters=Hyperparameters(n\_epochs=3, batch\_size=1, learning\_rate\_multiplier=2), model='gpt-3.5-turbo-0125', object='fine\_tuning.job', organization\_id='org-lb41cclBdkq5pm6BgDhx8DHP', result\_files=['file-F6XPJFLVG9f3mR04KBmwUI9H'], seed=1513865891, status='succeeded', trained\_tokens=145983, training\_file='file-blg0IytwIivZQzc9mbfnS8Pm', validation\_file=None, estimated\_finish=None, integrations=[], user\_provided\_suffix='drone')`
```
After a fine-tuning job has finished, you can also see metrics around how the training process went by querying a fine-tuning job, extracting a file ID from the result\_files, and then retrieving that files content. Each results CSV file has the following columns: step, train\_loss, train\_accuracy, valid\_loss, and valid\_mean\_token\_accuracy. While metrics can he helpful, evaluating samples from the fine-tuned model provides the most relevant sense of model quality.
```
`fine\_tune\_results = client.fine\_tuning.jobs.retrieve(ftjob\_id).result\_files
result\_file\_id = client.files.retrieve(fine\_tune\_results[0]).id
# Retrieve the result file
result\_file = client.files.content(file\_id=result\_file\_id)
decoded\_content = base64.b64decode(result\_file.read()).decode("utf-8")
print(decoded\_content)`
```
```
`step,train\_loss,train\_accuracy,valid\_loss,valid\_mean\_token\_accuracy
1,3.63265,0.5,,
2,2.45992,0.80952,,
3,2.77939,0.80952,,
4,3.53073,0.65,,
5,2.61654,0.8,,
6,2.16,0.85714,,
7,2.73706,0.8,,
8,2.56944,0.625,,
9,2.06096,0.78947,,
10,1.69598,0.8,,
11,1.94268,0.77778,,
12,1.61752,0.86667,,
13,1.2442,0.8,,
14,0.73411,0.875,,
15,0.34285,0.875,,
16,0.22229,0.95238,,
17,0.04635,0.95,,
18,0.00626,1.0,,
19,0.60888,0.90909,,
20,0.00092,1.0,,
21,0.8001,0.95,,
22,0.04982,1.0,,
23,0.35494,0.92857,,
24,0.00023,1.0,,
25,0.00034,1.0,,
26,0.0029,1.0,,
27,0.58017,0.875,,
28,0.13018,0.9375,,
29,0.00109,1.0,,
30,6e-05,1.0,,
31,0.61665,0.95,,
32,3e-05,1.0,,
33,0.23598,0.95,,
34,3e-05,1.0,,
35,0.03566,1.0,,
36,1e-05,1.0,,
37,1e-05,1.0,,
38,2e-05,1.0,,
39,2e-05,1.0,,
40,0.00034,1.0,,
41,0.0,1.0,,
42,0.0,1.0,,
43,0.0,1.0,,
44,0.0,1.0,,
45,0.0,1.0,,
46,0.91896,0.95,,
47,0.0,1.0,,
48,0.12006,0.95,,
49,0.0,1.0,,
50,3.92872,0.75,,
51,0.0,1.0,,
52,0.98277,0.90476,,
53,0.0,1.0,,
54,0.0,1.0,,
55,1e-05,1.0,,
56,0.00401,1.0,,
57,0.07366,1.0,,
58,0.0,1.0,,
59,0.0,1.0,,
60,0.0,1.0,,
61,0.0,1.0,,
62,0.10347,0.875,,
63,0.0,1.0,,
64,0.0,1.0,,
65,1e-05,1.0,,
66,2.97112,0.85714,,
67,1.12396,0.875,,
68,2e-05,1.0,,
69,0.00067,1.0,,
70,0.0,1.0,,
71,0.0,1.0,,
72,0.0,1.0,,
73,0.0,1.0,,
74,0.0,1.0,,
75,0.02064,1.0,,
76,0.5146,0.86667,,
77,0.18756,0.95,,
78,6e-05,1.0,,
79,0.0,1.0,,
80,0.21298,0.93333,,
81,0.0,1.0,,
82,0.0,1.0,,
83,0.0,1.0,,
84,0.00139,1.0,,
85,0.0,1.0,,
86,0.85297,0.875,,
87,0.0,1.0,,
88,0.0,1.0,,
89,1.45164,0.875,,
90,0.0,1.0,,
91,0.05329,0.92857,,
92,0.55506,0.93333,,
93,0.42187,0.92857,,
94,0.0,1.0,,
95,0.0,1.0,,
96,0.0,1.0,,
97,0.0,1.0,,
98,0.0,1.0,,
99,0.0,1.0,,
100,0.0,1.0,,
101,0.0,1.0,,
102,0.0,1.0,,
103,0.09194,0.95455,,
104,0.0,1.0,,
105,0.0,1.0,,
106,0.05531,0.95,,
107,0.0,1.0,,
108,0.39621,0.95238,,
109,0.0,1.0,,
110,0.8449,0.95,,
111,0.01258,1.0,,
112,0.0,1.0,,
113,0.0,1.0,,
114,0.0,1.0,,
115,0.00355,1.0,,
116,0.0,1.0,,
117,0.3954,0.94118,,
118,0.00259,1.0,,
119,0.0,1.0,,
120,0.0,1.0,,
121,0.35876,0.95,,
122,0.0,1.0,,
123,0.0,1.0,,
124,5e-05,1.0,,
125,0.0,1.0,,
126,0.0,1.0,,
127,0.0,1.0,,
128,0.0,1.0,,
129,0.0,1.0,,
130,0.01336,1.0,,
131,0.0,1.0,,
132,0.23362,0.95,,
133,0.00157,1.0,,
134,0.0,1.0,,
135,0.00031,1.0,,
136,0.0,1.0,,
137,0.08313,0.92857,,
138,0.0,1.0,,
139,0.0,1.0,,
140,0.0,1.0,,
141,0.43608,0.95,,
142,0.0,1.0,,
143,0.0,1.0,,
144,0.0,1.0,,
145,2e-05,1.0,,
146,1.20409,0.85714,,
147,0.0,1.0,,
148,0.0,1.0,,
149,0.0,1.0,,
150,0.0,1.0,,
151,0.0,1.0,,
152,0.0,1.0,,
153,0.0,1.0,,
154,0.00063,1.0,,
155,0.0,1.0,,
156,0.0,1.0,,
157,0.0,1.0,,
158,6e-05,1.0,,
159,0.0,1.0,,
160,0.0,1.0,,
161,0.0,1.0,,
162,0.0,1.0,,
163,0.0,1.0,,
164,0.0,1.0,,
165,0.0,1.0,,
166,0.0,1.0,,
167,0.0,1.0,,
168,0.0,1.0,,
169,0.0,1.0,,
170,0.0,1.0,,
171,0.0,1.0,,
172,0.0,1.0,,
173,0.0,1.0,,
174,0.00783,1.0,,
175,0.0,1.0,,
176,0.0,1.0,,
177,0.0,1.0,,
178,0.0,1.0,,
179,0.0,1.0,,
180,0.0,1.0,,
181,0.0,1.0,,
182,0.00028,1.0,,
183,0.0,1.0,,
184,0.0,1.0,,
185,0.0003,1.0,,
186,0.0,1.0,,
187,0.0,1.0,,
188,0.0,1.0,,
189,0.0,1.0,,
190,0.0,1.0,,
191,0.0,1.0,,
192,0.0,1.0,,
193,0.00013,1.0,,
194,0.86198,0.875,,
195,0.0,1.0,,
196,0.0,1.0,,
197,0.0,1.0,,
198,0.0,1.0,,
199,0.0,1.0,,
200,0.0,1.0,,
201,0.0,1.0,,
202,0.0,1.0,,
203,0.0,1.0,,
204,0.09954,0.95455,,
205,0.0,1.0,,
206,0.0,1.0,,
207,0.0,1.0,,
208,1.9616,0.9375,,
209,0.0,1.0,,
210,0.0,1.0,,
211,0.0,1.0,,
212,0.0,1.0,,
213,0.0,1.0,,
214,0.0,1.0,,
215,0.0,1.0,,
216,0.0,1.0,,
217,0.0,1.0,,
218,0.0,1.0,,
219,0.0,1.0,,
220,0.0,1.0,,
221,0.0,1.0,,
222,0.0,1.0,,
223,0.0,1.0,,
224,0.0,1.0,,
225,0.0,1.0,,
226,0.00174,1.0,,
227,0.0,1.0,,
228,2e-05,1.0,,
229,0.0,1.0,,
230,0.0,1.0,,
231,0.0,1.0,,
232,0.0,1.0,,
233,0.0,1.0,,
234,0.61895,0.95,,
235,0.0,1.0,,
236,0.0,1.0,,
237,0.0,1.0,,
238,0.0,1.0,,
239,0.54945,0.95,,
240,0.0,1.0,,
241,0.0,1.0,,
242,1.52953,0.9375,,
243,1.19938,0.85714,,
244,0.0,1.0,,
245,0.0,1.0,,
246,0.0,1.0,,
247,0.0,1.0,,
248,8e-05,1.0,,
249,0.0,1.0,,
250,0.0,1.0,,
251,0.0,1.0,,
252,0.0,1.0,,
253,0.0,1.0,,
254,0.0,1.0,,
255,0.0,1.0,,
256,0.0,1.0,,
257,0.0,1.0,,
258,0.0,1.0,,
259,0.0,1.0,,
260,0.0,1.0,,
261,0.0,1.0,,
262,0.0,1.0,,
263,0.0,1.0,,
264,0.0,1.0,,
265,0.0,1.0,,
266,0.0,1.0,,
267,0.88984,0.95,,
268,0.0,1.0,,
269,0.0,1.0,,
270,0.0,1.0,,
271,0.0,1.0,,
272,0.0,1.0,,
273,0.0,1.0,,
274,0.0,1.0,,
275,0.00013,1.0,,
276,0.0,1.0,,
277,0.89825,0.92857,,
278,0.0,1.0,,
279,0.00017,1.0,,
280,0.0,1.0,,
281,0.0,1.0,,
282,0.0,1.0,,
283,0.65667,0.95,,
284,0.0,1.0,,
285,0.0,1.0,,
286,0.0,1.0,,
287,0.0,1.0,,
288,0.0,1.0,,
289,0.0,1.0,,
290,0.0,1.0,,
291,0.0,1.0,,
292,0.28626,0.95238,,
293,0.0,1.0,,
294,0.0,1.0,,
295,0.0,1.0,,
296,0.0,1.0,,
297,0.0,1.0,,
298,0.0,1.0,,
299,0.0,1.0,,
300,0.0,1.0,,
301,0.0,1.0,,
302,0.0,1.0,,
303,0.0,1.0,,
304,0.0,1.0,,
305,0.0,1.0,,
306,0.0,1.0,,
307,0.0,1.0,,
308,0.0,1.0,,
309,0.0,1.0,,`
```
# Evaluations
Great! We trained a fine-tuned model for function calling. Let’s see how it does on our evaluation set for prompts that the drone assistant
should automatically reject.
```
`ft\_model = "ft:gpt-3.5-turbo-0125:openai-gtm:drone:9atiPjeC"
base\_model = "gpt-3.5-turbo"
print(f"\\nEvaluating fine-tuned model with challenging prompts: {ft\_model}")
eval(
model=ft\_model,
function\_list=modified\_function\_list,
system\_prompt=DRONE\_SYSTEM\_PROMPT,
prompts\_to\_expected\_tool\_name=challenging\_prompts\_to\_expected,
)
print(f"\\nEvaluating base model with challenging prompts: {base\_model}")
eval(
model="gpt-3.5-turbo",
function\_list=function\_list,
system\_prompt=DRONE\_SYSTEM\_PROMPT,
prompts\_to\_expected\_tool\_name=challenging\_prompts\_to\_expected,
)`
```
```
`
Evaluating fine-tuned model with challenging prompts: ft:gpt-3.5-turbo-0125:openai-gtm:drone:9atiPjeC`
```
| |Prompt|Actual|Expected|Match|
|0|Play pre-recorded audio message|reject\_request|reject\_request|Yes|
|1|Initiate following on social media|reject\_request|reject\_request|Yes|
|2|Scan environment for heat signatures|reject\_request|reject\_request|Yes|
|3|Bump into obstacles|reject\_request|reject\_request|Yes|
|4|Change drone's paint job color|reject\_request|reject\_request|Yes|
|5|Coordinate with nearby drones|reject\_request|reject\_request|Yes|
|6|Change speed to negative 120 km/h|reject\_request|reject\_request|Yes|
|7|Detect a person|reject\_request|reject\_request|Yes|
|8|Please enable night vision|reject\_request|reject\_request|Yes|
|9|Report on humidity levels around you|reject\_request|reject\_request|Yes|
```
`Number of matches: 10 out of 10 (100.00%)
Average latency per request: 3519.17 ms
Average tokens used per request: 457.20
Evaluating base model with challenging prompts: gpt-3.5-turbo`
```
| |Prompt|Actual|Expected|Match|
|0|Play pre-recorded audio message|reject\_request|reject\_request|Yes|
|1|Initiate following on social media|set\_follow\_me\_mode|reject\_request|No|
|2|Scan environment for heat signatures|reject\_request|reject\_request|Yes|
|3|Bump into obstacles|set\_obstacle\_avoidance|reject\_request|No|
|4|Change drone's paint job color|reject\_request|reject\_request|Yes|
|5|Coordinate with nearby drones|reject\_request|reject\_request|Yes|
|6|Change speed to negative 120 km/h|set\_drone\_speed|reject\_request|No|
|7|Detect a person|reject\_request|reject\_request|Yes|
|8|Please enable night vision|set\_drone\_lighting|reject\_request|No|
|9|Report on humidity levels around you|reject\_request|reject\_request|Yes|
```
`Number of matches: 6 out of 10 (60.00%)
Average latency per request: 647.58 ms
Average tokens used per request: 791.90`
```
Great! While the original model only rejected 60%, the fine tuned model rejected 100% requests and used less tokens to do so.
### Conclusion
Congratulations! You are now ready to fine tune your model for function calling. We can’t wait to see what you build.