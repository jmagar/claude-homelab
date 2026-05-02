Permissions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Fine Tuning](/api/reference/go/resources/fine_tuning)
[Checkpoints](/api/reference/go/resources/fine_tuning/subresources/checkpoints)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Permissions
Manage fine-tuning jobs to tailor a model to your specific training data.
##### [List checkpoint permissions](/api/reference/go/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/retrieve)
Deprecated
client.FineTuning.Checkpoints.Permissions.Get(ctx, fineTunedModelCheckpoint, query) (\*[FineTuningCheckpointPermissionGetResponse](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) FineTuningCheckpointPermissionGetResponse > (schema)>), error)
GET/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
##### [List checkpoint permissions](/api/reference/go/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/list)
client.FineTuning.Checkpoints.Permissions.List(ctx, fineTunedModelCheckpoint, query) (\*ConversationCursorPage[[FineTuningCheckpointPermissionListResponse](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) FineTuningCheckpointPermissionListResponse > (schema)>)], error)
GET/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
##### [Create checkpoint permissions](/api/reference/go/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/create)
client.FineTuning.Checkpoints.Permissions.New(ctx, fineTunedModelCheckpoint, body) (\*Page[[FineTuningCheckpointPermissionNewResponse](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) FineTuningCheckpointPermissionNewResponse > (schema)>)], error)
POST/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
##### [Delete checkpoint permission](/api/reference/go/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/delete)
client.FineTuning.Checkpoints.Permissions.Delete(ctx, fineTunedModelCheckpoint, permissionID) (\*[FineTuningCheckpointPermissionDeleteResponse](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) FineTuningCheckpointPermissionDeleteResponse > (schema)>), error)
DELETE/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions/{permission\_id}