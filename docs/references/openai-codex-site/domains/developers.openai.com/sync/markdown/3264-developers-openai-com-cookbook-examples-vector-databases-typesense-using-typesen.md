Using Typesense for embeddings search
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
# Using Typesense for embeddings search
[ CJ ](https://twitter.com/colintjarvis)
[ Colin Jarvis
(OpenAI)
](https://twitter.com/colintjarvis)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/typesense/Using_Typesense_for_embeddings_search.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/typesense/Using_Typesense_for_embeddings_search.ipynb)
This notebook takes you through a simple flow to download some data, embed it, and then index and search it using a selection of vector databases. This is a common requirement for customers who want to store and search our embeddings with their own data in a secure environment to support production use cases such as chatbots, topic modelling and more.
### What is a Vector Database
A vector database is a database made to store, manage and search embedding vectors. The use of embeddings to encode unstructured data (text, audio, video and more) as vectors for consumption by machine-learning models has exploded in recent years, due to the increasing effectiveness of AI in solving use cases involving natural language, image recognition and other unstructured forms of data. Vector databases have emerged as an effective solution for enterprises to deliver and scale these use cases.
### Why use a Vector Database
Vector databases enable enterprises to take many of the embeddings use cases we’ve shared in this repo (question and answering, chatbot and recommendation services, for example), and make use of them in a secure, scalable environment. Many of our customers make embeddings solve their problems at small scale but performance and security hold them back from going into production - we see vector databases as a key component in solving that, and in this guide we’ll walk through the basics of embedding text data, storing it in a vector database and using it for semantic search.
### Demo Flow
The demo flow is:
* **Setup**: Import packages and set any required variables
* **Load data**: Load a dataset and embed it using OpenAI embeddings
* **Typesense**
* *Setup*: Set up the Typesense Python client. For more details go [here](https://typesense.org/docs/0.24.0/api/)
* *Index Data*: We’ll create a collection and index it for both **titles** and **content**.
* *Search Data*: Run a few example queries with various goals in mind.
Once you’ve run through this notebook you should have a basic understanding of how to setup and use vector databases, and can move on to more complex use cases making use of our embeddings.
## Setup
Import the required libraries and set the embedding model that we’d like to use.
```
`# We'll need to install the Typesense client
!pip install typesense
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
# Typesense's client library for Python
import typesense
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
## Typesense
The next vector store we’ll look at is [Typesense](https://typesense.org/), which is an open source, in-memory search engine, that you can either self-host or run on [Typesense Cloud](https://cloud.typesense.org).
Typesense focuses on performance by storing the entire index in RAM (with a backup on disk) and also focuses on providing an out-of-the-box developer experience by simplifying available options and setting good defaults. It also lets you combine attribute-based filtering together with vector queries.
For this example, we will set up a local docker-based Typesense server, index our vectors in Typesense and then do some nearest-neighbor search queries. If you use Typesense Cloud, you can skip the docker setup part and just obtain the hostname and API keys from your cluster dashboard.
### Setup
To run Typesense locally, you’ll need [Docker](https://www.docker.com/). Following the instructions contained in the Typesense documentation [here](https://typesense.org/docs/guide/install-typesense.html#docker-compose), we created an example docker-compose.yml file in this repo saved at [./typesense/docker-compose.yml](./typesense/docker-compose.yml).
After starting Docker, you can start Typesense locally by navigating to the `examples/vector\_databases/typesense/` directory and running `docker-compose up -d`.
The default API key is set to `xyz` in the Docker compose file, and the default Typesense port to `8108`.
```
`import typesense
typesense\_client = \\
typesense.Client({
"nodes": [{
"host": "localhost", # For Typesense Cloud use xxx.a1.typesense.net
"port": "8108", # For Typesense Cloud use 443
"protocol": "http" # For Typesense Cloud use https
}],
"api\_key": "xyz",
"connection\_timeout\_seconds": 60
})`
```
### Index data
To index vectors in Typesense, we’ll first create a Collection (which is a collection of Documents) and turn on vector indexing for a particular field. You can even store multiple vector fields in a single document.
```
`# Delete existing collections if they already exist
try:
typesense\_client.collections['wikipedia\_articles'].delete()
except Exception as e:
pass
# Create a new collection
schema = {
"name": "wikipedia\_articles",
"fields": [
{
"name": "content\_vector",
"type": "float[]",
"num\_dim": len(article\_df['content\_vector'][0])
},
{
"name": "title\_vector",
"type": "float[]",
"num\_dim": len(article\_df['title\_vector'][0])
}
]
}
create\_response = typesense\_client.collections.create(schema)
print(create\_response)
print("Created new collection wikipedia-articles")`
```
```
`{'created\_at': 1687165065, 'default\_sorting\_field': '', 'enable\_nested\_fields': False, 'fields': [{'facet': False, 'index': True, 'infix': False, 'locale': '', 'name': 'content\_vector', 'num\_dim': 1536, 'optional': False, 'sort': False, 'type': 'float[]'}, {'facet': False, 'index': True, 'infix': False, 'locale': '', 'name': 'title\_vector', 'num\_dim': 1536, 'optional': False, 'sort': False, 'type': 'float[]'}], 'name': 'wikipedia\_articles', 'num\_documents': 0, 'symbols\_to\_index': [], 'token\_separators': []}
Created new collection wikipedia-articles`
```
```
`# Upsert the vector data into the collection we just created
#
# Note: This can take a few minutes, especially if your on an M1 and running docker in an emulated mode
print("Indexing vectors in Typesense...")
document\_counter = 0
documents\_batch = []
for k,v in article\_df.iterrows():
# Create a document with the vector data
# Notice how you can add any fields that you haven't added to the schema to the document.
# These will be stored on disk and returned when the document is a hit.
# This is useful to store attributes required for display purposes.
document = {
"title\_vector": v["title\_vector"],
"content\_vector": v["content\_vector"],
"title": v["title"],
"content": v["text"],
}
documents\_batch.append(document)
document\_counter = document\_counter + 1
# Upsert a batch of 100 documents
if document\_counter % 100 == 0 or document\_counter == len(article\_df):
response = typesense\_client.collections['wikipedia\_articles'].documents.import\_(documents\_batch)
# print(response)
documents\_batch = []
print(f"Processed {document\_counter} / {len(article\_df)} ")
print(f"Imported ({len(article\_df)}) articles.")`
```
```
`Indexing vectors in Typesense...
Processed 100 / 25000
Processed 200 / 25000
Processed 300 / 25000
Processed 400 / 25000
Processed 500 / 25000
Processed 600 / 25000
Processed 700 / 25000
Processed 800 / 25000
Processed 900 / 25000
Processed 1000 / 25000
Processed 1100 / 25000
Processed 1200 / 25000
Processed 1300 / 25000
Processed 1400 / 25000
Processed 1500 / 25000
Processed 1600 / 25000
Processed 1700 / 25000
Processed 1800 / 25000
Processed 1900 / 25000
Processed 2000 / 25000
Processed 2100 / 25000
Processed 2200 / 25000
Processed 2300 / 25000
Processed 2400 / 25000
Processed 2500 / 25000
Processed 2600 / 25000
Processed 2700 / 25000
Processed 2800 / 25000
Processed 2900 / 25000
Processed 3000 / 25000
Processed 3100 / 25000
Processed 3200 / 25000
Processed 3300 / 25000
Processed 3400 / 25000
Processed 3500 / 25000
Processed 3600 / 25000
Processed 3700 / 25000
Processed 3800 / 25000
Processed 3900 / 25000
Processed 4000 / 25000
Processed 4100 / 25000
Processed 4200 / 25000
Processed 4300 / 25000
Processed 4400 / 25000
Processed 4500 / 25000
Processed 4600 / 25000
Processed 4700 / 25000
Processed 4800 / 25000
Processed 4900 / 25000
Processed 5000 / 25000
Processed 5100 / 25000
Processed 5200 / 25000
Processed 5300 / 25000
Processed 5400 / 25000
Processed 5500 / 25000
Processed 5600 / 25000
Processed 5700 / 25000
Processed 5800 / 25000
Processed 5900 / 25000
Processed 6000 / 25000
Processed 6100 / 25000
Processed 6200 / 25000
Processed 6300 / 25000
Processed 6400 / 25000
Processed 6500 / 25000
Processed 6600 / 25000
Processed 6700 / 25000
Processed 6800 / 25000
Processed 6900 / 25000
Processed 7000 / 25000
Processed 7100 / 25000
Processed 7200 / 25000
Processed 7300 / 25000
Processed 7400 / 25000
Processed 7500 / 25000
Processed 7600 / 25000
Processed 7700 / 25000
Processed 7800 / 25000
Processed 7900 / 25000
Processed 8000 / 25000
Processed 8100 / 25000
Processed 8200 / 25000
Processed 8300 / 25000
Processed 8400 / 25000
Processed 8500 / 25000
Processed 8600 / 25000
Processed 8700 / 25000
Processed 8800 / 25000
Processed 8900 / 25000
Processed 9000 / 25000
Processed 9100 / 25000
Processed 9200 / 25000
Processed 9300 / 25000
Processed 9400 / 25000
Processed 9500 / 25000
Processed 9600 / 25000
Processed 9700 / 25000
Processed 9800 / 25000
Processed 9900 / 25000
Processed 10000 / 25000
Processed 10100 / 25000
Processed 10200 / 25000
Processed 10300 / 25000
Processed 10400 / 25000
Processed 10500 / 25000
Processed 10600 / 25000
Processed 10700 / 25000
Processed 10800 / 25000
Processed 10900 / 25000
Processed 11000 / 25000
Processed 11100 / 25000
Processed 11200 / 25000
Processed 11300 / 25000
Processed 11400 / 25000
Processed 11500 / 25000
Processed 11600 / 25000
Processed 11700 / 25000
Processed 11800 / 25000
Processed 11900 / 25000
Processed 12000 / 25000
Processed 12100 / 25000
Processed 12200 / 25000
Processed 12300 / 25000
Processed 12400 / 25000
Processed 12500 / 25000
Processed 12600 / 25000
Processed 12700 / 25000
Processed 12800 / 25000
Processed 12900 / 25000
Processed 13000 / 25000
Processed 13100 / 25000
Processed 13200 / 25000
Processed 13300 / 25000
Processed 13400 / 25000
Processed 13500 / 25000
Processed 13600 / 25000
Processed 13700 / 25000
Processed 13800 / 25000
Processed 13900 / 25000
Processed 14000 / 25000
Processed 14100 / 25000
Processed 14200 / 25000
Processed 14300 / 25000
Processed 14400 / 25000
Processed 14500 / 25000
Processed 14600 / 25000
Processed 14700 / 25000
Processed 14800 / 25000
Processed 14900 / 25000
Processed 15000 / 25000
Processed 15100 / 25000
Processed 15200 / 25000
Processed 15300 / 25000
Processed 15400 / 25000
Processed 15500 / 25000
Processed 15600 / 25000
Processed 15700 / 25000
Processed 15800 / 25000
Processed 15900 / 25000
Processed 16000 / 25000
Processed 16100 / 25000
Processed 16200 / 25000
Processed 16300 / 25000
Processed 16400 / 25000
Processed 16500 / 25000
Processed 16600 / 25000
Processed 16700 / 25000
Processed 16800 / 25000
Processed 16900 / 25000
Processed 17000 / 25000
Processed 17100 / 25000
Processed 17200 / 25000
Processed 17300 / 25000
Processed 17400 / 25000
Processed 17500 / 25000
Processed 17600 / 25000
Processed 17700 / 25000
Processed 17800 / 25000
Processed 17900 / 25000
Processed 18000 / 25000
Processed 18100 / 25000
Processed 18200 / 25000
Processed 18300 / 25000
Processed 18400 / 25000
Processed 18500 / 25000
Processed 18600 / 25000
Processed 18700 / 25000
Processed 18800 / 25000
Processed 18900 / 25000
Processed 19000 / 25000
Processed 19100 / 25000
Processed 19200 / 25000
Processed 19300 / 25000
Processed 19400 / 25000
Processed 19500 / 25000
Processed 19600 / 25000
Processed 19700 / 25000
Processed 19800 / 25000
Processed 19900 / 25000
Processed 20000 / 25000
Processed 20100 / 25000
Processed 20200 / 25000
Processed 20300 / 25000
Processed 20400 / 25000
Processed 20500 / 25000
Processed 20600 / 25000
Processed 20700 / 25000
Processed 20800 / 25000
Processed 20900 / 25000
Processed 21000 / 25000
Processed 21100 / 25000
Processed 21200 / 25000
Processed 21300 / 25000
Processed 21400 / 25000
Processed 21500 / 25000
Processed 21600 / 25000
Processed 21700 / 25000
Processed 21800 / 25000
Processed 21900 / 25000
Processed 22000 / 25000
Processed 22100 / 25000
Processed 22200 / 25000
Processed 22300 / 25000
Processed 22400 / 25000
Processed 22500 / 25000
Processed 22600 / 25000
Processed 22700 / 25000
Processed 22800 / 25000
Processed 22900 / 25000
Processed 23000 / 25000
Processed 23100 / 25000
Processed 23200 / 25000
Processed 23300 / 25000
Processed 23400 / 25000
Processed 23500 / 25000
Processed 23600 / 25000
Processed 23700 / 25000
Processed 23800 / 25000
Processed 23900 / 25000
Processed 24000 / 25000
Processed 24100 / 25000
Processed 24200 / 25000
Processed 24300 / 25000
Processed 24400 / 25000
Processed 24500 / 25000
Processed 24600 / 25000
Processed 24700 / 25000
Processed 24800 / 25000
Processed 24900 / 25000
Processed 25000 / 25000
Imported (25000) articles.`
```
```
`# Check the number of documents imported
collection = typesense\_client.collections['wikipedia\_articles'].retrieve()
print(f'Collection has {collection["num\_documents"]} documents')`
```
```
`Collection has 25000 documents`
```
### Search Data
Now that we’ve imported the vectors into Typesense, we can do a nearest neighbor search on the `title\_vector` or `content\_vector` field.
```
`def query\_typesense(query, field='title', top\_k=20):
# Creates embedding vector from user query
openai.api\_key = os.getenv("OPENAI\_API\_KEY", "sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
embedded\_query = openai.Embedding.create(
input=query,
model=EMBEDDING\_MODEL,
)['data'][0]['embedding']
typesense\_results = typesense\_client.multi\_search.perform({
"searches": [{
"q": "\*",
"collection": "wikipedia\_articles",
"vector\_query": f"{field}\_vector:([{','.join(str(v) for v in embedded\_query)}], k:{top\_k})"
}]
}, {})
return typesense\_results`
```
```
`query\_results = query\_typesense('modern art in Europe', 'title')
for i, hit in enumerate(query\_results['results'][0]['hits']):
document = hit["document"]
vector\_distance = hit["vector\_distance"]
print(f'{i + 1}. {document["title"]} (Distance: {vector\_distance})')`
```
```
`1. Museum of Modern Art (Distance: 0.12482291460037231)
2. Western Europe (Distance: 0.13255876302719116)
3. Renaissance art (Distance: 0.13584274053573608)
4. Pop art (Distance: 0.1396539807319641)
5. Northern Europe (Distance: 0.14534103870391846)
6. Hellenistic art (Distance: 0.1472070813179016)
7. Modernist literature (Distance: 0.15296930074691772)
8. Art film (Distance: 0.1567266583442688)
9. Central Europe (Distance: 0.15741699934005737)
10. European (Distance: 0.1585891842842102)`
```
```
`query\_results = query\_typesense('Famous battles in Scottish history', 'content')
for i, hit in enumerate(query\_results['results'][0]['hits']):
document = hit["document"]
vector\_distance = hit["vector\_distance"]
print(f'{i + 1}. {document["title"]} (Distance: {vector\_distance})')`
```
```
`1. Battle of Bannockburn (Distance: 0.1306111216545105)
2. Wars of Scottish Independence (Distance: 0.1384994387626648)
3. 1651 (Distance: 0.14744246006011963)
4. First War of Scottish Independence (Distance: 0.15033596754074097)
5. Robert I of Scotland (Distance: 0.15376019477844238)
6. 841 (Distance: 0.15609073638916016)
7. 1716 (Distance: 0.15615153312683105)
8. 1314 (Distance: 0.16280347108840942)
9. 1263 (Distance: 0.16361045837402344)
10. William Wallace (Distance: 0.16464537382125854)`
```
Thanks for following along, you’re now equipped to set up your own vector databases and use embeddings to do all kinds of cool things - enjoy! For more complex use cases please continue to work through other cookbook examples in this repo.