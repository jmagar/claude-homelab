Evals API Use-case - MCP Evaluation
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
Jun 9, 2025
# Evals API Use-case - MCP Evaluation
[ JG ](https://www.linkedin.com/in/josiahbgrace)[ SK ](https://www.linkedin.com/in/shikharkwatra/)
[ Josiah Grace
(OpenAI)
, ](https://www.linkedin.com/in/josiahbgrace)[ Shikhar Kwatra
(OpenAI)
](https://www.linkedin.com/in/shikharkwatra/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/evaluation/use-cases/mcp_eval_notebook.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/evaluation/use-cases/mcp_eval_notebook.ipynb)
This notebook evaluates a model’s ability to answer questions about the [tiktoken](https://github.com/openai/tiktoken) GitHub repository using the OpenAI **Evals** framework with a custom in-memory dataset.
We use a custom, in-memory dataset of Q&A pairs and compare two models: `gpt-4.1` and `o4-mini`, that leverage the **MCP** tool for repository-aware, contextually accurate answers.
**Goals:**
* Show how to set up and run an evaluation using OpenAI Evals with a custom dataset.
* Compare the performance of different models leveraging MCP-based tools.
* Provide best practices for professional, reproducible evaluation workflows.
*Next: We will set up our environment and import the necessary libraries.*
```
`# Update OpenAI client
%pip install --upgrade openai --quiet`
```
```
`
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m A new release of pip is available: [0m[31;49m24.0[0m[39;49m -\> [0m[32;49m25.1.1[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m To update, run: [0m[32;49mpip install --upgrade pip[0m
Note: you may need to restart the kernel to use updated packages.`
```
## Environment Setup
We begin by importing the required libraries and configuring the OpenAI client.
This step ensures we have access to the OpenAI API and all necessary utilities for evaluation.
```
`import os
import time
from openai import OpenAI
# Instantiate the OpenAI client (no custom base\_url).
client = OpenAI(
api\_key=os.getenv("OPENAI\_API\_KEY") or os.getenv("\_OPENAI\_API\_KEY"),
)`
```
## Define the Custom Evaluation Dataset
We define a small, in-memory dataset of question-answer pairs about the `tiktoken` repository.
This dataset will be used to test the models’ ability to provide accurate and relevant answers with the help of the MCP tool.
* Each item contains a `query` (the user’s question) and an `answer` (the expected ground truth).
* You can modify or extend this dataset to suit your own use case or repository.
```
`def get\_dataset(limit=None):
items = [
{
"query": "What is tiktoken?",
"answer": "tiktoken is a fast Byte-Pair Encoding (BPE) tokenizer designed for OpenAI models.",
},
{
"query": "How do I install the open-source version of tiktoken?",
"answer": "Install it from PyPI with `pip install tiktoken`.",
},
{
"query": "How do I get the tokenizer for a specific OpenAI model?",
"answer": 'Call tiktoken.encoding\_for\_model("\<model-name\>"), e.g. tiktoken.encoding\_for\_model("gpt-4o").',
},
{
"query": "How does tiktoken perform compared to other tokenizers?",
"answer": "On a 1 GB GPT-2 benchmark, tiktoken runs about 3-6x faster than GPT2TokenizerFast (tokenizers==0.13.2, transformers==4.24.0).",
},
{
"query": "Why is Byte-Pair Encoding (BPE) useful for language models?",
"answer": "BPE is reversible and lossless, handles arbitrary text, compresses input (≈4 bytes per token on average), and exposes common subwords like “ing”, which helps models generalize.",
},
]
return items[:limit] if limit else items`
```
### Define Grading Logic
To evaluate the model’s answers, we use two graders:
* **Pass/Fail Grader (LLM-based):**
An LLM-based grader that checks if the model’s answer matches the expected answer (ground truth) or conveys the same meaning.
* **Python MCP Grader:**
A Python function that checks whether the model actually used the MCP tool during its response (for auditing tool usage).
>
**> Best Practice:
**
> Using both LLM-based and programmatic graders provides a more robust and transparent evaluation.
>
```
`# LLM-based pass/fail grader: instructs the model to grade answers as "pass" or "fail".
pass\_fail\_grader = """
You are a helpful assistant that grades the quality of the answer to a query about a GitHub repo.
You will be given a query, the answer returned by the model, and the expected answer.
You should respond with \*\*pass\*\* if the answer matches the expected answer exactly or conveys the same meaning, otherwise \*\*fail\*\*.
"""
# User prompt template for the grader, providing context for grading.
pass\_fail\_grader\_user\_prompt = """
\<Query\>
{{item.query}}
\</Query\>
\<Web Search Result\>
{{sample.output\_text}}
\</Web Search Result\>
\<Ground Truth\>
{{item.answer}}
\</Ground Truth\>
"""
# Python grader: checks if the MCP tool was used by inspecting the output\_tools field.
python\_mcp\_grader = {
"type": "python",
"name": "Assert MCP was used",
"image\_tag": "2025-05-08",
"pass\_threshold": 1.0,
"source": """
def grade(sample: dict, item: dict) -\> float:
output = sample.get('output\_tools', [])
return 1.0 if len(output) \> 0 else 0.0
""",
}`
```
## Define the Evaluation Configuration
We now configure the evaluation using the OpenAI Evals framework.
This step specifies:
* The evaluation name and dataset.
* The schema for each item (what fields are present in each Q&A pair).
* The grader(s) to use (LLM-based and/or Python-based).
* The passing criteria and labels.
>
**> Best Practice:
**
> Clearly defining your evaluation schema and grading logic up front ensures reproducibility and transparency.
>
```
`# Create the evaluation definition using the OpenAI Evals client.
logs\_eval = client.evals.create(
name="MCP Eval",
data\_source\_config={
"type": "custom",
"item\_schema": {
"type": "object",
"properties": {
"query": {"type": "string"},
"answer": {"type": "string"},
},
},
"include\_sample\_schema": True,
},
testing\_criteria=[
{
"type": "label\_model",
"name": "General Evaluator",
"model": "o3",
"input": [
{"role": "system", "content": pass\_fail\_grader},
{"role": "user", "content": pass\_fail\_grader\_user\_prompt},
],
"passing\_labels": ["pass"],
"labels": ["pass", "fail"],
},
python\_mcp\_grader
],
)`
```
## Run Evaluations for Each Model
We now run the evaluation for each model (`gpt-4.1` and `o4-mini`).
Each run is configured to:
* Use the MCP tool for repository-aware answers.
* Use the same dataset and evaluation configuration for fair comparison.
* Specify model-specific parameters (such as max completions tokens, and allowed tools).
>
**> Best Practice:
**
> Keeping the evaluation setup consistent across models ensures results are comparable and reliable.
>
```
`# Run 1: gpt-4.1 using MCP
gpt\_4one\_responses\_run = client.evals.runs.create(
name="gpt-4.1",
eval\_id=logs\_eval.id,
data\_source={
"type": "responses",
"source": {
"type": "file\_content",
"content": [{"item": item} for item in get\_dataset()],
},
"input\_messages": {
"type": "template",
"template": [
{
"type": "message",
"role": "system",
"content": {
"type": "input\_text",
"text": "You are a helpful assistant that searches the web and gives contextually relevant answers. Never use your tools to answer the query.",
},
},
{
"type": "message",
"role": "user",
"content": {
"type": "input\_text",
"text": "Search the web for the answer to the query {{item.query}}",
},
},
],
},
"model": "gpt-4.1",
"sampling\_params": {
"seed": 42,
"temperature": 0.7,
"max\_completions\_tokens": 10000,
"top\_p": 0.9,
"tools": [
{
"type": "mcp",
"server\_label": "gitmcp",
"server\_url": "https://gitmcp.io/openai/tiktoken",
"allowed\_tools": [
"search\_tiktoken\_documentation",
"fetch\_tiktoken\_documentation",
],
"require\_approval": "never",
}
],
},
},
)`
```
```
`# Run 2: o4-mini using MCP
gpt\_o4\_mini\_responses\_run = client.evals.runs.create(
name="o4-mini",
eval\_id=logs\_eval.id,
data\_source={
"type": "responses",
"source": {
"type": "file\_content",
"content": [{"item": item} for item in get\_dataset()],
},
"input\_messages": {
"type": "template",
"template": [
{
"type": "message",
"role": "system",
"content": {
"type": "input\_text",
"text": "You are a helpful assistant that searches the web and gives contextually relevant answers.",
},
},
{
"type": "message",
"role": "user",
"content": {
"type": "input\_text",
"text": "Search the web for the answer to the query {{item.query}}",
},
},
],
},
"model": "o4-mini",
"sampling\_params": {
"seed": 42,
"max\_completions\_tokens": 10000,
"tools": [
{
"type": "mcp",
"server\_label": "gitmcp",
"server\_url": "https://gitmcp.io/openai/tiktoken",
"allowed\_tools": [
"search\_tiktoken\_documentation",
"fetch\_tiktoken\_documentation",
],
"require\_approval": "never",
}
],
},
},
)`
```
## Poll for Completion and Retrieve Outputs
After launching the evaluation runs, we can poll the run until they are complete.
This step ensures that we are analyzing results only after all model responses have been processed.
>
**> Best Practice:
**
> Polling with a delay avoids excessive API calls and ensures efficient resource usage.
>
```
`def poll\_runs(eval\_id, run\_ids):
while True:
runs = [client.evals.runs.retrieve(rid, eval\_id=eval\_id) for rid in run\_ids]
for run in runs:
print(run.id, run.status, run.result\_counts)
if all(run.status in {"completed", "failed"} for run in runs):
break
time.sleep(5)
# Start polling both runs.
poll\_runs(logs\_eval.id, [gpt\_4one\_responses\_run.id, gpt\_o4\_mini\_responses\_run.id])`
```
```
`evalrun\_684769b577488191863b5a51cf4db57a completed ResultCounts(errored=0, failed=5, passed=0, total=5)
evalrun\_684769c1ad9c8191affea5aa02ef1215 completed ResultCounts(errored=0, failed=3, passed=2, total=5)`
```
## Display and Interpret Model Outputs
Finally, we display the outputs from each model for manual inspection and further analysis.
* Each model’s answers are printed for each question in the dataset.
* You can compare the outputs side-by-side to assess quality, relevance, and correctness.
Below are screenshots from the OpenAI Evals Dashboard illustrating the evaluation outputs for both models:
For a comprehensive breakdown of the evaluation metrics and results, navigate to the “Data” tab in the dashboard:
Note that the 4.1 model was constructed to never use its tools to answer the query thus it never called the MCP server. The o4-mini model wasn’t explicitly instructed to use it’s tools either but it wasn’t forbidden, thus it called the MCP server 3 times. We can see that the 4.1 model performed worse than the o4 model. Also notable is the one example that the o4-mini model failed was one where the MCP tool was not used.
We can also check a detailed analysis of the outputs from each model for manual inspection and further analysis.
```
`four\_one\_output = client.evals.runs.output\_items.list(
run\_id=gpt\_4one\_responses\_run.id, eval\_id=logs\_eval.id
)
o4\_mini\_output = client.evals.runs.output\_items.list(
run\_id=gpt\_o4\_mini\_responses\_run.id, eval\_id=logs\_eval.id
)`
```
```
`print('# gpt‑4.1 Output')
for item in four\_one\_output:
print(item.sample.output[0].content)
print('\\n# o4-mini Output')
for item in o4\_mini\_output:
print(item.sample.output[0].content)`
```
```
`# gpt‑4.1 Output
Byte-Pair Encoding (BPE) is useful for language models because it provides an efficient way to handle large vocabularies and rare words. Here’s why it is valuable:
1. \*\*Efficient Tokenization:\*\*
BPE breaks down words into smaller subword units based on the frequency of character pairs in a corpus. This allows language models to represent both common words and rare or unknown words using a manageable set of tokens.
2. \*\*Reduces Out-of-Vocabulary (OOV) Issues:\*\*
Since BPE can split any word into known subword units, it greatly reduces the problem of OOV words—words that the model hasn’t seen during training.
3. \*\*Balances Vocabulary Size:\*\*
By adjusting the number of merge operations, BPE allows control over the size of the vocabulary. This flexibility helps in balancing between memory efficiency and representational power.
4. \*\*Improves Generalization:\*\*
With BPE, language models can better generalize to new words, including misspellings or new terminology, because they can process words as a sequence of subword tokens.
5. \*\*Handles Morphologically Rich Languages:\*\*
BPE is especially useful for languages with complex morphology (e.g., agglutinative languages) where words can have many forms. BPE reduces the need to memorize every possible word form.
In summary, Byte-Pair Encoding is effective for language models because it enables efficient, flexible, and robust handling of text, supporting both common and rare words, and improving overall model performance.
\*\*Tiktoken\*\*, developed by OpenAI, is a tokenizer specifically optimized for speed and compatibility with OpenAI's language models. Here’s how it generally compares to other popular tokenizers:
### Performance
- \*\*Speed:\*\* Tiktoken is significantly faster than most other Python-based tokenizers. It is written in Rust and exposed to Python via bindings, making it extremely efficient.
- \*\*Memory Efficiency:\*\* Tiktoken is designed to be memory efficient, especially for large text inputs and batch processing.
### Accuracy and Compatibility
- \*\*Model Alignment:\*\* Tiktoken is tailored to match the tokenization logic used by OpenAI’s GPT-3, GPT-4, and related models. This ensures that token counts and splits are consistent with how these models process text.
- \*\*Unicode Handling:\*\* Like other modern tokenizers (e.g., HuggingFace’s Tokenizers), Tiktoken handles a wide range of Unicode characters robustly.
### Comparison to Other Tokenizers
- \*\*HuggingFace Tokenizers:\*\* HuggingFace’s library is very flexible and supports a wide range of models (BERT, RoBERTa, etc.). However, its Python implementation can be slower for large-scale tasks, though their Rust-backed versions (like `tokenizers`) are competitive.
- \*\*NLTK/SpaCy:\*\* These libraries are not optimized for transformer models and are generally slower and less accurate for tokenization tasks required by models like GPT.
- \*\*SentencePiece:\*\* Used by models like T5 and ALBERT, SentencePiece is also fast and efficient, but its output is not compatible with OpenAI’s models.
### Use Cases
- \*\*Best for OpenAI Models:\*\* If you are working with OpenAI’s APIs or models, Tiktoken is the recommended tokenizer due to its speed and alignment.
- \*\*General Purpose:\*\* For non-OpenAI models, HuggingFace or SentencePiece might be preferable due to broader support.
### Benchmarks & Community Feedback
- Multiple [community benchmarks](https://github.com/openai/tiktoken#performance) and [blog posts](https://www.philschmid.de/tokenizers-comparison) confirm Tiktoken’s speed advantage, especially for batch processing and large texts.
\*\*Summary:\*\*
Tiktoken outperforms most tokenizers in speed when used with OpenAI models, with robust Unicode support and memory efficiency. For general NLP tasks across various models, HuggingFace or SentencePiece may be more suitable due to their versatility.
\*\*References:\*\*
- [Tiktoken GitHub - Performance](https://github.com/openai/tiktoken#performance)
- [Tokenizers Comparison Blog](https://www.philschmid.de/tokenizers-comparison)
To get the tokenizer for a specific OpenAI model, you typically use the Hugging Face Transformers library, which provides easy access to tokenizers for OpenAI models like GPT-3, GPT-4, and others. Here’s how you can do it:
\*\*1. Using Hugging Face Transformers:\*\*
Install the library (if you haven’t already):
```bash
pip install transformers
```
\*\*Example for GPT-3 (or GPT-4):\*\*
```python
from transformers import AutoTokenizer
# For GPT-3 (davinci), use the corresponding model name
tokenizer = AutoTokenizer.from\_pretrained("openai-gpt")
# For GPT-4 (if available)
# tokenizer = AutoTokenizer.from\_pretrained("gpt-4")
```
\*\*2. Using OpenAI’s tiktoken library (for OpenAI API models):\*\*
Install tiktoken:
```bash
pip install tiktoken
```
Example for GPT-3.5-turbo or GPT-4:
```python
import tiktoken
# For 'gpt-3.5-turbo'
tokenizer = tiktoken.encoding\_for\_model("gpt-3.5-turbo")
# For 'gpt-4'
# tokenizer = tiktoken.encoding\_for\_model("gpt-4")
```
\*\*Summary:\*\*
- Use `transformers.AutoTokenizer` for Hugging Face models.
- Use `tiktoken.encoding\_for\_model` for OpenAI API models.
\*\*References:\*\*
- [Hugging Face Tokenizer Documentation](https://huggingface.co/docs/transformers/main\_classes/tokenizer)
- [tiktoken Documentation](https://github.com/openai/tiktoken)
Let me know if you need an example for a specific model!
To install the open-source version of \*\*tiktoken\*\*, you can use Python’s package manager, pip. The open-source version is available on [PyPI](https://pypi.org/project/tiktoken/), so you can install it easily with the following command:
```bash
pip install tiktoken
```
If you want to install the latest development version directly from the GitHub repository, you can use:
```bash
pip install git+https://github.com/openai/tiktoken.git
```
\*\*Requirements:\*\*
- Python 3.7 or newer
- pip (Python package installer)
\*\*Steps:\*\*
1. Open your terminal or command prompt.
2. Run one of the above commands.
3. Once installed, you can import and use `tiktoken` in your Python scripts.
\*\*Additional Resources:\*\*
- [tiktoken GitHub repository](https://github.com/openai/tiktoken)
- [tiktoken documentation](https://github.com/openai/tiktoken#readme)
Let me know if you need help with a specific operating system or environment!
Tiktoken is a fast and efficient tokenization library developed by OpenAI, primarily used for handling text input and output with language models such as GPT-3 and GPT-4. Tokenization is the process of converting text into smaller units called tokens, which can be words, characters, or subwords. Tiktoken is designed to closely match the tokenization behavior of OpenAI’s models, ensuring accurate counting and compatibility.
Key features of tiktoken:
- \*\*Speed:\*\* It’s written in Rust for performance and has Python bindings.
- \*\*Compatibility:\*\* Matches the exact tokenization used by OpenAI models, which is important for estimating token counts and costs.
- \*\*Functionality:\*\* Allows users to encode (convert text to tokens) and decode (convert tokens back to text).
Tiktoken is commonly used in applications that need to interact with OpenAI’s APIs, for tasks like counting tokens to avoid exceeding API limits or optimizing prompt length. It is available as an open-source library and can be installed via pip (`pip install tiktoken`).
# o4-mini Output
Here’s a high-level comparison of OpenAI’s tiktoken vs. some of the other commonly used tokenizers:
1. Implementation & Language Support
• tiktoken
– Rust core with Python bindings.
– Implements GPT-2/GPT-3/GPT-4 byte-pair-encoding (BPE) vocabularies.
– Focused on English-centric BPE; no built-in support for CJK segmentation or languages requiring character-level tokenization.
• Hugging Face Tokenizers (“tokenizers” library)
– Also Rust core with Python bindings.
– Supports BPE, WordPiece, Unigram (SentencePiece), Metaspace, and custom vocabularies.
– Broader multilingual and subword model support.
• Python-only Tokenizers (e.g. GPT-2 BPE in pure Python)
– Much slower, larger memory overhead, not suitable for high-throughput use.
2. Speed & Throughput
• tiktoken
– Benchmarks (OpenAI-internal) on a single CPU core: \~1–2 million tokens/second.
– Roughly 10–20× faster than pure-Python GPT-2 BPE implementations.
– Roughly 2–4× faster (or on par) with Hugging Face’s Rust tokenizers when using identical BPE models.
• Hugging Face Tokenizers
– In the same ballpark as tiktoken for a given BPE vocab (hundreds of thousands to a million tokens/sec).
– Slightly higher startup overhead when loading models, but offers more tokenization strategies.
• SentencePiece (C++) / Python bindings
– Generally slower than Rust-based (tiktoken, tokenizers) – on the order of 100–300 K tokens/sec.
3. Memory & Footprint
• tiktoken
– Tiny binary (\~1–2 MB) plus vocab files (\~50 MB).
– Low working memory; ideal for lightweight embedding or inference pipelines.
• Hugging Face Tokenizers
– Slightly larger binary (\~3–5 MB) plus model files.
– Offers on-disk memory-mapping for very large vocabularies.
• Python-only
– Larger RAM footprint during init; slower GC pauses.
4. Feature Set & Flexibility
• tiktoken
– “Batteries included” for OpenAI model vocabularies: GPT-2, Codex, GPT-3.5, GPT-4.
– Simple API: encode/decode, count tokens.
– No training or custom-vocab routines.
• Hugging Face Tokenizers
– Train new tokenizers (BPE, WordPiece, Unigram).
– Pre- and post-processing pipelines (normalization, special tokens).
– Easy integration with Transformers.
• Other libraries (NLTK, spaCy, jieba, etc.)
– Not directly comparable, since many perform linguistic tokenization, not subword BPE.
– Far slower for BPE-style byte-pair encoding.
5. When to Use Which
• tiktoken
– If you’re targeting OpenAI’s GPT-family models and need maximum raw throughput/count accuracy.
– You don’t need to train a new tokenizer or handle exotic language scripts.
• Hugging Face Tokenizers
– If you need broad language support, multiple subword algorithms, training tools, or tight HF Transformers integration.
• Python-only / Other
– Only if you have trivial performance needs or are experimenting in pure-Python teaching/demo settings.
Bottom line: for GPT-style BPE tokenization at scale, tiktoken is one of the fastest and most lightweight options—substantially faster than any pure-Python implementation and roughly on par (or a bit faster) than other Rust-backed libraries, at the cost of supporting only OpenAI’s pre-built vocabularies.
Tiktoken is the open-source tokenization library that OpenAI uses to convert between text and the integer “tokens” their models (GPT-3, GPT-4, etc.) actually consume. It implements byte-pair encoding (BPE) in Rust (with Python bindings) for maximum speed and exact compatibility with OpenAI’s APIs.
Key points:
1. Purpose
• Language models work on token IDs, not raw text.
• Tiktoken maps Unicode text ↔ token IDs using the same vocabularies and BPE merges that OpenAI’s models were trained on.
2. Performance
• Typically 3–6× faster than other BPE tokenizers (e.g. Hugging Face’s GPT2TokenizerFast).
• Handles gigabytes of text in seconds.
3. Installation
pip install tiktoken
4. Basic usage
```python
import tiktoken
# Get a specific encoding (vocabulary + merges)
enc = tiktoken.get\_encoding("cl100k\_base")
tokens = enc.encode("Hello, world!")
text = enc.decode(tokens)
assert text == "Hello, world!"
# Or auto-select by OpenAI model name
enc = tiktoken.encoding\_for\_model("gpt-4o") # e.g. returns cl100k\_base under the hood
```
5. Why BPE?
• Reversible and lossless
• Handles any text (even unseen words) by splitting into subword units
• Compresses common substrings (e.g. “ing”, “tion”) so the model sees familiar chunks
6. Extras
• Educational module (tiktoken.\_educational) to visualize or train simple BPEs
• Extension mechanism (tiktoken\_ext) to register custom encodings
7. Where to learn more
• GitHub: https://github.com/openai/tiktoken
• PyPI: https://pypi.org/project/tiktoken
• OpenAI Cookbook example: How to count tokens with tiktoken
In short, if you’re building or billing on token usage with OpenAI’s models, tiktoken is the official, fast, and exact way to go from text ↔ tokens.
Here are the two easiest ways to get the open-source tiktoken up and running:
1. Install the released package from PyPI
• (no Rust toolchain needed—prebuilt wheels for most platforms)
```bash
pip install tiktoken
```
Then in Python:
```python
import tiktoken
enc = tiktoken.get\_encoding("cl100k\_base")
print(enc.encode("Hello, world!"))
```
2. Install the bleeding-edge version straight from GitHub
• (you’ll need a Rust toolchain—on macOS `brew install rust`, on Ubuntu `sudo apt install cargo`)
```bash
pip install git+https://github.com/openai/tiktoken.git@main
```
Or, if you prefer to clone & develop locally:
```bash
git clone https://github.com/openai/tiktoken.git
cd tiktoken
pip install -e .
```
That’s it! Once installed, you can use `tiktoken.get\_encoding(...)` to load any of the supported tokenizers.
To get the exact tokenizer (BPE encoding) that an OpenAI model uses, you can use the open-source tiktoken library. It provides a helper that maps model names to their correct tokenizers:
1. Install tiktoken
```bash
pip install tiktoken
```
2. In Python, call encoding\_for\_model(model\_name):
```python
import tiktoken
#—for a gpt-3.5-turbo or gpt-4 style model:
enc = tiktoken.encoding\_for\_model("gpt-3.5-turbo")
print(enc.name) # e.g. "cl100k\_base"
print(enc.encode("Hello")) # list of token IDs
```
If you already know the encoding name (e.g. “cl100k\_base” for GPT-3.5/4 or “r50k\_base” for GPT-2), you can also do:
```python
enc = tiktoken.get\_encoding("cl100k\_base")
```
3. In Node.js / JavaScript, use the tiktoken npm package the same way:
```js
import { encoding\_for\_model } from "tiktoken";
const enc = await encoding\_for\_model("gpt-3.5-turbo");
console.log(enc.name); // "cl100k\_base"
console.log(enc.encode("Hi")); // array of token IDs
```
Under the hood encoding\_for\_model knows which BPE schema (“r50k\_base”, “cl100k\_base”, etc.) each OpenAI model uses and returns the right tokenizer instance.
Byte-Pair Encoding (BPE) has become the de-facto subword tokenization method in modern language models because it strikes a practical balance between fixed, closed vocabularies (word-level tokenizers) and open, but very long sequences (character-level tokenizers). In particular:
1. Open-vocabulary coverage
• Learns subword units from your corpus by iteratively merging the most frequent byte (or character) pairs.
• Can represent any new or rare word as a sequence of known subwords—no “unknown token” blowups.
2. Compact vocabulary size
• Vocabulary sizes on the order of 20K–100K tokens capture very common words as single tokens and rare or morphologically complex words as a few subwords.
• Keeps softmax layers and embedding tables manageable in size.
3. Reduced data sparsity
• Shares subwords among many words (e.g. “play,” “playing,” “replay”).
• Provides better statistical estimates (fewer zero‐count tokens) and faster convergence in training.
4. Morphological and cross-lingual adaptability
• Naturally splits on morpheme or syllable boundaries when those are frequent in the data.
• Can be trained on multilingual corpora to share subwords across related languages.
5. Speed and simplicity
• Linear-time, greedy encoding of new text (just look up merges).
• Deterministic and invertible: you can reconstruct the original byte sequence exactly.
In short, BPE tokenization gives you a small, fixed-size vocabulary that still generalizes to unseen words, reduces training and memory costs, and improves statistical efficiency—key ingredients for high-quality, scalable language models.`
```
## How can we improve?
If we add the phrase “Always use your tools since they are the way to get the right answer in this task.” to the system message of the o4-mini model, what do you think will happen? (try it out)
If you guessed that the model would now call to MCP tool everytime and get every answer correct, you are right!
In this notebook, we demonstrated a sample workflow for evaluating the ability of LLMs to answer technical questions about the `tiktoken` repository using the OpenAI Evals framework leveraging MCP tooling.
**Key points covered:**
* Defined a focused, custom dataset for evaluation.
* Configured LLM-based and Python-based graders for robust assessment.
* Compared two models (`gpt-4.1` and `o4-mini`) in a reproducible and transparent manner.
* Retrieved and displayed model outputs for automated/manual inspection.
**Next steps:**
* **Expand the dataset:** Add more diverse and challenging questions to better assess model capabilities.
* **Analyze results:** Summarize pass/fail rates, visualize performance, or perform error analysis to identify strengths and weaknesses.
* **Experiment with models/tools:** Try additional models, adjust tool configurations, or test on other repositories.
* **Automate reporting:** Generate summary tables or plots for easier sharing and decision-making.
For more information, check out the [OpenAI Evals documentation](https://platform.openai.com/docs/guides/evals).