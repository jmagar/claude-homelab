Versions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Skills](/api/reference/java/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Versions
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
#### VersionsContent
##### [Download a skill version zip bundle.](/api/reference/java/resources/skills/subresources/versions/subresources/content/methods/retrieve)
HttpResponse skills().versions().content().retrieve(ContentRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/skills/{skill\_id}/versions/{version}/content