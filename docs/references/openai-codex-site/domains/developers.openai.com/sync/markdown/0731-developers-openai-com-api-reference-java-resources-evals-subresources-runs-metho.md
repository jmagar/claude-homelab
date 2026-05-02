Delete eval run | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Evals](/api/reference/java/resources/evals)
[Runs](/api/reference/java/resources/evals/subresources/runs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete eval run
[RunDeleteResponse](</api/reference/java/resources/evals#(resource) evals.runs > (model) RunDeleteResponse > (schema)>) evals().runs().delete(RunDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/evals/{eval\_id}/runs/{run\_id}
Delete an eval run.
##### ParametersExpand Collapse
RunDeleteParams params
String evalId
[](<#(resource) evals.runs > (method) delete > (params) default > (param) eval_id > (schema)>)
Optional\<String\> runId
[](<#(resource) evals.runs > (method) delete > (params) default > (param) run_id > (schema)>)
[](<#(resource) evals.runs > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class RunDeleteResponse:
Optional\<Boolean\> deleted
[](<#(resource) evals.runs > (model) RunDeleteResponse > (schema) > (property) deleted>)
Optional\<String\> object\_
[](<#(resource) evals.runs > (model) RunDeleteResponse > (schema) > (property) object>)
Optional\<String\> runId
[](<#(resource) evals.runs > (model) RunDeleteResponse > (schema) > (property) run_id>)
[](<#(resource) evals.runs > (model) RunDeleteResponse > (schema)>)
### Delete eval run
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
import com.openai.models.evals.runs.RunDeleteParams;
import com.openai.models.evals.runs.RunDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
RunDeleteParams params = RunDeleteParams.builder()
.evalId("eval\_id")
.runId("run\_id")
.build();
RunDeleteResponse run = client.evals().runs().delete(params);
}
}`
```
```
`{
"object": "eval.run.deleted",
"deleted": true,
"run\_id": "evalrun\_abc456"
}
`
```
##### Returns Examples
```
`{
"object": "eval.run.deleted",
"deleted": true,
"run\_id": "evalrun\_abc456"
}
`
```