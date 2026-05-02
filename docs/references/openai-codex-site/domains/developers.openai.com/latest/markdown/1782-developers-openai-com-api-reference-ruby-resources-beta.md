Beta | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Beta
#### BetaChatKit
##### ModelsExpand Collapse
class ChatKitWorkflow { id, state\_variables, tracing, version }
Workflow metadata and state returned for the session.
id: String
Identifier of the workflow backing the session.
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) id>)
state\_variables: Hash[Symbol, String | bool | Float]
State variable key-value pairs applied when invoking the workflow. Defaults to null when no overrides were provided.
One of the following:
String = String
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 0>)
UnionMember1 = bool
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 1>)
Float = Float
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 2>)
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables>)
tracing: Tracing{ enabled}
Tracing settings applied to the workflow.
enabled: bool
Indicates whether tracing is enabled.
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing > (property) enabled>)
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing>)
version: String
Specific workflow version used for the session. Defaults to null when using the latest deployment.
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) version>)
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema)>)
#### BetaChatKitSessions
##### [Cancel chat session](/api/reference/ruby/resources/beta/subresources/chatkit/subresources/sessions/methods/cancel)
beta.chatkit.sessions.cancel(session\_id) -\> [ChatSession](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chat_session > (schema)>) { id, chatkit\_configuration, client\_secret, 7 more }
POST/chatkit/sessions/{session\_id}/cancel
##### [Create ChatKit session](/api/reference/ruby/resources/beta/subresources/chatkit/subresources/sessions/methods/create)
beta.chatkit.sessions.create(\*\*kwargs) -\> [ChatSession](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chat_session > (schema)>) { id, chatkit\_configuration, client\_secret, 7 more }
POST/chatkit/sessions
#### BetaChatKitThreads
##### [List ChatKit thread items](/api/reference/ruby/resources/beta/subresources/chatkit/subresources/threads/methods/list_items)
beta.chatkit.threads.list\_items(thread\_id, \*\*kwargs) -\> ConversationCursorPage\<[ChatKitThreadUserMessageItem](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>) { id, attachments, content, 5 more } | [ChatKitThreadAssistantMessageItem](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>) { id, content, created\_at, 3 more } | [ChatKitWidgetItem](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>) { id, created\_at, object, 3 more } | 3 more\>
GET/chatkit/threads/{thread\_id}/items
##### [Retrieve ChatKit thread](/api/reference/ruby/resources/beta/subresources/chatkit/subresources/threads/methods/retrieve)
beta.chatkit.threads.retrieve(thread\_id) -\> [ChatKitThread](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>) { id, created\_at, object, 3 more }
GET/chatkit/threads/{thread\_id}
##### [Delete ChatKit thread](/api/reference/ruby/resources/beta/subresources/chatkit/subresources/threads/methods/delete)
beta.chatkit.threads.delete(thread\_id) -\> [ThreadDeleteResponse](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema)>) { id, deleted, object }
DELETE/chatkit/threads/{thread\_id}
##### [List ChatKit threads](/api/reference/ruby/resources/beta/subresources/chatkit/subresources/threads/methods/list)
beta.chatkit.threads.list(\*\*kwargs) -\> ConversationCursorPage\<[ChatKitThread](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>) { id, created\_at, object, 3 more } \>
GET/chatkit/threads
##### ModelsExpand Collapse
class ChatSession { id, chatkit\_configuration, client\_secret, 7 more }
Represents a ChatKit session and its resolved configuration.
id: String
Identifier for the ChatKit session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) id>)
chatkit\_configuration: [ChatSessionChatKitConfiguration](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema)>) { automatic\_thread\_titling, file\_upload, history }
Resolved ChatKit feature configuration for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration>)
client\_secret: String
Ephemeral client secret that authenticates session requests.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) client_secret>)
expires\_at: Integer
Unix timestamp (in seconds) for when the session expires.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) expires_at>)
max\_requests\_per\_1\_minute: Integer
Convenience copy of the per-minute request limit.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) max_requests_per_1_minute>)
object: :"chatkit.session"
Type discriminator that is always `chatkit.session`.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) object>)
rate\_limits: [ChatSessionRateLimits](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema)>) { max\_requests\_per\_1\_minute }
Resolved rate limit values.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) rate_limits>)
status: [ChatSessionStatus](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>)
Current lifecycle state of the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status>)
user: String
User identifier associated with the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) user>)
workflow: [ChatKitWorkflow](</api/reference/ruby/resources/beta#(resource) beta.chatkit > (model) chatkit_workflow > (schema)>) { id, state\_variables, tracing, version }
Workflow metadata for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema)>)
class ChatSessionAutomaticThreadTitling { enabled }
Automatic thread title preferences for the session.
enabled: bool
Whether automatic thread titling is enabled.
[](<#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema) > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema)>)
class ChatSessionChatKitConfiguration { automatic\_thread\_titling, file\_upload, history }
ChatKit configuration for the session.
automatic\_thread\_titling: [ChatSessionAutomaticThreadTitling](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema)>) { enabled }
Automatic thread titling preferences.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) automatic_thread_titling>)
file\_upload: [ChatSessionFileUpload](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema)>) { enabled, max\_file\_size, max\_files }
Upload settings for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload>)
history: [ChatSessionHistory](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_history > (schema)>) { enabled, recent\_threads }
History retention configuration.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) history>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema)>)
class ChatSessionChatKitConfigurationParam { automatic\_thread\_titling, file\_upload, history }
Optional per-session configuration settings for ChatKit behavior.
automatic\_thread\_titling: AutomaticThreadTitling{ enabled}
Configuration for automatic thread titling. When omitted, automatic thread titling is enabled by default.
enabled: bool
Enable automatic thread title generation. Defaults to true.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) automatic_thread_titling > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) automatic_thread_titling>)
file\_upload: FileUpload{ enabled, max\_file\_size, max\_files}
Configuration for upload enablement and limits. When omitted, uploads are disabled by default (max\_files 10, max\_file\_size 512 MB).
enabled: bool
Enable uploads for this session. Defaults to false.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) enabled>)
max\_file\_size: Integer
Maximum size in megabytes for each uploaded file. Defaults to 512 MB, which is the maximum allowable size.
maximum512
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) max_file_size>)
max\_files: Integer
Maximum number of files that can be uploaded to the session. Defaults to 10.
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) max_files>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload>)
history: History{ enabled, recent\_threads}
Configuration for chat history retention. When omitted, history is enabled by default with no limit on recent\_threads (null).
enabled: bool
Enables chat users to access previous ChatKit threads. Defaults to true.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history > (property) enabled>)
recent\_threads: Integer
Number of recent ChatKit threads users have access to. Defaults to unlimited when unset.
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history > (property) recent_threads>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema)>)
class ChatSessionExpiresAfterParam { anchor, seconds }
Controls when the session expires relative to an anchor timestamp.
anchor: :created\_at
Base timestamp used to calculate expiration. Currently fixed to `created\_at`.
[](<#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema) > (property) anchor>)
seconds: Integer
Number of seconds after the anchor when the session expires.
maximum600
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema) > (property) seconds>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema)>)
class ChatSessionFileUpload { enabled, max\_file\_size, max\_files }
Upload permissions and limits applied to the session.
enabled: bool
Indicates if uploads are enabled for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) enabled>)
max\_file\_size: Integer
Maximum upload size in megabytes.
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_file_size>)
max\_files: Integer
Maximum number of uploads allowed during the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_files>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema)>)
class ChatSessionHistory { enabled, recent\_threads }
History retention preferences returned for the session.
enabled: bool
Indicates if chat history is persisted for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) enabled>)
recent\_threads: Integer
Number of prior threads surfaced in history views. Defaults to null when all history is retained.
[](<#(resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) recent_threads>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_history > (schema)>)
class ChatSessionRateLimits { max\_requests\_per\_1\_minute }
Active per-minute request limit for the session.
max\_requests\_per\_1\_minute: Integer
Maximum allowed requests per one-minute window.
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema) > (property) max_requests_per_1_minute>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema)>)
class ChatSessionRateLimitsParam { max\_requests\_per\_1\_minute }
Controls request rate limits for the session.
max\_requests\_per\_1\_minute: Integer
Maximum number of requests allowed per minute for the session. Defaults to 10.
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits_param > (schema) > (property) max_requests_per_1_minute>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits_param > (schema)>)
ChatSessionStatus = :active | :expired | :cancelled
One of the following:
:active
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 0>)
:expired
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 1>)
:cancelled
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>)
class ChatSessionWorkflowParam { id, state\_variables, tracing, version }
Workflow reference and overrides applied to the chat session.
id: String
Identifier for the workflow invoked by the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) id>)
state\_variables: Hash[Symbol, String | bool | Float]
State variables forwarded to the workflow. Keys may be up to 64 characters, values must be primitive types, and the map defaults to an empty object.
One of the following:
String = String
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 0>)
UnionMember1 = bool
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 1>)
Float = Float
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables>)
tracing: Tracing{ enabled}
Optional tracing overrides for the workflow invocation. When omitted, tracing is enabled by default.
enabled: bool
Whether tracing is enabled during the session. Defaults to true.
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) tracing > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) tracing>)
version: String
Specific workflow version to run. Defaults to the latest deployed version.
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) version>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema)>)
class ChatKitAttachment { id, mime\_type, name, 2 more }
Attachment metadata included on thread items.
id: String
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
mime\_type: String
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
name: String
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
preview\_url: String
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
type: :image | :file
Attachment discriminator.
One of the following:
:image
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
:file
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>)
class ChatKitResponseOutputText { annotations, text, type }
Assistant response text accompanied by optional annotations.
annotations: Array[File{ source, type} | URL{ source, type}]
Ordered list of annotations attached to the response text.
One of the following:
class File { source, type }
Annotation that references an uploaded file.
source: Source{ filename, type}
File attachment referenced by the annotation.
filename: String
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
type: :file
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
type: :file
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
class URL { source, type }
Annotation that references a URL.
source: Source{ type, url}
URL referenced by the annotation.
type: :url
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
url: String
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
type: :url
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
text: String
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
type: :output\_text
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>)
class ChatKitThread { id, created\_at, object, 3 more }
Represents a ChatKit thread and its current status.
id: String
Identifier of the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (in seconds) for when the thread was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) created_at>)
object: :"chatkit.thread"
Type discriminator that is always `chatkit.thread`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) object>)
status: Active{ type} | Locked{ reason, type} | Closed{ reason, type}
Current status for the thread. Defaults to `active` for newly created threads.
One of the following:
class Active { type }
Indicates that a thread is active.
type: :active
Status discriminator that is always `active`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0>)
class Locked { reason, type }
Indicates that a thread is locked and cannot accept new input.
reason: String
Reason that the thread was locked. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) reason>)
type: :locked
Status discriminator that is always `locked`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1>)
class Closed { reason, type }
Indicates that a thread has been closed.
reason: String
Reason that the thread was closed. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) reason>)
type: :closed
Status discriminator that is always `closed`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status>)
title: String
Optional human-readable title for the thread. Defaults to null when no title has been generated.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) title>)
user: String
Free-form string that identifies your end user who owns the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) user>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>)
class ChatKitThreadAssistantMessageItem { id, content, created\_at, 3 more }
Assistant-authored message within a thread.
id: String
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) id>)
content: Array[[ChatKitResponseOutputText](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>) { annotations, text, type } ]
Ordered assistant response segments.
annotations: Array[File{ source, type} | URL{ source, type}]
Ordered list of annotations attached to the response text.
One of the following:
class File { source, type }
Annotation that references an uploaded file.
source: Source{ filename, type}
File attachment referenced by the annotation.
filename: String
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
type: :file
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
type: :file
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
class URL { source, type }
Annotation that references a URL.
source: Source{ type, url}
URL referenced by the annotation.
type: :url
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
url: String
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
type: :url
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
text: String
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
type: :output\_text
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) content>)
created\_at: Integer
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) created_at>)
object: :"chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) object>)
thread\_id: String
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) thread_id>)
type: :"chatkit.assistant\_message"
Type discriminator that is always `chatkit.assistant\_message`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>)
class ChatKitThreadItemList { data, first\_id, has\_more, 2 more }
A paginated list of thread items rendered for the ChatKit API.
data: Array[[ChatKitThreadUserMessageItem](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>) { id, attachments, content, 5 more } | [ChatKitThreadAssistantMessageItem](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>) { id, content, created\_at, 3 more } | [ChatKitWidgetItem](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>) { id, created\_at, object, 3 more } | 3 more]
A list of items
One of the following:
class ChatKitThreadUserMessageItem { id, attachments, content, 5 more }
User-authored messages within a thread.
id: String
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) id>)
attachments: Array[[ChatKitAttachment](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>) { id, mime\_type, name, 2 more } ]
Attachments associated with the user message. Defaults to an empty list.
id: String
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
mime\_type: String
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
name: String
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
preview\_url: String
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
type: :image | :file
Attachment discriminator.
One of the following:
:image
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
:file
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) attachments>)
content: Array[InputText{ text, type} | QuotedText{ text, type}]
Ordered content elements supplied by the user.
One of the following:
class InputText { text, type }
Text block that a user contributed to the thread.
text: String
Plain-text content supplied by the user.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) text>)
type: :input\_text
Type discriminator that is always `input\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0>)
class QuotedText { text, type }
Quoted snippet that the user referenced in their message.
text: String
Quoted text content.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) text>)
type: :quoted\_text
Type discriminator that is always `quoted\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content>)
created\_at: Integer
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) created_at>)
inference\_options: InferenceOptions{ model, tool\_choice}
Inference overrides applied to the message. Defaults to null when unset.
model: String
Model name that generated the response. Defaults to null when using the session default.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) model>)
tool\_choice: ToolChoice{ id}
Preferred tool to invoke. Defaults to null when ChatKit should auto-select.
id: String
Identifier of the requested tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice > (property) id>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options>)
object: :"chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) object>)
thread\_id: String
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) thread_id>)
type: :"chatkit.user\_message"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>)
class ChatKitThreadAssistantMessageItem { id, content, created\_at, 3 more }
Assistant-authored message within a thread.
id: String
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) id>)
content: Array[[ChatKitResponseOutputText](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>) { annotations, text, type } ]
Ordered assistant response segments.
annotations: Array[File{ source, type} | URL{ source, type}]
Ordered list of annotations attached to the response text.
One of the following:
class File { source, type }
Annotation that references an uploaded file.
source: Source{ filename, type}
File attachment referenced by the annotation.
filename: String
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
type: :file
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
type: :file
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
class URL { source, type }
Annotation that references a URL.
source: Source{ type, url}
URL referenced by the annotation.
type: :url
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
url: String
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
type: :url
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
text: String
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
type: :output\_text
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) content>)
created\_at: Integer
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) created_at>)
object: :"chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) object>)
thread\_id: String
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) thread_id>)
type: :"chatkit.assistant\_message"
Type discriminator that is always `chatkit.assistant\_message`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>)
class ChatKitWidgetItem { id, created\_at, object, 3 more }
Thread item that renders a widget payload.
id: String
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) created_at>)
object: :"chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) object>)
thread\_id: String
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) thread_id>)
type: :"chatkit.widget"
Type discriminator that is always `chatkit.widget`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) type>)
widget: String
Serialized widget payload rendered in the UI.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) widget>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>)
class ChatKitClientToolCall { id, arguments, call\_id, 7 more }
Record of a client side tool invocation initiated by the assistant.
id: String
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) id>)
arguments: String
JSON-encoded arguments that were sent to the tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) arguments>)
call\_id: String
Identifier for the client tool call.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) call_id>)
created\_at: Integer
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) created_at>)
name: String
Tool name that was invoked.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) name>)
object: :"chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) object>)
output: String
JSON-encoded output captured from the tool. Defaults to null while execution is in progress.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) output>)
status: :in\_progress | :completed
Execution status for the tool call.
One of the following:
:in\_progress
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 0>)
:completed
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status>)
thread\_id: String
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) thread_id>)
type: :"chatkit.client\_tool\_call"
Type discriminator that is always `chatkit.client\_tool\_call`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3>)
class ChatKitTask { id, created\_at, heading, 5 more }
Task emitted by the workflow to show progress and status updates.
id: String
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) id>)
created\_at: Integer
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) created_at>)
heading: String
Optional heading for the task. Defaults to null when not provided.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) heading>)
object: :"chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) object>)
summary: String
Optional summary that describes the task. Defaults to null when omitted.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) summary>)
task\_type: :custom | :thought
Subtype for the task.
One of the following:
:custom
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type > (member) 0>)
:thought
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type>)
thread\_id: String
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) thread_id>)
type: :"chatkit.task"
Type discriminator that is always `chatkit.task`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4>)
class ChatKitTaskGroup { id, created\_at, object, 3 more }
Collection of workflow tasks grouped together in the thread.
id: String
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) id>)
created\_at: Integer
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) created_at>)
object: :"chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) object>)
tasks: Array[Task{ heading, summary, type}]
Tasks included in the group.
heading: String
Optional heading for the grouped task. Defaults to null when not provided.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) heading>)
summary: String
Optional summary that describes the grouped task. Defaults to null when omitted.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) summary>)
type: :custom | :thought
Subtype for the grouped task.
One of the following:
:custom
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type > (member) 0>)
:thought
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks>)
thread\_id: String
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) thread_id>)
type: :"chatkit.task\_group"
Type discriminator that is always `chatkit.task\_group`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data>)
first\_id: String
The ID of the first item in the list.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) first_id>)
has\_more: bool
Whether there are more items available.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) has_more>)
last\_id: String
The ID of the last item in the list.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) last_id>)
object: :list
The type of object returned, must be `list`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) object>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema)>)
class ChatKitThreadUserMessageItem { id, attachments, content, 5 more }
User-authored messages within a thread.
id: String
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) id>)
attachments: Array[[ChatKitAttachment](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>) { id, mime\_type, name, 2 more } ]
Attachments associated with the user message. Defaults to an empty list.
id: String
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
mime\_type: String
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
name: String
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
preview\_url: String
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
type: :image | :file
Attachment discriminator.
One of the following:
:image
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
:file
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) attachments>)
content: Array[InputText{ text, type} | QuotedText{ text, type}]
Ordered content elements supplied by the user.
One of the following:
class InputText { text, type }
Text block that a user contributed to the thread.
text: String
Plain-text content supplied by the user.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) text>)
type: :input\_text
Type discriminator that is always `input\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0>)
class QuotedText { text, type }
Quoted snippet that the user referenced in their message.
text: String
Quoted text content.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) text>)
type: :quoted\_text
Type discriminator that is always `quoted\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content>)
created\_at: Integer
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) created_at>)
inference\_options: InferenceOptions{ model, tool\_choice}
Inference overrides applied to the message. Defaults to null when unset.
model: String
Model name that generated the response. Defaults to null when using the session default.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) model>)
tool\_choice: ToolChoice{ id}
Preferred tool to invoke. Defaults to null when ChatKit should auto-select.
id: String
Identifier of the requested tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice > (property) id>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options>)
object: :"chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) object>)
thread\_id: String
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) thread_id>)
type: :"chatkit.user\_message"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>)
class ChatKitWidgetItem { id, created\_at, object, 3 more }
Thread item that renders a widget payload.
id: String
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) created_at>)
object: :"chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) object>)
thread\_id: String
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) thread_id>)
type: :"chatkit.widget"
Type discriminator that is always `chatkit.widget`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) type>)
widget: String
Serialized widget payload rendered in the UI.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) widget>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>)
class ThreadDeleteResponse { id, deleted, object }
Confirmation payload returned after deleting a thread.
id: String
Identifier of the deleted thread.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) id>)
deleted: bool
Indicates that the thread has been deleted.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) deleted>)
object: :"chatkit.thread.deleted"
Type discriminator that is always `chatkit.thread.deleted`.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) object>)
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema)>)
#### BetaAssistants
Build Assistants that can call models and use tools.
##### [List assistants](/api/reference/ruby/resources/beta/subresources/assistants/methods/list)
Deprecated
beta.assistants.list(\*\*kwargs) -\> CursorPage\<[Assistant](</api/reference/ruby/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>) { id, created\_at, description, 10 more } \>
GET/assistants
##### [Create assistant](/api/reference/ruby/resources/beta/subresources/assistants/methods/create)
Deprecated
beta.assistants.create(\*\*kwargs) -\> [Assistant](</api/reference/ruby/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>) { id, created\_at, description, 10 more }
POST/assistants
##### [Retrieve assistant](/api/reference/ruby/resources/beta/subresources/assistants/methods/retrieve)
Deprecated
beta.assistants.retrieve(assistant\_id) -\> [Assistant](</api/reference/ruby/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>) { id, created\_at, description, 10 more }
GET/assistants/{assistant\_id}
##### [Modify assistant](/api/reference/ruby/resources/beta/subresources/assistants/methods/update)
Deprecated
beta.assistants.update(assistant\_id, \*\*kwargs) -\> [Assistant](</api/reference/ruby/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>) { id, created\_at, description, 10 more }
POST/assistants/{assistant\_id}
##### [Delete assistant](/api/reference/ruby/resources/beta/subresources/assistants/methods/delete)
Deprecated
beta.assistants.delete(assistant\_id) -\> [AssistantDeleted](</api/reference/ruby/resources/beta#(resource) beta.assistants > (model) assistant_deleted > (schema)>) { id, deleted, object }
DELETE/assistants/{assistant\_id}
##### ModelsExpand Collapse
class Assistant { id, created\_at, description, 10 more }
Represents an `assistant` that can call the model and use tools.
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) for when the assistant was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) created_at>)
description: String
The description of the assistant. The maximum length is 512 characters.
maxLength512
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) description>)
instructions: String
The system instructions that the assistant uses. The maximum length is 256,000 characters.
maxLength256000
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) instructions>)
metadata: [Metadata](</api/reference/ruby/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) metadata>)
model: String
ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) model>)
name: String
The name of the assistant. The maximum length is 256 characters.
maxLength256
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) name>)
object: :assistant
The object type, which is always `assistant`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) object>)
tools: Array[[AssistantTool](</api/reference/ruby/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)]
A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterTool { type }
type: :code\_interpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class FileSearchTool { type, file\_search }
type: :file\_search
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: FileSearch{ max\_num\_results, ranking\_options}
Overrides for the file search tool.
max\_num\_results: Integer
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: RankingOptions{ score\_threshold, ranker}
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: Float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: :auto | :default\_2024\_08\_21
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
:auto
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
:default\_2024\_08\_21
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
class FunctionTool { function, type }
function: [FunctionDefinition](</api/reference/ruby/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: :function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tools>)
response\_format: [AssistantResponseFormatOption](</api/reference/ruby/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format>)
temperature: Float
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
minimum0
maximum2
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) temperature>)
tool\_resources: ToolResources{ code\_interpreter, file\_search}
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: CodeInterpreter{ file\_ids}
file\_ids: Array[String]
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter“ tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter>)
file\_search: FileSearch{ vector\_store\_ids}
vector\_store\_ids: Array[String]
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources>)
top\_p: Float
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant > (schema)>)
class AssistantDeleted { id, deleted, object }
id: String
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) deleted>)
object: :"assistant.deleted"
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema)>)
AssistantStreamEvent = ThreadCreated{ data, event, enabled} | ThreadRunCreated{ data, event} | ThreadRunQueued{ data, event} | 21 more
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
in your code. See the [Assistants API quickstart](https://platform.openai.com/docs/assistants/overview) to learn how to
integrate the Assistants API with streaming.
One of the following:
class ThreadCreated { data, event, enabled }
Occurs when a new [thread](https://platform.openai.com/docs/api-reference/threads/object) is created.
data: [Thread](</api/reference/ruby/resources/beta#(resource) beta.threads > (model) thread > (schema)>) { id, created\_at, metadata, 2 more }
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data>)
event: :"thread.created"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) event>)
enabled: bool
Whether to enable input audio transcription.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) enabled>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0>)
class ThreadRunCreated { data, event }
Occurs when a new [run](https://platform.openai.com/docs/api-reference/runs/object) is created.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data>)
event: :"thread.run.created"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1>)
class ThreadRunQueued { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `queued` status.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data>)
event: :"thread.run.queued"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2>)
class ThreadRunInProgress { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to an `in\_progress` status.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data>)
event: :"thread.run.in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3>)
class ThreadRunRequiresAction { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `requires\_action` status.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data>)
event: :"thread.run.requires\_action"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4>)
class ThreadRunCompleted { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is completed.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data>)
event: :"thread.run.completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5>)
class ThreadRunIncomplete { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) ends with status `incomplete`.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data>)
event: :"thread.run.incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6>)
class ThreadRunFailed { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) fails.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data>)
event: :"thread.run.failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7>)
class ThreadRunCancelling { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `cancelling` status.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data>)
event: :"thread.run.cancelling"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8>)
class ThreadRunCancelled { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is cancelled.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data>)
event: :"thread.run.cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9>)
class ThreadRunExpired { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) expires.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data>)
event: :"thread.run.expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10>)
class ThreadRunStepCreated { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is created.
data: [RunStep](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data>)
event: :"thread.run.step.created"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11>)
class ThreadRunStepInProgress { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) moves to an `in\_progress` state.
data: [RunStep](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data>)
event: :"thread.run.step.in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12>)
class ThreadRunStepDelta { data, event }
Occurs when parts of a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) are being streamed.
data: [RunStepDeltaEvent](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>) { id, delta, object }
Represents a run step delta i.e. any changed fields on a run step during streaming.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data>)
event: :"thread.run.step.delta"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13>)
class ThreadRunStepCompleted { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is completed.
data: [RunStep](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data>)
event: :"thread.run.step.completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14>)
class ThreadRunStepFailed { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) fails.
data: [RunStep](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data>)
event: :"thread.run.step.failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15>)
class ThreadRunStepCancelled { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is cancelled.
data: [RunStep](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data>)
event: :"thread.run.step.cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16>)
class ThreadRunStepExpired { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) expires.
data: [RunStep](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data>)
event: :"thread.run.step.expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17>)
class ThreadMessageCreated { data, event }
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is created.
data: [Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data>)
event: :"thread.message.created"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18>)
class ThreadMessageInProgress { data, event }
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) moves to an `in\_progress` state.
data: [Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data>)
event: :"thread.message.in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19>)
class ThreadMessageDelta { data, event }
Occurs when parts of a [Message](https://platform.openai.com/docs/api-reference/messages/object) are being streamed.
data: [MessageDeltaEvent](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message_delta_event > (schema)>) { id, delta, object }
Represents a message delta i.e. any changed fields on a message during streaming.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) data>)
event: :"thread.message.delta"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20>)
class ThreadMessageCompleted { data, event }
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is completed.
data: [Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data>)
event: :"thread.message.completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21>)
class ThreadMessageIncomplete { data, event }
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) ends before it is completed.
data: [Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data>)
event: :"thread.message.incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22>)
class ErrorEvent { data, event }
Occurs when an [error](https://platform.openai.com/docs/guides/error-codes#api-errors) occurs. This can happen due to an internal server error or a timeout.
data: [ErrorObject](</api/reference/ruby/resources/$shared#(resource) $shared > (model) error_object > (schema)>) { code, message, param, type }
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data>)
event: :error
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema)>)
AssistantTool = [CodeInterpreterTool](</api/reference/ruby/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } | [FileSearchTool](</api/reference/ruby/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } | [FunctionTool](</api/reference/ruby/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
One of the following:
class CodeInterpreterTool { type }
type: :code\_interpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class FileSearchTool { type, file\_search }
type: :file\_search
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: FileSearch{ max\_num\_results, ranking\_options}
Overrides for the file search tool.
max\_num\_results: Integer
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: RankingOptions{ score\_threshold, ranker}
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: Float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: :auto | :default\_2024\_08\_21
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
:auto
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
:default\_2024\_08\_21
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
class FunctionTool { function, type }
function: [FunctionDefinition](</api/reference/ruby/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: :function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_tool > (schema)>)
class CodeInterpreterTool { type }
type: :code\_interpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class FileSearchTool { type, file\_search }
type: :file\_search
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: FileSearch{ max\_num\_results, ranking\_options}
Overrides for the file search tool.
max\_num\_results: Integer
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: RankingOptions{ score\_threshold, ranker}
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: Float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: :auto | :default\_2024\_08\_21
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
:auto
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
:default\_2024\_08\_21
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
class FunctionTool { function, type }
function: [FunctionDefinition](</api/reference/ruby/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: :function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
MessageStreamEvent = ThreadMessageCreated{ data, event} | ThreadMessageInProgress{ data, event} | ThreadMessageDelta{ data, event} | 2 more
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is created.
One of the following:
class ThreadMessageCreated { data, event }
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is created.
data: [Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0 > (property) data>)
event: :"thread.message.created"
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0>)
class ThreadMessageInProgress { data, event }
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) moves to an `in\_progress` state.
data: [Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1 > (property) data>)
event: :"thread.message.in\_progress"
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1>)
class ThreadMessageDelta { data, event }
Occurs when parts of a [Message](https://platform.openai.com/docs/api-reference/messages/object) are being streamed.
data: [MessageDeltaEvent](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message_delta_event > (schema)>) { id, delta, object }
Represents a message delta i.e. any changed fields on a message during streaming.
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2 > (property) data>)
event: :"thread.message.delta"
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2>)
class ThreadMessageCompleted { data, event }
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is completed.
data: [Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3 > (property) data>)
event: :"thread.message.completed"
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3>)
class ThreadMessageIncomplete { data, event }
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) ends before it is completed.
data: [Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4 > (property) data>)
event: :"thread.message.incomplete"
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema)>)
RunStepStreamEvent = ThreadRunStepCreated{ data, event} | ThreadRunStepInProgress{ data, event} | ThreadRunStepDelta{ data, event} | 4 more
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is created.
One of the following:
class ThreadRunStepCreated { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is created.
data: [RunStep](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0 > (property) data>)
event: :"thread.run.step.created"
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0>)
class ThreadRunStepInProgress { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) moves to an `in\_progress` state.
data: [RunStep](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1 > (property) data>)
event: :"thread.run.step.in\_progress"
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1>)
class ThreadRunStepDelta { data, event }
Occurs when parts of a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) are being streamed.
data: [RunStepDeltaEvent](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>) { id, delta, object }
Represents a run step delta i.e. any changed fields on a run step during streaming.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2 > (property) data>)
event: :"thread.run.step.delta"
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2>)
class ThreadRunStepCompleted { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is completed.
data: [RunStep](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3 > (property) data>)
event: :"thread.run.step.completed"
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3>)
class ThreadRunStepFailed { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) fails.
data: [RunStep](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4 > (property) data>)
event: :"thread.run.step.failed"
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4>)
class ThreadRunStepCancelled { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is cancelled.
data: [RunStep](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5 > (property) data>)
event: :"thread.run.step.cancelled"
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5>)
class ThreadRunStepExpired { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) expires.
data: [RunStep](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6 > (property) data>)
event: :"thread.run.step.expired"
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema)>)
RunStreamEvent = ThreadRunCreated{ data, event} | ThreadRunQueued{ data, event} | ThreadRunInProgress{ data, event} | 7 more
Occurs when a new [run](https://platform.openai.com/docs/api-reference/runs/object) is created.
One of the following:
class ThreadRunCreated { data, event }
Occurs when a new [run](https://platform.openai.com/docs/api-reference/runs/object) is created.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0 > (property) data>)
event: :"thread.run.created"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0>)
class ThreadRunQueued { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `queued` status.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1 > (property) data>)
event: :"thread.run.queued"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1>)
class ThreadRunInProgress { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to an `in\_progress` status.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2 > (property) data>)
event: :"thread.run.in\_progress"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2>)
class ThreadRunRequiresAction { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `requires\_action` status.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3 > (property) data>)
event: :"thread.run.requires\_action"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3>)
class ThreadRunCompleted { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is completed.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4 > (property) data>)
event: :"thread.run.completed"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4>)
class ThreadRunIncomplete { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) ends with status `incomplete`.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5 > (property) data>)
event: :"thread.run.incomplete"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5>)
class ThreadRunFailed { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) fails.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6 > (property) data>)
event: :"thread.run.failed"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6>)
class ThreadRunCancelling { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `cancelling` status.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7 > (property) data>)
event: :"thread.run.cancelling"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7>)
class ThreadRunCancelled { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is cancelled.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8 > (property) data>)
event: :"thread.run.cancelled"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8>)
class ThreadRunExpired { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) expires.
data: [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9 > (property) data>)
event: :"thread.run.expired"
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema)>)
class ThreadStreamEvent { data, event, enabled }
Occurs when a new [thread](https://platform.openai.com/docs/api-reference/threads/object) is created.
data: [Thread](</api/reference/ruby/resources/beta#(resource) beta.threads > (model) thread > (schema)>) { id, created\_at, metadata, 2 more }
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) data>)
event: :"thread.created"
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) event>)
enabled: bool
Whether to enable input audio transcription.
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) enabled>)
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema)>)
#### BetaThreads
Build Assistants that can call models and use tools.
##### [Create thread](/api/reference/ruby/resources/beta/subresources/threads/methods/create)
Deprecated
beta.threads.create(\*\*kwargs) -\> [Thread](</api/reference/ruby/resources/beta#(resource) beta.threads > (model) thread > (schema)>) { id, created\_at, metadata, 2 more }
POST/threads
##### [Create thread and run](/api/reference/ruby/resources/beta/subresources/threads/methods/create_and_run)
Deprecated
beta.threads.create\_and\_run(\*\*kwargs) -\> [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
POST/threads/runs
##### [Retrieve thread](/api/reference/ruby/resources/beta/subresources/threads/methods/retrieve)
Deprecated
beta.threads.retrieve(thread\_id) -\> [Thread](</api/reference/ruby/resources/beta#(resource) beta.threads > (model) thread > (schema)>) { id, created\_at, metadata, 2 more }
GET/threads/{thread\_id}
##### [Modify thread](/api/reference/ruby/resources/beta/subresources/threads/methods/update)
Deprecated
beta.threads.update(thread\_id, \*\*kwargs) -\> [Thread](</api/reference/ruby/resources/beta#(resource) beta.threads > (model) thread > (schema)>) { id, created\_at, metadata, 2 more }
POST/threads/{thread\_id}
##### [Delete thread](/api/reference/ruby/resources/beta/subresources/threads/methods/delete)
Deprecated
beta.threads.delete(thread\_id) -\> [ThreadDeleted](</api/reference/ruby/resources/beta#(resource) beta.threads > (model) thread_deleted > (schema)>) { id, deleted, object }
DELETE/threads/{thread\_id}
##### ModelsExpand Collapse
AssistantResponseFormatOption = :auto | [ResponseFormatText](</api/reference/ruby/resources/$shared#(resource) $shared > (model) response_format_text > (schema)>) { type } | [ResponseFormatJSONObject](</api/reference/ruby/resources/$shared#(resource) $shared > (model) response_format_json_object > (schema)>) { type } | [ResponseFormatJSONSchema](</api/reference/ruby/resources/$shared#(resource) $shared > (model) response_format_json_schema > (schema)>) { json\_schema, type }
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
AssistantResponseFormatOption = :auto
`auto` is the default value
[](<#(resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
class ResponseFormatText { type }
Default response format. Used to generate text responses.
type: :text
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
class ResponseFormatJSONObject { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: :json\_object
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
class ResponseFormatJSONSchema { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
json\_schema: JSONSchema{ name, description, schema, strict}
Structured Outputs configuration options, including a JSON Schema.
name: String
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: String
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: Hash[Symbol, untyped]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: bool
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: :json\_schema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
class AssistantToolChoice { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: :function | :code\_interpreter | :file\_search
The type of the tool. If type is `function`, the function name must be set
One of the following:
:function
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
:code\_interpreter
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
:file\_search
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: [AssistantToolChoiceFunction](</api/reference/ruby/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema)>)
class AssistantToolChoiceFunction { name }
name: String
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)
AssistantToolChoiceOption = :none | :auto | :required | [AssistantToolChoice](</api/reference/ruby/resources/beta#(resource) beta.threads > (model) assistant_tool_choice > (schema)>) { type, function }
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
Auto = :none | :auto | :required
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
:none
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
:auto
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
:required
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
class AssistantToolChoice { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: :function | :code\_interpreter | :file\_search
The type of the tool. If type is `function`, the function name must be set
One of the following:
:function
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
:code\_interpreter
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
:file\_search
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: [AssistantToolChoiceFunction](</api/reference/ruby/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
class Thread { id, created\_at, metadata, 2 more }
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) for when the thread was created.
formatunixtime
[](<#(resource) beta.threads > (model) thread > (schema) > (property) created_at>)
metadata: [Metadata](</api/reference/ruby/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) metadata>)
object: :thread
The object type, which is always `thread`.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) object>)
tool\_resources: ToolResources{ code\_interpreter, file\_search}
A set of resources that are made available to the assistant’s tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: CodeInterpreter{ file\_ids}
file\_ids: Array[String]
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter>)
file\_search: FileSearch{ vector\_store\_ids}
vector\_store\_ids: Array[String]
The [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources>)
[](<#(resource) beta.threads > (model) thread > (schema)>)
class ThreadDeleted { id, deleted, object }
id: String
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) deleted>)
object: :"thread.deleted"
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads > (model) thread_deleted > (schema)>)
#### BetaThreadsRuns
Build Assistants that can call models and use tools.
##### [List runs](/api/reference/ruby/resources/beta/subresources/threads/subresources/runs/methods/list)
Deprecated
beta.threads.runs.list(thread\_id, \*\*kwargs) -\> CursorPage\<[Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more } \>
GET/threads/{thread\_id}/runs
##### [Create run](/api/reference/ruby/resources/beta/subresources/threads/subresources/runs/methods/create)
Deprecated
beta.threads.runs.create(thread\_id, \*\*kwargs) -\> [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
POST/threads/{thread\_id}/runs
##### [Retrieve run](/api/reference/ruby/resources/beta/subresources/threads/subresources/runs/methods/retrieve)
Deprecated
beta.threads.runs.retrieve(run\_id, \*\*kwargs) -\> [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
GET/threads/{thread\_id}/runs/{run\_id}
##### [Modify run](/api/reference/ruby/resources/beta/subresources/threads/subresources/runs/methods/update)
Deprecated
beta.threads.runs.update(run\_id, \*\*kwargs) -\> [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
POST/threads/{thread\_id}/runs/{run\_id}
##### [Submit tool outputs to run](/api/reference/ruby/resources/beta/subresources/threads/subresources/runs/methods/submit_tool_outputs)
Deprecated
beta.threads.runs.submit\_tool\_outputs(run\_id, \*\*kwargs) -\> [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
POST/threads/{thread\_id}/runs/{run\_id}/submit\_tool\_outputs
##### [Cancel a run](/api/reference/ruby/resources/beta/subresources/threads/subresources/runs/methods/cancel)
Deprecated
beta.threads.runs.cancel(run\_id, \*\*kwargs) -\> [Run](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
POST/threads/{thread\_id}/runs/{run\_id}/cancel
##### ModelsExpand Collapse
class RequiredActionFunctionToolCall { id, function, type }
Tool call objects
id: String
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: Function{ arguments, name}
The function definition.
arguments: String
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: String
The name of the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: :function
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
class Run { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: String
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: Integer
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: Integer
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: Integer
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: Integer
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: Integer
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: IncompleteDetails{ reason}
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason: :max\_completion\_tokens | :max\_prompt\_tokens
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
:max\_completion\_tokens
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
:max\_prompt\_tokens
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: String
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: LastError{ code, message}
The last error associated with this run. Will be `null` if there are no errors.
code: :server\_error | :rate\_limit\_exceeded | :invalid\_prompt
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
:server\_error
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
:rate\_limit\_exceeded
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
:invalid\_prompt
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
message: String
A human-readable description of the error.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
max\_completion\_tokens: Integer
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: Integer
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/ruby/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: String
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: :"thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: bool
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: RequiredAction{ submit\_tool\_outputs, type}
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: SubmitToolOutputs{ tool\_calls}
Details on the tool outputs needed for this run to continue.
tool\_calls: Array[[RequiredActionFunctionToolCall](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type } ]
A list of the relevant tool calls.
id: String
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: Function{ arguments, name}
The function definition.
arguments: String
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: String
The name of the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: :function
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
type: :submit\_tool\_outputs
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
response\_format: [AssistantResponseFormatOption](</api/reference/ruby/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: Integer
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: [RunStatus](</api/reference/ruby/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: String
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/ruby/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: Array[[AssistantTool](</api/reference/ruby/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)]
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
class CodeInterpreterTool { type }
type: :code\_interpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class FileSearchTool { type, file\_search }
type: :file\_search
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: FileSearch{ max\_num\_results, ranking\_options}
Overrides for the file search tool.
max\_num\_results: Integer
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: RankingOptions{ score\_threshold, ranker}
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: Float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: :auto | :default\_2024\_08\_21
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
:auto
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
:default\_2024\_08\_21
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
class FunctionTool { function, type }
function: [FunctionDefinition](</api/reference/ruby/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: :function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: TruncationStrategy{ type, last\_messages}
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: :auto | :last\_messages
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
:auto
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
:last\_messages
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages: Integer
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: Usage{ completion\_tokens, prompt\_tokens, total\_tokens}
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
completion\_tokens: Integer
Number of completion tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: Integer
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: Integer
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
temperature: Float
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p: Float
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.threads.runs > (model) run > (schema)>)
RunStatus = :queued | :in\_progress | :requires\_action | 6 more
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
:queued
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
:in\_progress
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
:requires\_action
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
:cancelling
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
:cancelled
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
:failed
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
:completed
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
:incomplete
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
:expired
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.threads.runs > (model) run_status > (schema)>)
#### BetaThreadsRunsSteps
Build Assistants that can call models and use tools.
##### [List run steps](/api/reference/ruby/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/list)
Deprecated
beta.threads.runs.steps.list(run\_id, \*\*kwargs) -\> CursorPage\<[RunStep](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more } \>
GET/threads/{thread\_id}/runs/{run\_id}/steps
##### [Retrieve run step](/api/reference/ruby/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/retrieve)
Deprecated
beta.threads.runs.steps.retrieve(step\_id, \*\*kwargs) -\> [RunStep](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
GET/threads/{thread\_id}/runs/{run\_id}/steps/{step\_id}
##### ModelsExpand Collapse
class CodeInterpreterLogs { index, type, logs }
Text output from the Code Interpreter tool call as part of a run step.
index: Integer
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: :logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs: String
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage { index, type, image }
index: Integer
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: :image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image: Image{ file\_id}
file\_id: String
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
class CodeInterpreterToolCall { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: String
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter{ input, outputs}
The Code Interpreter tool call definition.
input: String
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: Array[Logs{ logs, type} | Image{ image, type}]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class Logs { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: String
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: :logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
class Image { image, type }
image: Image{ file\_id}
file\_id: String
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: :image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: :code\_interpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
class CodeInterpreterToolCallDelta { index, type, id, code\_interpreter }
Details of the Code Interpreter tool call the run step was involved in.
index: Integer
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: :code\_interpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id: String
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter: CodeInterpreter{ input, outputs}
The Code Interpreter tool call definition.
input: String
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs: Array[[CodeInterpreterLogs](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>) { index, type, logs } | [CodeInterpreterOutputImage](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>) { index, type, image } ]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterLogs { index, type, logs }
Text output from the Code Interpreter tool call as part of a run step.
index: Integer
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: :logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs: String
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage { index, type, image }
index: Integer
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: :image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image: Image{ file\_id}
file\_id: String
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
class FileSearchToolCall { id, file\_search, type }
id: String
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch{ ranking\_options, results}
For now, this is always going to be an empty object.
ranking\_options: RankingOptions{ ranker, score\_threshold}
The ranking options for the file search.
ranker: :auto | :default\_2024\_08\_21
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
:auto
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
:default\_2024\_08\_21
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: Float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: Array[Result{ file\_id, file\_name, score, content}]
The results of the file search.
file\_id: String
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: String
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: Float
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: Array[Content{ text, type}]
The content of the result that was found. The content is only included if requested via the include query parameter.
text: String
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: :text
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: :file\_search
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
class FileSearchToolCallDelta { file\_search, index, type, id }
file\_search: untyped
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: Integer
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: :file\_search
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id: String
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
class FunctionToolCall { id, function, type }
id: String
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function{ arguments, name, output}
The definition of the function that was called.
arguments: String
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: String
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: String
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: :function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
class FunctionToolCallDelta { index, type, id, function }
index: Integer
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: :function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id: String
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function: Function{ arguments, name, output}
The definition of the function that was called.
arguments: String
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name: String
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output: String
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
class MessageCreationStepDetails { message\_creation, type }
Details of the message creation by the run step.
message\_creation: MessageCreation{ message\_id}
message\_id: String
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: :message\_creation
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
class RunStep { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
id: String
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
assistant\_id: String
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
cancelled\_at: Integer
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
completed\_at: Integer
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
created\_at: Integer
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
expired\_at: Integer
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
failed\_at: Integer
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
last\_error: LastError{ code, message}
The last error associated with this run step. Will be `null` if there are no errors.
code: :server\_error | :rate\_limit\_exceeded
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
:server\_error
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
:rate\_limit\_exceeded
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
message: String
A human-readable description of the error.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
metadata: [Metadata](</api/reference/ruby/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
object: :"thread.run.step"
The object type, which is always `thread.run.step`.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
run\_id: String
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
status: :in\_progress | :cancelled | :failed | 2 more
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
:in\_progress
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
:cancelled
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
:failed
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
:completed
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
:expired
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
step\_details: [MessageCreationStepDetails](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>) { message\_creation, type } | [ToolCallsStepDetails](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>) { tool\_calls, type }
The details of the run step.
One of the following:
class MessageCreationStepDetails { message\_creation, type }
Details of the message creation by the run step.
message\_creation: MessageCreation{ message\_id}
message\_id: String
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: :message\_creation
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
class ToolCallsStepDetails { tool\_calls, type }
Details of the tool call.
tool\_calls: Array[[ToolCall](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)]
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterToolCall { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: String
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter{ input, outputs}
The Code Interpreter tool call definition.
input: String
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: Array[Logs{ logs, type} | Image{ image, type}]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class Logs { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: String
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: :logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
class Image { image, type }
image: Image{ file\_id}
file\_id: String
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: :image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: :code\_interpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
class FileSearchToolCall { id, file\_search, type }
id: String
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch{ ranking\_options, results}
For now, this is always going to be an empty object.
ranking\_options: RankingOptions{ ranker, score\_threshold}
The ranking options for the file search.
ranker: :auto | :default\_2024\_08\_21
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
:auto
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
:default\_2024\_08\_21
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: Float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: Array[Result{ file\_id, file\_name, score, content}]
The results of the file search.
file\_id: String
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: String
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: Float
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: Array[Content{ text, type}]
The content of the result that was found. The content is only included if requested via the include query parameter.
text: String
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: :text
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: :file\_search
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
class FunctionToolCall { id, function, type }
id: String
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function{ arguments, name, output}
The definition of the function that was called.
arguments: String
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: String
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: String
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: :function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
type: :tool\_calls
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
thread\_id: String
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
type: :message\_creation | :tool\_calls
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
:message\_creation
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
:tool\_calls
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
usage: Usage{ completion\_tokens, prompt\_tokens, total\_tokens}
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
completion\_tokens: Integer
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: Integer
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: Integer
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
class RunStepDelta { step\_details }
The delta containing the fields that have changed on the run step.
step\_details: [RunStepDeltaMessageDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>) { type, message\_creation } | [ToolCallDeltaObject](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>) { type, tool\_calls }
The details of the run step.
One of the following:
class RunStepDeltaMessageDelta { type, message\_creation }
Details of the message creation by the run step.
type: :message\_creation
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
message\_creation: MessageCreation{ message\_id}
message\_id: String
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
class ToolCallDeltaObject { type, tool\_calls }
Details of the tool call.
type: :tool\_calls
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
tool\_calls: Array[[ToolCallDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)]
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterToolCallDelta { index, type, id, code\_interpreter }
Details of the Code Interpreter tool call the run step was involved in.
index: Integer
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: :code\_interpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id: String
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter: CodeInterpreter{ input, outputs}
The Code Interpreter tool call definition.
input: String
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs: Array[[CodeInterpreterLogs](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>) { index, type, logs } | [CodeInterpreterOutputImage](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>) { index, type, image } ]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterLogs { index, type, logs }
Text output from the Code Interpreter tool call as part of a run step.
index: Integer
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: :logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs: String
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage { index, type, image }
index: Integer
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: :image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image: Image{ file\_id}
file\_id: String
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
class FileSearchToolCallDelta { file\_search, index, type, id }
file\_search: untyped
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: Integer
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: :file\_search
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id: String
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
class FunctionToolCallDelta { index, type, id, function }
index: Integer
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: :function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id: String
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function: Function{ arguments, name, output}
The definition of the function that was called.
arguments: String
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name: String
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output: String
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema) > (property) step_details>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema)>)
class RunStepDeltaEvent { id, delta, object }
Represents a run step delta i.e. any changed fields on a run step during streaming.
id: String
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) id>)
delta: [RunStepDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema)>) { step\_details }
The delta containing the fields that have changed on the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta>)
object: :"thread.run.step.delta"
The object type, which is always `thread.run.step.delta`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>)
class RunStepDeltaMessageDelta { type, message\_creation }
Details of the message creation by the run step.
type: :message\_creation
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
message\_creation: MessageCreation{ message\_id}
message\_id: String
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
RunStepInclude = :"step\_details.tool\_calls[\*].file\_search.results[\*].content"
[](<#(resource) beta.threads.runs.steps > (model) run_step_include > (schema)>)
ToolCall = [CodeInterpreterToolCall](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>) { id, code\_interpreter, type } | [FileSearchToolCall](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>) { id, file\_search, type } | [FunctionToolCall](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>) { id, function, type }
Details of the Code Interpreter tool call the run step was involved in.
One of the following:
class CodeInterpreterToolCall { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: String
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter{ input, outputs}
The Code Interpreter tool call definition.
input: String
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: Array[Logs{ logs, type} | Image{ image, type}]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class Logs { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: String
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: :logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
class Image { image, type }
image: Image{ file\_id}
file\_id: String
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: :image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: :code\_interpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
class FileSearchToolCall { id, file\_search, type }
id: String
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch{ ranking\_options, results}
For now, this is always going to be an empty object.
ranking\_options: RankingOptions{ ranker, score\_threshold}
The ranking options for the file search.
ranker: :auto | :default\_2024\_08\_21
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
:auto
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
:default\_2024\_08\_21
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: Float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: Array[Result{ file\_id, file\_name, score, content}]
The results of the file search.
file\_id: String
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: String
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: Float
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: Array[Content{ text, type}]
The content of the result that was found. The content is only included if requested via the include query parameter.
text: String
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: :text
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: :file\_search
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
class FunctionToolCall { id, function, type }
id: String
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function{ arguments, name, output}
The definition of the function that was called.
arguments: String
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: String
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: String
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: :function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
ToolCallDelta = [CodeInterpreterToolCallDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>) { index, type, id, code\_interpreter } | [FileSearchToolCallDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>) { file\_search, index, type, id } | [FunctionToolCallDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>) { index, type, id, function }
Details of the Code Interpreter tool call the run step was involved in.
One of the following:
class CodeInterpreterToolCallDelta { index, type, id, code\_interpreter }
Details of the Code Interpreter tool call the run step was involved in.
index: Integer
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: :code\_interpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id: String
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter: CodeInterpreter{ input, outputs}
The Code Interpreter tool call definition.
input: String
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs: Array[[CodeInterpreterLogs](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>) { index, type, logs } | [CodeInterpreterOutputImage](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>) { index, type, image } ]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterLogs { index, type, logs }
Text output from the Code Interpreter tool call as part of a run step.
index: Integer
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: :logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs: String
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage { index, type, image }
index: Integer
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: :image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image: Image{ file\_id}
file\_id: String
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
class FileSearchToolCallDelta { file\_search, index, type, id }
file\_search: untyped
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: Integer
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: :file\_search
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id: String
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
class FunctionToolCallDelta { index, type, id, function }
index: Integer
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: :function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id: String
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function: Function{ arguments, name, output}
The definition of the function that was called.
arguments: String
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name: String
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output: String
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)
class ToolCallDeltaObject { type, tool\_calls }
Details of the tool call.
type: :tool\_calls
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
tool\_calls: Array[[ToolCallDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)]
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterToolCallDelta { index, type, id, code\_interpreter }
Details of the Code Interpreter tool call the run step was involved in.
index: Integer
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: :code\_interpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id: String
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter: CodeInterpreter{ input, outputs}
The Code Interpreter tool call definition.
input: String
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs: Array[[CodeInterpreterLogs](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>) { index, type, logs } | [CodeInterpreterOutputImage](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>) { index, type, image } ]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterLogs { index, type, logs }
Text output from the Code Interpreter tool call as part of a run step.
index: Integer
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: :logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs: String
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage { index, type, image }
index: Integer
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: :image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image: Image{ file\_id}
file\_id: String
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
class FileSearchToolCallDelta { file\_search, index, type, id }
file\_search: untyped
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: Integer
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: :file\_search
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id: String
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
class FunctionToolCallDelta { index, type, id, function }
index: Integer
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: :function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id: String
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function: Function{ arguments, name, output}
The definition of the function that was called.
arguments: String
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name: String
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output: String
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
class ToolCallsStepDetails { tool\_calls, type }
Details of the tool call.
tool\_calls: Array[[ToolCall](</api/reference/ruby/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)]
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterToolCall { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: String
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter{ input, outputs}
The Code Interpreter tool call definition.
input: String
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: Array[Logs{ logs, type} | Image{ image, type}]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class Logs { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: String
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: :logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
class Image { image, type }
image: Image{ file\_id}
file\_id: String
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: :image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: :code\_interpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
class FileSearchToolCall { id, file\_search, type }
id: String
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch{ ranking\_options, results}
For now, this is always going to be an empty object.
ranking\_options: RankingOptions{ ranker, score\_threshold}
The ranking options for the file search.
ranker: :auto | :default\_2024\_08\_21
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
:auto
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
:default\_2024\_08\_21
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: Float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: Array[Result{ file\_id, file\_name, score, content}]
The results of the file search.
file\_id: String
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: String
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: Float
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: Array[Content{ text, type}]
The content of the result that was found. The content is only included if requested via the include query parameter.
text: String
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: :text
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: :file\_search
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
class FunctionToolCall { id, function, type }
id: String
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function{ arguments, name, output}
The definition of the function that was called.
arguments: String
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: String
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: String
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: :function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
type: :tool\_calls
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
#### BetaThreadsMessages
Build Assistants that can call models and use tools.
##### [List messages](/api/reference/ruby/resources/beta/subresources/threads/subresources/messages/methods/list)
Deprecated
beta.threads.messages.list(thread\_id, \*\*kwargs) -\> CursorPage\<[Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more } \>
GET/threads/{thread\_id}/messages
##### [Create message](/api/reference/ruby/resources/beta/subresources/threads/subresources/messages/methods/create)
Deprecated
beta.threads.messages.create(thread\_id, \*\*kwargs) -\> [Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
POST/threads/{thread\_id}/messages
##### [Modify message](/api/reference/ruby/resources/beta/subresources/threads/subresources/messages/methods/update)
Deprecated
beta.threads.messages.update(message\_id, \*\*kwargs) -\> [Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
POST/threads/{thread\_id}/messages/{message\_id}
##### [Retrieve message](/api/reference/ruby/resources/beta/subresources/threads/subresources/messages/methods/retrieve)
Deprecated
beta.threads.messages.retrieve(message\_id, \*\*kwargs) -\> [Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
GET/threads/{thread\_id}/messages/{message\_id}
##### [Delete message](/api/reference/ruby/resources/beta/subresources/threads/subresources/messages/methods/delete)
Deprecated
beta.threads.messages.delete(message\_id, \*\*kwargs) -\> [MessageDeleted](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message_deleted > (schema)>) { id, deleted, object }
DELETE/threads/{thread\_id}/messages/{message\_id}
##### ModelsExpand Collapse
Annotation = [FileCitationAnnotation](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>) { end\_index, file\_citation, start\_index, 2 more } | [FilePathAnnotation](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>) { end\_index, file\_path, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
One of the following:
class FileCitationAnnotation { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation{ file\_id}
file\_id: String
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
type: :file\_citation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FilePathAnnotation { end\_index, file\_path, start\_index, 2 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: FilePath{ file\_id}
file\_id: String
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
type: :file\_path
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) annotation > (schema)>)
AnnotationDelta = [FileCitationDeltaAnnotation](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>) { index, type, end\_index, 3 more } | [FilePathDeltaAnnotation](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>) { index, type, end\_index, 3 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
One of the following:
class FileCitationDeltaAnnotation { index, type, end\_index, 3 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
index: Integer
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
type: :file\_citation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation{ file\_id, quote}
file\_id: String
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
quote: String
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathDeltaAnnotation { index, type, end\_index, 3 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
index: Integer
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
type: :file\_path
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
file\_path: FilePath{ file\_id}
file\_id: String
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)
class FileCitationAnnotation { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation{ file\_id}
file\_id: String
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
type: :file\_citation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FileCitationDeltaAnnotation { index, type, end\_index, 3 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
index: Integer
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
type: :file\_citation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation{ file\_id, quote}
file\_id: String
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
quote: String
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathAnnotation { end\_index, file\_path, start\_index, 2 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: FilePath{ file\_id}
file\_id: String
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
type: :file\_path
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
class FilePathDeltaAnnotation { index, type, end\_index, 3 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
index: Integer
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
type: :file\_path
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
file\_path: FilePath{ file\_id}
file\_id: String
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
class ImageFile { file\_id, detail }
file\_id: String
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
detail: :auto | :low | :high
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
:auto
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
:low
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
:high
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_file > (schema)>)
class ImageFileContentBlock { image\_file, type }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: :image\_file
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageFileDelta { detail, file\_id }
detail: :auto | :low | :high
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
:auto
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 0>)
:low
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 1>)
:high
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail>)
file\_id: String
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)
class ImageFileDeltaBlock { index, type, image\_file }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
type: :image\_file
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
image\_file: [ImageFileDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>) { detail, file\_id }
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class ImageURL { url, detail }
url: String
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
detail: :auto | :low | :high
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
:auto
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
:low
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
:high
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_url > (schema)>)
class ImageURLContentBlock { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: :image\_url
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class ImageURLDelta { detail, url }
detail: :auto | :low | :high
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
:auto
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 0>)
:low
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 1>)
:high
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail>)
url: String
The URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)
class ImageURLDeltaBlock { index, type, image\_url }
References an image URL in the content of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
type: :image\_url
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
image\_url: [ImageURLDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>) { detail, url }
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
class Message { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) id>)
assistant\_id: String
If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
attachments: Array[Attachment{ file\_id, tools}]
A list of files attached to the message, and the tools they were added to.
file\_id: String
The ID of the file to attach to the message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
tools: Array[[CodeInterpreterTool](</api/reference/ruby/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } | AssistantToolsFileSearchTypeOnly{ type}]
The tools to add this file to.
One of the following:
class CodeInterpreterTool { type }
type: :code\_interpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class AssistantToolsFileSearchTypeOnly { type }
type: :file\_search
The type of tool being defined: `file\_search`
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
completed\_at: Integer
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
content: Array[[MessageContent](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)]
The content of the message in array of text and/or images.
One of the following:
class ImageFileContentBlock { image\_file, type }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: :image\_file
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageURLContentBlock { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: :image\_url
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlock { text, type }
The text content that is part of a message.
text: [Text](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
type: :text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class RefusalContentBlock { refusal, type }
The refusal content generated by the assistant.
refusal: String
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
type: :refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) content>)
created\_at: Integer
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
incomplete\_at: Integer
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
incomplete\_details: IncompleteDetails{ reason}
On an incomplete message, details about why the message is incomplete.
reason: :content\_filter | :max\_tokens | :run\_cancelled | 2 more
The reason the message is incomplete.
One of the following:
:content\_filter
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
:max\_tokens
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
:run\_cancelled
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 2>)
:run\_expired
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 3>)
:run\_failed
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 4>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details>)
metadata: [Metadata](</api/reference/ruby/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
object: :"thread.message"
The object type, which is always `thread.message`.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) object>)
role: :user | :assistant
The entity that produced the message. One of `user` or `assistant`.
One of the following:
:user
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
:assistant
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role>)
run\_id: String
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
status: :in\_progress | :incomplete | :completed
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
:in\_progress
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
:incomplete
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
:completed
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status>)
thread\_id: String
The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.threads.messages > (model) message > (schema)>)
MessageContent = [ImageFileContentBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>) { image\_file, type } | [ImageURLContentBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>) { image\_url, type } | [TextContentBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text_content_block > (schema)>) { text, type } | [RefusalContentBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>) { refusal, type }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
One of the following:
class ImageFileContentBlock { image\_file, type }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: :image\_file
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageURLContentBlock { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: :image\_url
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlock { text, type }
The text content that is part of a message.
text: [Text](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
type: :text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class RefusalContentBlock { refusal, type }
The refusal content generated by the assistant.
refusal: String
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
type: :refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content > (schema)>)
MessageContentDelta = [ImageFileDeltaBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>) { index, type, image\_file } | [TextDeltaBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text_delta_block > (schema)>) { index, type, text } | [RefusalDeltaBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>) { index, type, refusal } | [ImageURLDeltaBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>) { index, type, image\_url }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
One of the following:
class ImageFileDeltaBlock { index, type, image\_file }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
type: :image\_file
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
image\_file: [ImageFileDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>) { detail, file\_id }
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class TextDeltaBlock { index, type, text }
The text content that is part of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
type: :text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
text: [TextDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>) { annotations, value }
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
class RefusalDeltaBlock { index, type, refusal }
The refusal content that is part of a message.
index: Integer
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
type: :refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
refusal: String
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class ImageURLDeltaBlock { index, type, image\_url }
References an image URL in the content of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
type: :image\_url
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
image\_url: [ImageURLDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>) { detail, url }
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)
MessageContentPartParam = [ImageFileContentBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>) { image\_file, type } | [ImageURLContentBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>) { image\_url, type } | [TextContentBlockParam](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>) { text, type }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
One of the following:
class ImageFileContentBlock { image\_file, type }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: :image\_file
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageURLContentBlock { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: :image\_url
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlockParam { text, type }
The text content that is part of a message.
text: String
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
type: :text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content_part_param > (schema)>)
class MessageDeleted { id, deleted, object }
id: String
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) deleted>)
object: :"thread.message.deleted"
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
class MessageDelta { content, role }
The delta containing the fields that have changed on the Message.
content: Array[[MessageContentDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)]
The content of the message in array of text and/or images.
One of the following:
class ImageFileDeltaBlock { index, type, image\_file }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
type: :image\_file
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
image\_file: [ImageFileDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>) { detail, file\_id }
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class TextDeltaBlock { index, type, text }
The text content that is part of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
type: :text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
text: [TextDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>) { annotations, value }
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
class RefusalDeltaBlock { index, type, refusal }
The refusal content that is part of a message.
index: Integer
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
type: :refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
refusal: String
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class ImageURLDeltaBlock { index, type, image\_url }
References an image URL in the content of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
type: :image\_url
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
image\_url: [ImageURLDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>) { detail, url }
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) content>)
role: :user | :assistant
The entity that produced the message. One of `user` or `assistant`.
One of the following:
:user
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 0>)
:assistant
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema)>)
class MessageDeltaEvent { id, delta, object }
Represents a message delta i.e. any changed fields on a message during streaming.
id: String
The identifier of the message, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) id>)
delta: [MessageDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message_delta > (schema)>) { content, role }
The delta containing the fields that have changed on the Message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta>)
object: :"thread.message.delta"
The object type, which is always `thread.message.delta`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema)>)
class RefusalContentBlock { refusal, type }
The refusal content generated by the assistant.
refusal: String
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
type: :refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
class RefusalDeltaBlock { index, type, refusal }
The refusal content that is part of a message.
index: Integer
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
type: :refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
refusal: String
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class Text { annotations, value }
annotations: Array[[Annotation](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)]
One of the following:
class FileCitationAnnotation { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation{ file\_id}
file\_id: String
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
type: :file\_citation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FilePathAnnotation { end\_index, file\_path, start\_index, 2 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: FilePath{ file\_id}
file\_id: String
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
type: :file\_path
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
value: String
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text > (schema)>)
class TextContentBlock { text, type }
The text content that is part of a message.
text: [Text](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
type: :text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class TextContentBlockParam { text, type }
The text content that is part of a message.
text: String
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
type: :text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
class TextDelta { annotations, value }
annotations: Array[[AnnotationDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)]
One of the following:
class FileCitationDeltaAnnotation { index, type, end\_index, 3 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
index: Integer
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
type: :file\_citation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation{ file\_id, quote}
file\_id: String
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
quote: String
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathDeltaAnnotation { index, type, end\_index, 3 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
index: Integer
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
type: :file\_path
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
file\_path: FilePath{ file\_id}
file\_id: String
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) annotations>)
value: String
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema)>)
class TextDeltaBlock { index, type, text }
The text content that is part of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
type: :text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
text: [TextDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>) { annotations, value }
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)