MixedBread - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Embeddings](https://qdrant.tech/documentation/embeddings/)
*
* MixedBread# Using MixedBread with Qdrant
MixedBread is a unique provider offering embeddings across multiple domains. Their models are versatile for various search tasks when integrated with Qdrant. MixedBread is creating state-of-the-art models and tools that make search smarter, faster, and more relevant. Whether you&rsquo;re building a next-gen search engine or RAG (Retrieval Augmented Generation) systems, or whether you&rsquo;re enhancing your existing search solution, they&rsquo;ve got the ingredients to make it happen.
## Installation
You can install the required package using the following pip command:
```
`pip install mixedbread
`
```
## Integration Example
Below is an example of how to obtain embeddings using MixedBread&rsquo;s API and store them in a Qdrant collection:
```
`import qdrant\_client
from qdrant\_client.models import Batch
from mixedbread import MixedBreadModel
# Initialize MixedBread model
model = MixedBreadModel("mixedbread-variant")
# Generate embeddings
text = "MixedBread provides versatile embeddings for various domains."
embeddings = model.embed(text)
# Initialize Qdrant client
qdrant\_client = qdrant\_client.QdrantClient(host="localhost", port=6333)
# Upsert the embedding into Qdrant
qdrant\_client.upsert(
collection\_name="VersatileEmbeddings",
points=Batch(
ids=[1],
vectors=[embeddings],
)
)
`
```
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/embeddings/mixedbread.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/embeddings/mixedbread/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/embeddings/mixedbread.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)