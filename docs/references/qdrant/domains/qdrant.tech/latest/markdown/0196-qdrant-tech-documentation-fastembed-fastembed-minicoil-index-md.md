# Working with miniCOIL
# How to use miniCOIL, Qdrant's Sparse Neural Retriever
**miniCOIL** is an open-sourced sparse neural retrieval model that acts as if a BM25-based retriever understood the contextual meaning of keywords and ranked results accordingly.
**miniCOIL** scoring is based on the BM25 formula scaled by the semantic similarity between matched keywords in a query and a document.
$$
\text{miniCOIL}(D,Q) = \sum_{i=1}^{N} \text{IDF}(q_i) \cdot \text{Importance}^{q_i}_{D} \cdot {\color{YellowGreen}\text{Meaning}^{q_i \times d_j}} \text{, where keyword } d_j \in D \text{ equals } q_i
$$
A detailed breakdown of the idea behind miniCOIL can be found in the
["miniCOIL: on the road to Usable Sparse Neural Retrieval" article](https://qdrant.tech/articles/minicoil/) or, in a [recorded talk "miniCOIL: Sparse Neural Retrieval Done Right"](https://youtu.be/f1sBJMSgBXA?si=G3C5--UVRKAW5WJ0).
This tutorial will demonstrate how miniCOIL-based sparse neural retrieval performs compared to BM25-based lexical retrieval.
## When to use miniCOIL
When exact keyword matches in the retrieved results are a requirement, and all matches should be ranked based on the contextual meaning of keywords.
If results should be similar by meaning but are expressed differently, with no overlapping keywords, you should use dense embeddings or combine them with miniCOIL in a hybrid search setting.
## Setup
Install `qdrant-client` integration with `fastembed`.
```python
pip install "qdrant-client[fastembed]"
```
Then, initialize the Qdrant client. You could use for experiments [a free cluster](https://qdrant.tech/documentation/cloud-quickstart/#authenticate-via-sdks) in Qdrant Cloud or run a [local Qdrant instance via Docker](https://qdrant.tech/documentation/quickstart/#initialize-the-client).
We'll run our search on a list of book and article titles containing the keywords "*vector*" and "*search*" used in different contexts, to demonstrate how miniCOIL captures the meaning of these keywords as opposed to BM25.
A dataset
```python
documents = [
"Vector Graphics in Modern Web Design",
"The Art of Search and Self-Discovery",
"Efficient Vector Search Algorithms for Large Datasets",
"Searching the Soul: A Journey Through Mindfulness",
"Vector-Based Animations for User Interface Design",
"Search Engines: A Technical and Social Overview",
"The Rise of Vector Databases in AI Systems",
"Search Patterns in Human Behavior",
"Vector Illustrations: A Guide for Creatives",
"Search and Rescue: Technologies in Emergency Response",
"Vectors in Physics: From Arrows to Equations",
"Searching for Lost Time in the Digital Age",
"Vector Spaces and Linear Transformations",
"The Endless Search for Truth in Philosophy",
"3D Modeling with Vectors in Blender",
"Search Optimization Strategies for E-commerce",
"Vector Drawing Techniques with Open-Source Tools",
"In Search of Meaning: A Psychological Perspective",
"Advanced Vector Calculus for Engineers",
"Search Interfaces: UX Principles and Case Studies",
"The Use of Vector Fields in Meteorology",
"Search and Destroy: Cybersecurity in the 21st Century",
"From Bitmap to Vector: A Designer’s Guide",
"Search Engines and the Democratization of Knowledge",
"Vector Geometry in Game Development",
"The Human Search for Connection in a Digital World",
"AI-Powered Vector Search in Recommendation Systems",
"Searchable Archives: The History of Digital Retrieval",
"Vector Control Strategies in Public Health",
"The Search for Extraterrestrial Intelligence"
]
```
## Create Collection
Let's create a collection to store and index titles.
As miniCOIL was designed with Qdrant's ability to calculate the keywords Inverse Document Frequency (IDF) in mind, we need to configure miniCOIL sparse vectors with [IDF modifier](/documentation/manage-data/indexing/index.md#idf-modifier).
Don't forget to configure the IDF modifier to use miniCOIL sparse vectors in Qdrant!
```python
client.create_collection(
collection_name="{minicoil_collection_name}",
sparse_vectors_config={
"minicoil": models.SparseVectorParams(
modifier=models.Modifier.IDF #Inverse Document Frequency
)
}
)
```
Analogously, we configure a collection with BM25-based sparse vectors
```python
client.create\_collection(
collection\_name="{bm25\_collection\_name}",
sparse\_vectors\_config={
"bm25": models.SparseVectorParams(
modifier=models.Modifier.IDF
)
}
)
```
## Convert to Sparse Vectors & Upload to Qdrant
Next, we need to convert titles to miniCOIL sparse representations and upsert them into the configured collection.
Qdrant and FastEmbed integration allows for hiding the inference process under the hood.
That means:
- FastEmbed downloads the selected model from Hugging Face;
- FastEmbed runs local inference under the hood;
- Inferenced sparse representations are uploaded to Qdrant.
```python
#Estimating the average length of the documents in the corpus
avg_documents_length = sum(len(document.split()) for document in documents) / len(documents)
client.upsert(
collection_name="{minicoil_collection_name}",
points=[
models.PointStruct(
id=i,
payload={
"text": documents[i]
},
vector={
# Sparse miniCOIL vectors
"minicoil": models.Document(
text=documents[i],
model="Qdrant/minicoil-v1",
options={"avg_len": avg_documents_length}
#Average length of documents in the corpus
# (a part of the BM25 formula on which miniCOIL is built)
)
},
)
for i in range(len(documents))
],
)
```
Analogously, we convert & upsert BM25-based sparse vectors
```python
#Estimating the average length of the documents in the corpus
avg\_documents\_length = sum(len(document.split()) for document in documents) / len(documents)
client.upsert(
collection\_name="{bm25\_collection\_name}",
points=[
models.PointStruct(
id=i,
payload={
"text": documents[i]
},
vector={
# Sparse vector from BM25
"bm25": models.Document(
text=documents[i],
model="Qdrant/bm25",
options={"avg\_len": avg\_documents\_length}
#Average length of documents in the corpus
# (a part of the BM25 formula)
)
},
)
for i in range(len(documents))
],
)
```
## Retrieve with miniCOIL
Using query *"Vectors in Medicine"*, we'll demo the difference between miniCOIL and BM25-based retrieval.
None of the indexed titles contain the keyword *"medicine"*, so it won't contribute to the similarity score.
At the same time, the word *"vector"* appears once in many titles, and its role is roughly equal in all of them from the perspective of the BM25-based retriever.
miniCOIL, however, can capture the meaning of the keyword *"vector"* in the context of *"medicine"* and match a document where *"vector"* is used in a medicine-related context.
For BM25-based retrieval:
```python
query = "Vectors in Medicine"
client.query_points(
collection_name="{bm25_collection_name}",
query=models.Document(
text=query,
model="Qdrant/bm25"
),
using="bm25",
limit=1,
)
```
Result will be:
```bash
QueryResponse(
points=[
ScoredPoint(
id=18, version=1, score=0.8405092,
payload={
'title': 'Advanced Vector Calculus for Engineers'
},
vector=None, shard_key=None, order_value=None)
]
)
```
While for miniCOIL-based retrieval:
```python
query = "Vectors in Medicine"
client.query_points(
collection_name="{minicoil_collection_name}",
query=models.Document(
text=query,
model="Qdrant/minicoil-v1"
),
using="minicoil",
limit=1
)
```
We will get:
```bash
QueryResponse(
points=[
ScoredPoint(
id=28, version=1, score=0.7005557,
payload={
'title': 'Vector Control Strategies in Public Health'
},
vector=None, shard_key=None, order_value=None)
]
)
```