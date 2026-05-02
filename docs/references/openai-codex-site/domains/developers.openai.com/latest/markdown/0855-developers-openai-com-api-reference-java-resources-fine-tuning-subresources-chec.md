Permissions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Fine Tuning](/api/reference/java/resources/fine_tuning)
[Checkpoints](/api/reference/java/resources/fine_tuning/subresources/checkpoints)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Permissions
Manage fine-tuning jobs to tailor a model to your specific training data.
##### [List checkpoint permissions](/api/reference/java/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/retrieve)
Deprecated
[PermissionRetrieveResponse](</api/reference/java/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) PermissionRetrieveResponse > (schema)>) fineTuning().checkpoints().permissions().retrieve(PermissionRetrieveParamsparams = PermissionRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
##### [List checkpoint permissions](/api/reference/java/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/list)
PermissionListPage fineTuning().checkpoints().permissions().list(PermissionListParamsparams = PermissionListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
##### [Create checkpoint permissions](/api/reference/java/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/create)
PermissionCreatePage fineTuning().checkpoints().permissions().create(PermissionCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
##### [Delete checkpoint permission](/api/reference/java/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/delete)
[PermissionDeleteResponse](</api/reference/java/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) PermissionDeleteResponse > (schema)>) fineTuning().checkpoints().permissions().delete(PermissionDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions/{permission\_id}