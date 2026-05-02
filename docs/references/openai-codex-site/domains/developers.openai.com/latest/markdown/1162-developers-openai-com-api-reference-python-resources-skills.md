Skills | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Skills
##### [Create a new skill.](/api/reference/python/resources/skills/methods/create)
skills.create(SkillCreateParams\*\*kwargs) -\> [Skill](</api/reference/python/resources/skills#(resource) skills > (model) skill > (schema)>)
POST/skills
##### [List all skills for the current project.](/api/reference/python/resources/skills/methods/list)
skills.list(SkillListParams\*\*kwargs) -\> SyncCursorPage[[Skill](</api/reference/python/resources/skills#(resource) skills > (model) skill > (schema)>)]
GET/skills
##### [Get a skill by its ID.](/api/reference/python/resources/skills/methods/retrieve)
skills.retrieve(strskill\_id) -\> [Skill](</api/reference/python/resources/skills#(resource) skills > (model) skill > (schema)>)
GET/skills/{skill\_id}
##### [Update the default version pointer for a skill.](/api/reference/python/resources/skills/methods/update)
skills.update(strskill\_id, SkillUpdateParams\*\*kwargs) -\> [Skill](</api/reference/python/resources/skills#(resource) skills > (model) skill > (schema)>)
POST/skills/{skill\_id}
##### [Delete a skill by its ID.](/api/reference/python/resources/skills/methods/delete)
skills.delete(strskill\_id) -\> [DeletedSkill](</api/reference/python/resources/skills#(resource) skills > (model) deleted_skill > (schema)>)
DELETE/skills/{skill\_id}
##### ModelsExpand Collapse
class DeletedSkill: …
id: str
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) id>)
deleted: bool
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) deleted>)
object: Literal["skill.deleted"]
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) object>)
[](<#(resource) skills > (model) deleted_skill > (schema)>)
class Skill: …
id: str
Unique identifier for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) id>)
created\_at: int
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (model) skill > (schema) > (property) created_at>)
default\_version: str
Default version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) default_version>)
description: str
Description of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) description>)
latest\_version: str
Latest version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) latest_version>)
name: str
Name of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) name>)
object: Literal["skill"]
The object type, which is `skill`.
[](<#(resource) skills > (model) skill > (schema) > (property) object>)
[](<#(resource) skills > (model) skill > (schema)>)
class SkillList: …
data: List[[Skill](</api/reference/python/resources/skills#(resource) skills > (model) skill > (schema)>)]
A list of items
id: str
Unique identifier for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) id>)
created\_at: int
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (model) skill > (schema) > (property) created_at>)
default\_version: str
Default version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) default_version>)
description: str
Description of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) description>)
latest\_version: str
Latest version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) latest_version>)
name: str
Name of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) name>)
object: Literal["skill"]
The object type, which is `skill`.
[](<#(resource) skills > (model) skill > (schema) > (property) object>)
[](<#(resource) skills > (model) skill_list > (schema) > (property) data>)
first\_id: Optional[str]
The ID of the first item in the list.
[](<#(resource) skills > (model) skill_list > (schema) > (property) first_id>)
has\_more: bool
Whether there are more items available.
[](<#(resource) skills > (model) skill_list > (schema) > (property) has_more>)
last\_id: Optional[str]
The ID of the last item in the list.
[](<#(resource) skills > (model) skill_list > (schema) > (property) last_id>)
object: Literal["list"]
The type of object returned, must be `list`.
[](<#(resource) skills > (model) skill_list > (schema) > (property) object>)
[](<#(resource) skills > (model) skill_list > (schema)>)
#### SkillsContent
##### [Download a skill zip bundle by its ID.](/api/reference/python/resources/skills/subresources/content/methods/retrieve)
skills.content.retrieve(strskill\_id) -\> BinaryResponseContent
GET/skills/{skill\_id}/content
#### SkillsVersions
##### [Create a new immutable skill version.](/api/reference/python/resources/skills/subresources/versions/methods/create)
skills.versions.create(strskill\_id, VersionCreateParams\*\*kwargs) -\> [SkillVersion](</api/reference/python/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>)
POST/skills/{skill\_id}/versions
##### [List skill versions for a skill.](/api/reference/python/resources/skills/subresources/versions/methods/list)
skills.versions.list(strskill\_id, VersionListParams\*\*kwargs) -\> SyncCursorPage[[SkillVersion](</api/reference/python/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>)]
GET/skills/{skill\_id}/versions
##### [Get a specific skill version.](/api/reference/python/resources/skills/subresources/versions/methods/retrieve)
skills.versions.retrieve(strversion, VersionRetrieveParams\*\*kwargs) -\> [SkillVersion](</api/reference/python/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>)
GET/skills/{skill\_id}/versions/{version}
##### [Delete a skill version.](/api/reference/python/resources/skills/subresources/versions/methods/delete)
skills.versions.delete(strversion, VersionDeleteParams\*\*kwargs) -\> [DeletedSkillVersion](</api/reference/python/resources/skills#(resource) skills.versions > (model) deleted_skill_version > (schema)>)
DELETE/skills/{skill\_id}/versions/{version}
##### ModelsExpand Collapse
class DeletedSkillVersion: …
id: str
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) id>)
deleted: bool
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) deleted>)
object: Literal["skill.version.deleted"]
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) object>)
version: str
The deleted skill version.
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema)>)
class SkillVersion: …
id: str
Unique identifier for the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) id>)
created\_at: int
Unix timestamp (seconds) for when the version was created.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) created_at>)
description: str
Description of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) description>)
name: str
Name of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) name>)
object: Literal["skill.version"]
The object type, which is `skill.version`.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) object>)
skill\_id: str
Identifier of the skill for this version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) skill_id>)
version: str
Version number for this skill.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) skill_version > (schema)>)
class SkillVersionList: …
data: List[[SkillVersion](</api/reference/python/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>)]
A list of items
id: str
Unique identifier for the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) id>)
created\_at: int
Unix timestamp (seconds) for when the version was created.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) created_at>)
description: str
Description of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) description>)
name: str
Name of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) name>)
object: Literal["skill.version"]
The object type, which is `skill.version`.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) object>)
skill\_id: str
Identifier of the skill for this version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) skill_id>)
version: str
Version number for this skill.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) data>)
first\_id: Optional[str]
The ID of the first item in the list.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) first_id>)
has\_more: bool
Whether there are more items available.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) has_more>)
last\_id: Optional[str]
The ID of the last item in the list.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) last_id>)
object: Literal["list"]
The type of object returned, must be `list`.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) object>)
[](<#(resource) skills.versions > (model) skill_version_list > (schema)>)
#### SkillsVersionsContent
##### [Download a skill version zip bundle.](/api/reference/python/resources/skills/subresources/versions/subresources/content/methods/retrieve)
skills.versions.content.retrieve(strversion, ContentRetrieveParams\*\*kwargs) -\> BinaryResponseContent
GET/skills/{skill\_id}/versions/{version}/content