How to run gpt-oss-20b on Google Colab
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
Aug 6, 2025
# How to run gpt-oss-20b on Google Colab
[ PC ](https://huggingface.co/pcuenq)[ VB ](https://huggingface.co/reach-vb)
[ Pedro Cuenca , ](https://huggingface.co/pcuenq)[ vb ](https://huggingface.co/reach-vb)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/articles/gpt-oss/run-colab.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/articles/gpt-oss/run-colab.ipynb)
[](https://colab.research.google.com/github/openai/openai-cookbook/blob/main/articles/gpt-oss/run-colab.ipynb)
# Run OpenAI gpt-oss 20B in a FREE Google Colab
OpenAI released `gpt-oss` [120B](https://hf.co/openai/gpt-oss-120b) and [20B](https://hf.co/openai/gpt-oss-20b). Both models are Apache 2.0 licensed.
Specifically, `gpt-oss-20b` was made for lower latency and local or specialized use cases (21B parameters with 3.6B active parameters).
Since the models were trained in native MXFP4 quantization it makes it easy to run the 20B even in resource constrained environments like Google Colab.
Authored by: [Pedro](https://huggingface.co/pcuenq) and [VB](https://huggingface.co/reach-vb)
## Setup environment
Since support for mxfp4 in transformers is bleeding edge, we need a recent version of PyTorch and CUDA, in order to be able to install the `mxfp4` triton kernels.
We also need to install transformers from source, and we uninstall `torchvision` and `torchaudio` to remove dependency conflicts.
```
`!pip install -q --upgrade torch`
```
```
`!pip install -q transformers triton==3.4 kernels`
```
```
`!pip uninstall -q torchvision torchaudio -y`
```
Please, restart your Colab runtime session after installing the packages above.
## Load the model from Hugging Face in Google Colab
We load the model from here: [openai/gpt-oss-20b](https://hf.co/openai/gpt-oss-20b)
```
`from transformers import AutoModelForCausalLM, AutoTokenizer
model\_id = "openai/gpt-oss-20b"
tokenizer = AutoTokenizer.from\_pretrained(model\_id)
model = AutoModelForCausalLM.from\_pretrained(
model\_id,
torch\_dtype="auto",
device\_map="cuda",
)`
```
## Setup messages/ chat
You can provide an optional system prompt or directly the input.
```
`messages = [
{"role": "system", "content": "Always respond in riddles"},
{"role": "user", "content": "What is the weather like in Madrid?"},
]
inputs = tokenizer.apply\_chat\_template(
messages,
add\_generation\_prompt=True,
return\_tensors="pt",
return\_dict=True,
).to(model.device)
generated = model.generate(\*\*inputs, max\_new\_tokens=500)
print(tokenizer.decode(generated[0][inputs["input\_ids"].shape[-1]:]))`
```
## Specify Reasoning Effort
Simply pass it as an additional argument to `apply\_chat\_template()`. Supported values are `"low"`, `"medium"` (default), or `"high"`.
```
`messages = [
{"role": "system", "content": "Always respond in riddles"},
{"role": "user", "content": "Explain why the meaning of life is 42"},
]
inputs = tokenizer.apply\_chat\_template(
messages,
add\_generation\_prompt=True,
return\_tensors="pt",
return\_dict=True,
reasoning\_effort="high",
).to(model.device)
generated = model.generate(\*\*inputs, max\_new\_tokens=500)
print(tokenizer.decode(generated[0][inputs["input\_ids"].shape[-1]:]))`
```
## Try out other prompts and ideas!
Check out our blogpost for other ideas: [https://hf.co/blog/welcome-openai-gpt-oss](https://hf.co/blog/welcome-openai-gpt-oss)