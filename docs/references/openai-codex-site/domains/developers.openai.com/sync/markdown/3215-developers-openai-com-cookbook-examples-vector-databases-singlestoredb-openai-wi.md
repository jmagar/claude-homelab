Semantic search with SingleStoreDB
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
May 22, 2023
# Semantic search with SingleStoreDB
[ AR ](https://github.com/arno756)
[ arno756 ](https://github.com/arno756)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/SingleStoreDB/OpenAI_wikipedia_semantic_search.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/SingleStoreDB/OpenAI_wikipedia_semantic_search.ipynb)
This notebook is an example on how you can use SingleStoreDB vector storage and functions to build an interactive Q&A application with ChatGPT. If you start a [Trial](https://www.singlestore.com/cloud-trial/) in SingleStoreDB, you can find the same notebook in our sample notebooks with native connection.
## First let’s talk directly to ChatGPT and try and get back a response
```
`!pip install openai --quiet`
```
```
`
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m A new release of pip is available: [0m[31;49m23.0.1[0m[39;49m -\> [0m[32;49m23.1.2[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m To update, run: [0m[32;49mpython3.11 -m pip install --upgrade pip[0m`
```
```
`import openai
EMBEDDING\_MODEL = "text-embedding-3-small"
GPT\_MODEL = "gpt-3.5-turbo"`
```
## Let’s connect to OpenAI and see the result we get when asking for a date beyond 2021
```
`openai.api\_key = 'OPENAI API KEY'
response = openai.ChatCompletion.create(
model=GPT\_MODEL,
messages=[
{"role": "system", "content": "You are a helpful assistant."},
{"role": "user", "content": "Who won the gold medal for curling in Olymics 2022?"},
]
)
print(response['choices'][0]['message']['content'])`
```
```
`I'm sorry, I cannot provide information about events that have not occurred yet. The Winter Olympics 2022 will be held in Beijing, China from February 4 to 20, 2022. The curling events will take place during this time and the results will not be known until after the competition has concluded.`
```
# Get the data about Winter Olympics and provide the information to ChatGPT as context
## 1. Setup
```
`!pip install matplotlib plotly.express scikit-learn tabulate tiktoken wget --quiet`
```
```
`
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m A new release of pip is available: [0m[31;49m23.0.1[0m[39;49m -\> [0m[32;49m23.1.2[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m To update, run: [0m[32;49mpython3.11 -m pip install --upgrade pip[0m`
```
```
`import pandas as pd
import os
import wget
import ast`
```
## Step 1 - Grab the data from CSV and prepare it
```
`# download pre-chunked text and pre-computed embeddings
# this file is \~200 MB, so may take a minute depending on your connection speed
embeddings\_path = "https://cdn.openai.com/API/examples/data/winter\_olympics\_2022.csv"
file\_path = "winter\_olympics\_2022.csv"
if not os.path.exists(file\_path):
wget.download(embeddings\_path, file\_path)
print("File downloaded successfully.")
else:
print("File already exists in the local file system.")`
```
```
`File downloaded successfully.`
```
```
`df = pd.read\_csv(
"winter\_olympics\_2022.csv"
)
# convert embeddings from CSV str type back to list type
df['embedding'] = df['embedding'].apply(ast.literal\_eval)`
```
```
`df`
```
```
`df.info(show\_counts=True)`
```
```
`\<class 'pandas.core.frame.DataFrame'\>
RangeIndex: 6059 entries, 0 to 6058
Data columns (total 2 columns):
# Column Non-Null Count Dtype
--- ------ -------------- -----
0 text 6059 non-null object
1 embedding 6059 non-null object
dtypes: object(2)
memory usage: 94.8+ KB`
```
## 2. Set up SingleStore DB
```
`import singlestoredb as s2
conn = s2.connect("\<user\>:\<Password\>@\<host\>:3306/")
cur = conn.cursor()`
```
```
`# Create database
stmt = """
CREATE DATABASE IF NOT EXISTS winter\_wikipedia2;
"""
cur.execute(stmt)`
```
```
`1`
```
```
`#create table
stmt = """
CREATE TABLE IF NOT EXISTS winter\_wikipedia2.winter\_olympics\_2022 (
id INT PRIMARY KEY,
text TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4\_general\_ci,
embedding BLOB
);"""
cur.execute(stmt)`
```
```
`0`
```
## 3. Populate the Table with our dataframe df and use JSON\_ARRAY\_PACK to compact it
```
`%%time
# Prepare the statement
stmt = """
INSERT INTO winter\_wikipedia2.winter\_olympics\_2022 (
id,
text,
embedding
)
VALUES (
%s,
%s,
JSON\_ARRAY\_PACK\_F64(%s)
)
"""
# Convert the DataFrame to a NumPy record array
record\_arr = df.to\_records(index=True)
# Set the batch size
batch\_size = 1000
# Iterate over the rows of the record array in batches
for i in range(0, len(record\_arr), batch\_size):
batch = record\_arr[i:i+batch\_size]
values = [(row[0], row[1], str(row[2])) for row in batch]
cur.executemany(stmt, values)`
```
```
`CPU times: user 8.79 s, sys: 4.63 s, total: 13.4 s
Wall time: 11min 4s`
```
## 4. Do a semantic search with the same question from above and use the response to send to OpenAI again
```
`from utils.embeddings\_utils import get\_embedding
def strings\_ranked\_by\_relatedness(
query: str,
df: pd.DataFrame,
relatedness\_fn=lambda x, y: 1 - spatial.distance.cosine(x, y),
top\_n: int = 100
) -\> tuple:
"""Returns a list of strings and relatednesses, sorted from most related to least."""
# Get the embedding of the query.
query\_embedding\_response = get\_embedding(query, EMBEDDING\_MODEL)
# Create the SQL statement.
stmt = """
SELECT
text,
DOT\_PRODUCT\_F64(JSON\_ARRAY\_PACK\_F64(%s), embedding) AS score
FROM winter\_wikipedia2.winter\_olympics\_2022
ORDER BY score DESC
LIMIT %s
"""
# Execute the SQL statement.
results = cur.execute(stmt, [str(query\_embedding\_response), top\_n])
# Fetch the results
results = cur.fetchall()
strings = []
relatednesses = []
for row in results:
strings.append(row[0])
relatednesses.append(row[1])
# Return the results.
return strings[:top\_n], relatednesses[:top\_n]`
```
```
`from tabulate import tabulate
strings, relatednesses = strings\_ranked\_by\_relatedness(
"curling gold medal",
df,
top\_n=5
)
for string, relatedness in zip(strings, relatednesses):
print(f"{relatedness=:.3f}")
print(tabulate([[string]], headers=['Result'], tablefmt='fancy\_grid'))`
```
## 5. Send the right context to ChatGPT for a more accurate answer
```
`import tiktoken
def num\_tokens(text: str, model: str = GPT\_MODEL) -\> int:
"""Return the number of tokens in a string."""
encoding = tiktoken.encoding\_for\_model(model)
return len(encoding.encode(text))
def query\_message(
query: str,
df: pd.DataFrame,
model: str,
token\_budget: int
) -\> str:
"""Return a message for GPT, with relevant source texts pulled from SingleStoreDB."""
strings, relatednesses = strings\_ranked\_by\_relatedness(query, df, "winter\_olympics\_2022")
introduction = 'Use the below articles on the 2022 Winter Olympics to answer the subsequent question. If the answer cannot be found in the articles, write "I could not find an answer."'
question = f"\\n\\nQuestion: {query}"
message = introduction
for string in strings:
next\_article = f'\\n\\nWikipedia article section:\\n"""\\n{string}\\n"""'
if (
num\_tokens(message + next\_article + question, model=model)
\> token\_budget
):
break
else:
message += next\_article
return message + question
def ask(
query: str,
df: pd.DataFrame = df,
model: str = GPT\_MODEL,
token\_budget: int = 4096 - 500,
print\_message: bool = False,
) -\> str:
"""Answers a query using GPT and a table of relevant texts and embeddings in SingleStoreDB."""
message = query\_message(query, df, model=model, token\_budget=token\_budget)
if print\_message:
print(message)
messages = [
{"role": "system", "content": "You answer questions about the 2022 Winter Olympics."},
{"role": "user", "content": message},
]
response = openai.ChatCompletion.create(
model=model,
messages=messages,
temperature=0
)
response\_message = response["choices"][0]["message"]["content"]
return response\_message`
```
## 6. Get an answer from Chat GPT
```
`from pprint import pprint
answer = ask('Who won the gold medal for curling in Olymics 2022?')
pprint(answer)`
```
```
`("There were three curling events at the 2022 Winter Olympics: men's, women's, "
'and mixed doubles. The gold medalists for each event are:\\n'
'\\n'
"- Men's: Sweden (Niklas Edin, Oskar Eriksson, Rasmus Wranå, Christoffer "
'Sundgren, Daniel Magnusson)\\n'
"- Women's: Great Britain (Eve Muirhead, Vicky Wright, Jennifer Dodds, Hailey "
'Duff, Mili Smith)\\n'
'- Mixed doubles: Italy (Stefania Constantini, Amos Mosaner)')`
```