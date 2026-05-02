Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List organization roles](/api/reference/go/resources/admin/subresources/organization/subresources/roles/methods/list)
client.Admin.Organization.Roles.List(ctx, query) (\*CursorPage[[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)], error)
GET/organization/roles
##### [Create organization role](/api/reference/go/resources/admin/subresources/organization/subresources/roles/methods/create)
client.Admin.Organization.Roles.New(ctx, body) (\*[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>), error)
POST/organization/roles
##### [Update organization role](/api/reference/go/resources/admin/subresources/organization/subresources/roles/methods/update)
client.Admin.Organization.Roles.Update(ctx, roleID, body) (\*[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>), error)
POST/organization/roles/{role\_id}
##### [Delete organization role](/api/reference/go/resources/admin/subresources/organization/subresources/roles/methods/delete)
client.Admin.Organization.Roles.Delete(ctx, roleID) (\*[AdminOrganizationRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) AdminOrganizationRoleDeleteResponse > (schema)>), error)
DELETE/organization/roles/{role\_id}
##### ModelsExpand Collapse
type Role struct{…}
Details about a role that can be assigned through the public Roles API.
ID string
Identifier for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) id>)
Description string
Optional description of the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) description>)
Name string
Unique name for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) name>)
Object Role
Always `role`.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) object>)
Permissions []string
Permissions granted by the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
PredefinedRole bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
ResourceType string
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.roles > (model) role > (schema)>)