Evals API Use-case - Monitoring stored completions
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
Apr 8, 2025
# Evals API Use-case - Monitoring stored completions
[ JG ](https://www.linkedin.com/in/josiahbgrace)
[ Josiah Grace
(OpenAI)
](https://www.linkedin.com/in/josiahbgrace)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/evaluation/use-cases/completion-monitoring.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/evaluation/use-cases/completion-monitoring.ipynb)
Evals are **task-oriented** and iterative, they’re the best way to check how your LLM integration is doing and improve it.
In the following eval, we are going to focus on the task of **detecting our prompt changes for regressions**.
Our use-case is:
1. We have been logging chat completion requests by setting `store=True` in our production chat completions requests. Note that you can also enable “on by default” logging in your admin panel ([https://platform.openai.com/settings/organization/data-controls/data-retention](https://platform.openai.com/settings/organization/data-controls/data-retention)).
2. We want to see whether our prompt changes have introduced regressions.
## Evals structure
Evals have two parts, the “Eval” and the “Run”. An “Eval” holds the configuration for your testing criteria and the structure of the data for your “Runs”. An Eval can have many Runs, which are each evaluated using your testing criteria.
```
`from openai import AsyncOpenAI
import os
import asyncio
os.environ["OPENAI\_API\_KEY"] = os.environ.get("OPENAI\_API\_KEY", "your-api-key")
client = AsyncOpenAI()`
```
## Use-case
We’re testing the following integration, a push notifications summary, which takes in multiple push notifications and collapses them into a single one, this is a chat completions call.
# Generate our test data
I’m going to produce simulated production chat completions requests with two different prompt versions to test how each performs. The first is a “good” prompt, the second is a “bad” prompt. These will have different metadata which we’ll use later.
```
`push\_notification\_data = [
"""
- New message from Sarah: "Can you call me later?"
- Your package has been delivered!
- Flash sale: 20% off electronics for the next 2 hours!
""",
"""
- Weather alert: Thunderstorm expected in your area.
- Reminder: Doctor's appointment at 3 PM.
- John liked your photo on Instagram.
""",
"""
- Breaking News: Local elections results are in.
- Your daily workout summary is ready.
- Check out your weekly screen time report.
""",
"""
- Your ride is arriving in 2 minutes.
- Grocery order has been shipped.
- Don't miss the season finale of your favorite show tonight!
""",
"""
- Event reminder: Concert starts at 7 PM.
- Your favorite team just scored!
- Flashback: Memories from 3 years ago.
""",
"""
- Low battery alert: Charge your device.
- Your friend Mike is nearby.
- New episode of "The Tech Hour" podcast is live!
""",
"""
- System update available.
- Monthly billing statement is ready.
- Your next meeting starts in 15 minutes.
""",
"""
- Alert: Unauthorized login attempt detected.
- New comment on your blog post: "Great insights!"
- Tonight's dinner recipe: Pasta Primavera.
""",
"""
- Special offer: Free coffee with any breakfast order.
- Your flight has been delayed by 30 minutes.
- New movie release: "Adventures Beyond" now streaming.
""",
"""
- Traffic alert: Accident reported on Main Street.
- Package out for delivery: Expected by 5 PM.
- New friend suggestion: Connect with Emma.
"""]`
```
```
`PROMPTS = [
(
"""
You are a helpful assistant that summarizes push notifications.
You are given a list of push notifications and you need to collapse them into a single one.
Output only the final summary, nothing else.
""",
"v1"
),
(
"""
You are a helpful assistant that summarizes push notifications.
You are given a list of push notifications and you need to collapse them into a single one.
The summary should be longer than it needs to be and include more information than is necessary.
Output only the final summary, nothing else.
""",
"v2"
)
]
tasks = []
for notifications in push\_notification\_data:
for (prompt, version) in PROMPTS:
tasks.append(client.chat.completions.create(
model="gpt-4o-mini",
messages=[
{"role": "developer", "content": prompt},
{"role": "user", "content": notifications},
],
store=True,
metadata={"prompt\_version": version, "usecase": "push\_notifications\_summarizer"},
))
await asyncio.gather(\*tasks)`
```
You can view the completions you just created at [https://platform.openai.com/logs](https://platform.openai.com/logs).
**Make sure that the chat completions show up, as they are necessary for the next step.**
```
`completions = await client.chat.completions.list()
assert completions.data, "No completions found. You may need to enable logs in your admin panel."
completions.data[0]`
```
# Setting up your eval
An Eval holds the configuration that is shared across multiple *Runs*, it has two components:
1. Data source configuration `data\_source\_config` - the schema (columns) that your future *Runs* conform to.
* The `data\_source\_config` uses JSON Schema to define what variables are available in the Eval.
* Testing Criteria `testing\_criteria` - How you’ll determine if your integration is working for each *row* of your data source.
For this use-case, we’re using stored-completions, so we’ll set up that data\_source\_config
**Important**
You are likely to have many different stored completions use-cases, metadata is the best way to keep track of this for evals to keep them focused and task oriented.
```
`# We want our input data to be available in our variables, so we set the item\_schema to
# PushNotifications.model\_json\_schema()
data\_source\_config = {
"type": "stored\_completions",
"metadata": {
"usecase": "push\_notifications\_summarizer"
}
}`
```
This data\_source\_config defines what variables are available throughout the eval.
The stored completions config provides two variables for you to use throughout your eval:
1. {{item.input}} - the messages sent to the completions call
2. {{sample.output\_text}} - the text response from the assistant
**Now, we’ll use those variables to set up our test criteria.**
```
`GRADER\_DEVELOPER\_PROMPT = """
Label the following push notification summary as either correct or incorrect.
The push notification and the summary will be provided below.
A good push notificiation summary is concise and snappy.
If it is good, then label it as correct, if not, then incorrect.
"""
GRADER\_TEMPLATE\_PROMPT = """
Push notifications: {{item.input}}
Summary: {{sample.output\_text}}
"""
push\_notification\_grader = {
"name": "Push Notification Summary Grader",
"type": "label\_model",
"model": "o3-mini",
"input": [
{
"role": "developer",
"content": GRADER\_DEVELOPER\_PROMPT,
},
{
"role": "user",
"content": GRADER\_TEMPLATE\_PROMPT,
},
],
"passing\_labels": ["correct"],
"labels": ["correct", "incorrect"],
}`
```
The `push\_notification\_grader` is a model grader (llm-as-a-judge), which looks at the input `{{item.input}}` and the generated summary `{{sample.output\_text}}` and labels it as “correct” or “incorrect”.
Note: under the hood, this uses structured outputs so that labels are always valid.
**Now we’ll create our eval!, and start adding data to it**
```
`eval\_create\_result = await client.evals.create(
name="Push Notification Completion Monitoring",
metadata={"description": "This eval monitors completions"},
data\_source\_config=data\_source\_config,
testing\_criteria=[push\_notification\_grader],
)
eval\_id = eval\_create\_result.id`
```
# Creating runs
Now that we have our eval set-up with our test\_criteria, we can start adding runs.
I want to compare the performance between my two **prompt versions**
To do this, we just define our source as “stored\_completions” with a metadata filter for each of our prompt versions.
```
`# Grade prompt\_version=v1
eval\_run\_result = await client.evals.runs.create(
eval\_id=eval\_id,
name="v1-run",
data\_source={
"type": "completions",
"source": {
"type": "stored\_completions",
"metadata": {
"prompt\_version": "v1",
}
}
}
)
print(eval\_run\_result.report\_url)`
```
```
`# Grade prompt\_version=v2
eval\_run\_result\_v2 = await client.evals.runs.create(
eval\_id=eval\_id,
name="v2-run",
data\_source={
"type": "completions",
"source": {
"type": "stored\_completions",
"metadata": {
"prompt\_version": "v2",
}
}
}
)
print(eval\_run\_result\_v2.report\_url)`
```
Just for to be thorough, let’s see how this prompt would do with 4o, instead of 4o-mini, with both prompt versions as the starting point.
All we have to do is reference the input messages ({{item.input}}) and set the model to 4o. Since we don’t already have any stored completions for 4o, this eval run will generate new completions.
```
`tasks = []
for prompt\_version in ["v1", "v2"]:
tasks.append(client.evals.runs.create(
eval\_id=eval\_id,
name=f"post-fix-new-model-run-{prompt\_version}",
data\_source={
"type": "completions",
"input\_messages": {
"type": "item\_reference",
"item\_reference": "item.input",
},
"model": "gpt-4o",
"source": {
"type": "stored\_completions",
"metadata": {
"prompt\_version": prompt\_version,
}
}
},
))
result = await asyncio.gather(\*tasks)
for run in result:
print(run.report\_url)`
```
If you view that report, you’ll see that we can see that prompt\_version=v2 has a regression!
## Congratulations, you just discovered a bug, you could revert it, or make another prompt change, etc.!