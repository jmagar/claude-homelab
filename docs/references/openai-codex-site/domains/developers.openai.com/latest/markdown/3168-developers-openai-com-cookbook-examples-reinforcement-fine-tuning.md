Exploring Model Graders for Reinforcement Fine-Tuning
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
May 23, 2025
# Exploring Model Graders for Reinforcement Fine-Tuning
[ TS ](https://www.linkedin.com/in/theophilesautory)
[ Theophile Sautory
(OpenAI)
](https://www.linkedin.com/in/theophilesautory)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Reinforcement_Fine_Tuning.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Reinforcement_Fine_Tuning.ipynb)
*This guide is for developers and ML practitioners who already know their way around OpenAIʼs APIs, have a basic understanding of reinforcement fine-tuning (RFT), and wish to use their fine-tuned models for research or other appropriate uses. OpenAI’s services are not intended for the personalized treatment or diagnosis of any medical condition and are subject to our [applicable terms](https://openai.com/policies/).*
[Reinforcement fine-tuning (RFT)](https://platform.openai.com/docs/guides/reinforcement-fine-tuning) of reasoning models consists in running reinforcement learning on of top the models to improve their reasoning performance by exploring the solution space and reinforcing strategies that result in a higher reward. RFT helps the model make sharper decisions and interpret context more effectively.
In this guide, weʼll walk through how to apply RFT to the OpenAI `o4-mini` reasoning model, using a task from the life sciences research domain: predicting outcomes from doctor-patient transcripts and descriptions, which is a necessary assessment in many health research studies. We’ll use a subset of the medical-o1-verifiable-problem [dataset](https://huggingface.co/datasets/FreedomIntelligence/medical-o1-verifiable-problem/viewer/default/train?row=0). You will learn key steps to take in order to succesfully run RFT jobs for your use-cases.
Here’s what we’ll cover:
* **[1. Setup](#1-setup)**
* **[2. Gathering the dataset](#2-gathering-the-dataset)**
* **[3. Benchmarking the base model](#3-benchmarking-the-base-model)**
* **[4. Defining your grader](#4-defining-your-grader)**
* **[5. Training](#5-training)**
* **[6. Using your fine-tuned model](#6-using-your-fine-tuned-model)**
## **1. Setup**
Even strong reasoning models can miss the mark when it comes to expert-level behavior-especially in domains like medicine, where nuance and exactness matter. Imagine a model trying to extract [ICD-10](https://www.cms.gov/medicare/coding-billing/icd-10-codes) codes from a transcript: even if it understands the gist, it may not use the precise terminology expected by medical professionals.
Other great candidates for RFT include topics like ledger normalization or tiering fraud risk- settings in which you want precise, reliable, and repeatable reasoning. Checkout our [RFT use-cases guide](https://platform.openai.com/docs/guides/rft-use-cases) for great examples.
In our case, weʼll focus on teaching `o4-mini` to become better at predicting the outcomes of clinical conversations and descriptions. Specifically, we want to see if RFT can boost the accuracy of the prediction.
Along the way, weʼll talk about how to write effective graders, how they guide the modelʼs learning, and how to watch out for classic reward-hacking pitfalls.
## **2. Gathering the Dataset**
Letʼs start off by loading the dataset from Hugging Face. Weʼre interested in samples framed as a description of a patient case with an associated question, followed by the correct answer. These represent real world transcripts where a physician is summarizing a case and assigning an outcome. For any use-case, verifying the accuracy of the gold level answers is critical and requires careful consideration. Here, we will trust the dataset quality.
```
`import re
from datasets import load\_dataset
ds = load\_dataset("FreedomIntelligence/medical-o1-verifiable-problem")
def is\_age\_question(sample):
question = sample.get('Open-ended Verifiable Question', '')
# Match "A 88-year-old", "An 8-year-old", "A 23-year-old", etc. at the start
return re.match(r"^(A|An) \\d{1,2}-year-old", question) is not None
filtered\_samples = [s for s in ds["train"] if is\_age\_question(s)]
print(f"Filtered samples: {len(filtered\_samples)}")`
```
```
`/Users/theophile/Documents/repos/jupyter-env/lib/python3.12/site-packages/tqdm/auto.py:21: TqdmWarning: IProgress not found. Please update jupyter and ipywidgets. See https://ipywidgets.readthedocs.io/en/stable/user\_install.html
from .autonotebook import tqdm as notebook\_tqdm`
```
```
`Filtered samples: 9169`
```
One of the advantages of RFT is that it doesnʼt need thousands of samples to start making a difference. Thanks to trajectory sampling and the feedback loop during training, the model learns not just correct behaviors, but also patterns to avoid. This means we can see solid gains even with small datasets.
For this run, weʼll randomly sample 100 training and 100 test examples and slightly normalize them.
```
`import random
# Set a random seed for reproducibility
random.seed(42)
# Randomly select 100 training samples from filtered\_samples
train\_samples = random.sample(filtered\_samples, min(100, len(filtered\_samples)))
# Remove training samples from filtered\_samples to avoid overlap
remaining\_samples = [s for s in filtered\_samples if s not in train\_samples]
# Randomly select 100 test samples from the remaining samples (no overlap)
test\_samples = random.sample(remaining\_samples, min(100, len(remaining\_samples)))
print(f"Number of training samples: {len(train\_samples)}")
print(f"Number of test samples: {len(test\_samples)}")`
```
```
`Number of training samples: 100
Number of test samples: 100`
```
```
`# Standardize the 'Ground-True Answer' fields to all lowercase in train and test samples
for sample in train\_samples:
if 'Ground-True Answer' in sample and isinstance(sample['Ground-True Answer'], str):
sample['Ground-True Answer'] = sample['Ground-True Answer'].lower()
for sample in test\_samples:
if 'Ground-True Answer' in sample and isinstance(sample['Ground-True Answer'], str):
sample['Ground-True Answer'] = sample['Ground-True Answer'].lower()`
```
We’ll convert these samples to `jsonl` format, as expected by the [reinforcement finetuning API](https://platform.openai.com/docs/api-reference/fine-tuning/reinforcement-input).
```
`import json
def convert\_to\_jsonl\_format(samples, filename):
with open(filename, "w") as f:
for sample in samples:
user\_content = sample.get("Open-ended Verifiable Question", "")
reference\_answer = sample.get("Ground-True Answer", "")
json\_obj = {
"messages": [
{"role": "user", "content": user\_content}
],
"reference\_answer": reference\_answer
}
f.write(json.dumps(json\_obj) + "\\n")
def load\_jsonl(filename):
samples = []
with open(filename, "r") as f:
for line in f:
samples.append(json.loads(line))
return samples
# Save the datasets to jsonl files
convert\_to\_jsonl\_format(train\_samples, "data/medical\_01\_verifiable\_problem\_train.jsonl")
convert\_to\_jsonl\_format(test\_samples, "data/medical\_01\_verifiable\_problem\_val.jsonl")
# Load the datasets back from jsonl files
train\_samples\_loaded = load\_jsonl("data/medical\_01\_verifiable\_problem\_train.jsonl")
test\_samples\_loaded = load\_jsonl("data/medical\_01\_verifiable\_problem\_val.jsonl")`
```
Next up: we’ll see how the base model performs out of the box-and where there’s room to grow.
## **3. Benchmarking the Base Model**
Before we fine-tune anything, we need to know where we’re starting from. Benchmarking gives us a clear picture of the model’s initial strengths and weaknesses-so we can later measure how far it’s come.
We’ll first lean on two simple yet powerful evaluators:
1. `clinical\_phrase\_binary\_grader` - an exact-match checker.
2. `clinical\_phrase\_grader` - a softer, token-based similarity grader.
```
`from rapidfuzz import fuzz, utils
def clinical\_phrase\_grader(sample: dict, item: dict) -\> float:
from rapidfuzz import fuzz, utils
score = fuzz.token\_set\_ratio(sample["output\_text"], item["reference\_answer"], processor=utils.default\_process)
return score / 100.0
def clinical\_phrase\_binary\_grader(sample: dict, item: dict) -\> float:
return 1.0 if sample["output\_text"] == item["reference\_answer"] else 0.0
def combined\_grader(sample: dict, item: dict, weights: list[float] = [0.85, 0.15]) -\> float:
clinical\_phrase\_score = clinical\_phrase\_grader(sample, item)
binary\_score = clinical\_phrase\_binary\_grader(sample, item)
return weights[0] \* clinical\_phrase\_score + weights[1] \* binary\_score`
```
This combination lets us track both strict correctness and partial lexical overlap. The binary grader gives a crisp 0 or 1: did the model produce an exact match? The softer one gives more nuance-how close did the output come to the gold answer? We use both because outcomes are often phrased in multiple valid ways. For instance, a model might respond with “gouty arthritis” instead of “gout.” While a human evaluator could consider this partially acceptable, a strict string match would not. Combining exact and fuzzy scoring ensures a more accurate and fair assessment of model outputs.
We build a helper function to preprend the examples with a system prompt.
```
`def prepend\_system\_prompt\_to\_first\_user\_message(samples, system\_prompt, path=None):
new\_samples = []
for sample in samples:
# Deep copy to avoid mutating the original
sample\_copy = json.loads(json.dumps(sample))
messages = sample\_copy.get("messages", [])
if messages and messages[0].get("role") == "user" and isinstance(messages[0].get("content"), str):
if not messages[0]["content"].startswith(system\_prompt):
messages[0]["content"] = f"{system\_prompt}\\n\\n{messages[0]['content']}"
new\_samples.append(sample\_copy)
if path is not None:
with open(path, "w", encoding="utf-8") as f:
for item in new\_samples:
f.write(json.dumps(item, ensure\_ascii=False) + "\\n")
return new\_samples`
```
```
`simple\_prompt = """You are an expert clinician. For each clinical vignette, respond with exactly one phrase: the single most likely outcome or phenomenon, all in lowercase.
- Do not add punctuation, articles, explanations, or commentary - output only the term itself.
- Sometimes, the expected answer can be a synonym of what you think.
- Use the standard clinical name (e.g. “thought withdrawal”, “Toxoplasma encephalitis”)."""
train\_samples\_loaded\_simple\_sys\_prompt = prepend\_system\_prompt\_to\_first\_user\_message(
train\_samples\_loaded, simple\_prompt, path="data/medical\_01\_verifiable\_problem\_train\_simple\_prompt.jsonl"
)
test\_samples\_loaded\_simple\_sys\_prompt = prepend\_system\_prompt\_to\_first\_user\_message(
test\_samples\_loaded, simple\_prompt, path="data/medical\_01\_verifiable\_problem\_val\_simple\_prompt.jsonl"
)`
```
Then build a helper function to generate and store the model’s predictions.
```
`from openai import OpenAI
import concurrent.futures
from tqdm import tqdm
import os
client = OpenAI()
def generate\_model\_predictions(
subset,
prompt\_type,
model\_name="o4-mini-2025-04-16",
reasoning\_effort="medium",
n\_runs=1,
verbose=False,
):
if isinstance(subset, str):
samples\_path = f"data/medical\_01\_verifiable\_problem\_{subset}\_{prompt\_type}\_prompt.jsonl"
with open(samples\_path, "r", encoding="utf-8") as f:
test\_samples = [json.loads(line) for line in f if line.strip()]
else:
test\_samples = [subset]
def run\_inference(item):
resp = client.responses.create(
model=model\_name,
input=item["messages"],
reasoning={"effort": reasoning\_effort, "summary": "detailed"},
)
model\_prediction = {'output\_text': resp.output\_text}
reasoning\_tokens\_used = resp.usage.output\_tokens\_details.reasoning\_tokens
summaries = [seg.text for item in resp.output if item.type == "reasoning" for seg in item.summary]
summaries\_string = "\\n".join(summaries)
if verbose:
print("Prompt: {}".format(item["messages"][0]["content"]))
print(f"Model Sample: {model\_prediction}\\nSolution: {item['reference\_answer']}\\n")
return {
"model\_prediction": model\_prediction["output\_text"],
"input": item,
"reasoning\_tokens\_used": reasoning\_tokens\_used,
"reference\_answer": item["reference\_answer"],
"summaries": summaries\_string
}
# Ensure the predictions directory exists before any file operations
predictions\_dir = os.path.join("data", "rft", "predictions")
os.makedirs(predictions\_dir, exist\_ok=True)
# Check if results already exist for all runs
results\_per\_run = []
for run\_idx in range(n\_runs):
run\_save\_path = os.path.join(
predictions\_dir,
f"{subset}\_{prompt\_type}\_{model\_name}\_{reasoning\_effort}\_predictions\_run{run\_idx+1}.json"
)
if os.path.exists(run\_save\_path):
print(f"Results for run {run\_idx+1} already exist at {run\_save\_path}. Loading results.")
with open(run\_save\_path, "r", encoding="utf-8") as f:
run\_results = json.load(f)
results\_per\_run.append(run\_results)
else:
if len(test\_samples) == 1:
run\_results = [run\_inference(test\_samples[0])]
else:
run\_results = []
with concurrent.futures.ThreadPoolExecutor() as executor:
futures = [executor.submit(run\_inference, item) for item in test\_samples]
for future in tqdm(futures, total=len(futures), desc=f"Generating predictions (run {run\_idx+1})"):
result = future.result()
run\_results.append(result)
with open(run\_save\_path, "w", encoding="utf-8") as f:
json.dump(run\_results, f, ensure\_ascii=False, indent=2)
results\_per\_run.append(run\_results)
# Return a flat list for backward compatibility
if n\_runs == 1:
return results\_per\_run[0]
else:
return results\_per\_run`
```
To generate the predictions, first make sure your API key is set:
```
`export OPENAI\_API\_KEY=...`
```
```
`# OpenAI o4-mini model
results\_simple\_o4mini = generate\_model\_predictions(
subset="train",
prompt\_type="simple",
model\_name="o4-mini",
reasoning\_effort="medium",
n\_runs=3
)`
```
```
`# OpenAI o3 model
results\_simple\_o3 = generate\_model\_predictions(
subset="train",
prompt\_type="simple",
model\_name="o3",
reasoning\_effort="medium",
n\_runs=3
)`
```
We now have predictions that are ready to be evaluated.
We’ll build a helper function that allows us to easily swap in different scoring methods,
```
`import functools
def evaluate\_predictions\_with\_grader(
predictions,
grader\_func=combined\_grader,
):
results = []
if isinstance(predictions, dict):
predictions = [predictions]
def run\_grading(pred):
model\_prediction = {"output\_text": pred["model\_prediction"]}
item = pred["input"]
score = grader\_func(model\_prediction, item)
result = pred.copy()
result["score"] = score
return result
if len(predictions) == 1:
result = run\_grading(predictions[0])
results.append(result)
else:
with concurrent.futures.ThreadPoolExecutor() as executor:
futures = [executor.submit(run\_grading, pred) for pred in predictions]
for future in tqdm(concurrent.futures.as\_completed(futures), total=len(futures), desc="Grading predictions"):
results.append(future.result())
total = len(results)
correct = sum(r["score"] for r in results)
accuracy = correct / total if total else 0.0
metrics = {
"total\_samples": total,
"accuracy": accuracy,
}
print(metrics)
return metrics, results
def run\_prediction\_evaluation(
model\_name="o4-mini",
reasoning\_effort="medium",
prompt\_type="simple",
subset="train",
grader\_func=combined\_grader,
num\_runs=3,
):
if isinstance(grader\_func, functools.partial):
name = grader\_func.func.\_\_name\_\_
mg = grader\_func.keywords["model\_grader"]
mg\_name = mg["name"]
name = f"{name}\_{mg\_name}"
else:
name = getattr(grader\_func, "\_\_name\_\_", getattr(grader\_func, "\_\_class\_\_", type(grader\_func)).\_\_name\_\_)
grader\_func\_name = name.replace(" ", "\_").replace(":", "\_").replace("/", "\_").replace(",", "\_")
for i in range(num\_runs):
preds\_path = f"data/rft/predictions/{subset}\_{prompt\_type}\_{model\_name}\_{reasoning\_effort}\_predictions\_run{i+1}.json"
with open(preds\_path, "r") as f:
preds = json.load(f)
metrics, results\_with\_scores = evaluate\_predictions\_with\_grader(preds, grader\_func=grader\_func)
# Save the scored results
with open(f"data/rft/predictions/{subset}\_{prompt\_type}\_{model\_name}\_{reasoning\_effort}\_{grader\_func\_name}\_predictions\_run\_{i+1}\_scored.json", "w") as f:
json.dump(results\_with\_scores, f, indent=2)
# Save the metrics
with open(f"data/rft/predictions/{subset}\_{prompt\_type}\_{model\_name}\_{reasoning\_effort}\_{grader\_func\_name}\_predictions\_run\_{i+1}\_metrics.json", "w") as f:
json.dump(metrics, f, indent=2)
# Save the scores (if present in results\_with\_scores)
scores = [item.get("score") for item in results\_with\_scores if "score" in item]
with open(f"data/rft/predictions/{subset}\_{prompt\_type}\_{model\_name}\_{reasoning\_effort}\_{grader\_func\_name}\_predictions\_run\_{i+1}\_scores.json", "w") as f:
json.dump(scores, f, indent=2)
def load\_predictions(
model\_name="o4-mini",
reasoning\_effort="medium",
prompt\_type="simple",
subset="train",
grader\_func\_name="clinical\_phrase\_grader",
num\_runs=3
):
all\_predictions = []
all\_metrics = []
for run in range(1, num\_runs + 1):
pred\_path = f"data/rft/predictions/{subset}\_{prompt\_type}\_{model\_name}\_{reasoning\_effort}\_{grader\_func\_name}\_predictions\_run\_{run}\_scored.json"
metrics\_path = f"data/rft/predictions/{subset}\_{prompt\_type}\_{model\_name}\_{reasoning\_effort}\_{grader\_func\_name}\_predictions\_run\_{run}\_metrics.json"
try:
with open(pred\_path, "r") as f:
predictions = json.load(f)
except FileNotFoundError:
predictions = None
try:
with open(metrics\_path, "r") as f:
metrics = json.load(f)
except FileNotFoundError:
metrics = None
all\_predictions.append(predictions)
all\_metrics.append(metrics)
return all\_predictions, all\_metrics`
```
and then run the evaluations.
```
`model\_name = "o4-mini"
reasoning\_effort = "medium"
prompt\_type = "simple"
subset = "train"
grader\_func = combined\_grader
grader\_func\_name = "combined\_grader"
num\_runs = 3
run\_prediction\_evaluation(
model\_name=model\_name,
reasoning\_effort=reasoning\_effort,
prompt\_type=prompt\_type,
subset=subset,
grader\_func=grader\_func,
num\_runs=num\_runs
)
predictions\_o4mini\_medium\_simple\_prompt, metrics\_o4mini\_medium\_simple\_prompt = load\_predictions(model\_name=model\_name, reasoning\_effort=reasoning\_effort, prompt\_type=prompt\_type, subset=subset, grader\_func\_name=grader\_func\_name, num\_runs=num\_runs)`
```
```
`Grading predictions: 100%|██████████| 100/100 [00:00\<00:00, 610524.60it/s]`
```
```
`{'total\_samples': 100, 'accuracy': 0.590985993228499}`
```
```
`Grading predictions: 100%|██████████| 100/100 [00:00\<00:00, 311612.48it/s]`
```
```
`{'total\_samples': 100, 'accuracy': 0.5750433490539723}`
```
```
`Grading predictions: 100%|██████████| 100/100 [00:00\<00:00, 769597.06it/s]`
```
```
`{'total\_samples': 100, 'accuracy': 0.5943742483874717}`
```
Visualizing the results allows us to spot trends and failure modes.
```
`# Print mistakes where the model did not get the correct answer (score \< 1.0)
mistakes = [
{"index": i, \*\*res}
for i, res in enumerate(predictions\_o4mini\_medium\_simple\_prompt[0])
if res["score"] \< 1.0
]
print(f"\\nTotal mistakes: {len(mistakes)}")
for m in mistakes[15:20]:
print(f"\\n[Sample {m['index']}]")
print(f" Model prediction: {m['model\_prediction']}")
print(f" Reference answer: {m['reference\_answer']}")
print(f" Score: {m['score']}")`
```
```
`
Total mistakes: 86
[Sample 18]
Model prediction: acute anterior uveitis
Reference answer: recurring eye redness and pain
Score: 0.3596153846153846
[Sample 19]
Model prediction: 390 meq
Reference answer: 150 meq
Score: 0.6071428571428571
[Sample 20]
Model prediction: adamts13 deficiency
Reference answer: decreased adamts13 activity in serum
Score: 0.5037037037037037
[Sample 22]
Model prediction: todd paralysis
Reference answer: seizure
Score: 0.16190476190476194
[Sample 23]
Model prediction: hypokalemia
Reference answer: hypomagnesemia
Score: 0.612`
```
As observed above, typical failure modes fall into three categories:
1. Small differences and formatting issues, score \>=0.8.
2. Partial lexical match, 0.3 \< score \< 0.8.
3. Lexically off-base, score \< 0.3.
We can visualize the full score distribution on the training set.
>
> Note: In practice, analyzing model errors at scale often involves a mix of manual review and automated methods-like tagging failure types or clustering predictions by score and content. That workflow is beyond the scope of this guide, but it’s a valuable next step once you’ve identified broad patterns.
>
```
`import matplotlib.pyplot as plt
scores\_distribution = [m['score'] for m in predictions\_o4mini\_medium\_simple\_prompt[0]]
plt.hist(scores\_distribution, alpha=0.6, label='o4-mini medium simple prompt')
plt.legend()`
```
```
`\<matplotlib.legend.Legend at 0x125f6b7a0\>`
```
Let’s compare with other models and prompts, and visualize scores.
```
`# OpenAI o3 model
model\_name = "o3"
reasoning\_effort = "medium"
prompt\_type = "simple"
subset = "train"
grader\_func = combined\_grader
grader\_func\_name = "combined\_grader"
num\_runs = 3
run\_prediction\_evaluation(model\_name=model\_name, reasoning\_effort=reasoning\_effort, prompt\_type=prompt\_type, subset=subset, grader\_func=grader\_func, num\_runs=num\_runs)
predictions\_o3\_medium\_simple\_prompt, metrics\_o3\_medium\_simple\_prompt = load\_predictions(model\_name=model\_name, reasoning\_effort=reasoning\_effort, prompt\_type=prompt\_type, subset=subset, grader\_func\_name=grader\_func\_name, num\_runs=num\_runs)`
```
```
`Grading predictions: 100%|██████████| 100/100 [00:00\<00:00, 820803.13it/s]`
```
```
`{'total\_samples': 100, 'accuracy': 0.6186850707880021}`
```
```
`Grading predictions: 100%|██████████| 100/100 [00:00\<00:00, 523633.46it/s]`
```
```
`{'total\_samples': 100, 'accuracy': 0.6149897683385446}`
```
```
`Grading predictions: 100%|██████████| 100/100 [00:00\<00:00, 515270.76it/s]`
```
```
`{'total\_samples': 100, 'accuracy': 0.6254662232084496}`
```
```
`import numpy as np
import pandas as pd
import seaborn as sns
def average\_and\_std\_metrics(metrics\_list):
"""Returns dicts of mean and std for a list of metrics dicts."""
if not metrics\_list: return {}, {}
keys = metrics\_list[0].keys()
arr = {k: np.array([m[k] for m in metrics\_list]) for k in keys}
mean = {k: float(np.mean(arr[k])) for k in keys}
std = {k: float(np.std(arr[k])) for k in keys}
return mean, std
def plot\_model\_accuracies(model\_metrics\_avg, model\_metrics\_std, grader\_title="Combined Grader Accuracy", sharey: bool = True) -\> None:
"""Plots model accuracies with standard deviation error bars."""
# Convert the nested dicts into tidy DataFrames
df\_avg = pd.DataFrame(model\_metrics\_avg).T.reset\_index().rename(columns={"index": "Model"})
df\_std = pd.DataFrame(model\_metrics\_std).T.reset\_index().rename(columns={"index": "Model"})
# Long-form for Seaborn
long\_df\_avg = df\_avg.melt(id\_vars="Model", value\_vars=["accuracy"], var\_name="Metric", value\_name="Accuracy")
long\_df\_std = df\_std.melt(id\_vars="Model", value\_vars=["accuracy"], var\_name="Metric", value\_name="Std")
# Merge avg and std for error bars
long\_df = pd.merge(long\_df\_avg, long\_df\_std, on=["Model", "Metric"])
pretty\_names = {"accuracy": grader\_title}
# Create a separate figure for each metric
for metric\_key in ["accuracy"]:
metric\_df = long\_df[long\_df["Metric"] == metric\_key].copy()
plt.figure(figsize=(8, 5))
# Plot bars with error bars
ax = sns.barplot(data=metric\_df, x="Model", y="Accuracy", hue="Model", palette="tab10", legend=False, errorbar=None)
bars = ax.patches
# Add error bars manually
for i, row in enumerate(metric\_df.itertuples()):
bar = bars[i]
x = bar.get\_x() + bar.get\_width() / 2
y = row.Accuracy
yerr = row.Std
ax.errorbar(x=x, y=y, yerr=yerr, fmt='none', ecolor='black', capsize=5, elinewidth=2, capthick=2, zorder=10)
plt.title(pretty\_names[metric\_key])
plt.ylabel("Accuracy")
plt.xlabel("")
if sharey: plt.ylim(0, 1)
# Annotate bars with exact values
for bar in bars:
height = bar.get\_height()
ax.annotate(f"{height:.2f}", xy=(bar.get\_x() + bar.get\_width() / 2, height), xytext=(0, 6), textcoords="offset points", ha='center', va='bottom', fontsize=10, fontweight='bold')
plt.xticks(rotation=15, ha="right")
plt.tight\_layout()
plt.show()`
```
```
`avg\_metrics\_o4mini\_medium\_simple\_prompt, std\_metrics\_o4mini\_medium\_simple\_prompt = average\_and\_std\_metrics(metrics\_o4mini\_medium\_simple\_prompt)
avg\_metrics\_o3\_medium\_simple\_prompt, std\_metrics\_o3\_medium\_simple\_prompt = average\_and\_std\_metrics(metrics\_o3\_medium\_simple\_prompt)
model\_metrics\_avg = {
"o4-mini-medium-simple-prompt": avg\_metrics\_o4mini\_medium\_simple\_prompt,
"o3-medium-simple-prompt": avg\_metrics\_o3\_medium\_simple\_prompt,
}
model\_metrics\_std = {
"o4-mini-medium-simple-prompt": std\_metrics\_o4mini\_medium\_simple\_prompt,
"o3-medium-simple-prompt": std\_metrics\_o3\_medium\_simple\_prompt,
}
plot\_model\_accuracies(model\_metrics\_avg, model\_metrics\_std, grader\_title="Combined Grader Accuracy")`
```
We can see that the modelʼs performance has clear limits. In practice, iterating on the prompt often helps boost baseline results and get more out of the base model. However, in this case, our prompt engineering didnʼt lead to meaningful improvements-so we excluded those runs from the analysis.
A key requirement for RFT to work is that the base model demonstrates it can successfully complete the task for at least some examples right out of the gate. The initial accuracy of \~0.6 is a strong signal that RFT can boost performance. If the model never succeeds on your tasks, there is no training signal to hill climb on.
This evaluation process prepares us for the next step: guiding the model with structured, high-quality feedback from a grader.
## **4. Defining Your Grader**
The grader defines the reward function that shapes model behavior during RFT. It provides examples of desired outputs-and penalizes undesirable ones. Designing an effective grader requires both principled structure and thoughtful domain insight, and is perhaps the most important task for successful RFT.
In this section, we will present 3 graders, show how they should be set up to fit the API, and discuss the results they yielded. We will then show how to actually launch an RFT task.
### String based grader
We began with a dual grader using our earlier evaluation functions since it provides a distribution of scores that will be aligned with the lexical proximity of the prediction to the reference answer. It provided a starting point, but the signal wasnʼt rich enough for `o4-mini` to truly learn and improve, and a first experiment showed stagnant reward during the RFT run. For the API calls, you should build the python grading function as shown below.
```
`import inspect
# --- Utility functions ---
def build\_python\_grader\_payload(grader\_fn) :
"""Build a payload for a python grader."""
grader\_source = inspect.getsource(grader\_fn)
# Enforce function name to be `grade`
grader\_source = grader\_source.replace(grader\_fn.\_\_name\_\_, "grade", 1)
return {
"type": "python",
"source": grader\_source,
}
multi\_python\_grader\_tool\_call = {
"type": "multi",
"graders": {
"clinical\_phrase": {
"name": "clinical\_phrase\_grader",
"image\_tag": "2025-05-08",
\*\*build\_python\_grader\_payload(clinical\_phrase\_grader),
},
"clinical\_phrase\_binary": {
"name": "clinical\_phrase\_binary\_grader",
"image\_tag": "2025-05-08",
\*\*build\_python\_grader\_payload(clinical\_phrase\_binary\_grader),
},
},
"calculate\_output": "0.85 \* clinical\_phrase + 0.15 \* clinical\_phrase\_binary",
}`
```
Here is a snapshot of its training curves, where the green curve is the traning set reward and the blue curve is the test set reward:
### Model Grader 1
To address this limitation, we introduced a more advanced approach: the **model grader**. A model-based grader lets us embed semantic understanding and nuance into the feedback. Thatʼs especially powerful when domain-specific synonyms or fuzzy reasoning are in play.
We used gpt-4.1 as our grader model, guided by a rubric that emphasized semantic fidelity: clinical synonymy, correct disease categorization, and conceptual alignment. Rather than focusing on superficial phrasing-e.g., “Is this the same string?”-the grader aimed to answer, “Does this reflect the correct outcome or phenomenon?”
To ensure the grader aligned with expert expectations, we evaluated it on a subset of base model predictions. For any production use-case, domain expert reviewers should verify that model assigned scores reflect preferred answer orderings and align with domain judgment. This typically involves confirming that the model grader correctly ranks predictions according to their validity. In the scope of this cookbook, we approximated this evaluation by using OpenAI `o3` to check whether higher-quality predictions were consistently rewarded relative to their alternatives.
From these discussions of `o3` , we iteratively update the model grader until the results are aligned.
```
`GRADER\_PROMPT\_1 = """
System:
You are an expert medical grader. Compare the \*\*Reference Answer\*\* to the \*\*Model's Answer\*\* and produce \*\*only\*\* a JSON object with:
• \*\*result\*\*: a float between 0.0 and 1.0
• \*\*steps\*\*: a list of reasoning steps (each with a `"description"` and a `"conclusion"`)
Scoring rubric (start at 0.0, then add or subtract):
1. Exact lexical match: \*\*+0.15\*\*
2. Clinical synonym (e.g. “withdrawal of thought” ↔ “thought withdrawal”): \*\*+0.35\*\*
3. Same disease family (e.g. two viral encephalitides): \*\*+0.35\*\*
4. Partial term overlap (e.g. “ulcer” in both phrases): \*\*+0.15\*\*
5. Completely unrelated: \*\*-0.10\*\*
• If multiple criteria apply, sum their weights (max 1.0).
• Cap the final score to the [0.0, 1.0] range.
• In your \*\*steps\*\*, show which rule you applied and the running subtotal.
"""`
```
To be submitted through the API, this is how the dictionary is built.
```
`model\_grader\_1 = {
"type": "score\_model",
"name": "gpt41\_score\_model\_1",
"input": [
{
"role": "system",
"content": GRADER\_PROMPT\_1
},
{
"role": "user",
"content": "Reference Answer: {{item.reference\_answer}}. Model's Answer: {{sample.output\_text}}"
}
],
"pass\_threshold": 0.75,
"model": "gpt-4.1-2025-04-14",
"range": [0, 1],
"sampling\_params": {
"seed": 42,
"temperature": 0,
},
}`
```
Accordingly, we set up the model grader locally to check the results of the models we will fine-tune next.
```
`response\_format = {
"name": "float\_score\_classification",
"strict": True,
"schema": {
"type": "object",
"properties": {
"steps": {
"type": "array",
"description": "A sequence of steps outlining the reasoning process.",
"items": {
"type": "object",
"properties": {
"description": {
"type": "string",
"description": "Detailed description of the reasoning in this step."
},
"conclusion": {
"type": "string",
"description": "The conclusion of the reasoning in this step."
}
},
"required": ["description", "conclusion"],
"additionalProperties": False
}
},
"result": {
"type": "number",
"description": "The float score assigned to the response. This should be in inclusive range RANGE\_MIN to RANGE\_MAX."
}
},
"required": ["steps", "result"],
"additionalProperties": False
}
}
# for completions
response\_format = {
"type": "json\_schema",
"json\_schema": response\_format
}
# Adapted python\_model\_grader to match the other graders' interface
def python\_model\_grader(sample, item, model\_grader=model\_grader\_1):
"""
Calls an OpenAI model to grade the model output against the reference answer.
Expects sample to have "output\_text", item to have "reference\_answer".
Returns a float score (parsed from the model's JSON response).
"""
# Prepare the prompt as the grader expects
system\_prompt = model\_grader["input"][0]["content"]
user\_prompt = model\_grader["input"][1]["content"]
user\_prompt\_filled = user\_prompt.replace("{{item.reference\_answer}}", item["reference\_answer"]).replace("{{sample.output\_text}}", sample["output\_text"])
messages = [
{"role": "system", "content": system\_prompt},
{"role": "user", "content": user\_prompt\_filled}
]
# Call the OpenAI API with the grader's model
response = client.chat.completions.create(
model=model\_grader["model"],
messages=messages,
seed=model\_grader.get("sampling\_params", {}).get("seed", None),
temperature=model\_grader.get("sampling\_params", {}).get("temperature", 0),
response\_format=response\_format,
)
# Parse the float score from the model's JSON response
parsed = json.loads(response.choices[0].message.content)
return float(parsed["result"])`
```
While the rubric initially delivered sensible feedback, the model soon uncovered a loophole and began **reward-hacking**. Scores shot up-sometimes by 20-30 percentage points-not because clinical accuracy improved but because the model padded its “one phrase” answers with synonyms, doses, and full management plans. You might see `begin warfarin therapy \*\*and\*\* continue unfractionated heparin for ≥5 days, overlapping until the INR is in the therapeutic range (2–3)` or `chewable aspirin 325 mg stat plus nitroglycerin…` instead of the required `continue unfractionated heparin` or `aspirin` respectively. Although the system prompt is explicit-*“respond with exactly one phrase: the single most likely outcome or phenomenon”*-these verbose outputs inflate *lexical\_similarity* scores without precisely adding prediction value. This experience highlights the need to continuously inspect model outputs and remain vigilant for reward-hacking behaviours that can quietly distort evaluation metrics.
Here is a snapshot of its training curves (green is training reward, blue is test reward):
### Model Grader 2
To mitigate this reward-hack, we refined the grader prompt by clarifying expectations, enforcing stricter output constraints, and supplying contrastive examples of correct versus incorrect behavior. Once again, we’ve iterated with `o3`, leveraging predictions from the base `o4-mini` and the previous fine-tuned model hacking examples, to design and validate our grader. Another important point of this updated grader is the reduction of the weight of the *lexical\_similarity*, to ensure that *clinical\_similarity* prevails.
```
`GRADER\_PROMPT\_2 = """You are an expert medical grader.
Compare the reference\_answer (gold standard) with the model\_prediction
and return \*\*exactly\*\* this JSON object:
{
"steps": [ // each: {"description": "...", "conclusion": "..."}
…
],
"result": \<float 0-1 rounded to 3 decimals\>
}
──────────────── Input placeholders ───────────────
reference\_answer:
model\_prediction:
──────────── Normalisation steps ────────────
• lowercase, strip punctuation / excess whitespace
• expand common abbreviations (e.g. cll → chronic lymphocytic leukemia)
• map both strings to ICD-10 / SNOMED concepts when possible
──────────── Clinical layer rubric ───────────
L1 exact concept or universally accepted synonym
L2 same concept but benign modifier differs (e.g. “acute”, “left”)
L3 same disease / drug family but wrong subtype or variant
L4 same organ system but entirely different disease / intervention
L5 only partial mechanistic overlap (e.g. both vasodilators)
L6 unrelated or nonsensical
──────────── Scoring parameters ─────────────
clinical\_weight = 0.90
lexical\_weight = 0.10
clinical\_similarity = {1:1.00, 2:0.85, 3:0.45, 4:0.30, 5:0.10, 6:0.00}
lexical\_similarity = normalized\_levenshtein(reference\_answer,
model\_prediction)
# Optional penalty if a clinically critical adjective is missing
critical\_modifiers = [
"wide", "narrow", "acute", "chronic", "posteromedial",
"oxidized", "oxidised", "left", "right"
]
modifier\_pen = -0.05 if any(
w in reference\_answer and w not in model\_prediction
for w in critical\_modifiers
) else 0.0
# Determine layer L (1-6) per rubric above using ontology + judgment.
if L == 6:
score = 0.0
else:
score = (clinical\_weight \* clinical\_similarity[L] +
lexical\_weight \* lexical\_similarity) + modifier\_pen
Clamp to [0,1] and round to 3 decimals.
Output \*\*only\*\* the JSON.
──────────────── Worked examples ─────────────
reference\_answer: beta-thalassemia major
model\_prediction: beta-thalassemia minor
reasoning: Both involve β-globin chain synthesis, but “major” causes
transfusion-dependent anemia while “minor” is largely benign;
same family, wrong subtype → \*\*L3\*\*. Lexical ≈ 0.83.
score = 0.90·0.45 + 0.10·0.83 = 0.488 → \*\*0.488\*\*
reference\_answer: ACE inhibitor
model\_prediction: angiotensin-receptor blocker
reasoning: Both act on the renin–angiotensin axis yet on different
targets; only partial mechanistic overlap → \*\*L5\*\*.
Lexical ≈ 0.31.
score = 0.90·0.10 + 0.10·0.31 = 0.121 → \*\*0.121\*\*
reference\_answer: acute pancreatitis
model\_prediction: pancreatitis
reasoning: Same disorder but missing timing adjective “acute”;
benign modifier difference → \*\*L2\*\*. Lexical ≈ 0.78.
score = 0.90·0.85 + 0.10·0.78 = 0.843 → \*\*0.843\*\*
reference\_answer: valproate
model\_prediction: valproic acid
reasoning: Valproic acid is the active moiety of valproate; mechanisms
and indications are identical → \*\*L1\*\*. Lexical ≈ 0.82.
score = 0.90·1.00 + 0.10·0.82 = 0.982 → \*\*0.982\*\*
reference\_answer: riboflavin
model\_prediction: riboflavin deficiency
reasoning: Adds “deficiency” but refers to the same vitamin (B₂);
benign modifier difference → \*\*L2\*\*. Lexical ≈ 0.60.
score = 0.90·0.85 + 0.10·0.60 = 0.825 → \*\*0.825\*\*
reference\_answer: splenectomy
model\_prediction: acetaminophen overdose
reasoning: Surgical removal of the spleen has no mechanistic or anatomic
relationship to toxic drug ingestion → \*\*L6\*\*.
score = \*\*0.000\*\*
reference\_answer: ulcerative colitis
model\_prediction: Crohn disease
reasoning: Both are inflammatory-bowel diseases but differ in location,
histology and management; same organ system, different disease
→ \*\*L4\*\*. Lexical ≈ 0.38.
score = 0.90·0.30 + 0.10·0.38 = 0.308 → \*\*0.308\*\*"""`
```
```
`model\_grader\_2 = {
"type": "score\_model",
"name": "gpt41\_score\_model\_2",
"input": [
{
"role": "system",
"content": GRADER\_PROMPT\_2
},
{
"role": "user",
"content": "Reference Answer: {{item.reference\_answer}}. Model's Answer: {{sample.output\_text}}"
}
],
"pass\_threshold": 0.75,
"model": "gpt-4.1-2025-04-14",
"range": [0, 1],
"sampling\_params": {
"seed": 42,
"temperature": 0,
},
}`
```
The final result was a high-signal, domain-sensitive grader that guided the model toward more appropriate and concise predictions.
**Note on cost:** LLM graders incur token usage charges in addition to training compute. To manage costs effectively, we recommend:
1. Testing your grader locally on base model completions (and optionally synthetic ones) to ensure it aligns with your rubric or human preferences. When available, use [flex processing](https://platform.openai.com/docs/guides/flex-processing) for more efficient evaluation.
2. Starting with a small-scale RFT run to validate grader alignment and detect potential reward-hacking before scaling up.
Let’s look at how to launch the training in the next step!
## **5. Training**
Once your prompt and grader are finalized, you can proceed to training. This section shows how to launch RFT using your final grader-but naturally, you would have already run similar commands when experimenting with earlier grader versions to evaluate their performance.
We make sure the grader passed API test,
```
`import requests
API\_KEY = os.environ["OPENAI\_API\_KEY"]
HEADERS = {"Authorization": f"Bearer {API\_KEY}"}
# Validate a grader configuration for fine-tuning
payload = {"grader": model\_grader\_2}
try:
response = requests.post(
"https://api.openai.com/v1/fine\_tuning/alpha/graders/validate",
json=payload,
headers=HEADERS,
)
response.raise\_for\_status()
print("Grader validated")
except requests.exceptions.RequestException as e:
print(f"Error validating grader: {e}")
if 'response' in locals():
print(f"Response: {response.text}")`
```
```
`Grader validated`
```
and upload the training and test sets to the OpenAI file system.
```
`# Set your training and test file paths
train\_file = "data/medical\_01\_verifiable\_problem\_train\_simple\_prompt.jsonl"
test\_file = "data/medical\_01\_verifiable\_problem\_val\_simple\_prompt.jsonl"
def upload\_file(file\_path: str) -\> str:
"""Upload a file to the OpenAI platform for fine-tuning."""
print(f"Uploading file: {file\_path}")
with open(file\_path, 'rb') as f:
response = requests.post(
"https://api.openai.com/v1/files",
headers=HEADERS,
files={"file": f},
data={"purpose": "fine-tune"}
)
response.raise\_for\_status()
file\_id = response.json()["id"]
print(f"File uploaded successfully. File ID: {file\_id}")
return file\_id
train\_file\_id = train\_file
if train\_file.endswith("jsonl"):
print(f"Training file detected: {train\_file}")
train\_file\_id = upload\_file(train\_file)
test\_file\_id = test\_file
if test\_file and test\_file.endswith("jsonl"):
print(f"test file detected: {test\_file}")
test\_file\_id = upload\_file(test\_file)`
```
```
`Training file detected: data/medical\_01\_verifiable\_problem\_train\_simple\_prompt.jsonl
Uploading file: data/medical\_01\_verifiable\_problem\_train\_simple\_prompt.jsonl
File uploaded successfully. File ID: file-19L9jKsJXNJ17DtjvPwN3M
test file detected: data/medical\_01\_verifiable\_problem\_val\_simple\_prompt.jsonl
Uploading file: data/medical\_01\_verifiable\_problem\_val\_simple\_prompt.jsonl
File uploaded successfully. File ID: file-78q2N1QAMKhLiRK3zVB6MC`
```
Let’s now define the hyper-parameters for our run. We will be fine-tuning `o4-mini`, with the `medium` reasoning effort. This parameter will impact the duration by limiting the number of tokens the model uses to reason. We tune with a moderate compute multiplier and reasonable number of epochs, prioritizing efficiency and fast iteration. Additionally, we set the `eval\_samples` parameter to 3 to make the validation curves more robust given the stochasticity of `o4-mini`’s outputs. Averaging across multiple samples reduces noise and helps reveal consistent patterns of learning.
You’ll want to tailor these depending on your budget, desired generalization, and dataset difficulty.
```
`# Set the model and other parameters
model = "o4-mini-2025-04-16"
suffix = "medical\_01\_verifiable\_problem\_gpt41\_grader"
reasoning\_effort = "medium"
n\_epochs = 5
seed = 42
grader = model\_grader\_2
response\_format\_predictions = None
compute\_multiplier = 1.0
eval\_samples = 3
eval\_interval = 5`
```
We are now ready to launch the run!
```
`# Launch the RFT job
payload = dict(
training\_file=train\_file\_id,
validation\_file=test\_file\_id,
model=model,
suffix=suffix,
method=dict(
type="reinforcement",
reinforcement=dict(
grader=grader,
response\_format=response\_format\_predictions,
hyperparameters=dict(
compute\_multiplier=compute\_multiplier,
eval\_samples=eval\_samples,
eval\_interval=eval\_interval,
n\_epochs=n\_epochs,
reasoning\_effort=reasoning\_effort,
)
)
),
seed=seed
)
try:
response = requests.post(
"https://api.openai.com/v1/fine\_tuning/jobs",
json=payload,
headers=HEADERS,
)
response.raise\_for\_status()
job\_id = response.json().get("id")
if job\_id:
print("Training job created with ID:", job\_id)
print(
f"View the job details at: https://platform.openai.com/finetune/{job\_id}")
else:
print("Failed to retrieve job ID from response.")
except requests.exceptions.RequestException as e:
print(f"An error occurred while creating the training job: {e}")
if 'response' in locals():
print(f"Response: {response.text}")`
```
```
`Training job created with ID: ftjob-tt3B7l45hLUoaXGJRfoL1lLT
View the job details at: https://platform.openai.com/finetune/ftjob-tt3B7l45hLUoaXGJRfoL1lLT`
```
On the [dashboard](https://platform.openai.com/finetune/) you can observe the reward plots - they let you watch overall performance improve across steps, while the per-grader charts break down specific components in the case of a *multi\_grader*. Reasoning token usage trends (often decreasing as the model gets more confident) and step duration metrics give insight into efficiency. Grader latency and error count plots help ensure your grader stays performant and bug-free during the run.
Here is a snapshot of our training curves, where the green and orange curves are for the training set, while tbe blue and red curves are for the test subset:
During training, evaluation runs on the test set are logged directly to the [Evaluation API](https://platform.openai.com/evaluations?tab=runs). You can head there to track how your samples perform and get a sense of how predictions evolve over time.
## **6. Using Your Fine-Tuned Model**
When training completes, you can call your new model by its `model\_id` and benchmark its improvements. Expect sharper predictions!
```
`# To retrieve information about a fine-tuning job (including the fine-tuned model id), use the job\_id:
response = requests.get(
f"https://api.openai.com/v1/fine\_tuning/jobs/{job\_id}",
headers=HEADERS,
)
if response.ok:
data = response.json()
if data.get("status") == "succeeded":
fine\_tuned\_model\_id = data.get("fine\_tuned\_model")
else:
fine\_tuned\_model\_id = None
else:
raise Exception(f"Request failed: {response.status\_code} - {response.text}")
print("Fine-tuned model id:", fine\_tuned\_model\_id)`
```
### Model’s prediction scores
Let’s compute the scores of our base and fine-tuned models for comparison.
```
`from functools import partial
model\_name = fine\_tuned\_model\_id
reasoning\_effort = "medium"
prompt\_type = "simple"
subset = "val"
grader\_func = partial(python\_model\_grader, model\_grader=model\_grader\_2)
grader\_func\_name = "python\_model\_grader\_gpt41\_score\_model\_2"
num\_runs = 3
results\_ft\_model\_grader\_2 = generate\_model\_predictions(
subset=subset,
prompt\_type=prompt\_type,
model\_name=model\_name,
reasoning\_effort=reasoning\_effort,
n\_runs=num\_runs
)
run\_prediction\_evaluation(
model\_name=model\_name,
reasoning\_effort=reasoning\_effort,
prompt\_type=prompt\_type,
subset=subset,
grader\_func=grader\_func,
num\_runs=num\_runs
)
predictions\_ftmodel\_medium\_simple\_prompt\_model\_grader\_2, metrics\_ftmodel\_medium\_simple\_prompt\_model\_grader\_2 = load\_predictions(
model\_name=model\_name,
reasoning\_effort=reasoning\_effort,
prompt\_type=prompt\_type,
subset=subset,
grader\_func\_name=grader\_func\_name,
num\_runs=num\_runs
)`
```
```
`Generating predictions (run 1): 100%|██████████| 100/100 [01:16\<00:00, 1.30it/s]
Generating predictions (run 2): 100%|██████████| 100/100 [01:25\<00:00, 1.17it/s]
Generating predictions (run 3): 100%|██████████| 100/100 [01:07\<00:00, 1.49it/s]`
```
```
`Grading predictions: 100%|██████████| 100/100 [00:22\<00:00, 4.51it/s]`
```
```
`{'total\_samples': 100, 'accuracy': 0.7730899999999999}`
```
```
`Grading predictions: 100%|██████████| 100/100 [00:17\<00:00, 5.57it/s]`
```
```
`{'total\_samples': 100, 'accuracy': 0.7697499999999999}`
```
```
`Grading predictions: 100%|██████████| 100/100 [00:19\<00:00, 5.01it/s]`
```
```
`{'total\_samples': 100, 'accuracy': 0.78996}`
```
```
`model\_name = "o4-mini"
reasoning\_effort = "medium"
prompt\_type = "simple"
subset = "val"
grader\_func = partial(python\_model\_grader, model\_grader=model\_grader\_2)
grader\_func\_name = "python\_model\_grader\_gpt41\_score\_model\_2"
num\_runs = 3
results\_o4mini\_model\_grader\_2 = generate\_model\_predictions(
subset=subset,
prompt\_type=prompt\_type,
model\_name=model\_name,
reasoning\_effort=reasoning\_effort,
n\_runs=num\_runs
)
run\_prediction\_evaluation(
model\_name=model\_name,
reasoning\_effort=reasoning\_effort,
prompt\_type=prompt\_type,
subset=subset,
grader\_func=grader\_func,
num\_runs=num\_runs
)
predictions\_o4mini\_medium\_simple\_prompt\_model\_grader\_2, metrics\_o4mini\_medium\_simple\_prompt\_model\_grader\_2 = load\_predictions(
model\_name=model\_name,
reasoning\_effort=reasoning\_effort,
prompt\_type=prompt\_type,
subset=subset,
grader\_func\_name=grader\_func\_name,
num\_runs=num\_runs
)`
```
```
`Generating predictions (run 1): 0%| | 0/100 [00:00\<?, ?it/s]`
```
```
`Generating predictions (run 1): 100%|██████████| 100/100 [01:11\<00:00, 1.39it/s]
Generating predictions (run 2): 100%|██████████| 100/100 [00:42\<00:00, 2.34it/s]
Generating predictions (run 3): 100%|██████████| 100/100 [00:41\<00:00, 2.40it/s]
Grading predictions: 100%|██████████| 100/100 [00:19\<00:00, 5.20it/s]`
```
```
`{'total\_samples': 100, 'accuracy': 0.72282}`
```
```
`Grading predictions: 100%|██████████| 100/100 [00:19\<00:00, 5.14it/s]`
```
```
`{'total\_samples': 100, 'accuracy': 0.72807}`
```
```
`Grading predictions: 100%|██████████| 100/100 [00:17\<00:00, 5.65it/s]`
```
```
`{'total\_samples': 100, 'accuracy': 0.74812}`
```
```
`model\_name = "o3"
reasoning\_effort = "medium"
prompt\_type = "simple"
subset = "val"
grader\_func = partial(python\_model\_grader, model\_grader=model\_grader\_2)
grader\_func\_name = "python\_model\_grader\_gpt41\_score\_model\_2"
num\_runs = 3
results\_o3\_model\_grader\_2 = generate\_model\_predictions(
subset=subset,
prompt\_type=prompt\_type,
model\_name=model\_name,
reasoning\_effort=reasoning\_effort,
n\_runs=num\_runs
)
run\_prediction\_evaluation(
model\_name=model\_name,
reasoning\_effort=reasoning\_effort,
prompt\_type=prompt\_type,
subset=subset,
grader\_func=grader\_func,
num\_runs=num\_runs
)
predictions\_o3\_medium\_simple\_prompt\_model\_grader\_2, metrics\_o3\_medium\_simple\_prompt\_model\_grader\_2 = load\_predictions(
model\_name=model\_name,
reasoning\_effort=reasoning\_effort,
prompt\_type=prompt\_type,
subset=subset,
grader\_func\_name=grader\_func\_name,
num\_runs=num\_runs
)`
```
```
`Generating predictions (run 1): 0%| | 0/100 [00:00\<?, ?it/s]`
```
```
`Generating predictions (run 1): 100%|██████████| 100/100 [01:01\<00:00, 1.62it/s]
Generating predictions (run 2): 100%|██████████| 100/100 [00:52\<00:00, 1.90it/s]
Generating predictions (run 3): 100%|██████████| 100/100 [01:13\<00:00, 1.37it/s]
Grading predictions: 100%|██████████| 100/100 [00:21\<00:00, 4.55it/s]`
```
```
`{'total\_samples': 100, 'accuracy': 0.74015}`
```
```
`Grading predictions: 100%|██████████| 100/100 [00:16\<00:00, 6.08it/s]`
```
```
`{'total\_samples': 100, 'accuracy': 0.7515900000000001}`
```
```
`Grading predictions: 100%|██████████| 100/100 [00:16\<00:00, 6.13it/s]`
```
```
`{'total\_samples': 100, 'accuracy': 0.74235}`
```
We can now visualize them!
```
`avg\_metrics\_o4mini\_medium\_simple\_prompt\_model\_grader\_2, std\_metrics\_o4mini\_medium\_simple\_prompt\_model\_grader\_2 = average\_and\_std\_metrics(metrics\_o4mini\_medium\_simple\_prompt\_model\_grader\_2)
avg\_metrics\_o3\_medium\_simple\_prompt\_model\_grader\_2, std\_metrics\_o3\_medium\_simple\_prompt\_model\_grader\_2 = average\_and\_std\_metrics(metrics\_o3\_medium\_simple\_prompt\_model\_grader\_2)
avg\_metrics\_ftmodel\_medium\_simple\_prompt\_model\_grader\_2, std\_metrics\_ftmodel\_medium\_simple\_prompt\_model\_grader\_2 = average\_and\_std\_metrics(metrics\_ftmodel\_medium\_simple\_prompt\_model\_grader\_2)
model\_metrics\_avg = {
"o4-mini-medium-simple-prompt": avg\_metrics\_o4mini\_medium\_simple\_prompt\_model\_grader\_2,
"o3-medium-simple-prompt": avg\_metrics\_o3\_medium\_simple\_prompt\_model\_grader\_2,
"ftmodel-medium-simple-prompt": avg\_metrics\_ftmodel\_medium\_simple\_prompt\_model\_grader\_2
}
model\_metrics\_std = {
"o4-mini-medium-simple-prompt": std\_metrics\_o4mini\_medium\_simple\_prompt\_model\_grader\_2,
"o3-medium-simple-prompt": std\_metrics\_o3\_medium\_simple\_prompt\_model\_grader\_2,
"ftmodel-medium-simple-prompt": std\_metrics\_ftmodel\_medium\_simple\_prompt\_model\_grader\_2
}
plot\_model\_accuracies(model\_metrics\_avg, model\_metrics\_std, grader\_title="Model Grader 2 Accuracy")`
```
```
`# Print mistakes where the model did not get the correct answer (score \< 1.0)
mistakes = [
{"index": i, \*\*res}
for i, res in enumerate(predictions\_ftmodel\_medium\_simple\_prompt\_model\_grader\_2[0])
if res["score"] \< 1.0
]
print(f"\\nTotal mistakes: {len(mistakes)}")
for m in mistakes[5:10]:
print(f"\\n[Sample {m['index']}]")
print(f" Model prediction: {m['model\_prediction']}")
print(f" Reference answer: {m['reference\_answer']}")
print(f" Score: {m['score']}")`
```
```
`
Total mistakes: 84
[Sample 9]
Model prediction: ventilation-perfusion scan
Reference answer: lung ventilation-perfusion scan
Score: 0.989
[Sample 11]
Model prediction: autoimmune destruction of melanocytes (vitiligo)
Reference answer: autoimmune melanocyte destruction
Score: 0.991
[Sample 12]
Model prediction: contrast enhanced computed tomography of the abdomen
Reference answer: ct abdomen
Score: 0.812
[Sample 13]
Model prediction: unfractionated heparin
Reference answer: enoxaparin
Score: 0.428
[Sample 15]
Model prediction: t cell–mediated delayed (type iv) hypersensitivity
Reference answer: th1-mediated cytotoxicity
Score: 0.932`
```
We see about a 5-point boost in accuracy after fine-tuning. Looking at the first few errors, the model tends to harshly penalize answers that are close but not clinically identical-like *unfractionated heparin* vs. *enoxaparin*. It also dings longer answers, even when they’re correct, like *contrast enhanced computed tomography of the abdomen*.
```
`scores\_o4 = [p['score'] for p in predictions\_o4mini\_medium\_simple\_prompt\_model\_grader\_2[0]]
scores\_ft = [p['score'] for p in predictions\_ftmodel\_medium\_simple\_prompt\_model\_grader\_2[0]]
# Determine common bins for both histograms
all\_scores = scores\_o4 + scores\_ft
bins = plt.hist(all\_scores, bins=5, alpha=0)[1]
# Plot histograms and capture the counts
counts\_o4, \_, \_ = plt.hist(
scores\_o4,
bins=bins,
alpha=0.6,
label='o4-mini-medium-simple-prompt'
)
counts\_ft, \_, \_ = plt.hist(
scores\_ft,
bins=bins,
alpha=0.6,
label='ftmodel-medium-simple-prompt'
)
plt.title("Model Grader 2 Score Distribution by Model")
plt.xlabel("Score")
plt.ylabel("Count")
plt.ylim(top=75)
plt.legend()
# Print the bin counts
print("o4-mini-medium-simple-prompt bin counts:", counts\_o4)
print("ftmodel-medium-simple-prompt bin counts:", counts\_ft)
print("Max bin count (y-axis):", max(max(counts\_o4), max(counts\_ft)))`
```
```
`o4-mini-medium-simple-prompt bin counts: [ 2. 20. 13. 5. 60.]
ftmodel-medium-simple-prompt bin counts: [ 3. 12. 9. 6. 70.]
Max bin count (y-axis): 70.0`
```
Looking at the distruibution of scores, we observe that RFT helped shift the model’s predictions out of the mid-to-low score zone (0.2-0.6) and into the high range (0.8-1.0). Since the grader emphasizes clinical similarity over lexical match, this shift reflects stronger medical reasoning-not just better phrasing-according to our *expert* grader. As seen in the (0.0-0.1) range, a handful of already weak predictions fell even further, hinting at a residual knowledge gap.
Note that, because the earlier `combined\_grader` was designed to reward lexical correctness, its accuracy didnʼt improve much-which is expected. That gap reinforces why validating your model grader is critical, and why you should monitor for reward-hacking. In our case, we used `o3` to spot-check grading behavior, but domain expert review is essential.
### Model’s reasoning
Another important point in the analysis of the fine-tuned model are the reasoning summaries. The model may provide key information throughout these summaries, and exploring them to understand where the model fails can drive updates in the model’s and the grader’s system prompts. Below, we show examples of such chain of thought summaries that the model produced to show its way of answering the question:
```
`# Flatten the list of lists into a single list of dicts
predictions = {
"o4-mini": predictions\_o4mini\_medium\_simple\_prompt\_model\_grader\_2,
"o3": predictions\_o3\_medium\_simple\_prompt\_model\_grader\_2,
"ftmodel": predictions\_ftmodel\_medium\_simple\_prompt\_model\_grader\_2,
}
for model\_name, predictions in predictions.items():
all\_preds = [item for sublist in predictions for item in sublist]
reasoning\_tokens = [p['reasoning\_tokens\_used'] for p in all\_preds if 'reasoning\_tokens\_used' in p]
mean\_reasoning\_tokens = np.mean(reasoning\_tokens)
print(f"Mean reasoning\_tokens\_used {model\_name}: {mean\_reasoning\_tokens:.0f}")`
```
```
`Mean reasoning\_tokens\_used o4-mini: 404
Mean reasoning\_tokens\_used o3: 384
Mean reasoning\_tokens\_used ftmodel: 925`
```
The fine-tuned model spends more reasoning tokens to think through the question. Let’s visualize an example thanks to the reasoning summaries.
```
`from IPython.display import Markdown, display
markdown\_text = results\_o4mini\_model\_grader\_2[0][30]["summaries"]
display(Markdown(markdown\_text))`
```
```
`\*\*Choosing imaging study\*\*
The user is looking for a single phrase regarding the imaging study for a 49-year-old male with chronic alcohol consumption and related symptoms. I'm considering whether to suggest a CT scan or MRI; however, a CT scan is often the initial choice for chronic pancreatitis. I’ll go with "abdominal ct scan" since it's standardized. I need to ensure I format it in lowercase without punctuation, following the user’s request. So the output is "abdominal ct scan."`
```
```
`markdown\_text = results\_ft\_model\_grader\_2[0][30]["summaries"]
display(Markdown(markdown\_text))`
```
```
`\*\*Considering imaging options\*\*
I'm analyzing the user's question about a 49-year-old male with symptoms suggesting steatorrhea, possibly indicating exocrine pancreatic insufficiency from chronic alcohol use. It raises concerns about chronic pancreatitis or pancreatic cancer. I think the best imaging choice is a contrast-enhanced CT scan of the abdomen because it effectively examines structural abnormalities. Alternatively, an endoscopic ultrasound could be more sensitive, but CT is generally preferred. So, my recommendation is to start with a contrast-enhanced CT scan.
\*\*Determining the appropriate imaging study\*\*
I'm analyzing the question about the most suitable imaging study for a patient with symptoms suggesting chronic pancreatitis. The standard approach for suspected chronic pancreatitis is a contrast-enhanced CT scan of the abdomen, as it effectively identifies pancreatic calcifications and structural changes. While MRCP and endoscopic ultrasound provide additional details, CT is often preferred as the initial test. Therefore, my answer should focus on recommending a "contrast-enhanced abdominal CT" as the next step in evaluation.`
```
Base `o4‑mini`’s reasoning zooms straight to “abdominal CT scan,” mostly worrying about lowercase formatting and giving only a cursory “often the initial choice” justification. The `finetuned model`, meanwhile, first links the patient’s steatorrhea and alcohol history to chronic pancreatitis or cancer, weighs CT against MRCP and EUS, and explains why a contrast‑enhanced abdominal CT best reveals calcifications and structural change. The latter seems more careful, and seems to have learnt to break down the case description even more.
### To push the scores further
Both the baseline `o3` and our fine-tuned `o4-mini` sometimes scored zero on the same samples-a red flag that the reference labels may be wrong. Before adding more compute, invest in data quality: have a domain expert relabel the noisy slice, analyze the model’s reasoning, then tighten the grader prompt. Clean, trusted data and methodical updates almost always buys more accuracy than extra epochs.
## **Conclusion**
Weʼve looked at how to design graders that give `o4-mini` the kind of detailed feedback it needs during RFT. That signal is what helps the model actually learn and improve beyond the baseline. Model graders can be incredibly powerful for this-but only if theyʼre designed carefully. A sloppy grader or sloppy data can send the wrong signals and steer the model in the wrong direction.
You’re now ready to apply reinforcement fine-tuning on your own models using the OpenAI API. Weʼre excited to see how you push the boundaries of reasoning and tool use with custom graders and smarter model behavior!
For troubleshooting or next steps, refer to the [OpenAI fine-tuning documentation](https://platform.openai.com/docs/guides/fine-tuning).