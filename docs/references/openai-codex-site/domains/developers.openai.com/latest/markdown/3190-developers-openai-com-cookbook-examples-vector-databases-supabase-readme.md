Supabase Vector Database
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
Dec 4, 2023
# Supabase Vector Database
[ GR ](https://twitter.com/ggrdson)
[ Greg Richardson ](https://twitter.com/ggrdson)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/supabase/README.md) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/supabase/README.md)
[Supabase](https://supabase.com/docs) is an open-source Firebase alternative built on top of [Postgres](https://en.wikipedia.org/wiki/PostgreSQL), a production-grade SQL database.
[Supabase Vector](https://supabase.com/docs/guides/ai) is a vector toolkit built on [pgvector](https://github.com/pgvector/pgvector), a Postgres extension that allows you to store your embeddings inside the same database that holds the rest of your application data. When combined with pgvector’s indexing algorithms, vector search remains [fast at large scales](https://supabase.com/blog/increase-performance-pgvector-hnsw).
Supabase adds an ecosystem of services and tools on top of Postgres that makes app development as quick as possible, including:
* [Auto-generated REST APIs](https://supabase.com/docs/guides/api)
* [Auto-generated GraphQL APIs](https://supabase.com/docs/guides/graphql)
* [Realtime APIs](https://supabase.com/docs/guides/realtime)
* [Authentication](https://supabase.com/docs/guides/auth)
* [File storage](https://supabase.com/docs/guides/storage)
* [Edge functions](https://supabase.com/docs/guides/functions)
We can use these services alongside pgvector to store and query embeddings within Postgres.
## OpenAI Cookbook Examples
Below are guides and resources that walk you through how to use OpenAI embedding models with Supabase Vector.
|Guide|Description|
|[Semantic search](./semantic-search.mdx)|Store, index, and query embeddings at scale using pgvector|
## Additional resources
* [Vector columns](https://supabase.com/docs/guides/ai/vector-columns)
* [Vector indexes](https://supabase.com/docs/guides/ai/vector-indexes)
* [RAG with permissions](https://supabase.com/docs/guides/ai/rag-with-permissions)
* [Going to production](https://supabase.com/docs/guides/ai/going-to-prod)
* [Deciding on compute](https://supabase.com/docs/guides/ai/choosing-compute-addon)