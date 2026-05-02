Evals API Use-case - Structured Outputs Evaluation
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
# Evals API Use-case - Structured Outputs Evaluation
[ JG ](https://www.linkedin.com/in/josiahbgrace)[ SK ](https://www.linkedin.com/in/shikharkwatra/)
[ Josiah Grace
(OpenAI)
, ](https://www.linkedin.com/in/josiahbgrace)[ Shikhar Kwatra
(OpenAI)
](https://www.linkedin.com/in/shikharkwatra/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/evaluation/use-cases/structured-outputs-evaluation.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/evaluation/use-cases/structured-outputs-evaluation.ipynb)
This notebook walks you through a set of focused, runnable examples how to use the OpenAI **Evals** framework to **test, grade, and iterate on tasks that require large‑language models to produce structured outputs**.
>
**> Why does this matter?
**
> Production systems often depend on JSON, SQL, or domain‑specific formats. Relying on spot checks or ad‑hoc prompt tweaks quickly breaks down. Instead, you can
*> codify
*> expectations as automated evals and let your team ship with safety bricks instead of sand.
>
## Quick Tour
* **Section 1 – Prerequisites**: environment variables and package setup
* **Section 2 – Walk‑through: Code‑symbol extraction**: end‑to‑end demo that grades the model’s ability to extract function and class names from source code. We keep the original logic intact and simply layer documentation around it.
* **Section 3 – Additional Recipes**: sketches of common production patterns such as sentiment extraction as additional code sample for evaluation.
* **Section 4 – Result Exploration**: lightweight helpers for pulling run output and digging into failures.
## Prerequisites
1. **Install dependencies** (minimum versions shown):
```
`pip install --upgrade openai`
```
1. **Authenticate** by exporting your key:
```
`export OPENAI\_API\_KEY="sk‑..."`
```
1. **Optional**: if you plan to run evals in bulk, set up an [organization‑level key](https://platform.openai.com/account/org-settings) with appropriate limits.
### Use Case 1: Code symbol extraction
The goal is to **extract all function, class, and constant symbols from python files inside the OpenAI SDK**.
For each file we ask the model to emit structured JSON like:
```
`{
"symbols": [
{"name": "OpenAI", "kind": "class"},
{"name": "Evals", "kind": "module"},
...
]
}`
```
A rubric model then grades **completeness** (did we capture every symbol?) and **quality** (are the kinds correct?) on a 1‑7 scale.
### Evaluating Code Quality Extraction with a Custom Dataset
Let us walk though an example to evaluate a model’s ability to extract symbols from code using the OpenAI **Evals** framework with a custom in-memory dataset.
### Initialize SDK client
Creates an `openai.OpenAI` client using the `OPENAI\_API\_KEY` we exported above. Nothing will run without this.
```
`%pip install --upgrade openai pandas rich --quiet
import os
import time
import openai
from rich import print
import pandas as pd
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
{{sample.output\_json.symbols}}
\</Extracted Information\>
"""
logs\_eval = client.evals.create(
name="Code QA Eval",
data\_source\_config={
"type": "custom",
"item\_schema": {
"type": "object",
"properties": {"input": {"type": "string"}},
},
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
"pass\_threshold": 5.5,
}
],
)`
```
### Kick off model runs
Here we launch two runs against the same eval: one that calls the **Completions** endpoint, and one that calls the **Responses** endpoint.
```
`### Kick off model runs
gpt\_4one\_completions\_run = client.evals.runs.create(
name="gpt-4.1",
eval\_id=logs\_eval.id,
data\_source={
"type": "completions",
"source": {
"type": "file\_content",
"content": [{"item": item} for item in get\_dataset(limit=1)],
},
"input\_messages": {
"type": "template",
"template": [
{
"type": "message",
"role": "system",
"content": {"type": "input\_text", "text": "You are a helpful assistant."},
},
{
"type": "message",
"role": "user",
"content": {
"type": "input\_text",
"text": "Extract the symbols from the code file {{item.input}}",
},
},
],
},
"model": "gpt-4.1",
"sampling\_params": {
"seed": 42,
"temperature": 0.7,
"max\_completions\_tokens": 10000,
"top\_p": 0.9,
"response\_format": {
"type": "json\_schema",
"json\_schema": {
"name": "python\_symbols",
"schema": {
"type": "object",
"properties": {
"symbols": {
"type": "array",
"description": "A list of symbols extracted from Python code.",
"items": {
"type": "object",
"properties": {
"name": {"type": "string", "description": "The name of the symbol."},
"symbol\_type": {
"type": "string", "description": "The type of the symbol, e.g., variable, function, class.",
},
},
"required": ["name", "symbol\_type"],
"additionalProperties": False,
},
}
},
"required": ["symbols"],
"additionalProperties": False,
},
"strict": True,
},
},
},
},
)
gpt\_4one\_responses\_run = client.evals.runs.create(
name="gpt-4.1-mini",
eval\_id=logs\_eval.id,
data\_source={
"type": "responses",
"source": {
"type": "file\_content",
"content": [{"item": item} for item in get\_dataset(limit=1)],
},
"input\_messages": {
"type": "template",
"template": [
{
"type": "message",
"role": "system",
"content": {"type": "input\_text", "text": "You are a helpful assistant."},
},
{
"type": "message",
"role": "user",
"content": {
"type": "input\_text",
"text": "Extract the symbols from the code file {{item.input}}",
},
},
],
},
"model": "gpt-4.1-mini",
"sampling\_params": {
"seed": 42,
"temperature": 0.7,
"max\_completions\_tokens": 10000,
"top\_p": 0.9,
"text": {
"format": {
"type": "json\_schema",
"name": "python\_symbols",
"schema": {
"type": "object",
"properties": {
"symbols": {
"type": "array",
"description": "A list of symbols extracted from Python code.",
"items": {
"type": "object",
"properties": {
"name": {"type": "string", "description": "The name of the symbol."},
"symbol\_type": {
"type": "string",
"description": "The type of the symbol, e.g., variable, function, class.",
},
},
"required": ["name", "symbol\_type"],
"additionalProperties": False,
},
}
},
"required": ["symbols"],
"additionalProperties": False,
},
"strict": True,
},
},
},
},
)`
```
### Utility poller
Next, we will use a simple loop that waits for all runs to finish, then saves each run’s JSON to disk so you can inspect it later or attach it to CI artifacts.
```
`### Utility poller
def poll\_runs(eval\_id, run\_ids):
while True:
runs = [client.evals.runs.retrieve(rid, eval\_id=eval\_id) for rid in run\_ids]
for run in runs:
print(run.id, run.status, run.result\_counts)
if all(run.status in {"completed", "failed"} for run in runs):
# dump results to file
for run in runs:
with open(f"{run.id}.json", "w") as f:
f.write(
client.evals.runs.output\_items.list(
run\_id=run.id, eval\_id=eval\_id
).model\_dump\_json(indent=4)
)
break
time.sleep(5)
poll\_runs(logs\_eval.id, [gpt\_4one\_completions\_run.id, gpt\_4one\_responses\_run.id])`
```
```
evalrun\_68487dcc749081918ec2571e76cc9ef6 completed
ResultCounts(errored=0, failed=1, passed=0, total=1)
```
```
evalrun\_68487dcdaba0819182db010fe5331f2e completed
ResultCounts(errored=0, failed=1, passed=0, total=1)
```
### Load outputs for quick inspection
We will fetch the output items for both runs so we can print or post‑process them.
```
`completions\_output = client.evals.runs.output\_items.list(
run\_id=gpt\_4one\_completions\_run.id, eval\_id=logs\_eval.id
)
responses\_output = client.evals.runs.output\_items.list(
run\_id=gpt\_4one\_responses\_run.id, eval\_id=logs\_eval.id
)`
```
### Human-readable dump
Let us print a side-by-side view of completions vs responses.
```
`from IPython.display import display, HTML
# Collect outputs for both runs
completions\_outputs = [item.sample.output[0].content for item in completions\_output]
responses\_outputs = [item.sample.output[0].content for item in responses\_output]
# Create DataFrame for side-by-side display (truncated to 250 chars for readability)
df = pd.DataFrame({
"Completions Output": [c[:250].replace('\\n', ' ') + ('...' if len(c) \> 250 else '') for c in completions\_outputs],
"Responses Output": [r[:250].replace('\\n', ' ') + ('...' if len(r) \> 250 else '') for r in responses\_outputs]
})
# Custom color scheme
custom\_styles = [
{'selector': 'th', 'props': [('font-size', '1.1em'), ('background-color', '#323C50'), ('color', '#FFFFFF'), ('border-bottom', '2px solid #1CA7EC')]},
{'selector': 'td', 'props': [('font-size', '1em'), ('max-width', '650px'), ('background-color', '#F6F8FA'), ('color', '#222'), ('border-bottom', '1px solid #DDD')]},
{'selector': 'tr:hover td', 'props': [('background-color', '#D1ECF1'), ('color', '#18647E')]},
{'selector': 'tbody tr:nth-child(even) td', 'props': [('background-color', '#E8F1FB')]},
{'selector': 'tbody tr:nth-child(odd) td', 'props': [('background-color', '#F6F8FA')]},
{'selector': 'table', 'props': [('border-collapse', 'collapse'), ('border-radius', '6px'), ('overflow', 'hidden')]},
]
styled = (
df.style
.set\_properties(\*\*{'white-space': 'pre-wrap', 'word-break': 'break-word', 'padding': '8px'})
.set\_table\_styles(custom\_styles)
.hide(axis="index")
)
display(HTML("""
\<h4 style="color: #1CA7EC; font-weight: 600; letter-spacing: 1px; text-shadow: 0 1px 2px rgba(0,0,0,0.08), 0 0px 0px #fff;"\>
Completions vs Responses Output
\</h4\>
"""))
display(styled)`
```
####
Completions vs Responses Output
|Completions Output|Responses Output|
|{"symbols":[{"name":"Evals","symbol\_type":"class"},{"name":"AsyncEvals","symbol\_type":"class"},{"name":"EvalsWithRawResponse","symbol\_type":"class"},{"name":"AsyncEvalsWithRawResponse","symbol\_type":"class"},{"name":"EvalsWithStreamingResponse","symb...|{"symbols":[{"name":"Evals","symbol\_type":"class"},{"name":"runs","symbol\_type":"property"},{"name":"with\_raw\_response","symbol\_type":"property"},{"name":"with\_streaming\_response","symbol\_type":"property"},{"name":"create","symbol\_type":"function"},{...|
### Visualize the Results
Below are visualizations that represent the evaluation data and code outputs for structured QA evaluation. These images provide insights into the data distribution and the evaluation workflow.
**Evaluation Data Overview**
**Evaluation Code Workflow**
By reviewing these visualizations, you can better understand the structure of the evaluation dataset and the steps involved in evaluating structured outputs for QA tasks.
### Use Case 2: Multi-lingual Sentiment Extraction
In a similar way, let us evaluate a multi-lingual sentiment extraction model with structured outputs.
```
`# Sample in-memory dataset for sentiment extraction
sentiment\_dataset = [
{
"text": "I love this product!",
"channel": "twitter",
"language": "en"
},
{
"text": "This is the worst experience I've ever had.",
"channel": "support\_ticket",
"language": "en"
},
{
"text": "It's okay – not great but not bad either.",
"channel": "app\_review",
"language": "en"
},
{
"text": "No estoy seguro de lo que pienso sobre este producto.",
"channel": "facebook",
"language": "es"
},
{
"text": "总体来说，我对这款产品很满意。",
"channel": "wechat",
"language": "zh"
},
]`
```
```
`# Define output schema
sentiment\_output\_schema = {
"type": "object",
"properties": {
"sentiment": {
"type": "string",
"description": "overall label: positive / negative / neutral"
},
"confidence": {
"type": "number",
"description": "confidence score 0-1"
},
"emotions": {
"type": "array",
"description": "list of dominant emotions (e.g. joy, anger)",
"items": {"type": "string"}
}
},
"required": ["sentiment", "confidence", "emotions"],
"additionalProperties": False
}
# Grader prompts
sentiment\_grader\_system = """You are a strict grader for sentiment extraction.
Given the text and the model's JSON output, score correctness on a 1-5 scale."""
sentiment\_grader\_user = """Text: {{item.text}}
Model output:
{{sample.output\_json}}
"""`
```
```
`# Register an eval for the richer sentiment task
sentiment\_eval = client.evals.create(
name="sentiment\_extraction\_eval",
data\_source\_config={
"type": "custom",
"item\_schema": { # matches the new dataset fields
"type": "object",
"properties": {
"text": {"type": "string"},
"channel": {"type": "string"},
"language": {"type": "string"},
},
"required": ["text"],
},
"include\_sample\_schema": True,
},
testing\_criteria=[
{
"type": "score\_model",
"name": "Sentiment Grader",
"model": "o3",
"input": [
{"role": "system", "content": sentiment\_grader\_system},
{"role": "user", "content": sentiment\_grader\_user},
],
"range": [1, 5],
"pass\_threshold": 3.5,
}
],
)`
```
```
`# Run the sentiment eval
sentiment\_run = client.evals.runs.create(
name="gpt-4.1-sentiment",
eval\_id=sentiment\_eval.id,
data\_source={
"type": "responses",
"source": {
"type": "file\_content",
"content": [{"item": item} for item in sentiment\_dataset],
},
"input\_messages": {
"type": "template",
"template": [
{
"type": "message",
"role": "system",
"content": {"type": "input\_text", "text": "You are a helpful assistant."},
},
{
"type": "message",
"role": "user",
"content": {
"type": "input\_text",
"text": "{{item.text}}",
},
},
],
},
"model": "gpt-4.1",
"sampling\_params": {
"seed": 42,
"temperature": 0.7,
"max\_completions\_tokens": 100,
"top\_p": 0.9,
"text": {
"format": {
"type": "json\_schema",
"name": "sentiment\_output",
"schema": sentiment\_output\_schema,
"strict": True,
},
},
},
},
)`
```
### Visualize evals data
### Summary and Next Steps
In this notebook, we have demonstrated how to use the OpenAI Evaluation API to evaluate a model’s performance on a structured output task.
**Next steps:**
* We encourage you to try out the API with your own models and datasets.
* You can also explore the API documentation for more details on how to use the API.
For more information, see the [OpenAI Evals documentation](https://platform.openai.com/docs/guides/evals).