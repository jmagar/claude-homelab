Using Qdrant for embeddings search
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ Home ](/cookbook)
### Topics
* [ Agents ](/cookbook/topic/agents)
* [ Evals ](/cookbook/topic/evals)
* [ Multimodal ](/cookbook/topic/multimodal)
* [ Text ](/cookbook/topic/text)
* [ Guardrails ](/cookbook/topic/guardrails)
* [ Optimization ](/cookbook/topic/optimization)
* [ ChatGPT ](/cookbook/topic/chatgpt)
* [ Codex ](/cookbook/topic/codex)
* [ gpt-oss ](/cookbook/topic/gpt-oss)
### Contribute
* [ Cookbook on GitHub ](https://github.com/openai/openai-cookbook)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Copy Page
Jun 28, 2023
# Using Qdrant for embeddings search
[ CJ ](https://twitter.com/colintjarvis)[ KA ](https://github.com/kacperlukawski)
[ Colin Jarvis
(OpenAI)
, ](https://twitter.com/colintjarvis)[ kacperlukawski ](https://github.com/kacperlukawski)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/qdrant/Using_Qdrant_for_embeddings_search.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/qdrant/Using_Qdrant_for_embeddings_search.ipynb)
This notebook takes you through a simple flow to download some data, embed it, and then index and search it using a selection of vector databases. This is a common requirement for customers who want to store and search our embeddings with their own data in a secure environment to support production use cases such as chatbots, topic modelling and more.
### What is a Vector Database
A vector database is a database made to store, manage and search embedding vectors. The use of embeddings to encode unstructured data (text, audio, video and more) as vectors for consumption by machine-learning models has exploded in recent years, due to the increasing effectiveness of AI in solving use cases involving natural language, image recognition and other unstructured forms of data. Vector databases have emerged as an effective solution for enterprises to deliver and scale these use cases.
### Why use a Vector Database
Vector databases enable enterprises to take many of the embeddings use cases we’ve shared in this repo (question and answering, chatbot and recommendation services, for example), and make use of them in a secure, scalable environment. Many of our customers make embeddings solve their problems at small scale but performance and security hold them back from going into production - we see vector databases as a key component in solving that, and in this guide we’ll walk through the basics of embedding text data, storing it in a vector database and using it for semantic search.
### Demo Flow
The demo flow is:
* **Setup**: Import packages and set any required variables
* **Load data**: Load a dataset and embed it using OpenAI embeddings
* **Qdrant**
* *Setup*: Here we’ll set up the Python client for Qdrant. For more details go [here](https://github.com/qdrant/qdrant_client)
* *Index Data*: We’ll create a collection with vectors for **titles** and **content**
* *Search Data*: We’ll run a few searches to confirm it works
Once you’ve run through this notebook you should have a basic understanding of how to setup and use vector databases, and can move on to more complex use cases making use of our embeddings.
## Setup
Import the required libraries and set the embedding model that we’d like to use.
```
`# We'll need to install Qdrant client
!pip install qdrant-client`
```
```
`import openai
import pandas as pd
from ast import literal\_eval
import qdrant\_client # Qdrant's client library for Python
# This can be changed to the embedding model of your choice. Make sure its the same model that is used for generating embeddings
EMBEDDING\_MODEL = "text-embedding-ada-002"
# Ignore unclosed SSL socket warnings - optional in case you get these errors
import warnings
warnings.filterwarnings(action="ignore", message="unclosed", category=ResourceWarning)
warnings.filterwarnings("ignore", category=DeprecationWarning)`
```
## Load data
In this section we’ll load embedded data that we’ve prepared previous to this session.
```
`import wget
embeddings\_url = "https://cdn.openai.com/API/examples/data/vector\_database\_wikipedia\_articles\_embedded.zip"
# The file is \~700 MB so this will take some time
wget.download(embeddings\_url)`
```
```
`100% [......................................................................] 698933052 / 698933052`
```
```
`'vector\_database\_wikipedia\_articles\_embedded (10).zip'`
```
```
`import zipfile
with zipfile.ZipFile("vector\_database\_wikipedia\_articles\_embedded.zip","r") as zip\_ref:
zip\_ref.extractall("../data")`
```
```
`article\_df = pd.read\_csv('../data/vector\_database\_wikipedia\_articles\_embedded.csv')`
```
```
`article\_df.head()`
```
||id|url|title|text|title\_vector|content\_vector|vector\_id|
|0|1|https://simple.wikipedia.org/wiki/April|April|April is the fourth month of the year in the J...|[0.001009464613161981, -0.020700545981526375, ...|[-0.011253940872848034, -0.013491976074874401,...|0|
|1|2|https://simple.wikipedia.org/wiki/August|August|August (Aug.) is the eighth month of the year ...|[0.0009286514250561595, 0.000820168002974242, ...|[0.0003609954728744924, 0.007262262050062418, ...|1|
|2|6|https://simple.wikipedia.org/wiki/Art|Art|Art is a creative activity that expresses imag...|[0.003393713850528002, 0.0061537534929811954, ...|[-0.004959689453244209, 0.015772193670272827, ...|2|
|3|8|https://simple.wikipedia.org/wiki/A|A|A or a is the first letter of the English alph...|[0.0153952119871974, -0.013759135268628597, 0....|[0.024894846603274345, -0.022186409682035446, ...|3|
|4|9|https://simple.wikipedia.org/wiki/Air|Air|Air refers to the Earth's atmosphere. Air is a...|[0.02224554680287838, -0.02044147066771984, -0...|[0.021524671465158463, 0.018522677943110466, -...|4|
```
`# Read vectors from strings back into a list
article\_df['title\_vector'] = article\_df.title\_vector.apply(literal\_eval)
article\_df['content\_vector'] = article\_df.content\_vector.apply(literal\_eval)
# Set vector\_id to be a string
article\_df['vector\_id'] = article\_df['vector\_id'].apply(str)`
```
```
`article\_df.info(show\_counts=True)`
```
```
`\<class 'pandas.core.frame.DataFrame'\>
RangeIndex: 25000 entries, 0 to 24999
Data columns (total 7 columns):
# Column Non-Null Count Dtype
--- ------ -------------- -----
0 id 25000 non-null int64
1 url 25000 non-null object
2 title 25000 non-null object
3 text 25000 non-null object
4 title\_vector 25000 non-null object
5 content\_vector 25000 non-null object
6 vector\_id 25000 non-null object
dtypes: int64(1), object(6)
memory usage: 1.3+ MB`
```
## Qdrant
**[Qdrant](https://qdrant.tech/)**. is a high-performant vector search database written in Rust. It offers both on-premise and cloud version, but for the purposes of that example we’re going to use the local deployment mode.
Setting everything up will require:
* Spinning up a local instance of Qdrant
* Configuring the collection and storing the data in it
* Trying out with some queries
### Setup
For the local deployment, we are going to use Docker, according to the Qdrant documentation: [https://qdrant.tech/documentation/quick\_start/](https://qdrant.tech/documentation/quick_start/). Qdrant requires just a single container, but an example of the docker-compose.yaml file is available at `./qdrant/docker-compose.yaml` in this repo.
You can start Qdrant instance locally by navigating to this directory and running `docker-compose up -d `
>
> You might need to increase the memory limit for Docker to 8GB or more. Or Qdrant might fail to execute with an error message like
`> 7 Killed
`> .
>
```
`! docker compose up -d`
```
```
`[1A[1B[0G[?25l[+] Running 1/0
[32m✔[0m Container qdrant-qdrant-1 [32mRunning[0m [34m0.0s [0m
[?25h`
```
```
`qdrant = qdrant\_client.QdrantClient(host="localhost", port=6333)`
```
```
`qdrant.get\_collections()`
```
```
`CollectionsResponse(collections=[CollectionDescription(name='Articles')])`
```
### Index data
Qdrant stores data in **collections** where each object is described by at least one vector and may contain an additional metadata called **payload**. Our collection will be called **Articles** and each object will be described by both **title** and **content** vectors.
We’ll be using an official [qdrant-client](https://github.com/qdrant/qdrant_client) package that has all the utility methods already built-in.
```
`from qdrant\_client.http import models as rest`
```
```
`# Get the vector size from the first row to set up the collection
vector\_size = len(article\_df['content\_vector'][0])
# Set up the collection with the vector configuration. You need to declare the vector size and distance metric for the collection. Distance metric enables vector database to index and search vectors efficiently.
qdrant.recreate\_collection(
collection\_name='Articles',
vectors\_config={
'title': rest.VectorParams(
distance=rest.Distance.COSINE,
size=vector\_size,
),
'content': rest.VectorParams(
distance=rest.Distance.COSINE,
size=vector\_size,
),
}
)`
```
```
`True`
```
```
`vector\_size = len(article\_df['content\_vector'][0])
qdrant.recreate\_collection(
collection\_name='Articles',
vectors\_config={
'title': rest.VectorParams(
distance=rest.Distance.COSINE,
size=vector\_size,
),
'content': rest.VectorParams(
distance=rest.Distance.COSINE,
size=vector\_size,
),
}
)`
```
```
`True`
```
In addition to the vector configuration defined under `vector`, we can also define the `payload` configuration. Payload is an optional field that allows you to store additional metadata alongside the vectors. In our case, we’ll store the `id`, `title`, and `url` of the articles. As we return the title of nearest articles in the search results from payload, we can also provide the user with the URL to the article (which is part of the meta-data).
```
`from qdrant\_client.models import PointStruct # Import the PointStruct to store the vector and payload
from tqdm import tqdm # Library to show the progress bar
# Populate collection with vectors using tqdm to show progress
for k, v in tqdm(article\_df.iterrows(), desc="Upserting articles", total=len(article\_df)):
try:
qdrant.upsert(
collection\_name='Articles',
points=[
PointStruct(
id=k,
vector={'title': v['title\_vector'],
'content': v['content\_vector']},
payload={
'id': v['id'],
'title': v['title'],
'url': v['url']
}
)
]
)
except Exception as e:
print(f"Failed to upsert row {k}: {v}")
print(f"Exception: {e}")`
```
```
`Upserting articles: 100%|█████████████████████████████████████████████████████████████████████████████████████| 25000/25000 [02:52\<00:00, 144.82it/s]`
```
```
`# Check the collection size to make sure all the points have been stored
qdrant.count(collection\_name='Articles')`
```
```
`CountResult(count=25000)`
```
### Search Data
Once the data is put into Qdrant we will start querying the collection for the closest vectors. We may provide an additional parameter `vector\_name` to switch from title to content based search. Ensure you use the text-embedding-ada-002 model as the original embeddings in file were created with this model.
```
`def query\_qdrant(query, collection\_name, vector\_name='title', top\_k=20):
# Creates embedding vector from user query
embedded\_query = openai.embeddings.create(
input=query,
model=EMBEDDING\_MODEL,
).data[0].embedding # We take the first embedding from the list
query\_results = qdrant.search(
collection\_name=collection\_name,
query\_vector=(
vector\_name, embedded\_query
),
limit=top\_k,
query\_filter=None
)
return query\_results`
```
```
`query\_results = query\_qdrant('modern art in Europe', 'Articles', 'title')
for i, article in enumerate(query\_results):
print(f'{i + 1}. {article.payload["title"]}, URL: {article.payload["url"]} (Score: {round(article.score, 3)})')`
```
```
`1. Museum of Modern Art, URL: https://simple.wikipedia.org/wiki/Museum%20of%20Modern%20Art (Score: 0.875)
2. Western Europe, URL: https://simple.wikipedia.org/wiki/Western%20Europe (Score: 0.867)
3. Renaissance art, URL: https://simple.wikipedia.org/wiki/Renaissance%20art (Score: 0.864)
4. Pop art, URL: https://simple.wikipedia.org/wiki/Pop%20art (Score: 0.86)
5. Northern Europe, URL: https://simple.wikipedia.org/wiki/Northern%20Europe (Score: 0.855)
6. Hellenistic art, URL: https://simple.wikipedia.org/wiki/Hellenistic%20art (Score: 0.853)
7. Modernist literature, URL: https://simple.wikipedia.org/wiki/Modernist%20literature (Score: 0.847)
8. Art film, URL: https://simple.wikipedia.org/wiki/Art%20film (Score: 0.843)
9. Central Europe, URL: https://simple.wikipedia.org/wiki/Central%20Europe (Score: 0.843)
10. European, URL: https://simple.wikipedia.org/wiki/European (Score: 0.841)
11. Art, URL: https://simple.wikipedia.org/wiki/Art (Score: 0.841)
12. Byzantine art, URL: https://simple.wikipedia.org/wiki/Byzantine%20art (Score: 0.841)
13. Postmodernism, URL: https://simple.wikipedia.org/wiki/Postmodernism (Score: 0.84)
14. Eastern Europe, URL: https://simple.wikipedia.org/wiki/Eastern%20Europe (Score: 0.839)
15. Cubism, URL: https://simple.wikipedia.org/wiki/Cubism (Score: 0.839)
16. Europe, URL: https://simple.wikipedia.org/wiki/Europe (Score: 0.839)
17. Impressionism, URL: https://simple.wikipedia.org/wiki/Impressionism (Score: 0.838)
18. Bauhaus, URL: https://simple.wikipedia.org/wiki/Bauhaus (Score: 0.838)
19. Surrealism, URL: https://simple.wikipedia.org/wiki/Surrealism (Score: 0.837)
20. Expressionism, URL: https://simple.wikipedia.org/wiki/Expressionism (Score: 0.837)`
```
```
`# This time we'll query using content vector
query\_results = query\_qdrant('Famous battles in Scottish history', 'Articles', 'content')
for i, article in enumerate(query\_results):
print(f'{i + 1}. {article.payload["title"]}, URL: {article.payload["url"]} (Score: {round(article.score, 3)})')`
```
```
`1. Battle of Bannockburn, URL: https://simple.wikipedia.org/wiki/Battle%20of%20Bannockburn (Score: 0.869)
2. Wars of Scottish Independence, URL: https://simple.wikipedia.org/wiki/Wars%20of%20Scottish%20Independence (Score: 0.861)
3. 1651, URL: https://simple.wikipedia.org/wiki/1651 (Score: 0.852)
4. First War of Scottish Independence, URL: https://simple.wikipedia.org/wiki/First%20War%20of%20Scottish%20Independence (Score: 0.85)
5. Robert I of Scotland, URL: https://simple.wikipedia.org/wiki/Robert%20I%20of%20Scotland (Score: 0.846)
6. 841, URL: https://simple.wikipedia.org/wiki/841 (Score: 0.844)
7. 1716, URL: https://simple.wikipedia.org/wiki/1716 (Score: 0.844)
8. 1314, URL: https://simple.wikipedia.org/wiki/1314 (Score: 0.837)
9. 1263, URL: https://simple.wikipedia.org/wiki/1263 (Score: 0.836)
10. William Wallace, URL: https://simple.wikipedia.org/wiki/William%20Wallace (Score: 0.835)
11. Stirling, URL: https://simple.wikipedia.org/wiki/Stirling (Score: 0.831)
12. 1306, URL: https://simple.wikipedia.org/wiki/1306 (Score: 0.831)
13. 1746, URL: https://simple.wikipedia.org/wiki/1746 (Score: 0.83)
14. 1040s, URL: https://simple.wikipedia.org/wiki/1040s (Score: 0.828)
15. 1106, URL: https://simple.wikipedia.org/wiki/1106 (Score: 0.827)
16. 1304, URL: https://simple.wikipedia.org/wiki/1304 (Score: 0.826)
17. David II of Scotland, URL: https://simple.wikipedia.org/wiki/David%20II%20of%20Scotland (Score: 0.825)
18. Braveheart, URL: https://simple.wikipedia.org/wiki/Braveheart (Score: 0.824)
19. 1124, URL: https://simple.wikipedia.org/wiki/1124 (Score: 0.824)
20. July 27, URL: https://simple.wikipedia.org/wiki/July%2027 (Score: 0.823)`
```