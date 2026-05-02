Get a specific skill version. | OpenAI API Reference
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
# Get a specific skill version.
[SkillVersion](</api/reference/java/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) skills().versions().retrieve(VersionRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/skills/{skill\_id}/versions/{version}
Get a specific skill version.
##### ParametersExpand Collapse
VersionRetrieveParams params
String skillId
[](<#(resource) skills.versions > (method) retrieve > (params) default > (param) skill_id > (schema)>)
Optional\<String\> version
The version number to retrieve.
[](<#(resource) skills.versions > (method) retrieve > (params) default > (param) version > (schema)>)
[](<#(resource) skills.versions > (method) retrieve > (params) default>)
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
### Get a specific skill version.
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
import com.openai.models.skills.versions.SkillVersion;
import com.openai.models.skills.versions.VersionRetrieveParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
VersionRetrieveParams params = VersionRetrieveParams.builder()
.skillId("skill\_123")
.version("version")
.build();
SkillVersion skillVersion = client.skills().versions().retrieve(params);
}
}`
```
200 example
```
`{
"id": "id",
"created\_at": 0,
"description": "description",
"name": "name",
"object": "skill.version",
"skill\_id": "skill\_id",
"version": "version"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"created\_at": 0,
"description": "description",
"name": "name",
"object": "skill.version",
"skill\_id": "skill\_id",
"version": "version"
}`
```