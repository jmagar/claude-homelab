Versions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Skills](/api/reference/typescript/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Versions
##### [Create a new immutable skill version.](/api/reference/typescript/resources/skills/subresources/versions/methods/create)
client.skills.versions.create(stringskillID, VersionCreateParams { \_default, files } body?, RequestOptionsoptions?): [SkillVersion](</api/reference/typescript/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) { id, created\_at, description, 4 more }
POST/skills/{skill\_id}/versions
##### [List skill versions for a skill.](/api/reference/typescript/resources/skills/subresources/versions/methods/list)
client.skills.versions.list(stringskillID, VersionListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[SkillVersion](</api/reference/typescript/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) { id, created\_at, description, 4 more } \>
GET/skills/{skill\_id}/versions
##### [Get a specific skill version.](/api/reference/typescript/resources/skills/subresources/versions/methods/retrieve)
client.skills.versions.retrieve(stringversion, VersionRetrieveParams { skill\_id } params, RequestOptionsoptions?): [SkillVersion](</api/reference/typescript/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) { id, created\_at, description, 4 more }
GET/skills/{skill\_id}/versions/{version}
##### [Delete a skill version.](/api/reference/typescript/resources/skills/subresources/versions/methods/delete)
client.skills.versions.delete(stringversion, VersionDeleteParams { skill\_id } params, RequestOptionsoptions?): [DeletedSkillVersion](</api/reference/typescript/resources/skills#(resource) skills.versions > (model) deleted_skill_version > (schema)>) { id, deleted, object, version }
DELETE/skills/{skill\_id}/versions/{version}
##### ModelsExpand Collapse
DeletedSkillVersion { id, deleted, object, version }
id: string
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) id>)
deleted: boolean
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) deleted>)
object: "skill.version.deleted"
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) object>)
version: string
The deleted skill version.
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema)>)
SkillVersion { id, created\_at, description, 4 more }
id: string
Unique identifier for the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) id>)
created\_at: number
Unix timestamp (seconds) for when the version was created.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) created_at>)
description: string
Description of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) description>)
name: string
Name of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) name>)
object: "skill.version"
The object type, which is `skill.version`.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) object>)
skill\_id: string
Identifier of the skill for this version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) skill_id>)
version: string
Version number for this skill.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) skill_version > (schema)>)
SkillVersionList { data, first\_id, has\_more, 2 more }
data: Array\<[SkillVersion](</api/reference/typescript/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) { id, created\_at, description, 4 more } \>
A list of items
id: string
Unique identifier for the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) id>)
created\_at: number
Unix timestamp (seconds) for when the version was created.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) created_at>)
description: string
Description of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) description>)
name: string
Name of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) name>)
object: "skill.version"
The object type, which is `skill.version`.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) object>)
skill\_id: string
Identifier of the skill for this version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) skill_id>)
version: string
Version number for this skill.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) data>)
first\_id: string | null
The ID of the first item in the list.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) first_id>)
has\_more: boolean
Whether there are more items available.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) has_more>)
last\_id: string | null
The ID of the last item in the list.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) last_id>)
object: "list"
The type of object returned, must be `list`.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) object>)
[](<#(resource) skills.versions > (model) skill_version_list > (schema)>)
#### VersionsContent
##### [Download a skill version zip bundle.](/api/reference/typescript/resources/skills/subresources/versions/subresources/content/methods/retrieve)
client.skills.versions.content.retrieve(stringversion, ContentRetrieveParams { skill\_id } params, RequestOptionsoptions?): Response
GET/skills/{skill\_id}/versions/{version}/content