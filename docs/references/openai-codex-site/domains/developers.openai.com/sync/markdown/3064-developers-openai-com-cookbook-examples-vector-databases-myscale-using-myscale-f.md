Using MyScale for embeddings search
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
# Using MyScale for embeddings search
[ CJ ](https://twitter.com/colintjarvis)
[ Colin Jarvis
(OpenAI)
](https://twitter.com/colintjarvis)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/myscale/Using_MyScale_for_embeddings_search.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/myscale/Using_MyScale_for_embeddings_search.ipynb)
This notebook takes you through a simple flow to download some data, embed it, and then index and search it using a selection of vector databases. This is a common requirement for customers who want to store and search our embeddings with their own data in a secure environment to support production use cases such as chatbots, topic modelling and more.
### What is a Vector Database
A vector database is a database made to store, manage and search embedding vectors. The use of embeddings to encode unstructured data (text, audio, video and more) as vectors for consumption by machine-learning models has exploded in recent years, due to the increasing effectiveness of AI in solving use cases involving natural language, image recognition and other unstructured forms of data. Vector databases have emerged as an effective solution for enterprises to deliver and scale these use cases.
### Why use a Vector Database
Vector databases enable enterprises to take many of the embeddings use cases we’ve shared in this repo (question and answering, chatbot and recommendation services, for example), and make use of them in a secure, scalable environment. Many of our customers make embeddings solve their problems at small scale but performance and security hold them back from going into production - we see vector databases as a key component in solving that, and in this guide we’ll walk through the basics of embedding text data, storing it in a vector database and using it for semantic search.
### Demo Flow
The demo flow is:
* **Setup**: Import packages and set any required variables
* **Load data**: Load a dataset and embed it using OpenAI embeddings
* **MyScale**
* *Setup*: Set up the MyScale Python client. For more details go [here](https://docs.myscale.com/en/python-client/)
* *Index Data*: We’ll create a table and index it for **content**.
* *Search Data*: Run a few example queries with various goals in mind.
Once you’ve run through this notebook you should have a basic understanding of how to setup and use vector databases, and can move on to more complex use cases making use of our embeddings.
## Setup
Import the required libraries and set the embedding model that we’d like to use.
```
`# We'll need to install the MyScale client
!pip install clickhouse-connect
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
# MyScale's client library for Python
import clickhouse\_connect
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
## MyScale
The next vector database we’ll consider is [MyScale](https://myscale.com).
[MyScale](https://myscale.com) is a database built on Clickhouse that combines vector search and SQL analytics to offer a high-performance, streamlined, and fully managed experience. It’s designed to facilitate joint queries and analyses on both structured and vector data, with comprehensive SQL support for all data processing.
Deploy and execute vector search with SQL on your cluster within two minutes by using [MyScale Console](https://console.myscale.com).
### Connect to MyScale
Follow the [connections details](https://docs.myscale.com/en/cluster-management/) section to retrieve the cluster host, username, and password information from the MyScale console, and use it to create a connection to your cluster as shown below:
```
`# initialize client
client = clickhouse\_connect.get\_client(host='YOUR\_CLUSTER\_HOST', port=8443, username='YOUR\_USERNAME', password='YOUR\_CLUSTER\_PASSWORD')`
```
### Index data
We will create an SQL table called `articles` in MyScale to store the embeddings data. The table will include a vector index with a cosine distance metric and a constraint for the length of the embeddings. Use the following code to create and insert data into the articles table:
```
`# create articles table with vector index
embedding\_len=len(article\_df['content\_vector'][0]) # 1536
client.command(f"""
CREATE TABLE IF NOT EXISTS default.articles
(
id UInt64,
url String,
title String,
text String,
content\_vector Array(Float32),
CONSTRAINT cons\_vector\_len CHECK length(content\_vector) = {embedding\_len},
VECTOR INDEX article\_content\_index content\_vector TYPE HNSWFLAT('metric\_type=Cosine')
)
ENGINE = MergeTree ORDER BY id
""")
# insert data into the table in batches
from tqdm.auto import tqdm
batch\_size = 100
total\_records = len(article\_df)
# we only need subset of columns
article\_df = article\_df[['id', 'url', 'title', 'text', 'content\_vector']]
# upload data in batches
data = article\_df.to\_records(index=False).tolist()
column\_names = article\_df.columns.tolist()
for i in tqdm(range(0, total\_records, batch\_size)):
i\_end = min(i + batch\_size, total\_records)
client.insert("default.articles", data[i:i\_end], column\_names=column\_names)`
```
```
` 0%| | 0/250 [00:00\<?, ?it/s]`
```
We need to check the build status of the vector index before proceeding with the search, as it is automatically built in the background.
```
`# check count of inserted data
print(f"articles count: {client.command('SELECT count(\*) FROM default.articles')}")
# check the status of the vector index, make sure vector index is ready with 'Built' status
get\_index\_status="SELECT status FROM system.vector\_indices WHERE name='article\_content\_index'"
print(f"index build status: {client.command(get\_index\_status)}")`
```
```
`articles count: 25000
index build status: InProgress`
```
### Search data
Once indexed in MyScale, we can perform vector search to find similar content. First, we will use the OpenAI API to generate embeddings for our query. Then, we will perform the vector search using MyScale.
```
`query = "Famous battles in Scottish history"
# creates embedding vector from user query
embed = openai.Embedding.create(
input=query,
model="text-embedding-3-small",
)["data"][0]["embedding"]
# query the database to find the top K similar content to the given query
top\_k = 10
results = client.query(f"""
SELECT id, url, title, distance(content\_vector, {embed}) as dist
FROM default.articles
ORDER BY dist
LIMIT {top\_k}
""")
# display results
for i, r in enumerate(results.named\_results()):
print(i+1, r['title'])`
```
```
`1 Battle of Bannockburn
2 Wars of Scottish Independence
3 1651
4 First War of Scottish Independence
5 Robert I of Scotland
6 841
7 1716
8 1314
9 1263
10 William Wallace`
```