List models | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Models](/api/reference/java/resources/models)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List models
ModelListPage models().list(ModelListParamsparams = ModelListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/models
Lists the currently available models, and provides basic information about each one such as the owner and availability.
##### ParametersExpand Collapse
ModelListParams params
[](<#(resource) models > (method) list > (params) default>)
##### ReturnsExpand Collapse
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
### List models
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.models.ModelListPage;
import com.openai.models.models.ModelListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ModelListPage page = client.models().list();
}
}`
```
```
`{
"object": "list",
"data": [
{
"id": "model-id-0",
"object": "model",
"created": 1686935002,
"owned\_by": "organization-owner"
},
{
"id": "model-id-1",
"object": "model",
"created": 1686935002,
"owned\_by": "organization-owner",
},
{
"id": "model-id-2",
"object": "model",
"created": 1686935002,
"owned\_by": "openai"
},
]
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"id": "model-id-0",
"object": "model",
"created": 1686935002,
"owned\_by": "organization-owner"
},
{
"id": "model-id-1",
"object": "model",
"created": 1686935002,
"owned\_by": "organization-owner",
},
{
"id": "model-id-2",
"object": "model",
"created": 1686935002,
"owned\_by": "openai"
},
]
}
`
```