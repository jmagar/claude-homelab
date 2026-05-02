Custom LLM as a Judge to Detect Hallucinations with Braintrust
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
Oct 14, 2024
# Custom LLM as a Judge to Detect Hallucinations with Braintrust
[ AN ](https://github.com/ankrgyl)[ SA ](https://twitter.com/shyamalanadkat)
[ ankrgyl , ](https://github.com/ankrgyl)[ Shyamal Anadkat
(OpenAI)
](https://twitter.com/shyamalanadkat)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Custom-LLM-as-a-Judge.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Custom-LLM-as-a-Judge.ipynb)
Let’s say you’re working on a customer service bot and trying to evaluate the quality of its responses. Consider a question like “What is your return policy?” If the correct answer is “You can return items within 30 days of purchase,” but your bot generates “You can return items within 30 days,” how would you evaluate whether this is a good response?
A heuristic like the `Levenshtein` string distance would indicate that the response is incorrect. However, a better approach is to use an LLM-as-a-judge to assess the accuracy of the response. LLM-as-a-judge is a technique that leverages an LLM to score the quality of answers. LLMs can reason about language beyond surface-level string comparisons, enabling them to evaluate answers more accurately.
In this cookbook, we’ll walk through how to build an LLM-as-a-judge scorer that can detect hallucinations using [Braintrust](https://www.braintrust.dev/), a third-party evaluation platform that is compatible with OpenAI’s models.
## Installing dependencies
Let’s install a few basic dependencies. We’ll use the CoQA dataset (via DuckDB), [Braintrust](https://www.braintrust.dev/) for evals, and [OpenAI’s models](https://platform.openai.com/docs/models). Please note that Braintrust is a third-party evaluation platform and you should review their [terms of service and privacy policy](https://www.braintrust.dev/legal/terms-of-service) before proceeding.
```
`%pip install autoevals duckdb braintrust openai --quiet`
```
```
`Note: you may need to restart the kernel to use updated packages.`
```
Next, let’s initialize the OpenAI client. We’ll use the `AsyncOpenAI` client so that we can parallelize our requests. The `braintrust.wrap\_openai` function
wraps the OpenAI client to enable logging LLM calls to [Braintrust](https://www.braintrust.dev/). We’ll use Braintrust to facilitate the evaluations below.
Before proceeding, you should sign up for a [Braintrust account](https://www.braintrust.dev/signup) and set `BRAINTRUST\_API\_KEY` in your environment to a valid API key.
```
`import os
import braintrust
from openai import AsyncOpenAI
braintrust.login(api\_key=os.environ["BRAINTRUST\_API\_KEY"])
client = braintrust.wrap\_openai(AsyncOpenAI(api\_key=os.environ["OPENAI\_API\_KEY"]))`
```
## Explore the dataset
We’ll use the [CoQA dataset](https://stanfordnlp.github.io/coqa/) which contains a diverse set of passages, questions, and answers. Because CoQA is quite large, we’ll just look at the first several passages. As with any public dataset, there’s a chance that the underlying LLMs have memorized aspects of the dataset, so when developing your own scorers, it’s a good idea to test them using
your own private data.
```
`import duckdb
# DuckDB has an easy wrapper for loading datasets from Hugging Face.
con = duckdb.connect(":memory:")
full\_result = con.query("""
SELECT \* FROM 'hf://datasets/stanfordnlp/coqa/data/validation-00000-of-00001.parquet'
LIMIT 40
""").fetchall()
single\_result = full\_result[10]
print("Passage:")
print(single\_result[1])
print("\\nQuestion:")
print(single\_result[2][0])
print("\\nAnswer:")
print(single\_result[3]["input\_text"][0])`
```
```
`Passage:
(CNN)A chiseled boxer's Instagram feed shows him making constant references to the Bible and enjoying gospel singing with his wife.
Another features his formidable opponent counting stacks of money, hanging out in strip clubs, and flashing diamond watches and Ferraris.
Welcome to the world of boxing promotion, circa 2015.
American Floyd Mayweather and Filipino Manny Pacquiao are set to officially announce their heavily anticipated boxing match at a press conference in Los Angeles Wednesday.
With the combined purse for the May 2 bout in Las Vegas reported to touch $300 million pending viewership numbers, the incentives to self-promote could not be higher.
"Nowadays you have to be on social media to launch the fight and to build hype," says boxing promoter Nisse Sauerland, CEO of Team Sauerland. "It couldn't be done without it."
Thirty-eight year old Mayweather (47-0, 26 knockouts), who favors the moniker "The Money Man" or "TBE" (The Best Ever), boasts nearly five million Instagram followers, 5.65 million followers on Twitter and 9.2 million Facebook likes.
He famously confirmed the fight via Shots, a photo sharing social media application that he's invested in, and displays links to his clothing brand, The Money Team, on all his accounts.
Along with professing to the be the best fighter of all time, he could also stake a claim to be one of the greatest social media users in sports.
"I think they're both playing their roles," says Sauerland, who promotes over 45 boxers. "You've got the bad guy and the good guy, really. You've got the guy who throws the money around (Mayweather), that's his image, and Pacquiao, he's the hope of a nation."
Question:
Who are the two boxer featured in this article?
Answer:
Floyd Mayweather and Manny Pacquiao`
```
The data contains a series of passages, each with a number of questions and answers. Let’s flatten this into a list of `(passage, question, answer)` tuples.
```
`from dataclasses import dataclass
@dataclass
class QuestionAnswer:
passage: str
question: str
expected\_answer: str
generated\_answer: str
qa\_pairs = [
QuestionAnswer(
passage=r[1],
question=question,
generated\_answer=r[3]["input\_text"][i],
expected\_answer=r[3]["input\_text"][i],
)
for r in full\_result
for (i, question) in enumerate(r[2])
]
print(len(qa\_pairs))`
```
```
`629`
```
### Adding hallucinations
Because Braintrust’s scorer is designed to test hallucinations, we can use the QA pairs to generate known hallucinations. We’ll create hallucinated answers by asking an
LLM to confidently generate an answer to each question without using the passage.
```
`import asyncio
import random
random.seed(42)
async def hallucinate\_answer(qa):
response = await client.chat.completions.create(
model="gpt-4o",
messages=[
{
"role": "system",
"content": """\\
You are a helpful hallucinating assistant, who makes up fake answers to questions.
Answer the following question in 1 sentence. If you know the answer, then make up some fake
superfluous details that are not in the passage you have memorized.
Make sure to always answer it confidently, even if you don't know the answer. Do not use words
like "perhaps", "likely", "maybe", etc. or punctuation like "...".Do not admit that you cannot
or do not know the answer.""",
},
{"role": "user", "content": qa.question},
],
temperature=1,
max\_tokens=100,
)
return response.choices[0].message.content
hallucinated\_answers = await asyncio.gather(
\*[hallucinate\_answer(qa) for qa in qa\_pairs]
)
hallucinations = [
QuestionAnswer(
passage=qa.passage,
question=qa.question,
expected\_answer=qa.expected\_answer,
generated\_answer=hallucination,
)
for (qa, hallucination) in zip(qa\_pairs, hallucinated\_answers)
# Exclude simple yes/no answers.
if "yes" not in hallucination.lower() and "no" not in hallucination.lower()
]
print("Passage:")
print(hallucinations[0].passage)
print("\\nQuestion:")
print(hallucinations[0].question)
print("\\nExpected Answer:")
print(hallucinations[0].expected\_answer)
print("\\nGenerated Answer:")
print(hallucinations[0].generated\_answer)
print("\\n\\nNumber of hallucinations:", len(hallucinations))`
```
```
`Passage:
Once upon a time, in a barn near a farm house, there lived a little white kitten named Cotton. Cotton lived high up in a nice warm place above the barn where all of the farmer's horses slept. But Cotton wasn't alone in her little home above the barn, oh no. She shared her hay bed with her mommy and 5 other sisters. All of her sisters were cute and fluffy, like Cotton. But she was the only white one in the bunch. The rest of her sisters were all orange with beautiful white tiger stripes like Cotton's mommy. Being different made Cotton quite sad. She often wished she looked like the rest of her family. So one day, when Cotton found a can of the old farmer's orange paint, she used it to paint herself like them. When her mommy and sisters found her they started laughing.
"What are you doing, Cotton?!"
"I only wanted to be more like you".
Cotton's mommy rubbed her face on Cotton's and said "Oh Cotton, but your fur is so pretty and special, like you. We would never want you to be any other way". And with that, Cotton's mommy picked her up and dropped her into a big bucket of water. When Cotton came out she was herself again. Her sisters licked her face until Cotton's fur was all all dry.
"Don't ever do that again, Cotton!" they all cried. "Next time you might mess up that pretty white fur of yours and we wouldn't want that!"
Then Cotton thought, "I change my mind. I like being special".
Question:
Where did she live?
Expected Answer:
in a barn
Generated Answer:
She lived in a quaint cottage on the edge of the Misty Hollow Forest, where elves and talking owls often hosted moonlit storytelling festivals.
Number of hallucinations: 270`
```
## Creating the evaluators
We’ll consider a few popular approaches for creating an LLM-as-a-judge. For each approach, we’ll create a scorer and then “meta-evaluate” it to see how it performs.
Since we know that the hallucinated answers are incorrect, we’ll assess the quality of an evaluator by testing how often it scores the hallucinated answers as `0`.
### LLM-as-a-judge #1: Numeric rater
A common initial intuition when creating an LLM-as-a-judge is asking the LLM to rate the answer on a scale of 1 to 5. The benefit of this approach is that
it’s easy to convert the LLM’s output into a numeric score.
We’ll use a modified version of the [Factuality](https://github.com/braintrustdata/autoevals/blob/main/templates/factuality.yaml) template, but ask the LLM to
rate the answer on a scale of 1 to 10.
```
`import json
PROMPT = """\\
You are comparing a submitted answer to an expert answer on a given question. Here is the data:
[BEGIN DATA]
\*\*\*\*\*\*\*\*\*\*\*\*
[Question]: {input}
\*\*\*\*\*\*\*\*\*\*\*\*
[Expert]: {expected}
\*\*\*\*\*\*\*\*\*\*\*\*
[Submission]: {output}
\*\*\*\*\*\*\*\*\*\*\*\*
[END DATA]
Compare the factual content of the submitted answer with the expert answer. Ignore any differences in style, grammar, or punctuation.
Rate the submission on a scale of 1 to 10.
"""
@braintrust.traced
async def numeric\_rater(input, output, expected):
response = await client.chat.completions.create(
model="gpt-4o",
messages=[
{
"role": "user",
"content": PROMPT.format(input=input, output=output, expected=expected),
}
],
temperature=0,
tools=[
{
"type": "function",
"function": {
"name": "rate",
"description": "Rate the submission on a scale of 1 to 10.",
"parameters": {
"type": "object",
"properties": {
"rating": {"type": "integer", "minimum": 1, "maximum": 10},
},
"required": ["rating"],
},
},
}
],
tool\_choice={"type": "function", "function": {"name": "rate"}},
)
arguments = json.loads(response.choices[0].message.tool\_calls[0].function.arguments)
return (arguments["rating"] - 1) / 9
print(qa\_pairs[10].question, "On a correct answer:", qa\_pairs[10].generated\_answer)
print(
await numeric\_rater(
qa\_pairs[10].question,
qa\_pairs[10].generated\_answer,
qa\_pairs[10].expected\_answer,
)
)
print(
hallucinations[10].question,
"On a hallucinated answer:",
hallucinations[10].generated\_answer,
)
print(
await numeric\_rater(
hallucinations[10].question,
hallucinations[10].generated\_answer,
hallucinations[10].expected\_answer,
)
)`
```
```
`What did the other cats do when Cotton emerged from the bucket of water? On a correct answer: licked her face
1.0
What? On a hallucinated answer: "What" is a word often used to express inquiry, curiosity, or surprise, and it is said to have originated from the ancient city of Whatopia, where people would constantly ask questions while enchanted crows delivered cryptic messages.
0.0`
```
This looks promising! Now that we have sanity checked it on a single example, let’s run a proper evaluation and see how it performs on a wider set of data. An evaluation consists of three components:
* **Data**: In this case, the `input` is the question, hallucinated answer, and ground truth answer. The scorer will convert this into a score between 0 and 1. The expected score is 0, since it’s a hallucination.
* **Task**: The task is simply calling the numeric rater for each input.
* **Scores**: We’ll assess the quality of the generated score by comparing it with the ground truth score. Since we know both numbers are between 0 and 1, we can use the normalized difference as the score.
```
`from dataclasses import asdict
from braintrust import Eval
def data():
for pair in hallucinations:
yield dict(
input=dict(asdict(pair)), expected=0, metadata=dict(hallucination=True)
)
async def task(input):
return await numeric\_rater(
input=input["question"],
output=input["generated\_answer"],
expected=input["expected\_answer"],
)
def normalized\_diff(output, expected):
return 1 - abs(output - expected)
await Eval(
"LLM-as-a-judge",
data=data,
task=task,
scores=[normalized\_diff],
experiment\_name="Numeric rater",
max\_concurrency=10,
)`
```
```
`Experiment Numeric rater is running at https://www.braintrust.dev/app/braintrustdata.com/p/LLM-as-a-judge/experiments/Numeric%20rater
LLM-as-a-judge [experiment\_name=Numeric rater] (data): 270it [00:00, 54634.41it/s]`
```
```
`LLM-as-a-judge [experiment\_name=Numeric rater] (tasks): 0%| | 0/270 [00:00\<?, ?it/s]`
```
```
`
=========================SUMMARY=========================
95.35% 'normalized\_diff' score
201.60tok prompt\_tokens
5tok completion\_tokens
206.60tok total\_tokens
See results for Numeric rater at https://www.braintrust.dev/app/braintrustdata.com/p/LLM-as-a-judge/experiments/Numeric%20rater`
```
```
`EvalResultWithSummary(summary="...", results=[...])`
```
It looks like the numeric rater scored almost 94% in total. That’s not bad, but if 6% of your evals are incorrectly judged, that could make it very hard to trust them. Let’s dig into the Braintrust
UI to get some insight into what’s going on.
It looks like a number of the incorrect answers were scored with numbers between 1 and 10. However, we do not currently have any insight into why the model gave these scores. Let’s see if we can
fix that next.
### LLM-as-a-judge #2: Adding reasoning
Let’s tweak the prompt to get the LLM to also reason about its rating. This method is called [Chain of Thought Reasoning](https://en.wikipedia.org/wiki/Chain_of_thought_reasoning). In addition
to potentially improving the score, it will give us some insight into why the model gave these scores.
```
`@braintrust.traced
async def numeric\_rater(input, output, expected):
response = await client.chat.completions.create(
model="gpt-4o",
messages=[
{
"role": "user",
"content": PROMPT.format(input=input, output=output, expected=expected),
}
],
temperature=0,
tools=[
{
"type": "function",
"function": {
"name": "rate",
"description": "Rate the submission on a scale of 1 to 10.",
"parameters": {
"type": "object",
"properties": {
"reasons": {
"description": "Write out in a step by step manner your reasoning to be sure that your conclusion is correct. Avoid simply stating the correct answer at the outset.",
"title": "Reasoning",
"type": "string",
},
"rating": {"type": "integer", "minimum": 1, "maximum": 10},
},
"required": ["rating"],
},
},
}
],
tool\_choice={"type": "function", "function": {"name": "rate"}},
)
arguments = json.loads(response.choices[0].message.tool\_calls[0].function.arguments)
return (arguments["rating"] - 1) / 9
print(qa\_pairs[10].question, "On a correct answer:", qa\_pairs[10].generated\_answer)
print(
await numeric\_rater(
qa\_pairs[10].question,
qa\_pairs[10].generated\_answer,
qa\_pairs[10].expected\_answer,
)
)
print(
hallucinations[10].question,
"On a hallucinated answer:",
hallucinations[10].generated\_answer,
)
print(
await numeric\_rater(
hallucinations[10].question,
hallucinations[10].generated\_answer,
hallucinations[10].expected\_answer,
)
)`
```
```
`What did the other cats do when Cotton emerged from the bucket of water? On a correct answer: licked her face
1.0
What? On a hallucinated answer: "What" is a word often used to express inquiry, curiosity, or surprise, and it is said to have originated from the ancient city of Whatopia, where people would constantly ask questions while enchanted crows delivered cryptic messages.
0.0`
```
```
`await Eval(
"LLM-as-a-judge",
data=data,
task=task,
scores=[normalized\_diff],
experiment\_name="Numeric rater with reasoning",
max\_concurrency=10,
)`
```
```
`Experiment Numeric rater with reasoning is running at https://www.braintrust.dev/app/braintrustdata.com/p/LLM-as-a-judge/experiments/Numeric%20rater%20with%20reasoning
LLM-as-a-judge [experiment\_name=Numeric rater with reasoning] (data): 270it [00:00, 111715.70it/s]`
```
```
`LLM-as-a-judge [experiment\_name=Numeric rater with reasoning] (tasks): 0%| | 0/270 [00:00\<?, ?it/s]`
```
```
`
=========================SUMMARY=========================
Numeric rater with reasoning compared to Numeric rater:
92.10% (-03.25%) 'normalized\_diff' score (5 improvements, 63 regressions)
3.68s duration
3.68s llm\_duration
239.60tok (+3800.00%) 'prompt\_tokens' (0 improvements, 270 regressions)
136.82tok (+13182.22%) 'completion\_tokens' (0 improvements, 270 regressions)
376.43tok (+16982.22%) 'total\_tokens' (0 improvements, 270 regressions)
0.00$ estimated\_cost
See results for Numeric rater with reasoning at https://www.braintrust.dev/app/braintrustdata.com/p/LLM-as-a-judge/experiments/Numeric%20rater%20with%20reasoning`
```
```
`EvalResultWithSummary(summary="...", results=[...])`
```
It doesn’t look like adding reasoning helped the score (in fact, it’s 3% percent worse). However, if we look at one of the failures, we’ll get some insight into
what the model was thinking. Here is an example of a hallucinated answer:
And the score along with its reasoning:
It looks like the model is applying its own judgement to compute partial credit. This is a common problem with numeric rating—both for models and for humans—and can often be solved
by using better prompting.
### LLM-as-a-judge #3: Classifying instead of rating
Next, we’ll spell out specific criteria and ask the model to classify the answer according to those criteria. This method allows us to more precisely guide the model
towards the hallucinations we’re testing for. Intuitively, giving the model specific criteria to rate will result in a more accurate score.
```
`PROMPT = """\\
You are comparing a submitted answer to an expert answer on a given question. Here is the data:
[BEGIN DATA]
\*\*\*\*\*\*\*\*\*\*\*\*
[Question]: {input}
\*\*\*\*\*\*\*\*\*\*\*\*
[Expert]: {expected}
\*\*\*\*\*\*\*\*\*\*\*\*
[Submission]: {output}
\*\*\*\*\*\*\*\*\*\*\*\*
[END DATA]
Compare the factual content of the submitted answer with the expert answer. Ignore any differences in style, grammar, or punctuation.
The submitted answer may either be a subset or superset of the expert answer, or it may conflict with it. Determine which case applies. Answer the question by selecting one of the following options:
(A) The submitted answer is a subset of the expert answer and is fully consistent with it.
(B) The submitted answer is a superset of the expert answer and is fully consistent with it.
(C) The submitted answer contains all the same details as the expert answer.
(D) There is a disagreement between the submitted answer and the expert answer.
(E) The answers differ, but these differences don't matter from the perspective of factuality.
Answer the question by calling `select\_choice` with your reasoning in a step-by-step matter to be
sure that your conclusion is correct. Avoid simply stating the correct answer at the outset. Select a
single choice by setting the `choice` parameter to a single choice from A, B, C, D, or E.
"""
# Since we're testing for hallucinations, penalize (B) as much as (D).
CHOICE\_SCORES = {
"A": 0.5,
"B": 0,
"C": 1,
"D": 0,
"E": 1,
}
@braintrust.traced
async def classifier(input, output, expected):
response = await client.chat.completions.create(
model="gpt-4o",
messages=[
{
"role": "user",
"content": PROMPT.format(input=input, output=output, expected=expected),
}
],
temperature=0,
tools=[
{
"type": "function",
"function": {
"name": "rate",
"description": "Call this function to select a choice.",
"parameters": {
"properties": {
"reasons": {
"description": "Write out in a step by step manner your reasoning to be sure that your conclusion is correct. Avoid simply stating the correct answer at the outset.",
"type": "string",
},
"choice": {
"description": "The choice",
"type": "string",
"enum": ["A", "B", "C", "D", "E"],
},
},
"required": ["reasons", "choice"],
"type": "object",
},
},
}
],
tool\_choice={"type": "function", "function": {"name": "rate"}},
)
arguments = json.loads(response.choices[0].message.tool\_calls[0].function.arguments)
choice = arguments["choice"]
return CHOICE\_SCORES[choice] if choice in CHOICE\_SCORES else None
print(qa\_pairs[10].question, "On a correct answer:", qa\_pairs[10].generated\_answer)
print(
await classifier(
qa\_pairs[10].question,
qa\_pairs[10].generated\_answer,
qa\_pairs[10].expected\_answer,
)
)
print(
hallucinations[10].question,
"On a hallucinated answer:",
hallucinations[10].generated\_answer,
)
print(
await classifier(
hallucinations[10].question,
hallucinations[10].generated\_answer,
hallucinations[10].expected\_answer,
)
)`
```
```
`What did the other cats do when Cotton emerged from the bucket of water? On a correct answer: licked her face
1
What? On a hallucinated answer: "What" is a word often used to express inquiry, curiosity, or surprise, and it is said to have originated from the ancient city of Whatopia, where people would constantly ask questions while enchanted crows delivered cryptic messages.
0`
```
```
`async def task(input):
return await classifier(
input=input["question"],
output=input["generated\_answer"],
expected=input["expected\_answer"],
)
await Eval(
"LLM-as-a-judge",
data=data,
task=task,
scores=[normalized\_diff],
experiment\_name="Classifier",
max\_concurrency=10,
)`
```
```
`Experiment Classifier is running at https://www.braintrust.dev/app/braintrustdata.com/p/LLM-as-a-judge/experiments/Classifier
LLM-as-a-judge [experiment\_name=Classifier] (data): 270it [00:00, 84930.41it/s]`
```
```
`LLM-as-a-judge [experiment\_name=Classifier] (tasks): 0%| | 0/270 [00:00\<?, ?it/s]`
```
```
`
=========================SUMMARY=========================
Classifier compared to Numeric rater with reasoning:
98.15% (+06.05%) 'normalized\_diff' score (86 improvements, 5 regressions)
4.41s (+72.60%) 'duration' (104 improvements, 165 regressions)
4.40s (+72.59%) 'llm\_duration' (104 improvements, 165 regressions)
418.60tok (+17900.00%) 'prompt\_tokens' (0 improvements, 270 regressions)
164.91tok (+2809.26%) 'completion\_tokens' (64 improvements, 204 regressions)
583.52tok (+20709.26%) 'total\_tokens' (0 improvements, 270 regressions)
0.00$ (+00.07%) 'estimated\_cost' (8 improvements, 255 regressions)
See results for Classifier at https://www.braintrust.dev/app/braintrustdata.com/p/LLM-as-a-judge/experiments/Classifier`
```
```
`EvalResultWithSummary(summary="...", results=[...])`
```
The classifier scored 98% which is a significant improvement!
### Codifying this pattern
The classifier above can simply be rewritten as:
```
`PROMPT = """\\
You are comparing a submitted answer to an expert answer on a given question. Here is the data:
[BEGIN DATA]
\*\*\*\*\*\*\*\*\*\*\*\*
[Question]: {{input}}
\*\*\*\*\*\*\*\*\*\*\*\*
[Expert]: {{expected}}
\*\*\*\*\*\*\*\*\*\*\*\*
[Submission]: {{output}}
\*\*\*\*\*\*\*\*\*\*\*\*
[END DATA]
Compare the factual content of the submitted answer with the expert answer. Ignore any differences in style, grammar, or punctuation.
The submitted answer may either be a subset or superset of the expert answer, or it may conflict with it. Determine which case applies. Answer the question by selecting one of the following options:
(A) The submitted answer is a subset of the expert answer and is fully consistent with it.
(B) The submitted answer is a superset of the expert answer and is fully consistent with it.
(C) The submitted answer contains all the same details as the expert answer.
(D) There is a disagreement between the submitted answer and the expert answer.
(E) The answers differ, but these differences don't matter from the perspective of factuality.
Answer the question by calling `select\_choice` with your reasoning in a step-by-step matter to be
sure that your conclusion is correct. Avoid simply stating the correct answer at the outset. Select a
single choice by setting the `choice` parameter to a single choice from A, B, C, D, or E.
"""
Classifier = autoevals.LLMClassifier(
name="Hallucination detector",
prompt\_template=PROMPT,
choice\_scores={"A": 0.5, "B": 0, "C": 1, "D": 0, "E": 1},
use\_cot=True,
)`
```
## Next steps
As a next step, you could dig into the individual improvements and regressions to assess them and consider future improvements to the prompt. You could also test it on your own data, and double check that the results hold for your use case.
You could also measure a model like o1, try fine-tuning a smaller model and see if the results are reproducible, or use few-shot prompting to align the model with more subjective criteria.
In all cases, you should strive to evaluate your results, so you can rigorously assess the impact of each change.