Delete a skill by its ID. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Skills](/api/reference/java/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a skill by its ID.
[DeletedSkill](</api/reference/java/resources/skills#(resource) skills > (model) deleted_skill > (schema)>) skills().delete(SkillDeleteParamsparams = SkillDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/skills/{skill\_id}
Delete a skill by its ID.
##### ParametersExpand Collapse
SkillDeleteParams params
Optional\<String\> skillId
[](<#(resource) skills > (method) delete > (params) default > (param) skill_id > (schema)>)
[](<#(resource) skills > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class DeletedSkill:
String id
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) id>)
boolean deleted
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) deleted>)
JsonValue; object\_ "skill.deleted"constant"skill.deleted"constant
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) object>)
[](<#(resource) skills > (model) deleted_skill > (schema)>)
### Delete a skill by its ID.
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
import com.openai.models.skills.DeletedSkill;
import com.openai.models.skills.SkillDeleteParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
DeletedSkill deletedSkill = client.skills().delete("skill\_123");
}
}`
```
200 example
```
`{
"id": "id",
"deleted": true,
"object": "skill.deleted"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"deleted": true,
"object": "skill.deleted"
}`
```