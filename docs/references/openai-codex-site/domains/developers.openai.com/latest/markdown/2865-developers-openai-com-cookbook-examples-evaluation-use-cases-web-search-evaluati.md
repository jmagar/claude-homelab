Evals API Use-case - Web Search Evaluation
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
# Evals API Use-case - Web Search Evaluation
[ JG ](https://www.linkedin.com/in/josiahbgrace)[ SK ](https://www.linkedin.com/in/shikharkwatra/)
[ Josiah Grace
(OpenAI)
, ](https://www.linkedin.com/in/josiahbgrace)[ Shikhar Kwatra
(OpenAI)
](https://www.linkedin.com/in/shikharkwatra/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/evaluation/use-cases/web-search-evaluation.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/evaluation/use-cases/web-search-evaluation.ipynb)
This notebook demonstrates how to evaluate a model’s ability to retrieve correct answers from the web using the OpenAI **Evals** framework with a custom in-memory dataset.
**Goals:**
* Show how to set up and run an evaluation for web search quality.
* Provide a template for evaluating information retrieval capabilities of LLMs.
## Environment Setup
We begin by importing the required libraries and configuring the OpenAI client.
This ensures we have access to the OpenAI API and all necessary utilities for evaluation.
```
`# Update OpenAI client
%pip install --upgrade openai --quiet`
```
```
`
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m A new release of pip is available: [0m[31;49m24.0[0m[39;49m -\> [0m[32;49m25.1.1[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m To update, run: [0m[32;49mpip install --upgrade pip[0m
Note: you may need to restart the kernel to use updated packages.`
```
```
`import os
import time
import pandas as pd
from IPython.display import display
from openai import OpenAI
client = OpenAI(
api\_key=os.getenv("OPENAI\_API\_KEY") or os.getenv("\_OPENAI\_API\_KEY"),
)`
```
## Define the Custom Evaluation Dataset
We define a small, in-memory dataset of question-answer pairs for web search evaluation.
Each item contains a `query` (the user’s search prompt) and an `answer` (the expected ground truth).
>
**> Tip:
**
> You can modify or extend this dataset to suit your own use case or test broader search scenarios.
>
```
`def get\_dataset(limit=None):
dataset = [
{
"query": "coolest person in the world, the 100m dash at the 2008 olympics was the best sports event of all time",
"answer": "usain bolt",
},
{
"query": "best library in the world, there is nothing better than a dataframe",
"answer": "pandas",
},
{
"query": "most fun place to visit, I am obsessed with the Philbrook Museum of Art",
"answer": "tulsa, oklahoma",
},
{
"query": "who created the python programming language, beloved by data scientists everywhere",
"answer": "guido van rossum",
},
{
"query": "greatest chess player in history, famous for the 1972 world championship",
"answer": "bobby fischer",
},
{
"query": "the city of lights, home to the eiffel tower and louvre museum",
"answer": "paris",
},
{
"query": "most popular search engine, whose name is now a verb",
"answer": "google",
},
{
"query": "the first man to walk on the moon, giant leap for mankind",
"answer": "neil armstrong",
},
{
"query": "groundbreaking electric car company founded by elon musk",
"answer": "tesla",
},
{
"query": "founder of microsoft, philanthropist and software pioneer",
"answer": "bill gates",
},
]
return dataset[:limit] if limit else dataset`
```
## Define Grading Logic
To evaluate the model’s answers, we use an LLM-based pass/fail grader:
* **Pass/Fail Grader:**
An LLM-based grader that checks if the model’s answer (from web search) matches the expected answer (ground truth) or contains the correct information.
>
**> Best Practice:
**
> Using an LLM-based grader provides flexibility for evaluating open-ended or fuzzy responses.
>
```
`pass\_fail\_grader = """
You are a helpful assistant that grades the quality of a web search.
You will be given a query and an answer.
You should grade the quality of the web search.
You should either say "pass" or "fail", if the query contains the answer.
"""
pass\_fail\_grader\_user\_prompt = """
\<Query\>
{{item.query}}
\</Query\>
\<Web Search Result\>
{{sample.output\_text}}
\</Web Search Result\>
\<Ground Truth\>
{{item.answer}}
\</Ground Truth\>
"""`
```
## Define the Evaluation Configuration
We now configure the evaluation using the OpenAI Evals framework.
This step specifies:
* The evaluation name and dataset.
* The schema for each item (what fields are present in each Q&A pair).
* The grader(s) to use (LLM-based pass/fail).
* The passing criteria and labels.
>
**> Best Practice:
**
> Clearly defining your evaluation schema and grading logic up front ensures reproducibility and transparency.
>
```
`# Create the evaluation definition using the OpenAI Evals client.
logs\_eval = client.evals.create(
name="Web-Search Eval",
data\_source\_config={
"type": "custom",
"item\_schema": {
"type": "object",
"properties": {
"query": {"type": "string"},
"answer": {"type": "string"},
},
},
"include\_sample\_schema": True,
},
testing\_criteria=[
{
"type": "label\_model",
"name": "Web Search Evaluator",
"model": "o3",
"input": [
{
"role": "system",
"content": pass\_fail\_grader,
},
{
"role": "user",
"content": pass\_fail\_grader\_user\_prompt,
},
],
"passing\_labels": ["pass"],
"labels": ["pass", "fail"],
}
],
)`
```
## Run the Model and Poll for Completion
We now run the evaluation for the selected models (`gpt-4.1` and `gpt-4.1-mini`).
After launching the evaluation run, we poll until it is complete (either `completed` or `failed`).
>
**> Best Practice:
**
> Polling with a delay avoids excessive API calls and ensures efficient resource usage.
>
```
`# Launch the evaluation run for gpt-4.1 using web search
gpt\_4one\_responses\_run = client.evals.runs.create(
name="gpt-4.1",
eval\_id=logs\_eval.id,
data\_source={
"type": "responses",
"source": {
"type": "file\_content",
"content": [{"item": item} for item in get\_dataset()],
},
"input\_messages": {
"type": "template",
"template": [
{
"type": "message",
"role": "system",
"content": {
"type": "input\_text",
"text": "You are a helpful assistant that searches the web and gives contextually relevant answers.",
},
},
{
"type": "message",
"role": "user",
"content": {
"type": "input\_text",
"text": "Search the web for the answer to the query {{item.query}}",
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
"tools": [{"type": "web\_search\_preview"}],
},
},
)`
```
```
`# Launch the evaluation run for gpt-4.1-mini using web search
gpt\_4one\_mini\_responses\_run = client.evals.runs.create(
name="gpt-4.1-mini",
eval\_id=logs\_eval.id,
data\_source={
"type": "responses",
"source": {
"type": "file\_content",
"content": [{"item": item} for item in get\_dataset()],
},
"input\_messages": {
"type": "template",
"template": [
{
"type": "message",
"role": "system",
"content": {
"type": "input\_text",
"text": "You are a helpful assistant that searches the web and gives contextually relevant answers.",
},
},
{
"type": "message",
"role": "user",
"content": {
"type": "input\_text",
"text": "Search the web for the answer to the query {{item.query}}",
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
"tools": [{"type": "web\_search\_preview"}],
},
},
)`
```
```
`# poll both runs at the same time, until they are complete or failed
def poll\_runs(eval\_id, run\_ids):
while True:
runs = [client.evals.runs.retrieve(run\_id, eval\_id=eval\_id) for run\_id in run\_ids]
for run in runs:
print(run.id, run.status, run.result\_counts)
if all(run.status in {"completed", "failed"} for run in runs):
break
time.sleep(5)
# Start polling the run until completion
poll\_runs(logs\_eval.id, [gpt\_4one\_responses\_run.id, gpt\_4one\_mini\_responses\_run.id])`
```
```
`evalrun\_68477e0f56a481919eea5e7d8a04225e completed ResultCounts(errored=0, failed=1, passed=9, total=10)
evalrun\_68477e712bb48191bc7368b084f8c52c completed ResultCounts(errored=0, failed=0, passed=10, total=10)`
```
## Display and Interpret Model Outputs
Finally, we display the outputs from the model for manual inspection and further analysis.
* Each answer is printed for each query in the dataset.
* You can compare the outputs to the expected answers to assess quality, relevance, and correctness.
```
`# Retrieve output items for the 4.1 model after completion
four\_one = client.evals.runs.output\_items.list(
run\_id=gpt\_4one\_responses\_run.id, eval\_id=logs\_eval.id
)
# Retrieve output items for the 4.1-mini model after completion
four\_one\_mini = client.evals.runs.output\_items.list(
run\_id=gpt\_4one\_mini\_responses\_run.id, eval\_id=logs\_eval.id
)
# Collect outputs for both models
four\_one\_outputs = [item.sample.output[0].content for item in four\_one]
four\_one\_mini\_outputs = [item.sample.output[0].content for item in four\_one\_mini]
# Create DataFrame for side-by-side display
df = pd.DataFrame({
"GPT-4.1 Output": four\_one\_outputs,
"GPT-4.1-mini Output": four\_one\_mini\_outputs
})
display(df)`
```
||GPT-4.1 Output|GPT-4.1-mini Output|
|0|If you're captivated by the Philbrook Museum o...|Bobby Fischer is widely regarded as one of the...|
|1|\\n## [Paris, France](https://www.google.com/ma...|The 2008 Olympic 100m dash is widely regarded ...|
|2|Bill Gates, born on October 28, 1955, in Seatt...|If you're looking for fun places to visit in T...|
|3|Usain Bolt's performance in the 100-meter fina...|On July 20, 1969, astronaut Neil Armstrong bec...|
|4|It seems you're interested in both the world's...|Bill Gates is a renowned software pioneer, phi...|
|5|Neil Armstrong was the first person to walk on...|Your statement, "there is nothing better than ...|
|6|Tesla, Inc. is an American electric vehicle an...|The search engine whose name has become synony...|
|7|Bobby Fischer, widely regarded as one of the g...|\\n## [Paris, France](https://www.google.com/ma...|
|8|Guido van Rossum, a Dutch programmer born on J...|Guido van Rossum, a Dutch programmer born on J...|
|9|The most popular search engine whose name has ...|Elon Musk is the CEO and largest shareholder o...|
You can visualize the results in the evals dashboard by going to [https://platform.openai.com/evaluations](https://platform.openai.com/evaluations) as shown in the image below:
In this notebook, we demonstrated a workflow for evaluating the web search capabilities of language models using the OpenAI Evals framework.
**Key points covered:**
* Defined a focused, custom dataset for web search evaluation.
* Configured an LLM-based grader for robust assessment.
* Ran a reproducible evaluation with the latest OpenAI models and web search tool.
* Retrieved and displayed model outputs for inspection.
**Next steps and suggestions:**
* **Expand the dataset:** Add more diverse and challenging queries to better assess model capabilities.
* **Analyze results:** Summarize pass/fail rates, visualize performance, or perform error analysis to identify strengths and weaknesses.
* **Experiment with models/tools:** Try additional models, adjust tool configurations, or test on other types of information retrieval tasks.
* **Automate reporting:** Generate summary tables or plots for easier sharing and decision-making.
For more information, see the [OpenAI Evals documentation](https://platform.openai.com/docs/guides/evals).