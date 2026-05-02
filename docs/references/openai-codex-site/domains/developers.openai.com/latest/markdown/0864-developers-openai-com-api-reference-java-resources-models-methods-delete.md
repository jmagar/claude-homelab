Delete a fine-tuned model | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Models](/api/reference/java/resources/models)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a fine-tuned model
[ModelDeleted](</api/reference/java/resources/models#(resource) models > (model) model_deleted > (schema)>) models().delete(ModelDeleteParamsparams = ModelDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/models/{model}
Delete a fine-tuned model. You must have the Owner role in your organization to delete a model.
##### ParametersExpand Collapse
ModelDeleteParams params
Optional\<String\> model
[](<#(resource) models > (method) delete > (params) default > (param) model > (schema)>)
[](<#(resource) models > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class ModelDeleted:
String id
[](<#(resource) models > (model) model_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) models > (model) model_deleted > (schema) > (property) deleted>)
String object\_
[](<#(resource) models > (model) model_deleted > (schema) > (property) object>)
[](<#(resource) models > (model) model_deleted > (schema)>)
### Delete a fine-tuned model
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
import com.openai.models.models.ModelDeleteParams;
import com.openai.models.models.ModelDeleted;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ModelDeleted modelDeleted = client.models().delete("ft:gpt-4o-mini:acemeco:suffix:abc123");
}
}`
```
```
`{
"id": "ft:gpt-4o-mini:acemeco:suffix:abc123",
"object": "model",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "ft:gpt-4o-mini:acemeco:suffix:abc123",
"object": "model",
"deleted": true
}
`
```