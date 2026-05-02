Running hybrid VSS queries with Redis and OpenAI
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
May 11, 2023
# Running hybrid VSS queries with Redis and OpenAI
[ MY ](<https://github.com/Michael Yuan>)
[ Michael Yuan ](<https://github.com/Michael Yuan>)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/redis/redis-hybrid-query-examples.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/redis/redis-hybrid-query-examples.ipynb)
This notebook provides an introduction to using Redis as a vector database with OpenAI embeddings and running hybrid queries that combine VSS and lexical search using Redis Query and Search capability. Redis is a scalable, real-time database that can be used as a vector database when using the [RediSearch Module](https://oss.redislabs.com/redisearch/). The Redis Query and Search capability allows you to index and search for vectors in Redis. This notebook will show you how to use the Redis Query and Search to index and search for vectors created by using the OpenAI API and stored in Redis.
Hybrid queries combine vector similarity with traditional Redis Query and Search filtering capabilities on GEO, NUMERIC, TAG or TEXT data simplifying application code. A common example of a hybrid query in an e-commerce use case is to find items visually similar to a given query image limited to items available in a GEO location and within a price range.
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
`! pip install redis pandas openai`
```
```
`Defaulting to user installation because normal site-packages is not writeable
Requirement already satisfied: redis in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (4.5.4)
Requirement already satisfied: pandas in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (2.0.1)
Requirement already satisfied: openai in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (0.27.6)
Requirement already satisfied: async-timeout\>=4.0.2 in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from redis) (4.0.2)
Requirement already satisfied: python-dateutil\>=2.8.2 in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from pandas) (2.8.2)
Requirement already satisfied: pytz\>=2020.1 in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from pandas) (2023.3)
Requirement already satisfied: tzdata\>=2022.1 in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from pandas) (2023.3)
Requirement already satisfied: numpy\>=1.20.3 in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from pandas) (1.23.4)
Requirement already satisfied: requests\>=2.20 in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from openai) (2.28.1)
Requirement already satisfied: tqdm in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from openai) (4.64.1)
Requirement already satisfied: aiohttp in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from openai) (3.8.4)
Requirement already satisfied: six\>=1.5 in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from python-dateutil\>=2.8.2-\>pandas) (1.16.0)
Requirement already satisfied: charset-normalizer\<3,\>=2 in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from requests\>=2.20-\>openai) (2.1.1)
Requirement already satisfied: idna\<4,\>=2.5 in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from requests\>=2.20-\>openai) (3.4)
Requirement already satisfied: urllib3\<1.27,\>=1.21.1 in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from requests\>=2.20-\>openai) (1.26.12)
Requirement already satisfied: certifi\>=2017.4.17 in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from requests\>=2.20-\>openai) (2022.9.24)
Requirement already satisfied: attrs\>=17.3.0 in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from aiohttp-\>openai) (23.1.0)
Requirement already satisfied: multidict\<7.0,\>=4.5 in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from aiohttp-\>openai) (6.0.4)
Requirement already satisfied: yarl\<2.0,\>=1.0 in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from aiohttp-\>openai) (1.9.2)
Requirement already satisfied: frozenlist\>=1.1.1 in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from aiohttp-\>openai) (1.3.3)
Requirement already satisfied: aiosignal\>=1.1.2 in /Users/michael.yuan/Library/Python/3.9/lib/python/site-packages (from aiohttp-\>openai) (1.3.1)`
```
===========================================================
## Prepare your OpenAI API key
The `OpenAI API key` is used for vectorization of query data.
If you don’t have an OpenAI API key, you can get one from [https://beta.openai.com/account/api-keys](https://beta.openai.com/account/api-keys).
Once you get your key, please add it to your environment variables as `OPENAI\_API\_KEY` by using following command:
```
`# Test that your OpenAI API key is correctly set as an environment variable
# Note. if you run this notebook locally, you will need to reload your terminal and the notebook for the env variables to be live.
import os
import openai
os.environ["OPENAI\_API\_KEY"] = '\<YOUR\_OPENAI\_API\_KEY\>'
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
In this section we’ll load and clean an ecommerce dataset. We’ll generate embeddings using OpenAI and use this data to create an index in Redis and then search for similar vectors.
```
`import pandas as pd
import numpy as np
from typing import List
from utils.embeddings\_utils import (
get\_embeddings,
distances\_from\_embeddings,
tsne\_components\_from\_embeddings,
chart\_from\_components,
indices\_of\_nearest\_neighbors\_from\_distances,
)
EMBEDDING\_MODEL = "text-embedding-3-small"
# load in data and clean data types and drop null rows
df = pd.read\_csv("../../data/styles\_2k.csv", on\_bad\_lines='skip')
df.dropna(inplace=True)
df["year"] = df["year"].astype(int)
df.info()
# print dataframe
n\_examples = 5
df.head(n\_examples)`
```
```
`\<class 'pandas.core.frame.DataFrame'\>
Index: 1978 entries, 0 to 1998
Data columns (total 10 columns):
# Column Non-Null Count Dtype
--- ------ -------------- -----
0 id 1978 non-null int64
1 gender 1978 non-null object
2 masterCategory 1978 non-null object
3 subCategory 1978 non-null object
4 articleType 1978 non-null object
5 baseColour 1978 non-null object
6 season 1978 non-null object
7 year 1978 non-null int64
8 usage 1978 non-null object
9 productDisplayName 1978 non-null object
dtypes: int64(2), object(8)
memory usage: 170.0+ KB`
```
||id|gender|masterCategory|subCategory|articleType|baseColour|season|year|usage|productDisplayName|
|0|15970|Men|Apparel|Topwear|Shirts|Navy Blue|Fall|2011|Casual|Turtle Check Men Navy Blue Shirt|
|1|39386|Men|Apparel|Bottomwear|Jeans|Blue|Summer|2012|Casual|Peter England Men Party Blue Jeans|
|2|59263|Women|Accessories|Watches|Watches|Silver|Winter|2016|Casual|Titan Women Silver Watch|
|3|21379|Men|Apparel|Bottomwear|Track Pants|Black|Fall|2011|Casual|Manchester United Men Solid Black Track Pants|
|4|53759|Men|Apparel|Topwear|Tshirts|Grey|Summer|2012|Casual|Puma Men Grey T-shirt|
```
`df["product\_text"] = df.apply(lambda row: f"name {row['productDisplayName']} category {row['masterCategory']} subcategory {row['subCategory']} color {row['baseColour']} gender {row['gender']}".lower(), axis=1)
df.rename({"id":"product\_id"}, inplace=True, axis=1)
df.info()`
```
```
`\<class 'pandas.core.frame.DataFrame'\>
Index: 1978 entries, 0 to 1998
Data columns (total 11 columns):
# Column Non-Null Count Dtype
--- ------ -------------- -----
0 product\_id 1978 non-null int64
1 gender 1978 non-null object
2 masterCategory 1978 non-null object
3 subCategory 1978 non-null object
4 articleType 1978 non-null object
5 baseColour 1978 non-null object
6 season 1978 non-null object
7 year 1978 non-null int64
8 usage 1978 non-null object
9 productDisplayName 1978 non-null object
10 product\_text 1978 non-null object
dtypes: int64(2), object(9)
memory usage: 185.4+ KB`
```
```
`# check out one of the texts we will use to create semantic embeddings
df["product\_text"][0]`
```
```
`'name turtle check men navy blue shirt category apparel subcategory topwear color navy blue gender men'`
```
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
TagField,
NumericField,
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
INDEX\_NAME = "product\_embeddings" # name of the search index
PREFIX = "doc" # prefix for the document keys
DISTANCE\_METRIC = "L2" # distance metric for the vectors (ex. COSINE, IP, L2)
NUMBER\_OF\_VECTORS = len(df)`
```
```
`# Define RediSearch fields for each of the columns in the dataset
name = TextField(name="productDisplayName")
category = TagField(name="masterCategory")
articleType = TagField(name="articleType")
gender = TagField(name="gender")
season = TagField(name="season")
year = NumericField(name="year")
text\_embedding = VectorField("product\_vector",
"FLAT", {
"TYPE": "FLOAT32",
"DIM": 1536,
"DISTANCE\_METRIC": DISTANCE\_METRIC,
"INITIAL\_CAP": NUMBER\_OF\_VECTORS,
}
)
fields = [name, category, articleType, gender, season, year, text\_embedding]`
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
## Generate OpenAI Embeddings and Load Documents into the Index
Now that we have a search index, we can load documents into it. We will use the dataframe containing the styles dataset loaded previously. In Redis, either the HASH or JSON (if using RedisJSON in addition to RediSearch) data types can be used to store documents. We will use the HASH data type in this example. The cells below will show how to get OpenAI embeddings for the different products and load documents into the index.
```
`# Use OpenAI get\_embeddings batch requests to speed up embedding creation
def embeddings\_batch\_request(documents: pd.DataFrame):
records = documents.to\_dict("records")
print("Records to process: ", len(records))
product\_vectors = []
docs = []
batchsize = 1000
for idx,doc in enumerate(records,start=1):
# create byte vectors
docs.append(doc["product\_text"])
if idx % batchsize == 0:
product\_vectors += get\_embeddings(docs, EMBEDDING\_MODEL)
docs.clear()
print("Vectors processed ", len(product\_vectors), end='\\r')
product\_vectors += get\_embeddings(docs, EMBEDDING\_MODEL)
print("Vectors processed ", len(product\_vectors), end='\\r')
return product\_vectors`
```
```
`def index\_documents(client: redis.Redis, prefix: str, documents: pd.DataFrame):
product\_vectors = embeddings\_batch\_request(documents)
records = documents.to\_dict("records")
batchsize = 500
# Use Redis pipelines to batch calls and save on round trip network communication
pipe = client.pipeline()
for idx,doc in enumerate(records,start=1):
key = f"{prefix}:{str(doc['product\_id'])}"
# create byte vectors
text\_embedding = np.array((product\_vectors[idx-1]), dtype=np.float32).tobytes()
# replace list of floats with byte vectors
doc["product\_vector"] = text\_embedding
pipe.hset(key, mapping = doc)
if idx % batchsize == 0:
pipe.execute()
pipe.execute()`
```
```
`%%time
index\_documents(redis\_client, PREFIX, df)
print(f"Loaded {redis\_client.info()['db0']['keys']} documents in Redis search index with name: {INDEX\_NAME}")`
```
```
`Records to process: 1978
Loaded 1978 documents in Redis search index with name: product\_embeddings
CPU times: user 619 ms, sys: 78.9 ms, total: 698 ms
Wall time: 3.34 s`
```
## Simple Vector Search Queries with OpenAI Query Embeddings
Now that we have a search index and documents loaded into it, we can run search queries. Below we will provide a function that will run a search query and return the results. Using this function we run a few queries that will show how you can utilize Redis as a vector database.
```
`def search\_redis(
redis\_client: redis.Redis,
user\_query: str,
index\_name: str = "product\_embeddings",
vector\_field: str = "product\_vector",
return\_fields: list = ["productDisplayName", "masterCategory", "gender", "season", "year", "vector\_score"],
hybrid\_fields = "\*",
k: int = 20,
print\_results: bool = True,
) -\> List[dict]:
# Use OpenAI to create embedding vector from user query
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
for i, product in enumerate(results.docs):
score = 1 - float(product.vector\_score)
print(f"{i}. {product.productDisplayName} (Score: {round(score ,3) })")
return results.docs`
```
```
`# Execute a simple vector search in Redis
results = search\_redis(redis\_client, 'man blue jeans', k=10)`
```
```
`0. John Players Men Blue Jeans (Score: 0.791)
1. Lee Men Tino Blue Jeans (Score: 0.775)
2. Peter England Men Party Blue Jeans (Score: 0.763)
3. Lee Men Blue Chicago Fit Jeans (Score: 0.761)
4. Lee Men Blue Chicago Fit Jeans (Score: 0.761)
5. French Connection Men Blue Jeans (Score: 0.74)
6. Locomotive Men Washed Blue Jeans (Score: 0.739)
7. Locomotive Men Washed Blue Jeans (Score: 0.739)
8. Do U Speak Green Men Blue Shorts (Score: 0.736)
9. Palm Tree Kids Boy Washed Blue Jeans (Score: 0.732)`
```
## Hybrid Queries with Redis
The previous examples showed how run vector search queries with RediSearch. In this section, we will show how to combine vector search with other RediSearch fields for hybrid search. In the example below, we will combine vector search with full text search.
```
`# improve search quality by adding hybrid query for "man blue jeans" in the product vector combined with a phrase search for "blue jeans"
results = search\_redis(redis\_client,
"man blue jeans",
vector\_field="product\_vector",
k=10,
hybrid\_fields='@productDisplayName:"blue jeans"'
)`
```
```
`0. John Players Men Blue Jeans (Score: 0.791)
1. Lee Men Tino Blue Jeans (Score: 0.775)
2. Peter England Men Party Blue Jeans (Score: 0.763)
3. French Connection Men Blue Jeans (Score: 0.74)
4. Locomotive Men Washed Blue Jeans (Score: 0.739)
5. Locomotive Men Washed Blue Jeans (Score: 0.739)
6. Palm Tree Kids Boy Washed Blue Jeans (Score: 0.732)
7. Denizen Women Blue Jeans (Score: 0.725)
8. Jealous 21 Women Washed Blue Jeans (Score: 0.713)
9. Jealous 21 Women Washed Blue Jeans (Score: 0.713)`
```
```
`# hybrid query for shirt in the product vector and only include results with the phrase "slim fit" in the title
results = search\_redis(redis\_client,
"shirt",
vector\_field="product\_vector",
k=10,
hybrid\_fields='@productDisplayName:"slim fit"'
)`
```
```
`0. Basics Men White Slim Fit Striped Shirt (Score: 0.633)
1. ADIDAS Men's Slim Fit White T-shirt (Score: 0.628)
2. Basics Men Blue Slim Fit Checked Shirt (Score: 0.627)
3. Basics Men Blue Slim Fit Checked Shirt (Score: 0.627)
4. Basics Men Red Slim Fit Checked Shirt (Score: 0.623)
5. Basics Men Navy Slim Fit Checked Shirt (Score: 0.613)
6. Lee Rinse Navy Blue Slim Fit Jeans (Score: 0.558)
7. Tokyo Talkies Women Navy Slim Fit Jeans (Score: 0.552)`
```
```
`# hybrid query for watch in the product vector and only include results with the tag "Accessories" in the masterCategory field
results = search\_redis(redis\_client,
"watch",
vector\_field="product\_vector",
k=10,
hybrid\_fields='@masterCategory:{Accessories}'
)`
```
```
`0. Titan Women Gold Watch (Score: 0.544)
1. Being Human Men Grey Dial Blue Strap Watch (Score: 0.544)
2. Police Men Black Dial Watch PL12170JSB (Score: 0.544)
3. Titan Men Black Watch (Score: 0.543)
4. Police Men Black Dial Chronograph Watch PL12777JS-02M (Score: 0.542)
5. CASIO Youth Series Digital Men Black Small Dial Digital Watch W-210-1CVDF I065 (Score: 0.542)
6. Titan Women Silver Watch (Score: 0.542)
7. Police Men Black Dial Watch PL12778MSU-61 (Score: 0.541)
8. Titan Raga Women Gold Watch (Score: 0.539)
9. ADIDAS Original Men Black Dial Chronograph Watch ADH2641 (Score: 0.539)`
```
```
`# hybrid query for sandals in the product vector and only include results within the 2011-2012 year range
results = search\_redis(redis\_client,
"sandals",
vector\_field="product\_vector",
k=10,
hybrid\_fields='@year:[2011 2012]'
)`
```
```
`0. Enroute Teens Orange Sandals (Score: 0.701)
1. Fila Men Camper Brown Sandals (Score: 0.692)
2. Clarks Men Black Leather Closed Sandals (Score: 0.691)
3. Coolers Men Black Sandals (Score: 0.69)
4. Coolers Men Black Sandals (Score: 0.69)
5. Enroute Teens Brown Sandals (Score: 0.69)
6. Crocs Dora Boots Pink Sandals (Score: 0.69)
7. Enroute Men Leather Black Sandals (Score: 0.685)
8. ADIDAS Men Navy Blue Benton Sandals (Score: 0.684)
9. Coolers Men Black Sports Sandals (Score: 0.684)`
```
```
`# hybrid query for sandals in the product vector and only include results within the 2011-2012 year range from the summer season
results = search\_redis(redis\_client,
"blue sandals",
vector\_field="product\_vector",
k=10,
hybrid\_fields='(@year:[2011 2012] @season:{Summer})'
)`
```
```
`0. ADIDAS Men Navy Blue Benton Sandals (Score: 0.691)
1. Enroute Teens Brown Sandals (Score: 0.681)
2. ADIDAS Women's Adi Groove Blue Flip Flop (Score: 0.672)
3. Enroute Women Turquoise Blue Flats (Score: 0.671)
4. Red Tape Men Black Sandals (Score: 0.67)
5. Enroute Teens Orange Sandals (Score: 0.661)
6. Vans Men Blue Era Scilla Plaid Shoes (Score: 0.658)
7. FILA Men Aruba Navy Blue Sandal (Score: 0.657)
8. Quiksilver Men Blue Flip Flops (Score: 0.656)
9. Reebok Men Navy Twist Sandals (Score: 0.656)`
```
```
`# hybrid query for a brown belt filtering results by a year (NUMERIC) with a specific article types (TAG) and with a brand name (TEXT)
results = search\_redis(redis\_client,
"brown belt",
vector\_field="product\_vector",
k=10,
hybrid\_fields='(@year:[2012 2012] @articleType:{Shirts | Belts} @productDisplayName:"Wrangler")'
)`
```
```
`0. Wrangler Men Leather Brown Belt (Score: 0.67)
1. Wrangler Women Black Belt (Score: 0.639)
2. Wrangler Men Green Striped Shirt (Score: 0.575)
3. Wrangler Men Purple Striped Shirt (Score: 0.549)
4. Wrangler Men Griffith White Shirt (Score: 0.543)
5. Wrangler Women Stella Green Shirt (Score: 0.542)`
```