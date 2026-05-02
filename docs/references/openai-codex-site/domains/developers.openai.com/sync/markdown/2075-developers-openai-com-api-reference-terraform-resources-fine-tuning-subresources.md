Checkpoints | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Fine Tuning](/api/reference/terraform/resources/fine_tuning)
[Jobs](/api/reference/terraform/resources/fine_tuning/subresources/jobs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Checkpoints
Manage fine-tuning jobs to tailor a model to your specific training data.
#### data openai\_fine\_tuning\_job\_checkpoints
##### required Expand Collapse
fine\_tuning\_job\_id: String
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) fine_tuning_job_id>)
##### optional Expand Collapse
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The checkpoint identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the checkpoint was created.
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
fine\_tuned\_model\_checkpoint: String
The name of the fine-tuned checkpoint model that is created.
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) items > (attribute) fine_tuned_model_checkpoint>)
fine\_tuning\_job\_id: String
The name of the fine-tuning job that this checkpoint was created from.
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) items > (attribute) fine_tuning_job_id>)
metrics: Attributes
Metrics at the step number during the fine-tuning job.
full\_valid\_loss: Float64
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) items > (attribute) metrics > (attribute) full_valid_loss>)
full\_valid\_mean\_token\_accuracy: Float64
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) items > (attribute) metrics > (attribute) full_valid_mean_token_accuracy>)
step: Float64
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) items > (attribute) metrics > (attribute) step>)
train\_loss: Float64
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) items > (attribute) metrics > (attribute) train_loss>)
train\_mean\_token\_accuracy: Float64
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) items > (attribute) metrics > (attribute) train_mean_token_accuracy>)
valid\_loss: Float64
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) items > (attribute) metrics > (attribute) valid_loss>)
valid\_mean\_token\_accuracy: Float64
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) items > (attribute) metrics > (attribute) valid_mean_token_accuracy>)
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) items > (attribute) metrics>)
object: String
The object type, which is always “fine\_tuning.job.checkpoint”.
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) items > (attribute) object>)
step\_number: Int64
The step number that the checkpoint was created at.
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) items > (attribute) step_number>)
[](<#(resource) fine_tuning.jobs.checkpoints > (terraform datasource-plural) > (attribute) items>)
### openai\_fine\_tuning\_job\_checkpoints
Terraform
HTTP
HTTP
TypeScript
TypeScript
Python
Python
Java
Java
Go
Go
Ruby
Ruby
Terraform
Terraform
```
`data "openai\_fine\_tuning\_job\_checkpoints" "example\_fine\_tuning\_job\_checkpoints" {
fine\_tuning\_job\_id = "ft-AF1WoRqd3aJAHsqc9NY7iL8F"
}
`
```