Using Redis as a vector database with OpenAI
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
Feb 13, 2023
# Using Redis as a vector database with OpenAI
This recipe is archived and may reference outdated models or APIs.
[ SP ](https://github.com/Spartee)
[ Spartee ](https://github.com/Spartee)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/redis/getting-started-with-redis-and-openai.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/redis/getting-started-with-redis-and-openai.ipynb)
This notebook provides an introduction to using Redis as a vector database with OpenAI embeddings. Redis is a scalable, real-time database that can be used as a vector database when using the [RediSearch Module](https://oss.redislabs.com/redisearch/). The RediSearch module allows you to index and search for vectors in Redis. This notebook will show you how to use the RediSearch module to index and search for vectors created by using the OpenAI API and stored in Redis.
### What is Redis?
Most developers from a web services background are probably familiar with Redis. At it’s core, Redis is an open-source key-value store that can be used as a cache, message broker, and database. Developers choice Redis because it is fast, has a large ecosystem of client libraries, and has been deployed by major enterprises for years.
In addition to the traditional uses of Redis. Redis also provides [Redis Modules](https://redis.io/modules) which are a way to extend Redis with new data types and commands. Example modules include [RedisJSON](https://redis.io/docs/stack/json/), [RedisTimeSeries](https://redis.io/docs/stack/timeseries/), [RedisBloom](https://redis.io/docs/stack/bloom/) and [RediSearch](https://redis.io/docs/stack/search/).
### What is RediSearch?
RediSearch is a [Redis module](https://redis.io/modules) that provides querying, secondary indexing, full-text search and vector search for Redis. To use RediSearch, you first declare indexes on your Redis data. You can then use the RediSearch clients to query that data. For more information on the feature set of RediSearch, see the [README](./README.md) or the [RediSearch documentation](https://redis.io/docs/stack/search/).
### Deployment options
There are a number of ways to deploy Redis. For local development, the quickest method is to use the [Redis Stack docker container](https://hub.docker.com/r/redis/redis-stack) which we will use here. Redis Stack contains a number of Redis modules that can be used together to create a fast, multi-model data store and query engine.
For production use cases, The easiest way to get started is to use the [Redis Cloud](https://redislabs.com/redis-enterprise-cloud/overview/) service. Redis Cloud is a fully managed Redis service. You can also deploy Redis on your own infrastructure using [Redis Enterprise](https://redislabs.com/redis-enterprise/overview/). Redis Enterprise is a fully managed Redis service that can be deployed in kubernetes, on-premises or in the cloud.
Additionally, every major cloud provider ([AWS Marketplace](https://aws.amazon.com/marketplace/pp/prodview-e6y7ork67pjwg?sr=0-2&#x26;ref_=beagle&#x26;applicationId=AWSMPContessa), [Google Marketplace](https://console.cloud.google.com/marketplace/details/redislabs-public/redis-enterprise?pli=1), or [Azure Marketplace](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/garantiadata.redis_enterprise_1sp_public_preview?tab=Overview)) offers Redis Enterprise in a marketplace offering.
## Prerequisites
Before we start this project, we need to set up the following:
* start a Redis database with RediSearch (redis-stack)
* install libraries
* [Redis-py](https://github.com/redis/redis-py)
* get your [OpenAI API key](https://beta.openai.com/account/api-keys)
===========================================================
### Start Redis
To keep this example simple, we will use the Redis Stack docker container which we can start as follows
```
`$ docker-compose up -d`
```
This also includes the [RedisInsight](https://redis.com/redis-enterprise/redis-insight/) GUI for managing your Redis database which you can view at [http://localhost:8001](http://localhost:8001) once you start the docker container.
You’re all set up and ready to go! Next, we import and create our client for communicating with the Redis database we just created.
## Install Requirements
Redis-Py is the python client for communicating with Redis. We will use this to communicate with our Redis-stack database.
```
`! pip install redis wget pandas openai`
```
===========================================================
## Prepare your OpenAI API key
The `OpenAI API key` is used for vectorization of query data.
If you don’t have an OpenAI API key, you can get one from [https://beta.openai.com/account/api-keys](https://beta.openai.com/account/api-keys).
Once you get your key, please add it to your environment variables as `OPENAI\_API\_KEY` by using following command:
```
`! export OPENAI\_API\_KEY="your API key"`
```
```
`# Test that your OpenAI API key is correctly set as an environment variable
# Note. if you run this notebook locally, you will need to reload your terminal and the notebook for the env variables to be live.
import os
import openai
# Note. alternatively you can set a temporary env variable like this:
# os.environ["OPENAI\_API\_KEY"] = 'sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
if os.getenv("OPENAI\_API\_KEY") is not None:
openai.api\_key = os.getenv("OPENAI\_API\_KEY")
print ("OPENAI\_API\_KEY is ready")
else:
print ("OPENAI\_API\_KEY environment variable not found")`
```
```
`OPENAI\_API\_KEY is ready`
```
## Load data
In this section we’ll load embedded data that has already been converted into vectors. We’ll use this data to create an index in Redis and then search for similar vectors.
```
`import sys
import numpy as np
import pandas as pd
from typing import List
# use helper function in nbutils.py to download and read the data
# this should take from 5-10 min to run
if os.getcwd() not in sys.path:
sys.path.append(os.getcwd())
import nbutils
nbutils.download\_wikipedia\_data()
data = nbutils.read\_wikipedia\_data()
data.head()`
```
```
`File Downloaded`
```
||id|url|title|text|title\_vector|content\_vector|vector\_id|
|0|1|https://simple.wikipedia.org/wiki/April|April|April is the fourth month of the year in the J...|[0.001009464613161981, -0.020700545981526375, ...|[-0.011253940872848034, -0.013491976074874401,...|0|
|1|2|https://simple.wikipedia.org/wiki/August|August|August (Aug.) is the eighth month of the year ...|[0.0009286514250561595, 0.000820168002974242, ...|[0.0003609954728744924, 0.007262262050062418, ...|1|
|2|6|https://simple.wikipedia.org/wiki/Art|Art|Art is a creative activity that expresses imag...|[0.003393713850528002, 0.0061537534929811954, ...|[-0.004959689453244209, 0.015772193670272827, ...|2|
|3|8|https://simple.wikipedia.org/wiki/A|A|A or a is the first letter of the English alph...|[0.0153952119871974, -0.013759135268628597, 0....|[0.024894846603274345, -0.022186409682035446, ...|3|
|4|9|https://simple.wikipedia.org/wiki/Air|Air|Air refers to the Earth's atmosphere. Air is a...|[0.02224554680287838, -0.02044147066771984, -0...|[0.021524671465158463, 0.018522677943110466, -...|4|
## Connect to Redis
Now that we have our Redis database running, we can connect to it using the Redis-py client. We will use the default host and port for the Redis database which is `localhost:6379`.
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
## Creating a Search Index in Redis
The below cells will show how to specify and create a search index in Redis. We will:
1. Set some constants for defining our index like the distance metric and the index name
2. Define the index schema with RediSearch fields
3. Create the index
```
`# Constants
VECTOR\_DIM = len(data['title\_vector'][0]) # length of the vectors
VECTOR\_NUMBER = len(data) # initial number of vectors
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
Now that we have a search index, we can load documents into it. We will use the same documents we used in the previous examples. In Redis, either the HASH or JSON (if using RedisJSON in addition to RediSearch) data types can be used to store documents. We will use the HASH data type in this example. The below cells will show how to load documents into the index.
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
`index\_documents(redis\_client, PREFIX, data)
print(f"Loaded {redis\_client.info()['db0']['keys']} documents in Redis search index with name: {INDEX\_NAME}")`
```
```
`Loaded 25000 documents in Redis search index with name: embeddings-index`
```
## Simple Vector Search Queries with OpenAI Query Embeddings
Now that we have a search index and documents loaded into it, we can run search queries. Below we will provide a function that will run a search query and return the results. Using this function we run a few queries that will show how you can utilize Redis as a vector database.
```
`def search\_redis(
redis\_client: redis.Redis,
user\_query: str,
index\_name: str = "embeddings-index",
vector\_field: str = "title\_vector",
return\_fields: list = ["title", "url", "text", "vector\_score"],
hybrid\_fields = "\*",
k: int = 20,
print\_results: bool = True,
) -\> List[dict]:
# Creates embedding vector from user query
embedded\_query = openai.Embedding.create(input=user\_query,
model="text-embedding-3-small",
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
if print\_results:
for i, article in enumerate(results.docs):
score = 1 - float(article.vector\_score)
print(f"{i}. {article.title} (Score: {round(score ,3) })")
return results.docs`
```
```
`# For using OpenAI to generate query embedding
results = search\_redis(redis\_client, 'modern art in Europe', k=10)`
```
```
`0. Museum of Modern Art (Score: 0.875)
1. Western Europe (Score: 0.868)
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
return f'@{field\_name}:"{value}"'
# search the content vector for articles about famous battles in Scottish history and only include results with Scottish in the title
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
## HNSW Index
Up until now, we’ve been using the `FLAT` or “brute-force” index to run our queries. Redis also supports the `HNSW` index which is a fast, approximate index. The `HNSW` index is a graph-based index that uses a hierarchical navigable small world graph to store vectors. The `HNSW` index is a good choice for large datasets where you want to run approximate queries.
`HNSW` will take longer to build and consume more memory for most cases than `FLAT` but will be faster to run queries on, especially for large datasets.
The following cells will show how to create an `HNSW` index and run queries with it using the same data as before.
```
`# re-define RediSearch vector fields to use HNSW index
title\_embedding = VectorField("title\_vector",
"HNSW", {
"TYPE": "FLOAT32",
"DIM": VECTOR\_DIM,
"DISTANCE\_METRIC": DISTANCE\_METRIC,
"INITIAL\_CAP": VECTOR\_NUMBER
}
)
text\_embedding = VectorField("content\_vector",
"HNSW", {
"TYPE": "FLOAT32",
"DIM": VECTOR\_DIM,
"DISTANCE\_METRIC": DISTANCE\_METRIC,
"INITIAL\_CAP": VECTOR\_NUMBER
}
)
fields = [title, url, text, title\_embedding, text\_embedding]`
```
```
`import time
# Check if index exists
HNSW\_INDEX\_NAME = INDEX\_NAME+ "\_HNSW"
try:
redis\_client.ft(HNSW\_INDEX\_NAME).info()
print("Index already exists")
except:
# Create RediSearch Index
redis\_client.ft(HNSW\_INDEX\_NAME).create\_index(
fields = fields,
definition = IndexDefinition(prefix=[PREFIX], index\_type=IndexType.HASH)
)
# since RediSearch creates the index in the background for existing documents, we will wait until
# indexing is complete before running our queries. Although this is not necessary for the first query,
# some queries may take longer to run if the index is not fully built. In general, Redis will perform
# best when adding new documents to existing indices rather than new indices on existing documents.
while redis\_client.ft(HNSW\_INDEX\_NAME).info()["indexing"] == "1":
time.sleep(5)`
```
```
`results = search\_redis(redis\_client, 'modern art in Europe', index\_name=HNSW\_INDEX\_NAME, k=10)`
```
```
`0. Western Europe (Score: 0.868)
1. Northern Europe (Score: 0.855)
2. Central Europe (Score: 0.843)
3. European (Score: 0.841)
4. Eastern Europe (Score: 0.839)
5. Europe (Score: 0.839)
6. Western European Union (Score: 0.837)
7. Southern Europe (Score: 0.831)
8. Western civilization (Score: 0.83)
9. Council of Europe (Score: 0.827)`
```
```
`# compare the results of the HNSW index to the FLAT index and time both queries
def time\_queries(iterations: int = 10):
print(" ----- Flat Index ----- ")
t0 = time.time()
for i in range(iterations):
results\_flat = search\_redis(redis\_client, 'modern art in Europe', k=10, print\_results=False)
t0 = (time.time() - t0) / iterations
results\_flat = search\_redis(redis\_client, 'modern art in Europe', k=10, print\_results=True)
print(f"Flat index query time: {round(t0, 3)} seconds\\n")
time.sleep(1)
print(" ----- HNSW Index ------ ")
t1 = time.time()
for i in range(iterations):
results\_hnsw = search\_redis(redis\_client, 'modern art in Europe', index\_name=HNSW\_INDEX\_NAME, k=10, print\_results=False)
t1 = (time.time() - t1) / iterations
results\_hnsw = search\_redis(redis\_client, 'modern art in Europe', index\_name=HNSW\_INDEX\_NAME, k=10, print\_results=True)
print(f"HNSW index query time: {round(t1, 3)} seconds")
print(" ------------------------ ")
time\_queries()`
```
```
` ----- Flat Index -----
0. Museum of Modern Art (Score: 0.875)
1. Western Europe (Score: 0.867)
2. Renaissance art (Score: 0.864)
3. Pop art (Score: 0.861)
4. Northern Europe (Score: 0.855)
5. Hellenistic art (Score: 0.853)
6. Modernist literature (Score: 0.847)
7. Art film (Score: 0.843)
8. Central Europe (Score: 0.843)
9. Art (Score: 0.842)
Flat index query time: 0.263 seconds
----- HNSW Index ------
0. Western Europe (Score: 0.867)
1. Northern Europe (Score: 0.855)
2. Central Europe (Score: 0.843)
3. European (Score: 0.841)
4. Eastern Europe (Score: 0.839)
5. Europe (Score: 0.839)
6. Western European Union (Score: 0.837)
7. Southern Europe (Score: 0.831)
8. Western civilization (Score: 0.83)
9. Council of Europe (Score: 0.827)
HNSW index query time: 0.129 seconds
------------------------`
```