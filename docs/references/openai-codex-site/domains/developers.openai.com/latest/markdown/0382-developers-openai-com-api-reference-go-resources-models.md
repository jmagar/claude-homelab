Models | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Models
List and describe the various models available in the API.
##### [List models](/api/reference/go/resources/models/methods/list)
client.Models.List(ctx) (\*Page[[Model](</api/reference/go/resources/models#(resource) models > (model) model > (schema)>)], error)
GET/models
##### [Retrieve model](/api/reference/go/resources/models/methods/retrieve)
client.Models.Get(ctx, model) (\*[Model](</api/reference/go/resources/models#(resource) models > (model) model > (schema)>), error)
GET/models/{model}
##### [Delete a fine-tuned model](/api/reference/go/resources/models/methods/delete)
client.Models.Delete(ctx, model) (\*[ModelDeleted](</api/reference/go/resources/models#(resource) models > (model) model_deleted > (schema)>), error)
DELETE/models/{model}
##### ModelsExpand Collapse
type Model struct{…}
Describes an OpenAI model offering that can be used with the API.
ID string
The model identifier, which can be referenced in the API endpoints.
[](<#(resource) models > (model) model > (schema) > (property) id>)
Created int64
The Unix timestamp (in seconds) when the model was created.
formatunixtime
[](<#(resource) models > (model) model > (schema) > (property) created>)
Object Model
The object type, which is always “model”.
[](<#(resource) models > (model) model > (schema) > (property) object>)
OwnedBy string
The organization that owns the model.
[](<#(resource) models > (model) model > (schema) > (property) owned_by>)
[](<#(resource) models > (model) model > (schema)>)
type ModelDeleted struct{…}
ID string
[](<#(resource) models > (model) model_deleted > (schema) > (property) id>)
Deleted bool
[](<#(resource) models > (model) model_deleted > (schema) > (property) deleted>)
Object string
[](<#(resource) models > (model) model_deleted > (schema) > (property) object>)
[](<#(resource) models > (model) model_deleted > (schema)>)