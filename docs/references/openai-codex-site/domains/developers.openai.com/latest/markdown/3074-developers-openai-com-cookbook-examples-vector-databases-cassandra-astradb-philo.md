Philosophy with vector embeddings, OpenAI and Cassandra / Astra DB
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
Aug 29, 2023
# Philosophy with vector embeddings, OpenAI and Cassandra / Astra DB
[ HE ](https://github.com/hemidactylus)
[ hemidactylus ](https://github.com/hemidactylus)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/cassandra_astradb/Philosophical_Quotes_CQL.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/cassandra_astradb/Philosophical_Quotes_CQL.ipynb)
### CQL Version
In this quickstart you will learn how to build a “philosophy quote finder & generator” using OpenAI’s vector embeddings and [Apache Cassandra®](https://cassandra.apache.org), or equivalently DataStax [Astra DB through CQL](https://docs.datastax.com/en/astra-serverless/docs/vector-search/quickstart.html), as the vector store for data persistence.
The basic workflow of this notebook is outlined below. You will evaluate and store the vector embeddings for a number of quotes by famous philosophers, use them to build a powerful search engine and, after that, even a generator of new quotes!
The notebook exemplifies some of the standard usage patterns of vector search — while showing how easy is it to get started with the vector capabilities of [Cassandra](https://cassandra.apache.org/doc/trunk/cassandra/vector-search/overview.html) / [Astra DB through CQL](https://docs.datastax.com/en/astra-serverless/docs/vector-search/quickstart.html).
For a background on using vector search and text embeddings to build a question-answering system, please check out this excellent hands-on notebook: [Question answering using embeddings](https://github.com/openai/openai-cookbook/blob/main/examples/Question_answering_using_embeddings.ipynb).
#### *Choose-your-framework*
Please note that this notebook uses the [Cassandra drivers](https://docs.datastax.com/en/developer/python-driver/latest/) and runs CQL (Cassandra Query Language) statements directly, but we cover other choices of technology to accomplish the same task. Check out this folder’s [README](https://github.com/openai/openai-cookbook/tree/main/examples/vector_databases/cassandra_astradb) for other options. This notebook can run either as a Colab notebook or as a regular Jupyter notebook.
Table of contents:
* Setup
* Get DB connection
* Connect to OpenAI
* Load quotes into the Vector Store
* Use case 1: **quote search engine**
* Use case 2: **quote generator**
* (Optional) exploit partitioning in the Vector Store
### How it works
**Indexing**
Each quote is made into an embedding vector with OpenAI’s `Embedding`. These are saved in the Vector Store for later use in searching. Some metadata, including the author’s name and a few other pre-computed tags, are stored alongside, to allow for search customization.
**Search**
To find a quote similar to the provided search quote, the latter is made into an embedding vector on the fly, and this vector is used to query the store for similar vectors … i.e. similar quotes that were previously indexed. The search can optionally be constrained by additional metadata (“find me quotes by Spinoza similar to this one …”).
The key point here is that “quotes similar in content” translates, in vector space, to vectors that are metrically close to each other: thus, vector similarity search effectively implements semantic similarity. *This is the key reason vector embeddings are so powerful.*
The sketch below tries to convey this idea. Each quote, once it’s made into a vector, is a point in space. Well, in this case it’s on a sphere, since OpenAI’s embedding vectors, as most others, are normalized to *unit length*. Oh, and the sphere is actually not three-dimensional, rather 1536-dimensional!
So, in essence, a similarity search in vector space returns the vectors that are closest to the query vector:
**Generation**
Given a suggestion (a topic or a tentative quote), the search step is performed, and the first returned results (quotes) are fed into an LLM prompt which asks the generative model to invent a new text along the lines of the passed examples *and* the initial suggestion.
## Setup
Install and import the necessary dependencies:
```
`!pip install --quiet "cassandra-driver\>=0.28.0" "openai\>=1.0.0" datasets`
```
```
`import os
from uuid import uuid4
from getpass import getpass
from collections import Counter
from cassandra.cluster import Cluster
from cassandra.auth import PlainTextAuthProvider
import openai
from datasets import load\_dataset`
```
*Don’t mind the next cell too much, we need it to detect Colabs and let you upload the SCB file (see below):*
```
`try:
from google.colab import files
IS\_COLAB = True
except ModuleNotFoundError:
IS\_COLAB = False`
```
## Get DB connection
A couple of secrets are required to create a `Session` object (a connection to your Astra DB instance).
*(Note: some steps will be slightly different on Google Colab and on local Jupyter, that’s why the notebook will detect the runtime type.)*
```
`# Your database's Secure Connect Bundle zip file is needed:
if IS\_COLAB:
print('Please upload your Secure Connect Bundle zipfile: ')
uploaded = files.upload()
if uploaded:
astraBundleFileTitle = list(uploaded.keys())[0]
ASTRA\_DB\_SECURE\_BUNDLE\_PATH = os.path.join(os.getcwd(), astraBundleFileTitle)
else:
raise ValueError(
'Cannot proceed without Secure Connect Bundle. Please re-run the cell.'
)
else:
# you are running a local-jupyter notebook:
ASTRA\_DB\_SECURE\_BUNDLE\_PATH = input("Please provide the full path to your Secure Connect Bundle zipfile: ")
ASTRA\_DB\_APPLICATION\_TOKEN = getpass("Please provide your Database Token ('AstraCS:...' string): ")
ASTRA\_DB\_KEYSPACE = input("Please provide the Keyspace name for your Database: ")`
```
```
`Please provide the full path to your Secure Connect Bundle zipfile: /path/to/secure-connect-DatabaseName.zip
Please provide your Database Token ('AstraCS:...' string): ········
Please provide the Keyspace name for your Database: my\_keyspace`
```
### Creation of the DB connection
This is how you create a connection to Astra DB:
*(Incidentally, you could also use any Cassandra cluster (as long as it provides Vector capabilities), just by [changing the parameters](https://docs.datastax.com/en/developer/python-driver/latest/getting_started/#connecting-to-cassandra) to the following `Cluster` instantiation.)*
```
`# Don't mind the "Closing connection" error after "downgrading protocol..." messages you may see,
# it is really just a warning: the connection will work smoothly.
cluster = Cluster(
cloud={
"secure\_connect\_bundle": ASTRA\_DB\_SECURE\_BUNDLE\_PATH,
},
auth\_provider=PlainTextAuthProvider(
"token",
ASTRA\_DB\_APPLICATION\_TOKEN,
),
)
session = cluster.connect()
keyspace = ASTRA\_DB\_KEYSPACE`
```
### Creation of the Vector table in CQL
You need a table which support vectors and is equipped with metadata. Call it “philosophers\_cql”.
Each row will store: a quote, its vector embedding, the quote author and a set of “tags”. You also need a primary key to ensure uniqueness of rows.
The following is the full CQL command that creates the table (check out [this page](https://docs.datastax.com/en/dse/6.7/cql/cql/cqlQuickReference.html) for more on the CQL syntax of this and the following statements):
```
`create\_table\_statement = f"""CREATE TABLE IF NOT EXISTS {keyspace}.philosophers\_cql (
quote\_id UUID PRIMARY KEY,
body TEXT,
embedding\_vector VECTOR\<FLOAT, 1536\>,
author TEXT,
tags SET\<TEXT\>
);"""`
```
Pass this statement to your database Session to execute it:
```
`session.execute(create\_table\_statement)`
```
```
`\<cassandra.cluster.ResultSet at 0x7feee37b3460\>`
```
#### Add a vector index for ANN search
In order to run ANN (approximate-nearest-neighbor) searches on the vectors in the table, you need to create a specific index on the `embedding\_vector` column.
*When creating the index, you can [optionally choose](https://docs.datastax.com/en/astra-serverless/docs/vector-search/cql.html#_create_the_vector_schema_and_load_the_data_into_the_database) the “similarity function” used to compute vector distances: since for unit-length vectors (such as those from OpenAI) the “cosine difference” is the same as the “dot product”, you’ll use the latter which is computationally less expensive.*
Run this CQL statement:
```
`create\_vector\_index\_statement = f"""CREATE CUSTOM INDEX IF NOT EXISTS idx\_embedding\_vector
ON {keyspace}.philosophers\_cql (embedding\_vector)
USING 'org.apache.cassandra.index.sai.StorageAttachedIndex'
WITH OPTIONS = {{'similarity\_function' : 'dot\_product'}};
"""
# Note: the double '{{' and '}}' are just the F-string escape sequence for '{' and '}'
session.execute(create\_vector\_index\_statement)`
```
```
`\<cassandra.cluster.ResultSet at 0x7feeefd3da00\>`
```
#### Add indexes for author and tag filtering
That is enough to run vector searches on the table … but you want to be able to optionally specify an author and/or some tags to restrict the quote search. Create two other indexes to support this:
```
`create\_author\_index\_statement = f"""CREATE CUSTOM INDEX IF NOT EXISTS idx\_author
ON {keyspace}.philosophers\_cql (author)
USING 'org.apache.cassandra.index.sai.StorageAttachedIndex';
"""
session.execute(create\_author\_index\_statement)
create\_tags\_index\_statement = f"""CREATE CUSTOM INDEX IF NOT EXISTS idx\_tags
ON {keyspace}.philosophers\_cql (VALUES(tags))
USING 'org.apache.cassandra.index.sai.StorageAttachedIndex';
"""
session.execute(create\_tags\_index\_statement)`
```
```
`\<cassandra.cluster.ResultSet at 0x7fef2c64af70\>`
```
## Connect to OpenAI
### Set up your secret key
```
`OPENAI\_API\_KEY = getpass("Please enter your OpenAI API Key: ")`
```
```
`Please enter your OpenAI API Key: ········`
```
### A test call for embeddings
Quickly check how one can get the embedding vectors for a list of input texts:
```
`client = openai.OpenAI(api\_key=OPENAI\_API\_KEY)
embedding\_model\_name = "text-embedding-3-small"
result = client.embeddings.create(
input=[
"This is a sentence",
"A second sentence"
],
model=embedding\_model\_name,
)`
```
*Note: the above is the syntax for OpenAI v1.0+. If using previous versions, the code to get the embeddings will look different.*
```
`print(f"len(result.data) = {len(result.data)}")
print(f"result.data[1].embedding = {str(result.data[1].embedding)[:55]}...")
print(f"len(result.data[1].embedding) = {len(result.data[1].embedding)}")`
```
```
`len(result.data) = 2
result.data[1].embedding = [-0.0108176339417696, 0.0013546717818826437, 0.00362232...
len(result.data[1].embedding) = 1536`
```
## Load quotes into the Vector Store
Get a dataset with the quotes. *(We adapted and augmented the data from [this Kaggle dataset](https://www.kaggle.com/datasets/mertbozkurt5/quotes-by-philosophers), ready to use in this demo.)*
```
`philo\_dataset = load\_dataset("datastax/philosopher-quotes")["train"]`
```
A quick inspection:
```
`print("An example entry:")
print(philo\_dataset[16])`
```
```
`An example entry:
{'author': 'aristotle', 'quote': 'Love well, be loved and do something of value.', 'tags': 'love;ethics'}`
```
Check the dataset size:
```
`author\_count = Counter(entry["author"] for entry in philo\_dataset)
print(f"Total: {len(philo\_dataset)} quotes. By author:")
for author, count in author\_count.most\_common():
print(f" {author:\<20}: {count} quotes")`
```
```
`Total: 450 quotes. By author:
aristotle : 50 quotes
schopenhauer : 50 quotes
spinoza : 50 quotes
hegel : 50 quotes
freud : 50 quotes
nietzsche : 50 quotes
sartre : 50 quotes
plato : 50 quotes
kant : 50 quotes`
```
### Insert quotes into vector store
You will compute the embeddings for the quotes and save them into the Vector Store, along with the text itself and the metadata planned for later use.
To optimize speed and reduce the calls, you’ll perform batched calls to the embedding OpenAI service.
The DB write is accomplished with a CQL statement. But since you’ll run this particular insertion several times (albeit with different values), it’s best to *prepare* the statement and then just run it over and over.
*(Note: for faster insertion, the Cassandra drivers would let you do concurrent inserts, which we don’t do here for a more straightforward demo code.)*
```
`prepared\_insertion = session.prepare(
f"INSERT INTO {keyspace}.philosophers\_cql (quote\_id, author, body, embedding\_vector, tags) VALUES (?, ?, ?, ?, ?);"
)
BATCH\_SIZE = 20
num\_batches = ((len(philo\_dataset) + BATCH\_SIZE - 1) // BATCH\_SIZE)
quotes\_list = philo\_dataset["quote"]
authors\_list = philo\_dataset["author"]
tags\_list = philo\_dataset["tags"]
print("Starting to store entries:")
for batch\_i in range(num\_batches):
b\_start = batch\_i \* BATCH\_SIZE
b\_end = (batch\_i + 1) \* BATCH\_SIZE
# compute the embedding vectors for this batch
b\_emb\_results = client.embeddings.create(
input=quotes\_list[b\_start : b\_end],
model=embedding\_model\_name,
)
# prepare the rows for insertion
print("B ", end="")
for entry\_idx, emb\_result in zip(range(b\_start, b\_end), b\_emb\_results.data):
if tags\_list[entry\_idx]:
tags = {
tag
for tag in tags\_list[entry\_idx].split(";")
}
else:
tags = set()
author = authors\_list[entry\_idx]
quote = quotes\_list[entry\_idx]
quote\_id = uuid4() # a new random ID for each quote. In a production app you'll want to have better control...
session.execute(
prepared\_insertion,
(quote\_id, author, quote, emb\_result.embedding, tags),
)
print("\*", end="")
print(f" done ({len(b\_emb\_results.data)})")
print("\\nFinished storing entries.")`
```
```
`Starting to store entries:
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (20)
B \*\*\*\*\*\*\*\*\*\* done (10)
Finished storing entries.`
```
## Use case 1: **quote search engine**
For the quote-search functionality, you need first to make the input quote into a vector, and then use it to query the store (besides handling the optional metadata into the search call, that is).
Encapsulate the search-engine functionality into a function for ease of re-use:
```
`def find\_quote\_and\_author(query\_quote, n, author=None, tags=None):
query\_vector = client.embeddings.create(
input=[query\_quote],
model=embedding\_model\_name,
).data[0].embedding
# depending on what conditions are passed, the WHERE clause in the statement may vary.
where\_clauses = []
where\_values = []
if author:
where\_clauses += ["author = %s"]
where\_values += [author]
if tags:
for tag in tags:
where\_clauses += ["tags CONTAINS %s"]
where\_values += [tag]
# The reason for these two lists above is that when running the CQL search statement the values passed
# must match the sequence of "?" marks in the statement.
if where\_clauses:
search\_statement = f"""SELECT body, author FROM {keyspace}.philosophers\_cql
WHERE {' AND '.join(where\_clauses)}
ORDER BY embedding\_vector ANN OF %s
LIMIT %s;
"""
else:
search\_statement = f"""SELECT body, author FROM {keyspace}.philosophers\_cql
ORDER BY embedding\_vector ANN OF %s
LIMIT %s;
"""
# For best performance, one should keep a cache of prepared statements (see the insertion code above)
# for the various possible statements used here.
# (We'll leave it as an exercise to the reader to avoid making this code too long.
# Remember: to prepare a statement you use '?' instead of '%s'.)
query\_values = tuple(where\_values + [query\_vector] + [n])
result\_rows = session.execute(search\_statement, query\_values)
return [
(result\_row.body, result\_row.author)
for result\_row in result\_rows
]`
```
### Putting search to test
Passing just a quote:
```
`find\_quote\_and\_author("We struggle all our life for nothing", 3)`
```
```
`[('Life to the great majority is only a constant struggle for mere existence, with the certainty of losing it at last.',
'schopenhauer'),
('We give up leisure in order that we may have leisure, just as we go to war in order that we may have peace.',
'aristotle'),
('Perhaps the gods are kind to us, by making life more disagreeable as we grow older. In the end death seems less intolerable than the manifold burdens we carry',
'freud')]`
```
Search restricted to an author:
```
`find\_quote\_and\_author("We struggle all our life for nothing", 2, author="nietzsche")`
```
```
`[('To live is to suffer, to survive is to find some meaning in the suffering.',
'nietzsche'),
('What makes us heroic?--Confronting simultaneously our supreme suffering and our supreme hope.',
'nietzsche')]`
```
Search constrained to a tag (out of those saved earlier with the quotes):
```
`find\_quote\_and\_author("We struggle all our life for nothing", 2, tags=["politics"])`
```
```
`[('Mankind will never see an end of trouble until lovers of wisdom come to hold political power, or the holders of power become lovers of wisdom',
'plato'),
('Everything the State says is a lie, and everything it has it has stolen.',
'nietzsche')]`
```
### Cutting out irrelevant results
The vector similarity search generally returns the vectors that are closest to the query, even if that means results that might be somewhat irrelevant if there’s nothing better.
To keep this issue under control, you can get the actual “similarity” between the query and each result, and then set a cutoff on it, effectively discarding results that are beyond that threshold.
Tuning this threshold correctly is not an easy problem: here, we’ll just show you the way.
To get a feeling on how this works, try the following query and play with the choice of quote and threshold to compare the results:
*Note (for the mathematically inclined): this value is **a rescaling between zero and one** of the cosine difference between the vectors, i.e. of the scalar product divided by the product of the norms of the two vectors. In other words, this is 0 for opposite-facing vecors and +1 for parallel vectors. For other measures of similarity, check the [documentation](https://docs.datastax.com/en/astra-serverless/docs/vector-search/cql.html#_create_the_vector_schema_and_load_the_data_into_the_database) — and keep in mind that the metric in the `SELECT` query should match the one used when creating the index earlier for meaningful, ordered results.*
```
`quote = "Animals are our equals."
# quote = "Be good."
# quote = "This teapot is strange."
similarity\_threshold = 0.92
quote\_vector = client.embeddings.create(
input=[quote],
model=embedding\_model\_name,
).data[0].embedding
# Once more: remember to prepare your statements in production for greater performance...
search\_statement = f"""SELECT body, similarity\_dot\_product(embedding\_vector, %s) as similarity
FROM {keyspace}.philosophers\_cql
ORDER BY embedding\_vector ANN OF %s
LIMIT %s;
"""
query\_values = (quote\_vector, quote\_vector, 8)
result\_rows = session.execute(search\_statement, query\_values)
results = [
(result\_row.body, result\_row.similarity)
for result\_row in result\_rows
if result\_row.similarity \>= similarity\_threshold
]
print(f"{len(results)} quotes within the threshold:")
for idx, (r\_body, r\_similarity) in enumerate(results):
print(f" {idx}. [similarity={r\_similarity:.3f}] \\"{r\_body[:70]}...\\"")`
```
```
`3 quotes within the threshold:
0. [similarity=0.927] "The assumption that animals are without rights, and the illusion that ..."
1. [similarity=0.922] "Animals are in possession of themselves; their soul is in possession o..."
2. [similarity=0.920] "At his best, man is the noblest of all animals; separated from law and..."`
```
## Use case 2: **quote generator**
For this task you need another component from OpenAI, namely an LLM to generate the quote for us (based on input obtained by querying the Vector Store).
You also need a template for the prompt that will be filled for the generate-quote LLM completion task.
```
`completion\_model\_name = "gpt-3.5-turbo"
generation\_prompt\_template = """"Generate a single short philosophical quote on the given topic,
similar in spirit and form to the provided actual example quotes.
Do not exceed 20-30 words in your quote.
REFERENCE TOPIC: "{topic}"
ACTUAL EXAMPLES:
{examples}
"""`
```
Like for search, this functionality is best wrapped into a handy function (which internally uses search):
```
`def generate\_quote(topic, n=2, author=None, tags=None):
quotes = find\_quote\_and\_author(query\_quote=topic, n=n, author=author, tags=tags)
if quotes:
prompt = generation\_prompt\_template.format(
topic=topic,
examples="\\n".join(f" - {quote[0]}" for quote in quotes),
)
# a little logging:
print("\*\* quotes found:")
for q, a in quotes:
print(f"\*\* - {q} ({a})")
print("\*\* end of logging")
#
response = client.chat.completions.create(
model=completion\_model\_name,
messages=[{"role": "user", "content": prompt}],
temperature=0.7,
max\_tokens=320,
)
return response.choices[0].message.content.replace('"', '').strip()
else:
print("\*\* no quotes found.")
return None`
```
*Note: similar to the case of the embedding computation, the code for the Chat Completion API would be slightly different for OpenAI prior to v1.0.*
#### Putting quote generation to test
Just passing a text (a “quote”, but one can actually just suggest a topic since its vector embedding will still end up at the right place in the vector space):
```
`q\_topic = generate\_quote("politics and virtue")
print("\\nA new generated quote:")
print(q\_topic)`
```
```
`\*\* quotes found:
\*\* - Happiness is the reward of virtue. (aristotle)
\*\* - Our moral virtues benefit mainly other people; intellectual virtues, on the other hand, benefit primarily ourselves; therefore the former make us universally popular, the latter unpopular. (schopenhauer)
\*\* end of logging
A new generated quote:
True politics is not the pursuit of power, but the cultivation of virtue for the betterment of all.`
```
Use inspiration from just a single philosopher:
```
`q\_topic = generate\_quote("animals", author="schopenhauer")
print("\\nA new generated quote:")
print(q\_topic)`
```
```
`\*\* quotes found:
\*\* - Because Christian morality leaves animals out of account, they are at once outlawed in philosophical morals; they are mere 'things,' mere means to any ends whatsoever. They can therefore be used for vivisection, hunting, coursing, bullfights, and horse racing, and can be whipped to death as they struggle along with heavy carts of stone. Shame on such a morality that is worthy of pariahs, and that fails to recognize the eternal essence that exists in every living thing, and shines forth with inscrutable significance from all eyes that see the sun! (schopenhauer)
\*\* - The assumption that animals are without rights, and the illusion that our treatment of them has no moral significance, is a positively outrageous example of Western crudity and barbarity. Universal compassion is the only guarantee of morality. (schopenhauer)
\*\* end of logging
A new generated quote:
Do not judge the worth of a soul by its outward form, for within every animal lies an eternal essence that deserves our compassion and respect.`
```
## (Optional) **Partitioning**
There’s an interesting topic to examine before completing this quickstart. While, generally, tags and quotes can be in any relationship (e.g. a quote having multiple tags), *authors* are effectively an exact grouping (they define a “disjoint partitioning” on the set of quotes): each quote has exactly one author (for us, at least).
Now, suppose you know in advance your application will usually (or always) run queries on a *single author*. Then you can take full advantage of the underlying database structure: if you group quotes in **partitions** (one per author), vector queries on just an author will use less resources and return much faster.
We’ll not dive into the details here, which have to do with the Cassandra storage internals: the important message is that **if your queries are run within a group, consider partitioning accordingly to boost performance**.
You’ll now see this choice in action.
The partitioning per author calls for a new table schema: create a new table called “philosophers\_cql\_partitioned”, along with the necessary indexes:
```
`create\_table\_p\_statement = f"""CREATE TABLE IF NOT EXISTS {keyspace}.philosophers\_cql\_partitioned (
author TEXT,
quote\_id UUID,
body TEXT,
embedding\_vector VECTOR\<FLOAT, 1536\>,
tags SET\<TEXT\>,
PRIMARY KEY ( (author), quote\_id )
) WITH CLUSTERING ORDER BY (quote\_id ASC);"""
session.execute(create\_table\_p\_statement)
create\_vector\_index\_p\_statement = f"""CREATE CUSTOM INDEX IF NOT EXISTS idx\_embedding\_vector\_p
ON {keyspace}.philosophers\_cql\_partitioned (embedding\_vector)
USING 'org.apache.cassandra.index.sai.StorageAttachedIndex'
WITH OPTIONS = {{'similarity\_function' : 'dot\_product'}};
"""
session.execute(create\_vector\_index\_p\_statement)
create\_tags\_index\_p\_statement = f"""CREATE CUSTOM INDEX IF NOT EXISTS idx\_tags\_p
ON {keyspace}.philosophers\_cql\_partitioned (VALUES(tags))
USING 'org.apache.cassandra.index.sai.StorageAttachedIndex';
"""
session.execute(create\_tags\_index\_p\_statement)`
```
```
`\<cassandra.cluster.ResultSet at 0x7fef149d7940\>`
```
Now repeat the compute-embeddings-and-insert step on the new table.
You could use the very same insertion code as you did earlier, because the differences are hidden “behind the scenes”: the database will store the inserted rows differently according to the partitioning scheme of this new table.
However, by way of demonstration, you will take advantage of a handy facility offered by the Cassandra drivers to easily run several queries (in this case, `INSERT`s) concurrently. This is something that Cassandra / Astra DB through CQL supports very well and can lead to a significant speedup, with very little changes in the client code.
*(Note: one could additionally have cached the embeddings computed previously to save a few API tokens — here, however, we wanted to keep the code easier to inspect.)*
```
`from cassandra.concurrent import execute\_concurrent\_with\_args`
```
```
`prepared\_insertion = session.prepare(
f"INSERT INTO {keyspace}.philosophers\_cql\_partitioned (quote\_id, author, body, embedding\_vector, tags) VALUES (?, ?, ?, ?, ?);"
)
BATCH\_SIZE = 50
num\_batches = ((len(philo\_dataset) + BATCH\_SIZE - 1) // BATCH\_SIZE)
quotes\_list = philo\_dataset["quote"]
authors\_list = philo\_dataset["author"]
tags\_list = philo\_dataset["tags"]
print("Starting to store entries:")
for batch\_i in range(num\_batches):
print("[...", end="")
b\_start = batch\_i \* BATCH\_SIZE
b\_end = (batch\_i + 1) \* BATCH\_SIZE
# compute the embedding vectors for this batch
b\_emb\_results = client.embeddings.create(
input=quotes\_list[b\_start : b\_end],
model=embedding\_model\_name,
)
# prepare this batch's entries for insertion
tuples\_to\_insert = []
for entry\_idx, emb\_result in zip(range(b\_start, b\_end), b\_emb\_results.data):
if tags\_list[entry\_idx]:
tags = {
tag
for tag in tags\_list[entry\_idx].split(";")
}
else:
tags = set()
author = authors\_list[entry\_idx]
quote = quotes\_list[entry\_idx]
quote\_id = uuid4() # a new random ID for each quote. In a production app you'll want to have better control...
# append a \*tuple\* to the list, and in the tuple the values are ordered to match "?" in the prepared statement:
tuples\_to\_insert.append((quote\_id, author, quote, emb\_result.embedding, tags))
# insert the batch at once through the driver's concurrent primitive
conc\_results = execute\_concurrent\_with\_args(
session,
prepared\_insertion,
tuples\_to\_insert,
)
# check that all insertions succeed (better to always do this):
if any([not success for success, \_ in conc\_results]):
print("Something failed during the insertions!")
else:
print(f"{len(b\_emb\_results.data)}] ", end="")
print("\\nFinished storing entries.")`
```
```
`Starting to store entries:
[...50] [...50] [...50] [...50] [...50] [...50] [...50] [...50] [...50]
Finished storing entries.`
```
Despite the different table schema, the DB query behind the similarity search is essentially the same:
```
`def find\_quote\_and\_author\_p(query\_quote, n, author=None, tags=None):
query\_vector = client.embeddings.create(
input=[query\_quote],
model=embedding\_model\_name,
).data[0].embedding
# Depending on what conditions are passed, the WHERE clause in the statement may vary.
# Construct it accordingly:
where\_clauses = []
where\_values = []
if author:
where\_clauses += ["author = %s"]
where\_values += [author]
if tags:
for tag in tags:
where\_clauses += ["tags CONTAINS %s"]
where\_values += [tag]
if where\_clauses:
search\_statement = f"""SELECT body, author FROM {keyspace}.philosophers\_cql\_partitioned
WHERE {' AND '.join(where\_clauses)}
ORDER BY embedding\_vector ANN OF %s
LIMIT %s;
"""
else:
search\_statement = f"""SELECT body, author FROM {keyspace}.philosophers\_cql\_partitioned
ORDER BY embedding\_vector ANN OF %s
LIMIT %s;
"""
query\_values = tuple(where\_values + [query\_vector] + [n])
result\_rows = session.execute(search\_statement, query\_values)
return [
(result\_row.body, result\_row.author)
for result\_row in result\_rows
]`
```
That’s it: the new table still supports the “generic” similarity searches all right …
```
`find\_quote\_and\_author\_p("We struggle all our life for nothing", 3)`
```
```
`[('Life to the great majority is only a constant struggle for mere existence, with the certainty of losing it at last.',
'schopenhauer'),
('We give up leisure in order that we may have leisure, just as we go to war in order that we may have peace.',
'aristotle'),
('Perhaps the gods are kind to us, by making life more disagreeable as we grow older. In the end death seems less intolerable than the manifold burdens we carry',
'freud')]`
```
… but it’s when an author is specified that you would notice a *huge* performance advantage:
```
`find\_quote\_and\_author\_p("We struggle all our life for nothing", 2, author="nietzsche")`
```
```
`[('To live is to suffer, to survive is to find some meaning in the suffering.',
'nietzsche'),
('What makes us heroic?--Confronting simultaneously our supreme suffering and our supreme hope.',
'nietzsche')]`
```
Well, you *would* notice a performance gain, if you had a realistic-size dataset. In this demo, with a few tens of entries, there’s no noticeable difference — but you get the idea.
## Conclusion
Congratulations! You have learned how to use OpenAI for vector embeddings and Astra DB / Cassandra for storage in order to build a sophisticated philosophical search engine and quote generator.
This example used the [Cassandra drivers](https://docs.datastax.com/en/developer/python-driver/latest/) and runs CQL (Cassandra Query Language) statements directly to interface with the Vector Store - but this is not the only choice. Check the [README](https://github.com/openai/openai-cookbook/tree/main/examples/vector_databases/cassandra_astradb) for other options and integration with popular frameworks.
To find out more on how Astra DB’s Vector Search capabilities can be a key ingredient in your ML/GenAI applications, visit [Astra DB](https://docs.datastax.com/en/astra-serverless/docs/vector-search/overview.html)’s web page on the topic.
## Cleanup
If you want to remove all resources used for this demo, run this cell (*warning: this will delete the tables and the data inserted in them!*):
```
`session.execute(f"DROP TABLE IF EXISTS {keyspace}.philosophers\_cql;")
session.execute(f"DROP TABLE IF EXISTS {keyspace}.philosophers\_cql\_partitioned;")`
```
```
`\<cassandra.cluster.ResultSet at 0x7fef149096a0\>`
```