ChatKit | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Beta](/api/reference/terraform/resources/beta)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# ChatKit
#### ChatKitSessions
#### resource openai\_beta\_chatkit\_session
##### required Expand Collapse
user: String
A free-form string that identifies your end user; ensures this Session can access other objects that have the same `user` scope.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) user>)
workflow: Attributes
Workflow that powers the session.
id: String
Identifier for the workflow invoked by the session.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) workflow > (attribute) id>)
state\_variables?: Dynamic
State variables forwarded to the workflow. Keys may be up to 64 characters, values must be primitive types, and the map defaults to an empty object.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) workflow > (attribute) state_variables>)
tracing?: Attributes
Optional tracing overrides for the workflow invocation. When omitted, tracing is enabled by default.
enabled?: Bool
Whether tracing is enabled during the session. Defaults to true.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) workflow > (attribute) tracing > (attribute) enabled>)
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) workflow > (attribute) tracing>)
version?: String
Specific workflow version to run. Defaults to the latest deployed version.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) workflow > (attribute) version>)
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) workflow>)
##### optional Expand Collapse
chatkit\_configuration?: Attributes
Optional overrides for ChatKit runtime configuration features
automatic\_thread\_titling?: Attributes
Configuration for automatic thread titling. When omitted, automatic thread titling is enabled by default.
enabled?: Bool
Enable automatic thread title generation. Defaults to true.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) chatkit_configuration > (attribute) automatic_thread_titling > (attribute) enabled>)
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) chatkit_configuration > (attribute) automatic_thread_titling>)
file\_upload?: Attributes
Configuration for upload enablement and limits. When omitted, uploads are disabled by default (max\_files 10, max\_file\_size 512 MB).
enabled?: Bool
Enable uploads for this session. Defaults to false.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) chatkit_configuration > (attribute) file_upload > (attribute) enabled>)
max\_file\_size?: Int64
Maximum size in megabytes for each uploaded file. Defaults to 512 MB, which is the maximum allowable size.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) chatkit_configuration > (attribute) file_upload > (attribute) max_file_size>)
max\_files?: Int64
Maximum number of files that can be uploaded to the session. Defaults to 10.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) chatkit_configuration > (attribute) file_upload > (attribute) max_files>)
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) chatkit_configuration > (attribute) file_upload>)
history?: Attributes
Configuration for chat history retention. When omitted, history is enabled by default with no limit on recent\_threads (null).
enabled?: Bool
Enables chat users to access previous ChatKit threads. Defaults to true.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) chatkit_configuration > (attribute) history > (attribute) enabled>)
recent\_threads?: Int64
Number of recent ChatKit threads users have access to. Defaults to unlimited when unset.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) chatkit_configuration > (attribute) history > (attribute) recent_threads>)
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) chatkit_configuration > (attribute) history>)
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) chatkit_configuration>)
rate\_limits?: Attributes
Optional override for per-minute request limits. When omitted, defaults to 10.
max\_requests\_per\_1\_minute?: Int64
Maximum number of requests allowed per minute for the session. Defaults to 10.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) rate_limits > (attribute) max_requests_per_1_minute>)
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) rate_limits>)
expires\_after?: Attributes
Optional override for session expiration timing in seconds from creation. Defaults to 10 minutes.
anchor?: String
Base timestamp used to calculate expiration. Currently fixed to `created\_at`.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) expires_after > (attribute) anchor>)
seconds: Int64
Number of seconds after the anchor when the session expires.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) expires_after > (attribute) seconds>)
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) expires_after>)
##### computed Expand Collapse
id: String
Identifier for the ChatKit session.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) id>)
client\_secret: String
Ephemeral client secret that authenticates session requests.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) client_secret>)
expires\_at: Int64
Unix timestamp (in seconds) for when the session expires.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) expires_at>)
max\_requests\_per\_1\_minute: Int64
Convenience copy of the per-minute request limit.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) max_requests_per_1_minute>)
object: String
Type discriminator that is always `chatkit.session`.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) object>)
status: String
Current lifecycle state of the session.
[](<#(resource) beta.chatkit.sessions > (terraform resource) > (attribute) status>)
### openai\_beta\_chatkit\_session
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
`resource "openai\_beta\_chatkit\_session" "example\_beta\_chatkit\_session" {
user = "x"
workflow = {
id = "id"
state\_variables = {
foo = "string"
}
tracing = {
enabled = true
}
version = "version"
}
chatkit\_configuration = {
automatic\_thread\_titling = {
enabled = true
}
file\_upload = {
enabled = true
max\_file\_size = 1
max\_files = 1
}
history = {
enabled = true
recent\_threads = 1
}
}
expires\_after = {
anchor = "created\_at"
seconds = 1
}
rate\_limits = {
max\_requests\_per\_1\_minute = 1
}
}
`
```
#### ChatKitThreads
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