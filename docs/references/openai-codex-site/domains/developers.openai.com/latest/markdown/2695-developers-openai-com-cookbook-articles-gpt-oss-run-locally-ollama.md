How to run gpt-oss locally with Ollama
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
# How to run gpt-oss locally with Ollama
[ DK ](https://www.linkedin.com/in/dkundel/)
[ Dominik Kundel
(OpenAI)
](https://www.linkedin.com/in/dkundel/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/articles/gpt-oss/run-locally-ollama.md) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/articles/gpt-oss/run-locally-ollama.md)
Want to get [**OpenAI gpt-oss**](https://openai.com/open-models) running on your own hardware? This guide will walk you through how to use [Ollama](https://ollama.ai) to set up **gpt-oss-20b** or **gpt-oss-120b** locally, to chat with it offline, use it through an API, and even connect it to the Agents SDK.
Note that this guide is meant for consumer hardware, like running a model on a PC or Mac. For server applications with dedicated GPUs like NVIDIA’s H100s, [check out our vLLM guide](https://cookbook.openai.com/articles/gpt-oss/run-vllm).
## Pick your model
Ollama supports both model sizes of gpt-oss:
* **`gpt-oss-20b`**
* The smaller model
* Best with **≥16GB VRAM** or **unified memory**
* Perfect for higher-end consumer GPUs or Apple Silicon Macs
* **`gpt-oss-120b`**
* Our larger full-sized model
* Best with **≥60GB VRAM** or **unified memory**
* Ideal for multi-GPU or beefy workstation setup
**A couple of notes:**
* These models ship **MXFP4 quantized** out the box and there is currently no other quantization
* You *can* offload to CPU if you’re short on VRAM, but expect it to run slower.
## Quick setup
1. **Install Ollama** → [Get it here](https://ollama.com/download)
2. **Pull the model you want:**
```
`# For 20B
ollama pull gpt-oss:20b
# For 120B
ollama pull gpt-oss:120b`
```
## Chat with gpt-oss
Ready to talk to the model? You can fire up a chat in the app or the terminal:
```
`ollama run gpt-oss:20b`
```
Ollama applies a **chat template** out of the box that mimics the [OpenAI harmony format](https://cookbook.openai.com/articles/openai-harmony). Type your message and start the conversation.
## Use the API
Ollama exposes a **Chat Completions-compatible API**, so you can use the OpenAI SDK without changing much. Here’s a Python example:
```
`from openai import OpenAI
client = OpenAI(
base\_url="http://localhost:11434/v1", # Local Ollama API
api\_key="ollama" # Dummy key
)
response = client.chat.completions.create(
model="gpt-oss:20b",
messages=[
{"role": "system", "content": "You are a helpful assistant."},
{"role": "user", "content": "Explain what MXFP4 quantization is."}
]
)
print(response.choices[0].message.content)`
```
If you’ve used the OpenAI SDK before, this will feel instantly familiar.
Alternatively, you can use the Ollama SDKs in [Python](https://github.com/ollama/ollama-python) or [JavaScript](https://github.com/ollama/ollama-js) directly.
## Using tools (function calling)
Ollama can:
* Call functions
* Use a **built-in browser tool** (in the app)
Example of invoking a function via Chat Completions:
```
`tools = [
{
"type": "function",
"function": {
"name": "get\_weather",
"description": "Get current weather in a given city",
"parameters": {
"type": "object",
"properties": {"city": {"type": "string"}},
"required": ["city"]
},
},
}
]
response = client.chat.completions.create(
model="gpt-oss:20b",
messages=[{"role": "user", "content": "What's the weather in Berlin right now?"}],
tools=tools
)
print(response.choices[0].message)`
```
Since the models can perform tool calling as part of the chain-of-thought (CoT) it’s important for you to return the reasoning returned by the API back into a subsequent call to a tool call where you provide the answer until the model reaches a final answer.
## Responses API workarounds
Ollama doesn’t (yet) support the **Responses API** natively.
If you do want to use the Responses API you can use [**Hugging Face’s `Responses.js` proxy**](https://github.com/huggingface/responses.js) to convert Chat Completions to Responses API.
For basic use cases you can also [**run our example Python server with Ollama as the backend.**](https://github.com/openai/gpt-oss?tab=readme-ov-file#responses-api) This server is a basic example server and does not have the
```
`pip install gpt-oss
python -m gpt\_oss.responses\_api.serve \\
--inference\_backend=ollama \\
--checkpoint gpt-oss:20b`
```
## Agents SDK integration
Want to use gpt-oss with OpenAI’s **Agents SDK**?
Both Agents SDK enable you to override the OpenAI base client to point to Ollama using Chat Completions or your Responses.js proxy for your local models. Alternatively, you can use the built-in functionality to point the Agents SDK against third party models.
* **Python:** Use [LiteLLM](https://openai.github.io/openai-agents-python/models/litellm/) to proxy to Ollama through LiteLLM
* **TypeScript:** Use [AI SDK](https://openai.github.io/openai-agents-js/extensions/ai-sdk/) with the [ollama adapter](https://ai-sdk.dev/providers/community-providers/ollama)
Here’s a Python Agents SDK example using LiteLLM:
```
`import asyncio
from agents import Agent, Runner, function\_tool, set\_tracing\_disabled
from agents.extensions.models.litellm\_model import LitellmModel
set\_tracing\_disabled(True)
@function\_tool
def get\_weather(city: str):
print(f"[debug] getting weather for {city}")
return f"The weather in {city} is sunny."
async def main(model: str, api\_key: str):
agent = Agent(
name="Assistant",
instructions="You only respond in haikus.",
model=LitellmModel(model="ollama/gpt-oss:120b", api\_key=api\_key),
tools=[get\_weather],
)
result = await Runner.run(agent, "What's the weather in Tokyo?")
print(result.final\_output)
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(main())`
```