Beta | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Beta
#### BetaChatKit
##### ModelsExpand Collapse
ChatKitWorkflow object { id, state\_variables, tracing, version }
Workflow metadata and state returned for the session.
id: string
Identifier of the workflow backing the session.
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) id>)
state\_variables: map[string or boolean or number]
State variable key-value pairs applied when invoking the workflow. Defaults to null when no overrides were provided.
One of the following:
string
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 0>)
boolean
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 1>)
number
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 2>)
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables>)
tracing: object { enabled }
Tracing settings applied to the workflow.
enabled: boolean
Indicates whether tracing is enabled.
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing > (property) enabled>)
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing>)
version: string
Specific workflow version used for the session. Defaults to null when using the latest deployment.
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) version>)
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema)>)
#### BetaChatKitSessions
##### [Cancel chat session](/api/reference/resources/beta/subresources/chatkit/subresources/sessions/methods/cancel)
POST/chatkit/sessions/{session\_id}/cancel
##### [Create ChatKit session](/api/reference/resources/beta/subresources/chatkit/subresources/sessions/methods/create)
POST/chatkit/sessions
#### BetaChatKitThreads
##### [List ChatKit thread items](/api/reference/resources/beta/subresources/chatkit/subresources/threads/methods/list_items)
GET/chatkit/threads/{thread\_id}/items
##### [Retrieve ChatKit thread](/api/reference/resources/beta/subresources/chatkit/subresources/threads/methods/retrieve)
GET/chatkit/threads/{thread\_id}
##### [Delete ChatKit thread](/api/reference/resources/beta/subresources/chatkit/subresources/threads/methods/delete)
DELETE/chatkit/threads/{thread\_id}
##### [List ChatKit threads](/api/reference/resources/beta/subresources/chatkit/subresources/threads/methods/list)
GET/chatkit/threads
##### ModelsExpand Collapse
ChatSession object { id, chatkit\_configuration, client\_secret, 7 more }
Represents a ChatKit session and its resolved configuration.
id: string
Identifier for the ChatKit session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) id>)
chatkit\_configuration: [ChatSessionChatKitConfiguration](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema)>) { automatic\_thread\_titling, file\_upload, history }
Resolved ChatKit feature configuration for the session.
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
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) rate_limits>)
status: [ChatSessionStatus](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>)
Current lifecycle state of the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status>)
user: string
User identifier associated with the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) user>)
workflow: [ChatKitWorkflow](</api/reference/resources/beta#(resource) beta.chatkit > (model) chatkit_workflow > (schema)>) { id, state\_variables, tracing, version }
Workflow metadata for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema)>)
ChatSessionAutomaticThreadTitling object { enabled }
Automatic thread title preferences for the session.
enabled: boolean
Whether automatic thread titling is enabled.
[](<#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema) > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema)>)
ChatSessionChatKitConfiguration object { automatic\_thread\_titling, file\_upload, history }
ChatKit configuration for the session.
automatic\_thread\_titling: [ChatSessionAutomaticThreadTitling](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema)>) { enabled }
Automatic thread titling preferences.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) automatic_thread_titling>)
file\_upload: [ChatSessionFileUpload](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema)>) { enabled, max\_file\_size, max\_files }
Upload settings for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload>)
history: [ChatSessionHistory](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_history > (schema)>) { enabled, recent\_threads }
History retention configuration.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) history>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema)>)
ChatSessionChatKitConfigurationParam object { automatic\_thread\_titling, file\_upload, history }
Optional per-session configuration settings for ChatKit behavior.
automatic\_thread\_titling: optional object { enabled }
Configuration for automatic thread titling. When omitted, automatic thread titling is enabled by default.
enabled: optional boolean
Enable automatic thread title generation. Defaults to true.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) automatic_thread_titling > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) automatic_thread_titling>)
file\_upload: optional object { enabled, max\_file\_size, max\_files }
Configuration for upload enablement and limits. When omitted, uploads are disabled by default (max\_files 10, max\_file\_size 512 MB).
enabled: optional boolean
Enable uploads for this session. Defaults to false.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) enabled>)
max\_file\_size: optional number
Maximum size in megabytes for each uploaded file. Defaults to 512 MB, which is the maximum allowable size.
maximum512
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) max_file_size>)
max\_files: optional number
Maximum number of files that can be uploaded to the session. Defaults to 10.
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) max_files>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload>)
history: optional object { enabled, recent\_threads }
Configuration for chat history retention. When omitted, history is enabled by default with no limit on recent\_threads (null).
enabled: optional boolean
Enables chat users to access previous ChatKit threads. Defaults to true.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history > (property) enabled>)
recent\_threads: optional number
Number of recent ChatKit threads users have access to. Defaults to unlimited when unset.
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history > (property) recent_threads>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema)>)
ChatSessionExpiresAfterParam object { anchor, seconds }
Controls when the session expires relative to an anchor timestamp.
anchor: "created\_at"
Base timestamp used to calculate expiration. Currently fixed to `created\_at`.
[](<#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema) > (property) anchor>)
seconds: number
Number of seconds after the anchor when the session expires.
maximum600
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema) > (property) seconds>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema)>)
ChatSessionFileUpload object { enabled, max\_file\_size, max\_files }
Upload permissions and limits applied to the session.
enabled: boolean
Indicates if uploads are enabled for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) enabled>)
max\_file\_size: number
Maximum upload size in megabytes.
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_file_size>)
max\_files: number
Maximum number of uploads allowed during the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_files>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema)>)
ChatSessionHistory object { enabled, recent\_threads }
History retention preferences returned for the session.
enabled: boolean
Indicates if chat history is persisted for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) enabled>)
recent\_threads: number
Number of prior threads surfaced in history views. Defaults to null when all history is retained.
[](<#(resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) recent_threads>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_history > (schema)>)
ChatSessionRateLimits object { max\_requests\_per\_1\_minute }
Active per-minute request limit for the session.
max\_requests\_per\_1\_minute: number
Maximum allowed requests per one-minute window.
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema) > (property) max_requests_per_1_minute>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema)>)
ChatSessionRateLimitsParam object { max\_requests\_per\_1\_minute }
Controls request rate limits for the session.
max\_requests\_per\_1\_minute: optional number
Maximum number of requests allowed per minute for the session. Defaults to 10.
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits_param > (schema) > (property) max_requests_per_1_minute>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits_param > (schema)>)
ChatSessionStatus = "active" or "expired" or "cancelled"
One of the following:
"active"
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 0>)
"expired"
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 1>)
"cancelled"
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>)
ChatSessionWorkflowParam object { id, state\_variables, tracing, version }
Workflow reference and overrides applied to the chat session.
id: string
Identifier for the workflow invoked by the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) id>)
state\_variables: optional map[string or boolean or number]
State variables forwarded to the workflow. Keys may be up to 64 characters, values must be primitive types, and the map defaults to an empty object.
One of the following:
string
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 0>)
boolean
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 1>)
number
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables>)
tracing: optional object { enabled }
Optional tracing overrides for the workflow invocation. When omitted, tracing is enabled by default.
enabled: optional boolean
Whether tracing is enabled during the session. Defaults to true.
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) tracing > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) tracing>)
version: optional string
Specific workflow version to run. Defaults to the latest deployed version.
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) version>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema)>)
ChatKitAttachment object { id, mime\_type, name, 2 more }
Attachment metadata included on thread items.
id: string
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
mime\_type: string
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
name: string
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
preview\_url: string
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
type: "image" or "file"
Attachment discriminator.
One of the following:
"image"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
"file"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>)
ChatKitResponseOutputText object { annotations, text, type }
Assistant response text accompanied by optional annotations.
annotations: array of object { source, type } or object { source, type }
Ordered list of annotations attached to the response text.
One of the following:
File object { source, type }
Annotation that references an uploaded file.
source: object { filename, type }
File attachment referenced by the annotation.
filename: string
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
type: "file"
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
type: "file"
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
URL object { source, type }
Annotation that references a URL.
source: object { type, url }
URL referenced by the annotation.
type: "url"
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
url: string
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
type: "url"
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
text: string
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
type: "output\_text"
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>)
ChatKitThread object { id, created\_at, object, 3 more }
Represents a ChatKit thread and its current status.
id: string
Identifier of the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) for when the thread was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) created_at>)
object: "chatkit.thread"
Type discriminator that is always `chatkit.thread`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) object>)
status: object { type } or object { reason, type } or object { reason, type }
Current status for the thread. Defaults to `active` for newly created threads.
One of the following:
Active object { type }
Indicates that a thread is active.
type: "active"
Status discriminator that is always `active`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0>)
Locked object { reason, type }
Indicates that a thread is locked and cannot accept new input.
reason: string
Reason that the thread was locked. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) reason>)
type: "locked"
Status discriminator that is always `locked`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1>)
Closed object { reason, type }
Indicates that a thread has been closed.
reason: string
Reason that the thread was closed. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) reason>)
type: "closed"
Status discriminator that is always `closed`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status>)
title: string
Optional human-readable title for the thread. Defaults to null when no title has been generated.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) title>)
user: string
Free-form string that identifies your end user who owns the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) user>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>)
ChatKitThreadAssistantMessageItem object { id, content, created\_at, 3 more }
Assistant-authored message within a thread.
id: string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) id>)
content: array of [ChatKitResponseOutputText](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>) { annotations, text, type }
Ordered assistant response segments.
annotations: array of object { source, type } or object { source, type }
Ordered list of annotations attached to the response text.
One of the following:
File object { source, type }
Annotation that references an uploaded file.
source: object { filename, type }
File attachment referenced by the annotation.
filename: string
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
type: "file"
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
type: "file"
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
URL object { source, type }
Annotation that references a URL.
source: object { type, url }
URL referenced by the annotation.
type: "url"
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
url: string
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
type: "url"
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
text: string
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
type: "output\_text"
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) content>)
created\_at: number
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) created_at>)
object: "chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) object>)
thread\_id: string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) thread_id>)
type: "chatkit.assistant\_message"
Type discriminator that is always `chatkit.assistant\_message`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>)
ChatKitThreadItemList object { data, first\_id, has\_more, 2 more }
A paginated list of thread items rendered for the ChatKit API.
data: array of [ChatKitThreadUserMessageItem](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>) { id, attachments, content, 5 more } or [ChatKitThreadAssistantMessageItem](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>) { id, content, created\_at, 3 more } or [ChatKitWidgetItem](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>) { id, created\_at, object, 3 more } or 3 more
A list of items
One of the following:
ChatKitThreadUserMessageItem object { id, attachments, content, 5 more }
User-authored messages within a thread.
id: string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) id>)
attachments: array of [ChatKitAttachment](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>) { id, mime\_type, name, 2 more }
Attachments associated with the user message. Defaults to an empty list.
id: string
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
mime\_type: string
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
name: string
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
preview\_url: string
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
type: "image" or "file"
Attachment discriminator.
One of the following:
"image"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
"file"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) attachments>)
content: array of object { text, type } or object { text, type }
Ordered content elements supplied by the user.
One of the following:
InputText object { text, type }
Text block that a user contributed to the thread.
text: string
Plain-text content supplied by the user.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) text>)
type: "input\_text"
Type discriminator that is always `input\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0>)
QuotedText object { text, type }
Quoted snippet that the user referenced in their message.
text: string
Quoted text content.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) text>)
type: "quoted\_text"
Type discriminator that is always `quoted\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content>)
created\_at: number
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) created_at>)
inference\_options: object { model, tool\_choice }
Inference overrides applied to the message. Defaults to null when unset.
model: string
Model name that generated the response. Defaults to null when using the session default.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) model>)
tool\_choice: object { id }
Preferred tool to invoke. Defaults to null when ChatKit should auto-select.
id: string
Identifier of the requested tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice > (property) id>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options>)
object: "chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) object>)
thread\_id: string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) thread_id>)
type: "chatkit.user\_message"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>)
ChatKitThreadAssistantMessageItem object { id, content, created\_at, 3 more }
Assistant-authored message within a thread.
id: string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) id>)
content: array of [ChatKitResponseOutputText](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>) { annotations, text, type }
Ordered assistant response segments.
annotations: array of object { source, type } or object { source, type }
Ordered list of annotations attached to the response text.
One of the following:
File object { source, type }
Annotation that references an uploaded file.
source: object { filename, type }
File attachment referenced by the annotation.
filename: string
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
type: "file"
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
type: "file"
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
URL object { source, type }
Annotation that references a URL.
source: object { type, url }
URL referenced by the annotation.
type: "url"
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
url: string
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
type: "url"
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
text: string
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
type: "output\_text"
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) content>)
created\_at: number
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) created_at>)
object: "chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) object>)
thread\_id: string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) thread_id>)
type: "chatkit.assistant\_message"
Type discriminator that is always `chatkit.assistant\_message`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>)
ChatKitWidgetItem object { id, created\_at, object, 3 more }
Thread item that renders a widget payload.
id: string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) created_at>)
object: "chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) object>)
thread\_id: string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) thread_id>)
type: "chatkit.widget"
Type discriminator that is always `chatkit.widget`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) type>)
widget: string
Serialized widget payload rendered in the UI.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) widget>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>)
ChatKitClientToolCall object { id, arguments, call\_id, 7 more }
Record of a client side tool invocation initiated by the assistant.
id: string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) id>)
arguments: string
JSON-encoded arguments that were sent to the tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) arguments>)
call\_id: string
Identifier for the client tool call.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) call_id>)
created\_at: number
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) created_at>)
name: string
Tool name that was invoked.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) name>)
object: "chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) object>)
output: string
JSON-encoded output captured from the tool. Defaults to null while execution is in progress.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) output>)
status: "in\_progress" or "completed"
Execution status for the tool call.
One of the following:
"in\_progress"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 0>)
"completed"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status>)
thread\_id: string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) thread_id>)
type: "chatkit.client\_tool\_call"
Type discriminator that is always `chatkit.client\_tool\_call`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3>)
ChatKitTask object { id, created\_at, heading, 5 more }
Task emitted by the workflow to show progress and status updates.
id: string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) id>)
created\_at: number
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) created_at>)
heading: string
Optional heading for the task. Defaults to null when not provided.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) heading>)
object: "chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) object>)
summary: string
Optional summary that describes the task. Defaults to null when omitted.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) summary>)
task\_type: "custom" or "thought"
Subtype for the task.
One of the following:
"custom"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type > (member) 0>)
"thought"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type>)
thread\_id: string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) thread_id>)
type: "chatkit.task"
Type discriminator that is always `chatkit.task`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4>)
ChatKitTaskGroup object { id, created\_at, object, 3 more }
Collection of workflow tasks grouped together in the thread.
id: string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) id>)
created\_at: number
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) created_at>)
object: "chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) object>)
tasks: array of object { heading, summary, type }
Tasks included in the group.
heading: string
Optional heading for the grouped task. Defaults to null when not provided.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) heading>)
summary: string
Optional summary that describes the grouped task. Defaults to null when omitted.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) summary>)
type: "custom" or "thought"
Subtype for the grouped task.
One of the following:
"custom"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type > (member) 0>)
"thought"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks>)
thread\_id: string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) thread_id>)
type: "chatkit.task\_group"
Type discriminator that is always `chatkit.task\_group`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data>)
first\_id: string
The ID of the first item in the list.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) first_id>)
has\_more: boolean
Whether there are more items available.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) has_more>)
last\_id: string
The ID of the last item in the list.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) last_id>)
object: "list"
The type of object returned, must be `list`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) object>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema)>)
ChatKitThreadUserMessageItem object { id, attachments, content, 5 more }
User-authored messages within a thread.
id: string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) id>)
attachments: array of [ChatKitAttachment](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>) { id, mime\_type, name, 2 more }
Attachments associated with the user message. Defaults to an empty list.
id: string
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
mime\_type: string
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
name: string
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
preview\_url: string
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
type: "image" or "file"
Attachment discriminator.
One of the following:
"image"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
"file"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) attachments>)
content: array of object { text, type } or object { text, type }
Ordered content elements supplied by the user.
One of the following:
InputText object { text, type }
Text block that a user contributed to the thread.
text: string
Plain-text content supplied by the user.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) text>)
type: "input\_text"
Type discriminator that is always `input\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0>)
QuotedText object { text, type }
Quoted snippet that the user referenced in their message.
text: string
Quoted text content.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) text>)
type: "quoted\_text"
Type discriminator that is always `quoted\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content>)
created\_at: number
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) created_at>)
inference\_options: object { model, tool\_choice }
Inference overrides applied to the message. Defaults to null when unset.
model: string
Model name that generated the response. Defaults to null when using the session default.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) model>)
tool\_choice: object { id }
Preferred tool to invoke. Defaults to null when ChatKit should auto-select.
id: string
Identifier of the requested tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice > (property) id>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options>)
object: "chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) object>)
thread\_id: string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) thread_id>)
type: "chatkit.user\_message"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>)
ChatKitWidgetItem object { id, created\_at, object, 3 more }
Thread item that renders a widget payload.
id: string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) created_at>)
object: "chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) object>)
thread\_id: string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) thread_id>)
type: "chatkit.widget"
Type discriminator that is always `chatkit.widget`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) type>)
widget: string
Serialized widget payload rendered in the UI.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) widget>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>)
ThreadDeleteResponse object { id, deleted, object }
Confirmation payload returned after deleting a thread.
id: string
Identifier of the deleted thread.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) id>)
deleted: boolean
Indicates that the thread has been deleted.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) deleted>)
object: "chatkit.thread.deleted"
Type discriminator that is always `chatkit.thread.deleted`.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) object>)
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema)>)
#### BetaAssistants
Build Assistants that can call models and use tools.
##### [List assistants](/api/reference/resources/beta/subresources/assistants/methods/list)
Deprecated
GET/assistants
##### [Create assistant](/api/reference/resources/beta/subresources/assistants/methods/create)
Deprecated
POST/assistants
##### [Retrieve assistant](/api/reference/resources/beta/subresources/assistants/methods/retrieve)
Deprecated
GET/assistants/{assistant\_id}
##### [Modify assistant](/api/reference/resources/beta/subresources/assistants/methods/update)
Deprecated
POST/assistants/{assistant\_id}
##### [Delete assistant](/api/reference/resources/beta/subresources/assistants/methods/delete)
Deprecated
DELETE/assistants/{assistant\_id}
##### ModelsExpand Collapse
Assistant object { id, created\_at, description, 10 more }
Represents an `assistant` that can call the model and use tools.
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the assistant was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) created_at>)
description: string
The description of the assistant. The maximum length is 512 characters.
maxLength512
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) description>)
instructions: string
The system instructions that the assistant uses. The maximum length is 256,000 characters.
maxLength256000
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) instructions>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) metadata>)
model: string
ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models) for descriptions of them.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) model>)
name: string
The name of the assistant. The maximum length is 256 characters.
maxLength256
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) name>)
object: "assistant"
The object type, which is always `assistant`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) object>)
tools: array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or [FileSearchTool](</api/reference/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } or [FunctionTool](</api/reference/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tools>)
response\_format: optional [AssistantResponseFormatOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format>)
temperature: optional number
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
minimum0
maximum2
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) temperature>)
tool\_resources: optional object { code\_interpreter, file\_search }
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: optional object { file\_ids }
file\_ids: optional array of string
A list of [file](/docs/api-reference/files) IDs made available to the `code\_interpreter“ tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter>)
file\_search: optional object { vector\_store\_ids }
vector\_store\_ids: optional array of string
The ID of the [vector store](/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources>)
top\_p: optional number
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant > (schema)>)
AssistantDeleted object { id, deleted, object }
id: string
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) deleted>)
object: "assistant.deleted"
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema)>)
AssistantStreamEvent = object { data, event, enabled } or object { data, event } or object { data, event } or 22 more
Represents an event emitted when streaming a Run.
Each event in a server-sent events stream has an `event` and `data` property:
```
`event: thread.created
data: {"id": "thread\_123", "object": "thread", ...}`
```
We emit events whenever a new object is created, transitions to a new state, or is being
streamed in parts (deltas). For example, we emit `thread.run.created` when a new run
is created, `thread.run.completed` when a run completes, and so on. When an Assistant chooses
to create a message during a run, we emit a `thread.message.created event`, a
`thread.message.in\_progress` event, many `thread.message.delta` events, and finally a
`thread.message.completed` event.
We may add additional events over time, so we recommend handling unknown events gracefully
in your code. See the [Assistants API quickstart](/docs/assistants/overview) to learn how to
integrate the Assistants API with streaming.
One of the following:
object { data, event, enabled }
Occurs when a new [thread](/docs/api-reference/threads/object) is created.
data: [Thread](</api/reference/resources/beta#(resource) beta.threads > (model) thread > (schema)>) { id, created\_at, metadata, 2 more }
Represents a thread that contains [messages](/docs/api-reference/messages).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data>)
event: "thread.created"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) event>)
enabled: optional boolean
Whether to enable input audio transcription.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) enabled>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0>)
object { data, event }
Occurs when a new [run](/docs/api-reference/runs/object) is created.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data>)
event: "thread.run.created"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) moves to a `queued` status.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data>)
event: "thread.run.queued"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) moves to an `in\_progress` status.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data>)
event: "thread.run.in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) moves to a `requires\_action` status.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data>)
event: "thread.run.requires\_action"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) is completed.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data>)
event: "thread.run.completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) ends with status `incomplete`.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data>)
event: "thread.run.incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) fails.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data>)
event: "thread.run.failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) moves to a `cancelling` status.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data>)
event: "thread.run.cancelling"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) is cancelled.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data>)
event: "thread.run.cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) expires.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data>)
event: "thread.run.expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) is created.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data>)
event: "thread.run.step.created"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) moves to an `in\_progress` state.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data>)
event: "thread.run.step.in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12>)
object { data, event }
Occurs when parts of a [run step](/docs/api-reference/run-steps/step-object) are being streamed.
data: [RunStepDeltaEvent](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>) { id, delta, object }
Represents a run step delta i.e. any changed fields on a run step during streaming.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data>)
event: "thread.run.step.delta"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) is completed.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data>)
event: "thread.run.step.completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) fails.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data>)
event: "thread.run.step.failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) is cancelled.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data>)
event: "thread.run.step.cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) expires.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data>)
event: "thread.run.step.expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17>)
object { data, event }
Occurs when a [message](/docs/api-reference/messages/object) is created.
data: [Message](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data>)
event: "thread.message.created"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18>)
object { data, event }
Occurs when a [message](/docs/api-reference/messages/object) moves to an `in\_progress` state.
data: [Message](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data>)
event: "thread.message.in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19>)
object { data, event }
Occurs when parts of a [Message](/docs/api-reference/messages/object) are being streamed.
data: [MessageDeltaEvent](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message_delta_event > (schema)>) { id, delta, object }
Represents a message delta i.e. any changed fields on a message during streaming.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) data>)
event: "thread.message.delta"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20>)
object { data, event }
Occurs when a [message](/docs/api-reference/messages/object) is completed.
data: [Message](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data>)
event: "thread.message.completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21>)
object { data, event }
Occurs when a [message](/docs/api-reference/messages/object) ends before it is completed.
data: [Message](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data>)
event: "thread.message.incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22>)
ErrorEvent object { data, event }
Occurs when an [error](/docs/guides/error-codes#api-errors) occurs. This can happen due to an internal server error or a timeout.
data: [ErrorObject](</api/reference/resources/$shared#(resource) $shared > (model) error_object > (schema)>) { code, message, param, type }
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data>)
event: "error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23>)
DoneEvent object { data, event }
Occurs when a stream ends.
data: "[DONE]"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 24 > (property) data>)
event: "done"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 24 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 24>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema)>)
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
MessageStreamEvent = object { data, event } or object { data, event } or object { data, event } or 2 more
Occurs when a [message](/docs/api-reference/messages/object) is created.
One of the following:
object { data, event }
Occurs when a [message](/docs/api-reference/messages/object) is created.
data: [Message](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0 > (property) data>)
event: "thread.message.created"
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0>)
object { data, event }
Occurs when a [message](/docs/api-reference/messages/object) moves to an `in\_progress` state.
data: [Message](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1 > (property) data>)
event: "thread.message.in\_progress"
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1>)
object { data, event }
Occurs when parts of a [Message](/docs/api-reference/messages/object) are being streamed.
data: [MessageDeltaEvent](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message_delta_event > (schema)>) { id, delta, object }
Represents a message delta i.e. any changed fields on a message during streaming.
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2 > (property) data>)
event: "thread.message.delta"
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2>)
object { data, event }
Occurs when a [message](/docs/api-reference/messages/object) is completed.
data: [Message](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3 > (property) data>)
event: "thread.message.completed"
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3>)
object { data, event }
Occurs when a [message](/docs/api-reference/messages/object) ends before it is completed.
data: [Message](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4 > (property) data>)
event: "thread.message.incomplete"
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema)>)
RunStepStreamEvent = object { data, event } or object { data, event } or object { data, event } or 4 more
Occurs when a [run step](/docs/api-reference/run-steps/step-object) is created.
One of the following:
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) is created.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0 > (property) data>)
event: "thread.run.step.created"
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) moves to an `in\_progress` state.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1 > (property) data>)
event: "thread.run.step.in\_progress"
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1>)
object { data, event }
Occurs when parts of a [run step](/docs/api-reference/run-steps/step-object) are being streamed.
data: [RunStepDeltaEvent](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>) { id, delta, object }
Represents a run step delta i.e. any changed fields on a run step during streaming.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2 > (property) data>)
event: "thread.run.step.delta"
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) is completed.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3 > (property) data>)
event: "thread.run.step.completed"
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) fails.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4 > (property) data>)
event: "thread.run.step.failed"
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) is cancelled.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5 > (property) data>)
event: "thread.run.step.cancelled"
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) expires.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6 > (property) data>)
event: "thread.run.step.expired"
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema)>)
RunStreamEvent = object { data, event } or object { data, event } or object { data, event } or 7 more
Occurs when a new [run](/docs/api-reference/runs/object) is created.
One of the following:
object { data, event }
Occurs when a new [run](/docs/api-reference/runs/object) is created.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0 > (property) data>)
event: "thread.run.created"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) moves to a `queued` status.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1 > (property) data>)
event: "thread.run.queued"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) moves to an `in\_progress` status.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2 > (property) data>)
event: "thread.run.in\_progress"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) moves to a `requires\_action` status.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3 > (property) data>)
event: "thread.run.requires\_action"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) is completed.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4 > (property) data>)
event: "thread.run.completed"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) ends with status `incomplete`.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5 > (property) data>)
event: "thread.run.incomplete"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) fails.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6 > (property) data>)
event: "thread.run.failed"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) moves to a `cancelling` status.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7 > (property) data>)
event: "thread.run.cancelling"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) is cancelled.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8 > (property) data>)
event: "thread.run.cancelled"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) expires.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9 > (property) data>)
event: "thread.run.expired"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema)>)
ThreadStreamEvent object { data, event, enabled }
Occurs when a new [thread](/docs/api-reference/threads/object) is created.
data: [Thread](</api/reference/resources/beta#(resource) beta.threads > (model) thread > (schema)>) { id, created\_at, metadata, 2 more }
Represents a thread that contains [messages](/docs/api-reference/messages).
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) data>)
event: "thread.created"
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) event>)
enabled: optional boolean
Whether to enable input audio transcription.
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) enabled>)
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema)>)
#### BetaThreads
Build Assistants that can call models and use tools.
##### [Create thread](/api/reference/resources/beta/subresources/threads/methods/create)
Deprecated
POST/threads
##### [Create thread and run](/api/reference/resources/beta/subresources/threads/methods/create_and_run)
Deprecated
POST/threads/runs
##### [Retrieve thread](/api/reference/resources/beta/subresources/threads/methods/retrieve)
Deprecated
GET/threads/{thread\_id}
##### [Modify thread](/api/reference/resources/beta/subresources/threads/methods/update)
Deprecated
POST/threads/{thread\_id}
##### [Delete thread](/api/reference/resources/beta/subresources/threads/methods/delete)
Deprecated
DELETE/threads/{thread\_id}
##### ModelsExpand Collapse
AssistantResponseFormatOption = "auto" or [ResponseFormatText](</api/reference/resources/$shared#(resource) $shared > (model) response_format_text > (schema)>) { type } or [ResponseFormatJSONObject](</api/reference/resources/$shared#(resource) $shared > (model) response_format_json_object > (schema)>) { type } or [ResponseFormatJSONSchema](</api/reference/resources/$shared#(resource) $shared > (model) response_format_json_schema > (schema)>) { json\_schema, type }
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
`auto` is the default value
[](<#(resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
AssistantToolChoice object { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" or "code\_interpreter" or "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: optional [AssistantToolChoiceFunction](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema)>)
AssistantToolChoiceFunction object { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)
AssistantToolChoiceOption = "none" or "auto" or "required" or [AssistantToolChoice](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice > (schema)>) { type, function }
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" or "auto" or "required"
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
"none"
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice object { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" or "code\_interpreter" or "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: optional [AssistantToolChoiceFunction](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Thread object { id, created\_at, metadata, 2 more }
Represents a thread that contains [messages](/docs/api-reference/messages).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the thread was created.
formatunixtime
[](<#(resource) beta.threads > (model) thread > (schema) > (property) created_at>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) metadata>)
object: "thread"
The object type, which is always `thread`.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) object>)
tool\_resources: object { code\_interpreter, file\_search }
A set of resources that are made available to the assistant’s tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: optional object { file\_ids }
file\_ids: optional array of string
A list of [file](/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter>)
file\_search: optional object { vector\_store\_ids }
vector\_store\_ids: optional array of string
The [vector store](/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources>)
[](<#(resource) beta.threads > (model) thread > (schema)>)
ThreadDeleted object { id, deleted, object }
id: string
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) deleted>)
object: "thread.deleted"
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads > (model) thread_deleted > (schema)>)
#### BetaThreadsRuns
Build Assistants that can call models and use tools.
##### [List runs](/api/reference/resources/beta/subresources/threads/subresources/runs/methods/list)
Deprecated
GET/threads/{thread\_id}/runs
##### [Create run](/api/reference/resources/beta/subresources/threads/subresources/runs/methods/create)
Deprecated
POST/threads/{thread\_id}/runs
##### [Retrieve run](/api/reference/resources/beta/subresources/threads/subresources/runs/methods/retrieve)
Deprecated
GET/threads/{thread\_id}/runs/{run\_id}
##### [Modify run](/api/reference/resources/beta/subresources/threads/subresources/runs/methods/update)
Deprecated
POST/threads/{thread\_id}/runs/{run\_id}
##### [Submit tool outputs to run](/api/reference/resources/beta/subresources/threads/subresources/runs/methods/submit_tool_outputs)
Deprecated
POST/threads/{thread\_id}/runs/{run\_id}/submit\_tool\_outputs
##### [Cancel a run](/api/reference/resources/beta/subresources/threads/subresources/runs/methods/cancel)
Deprecated
POST/threads/{thread\_id}/runs/{run\_id}/cancel
##### ModelsExpand Collapse
RequiredActionFunctionToolCall object { id, function, type }
Tool call objects
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: object { arguments, name }
The function definition.
arguments: string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
Run object { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: object { reason }
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason: optional "max\_completion\_tokens" or "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: object { code, message }
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded" or "invalid\_prompt"
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
"server\_error"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_prompt"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
max\_completion\_tokens: number
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: object { submit\_tool\_outputs, type }
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: object { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: array of [RequiredActionFunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type }
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: object { arguments, name }
The function definition.
arguments: string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
type: "submit\_tool\_outputs"
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
response\_format: [AssistantResponseFormatOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: "queued" or "in\_progress" or "requires\_action" or 6 more
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 0>)
"in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 1>)
"requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 2>)
"cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 3>)
"cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 4>)
"failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 5>)
"completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 6>)
"incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 7>)
"expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 8>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or [FileSearchTool](</api/reference/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } or [FunctionTool](</api/reference/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
The list of tools that the [assistant](/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: object { type, last\_messages }
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" or "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages: optional number
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
completion\_tokens: number
Number of completion tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
temperature: optional number
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p: optional number
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.threads.runs > (model) run > (schema)>)
#### BetaThreadsRunsSteps
Build Assistants that can call models and use tools.
##### [List run steps](/api/reference/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/list)
Deprecated
GET/threads/{thread\_id}/runs/{run\_id}/steps
##### [Retrieve run step](/api/reference/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/retrieve)
Deprecated
GET/threads/{thread\_id}/runs/{run\_id}/steps/{step\_id}
##### ModelsExpand Collapse
CodeInterpreterLogs object { index, type, logs }
Text output from the Code Interpreter tool call as part of a run step.
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs: optional string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
CodeInterpreterOutputImage object { index, type, image }
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image: optional object { file\_id }
file\_id: optional string
The [file](/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
CodeInterpreterToolCall object { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: object { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: array of object { logs, type } or object { image, type }
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogOutput object { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
CodeInterpreterImageOutput object { image, type }
image: object { file\_id }
file\_id: string
The [file](/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
CodeInterpreterToolCallDelta object { index, type, id, code\_interpreter }
Details of the Code Interpreter tool call the run step was involved in.
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id: optional string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter: optional object { input, outputs }
The Code Interpreter tool call definition.
input: optional string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs: optional array of [CodeInterpreterLogs](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>) { index, type, logs } or [CodeInterpreterOutputImage](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>) { index, type, image }
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogs object { index, type, logs }
Text output from the Code Interpreter tool call as part of a run step.
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs: optional string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
CodeInterpreterOutputImage object { index, type, image }
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image: optional object { file\_id }
file\_id: optional string
The [file](/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
FileSearchToolCall object { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: object { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options: optional object { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: optional array of object { file\_id, file\_name, score, content }
The results of the file search.
file\_id: string
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: string
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: number
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: optional array of object { text, type }
The content of the result that was found. The content is only included if requested via the include query parameter.
text: optional string
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: optional "text"
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FileSearchToolCallDelta object { file\_search, index, type, id }
file\_search: unknown
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id: optional string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
FunctionToolCall object { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: object { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string
The output of the function. This will be `null` if the outputs have not been [submitted](/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
FunctionToolCallDelta object { index, type, id, function }
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id: optional string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function: optional object { arguments, name, output }
The definition of the function that was called.
arguments: optional string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name: optional string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output: optional string
The output of the function. This will be `null` if the outputs have not been [submitted](/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
MessageCreationStepDetails object { message\_creation, type }
Details of the message creation by the run step.
message\_creation: object { message\_id }
message\_id: string
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
RunStep object { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
expired\_at: number
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
last\_error: object { code, message }
The last error associated with this run step. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded"
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
"server\_error"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
object: "thread.run.step"
The object type, which is always `thread.run.step`.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
run\_id: string
The ID of the [run](/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
status: "in\_progress" or "cancelled" or "failed" or 2 more
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
"in\_progress"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
"cancelled"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
"failed"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
"completed"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
"expired"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
step\_details: [MessageCreationStepDetails](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>) { message\_creation, type } or [ToolCallsStepDetails](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>) { tool\_calls, type }
The details of the run step.
One of the following:
MessageCreationStepDetails object { message\_creation, type }
Details of the message creation by the run step.
message\_creation: object { message\_id }
message\_id: string
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
ToolCallsStepDetails object { tool\_calls, type }
Details of the tool call.
tool\_calls: array of [CodeInterpreterToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>) { id, code\_interpreter, type } or [FileSearchToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>) { id, file\_search, type } or [FunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>) { id, function, type }
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCall object { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: object { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: array of object { logs, type } or object { image, type }
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogOutput object { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
CodeInterpreterImageOutput object { image, type }
image: object { file\_id }
file\_id: string
The [file](/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
FileSearchToolCall object { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: object { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options: optional object { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: optional array of object { file\_id, file\_name, score, content }
The results of the file search.
file\_id: string
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: string
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: number
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: optional array of object { text, type }
The content of the result that was found. The content is only included if requested via the include query parameter.
text: optional string
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: optional "text"
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall object { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: object { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string
The output of the function. This will be `null` if the outputs have not been [submitted](/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
type: "tool\_calls"
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was run.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
type: "message\_creation" or "tool\_calls"
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
"message\_creation"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
"tool\_calls"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
completion\_tokens: number
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
RunStepDeltaEvent object { id, delta, object }
Represents a run step delta i.e. any changed fields on a run step during streaming.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) id>)
delta: object { step\_details }
The delta containing the fields that have changed on the run step.
step\_details: optional [RunStepDeltaMessageDelta](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>) { type, message\_creation } or [ToolCallDeltaObject](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>) { type, tool\_calls }
The details of the run step.
One of the following:
RunStepDeltaMessageDelta object { type, message\_creation }
Details of the message creation by the run step.
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
message\_creation: optional object { message\_id }
message\_id: optional string
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
ToolCallDeltaObject object { type, tool\_calls }
Details of the tool call.
type: "tool\_calls"
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
tool\_calls: optional array of [CodeInterpreterToolCallDelta](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>) { index, type, id, code\_interpreter } or [FileSearchToolCallDelta](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>) { file\_search, index, type, id } or [FunctionToolCallDelta](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>) { index, type, id, function }
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCallDelta object { index, type, id, code\_interpreter }
Details of the Code Interpreter tool call the run step was involved in.
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id: optional string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter: optional object { input, outputs }
The Code Interpreter tool call definition.
input: optional string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs: optional array of [CodeInterpreterLogs](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>) { index, type, logs } or [CodeInterpreterOutputImage](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>) { index, type, image }
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogs object { index, type, logs }
Text output from the Code Interpreter tool call as part of a run step.
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs: optional string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
CodeInterpreterOutputImage object { index, type, image }
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image: optional object { file\_id }
file\_id: optional string
The [file](/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
FileSearchToolCallDelta object { file\_search, index, type, id }
file\_search: unknown
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id: optional string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
FunctionToolCallDelta object { index, type, id, function }
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id: optional string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function: optional object { arguments, name, output }
The definition of the function that was called.
arguments: optional string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name: optional string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output: optional string
The output of the function. This will be `null` if the outputs have not been [submitted](/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta > (property) step_details>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta>)
object: "thread.run.step.delta"
The object type, which is always `thread.run.step.delta`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>)
RunStepDeltaMessageDelta object { type, message\_creation }
Details of the message creation by the run step.
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
message\_creation: optional object { message\_id }
message\_id: optional string
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
RunStepInclude = "step\_details.tool\_calls[\*].file\_search.results[\*].content"
[](<#(resource) beta.threads.runs.steps > (model) run_step_include > (schema)>)
ToolCallDeltaObject object { type, tool\_calls }
Details of the tool call.
type: "tool\_calls"
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
tool\_calls: optional array of [CodeInterpreterToolCallDelta](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>) { index, type, id, code\_interpreter } or [FileSearchToolCallDelta](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>) { file\_search, index, type, id } or [FunctionToolCallDelta](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>) { index, type, id, function }
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCallDelta object { index, type, id, code\_interpreter }
Details of the Code Interpreter tool call the run step was involved in.
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id: optional string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter: optional object { input, outputs }
The Code Interpreter tool call definition.
input: optional string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs: optional array of [CodeInterpreterLogs](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>) { index, type, logs } or [CodeInterpreterOutputImage](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>) { index, type, image }
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogs object { index, type, logs }
Text output from the Code Interpreter tool call as part of a run step.
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs: optional string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
CodeInterpreterOutputImage object { index, type, image }
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image: optional object { file\_id }
file\_id: optional string
The [file](/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
FileSearchToolCallDelta object { file\_search, index, type, id }
file\_search: unknown
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id: optional string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
FunctionToolCallDelta object { index, type, id, function }
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id: optional string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function: optional object { arguments, name, output }
The definition of the function that was called.
arguments: optional string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name: optional string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output: optional string
The output of the function. This will be `null` if the outputs have not been [submitted](/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
ToolCallsStepDetails object { tool\_calls, type }
Details of the tool call.
tool\_calls: array of [CodeInterpreterToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>) { id, code\_interpreter, type } or [FileSearchToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>) { id, file\_search, type } or [FunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>) { id, function, type }
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCall object { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: object { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: array of object { logs, type } or object { image, type }
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogOutput object { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
CodeInterpreterImageOutput object { image, type }
image: object { file\_id }
file\_id: string
The [file](/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
FileSearchToolCall object { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: object { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options: optional object { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: optional array of object { file\_id, file\_name, score, content }
The results of the file search.
file\_id: string
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: string
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: number
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: optional array of object { text, type }
The content of the result that was found. The content is only included if requested via the include query parameter.
text: optional string
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: optional "text"
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall object { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: object { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string
The output of the function. This will be `null` if the outputs have not been [submitted](/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
type: "tool\_calls"
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
#### BetaThreadsMessages
Build Assistants that can call models and use tools.
##### [List messages](/api/reference/resources/beta/subresources/threads/subresources/messages/methods/list)
Deprecated
GET/threads/{thread\_id}/messages
##### [Create message](/api/reference/resources/beta/subresources/threads/subresources/messages/methods/create)
Deprecated
POST/threads/{thread\_id}/messages
##### [Modify message](/api/reference/resources/beta/subresources/threads/subresources/messages/methods/update)
Deprecated
POST/threads/{thread\_id}/messages/{message\_id}
##### [Retrieve message](/api/reference/resources/beta/subresources/threads/subresources/messages/methods/retrieve)
Deprecated
GET/threads/{thread\_id}/messages/{message\_id}
##### [Delete message](/api/reference/resources/beta/subresources/threads/subresources/messages/methods/delete)
Deprecated
DELETE/threads/{thread\_id}/messages/{message\_id}
##### ModelsExpand Collapse
FileCitationAnnotation object { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: object { file\_id }
file\_id: string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
start\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
text: string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
type: "file\_citation"
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
FileCitationDeltaAnnotation object { index, type, end\_index, 3 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
index: number
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
type: "file\_citation"
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
end\_index: optional number
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
file\_citation: optional object { file\_id, quote }
file\_id: optional string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
quote: optional string
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
start\_index: optional number
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
text: optional string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
FilePathAnnotation object { end\_index, file\_path, start\_index, 2 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: object { file\_id }
file\_id: string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
start\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
text: string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
type: "file\_path"
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
FilePathDeltaAnnotation object { index, type, end\_index, 3 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
index: number
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
type: "file\_path"
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
end\_index: optional number
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
file\_path: optional object { file\_id }
file\_id: optional string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
start\_index: optional number
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
text: optional string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
ImageFile object { file\_id, detail }
file\_id: string
The [File](/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_file > (schema)>)
ImageFileContentBlock object { image\_file, type }
References an image [File](/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: "image\_file"
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
ImageFileDelta object { detail, file\_id }
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail>)
file\_id: optional string
The [File](/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)
ImageFileDeltaBlock object { index, type, image\_file }
References an image [File](/docs/api-reference/files) in the content of a message.
index: number
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
type: "image\_file"
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
image\_file: optional [ImageFileDelta](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>) { detail, file\_id }
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
ImageURL object { url, detail }
url: string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_url > (schema)>)
ImageURLContentBlock object { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: "image\_url"
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
ImageURLDelta object { detail, url }
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail>)
url: optional string
The URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)
ImageURLDeltaBlock object { index, type, image\_url }
References an image URL in the content of a message.
index: number
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
type: "image\_url"
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
image\_url: optional [ImageURLDelta](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>) { detail, url }
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
Message object { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) id>)
assistant\_id: string
If applicable, the ID of the [assistant](/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
attachments: array of object { file\_id, tools }
A list of files attached to the message, and the tools they were added to.
file\_id: optional string
The ID of the file to attach to the message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
tools: optional array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or object { type }
The tools to add this file to.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
completed\_at: number
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
content: array of [ImageFileContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>) { image\_file, type } or [ImageURLContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>) { image\_url, type } or [TextContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text_content_block > (schema)>) { text, type } or [RefusalContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>) { refusal, type }
The content of the message in array of text and/or images.
One of the following:
ImageFileContentBlock object { image\_file, type }
References an image [File](/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: "image\_file"
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
ImageURLContentBlock object { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: "image\_url"
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
TextContentBlock object { text, type }
The text content that is part of a message.
text: [Text](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
type: "text"
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
RefusalContentBlock object { refusal, type }
The refusal content generated by the assistant.
refusal: string
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
type: "refusal"
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) content>)
created\_at: number
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
incomplete\_at: number
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
incomplete\_details: object { reason }
On an incomplete message, details about why the message is incomplete.
reason: "content\_filter" or "max\_tokens" or "run\_cancelled" or 2 more
The reason the message is incomplete.
One of the following:
"content\_filter"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_tokens"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
"run\_cancelled"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 2>)
"run\_expired"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 3>)
"run\_failed"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 4>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
object: "thread.message"
The object type, which is always `thread.message`.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) object>)
role: "user" or "assistant"
The entity that produced the message. One of `user` or `assistant`.
One of the following:
"user"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role>)
run\_id: string
The ID of the [run](/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
status: "in\_progress" or "incomplete" or "completed"
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
"in\_progress"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status>)
thread\_id: string
The [thread](/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.threads.messages > (model) message > (schema)>)
MessageDeleted object { id, deleted, object }
id: string
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) deleted>)
object: "thread.message.deleted"
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
MessageDelta object { content, role }
The delta containing the fields that have changed on the Message.
content: optional array of [ImageFileDeltaBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>) { index, type, image\_file } or [TextDeltaBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text_delta_block > (schema)>) { index, type, text } or [RefusalDeltaBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>) { index, type, refusal } or [ImageURLDeltaBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>) { index, type, image\_url }
The content of the message in array of text and/or images.
One of the following:
ImageFileDeltaBlock object { index, type, image\_file }
References an image [File](/docs/api-reference/files) in the content of a message.
index: number
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
type: "image\_file"
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
image\_file: optional [ImageFileDelta](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>) { detail, file\_id }
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
TextDeltaBlock object { index, type, text }
The text content that is part of a message.
index: number
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
type: "text"
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
text: optional [TextDelta](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>) { annotations, value }
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
RefusalDeltaBlock object { index, type, refusal }
The refusal content that is part of a message.
index: number
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
type: "refusal"
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
refusal: optional string
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
ImageURLDeltaBlock object { index, type, image\_url }
References an image URL in the content of a message.
index: number
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
type: "image\_url"
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
image\_url: optional [ImageURLDelta](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>) { detail, url }
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) content>)
role: optional "user" or "assistant"
The entity that produced the message. One of `user` or `assistant`.
One of the following:
"user"
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema)>)
MessageDeltaEvent object { id, delta, object }
Represents a message delta i.e. any changed fields on a message during streaming.
id: string
The identifier of the message, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) id>)
delta: [MessageDelta](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message_delta > (schema)>) { content, role }
The delta containing the fields that have changed on the Message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta>)
object: "thread.message.delta"
The object type, which is always `thread.message.delta`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema)>)
RefusalContentBlock object { refusal, type }
The refusal content generated by the assistant.
refusal: string
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
type: "refusal"
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
RefusalDeltaBlock object { index, type, refusal }
The refusal content that is part of a message.
index: number
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
type: "refusal"
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
refusal: optional string
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
Text object { annotations, value }
annotations: array of [FileCitationAnnotation](</api/reference/resources/beta#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>) { end\_index, file\_citation, start\_index, 2 more } or [FilePathAnnotation](</api/reference/resources/beta#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>) { end\_index, file\_path, start\_index, 2 more }
One of the following:
FileCitationAnnotation object { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: object { file\_id }
file\_id: string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
start\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
text: string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
type: "file\_citation"
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
FilePathAnnotation object { end\_index, file\_path, start\_index, 2 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: object { file\_id }
file\_id: string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
start\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
text: string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
type: "file\_path"
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
value: string
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text > (schema)>)
TextContentBlock object { text, type }
The text content that is part of a message.
text: [Text](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
type: "text"
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
TextContentBlockParam object { text, type }
The text content that is part of a message.
text: string
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
type: "text"
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
TextDelta object { annotations, value }
annotations: optional array of [FileCitationDeltaAnnotation](</api/reference/resources/beta#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>) { index, type, end\_index, 3 more } or [FilePathDeltaAnnotation](</api/reference/resources/beta#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>) { index, type, end\_index, 3 more }
One of the following:
FileCitationDeltaAnnotation object { index, type, end\_index, 3 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
index: number
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
type: "file\_citation"
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
end\_index: optional number
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
file\_citation: optional object { file\_id, quote }
file\_id: optional string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
quote: optional string
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
start\_index: optional number
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
text: optional string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
FilePathDeltaAnnotation object { index, type, end\_index, 3 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
index: number
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
type: "file\_path"
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
end\_index: optional number
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
file\_path: optional object { file\_id }
file\_id: optional string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
start\_index: optional number
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
text: optional string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) annotations>)
value: optional string
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema)>)
TextDeltaBlock object { index, type, text }
The text content that is part of a message.
index: number
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
type: "text"
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
text: optional [TextDelta](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>) { annotations, value }
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)