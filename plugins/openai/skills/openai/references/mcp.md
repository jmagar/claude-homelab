## `openai`

OpenAI API (chat, embeddings, models, images, audio)

Category: `ai`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `model.list` | List available models | false | - | `Model[]` |
| `chat.complete` | Create a chat completion | false | `model*: string`<br>`messages*: json`<br>`temperature: number`<br>`max_tokens: integer` | `ChatCompletionResponse` |
| `embed.create` | Create embeddings for one or more input strings | false | `model*: string`<br>`input: string`<br>`inputs: json`<br>`dimensions: integer` | `EmbeddingsResponse` |
| `server.health` | Check whether the OpenAI API (or compatible server) is reachable | false | - | `void` |
