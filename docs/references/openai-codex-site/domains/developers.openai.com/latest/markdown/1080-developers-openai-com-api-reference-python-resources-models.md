Models | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Models
List and describe the various models available in the API.
##### [List models](/api/reference/python/resources/models/methods/list)
models.list() -\> SyncPage[[Model](</api/reference/python/resources/models#(resource) models > (model) model > (schema)>)]
GET/models
##### [Retrieve model](/api/reference/python/resources/models/methods/retrieve)
models.retrieve(strmodel) -\> [Model](</api/reference/python/resources/models#(resource) models > (model) model > (schema)>)
GET/models/{model}
##### [Delete a fine-tuned model](/api/reference/python/resources/models/methods/delete)
models.delete(strmodel) -\> [ModelDeleted](</api/reference/python/resources/models#(resource) models > (model) model_deleted > (schema)>)
DELETE/models/{model}
##### ModelsExpand Collapse
class Model: …
Describes an OpenAI model offering that can be used with the API.
id: str
The model identifier, which can be referenced in the API endpoints.
[](<#(resource) models > (model) model > (schema) > (property) id>)
created: int
The Unix timestamp (in seconds) when the model was created.
formatunixtime
[](<#(resource) models > (model) model > (schema) > (property) created>)
object: Literal["model"]
The object type, which is always “model”.
[](<#(resource) models > (model) model > (schema) > (property) object>)
owned\_by: str
The organization that owns the model.
[](<#(resource) models > (model) model > (schema) > (property) owned_by>)
[](<#(resource) models > (model) model > (schema)>)
class ModelDeleted: …
id: str
[](<#(resource) models > (model) model_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) models > (model) model_deleted > (schema) > (property) deleted>)
object: str
[](<#(resource) models > (model) model_deleted > (schema) > (property) object>)
[](<#(resource) models > (model) model_deleted > (schema)>)