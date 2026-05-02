Nomic - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Embeddings](https://qdrant.tech/documentation/embeddings/)
*
* Nomic# Nomic
The `nomic-embed-text-v1` model is an open source [8192 context length](https://github.com/nomic-ai/contrastors) text encoder.
While you can find it on the [Hugging Face Hub](https://huggingface.co/nomic-ai/nomic-embed-text-v1),
you may find it easier to obtain them through the [Nomic Text Embeddings](https://docs.nomic.ai/reference/endpoints/nomic-embed-text).
Once installed, you can configure it with the official Python client, FastEmbed or through direct HTTP requests.
Using Nomic Embeddings via the Nomic API/SDK requires configuring the [Nomic API token](https://atlas.nomic.ai/cli-login).
You can use Nomic embeddings directly in Qdrant client calls. There is a difference in the way the embeddings
are obtained for documents and queries.
#### Upsert using [Nomic SDK](https://github.com/nomic-ai/nomic)
The `task\_type` parameter defines the embeddings that you get.
For documents, set the `task\_type` to `search\_document`:
```
`from qdrant\_client import QdrantClient, models
from nomic import embed
output = embed.text(
texts=["Qdrant is the best vector database!"],
model="nomic-embed-text-v1",
task\_type="search\_document",
)
client = QdrantClient()
client.upsert(
collection\_name="my-collection",
points=models.Batch(
ids=[1],
vectors=output["embeddings"],
),
)
`
```
#### Upsert using [FastEmbed](https://github.com/qdrant/fastembed)
```
`from fastembed import TextEmbedding
from client import QdrantClient, models
model = TextEmbedding("nomic-ai/nomic-embed-text-v1")
output = model.embed(["Qdrant is the best vector database!"])
client = QdrantClient()
client.upsert(
collection\_name="my-collection",
points=models.Batch(
ids=[1],
vectors=[embeddings.tolist() for embeddings in output],
),
)
`
```
#### Search using [Nomic SDK](https://github.com/nomic-ai/nomic)
To query the collection, set the `task\_type` to `search\_query`:
```
`output = embed.text(
texts=["What is the best vector database?"],
model="nomic-embed-text-v1",
task\_type="search\_query",
)
client.search(
collection\_name="my-collection",
query\_vector=output["embeddings"][0],
)
`
```
#### Search using [FastEmbed](https://github.com/qdrant/fastembed)
```
`output = next(model.embed("What is the best vector database?"))
client.search(
collection\_name="my-collection",
query\_vector=output.tolist(),
)
`
```
For more information, see the Nomic documentation on [Text embeddings](https://docs.nomic.ai/reference/endpoints/nomic-embed-text).
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/embeddings/nomic.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/embeddings/nomic/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/embeddings/nomic.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)