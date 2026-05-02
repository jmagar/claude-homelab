Skills | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Skills
##### [Create a new skill.](/api/reference/resources/skills/methods/create)
POST/skills
##### [List all skills for the current project.](/api/reference/resources/skills/methods/list)
GET/skills
##### [Get a skill by its ID.](/api/reference/resources/skills/methods/retrieve)
GET/skills/{skill\_id}
##### [Update the default version pointer for a skill.](/api/reference/resources/skills/methods/update)
POST/skills/{skill\_id}
##### [Delete a skill by its ID.](/api/reference/resources/skills/methods/delete)
DELETE/skills/{skill\_id}
##### ModelsExpand Collapse
DeletedSkill object { id, deleted, object }
id: string
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) id>)
deleted: boolean
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) deleted>)
object: "skill.deleted"
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) object>)
[](<#(resource) skills > (model) deleted_skill > (schema)>)
Skill object { id, created\_at, default\_version, 4 more }
id: string
Unique identifier for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) id>)
created\_at: number
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (model) skill > (schema) > (property) created_at>)
default\_version: string
Default version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) default_version>)
description: string
Description of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) description>)
latest\_version: string
Latest version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) latest_version>)
name: string
Name of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) name>)
object: "skill"
The object type, which is `skill`.
[](<#(resource) skills > (model) skill > (schema) > (property) object>)
[](<#(resource) skills > (model) skill > (schema)>)
SkillList object { data, first\_id, has\_more, 2 more }
data: array of [Skill](</api/reference/resources/skills#(resource) skills > (model) skill > (schema)>) { id, created\_at, default\_version, 4 more }
A list of items
id: string
Unique identifier for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) id>)
created\_at: number
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (model) skill > (schema) > (property) created_at>)
default\_version: string
Default version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) default_version>)
description: string
Description of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) description>)
latest\_version: string
Latest version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) latest_version>)
name: string
Name of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) name>)
object: "skill"
The object type, which is `skill`.
[](<#(resource) skills > (model) skill > (schema) > (property) object>)
[](<#(resource) skills > (model) skill_list > (schema) > (property) data>)
first\_id: string
The ID of the first item in the list.
[](<#(resource) skills > (model) skill_list > (schema) > (property) first_id>)
has\_more: boolean
Whether there are more items available.
[](<#(resource) skills > (model) skill_list > (schema) > (property) has_more>)
last\_id: string
The ID of the last item in the list.
[](<#(resource) skills > (model) skill_list > (schema) > (property) last_id>)
object: "list"
The type of object returned, must be `list`.
[](<#(resource) skills > (model) skill_list > (schema) > (property) object>)
[](<#(resource) skills > (model) skill_list > (schema)>)
#### SkillsContent
##### [Download a skill zip bundle by its ID.](/api/reference/resources/skills/subresources/content/methods/retrieve)
GET/skills/{skill\_id}/content
#### SkillsVersions
##### [Create a new immutable skill version.](/api/reference/resources/skills/subresources/versions/methods/create)
POST/skills/{skill\_id}/versions
##### [List skill versions for a skill.](/api/reference/resources/skills/subresources/versions/methods/list)
GET/skills/{skill\_id}/versions
##### [Get a specific skill version.](/api/reference/resources/skills/subresources/versions/methods/retrieve)
GET/skills/{skill\_id}/versions/{version}
##### [Delete a skill version.](/api/reference/resources/skills/subresources/versions/methods/delete)
DELETE/skills/{skill\_id}/versions/{version}
##### ModelsExpand Collapse
DeletedSkillVersion object { id, deleted, object, version }
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
SkillVersion object { id, created\_at, description, 4 more }
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
SkillVersionList object { data, first\_id, has\_more, 2 more }
data: array of [SkillVersion](</api/reference/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) { id, created\_at, description, 4 more }
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
first\_id: string
The ID of the first item in the list.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) first_id>)
has\_more: boolean
Whether there are more items available.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) has_more>)
last\_id: string
The ID of the last item in the list.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) last_id>)
object: "list"
The type of object returned, must be `list`.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) object>)
[](<#(resource) skills.versions > (model) skill_version_list > (schema)>)
#### SkillsVersionsContent
##### [Download a skill version zip bundle.](/api/reference/resources/skills/subresources/versions/subresources/content/methods/retrieve)
GET/skills/{skill\_id}/versions/{version}/content