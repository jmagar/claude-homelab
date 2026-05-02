Get a skill by its ID. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Skills](/api/reference/java/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Get a skill by its ID.
[Skill](</api/reference/java/resources/skills#(resource) skills > (model) skill > (schema)>) skills().retrieve(SkillRetrieveParamsparams = SkillRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/skills/{skill\_id}
Get a skill by its ID.
##### ParametersExpand Collapse
SkillRetrieveParams params
Optional\<String\> skillId
[](<#(resource) skills > (method) retrieve > (params) default > (param) skill_id > (schema)>)
[](<#(resource) skills > (method) retrieve > (params) default>)
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
### Get a skill by its ID.
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
import com.openai.models.skills.SkillRetrieveParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
Skill skill = client.skills().retrieve("skill\_123");
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