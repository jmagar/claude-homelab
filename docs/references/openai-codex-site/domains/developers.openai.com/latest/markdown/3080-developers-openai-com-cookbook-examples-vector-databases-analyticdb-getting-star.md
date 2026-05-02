Using AnalyticDB as a vector database for OpenAI embeddings
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
Apr 6, 2023
# Using AnalyticDB as a vector database for OpenAI embeddings
This recipe is archived and may reference outdated models or APIs.
[ WA ](https://github.com/wangxuqi)
[ wangxuqi ](https://github.com/wangxuqi)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/analyticdb/Getting_started_with_AnalyticDB_and_OpenAI.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/analyticdb/Getting_started_with_AnalyticDB_and_OpenAI.ipynb)
This notebook guides you step by step on using AnalyticDB as a vector database for OpenAI embeddings.
This notebook presents an end-to-end process of:
1. Using precomputed embeddings created by OpenAI API.
2. Storing the embeddings in a cloud instance of AnalyticDB.
3. Converting raw text query to an embedding with OpenAI API.
4. Using AnalyticDB to perform the nearest neighbour search in the created collection.
### What is AnalyticDB
[AnalyticDB](https://www.alibabacloud.com/help/en/analyticdb-for-postgresql/latest/product-introduction-overview) is a high-performance distributed vector database. Fully compatible with PostgreSQL syntax, you can effortlessly utilize it. AnalyticDB is Alibaba Cloud managed cloud-native database with strong-performed vector compute engine. Absolute out-of-box experience allow to scale into billions of data vectors processing with rich features including indexing algorithms, structured & non-structured data features, realtime update, distance metrics, scalar filtering, time travel searches etc. Also equipped with full OLAP database functionality and SLA commitment for production usage promise;
### Deployment options
* Using [AnalyticDB Cloud Vector Database](https://www.alibabacloud.com/help/zh/analyticdb-for-postgresql/latest/overview-2). [Click here](https://www.alibabacloud.com/product/hybriddb-postgresql) to fast deploy it.
## Prerequisites
For the purposes of this exercise we need to prepare a couple of things:
1. AnalyticDB cloud server instance.
2. The ‘psycopg2’ library to interact with the vector database. Any other postgresql client library is ok.
3. An [OpenAI API key](https://beta.openai.com/account/api-keys).
We might validate if the server was launched successfully by running a simple curl command:
### Install requirements
This notebook obviously requires the `openai` and `psycopg2` packages, but there are also some other additional libraries we will use. The following command installs them all:
```
`! pip install openai psycopg2 pandas wget`
```
### Prepare your OpenAI API key
The OpenAI API key is used for vectorization of the documents and queries.
If you don’t have an OpenAI API key, you can get one from [https://beta.openai.com/account/api-keys](https://beta.openai.com/account/api-keys).
Once you get your key, please add it to your environment variables as `OPENAI\_API\_KEY`.
```
`# Test that your OpenAI API key is correctly set as an environment variable
# Note. if you run this notebook locally, you will need to reload your terminal and the notebook for the env variables to be live.
import os
# Note. alternatively you can set a temporary env variable like this:
# os.environ["OPENAI\_API\_KEY"] = "sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
if os.getenv("OPENAI\_API\_KEY") is not None:
print("OPENAI\_API\_KEY is ready")
else:
print("OPENAI\_API\_KEY environment variable not found")`
```
```
`OPENAI\_API\_KEY is ready`
```
## Connect to AnalyticDB
First add it to your environment variables. or you can just change the “psycopg2.connect” parameters below
Connecting to a running instance of AnalyticDB server is easy with the official Python library:
```
`import os
import psycopg2
# Note. alternatively you can set a temporary env variable like this:
# os.environ["PGHOST"] = "your\_host"
# os.environ["PGPORT"] "5432"),
# os.environ["PGDATABASE"] "postgres"),
# os.environ["PGUSER"] "user"),
# os.environ["PGPASSWORD"] "password"),
connection = psycopg2.connect(
host=os.environ.get("PGHOST", "localhost"),
port=os.environ.get("PGPORT", "5432"),
database=os.environ.get("PGDATABASE", "postgres"),
user=os.environ.get("PGUSER", "user"),
password=os.environ.get("PGPASSWORD", "password")
)
# Create a new cursor object
cursor = connection.cursor()`
```
We can test the connection by running any available method:
```
`
# Execute a simple query to test the connection
cursor.execute("SELECT 1;")
result = cursor.fetchone()
# Check the query result
if result == (1,):
print("Connection successful!")
else:
print("Connection failed.")`
```
```
`Connection successful!`
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
`'vector\_database\_wikipedia\_articles\_embedded.zip'`
```
The downloaded file has to be then extracted:
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
## Index data
AnalyticDB stores data in **relation** where each object is described by at least one vector. Our relation will be called **articles** and each object will be described by both **title** and **content** vectors. \\
We will start with creating a relation and create a vector index on both **title** and **content**, and then we will fill it with our precomputed embeddings.
```
`create\_table\_sql = '''
CREATE TABLE IF NOT EXISTS public.articles (
id INTEGER NOT NULL,
url TEXT,
title TEXT,
content TEXT,
title\_vector REAL[],
content\_vector REAL[],
vector\_id INTEGER
);
ALTER TABLE public.articles ADD PRIMARY KEY (id);
'''
# SQL statement for creating indexes
create\_indexes\_sql = '''
CREATE INDEX ON public.articles USING ann (content\_vector) WITH (distancemeasure = l2, dim = '1536', pq\_segments = '64', hnsw\_m = '100', pq\_centers = '2048');
CREATE INDEX ON public.articles USING ann (title\_vector) WITH (distancemeasure = l2, dim = '1536', pq\_segments = '64', hnsw\_m = '100', pq\_centers = '2048');
'''
# Execute the SQL statements
cursor.execute(create\_table\_sql)
cursor.execute(create\_indexes\_sql)
# Commit the changes
connection.commit()`
```
## Load data
In this section we are going to load the data prepared previous to this session, so you don’t have to recompute the embeddings of Wikipedia articles with your own credits.
```
`import io
# Path to your local CSV file
csv\_file\_path = '../../data/vector\_database\_wikipedia\_articles\_embedded.csv'
# Define a generator function to process the file line by line
def process\_file(file\_path):
with open(file\_path, 'r') as file:
for line in file:
# Replace '[' with '{' and ']' with '}'
modified\_line = line.replace('[', '{').replace(']', '}')
yield modified\_line
# Create a StringIO object to store the modified lines
modified\_lines = io.StringIO(''.join(list(process\_file(csv\_file\_path))))
# Create the COPY command for the copy\_expert method
copy\_command = '''
COPY public.articles (id, url, title, content, title\_vector, content\_vector, vector\_id)
FROM STDIN WITH (FORMAT CSV, HEADER true, DELIMITER ',');
'''
# Execute the COPY command using the copy\_expert method
cursor.copy\_expert(copy\_command, modified\_lines)
# Commit the changes
connection.commit()`
```
```
`# Check the collection size to make sure all the points have been stored
count\_sql = """select count(\*) from public.articles;"""
cursor.execute(count\_sql)
result = cursor.fetchone()
print(f"Count:{result[0]}")`
```
```
`Count:25000`
```
## Search data
Once the data is put into Qdrant we will start querying the collection for the closest vectors. We may provide an additional parameter `vector\_name` to switch from title to content based search. Since the precomputed embeddings were created with `text-embedding-3-small` OpenAI model we also have to use it during search.
```
`def query\_analyticdb(query, collection\_name, vector\_name="title\_vector", top\_k=20):
# Creates embedding vector from user query
embedded\_query = openai.Embedding.create(
input=query,
model="text-embedding-3-small",
)["data"][0]["embedding"]
# Convert the embedded\_query to PostgreSQL compatible format
embedded\_query\_pg = "{" + ",".join(map(str, embedded\_query)) + "}"
# Create SQL query
query\_sql = f"""
SELECT id, url, title, l2\_distance({vector\_name},'{embedded\_query\_pg}'::real[]) AS similarity
FROM {collection\_name}
ORDER BY {vector\_name} \<-\> '{embedded\_query\_pg}'::real[]
LIMIT {top\_k};
"""
# Execute the query
cursor.execute(query\_sql)
results = cursor.fetchall()
return results`
```
```
`import openai
query\_results = query\_analyticdb("modern art in Europe", "Articles")
for i, result in enumerate(query\_results):
print(f"{i + 1}. {result[2]} (Score: {round(1 - result[3], 3)})")`
```
```
`1. Museum of Modern Art (Score: 0.75)
2. Western Europe (Score: 0.735)
3. Renaissance art (Score: 0.728)
4. Pop art (Score: 0.721)
5. Northern Europe (Score: 0.71)
6. Hellenistic art (Score: 0.706)
7. Modernist literature (Score: 0.694)
8. Art film (Score: 0.687)
9. Central Europe (Score: 0.685)
10. European (Score: 0.683)
11. Art (Score: 0.683)
12. Byzantine art (Score: 0.682)
13. Postmodernism (Score: 0.68)
14. Eastern Europe (Score: 0.679)
15. Europe (Score: 0.678)
16. Cubism (Score: 0.678)
17. Impressionism (Score: 0.677)
18. Bauhaus (Score: 0.676)
19. Surrealism (Score: 0.674)
20. Expressionism (Score: 0.674)`
```
```
`# This time we'll query using content vector
query\_results = query\_analyticdb("Famous battles in Scottish history", "Articles", "content\_vector")
for i, result in enumerate(query\_results):
print(f"{i + 1}. {result[2]} (Score: {round(1 - result[3], 3)})")`
```
```
`1. Battle of Bannockburn (Score: 0.739)
2. Wars of Scottish Independence (Score: 0.723)
3. 1651 (Score: 0.705)
4. First War of Scottish Independence (Score: 0.699)
5. Robert I of Scotland (Score: 0.692)
6. 841 (Score: 0.688)
7. 1716 (Score: 0.688)
8. 1314 (Score: 0.674)
9. 1263 (Score: 0.673)
10. William Wallace (Score: 0.671)
11. Stirling (Score: 0.663)
12. 1306 (Score: 0.662)
13. 1746 (Score: 0.661)
14. 1040s (Score: 0.656)
15. 1106 (Score: 0.654)
16. 1304 (Score: 0.653)
17. David II of Scotland (Score: 0.65)
18. Braveheart (Score: 0.649)
19. 1124 (Score: 0.648)
20. July 27 (Score: 0.646)`
```