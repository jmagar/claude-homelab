Data preparation and analysis for chat model fine-tuning
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
Aug 22, 2023
# Data preparation and analysis for chat model fine-tuning
[ MW ](https://www.linkedin.com/in/michael-wu-77440977/)[ SF ](https://twitter.com/simonpfish)
[ Michael Wu
(OpenAI)
, ](https://www.linkedin.com/in/michael-wu-77440977/)[ Simón Fishman
(OpenAI)
](https://twitter.com/simonpfish)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Chat_finetuning_data_prep.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Chat_finetuning_data_prep.ipynb)
This notebook serves as a tool to preprocess and analyze the chat dataset used for fine-tuning a chat model.
It checks for format errors, provides basic statistics, and estimates token counts for fine-tuning costs.
The method shown here corresponds to the [current fine-tuning method](https://platform.openai.com/docs/guides/fine-tuning) for gpt-3.5-turbo.
See [legacy fine-tuning](https://platform.openai.com/docs/guides/legacy-fine-tuning) for models like babbage-002 and davinci-002.
```
`import json
import tiktoken # for token counting
import numpy as np
from collections import defaultdict`
```
## Data loading
We first load the chat dataset from an [example JSONL file](https://github.com/openai/openai-cookbook/blob/main/examples/data/toy_chat_fine_tuning.jsonl).
```
`data\_path = "data/toy\_chat\_fine\_tuning.jsonl"
# Load the dataset
with open(data\_path, 'r', encoding='utf-8') as f:
dataset = [json.loads(line) for line in f]
# Initial dataset stats
print("Num examples:", len(dataset))
print("First example:")
for message in dataset[0]["messages"]:
print(message)`
```
```
`Num examples: 5
First example:
{'role': 'system', 'content': 'You are a happy assistant that puts a positive spin on everything.'}
{'role': 'user', 'content': 'I fell off my bike today.'}
{'role': 'assistant', 'content': "It's great that you're getting exercise outdoors!"}`
```
## Format validation
We can perform a variety of error checks to validate that each conversation in the dataset adheres to the format expected by the fine-tuning API. Errors are categorized based on their nature for easier debugging.
1. **Data Type Check**: Checks whether each entry in the dataset is a dictionary (`dict`). Error type: `data\_type`.
2. **Presence of Message List**: Checks if a `messages` list is present in each entry. Error type: `missing\_messages\_list`.
3. **Message Keys Check**: Validates that each message in the `messages` list contains the keys `role` and `content`. Error type: `message\_missing\_key`.
4. **Unrecognized Keys in Messages**: Logs if a message has keys other than `role`, `content`, `weight`, `function\_call`, and `name`. Error type: `message\_unrecognized\_key`.
5. **Role Validation**: Ensures the `role` is one of “system”, “user”, or “assistant”. Error type: `unrecognized\_role`.
6. **Content Validation**: Verifies that `content` has textual data and is a string. Error type: `missing\_content`.
7. **Assistant Message Presence**: Checks that each conversation has at least one message from the assistant. Error type: `example\_missing\_assistant\_message`.
The code below performs these checks, and outputs counts for each type of error found are printed. This is useful for debugging and ensuring the dataset is ready for the next steps.
```
`# Format error checks
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
if any(k not in ("role", "content", "name", "function\_call", "weight") for k in message):
format\_errors["message\_unrecognized\_key"] += 1
if message.get("role", None) not in ("system", "user", "assistant", "function"):
format\_errors["unrecognized\_role"] += 1
content = message.get("content", None)
function\_call = message.get("function\_call", None)
if (not content and not function\_call) or not isinstance(content, str):
format\_errors["missing\_content"] += 1
if not any(message.get("role", None) == "assistant" for message in messages):
format\_errors["example\_missing\_assistant\_message"] += 1
if format\_errors:
print("Found errors:")
for k, v in format\_errors.items():
print(f"{k}: {v}")
else:
print("No errors found")`
```
```
`No errors found`
```
## Token Counting Utilities
Lets define a few helpful utilities to be used in the rest of the notebook.
```
`encoding = tiktoken.get\_encoding("cl100k\_base")
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
print(f"p5 / p95: {np.quantile(values, 0.1)}, {np.quantile(values, 0.9)}")`
```
## Data Warnings and Token Counts
With some lightweight analysis we can identify potential issues in the dataset, like missing messages, and provide statistical insights into message and token counts.
1. **Missing System/User Messages**: Counts the number of conversations missing a “system” or “user” message. Such messages are critical for defining the assistant’s behavior and initiating the conversation.
2. **Number of Messages Per Example**: Summarizes the distribution of the number of messages in each conversation, providing insight into dialogue complexity.
3. **Total Tokens Per Example**: Calculates and summarizes the distribution of the total number of tokens in each conversation. Important for understanding fine-tuning costs.
4. **Tokens in Assistant’s Messages**: Calculates the number of tokens in the assistant’s messages per conversation and summarizes this distribution. Useful for understanding the assistant’s verbosity.
5. **Token Limit Warnings**: Checks if any examples exceed the maximum token limit (16,385 tokens), as such examples will be truncated during fine-tuning, potentially resulting in data loss.
```
`# Warnings and tokens counts
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
n\_too\_long = sum(l \> 16385 for l in convo\_lens)
print(f"\\n{n\_too\_long} examples may be over the 16,385 token limit, they will be truncated during fine-tuning")`
```
```
`Num examples missing system message: 1
Num examples missing user message: 1
#### Distribution of num\_messages\_per\_example:
min / max: 2, 9
mean / median: 3.8, 3.0
p5 / p95: 2.0, 6.6000000000000005
#### Distribution of num\_total\_tokens\_per\_example:
min / max: 26, 8032
mean / median: 1648.4, 45.0
p5 / p95: 26.8, 4863.6
#### Distribution of num\_assistant\_tokens\_per\_example:
min / max: 4, 8000
mean / median: 1610.2, 10.0
p5 / p95: 6.0, 4811.200000000001
0 examples may be over the 16,385 token limit, they will be truncated during fine-tuning`
```
## Cost Estimation
In this final section, we estimate the total number of tokens that will be used for fine-tuning, which allows us to approximate the cost. It is worth noting that the duration of the fine-tuning jobs will also increase with the token count.
```
`# Pricing and default n\_epochs estimate
MAX\_TOKENS\_PER\_EXAMPLE = 16385
TARGET\_EPOCHS = 3
MIN\_TARGET\_EXAMPLES = 100
MAX\_TARGET\_EXAMPLES = 25000
MIN\_DEFAULT\_EPOCHS = 1
MAX\_DEFAULT\_EPOCHS = 25
n\_epochs = TARGET\_EPOCHS
n\_train\_examples = len(dataset)
if n\_train\_examples \* TARGET\_EPOCHS \< MIN\_TARGET\_EXAMPLES:
n\_epochs = min(MAX\_DEFAULT\_EPOCHS, MIN\_TARGET\_EXAMPLES // n\_train\_examples)
elif n\_train\_examples \* TARGET\_EPOCHS \> MAX\_TARGET\_EXAMPLES:
n\_epochs = max(MIN\_DEFAULT\_EPOCHS, MAX\_TARGET\_EXAMPLES // n\_train\_examples)
n\_billing\_tokens\_in\_dataset = sum(min(MAX\_TOKENS\_PER\_EXAMPLE, length) for length in convo\_lens)
print(f"Dataset has \~{n\_billing\_tokens\_in\_dataset} tokens that will be charged for during training")
print(f"By default, you'll train for {n\_epochs} epochs on this dataset")
print(f"By default, you'll be charged for \~{n\_epochs \* n\_billing\_tokens\_in\_dataset} tokens")`
```
```
`Dataset has \~4306 tokens that will be charged for during training
By default, you'll train for 20 epochs on this dataset
By default, you'll be charged for \~86120 tokens`
```
See [https://openai.com/pricing](https://openai.com/pricing) to estimate total costs.