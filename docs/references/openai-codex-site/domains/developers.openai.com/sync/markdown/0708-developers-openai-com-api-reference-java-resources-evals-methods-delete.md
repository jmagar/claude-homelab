Delete an eval | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Evals](/api/reference/java/resources/evals)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete an eval
[EvalDeleteResponse](</api/reference/java/resources/evals#(resource) evals > (model) EvalDeleteResponse > (schema)>) evals().delete(EvalDeleteParamsparams = EvalDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/evals/{eval\_id}
Delete an evaluation.
##### ParametersExpand Collapse
EvalDeleteParams params
Optional\<String\> evalId
[](<#(resource) evals > (method) delete > (params) default > (param) eval_id > (schema)>)
[](<#(resource) evals > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class EvalDeleteResponse:
boolean deleted
[](<#(resource) evals > (model) EvalDeleteResponse > (schema) > (property) deleted>)
String evalId
[](<#(resource) evals > (model) EvalDeleteResponse > (schema) > (property) eval_id>)
String object\_
[](<#(resource) evals > (model) EvalDeleteResponse > (schema) > (property) object>)
[](<#(resource) evals > (model) EvalDeleteResponse > (schema)>)
### Delete an eval
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
import com.openai.models.evals.EvalDeleteParams;
import com.openai.models.evals.EvalDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
EvalDeleteResponse eval = client.evals().delete("eval\_id");
}
}`
```
```
`{
"object": "eval.deleted",
"deleted": true,
"eval\_id": "eval\_abc123"
}
`
```
##### Returns Examples
```
`{
"object": "eval.deleted",
"deleted": true,
"eval\_id": "eval\_abc123"
}
`
```