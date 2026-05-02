Download a skill version zip bundle. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Skills](/api/reference/java/resources/skills)
[Versions](/api/reference/java/resources/skills/subresources/versions)
[Content](/api/reference/java/resources/skills/subresources/versions/subresources/content)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Download a skill version zip bundle.
HttpResponse skills().versions().content().retrieve(ContentRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/skills/{skill\_id}/versions/{version}/content
Download a skill version zip bundle.
##### ParametersExpand Collapse
ContentRetrieveParams params
String skillId
[](<#(resource) skills.versions.content > (method) retrieve > (params) default > (param) skill_id > (schema)>)
Optional\<String\> version
The skill version number.
[](<#(resource) skills.versions.content > (method) retrieve > (params) default > (param) version > (schema)>)
[](<#(resource) skills.versions.content > (method) retrieve > (params) default>)
### Download a skill version zip bundle.
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
import com.openai.models.skills.versions.content.ContentRetrieveParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ContentRetrieveParams params = ContentRetrieveParams.builder()
.skillId("skill\_123")
.version("version")
.build();
HttpResponse content = client.skills().versions().content().retrieve(params);
}
}`
```
##### Returns Examples