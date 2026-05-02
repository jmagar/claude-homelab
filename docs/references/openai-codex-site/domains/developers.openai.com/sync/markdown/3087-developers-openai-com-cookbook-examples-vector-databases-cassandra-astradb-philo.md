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
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/cassandra_astradb/Philosophical_Quotes_cassIO.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/cassandra_astradb/Philosophical_Quotes_cassIO.ipynb)
### CassIO version
In this quickstart you will learn how to build a “philosophy quote finder & generator” using OpenAI’s vector embeddings and [Apache Cassandra®](https://cassandra.apache.org), or equivalently DataStax [Astra DB through CQL](https://docs.datastax.com/en/astra-serverless/docs/vector-search/quickstart.html), as the vector store for data persistence.
The basic workflow of this notebook is outlined below. You will evaluate and store the vector embeddings for a number of quotes by famous philosophers, use them to build a powerful search engine and, after that, even a generator of new quotes!
The notebook exemplifies some of the standard usage patterns of vector search — while showing how easy is it to get started with the vector capabilities of [Cassandra](https://cassandra.apache.org/doc/trunk/cassandra/vector-search/overview.html) / [Astra DB through CQL](https://docs.datastax.com/en/astra-serverless/docs/vector-search/quickstart.html).
For a background on using vector search and text embeddings to build a question-answering system, please check out this excellent hands-on notebook: [Question answering using embeddings](https://github.com/openai/openai-cookbook/blob/main/examples/Question_answering_using_embeddings.ipynb).
#### *Choose-your-framework*
Please note that this notebook uses the [CassIO library](https://cassio.org), but we cover other choices of technology to accomplish the same task. Check out this folder’s [README](https://github.com/openai/openai-cookbook/tree/main/examples/vector_databases/cassandra_astradb) for other options. This notebook can run either as a Colab notebook or as a regular Jupyter notebook.
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
First install some required packages:
```
`!pip install --quiet "cassio\>=0.1.3" "openai\>=1.0.0" datasets`
```
```
`from getpass import getpass
from collections import Counter
import cassio
from cassio.table import MetadataVectorCassandraTable
import openai
from datasets import load\_dataset`
```
## Get DB connection
In order to connect to your Astra DB through CQL, you need two things:
* A Token, with role “Database Administrator” (it looks like `AstraCS:...`)
* the database ID (it looks like `3df2a5b6-...`)
Make sure you have both strings — which are obtained in the [Astra UI](https://astra.datastax.com) once you sign in. For more information, see here: [database ID](https://awesome-astra.github.io/docs/pages/astra/faq/#where-should-i-find-a-database-identifier) and [Token](https://awesome-astra.github.io/docs/pages/astra/create-token/#c-procedure).
If you want to *connect to a Cassandra cluster* (which however must [support](https://cassandra.apache.org/doc/trunk/cassandra/vector-search/overview.html) Vector Search), replace with `cassio.init(session=..., keyspace=...)` with suitable Session and keyspace name for your cluster.
```
`astra\_token = getpass("Please enter your Astra token ('AstraCS:...')")
database\_id = input("Please enter your database id ('3df2a5b6-...')")`
```
```
`Please enter your Astra token ('AstraCS:...') ········
Please enter your database id ('3df2a5b6-...') 01234567-89ab-dcef-0123-456789abcdef`
```
```
`cassio.init(token=astra\_token, database\_id=database\_id)`
```
### Creation of the DB connection
This is how you create a connection to Astra DB through CQL:
*(Incidentally, you could also use any Cassandra cluster (as long as it provides Vector capabilities), just by [changing the parameters](https://docs.datastax.com/en/developer/python-driver/latest/getting_started/#connecting-to-cassandra) to the following `Cluster` instantiation.)*
### Creation of the Vector Store through CassIO
You need a table which support vectors and is equipped with metadata. Call it “philosophers\_cassio”:
```
`v\_table = MetadataVectorCassandraTable(table="philosophers\_cassio", vector\_dimension=1536)`
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
result.data[1].embedding = [-0.010821706615388393, 0.001387271680869162, 0.0035479...
len(result.data[1].embedding) = 1536`
```
## Load quotes into the Vector Store
*Note: the above is the syntax for OpenAI v1.0+. If using previous versions, the code to get the embeddings will look different.*
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
You will compute the embeddings for the quotes and save them into the Vector Store, along with the text itself and the metadata planned for later use. Note that the author is added as a metadata field along with the “tags” already found with the quote itself.
To optimize speed and reduce the calls, you’ll perform batched calls to the embedding OpenAI service.
*(Note: for faster execution, Cassandra and CassIO would let you do concurrent inserts, which we don’t do here for a more straightforward demo code.)*
```
`BATCH\_SIZE = 50
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
v\_table.put(
row\_id=f"q\_{author}\_{entry\_idx}",
body\_blob=quote,
vector=emb\_result.embedding,
metadata={\*\*{tag: True for tag in tags}, \*\*{"author": author}},
)
print("\*", end="")
print(f" done ({len(b\_emb\_results.data)})")
print("\\nFinished storing entries.")`
```
```
`Starting to store entries:
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (50)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (50)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (50)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (50)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (50)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (50)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (50)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (50)
B \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* done (50)
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
metadata = {}
if author:
metadata["author"] = author
if tags:
for tag in tags:
metadata[tag] = True
#
results = v\_table.ann\_search(
query\_vector,
n=n,
metadata=metadata,
)
return [
(result["body\_blob"], result["metadata"]["author"])
for result in results
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
To keep this issue under control, you can get the actual “distance” between the query and each result, and then set a cutoff on it, effectively discarding results that are beyond that threshold.
Tuning this threshold correctly is not an easy problem: here, we’ll just show you the way.
To get a feeling on how this works, try the following query and play with the choice of quote and threshold to compare the results:
*Note (for the mathematically inclined): this “distance” is exactly the cosine similarity between the vectors, i.e. the scalar product divided by the product of the norms of the two vectors. As such, it is a number ranging from -1 to +1, where -1 is for exactly opposite-facing vectors and +1 for identically-oriented vectors. Elsewhere (e.g. in the “CQL” counterpart of this demo) you would get a rescaling of this quantity to fit the [0, 1] interval, which means the resulting numerical values and adequate thresholds there are transformed accordingly.*
```
`quote = "Animals are our equals."
# quote = "Be good."
# quote = "This teapot is strange."
metric\_threshold = 0.84
quote\_vector = client.embeddings.create(
input=[quote],
model=embedding\_model\_name,
).data[0].embedding
results = list(v\_table.metric\_ann\_search(
quote\_vector,
n=8,
metric="cos",
metric\_threshold=metric\_threshold,
))
print(f"{len(results)} quotes within the threshold:")
for idx, result in enumerate(results):
print(f" {idx}. [distance={result['distance']:.3f}] \\"{result['body\_blob'][:70]}...\\"")`
```
```
`3 quotes within the threshold:
0. [distance=0.855] "The assumption that animals are without rights, and the illusion that ..."
1. [distance=0.843] "Animals are in possession of themselves; their soul is in possession o..."
2. [distance=0.841] "At his best, man is the noblest of all animals; separated from law and..."`
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
Virtuous politics purifies society, while corrupt politics breeds chaos and decay.`
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
The true measure of humanity lies not in our dominion over animals, but in our ability to show compassion and respect for all living beings.`
```
## (Optional) **Partitioning**
There’s an interesting topic to examine before completing this quickstart. While, generally, tags and quotes can be in any relationship (e.g. a quote having multiple tags), *authors* are effectively an exact grouping (they define a “disjoint partitioning” on the set of quotes): each quote has exactly one author (for us, at least).
Now, suppose you know in advance your application will usually (or always) run queries on a *single author*. Then you can take full advantage of the underlying database structure: if you group quotes in **partitions** (one per author), vector queries on just an author will use less resources and return much faster.
We’ll not dive into the details here, which have to do with the Cassandra storage internals: the important message is that **if your queries are run within a group, consider partitioning accordingly to boost performance**.
You’ll now see this choice in action.
First, you need a different table abstraction from CassIO:
```
`from cassio.table import ClusteredMetadataVectorCassandraTable`
```
```
`v\_table\_partitioned = ClusteredMetadataVectorCassandraTable(table="philosophers\_cassio\_partitioned", vector\_dimension=1536)`
```
Now repeat the compute-embeddings-and-insert step on the new table.
Compared to what you have seen earlier, there is a crucial difference in that now the quote’s author is stored as the *partition id* for the inserted row, instead of being added to the catch-all “metadata” dictionary.
While you are at it, by way of demonstration, you will insert all quotes by a given author *concurrently*: with CassIO, this is done by usng the asynchronous `put\_async` method for each quote, collecting the resulting list of `Future` objects, and calling the `result()` method on them all afterwards, to ensure they all have executed. Cassandra / Astra DB well supports a high degree of concurrency in I/O operations.
*(Note: one could have cached the embeddings computed previously to save a few API tokens — here, however, we wanted to keep the code easier to inspect.)*
```
`BATCH\_SIZE = 50
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
futures = []
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
futures.append(v\_table\_partitioned.put\_async(
partition\_id=author,
row\_id=f"q\_{author}\_{entry\_idx}",
body\_blob=quote,
vector=emb\_result.embedding,
metadata={tag: True for tag in tags},
))
#
for future in futures:
future.result()
#
print(f" done ({len(b\_emb\_results.data)})")
print("\\nFinished storing entries.")`
```
```
`Starting to store entries:
B done (50)
B done (50)
B done (50)
B done (50)
B done (50)
B done (50)
B done (50)
B done (50)
B done (50)
Finished storing entries.`
```
With this new table, the similarity search changes accordingly (note the arguments to `ann\_search`):
```
`def find\_quote\_and\_author\_p(query\_quote, n, author=None, tags=None):
query\_vector = client.embeddings.create(
input=[query\_quote],
model=embedding\_model\_name,
).data[0].embedding
metadata = {}
partition\_id = None
if author:
partition\_id = author
if tags:
for tag in tags:
metadata[tag] = True
#
results = v\_table\_partitioned.ann\_search(
query\_vector,
n=n,
partition\_id=partition\_id,
metadata=metadata,
)
return [
(result["body\_blob"], result["partition\_id"])
for result in results
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
Congratulations! You have learned how to use OpenAI for vector embeddings and Cassandra / Astra DB through CQL for storage in order to build a sophisticated philosophical search engine and quote generator.
This example used [CassIO](https://cassio.org) to interface with the Vector Store - but this is not the only choice. Check the [README](https://github.com/openai/openai-cookbook/tree/main/examples/vector_databases/cassandra_astradb) for other options and integration with popular frameworks.
To find out more on how Astra DB’s Vector Search capabilities can be a key ingredient in your ML/GenAI applications, visit [Astra DB](https://docs.datastax.com/en/astra/home/astra.html)’s web page on the topic.
## Cleanup
If you want to remove all resources used for this demo, run this cell (*warning: this will delete the tables and the data inserted in them!*):
```
`# we peek at CassIO's config to get a direct handle to the DB connection
session = cassio.config.resolve\_session()
keyspace = cassio.config.resolve\_keyspace()
session.execute(f"DROP TABLE IF EXISTS {keyspace}.philosophers\_cassio;")
session.execute(f"DROP TABLE IF EXISTS {keyspace}.philosophers\_cassio\_partitioned;")`
```
```
`\<cassandra.cluster.ResultSet at 0x7fdcc42e8f10\>`
```