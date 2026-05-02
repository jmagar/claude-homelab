Structured Outputs for Multi-Agent Systems
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
Aug 6, 2024
# Structured Outputs for Multi-Agent Systems
[ DA ](https://www.linkedin.com/in/dylan-almeida-604522167/)
[ Dylan Royan Almeida ](https://www.linkedin.com/in/dylan-almeida-604522167/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Structured_outputs_multi_agent.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Structured_outputs_multi_agent.ipynb)
In this cookbook, we will explore how to use Structured Outputs to build multi-agent systems.
Structured Outputs is a new capability that builds upon JSON mode and function calling to enforce a strict schema in a model output.
By using the new parameter `strict: true`, we are able to guarantee the response abides by a provided schema.
To demonstrate the power of this feature, we will use it to build a multi-agent system.
### Why build a Multi-Agent System?
When using function calling, if the number of functions (or tools) increases, the performance may suffer.
To mitigate this, we can logically group the tools together and have specialized “agents” that are able to solve specific tasks or sub-tasks, which will increase the overall system performance.
## Environment set up
```
`from openai import OpenAI
from IPython.display import Image
import json
import pandas as pd
import matplotlib.pyplot as plt
from io import StringIO
import numpy as np
client = OpenAI()`
```
```
`MODEL = "gpt-4o-2024-08-06"`
```
## Agents set up
The use case we will tackle is a data analysis task.
Let’s first set up our 4-agents system:
1. **Triaging agent:** Decides which agent(s) to call
2. **Data pre-processing Agent:** Prepares data for analysis - for example by cleaning it up
3. **Data Analysis Agent:** Performs analysis on the data
4. **Data Visualization Agent:** Visualizes the output of the analysis to extract insights
We will start by defining the system prompts for each of these agents.
```
`triaging\_system\_prompt = """You are a Triaging Agent. Your role is to assess the user's query and route it to the relevant agents. The agents available are:
- Data Processing Agent: Cleans, transforms, and aggregates data.
- Analysis Agent: Performs statistical, correlation, and regression analysis.
- Visualization Agent: Creates bar charts, line charts, and pie charts.
Use the send\_query\_to\_agents tool to forward the user's query to the relevant agents. Also, use the speak\_to\_user tool to get more information from the user if needed."""
processing\_system\_prompt = """You are a Data Processing Agent. Your role is to clean, transform, and aggregate data using the following tools:
- clean\_data
- transform\_data
- aggregate\_data"""
analysis\_system\_prompt = """You are an Analysis Agent. Your role is to perform statistical, correlation, and regression analysis using the following tools:
- stat\_analysis
- correlation\_analysis
- regression\_analysis"""
visualization\_system\_prompt = """You are a Visualization Agent. Your role is to create bar charts, line charts, and pie charts using the following tools:
- create\_bar\_chart
- create\_line\_chart
- create\_pie\_chart"""`
```
We will then define the tools for each agent.
Apart from the triaging agent, each agent will be equipped with tools specific to their role:
#### Data pre-processing agent
1. Clean data
2. Transform data
3. Aggregate data
#### Data analysis agent
1. Statistical analysis
2. Correlation analysis
3. Regression Analysis
#### Data visualization agent
1. Create bar chart
2. Create line chart
3. Create pie chart
```
`triage\_tools = [
{
"type": "function",
"function": {
"name": "send\_query\_to\_agents",
"description": "Sends the user query to relevant agents based on their capabilities.",
"parameters": {
"type": "object",
"properties": {
"agents": {
"type": "array",
"items": {"type": "string"},
"description": "An array of agent names to send the query to."
},
"query": {
"type": "string",
"description": "The user query to send."
}
},
"required": ["agents", "query"]
}
},
"strict": True
}
]
preprocess\_tools = [
{
"type": "function",
"function": {
"name": "clean\_data",
"description": "Cleans the provided data by removing duplicates and handling missing values.",
"parameters": {
"type": "object",
"properties": {
"data": {
"type": "string",
"description": "The dataset to clean. Should be in a suitable format such as JSON or CSV."
}
},
"required": ["data"],
"additionalProperties": False
}
},
"strict": True
},
{
"type": "function",
"function": {
"name": "transform\_data",
"description": "Transforms data based on specified rules.",
"parameters": {
"type": "object",
"properties": {
"data": {
"type": "string",
"description": "The data to transform. Should be in a suitable format such as JSON or CSV."
},
"rules": {
"type": "string",
"description": "Transformation rules to apply, specified in a structured format."
}
},
"required": ["data", "rules"],
"additionalProperties": False
}
},
"strict": True
},
{
"type": "function",
"function": {
"name": "aggregate\_data",
"description": "Aggregates data by specified columns and operations.",
"parameters": {
"type": "object",
"properties": {
"data": {
"type": "string",
"description": "The data to aggregate. Should be in a suitable format such as JSON or CSV."
},
"group\_by": {
"type": "array",
"items": {"type": "string"},
"description": "Columns to group by."
},
"operations": {
"type": "string",
"description": "Aggregation operations to perform, specified in a structured format."
}
},
"required": ["data", "group\_by", "operations"],
"additionalProperties": False
}
},
"strict": True
}
]
analysis\_tools = [
{
"type": "function",
"function": {
"name": "stat\_analysis",
"description": "Performs statistical analysis on the given dataset.",
"parameters": {
"type": "object",
"properties": {
"data": {
"type": "string",
"description": "The dataset to analyze. Should be in a suitable format such as JSON or CSV."
}
},
"required": ["data"],
"additionalProperties": False
}
},
"strict": True
},
{
"type": "function",
"function": {
"name": "correlation\_analysis",
"description": "Calculates correlation coefficients between variables in the dataset.",
"parameters": {
"type": "object",
"properties": {
"data": {
"type": "string",
"description": "The dataset to analyze. Should be in a suitable format such as JSON or CSV."
},
"variables": {
"type": "array",
"items": {"type": "string"},
"description": "List of variables to calculate correlations for."
}
},
"required": ["data", "variables"],
"additionalProperties": False
}
},
"strict": True
},
{
"type": "function",
"function": {
"name": "regression\_analysis",
"description": "Performs regression analysis on the dataset.",
"parameters": {
"type": "object",
"properties": {
"data": {
"type": "string",
"description": "The dataset to analyze. Should be in a suitable format such as JSON or CSV."
},
"dependent\_var": {
"type": "string",
"description": "The dependent variable for regression."
},
"independent\_vars": {
"type": "array",
"items": {"type": "string"},
"description": "List of independent variables."
}
},
"required": ["data", "dependent\_var", "independent\_vars"],
"additionalProperties": False
}
},
"strict": True
}
]
visualization\_tools = [
{
"type": "function",
"function": {
"name": "create\_bar\_chart",
"description": "Creates a bar chart from the provided data.",
"parameters": {
"type": "object",
"properties": {
"data": {
"type": "string",
"description": "The data for the bar chart. Should be in a suitable format such as JSON or CSV."
},
"x": {
"type": "string",
"description": "Column for the x-axis."
},
"y": {
"type": "string",
"description": "Column for the y-axis."
}
},
"required": ["data", "x", "y"],
"additionalProperties": False
}
},
"strict": True
},
{
"type": "function",
"function": {
"name": "create\_line\_chart",
"description": "Creates a line chart from the provided data.",
"parameters": {
"type": "object",
"properties": {
"data": {
"type": "string",
"description": "The data for the line chart. Should be in a suitable format such as JSON or CSV."
},
"x": {
"type": "string",
"description": "Column for the x-axis."
},
"y": {
"type": "string",
"description": "Column for the y-axis."
}
},
"required": ["data", "x", "y"],
"additionalProperties": False
}
},
"strict": True
},
{
"type": "function",
"function": {
"name": "create\_pie\_chart",
"description": "Creates a pie chart from the provided data.",
"parameters": {
"type": "object",
"properties": {
"data": {
"type": "string",
"description": "The data for the pie chart. Should be in a suitable format such as JSON or CSV."
},
"labels": {
"type": "string",
"description": "Column for the labels."
},
"values": {
"type": "string",
"description": "Column for the values."
}
},
"required": ["data", "labels", "values"],
"additionalProperties": False
}
},
"strict": True
}
]`
```
## Tool execution
We need to write the code logic to:
* handle passing the user query to the multi-agent system
* handle the internal workings of the multi-agent system
* execute the tool calls
For the sake of brevity, we will only define the logic for tools that are relevant to the user query.
```
`# Example query
user\_query = """
Below is some data. I want you to first remove the duplicates then analyze the statistics of the data as well as plot a line chart.
house\_size (m3), house\_price ($)
90, 100
80, 90
100, 120
90, 100
"""`
```
From the user query, we can infer that the tools we would need to call are `clean\_data`, `start\_analysis` and `use\_line\_chart`.
We will first define the execution function which runs tool calls.
This maps a tool call to the corresponding function. It then appends the output of the function to the conversation history.
```
`def clean\_data(data):
data\_io = StringIO(data)
df = pd.read\_csv(data\_io, sep=",")
df\_deduplicated = df.drop\_duplicates()
return df\_deduplicated
def stat\_analysis(data):
data\_io = StringIO(data)
df = pd.read\_csv(data\_io, sep=",")
return df.describe()
def plot\_line\_chart(data):
data\_io = StringIO(data)
df = pd.read\_csv(data\_io, sep=",")
x = df.iloc[:, 0]
y = df.iloc[:, 1]
coefficients = np.polyfit(x, y, 1)
polynomial = np.poly1d(coefficients)
y\_fit = polynomial(x)
plt.figure(figsize=(10, 6))
plt.plot(x, y, 'o', label='Data Points')
plt.plot(x, y\_fit, '-', label='Best Fit Line')
plt.title('Line Chart with Best Fit Line')
plt.xlabel(df.columns[0])
plt.ylabel(df.columns[1])
plt.legend()
plt.grid(True)
plt.show()
# Define the function to execute the tools
def execute\_tool(tool\_calls, messages):
for tool\_call in tool\_calls:
tool\_name = tool\_call.function.name
tool\_arguments = json.loads(tool\_call.function.arguments)
if tool\_name == 'clean\_data':
# Simulate data cleaning
cleaned\_df = clean\_data(tool\_arguments['data'])
cleaned\_data = {"cleaned\_data": cleaned\_df.to\_dict()}
messages.append({"role": "tool", "name": tool\_name, "content": json.dumps(cleaned\_data)})
print('Cleaned data: ', cleaned\_df)
elif tool\_name == 'transform\_data':
# Simulate data transformation
transformed\_data = {"transformed\_data": "sample\_transformed\_data"}
messages.append({"role": "tool", "name": tool\_name, "content": json.dumps(transformed\_data)})
elif tool\_name == 'aggregate\_data':
# Simulate data aggregation
aggregated\_data = {"aggregated\_data": "sample\_aggregated\_data"}
messages.append({"role": "tool", "name": tool\_name, "content": json.dumps(aggregated\_data)})
elif tool\_name == 'stat\_analysis':
# Simulate statistical analysis
stats\_df = stat\_analysis(tool\_arguments['data'])
stats = {"stats": stats\_df.to\_dict()}
messages.append({"role": "tool", "name": tool\_name, "content": json.dumps(stats)})
print('Statistical Analysis: ', stats\_df)
elif tool\_name == 'correlation\_analysis':
# Simulate correlation analysis
correlations = {"correlations": "sample\_correlations"}
messages.append({"role": "tool", "name": tool\_name, "content": json.dumps(correlations)})
elif tool\_name == 'regression\_analysis':
# Simulate regression analysis
regression\_results = {"regression\_results": "sample\_regression\_results"}
messages.append({"role": "tool", "name": tool\_name, "content": json.dumps(regression\_results)})
elif tool\_name == 'create\_bar\_chart':
# Simulate bar chart creation
bar\_chart = {"bar\_chart": "sample\_bar\_chart"}
messages.append({"role": "tool", "name": tool\_name, "content": json.dumps(bar\_chart)})
elif tool\_name == 'create\_line\_chart':
# Simulate line chart creation
line\_chart = {"line\_chart": "sample\_line\_chart"}
messages.append({"role": "tool", "name": tool\_name, "content": json.dumps(line\_chart)})
plot\_line\_chart(tool\_arguments['data'])
elif tool\_name == 'create\_pie\_chart':
# Simulate pie chart creation
pie\_chart = {"pie\_chart": "sample\_pie\_chart"}
messages.append({"role": "tool", "name": tool\_name, "content": json.dumps(pie\_chart)})
return messages`
```
Next, we will create the tool handlers for each of the sub-agents.
These have a unique prompt and tool set passed to the model.
The output is then passed to an execution function which runs the tool calls.
We will also append the messages to the conversation history.
```
`# Define the functions to handle each agent's processing
def handle\_data\_processing\_agent(query, conversation\_messages):
messages = [{"role": "system", "content": processing\_system\_prompt}]
messages.append({"role": "user", "content": query})
response = client.chat.completions.create(
model=MODEL,
messages=messages,
temperature=0,
tools=preprocess\_tools,
)
conversation\_messages.append([tool\_call.function for tool\_call in response.choices[0].message.tool\_calls])
execute\_tool(response.choices[0].message.tool\_calls, conversation\_messages)
def handle\_analysis\_agent(query, conversation\_messages):
messages = [{"role": "system", "content": analysis\_system\_prompt}]
messages.append({"role": "user", "content": query})
response = client.chat.completions.create(
model=MODEL,
messages=messages,
temperature=0,
tools=analysis\_tools,
)
conversation\_messages.append([tool\_call.function for tool\_call in response.choices[0].message.tool\_calls])
execute\_tool(response.choices[0].message.tool\_calls, conversation\_messages)
def handle\_visualization\_agent(query, conversation\_messages):
messages = [{"role": "system", "content": visualization\_system\_prompt}]
messages.append({"role": "user", "content": query})
response = client.chat.completions.create(
model=MODEL,
messages=messages,
temperature=0,
tools=visualization\_tools,
)
conversation\_messages.append([tool\_call.function for tool\_call in response.choices[0].message.tool\_calls])
execute\_tool(response.choices[0].message.tool\_calls, conversation\_messages)`
```
Finally, we create the overarching tool to handle processing the user query.
This function takes the user query, gets a response from the model and handles passing it to the other agents to execute. In addition to this, we will keep the state of the ongoing conversation.
```
`# Function to handle user input and triaging
def handle\_user\_message(user\_query, conversation\_messages=[]):
user\_message = {"role": "user", "content": user\_query}
conversation\_messages.append(user\_message)
messages = [{"role": "system", "content": triaging\_system\_prompt}]
messages.extend(conversation\_messages)
response = client.chat.completions.create(
model=MODEL,
messages=messages,
temperature=0,
tools=triage\_tools,
)
conversation\_messages.append([tool\_call.function for tool\_call in response.choices[0].message.tool\_calls])
for tool\_call in response.choices[0].message.tool\_calls:
if tool\_call.function.name == 'send\_query\_to\_agents':
agents = json.loads(tool\_call.function.arguments)['agents']
query = json.loads(tool\_call.function.arguments)['query']
for agent in agents:
if agent == "Data Processing Agent":
handle\_data\_processing\_agent(query, conversation\_messages)
elif agent == "Analysis Agent":
handle\_analysis\_agent(query, conversation\_messages)
elif agent == "Visualization Agent":
handle\_visualization\_agent(query, conversation\_messages)
return conversation\_messages`
```
## Multi-agent system execution
Finally, we run the overarching `handle\_user\_message` function on the user query and view the output.
```
`handle\_user\_message(user\_query)`
```
```
`Cleaned data: house\_size (m3) house\_price ($)
0 90 100
1 80 90
2 100 120
Statistical Analysis: house\_size house\_price
count 4.000000 4.000000
mean 90.000000 102.500000
std 8.164966 12.583057
min 80.000000 90.000000
25% 87.500000 97.500000
50% 90.000000 100.000000
75% 92.500000 105.000000
max 100.000000 120.000000`
```
```
`[{'role': 'user',
'content': '\\nBelow is some data. I want you to first remove the duplicates then analyze the statistics of the data as well as plot a line chart.\\n\\nhouse\_size (m3), house\_price ($)\\n90, 100\\n80, 90\\n100, 120\\n90, 100\\n'},
[Function(arguments='{"agents": ["Data Processing Agent"], "query": "Remove duplicates from the data: house\_size (m3), house\_price ($)\\\\n90, 100\\\\n80, 90\\\\n100, 120\\\\n90, 100"}', name='send\_query\_to\_agents'),
Function(arguments='{"agents": ["Analysis Agent"], "query": "Analyze the statistics of the data: house\_size (m3), house\_price ($)\\\\n90, 100\\\\n80, 90\\\\n100, 120\\\\n90, 100"}', name='send\_query\_to\_agents'),
Function(arguments='{"agents": ["Visualization Agent"], "query": "Plot a line chart for the data: house\_size (m3), house\_price ($)\\\\n90, 100\\\\n80, 90\\\\n100, 120\\\\n90, 100"}', name='send\_query\_to\_agents')],
[Function(arguments='{"data":"house\_size (m3), house\_price ($)\\\\n90, 100\\\\n80, 90\\\\n100, 120\\\\n90, 100"}', name='clean\_data')],
{'role': 'tool',
'name': 'clean\_data',
'content': '{"cleaned\_data": {"house\_size (m3)": {"0": 90, "1": 80, "2": 100}, " house\_price ($)": {"0": 100, "1": 90, "2": 120}}}'},
[Function(arguments='{"data":"house\_size,house\_price\\\\n90,100\\\\n80,90\\\\n100,120\\\\n90,100"}', name='stat\_analysis')],
{'role': 'tool',
'name': 'stat\_analysis',
'content': '{"stats": {"house\_size": {"count": 4.0, "mean": 90.0, "std": 8.16496580927726, "min": 80.0, "25%": 87.5, "50%": 90.0, "75%": 92.5, "max": 100.0}, "house\_price": {"count": 4.0, "mean": 102.5, "std": 12.583057392117917, "min": 90.0, "25%": 97.5, "50%": 100.0, "75%": 105.0, "max": 120.0}}}'},
[Function(arguments='{"data":"house\_size,house\_price\\\\n90,100\\\\n80,90\\\\n100,120\\\\n90,100","x":"house\_size","y":"house\_price"}', name='create\_line\_chart')],
{'role': 'tool',
'name': 'create\_line\_chart',
'content': '{"line\_chart": "sample\_line\_chart"}'}]`
```
## Conclusion
In this cookbook, we’ve explored how to leverage Structured Outputs to build more robust multi-agent systems.
Using this new feature allows to make sure that tool calls follow the specified schema and avoids having to handle edge cases or validate arguments on your side.
This can be applied to many more use cases, and we hope you can take inspiration from this to build your own use case!