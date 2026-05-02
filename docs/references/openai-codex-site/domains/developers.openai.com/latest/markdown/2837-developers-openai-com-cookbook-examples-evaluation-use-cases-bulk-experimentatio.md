Evals API Use-case - Bulk model and prompt experimentation
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
# Evals API Use-case - Bulk model and prompt experimentation
[ JG ](https://www.linkedin.com/in/josiahbgrace)
[ Josiah Grace
(OpenAI)
](https://www.linkedin.com/in/josiahbgrace)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/evaluation/use-cases/bulk-experimentation.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/evaluation/use-cases/bulk-experimentation.ipynb)
Evals are **task oriented** and iterative, they’re the best way to check how your LLM integration is doing and improve it.
In the following eval, we are going to focus on the task of **testing many variants of models and prompts**.
Our use-case is:
1. I want to get the best possible performance out of my push notifications summarizer
## Evals structure
Evals have two parts, the “Eval” and the “Run”. An “Eval” holds the configuration for your testing criteria and the structure of the data for your “Runs”. An Eval `has\_many` runs, that are evaluated by your testing criteria.
```
`import pydantic
import openai
from openai.types.chat import ChatCompletion
import os
os.environ["OPENAI\_API\_KEY"] = os.environ.get("OPENAI\_API\_KEY", "your-api-key")`
```
## Use-case
We’re testing the following integration, a push notifications summarizer, which takes in multiple push notifications and collapses them into a single message.
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
Categorize the following push notification summary into the following categories:
1. concise-and-snappy
2. drops-important-information
3. verbose
4. unclear
5. obscures-meaning
6. other
You'll be given the original list of push notifications and the summary like this:
\<push\_notifications\>
...notificationlist...
\</push\_notifications\>
\<summary\>
...summary...
\</summary\>
You should only pick one of the categories above, pick the one which most closely matches and why.
"""
GRADER\_TEMPLATE\_PROMPT = """
\<push\_notifications\>{{item.notifications}}\</push\_notifications\>
\<summary\>{{sample.output\_text}}\</summary\>
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
"passing\_labels": ["concise-and-snappy"],
"labels": [
"concise-and-snappy",
"drops-important-information",
"verbose",
"unclear",
"obscures-meaning",
"other",
],
}`
```
The `push\_notification\_grader` is a model grader (llm-as-a-judge) which looks at the input `{{item.notifications}}` and the generated summary `{{sample.output\_text}}` and labels it as “correct” or “incorrect”
We then instruct via the “passing\_labels” what constitutes a passing answer.
Note: under the hood, this uses structured outputs so that labels are always valid.
**Now we’ll create our eval, and start adding data to it!**
```
`eval\_create\_result = openai.evals.create(
name="Push Notification Bulk Experimentation Eval",
metadata={
"description": "This eval tests many prompts and models to find the best performing combination.",
},
data\_source\_config=data\_source\_config,
testing\_criteria=[push\_notification\_grader],
)
eval\_id = eval\_create\_result.id`
```
# Creating runs
Now that we have our eval set-up with our testing\_criteria, we can start to add a bunch of runs!
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
Now we’re going to set up a bunch of prompts to test.
We want to test a basic prompt, with a couple of variations:
1. In one variation, we’ll just have the basic prompt
2. In the next one, we’ll include some positive examples of what we want the summaries to look like
3. In the final one, we’ll include both positive and negative examples.
We’ll also include a list of models to use.
```
`PROMPT\_PREFIX = """
You are a helpful assistant that takes in an array of push notifications and returns a collapsed summary of them.
The push notification will be provided as follows:
\<push\_notifications\>
...notificationlist...
\</push\_notifications\>
You should return just the summary and nothing else.
"""
PROMPT\_VARIATION\_BASIC = f"""
{PROMPT\_PREFIX}
You should return a summary that is concise and snappy.
"""
PROMPT\_VARIATION\_WITH\_EXAMPLES = f"""
{PROMPT\_VARIATION\_BASIC}
Here is an example of a good summary:
\<push\_notifications\>
- Traffic alert: Accident reported on Main Street.- Package out for delivery: Expected by 5 PM.- New friend suggestion: Connect with Emma.
\</push\_notifications\>
\<summary\>
Traffic alert, package expected by 5pm, suggestion for new friend (Emily).
\</summary\>
"""
PROMPT\_VARIATION\_WITH\_NEGATIVE\_EXAMPLES = f"""
{PROMPT\_VARIATION\_WITH\_EXAMPLES}
Here is an example of a bad summary:
\<push\_notifications\>
- Traffic alert: Accident reported on Main Street.- Package out for delivery: Expected by 5 PM.- New friend suggestion: Connect with Emma.
\</push\_notifications\>
\<summary\>
Traffic alert reported on main street. You have a package that will arrive by 5pm, Emily is a new friend suggested for you.
\</summary\>
"""
prompts = [
("basic", PROMPT\_VARIATION\_BASIC),
("with\_examples", PROMPT\_VARIATION\_WITH\_EXAMPLES),
("with\_negative\_examples", PROMPT\_VARIATION\_WITH\_NEGATIVE\_EXAMPLES),
]
models = ["gpt-4o", "gpt-4o-mini", "o3-mini"]`
```
**Now we can just loop through all prompts and all models to test a bunch of configurations at once!**
We’ll use the ‘completion’ run data source with template variables for our push notification list.
OpenAI will handle making the completions calls for you and populating “sample.output\_text”
```
`for prompt\_name, prompt in prompts:
for model in models:
run\_data\_source = {
"type": "completions",
"input\_messages": {
"type": "template",
"template": [
{
"role": "developer",
"content": prompt,
},
{
"role": "user",
"content": "\<push\_notifications\>{{item.notifications}}\</push\_notifications\>",
},
],
},
"model": model,
"source": {
"type": "file\_content",
"content": [
{
"item": PushNotifications(notifications=notification).model\_dump()
}
for notification in push\_notification\_data
],
},
}
run\_create\_result = openai.evals.runs.create(
eval\_id=eval\_id,
name=f"bulk\_{prompt\_name}\_{model}",
data\_source=run\_data\_source,
)
print(f"Report URL {model}, {prompt\_name}:", run\_create\_result.report\_url)`
```
## Congratulations, you just tested 9 different prompt and model variations across your dataset!