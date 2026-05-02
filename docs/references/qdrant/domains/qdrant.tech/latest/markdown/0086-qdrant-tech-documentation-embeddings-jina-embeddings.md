Jina Embeddings - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Embeddings](https://qdrant.tech/documentation/embeddings/)
*
* Jina Embeddings# Jina Embeddings
Qdrant is compatible with [Jina AI](https://jina.ai/) embeddings. You can get a free trial key from [Jina Embeddings](https://jina.ai/embeddings/) to get embeddings.
Qdrant users can receive a 10% discount on Jina AI APIs by using the code **QDRANT**.
## Technical Summary
|Model|Dimension|Language|MRL (matryoshka)|Context|
|**jina-embeddings-v4**|**2048 (single-vector), 128 (multi-vector)**|**Multilingual (30+)**|**Yes**|**32768 + Text/Image**|
|jina-clip-v2|1024|Multilingual (100+, focus on 30)|Yes|Text/Image|
|jina-embeddings-v3|1024|Multilingual (89 languages)|Yes|8192|
|jina-embeddings-v2-base-en|768|English|No|8192|
|jina-embeddings-v2-base-de|768|German & English|No|8192|
|jina-embeddings-v2-base-es|768|Spanish & English|No|8192|
|jina-embeddings-v2-base-zh|768|Chinese & English|No|8192|
> Jina recommends using
`> jina-embeddings-v4
`> for all tasks.
On top of the backbone, `jina-embeddings-v4` has been trained with 5 task-specific adapters for different embedding uses. Include `task` in your request to optimize your downstream application:
* **retrieval.query**: Used to encode user queries or questions in retrieval tasks.
* **retrieval.passage**: Used to encode large documents in retrieval tasks at indexing time.
* **code.query**: Used to encode user queries or questions in code related retrieval tasks.
* **code.passage**: Used to encode large documents in code related retrieval tasks at indexing time.
* **text-matching**: Used to encode text for similarity matching, such as measuring similarity between two sentences.
Similarly, `jina-embeddings-v3` has been trained with 5 task-specific adapters for different embedding uses. Include `task` in your request to optimize your downstream application:
* **retrieval.query**: Used to encode user queries or questions in retrieval tasks.
* **retrieval.passage**: Used to encode large documents in retrieval tasks at indexing time.
* **classification**: Used to encode text for text classification tasks.
* **text-matching**: Used to encode text for similarity matching, such as measuring similarity between two sentences.
* **separation**: Used for clustering or reranking tasks.
`jina-embeddings-v4`, `jina-embeddings-v3` and `jina-clip-v2` support **Matryoshka Representation Learning**, allowing users to control the embedding dimension with minimal performance loss.
Include `dimensions` in your request to select the desired dimension.
By default, **dimensions** is set to 2048 (`jina-embeddings-v4`) or 1024 (`jina-embeddings-v3` and `jina-clip-v2`), and a number between 256 and 2048 is recommended.
You can reference the table below for hints on dimension vs. performance for the `jina-embeddings-v3` model. Similar results hold for the others.
|Dimension|32|64|128|256|512|768|1024|
|Average Retrieval Performance (nDCG@10)|52.54|58.54|61.64|62.72|63.16|63.3|63.35|
`jina-embeddings-v4` and `jina-embeddings-v3` supports [Late Chunking](https://jina.ai/news/late-chunking-in-long-context-embedding-models/), the technique to leverage the model&rsquo;s long-context capabilities for generating contextual chunk embeddings. Include `late\_chunking=True` in your request to enable contextual chunked representation. When set to true, Jina AI API will concatenate all sentences in the input field and feed them as a single string to the model. Internally, the model embeds this long concatenated string and then performs late chunking, returning a list of embeddings that matches the size of the input list.
## Example
### Text-to-Text Retrieval
The code below demonstrates how to use `jina-embeddings-v4` with Qdrant:
```
`import requests
import qdrant\_client
from qdrant\_client.models import Distance, VectorParams, Batch
# Provide Jina API key and choose one of the available models.
JINA\_API\_KEY = "jina\_xxxxxxxxxxx"
MODEL = "jina-embeddings-v4"
DIMENSIONS = 2048 # Or choose your desired output vector dimensionality.
TASK = 'retrieval.passage' # For indexing, or set to retrieval.query for querying
# Get embeddings from the API
url = "https://api.jina.ai/v1/embeddings"
headers = {
"Content-Type": "application/json",
"Authorization": f"Bearer {JINA\_API\_KEY}",
}
data = {
"input": ["Your text string goes here", "You can send multiple texts"],
"model": MODEL,
"dimensions": DIMENSIONS,
"task": TASK,
"late\_chunking": True,
}
response = requests.post(url, headers=headers, json=data)
embeddings = [d["embedding"] for d in response.json()["data"]]
# Index the embeddings into Qdrant
client = qdrant\_client.QdrantClient(":memory:")
client.create\_collection(
collection\_name="MyCollection",
vectors\_config=VectorParams(size= DIMENSIONS, distance=Distance.DOT),
)
qdrant\_client.upsert(
collection\_name="MyCollection",
points=Batch(
ids=list(range(len(embeddings))),
vectors=embeddings,
),
)
`
```
### Text-to-Image Retrieval
The code below demonstrates how to use `jina-embeddings-v4` with Qdrant:
```
`import requests
from qdrant\_client import QdrantClient
from qdrant\_client.models import Distance, VectorParams, PointStruct
# Provide your Jina API key and choose the model.
JINA\_API\_KEY = "jina\_xxxxxxxxxxx"
MODEL = "jina-embeddings-v4"
DIMENSIONS = 2048 # Set the desired output vector dimensionality.
# Define the inputs
text\_input = "A blue cat"
image\_url = "https://i.pinimg.com/600x315/21/48/7e/21487e8e0970dd366dafaed6ab25d8d8.jpg"
# Get embeddings from the Jina API
url = "https://api.jina.ai/v1/embeddings"
headers = {
"Content-Type": "application/json",
"Authorization": f"Bearer {JINA\_API\_KEY}",
}
data = {
"input": [
{"text": text\_input},
{"image": image\_url},
],
"model": MODEL,
"dimensions": DIMENSIONS,
}
response = requests.post(url, headers=headers, json=data)
response\_data = response.json()["data"]
# The model doesn't differentiate between images and text, so we extract output based on the input order.
text\_embedding = response\_data[0]["embedding"]
image\_embedding = response\_data[1]["embedding"]
# Initialize Qdrant client
client = QdrantClient(url="http://localhost:6333/")
# Create a collection with named vectors
collection\_name = "MyCollection"
client.recreate\_collection(
collection\_name=collection\_name,
vectors\_config={
"text\_vector": VectorParams(size=DIMENSIONS, distance=Distance.DOT),
"image\_vector": VectorParams(size=DIMENSIONS, distance=Distance.DOT),
},
)
client.upsert(
collection\_name=collection\_name,
points=[
PointStruct(
id=0,
vector={
"text\_vector": text\_embedding,
"image\_vector": image\_embedding,
}
)
],
)
# Now let's query the collection
search\_query = "A purple cat"
# Get the embedding for the search query from the Jina API
url = "https://api.jina.ai/v1/embeddings"
headers = {
"Content-Type": "application/json",
"Authorization": f"Bearer {JINA\_API\_KEY}",
}
data = {
"input": [{"text": search\_query}],
"model": MODEL,
"dimensions": DIMENSIONS,
# "task": "retrieval.query" # Uncomment this line for text-to-text retrieval tasks
}
response = requests.post(url, headers=headers, json=data)
query\_embedding = response.json()["data"][0]["embedding"]
search\_results = client.query\_points(
collection\_name=collection\_name,
query=query\_embedding,
using="image\_vector",
limit=5
).points
for result in search\_results:
print(f"ID: {result.id}, Score: {result.score}")
`
```
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/embeddings/jina-embeddings.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/embeddings/jina-embeddings/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/embeddings/jina-embeddings.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)