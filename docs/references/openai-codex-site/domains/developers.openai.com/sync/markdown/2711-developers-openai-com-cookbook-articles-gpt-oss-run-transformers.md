How to run gpt-oss with Transformers
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
Aug 5, 2025
# How to run gpt-oss with Transformers
[ DK ](https://www.linkedin.com/in/dkundel/)
[ Dominik Kundel
(OpenAI)
](https://www.linkedin.com/in/dkundel/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/articles/gpt-oss/run-transformers.md) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/articles/gpt-oss/run-transformers.md)
The Transformers library by Hugging Face provides a flexible way to load and run large language models locally or on a server. This guide will walk you through running [OpenAI gpt-oss-20b](https://huggingface.co/openai/gpt-oss-20b) or [OpenAI gpt-oss-120b](https://huggingface.co/openai/gpt-oss-120b) using Transformers, either with a high-level pipeline or via low-level `generate` calls with raw token IDs.
We’ll cover the use of [OpenAI gpt-oss-20b](https://huggingface.co/openai/gpt-oss-20b) or [OpenAI gpt-oss-120b](https://huggingface.co/openai/gpt-oss-120b) with the high-level pipeline abstraction, low-level `generate` calls, and serving models locally with `transformers serve`, with in a way compatible with the Responses API.
In this guide we’ll run through various optimised ways to run the **gpt-oss models via Transformers.**
Bonus: You can also fine-tune models via transformers, [check out our fine-tuning guide here](https://cookbook.openai.com/articles/gpt-oss/fine-tune-transformers).
## Pick your model
Both **gpt-oss** models are available on Hugging Face:
* **`openai/gpt-oss-20b`**
* \~16GB VRAM requirement when using MXFP4
* Great for single high-end consumer GPUs
* **`openai/gpt-oss-120b`**
* Requires ≥60GB VRAM or multi-GPU setup
* Ideal for H100-class hardware
Both are **MXFP4 quantized** by default. Please, note that MXFP4 is supported in Hopper or later architectures. This includes data center GPUs such as H100 or GB200, as well as the latest RTX 50xx family of consumer cards.
If you use `bfloat16` instead of MXFP4, memory consumption will be larger (\~48 GB for the 20b parameter model).
## Quick setup
1. **Install dependencies**
It’s recommended to create a fresh Python environment. Install transformers, accelerate, as well as the Triton kernels for MXFP4 compatibility:
```
`pip install -U transformers accelerate torch triton==3.4 kernels`
```
1. **(Optional) Enable multi-GPU**
If you’re running large models, use Accelerate or torchrun to handle device mapping automatically.
## Create an Open AI Responses / Chat Completions endpoint
To launch a server, simply use the `transformers serve` CLI command:
```
`transformers serve`
```
The simplest way to interact with the server is through the transformers chat CLI
```
`transformers chat localhost:8000 --model-name-or-path openai/gpt-oss-20b`
```
or by sending an HTTP request with cURL, e.g.
```
`curl -X POST http://localhost:8000/v1/responses -H "Content-Type: application/json" -d '{"messages": [{"role": "system", "content": "hello"}], "temperature": 0.9, "max\_tokens": 1000, "stream": true, "model": "openai/gpt-oss-20b"}'`
```
Additional use cases, like integrating `transformers serve` with Cursor and other tools, are detailed in [the documentation](https://huggingface.co/docs/transformers/main/serving).
## Quick inference with pipeline
The easiest way to run the gpt-oss models is with the Transformers high-level `pipeline` API:
```
`from transformers import pipeline
generator = pipeline(
"text-generation",
model="openai/gpt-oss-20b",
torch\_dtype="auto",
device\_map="auto" # Automatically place on available GPUs
)
messages = [
{"role": "user", "content": "Explain what MXFP4 quantization is."},
]
result = generator(
messages,
max\_new\_tokens=200,
temperature=1.0,
)
print(result[0]["generated\_text"])`
```
## Advanced inference with `.generate()`
If you want more control, you can load the model and tokenizer manually and invoke the `.generate()` method:
```
`from transformers import AutoModelForCausalLM, AutoTokenizer
model\_name = "openai/gpt-oss-20b"
tokenizer = AutoTokenizer.from\_pretrained(model\_name)
model = AutoModelForCausalLM.from\_pretrained(
model\_name,
torch\_dtype="auto",
device\_map="auto"
)
messages = [
{"role": "user", "content": "Explain what MXFP4 quantization is."},
]
inputs = tokenizer.apply\_chat\_template(
messages,
add\_generation\_prompt=True,
return\_tensors="pt",
return\_dict=True,
).to(model.device)
outputs = model.generate(
\*\*inputs,
max\_new\_tokens=200,
temperature=0.7
)
print(tokenizer.decode(outputs[0]))`
```
## Chat template and tool calling
OpenAI gpt-oss models use the [harmony response format](https://cookbook.openai.com/article/harmony) for structuring messages, including reasoning and tool calls.
To construct prompts you can use the built-in chat template of Transformers. Alternatively, you can install and use the [openai-harmony library](https://github.com/openai/harmony) for more control.
To use the chat template:
```
`from transformers import AutoModelForCausalLM, AutoTokenizer
model\_name = "openai/gpt-oss-20b"
tokenizer = AutoTokenizer.from\_pretrained(model\_name)
model = AutoModelForCausalLM.from\_pretrained(
model\_name,
device\_map="auto",
torch\_dtype="auto",
)
messages = [
{"role": "system", "content": "Always respond in riddles"},
{"role": "user", "content": "What is the weather like in Madrid?"},
]
inputs = tokenizer.apply\_chat\_template(
messages,
add\_generation\_prompt=True,
return\_tensors="pt",
return\_dict=True,
).to(model.device)
generated = model.generate(\*\*inputs, max\_new\_tokens=100)
print(tokenizer.decode(generated[0][inputs["input\_ids"].shape[-1] :]))`
```
To integrate the [`openai-harmony`](https://github.com/openai/harmony) library to prepare prompts and parse responses, first install it like this:
```
`pip install openai-harmony`
```
Here’s an example of how to use the library to build your prompts and encode them to tokens:
```
`import json
from openai\_harmony import (
HarmonyEncodingName,
load\_harmony\_encoding,
Conversation,
Message,
Role,
SystemContent,
DeveloperContent
)
from transformers import AutoModelForCausalLM, AutoTokenizer
encoding = load\_harmony\_encoding(HarmonyEncodingName.HARMONY\_GPT\_OSS)
# Build conversation
convo = Conversation.from\_messages([
Message.from\_role\_and\_content(Role.SYSTEM, SystemContent.new()),
Message.from\_role\_and\_content(
Role.DEVELOPER,
DeveloperContent.new().with\_instructions("Always respond in riddles")
),
Message.from\_role\_and\_content(Role.USER, "What is the weather like in SF?")
])
# Render prompt
prefill\_ids = encoding.render\_conversation\_for\_completion(convo, Role.ASSISTANT)
stop\_token\_ids = encoding.stop\_tokens\_for\_assistant\_actions()
# Load model
model\_name = "openai/gpt-oss-20b"
tokenizer = AutoTokenizer.from\_pretrained(model\_name)
model = AutoModelForCausalLM.from\_pretrained(model\_name, torch\_dtype="auto", device\_map="auto")
# Generate
outputs = model.generate(
input\_ids=[prefill\_ids],
max\_new\_tokens=128,
eos\_token\_id=stop\_token\_ids
)
# Parse completion tokens
completion\_ids = outputs[0][len(prefill\_ids):]
entries = encoding.parse\_messages\_from\_completion\_tokens(completion\_ids, Role.ASSISTANT)
for message in entries:
print(json.dumps(message.to\_dict(), indent=2))`
```
Note that the `Developer` role in Harmony maps to the `system` prompt in the chat template.
## Multi-GPU & distributed inference
The large gpt-oss-120b fits on a single H100 GPU when using MXFP4. If you want to run it on multiple GPUs, you can:
* Use `tp\_plan="auto"` for automatic placement and tensor parallelism
* Launch with `accelerate launch or torchrun` for distributed setups
* Leverage Expert Parallelism
* Use specialised Flash attention kernels for faster inference
```
`from transformers import AutoModelForCausalLM, AutoTokenizer
from transformers.distributed import DistributedConfig
import torch
model\_path = "openai/gpt-oss-120b"
tokenizer = AutoTokenizer.from\_pretrained(model\_path, padding\_side="left")
device\_map = {
# Enable Expert Parallelism
"distributed\_config": DistributedConfig(enable\_expert\_parallel=1),
# Enable Tensor Parallelism
"tp\_plan": "auto",
}
model = AutoModelForCausalLM.from\_pretrained(
model\_path,
torch\_dtype="auto",
attn\_implementation="kernels-community/vllm-flash-attn3",
\*\*device\_map,
)
messages = [
{"role": "user", "content": "Explain how expert parallelism works in large language models."}
]
inputs = tokenizer.apply\_chat\_template(
messages,
add\_generation\_prompt=True,
return\_tensors="pt",
return\_dict=True,
).to(model.device)
outputs = model.generate(\*\*inputs, max\_new\_tokens=1000)
# Decode and print
response = tokenizer.decode(outputs[0])
print("Model response:", response.split("\<|channel|\>final\<|message|\>")[-1].strip())`
```
You can then run this on a node with four GPUs via
```
`torchrun --nproc\_per\_node=4 generate.py`
```