LlamaIndex - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Frameworks](https://qdrant.tech/documentation/frameworks/)
*
* LlamaIndex# LlamaIndex
Llama Index acts as an interface between your external data and Large Language Models. So you can bring your
private data and augment LLMs with it. LlamaIndex simplifies data ingestion and indexing, integrating Qdrant as a vector index.
Installing Llama Index is straightforward if we use pip as a package manager. Qdrant is not installed by default, so we need to
install it separately. The integration of both tools also comes as another package.
```
`pip install llama-index llama-index-vector-stores-qdrant
`
```
Llama Index requires providing an instance of `QdrantClient`, so it can interact with Qdrant server.
```
`from llama\_index.core.indices.vector\_store.base import VectorStoreIndex
from llama\_index.vector\_stores.qdrant import QdrantVectorStore
import qdrant\_client
client = qdrant\_client.QdrantClient(
"\<qdrant-url\>",
api\_key="\<qdrant-api-key\>", # For Qdrant Cloud, None for local instance
)
vector\_store = QdrantVectorStore(client=client, collection\_name="documents")
index = VectorStoreIndex.from\_vector\_store(vector\_store=vector\_store)
`
```
## Further Reading
* [LlamaIndex Documentation](https://developers.llamaindex.ai/python/examples/vector_stores/qdrantindexdemo/)
* [Example Notebook](https://colab.research.google.com/github/run-llama/llama_index/blob/main/docs/examples/vector_stores/QdrantIndexDemo.ipynb)
* [Source Code](https://github.com/run-llama/llama_index/tree/main/llama-index-integrations/vector_stores/llama-index-vector-stores-qdrant)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/llama-index.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/frameworks/llama-index/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/llama-index.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)