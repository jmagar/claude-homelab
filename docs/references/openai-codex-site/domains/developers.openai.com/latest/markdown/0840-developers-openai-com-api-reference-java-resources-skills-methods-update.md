Update the default version pointer for a skill. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Skills](/api/reference/java/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Update the default version pointer for a skill.
[Skill](</api/reference/java/resources/skills#(resource) skills > (model) skill > (schema)>) skills().update(SkillUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/skills/{skill\_id}
Update the default version pointer for a skill.
##### ParametersExpand Collapse
SkillUpdateParams params
Optional\<String\> skillId
[](<#(resource) skills > (method) update > (params) default > (param) skill_id > (schema)>)
String defaultVersion
The skill version number to set as default.
[](<#(resource) skills > (method) update > (params) default > (param) body > (schema) > (property) default_version>)
[](<#(resource) skills > (method) update > (params) default>)
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
### Update the default version pointer for a skill.
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
import com.openai.models.skills.Skill;
import com.openai.models.skills.SkillUpdateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
SkillUpdateParams params = SkillUpdateParams.builder()
.skillId("skill\_123")
.defaultVersion("default\_version")
.build();
Skill skill = client.skills().update(params);
}
}`
```
200 example
```
`{
"id": "id",
"created\_at": 0,
"default\_version": "default\_version",
"description": "description",
"latest\_version": "latest\_version",
"name": "name",
"object": "skill"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"created\_at": 0,
"default\_version": "default\_version",
"description": "description",
"latest\_version": "latest\_version",
"name": "name",
"object": "skill"
}`
```