Snowflake Models - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Embeddings](https://qdrant.tech/documentation/embeddings/)
*
* Snowflake Models# Snowflake
Qdrant supports working with [Snowflake](https://www.snowflake.com/blog/introducing-snowflake-arctic-embed-snowflakes-state-of-the-art-text-embedding-family-of-models/) text embedding models. You can find all the available models on [HuggingFace](https://huggingface.co/Snowflake).
### Setting up the Qdrant and Snowflake models
```
`from qdrant\_client import QdrantClient
from fastembed import TextEmbedding
qclient = QdrantClient(":memory:")
embedding\_model = TextEmbedding("snowflake/snowflake-arctic-embed-s")
texts = [
"Qdrant is the best vector search engine!",
"Loved by Enterprises and everyone building for low latency, high performance, and scale.",
]
`
```
```
`import {QdrantClient} from '@qdrant/js-client-rest';
import { pipeline } from '@xenova/transformers';
const client = new QdrantClient({ url: 'http://localhost:6333' });
const extractor = await pipeline('feature-extraction', 'Snowflake/snowflake-arctic-embed-s');
const texts = [
"Qdrant is the best vector search engine!",
"Loved by Enterprises and everyone building for low latency, high performance, and scale.",
]
`
```
The following example shows how to embed documents with the [`snowflake-arctic-embed-s`](https://huggingface.co/Snowflake/snowflake-arctic-embed-s) model that generates sentence embeddings of size 384.
### Embedding documents
```
`embeddings = embedding\_model.embed(texts)
`
```
```
`const embeddings = await extractor(texts, { normalize: true, pooling: 'cls' });
`
```
### Converting the model outputs to Qdrant points
```
`from qdrant\_client.models import PointStruct
points = [
PointStruct(
id=idx,
vector=embedding,
payload={"text": text},
)
for idx, (embedding, text) in enumerate(zip(embeddings, texts))
]
`
```
```
`let points = embeddings.tolist().map((embedding, i) =\> {
return {
id: i,
vector: embedding,
payload: {
text: texts[i]
}
}
});
`
```
### Creating a collection to insert the documents
```
`from qdrant\_client.models import VectorParams, Distance
COLLECTION\_NAME = "example\_collection"
qclient.create\_collection(
COLLECTION\_NAME,
vectors\_config=VectorParams(
size=384,
distance=Distance.COSINE,
),
)
qclient.upsert(COLLECTION\_NAME, points)
`
```
```
`const COLLECTION\_NAME = "example\_collection"
await client.createCollection(COLLECTION\_NAME, {
vectors: {
size: 384,
distance: 'Cosine',
}
});
await client.upsert(COLLECTION\_NAME, {
wait: true,
points
});
`
```
### Searching for documents with Qdrant
Once the documents are added, you can search for the most relevant documents.
```
`query\_embedding = next(embedding\_model.query\_embed("What is the best to use for vector search scaling?"))
qclient.search(
collection\_name=COLLECTION\_NAME,
query\_vector=query\_embedding,
)
`
```
```
`const query\_embedding = await extractor("What is the best to use for vector search scaling?", {
normalize: true,
pooling: 'cls'
});
await client.search(COLLECTION\_NAME, {
vector: query\_embedding.tolist()[0],
});
`
```
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/embeddings/snowflake.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/embeddings/snowflake/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/embeddings/snowflake.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)