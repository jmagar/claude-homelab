Beta | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Beta
#### BetaChatKit
##### ModelsExpand Collapse
class ChatKitWorkflow: …
Workflow metadata and state returned for the session.
id: str
Identifier of the workflow backing the session.
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) id>)
state\_variables: Optional[Dict[str, Union[str, bool, float]]]
State variable key-value pairs applied when invoking the workflow. Defaults to null when no overrides were provided.
One of the following:
str
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 0>)
bool
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 1>)
float
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 2>)
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables>)
tracing: Tracing
Tracing settings applied to the workflow.
enabled: bool
Indicates whether tracing is enabled.
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing > (property) enabled>)
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing>)
version: Optional[str]
Specific workflow version used for the session. Defaults to null when using the latest deployment.
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) version>)
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema)>)
#### BetaChatKitSessions
##### [Cancel chat session](/api/reference/python/resources/beta/subresources/chatkit/subresources/sessions/methods/cancel)
beta.chatkit.sessions.cancel(strsession\_id) -\> [ChatSession](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) chat_session > (schema)>)
POST/chatkit/sessions/{session\_id}/cancel
##### [Create ChatKit session](/api/reference/python/resources/beta/subresources/chatkit/subresources/sessions/methods/create)
beta.chatkit.sessions.create(SessionCreateParams\*\*kwargs) -\> [ChatSession](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) chat_session > (schema)>)
POST/chatkit/sessions
#### BetaChatKitThreads
##### [List ChatKit thread items](/api/reference/python/resources/beta/subresources/chatkit/subresources/threads/methods/list_items)
beta.chatkit.threads.list\_items(strthread\_id, ThreadListItemsParams\*\*kwargs) -\> SyncConversationCursorPage[Data]
GET/chatkit/threads/{thread\_id}/items
##### [Retrieve ChatKit thread](/api/reference/python/resources/beta/subresources/chatkit/subresources/threads/methods/retrieve)
beta.chatkit.threads.retrieve(strthread\_id) -\> [ChatKitThread](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>)
GET/chatkit/threads/{thread\_id}
##### [Delete ChatKit thread](/api/reference/python/resources/beta/subresources/chatkit/subresources/threads/methods/delete)
beta.chatkit.threads.delete(strthread\_id) -\> [ThreadDeleteResponse](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema)>)
DELETE/chatkit/threads/{thread\_id}
##### [List ChatKit threads](/api/reference/python/resources/beta/subresources/chatkit/subresources/threads/methods/list)
beta.chatkit.threads.list(ThreadListParams\*\*kwargs) -\> SyncConversationCursorPage[[ChatKitThread](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>)]
GET/chatkit/threads
##### ModelsExpand Collapse
class ChatSession: …
Represents a ChatKit session and its resolved configuration.
id: str
Identifier for the ChatKit session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) id>)
chatkit\_configuration: [ChatSessionChatKitConfiguration](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema)>)
Resolved ChatKit feature configuration for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration>)
client\_secret: str
Ephemeral client secret that authenticates session requests.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) client_secret>)
expires\_at: int
Unix timestamp (in seconds) for when the session expires.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) expires_at>)
max\_requests\_per\_1\_minute: int
Convenience copy of the per-minute request limit.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) max_requests_per_1_minute>)
object: Literal["chatkit.session"]
Type discriminator that is always `chatkit.session`.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) object>)
rate\_limits: [ChatSessionRateLimits](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema)>)
Resolved rate limit values.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) rate_limits>)
status: [ChatSessionStatus](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>)
Current lifecycle state of the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status>)
user: str
User identifier associated with the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) user>)
workflow: [ChatKitWorkflow](</api/reference/python/resources/beta#(resource) beta.chatkit > (model) chatkit_workflow > (schema)>)
Workflow metadata for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema)>)
class ChatSessionAutomaticThreadTitling: …
Automatic thread title preferences for the session.
enabled: bool
Whether automatic thread titling is enabled.
[](<#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema) > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema)>)
class ChatSessionChatKitConfiguration: …
ChatKit configuration for the session.
automatic\_thread\_titling: [ChatSessionAutomaticThreadTitling](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema)>)
Automatic thread titling preferences.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) automatic_thread_titling>)
file\_upload: [ChatSessionFileUpload](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema)>)
Upload settings for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload>)
history: [ChatSessionHistory](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_history > (schema)>)
History retention configuration.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) history>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema)>)
class ChatSessionChatKitConfigurationParam: …
Optional per-session configuration settings for ChatKit behavior.
automatic\_thread\_titling: Optional[AutomaticThreadTitling]
Configuration for automatic thread titling. When omitted, automatic thread titling is enabled by default.
enabled: Optional[bool]
Enable automatic thread title generation. Defaults to true.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) automatic_thread_titling > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) automatic_thread_titling>)
file\_upload: Optional[FileUpload]
Configuration for upload enablement and limits. When omitted, uploads are disabled by default (max\_files 10, max\_file\_size 512 MB).
enabled: Optional[bool]
Enable uploads for this session. Defaults to false.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) enabled>)
max\_file\_size: Optional[int]
Maximum size in megabytes for each uploaded file. Defaults to 512 MB, which is the maximum allowable size.
maximum512
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) max_file_size>)
max\_files: Optional[int]
Maximum number of files that can be uploaded to the session. Defaults to 10.
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) max_files>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload>)
history: Optional[History]
Configuration for chat history retention. When omitted, history is enabled by default with no limit on recent\_threads (null).
enabled: Optional[bool]
Enables chat users to access previous ChatKit threads. Defaults to true.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history > (property) enabled>)
recent\_threads: Optional[int]
Number of recent ChatKit threads users have access to. Defaults to unlimited when unset.
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history > (property) recent_threads>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema)>)
class ChatSessionExpiresAfterParam: …
Controls when the session expires relative to an anchor timestamp.
anchor: Literal["created\_at"]
Base timestamp used to calculate expiration. Currently fixed to `created\_at`.
[](<#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema) > (property) anchor>)
seconds: int
Number of seconds after the anchor when the session expires.
maximum600
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema) > (property) seconds>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema)>)
class ChatSessionFileUpload: …
Upload permissions and limits applied to the session.
enabled: bool
Indicates if uploads are enabled for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) enabled>)
max\_file\_size: Optional[int]
Maximum upload size in megabytes.
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_file_size>)
max\_files: Optional[int]
Maximum number of uploads allowed during the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_files>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema)>)
class ChatSessionHistory: …
History retention preferences returned for the session.
enabled: bool
Indicates if chat history is persisted for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) enabled>)
recent\_threads: Optional[int]
Number of prior threads surfaced in history views. Defaults to null when all history is retained.
[](<#(resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) recent_threads>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_history > (schema)>)
class ChatSessionRateLimits: …
Active per-minute request limit for the session.
max\_requests\_per\_1\_minute: int
Maximum allowed requests per one-minute window.
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema) > (property) max_requests_per_1_minute>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema)>)
class ChatSessionRateLimitsParam: …
Controls request rate limits for the session.
max\_requests\_per\_1\_minute: Optional[int]
Maximum number of requests allowed per minute for the session. Defaults to 10.
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits_param > (schema) > (property) max_requests_per_1_minute>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits_param > (schema)>)
Literal["active", "expired", "cancelled"]
One of the following:
"active"
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 0>)
"expired"
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 1>)
"cancelled"
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>)
class ChatSessionWorkflowParam: …
Workflow reference and overrides applied to the chat session.
id: str
Identifier for the workflow invoked by the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) id>)
state\_variables: Optional[Dict[str, Union[str, bool, float]]]
State variables forwarded to the workflow. Keys may be up to 64 characters, values must be primitive types, and the map defaults to an empty object.
One of the following:
str
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 0>)
bool
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 1>)
float
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables>)
tracing: Optional[Tracing]
Optional tracing overrides for the workflow invocation. When omitted, tracing is enabled by default.
enabled: Optional[bool]
Whether tracing is enabled during the session. Defaults to true.
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) tracing > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) tracing>)
version: Optional[str]
Specific workflow version to run. Defaults to the latest deployed version.
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) version>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema)>)
class ChatKitAttachment: …
Attachment metadata included on thread items.
id: str
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
mime\_type: str
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
name: str
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
preview\_url: Optional[str]
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
type: Literal["image", "file"]
Attachment discriminator.
One of the following:
"image"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
"file"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>)
class ChatKitResponseOutputText: …
Assistant response text accompanied by optional annotations.
annotations: List[Annotation]
Ordered list of annotations attached to the response text.
One of the following:
class AnnotationFile: …
Annotation that references an uploaded file.
source: AnnotationFileSource
File attachment referenced by the annotation.
filename: str
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
type: Literal["file"]
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
type: Literal["file"]
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
class AnnotationURL: …
Annotation that references a URL.
source: AnnotationURLSource
URL referenced by the annotation.
type: Literal["url"]
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
url: str
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
type: Literal["url"]
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
text: str
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
type: Literal["output\_text"]
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>)
class ChatKitThread: …
Represents a ChatKit thread and its current status.
id: str
Identifier of the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) for when the thread was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) created_at>)
object: Literal["chatkit.thread"]
Type discriminator that is always `chatkit.thread`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) object>)
status: Status
Current status for the thread. Defaults to `active` for newly created threads.
One of the following:
class StatusActive: …
Indicates that a thread is active.
type: Literal["active"]
Status discriminator that is always `active`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0>)
class StatusLocked: …
Indicates that a thread is locked and cannot accept new input.
reason: Optional[str]
Reason that the thread was locked. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) reason>)
type: Literal["locked"]
Status discriminator that is always `locked`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1>)
class StatusClosed: …
Indicates that a thread has been closed.
reason: Optional[str]
Reason that the thread was closed. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) reason>)
type: Literal["closed"]
Status discriminator that is always `closed`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status>)
title: Optional[str]
Optional human-readable title for the thread. Defaults to null when no title has been generated.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) title>)
user: str
Free-form string that identifies your end user who owns the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) user>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>)
class ChatKitThreadAssistantMessageItem: …
Assistant-authored message within a thread.
id: str
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) id>)
content: List[[ChatKitResponseOutputText](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>)]
Ordered assistant response segments.
annotations: List[Annotation]
Ordered list of annotations attached to the response text.
One of the following:
class AnnotationFile: …
Annotation that references an uploaded file.
source: AnnotationFileSource
File attachment referenced by the annotation.
filename: str
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
type: Literal["file"]
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
type: Literal["file"]
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
class AnnotationURL: …
Annotation that references a URL.
source: AnnotationURLSource
URL referenced by the annotation.
type: Literal["url"]
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
url: str
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
type: Literal["url"]
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
text: str
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
type: Literal["output\_text"]
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) content>)
created\_at: int
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) created_at>)
object: Literal["chatkit.thread\_item"]
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) object>)
thread\_id: str
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) thread_id>)
type: Literal["chatkit.assistant\_message"]
Type discriminator that is always `chatkit.assistant\_message`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>)
class ChatKitThreadItemList: …
A paginated list of thread items rendered for the ChatKit API.
data: List[Data]
A list of items
One of the following:
class ChatKitThreadUserMessageItem: …
User-authored messages within a thread.
id: str
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) id>)
attachments: List[[ChatKitAttachment](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>)]
Attachments associated with the user message. Defaults to an empty list.
id: str
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
mime\_type: str
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
name: str
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
preview\_url: Optional[str]
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
type: Literal["image", "file"]
Attachment discriminator.
One of the following:
"image"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
"file"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) attachments>)
content: List[Content]
Ordered content elements supplied by the user.
One of the following:
class ContentInputText: …
Text block that a user contributed to the thread.
text: str
Plain-text content supplied by the user.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) text>)
type: Literal["input\_text"]
Type discriminator that is always `input\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0>)
class ContentQuotedText: …
Quoted snippet that the user referenced in their message.
text: str
Quoted text content.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) text>)
type: Literal["quoted\_text"]
Type discriminator that is always `quoted\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content>)
created\_at: int
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) created_at>)
inference\_options: Optional[InferenceOptions]
Inference overrides applied to the message. Defaults to null when unset.
model: Optional[str]
Model name that generated the response. Defaults to null when using the session default.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) model>)
tool\_choice: Optional[InferenceOptionsToolChoice]
Preferred tool to invoke. Defaults to null when ChatKit should auto-select.
id: str
Identifier of the requested tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice > (property) id>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options>)
object: Literal["chatkit.thread\_item"]
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) object>)
thread\_id: str
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) thread_id>)
type: Literal["chatkit.user\_message"]
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>)
class ChatKitThreadAssistantMessageItem: …
Assistant-authored message within a thread.
id: str
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) id>)
content: List[[ChatKitResponseOutputText](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>)]
Ordered assistant response segments.
annotations: List[Annotation]
Ordered list of annotations attached to the response text.
One of the following:
class AnnotationFile: …
Annotation that references an uploaded file.
source: AnnotationFileSource
File attachment referenced by the annotation.
filename: str
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
type: Literal["file"]
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
type: Literal["file"]
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
class AnnotationURL: …
Annotation that references a URL.
source: AnnotationURLSource
URL referenced by the annotation.
type: Literal["url"]
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
url: str
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
type: Literal["url"]
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
text: str
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
type: Literal["output\_text"]
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) content>)
created\_at: int
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) created_at>)
object: Literal["chatkit.thread\_item"]
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) object>)
thread\_id: str
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) thread_id>)
type: Literal["chatkit.assistant\_message"]
Type discriminator that is always `chatkit.assistant\_message`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>)
class ChatKitWidgetItem: …
Thread item that renders a widget payload.
id: str
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) created_at>)
object: Literal["chatkit.thread\_item"]
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) object>)
thread\_id: str
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) thread_id>)
type: Literal["chatkit.widget"]
Type discriminator that is always `chatkit.widget`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) type>)
widget: str
Serialized widget payload rendered in the UI.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) widget>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>)
class DataChatKitClientToolCall: …
Record of a client side tool invocation initiated by the assistant.
id: str
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) id>)
arguments: str
JSON-encoded arguments that were sent to the tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) arguments>)
call\_id: str
Identifier for the client tool call.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) call_id>)
created\_at: int
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) created_at>)
name: str
Tool name that was invoked.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) name>)
object: Literal["chatkit.thread\_item"]
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) object>)
output: Optional[str]
JSON-encoded output captured from the tool. Defaults to null while execution is in progress.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) output>)
status: Literal["in\_progress", "completed"]
Execution status for the tool call.
One of the following:
"in\_progress"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 0>)
"completed"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status>)
thread\_id: str
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) thread_id>)
type: Literal["chatkit.client\_tool\_call"]
Type discriminator that is always `chatkit.client\_tool\_call`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3>)
class DataChatKitTask: …
Task emitted by the workflow to show progress and status updates.
id: str
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) id>)
created\_at: int
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) created_at>)
heading: Optional[str]
Optional heading for the task. Defaults to null when not provided.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) heading>)
object: Literal["chatkit.thread\_item"]
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) object>)
summary: Optional[str]
Optional summary that describes the task. Defaults to null when omitted.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) summary>)
task\_type: Literal["custom", "thought"]
Subtype for the task.
One of the following:
"custom"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type > (member) 0>)
"thought"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type>)
thread\_id: str
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) thread_id>)
type: Literal["chatkit.task"]
Type discriminator that is always `chatkit.task`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4>)
class DataChatKitTaskGroup: …
Collection of workflow tasks grouped together in the thread.
id: str
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) id>)
created\_at: int
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) created_at>)
object: Literal["chatkit.thread\_item"]
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) object>)
tasks: List[DataChatKitTaskGroupTask]
Tasks included in the group.
heading: Optional[str]
Optional heading for the grouped task. Defaults to null when not provided.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) heading>)
summary: Optional[str]
Optional summary that describes the grouped task. Defaults to null when omitted.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) summary>)
type: Literal["custom", "thought"]
Subtype for the grouped task.
One of the following:
"custom"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type > (member) 0>)
"thought"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks>)
thread\_id: str
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) thread_id>)
type: Literal["chatkit.task\_group"]
Type discriminator that is always `chatkit.task\_group`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data>)
first\_id: Optional[str]
The ID of the first item in the list.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) first_id>)
has\_more: bool
Whether there are more items available.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) has_more>)
last\_id: Optional[str]
The ID of the last item in the list.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) last_id>)
object: Literal["list"]
The type of object returned, must be `list`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) object>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema)>)
class ChatKitThreadUserMessageItem: …
User-authored messages within a thread.
id: str
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) id>)
attachments: List[[ChatKitAttachment](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>)]
Attachments associated with the user message. Defaults to an empty list.
id: str
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
mime\_type: str
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
name: str
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
preview\_url: Optional[str]
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
type: Literal["image", "file"]
Attachment discriminator.
One of the following:
"image"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
"file"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) attachments>)
content: List[Content]
Ordered content elements supplied by the user.
One of the following:
class ContentInputText: …
Text block that a user contributed to the thread.
text: str
Plain-text content supplied by the user.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) text>)
type: Literal["input\_text"]
Type discriminator that is always `input\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0>)
class ContentQuotedText: …
Quoted snippet that the user referenced in their message.
text: str
Quoted text content.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) text>)
type: Literal["quoted\_text"]
Type discriminator that is always `quoted\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content>)
created\_at: int
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) created_at>)
inference\_options: Optional[InferenceOptions]
Inference overrides applied to the message. Defaults to null when unset.
model: Optional[str]
Model name that generated the response. Defaults to null when using the session default.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) model>)
tool\_choice: Optional[InferenceOptionsToolChoice]
Preferred tool to invoke. Defaults to null when ChatKit should auto-select.
id: str
Identifier of the requested tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice > (property) id>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options>)
object: Literal["chatkit.thread\_item"]
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) object>)
thread\_id: str
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) thread_id>)
type: Literal["chatkit.user\_message"]
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>)
class ChatKitWidgetItem: …
Thread item that renders a widget payload.
id: str
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) created_at>)
object: Literal["chatkit.thread\_item"]
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) object>)
thread\_id: str
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) thread_id>)
type: Literal["chatkit.widget"]
Type discriminator that is always `chatkit.widget`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) type>)
widget: str
Serialized widget payload rendered in the UI.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) widget>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>)
class ThreadDeleteResponse: …
Confirmation payload returned after deleting a thread.
id: str
Identifier of the deleted thread.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) id>)
deleted: bool
Indicates that the thread has been deleted.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) deleted>)
object: Literal["chatkit.thread.deleted"]
Type discriminator that is always `chatkit.thread.deleted`.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) object>)
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema)>)
#### BetaAssistants
Build Assistants that can call models and use tools.
##### [List assistants](/api/reference/python/resources/beta/subresources/assistants/methods/list)
Deprecated
beta.assistants.list(AssistantListParams\*\*kwargs) -\> SyncCursorPage[[Assistant](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>)]
GET/assistants
##### [Create assistant](/api/reference/python/resources/beta/subresources/assistants/methods/create)
Deprecated
beta.assistants.create(AssistantCreateParams\*\*kwargs) -\> [Assistant](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>)
POST/assistants
##### [Retrieve assistant](/api/reference/python/resources/beta/subresources/assistants/methods/retrieve)
Deprecated
beta.assistants.retrieve(strassistant\_id) -\> [Assistant](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>)
GET/assistants/{assistant\_id}
##### [Modify assistant](/api/reference/python/resources/beta/subresources/assistants/methods/update)
Deprecated
beta.assistants.update(strassistant\_id, AssistantUpdateParams\*\*kwargs) -\> [Assistant](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>)
POST/assistants/{assistant\_id}
##### [Delete assistant](/api/reference/python/resources/beta/subresources/assistants/methods/delete)
Deprecated
beta.assistants.delete(strassistant\_id) -\> [AssistantDeleted](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant_deleted > (schema)>)
DELETE/assistants/{assistant\_id}
##### ModelsExpand Collapse
class Assistant: …
Represents an `assistant` that can call the model and use tools.
id: str
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the assistant was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) created_at>)
description: Optional[str]
The description of the assistant. The maximum length is 512 characters.
maxLength512
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) description>)
instructions: Optional[str]
The system instructions that the assistant uses. The maximum length is 256,000 characters.
maxLength256000
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) instructions>)
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) metadata>)
model: str
ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) model>)
name: Optional[str]
The name of the assistant. The maximum length is 256 characters.
maxLength256
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) name>)
object: Literal["assistant"]
The object type, which is always `assistant`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) object>)
tools: List[[AssistantTool](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)]
A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterTool: …
type: Literal["code\_interpreter"]
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class FileSearchTool: …
type: Literal["file\_search"]
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: Optional[FileSearch]
Overrides for the file search tool.
max\_num\_results: Optional[int]
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: Optional[FileSearchRankingOptions]
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: Optional[Literal["auto", "default\_2024\_08\_21"]]
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
class FunctionTool: …
function: [FunctionDefinition](</api/reference/python/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: Literal["function"]
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tools>)
response\_format: Optional[AssistantResponseFormatOption]
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format>)
temperature: Optional[float]
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
minimum0
maximum2
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) temperature>)
tool\_resources: Optional[ToolResources]
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: Optional[ToolResourcesCodeInterpreter]
file\_ids: Optional[List[str]]
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter“ tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter>)
file\_search: Optional[ToolResourcesFileSearch]
vector\_store\_ids: Optional[List[str]]
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources>)
top\_p: Optional[float]
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant > (schema)>)
class AssistantDeleted: …
id: str
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) deleted>)
object: Literal["assistant.deleted"]
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema)>)
[AssistantStreamEvent](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant_stream_event > (schema)>)
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
class ThreadCreated: …
Occurs when a new [thread](https://platform.openai.com/docs/api-reference/threads/object) is created.
data: [Thread](</api/reference/python/resources/beta#(resource) beta.threads > (model) thread > (schema)>)
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data>)
event: Literal["thread.created"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) event>)
enabled: Optional[bool]
Whether to enable input audio transcription.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) enabled>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0>)
class ThreadRunCreated: …
Occurs when a new [run](https://platform.openai.com/docs/api-reference/runs/object) is created.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data>)
event: Literal["thread.run.created"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1>)
class ThreadRunQueued: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `queued` status.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data>)
event: Literal["thread.run.queued"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2>)
class ThreadRunInProgress: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to an `in\_progress` status.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data>)
event: Literal["thread.run.in\_progress"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3>)
class ThreadRunRequiresAction: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `requires\_action` status.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data>)
event: Literal["thread.run.requires\_action"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4>)
class ThreadRunCompleted: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is completed.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data>)
event: Literal["thread.run.completed"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5>)
class ThreadRunIncomplete: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) ends with status `incomplete`.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data>)
event: Literal["thread.run.incomplete"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6>)
class ThreadRunFailed: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) fails.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data>)
event: Literal["thread.run.failed"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7>)
class ThreadRunCancelling: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `cancelling` status.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data>)
event: Literal["thread.run.cancelling"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8>)
class ThreadRunCancelled: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is cancelled.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data>)
event: Literal["thread.run.cancelled"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9>)
class ThreadRunExpired: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) expires.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data>)
event: Literal["thread.run.expired"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10>)
class ThreadRunStepCreated: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is created.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data>)
event: Literal["thread.run.step.created"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11>)
class ThreadRunStepInProgress: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) moves to an `in\_progress` state.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data>)
event: Literal["thread.run.step.in\_progress"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12>)
class ThreadRunStepDelta: …
Occurs when parts of a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) are being streamed.
data: [RunStepDeltaEvent](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>)
Represents a run step delta i.e. any changed fields on a run step during streaming.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data>)
event: Literal["thread.run.step.delta"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13>)
class ThreadRunStepCompleted: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is completed.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data>)
event: Literal["thread.run.step.completed"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14>)
class ThreadRunStepFailed: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) fails.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data>)
event: Literal["thread.run.step.failed"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15>)
class ThreadRunStepCancelled: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is cancelled.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data>)
event: Literal["thread.run.step.cancelled"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16>)
class ThreadRunStepExpired: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) expires.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data>)
event: Literal["thread.run.step.expired"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17>)
class ThreadMessageCreated: …
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is created.
data: [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data>)
event: Literal["thread.message.created"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18>)
class ThreadMessageInProgress: …
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) moves to an `in\_progress` state.
data: [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data>)
event: Literal["thread.message.in\_progress"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19>)
class ThreadMessageDelta: …
Occurs when parts of a [Message](https://platform.openai.com/docs/api-reference/messages/object) are being streamed.
data: [MessageDeltaEvent](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message_delta_event > (schema)>)
Represents a message delta i.e. any changed fields on a message during streaming.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) data>)
event: Literal["thread.message.delta"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20>)
class ThreadMessageCompleted: …
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is completed.
data: [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data>)
event: Literal["thread.message.completed"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21>)
class ThreadMessageIncomplete: …
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) ends before it is completed.
data: [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data>)
event: Literal["thread.message.incomplete"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22>)
class ErrorEvent: …
Occurs when an [error](https://platform.openai.com/docs/guides/error-codes#api-errors) occurs. This can happen due to an internal server error or a timeout.
data: [ErrorObject](</api/reference/python/resources/$shared#(resource) $shared > (model) error_object > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data>)
event: Literal["error"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema)>)
[AssistantTool](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
One of the following:
class CodeInterpreterTool: …
type: Literal["code\_interpreter"]
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class FileSearchTool: …
type: Literal["file\_search"]
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: Optional[FileSearch]
Overrides for the file search tool.
max\_num\_results: Optional[int]
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: Optional[FileSearchRankingOptions]
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: Optional[Literal["auto", "default\_2024\_08\_21"]]
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
class FunctionTool: …
function: [FunctionDefinition](</api/reference/python/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: Literal["function"]
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_tool > (schema)>)
class CodeInterpreterTool: …
type: Literal["code\_interpreter"]
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class FileSearchTool: …
type: Literal["file\_search"]
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: Optional[FileSearch]
Overrides for the file search tool.
max\_num\_results: Optional[int]
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: Optional[FileSearchRankingOptions]
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: Optional[Literal["auto", "default\_2024\_08\_21"]]
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
class FunctionTool: …
function: [FunctionDefinition](</api/reference/python/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: Literal["function"]
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[MessageStreamEvent](</api/reference/python/resources/beta#(resource) beta.assistants > (model) message_stream_event > (schema)>)
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is created.
One of the following:
class ThreadMessageCreated: …
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is created.
data: [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0 > (property) data>)
event: Literal["thread.message.created"]
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0>)
class ThreadMessageInProgress: …
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) moves to an `in\_progress` state.
data: [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1 > (property) data>)
event: Literal["thread.message.in\_progress"]
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1>)
class ThreadMessageDelta: …
Occurs when parts of a [Message](https://platform.openai.com/docs/api-reference/messages/object) are being streamed.
data: [MessageDeltaEvent](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message_delta_event > (schema)>)
Represents a message delta i.e. any changed fields on a message during streaming.
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2 > (property) data>)
event: Literal["thread.message.delta"]
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2>)
class ThreadMessageCompleted: …
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is completed.
data: [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3 > (property) data>)
event: Literal["thread.message.completed"]
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3>)
class ThreadMessageIncomplete: …
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) ends before it is completed.
data: [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4 > (property) data>)
event: Literal["thread.message.incomplete"]
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema)>)
[RunStepStreamEvent](</api/reference/python/resources/beta#(resource) beta.assistants > (model) run_step_stream_event > (schema)>)
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is created.
One of the following:
class ThreadRunStepCreated: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is created.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0 > (property) data>)
event: Literal["thread.run.step.created"]
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0>)
class ThreadRunStepInProgress: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) moves to an `in\_progress` state.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1 > (property) data>)
event: Literal["thread.run.step.in\_progress"]
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1>)
class ThreadRunStepDelta: …
Occurs when parts of a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) are being streamed.
data: [RunStepDeltaEvent](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>)
Represents a run step delta i.e. any changed fields on a run step during streaming.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2 > (property) data>)
event: Literal["thread.run.step.delta"]
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2>)
class ThreadRunStepCompleted: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is completed.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3 > (property) data>)
event: Literal["thread.run.step.completed"]
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3>)
class ThreadRunStepFailed: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) fails.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4 > (property) data>)
event: Literal["thread.run.step.failed"]
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4>)
class ThreadRunStepCancelled: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is cancelled.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5 > (property) data>)
event: Literal["thread.run.step.cancelled"]
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5>)
class ThreadRunStepExpired: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) expires.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6 > (property) data>)
event: Literal["thread.run.step.expired"]
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema)>)
[RunStreamEvent](</api/reference/python/resources/beta#(resource) beta.assistants > (model) run_stream_event > (schema)>)
Occurs when a new [run](https://platform.openai.com/docs/api-reference/runs/object) is created.
One of the following:
class ThreadRunCreated: …
Occurs when a new [run](https://platform.openai.com/docs/api-reference/runs/object) is created.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0 > (property) data>)
event: Literal["thread.run.created"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0>)
class ThreadRunQueued: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `queued` status.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1 > (property) data>)
event: Literal["thread.run.queued"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1>)
class ThreadRunInProgress: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to an `in\_progress` status.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2 > (property) data>)
event: Literal["thread.run.in\_progress"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2>)
class ThreadRunRequiresAction: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `requires\_action` status.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3 > (property) data>)
event: Literal["thread.run.requires\_action"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3>)
class ThreadRunCompleted: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is completed.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4 > (property) data>)
event: Literal["thread.run.completed"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4>)
class ThreadRunIncomplete: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) ends with status `incomplete`.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5 > (property) data>)
event: Literal["thread.run.incomplete"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5>)
class ThreadRunFailed: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) fails.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6 > (property) data>)
event: Literal["thread.run.failed"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6>)
class ThreadRunCancelling: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `cancelling` status.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7 > (property) data>)
event: Literal["thread.run.cancelling"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7>)
class ThreadRunCancelled: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is cancelled.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8 > (property) data>)
event: Literal["thread.run.cancelled"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8>)
class ThreadRunExpired: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) expires.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9 > (property) data>)
event: Literal["thread.run.expired"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema)>)
class ThreadStreamEvent: …
Occurs when a new [thread](https://platform.openai.com/docs/api-reference/threads/object) is created.
data: [Thread](</api/reference/python/resources/beta#(resource) beta.threads > (model) thread > (schema)>)
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) data>)
event: Literal["thread.created"]
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) event>)
enabled: Optional[bool]
Whether to enable input audio transcription.
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) enabled>)
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema)>)
#### BetaThreads
Build Assistants that can call models and use tools.
##### [Create thread](/api/reference/python/resources/beta/subresources/threads/methods/create)
Deprecated
beta.threads.create(ThreadCreateParams\*\*kwargs) -\> [Thread](</api/reference/python/resources/beta#(resource) beta.threads > (model) thread > (schema)>)
POST/threads
##### [Create thread and run](/api/reference/python/resources/beta/subresources/threads/methods/create_and_run)
Deprecated
beta.threads.create\_and\_run(ThreadCreateAndRunParams\*\*kwargs) -\> [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
POST/threads/runs
##### [Retrieve thread](/api/reference/python/resources/beta/subresources/threads/methods/retrieve)
Deprecated
beta.threads.retrieve(strthread\_id) -\> [Thread](</api/reference/python/resources/beta#(resource) beta.threads > (model) thread > (schema)>)
GET/threads/{thread\_id}
##### [Modify thread](/api/reference/python/resources/beta/subresources/threads/methods/update)
Deprecated
beta.threads.update(strthread\_id, ThreadUpdateParams\*\*kwargs) -\> [Thread](</api/reference/python/resources/beta#(resource) beta.threads > (model) thread > (schema)>)
POST/threads/{thread\_id}
##### [Delete thread](/api/reference/python/resources/beta/subresources/threads/methods/delete)
Deprecated
beta.threads.delete(strthread\_id) -\> [ThreadDeleted](</api/reference/python/resources/beta#(resource) beta.threads > (model) thread_deleted > (schema)>)
DELETE/threads/{thread\_id}
##### ModelsExpand Collapse
[AssistantResponseFormatOption](</api/reference/python/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
Literal["auto"]
`auto` is the default value
[](<#(resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
class ResponseFormatText: …
Default response format. Used to generate text responses.
type: Literal["text"]
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
class ResponseFormatJSONObject: …
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: Literal["json\_object"]
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
class ResponseFormatJSONSchema: …
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
json\_schema: JSONSchema
Structured Outputs configuration options, including a JSON Schema.
name: str
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: Optional[str]
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: Optional[Dict[str, object]]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: Optional[bool]
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: Literal["json\_schema"]
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
class AssistantToolChoice: …
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: Literal["function", "code\_interpreter", "file\_search"]
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: Optional[AssistantToolChoiceFunction]
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema)>)
class AssistantToolChoiceFunction: …
name: str
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)
[AssistantToolChoiceOption](</api/reference/python/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
Literal["none", "auto", "required"]
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
"none"
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
class AssistantToolChoice: …
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: Literal["function", "code\_interpreter", "file\_search"]
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: Optional[AssistantToolChoiceFunction]
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
class Thread: …
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
id: str
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the thread was created.
formatunixtime
[](<#(resource) beta.threads > (model) thread > (schema) > (property) created_at>)
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) metadata>)
object: Literal["thread"]
The object type, which is always `thread`.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) object>)
tool\_resources: Optional[ToolResources]
A set of resources that are made available to the assistant’s tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: Optional[ToolResourcesCodeInterpreter]
file\_ids: Optional[List[str]]
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter>)
file\_search: Optional[ToolResourcesFileSearch]
vector\_store\_ids: Optional[List[str]]
The [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources>)
[](<#(resource) beta.threads > (model) thread > (schema)>)
class ThreadDeleted: …
id: str
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) deleted>)
object: Literal["thread.deleted"]
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads > (model) thread_deleted > (schema)>)
#### BetaThreadsRuns
Build Assistants that can call models and use tools.
##### [List runs](/api/reference/python/resources/beta/subresources/threads/subresources/runs/methods/list)
Deprecated
beta.threads.runs.list(strthread\_id, RunListParams\*\*kwargs) -\> SyncCursorPage[[Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)]
GET/threads/{thread\_id}/runs
##### [Create run](/api/reference/python/resources/beta/subresources/threads/subresources/runs/methods/create)
Deprecated
beta.threads.runs.create(strthread\_id, RunCreateParams\*\*kwargs) -\> [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
POST/threads/{thread\_id}/runs
##### [Retrieve run](/api/reference/python/resources/beta/subresources/threads/subresources/runs/methods/retrieve)
Deprecated
beta.threads.runs.retrieve(strrun\_id, RunRetrieveParams\*\*kwargs) -\> [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
GET/threads/{thread\_id}/runs/{run\_id}
##### [Modify run](/api/reference/python/resources/beta/subresources/threads/subresources/runs/methods/update)
Deprecated
beta.threads.runs.update(strrun\_id, RunUpdateParams\*\*kwargs) -\> [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
POST/threads/{thread\_id}/runs/{run\_id}
##### [Submit tool outputs to run](/api/reference/python/resources/beta/subresources/threads/subresources/runs/methods/submit_tool_outputs)
Deprecated
beta.threads.runs.submit\_tool\_outputs(strrun\_id, RunSubmitToolOutputsParams\*\*kwargs) -\> [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
POST/threads/{thread\_id}/runs/{run\_id}/submit\_tool\_outputs
##### [Cancel a run](/api/reference/python/resources/beta/subresources/threads/subresources/runs/methods/cancel)
Deprecated
beta.threads.runs.cancel(strrun\_id, RunCancelParams\*\*kwargs) -\> [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
POST/threads/{thread\_id}/runs/{run\_id}/cancel
##### ModelsExpand Collapse
class RequiredActionFunctionToolCall: …
Tool call objects
id: str
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: Function
The function definition.
arguments: str
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: str
The name of the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: Literal["function"]
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
class Run: …
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
id: str
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: str
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: Optional[int]
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: Optional[int]
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: int
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: Optional[int]
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: Optional[int]
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: Optional[IncompleteDetails]
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason: Optional[Literal["max\_completion\_tokens", "max\_prompt\_tokens"]]
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: str
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: Optional[LastError]
The last error associated with this run. Will be `null` if there are no errors.
code: Literal["server\_error", "rate\_limit\_exceeded", "invalid\_prompt"]
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
"server\_error"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_prompt"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
message: str
A human-readable description of the error.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
max\_completion\_tokens: Optional[int]
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: Optional[int]
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: str
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: Literal["thread.run"]
The object type, which is always `thread.run`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: bool
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: Optional[RequiredAction]
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: RequiredActionSubmitToolOutputs
Details on the tool outputs needed for this run to continue.
tool\_calls: List[[RequiredActionFunctionToolCall](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)]
A list of the relevant tool calls.
id: str
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: Function
The function definition.
arguments: str
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: str
The name of the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: Literal["function"]
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
type: Literal["submit\_tool\_outputs"]
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
response\_format: Optional[AssistantResponseFormatOption]
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: Optional[int]
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: [RunStatus](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: str
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: Optional[AssistantToolChoiceOption]
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: List[[AssistantTool](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)]
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
class CodeInterpreterTool: …
type: Literal["code\_interpreter"]
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class FileSearchTool: …
type: Literal["file\_search"]
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: Optional[FileSearch]
Overrides for the file search tool.
max\_num\_results: Optional[int]
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: Optional[FileSearchRankingOptions]
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: Optional[Literal["auto", "default\_2024\_08\_21"]]
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
class FunctionTool: …
function: [FunctionDefinition](</api/reference/python/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: Literal["function"]
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: Optional[TruncationStrategy]
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: Literal["auto", "last\_messages"]
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages: Optional[int]
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: Optional[Usage]
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
completion\_tokens: int
Number of completion tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: int
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: int
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
temperature: Optional[float]
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p: Optional[float]
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.threads.runs > (model) run > (schema)>)
Literal["queued", "in\_progress", "requires\_action", 6 more]
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
"in\_progress"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
"requires\_action"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
"cancelling"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
"cancelled"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
"failed"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
"completed"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
"incomplete"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
"expired"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.threads.runs > (model) run_status > (schema)>)
#### BetaThreadsRunsSteps
Build Assistants that can call models and use tools.
##### [List run steps](/api/reference/python/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/list)
Deprecated
beta.threads.runs.steps.list(strrun\_id, StepListParams\*\*kwargs) -\> SyncCursorPage[[RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)]
GET/threads/{thread\_id}/runs/{run\_id}/steps
##### [Retrieve run step](/api/reference/python/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/retrieve)
Deprecated
beta.threads.runs.steps.retrieve(strstep\_id, StepRetrieveParams\*\*kwargs) -\> [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
GET/threads/{thread\_id}/runs/{run\_id}/steps/{step\_id}
##### ModelsExpand Collapse
class CodeInterpreterLogs: …
Text output from the Code Interpreter tool call as part of a run step.
index: int
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: Literal["logs"]
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs: Optional[str]
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage: …
index: int
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: Literal["image"]
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image: Optional[Image]
file\_id: Optional[str]
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
class CodeInterpreterToolCall: …
Details of the Code Interpreter tool call the run step was involved in.
id: str
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter
The Code Interpreter tool call definition.
input: str
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: List[CodeInterpreterOutput]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterOutputLogs: …
Text output from the Code Interpreter tool call as part of a run step.
logs: str
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: Literal["logs"]
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
class CodeInterpreterOutputImage: …
image: CodeInterpreterOutputImageImage
file\_id: str
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: Literal["image"]
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: Literal["code\_interpreter"]
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
class CodeInterpreterToolCallDelta: …
Details of the Code Interpreter tool call the run step was involved in.
index: int
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: Literal["code\_interpreter"]
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id: Optional[str]
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter: Optional[CodeInterpreter]
The Code Interpreter tool call definition.
input: Optional[str]
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs: Optional[List[CodeInterpreterOutput]]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterLogs: …
Text output from the Code Interpreter tool call as part of a run step.
index: int
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: Literal["logs"]
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs: Optional[str]
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage: …
index: int
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: Literal["image"]
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image: Optional[Image]
file\_id: Optional[str]
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
class FileSearchToolCall: …
id: str
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch
For now, this is always going to be an empty object.
ranking\_options: Optional[FileSearchRankingOptions]
The ranking options for the file search.
ranker: Literal["auto", "default\_2024\_08\_21"]
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: Optional[List[FileSearchResult]]
The results of the file search.
file\_id: str
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: str
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: float
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: Optional[List[FileSearchResultContent]]
The content of the result that was found. The content is only included if requested via the include query parameter.
text: Optional[str]
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: Optional[Literal["text"]]
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: Literal["file\_search"]
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
class FileSearchToolCallDelta: …
file\_search: object
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: int
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: Literal["file\_search"]
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id: Optional[str]
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
class FunctionToolCall: …
id: str
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function
The definition of the function that was called.
arguments: str
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: str
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: Optional[str]
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: Literal["function"]
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
class FunctionToolCallDelta: …
index: int
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: Literal["function"]
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id: Optional[str]
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function: Optional[Function]
The definition of the function that was called.
arguments: Optional[str]
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name: Optional[str]
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output: Optional[str]
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
class MessageCreationStepDetails: …
Details of the message creation by the run step.
message\_creation: MessageCreation
message\_id: str
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: Literal["message\_creation"]
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
class RunStep: …
Represents a step in execution of a run.
id: str
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
assistant\_id: str
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
cancelled\_at: Optional[int]
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
completed\_at: Optional[int]
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
created\_at: int
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
expired\_at: Optional[int]
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
failed\_at: Optional[int]
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
last\_error: Optional[LastError]
The last error associated with this run step. Will be `null` if there are no errors.
code: Literal["server\_error", "rate\_limit\_exceeded"]
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
"server\_error"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
message: str
A human-readable description of the error.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
object: Literal["thread.run.step"]
The object type, which is always `thread.run.step`.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
run\_id: str
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
status: Literal["in\_progress", "cancelled", "failed", 2 more]
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
step\_details: StepDetails
The details of the run step.
One of the following:
class MessageCreationStepDetails: …
Details of the message creation by the run step.
message\_creation: MessageCreation
message\_id: str
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: Literal["message\_creation"]
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
class ToolCallsStepDetails: …
Details of the tool call.
tool\_calls: List[[ToolCall](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)]
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterToolCall: …
Details of the Code Interpreter tool call the run step was involved in.
id: str
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter
The Code Interpreter tool call definition.
input: str
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: List[CodeInterpreterOutput]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterOutputLogs: …
Text output from the Code Interpreter tool call as part of a run step.
logs: str
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: Literal["logs"]
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
class CodeInterpreterOutputImage: …
image: CodeInterpreterOutputImageImage
file\_id: str
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: Literal["image"]
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: Literal["code\_interpreter"]
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
class FileSearchToolCall: …
id: str
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch
For now, this is always going to be an empty object.
ranking\_options: Optional[FileSearchRankingOptions]
The ranking options for the file search.
ranker: Literal["auto", "default\_2024\_08\_21"]
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: Optional[List[FileSearchResult]]
The results of the file search.
file\_id: str
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: str
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: float
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: Optional[List[FileSearchResultContent]]
The content of the result that was found. The content is only included if requested via the include query parameter.
text: Optional[str]
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: Optional[Literal["text"]]
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: Literal["file\_search"]
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
class FunctionToolCall: …
id: str
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function
The definition of the function that was called.
arguments: str
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: str
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: Optional[str]
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: Literal["function"]
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
type: Literal["tool\_calls"]
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
thread\_id: str
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
type: Literal["message\_creation", "tool\_calls"]
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
"message\_creation"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
"tool\_calls"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
usage: Optional[Usage]
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
completion\_tokens: int
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: int
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: int
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
class RunStepDelta: …
The delta containing the fields that have changed on the run step.
step\_details: Optional[StepDetails]
The details of the run step.
One of the following:
class RunStepDeltaMessageDelta: …
Details of the message creation by the run step.
type: Literal["message\_creation"]
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
message\_creation: Optional[MessageCreation]
message\_id: Optional[str]
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
class ToolCallDeltaObject: …
Details of the tool call.
type: Literal["tool\_calls"]
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
tool\_calls: Optional[List[[ToolCallDelta](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)]]
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterToolCallDelta: …
Details of the Code Interpreter tool call the run step was involved in.
index: int
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: Literal["code\_interpreter"]
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id: Optional[str]
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter: Optional[CodeInterpreter]
The Code Interpreter tool call definition.
input: Optional[str]
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs: Optional[List[CodeInterpreterOutput]]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterLogs: …
Text output from the Code Interpreter tool call as part of a run step.
index: int
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: Literal["logs"]
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs: Optional[str]
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage: …
index: int
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: Literal["image"]
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image: Optional[Image]
file\_id: Optional[str]
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
class FileSearchToolCallDelta: …
file\_search: object
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: int
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: Literal["file\_search"]
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id: Optional[str]
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
class FunctionToolCallDelta: …
index: int
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: Literal["function"]
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id: Optional[str]
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function: Optional[Function]
The definition of the function that was called.
arguments: Optional[str]
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name: Optional[str]
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output: Optional[str]
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema) > (property) step_details>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema)>)
class RunStepDeltaEvent: …
Represents a run step delta i.e. any changed fields on a run step during streaming.
id: str
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) id>)
delta: [RunStepDelta](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema)>)
The delta containing the fields that have changed on the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta>)
object: Literal["thread.run.step.delta"]
The object type, which is always `thread.run.step.delta`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>)
class RunStepDeltaMessageDelta: …
Details of the message creation by the run step.
type: Literal["message\_creation"]
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
message\_creation: Optional[MessageCreation]
message\_id: Optional[str]
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
Literal["step\_details.tool\_calls[\*].file\_search.results[\*].content"]
[](<#(resource) beta.threads.runs.steps > (model) run_step_include > (schema)>)
[ToolCall](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
Details of the Code Interpreter tool call the run step was involved in.
One of the following:
class CodeInterpreterToolCall: …
Details of the Code Interpreter tool call the run step was involved in.
id: str
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter
The Code Interpreter tool call definition.
input: str
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: List[CodeInterpreterOutput]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterOutputLogs: …
Text output from the Code Interpreter tool call as part of a run step.
logs: str
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: Literal["logs"]
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
class CodeInterpreterOutputImage: …
image: CodeInterpreterOutputImageImage
file\_id: str
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: Literal["image"]
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: Literal["code\_interpreter"]
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
class FileSearchToolCall: …
id: str
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch
For now, this is always going to be an empty object.
ranking\_options: Optional[FileSearchRankingOptions]
The ranking options for the file search.
ranker: Literal["auto", "default\_2024\_08\_21"]
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: Optional[List[FileSearchResult]]
The results of the file search.
file\_id: str
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: str
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: float
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: Optional[List[FileSearchResultContent]]
The content of the result that was found. The content is only included if requested via the include query parameter.
text: Optional[str]
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: Optional[Literal["text"]]
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: Literal["file\_search"]
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
class FunctionToolCall: …
id: str
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function
The definition of the function that was called.
arguments: str
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: str
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: Optional[str]
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: Literal["function"]
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
[ToolCallDelta](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)
Details of the Code Interpreter tool call the run step was involved in.
One of the following:
class CodeInterpreterToolCallDelta: …
Details of the Code Interpreter tool call the run step was involved in.
index: int
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: Literal["code\_interpreter"]
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id: Optional[str]
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter: Optional[CodeInterpreter]
The Code Interpreter tool call definition.
input: Optional[str]
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs: Optional[List[CodeInterpreterOutput]]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterLogs: …
Text output from the Code Interpreter tool call as part of a run step.
index: int
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: Literal["logs"]
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs: Optional[str]
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage: …
index: int
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: Literal["image"]
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image: Optional[Image]
file\_id: Optional[str]
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
class FileSearchToolCallDelta: …
file\_search: object
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: int
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: Literal["file\_search"]
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id: Optional[str]
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
class FunctionToolCallDelta: …
index: int
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: Literal["function"]
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id: Optional[str]
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function: Optional[Function]
The definition of the function that was called.
arguments: Optional[str]
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name: Optional[str]
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output: Optional[str]
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)
class ToolCallDeltaObject: …
Details of the tool call.
type: Literal["tool\_calls"]
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
tool\_calls: Optional[List[[ToolCallDelta](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)]]
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterToolCallDelta: …
Details of the Code Interpreter tool call the run step was involved in.
index: int
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: Literal["code\_interpreter"]
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id: Optional[str]
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter: Optional[CodeInterpreter]
The Code Interpreter tool call definition.
input: Optional[str]
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs: Optional[List[CodeInterpreterOutput]]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterLogs: …
Text output from the Code Interpreter tool call as part of a run step.
index: int
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: Literal["logs"]
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs: Optional[str]
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage: …
index: int
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: Literal["image"]
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image: Optional[Image]
file\_id: Optional[str]
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
class FileSearchToolCallDelta: …
file\_search: object
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: int
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: Literal["file\_search"]
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id: Optional[str]
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
class FunctionToolCallDelta: …
index: int
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: Literal["function"]
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id: Optional[str]
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function: Optional[Function]
The definition of the function that was called.
arguments: Optional[str]
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name: Optional[str]
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output: Optional[str]
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
class ToolCallsStepDetails: …
Details of the tool call.
tool\_calls: List[[ToolCall](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)]
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterToolCall: …
Details of the Code Interpreter tool call the run step was involved in.
id: str
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter
The Code Interpreter tool call definition.
input: str
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: List[CodeInterpreterOutput]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterOutputLogs: …
Text output from the Code Interpreter tool call as part of a run step.
logs: str
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: Literal["logs"]
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
class CodeInterpreterOutputImage: …
image: CodeInterpreterOutputImageImage
file\_id: str
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: Literal["image"]
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: Literal["code\_interpreter"]
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
class FileSearchToolCall: …
id: str
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch
For now, this is always going to be an empty object.
ranking\_options: Optional[FileSearchRankingOptions]
The ranking options for the file search.
ranker: Literal["auto", "default\_2024\_08\_21"]
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: Optional[List[FileSearchResult]]
The results of the file search.
file\_id: str
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: str
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: float
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: Optional[List[FileSearchResultContent]]
The content of the result that was found. The content is only included if requested via the include query parameter.
text: Optional[str]
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: Optional[Literal["text"]]
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: Literal["file\_search"]
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
class FunctionToolCall: …
id: str
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function
The definition of the function that was called.
arguments: str
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: str
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: Optional[str]
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: Literal["function"]
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
type: Literal["tool\_calls"]
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
#### BetaThreadsMessages
Build Assistants that can call models and use tools.
##### [List messages](/api/reference/python/resources/beta/subresources/threads/subresources/messages/methods/list)
Deprecated
beta.threads.messages.list(strthread\_id, MessageListParams\*\*kwargs) -\> SyncCursorPage[[Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)]
GET/threads/{thread\_id}/messages
##### [Create message](/api/reference/python/resources/beta/subresources/threads/subresources/messages/methods/create)
Deprecated
beta.threads.messages.create(strthread\_id, MessageCreateParams\*\*kwargs) -\> [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
POST/threads/{thread\_id}/messages
##### [Modify message](/api/reference/python/resources/beta/subresources/threads/subresources/messages/methods/update)
Deprecated
beta.threads.messages.update(strmessage\_id, MessageUpdateParams\*\*kwargs) -\> [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
POST/threads/{thread\_id}/messages/{message\_id}
##### [Retrieve message](/api/reference/python/resources/beta/subresources/threads/subresources/messages/methods/retrieve)
Deprecated
beta.threads.messages.retrieve(strmessage\_id, MessageRetrieveParams\*\*kwargs) -\> [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
GET/threads/{thread\_id}/messages/{message\_id}
##### [Delete message](/api/reference/python/resources/beta/subresources/threads/subresources/messages/methods/delete)
Deprecated
beta.threads.messages.delete(strmessage\_id, MessageDeleteParams\*\*kwargs) -\> [MessageDeleted](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
DELETE/threads/{thread\_id}/messages/{message\_id}
##### ModelsExpand Collapse
[Annotation](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
One of the following:
class FileCitationAnnotation: …
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
end\_index: int
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation
file\_id: str
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
start\_index: int
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
text: str
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
type: Literal["file\_citation"]
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FilePathAnnotation: …
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: int
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: FilePath
file\_id: str
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
start\_index: int
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
text: str
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
type: Literal["file\_path"]
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) annotation > (schema)>)
[AnnotationDelta](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
One of the following:
class FileCitationDeltaAnnotation: …
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
index: int
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
type: Literal["file\_citation"]
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
end\_index: Optional[int]
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
file\_citation: Optional[FileCitation]
file\_id: Optional[str]
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
quote: Optional[str]
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
start\_index: Optional[int]
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
text: Optional[str]
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathDeltaAnnotation: …
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
index: int
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
type: Literal["file\_path"]
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
end\_index: Optional[int]
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
file\_path: Optional[FilePath]
file\_id: Optional[str]
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
start\_index: Optional[int]
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
text: Optional[str]
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)
class FileCitationAnnotation: …
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
end\_index: int
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation
file\_id: str
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
start\_index: int
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
text: str
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
type: Literal["file\_citation"]
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FileCitationDeltaAnnotation: …
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
index: int
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
type: Literal["file\_citation"]
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
end\_index: Optional[int]
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
file\_citation: Optional[FileCitation]
file\_id: Optional[str]
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
quote: Optional[str]
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
start\_index: Optional[int]
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
text: Optional[str]
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathAnnotation: …
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: int
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: FilePath
file\_id: str
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
start\_index: int
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
text: str
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
type: Literal["file\_path"]
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
class FilePathDeltaAnnotation: …
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
index: int
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
type: Literal["file\_path"]
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
end\_index: Optional[int]
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
file\_path: Optional[FilePath]
file\_id: Optional[str]
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
start\_index: Optional[int]
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
text: Optional[str]
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
class ImageFile: …
file\_id: str
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
detail: Optional[Literal["auto", "low", "high"]]
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
class ImageFileContentBlock: …
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: Literal["image\_file"]
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageFileDelta: …
detail: Optional[Literal["auto", "low", "high"]]
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail>)
file\_id: Optional[str]
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)
class ImageFileDeltaBlock: …
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
index: int
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
type: Literal["image\_file"]
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
image\_file: Optional[ImageFileDelta]
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class ImageURL: …
url: str
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
detail: Optional[Literal["auto", "low", "high"]]
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
class ImageURLContentBlock: …
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: Literal["image\_url"]
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class ImageURLDelta: …
detail: Optional[Literal["auto", "low", "high"]]
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail>)
url: Optional[str]
The URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)
class ImageURLDeltaBlock: …
References an image URL in the content of a message.
index: int
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
type: Literal["image\_url"]
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
image\_url: Optional[ImageURLDelta]
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
class Message: …
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
id: str
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) id>)
assistant\_id: Optional[str]
If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
attachments: Optional[List[Attachment]]
A list of files attached to the message, and the tools they were added to.
file\_id: Optional[str]
The ID of the file to attach to the message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
tools: Optional[List[AttachmentTool]]
The tools to add this file to.
One of the following:
class CodeInterpreterTool: …
type: Literal["code\_interpreter"]
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class AttachmentToolAssistantToolsFileSearchTypeOnly: …
type: Literal["file\_search"]
The type of tool being defined: `file\_search`
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
completed\_at: Optional[int]
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
content: List[[MessageContent](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)]
The content of the message in array of text and/or images.
One of the following:
class ImageFileContentBlock: …
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: Literal["image\_file"]
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageURLContentBlock: …
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: Literal["image\_url"]
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlock: …
The text content that is part of a message.
text: [Text](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
type: Literal["text"]
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class RefusalContentBlock: …
The refusal content generated by the assistant.
refusal: str
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
type: Literal["refusal"]
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) content>)
created\_at: int
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
incomplete\_at: Optional[int]
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
incomplete\_details: Optional[IncompleteDetails]
On an incomplete message, details about why the message is incomplete.
reason: Literal["content\_filter", "max\_tokens", "run\_cancelled", 2 more]
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
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
object: Literal["thread.message"]
The object type, which is always `thread.message`.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) object>)
role: Literal["user", "assistant"]
The entity that produced the message. One of `user` or `assistant`.
One of the following:
"user"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role>)
run\_id: Optional[str]
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
status: Literal["in\_progress", "incomplete", "completed"]
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
"in\_progress"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status>)
thread\_id: str
The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.threads.messages > (model) message > (schema)>)
[MessageContent](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
One of the following:
class ImageFileContentBlock: …
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: Literal["image\_file"]
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageURLContentBlock: …
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: Literal["image\_url"]
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlock: …
The text content that is part of a message.
text: [Text](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
type: Literal["text"]
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class RefusalContentBlock: …
The refusal content generated by the assistant.
refusal: str
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
type: Literal["refusal"]
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content > (schema)>)
[MessageContentDelta](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
One of the following:
class ImageFileDeltaBlock: …
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
index: int
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
type: Literal["image\_file"]
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
image\_file: Optional[ImageFileDelta]
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class TextDeltaBlock: …
The text content that is part of a message.
index: int
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
type: Literal["text"]
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
text: Optional[TextDelta]
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
class RefusalDeltaBlock: …
The refusal content that is part of a message.
index: int
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
type: Literal["refusal"]
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
refusal: Optional[str]
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class ImageURLDeltaBlock: …
References an image URL in the content of a message.
index: int
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
type: Literal["image\_url"]
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
image\_url: Optional[ImageURLDelta]
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)
[MessageContentPartParam](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message_content_part_param > (schema)>)
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
One of the following:
class ImageFileContentBlock: …
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: Literal["image\_file"]
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageURLContentBlock: …
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: Literal["image\_url"]
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlockParam: …
The text content that is part of a message.
text: str
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
type: Literal["text"]
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content_part_param > (schema)>)
class MessageDeleted: …
id: str
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) deleted>)
object: Literal["thread.message.deleted"]
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
class MessageDelta: …
The delta containing the fields that have changed on the Message.
content: Optional[List[[MessageContentDelta](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)]]
The content of the message in array of text and/or images.
One of the following:
class ImageFileDeltaBlock: …
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
index: int
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
type: Literal["image\_file"]
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
image\_file: Optional[ImageFileDelta]
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class TextDeltaBlock: …
The text content that is part of a message.
index: int
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
type: Literal["text"]
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
text: Optional[TextDelta]
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
class RefusalDeltaBlock: …
The refusal content that is part of a message.
index: int
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
type: Literal["refusal"]
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
refusal: Optional[str]
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class ImageURLDeltaBlock: …
References an image URL in the content of a message.
index: int
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
type: Literal["image\_url"]
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
image\_url: Optional[ImageURLDelta]
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) content>)
role: Optional[Literal["user", "assistant"]]
The entity that produced the message. One of `user` or `assistant`.
One of the following:
"user"
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema)>)
class MessageDeltaEvent: …
Represents a message delta i.e. any changed fields on a message during streaming.
id: str
The identifier of the message, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) id>)
delta: [MessageDelta](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message_delta > (schema)>)
The delta containing the fields that have changed on the Message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta>)
object: Literal["thread.message.delta"]
The object type, which is always `thread.message.delta`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema)>)
class RefusalContentBlock: …
The refusal content generated by the assistant.
refusal: str
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
type: Literal["refusal"]
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
class RefusalDeltaBlock: …
The refusal content that is part of a message.
index: int
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
type: Literal["refusal"]
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
refusal: Optional[str]
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class Text: …
annotations: List[[Annotation](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)]
One of the following:
class FileCitationAnnotation: …
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
end\_index: int
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation
file\_id: str
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
start\_index: int
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
text: str
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
type: Literal["file\_citation"]
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FilePathAnnotation: …
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: int
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: FilePath
file\_id: str
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
start\_index: int
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
text: str
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
type: Literal["file\_path"]
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
value: str
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text > (schema)>)
class TextContentBlock: …
The text content that is part of a message.
text: [Text](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
type: Literal["text"]
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class TextContentBlockParam: …
The text content that is part of a message.
text: str
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
type: Literal["text"]
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
class TextDelta: …
annotations: Optional[List[[AnnotationDelta](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)]]
One of the following:
class FileCitationDeltaAnnotation: …
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
index: int
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
type: Literal["file\_citation"]
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
end\_index: Optional[int]
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
file\_citation: Optional[FileCitation]
file\_id: Optional[str]
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
quote: Optional[str]
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
start\_index: Optional[int]
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
text: Optional[str]
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathDeltaAnnotation: …
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
index: int
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
type: Literal["file\_path"]
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
end\_index: Optional[int]
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
file\_path: Optional[FilePath]
file\_id: Optional[str]
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
start\_index: Optional[int]
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
text: Optional[str]
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) annotations>)
value: Optional[str]
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema)>)
class TextDeltaBlock: …
The text content that is part of a message.
index: int
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
type: Literal["text"]
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
text: Optional[TextDelta]
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)