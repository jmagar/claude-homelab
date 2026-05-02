Evals API Use-case - Detecting prompt regressions
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
# Evals API Use-case - Detecting prompt regressions
[ JG ](https://www.linkedin.com/in/josiahbgrace)
[ Josiah Grace
(OpenAI)
](https://www.linkedin.com/in/josiahbgrace)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/evaluation/use-cases/regression.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/evaluation/use-cases/regression.ipynb)
Evals are **task oriented** and iterative, they’re the best way to check how your LLM integration is doing and improve it.
In the following eval, we are going to focus on the task of **detecting if my prompt change is a regression**.
Our use-case is:
1. I have an llm integration that takes a list of push notifications and summarizes them into a single condensed statement.
2. I want to detect if a prompt change regresses the behavior
## Evals structure
Evals have two parts, the “Eval” and the “Run”. An “Eval” holds the configuration for your testing criteria and the structure of the data for your “Runs”. An Eval can have many runs that are evaluated by your testing criteria.
```
`import openai
from openai.types.chat import ChatCompletion
import pydantic
import os
os.environ["OPENAI\_API\_KEY"] = os.environ.get("OPENAI\_API\_KEY", "your-api-key")`
```
## Use-case
We’re testing the following integration, a push notifications summary, which takes in multiple push notifications and collapses them into a single one, this is a chat completions call.
```
`class PushNotifications(pydantic.BaseModel):
notifications: str
print(PushNotifications.model\_json\_schema())`
```
```
`DEVELOPER\_PROMPT = """
You are a helpful assistant that summarizes push notifications.
You are given a list of push notifications and you need to collapse them into a single one.
Output only the final summary, nothing else.
"""
def summarize\_push\_notification(push\_notifications: str) -\> ChatCompletion:
result = openai.chat.completions.create(
model="gpt-4o-mini",
messages=[
{"role": "developer", "content": DEVELOPER\_PROMPT},
{"role": "user", "content": push\_notifications},
],
)
return result
example\_push\_notifications\_list = PushNotifications(notifications="""
- Alert: Unauthorized login attempt detected.
- New comment on your blog post: "Great insights!"
- Tonight's dinner recipe: Pasta Primavera.
""")
result = summarize\_push\_notification(example\_push\_notifications\_list.notifications)
print(result.choices[0].message.content)`
```
# Setting up your eval
An Eval holds the configuration that is shared across multiple *Runs*, it has two components:
1. Data source configuration `data\_source\_config` - the schema (columns) that your future *Runs* conform to.
* The `data\_source\_config` uses JSON Schema to define what variables are available in the Eval.
* Testing Criteria `testing\_criteria` - How you’ll determine if your integration is working for each *row* of your data source.
For this use-case, we want to test if the push notification summary completion is good, so we’ll set-up our eval with this in mind.
```
`# We want our input data to be available in our variables, so we set the item\_schema to
# PushNotifications.model\_json\_schema()
data\_source\_config = {
"type": "custom",
"item\_schema": PushNotifications.model\_json\_schema(),
# We're going to be uploading completions from the API, so we tell the Eval to expect this
"include\_sample\_schema": True,
}`
```
This data\_source\_config defines what variables are available throughout the eval.
This item schema:
```
`{
"properties": {
"notifications": {
"title": "Notifications",
"type": "string"
}
},
"required": ["notifications"],
"title": "PushNotifications",
"type": "object"
}`
```
Means that we’ll have the variable `{{item.notifications}}` available in our eval.
`"include\_sample\_schema": True`
Mean’s that we’ll have the variable `{{sample.output\_text}}` available in our eval.
**Now, we’ll use those variables to set up our test criteria.**
```
`GRADER\_DEVELOPER\_PROMPT = """
Label the following push notification summary as either correct or incorrect.
The push notification and the summary will be provided below.
A good push notificiation summary is concise and snappy.
If it is good, then label it as correct, if not, then incorrect.
"""
GRADER\_TEMPLATE\_PROMPT = """
Push notifications: {{item.notifications}}
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
The `push\_notification\_grader` is a model grader (llm-as-a-judge), which looks at the input `{{item.notifications}}` and the generated summary `{{sample.output\_text}}` and labels it as “correct” or “incorrect”.
We then instruct via. the “passing\_labels”, what constitutes a passing answer.
Note: under the hood, this uses structured outputs so that labels are always valid.
**Now we’ll create our eval!, and start adding data to it**
```
`eval\_create\_result = openai.evals.create(
name="Push Notification Summary Workflow",
metadata={
"description": "This eval checks if the push notification summary is correct.",
},
data\_source\_config=data\_source\_config,
testing\_criteria=[push\_notification\_grader],
)
eval\_id = eval\_create\_result.id`
```
# Creating runs
Now that we have our eval set-up with our test\_criteria, we can start to add a bunch of runs!
We’ll start with some push notification data.
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
Our first run will be our default grader from the completions function above `summarize\_push\_notification`
We’ll loop through our dataset, make completions calls, and then submit them as a run to be graded.
```
`run\_data = []
for push\_notifications in push\_notification\_data:
result = summarize\_push\_notification(push\_notifications)
run\_data.append({
"item": PushNotifications(notifications=push\_notifications).model\_dump(),
"sample": result.model\_dump()
})
eval\_run\_result = openai.evals.runs.create(
eval\_id=eval\_id,
name="baseline-run",
data\_source={
"type": "jsonl",
"source": {
"type": "file\_content",
"content": run\_data,
}
},
)
print(eval\_run\_result)
# Check out the results in the UI
print(eval\_run\_result.report\_url)`
```
Now let’s simulate a regression, here’s our original prompt, let’s simulate a developer breaking the prompt.
```
`DEVELOPER\_PROMPT = """
You are a helpful assistant that summarizes push notifications.
You are given a list of push notifications and you need to collapse them into a single one.
Output only the final summary, nothing else.
"""`
```
```
`DEVELOPER\_PROMPT = """
You are a helpful assistant that summarizes push notifications.
You are given a list of push notifications and you need to collapse them into a single one.
You should make the summary longer than it needs to be and include more information than is necessary.
"""
def summarize\_push\_notification\_bad(push\_notifications: str) -\> ChatCompletion:
result = openai.chat.completions.create(
model="gpt-4o-mini",
messages=[
{"role": "developer", "content": DEVELOPER\_PROMPT},
{"role": "user", "content": push\_notifications},
],
)
return result`
```
```
`run\_data = []
for push\_notifications in push\_notification\_data:
result = summarize\_push\_notification\_bad(push\_notifications)
run\_data.append({
"item": PushNotifications(notifications=push\_notifications).model\_dump(),
"sample": result.model\_dump()
})
eval\_run\_result = openai.evals.runs.create(
eval\_id=eval\_id,
name="regression-run",
data\_source={
"type": "jsonl",
"source": {
"type": "file\_content",
"content": run\_data,
}
},
)
print(eval\_run\_result.report\_url)`
```
If you view that report, you’ll see that it has a score that’s much lower than the baseline-run.
## Congratulations, you just prevented a bug from shipping to users
Quick note:
Evals doesn’t yet support the `responses` api natively, however, you can transform it to the `completions` format with the following code.
```
`def summarize\_push\_notification\_responses(push\_notifications: str):
result = openai.responses.create(
model="gpt-4o",
input=[
{"role": "developer", "content": DEVELOPER\_PROMPT},
{"role": "user", "content": push\_notifications},
],
)
return result
def transform\_response\_to\_completion(response):
completion = {
"model": response.model,
"choices": [{
"index": 0,
"message": {
"role": "assistant",
"content": response.output\_text
},
"finish\_reason": "stop",
}]
}
return completion
run\_data = []
for push\_notifications in push\_notification\_data:
response = summarize\_push\_notification\_responses(push\_notifications)
completion = transform\_response\_to\_completion(response)
run\_data.append({
"item": PushNotifications(notifications=push\_notifications).model\_dump(),
"sample": completion
})
report\_response = openai.evals.runs.create(
eval\_id=eval\_id,
name="responses-run",
data\_source={
"type": "jsonl",
"source": {
"type": "file\_content",
"content": run\_data,
}
},
)
print(report\_response.report\_url)`
```