Using Redis for embeddings search
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
# Using Redis for embeddings search
[ CJ ](https://twitter.com/colintjarvis)
[ Colin Jarvis
(OpenAI)
](https://twitter.com/colintjarvis)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/redis/Using_Redis_for_embeddings_search.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/redis/Using_Redis_for_embeddings_search.ipynb)
This notebook takes you through a simple flow to download some data, embed it, and then index and search it using a selection of vector databases. This is a common requirement for customers who want to store and search our embeddings with their own data in a secure environment to support production use cases such as chatbots, topic modelling and more.
### What is a Vector Database
A vector database is a database made to store, manage and search embedding vectors. The use of embeddings to encode unstructured data (text, audio, video and more) as vectors for consumption by machine-learning models has exploded in recent years, due to the increasing effectiveness of AI in solving use cases involving natural language, image recognition and other unstructured forms of data. Vector databases have emerged as an effective solution for enterprises to deliver and scale these use cases.
### Why use a Vector Database
Vector databases enable enterprises to take many of the embeddings use cases we’ve shared in this repo (question and answering, chatbot and recommendation services, for example), and make use of them in a secure, scalable environment. Many of our customers make embeddings solve their problems at small scale but performance and security hold them back from going into production - we see vector databases as a key component in solving that, and in this guide we’ll walk through the basics of embedding text data, storing it in a vector database and using it for semantic search.
### Demo Flow
The demo flow is:
* **Setup**: Import packages and set any required variables
* **Load data**: Load a dataset and embed it using OpenAI embeddings
* **Redis**
* *Setup*: Set up the Redis-Py client. For more details go [here](https://github.com/redis/redis-py)
* *Index Data*: Create the search index for vector search and hybrid search (vector + full-text search) on all available fields.
* *Search Data*: Run a few example queries with various goals in mind.
Once you’ve run through this notebook you should have a basic understanding of how to setup and use vector databases, and can move on to more complex use cases making use of our embeddings.
## Setup
Import the required libraries and set the embedding model that we’d like to use.
```
`# We'll need to install the Redis client
!pip install redis
#Install wget to pull zip file
!pip install wget`
```
```
`import openai
from typing import List, Iterator
import pandas as pd
import numpy as np
import os
import wget
from ast import literal\_eval
# Redis client library for Python
import redis
# I've set this to our new embeddings model, this can be changed to the embedding model of your choice
EMBEDDING\_MODEL = "text-embedding-3-small"
# Ignore unclosed SSL socket warnings - optional in case you get these errors
import warnings
warnings.filterwarnings(action="ignore", message="unclosed", category=ResourceWarning)
warnings.filterwarnings("ignore", category=DeprecationWarning)`
```
## Load data
In this section we’ll load embedded data that we’ve prepared previous to this session.
```
`embeddings\_url = 'https://cdn.openai.com/API/examples/data/vector\_database\_wikipedia\_articles\_embedded.zip'
# The file is \~700 MB so this will take some time
wget.download(embeddings\_url)`
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
# Redis
The next vector database covered in this tutorial is **[Redis](https://redis.io)**. You most likely already know Redis. What you might not be aware of is the [RediSearch module](https://github.com/RediSearch/RediSearch). Enterprises have been using Redis with the RediSearch module for years now across all major cloud providers, Redis Cloud, and on premise. Recently, the Redis team added vector storage and search capability to this module in addition to the features RediSearch already had.
Given the large ecosystem around Redis, there are most likely client libraries in the language you need. You can use any standard Redis client library to run RediSearch commands, but it’s easiest to use a library that wraps the RediSearch API. Below are a few examples, but you can find more client libraries [here](https://redis.io/resources/clients/).
|Project|Language|License|Author|Stars|
|[jedis](https://github.com/redis/jedis)|Java|MIT|[Redis](https://redis.com)||
|[redis-py](https://github.com/redis/redis-py)|Python|MIT|[Redis](https://redis.com)||
|[node-redis](https://github.com/redis/node-redis)|Node.js|MIT|[Redis](https://redis.com)||
|[nredisstack](https://github.com/redis/nredisstack)|.NET|MIT|[Redis](https://redis.com)||
|[redisearch-go](https://github.com/RediSearch/redisearch-go)|Go|BSD|[Redis](https://redis.com)|[](https://github.com/RediSearch/redisearch-go)|
|[redisearch-api-rs](https://github.com/RediSearch/redisearch-api-rs)|Rust|BSD|[Redis](https://redis.com)|[](https://github.com/RediSearch/redisearch-api-rs)|
In the below cells, we will walk you through using Redis as a vector database. Since many of you are likely already used to the Redis API, this should be familiar to most.
## Setup
There are many ways to deploy Redis with RediSearch. The easiest way to get started is to use Docker, but there are are many potential options for deployment. For other deployment options, see the [redis directory](./redis) in this repo.
For this tutorial, we will use Redis Stack on Docker.
Start a version of Redis with RediSearch (Redis Stack) by running the following docker command
```
`$ cd redis
$ docker compose up -d`
```
This also includes the [RedisInsight](https://redis.com/redis-enterprise/redis-insight/) GUI for managing your Redis database which you can view at [http://localhost:8001](http://localhost:8001) once you start the docker container.
You’re all set up and ready to go! Next, we import and create our client for communicating with the Redis database we just created.
```
`import redis
from redis.commands.search.indexDefinition import (
IndexDefinition,
IndexType
)
from redis.commands.search.query import Query
from redis.commands.search.field import (
TextField,
VectorField
)
REDIS\_HOST = "localhost"
REDIS\_PORT = 6379
REDIS\_PASSWORD = "" # default for passwordless Redis
# Connect to Redis
redis\_client = redis.Redis(
host=REDIS\_HOST,
port=REDIS\_PORT,
password=REDIS\_PASSWORD
)
redis\_client.ping()`
```
```
`True`
```
## Creating a Search Index
The below cells will show how to specify and create a search index in Redis. We will
1. Set some constants for defining our index like the distance metric and the index name
2. Define the index schema with RediSearch fields
3. Create the index
```
`# Constants
VECTOR\_DIM = len(article\_df['title\_vector'][0]) # length of the vectors
VECTOR\_NUMBER = len(article\_df) # initial number of vectors
INDEX\_NAME = "embeddings-index" # name of the search index
PREFIX = "doc" # prefix for the document keys
DISTANCE\_METRIC = "COSINE" # distance metric for the vectors (ex. COSINE, IP, L2)`
```
```
`# Define RediSearch fields for each of the columns in the dataset
title = TextField(name="title")
url = TextField(name="url")
text = TextField(name="text")
title\_embedding = VectorField("title\_vector",
"FLAT", {
"TYPE": "FLOAT32",
"DIM": VECTOR\_DIM,
"DISTANCE\_METRIC": DISTANCE\_METRIC,
"INITIAL\_CAP": VECTOR\_NUMBER,
}
)
text\_embedding = VectorField("content\_vector",
"FLAT", {
"TYPE": "FLOAT32",
"DIM": VECTOR\_DIM,
"DISTANCE\_METRIC": DISTANCE\_METRIC,
"INITIAL\_CAP": VECTOR\_NUMBER,
}
)
fields = [title, url, text, title\_embedding, text\_embedding]`
```
```
`# Check if index exists
try:
redis\_client.ft(INDEX\_NAME).info()
print("Index already exists")
except:
# Create RediSearch Index
redis\_client.ft(INDEX\_NAME).create\_index(
fields = fields,
definition = IndexDefinition(prefix=[PREFIX], index\_type=IndexType.HASH)
)`
```
## Load Documents into the Index
Now that we have a search index, we can load documents into it. We will use the same documents we used in the previous examples. In Redis, either the Hash or JSON (if using RedisJSON in addition to RediSearch) data types can be used to store documents. We will use the HASH data type in this example. The below cells will show how to load documents into the index.
```
`def index\_documents(client: redis.Redis, prefix: str, documents: pd.DataFrame):
records = documents.to\_dict("records")
for doc in records:
key = f"{prefix}:{str(doc['id'])}"
# create byte vectors for title and content
title\_embedding = np.array(doc["title\_vector"], dtype=np.float32).tobytes()
content\_embedding = np.array(doc["content\_vector"], dtype=np.float32).tobytes()
# replace list of floats with byte vectors
doc["title\_vector"] = title\_embedding
doc["content\_vector"] = content\_embedding
client.hset(key, mapping = doc)`
```
```
`index\_documents(redis\_client, PREFIX, article\_df)
print(f"Loaded {redis\_client.info()['db0']['keys']} documents in Redis search index with name: {INDEX\_NAME}")`
```
```
`Loaded 25000 documents in Redis search index with name: embeddings-index`
```
## Running Search Queries
Now that we have a search index and documents loaded into it, we can run search queries. Below we will provide a function that will run a search query and return the results. Using this function we run a few queries that will show how you can utilize Redis as a vector database. Each example will demonstrate specific features to keep in mind when developing your search application with Redis.
1. **Return Fields**: You can specify which fields you want to return in the search results. This is useful if you only want to return a subset of the fields in your documents and doesn’t require a separate call to retrieve documents. In the below example, we will only return the `title` field in the search results.
2. **Hybrid Search**: You can combine vector search with any of the other RediSearch fields for hybrid search such as full text search, tag, geo, and numeric. In the below example, we will combine vector search with full text search.
```
`def search\_redis(
redis\_client: redis.Redis,
user\_query: str,
index\_name: str = "embeddings-index",
vector\_field: str = "title\_vector",
return\_fields: list = ["title", "url", "text", "vector\_score"],
hybrid\_fields = "\*",
k: int = 20,
) -\> List[dict]:
# Creates embedding vector from user query
embedded\_query = openai.Embedding.create(input=user\_query,
model=EMBEDDING\_MODEL,
)["data"][0]['embedding']
# Prepare the Query
base\_query = f'{hybrid\_fields}=\>[KNN {k} @{vector\_field} $vector AS vector\_score]'
query = (
Query(base\_query)
.return\_fields(\*return\_fields)
.sort\_by("vector\_score")
.paging(0, k)
.dialect(2)
)
params\_dict = {"vector": np.array(embedded\_query).astype(dtype=np.float32).tobytes()}
# perform vector search
results = redis\_client.ft(index\_name).search(query, params\_dict)
for i, article in enumerate(results.docs):
score = 1 - float(article.vector\_score)
print(f"{i}. {article.title} (Score: {round(score ,3) })")
return results.docs`
```
```
`# For using OpenAI to generate query embedding
openai.api\_key = os.getenv("OPENAI\_API\_KEY", "sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
results = search\_redis(redis\_client, 'modern art in Europe', k=10)`
```
```
`0. Museum of Modern Art (Score: 0.875)
1. Western Europe (Score: 0.867)
2. Renaissance art (Score: 0.864)
3. Pop art (Score: 0.86)
4. Northern Europe (Score: 0.855)
5. Hellenistic art (Score: 0.853)
6. Modernist literature (Score: 0.847)
7. Art film (Score: 0.843)
8. Central Europe (Score: 0.843)
9. European (Score: 0.841)`
```
```
`results = search\_redis(redis\_client, 'Famous battles in Scottish history', vector\_field='content\_vector', k=10)`
```
```
`0. Battle of Bannockburn (Score: 0.869)
1. Wars of Scottish Independence (Score: 0.861)
2. 1651 (Score: 0.853)
3. First War of Scottish Independence (Score: 0.85)
4. Robert I of Scotland (Score: 0.846)
5. 841 (Score: 0.844)
6. 1716 (Score: 0.844)
7. 1314 (Score: 0.837)
8. 1263 (Score: 0.836)
9. William Wallace (Score: 0.835)`
```
## Hybrid Queries with Redis
The previous examples showed how run vector search queries with RediSearch. In this section, we will show how to combine vector search with other RediSearch fields for hybrid search. In the below example, we will combine vector search with full text search.
```
`def create\_hybrid\_field(field\_name: str, value: str) -\> str:
return f'@{field\_name}:"{value}"'`
```
```
`# search the content vector for articles about famous battles in Scottish history and only include results with Scottish in the title
results = search\_redis(redis\_client,
"Famous battles in Scottish history",
vector\_field="title\_vector",
k=5,
hybrid\_fields=create\_hybrid\_field("title", "Scottish")
)`
```
```
`0. First War of Scottish Independence (Score: 0.892)
1. Wars of Scottish Independence (Score: 0.889)
2. Second War of Scottish Independence (Score: 0.879)
3. List of Scottish monarchs (Score: 0.873)
4. Scottish Borders (Score: 0.863)`
```
```
`# run a hybrid query for articles about Art in the title vector and only include results with the phrase "Leonardo da Vinci" in the text
results = search\_redis(redis\_client,
"Art",
vector\_field="title\_vector",
k=5,
hybrid\_fields=create\_hybrid\_field("text", "Leonardo da Vinci")
)
# find specific mention of Leonardo da Vinci in the text that our full-text-search query returned
mention = [sentence for sentence in results[0].text.split("\\n") if "Leonardo da Vinci" in sentence][0]
mention`
```
```
`0. Art (Score: 1.0)
1. Paint (Score: 0.896)
2. Renaissance art (Score: 0.88)
3. Painting (Score: 0.874)
4. Renaissance (Score: 0.846)`
```
```
`'In Europe, after the Middle Ages, there was a "Renaissance" which means "rebirth". People rediscovered science and artists were allowed to paint subjects other than religious subjects. People like Michelangelo and Leonardo da Vinci still painted religious pictures, but they also now could paint mythological pictures too. These artists also invented perspective where things in the distance look smaller in the picture. This was new because in the Middle Ages people would paint all the figures close up and just overlapping each other. These artists used nudity regularly in their art.'`
```
For more example with Redis as a vector database, see the README and examples within the `vector\_databases/redis` directory of this repository