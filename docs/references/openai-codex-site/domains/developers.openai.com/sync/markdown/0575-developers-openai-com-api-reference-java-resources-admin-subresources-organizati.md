Groups | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Groups
##### [List groups](/api/reference/java/resources/admin/subresources/organization/subresources/groups/methods/list)
GroupListPage admin().organization().groups().list(GroupListParamsparams = GroupListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/groups
##### [Create group](/api/reference/java/resources/admin/subresources/organization/subresources/groups/methods/create)
[Group](</api/reference/java/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>) admin().organization().groups().create(GroupCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/groups
##### [Update group](/api/reference/java/resources/admin/subresources/organization/subresources/groups/methods/update)
[GroupUpdateResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups > (model) GroupUpdateResponse > (schema)>) admin().organization().groups().update(GroupUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/groups/{group\_id}
##### [Delete group](/api/reference/java/resources/admin/subresources/organization/subresources/groups/methods/delete)
[GroupDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups > (model) GroupDeleteResponse > (schema)>) admin().organization().groups().delete(GroupDeleteParamsparams = GroupDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/groups/{group\_id}
##### ModelsExpand Collapse
class Group:
Details about an organization group.
String id
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) id>)
long createdAt
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) created_at>)
boolean isScimManaged
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) is_scim_managed>)
String name
Display name of the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group > (schema)>)
#### GroupsUsers
##### [List group users](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/list)
UserListPage admin().organization().groups().users().list(UserListParamsparams = UserListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/groups/{group\_id}/users
##### [Add group user](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/create)
[UserCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups.users > (model) UserCreateResponse > (schema)>) admin().organization().groups().users().create(UserCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/groups/{group\_id}/users
##### [Remove group user](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/delete)
[UserDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups.users > (model) UserDeleteResponse > (schema)>) admin().organization().groups().users().delete(UserDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/groups/{group\_id}/users/{user\_id}
#### GroupsRoles
##### [List group organization role assignments](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/list)
RoleListPage admin().organization().groups().roles().list(RoleListParamsparams = RoleListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/groups/{group\_id}/roles
##### [Assign organization role to group](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/create)
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema)>) admin().organization().groups().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/groups/{group\_id}/roles
##### [Unassign organization role from group](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().groups().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/groups/{group\_id}/roles/{role\_id}