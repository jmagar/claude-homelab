Models | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Models
List and describe the various models available in the API.
##### [List models](/api/reference/java/resources/models/methods/list)
ModelListPage models().list(ModelListParamsparams = ModelListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/models
##### [Retrieve model](/api/reference/java/resources/models/methods/retrieve)
[Model](</api/reference/java/resources/models#(resource) models > (model) model > (schema)>) models().retrieve(ModelRetrieveParamsparams = ModelRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/models/{model}
##### [Delete a fine-tuned model](/api/reference/java/resources/models/methods/delete)
[ModelDeleted](</api/reference/java/resources/models#(resource) models > (model) model_deleted > (schema)>) models().delete(ModelDeleteParamsparams = ModelDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/models/{model}
##### ModelsExpand Collapse
class Model:
Describes an OpenAI model offering that can be used with the API.
String id
The model identifier, which can be referenced in the API endpoints.
[](<#(resource) models > (model) model > (schema) > (property) id>)
long created
The Unix timestamp (in seconds) when the model was created.
formatunixtime
[](<#(resource) models > (model) model > (schema) > (property) created>)
JsonValue; object\_ "model"constant"model"constant
The object type, which is always “model”.
[](<#(resource) models > (model) model > (schema) > (property) object>)
String ownedBy
The organization that owns the model.
[](<#(resource) models > (model) model > (schema) > (property) owned_by>)
[](<#(resource) models > (model) model > (schema)>)
class ModelDeleted:
String id
[](<#(resource) models > (model) model_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) models > (model) model_deleted > (schema) > (property) deleted>)
String object\_
[](<#(resource) models > (model) model_deleted > (schema) > (property) object>)
[](<#(resource) models > (model) model_deleted > (schema)>)