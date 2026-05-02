## `tei`

Hugging Face TEI server — embeddings, rerankers, sequence classification

Category: `ai`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `server.health` | Check whether the TEI server is healthy | false | - | `void` |
| `server.info` | Get served model and runtime metadata | false | - | `Info` |
| `embed.create` | Generate embeddings for one or more input strings | false | `input: string`<br>`inputs: json`<br>`normalize: bool`<br>`truncate: bool`<br>`payload: json` | `number[][]` |
| `embed.rerank` | Rerank texts against a query (POST /rerank). Max 100 texts per call — split larger batches across multiple requests. | false | `query*: string`<br>`texts*: json`<br>`truncate: bool`<br>`raw_scores: bool` | `RerankHit[]` |
| `embed.tokenize` | Tokenize one or more input strings (POST /tokenize). Returns token-id sequences. | false | `inputs*: json`<br>`add_special_tokens: bool` | `u32[][]` |
| `embed.similarity` | Compute pairwise similarity scores for sentence pairs (POST /similarity). Inputs must be an array of [string, string] pairs. | false | `inputs*: json` | `f32[]` |
| `embed.sparse` | Generate sparse (SPLADE-style) embeddings for one or more inputs (POST /embed_sparse). | false | `inputs*: json`<br>`truncate: bool` | `SparseToken[][]` |
| `embed.openai` | Generate embeddings via the OpenAI-compatible endpoint (POST /v1/embeddings). Body and response are passed through as raw JSON. | false | `body*: json` | `json` |
