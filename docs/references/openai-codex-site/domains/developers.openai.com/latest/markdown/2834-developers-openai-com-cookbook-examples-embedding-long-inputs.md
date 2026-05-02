Embedding texts that are longer than the model's maximum context length
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
Jan 18, 2023
# Embedding texts that are longer than the model's maximum context length
This recipe is archived and may reference outdated models or APIs.
[ FI ](https://github.com/filipeabperes)
[ filipeabperes ](https://github.com/filipeabperes)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Embedding_long_inputs.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Embedding_long_inputs.ipynb)
OpenAI’s embedding models cannot embed text that exceeds a maximum length. The maximum length varies by model, and is measured by *tokens*, not string length. If you are unfamiliar with tokenization, check out [How to count tokens with tiktoken](How_to_count_tokens_with_tiktoken.ipynb).
This notebook shows how to handle texts that are longer than a model’s maximum context length. We’ll demonstrate using embeddings from `text-embedding-3-small`, but the same ideas can be applied to other models and tasks. To learn more about embeddings, check out the [OpenAI Embeddings Guide](https://beta.openai.com/docs/guides/embeddings).
## 1. Model context length
First, we select the model and define a function to get embeddings from the API.
```
`from openai import OpenAI
import os
import openai
from tenacity import retry, wait\_random\_exponential, stop\_after\_attempt, retry\_if\_not\_exception\_type
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))
EMBEDDING\_MODEL = 'text-embedding-3-small'
EMBEDDING\_CTX\_LENGTH = 8191
EMBEDDING\_ENCODING = 'cl100k\_base'
# let's make sure to not retry on an invalid request, because that is what we want to demonstrate
@retry(wait=wait\_random\_exponential(min=1, max=20), stop=stop\_after\_attempt(6), retry=retry\_if\_not\_exception\_type(openai.BadRequestError))
def get\_embedding(text\_or\_tokens, model=EMBEDDING\_MODEL):
return client.embeddings.create(input=text\_or\_tokens, model=model).data[0].embedding`
```
The `text-embedding-3-small` model has a context length of 8191 tokens with the `cl100k\_base` encoding, and we can see that going over that limit causes an error.
```
`long\_text = 'AGI ' \* 5000
try:
get\_embedding(long\_text)
except openai.BadRequestError as e:
print(e)`
```
```
`Error code: 400 - {'error': {'message': "This model's maximum context length is 8192 tokens, however you requested 10001 tokens (10001 in your prompt; 0 for the completion). Please reduce your prompt; or completion length.", 'type': 'invalid\_request\_error', 'param': None, 'code': None}}`
```
Clearly we want to avoid these errors, particularly when handling programmatically with a large number of embeddings. Yet, we still might be faced with texts that are longer than the maximum context length. Below we describe and provide recipes for the main approaches to handling these longer texts: (1) simply truncating the text to the maximum allowed length, and (2) chunking the text and embedding each chunk individually.
## 1. Truncating the input text
The simplest solution is to truncate the input text to the maximum allowed length. Because the context length is measured in tokens, we have to first tokenize the text before truncating it. The API accepts inputs both in the form of text or tokens, so as long as you are careful that you are using the appropriate encoding, there is no need to convert the tokens back into string form. Below is an example of such a truncation function.
```
`import tiktoken
def truncate\_text\_tokens(text, encoding\_name=EMBEDDING\_ENCODING, max\_tokens=EMBEDDING\_CTX\_LENGTH):
"""Truncate a string to have `max\_tokens` according to the given encoding."""
encoding = tiktoken.get\_encoding(encoding\_name)
return encoding.encode(text)[:max\_tokens]`
```
Our example from before now works without error.
```
`truncated = truncate\_text\_tokens(long\_text)
len(get\_embedding(truncated))`
```
```
`1536`
```
## 2. Chunking the input text
Though truncation works, discarding potentially relevant text is a clear drawback. Another approach is to divide the input text into chunks and then embed each chunk individually. Then, we can either use the chunk embeddings separately, or combine them in some way, such as averaging (weighted by the size of each chunk).
We will take a function from [Python’s own cookbook](https://docs.python.org/3/library/itertools.html#itertools-recipes) that breaks up a sequence into chunks.
```
`from itertools import islice
def batched(iterable, n):
"""Batch data into tuples of length n. The last batch may be shorter."""
# batched('ABCDEFG', 3) --\> ABC DEF G
if n \< 1:
raise ValueError('n must be at least one')
it = iter(iterable)
while (batch := tuple(islice(it, n))):
yield batch`
```
Now we define a function that encodes a string into tokens and then breaks it up into chunks.
```
`def chunked\_tokens(text, encoding\_name, chunk\_length):
encoding = tiktoken.get\_encoding(encoding\_name)
tokens = encoding.encode(text)
chunks\_iterator = batched(tokens, chunk\_length)
yield from chunks\_iterator`
```
Finally, we can write a function that safely handles embedding requests, even when the input text is longer than the maximum context length, by chunking the input tokens and embedding each chunk individually. The `average` flag can be set to `True` to return the weighted average of the chunk embeddings, or `False` to simply return the unmodified list of chunk embeddings.
```
`import numpy as np
def len\_safe\_get\_embedding(text, model=EMBEDDING\_MODEL, max\_tokens=EMBEDDING\_CTX\_LENGTH, encoding\_name=EMBEDDING\_ENCODING, average=True):
chunk\_embeddings = []
chunk\_lens = []
for chunk in chunked\_tokens(text, encoding\_name=encoding\_name, chunk\_length=max\_tokens):
chunk\_embeddings.append(get\_embedding(chunk, model=model))
chunk\_lens.append(len(chunk))
if average:
chunk\_embeddings = np.average(chunk\_embeddings, axis=0, weights=chunk\_lens)
chunk\_embeddings = chunk\_embeddings / np.linalg.norm(chunk\_embeddings) # normalizes length to 1
chunk\_embeddings = chunk\_embeddings.tolist()
return chunk\_embeddings`
```
Once again, we can now handle long input texts.
```
`average\_embedding\_vector = len\_safe\_get\_embedding(long\_text, average=True)
chunks\_embedding\_vectors = len\_safe\_get\_embedding(long\_text, average=False)
print(f"Setting average=True gives us a single {len(average\_embedding\_vector)}-dimensional embedding vector for our long text.")
print(f"Setting average=False gives us {len(chunks\_embedding\_vectors)} embedding vectors, one for each of the chunks.")`
```
```
`Setting average=True gives us a single 1536-dimensional embedding vector for our long text.
Setting average=False gives us 2 embedding vectors, one for each of the chunks.`
```
In some cases, it may make sense to split chunks on paragraph boundaries or sentence boundaries to help preserve the meaning of the text.