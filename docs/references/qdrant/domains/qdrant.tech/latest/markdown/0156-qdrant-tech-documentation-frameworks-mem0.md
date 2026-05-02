Mem0 - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Frameworks](https://qdrant.tech/documentation/frameworks/)
*
* Mem0
[Mem0](https://mem0.ai) is a self-improving memory layer for LLM applications, enabling personalized AI experiences that save costs and delight users. Mem0 remembers user preferences, adapts to individual needs, and continuously improves over time, ideal for chatbots and AI systems.
Mem0 supports various vector store providers, including Qdrant, for efficient data handling and search capabilities.
## Installation
To install Mem0 with Qdrant support, use the following command:
```
`pip install mem0ai
`
```
## Usage
Here&rsquo;s a basic example of how to use Mem0 with Qdrant:
```
`import os
from mem0 import Memory
os.environ["OPENAI\_API\_KEY"] = "sk-xx"
config = {
"vector\_store": {
"provider": "qdrant",
"config": {
"collection\_name": "test",
"host": "localhost",
"port": 6333,
}
}
}
m = Memory.from\_config(config)
m.add("Likes to play cricket on weekends", user\_id="alice", metadata={"category": "hobbies"})
`
```
## Configuration
When configuring Mem0 to use Qdrant as the vector store, you can specify [various parameters](https://docs.mem0.ai/components/vectordbs/dbs/qdrant#config) in the `config` dictionary.
## Advanced Usage
Mem0 provides additional functionality for managing and querying your vector data. Here are some examples:
```
`# Search memories
related\_memories = m.search(query="What are Alice's hobbies?", user\_id="alice")
# Update existing memory
result = m.update(memory\_id="m1", data="Likes to play tennis on weekends")
# Get memory history
history = m.history(memory\_id="m1")
`
```
## Further Reading
* [Mem0 GitHub Repository](https://github.com/mem0ai/mem0)
* [Mem0 integration with Qdrant](https://docs.mem0.ai/components/vectordbs/dbs/qdrant#qdrant)
* [Mem0 Documentation](https://docs.mem0.ai/)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/mem0.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/frameworks/mem0/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/mem0.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)