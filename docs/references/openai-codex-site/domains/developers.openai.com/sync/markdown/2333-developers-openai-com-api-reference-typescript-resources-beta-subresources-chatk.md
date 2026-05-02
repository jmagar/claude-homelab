Create ChatKit session | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Beta](/api/reference/typescript/resources/beta)
[ChatKit](/api/reference/typescript/resources/beta/subresources/chatkit)
[Sessions](/api/reference/typescript/resources/beta/subresources/chatkit/subresources/sessions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create ChatKit session
client.beta.chatkit.sessions.create(SessionCreateParams { user, workflow, chatkit\_configuration, 2 more } body, RequestOptionsoptions?): [ChatSession](</api/reference/typescript/resources/beta#(resource) beta.chatkit.threads > (model) chat_session > (schema)>) { id, chatkit\_configuration, client\_secret, 7 more }
POST/chatkit/sessions
Create a ChatKit session.
##### ParametersExpand Collapse
body: SessionCreateParams { user, workflow, chatkit\_configuration, 2 more }
user: string
A free-form string that identifies your end user; ensures this Session can access other objects that have the same `user` scope.
minLength1
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) user>)
workflow: [ChatSessionWorkflowParam](</api/reference/typescript/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema)>) { id, state\_variables, tracing, version }
Workflow that powers the session.
id: string
Identifier for the workflow invoked by the session.
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) workflow + (resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) id>)
state\_variables?: Record\<string, string | boolean | number\>
State variables forwarded to the workflow. Keys may be up to 64 characters, values must be primitive types, and the map defaults to an empty object.
One of the following:
string
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) workflow + (resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 0>)
boolean
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) workflow + (resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 1>)
number
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) workflow + (resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 2>)
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) workflow + (resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables>)
tracing?: Tracing { enabled }
Optional tracing overrides for the workflow invocation. When omitted, tracing is enabled by default.
enabled?: boolean
Whether tracing is enabled during the session. Defaults to true.
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) workflow + (resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) tracing > (property) enabled>)
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) workflow + (resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) tracing>)
version?: string
Specific workflow version to run. Defaults to the latest deployed version.
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) workflow + (resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) version>)
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) workflow>)
chatkit\_configuration?: [ChatSessionChatKitConfigurationParam](</api/reference/typescript/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema)>) { automatic\_thread\_titling, file\_upload, history }
Optional overrides for ChatKit runtime configuration features
automatic\_thread\_titling?: AutomaticThreadTitling { enabled }
Configuration for automatic thread titling. When omitted, automatic thread titling is enabled by default.
enabled?: boolean
Enable automatic thread title generation. Defaults to true.
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) automatic_thread_titling > (property) enabled>)
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) automatic_thread_titling>)
file\_upload?: FileUpload { enabled, max\_file\_size, max\_files }
Configuration for upload enablement and limits. When omitted, uploads are disabled by default (max\_files 10, max\_file\_size 512 MB).
enabled?: boolean
Enable uploads for this session. Defaults to false.
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) enabled>)
max\_file\_size?: number
Maximum size in megabytes for each uploaded file. Defaults to 512 MB, which is the maximum allowable size.
maximum512
minimum1
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) max_file_size>)
max\_files?: number
Maximum number of files that can be uploaded to the session. Defaults to 10.
minimum1
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) max_files>)
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload>)
history?: History { enabled, recent\_threads }
Configuration for chat history retention. When omitted, history is enabled by default with no limit on recent\_threads (null).
enabled?: boolean
Enables chat users to access previous ChatKit threads. Defaults to true.
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history > (property) enabled>)
recent\_threads?: number
Number of recent ChatKit threads users have access to. Defaults to unlimited when unset.
minimum1
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history > (property) recent_threads>)
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history>)
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) chatkit_configuration>)
expires\_after?: [ChatSessionExpiresAfterParam](</api/reference/typescript/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema)>) { anchor, seconds }
Optional override for session expiration timing in seconds from creation. Defaults to 10 minutes.
anchor: "created\_at"
Base timestamp used to calculate expiration. Currently fixed to `created\_at`.
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) expires_after + (resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema) > (property) anchor>)
seconds: number
Number of seconds after the anchor when the session expires.
maximum600
minimum1
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) expires_after + (resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema) > (property) seconds>)
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) expires_after>)
rate\_limits?: [ChatSessionRateLimitsParam](</api/reference/typescript/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_rate_limits_param > (schema)>) { max\_requests\_per\_1\_minute }
Optional override for per-minute request limits. When omitted, defaults to 10.
max\_requests\_per\_1\_minute?: number
Maximum number of requests allowed per minute for the session. Defaults to 10.
minimum1
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) rate_limits + (resource) beta.chatkit.threads > (model) chat_session_rate_limits_param > (schema) > (property) max_requests_per_1_minute>)
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) rate_limits>)
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default>)
##### ReturnsExpand Collapse
ChatSession { id, chatkit\_configuration, client\_secret, 7 more }
Represents a ChatKit session and its resolved configuration.
id: string
Identifier for the ChatKit session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) id>)
chatkit\_configuration: [ChatSessionChatKitConfiguration](</api/reference/typescript/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema)>) { automatic\_thread\_titling, file\_upload, history }
Resolved ChatKit feature configuration for the session.
automatic\_thread\_titling: [ChatSessionAutomaticThreadTitling](</api/reference/typescript/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema)>) { enabled }
Automatic thread titling preferences.
enabled: boolean
Whether automatic thread titling is enabled.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) automatic_thread_titling + (resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema) > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) automatic_thread_titling>)
file\_upload: [ChatSessionFileUpload](</api/reference/typescript/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema)>) { enabled, max\_file\_size, max\_files }
Upload settings for the session.
enabled: boolean
Indicates if uploads are enabled for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload + (resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) enabled>)
max\_file\_size: number | null
Maximum upload size in megabytes.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload + (resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_file_size>)
max\_files: number | null
Maximum number of uploads allowed during the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload + (resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_files>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload>)
history: [ChatSessionHistory](</api/reference/typescript/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_history > (schema)>) { enabled, recent\_threads }
History retention configuration.
enabled: boolean
Indicates if chat history is persisted for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) history + (resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) enabled>)
recent\_threads: number | null
Number of prior threads surfaced in history views. Defaults to null when all history is retained.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) history + (resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) recent_threads>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) history>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration>)
client\_secret: string
Ephemeral client secret that authenticates session requests.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) client_secret>)
expires\_at: number
Unix timestamp (in seconds) for when the session expires.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) expires_at>)
max\_requests\_per\_1\_minute: number
Convenience copy of the per-minute request limit.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) max_requests_per_1_minute>)
object: "chatkit.session"
Type discriminator that is always `chatkit.session`.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) object>)
rate\_limits: [ChatSessionRateLimits](</api/reference/typescript/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema)>) { max\_requests\_per\_1\_minute }
Resolved rate limit values.
max\_requests\_per\_1\_minute: number
Maximum allowed requests per one-minute window.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) rate_limits + (resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema) > (property) max_requests_per_1_minute>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) rate_limits>)
status: [ChatSessionStatus](</api/reference/typescript/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>)
Current lifecycle state of the session.
One of the following:
"active"
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status + (resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 0>)
"expired"
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status + (resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 1>)
"cancelled"
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status + (resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status>)
user: string
User identifier associated with the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) user>)
workflow: [ChatKitWorkflow](</api/reference/typescript/resources/beta#(resource) beta.chatkit > (model) chatkit_workflow > (schema)>) { id, state\_variables, tracing, version }
Workflow metadata for the session.
id: string
Identifier of the workflow backing the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) id>)
state\_variables: Record\<string, string | boolean | number\> | null
State variable key-value pairs applied when invoking the workflow. Defaults to null when no overrides were provided.
One of the following:
string
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 0>)
boolean
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 1>)
number
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables>)
tracing: Tracing { enabled }
Tracing settings applied to the workflow.
enabled: boolean
Indicates whether tracing is enabled.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing>)
version: string | null
Specific workflow version used for the session. Defaults to null when using the latest deployment.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) version>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema)>)
### Create ChatKit session
TypeScript
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
`import OpenAI from 'openai';
const client = new OpenAI();
const chatSession = await client.beta.chatkit.sessions.create({ user: 'user', workflow: { id: 'id' } });
console.log(chatSession.id);
`
```
```
`{
"client\_secret": "chatkit\_token\_123",
"expires\_at": 1735689600,
"workflow": {
"id": "workflow\_alpha",
"version": "2024-10-01"
},
"scope": {
"project": "alpha",
"environment": "staging"
},
"max\_requests\_per\_1\_minute": 60,
"max\_requests\_per\_session": 500,
"status": "active"
}
`
```
##### Returns Examples
```
`{
"client\_secret": "chatkit\_token\_123",
"expires\_at": 1735689600,
"workflow": {
"id": "workflow\_alpha",
"version": "2024-10-01"
},
"scope": {
"project": "alpha",
"environment": "staging"
},
"max\_requests\_per\_1\_minute": 60,
"max\_requests\_per\_session": 500,
"status": "active"
}
`
```