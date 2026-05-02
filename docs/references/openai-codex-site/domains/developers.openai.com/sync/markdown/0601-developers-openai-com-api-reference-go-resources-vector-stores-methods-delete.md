Delete vector store | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Vector Stores](/api/reference/go/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete vector store
client.VectorStores.Delete(ctx, vectorStoreID) (\*[VectorStoreDeleted](</api/reference/go/resources/vector_stores#(resource) vector_stores > (model) vector_store_deleted > (schema)>), error)
DELETE/vector\_stores/{vector\_store\_id}
Delete a vector store.
##### ParametersExpand Collapse
vectorStoreID string
[](<#(resource) vector_stores > (method) delete > (params) default > (param) vector_store_id > (schema)>)
##### ReturnsExpand Collapse
type VectorStoreDeleted struct{…}
ID string
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) id>)
Deleted bool
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) deleted>)
Object VectorStoreDeleted
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema)>)
### Delete vector store
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
vectorStoreDeleted, err := client.VectorStores.Delete(context.TODO(), "vector\_store\_id")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", vectorStoreDeleted.ID)
}
`
```
```
`{
id: "vs\_abc123",
object: "vector\_store.deleted",
deleted: true
}
`
```
##### Returns Examples
```
`{
id: "vs\_abc123",
object: "vector\_store.deleted",
deleted: true
}
`
```