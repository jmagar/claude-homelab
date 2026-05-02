Versions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Skills](/api/reference/go/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Versions
##### [Create a new immutable skill version.](/api/reference/go/resources/skills/subresources/versions/methods/create)
client.Skills.Versions.New(ctx, skillID, body) (\*[SkillVersion](</api/reference/go/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>), error)
POST/skills/{skill\_id}/versions
##### [List skill versions for a skill.](/api/reference/go/resources/skills/subresources/versions/methods/list)
client.Skills.Versions.List(ctx, skillID, query) (\*CursorPage[[SkillVersion](</api/reference/go/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>)], error)
GET/skills/{skill\_id}/versions
##### [Get a specific skill version.](/api/reference/go/resources/skills/subresources/versions/methods/retrieve)
client.Skills.Versions.Get(ctx, skillID, version) (\*[SkillVersion](</api/reference/go/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>), error)
GET/skills/{skill\_id}/versions/{version}
##### [Delete a skill version.](/api/reference/go/resources/skills/subresources/versions/methods/delete)
client.Skills.Versions.Delete(ctx, skillID, version) (\*[DeletedSkillVersion](</api/reference/go/resources/skills#(resource) skills.versions > (model) deleted_skill_version > (schema)>), error)
DELETE/skills/{skill\_id}/versions/{version}
##### ModelsExpand Collapse
type DeletedSkillVersion struct{…}
ID string
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) id>)
Deleted bool
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) deleted>)
Object SkillVersionDeleted
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) object>)
Version string
The deleted skill version.
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema)>)
type SkillVersion struct{…}
ID string
Unique identifier for the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (seconds) for when the version was created.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) created_at>)
Description string
Description of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) description>)
Name string
Name of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) name>)
Object SkillVersion
The object type, which is `skill.version`.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) object>)
SkillID string
Identifier of the skill for this version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) skill_id>)
Version string
Version number for this skill.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) skill_version > (schema)>)
type SkillVersionList struct{…}
Data [][SkillVersion](</api/reference/go/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>)
A list of items
ID string
Unique identifier for the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (seconds) for when the version was created.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) created_at>)
Description string
Description of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) description>)
Name string
Name of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) name>)
Object SkillVersion
The object type, which is `skill.version`.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) object>)
SkillID string
Identifier of the skill for this version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) skill_id>)
Version string
Version number for this skill.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) data>)
FirstID string
The ID of the first item in the list.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) first_id>)
HasMore bool
Whether there are more items available.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) has_more>)
LastID string
The ID of the last item in the list.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) last_id>)
Object List
The type of object returned, must be `list`.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) object>)
[](<#(resource) skills.versions > (model) skill_version_list > (schema)>)
#### VersionsContent
##### [Download a skill version zip bundle.](/api/reference/go/resources/skills/subresources/versions/subresources/content/methods/retrieve)
client.Skills.Versions.Content.Get(ctx, skillID, version) (\*Response, error)
GET/skills/{skill\_id}/versions/{version}/content