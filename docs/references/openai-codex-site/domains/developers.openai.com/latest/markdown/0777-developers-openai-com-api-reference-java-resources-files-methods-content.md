Retrieve file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Files](/api/reference/java/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve file content
HttpResponse files().content(FileContentParamsparams = FileContentParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/files/{file\_id}/content
Returns the contents of the specified file.
##### ParametersExpand Collapse
FileContentParams params
Optional\<String\> fileId
[](<#(resource) files > (method) content > (params) default > (param) file_id > (schema)>)
[](<#(resource) files > (method) content > (params) default>)
### Retrieve file content
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
import com.openai.models.files.FileContentParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
HttpResponse response = client.files().content("file\_id");
}
}`
```
##### Returns Examples