Delete a container | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Containers](/api/reference/java/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a container
containers().delete(ContainerDeleteParamsparams = ContainerDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/containers/{container\_id}
Delete Container
##### ParametersExpand Collapse
ContainerDeleteParams params
Optional\<String\> containerId
[](<#(resource) containers > (method) delete > (params) default > (param) container_id > (schema)>)
[](<#(resource) containers > (method) delete > (params) default>)
### Delete a container
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
import com.openai.models.containers.ContainerDeleteParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
client.containers().delete("container\_id");
}
}`
```
```
`{
"id": "cntr\_682dfebaacac8198bbfe9c2474fb6f4a085685cbe3cb5863",
"object": "container.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "cntr\_682dfebaacac8198bbfe9c2474fb6f4a085685cbe3cb5863",
"object": "container.deleted",
"deleted": true
}
`
```