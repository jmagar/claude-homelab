Fine-tuning OpenAI models with Weights & Biases
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
Oct 4, 2023
# Fine-tuning OpenAI models with Weights & Biases
[ AS ](https://github.com/ash0ts)
[ ash0ts ](https://github.com/ash0ts)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/third_party/GPT_finetuning_with_wandb.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/third_party/GPT_finetuning_with_wandb.ipynb)
[](https://colab.research.google.com/github/wandb/examples/blob/master/colabs/openai/Fine_tune_GPT_3_with_Weights_&#x26;_Biases.ipynb)
**Note:** you will need an [OpenAI API key](https://platform.openai.com/account/api-keys) to run this colab.
If you use OpenAI’s API to [fine-tune ChatGPT-3.5](https://platform.openai.com/docs/guides/fine-tuning), you can now use the W&B integration to track experiments, models, and datasets in your central dashboard.
All it takes is one line: `openai wandb sync`
See the [OpenAI section](https://wandb.me/openai-docs) in the Weights & Biases documentation for full details of the integration
```
`!pip install -Uq openai tiktoken datasets tenacity wandb`
```
```
`# Remove once this PR is merged: https://github.com/openai/openai-python/pull/590 and openai release is made
!pip uninstall -y openai -qq \\
&& pip install git+https://github.com/morganmcg1/openai-python.git@update\_wandb\_logger -qqq`
```
## Optional: Fine-tune ChatGPT-3.5
It’s always more fun to experiment with your own projects so if you have already used the openai API to fine-tune an OpenAI model, just skip this section.
Otherwise let’s fine-tune ChatGPT-3.5 on a legal dataset!
### Imports and initial set-up
```
`import openai
import wandb
import os
import json
import random
import tiktoken
import numpy as np
import pandas as pd
from pathlib import Path
from tqdm.auto import tqdm
from collections import defaultdict
from tenacity import retry, stop\_after\_attempt, wait\_fixed`
```
Start your Weigths & Biases run. If you don’t have an account you can sign up for one for free at [www.wandb.ai](http://www.wandb.ai)
```
`WANDB\_PROJECT = "OpenAI-Fine-Tune"`
```
### Set up your API key
```
`# # Enter credentials
openai\_key = "YOUR\_API\_KEY"
openai.api\_key = openai\_key`
```
### Dataset Preparation
We download a dataset from [LegalBench](https://hazyresearch.stanford.edu/legalbench/), a project to curate tasks for evaluating legal reasoning, specifically the [Contract NLI Explicit Identification task](https://github.com/HazyResearch/legalbench/tree/main/tasks/contract_nli_explicit_identification).
This comprises of a total of 117 examples, from which we will create our own train and test datasets
```
`from datasets import load\_dataset
# Download the data, merge into a single dataset and shuffle
dataset = load\_dataset("nguha/legalbench", "contract\_nli\_explicit\_identification")
data = []
for d in dataset["train"]:
data.append(d)
for d in dataset["test"]:
data.append(d)
random.shuffle(data)
for idx, d in enumerate(data):
d["new\_index"] = idx`
```
Let’s look at a few samples.
```
`len(data), data[0:2]`
```
```
`(117,
[{'answer': 'No',
'index': '94',
'text': 'Recipient shall use the Confidential Information exclusively for HySafe purposes, especially to advice the Governing Board of HySafe. ',
'document\_name': 'NDA\_V3.pdf',
'new\_index': 0},
{'answer': 'No',
'index': '53',
'text': '3. In consideration of each and every disclosure of CONFIDENTIAL INFORMATION, the Parties agree to: (c) make no disclosures of any CONFIDENTIAL INFORMATION to any party other than officers and employees of a Party to this IRA; (d) limit access to CONFIDENTIAL INFORMATION to those officers and employees having a reasonable need for such INFORMATION and being boUnd by a written obligation to maintain the confidentiality of such INFORMATION; and ',
'document\_name': '1084000\_0001144204-06-046785\_v056501\_ex10-16.txt',
'new\_index': 1}])`
```
### Format our Data for Chat Completion Models
We modify the `base\_prompt` from the LegalBench task to make it a zero-shot prompt, as we are training the model instead of using few-shot prompting
```
`base\_prompt\_zero\_shot = "Identify if the clause provides that all Confidential Information shall be expressly identified by the Disclosing Party. Answer with only `Yes` or `No`"`
```
We now split it into training/validation dataset, lets train on 30 samples and test on the remainder
```
`n\_train = 30
n\_test = len(data) - n\_train`
```
```
`train\_messages = []
test\_messages = []
for d in data:
prompts = []
prompts.append({"role": "system", "content": base\_prompt\_zero\_shot})
prompts.append({"role": "user", "content": d["text"]})
prompts.append({"role": "assistant", "content": d["answer"]})
if int(d["new\_index"]) \< n\_train:
train\_messages.append({'messages': prompts})
else:
test\_messages.append({'messages': prompts})
len(train\_messages), len(test\_messages), n\_test, train\_messages[5]`
```
```
`(30,
87,
87,
{'messages': [{'role': 'system',
'content': 'Identify if the clause provides that all Confidential Information shall be expressly identified by the Disclosing Party. Answer with only `Yes` or `No`'},
{'role': 'user',
'content': '2. The Contractor shall not, without the State’s prior written consent, copy, disclose, publish, release, transfer, disseminate, use, or allow access for any purpose or in any form, any Confidential Information except for the sole and exclusive purpose of performing under the Contract. '},
{'role': 'assistant', 'content': 'No'}]})`
```
### Save the data to Weigths & Biases
Save the data in a train and test file first
```
`train\_file\_path = 'encoded\_train\_data.jsonl'
with open(train\_file\_path, 'w') as file:
for item in train\_messages:
line = json.dumps(item)
file.write(line + '\\n')
test\_file\_path = 'encoded\_test\_data.jsonl'
with open(test\_file\_path, 'w') as file:
for item in test\_messages:
line = json.dumps(item)
file.write(line + '\\n')`
```
Next, we validate that our training data is in the correct format using a script from the [OpenAI fine-tuning documentation](https://platform.openai.com/docs/guides/fine-tuning/)
```
`# Next, we specify the data path and open the JSONL file
def openai\_validate\_data(dataset\_path):
data\_path = dataset\_path
# Load dataset
with open(data\_path) as f:
dataset = [json.loads(line) for line in f]
# We can inspect the data quickly by checking the number of examples and the first item
# Initial dataset stats
print("Num examples:", len(dataset))
print("First example:")
for message in dataset[0]["messages"]:
print(message)
# Now that we have a sense of the data, we need to go through all the different examples and check to make sure the formatting is correct and matches the Chat completions message structure
# Format error checks
format\_errors = defaultdict(int)
for ex in dataset:
if not isinstance(ex, dict):
format\_errors["data\_type"] += 1
continue
messages = ex.get("messages", None)
if not messages:
format\_errors["missing\_messages\_list"] += 1
continue
for message in messages:
if "role" not in message or "content" not in message:
format\_errors["message\_missing\_key"] += 1
if any(k not in ("role", "content", "name") for k in message):
format\_errors["message\_unrecognized\_key"] += 1
if message.get("role", None) not in ("system", "user", "assistant"):
format\_errors["unrecognized\_role"] += 1
content = message.get("content", None)
if not content or not isinstance(content, str):
format\_errors["missing\_content"] += 1
if not any(message.get("role", None) == "assistant" for message in messages):
format\_errors["example\_missing\_assistant\_message"] += 1
if format\_errors:
print("Found errors:")
for k, v in format\_errors.items():
print(f"{k}: {v}")
else:
print("No errors found")
# Beyond the structure of the message, we also need to ensure that the length does not exceed the 4096 token limit.
# Token counting functions
encoding = tiktoken.get\_encoding("cl100k\_base")
# not exact!
# simplified from https://github.com/openai/openai-cookbook/blob/main/examples/How\_to\_count\_tokens\_with\_tiktoken.ipynb
def num\_tokens\_from\_messages(messages, tokens\_per\_message=3, tokens\_per\_name=1):
num\_tokens = 0
for message in messages:
num\_tokens += tokens\_per\_message
for key, value in message.items():
num\_tokens += len(encoding.encode(value))
if key == "name":
num\_tokens += tokens\_per\_name
num\_tokens += 3
return num\_tokens
def num\_assistant\_tokens\_from\_messages(messages):
num\_tokens = 0
for message in messages:
if message["role"] == "assistant":
num\_tokens += len(encoding.encode(message["content"]))
return num\_tokens
def print\_distribution(values, name):
print(f"\\n#### Distribution of {name}:")
print(f"min / max: {min(values)}, {max(values)}")
print(f"mean / median: {np.mean(values)}, {np.median(values)}")
print(f"p5 / p95: {np.quantile(values, 0.1)}, {np.quantile(values, 0.9)}")
# Last, we can look at the results of the different formatting operations before proceeding with creating a fine-tuning job:
# Warnings and tokens counts
n\_missing\_system = 0
n\_missing\_user = 0
n\_messages = []
convo\_lens = []
assistant\_message\_lens = []
for ex in dataset:
messages = ex["messages"]
if not any(message["role"] == "system" for message in messages):
n\_missing\_system += 1
if not any(message["role"] == "user" for message in messages):
n\_missing\_user += 1
n\_messages.append(len(messages))
convo\_lens.append(num\_tokens\_from\_messages(messages))
assistant\_message\_lens.append(num\_assistant\_tokens\_from\_messages(messages))
print("Num examples missing system message:", n\_missing\_system)
print("Num examples missing user message:", n\_missing\_user)
print\_distribution(n\_messages, "num\_messages\_per\_example")
print\_distribution(convo\_lens, "num\_total\_tokens\_per\_example")
print\_distribution(assistant\_message\_lens, "num\_assistant\_tokens\_per\_example")
n\_too\_long = sum(l \> 4096 for l in convo\_lens)
print(f"\\n{n\_too\_long} examples may be over the 4096 token limit, they will be truncated during fine-tuning")
# Pricing and default n\_epochs estimate
MAX\_TOKENS\_PER\_EXAMPLE = 4096
MIN\_TARGET\_EXAMPLES = 100
MAX\_TARGET\_EXAMPLES = 25000
TARGET\_EPOCHS = 3
MIN\_EPOCHS = 1
MAX\_EPOCHS = 25
n\_epochs = TARGET\_EPOCHS
n\_train\_examples = len(dataset)
if n\_train\_examples \* TARGET\_EPOCHS \< MIN\_TARGET\_EXAMPLES:
n\_epochs = min(MAX\_EPOCHS, MIN\_TARGET\_EXAMPLES // n\_train\_examples)
elif n\_train\_examples \* TARGET\_EPOCHS \> MAX\_TARGET\_EXAMPLES:
n\_epochs = max(MIN\_EPOCHS, MAX\_TARGET\_EXAMPLES // n\_train\_examples)
n\_billing\_tokens\_in\_dataset = sum(min(MAX\_TOKENS\_PER\_EXAMPLE, length) for length in convo\_lens)
print(f"Dataset has \~{n\_billing\_tokens\_in\_dataset} tokens that will be charged for during training")
print(f"By default, you'll train for {n\_epochs} epochs on this dataset")
print(f"By default, you'll be charged for \~{n\_epochs \* n\_billing\_tokens\_in\_dataset} tokens")
print("See pricing page to estimate total costs")`
```
Validate train data
```
`openai\_validate\_data(train\_file\_path)`
```
```
`Num examples: 30
First example:
{'role': 'system', 'content': 'Identify if the clause provides that all Confidential Information shall be expressly identified by the Disclosing Party. Answer with only `Yes` or `No`'}
{'role': 'user', 'content': 'Recipient shall use the Confidential Information exclusively for HySafe purposes, especially to advice the Governing Board of HySafe. '}
{'role': 'assistant', 'content': 'No'}
No errors found
Num examples missing system message: 0
Num examples missing user message: 0
#### Distribution of num\_messages\_per\_example:
min / max: 3, 3
mean / median: 3.0, 3.0
p5 / p95: 3.0, 3.0
#### Distribution of num\_total\_tokens\_per\_example:
min / max: 69, 319
mean / median: 143.46666666666667, 122.0
p5 / p95: 82.10000000000001, 235.10000000000002
#### Distribution of num\_assistant\_tokens\_per\_example:
min / max: 1, 1
mean / median: 1.0, 1.0
p5 / p95: 1.0, 1.0
0 examples may be over the 4096 token limit, they will be truncated during fine-tuning
Dataset has \~4304 tokens that will be charged for during training
By default, you'll train for 3 epochs on this dataset
By default, you'll be charged for \~12912 tokens
See pricing page to estimate total costs`
```
Log our data to Weigths & Biases Artifacts for storage and versioning
```
`wandb.init(
project=WANDB\_PROJECT,
# entity="prompt-eng",
job\_type="log-data",
config = {'n\_train': n\_train,
'n\_valid': n\_test})
wandb.log\_artifact(train\_file\_path,
"legalbench-contract\_nli\_explicit\_identification-train",
type="train-data")
wandb.log\_artifact(test\_file\_path,
"legalbench-contract\_nli\_explicit\_identification-test",
type="test-data")
# keep entity (typically your wandb username) for reference of artifact later in this demo
entity = wandb.run.entity
wandb.finish()`
```
```
`Failed to detect the name of this notebook, you can set it manually with the WANDB\_NOTEBOOK\_NAME environment variable to enable code saving.
[34m[1mwandb[0m: Currently logged in as: [33mcapecape[0m. Use [1m`wandb login --relogin`[0m to force relogin`
```
Tracking run with wandb version 0.15.9
Run data is saved locally in `/Users/tcapelle/work/examples/colabs/openai/wandb/run-20230830\_113853-ivu21mjl`
Syncing run **[mild-surf-1](https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/ivu21mjl)** to [Weights & Biases](https://wandb.ai/capecape/OpenAI-Fine-Tune) ([docs](https://wandb.me/run))
View project at [](https://wandb.ai/capecape/OpenAI-Fine-Tune)[https://wandb.ai/capecape/OpenAI-Fine-Tune](https://wandb.ai/capecape/OpenAI-Fine-Tune)
View run at [](https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/ivu21mjl)[https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/ivu21mjl](https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/ivu21mjl)
Waiting for W&B process to finish… **(success).**
```
`wandb: WARNING Source type is set to 'repo' but some required information is missing from the environment. A job will not be created from this run. See https://docs.wandb.ai/guides/launch/create-job`
```
View run **mild-surf-1** at: [](https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/ivu21mjl)[https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/ivu21mjl](https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/ivu21mjl)
Synced 6 W&B file(s), 0 media file(s), 2 artifact file(s) and 1 other file(s)
Find logs at: `./wandb/run-20230830\_113853-ivu21mjl/logs`
### Create a fine-tuned model
We’ll now use OpenAI API to fine-tune ChatGPT-3.5
Let’s first download our training & validation files and save them to a folder called `my\_data`. We will retrieve the `latest` version of the artifact, but it could also be `v0`, `v1` or any alias we associated with it
```
`wandb.init(project=WANDB\_PROJECT,
# entity="prompt-eng",
job\_type="finetune")
artifact\_train = wandb.use\_artifact(
f'{entity}/{WANDB\_PROJECT}/legalbench-contract\_nli\_explicit\_identification-train:latest',
type='train-data')
train\_file = artifact\_train.get\_path(train\_file\_path).download("my\_data")
train\_file`
```
```
`VBox(children=(Label(value='Waiting for wandb.init()...\\r'), FloatProgress(value=0.016751802766035932, max=1.0…`
```
Tracking run with wandb version 0.15.9
Run data is saved locally in `/Users/tcapelle/work/examples/colabs/openai/wandb/run-20230830\_113907-1ili9l51`
Syncing run **[jumping-water-2](https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/1ili9l51)** to [Weights & Biases](https://wandb.ai/capecape/OpenAI-Fine-Tune) ([docs](https://wandb.me/run))
View project at [](https://wandb.ai/capecape/OpenAI-Fine-Tune)[https://wandb.ai/capecape/OpenAI-Fine-Tune](https://wandb.ai/capecape/OpenAI-Fine-Tune)
View run at [](https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/1ili9l51)[https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/1ili9l51](https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/1ili9l51)
```
`'my\_data/encoded\_train\_data.jsonl'`
```
Then we upload the training data to OpenAI. OpenAi has to process the data, so this will take a few minutes depending on the size of your dataset.
```
`openai\_train\_file\_info = openai.File.create(
file=open(train\_file, "rb"),
purpose='fine-tune'
)
# you may need to wait a couple of minutes for OpenAI to process the file
openai\_train\_file\_info`
```
```
`\<File file id=file-spPASR6VWco54SqfN2yo7T8v\> JSON: {
"object": "file",
"id": "file-spPASR6VWco54SqfN2yo7T8v",
"purpose": "fine-tune",
"filename": "file",
"bytes": 24059,
"created\_at": 1693388388,
"status": "uploaded",
"status\_details": null
}`
```
### Time to train the model!
Let’s define our ChatGPT-3.5 fine-tuning hyper-parameters.
```
`model = 'gpt-3.5-turbo'
n\_epochs = 3`
```
```
`openai\_ft\_job\_info = openai.FineTuningJob.create(
training\_file=openai\_train\_file\_info["id"],
model=model,
hyperparameters={"n\_epochs": n\_epochs}
)
ft\_job\_id = openai\_ft\_job\_info["id"]
openai\_ft\_job\_info`
```
```
`\<FineTuningJob fine\_tuning.job id=ftjob-x4tl83IlSGolkUF3fCFyZNGs\> JSON: {
"object": "fine\_tuning.job",
"id": "ftjob-x4tl83IlSGolkUF3fCFyZNGs",
"model": "gpt-3.5-turbo-0613",
"created\_at": 1693388447,
"finished\_at": null,
"fine\_tuned\_model": null,
"organization\_id": "org-WnF2wEqNkV1Nj65CzDxr6iUm",
"result\_files": [],
"status": "created",
"validation\_file": null,
"training\_file": "file-spPASR6VWco54SqfN2yo7T8v",
"hyperparameters": {
"n\_epochs": 3
},
"trained\_tokens": null
}`
```
>
> this takes around 5 minutes to train, and you get an email from OpenAI when finished.
>
**Thats it!**
Now your model is training on OpenAI’s machines. To get the current state of your fine-tuning job, run:
```
`state = openai.FineTuningJob.retrieve(ft\_job\_id)
state["status"], state["trained\_tokens"], state["finished\_at"], state["fine\_tuned\_model"]`
```
```
`('succeeded',
12732,
1693389024,
'ft:gpt-3.5-turbo-0613:weights-biases::7tC85HcX')`
```
Show recent events for our fine-tuning job
```
`openai.FineTuningJob.list\_events(id=ft\_job\_id, limit=5)`
```
```
`\<OpenAIObject list\> JSON: {
"object": "list",
"data": [
{
"object": "fine\_tuning.job.event",
"id": "ftevent-5x9Y6Payk6fIdyJyMRY5um1v",
"created\_at": 1693389024,
"level": "info",
"message": "Fine-tuning job successfully completed",
"data": null,
"type": "message"
},
{
"object": "fine\_tuning.job.event",
"id": "ftevent-i16NTGNakv9P0RkOtJ7vvvoG",
"created\_at": 1693389022,
"level": "info",
"message": "New fine-tuned model created: ft:gpt-3.5-turbo-0613:weights-biases::7tC85HcX",
"data": null,
"type": "message"
},
{
"object": "fine\_tuning.job.event",
"id": "ftevent-MkLrJQ8sDgaC67CdmFMwsIjV",
"created\_at": 1693389017,
"level": "info",
"message": "Step 90/90: training loss=0.00",
"data": {
"step": 90,
"train\_loss": 2.5828578600339824e-06,
"train\_mean\_token\_accuracy": 1.0
},
"type": "metrics"
},
{
"object": "fine\_tuning.job.event",
"id": "ftevent-3sRpTRSjK3TfFRZY88HEASpX",
"created\_at": 1693389015,
"level": "info",
"message": "Step 89/90: training loss=0.00",
"data": {
"step": 89,
"train\_loss": 2.5828578600339824e-06,
"train\_mean\_token\_accuracy": 1.0
},
"type": "metrics"
},
{
"object": "fine\_tuning.job.event",
"id": "ftevent-HtS6tJMVPOmazquZ82a1iCdV",
"created\_at": 1693389015,
"level": "info",
"message": "Step 88/90: training loss=0.00",
"data": {
"step": 88,
"train\_loss": 2.5828578600339824e-06,
"train\_mean\_token\_accuracy": 1.0
},
"type": "metrics"
}
],
"has\_more": true
}`
```
We can run a few different fine-tunes with different parameters or even with different datasets.
## Log OpenAI fine-tune jobs to Weights & Biases
We can log our fine-tunes with a simple command.
```
`!openai wandb sync --help`
```
```
`usage: openai wandb sync [-h] [-i ID] [-n N\_FINE\_TUNES] [--project PROJECT]
[--entity ENTITY] [--force] [--legacy]
options:
-h, --help show this help message and exit
-i ID, --id ID The id of the fine-tune job (optional)
-n N\_FINE\_TUNES, --n\_fine\_tunes N\_FINE\_TUNES
Number of most recent fine-tunes to log when an id is
not provided. By default, every fine-tune is synced.
--project PROJECT Name of the Weights & Biases project where you're
sending runs. By default, it is "OpenAI-Fine-Tune".
--entity ENTITY Weights & Biases username or team name where you're
sending runs. By default, your default entity is used,
which is usually your username.
--force Forces logging and overwrite existing wandb run of the
same fine-tune.
--legacy Log results from legacy OpenAI /v1/fine-tunes api`
```
Calling `openai wandb sync` will log all un-synced fine-tuned jobs to W&B
Below we are just logging 1 job, passing:
* our OpenAI key as an environment variable
* the id of the fine-tune job we’d like to log
* the W&B project of where to log it to
See the [OpenAI section](https://wandb.me/openai-docs) in the Weights & Biases documentation for full details of the integration
```
`!OPENAI\_API\_KEY={openai\_key} openai wandb sync --id {ft\_job\_id} --project {WANDB\_PROJECT}`
```
```
`Retrieving fine-tune job...
[34m[1mwandb[0m: Currently logged in as: [33mcapecape[0m. Use [1m`wandb login --relogin`[0m to force relogin
[34m[1mwandb[0m: Tracking run with wandb version 0.15.9
[34m[1mwandb[0m: Run data is saved locally in [35m[1m/Users/tcapelle/work/examples/colabs/openai/wandb/run-20230830\_115915-ftjob-x4tl83IlSGolkUF3fCFyZNGs[0m
[34m[1mwandb[0m: Run [1m`wandb offline`[0m to turn off syncing.
[34m[1mwandb[0m: Syncing run [33mftjob-x4tl83IlSGolkUF3fCFyZNGs[0m
[34m[1mwandb[0m: ⭐️ View project at [34m[4mhttps://wandb.ai/capecape/OpenAI-Fine-Tune[0m
[34m[1mwandb[0m: 🚀 View run at [34m[4mhttps://wandb.ai/capecape/OpenAI-Fine-Tune/runs/ftjob-x4tl83IlSGolkUF3fCFyZNGs[0m
[34m[1mwandb[0m: Waiting for W&B process to finish... [32m(success).[0m
[34m[1mwandb[0m:
[34m[1mwandb[0m: Run history:
[34m[1mwandb[0m: train\_accuracy ▁▁▁▁▁█▁█▁██▁████████████████████████████
[34m[1mwandb[0m: train\_loss █▇▆▂▂▁▂▁▅▁▁▇▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
[34m[1mwandb[0m:
[34m[1mwandb[0m: Run summary:
[34m[1mwandb[0m: fine\_tuned\_model ft:gpt-3.5-turbo-061...
[34m[1mwandb[0m: status succeeded
[34m[1mwandb[0m: train\_accuracy 1.0
[34m[1mwandb[0m: train\_loss 0.0
[34m[1mwandb[0m:
[34m[1mwandb[0m: 🚀 View run [33mftjob-x4tl83IlSGolkUF3fCFyZNGs[0m at: [34m[4mhttps://wandb.ai/capecape/OpenAI-Fine-Tune/runs/ftjob-x4tl83IlSGolkUF3fCFyZNGs[0m
[34m[1mwandb[0m: Synced 6 W&B file(s), 0 media file(s), 1 artifact file(s) and 0 other file(s)
[34m[1mwandb[0m: Find logs at: [35m[1m./wandb/run-20230830\_115915-ftjob-x4tl83IlSGolkUF3fCFyZNGs/logs[0m
🎉 wandb sync completed successfully`
```
```
`wandb.finish()`
```
Waiting for W&B process to finish… **(success).**
```
`VBox(children=(Label(value='0.050 MB of 0.050 MB uploaded (0.000 MB deduped)\\r'), FloatProgress(value=1.0, max…`
```
```
`wandb: WARNING Source type is set to 'repo' but some required information is missing from the environment. A job will not be created from this run. See https://docs.wandb.ai/guides/launch/create-job
upload\_file exception https://storage.googleapis.com/wandb-production.appspot.com/capecape/OpenAI-Fine-Tune/1ili9l51/requirements.txt?Expires=1693475972&GoogleAccessId=gorilla-files-url-signer-man%40wandb-production.iam.gserviceaccount.com&Signature=NzF9wj2gS8rMEwRT9wlft2lNubemw67f2qrz9Zy90Bjxg5xCL9pIu%2FRbBGjRwLA2v64PuiP23Au5Dho26Tnw3UjUS1apqTkaOgjWDTlCCiDLzvMUsqHf0lhhWIgGMZcsA4gPpOi%2Bc%2ByJm4z6JE7D6RJ7r8y4fI0Jg6fX9KSWpzh8INiM6fQZiQjUChLVdtNJQZ2gfu7xRc%2BZIUEjgDuUqmS705pIUOgJXA9MS3%2Fhewkc7CxWay4ReMJixBZgaqLIRqHQnyzb38I5nPrRS3JrwrigQyX6tOsK05LDLA0o%2Bs0K11664%2F1ZxO6mSTfOaw7tXUmbUUWFOp33Qq8KXNz9Zg%3D%3D: ('Connection aborted.', RemoteDisconnected('Remote end closed connection without response'))
upload\_file request headers: {'User-Agent': 'python-requests/2.28.2', 'Accept-Encoding': 'gzip, deflate, br', 'Accept': '\*/\*', 'Connection': 'keep-alive', 'Content-Length': '4902'}
upload\_file response body:
upload\_file exception https://storage.googleapis.com/wandb-production.appspot.com/capecape/OpenAI-Fine-Tune/1ili9l51/conda-environment.yaml?Expires=1693475972&GoogleAccessId=gorilla-files-url-signer-man%40wandb-production.iam.gserviceaccount.com&Signature=wKnFdg7z7CiJOMn4WSvt6GSj2hPnMr0Xc4KuwAXa8akLucmw700x%2FWF87jmWaqnp%2FK4%2BF6JTRghQAokXF9jxCcXBSYhgFhCVACrOVyN%2BSTZ4u8tDgD6Dm%2FEFwWObiH%2BALSS1N0FmG7i6kL9Evyng3yPc4noEz%2FkLNIDIascAPgUe9UkPaBCRc9j7OxzYJx07bpeL4HaGe4yaCvk2mSVr4l%2FUfsICBI6E4KKrLDvtZvFFFUB4MgqXp0Sxc0k0pOxaw9zZhiNQQELDnhnuNY4wi78EPiXN1BpU6bTgIYaHe5mkS%2B7M5HiFs83ML98JI2OeRiAjAGtIIETT4xDjTYWVpA%3D%3D: ('Connection aborted.', RemoteDisconnected('Remote end closed connection without response'))
upload\_file request headers: {'User-Agent': 'python-requests/2.28.2', 'Accept-Encoding': 'gzip, deflate, br', 'Accept': '\*/\*', 'Connection': 'keep-alive', 'Content-Length': '8450'}
upload\_file response body:`
```
View run **jumping-water-2** at: [](https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/1ili9l51)[https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/1ili9l51](https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/1ili9l51)
Synced 7 W&B file(s), 0 media file(s), 0 artifact file(s) and 1 other file(s)
Find logs at: `./wandb/run-20230830\_113907-1ili9l51/logs`
Our fine-tunes are now successfully synced to Weights & Biases.
Anytime we have new fine-tunes, we can just call `openai wandb sync` to add them to our dashboard.
## Run evalution and log the results
The best way to evaluate a generative model is to explore sample predictions from your evaluation set.
Let’s generate a few inference samples and log them to W&B and see how the performance compares to a baseline ChatGPT-3.5 model
```
`wandb.init(project=WANDB\_PROJECT,
job\_type='eval')
artifact\_valid = wandb.use\_artifact(
f'{entity}/{WANDB\_PROJECT}/legalbench-contract\_nli\_explicit\_identification-test:latest',
type='test-data')
test\_file = artifact\_valid.get\_path(test\_file\_path).download("my\_data")
with open(test\_file) as f:
test\_dataset = [json.loads(line) for line in f]
print(f"There are {len(test\_dataset)} test examples")
wandb.config.update({"num\_test\_samples":len(test\_dataset)})`
```
Tracking run with wandb version 0.15.9
Run data is saved locally in `/Users/tcapelle/work/examples/colabs/openai/wandb/run-20230830\_115947-iepk19m2`
Syncing run **[ethereal-energy-4](https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/iepk19m2)** to [Weights & Biases](https://wandb.ai/capecape/OpenAI-Fine-Tune) ([docs](https://wandb.me/run))
View project at [](https://wandb.ai/capecape/OpenAI-Fine-Tune)[https://wandb.ai/capecape/OpenAI-Fine-Tune](https://wandb.ai/capecape/OpenAI-Fine-Tune)
View run at [](https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/iepk19m2)[https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/iepk19m2](https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/iepk19m2)
```
`There are 87 test examples`
```
### Run evaluation on the Fine-Tuned Model
Set up OpenAI call with retries
```
`@retry(stop=stop\_after\_attempt(3), wait=wait\_fixed(60))
def call\_openai(messages="", model="gpt-3.5-turbo"):
return openai.ChatCompletion.create(model=model, messages=messages, max\_tokens=10)`
```
Let’s get our trained model id
```
`state = openai.FineTuningJob.retrieve(ft\_job\_id)
ft\_model\_id = state["fine\_tuned\_model"]
ft\_model\_id`
```
```
`'ft:gpt-3.5-turbo-0613:weights-biases::7tC85HcX'`
```
Run evaluation and log results to W&B
```
`prediction\_table = wandb.Table(columns=['messages', 'completion', 'target'])
eval\_data = []
for row in tqdm(test\_dataset):
messages = row['messages'][:2]
target = row["messages"][2]
# res = call\_openai(model=ft\_model\_id, messages=messages)
res = openai.ChatCompletion.create(model=model, messages=messages, max\_tokens=10)
completion = res.choices[0].message.content
eval\_data.append([messages, completion, target])
prediction\_table.add\_data(messages[1]['content'], completion, target["content"])
wandb.log({'predictions': prediction\_table})`
```
```
` 0%| | 0/87 [00:00\<?, ?it/s]`
```
Calculate the accuracy of the fine-tuned model and log to W&B
```
`correct = 0
for e in eval\_data:
if e[1].lower() == e[2]["content"].lower():
correct+=1
accuracy = correct / len(eval\_data)
print(f"Accuracy is {accuracy}")
wandb.log({"eval/accuracy": accuracy})
wandb.summary["eval/accuracy"] = accuracy`
```
```
`Accuracy is 0.8390804597701149`
```
### Run evaluation on a Baseline model for comparison
Lets compare our model to the baseline model, `gpt-3.5-turbo`
```
`baseline\_prediction\_table = wandb.Table(columns=['messages', 'completion', 'target'])
baseline\_eval\_data = []
for row in tqdm(test\_dataset):
messages = row['messages'][:2]
target = row["messages"][2]
res = call\_openai(model="gpt-3.5-turbo", messages=messages)
completion = res.choices[0].message.content
baseline\_eval\_data.append([messages, completion, target])
baseline\_prediction\_table.add\_data(messages[1]['content'], completion, target["content"])
wandb.log({'baseline\_predictions': baseline\_prediction\_table})`
```
```
` 0%| | 0/87 [00:00\<?, ?it/s]`
```
Calculate the accuracy of the fine-tuned model and log to W&B
```
`baseline\_correct = 0
for e in baseline\_eval\_data:
if e[1].lower() == e[2]["content"].lower():
baseline\_correct+=1
baseline\_accuracy = baseline\_correct / len(baseline\_eval\_data)
print(f"Baseline Accurcy is: {baseline\_accuracy}")
wandb.log({"eval/baseline\_accuracy": baseline\_accuracy})
wandb.summary["eval/baseline\_accuracy"] = baseline\_accuracy`
```
```
`Baseline Accurcy is: 0.7931034482758621`
```
```
`wandb.finish()`
```
Waiting for W&B process to finish… **(success).**
```
`VBox(children=(Label(value='0.248 MB of 0.248 MB uploaded (0.000 MB deduped)\\r'), FloatProgress(value=1.0, max…`
```
```
`wandb: WARNING Source type is set to 'repo' but some required information is missing from the environment. A job will not be created from this run. See https://docs.wandb.ai/guides/launch/create-job`
```
### Run history:
|eval/accuracy|▁|
|eval/baseline\_accuracy|▁|
### Run summary:
|eval/accuracy|0.83908|
|eval/baseline\_accuracy|0.7931|
View run **ethereal-energy-4** at: [](https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/iepk19m2)[https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/iepk19m2](https://wandb.ai/capecape/OpenAI-Fine-Tune/runs/iepk19m2)
Synced 7 W&B file(s), 2 media file(s), 2 artifact file(s) and 1 other file(s)
Find logs at: `./wandb/run-20230830\_115947-iepk19m2/logs`
And thats it! In this example we have prepared our data, logged it to Weights & Biases, fine-tuned an OpenAI model using that data, logged the results to Weights & Biases and then run evaluation on the fine-tuned model.
From here you can start to train on larger or more complex tasks, or else explore other ways to modify ChatGPT-3.5 such as giving it a different tone and style or response.
# Resources
* [OpenAI Fine-Tuning Guide](https://platform.openai.com/docs/guides/fine-tuning)
* [W&B Integration with OpenAI API Documentation](https://wandb.me/openai-docs)
* [W&B Report: GPT-3 exploration & fine-tuning tips](http://wandb.me/openai-report)