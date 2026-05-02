FastEmbed & Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [FastEmbed](https://qdrant.tech/documentation/fastembed/)
*
* FastEmbed & Qdrant# Using FastEmbed with Qdrant for Vector Search
## Install Qdrant Client and FastEmbed
```
`pip install "qdrant-client[fastembed]\>=1.14.2"
`
```
## Initialize the client
Qdrant Client has a simple in-memory mode that lets you try semantic search locally.
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(":memory:") # Qdrant is running from RAM.
`
```
## Add data
Now you can add two sample documents, their associated metadata, and a point `id` for each.
```
`docs = [
"Qdrant has a LangChain integration for chatbots.",
"Qdrant has a LlamaIndex integration for agents.",
]
metadata = [
{"source": "langchain-docs"},
{"source": "llamaindex-docs"},
]
ids = [42, 2]
`
```
## Create a collection
Qdrant stores vectors and associated metadata in collections.
Collection requires vector parameters to be set during creation.
In this tutorial, we&rsquo;ll be using `BAAI/bge-small-en` to compute embeddings.
```
`model\_name = "BAAI/bge-small-en"
client.create\_collection(
collection\_name="test\_collection",
vectors\_config=models.VectorParams(
size=client.get\_embedding\_size(model\_name),
distance=models.Distance.COSINE
), # size and distance are model dependent
)
`
```
## Upsert documents to the collection
Qdrant client can do inference implicitly within its methods via FastEmbed integration.
It requires wrapping your data in models, like `models.Document` (or `models.Image` if you&rsquo;re working with images)
```
`metadata\_with\_docs = [
{"document": doc, "source": meta["source"]} for doc, meta in zip(docs, metadata)
]
client.upload\_collection(
collection\_name="test\_collection",
vectors=[models.Document(text=doc, model=model\_name) for doc in docs],
payload=metadata\_with\_docs,
ids=ids,
)
`
```
## Run vector search
Here, you will ask a dummy question that will allow you to retrieve a semantically relevant result.
```
`search\_result = client.query\_points(
collection\_name="test\_collection",
query=models.Document(
text="Which integration is best for agents?",
model=model\_name
)
).points
print(search\_result)
`
```
The semantic search engine will retrieve the most similar result in order of relevance. In this case, the second statement about LlamaIndex is more relevant.
```
`[
ScoredPoint(
id=2,
score=0.87491801319731,
payload={
"document": "Qdrant has a LlamaIndex integration for agents.",
"source": "llamaindex-docs",
},
...
),
ScoredPoint(
id=42,
score=0.8351846627714035,
payload={
"document": "Qdrant has a LangChain integration for chatbots.",
"source": "langchain-docs",
},
...
),
]
`
```
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/fastembed/fastembed-semantic-search.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/fastembed/fastembed-semantic-search/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/fastembed/fastembed-semantic-search.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)