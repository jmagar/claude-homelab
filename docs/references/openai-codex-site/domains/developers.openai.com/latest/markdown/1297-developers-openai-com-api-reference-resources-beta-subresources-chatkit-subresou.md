Cancel chat session | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Beta](/api/reference/resources/beta)
[ChatKit](/api/reference/resources/beta/subresources/chatkit)
[Sessions](/api/reference/resources/beta/subresources/chatkit/subresources/sessions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Cancel chat session
POST/chatkit/sessions/{session\_id}/cancel
Cancel an active ChatKit session and return its most recent metadata.
Cancelling prevents new requests from using the issued client secret.
##### Path ParametersExpand Collapse
session\_id: string
[](<#(resource) beta.chatkit.sessions > (method) cancel > (params) default > (param) session_id > (schema)>)
##### ReturnsExpand Collapse
ChatSession object { id, chatkit\_configuration, client\_secret, 7 more }
Represents a ChatKit session and its resolved configuration.
id: string
Identifier for the ChatKit session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) id>)
chatkit\_configuration: [ChatSessionChatKitConfiguration](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema)>) { automatic\_thread\_titling, file\_upload, history }
Resolved ChatKit feature configuration for the session.
automatic\_thread\_titling: [ChatSessionAutomaticThreadTitling](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema)>) { enabled }
Automatic thread titling preferences.
enabled: boolean
Whether automatic thread titling is enabled.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) automatic_thread_titling + (resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema) > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) automatic_thread_titling>)
file\_upload: [ChatSessionFileUpload](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema)>) { enabled, max\_file\_size, max\_files }
Upload settings for the session.
enabled: boolean
Indicates if uploads are enabled for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload + (resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) enabled>)
max\_file\_size: number
Maximum upload size in megabytes.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload + (resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_file_size>)
max\_files: number
Maximum number of uploads allowed during the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload + (resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_files>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload>)
history: [ChatSessionHistory](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_history > (schema)>) { enabled, recent\_threads }
History retention configuration.
enabled: boolean
Indicates if chat history is persisted for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) history + (resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) enabled>)
recent\_threads: number
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
rate\_limits: [ChatSessionRateLimits](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema)>) { max\_requests\_per\_1\_minute }
Resolved rate limit values.
max\_requests\_per\_1\_minute: number
Maximum allowed requests per one-minute window.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) rate_limits + (resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema) > (property) max_requests_per_1_minute>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) rate_limits>)
status: [ChatSessionStatus](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>)
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
workflow: [ChatKitWorkflow](</api/reference/resources/beta#(resource) beta.chatkit > (model) chatkit_workflow > (schema)>) { id, state\_variables, tracing, version }
Workflow metadata for the session.
id: string
Identifier of the workflow backing the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) id>)
state\_variables: map[string or boolean or number]
State variable key-value pairs applied when invoking the workflow. Defaults to null when no overrides were provided.
One of the following:
string
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 0>)
boolean
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 1>)
number
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables>)
tracing: object { enabled }
Tracing settings applied to the workflow.
enabled: boolean
Indicates whether tracing is enabled.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing>)
version: string
Specific workflow version used for the session. Defaults to null when using the latest deployment.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) version>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema)>)
### Cancel chat session
HTTP
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
`curl -X POST \\
https://api.openai.com/v1/chatkit/sessions/cksess\_123/cancel \\
-H "OpenAI-Beta: chatkit\_beta=v1" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
`
```
```
`{
"id": "cksess\_123",
"object": "chatkit.session",
"workflow": {
"id": "workflow\_alpha",
"version": "1"
},
"scope": {
"customer\_id": "cust\_456"
},
"max\_requests\_per\_1\_minute": 30,
"ttl\_seconds": 900,
"status": "cancelled",
"cancelled\_at": 1712345678
}
`
```
##### Returns Examples
```
`{
"id": "cksess\_123",
"object": "chatkit.session",
"workflow": {
"id": "workflow\_alpha",
"version": "1"
},
"scope": {
"customer\_id": "cust\_456"
},
"max\_requests\_per\_1\_minute": 30,
"ttl\_seconds": 900,
"status": "cancelled",
"cancelled\_at": 1712345678
}
`
```