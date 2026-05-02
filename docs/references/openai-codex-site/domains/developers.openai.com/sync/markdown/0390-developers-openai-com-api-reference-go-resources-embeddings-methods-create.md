Create embeddings | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Embeddings](/api/reference/go/resources/embeddings)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create embeddings
client.Embeddings.New(ctx, body) (\*[CreateEmbeddingResponse](</api/reference/go/resources/embeddings#(resource) embeddings > (model) create_embedding_response > (schema)>), error)
POST/embeddings
Creates an embedding vector representing the input text.
##### ParametersExpand Collapse
body EmbeddingNewParams
Input param.Field[[EmbeddingNewParamsInputUnion](</api/reference/go/resources/embeddings/methods/create#(resource) embeddings > (method) create > (params) default > (param) input > (schema)>)]
Input text to embed, encoded as a string or array of tokens. To embed multiple inputs in a single request, pass an array of strings or array of token arrays. The input must not exceed the max input tokens for the model (8192 tokens for all embedding models), cannot be an empty string, and any array must be 2048 dimensions or less. [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken) for counting tokens. In addition to the per-input token limit, all embedding models enforce a maximum of 300,000 tokens summed across all inputs in a single request.
string
[](<#(resource) embeddings > (method) create > (params) default > (param) input > (schema) > (variant) 0>)
type EmbeddingNewParamsInputArrayOfStrings []string
The array of strings that will be turned into an embedding.
[](<#(resource) embeddings > (method) create > (params) default > (param) input > (schema) > (variant) 1>)
type EmbeddingNewParamsInputArrayOfTokens []int64
The array of integers that will be turned into an embedding.
[](<#(resource) embeddings > (method) create > (params) default > (param) input > (schema) > (variant) 2>)
type EmbeddingNewParamsInputArrayOfTokenArrays [][]int64
The array of arrays containing integers that will be turned into an embedding.
[](<#(resource) embeddings > (method) create > (params) default > (param) input > (schema) > (variant) 3>)
[](<#(resource) embeddings > (method) create > (params) default > (param) input>)
Model param.Field[[EmbeddingModel](</api/reference/go/resources/embeddings#(resource) embeddings > (model) embedding_model > (schema)>)]
ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
string
[](<#(resource) embeddings > (method) create > (params) default > (param) model > (schema) > (variant) 0>)
type EmbeddingModel string
One of the following:
const EmbeddingModelTextEmbeddingAda002 [EmbeddingModel](</api/reference/go/resources/embeddings#(resource) embeddings > (model) embedding_model > (schema)>) = "text-embedding-ada-002"
[](<#(resource) embeddings > (model) embedding_model > (schema) > (member) 0>)
const EmbeddingModelTextEmbedding3Small [EmbeddingModel](</api/reference/go/resources/embeddings#(resource) embeddings > (model) embedding_model > (schema)>) = "text-embedding-3-small"
[](<#(resource) embeddings > (model) embedding_model > (schema) > (member) 1>)
const EmbeddingModelTextEmbedding3Large [EmbeddingModel](</api/reference/go/resources/embeddings#(resource) embeddings > (model) embedding_model > (schema)>) = "text-embedding-3-large"
[](<#(resource) embeddings > (model) embedding_model > (schema) > (member) 2>)
[](<#(resource) embeddings > (model) embedding_model > (schema)>)
[](<#(resource) embeddings > (method) create > (params) default > (param) model>)
Dimensions param.Field[int64]Optional
The number of dimensions the resulting output embeddings should have. Only supported in `text-embedding-3` and later models.
minimum1
[](<#(resource) embeddings > (method) create > (params) default > (param) dimensions>)
EncodingFormat param.Field[[EmbeddingNewParamsEncodingFormat](</api/reference/go/resources/embeddings/methods/create#(resource) embeddings > (method) create > (params) default > (param) encoding_format > (schema)>)]Optional
The format to return the embeddings in. Can be either `float` or [`base64`](https://pypi.org/project/pybase64/).
const EmbeddingNewParamsEncodingFormatFloat [EmbeddingNewParamsEncodingFormat](</api/reference/go/resources/embeddings/methods/create#(resource) embeddings > (method) create > (params) default > (param) encoding_format > (schema)>) = "float"
[](<#(resource) embeddings > (method) create > (params) default > (param) encoding_format > (schema) > (member) 0>)
const EmbeddingNewParamsEncodingFormatBase64 [EmbeddingNewParamsEncodingFormat](</api/reference/go/resources/embeddings/methods/create#(resource) embeddings > (method) create > (params) default > (param) encoding_format > (schema)>) = "base64"
[](<#(resource) embeddings > (method) create > (params) default > (param) encoding_format > (schema) > (member) 1>)
[](<#(resource) embeddings > (method) create > (params) default > (param) encoding_format>)
User param.Field[string]Optional
A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#end-user-ids).
[](<#(resource) embeddings > (method) create > (params) default > (param) user>)
[](<#(resource) embeddings > (method) create > (params) default>)
##### ReturnsExpand Collapse
type CreateEmbeddingResponse struct{…}
Data [][Embedding](</api/reference/go/resources/embeddings#(resource) embeddings > (model) embedding > (schema)>)
The list of embeddings generated by the model.
Embedding []float64
The embedding vector, which is a list of floats. The length of vector depends on the model as listed in the [embedding guide](https://platform.openai.com/docs/guides/embeddings).
[](<#(resource) embeddings > (model) embedding > (schema) > (property) embedding>)
Index int64
The index of the embedding in the list of embeddings.
[](<#(resource) embeddings > (model) embedding > (schema) > (property) index>)
Object Embedding
The object type, which is always “embedding”.
[](<#(resource) embeddings > (model) embedding > (schema) > (property) object>)
[](<#(resource) embeddings > (model) create_embedding_response > (schema) > (property) data>)
Model string
The name of the model used to generate the embedding.
[](<#(resource) embeddings > (model) create_embedding_response > (schema) > (property) model>)
Object List
The object type, which is always “list”.
[](<#(resource) embeddings > (model) create_embedding_response > (schema) > (property) object>)
Usage CreateEmbeddingResponseUsage
The usage information for the request.
PromptTokens int64
The number of tokens used by the prompt.
[](<#(resource) embeddings > (model) create_embedding_response > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
The total number of tokens used by the request.
[](<#(resource) embeddings > (model) create_embedding_response > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) embeddings > (model) create_embedding_response > (schema) > (property) usage>)
[](<#(resource) embeddings > (model) create_embedding_response > (schema)>)
### Create embeddings
Go
HTTP
HTTP
TypeScript
TypeScript
Python
Python
Java
Java
Go
Go
Ruby
Ruby
Terraform
Terraform
```
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
createEmbeddingResponse, err := client.Embeddings.New(context.TODO(), openai.EmbeddingNewParams{
Input: openai.EmbeddingNewParamsInputUnion{
OfString: openai.String("The quick brown fox jumped over the lazy dog"),
},
Model: openai.EmbeddingModelTextEmbedding3Small,
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", createEmbeddingResponse.Data)
}
`
```
```
`{
"object": "list",
"data": [
{
"object": "embedding",
"embedding": [
0.0023064255,
-0.009327292,
.... (1536 floats total for ada-002)
-0.0028842222,
],
"index": 0
}
],
"model": "text-embedding-ada-002",
"usage": {
"prompt\_tokens": 8,
"total\_tokens": 8
}
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"object": "embedding",
"embedding": [
0.0023064255,
-0.009327292,
.... (1536 floats total for ada-002)
-0.0028842222,
],
"index": 0
}
],
"model": "text-embedding-ada-002",
"usage": {
"prompt\_tokens": 8,
"total\_tokens": 8
}
}
`
```