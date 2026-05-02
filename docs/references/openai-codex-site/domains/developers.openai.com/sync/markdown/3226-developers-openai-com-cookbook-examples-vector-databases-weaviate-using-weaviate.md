Using Weaviate for embeddings search
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
# Using Weaviate for embeddings search
[ CJ ](https://twitter.com/colintjarvis)
[ Colin Jarvis
(OpenAI)
](https://twitter.com/colintjarvis)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/weaviate/Using_Weaviate_for_embeddings_search.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/weaviate/Using_Weaviate_for_embeddings_search.ipynb)
This notebook takes you through a simple flow to download some data, embed it, and then index and search it using a selection of vector databases. This is a common requirement for customers who want to store and search our embeddings with their own data in a secure environment to support production use cases such as chatbots, topic modelling and more.
### What is a Vector Database
A vector database is a database made to store, manage and search embedding vectors. The use of embeddings to encode unstructured data (text, audio, video and more) as vectors for consumption by machine-learning models has exploded in recent years, due to the increasing effectiveness of AI in solving use cases involving natural language, image recognition and other unstructured forms of data. Vector databases have emerged as an effective solution for enterprises to deliver and scale these use cases.
### Why use a Vector Database
Vector databases enable enterprises to take many of the embeddings use cases we’ve shared in this repo (question and answering, chatbot and recommendation services, for example), and make use of them in a secure, scalable environment. Many of our customers make embeddings solve their problems at small scale but performance and security hold them back from going into production - we see vector databases as a key component in solving that, and in this guide we’ll walk through the basics of embedding text data, storing it in a vector database and using it for semantic search.
### Demo Flow
The demo flow is:
* **Setup**: Import packages and set any required variables
* **Load data**: Load a dataset and embed it using OpenAI embeddings
* **Weaviate**
* *Setup*: Here we’ll set up the Python client for Weaviate. For more details go [here](https://weaviate.io/developers/weaviate/current/client-libraries/python.html)
* *Index Data*: We’ll create an index with **title** search vectors in it
* *Search Data*: We’ll run a few searches to confirm it works
Once you’ve run through this notebook you should have a basic understanding of how to setup and use vector databases, and can move on to more complex use cases making use of our embeddings.
## Setup
Import the required libraries and set the embedding model that we’d like to use.
```
`# We'll need to install the Weaviate client
!pip install weaviate-client
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
# Weaviate's client library for Python
import weaviate
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
## Weaviate
Another vector database option we’ll explore is **Weaviate**, which offers both a managed, [SaaS](https://console.weaviate.io/) option, as well as a self-hosted [open source](https://github.com/weaviate/weaviate) option. As we’ve already looked at a cloud vector database, we’ll try the self-hosted option here.
For this we will:
* Set up a local deployment of Weaviate
* Create indices in Weaviate
* Store our data there
* Fire some similarity search queries
* Try a real use case
### Bring your own vectors approach
In this cookbook, we provide the data with already generated vectors. This is a good approach for scenarios, where your data is already vectorized.
### Automated vectorization with OpenAI module
For scenarios, where your data is not vectorized yet, you can delegate the vectorization task with OpenAI to Weaviate.
Weaviate offers a built-in module [text2vec-openai](https://weaviate.io/developers/weaviate/modules/retriever-vectorizer-modules/text2vec-openai), which takes care of the vectorization for you at:
* import
* for any CRUD operations
* for semantic search
Check out the [Getting Started with Weaviate and OpenAI module cookbook](./weaviate/getting-started-with-weaviate-and-openai.ipynb) to learn step by step how to import and vectorize data in one step.
### Setup
To run Weaviate locally, you’ll need [Docker](https://www.docker.com/). Following the instructions contained in the Weaviate documentation [here](https://weaviate.io/developers/weaviate/installation/docker-compose), we created an example docker-compose.yml file in this repo saved at [./weaviate/docker-compose.yml](./weaviate/docker-compose.yml).
After starting Docker, you can start Weaviate locally by navigating to the `examples/vector\_databases/weaviate/` directory and running `docker-compose up -d`.
#### SaaS
Alternatively you can use [Weaviate Cloud Service](https://console.weaviate.io/) (WCS) to create a free Weaviate cluster.
1. create a free account and/or login to [WCS](https://console.weaviate.io/)
2. create a `Weaviate Cluster` with the following settings:
* Sandbox: `Sandbox Free`
* Weaviate Version: Use default (latest)
* OIDC Authentication: `Disabled`
* your instance should be ready in a minute or two
* make a note of the `Cluster Id`. The link will take you to the full path of your cluster (you will need it later to connect to it). It should be something like: `https://your-project-name-suffix.weaviate.network`
```
`# Option #1 - Self-hosted - Weaviate Open Source
client = weaviate.Client(
url="http://localhost:8080",
additional\_headers={
"X-OpenAI-Api-Key": os.getenv("OPENAI\_API\_KEY")
}
)`
```
```
`# Option #2 - SaaS - (Weaviate Cloud Service)
client = weaviate.Client(
url="https://your-wcs-instance-name.weaviate.network",
additional\_headers={
"X-OpenAI-Api-Key": os.getenv("OPENAI\_API\_KEY")
}
)`
```
```
`client.is\_ready()`
```
### Index data
In Weaviate you create **schemas** to capture each of the entities you will be searching.
In this case we’ll create a schema called **Article** with the **title** vector from above included for us to search by.
The next few steps closely follow the documentation Weaviate provides [here](https://weaviate.io/developers/weaviate/quickstart).
```
`# Clear up the schema, so that we can recreate it
client.schema.delete\_all()
client.schema.get()
# Define the Schema object to use `text-embedding-3-small` on `title` and `content`, but skip it for `url`
article\_schema = {
"class": "Article",
"description": "A collection of articles",
"vectorizer": "text2vec-openai",
"moduleConfig": {
"text2vec-openai": {
"model": "ada",
"modelVersion": "002",
"type": "text"
}
},
"properties": [{
"name": "title",
"description": "Title of the article",
"dataType": ["string"]
},
{
"name": "content",
"description": "Contents of the article",
"dataType": ["text"],
"moduleConfig": { "text2vec-openai": { "skip": True } }
}]
}
# add the Article schema
client.schema.create\_class(article\_schema)
# get the schema to make sure it worked
client.schema.get()`
```
```
`{'classes': [{'class': 'Article',
'description': 'A collection of articles',
'invertedIndexConfig': {'bm25': {'b': 0.75, 'k1': 1.2},
'cleanupIntervalSeconds': 60,
'stopwords': {'additions': None, 'preset': 'en', 'removals': None}},
'moduleConfig': {'text2vec-openai': {'model': 'ada',
'modelVersion': '002',
'type': 'text',
'vectorizeClassName': True}},
'properties': [{'dataType': ['string'],
'description': 'Title of the article',
'moduleConfig': {'text2vec-openai': {'skip': False,
'vectorizePropertyName': False}},
'name': 'title',
'tokenization': 'word'},
{'dataType': ['text'],
'description': 'Contents of the article',
'moduleConfig': {'text2vec-openai': {'skip': True,
'vectorizePropertyName': False}},
'name': 'content',
'tokenization': 'word'}],
'replicationConfig': {'factor': 1},
'shardingConfig': {'virtualPerPhysical': 128,
'desiredCount': 1,
'actualCount': 1,
'desiredVirtualCount': 128,
'actualVirtualCount': 128,
'key': '\_id',
'strategy': 'hash',
'function': 'murmur3'},
'vectorIndexConfig': {'skip': False,
'cleanupIntervalSeconds': 300,
'maxConnections': 64,
'efConstruction': 128,
'ef': -1,
'dynamicEfMin': 100,
'dynamicEfMax': 500,
'dynamicEfFactor': 8,
'vectorCacheMaxObjects': 1000000000000,
'flatSearchCutoff': 40000,
'distance': 'cosine'},
'vectorIndexType': 'hnsw',
'vectorizer': 'text2vec-openai'}]}`
```
```
`### Step 1 - configure Weaviate Batch, which optimizes CRUD operations in bulk
# - starting batch size of 100
# - dynamically increase/decrease based on performance
# - add timeout retries if something goes wrong
client.batch.configure(
batch\_size=100,
dynamic=True,
timeout\_retries=3,
)`
```
```
`\<weaviate.batch.crud\_batch.Batch at 0x3f0ca0fa0\>`
```
```
`### Step 2 - import data
print("Uploading data with vectors to Article schema..")
counter=0
with client.batch as batch:
for k,v in article\_df.iterrows():
# print update message every 100 objects
if (counter %100 == 0):
print(f"Import {counter} / {len(article\_df)} ")
properties = {
"title": v["title"],
"content": v["text"]
}
vector = v["title\_vector"]
batch.add\_data\_object(properties, "Article", None, vector)
counter = counter+1
print(f"Importing ({len(article\_df)}) Articles complete")`
```
```
`Uploading data with vectors to Article schema..
Import 0 / 25000
Import 100 / 25000
Import 200 / 25000
Import 300 / 25000
Import 400 / 25000
Import 500 / 25000
Import 600 / 25000
Import 700 / 25000
Import 800 / 25000
Import 900 / 25000
Import 1000 / 25000
Import 1100 / 25000
Import 1200 / 25000
Import 1300 / 25000
Import 1400 / 25000
Import 1500 / 25000
Import 1600 / 25000
Import 1700 / 25000
Import 1800 / 25000
Import 1900 / 25000
Import 2000 / 25000
Import 2100 / 25000
Import 2200 / 25000
Import 2300 / 25000
Import 2400 / 25000
Import 2500 / 25000
Import 2600 / 25000
Import 2700 / 25000
Import 2800 / 25000
Import 2900 / 25000
Import 3000 / 25000
Import 3100 / 25000
Import 3200 / 25000
Import 3300 / 25000
Import 3400 / 25000
Import 3500 / 25000
Import 3600 / 25000
Import 3700 / 25000
Import 3800 / 25000
Import 3900 / 25000
Import 4000 / 25000
Import 4100 / 25000
Import 4200 / 25000
Import 4300 / 25000
Import 4400 / 25000
Import 4500 / 25000
Import 4600 / 25000
Import 4700 / 25000
Import 4800 / 25000
Import 4900 / 25000
Import 5000 / 25000
Import 5100 / 25000
Import 5200 / 25000
Import 5300 / 25000
Import 5400 / 25000
Import 5500 / 25000
Import 5600 / 25000
Import 5700 / 25000
Import 5800 / 25000
Import 5900 / 25000
Import 6000 / 25000
Import 6100 / 25000
Import 6200 / 25000
Import 6300 / 25000
Import 6400 / 25000
Import 6500 / 25000
Import 6600 / 25000
Import 6700 / 25000
Import 6800 / 25000
Import 6900 / 25000
Import 7000 / 25000
Import 7100 / 25000
Import 7200 / 25000
Import 7300 / 25000
Import 7400 / 25000
Import 7500 / 25000
Import 7600 / 25000
Import 7700 / 25000
Import 7800 / 25000
Import 7900 / 25000
Import 8000 / 25000
Import 8100 / 25000
Import 8200 / 25000
Import 8300 / 25000
Import 8400 / 25000
Import 8500 / 25000
Import 8600 / 25000
Import 8700 / 25000
Import 8800 / 25000
Import 8900 / 25000
Import 9000 / 25000
Import 9100 / 25000
Import 9200 / 25000
Import 9300 / 25000
Import 9400 / 25000
Import 9500 / 25000
Import 9600 / 25000
Import 9700 / 25000
Import 9800 / 25000
Import 9900 / 25000
Import 10000 / 25000
Import 10100 / 25000
Import 10200 / 25000
Import 10300 / 25000
Import 10400 / 25000
Import 10500 / 25000
Import 10600 / 25000
Import 10700 / 25000
Import 10800 / 25000
Import 10900 / 25000
Import 11000 / 25000
Import 11100 / 25000
Import 11200 / 25000
Import 11300 / 25000
Import 11400 / 25000
Import 11500 / 25000
Import 11600 / 25000
Import 11700 / 25000
Import 11800 / 25000
Import 11900 / 25000
Import 12000 / 25000
Import 12100 / 25000
Import 12200 / 25000
Import 12300 / 25000
Import 12400 / 25000
Import 12500 / 25000
Import 12600 / 25000
Import 12700 / 25000
Import 12800 / 25000
Import 12900 / 25000
Import 13000 / 25000
Import 13100 / 25000
Import 13200 / 25000
Import 13300 / 25000
Import 13400 / 25000
Import 13500 / 25000
Import 13600 / 25000
Import 13700 / 25000
Import 13800 / 25000
Import 13900 / 25000
Import 14000 / 25000
Import 14100 / 25000
Import 14200 / 25000
Import 14300 / 25000
Import 14400 / 25000
Import 14500 / 25000
Import 14600 / 25000
Import 14700 / 25000
Import 14800 / 25000
Import 14900 / 25000
Import 15000 / 25000
Import 15100 / 25000
Import 15200 / 25000
Import 15300 / 25000
Import 15400 / 25000
Import 15500 / 25000
Import 15600 / 25000
Import 15700 / 25000
Import 15800 / 25000
Import 15900 / 25000
Import 16000 / 25000
Import 16100 / 25000
Import 16200 / 25000
Import 16300 / 25000
Import 16400 / 25000
Import 16500 / 25000
Import 16600 / 25000
Import 16700 / 25000
Import 16800 / 25000
Import 16900 / 25000
Import 17000 / 25000
Import 17100 / 25000
Import 17200 / 25000
Import 17300 / 25000
Import 17400 / 25000
Import 17500 / 25000
Import 17600 / 25000
Import 17700 / 25000
Import 17800 / 25000
Import 17900 / 25000
Import 18000 / 25000
Import 18100 / 25000
Import 18200 / 25000
Import 18300 / 25000
Import 18400 / 25000
Import 18500 / 25000
Import 18600 / 25000
Import 18700 / 25000
Import 18800 / 25000
Import 18900 / 25000
Import 19000 / 25000
Import 19100 / 25000
Import 19200 / 25000
Import 19300 / 25000
Import 19400 / 25000
Import 19500 / 25000
Import 19600 / 25000
Import 19700 / 25000
Import 19800 / 25000
Import 19900 / 25000
Import 20000 / 25000
Import 20100 / 25000
Import 20200 / 25000
Import 20300 / 25000
Import 20400 / 25000
Import 20500 / 25000
Import 20600 / 25000
Import 20700 / 25000
Import 20800 / 25000
Import 20900 / 25000
Import 21000 / 25000
Import 21100 / 25000
Import 21200 / 25000
Import 21300 / 25000
Import 21400 / 25000
Import 21500 / 25000
Import 21600 / 25000
Import 21700 / 25000
Import 21800 / 25000
Import 21900 / 25000
Import 22000 / 25000
Import 22100 / 25000
Import 22200 / 25000
Import 22300 / 25000
Import 22400 / 25000
Import 22500 / 25000
Import 22600 / 25000
Import 22700 / 25000
Import 22800 / 25000
Import 22900 / 25000
Import 23000 / 25000
Import 23100 / 25000
Import 23200 / 25000
Import 23300 / 25000
Import 23400 / 25000
Import 23500 / 25000
Import 23600 / 25000
Import 23700 / 25000
Import 23800 / 25000
Import 23900 / 25000
Import 24000 / 25000
Import 24100 / 25000
Import 24200 / 25000
Import 24300 / 25000
Import 24400 / 25000
Import 24500 / 25000
Import 24600 / 25000
Import 24700 / 25000
Import 24800 / 25000
Import 24900 / 25000
Importing (25000) Articles complete`
```
```
`# Test that all data has loaded – get object count
result = (
client.query.aggregate("Article")
.with\_fields("meta { count }")
.do()
)
print("Object count: ", result["data"]["Aggregate"]["Article"])`
```
```
`Object count: [{'meta': {'count': 25000}}]`
```
```
`# Test one article has worked by checking one object
test\_article = (
client.query
.get("Article", ["title", "content", "\_additional {id}"])
.with\_limit(1)
.do()
)["data"]["Get"]["Article"][0]
print(test\_article["\_additional"]["id"])
print(test\_article["title"])
print(test\_article["content"])`
```
```
`000393f2-1182-4e3d-abcf-4217eda64be0
Lago d'Origlio
Lago d'Origlio is a lake in the municipality of Origlio, in Ticino, Switzerland.
Lakes of Ticino`
```
### Search data
As above, we’ll fire some queries at our new Index and get back results based on the closeness to our existing vectors
```
`def query\_weaviate(query, collection\_name, top\_k=20):
# Creates embedding vector from user query
embedded\_query = openai.Embedding.create(
input=query,
model=EMBEDDING\_MODEL,
)["data"][0]['embedding']
near\_vector = {"vector": embedded\_query}
# Queries input schema with vectorised user query
query\_result = (
client.query
.get(collection\_name, ["title", "content", "\_additional {certainty distance}"])
.with\_near\_vector(near\_vector)
.with\_limit(top\_k)
.do()
)
return query\_result`
```
```
`query\_result = query\_weaviate("modern art in Europe", "Article")
counter = 0
for article in query\_result["data"]["Get"]["Article"]:
counter += 1
print(f"{counter}. { article['title']} (Certainty: {round(article['\_additional']['certainty'],3) }) (Distance: {round(article['\_additional']['distance'],3) })")`
```
```
`1. Museum of Modern Art (Certainty: 0.938) (Distance: 0.125)
2. Western Europe (Certainty: 0.934) (Distance: 0.133)
3. Renaissance art (Certainty: 0.932) (Distance: 0.136)
4. Pop art (Certainty: 0.93) (Distance: 0.14)
5. Northern Europe (Certainty: 0.927) (Distance: 0.145)
6. Hellenistic art (Certainty: 0.926) (Distance: 0.147)
7. Modernist literature (Certainty: 0.924) (Distance: 0.153)
8. Art film (Certainty: 0.922) (Distance: 0.157)
9. Central Europe (Certainty: 0.921) (Distance: 0.157)
10. European (Certainty: 0.921) (Distance: 0.159)
11. Art (Certainty: 0.921) (Distance: 0.159)
12. Byzantine art (Certainty: 0.92) (Distance: 0.159)
13. Postmodernism (Certainty: 0.92) (Distance: 0.16)
14. Eastern Europe (Certainty: 0.92) (Distance: 0.161)
15. Europe (Certainty: 0.919) (Distance: 0.161)
16. Cubism (Certainty: 0.919) (Distance: 0.161)
17. Impressionism (Certainty: 0.919) (Distance: 0.162)
18. Bauhaus (Certainty: 0.919) (Distance: 0.162)
19. Expressionism (Certainty: 0.918) (Distance: 0.163)
20. Surrealism (Certainty: 0.918) (Distance: 0.163)`
```
```
`query\_result = query\_weaviate("Famous battles in Scottish history", "Article")
counter = 0
for article in query\_result["data"]["Get"]["Article"]:
counter += 1
print(f"{counter}. {article['title']} (Score: {round(article['\_additional']['certainty'],3) })")`
```
```
`1. Historic Scotland (Score: 0.946)
2. First War of Scottish Independence (Score: 0.946)
3. Battle of Bannockburn (Score: 0.946)
4. Wars of Scottish Independence (Score: 0.944)
5. Second War of Scottish Independence (Score: 0.94)
6. List of Scottish monarchs (Score: 0.937)
7. Scottish Borders (Score: 0.932)
8. Braveheart (Score: 0.929)
9. John of Scotland (Score: 0.929)
10. Guardians of Scotland (Score: 0.926)
11. Holyrood Abbey (Score: 0.925)
12. Scottish (Score: 0.925)
13. Scots (Score: 0.925)
14. Robert I of Scotland (Score: 0.924)
15. Scottish people (Score: 0.924)
16. Edinburgh Castle (Score: 0.924)
17. Alexander I of Scotland (Score: 0.924)
18. Robert Burns (Score: 0.924)
19. Battle of Bosworth Field (Score: 0.922)
20. David II of Scotland (Score: 0.922)`
```
### Let Weaviate handle vector embeddings
Weaviate has a [built-in module for OpenAI](https://weaviate.io/developers/weaviate/modules/retriever-vectorizer-modules/text2vec-openai), which takes care of the steps required to generate a vector embedding for your queries and any CRUD operations.
This allows you to run a vector query with the `with\_near\_text` filter, which uses your `OPEN\_API\_KEY`.
```
`def near\_text\_weaviate(query, collection\_name):
nearText = {
"concepts": [query],
"distance": 0.7,
}
properties = [
"title", "content",
"\_additional {certainty distance}"
]
query\_result = (
client.query
.get(collection\_name, properties)
.with\_near\_text(nearText)
.with\_limit(20)
.do()
)["data"]["Get"][collection\_name]
print (f"Objects returned: {len(query\_result)}")
return query\_result`
```
```
`query\_result = near\_text\_weaviate("modern art in Europe","Article")
counter = 0
for article in query\_result:
counter += 1
print(f"{counter}. { article['title']} (Certainty: {round(article['\_additional']['certainty'],3) }) (Distance: {round(article['\_additional']['distance'],3) })")`
```
```
`Objects returned: 20
1. Museum of Modern Art (Certainty: 0.938) (Distance: 0.125)
2. Western Europe (Certainty: 0.934) (Distance: 0.133)
3. Renaissance art (Certainty: 0.932) (Distance: 0.136)
4. Pop art (Certainty: 0.93) (Distance: 0.14)
5. Northern Europe (Certainty: 0.927) (Distance: 0.145)
6. Hellenistic art (Certainty: 0.926) (Distance: 0.147)
7. Modernist literature (Certainty: 0.923) (Distance: 0.153)
8. Art film (Certainty: 0.922) (Distance: 0.157)
9. Central Europe (Certainty: 0.921) (Distance: 0.157)
10. European (Certainty: 0.921) (Distance: 0.159)
11. Art (Certainty: 0.921) (Distance: 0.159)
12. Byzantine art (Certainty: 0.92) (Distance: 0.159)
13. Postmodernism (Certainty: 0.92) (Distance: 0.16)
14. Eastern Europe (Certainty: 0.92) (Distance: 0.161)
15. Europe (Certainty: 0.919) (Distance: 0.161)
16. Cubism (Certainty: 0.919) (Distance: 0.161)
17. Impressionism (Certainty: 0.919) (Distance: 0.162)
18. Bauhaus (Certainty: 0.919) (Distance: 0.162)
19. Surrealism (Certainty: 0.918) (Distance: 0.163)
20. Expressionism (Certainty: 0.918) (Distance: 0.163)`
```
```
`query\_result = near\_text\_weaviate("Famous battles in Scottish history","Article")
counter = 0
for article in query\_result:
counter += 1
print(f"{counter}. { article['title']} (Certainty: {round(article['\_additional']['certainty'],3) }) (Distance: {round(article['\_additional']['distance'],3) })")`
```
```
`Objects returned: 20
1. Historic Scotland (Certainty: 0.946) (Distance: 0.107)
2. First War of Scottish Independence (Certainty: 0.946) (Distance: 0.108)
3. Battle of Bannockburn (Certainty: 0.946) (Distance: 0.109)
4. Wars of Scottish Independence (Certainty: 0.944) (Distance: 0.111)
5. Second War of Scottish Independence (Certainty: 0.94) (Distance: 0.121)
6. List of Scottish monarchs (Certainty: 0.937) (Distance: 0.127)
7. Scottish Borders (Certainty: 0.932) (Distance: 0.137)
8. Braveheart (Certainty: 0.929) (Distance: 0.141)
9. John of Scotland (Certainty: 0.929) (Distance: 0.142)
10. Guardians of Scotland (Certainty: 0.926) (Distance: 0.148)
11. Holyrood Abbey (Certainty: 0.925) (Distance: 0.15)
12. Scottish (Certainty: 0.925) (Distance: 0.15)
13. Scots (Certainty: 0.925) (Distance: 0.15)
14. Robert I of Scotland (Certainty: 0.924) (Distance: 0.151)
15. Scottish people (Certainty: 0.924) (Distance: 0.152)
16. Edinburgh Castle (Certainty: 0.924) (Distance: 0.153)
17. Alexander I of Scotland (Certainty: 0.924) (Distance: 0.153)
18. Robert Burns (Certainty: 0.924) (Distance: 0.153)
19. Battle of Bosworth Field (Certainty: 0.922) (Distance: 0.155)
20. David II of Scotland (Certainty: 0.922) (Distance: 0.157)`
```