Retrieve model | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Models](/api/reference/java/resources/models)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve model
[Model](</api/reference/java/resources/models#(resource) models > (model) model > (schema)>) models().retrieve(ModelRetrieveParamsparams = ModelRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/models/{model}
Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
##### ParametersExpand Collapse
ModelRetrieveParams params
Optional\<String\> model
[](<#(resource) models > (method) retrieve > (params) default > (param) model > (schema)>)
[](<#(resource) models > (method) retrieve > (params) default>)
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
### Retrieve model
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
import com.openai.models.models.Model;
import com.openai.models.models.ModelRetrieveParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
Model model = client.models().retrieve("gpt-4o-mini");
}
}`
```
```
`{
"id": "VAR\_chat\_model\_id",
"object": "model",
"created": 1686935002,
"owned\_by": "openai"
}
`
```
##### Returns Examples
```
`{
"id": "VAR\_chat\_model\_id",
"object": "model",
"created": 1686935002,
"owned\_by": "openai"
}
`
```