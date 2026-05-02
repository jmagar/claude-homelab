List skill versions for a skill. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Skills](/api/reference/java/resources/skills)
[Versions](/api/reference/java/resources/skills/subresources/versions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List skill versions for a skill.
VersionListPage skills().versions().list(VersionListParamsparams = VersionListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/skills/{skill\_id}/versions
List skill versions for a skill.
##### ParametersExpand Collapse
VersionListParams params
Optional\<String\> skillId
[](<#(resource) skills.versions > (method) list > (params) default > (param) skill_id > (schema)>)
Optional\<String\> after
The skill version ID to start after.
[](<#(resource) skills.versions > (method) list > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
Number of versions to retrieve.
minimum0
maximum100
[](<#(resource) skills.versions > (method) list > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/skills/subresources/versions/methods/list#(resource) skills.versions > (method) list > (params) default > (param) order > (schema)>)\> order
Sort order of results by version number.
ASC("asc")
[](<#(resource) skills.versions > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) skills.versions > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) skills.versions > (method) list > (params) default > (param) order > (schema)>)
[](<#(resource) skills.versions > (method) list > (params) default>)
##### ReturnsExpand Collapse
class SkillVersion:
String id
Unique identifier for the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) id>)
long createdAt
Unix timestamp (seconds) for when the version was created.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) created_at>)
String description
Description of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) description>)
String name
Name of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) name>)
JsonValue; object\_ "skill.version"constant"skill.version"constant
The object type, which is `skill.version`.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) object>)
String skillId
Identifier of the skill for this version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) skill_id>)
String version
Version number for this skill.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) skill_version > (schema)>)
### List skill versions for a skill.
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
import com.openai.models.skills.versions.VersionListPage;
import com.openai.models.skills.versions.VersionListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
VersionListPage page = client.skills().versions().list("skill\_123");
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
"description": "description",
"name": "name",
"object": "skill.version",
"skill\_id": "skill\_id",
"version": "version"
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
"description": "description",
"name": "name",
"object": "skill.version",
"skill\_id": "skill\_id",
"version": "version"
}
],
"first\_id": "first\_id",
"has\_more": true,
"last\_id": "last\_id",
"object": "list"
}`
```