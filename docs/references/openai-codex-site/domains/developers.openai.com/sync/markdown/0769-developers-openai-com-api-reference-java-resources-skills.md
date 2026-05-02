Skills | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Skills
##### [Create a new skill.](/api/reference/java/resources/skills/methods/create)
[Skill](</api/reference/java/resources/skills#(resource) skills > (model) skill > (schema)>) skills().create(SkillCreateParamsparams = SkillCreateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/skills
##### [List all skills for the current project.](/api/reference/java/resources/skills/methods/list)
SkillListPage skills().list(SkillListParamsparams = SkillListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/skills
##### [Get a skill by its ID.](/api/reference/java/resources/skills/methods/retrieve)
[Skill](</api/reference/java/resources/skills#(resource) skills > (model) skill > (schema)>) skills().retrieve(SkillRetrieveParamsparams = SkillRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/skills/{skill\_id}
##### [Update the default version pointer for a skill.](/api/reference/java/resources/skills/methods/update)
[Skill](</api/reference/java/resources/skills#(resource) skills > (model) skill > (schema)>) skills().update(SkillUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/skills/{skill\_id}
##### [Delete a skill by its ID.](/api/reference/java/resources/skills/methods/delete)
[DeletedSkill](</api/reference/java/resources/skills#(resource) skills > (model) deleted_skill > (schema)>) skills().delete(SkillDeleteParamsparams = SkillDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/skills/{skill\_id}
##### ModelsExpand Collapse
class DeletedSkill:
String id
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) id>)
boolean deleted
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) deleted>)
JsonValue; object\_ "skill.deleted"constant"skill.deleted"constant
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) object>)
[](<#(resource) skills > (model) deleted_skill > (schema)>)
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
class SkillList:
List\<[Skill](</api/reference/java/resources/skills#(resource) skills > (model) skill > (schema)>)\> data
A list of items
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
[](<#(resource) skills > (model) skill_list > (schema) > (property) data>)
Optional\<String\> firstId
The ID of the first item in the list.
[](<#(resource) skills > (model) skill_list > (schema) > (property) first_id>)
boolean hasMore
Whether there are more items available.
[](<#(resource) skills > (model) skill_list > (schema) > (property) has_more>)
Optional\<String\> lastId
The ID of the last item in the list.
[](<#(resource) skills > (model) skill_list > (schema) > (property) last_id>)
JsonValue; object\_ "list"constant"list"constant
The type of object returned, must be `list`.
[](<#(resource) skills > (model) skill_list > (schema) > (property) object>)
[](<#(resource) skills > (model) skill_list > (schema)>)
#### SkillsContent
##### [Download a skill zip bundle by its ID.](/api/reference/java/resources/skills/subresources/content/methods/retrieve)
HttpResponse skills().content().retrieve(ContentRetrieveParamsparams = ContentRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/skills/{skill\_id}/content
#### SkillsVersions
##### [Create a new immutable skill version.](/api/reference/java/resources/skills/subresources/versions/methods/create)
[SkillVersion](</api/reference/java/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) skills().versions().create(VersionCreateParamsparams = VersionCreateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/skills/{skill\_id}/versions
##### [List skill versions for a skill.](/api/reference/java/resources/skills/subresources/versions/methods/list)
VersionListPage skills().versions().list(VersionListParamsparams = VersionListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/skills/{skill\_id}/versions
##### [Get a specific skill version.](/api/reference/java/resources/skills/subresources/versions/methods/retrieve)
[SkillVersion](</api/reference/java/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) skills().versions().retrieve(VersionRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/skills/{skill\_id}/versions/{version}
##### [Delete a skill version.](/api/reference/java/resources/skills/subresources/versions/methods/delete)
[DeletedSkillVersion](</api/reference/java/resources/skills#(resource) skills.versions > (model) deleted_skill_version > (schema)>) skills().versions().delete(VersionDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/skills/{skill\_id}/versions/{version}
##### ModelsExpand Collapse
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
class SkillVersionList:
List\<[SkillVersion](</api/reference/java/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>)\> data
A list of items
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
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) data>)
Optional\<String\> firstId
The ID of the first item in the list.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) first_id>)
boolean hasMore
Whether there are more items available.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) has_more>)
Optional\<String\> lastId
The ID of the last item in the list.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) last_id>)
JsonValue; object\_ "list"constant"list"constant
The type of object returned, must be `list`.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) object>)
[](<#(resource) skills.versions > (model) skill_version_list > (schema)>)
#### SkillsVersionsContent
##### [Download a skill version zip bundle.](/api/reference/java/resources/skills/subresources/versions/subresources/content/methods/retrieve)
HttpResponse skills().versions().content().retrieve(ContentRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/skills/{skill\_id}/versions/{version}/content