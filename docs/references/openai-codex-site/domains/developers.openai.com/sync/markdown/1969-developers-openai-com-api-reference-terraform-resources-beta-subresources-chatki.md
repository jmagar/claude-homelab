Threads | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Beta](/api/reference/terraform/resources/beta)
[ChatKit](/api/reference/terraform/resources/beta/subresources/chatkit)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Threads
#### data openai\_beta\_chatkit\_thread
##### required Expand Collapse
thread\_id: String
[](<#(resource) beta.chatkit.threads > (terraform datasource-single) > (attribute) thread_id>)
##### computed Expand Collapse
created\_at: Int64
Unix timestamp (in seconds) for when the thread was created.
[](<#(resource) beta.chatkit.threads > (terraform datasource-single) > (attribute) created_at>)
id: String
Identifier of the thread.
[](<#(resource) beta.chatkit.threads > (terraform datasource-single) > (attribute) id>)
object: String
Type discriminator that is always `chatkit.thread`.
[](<#(resource) beta.chatkit.threads > (terraform datasource-single) > (attribute) object>)
title: String
Optional human-readable title for the thread. Defaults to null when no title has been generated.
[](<#(resource) beta.chatkit.threads > (terraform datasource-single) > (attribute) title>)
user: String
Free-form string that identifies your end user who owns the thread.
[](<#(resource) beta.chatkit.threads > (terraform datasource-single) > (attribute) user>)
status: Attributes
Current status for the thread. Defaults to `active` for newly created threads.
type: String
Status discriminator that is always `active`.
[](<#(resource) beta.chatkit.threads > (terraform datasource-single) > (attribute) status > (attribute) type>)
reason: String
Reason that the thread was locked. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (terraform datasource-single) > (attribute) status > (attribute) reason>)
[](<#(resource) beta.chatkit.threads > (terraform datasource-single) > (attribute) status>)
### openai\_beta\_chatkit\_thread
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
`data "openai\_beta\_chatkit\_thread" "example\_beta\_chatkit\_thread" {
thread\_id = "cthr\_123"
}
`
```
#### data openai\_beta\_chatkit\_threads
##### optional Expand Collapse
before?: String
List items created before this thread item ID. Defaults to null for the newest results.
[](<#(resource) beta.chatkit.threads > (terraform datasource-plural) > (attribute) before>)
order?: String
Sort order for results by creation time. Defaults to `desc`.
[](<#(resource) beta.chatkit.threads > (terraform datasource-plural) > (attribute) order>)
user?: String
Filter threads that belong to this user identifier. Defaults to null to return all users.
[](<#(resource) beta.chatkit.threads > (terraform datasource-plural) > (attribute) user>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) beta.chatkit.threads > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Identifier of the thread.
[](<#(resource) beta.chatkit.threads > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) for when the thread was created.
[](<#(resource) beta.chatkit.threads > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
object: String
Type discriminator that is always `chatkit.thread`.
[](<#(resource) beta.chatkit.threads > (terraform datasource-plural) > (attribute) items > (attribute) object>)
status: Attributes
Current status for the thread. Defaults to `active` for newly created threads.
type: String
Status discriminator that is always `active`.
[](<#(resource) beta.chatkit.threads > (terraform datasource-plural) > (attribute) items > (attribute) status > (attribute) type>)
reason: String
Reason that the thread was locked. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (terraform datasource-plural) > (attribute) items > (attribute) status > (attribute) reason>)
[](<#(resource) beta.chatkit.threads > (terraform datasource-plural) > (attribute) items > (attribute) status>)
title: String
Optional human-readable title for the thread. Defaults to null when no title has been generated.
[](<#(resource) beta.chatkit.threads > (terraform datasource-plural) > (attribute) items > (attribute) title>)
user: String
Free-form string that identifies your end user who owns the thread.
[](<#(resource) beta.chatkit.threads > (terraform datasource-plural) > (attribute) items > (attribute) user>)
[](<#(resource) beta.chatkit.threads > (terraform datasource-plural) > (attribute) items>)
### openai\_beta\_chatkit\_threads
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
`data "openai\_beta\_chatkit\_threads" "example\_beta\_chatkit\_threads" {
before = "before"
order = "asc"
user = "x"
}
`
```