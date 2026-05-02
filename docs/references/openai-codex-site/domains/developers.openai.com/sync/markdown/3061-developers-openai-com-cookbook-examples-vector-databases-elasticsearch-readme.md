Elasticsearch
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
# Elasticsearch
[ LE ](https://github.com/leemthompo)
[ leemthompo ](https://github.com/leemthompo)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/elasticsearch/README.md) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/elasticsearch/README.md)
Elasticsearch is a popular search/analytics engine and [vector database](https://www.elastic.co/elasticsearch/vector-database).
Elasticsearch offers an efficient way to create, store, and search vector embeddings at scale.
For technical details, refer to the [Elasticsearch documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/knn-search.html).
The [`elasticsearch-labs`](https://github.com/elastic/elasticsearch-labs) repo contains executable Python notebooks, sample apps, and resources for testing out the Elastic platform.
## OpenAI cookbook notebooks 📒
Check out our notebooks in this repo for working with OpenAI, using Elasticsearch as your vector database.
### [Semantic search](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/elasticsearch/elasticsearch-semantic-search.ipynb)
In this notebook you’ll learn how to:
* Index the OpenAI Wikipedia embeddings dataset into Elasticsearch
* Encode a question with the `openai ada-02` model
* Perform a semantic search
### [Retrieval augmented generation](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/elasticsearch/elasticsearch-retrieval-augmented-generation.ipynb)
This notebooks builds on the semantic search notebook by:
* Selecting the top hit from a semantic search
* Sending that result to the OpenAI [Chat Completions](https://platform.openai.com/docs/guides/gpt/chat-completions-api) API endpoint for retrieval augmented generation (RAG)