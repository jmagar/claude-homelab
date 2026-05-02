Using Hologres as a vector database for OpenAI embeddings
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
May 19, 2023
# Using Hologres as a vector database for OpenAI embeddings
[ ZC ](https://github.com/zcgeng)
[ zcgeng ](https://github.com/zcgeng)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/hologres/Getting_started_with_Hologres_and_OpenAI.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/hologres/Getting_started_with_Hologres_and_OpenAI.ipynb)
This notebook guides you step by step on using Hologres as a vector database for OpenAI embeddings.
This notebook presents an end-to-end process of:
1. Using precomputed embeddings created by OpenAI API.
2. Storing the embeddings in a cloud instance of Hologres.
3. Converting raw text query to an embedding with OpenAI API.
4. Using Hologres to perform the nearest neighbour search in the created collection.
5. Provide large language models with the search results as context in prompt engineering
### What is Hologres
[Hologres](https://www.alibabacloud.com/help/en/hologres/latest/what-is-hologres) is a unified real-time data warehousing service developed by Alibaba Cloud. You can use Hologres to write, update, process, and analyze large amounts of data in real time. Hologres supports standard SQL syntax, is compatible with PostgreSQL, and supports most PostgreSQL functions. Hologres supports online analytical processing (OLAP) and ad hoc analysis for up to petabytes of data, and provides high-concurrency and low-latency online data services. Hologres supports fine-grained isolation of multiple workloads and enterprise-level security capabilities. Hologres is deeply integrated with MaxCompute, Realtime Compute for Apache Flink, and DataWorks, and provides full-stack online and offline data warehousing solutions for enterprises.
Hologres provides vector database functionality by adopting [Proxima](https://www.alibabacloud.com/help/en/hologres/latest/vector-processing).
Proxima is a high-performance software library developed by Alibaba DAMO Academy. It allows you to search for the nearest neighbors of vectors. Proxima provides higher stability and performance than similar open source software such as Facebook AI Similarity Search (Faiss). Proxima provides basic modules that have leading performance and effects in the industry and allows you to search for similar images, videos, or human faces. Hologres is deeply integrated with Proxima to provide a high-performance vector search service.
### Deployment options
* [Click here](https://www.alibabacloud.com/product/hologres) to fast deploy [Hologres data warehouse](https://www.alibabacloud.com/help/en/hologres/latest/getting-started).
## Prerequisites
For the purposes of this exercise we need to prepare a couple of things:
1. Hologres cloud server instance.
2. The ‘psycopg2-binary’ library to interact with the vector database. Any other postgresql client library is ok.
3. An [OpenAI API key](https://beta.openai.com/account/api-keys).
We might validate if the server was launched successfully by running a simple curl command:
### Install requirements
This notebook obviously requires the `openai` and `psycopg2-binary` packages, but there are also some other additional libraries we will use. The following command installs them all:
```
`! pip install openai psycopg2-binary pandas wget`
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
## Connect to Hologres
First add it to your environment variables. or you can just change the “psycopg2.connect” parameters below
Connecting to a running instance of Hologres server is easy with the official Python library:
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
connection.set\_session(autocommit=True)
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
## Load data
In this section we are going to load the data prepared previous to this session, so you don’t have to recompute the embeddings of Wikipedia articles with your own credits.
```
`!unzip -n vector\_database\_wikipedia\_articles\_embedded.zip
!ls -lh vector\_database\_wikipedia\_articles\_embedded.csv`
```
```
`Archive: vector\_database\_wikipedia\_articles\_embedded.zip
-rw-r--r--@ 1 geng staff 1.7G Jan 31 01:19 vector\_database\_wikipedia\_articles\_embedded.csv`
```
Take a look at the data.
```
`import pandas, json
data = pandas.read\_csv('../../data/vector\_database\_wikipedia\_articles\_embedded.csv')
data`
```
||id|url|title|text|title\_vector|content\_vector|vector\_id|
|0|1|https://simple.wikipedia.org/wiki/April|April|April is the fourth month of the year in the J...|[0.001009464613161981, -0.020700545981526375, ...|[-0.011253940872848034, -0.013491976074874401,...|0|
|1|2|https://simple.wikipedia.org/wiki/August|August|August (Aug.) is the eighth month of the year ...|[0.0009286514250561595, 0.000820168002974242, ...|[0.0003609954728744924, 0.007262262050062418, ...|1|
|2|6|https://simple.wikipedia.org/wiki/Art|Art|Art is a creative activity that expresses imag...|[0.003393713850528002, 0.0061537534929811954, ...|[-0.004959689453244209, 0.015772193670272827, ...|2|
|3|8|https://simple.wikipedia.org/wiki/A|A|A or a is the first letter of the English alph...|[0.0153952119871974, -0.013759135268628597, 0....|[0.024894846603274345, -0.022186409682035446, ...|3|
|4|9|https://simple.wikipedia.org/wiki/Air|Air|Air refers to the Earth's atmosphere. Air is a...|[0.02224554680287838, -0.02044147066771984, -0...|[0.021524671465158463, 0.018522677943110466, -...|4|
|...|...|...|...|...|...|...|...|
|24995|98295|https://simple.wikipedia.org/wiki/Geneva|Geneva|Geneva (, , , , ) is the second biggest cit...|[-0.015773078426718712, 0.01737344264984131, 0...|[0.008000412955880165, 0.02008531428873539, 0....|24995|
|24996|98316|https://simple.wikipedia.org/wiki/Concubinage|Concubinage|Concubinage is the state of a woman in a relat...|[-0.00519518880173564, 0.005898841191083193, 0...|[-0.01736736111342907, -0.002740012714639306, ...|24996|
|24997|98318|https://simple.wikipedia.org/wiki/Mistress%20%...|Mistress (lover)|A mistress is a man's long term female sexual ...|[-0.023164259269833565, -0.02052430994808674, ...|[-0.017878392711281776, -0.0004517830966506153...|24997|
|24998|98326|https://simple.wikipedia.org/wiki/Eastern%20Front|Eastern Front|Eastern Front can be one of the following:\\n\\n...|[-0.00681863259524107, 0.002171179046854377, 8...|[-0.0019235472427681088, -0.004023272544145584...|24998|
|24999|98327|https://simple.wikipedia.org/wiki/Italian%20Ca...|Italian Campaign|Italian Campaign can mean the following:\\n\\nTh...|[-0.014151256531476974, -0.008553029969334602,...|[-0.011758845299482346, -0.01346028596162796, ...|24999|
25000 rows × 7 columns
```
`title\_vector\_length = len(json.loads(data['title\_vector'].iloc[0]))
content\_vector\_length = len(json.loads(data['content\_vector'].iloc[0]))
print(title\_vector\_length, content\_vector\_length)`
```
```
`1536 1536`
```
### Create table and proxima vector index
Hologres stores data in **tables** where each object is described by at least one vector. Our table will be called **articles** and each object will be described by both **title** and **content** vectors.
We will start with creating a table and create proxima indexes on both **title** and **content**, and then we will fill it with our precomputed embeddings.
```
`cursor.execute('CREATE EXTENSION IF NOT EXISTS proxima;')
create\_proxima\_table\_sql = '''
BEGIN;
DROP TABLE IF EXISTS articles;
CREATE TABLE articles (
id INT PRIMARY KEY NOT NULL,
url TEXT,
title TEXT,
content TEXT,
title\_vector float4[] check(
array\_ndims(title\_vector) = 1 and
array\_length(title\_vector, 1) = 1536
), -- define the vectors
content\_vector float4[] check(
array\_ndims(content\_vector) = 1 and
array\_length(content\_vector, 1) = 1536
),
vector\_id INT
);
-- Create indexes for the vector fields.
call set\_table\_property(
'articles',
'proxima\_vectors',
'{
"title\_vector":{"algorithm":"Graph","distance\_method":"Euclidean","builder\_params":{"min\_flush\_proxima\_row\_count" : 10}},
"content\_vector":{"algorithm":"Graph","distance\_method":"Euclidean","builder\_params":{"min\_flush\_proxima\_row\_count" : 10}}
}'
);
COMMIT;
'''
# Execute the SQL statements (will autocommit)
cursor.execute(create\_proxima\_table\_sql)`
```
### Upload data
Now let’s upload the data to the Hologres cloud instance using [COPY statement](https://www.alibabacloud.com/help/en/hologres/latest/use-the-copy-statement-to-import-or-export-data). This might take 5-10 minutes according to the network bandwidth.
```
`import io
# Path to the unzipped CSV file
csv\_file\_path = '../../data/vector\_database\_wikipedia\_articles\_embedded.csv'
# In SQL, arrays are surrounded by {}, rather than []
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
cursor.copy\_expert(copy\_command, modified\_lines)`
```
The proxima index will be built in the background. We can do searching during this period but the query will be slow without the vector index. Use this command to wait for finish building the index.
```
`cursor.execute('vacuum articles;')`
```
```
`# Check the collection size to make sure all the points have been stored
count\_sql = "select count(\*) from articles;"
cursor.execute(count\_sql)
result = cursor.fetchone()
print(f"Count:{result[0]}")`
```
```
`Count:25000`
```
## Search data
Once the data is uploaded we will start querying the collection for the closest vectors. We may provide an additional parameter `vector\_name` to switch from title to content based search. Since the precomputed embeddings were created with `text-embedding-3-small` OpenAI model we also have to use it during search.
```
`import openai
def query\_knn(query, table\_name, vector\_name="title\_vector", top\_k=20):
# Creates embedding vector from user query
embedded\_query = openai.Embedding.create(
input=query,
model="text-embedding-3-small",
)["data"][0]["embedding"]
# Convert the embedded\_query to PostgreSQL compatible format
embedded\_query\_pg = "{" + ",".join(map(str, embedded\_query)) + "}"
# Create SQL query
query\_sql = f"""
SELECT id, url, title, pm\_approx\_euclidean\_distance({vector\_name},'{embedded\_query\_pg}'::float4[]) AS distance
FROM {table\_name}
ORDER BY distance
LIMIT {top\_k};
"""
# Execute the query
cursor.execute(query\_sql)
results = cursor.fetchall()
return results`
```
```
`query\_results = query\_knn("modern art in Europe", "Articles")
for i, result in enumerate(query\_results):
print(f"{i + 1}. {result[2]} (Score: {round(1 - result[3], 3)})")`
```
```
`1. Museum of Modern Art (Score: 0.501)
2. Western Europe (Score: 0.485)
3. Renaissance art (Score: 0.479)
4. Pop art (Score: 0.472)
5. Northern Europe (Score: 0.461)
6. Hellenistic art (Score: 0.458)
7. Modernist literature (Score: 0.447)
8. Art film (Score: 0.44)
9. Central Europe (Score: 0.439)
10. Art (Score: 0.437)
11. European (Score: 0.437)
12. Byzantine art (Score: 0.436)
13. Postmodernism (Score: 0.435)
14. Eastern Europe (Score: 0.433)
15. Cubism (Score: 0.433)
16. Europe (Score: 0.432)
17. Impressionism (Score: 0.432)
18. Bauhaus (Score: 0.431)
19. Surrealism (Score: 0.429)
20. Expressionism (Score: 0.429)`
```
```
`# This time we'll query using content vector
query\_results = query\_knn("Famous battles in Scottish history", "Articles", "content\_vector")
for i, result in enumerate(query\_results):
print(f"{i + 1}. {result[2]} (Score: {round(1 - result[3], 3)})")`
```
```
`1. Battle of Bannockburn (Score: 0.489)
2. Wars of Scottish Independence (Score: 0.474)
3. 1651 (Score: 0.457)
4. First War of Scottish Independence (Score: 0.452)
5. Robert I of Scotland (Score: 0.445)
6. 841 (Score: 0.441)
7. 1716 (Score: 0.441)
8. 1314 (Score: 0.429)
9. 1263 (Score: 0.428)
10. William Wallace (Score: 0.426)
11. Stirling (Score: 0.419)
12. 1306 (Score: 0.419)
13. 1746 (Score: 0.418)
14. 1040s (Score: 0.414)
15. 1106 (Score: 0.412)
16. 1304 (Score: 0.411)
17. David II of Scotland (Score: 0.408)
18. Braveheart (Score: 0.407)
19. 1124 (Score: 0.406)
20. July 27 (Score: 0.405)`
```