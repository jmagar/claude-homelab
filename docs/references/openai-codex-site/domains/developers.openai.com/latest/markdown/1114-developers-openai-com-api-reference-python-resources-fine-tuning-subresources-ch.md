Permissions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Fine Tuning](/api/reference/python/resources/fine_tuning)
[Checkpoints](/api/reference/python/resources/fine_tuning/subresources/checkpoints)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Permissions
Manage fine-tuning jobs to tailor a model to your specific training data.
##### [List checkpoint permissions](/api/reference/python/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/retrieve)
Deprecated
fine\_tuning.checkpoints.permissions.retrieve(strfine\_tuned\_model\_checkpoint, PermissionRetrieveParams\*\*kwargs) -\> [PermissionRetrieveResponse](</api/reference/python/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema)>)
GET/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
##### [List checkpoint permissions](/api/reference/python/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/list)
fine\_tuning.checkpoints.permissions.list(strfine\_tuned\_model\_checkpoint, PermissionListParams\*\*kwargs) -\> SyncConversationCursorPage[[PermissionListResponse](</api/reference/python/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema)>)]
GET/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
##### [Create checkpoint permissions](/api/reference/python/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/create)
fine\_tuning.checkpoints.permissions.create(strfine\_tuned\_model\_checkpoint, PermissionCreateParams\*\*kwargs) -\> SyncPage[[PermissionCreateResponse](</api/reference/python/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema)>)]
POST/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
##### [Delete checkpoint permission](/api/reference/python/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/delete)
fine\_tuning.checkpoints.permissions.delete(strpermission\_id, PermissionDeleteParams\*\*kwargs) -\> [PermissionDeleteResponse](</api/reference/python/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema)>)
DELETE/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions/{permission\_id}
##### ModelsExpand Collapse
class PermissionRetrieveResponse: …
data: List[Data]
id: str
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) data > (items) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the permission was created.
formatunixtime
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) data > (items) > (property) created_at>)
object: Literal["checkpoint.permission"]
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) data > (items) > (property) object>)
project\_id: str
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) data > (items) > (property) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) has_more>)
object: Literal["list"]
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) object>)
first\_id: Optional[str]
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) first_id>)
last\_id: Optional[str]
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) last_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema)>)
class PermissionListResponse: …
The `checkpoint.permission` object represents a permission for a fine-tuned model checkpoint.
id: str
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the permission was created.
formatunixtime
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) created_at>)
object: Literal["checkpoint.permission"]
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) object>)
project\_id: str
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema)>)
class PermissionCreateResponse: …
The `checkpoint.permission` object represents a permission for a fine-tuned model checkpoint.
id: str
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the permission was created.
formatunixtime
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema) > (property) created_at>)
object: Literal["checkpoint.permission"]
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema) > (property) object>)
project\_id: str
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema) > (property) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema)>)
class PermissionDeleteResponse: …
id: str
The ID of the fine-tuned model checkpoint permission that was deleted.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema) > (property) id>)
deleted: bool
Whether the fine-tuned model checkpoint permission was successfully deleted.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema) > (property) deleted>)
object: Literal["checkpoint.permission"]
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema) > (property) object>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema)>)