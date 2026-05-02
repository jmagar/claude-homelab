Threads | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Beta](/api/reference/ruby/resources/beta)
[ChatKit](/api/reference/ruby/resources/beta/subresources/chatkit)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Threads
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