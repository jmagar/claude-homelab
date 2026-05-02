Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Groups](/api/reference/python/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List group organization role assignments](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/list)
admin.organization.groups.roles.list(strgroup\_id, RoleListParams\*\*kwargs) -\> SyncCursorPage[[RoleListResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups.roles > (model) role_list_response > (schema)>)]
GET/organization/groups/{group\_id}/roles
##### [Assign organization role to group](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/create)
admin.organization.groups.roles.create(strgroup\_id, RoleCreateParams\*\*kwargs) -\> [RoleCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups.roles > (model) role_create_response > (schema)>)
POST/organization/groups/{group\_id}/roles
##### [Unassign organization role from group](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/delete)
admin.organization.groups.roles.delete(strrole\_id, RoleDeleteParams\*\*kwargs) -\> [RoleDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema)>)
DELETE/organization/groups/{group\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleListResponse: …
Detailed information about a role assignment entry returned when listing assignments.
id: str
Identifier for the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: Optional[int]
When the role was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: Optional[str]
Identifier of the actor who created the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Optional[Dict[str, object]]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: Optional[str]
Description of the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Optional[Dict[str, object]]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) metadata>)
name: str
Name of the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) name>)
permissions: List[str]
Permissions associated with the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: str
Resource type the role applies to.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: Optional[int]
When the role was last updated.
formatint64
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema)>)
class RoleCreateResponse: …
Role assignment linking a group to a role.
group: Group
Summary information about a group returned in role assignment responses.
id: str
Identifier for the group.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) created_at>)
name: str
Display name of the group.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) name>)
object: Literal["group"]
Always `group`.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) object>)
scim\_managed: bool
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group>)
object: Literal["group.role"]
Always `group.role`.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema)>)
class RoleDeleteResponse: …
Confirmation payload returned after unassigning a role.
deleted: bool
Whether the assignment was removed.
[](<#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: str
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema)>)