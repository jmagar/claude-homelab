Semantic search using MongoDB Atlas Vector Search and OpenAI
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
Nov 21, 2023
# Semantic search using MongoDB Atlas Vector Search and OpenAI
[ PA ](https://www.linkedin.com/in/prakulagarwal)
[ Prakul Agarwal ](https://www.linkedin.com/in/prakulagarwal)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/mongodb_atlas/semantic_search_using_mongodb_atlas_vector_search.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/mongodb_atlas/semantic_search_using_mongodb_atlas_vector_search.ipynb)
This notebook demonstrates how to build a semantic search application using OpenAI and [MongoDB Atlas vector search](https://www.mongodb.com/products/platform/atlas-vector-search)
```
`!pip install pymongo openai`
```
```
`Collecting pymongo
Downloading pymongo-4.6.0-cp310-cp310-manylinux\_2\_17\_x86\_64.manylinux2014\_x86\_64.whl (677 kB)
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m677.1/677.1 kB[0m [31m10.3 MB/s[0m eta [36m0:00:00[0m
[?25hCollecting openai
Downloading openai-1.3.3-py3-none-any.whl (220 kB)
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m220.3/220.3 kB[0m [31m24.4 MB/s[0m eta [36m0:00:00[0m
[?25hCollecting dnspython\<3.0.0,\>=1.16.0 (from pymongo)
Downloading dnspython-2.4.2-py3-none-any.whl (300 kB)
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m300.4/300.4 kB[0m [31m29.0 MB/s[0m eta [36m0:00:00[0m
[?25hRequirement already satisfied: anyio\<4,\>=3.5.0 in /usr/local/lib/python3.10/dist-packages (from openai) (3.7.1)
Requirement already satisfied: distro\<2,\>=1.7.0 in /usr/lib/python3/dist-packages (from openai) (1.7.0)
Collecting httpx\<1,\>=0.23.0 (from openai)
Downloading httpx-0.25.1-py3-none-any.whl (75 kB)
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m75.0/75.0 kB[0m [31m9.8 MB/s[0m eta [36m0:00:00[0m
[?25hRequirement already satisfied: pydantic\<3,\>=1.9.0 in /usr/local/lib/python3.10/dist-packages (from openai) (1.10.13)
Requirement already satisfied: tqdm\>4 in /usr/local/lib/python3.10/dist-packages (from openai) (4.66.1)
Requirement already satisfied: typing-extensions\<5,\>=4.5 in /usr/local/lib/python3.10/dist-packages (from openai) (4.5.0)
Requirement already satisfied: idna\>=2.8 in /usr/local/lib/python3.10/dist-packages (from anyio\<4,\>=3.5.0-\>openai) (3.4)
Requirement already satisfied: sniffio\>=1.1 in /usr/local/lib/python3.10/dist-packages (from anyio\<4,\>=3.5.0-\>openai) (1.3.0)
Requirement already satisfied: exceptiongroup in /usr/local/lib/python3.10/dist-packages (from anyio\<4,\>=3.5.0-\>openai) (1.1.3)
Requirement already satisfied: certifi in /usr/local/lib/python3.10/dist-packages (from httpx\<1,\>=0.23.0-\>openai) (2023.7.22)
Collecting httpcore (from httpx\<1,\>=0.23.0-\>openai)
Downloading httpcore-1.0.2-py3-none-any.whl (76 kB)
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m76.9/76.9 kB[0m [31m7.9 MB/s[0m eta [36m0:00:00[0m
[?25hCollecting h11\<0.15,\>=0.13 (from httpcore-\>httpx\<1,\>=0.23.0-\>openai)
Downloading h11-0.14.0-py3-none-any.whl (58 kB)
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m58.3/58.3 kB[0m [31m6.8 MB/s[0m eta [36m0:00:00[0m
[?25hInstalling collected packages: h11, dnspython, pymongo, httpcore, httpx, openai
[31mERROR: pip's dependency resolver does not currently take into account all the packages that are installed. This behaviour is the source of the following dependency conflicts.
llmx 0.0.15a0 requires cohere, which is not installed.
llmx 0.0.15a0 requires tiktoken, which is not installed.[0m[31m
[0mSuccessfully installed dnspython-2.4.2 h11-0.14.0 httpcore-1.0.2 httpx-0.25.1 openai-1.3.3 pymongo-4.6.0`
```
# Step 1: Setup the environment
There are 2 pre-requisites for this:
1. **MongoDB Atlas cluster**: To create a forever free MongoDB Atlas cluster, first, you need to create a MongoDB Atlas account if you don’t already have one. Visit the [MongoDB Atlas website](https://www.mongodb.com/atlas/database) and click on “Register.” Visit the [MongoDB Atlas](https://account.mongodb.com/account/login) dashboard and set up your cluster. In order to take advantage of the `$vectorSearch` operator in an aggregation pipeline, you need to run MongoDB Atlas 6.0.11 or higher. This tutorial can be built using a free cluster. When you’re setting up your deployment, you’ll be prompted to set up a database user and rules for your network connection. Please ensure you save your username and password somewhere safe and have the correct IP address rules in place so your cluster can connect properly. If you need more help getting started, check out our [tutorial on MongoDB Atlas](https://www.mongodb.com/basics/mongodb-atlas-tutorial).
2. **OpenAI API key** To create your OpenAI key, you’ll need to create an account. Once you have that, visit the [OpenAI platform](https://platform.openai.com/). Click on your profile icon in the top right of the screen to get the dropdown menu and select “View API keys”.
```
`import getpass
MONGODB\_ATLAS\_CLUSTER\_URI = getpass.getpass("MongoDB Atlas Cluster URI:")
OPENAI\_API\_KEY = getpass.getpass("OpenAI API Key:")`
```
```
`MongoDB Atlas Cluster URI:··········
OpenAI API Key:··········`
```
Note: After executing the step above you will be prompted to enter the credentials.
For this tutorial, we will be using the
[MongoDB sample dataset](https://www.mongodb.com/docs/atlas/sample-data/). Load the sample dataset using the Atlas UI. We’ll be using the “sample\_mflix” database, which contains a “movies” collection where each document contains fields like title, plot, genres, cast, directors, etc.
```
`import openai
import pymongo
client = pymongo.MongoClient(MONGODB\_ATLAS\_CLUSTER\_URI)
db = client.sample\_mflix
collection = db.movies
openai.api\_key = OPENAI\_API\_KEY`
```
```
`ATLAS\_VECTOR\_SEARCH\_INDEX\_NAME = "default"
EMBEDDING\_FIELD\_NAME = "embedding\_openai\_nov19\_23"`
```
# Step 2: Setup embeddings generation function
```
`model = "text-embedding-3-small"
def generate\_embedding(text: str) -\> list[float]:
return openai.embeddings.create(input = [text], model=model).data[0].embedding`
```
# Step 3: Create and store embeddings
Each document in the sample dataset sample\_mflix.movies corresponds to a movie; we will execute an operation to create a vector embedding for the data in the “plot” field and store it in the database. Creating vector embeddings using OpenAI embeddings endpoint is necessary for performing a similarity search based on intent.
```
`from pymongo import ReplaceOne
# Update the collection with the embeddings
requests = []
for doc in collection.find({'plot':{"$exists": True}}).limit(500):
doc[EMBEDDING\_FIELD\_NAME] = generate\_embedding(doc['plot'])
requests.append(ReplaceOne({'\_id': doc['\_id']}, doc))
collection.bulk\_write(requests)`
```
```
`BulkWriteResult({'writeErrors': [], 'writeConcernErrors': [], 'nInserted': 0, 'nUpserted': 0, 'nMatched': 50, 'nModified': 50, 'nRemoved': 0, 'upserted': []}, acknowledged=True)`
```
After executing the above, the documents in “movies” collection will contain an additional field of “embedding”, as defined by the `EMBEDDDING\_FIELD\_NAME` variable, apart from already existing fields like title, plot, genres, cast, directors, etc.
Note: We are restricting this to just 500 documents in the interest of time. If you want to do this over the entire dataset of 23,000+ documents in our sample\_mflix database, it will take a little while. Alternatively, you can use the [sample\_mflix.embedded\_movies collection](https://www.mongodb.com/docs/atlas/sample-data/sample-mflix/#sample_mflix.embedded_movies) which includes a pre-populated `plot\_embedding` field that contains embeddings created using OpenAI’s `text-embedding-3-small` embedding model that you can use with the Atlas Search vector search feature.
# Step 4: Create a vector search index
We will create Atlas Vector Search Index on this collection which will allow us to perform the Approximate KNN search, which powers the semantic search.
We will cover 2 ways to create this index - Atlas UI and using MongoDB python driver.
(Optional) [Documentation: Create a Vector Search Index ](https://www.mongodb.com/docs/atlas/atlas-search/field-types/knn-vector/)
Now head over to [Atlas UI](cloud.mongodb.com) and create an Atlas Vector Search index using the steps descibed [here](https://www.mongodb.com/docs/atlas/atlas-vector-search/vector-search-tutorial/#create-the-atlas-vector-search-index). The ‘dimensions’ field with value 1536, corresponds to openAI text-embedding-ada002.
Use the definition given below in the JSON editor on the Atlas UI.
```
`{
"mappings": {
"dynamic": true,
"fields": {
"embedding": {
"dimensions": 1536,
"similarity": "dotProduct",
"type": "knnVector"
}
}
}
}`
```
(Optional) Alternatively, we can use [pymongo driver to create these vector search indexes programatically](https://pymongo.readthedocs.io/en/stable/api/pymongo/collection.html#pymongo.collection.Collection.create_search_index)
The python command given in the cell below will create the index (this only works for the most recent version of the Python Driver for MongoDB and MongoDB server version 7.0+ Atlas cluster).
```
`collection.create\_search\_index(
{"definition":
{"mappings": {"dynamic": True, "fields": {
EMBEDDING\_FIELD\_NAME : {
"dimensions": 1536,
"similarity": "dotProduct",
"type": "knnVector"
}}}},
"name": ATLAS\_VECTOR\_SEARCH\_INDEX\_NAME
}
)`
```
```
`'default'`
```
# Step 5: Query your data
The results for the query here finds movies which have semantically similar plots to the text captured in the query string, rather than being based on the keyword search.
(Optional) [Documentation: Run Vector Search Queries](https://www.mongodb.com/docs/atlas/atlas-vector-search/vector-search-stage/)
```
`
def query\_results(query, k):
results = collection.aggregate([
{
'$vectorSearch': {
"index": ATLAS\_VECTOR\_SEARCH\_INDEX\_NAME,
"path": EMBEDDING\_FIELD\_NAME,
"queryVector": generate\_embedding(query),
"numCandidates": 50,
"limit": 5,
}
}
])
return results`
```
```
`query="imaginary characters from outerspace at war with earthlings"
movies = query\_results(query, 5)
for movie in movies:
print(f'Movie Name: {movie["title"]},\\nMovie Plot: {movie["plot"]}\\n')`
```