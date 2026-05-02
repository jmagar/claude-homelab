Models | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Models
List and describe the various models available in the API.
##### [List models](/api/reference/typescript/resources/models/methods/list)
client.models.list(RequestOptionsoptions?): Page\<[Model](</api/reference/typescript/resources/models#(resource) models > (model) model > (schema)>) { id, created, object, owned\_by } \>
GET/models
##### [Retrieve model](/api/reference/typescript/resources/models/methods/retrieve)
client.models.retrieve(stringmodel, RequestOptionsoptions?): [Model](</api/reference/typescript/resources/models#(resource) models > (model) model > (schema)>) { id, created, object, owned\_by }
GET/models/{model}
##### [Delete a fine-tuned model](/api/reference/typescript/resources/models/methods/delete)
client.models.delete(stringmodel, RequestOptionsoptions?): [ModelDeleted](</api/reference/typescript/resources/models#(resource) models > (model) model_deleted > (schema)>) { id, deleted, object }
DELETE/models/{model}
##### ModelsExpand Collapse
Model { id, created, object, owned\_by }
Describes an OpenAI model offering that can be used with the API.
id: string
The model identifier, which can be referenced in the API endpoints.
[](<#(resource) models > (model) model > (schema) > (property) id>)
created: number
The Unix timestamp (in seconds) when the model was created.
formatunixtime
[](<#(resource) models > (model) model > (schema) > (property) created>)
object: "model"
The object type, which is always “model”.
[](<#(resource) models > (model) model > (schema) > (property) object>)
owned\_by: string
The organization that owns the model.
[](<#(resource) models > (model) model > (schema) > (property) owned_by>)
[](<#(resource) models > (model) model > (schema)>)
ModelDeleted { id, deleted, object }
id: string
[](<#(resource) models > (model) model_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) models > (model) model_deleted > (schema) > (property) deleted>)
object: string
[](<#(resource) models > (model) model_deleted > (schema) > (property) object>)
[](<#(resource) models > (model) model_deleted > (schema)>)