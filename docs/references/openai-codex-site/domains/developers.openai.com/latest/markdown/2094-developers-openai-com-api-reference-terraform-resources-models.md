Models | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Models
List and describe the various models available in the API.
#### data openai\_model
##### required Expand Collapse
model: String
[](<#(resource) models > (terraform datasource-single) > (attribute) model>)
##### computed Expand Collapse
created: Int64
The Unix timestamp (in seconds) when the model was created.
[](<#(resource) models > (terraform datasource-single) > (attribute) created>)
id: String
The model identifier, which can be referenced in the API endpoints.
[](<#(resource) models > (terraform datasource-single) > (attribute) id>)
object: String
The object type, which is always “model”.
[](<#(resource) models > (terraform datasource-single) > (attribute) object>)
owned\_by: String
The organization that owns the model.
[](<#(resource) models > (terraform datasource-single) > (attribute) owned_by>)
#### data openai\_models
##### optional Expand Collapse
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) models > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The model identifier, which can be referenced in the API endpoints.
[](<#(resource) models > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created: Int64
The Unix timestamp (in seconds) when the model was created.
[](<#(resource) models > (terraform datasource-plural) > (attribute) items > (attribute) created>)
object: String
The object type, which is always “model”.
[](<#(resource) models > (terraform datasource-plural) > (attribute) items > (attribute) object>)
owned\_by: String
The organization that owns the model.
[](<#(resource) models > (terraform datasource-plural) > (attribute) items > (attribute) owned_by>)
[](<#(resource) models > (terraform datasource-plural) > (attribute) items>)