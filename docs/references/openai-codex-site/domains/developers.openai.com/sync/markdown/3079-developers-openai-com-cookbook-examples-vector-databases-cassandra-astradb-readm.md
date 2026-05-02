Cassandra / Astra DB
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
# Cassandra / Astra DB
[ HE ](https://github.com/hemidactylus)
[ hemidactylus ](https://github.com/hemidactylus)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/cassandra_astradb/README.md) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/cassandra_astradb/README.md)
The demos in this directory show how to use the Vector
Search capabilities available today in **DataStax Astra DB**, a serverless
Database-as-a-Service built on Apache Cassandra®.
These example notebooks demonstrate implementation of
the same GenAI standard RAG workload with different libraries and APIs.
To use [Astra DB](https://docs.datastax.com/en/astra/home/astra.html)
with its HTTP API interface, head to the “AstraPy” notebook (`astrapy`
is the Python client to interact with the database).
If you prefer CQL access to the database (either with
[Astra DB](https://docs.datastax.com/en/astra-serverless/docs/vector-search/overview.html)
or a Cassandra cluster
[supporting vector search](https://cassandra.apache.org/doc/trunk/cassandra/vector-search/overview.html)),
check the “CQL” or “CassIO” notebooks — they differ in the level of abstraction you get to work at.
If you want to know more about Astra DB and its Vector Search capabilities,
head over to [datastax.com](https://docs.datastax.com/en/astra/home/astra.html).
### Example notebooks
The following examples show how easily OpenAI and DataStax Astra DB can
work together to power vector-based AI applications. You can run them either
with your local Jupyter engine or as Colab notebooks:
|Use case|Target database|Framework|Notebook|Google Colab|
|Search/generate quotes|Astra DB|AstraPy|[Notebook](./Philosophical_Quotes_AstraPy.ipynb)|[](https://colab.research.google.com/github/openai/openai-cookbook/blob/main/examples/vector_databases/cassandra_astradb/Philosophical_Quotes_AstraPy.ipynb)|
|Search/generate quotes|Cassandra / Astra DB through CQL|CassIO|[Notebook](./Philosophical_Quotes_cassIO.ipynb)|[](https://colab.research.google.com/github/openai/openai-cookbook/blob/main/examples/vector_databases/cassandra_astradb/Philosophical_Quotes_cassIO.ipynb)|
|Search/generate quotes|Cassandra / Astra DB through CQL|Plain Cassandra language|[Notebook](./Philosophical_Quotes_CQL.ipynb)|[](https://colab.research.google.com/github/openai/openai-cookbook/blob/main/examples/vector_databases/cassandra_astradb/Philosophical_Quotes_CQL.ipynb)|
### Vector similarity, visual representation