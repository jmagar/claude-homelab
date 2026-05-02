Skills | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Skills
##### [Create a new skill.](/api/reference/go/resources/skills/methods/create)
client.Skills.New(ctx, body) (\*[Skill](</api/reference/go/resources/skills#(resource) skills > (model) skill > (schema)>), error)
POST/skills
##### [List all skills for the current project.](/api/reference/go/resources/skills/methods/list)
client.Skills.List(ctx, query) (\*CursorPage[[Skill](</api/reference/go/resources/skills#(resource) skills > (model) skill > (schema)>)], error)
GET/skills
##### [Get a skill by its ID.](/api/reference/go/resources/skills/methods/retrieve)
client.Skills.Get(ctx, skillID) (\*[Skill](</api/reference/go/resources/skills#(resource) skills > (model) skill > (schema)>), error)
GET/skills/{skill\_id}
##### [Update the default version pointer for a skill.](/api/reference/go/resources/skills/methods/update)
client.Skills.Update(ctx, skillID, body) (\*[Skill](</api/reference/go/resources/skills#(resource) skills > (model) skill > (schema)>), error)
POST/skills/{skill\_id}
##### [Delete a skill by its ID.](/api/reference/go/resources/skills/methods/delete)
client.Skills.Delete(ctx, skillID) (\*[DeletedSkill](</api/reference/go/resources/skills#(resource) skills > (model) deleted_skill > (schema)>), error)
DELETE/skills/{skill\_id}
##### ModelsExpand Collapse
type DeletedSkill struct{…}
ID string
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) id>)
Deleted bool
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) deleted>)
Object SkillDeleted
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) object>)
[](<#(resource) skills > (model) deleted_skill > (schema)>)
type Skill struct{…}
ID string
Unique identifier for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (model) skill > (schema) > (property) created_at>)
DefaultVersion string
Default version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) default_version>)
Description string
Description of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) description>)
LatestVersion string
Latest version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) latest_version>)
Name string
Name of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) name>)
Object Skill
The object type, which is `skill`.
[](<#(resource) skills > (model) skill > (schema) > (property) object>)
[](<#(resource) skills > (model) skill > (schema)>)
type SkillList struct{…}
Data [][Skill](</api/reference/go/resources/skills#(resource) skills > (model) skill > (schema)>)
A list of items
ID string
Unique identifier for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (model) skill > (schema) > (property) created_at>)
DefaultVersion string
Default version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) default_version>)
Description string
Description of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) description>)
LatestVersion string
Latest version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) latest_version>)
Name string
Name of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) name>)
Object Skill
The object type, which is `skill`.
[](<#(resource) skills > (model) skill > (schema) > (property) object>)
[](<#(resource) skills > (model) skill_list > (schema) > (property) data>)
FirstID string
The ID of the first item in the list.
[](<#(resource) skills > (model) skill_list > (schema) > (property) first_id>)
HasMore bool
Whether there are more items available.
[](<#(resource) skills > (model) skill_list > (schema) > (property) has_more>)
LastID string
The ID of the last item in the list.
[](<#(resource) skills > (model) skill_list > (schema) > (property) last_id>)
Object List
The type of object returned, must be `list`.
[](<#(resource) skills > (model) skill_list > (schema) > (property) object>)
[](<#(resource) skills > (model) skill_list > (schema)>)
#### SkillsContent
##### [Download a skill zip bundle by its ID.](/api/reference/go/resources/skills/subresources/content/methods/retrieve)
client.Skills.Content.Get(ctx, skillID) (\*Response, error)
GET/skills/{skill\_id}/content
#### SkillsVersions
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
#### SkillsVersionsContent
##### [Download a skill version zip bundle.](/api/reference/go/resources/skills/subresources/versions/subresources/content/methods/retrieve)
client.Skills.Versions.Content.Get(ctx, skillID, version) (\*Response, error)
GET/skills/{skill\_id}/versions/{version}/content