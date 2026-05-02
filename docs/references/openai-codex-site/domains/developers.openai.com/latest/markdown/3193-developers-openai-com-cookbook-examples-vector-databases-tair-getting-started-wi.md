Using Tair as a vector database for OpenAI embeddings
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
Sep 11, 2023
# Using Tair as a vector database for OpenAI embeddings
[ DO ](https://github.com/dongqqcom)
[ dongqqcom ](https://github.com/dongqqcom)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/tair/Getting_started_with_Tair_and_OpenAI.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/tair/Getting_started_with_Tair_and_OpenAI.ipynb)
This notebook guides you step by step on using Tair as a vector database for OpenAI embeddings.
This notebook presents an end-to-end process of:
1. Using precomputed embeddings created by OpenAI API.
2. Storing the embeddings in a cloud instance of Tair.
3. Converting raw text query to an embedding with OpenAI API.
4. Using Tair to perform the nearest neighbour search in the created collection.
### What is Tair
[Tair](https://www.alibabacloud.com/help/en/tair/latest/what-is-tair) is a cloud native in-memory database service that is developed by Alibaba Cloud. Tair is compatible with open source Redis and provides a variety of data models and enterprise-class capabilities to support your real-time online scenarios. Tair also introduces persistent memory-optimized instances that are based on the new non-volatile memory (NVM) storage medium. These instances can reduce costs by 30%, ensure data persistence, and provide almost the same performance as in-memory databases. Tair has been widely used in areas such as government affairs, finance, manufacturing, healthcare, and pan-Internet to meet their high-speed query and computing requirements.
[Tairvector](https://www.alibabacloud.com/help/en/tair/latest/tairvector) is an in-house data structure that provides high-performance real-time storage and retrieval of vectors. TairVector provides two indexing algorithms: Hierarchical Navigable Small World (HNSW) and Flat Search. Additionally, TairVector supports multiple distance functions, such as Euclidean distance, inner product, and Jaccard distance. Compared with traditional vector retrieval services, TairVector has the following advantages:
* Stores all data in memory and supports real-time index updates to reduce latency of read and write operations.
* Uses an optimized data structure in memory to better utilize storage capacity.
* Functions as an out-of-the-box data structure in a simple and efficient architecture without complex modules or dependencies.
### Deployment options
* Using [Tair Cloud Vector Database](https://www.alibabacloud.com/help/en/tair/latest/getting-started-overview). [Click here](https://www.alibabacloud.com/product/tair) to fast deploy it.
## Prerequisites
For the purposes of this exercise we need to prepare a couple of things:
1. Tair cloud server instance.
2. The ‘tair’ library to interact with the tair database.
3. An [OpenAI API key](https://beta.openai.com/account/api-keys).
### Install requirements
This notebook obviously requires the `openai` and `tair` packages, but there are also some other additional libraries we will use. The following command installs them all:
```
`! pip install openai redis tair pandas wget`
```
```
`Looking in indexes: http://sg.mirrors.cloud.aliyuncs.com/pypi/simple/
Requirement already satisfied: openai in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (0.28.0)
Requirement already satisfied: redis in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (5.0.0)
Requirement already satisfied: tair in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (1.3.6)
Requirement already satisfied: pandas in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (2.1.0)
Requirement already satisfied: wget in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (3.2)
Requirement already satisfied: requests\>=2.20 in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from openai) (2.31.0)
Requirement already satisfied: tqdm in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from openai) (4.66.1)
Requirement already satisfied: aiohttp in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from openai) (3.8.5)
Requirement already satisfied: async-timeout\>=4.0.2 in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from redis) (4.0.3)
Requirement already satisfied: numpy\>=1.22.4 in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from pandas) (1.25.2)
Requirement already satisfied: python-dateutil\>=2.8.2 in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from pandas) (2.8.2)
Requirement already satisfied: pytz\>=2020.1 in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from pandas) (2023.3.post1)
Requirement already satisfied: tzdata\>=2022.1 in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from pandas) (2023.3)
Requirement already satisfied: six\>=1.5 in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from python-dateutil\>=2.8.2-\>pandas) (1.16.0)
Requirement already satisfied: charset-normalizer\<4,\>=2 in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from requests\>=2.20-\>openai) (3.2.0)
Requirement already satisfied: idna\<4,\>=2.5 in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from requests\>=2.20-\>openai) (3.4)
Requirement already satisfied: urllib3\<3,\>=1.21.1 in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from requests\>=2.20-\>openai) (2.0.4)
Requirement already satisfied: certifi\>=2017.4.17 in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from requests\>=2.20-\>openai) (2023.7.22)
Requirement already satisfied: attrs\>=17.3.0 in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from aiohttp-\>openai) (22.1.0)
Requirement already satisfied: multidict\<7.0,\>=4.5 in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from aiohttp-\>openai) (6.0.4)
Requirement already satisfied: yarl\<2.0,\>=1.0 in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from aiohttp-\>openai) (1.9.2)
Requirement already satisfied: frozenlist\>=1.1.1 in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from aiohttp-\>openai) (1.4.0)
Requirement already satisfied: aiosignal\>=1.1.2 in /root/anaconda3/envs/notebook/lib/python3.10/site-packages (from aiohttp-\>openai) (1.3.1)
[33mWARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv[0m[33m
[0m`
```
### Prepare your OpenAI API key
The OpenAI API key is used for vectorization of the documents and queries.
If you don’t have an OpenAI API key, you can get one from [https://beta.openai.com/account/api-keys](https://beta.openai.com/account/api-keys).
Once you get your key, please add it by getpass.
```
`import getpass
import openai
openai.api\_key = getpass.getpass("Input your OpenAI API key:")`
```
```
`Input your OpenAI API key:········`
```
## Connect to Tair
First add it to your environment variables.
Connecting to a running instance of Tair server is easy with the official Python library.
```
`# The format of url: redis://[[username]:[password]]@localhost:6379/0
TAIR\_URL = getpass.getpass("Input your tair url:")`
```
```
`Input your tair url:········`
```
```
`from tair import Tair as TairClient
# connect to tair from url and create a client
url = TAIR\_URL
client = TairClient.from\_url(url)`
```
We can test the connection by ping:
```
`client.ping()`
```
```
`True`
```
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
`'vector\_database\_wikipedia\_articles\_embedded (1).zip'`
```
The downloaded file has to then be extracted:
```
`import zipfile
import os
import re
import tempfile
current\_directory = os.getcwd()
zip\_file\_path = os.path.join(current\_directory, "vector\_database\_wikipedia\_articles\_embedded.zip")
output\_directory = os.path.join(current\_directory, "../../data")
with zipfile.ZipFile(zip\_file\_path, "r") as zip\_ref:
zip\_ref.extractall(output\_directory)
# check the csv file exist
file\_name = "vector\_database\_wikipedia\_articles\_embedded.csv"
data\_directory = os.path.join(current\_directory, "../../data")
file\_path = os.path.join(data\_directory, file\_name)
if os.path.exists(file\_path):
print(f"The file {file\_name} exists in the data directory.")
else:
print(f"The file {file\_name} does not exist in the data directory.")`
```
```
`The file vector\_database\_wikipedia\_articles\_embedded.csv exists in the data directory.`
```
## Create Index
Tair stores data in indexes where each object is described by one key. Each key contains a vector and multiple attribute\_keys.
We will start with creating two indexes, one for **title\_vector** and one for **content\_vector**, and then we will fill it with our precomputed embeddings.
```
`# set index parameters
index = "openai\_test"
embedding\_dim = 1536
distance\_type = "L2"
index\_type = "HNSW"
data\_type = "FLOAT32"
# Create two indexes, one for title\_vector and one for content\_vector, skip if already exists
index\_names = [index + "\_title\_vector", index+"\_content\_vector"]
for index\_name in index\_names:
index\_connection = client.tvs\_get\_index(index\_name)
if index\_connection is not None:
print("Index already exists")
else:
client.tvs\_create\_index(name=index\_name, dim=embedding\_dim, distance\_type=distance\_type,
index\_type=index\_type, data\_type=data\_type)`
```
```
`Index already exists
Index already exists`
```
## Load data
In this section we are going to load the data prepared previous to this session, so you don’t have to recompute the embeddings of Wikipedia articles with your own credits.
```
`import pandas as pd
from ast import literal\_eval
# Path to your local CSV file
csv\_file\_path = '../../data/vector\_database\_wikipedia\_articles\_embedded.csv'
article\_df = pd.read\_csv(csv\_file\_path)
# Read vectors from strings back into a list
article\_df['title\_vector'] = article\_df.title\_vector.apply(literal\_eval).values
article\_df['content\_vector'] = article\_df.content\_vector.apply(literal\_eval).values
# add/update data to indexes
for i in range(len(article\_df)):
# add data to index with title\_vector
client.tvs\_hset(index=index\_names[0], key=article\_df.id[i].item(), vector=article\_df.title\_vector[i], is\_binary=False,
\*\*{"url": article\_df.url[i], "title": article\_df.title[i], "text": article\_df.text[i]})
# add data to index with content\_vector
client.tvs\_hset(index=index\_names[1], key=article\_df.id[i].item(), vector=article\_df.content\_vector[i], is\_binary=False,
\*\*{"url": article\_df.url[i], "title": article\_df.title[i], "text": article\_df.text[i]})`
```
```
`# Check the data count to make sure all the points have been stored
for index\_name in index\_names:
stats = client.tvs\_get\_index(index\_name)
count = int(stats["current\_record\_count"]) - int(stats["delete\_record\_count"])
print(f"Count in {index\_name}:{count}")`
```
```
`Count in openai\_test\_title\_vector:25000
Count in openai\_test\_content\_vector:25000`
```
## Search data
Once the data is put into Tair we will start querying the collection for the closest vectors. We may provide an additional parameter `vector\_name` to switch from title to content based search. Since the precomputed embeddings were created with `text-embedding-3-small` OpenAI model, we also have to use it during search.
```
`def query\_tair(client, query, vector\_name="title\_vector", top\_k=5):
# Creates embedding vector from user query
embedded\_query = openai.Embedding.create(
input= query,
model="text-embedding-3-small",
)["data"][0]['embedding']
embedded\_query = np.array(embedded\_query)
# search for the top k approximate nearest neighbors of vector in an index
query\_result = client.tvs\_knnsearch(index=index+"\_"+vector\_name, k=top\_k, vector=embedded\_query)
return query\_result`
```
```
`import openai
import numpy as np
query\_result = query\_tair(client=client, query="modern art in Europe", vector\_name="title\_vector")
for i in range(len(query\_result)):
title = client.tvs\_hmget(index+"\_"+"content\_vector", query\_result[i][0].decode('utf-8'), "title")
print(f"{i + 1}. {title[0].decode('utf-8')} (Distance: {round(query\_result[i][1],3)})")`
```
```
`1. Museum of Modern Art (Distance: 0.125)
2. Western Europe (Distance: 0.133)
3. Renaissance art (Distance: 0.136)
4. Pop art (Distance: 0.14)
5. Northern Europe (Distance: 0.145)`
```
```
`# This time we'll query using content vector
query\_result = query\_tair(client=client, query="Famous battles in Scottish history", vector\_name="content\_vector")
for i in range(len(query\_result)):
title = client.tvs\_hmget(index+"\_"+"content\_vector", query\_result[i][0].decode('utf-8'), "title")
print(f"{i + 1}. {title[0].decode('utf-8')} (Distance: {round(query\_result[i][1],3)})")`
```
```
`1. Battle of Bannockburn (Distance: 0.131)
2. Wars of Scottish Independence (Distance: 0.139)
3. 1651 (Distance: 0.147)
4. First War of Scottish Independence (Distance: 0.15)
5. Robert I of Scotland (Distance: 0.154)`
```