SingleStoreDB
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
# SingleStoreDB
[ AR ](https://github.com/arno756)
[ arno756 ](https://github.com/arno756)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/SingleStoreDB/README.md) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/SingleStoreDB/README.md)
**[SingleStoreDB](https://singlestore.com)** has first-class support for vector search through our [Vector Functions](https://docs.singlestore.com/managed-service/en/reference/sql-reference/vector-functions.html). Our vector database subsystem, first made available in 2017 and subsequently enhanced, allows extremely fast nearest-neighbor search to find objects that are semantically similar, easily using SQL.
SingleStoreDB supports vectors and vector similarity search using dot\_product (for cosine similarity) and euclidean\_distance functions. These functions are used by our customers for applications including face recognition, visual product photo search and text-based semantic search. With the explosion of generative AI technology, these capabilities form a firm foundation for text-based AI chatbots.
But remember, SingleStoreDB is a high-performance, scalable, modern SQL DBMS that supports multiple data models including structured data, semi-structured data based on JSON, time-series, full text, spatial, key-value and of course vector data. Start powering your next intelligent application with SingleStoreDB today!
## Example
This folder contains examples of using SingleStoreDB and OpenAI together. We will keep adding more scenarios so stay tuned!
|Name|Description|
|[OpenAI wikipedia semantic search](./OpenAI_wikipedia_semantic_search.ipynb)|Improve ChatGPT accuracy through SingleStoreDB semantic Search in QA|