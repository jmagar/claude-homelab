Evals API Use-case - Tools Evaluation
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
Jun 9, 2025
# Evals API Use-case - Tools Evaluation
[ JG ](https://www.linkedin.com/in/josiahbgrace)[ SK ](https://www.linkedin.com/in/shikharkwatra/)
[ Josiah Grace
(OpenAI)
, ](https://www.linkedin.com/in/josiahbgrace)[ Shikhar Kwatra
(OpenAI)
](https://www.linkedin.com/in/shikharkwatra/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/evaluation/use-cases/tools-evaluation.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/evaluation/use-cases/tools-evaluation.ipynb)
This cookbook shows how to **measure and improve a model’s ability to extract structured information from source code** with tool evaluation. In this case, the set of *symbols* (functions, classes, methods, and variables) defined in Python files.
## Setup
Install the latest **openai** Python package ≥ 1.14.0 and set your `OPENAI\_API\_KEY` environment variable. If you also want to evaluate an *assistant with tools*, enable the *Assistants v2 beta* in your account.
```
`pip install --upgrade openai
export OPENAI\_API\_KEY=sk‑...`
```
Below we import the SDK, create a client, and define a helper that builds a small dataset from files inside the **openai** package itself.
```
`%pip install --upgrade openai pandas jinja2 rich --quiet
import os
import time
import openai
from rich import print
client = openai.OpenAI(
api\_key=os.getenv("OPENAI\_API\_KEY") or os.getenv("\_OPENAI\_API\_KEY"),
)`
```
```
`
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m A new release of pip is available: [0m[31;49m24.0[0m[39;49m -\> [0m[32;49m25.1.1[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m To update, run: [0m[32;49mpip install --upgrade pip[0m
Note: you may need to restart the kernel to use updated packages.`
```
### Dataset factory & grading rubric
* `get\_dataset` builds a small in-memory dataset by reading several SDK files.
* `structured\_output\_grader` defines a detailed evaluation rubric.
* `sampled.output\_tools[0].function.arguments.symbols` specifies the extracted symbols from the code file based on the tool invocation.
* `client.evals.create(...)` registers the eval with the platform.
```
`def get\_dataset(limit=None):
openai\_sdk\_file\_path = os.path.dirname(openai.\_\_file\_\_)
file\_paths = [
os.path.join(openai\_sdk\_file\_path, "resources", "evals", "evals.py"),
os.path.join(openai\_sdk\_file\_path, "resources", "responses", "responses.py"),
os.path.join(openai\_sdk\_file\_path, "resources", "images.py"),
os.path.join(openai\_sdk\_file\_path, "resources", "embeddings.py"),
os.path.join(openai\_sdk\_file\_path, "resources", "files.py"),
]
items = []
for file\_path in file\_paths:
items.append({"input": open(file\_path, "r").read()})
if limit:
return items[:limit]
return items
structured\_output\_grader = """
You are a helpful assistant that grades the quality of extracted information from a code file.
You will be given a code file and a list of extracted information.
You should grade the quality of the extracted information.
You should grade the quality on a scale of 1 to 7.
You should apply the following criteria, and calculate your score as follows:
You should first check for completeness on a scale of 1 to 7.
Then you should apply a quality modifier.
The quality modifier is a multiplier from 0 to 1 that you multiply by the completeness score.
If there is 100% coverage for completion and it is all high quality, then you would return 7\*1.
If there is 100% coverage for completion but it is all low quality, then you would return 7\*0.5.
etc.
"""
structured\_output\_grader\_user\_prompt = """
\<Code File\>
{{item.input}}
\</Code File\>
\<Extracted Information\>
{{sample.output\_tools[0].function.arguments.symbols}}
\</Extracted Information\>
"""`
```
### Evals Creation
Here we create an eval that will be used to evaluate the quality of extracted information from code files.
```
`logs\_eval = client.evals.create(
name="Code QA Eval",
data\_source\_config={
"type": "custom",
"item\_schema": {"type": "object", "properties": {"input": {"type": "string"}}},
"include\_sample\_schema": True,
},
testing\_criteria=[
{
"type": "score\_model",
"name": "General Evaluator",
"model": "o3",
"input": [
{"role": "system", "content": structured\_output\_grader},
{"role": "user", "content": structured\_output\_grader\_user\_prompt},
],
"range": [1, 7],
"pass\_threshold": 5.0,
}
],
)
symbol\_tool = {
"name": "extract\_symbols",
"description": "Extract the symbols from the code file",
"parameters": {
"type": "object",
"properties": {
"symbols": {
"type": "array",
"description": "A list of symbols extracted from Python code.",
"items": {
"type": "object",
"properties": {
"name": {"type": "string", "description": "The name of the symbol."},
"symbol\_type": {"type": "string", "description": "The type of the symbol, e.g., variable, function, class."},
},
"required": ["name", "symbol\_type"],
"additionalProperties": False,
},
}
},
"required": ["symbols"],
"additionalProperties": False,
},
}`
```
### Kick off model runs
Here we launch two runs against the same eval: one that calls the **Completions** endpoint, and one that calls the **Responses** endpoint.
```
`gpt\_4one\_completions\_run = client.evals.runs.create(
name="gpt-4.1",
eval\_id=logs\_eval.id,
data\_source={
"type": "completions",
"source": {"type": "file\_content", "content": [{"item": item} for item in get\_dataset(limit=1)]},
"input\_messages": {
"type": "template",
"template": [
{"type": "message", "role": "system", "content": {"type": "input\_text", "text": "You are a helpful assistant."}},
{"type": "message", "role": "user", "content": {"type": "input\_text", "text": "Extract the symbols from the code file {{item.input}}"}},
],
},
"model": "gpt-4.1",
"sampling\_params": {
"seed": 42,
"temperature": 0.7,
"max\_completions\_tokens": 10000,
"top\_p": 0.9,
"tools": [{"type": "function", "function": symbol\_tool}],
},
},
)
gpt\_4one\_responses\_run = client.evals.runs.create(
name="gpt-4.1-mini",
eval\_id=logs\_eval.id,
data\_source={
"type": "responses",
"source": {"type": "file\_content", "content": [{"item": item} for item in get\_dataset(limit=1)]},
"input\_messages": {
"type": "template",
"template": [
{"type": "message", "role": "system", "content": {"type": "input\_text", "text": "You are a helpful assistant."}},
{"type": "message", "role": "user", "content": {"type": "input\_text", "text": "Extract the symbols from the code file {{item.input}}"}},
],
},
"model": "gpt-4.1-mini",
"sampling\_params": {
"seed": 42,
"temperature": 0.7,
"max\_completions\_tokens": 10000,
"top\_p": 0.9,
"tools": [{"type": "function", \*\*symbol\_tool}],
},
},
)`
```
### Utility Poller
We create a utility poller that will be used to poll for the results of the eval runs.
```
`def poll\_runs(eval\_id, run\_ids):
# poll both runs at the same time, until they are complete or failed
while True:
runs = [client.evals.runs.retrieve(run\_id, eval\_id=eval\_id) for run\_id in run\_ids]
for run in runs:
print(run.id, run.status, run.result\_counts)
if all(run.status in ("completed", "failed") for run in runs):
break
time.sleep(5)
poll\_runs(logs\_eval.id, [gpt\_4one\_completions\_run.id, gpt\_4one\_responses\_run.id])`
```
```
evalrun\_6848e2269570819198b757fe12b979da completed
ResultCounts(errored=0, failed=1, passed=0, total=1)
```
```
evalrun\_6848e227d3a481918a9b970c897b5998 completed
ResultCounts(errored=0, failed=1, passed=0, total=1)
```
```
`
### Get Output
completions\_output = client.evals.runs.output\_items.list(
run\_id=gpt\_4one\_completions\_run.id, eval\_id=logs\_eval.id
)
responses\_output = client.evals.runs.output\_items.list(
run\_id=gpt\_4one\_responses\_run.id, eval\_id=logs\_eval.id
)`
```
### Inspecting results
For both completions and responses, we print the *symbols* dictionary that the model returned. You can diff this against the reference answer or compute precision / recall.
```
`import json
import pandas as pd
from IPython.display import display, HTML
def extract\_symbols(output\_list):
symbols\_list = []
for item in output\_list:
try:
args = item.sample.output[0].tool\_calls[0]["function"]["arguments"]
symbols = json.loads(args)["symbols"]
symbols\_list.append(symbols)
except Exception as e:
symbols\_list.append([{"error": str(e)}])
return symbols\_list
completions\_symbols = extract\_symbols(completions\_output)
responses\_symbols = extract\_symbols(responses\_output)
def symbols\_to\_html\_table(symbols):
if symbols and isinstance(symbols, list):
df = pd.DataFrame(symbols)
return (
df.style
.set\_properties(\*\*{
'white-space': 'pre-wrap',
'word-break': 'break-word',
'padding': '2px 6px',
'border': '1px solid #C3E7FA',
'font-size': '0.92em',
'background-color': '#FDFEFF'
})
.set\_table\_styles([{
'selector': 'th',
'props': [
('font-size', '0.95em'),
('background-color', '#1CA7EC'),
('color', '#fff'),
('border-bottom', '1px solid #18647E'),
('padding', '2px 6px')
]
}])
.hide(axis='index')
.to\_html()
)
return f"\<div style='padding:4px 0;color:#D9534F;font-style:italic;font-size:0.9em'\>{str(symbols)}\</div\>"
table\_rows = []
max\_len = max(len(completions\_symbols), len(responses\_symbols))
for i in range(max\_len):
c\_html = symbols\_to\_html\_table(completions\_symbols[i]) if i \< len(completions\_symbols) else ""
r\_html = symbols\_to\_html\_table(responses\_symbols[i]) if i \< len(responses\_symbols) else ""
table\_rows.append(f"""
\<tr style="height:1.2em;"\>
\<td style="vertical-align:top; background:#F6F8FA; border-right:1px solid #E3E3E3; padding:2px 4px;"\>{c\_html}\</td\>
\<td style="vertical-align:top; background:#F6F8FA; padding:2px 4px;"\>{r\_html}\</td\>
\</tr\>
""")
table\_html = f"""
\<div style="margin-bottom:0.5em;margin-top:0.2em;"\>
\<h4 style="color:#1CA7EC;font-weight:600;letter-spacing:0.5px;
text-shadow:0 1px 2px rgba(0,0,0,0.06), 0 0px 0px #fff;font-size:1.05em;margin:0 0 0.35em 0;"\>
Completions vs Responses Output Symbols
\</h4\>
\<table style="border-collapse:separate;border-spacing:0 0.2em;width:100%;border-radius:5px;overflow:hidden;box-shadow:0 1px 7px #BEE7FA22;"\>
\<thead\>
\<tr style="height:1.4em;"\>
\<th style="width:50%;background:#323C50;color:#fff;font-size:1em;padding:6px 10px;border-bottom:2px solid #1CA7EC;text-align:center;"\>Completions Output\</th\>
\<th style="width:50%;background:#323C50;color:#fff;font-size:1em;padding:6px 10px;border-bottom:2px solid #1CA7EC;text-align:center;"\>Responses Output\</th\>
\</tr\>
\</thead\>
\<tbody\>
{''.join(table\_rows)}
\</tbody\>
\</table\>
\</div\>
"""
display(HTML(table\_html))`
```
####
Completions vs Responses Output Symbols
```
` \<tr style="height:1.2em;"\>
\<td style="vertical-align:top; background:#F6F8FA; border-right:1px solid #E3E3E3; padding:2px 4px;"\>`
```
|Completions Output|Responses Output|
|name|symbol\_type|
|Evals|class|
|AsyncEvals|class|
|EvalsWithRawResponse|class|
|AsyncEvalsWithRawResponse|class|
|EvalsWithStreamingResponse|class|
|AsyncEvalsWithStreamingResponse|class|
|\_\_all\_\_|variable|
|name|symbol\_type|
|Evals|class|
|runs|function|
|with\_raw\_response|function|
|with\_streaming\_response|function|
|create|function|
|retrieve|function|
|update|function|
|list|function|
|delete|function|
|AsyncEvals|class|
|runs|function|
|with\_raw\_response|function|
|with\_streaming\_response|function|
|create|function|
|retrieve|function|
|update|function|
|list|function|
|delete|function|
|EvalsWithRawResponse|class|
|\_\_init\_\_|function|
|runs|function|
|AsyncEvalsWithRawResponse|class|
|\_\_init\_\_|function|
|runs|function|
|EvalsWithStreamingResponse|class|
|\_\_init\_\_|function|
|runs|function|
|AsyncEvalsWithStreamingResponse|class|
|\_\_init\_\_|function|
|runs|function|
```
`\</tbody\>`
```
### Visualize Evals Dashboard
You can navigate to the Evals Dashboard in order to visualize the data.
You can also take a look at the explanation of the failed results in the Evals Dashboard after the run is complete as shown in the image below.
This notebook demonstrated how to use OpenAI Evals to assess and improve a model’s ability to extract structured information from Python code using tool calls.
OpenAI Evals provides a robust, reproducible framework for evaluating LLMs on structured extraction tasks. By combining clear tool schemas, rigorous grading rubrics, and well-structured datasets, you can measure and improve overall performance.
*For more details, see the [OpenAI Evals documentation](https://platform.openai.com/docs/guides/evals).*