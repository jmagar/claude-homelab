Skills | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Skills
##### [Create a new skill.](/api/reference/ruby/resources/skills/methods/create)
skills.create(\*\*kwargs) -\> [Skill](</api/reference/ruby/resources/skills#(resource) skills > (model) skill > (schema)>) { id, created\_at, default\_version, 4 more }
POST/skills
##### [List all skills for the current project.](/api/reference/ruby/resources/skills/methods/list)
skills.list(\*\*kwargs) -\> CursorPage\<[Skill](</api/reference/ruby/resources/skills#(resource) skills > (model) skill > (schema)>) { id, created\_at, default\_version, 4 more } \>
GET/skills
##### [Get a skill by its ID.](/api/reference/ruby/resources/skills/methods/retrieve)
skills.retrieve(skill\_id) -\> [Skill](</api/reference/ruby/resources/skills#(resource) skills > (model) skill > (schema)>) { id, created\_at, default\_version, 4 more }
GET/skills/{skill\_id}
##### [Update the default version pointer for a skill.](/api/reference/ruby/resources/skills/methods/update)
skills.update(skill\_id, \*\*kwargs) -\> [Skill](</api/reference/ruby/resources/skills#(resource) skills > (model) skill > (schema)>) { id, created\_at, default\_version, 4 more }
POST/skills/{skill\_id}
##### [Delete a skill by its ID.](/api/reference/ruby/resources/skills/methods/delete)
skills.delete(skill\_id) -\> [DeletedSkill](</api/reference/ruby/resources/skills#(resource) skills > (model) deleted_skill > (schema)>) { id, deleted, object }
DELETE/skills/{skill\_id}
##### ModelsExpand Collapse
class DeletedSkill { id, deleted, object }
id: String
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) id>)
deleted: bool
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) deleted>)
object: :"skill.deleted"
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) object>)
[](<#(resource) skills > (model) deleted_skill > (schema)>)
class Skill { id, created\_at, default\_version, 4 more }
id: String
Unique identifier for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (model) skill > (schema) > (property) created_at>)
default\_version: String
Default version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) default_version>)
description: String
Description of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) description>)
latest\_version: String
Latest version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) latest_version>)
name: String
Name of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) name>)
object: :skill
The object type, which is `skill`.
[](<#(resource) skills > (model) skill > (schema) > (property) object>)
[](<#(resource) skills > (model) skill > (schema)>)
class SkillList { data, first\_id, has\_more, 2 more }
data: Array[[Skill](</api/reference/ruby/resources/skills#(resource) skills > (model) skill > (schema)>) { id, created\_at, default\_version, 4 more } ]
A list of items
id: String
Unique identifier for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (model) skill > (schema) > (property) created_at>)
default\_version: String
Default version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) default_version>)
description: String
Description of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) description>)
latest\_version: String
Latest version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) latest_version>)
name: String
Name of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) name>)
object: :skill
The object type, which is `skill`.
[](<#(resource) skills > (model) skill > (schema) > (property) object>)
[](<#(resource) skills > (model) skill_list > (schema) > (property) data>)
first\_id: String
The ID of the first item in the list.
[](<#(resource) skills > (model) skill_list > (schema) > (property) first_id>)
has\_more: bool
Whether there are more items available.
[](<#(resource) skills > (model) skill_list > (schema) > (property) has_more>)
last\_id: String
The ID of the last item in the list.
[](<#(resource) skills > (model) skill_list > (schema) > (property) last_id>)
object: :list
The type of object returned, must be `list`.
[](<#(resource) skills > (model) skill_list > (schema) > (property) object>)
[](<#(resource) skills > (model) skill_list > (schema)>)
#### SkillsContent
##### [Download a skill zip bundle by its ID.](/api/reference/ruby/resources/skills/subresources/content/methods/retrieve)
skills.content.retrieve(skill\_id) -\> StringIO
GET/skills/{skill\_id}/content
#### SkillsVersions
##### [Create a new immutable skill version.](/api/reference/ruby/resources/skills/subresources/versions/methods/create)
skills.versions.create(skill\_id, \*\*kwargs) -\> [SkillVersion](</api/reference/ruby/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) { id, created\_at, description, 4 more }
POST/skills/{skill\_id}/versions
##### [List skill versions for a skill.](/api/reference/ruby/resources/skills/subresources/versions/methods/list)
skills.versions.list(skill\_id, \*\*kwargs) -\> CursorPage\<[SkillVersion](</api/reference/ruby/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) { id, created\_at, description, 4 more } \>
GET/skills/{skill\_id}/versions
##### [Get a specific skill version.](/api/reference/ruby/resources/skills/subresources/versions/methods/retrieve)
skills.versions.retrieve(version, \*\*kwargs) -\> [SkillVersion](</api/reference/ruby/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) { id, created\_at, description, 4 more }
GET/skills/{skill\_id}/versions/{version}
##### [Delete a skill version.](/api/reference/ruby/resources/skills/subresources/versions/methods/delete)
skills.versions.delete(version, \*\*kwargs) -\> [DeletedSkillVersion](</api/reference/ruby/resources/skills#(resource) skills.versions > (model) deleted_skill_version > (schema)>) { id, deleted, object, version }
DELETE/skills/{skill\_id}/versions/{version}
##### ModelsExpand Collapse
class DeletedSkillVersion { id, deleted, object, version }
id: String
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) id>)
deleted: bool
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) deleted>)
object: :"skill.version.deleted"
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) object>)
version: String
The deleted skill version.
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema)>)
class SkillVersion { id, created\_at, description, 4 more }
id: String
Unique identifier for the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (seconds) for when the version was created.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) created_at>)
description: String
Description of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) description>)
name: String
Name of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) name>)
object: :"skill.version"
The object type, which is `skill.version`.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) object>)
skill\_id: String
Identifier of the skill for this version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) skill_id>)
version: String
Version number for this skill.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) skill_version > (schema)>)
class SkillVersionList { data, first\_id, has\_more, 2 more }
data: Array[[SkillVersion](</api/reference/ruby/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) { id, created\_at, description, 4 more } ]
A list of items
id: String
Unique identifier for the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (seconds) for when the version was created.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) created_at>)
description: String
Description of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) description>)
name: String
Name of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) name>)
object: :"skill.version"
The object type, which is `skill.version`.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) object>)
skill\_id: String
Identifier of the skill for this version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) skill_id>)
version: String
Version number for this skill.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) data>)
first\_id: String
The ID of the first item in the list.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) first_id>)
has\_more: bool
Whether there are more items available.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) has_more>)
last\_id: String
The ID of the last item in the list.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) last_id>)
object: :list
The type of object returned, must be `list`.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) object>)
[](<#(resource) skills.versions > (model) skill_version_list > (schema)>)
#### SkillsVersionsContent
##### [Download a skill version zip bundle.](/api/reference/ruby/resources/skills/subresources/versions/subresources/content/methods/retrieve)
skills.versions.content.retrieve(version, \*\*kwargs) -\> StringIO
GET/skills/{skill\_id}/versions/{version}/content