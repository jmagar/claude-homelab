Delete a skill version. | OpenAI API Reference
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
# Delete a skill version.
[DeletedSkillVersion](</api/reference/java/resources/skills#(resource) skills.versions > (model) deleted_skill_version > (schema)>) skills().versions().delete(VersionDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/skills/{skill\_id}/versions/{version}
Delete a skill version.
##### ParametersExpand Collapse
VersionDeleteParams params
String skillId
[](<#(resource) skills.versions > (method) delete > (params) default > (param) skill_id > (schema)>)
Optional\<String\> version
The skill version number.
[](<#(resource) skills.versions > (method) delete > (params) default > (param) version > (schema)>)
[](<#(resource) skills.versions > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class DeletedSkillVersion:
String id
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) id>)
boolean deleted
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) deleted>)
JsonValue; object\_ "skill.version.deleted"constant"skill.version.deleted"constant
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) object>)
String version
The deleted skill version.
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema)>)
### Delete a skill version.
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
import com.openai.models.skills.versions.DeletedSkillVersion;
import com.openai.models.skills.versions.VersionDeleteParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
VersionDeleteParams params = VersionDeleteParams.builder()
.skillId("skill\_123")
.version("version")
.build();
DeletedSkillVersion deletedSkillVersion = client.skills().versions().delete(params);
}
}`
```
200 example
```
`{
"id": "id",
"deleted": true,
"object": "skill.version.deleted",
"version": "version"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"deleted": true,
"object": "skill.version.deleted",
"version": "version"
}`
```