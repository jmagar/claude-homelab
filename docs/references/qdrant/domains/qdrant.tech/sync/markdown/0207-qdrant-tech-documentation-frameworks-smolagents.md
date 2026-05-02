SmolAgents - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Frameworks](https://qdrant.tech/documentation/frameworks/)
*
* SmolAgents# SmolAgents
HuggingFace [SmolAgents](https://github.com/huggingface/smolagents) is a Python library for building AI agents. These agents write Python code to call tools and orchestrate other agents.
It uses `CodeAgent`. An LLM engine that writes its actions in code. SmolAgents suggests that this approach is demonstrated to work better than the current industry practice of letting the LLM output a dictionary of the tools it wants to call: [uses 30% fewer steps](https://huggingface.co/papers/2402.01030) (thus 30% fewer LLM calls)
and [reaches higher performance on difficult benchmarks](https://huggingface.co/papers/2411.01747).
## Usage with Qdrant
We&rsquo;ll demonstrate how you can pair SmolAgents with Qdrant&rsquo;s retrieval by building a movie recommendation agent.
### Installation
```
`pip install smolagents qdrant-client fastembed
`
```
### Setup a Qdrant tool
We&rsquo;ll build a SmolAgents tool that can query a Qdrant collection. This tool will vectorise queries locally using [FastEmbed](https://github.com/qdrant/fastembed).
Initially, we&rsquo;ll be populating a Qdrant collection with information about 1000 movies from IMDb that we can search across.
```
`from fastembed import TextEmbedding
from qdrant\_client import QdrantClient
from smolagents import Tool
class QdrantQueryTool(Tool):
name = "qdrant\_query"
description = "Uses semantic search to retrieve movies from a Qdrant collection."
inputs = {
"query": {
"type": "string",
"description": "The query to perform. This should be semantically close to your target documents.",
}
}
output\_type = "string"
def \_\_init\_\_(self, \*\*kwargs):
super().\_\_init\_\_(\*\*kwargs)
self.collection\_name = "smolagents"
self.client = QdrantClient()
if not self.client.collection\_exists(self.collection\_name):
self.client.recover\_snapshot(
collection\_name=self.collection\_name,
location="https://snapshots.qdrant.io/imdb-1000-jina.snapshot",
)
self.embedder = TextEmbedding(model\_name="jinaai/jina-embeddings-v2-base-en")
def forward(self, query: str) -\> str:
points = self.client.query\_points(
self.collection\_name, query=next(self.embedder.query\_embed(query)), limit=5
).points
docs = "Retrieved documents:\\n" + "".join(
[
f"== Document {str(i)} ==\\n"
+ f"MOVIE TITLE: {point.payload['movie\_name']}\\n"
+ f"MOVIE SUMMARY: {point.payload['description']}\\n"
for i, point in enumerate(points)
]
)
return docs
`
```
### Define the agent
We can now set up `CodeAgent` to use our `QdrantQueryTool`.
```
`from smolagents import CodeAgent, InferenceClientModel, LogLevel
import os
# HuggingFace Access Token
# https://huggingface.co/docs/hub/en/security-tokens
os.environ["HF\_TOKEN"] = "----------"
agent = CodeAgent(
tools=[QdrantQueryTool()], model=InferenceClientModel(), max\_steps=4, verbosity\_level=LogLevel.DEBUG
)
`
```
Finally, we can run the agent with a user query.
```
`agent\_output = agent.run("Movie about people taking a strong action for justice")
print(agent\_output)
`
```
We should results similar to:
```
`[...truncated]
Out - Final answer: Jai Bhim
[Step 1: Duration 0.25 seconds| Input tokens: 4,497 | Output tokens: 134]
Jai Bhim
`
```
## Further Reading
* [SmolAgents Blog](https://huggingface.co/blog/smolagents#code-agents)
* [SmolAgents Source](https://github.com/huggingface/smolagents)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/smolagents.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/frameworks/smolagents/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/smolagents.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)