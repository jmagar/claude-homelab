Evals API Use-case - Responses Evaluation
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
May 13, 2025
# Evals API Use-case - Responses Evaluation
[ WH ](https://www.willhath.com)
[ Will Hathaway ](https://www.willhath.com)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/evaluation/use-cases/responses-evaluation.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/evaluation/use-cases/responses-evaluation.ipynb)
In the following eval, we are going to compare how a new model (gpt-4.1-mini) compares to our old model (gpt-4o-mini) by evaluating it on some stored responses. The benefit of this is for most developers, they won’t have to spend any time putting together a whole eval — all of their data will already be stored in their [logs page](https://platform.openai.com/logs).
```
`import openai
import os
client = openai.OpenAI()`
```
We want to see how gpt-4.1 compares to gpt-4o on explaining a code base. Since can only use the responses datasource if you already have user traffic, we’re going to generate some example traffic using 4o, and then compare how it does to gpt-4.1.
We’re going to get some example code files from the OpenAI SDK, and ask gpt-4o to explain them to us.
```
`openai\_sdk\_file\_path = os.path.dirname(openai.\_\_file\_\_)
# Get some example code files from the OpenAI SDK
file\_paths = [
os.path.join(openai\_sdk\_file\_path, "resources", "evals", "evals.py"),
os.path.join(openai\_sdk\_file\_path, "resources", "responses", "responses.py"),
os.path.join(openai\_sdk\_file\_path, "resources", "images.py"),
os.path.join(openai\_sdk\_file\_path, "resources", "embeddings.py"),
os.path.join(openai\_sdk\_file\_path, "resources", "files.py"),
]
print(file\_paths[0])`
```
Now, lets generate some responses.
```
`for file\_path in file\_paths:
response = client.responses.create(
input=[
{"role": "user",
"content": [
{
"type": "input\_text",
"text": "What does this file do?"
},
{
"type": "input\_text",
"text": open(file\_path, "r").read(),
},
]},
],
model="gpt-4o-mini",
)
print(response.output\_text)`
```
Note that in order for this to work, you’ll have to be doing this on an org where data logging isn’t disabled (through zdr, etc). If you aren’t sure if this is the case for you, go to [https://platform.openai.com/logs?api=responses](https://platform.openai.com/logs?api=responses) and see if you can see the responses you just generated.
```
`grader\_system\_prompt = """
You are \*\*Code-Explanation Grader\*\*, an expert software engineer and technical writer.
Your job is to score how well \*Model A\* explained the purpose and behaviour of a given source-code file.
### What you receive
1. \*\*File contents\*\* – the full text of the code file (or a representative excerpt).
2. \*\*Candidate explanation\*\* – the answer produced by Model A that tries to describe what the file does.
### What to produce
Return a single JSON object that can be parsed by `json.loads`, containing:
```json
{
"steps": [
{ "description": "...", "result": "float" },
{ "description": "...", "result": "float" },
{ "description": "...", "result": "float" }
],
"result": "float"
}
```
• Each object in `steps` documents your reasoning for one category listed under “Scoring dimensions”.
• Place your final 1 – 7 quality score (inclusive) in the top-level `result` key as a \*\*string\*\* (e.g. `"5.5"`).
### Scoring dimensions (evaluate in this order)
1. \*\*Correctness & Accuracy ≈ 45 %\*\*
• Does the explanation match the actual code behaviour, interfaces, edge cases, and side effects?
• Fact-check every technical claim; penalise hallucinations or missed key functionality.
2. \*\*Completeness & Depth ≈ 25 %\*\*
• Are all major components, classes, functions, data flows, and external dependencies covered?
• Depth should be appropriate to the file’s size/complexity; superficial glosses lose points.
3. \*\*Clarity & Organization ≈ 20 %\*\*
• Is the explanation well-structured, logically ordered, and easy for a competent developer to follow?
• Good use of headings, bullet lists, and concise language is rewarded.
4. \*\*Insight & Usefulness ≈ 10 %\*\*
• Does the answer add valuable context (e.g., typical use cases, performance notes, risks) beyond line-by-line paraphrase?
• Highlighting \*\*why\*\* design choices matter is a plus.
### Error taxonomy
• \*\*Major error\*\* – Any statement that materially misrepresents the file (e.g., wrong API purpose, inventing non-existent behaviour).
• \*\*Minor error\*\* – Small omission or wording that slightly reduces clarity but doesn’t mislead.
List all found errors in your `steps` reasoning.
### Numeric rubric
1 Catastrophically wrong; mostly hallucination or irrelevant.
2 Many major errors, few correct points.
3 Several major errors OR pervasive minor mistakes; unreliable.
4 Mostly correct but with at least one major gap or multiple minors; usable only with caution.
5 Solid, generally correct; minor issues possible but no major flaws.
6 Comprehensive, accurate, and clear; only very small nit-picks.
7 Exceptional: precise, thorough, insightful, and elegantly presented; hard to improve.
Use the full scale. Reserve 6.5 – 7 only when you are almost certain the explanation is outstanding.
Then set `"result": "4.0"` (example).
Be rigorous and unbiased.
"""
user\_input\_message = """\*\*User input\*\*
{{item.input}}
\*\*Response to evaluate\*\*
{{sample.output\_text}}
"""`
```
```
`logs\_eval = client.evals.create(
name="Code QA Eval",
data\_source\_config={
"type": "logs",
},
testing\_criteria=[
{
"type": "score\_model",
"name": "General Evaluator",
"model": "o3",
"input": [{
"role": "system",
"content": grader\_system\_prompt,
}, {
"role": "user",
"content": user\_input\_message,
},
],
"range": [1, 7],
"pass\_threshold": 5.5,
}
]
)`
```
First, lets kick off a run to evaluate how good the original responses were. To do this, we just set the filters for what responses we want to evaluate on
```
`gpt\_4o\_mini\_run = client.evals.runs.create(
name="gpt-4o-mini",
eval\_id=logs\_eval.id,
data\_source={
"type": "responses",
"source": {"type": "responses", "limit": len(file\_paths)}, # just grab the most recent responses
},
)`
```
Now, let’s see how 4.1-mini does!
```
`gpt\_41\_mini\_run = client.evals.runs.create(
name="gpt-4.1-mini",
eval\_id=logs\_eval.id,
data\_source={
"type": "responses",
"source": {"type": "responses", "limit": len(file\_paths)},
"input\_messages": {
"type": "item\_reference",
"item\_reference": "item.input",
},
"model": "gpt-4.1-mini",
}
)`
```
Now, lets go to the dashboard to see how we did!
```
`gpt\_4o\_mini\_run.report\_url`
```