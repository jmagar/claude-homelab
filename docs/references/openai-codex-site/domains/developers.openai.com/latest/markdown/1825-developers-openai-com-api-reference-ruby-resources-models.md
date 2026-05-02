Models | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Models
List and describe the various models available in the API.
##### [List models](/api/reference/ruby/resources/models/methods/list)
models.list() -\> Page\<[Model](</api/reference/ruby/resources/models#(resource) models > (model) model > (schema)>) { id, created, object, owned\_by } \>
GET/models
##### [Retrieve model](/api/reference/ruby/resources/models/methods/retrieve)
models.retrieve(model) -\> [Model](</api/reference/ruby/resources/models#(resource) models > (model) model > (schema)>) { id, created, object, owned\_by }
GET/models/{model}
##### [Delete a fine-tuned model](/api/reference/ruby/resources/models/methods/delete)
models.delete(model) -\> [ModelDeleted](</api/reference/ruby/resources/models#(resource) models > (model) model_deleted > (schema)>) { id, deleted, object }
DELETE/models/{model}
##### ModelsExpand Collapse
class Model { id, created, object, owned\_by }
Describes an OpenAI model offering that can be used with the API.
id: String
The model identifier, which can be referenced in the API endpoints.
[](<#(resource) models > (model) model > (schema) > (property) id>)
created: Integer
The Unix timestamp (in seconds) when the model was created.
formatunixtime
[](<#(resource) models > (model) model > (schema) > (property) created>)
object: :model
The object type, which is always “model”.
[](<#(resource) models > (model) model > (schema) > (property) object>)
owned\_by: String
The organization that owns the model.
[](<#(resource) models > (model) model > (schema) > (property) owned_by>)
[](<#(resource) models > (model) model > (schema)>)
class ModelDeleted { id, deleted, object }
id: String
[](<#(resource) models > (model) model_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) models > (model) model_deleted > (schema) > (property) deleted>)
object: String
[](<#(resource) models > (model) model_deleted > (schema) > (property) object>)
[](<#(resource) models > (model) model_deleted > (schema)>)