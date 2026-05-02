Vector similarity search using Neon Postgres
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
Sep 28, 2023
# Vector similarity search using Neon Postgres
[ DA ](https://github.com/danieltprice)
[ danieltprice ](https://github.com/danieltprice)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/neon/neon-postgres-vector-search-pgvector.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/neon/neon-postgres-vector-search-pgvector.ipynb)
This notebook guides you through using [Neon Serverless Postgres](https://neon.tech/) as a vector database for OpenAI embeddings. It demonstrates how to:
1. Use embeddings created by OpenAI API.
2. Store embeddings in a Neon Serverless Postgres database.
3. Convert a raw text query to an embedding with OpenAI API.
4. Use Neon with the `pgvector` extension to perform vector similarity search.
## Prerequisites
Before you begin, ensure that you have the following:
1. A Neon Postgres database. You can create an account and set up a project with a ready-to-use `neondb` database in a few simple steps. For instructions, see [Sign up](https://neon.tech/docs/get-started-with-neon/signing-up) and [Create your first project](https://neon.tech/docs/get-started-with-neon/setting-up-a-project).
2. A connection string for your Neon database. You can copy it from the **Connection Details** widget on the Neon **Dashboard**. See [Connect from any application](https://neon.tech/docs/connect/connect-from-any-app).
3. The `pgvector` extension. Install the extension in Neon by running `CREATE EXTENSION vector;`. For instructions, see [Enable the pgvector extension](https://neon.tech/docs/extensions/pgvector#enable-the-pgvector-extension).
4. Your [OpenAI API key](https://platform.openai.com/account/api-keys).
5. Python and `pip`.
### Install required modules
This notebook requires the `openai`, `psycopg2`, `pandas`, `wget`, and `python-dotenv` packages. You can install them with `pip`:
```
`! pip install openai psycopg2 pandas wget python-dotenv`
```
### Prepare your OpenAI API key
An OpenAI API key is required to generate vectors for documents and queries.
If you do not have an OpenAI API key, obtain one from [https://platform.openai.com/account/api-keys](https://platform.openai.com/account/api-keys).
Add the OpenAI API key as an operating system environment variable or provide it for the session when prompted. If you define an environment variable, name the variable `OPENAI\_API\_KEY`.
For information about configuring your OpenAI API key as an environment variable, refer to [Best Practices for API Key Safety](https://help.openai.com/en/articles/5112595-best-practices-for-api-key-safety).
### Test your OpenAPI key
```
`# Test to ensure that your OpenAI API key is defined as an environment variable or provide it when prompted
# If you run this notebook locally, you may have to reload the terminal and the notebook to make the environment available
import os
from getpass import getpass
# Check if OPENAI\_API\_KEY is set as an environment variable
if os.getenv("OPENAI\_API\_KEY") is not None:
print("Your OPENAI\_API\_KEY is ready")
else:
# If not, prompt for it
api\_key = getpass("Enter your OPENAI\_API\_KEY: ")
if api\_key:
print("Your OPENAI\_API\_KEY is now available for this session")
# Optionally, you can set it as an environment variable for the current session
os.environ["OPENAI\_API\_KEY"] = api\_key
else:
print("You did not enter your OPENAI\_API\_KEY")`
```
```
`Your OPENAI\_API\_KEY is ready`
```
## Connect to your Neon database
Provide your Neon database connection string below or define it in an `.env` file using a `DATABASE\_URL` variable. For information about obtaining a Neon connection string, see [Connect from any application](https://neon.tech/docs/connect/connect-from-any-app).
```
`import os
import psycopg2
from dotenv import load\_dotenv
# Load environment variables from .env file
load\_dotenv()
# The connection string can be provided directly here.
# Replace the next line with Your Neon connection string.
connection\_string = "postgres://\<user\>:\<password\>@\<hostname\>/\<dbname\>"
# If connection\_string is not directly provided above,
# then check if DATABASE\_URL is set in the environment or .env.
if not connection\_string:
connection\_string = os.environ.get("DATABASE\_URL")
# If neither method provides a connection string, raise an error.
if not connection\_string:
raise ValueError("Please provide a valid connection string either in the code or in the .env file as DATABASE\_URL.")
# Connect using the connection string
connection = psycopg2.connect(connection\_string)
# Create a new cursor object
cursor = connection.cursor()`
```
Test the connection to your database:
```
`# Execute this query to test the database connection
cursor.execute("SELECT 1;")
result = cursor.fetchone()
# Check the query result
if result == (1,):
print("Your database connection was successful!")
else:
print("Your connection failed.")`
```
```
`Your database connection was successful!`
```
This guide uses pre-computed Wikipedia article embeddings available in the OpenAI Cookbook `examples` directory so that you do not have to compute embeddings with your own OpenAI credits.
Import the pre-computed embeddings zip file:
```
`import wget
embeddings\_url = "https://cdn.openai.com/API/examples/data/vector\_database\_wikipedia\_articles\_embedded.zip"
# The file is \~700 MB. Importing it will take several minutes.
wget.download(embeddings\_url)`
```
```
`'vector\_database\_wikipedia\_articles\_embedded.zip'`
```
Extract the downloaded zip file:
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
# Check to see if the csv file was extracted
file\_name = "vector\_database\_wikipedia\_articles\_embedded.csv"
data\_directory = os.path.join(current\_directory, "../../data")
file\_path = os.path.join(data\_directory, file\_name)
if os.path.exists(file\_path):
print(f"The csv file {file\_name} exists in the data directory.")
else:
print(f"The csv file {file\_name} does not exist in the data directory.")`
```
```
`The file vector\_database\_wikipedia\_articles\_embedded.csv exists in the data directory.`
```
## Create a table and add indexes for your vector embeddings
The vector table created in your database is called **articles**. Each object has **title** and **content** vectors.
An index is defined on both the **title** and **content** vector columns.
```
`create\_table\_sql = '''
CREATE TABLE IF NOT EXISTS public.articles (
id INTEGER NOT NULL,
url TEXT,
title TEXT,
content TEXT,
title\_vector vector(1536),
content\_vector vector(1536),
vector\_id INTEGER
);
ALTER TABLE public.articles ADD PRIMARY KEY (id);
'''
# SQL statement for creating indexes
create\_indexes\_sql = '''
CREATE INDEX ON public.articles USING ivfflat (content\_vector) WITH (lists = 1000);
CREATE INDEX ON public.articles USING ivfflat (title\_vector) WITH (lists = 1000);
'''
# Execute the SQL statements
cursor.execute(create\_table\_sql)
cursor.execute(create\_indexes\_sql)
# Commit the changes
connection.commit()`
```
## Load the data
Load the pre-computed vector data into your `articles` table from the `.csv` file. There are 25000 records, so expect the operation to take several minutes.
```
`import io
# Path to your local CSV file
csv\_file\_path = '../../data/vector\_database\_wikipedia\_articles\_embedded.csv'
# Define a generator function to process the csv file
def process\_file(file\_path):
with open(file\_path, 'r', encoding='utf-8') as file:
for line in file:
yield line
# Create a StringIO object to store the modified lines
modified\_lines = io.StringIO(''.join(list(process\_file(csv\_file\_path))))
# Create the COPY command for copy\_expert
copy\_command = '''
COPY public.articles (id, url, title, content, title\_vector, content\_vector, vector\_id)
FROM STDIN WITH (FORMAT CSV, HEADER true, DELIMITER ',');
'''
# Execute the COPY command using copy\_expert
cursor.copy\_expert(copy\_command, modified\_lines)
# Commit the changes
connection.commit()`
```
Check the number of records to ensure the data has been been loaded. There should be 25000 records.
```
`# Check the size of the data
count\_sql = """select count(\*) from public.articles;"""
cursor.execute(count\_sql)
result = cursor.fetchone()
print(f"Count:{result[0]}")`
```
```
`Count:25000`
```
## Search your data
After the data is stored in your Neon database, you can query the data for nearest neighbors.
Start by defining the `query\_neon` function, which is executed when you run the vector similarity search. The function creates an embedding based on the user’s query, prepares the SQL query, and runs the SQL query with the embedding. The pre-computed embeddings that you loaded into your database were created with `text-embedding-3-small` OpenAI model, so you must use the same model to create an embedding for the similarity search.
A `vector\_name` parameter is provided that allows you to search based on “title” or “content”.
```
`def query\_neon(query, collection\_name, vector\_name="title\_vector", top\_k=20):
# Create an embedding vector from the user query
embedded\_query = openai.Embedding.create(
input=query,
model="text-embedding-3-small",
)["data"][0]["embedding"]
# Convert the embedded\_query to PostgreSQL compatible format
embedded\_query\_pg = "[" + ",".join(map(str, embedded\_query)) + "]"
# Create the SQL query
query\_sql = f"""
SELECT id, url, title, l2\_distance({vector\_name},'{embedded\_query\_pg}'::VECTOR(1536)) AS similarity
FROM {collection\_name}
ORDER BY {vector\_name} \<-\> '{embedded\_query\_pg}'::VECTOR(1536)
LIMIT {top\_k};
"""
# Execute the query
cursor.execute(query\_sql)
results = cursor.fetchall()
return results`
```
Run a similarity search based on `title\_vector` embeddings:
```
`# Query based on `title\_vector` embeddings
import openai
query\_results = query\_neon("Greek mythology", "Articles")
for i, result in enumerate(query\_results):
print(f"{i + 1}. {result[2]} (Score: {round(1 - result[3], 3)})")`
```
```
`1. Greek mythology (Score: 0.998)
2. Roman mythology (Score: 0.7)
3. Greek underworld (Score: 0.637)
4. Mythology (Score: 0.635)
5. Classical mythology (Score: 0.629)
6. Japanese mythology (Score: 0.615)
7. Norse mythology (Score: 0.569)
8. Greek language (Score: 0.566)
9. Zeus (Score: 0.534)
10. List of mythologies (Score: 0.531)
11. Jupiter (mythology) (Score: 0.53)
12. Greek (Score: 0.53)
13. Gaia (mythology) (Score: 0.526)
14. Titan (mythology) (Score: 0.522)
15. Mercury (mythology) (Score: 0.521)
16. Ancient Greece (Score: 0.52)
17. Greek alphabet (Score: 0.52)
18. Venus (mythology) (Score: 0.515)
19. Pluto (mythology) (Score: 0.515)
20. Athena (Score: 0.514)`
```
Run a similarity search based on `content\_vector` embeddings:
```
`# Query based on `content\_vector` embeddings
query\_results = query\_neon("Famous battles in Greek history", "Articles", "content\_vector")
for i, result in enumerate(query\_results):
print(f"{i + 1}. {result[2]} (Score: {round(1 - result[3], 3)})")`
```
```
`1. 222 BC (Score: 0.489)
2. Trojan War (Score: 0.458)
3. Peloponnesian War (Score: 0.456)
4. History of the Peloponnesian War (Score: 0.449)
5. 430 BC (Score: 0.441)
6. 168 BC (Score: 0.436)
7. Ancient Greece (Score: 0.429)
8. Classical Athens (Score: 0.428)
9. 499 BC (Score: 0.427)
10. Leonidas I (Score: 0.426)
11. Battle (Score: 0.421)
12. Greek War of Independence (Score: 0.421)
13. Menelaus (Score: 0.419)
14. Thebes, Greece (Score: 0.417)
15. Patroclus (Score: 0.417)
16. 427 BC (Score: 0.416)
17. 429 BC (Score: 0.413)
18. August 2 (Score: 0.412)
19. Ionia (Score: 0.411)
20. 323 (Score: 0.409)`
```