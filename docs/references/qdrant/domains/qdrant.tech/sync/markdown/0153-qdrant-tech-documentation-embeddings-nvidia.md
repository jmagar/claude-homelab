Nvidia - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Embeddings](https://qdrant.tech/documentation/embeddings/)
*
* Nvidia# Nvidia
Qdrant supports working with [Nvidia embeddings](https://build.nvidia.com/explore/retrieval).
You can generate an API key to authenticate the requests from the [Nvidia Playground](https://build.nvidia.com/nvidia/embed-qa-4).
### Setting up the Qdrant client and Nvidia session
```
`import requests
from qdrant\_client import QdrantClient
NVIDIA\_BASE\_URL = "https://ai.api.nvidia.com/v1/retrieval/nvidia/embeddings"
NVIDIA\_API\_KEY = "\<YOUR\_API\_KEY\>"
nvidia\_session = requests.Session()
client = QdrantClient(":memory:")
headers = {
"Authorization": f"Bearer {NVIDIA\_API\_KEY}",
"Accept": "application/json",
}
texts = [
"Qdrant is the best vector search engine!",
"Loved by Enterprises and everyone building for low latency, high performance, and scale.",
]
`
```
```
`import { QdrantClient } from '@qdrant/js-client-rest';
const NVIDIA\_BASE\_URL = "https://ai.api.nvidia.com/v1/retrieval/nvidia/embeddings"
const NVIDIA\_API\_KEY = "\<YOUR\_API\_KEY\>"
const client = new QdrantClient({ url: 'http://localhost:6333' });
const headers = {
"Authorization": "Bearer " + NVIDIA\_API\_KEY,
"Accept": "application/json",
"Content-Type": "application/json"
}
const texts = [
"Qdrant is the best vector search engine!",
"Loved by Enterprises and everyone building for low latency, high performance, and scale.",
]
`
```
The following example shows how to embed documents with the `embed-qa-4` model that generates sentence embeddings of size 1024.
### Embedding documents
```
`payload = {
"input": texts,
"input\_type": "passage",
"model": "NV-Embed-QA",
}
response\_body = nvidia\_session.post(
NVIDIA\_BASE\_URL, headers=headers, json=payload
).json()
`
```
```
`let body = {
"input": texts,
"input\_type": "passage",
"model": "NV-Embed-QA"
}
let response = await fetch(NVIDIA\_BASE\_URL, {
method: "POST",
body: JSON.stringify(body),
headers
});
let response\_body = await response.json()
`
```
### Converting the model outputs to Qdrant points
```
`from qdrant\_client.models import PointStruct
points = [
PointStruct(
id=idx,
vector=data["embedding"],
payload={"text": text},
)
for idx, (data, text) in enumerate(zip(response\_body["data"], texts))
]
`
```
```
`let points = response\_body.data.map((data, i) =\> {
return {
id: i,
vector: data.embedding,
payload: {
text: texts[i]
}
}
})
`
```
### Creating a collection to insert the documents
```
`from qdrant\_client.models import VectorParams, Distance
collection\_name = "example\_collection"
client.create\_collection(
collection\_name,
vectors\_config=VectorParams(
size=1024,
distance=Distance.COSINE,
),
)
client.upsert(collection\_name, points)
`
```
```
`const COLLECTION\_NAME = "example\_collection"
await client.createCollection(COLLECTION\_NAME, {
vectors: {
size: 1024,
distance: 'Cosine',
}
});
await client.upsert(COLLECTION\_NAME, {
wait: true,
points
})
`
```
## Searching for documents with Qdrant
Once the documents are added, you can search for the most relevant documents.
```
`payload = {
"input": "What is the best to use for vector search scaling?",
"input\_type": "query",
"model": "NV-Embed-QA",
}
response\_body = nvidia\_session.post(
NVIDIA\_BASE\_URL, headers=headers, json=payload
).json()
client.search(
collection\_name=collection\_name,
query\_vector=response\_body["data"][0]["embedding"],
)
`
```
```
`body = {
"input": "What is the best to use for vector search scaling?",
"input\_type": "query",
"model": "NV-Embed-QA",
}
response = await fetch(NVIDIA\_BASE\_URL, {
method: "POST",
body: JSON.stringify(body),
headers
});
response\_body = await response.json()
await client.search(COLLECTION\_NAME, {
vector: response\_body.data[0].embedding,
});
`
```
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/embeddings/nvidia.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/embeddings/nvidia/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/embeddings/nvidia.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)