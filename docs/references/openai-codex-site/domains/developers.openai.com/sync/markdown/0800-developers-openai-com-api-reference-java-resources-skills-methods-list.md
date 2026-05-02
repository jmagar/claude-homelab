List all skills for the current project. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Skills](/api/reference/java/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List all skills for the current project.
SkillListPage skills().list(SkillListParamsparams = SkillListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/skills
List all skills for the current project.
##### ParametersExpand Collapse
SkillListParams params
Optional\<String\> after
Identifier for the last item from the previous pagination request
[](<#(resource) skills > (method) list > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
Number of items to retrieve
minimum0
maximum100
[](<#(resource) skills > (method) list > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/skills/methods/list#(resource) skills > (method) list > (params) default > (param) order > (schema)>)\> order
Sort order of results by timestamp. Use `asc` for ascending order or `desc` for descending order.
ASC("asc")
[](<#(resource) skills > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) skills > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) skills > (method) list > (params) default > (param) order > (schema)>)
[](<#(resource) skills > (method) list > (params) default>)
##### ReturnsExpand Collapse
class Skill:
String id
Unique identifier for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) id>)
long createdAt
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (model) skill > (schema) > (property) created_at>)
String defaultVersion
Default version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) default_version>)
String description
Description of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) description>)
String latestVersion
Latest version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) latest_version>)
String name
Name of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) name>)
JsonValue; object\_ "skill"constant"skill"constant
The object type, which is `skill`.
[](<#(resource) skills > (model) skill > (schema) > (property) object>)
[](<#(resource) skills > (model) skill > (schema)>)
### List all skills for the current project.
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
import com.openai.models.skills.SkillListPage;
import com.openai.models.skills.SkillListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
SkillListPage page = client.skills().list();
}
}`
```
200 example
```
`{
"data": [
{
"id": "id",
"created\_at": 0,
"default\_version": "default\_version",
"description": "description",
"latest\_version": "latest\_version",
"name": "name",
"object": "skill"
}
],
"first\_id": "first\_id",
"has\_more": true,
"last\_id": "last\_id",
"object": "list"
}`
```
##### Returns Examples
200 example
```
`{
"data": [
{
"id": "id",
"created\_at": 0,
"default\_version": "default\_version",
"description": "description",
"latest\_version": "latest\_version",
"name": "name",
"object": "skill"
}
],
"first\_id": "first\_id",
"has\_more": true,
"last\_id": "last\_id",
"object": "list"
}`
```