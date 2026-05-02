Fine-Tuning Techniques - Choosing Between SFT, DPO, and RFT (With a Guide to DPO)
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
Jun 18, 2025
# Fine-Tuning Techniques - Choosing Between SFT, DPO, and RFT (With a Guide to DPO)
[ AL ](https://www.linkedin.com/in/alex-lowden01/)
[ Alex Lowden ](https://www.linkedin.com/in/alex-lowden01/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Fine_tuning_direct_preference_optimization_guide.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Fine_tuning_direct_preference_optimization_guide.ipynb)
*This guide is for developers and ML practitioners who have some experience with OpenAIʼs APIs and wish to use their fine-tuned models for research or other appropriate uses. OpenAI’s services are not intended for the personalized treatment or diagnosis of any medical condition and are subject to our [applicable terms](https://openai.com/policies/).*
This guide discusses fine-tuning methods supported by OpenAI, specifically highlighting what each method is best for and not best for, to help you identify the most suitable technique for your use case. It then provides an in-depth look at one particular method — Direct Preference Optimization (DPO) — and provides links to existing guides for the other techniques.
**What is fine-tuning?** Fine-tuning is the process of continuing training on a smaller, domain-specific dataset to optimize a model for a specific task. There are two main reasons why we would typically fine-tune:
1. Improve model performance on a specific task
2. Improve model efficiency (reduce the number of tokens needed, distill expertise into a smaller model, etc.)
Currently, the OpenAI platform supports four fine-tuning methods:
* **Supervised fine-tuning (SFT):** this technique employs traditional supervised learning using input-output pairs to adjust model parameters. The training process adjusts model weights to minimize the difference between predicted and target outputs across the provided examples. The model will replicate features that it finds in provided pairs.
* **Vision fine-tuning:** this technique extends supervised fine-tuning to multimodal data by processing both text and image in a unified training framework. The training process adjusts model weights to minimize errors across text-image pairs and as a result improve the model’s understanding of image inputs.
* **Direct preference optimization (DPO):** this technique uses pairwise comparisons (e.g., preferred and rejected example responses) to optimize a model to favor certain outputs over others. The model learns to replicate the preference patterns found in the provided comparison data.
* **Reinforcement fine-tuning (RFT):** this technique uses reinforcement learning with a reward signal (via a grader or reward model) to fine-tune the model for complex objectives. In RFT, the model generates outputs for given prompts during training, and each output is evaluated for quality. The model’s parameters are then updated to maximize the reward, reinforcing behaviors that lead to better outcomes. This iterative feedback loop encourages the model to improve reasoning or decision-making strategies.
To help you select the appropriate fine-tuning technique, the table below summarizes the scenarios each method is best suited for, as well as those for which it is not well suited:
|**Technique**|**Good For**|**Not Good For**|
|**Supervised fine-tuning (SFT)**|Emphasizing knowledge already present in the model.
Customizing response structure or tone.
Generating content in a specific format.
Teaching complex instructions or correcting instruction-following failures.
Optimizing cost/latency (saving tokens from prompt or distilling).|Adding entirely new knowledge (consider RAG instead).
Tasks with subjective quality.|
|**Vision fine-tuning**|Specialized visual recognition tasks (e.g., image classification).
Domain-specific image understanding.
Correcting failures in instruction following for complex prompts.|Purely textual tasks.
Generalized visual tasks without specific context.
General image understanding.|
|**Direct preference optimization (DPO)**|Aligning model outputs with subjective preferences (tone, politeness).
Refining outputs via human-rated feedback.
Achieving nuanced behavioral alignment.|Learning completely new tasks.
Tasks without clear human preference signals.|
|**Reinforcement fine-tuning (RFT)**|Complex domain-specific tasks that require advanced reasoning.
Refining existing partial capabilities (fostering emergent behaviours).
Tasks with measurable feedback.
Scenarios with limited explicit labels where reward signals can be defined.|Tasks where the model has no initial skill.
Tasks without clear feedback or measurable signals.|
Today, there are pre-existing Cookbooks for:
* Supervised fine-tuning (SFT): (1) [How to fine-tune chat models](https://cookbook.openai.com/examples/how_to_finetune_chat_models) (2) [Leveraging model distillation to fine-tune a model](https://cookbook.openai.com/examples/leveraging_model_distillation_to_fine-tune_a_model)
* Vision fine-tuning: [Vision fine-tuning on GPT-4o for visual question answering](https://cookbook.openai.com/examples/multimodal/vision_fine_tuning_on_gpt4o_for_visual_question_answering)
* Reinforcement fine-tuning (RFT): (1) [Reinforcement fine-tuning (RFT)](https://cookbook.openai.com/examples/reinforcement_fine_tuning), (2) [Reinforcement fine-tuning for healthbench QA](https://cookbook.openai.com/examples/fine-tuned_qa/reinforcement_finetuning_healthbench)
Direct preference optimization (DPO) will be covered in this guide.
## **Guide to Direct Preference Optimization**
As mentioned above, [Direct Preference Optimization (DPO)](https://platform.openai.com/docs/guides/direct-preference-optimization) is an alignment technique for fine-tuning language models using pairwise preference data (e.g., ranked pairs of responses). DPO directly optimizes a model to favor certain outputs over others using explicit pairwise comparisons, typically from human preferences. This approach simplifies alignment and eliminates the need for a separate reward model or complex reinforcement learning procedures, making DPO a lightweight alternative to techniques such as Reinforcement Learning from Human Feedback (RLHF).
When should you use DPO? DPO excels in scenarios when response quality is subjective, cannot be measured objectively, or when nuanced criteria such as tone, style, appropriateness, or clarity matter - typically cases where multiple valid outputs exist. Example applications where DPO is particularly effective in aligning AI responses include:
* Enhancing Conversational AI Responses
* Improving Code Generation Quality & Style
* Ensuring Compliance with Legal, Ethical & Safety Standards
* Controlling Brand Voice, Professionalism, & Tone
* Customizing Creative Outputs & User Experience
By fine-tuning on explicit pairs of preferred vs non‑preferred completions, DPO aligns model outputs to these nuanced preferences. The below table gives examples of pairwise preference data for a fictional AI assistant that represents an organization, where preferred responses are clear, professional, and aligned with brand standards.
|**Example Question**|**Chosen Response**|**Rejected Response**|
|**Q1:***How do I review your product?*|To submit a product review, please visit your account dashboard, select the product, and click ‘Write a review.’ Share your honest experience, rate key features, and submit when ready.|Yo, just leave some quick stars or whatever, it’s chill!|
|**Q2:***How do I review your product?*|We welcome your feedback! In the ‘Reviews’ section on the product page, click ‘Leave a Review,’ rate it, and add your comments about what you liked or areas for improvement.|Just scribble something—doesn’t matter what, honestly.|
|**Q3:***How to troubleshoot this particular error?*|To address the error ‘X101,’ first clear your cache, then verify your internet connection. If the issue remains, follow our step-by-step guide at [Support → Troubleshooting → Error X101].|Just reboot it, I guess. If it doesn’t work, you’re on your own!|
In this guide, weʼll walk through how to apply DPO using the fine-tuning API. You will learn key steps to take in order to successfully run preference fine-tuning jobs for your use-cases.
Here’s what we’ll cover:
* **1. Recommended Workflow**
* **2. Demonstration Scenario**
* **3. Generating the Dataset**
* **4. Benchmarking the Base Model**
* **5. Fine-Tuning**
* **6. Using your Fine-Tuned Model**
## **1. Recommended Workflow**
OpenAI recommends the following workflow:
1. Performing Supervised Fine-Tuning (SFT) on a subset of your preferred responses.
2. Using the SFT fine-tuned model as the starting point, apply DPO using preference comparison data.
Performing Supervised Fine-Tuning (SFT) before Direct Preference Optimization (DPO) enhances model alignment and overall performance by establishing a robust initial policy, ensuring the model already prefers correct responses. This reduces the magnitude of weight updates during DPO, stabilizing training and preventing overfitting by allowing DPO to efficiently refine subtle nuances. Consequently, the combined SFT-then-DPO workflow converges faster and yields higher-quality results.
In this guide, we’ll focus exclusively on applying Direct Preference Optimization (DPO). However, depending on your use case, you may find performance gains from first performing Supervised Fine-Tuning (SFT). If so, you can follow the SFT guide linked above, save the resulting model ID, and use that as the starting point for your DPO job.
## **2. Demonstration Scenario**
To make things concrete, let’s walk through fine-tuning a customer-facing AI assistant to follow a fictional brand’s voice and style. Imagine Good Vibes Corp, an organization that prides itself on a friendly, enthusiastic tone with a personal touch.
They want their customer AI assistant to answer queries in a way that reflects these brand guidelines (e.g. an upbeat attitude, polite language, and a friendly sign-off), and prefer those responses over more generic or curt answers. This is a good scenario for DPO: there’s no objectively correct answer format, but there is a preferred style.
DPO will help the model learn from comparisons which style is preferred. We’ll outline the steps to: (1) generate a synthetic preference dataset of prompts with paired responses (one in the desired brand voice and one not). (2) Evaluate base model performance using the OpenAI evals API. (3) Prepare and upload the data in the required JSONL format for preference fine-tuning. (4) Fine-tune the model with DPO using the OpenAI fine-tuning API. (5) Evaluate the fine-tuned model using the OpenAI evals API to show how the brand-style preference improved.
We are going to synthesize a dataset for this demonstration. First, let’s create a seed bank of questions to generate more variations from.
Let’s get started!
```
`! pip install openai nest-asyncio --quiet`
```
```
`PROMPT\_SEED\_POOL = [
"Hi, I ordered a gadget last week. When will it arrive?",
"Your product stopped working after two days. Can I get help?",
"Do you offer discounts for long-term customers?",
"Can I change the shipping address for my order?",
"What is your return policy for damaged items?",
"My tracking number hasn't updated in three days—can you check the status?",
"How long is the warranty on your products, and how do I submit a claim?",
"Can I add gift wrapping to my order before it ships?",
"Do you accept PayPal or other alternative payment methods?",
"Is there an option to expedite shipping if my order hasn't left the warehouse yet?",
]`
```
## **3. Generating the Dataset**
Next, we’ll define functions to take each prompt from our seed bank and generate related questions. We’ll create a dataset of preference pairs by first generating these prompt variations, then producing both a preferred and a rejected response for every prompt.
This dataset is synthetic and serves to illustrate the mechanics of Direct Preference Optimization — when developing your own application you should collect or curate a high-quality, preference dataset. Note: the volume of data required for DPO depends on the use case; generally more is better (thousands to tens of thousands), and for preference pairs the ordering logic should be consistent (e.g. if A \> B and B \> C, then A \> C).
```
`import asyncio
from openai import AsyncOpenAI
from typing import List, Dict, Any
async\_client = AsyncOpenAI()
SYSTEM\_PROMPT = "You are a customer-support assistant."
async def \_generate\_related\_questions\_from\_prompt(
prompt: str, k: int, sem: asyncio.Semaphore, \*, model: str
) -\> List[str]:
"""Return \*k\* distinct customer-service questions related to the given prompt."""
out: List[str] = []
async with sem:
for \_ in range(k):
resp = await async\_client.responses.create(
model=model,
input=[
{
"role": "system",
"content": (
"Return ONE distinct, realistic customer-service question "
"related in topic or theme to the following question, "
"but NOT a direct paraphrase."
),
},
{"role": "user", "content": prompt},
],
temperature=0.9,
max\_output\_tokens=60,
)
out.append(resp.output\_text.strip())
return out
async def expand\_prompt\_pool(
prompts: List[str], \*, k: int = 3, concurrency: int = 32, model: str
) -\> List[str]:
"""Expand each prompt into \*k\* related questions using the given model."""
sem = asyncio.Semaphore(concurrency)
tasks = [
\_generate\_related\_questions\_from\_prompt(p, k, sem, model=model) for p in prompts
]
results = await asyncio.gather(\*tasks)
return [v for sub in results for v in sub]
async def \_generate\_preference\_pair(
prompt: str, sem: asyncio.Semaphore, \*, model: str
) -\> Dict[str, Any]:
"""Generate a preference pair for the given prompt."""
async with sem:
friendly\_task = async\_client.responses.create(
model=model,
input=[
{
"role": "system",
"content": (
"You are Good Vibes Corp's exceptionally energetic, outrageously friendly and "
"enthusiastic support agent."
),
},
{"role": "user", "content": prompt},
],
temperature=0.7, # higher temperature to increase creativity & on-brand tone adherence
max\_output\_tokens=80,
)
blunt\_task = async\_client.responses.create(
model=model,
input=[
{
"role": "system",
"content": "You are a terse, factual support agent with no empathy or politeness.",
},
{"role": "user", "content": prompt},
],
temperature=0.3, # lower temperature to limit creativity & emphasize tonal difference
max\_output\_tokens=80,
)
friendly, blunt = await asyncio.gather(friendly\_task, blunt\_task)
return {
"input": {
"messages": [
{"role": "system", "content": SYSTEM\_PROMPT},
{"role": "user", "content": prompt},
]
},
"preferred\_output": [
{"role": "assistant", "content": friendly.output\_text}
],
"non\_preferred\_output": [
{"role": "assistant", "content": blunt.output\_text}
],
}`
```
Now, using these defined functions we’ll build our dataset by generating friendly versus blunt response pairs. The friendly responses reflect the brand’s desired communication style. We’ll do this asynchronously for efficiency, creating a dataset suited for Direct Preference Optimization.
```
`import math
import nest\_asyncio
async def build\_dataset(
\*,
pair\_count: int = 500,
concurrency: int = 8,
expand\_prompt\_pool\_model: str,
generate\_preference\_pair\_model: str,
) -\> List[Dict[str, Any]]:
"""Return \*pair\_count\* preference pairs (single-shot expansion)."""
seed = PROMPT\_SEED\_POOL
deficit = max(0, pair\_count - len(seed))
k = max(1, math.ceil(deficit / len(seed)))
expanded = await expand\_prompt\_pool(
seed,
k=k,
concurrency=concurrency,
model=expand\_prompt\_pool\_model,
)
prompt\_bank = (seed + expanded)[:pair\_count]
sem = asyncio.Semaphore(concurrency)
tasks = [
\_generate\_preference\_pair(p, sem, model=generate\_preference\_pair\_model)
for p in prompt\_bank
]
return await asyncio.gather(\*tasks)
nest\_asyncio.apply()
pairs = await build\_dataset(
pair\_count=500,
concurrency=8,
expand\_prompt\_pool\_model="gpt-4.1-mini-2025-04-14",
generate\_preference\_pair\_model="gpt-4.1-mini-2025-04-14",
)
print(f"Dataset ready with {len(pairs)} pairs.")`
```
```
`Dataset ready with 500 pairs.`
```
## **4. Benchmarking the Base Model**
Below, we split our dataset into training, validation, and testing sets. We also show a sample from the training dataset, which demonstrates a clear difference between the preferred (friendly, on-brand) and non-preferred (blunt, neutral) responses for that input pair.
```
`# set dataset sizes
n = len(pairs)
n\_train = int(0.8 \* n)
n\_val = int(0.1 \* n)
n\_test = n - n\_train - n\_val
# split dataset into train, test & validation
train\_pairs = pairs[:n\_train]
val\_pairs = pairs[n\_train : n\_train + n\_val]
test\_pairs = pairs[n\_train + n\_val :]
train\_pairs[0]`
```
```
`{'input': {'messages': [{'role': 'system',
'content': 'You are a customer-support assistant.'},
{'role': 'user',
'content': 'Hi, I ordered a gadget last week. When will it arrive?'}]},
'preferred\_output': [{'role': 'assistant',
'content': 'Hey there, awesome friend! 🌟 Thanks a bunch for reaching out! I’d LOVE to help you track down your gadget so you can start enjoying it ASAP! 🎉 Could you please share your order number or the email you used to place the order? Let’s make this delivery magic happen! 🚀✨'}],
'non\_preferred\_output': [{'role': 'assistant',
'content': 'Provide your order number for delivery status.'}]}`
```
To assess the model’s performance prior to fine-tuning, we’ll use an automated grader (LLM-as-a-Judge) to score each response for friendliness and empathy. The grader will assign a score from 0 to 4 for each answer, allowing us to compute a mean baseline score for the base model.
To do this, we first generate responses for the base model on the test set, then use the OpenAI evals API to create and run an evaluation with an automated grader.
```
`async def generate\_responses(
testset,
model,
temperature=0.0,
max\_output\_tokens=80,
concurrency=8,
):
"""
Generate responses for each prompt in the testset using the OpenAI responses API.
Returns: List of dicts: [{"prompt": ..., "response": ...}, ...]
"""
async\_client = AsyncOpenAI()
sem = asyncio.Semaphore(concurrency)
async def get\_response(prompt):
async with sem:
resp = await async\_client.responses.create(
model=model,
input=[
{"role": "system", "content": SYSTEM\_PROMPT},
{"role": "user", "content": prompt},
],
temperature=temperature,
max\_output\_tokens=max\_output\_tokens,
)
return {"prompt": prompt, "response": resp.output\_text}
tasks = [get\_response(item["item"]["input"]) for item in testset]
results = await asyncio.gather(\*tasks)
return results
# generate responses for the base model over the test set
base\_model = "gpt-4.1-mini-2025-04-14"
testset = [
{"item": {"input": pair["input"]["messages"][1]["content"]}} for pair in test\_pairs
]
responses = await generate\_responses(testset, model=base\_model)`
```
Next, we’ll use the OpenAI evals API to create & run an evaluation with an automated grader, starting by defining the rubric for the LLM-as-a-Judge. Note: we will access responses via data logging, so in order for this to work, you’ll need to be in an org where data logging isn’t disabled (through zdr, etc.). If you aren’t sure if this is the case for you, go to [https://platform.openai.com/logs?api=responses](https://platform.openai.com/logs?api=responses) and see if you can see the responses you just generated.
```
`JUDGE\_SYSTEM = """
You judge whether a reply matches Good Vibes Corp's desired tone:
energetic, super-friendly, enthusiastic.
Score 0-4 (higher = more energy):
4 - Highly enthusiastic: multiple upbeat phrases / emojis / exclamations, clear empathy, proactive help.
3 - Energetic & friendly: visible enthusiasm cue (≥1 emoji OR exclamation OR upbeat phrase), warm second-person tone.
2 - Pleasant: polite & positive but lacks obvious enthusiasm cues.
1 - Neutral: correct, businesslike, minimal warmth.
0 - Rude, negative, or unhelpful.
"""`
```
```
`from openai import OpenAI
sync\_client = OpenAI()
# set judge model
judge\_model = "gpt-4.1-2025-04-14"
# create the evaluation
logs\_eval = sync\_client.evals.create(
name="Good Vibes Corp Tone Eval",
data\_source\_config={
"type": "logs",
},
testing\_criteria=[
{
"type": "score\_model",
"name": "General Evaluator",
"model": judge\_model,
"input": [
{
"role": "system",
"content": JUDGE\_SYSTEM,
},
{
"role": "user",
"content": (
"\*\*User input\*\*\\n"
"{{item.input}}\\n"
"\*\*Response to evaluate\*\*\\n"
"{{sample.output\_text}}"
),
},
],
"range": [0, 4],
"pass\_threshold": 2,
}
],
)`
```
```
`# run the evaluation
base\_run = sync\_client.evals.runs.create(
name=base\_model,
eval\_id=logs\_eval.id,
data\_source={
"type": "responses",
"source": {"type": "responses", "limit": len(test\_pairs)},
},
)`
```
```
`# score base model
base\_data = sync\_client.evals.runs.output\_items.list(
eval\_id=logs\_eval.id, run\_id=base\_run.id
).data
base\_scores = [s.results[0]["score"] for s in base\_data]
print("Average score:", sum(base\_scores) / len(base\_scores))`
```
```
`Average score: 2.525`
```
## **5. Fine-Tuning**
With a baseline established, we can now fine-tune the model using the training set and DPO. This process will teach the model to prefer responses that align with our desired style, based on the preference pairs we created earlier.
Note: **beta (β)** is a unique fine-tuning hyperparameter for Direct Preference Optimization (DPO). It’s a floating-point number ranging between 0 and 2, controlling the balance between preserving a model’s existing behavior and adapting to new, preference-aligned responses.
* High β (close to 2): makes the model more conservative, strongly favoring previous behavior. The fine-tuned model will show minimal deviations from its original style or characteristics, emphasizing consistency and avoiding abrupt changes.
* Moderate β (around 1): balances between adherence to prior behavior and adaptation to new preferences. Recommended as a sensible starting point for most practical scenarios.
* Low β (close to 0): encourages aggressive adaptation, causing the model to prioritize newly provided preferences more prominently. This might result in significant stylistic shifts and greater alignment with explicit preferences but could lead to unexpected or overly specialized outputs.
Technically, beta scales the difference in log-probabilities in the DPO loss; a larger β causes the sigmoid-based loss function to saturate with smaller probability differences, yielding smaller weight updates (thus preserving old behavior). It is recommended to experiment systematically with the β value to achieve optimal results tailored to your specific use-case and desired trade-offs between stability and adaptation.
```
`import io
import json
# create training file
train\_buf = io.BytesIO("\\n".join(json.dumps(p) for p in train\_pairs).encode())
train\_buf.name = "train.jsonl"
train\_file\_id = sync\_client.files.create(file=train\_buf, purpose="fine-tune").id
# create validation file
val\_buf = io.BytesIO("\\n".join(json.dumps(p) for p in val\_pairs).encode())
val\_buf.name = "val.jsonl"
val\_file\_id = sync\_client.files.create(file=val\_buf, purpose="fine-tune").id
# create a fine-tuning job
ft = sync\_client.fine\_tuning.jobs.create(
model=base\_model,
training\_file=train\_file\_id,
validation\_file=val\_file\_id,
method={
"type": "dpo",
"dpo": {
"hyperparameters": {
"n\_epochs": 2,
"beta": 0.1,
"batch\_size": 8,
}
},
},
)
print(f"Fine-tuning job created: job\_id = {ft.id}")`
```
```
`Fine-tuning job created: job\_id = ftjob-5QPmA36QezFRGoXjuvIAPuAQ`
```
## **6. Using your Fine-Tuned Model**
Once fine-tuning is complete, we’ll evaluate the DPO-tuned model on the same test set. By comparing the mean scores before and after fine-tuning, as well as reviewing example outputs, we can see how the model’s alignment with our preferences has improved.
```
`# generate responses
job = sync\_client.fine\_tuning.jobs.retrieve(ft.id)
if job.status == "succeeded":
responses = await generate\_responses(testset, model=job.fine\_tuned\_model)
post\_run = sync\_client.evals.runs.create(
name=ft.id,
eval\_id=logs\_eval.id,
data\_source={
"type": "responses",
"source": {"type": "responses", "limit": len(test\_pairs)},
},
)`
```
```
`# get scores from the evaluation
post\_data = sync\_client.evals.runs.output\_items.list(
eval\_id=logs\_eval.id, run\_id=post\_run.id
).data
post\_scores = [s.results[0]["score"] for s in post\_data]
# print scores & a sample comparison from the test set for illustration
print(
"Δ mean:",
sum(t - b for b, t in zip(base\_scores, post\_scores)) / len(base\_scores),
)
print("\\n=== SAMPLE COMPARISON ===")
idx = 0
print(f"Prompt:\\n {testset[idx]['item']['input']}\\n")
print(f"Base model reply: \\n {base\_data[idx].sample.output[0].content} \\n")
print(f"DPO-tuned model reply \\n {post\_data[idx].sample.output[0].content}")`
```
```
`Δ mean: 0.45
=== SAMPLE COMPARISON ===
Prompt:
Can I upgrade to faster delivery if my package is still being processed?
Base model reply:
Whether you can upgrade to express shipping while your order is still being processed depends on the store's policies. Generally, many stores allow shipping upgrades before the order is shipped.
To assist you better, could you please provide your order number or the name of the store you ordered from? Alternatively, you can contact the store's customer service directly to request the upgrade.
DPO-tuned model reply
Hi! I’d be happy to help with that. If your package hasn’t shipped yet, there’s a good chance we can upgrade your delivery speed. Could you please provide me with your order number? I’ll check the status and let you know the available options for faster delivery.`
```