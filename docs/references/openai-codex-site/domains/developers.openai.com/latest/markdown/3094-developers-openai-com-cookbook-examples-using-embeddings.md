Using embeddings
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
Mar 10, 2022
# Using embeddings
This recipe is archived and may reference outdated models or APIs.
[ BO ](https://github.com/BorisPower)[ TS ](https://github.com/ted-at-openai)[ LO ](https://github.com/logankilpatrick)[ JB ](https://joebeutler.com)
[ BorisPower , ](https://github.com/BorisPower)[ Ted Sanders
(OpenAI)
, ](https://github.com/ted-at-openai)[ logankilpatrick , ](https://github.com/logankilpatrick)[ Joe Beutler
(OpenAI)
](https://joebeutler.com)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Using_embeddings.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Using_embeddings.ipynb)
## Using embeddings
This notebook contains some helpful snippets you can use to embed text with the `text-embedding-3-small` model via the OpenAI API.
```
`from openai import OpenAI
client = OpenAI()
embedding = client.embeddings.create(
input="Your text goes here", model="text-embedding-3-small"
).data[0].embedding
len(embedding)`
```
```
`1536`
```
It’s recommended to use the ‘tenacity’ package or another exponential backoff implementation to better manage API rate limits, as hitting the API too much too fast can trigger rate limits. Using the following function ensures you get your embeddings as fast as possible.
```
`# Negative example (slow and rate-limited)
from openai import OpenAI
client = OpenAI()
num\_embeddings = 10000 # Some large number
for i in range(num\_embeddings):
embedding = client.embeddings.create(
input="Your text goes here", model="text-embedding-3-small"
).data[0].embedding
print(len(embedding))`
```
```
`# Best practice
from tenacity import retry, wait\_random\_exponential, stop\_after\_attempt
from openai import OpenAI
client = OpenAI()
# Retry up to 6 times with exponential backoff, starting at 1 second and maxing out at 20 seconds delay
@retry(wait=wait\_random\_exponential(min=1, max=20), stop=stop\_after\_attempt(6))
def get\_embedding(text: str, model="text-embedding-3-small") -\> list[float]:
return client.embeddings.create(input=[text], model=model).data[0].embedding
embedding = get\_embedding("Your text goes here", model="text-embedding-3-small")
print(len(embedding))`
```
```
`1536`
```