Retrieve container file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Containers](/api/reference/java/resources/containers)
[Files](/api/reference/java/resources/containers/subresources/files)
[Content](/api/reference/java/resources/containers/subresources/files/subresources/content)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve container file content
HttpResponse containers().files().content().retrieve(ContentRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/containers/{container\_id}/files/{file\_id}/content
Retrieve Container File Content
##### ParametersExpand Collapse
ContentRetrieveParams params
String containerId
[](<#(resource) containers.files.content > (method) retrieve > (params) default > (param) container_id > (schema)>)
Optional\<String\> fileId
[](<#(resource) containers.files.content > (method) retrieve > (params) default > (param) file_id > (schema)>)
[](<#(resource) containers.files.content > (method) retrieve > (params) default>)
### Retrieve container file content
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
import com.openai.core.http.HttpResponse;
import com.openai.models.containers.files.content.ContentRetrieveParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ContentRetrieveParams params = ContentRetrieveParams.builder()
.containerId("container\_id")
.fileId("file\_id")
.build();
HttpResponse content = client.containers().files().content().retrieve(params);
}
}`
```
```
`\<binary content of the file\>
`
```
##### Returns Examples
```
`\<binary content of the file\>
`
```