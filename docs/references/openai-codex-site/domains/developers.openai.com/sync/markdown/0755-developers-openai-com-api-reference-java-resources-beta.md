Beta | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Beta
#### BetaChatKit
##### ModelsExpand Collapse
class ChatKitWorkflow:
Workflow metadata and state returned for the session.
String id
Identifier of the workflow backing the session.
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) id>)
Optional\<StateVariables\> stateVariables
State variable key-value pairs applied when invoking the workflow. Defaults to null when no overrides were provided.
One of the following:
String
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 0>)
boolean
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 1>)
double
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 2>)
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables>)
Tracing tracing
Tracing settings applied to the workflow.
boolean enabled
Indicates whether tracing is enabled.
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing > (property) enabled>)
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing>)
Optional\<String\> version
Specific workflow version used for the session. Defaults to null when using the latest deployment.
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) version>)
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema)>)
#### BetaChatKitSessions
##### [Cancel chat session](/api/reference/java/resources/beta/subresources/chatkit/subresources/sessions/methods/cancel)
[ChatSession](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chat_session > (schema)>) beta().chatkit().sessions().cancel(SessionCancelParamsparams = SessionCancelParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/chatkit/sessions/{session\_id}/cancel
##### [Create ChatKit session](/api/reference/java/resources/beta/subresources/chatkit/subresources/sessions/methods/create)
[ChatSession](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chat_session > (schema)>) beta().chatkit().sessions().create(SessionCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/chatkit/sessions
#### BetaChatKitThreads
##### [List ChatKit thread items](/api/reference/java/resources/beta/subresources/chatkit/subresources/threads/methods/list_items)
ThreadListItemsPage beta().chatkit().threads().listItems(ThreadListItemsParamsparams = ThreadListItemsParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/chatkit/threads/{thread\_id}/items
##### [Retrieve ChatKit thread](/api/reference/java/resources/beta/subresources/chatkit/subresources/threads/methods/retrieve)
[ChatKitThread](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>) beta().chatkit().threads().retrieve(ThreadRetrieveParamsparams = ThreadRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/chatkit/threads/{thread\_id}
##### [Delete ChatKit thread](/api/reference/java/resources/beta/subresources/chatkit/subresources/threads/methods/delete)
[ThreadDeleteResponse](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) ThreadDeleteResponse > (schema)>) beta().chatkit().threads().delete(ThreadDeleteParamsparams = ThreadDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/chatkit/threads/{thread\_id}
##### [List ChatKit threads](/api/reference/java/resources/beta/subresources/chatkit/subresources/threads/methods/list)
ThreadListPage beta().chatkit().threads().list(ThreadListParamsparams = ThreadListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/chatkit/threads
##### ModelsExpand Collapse
class ChatSession:
Represents a ChatKit session and its resolved configuration.
String id
Identifier for the ChatKit session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) id>)
[ChatSessionChatKitConfiguration](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema)>) chatkitConfiguration
Resolved ChatKit feature configuration for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration>)
String clientSecret
Ephemeral client secret that authenticates session requests.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) client_secret>)
long expiresAt
Unix timestamp (in seconds) for when the session expires.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) expires_at>)
long maxRequestsPer1Minute
Convenience copy of the per-minute request limit.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) max_requests_per_1_minute>)
JsonValue; object\_ "chatkit.session"constant"chatkit.session"constant
Type discriminator that is always `chatkit.session`.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) object>)
[ChatSessionRateLimits](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema)>) rateLimits
Resolved rate limit values.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) rate_limits>)
[ChatSessionStatus](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>) status
Current lifecycle state of the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status>)
String user
User identifier associated with the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) user>)
[ChatKitWorkflow](</api/reference/java/resources/beta#(resource) beta.chatkit > (model) chatkit_workflow > (schema)>) workflow
Workflow metadata for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema)>)
class ChatSessionAutomaticThreadTitling:
Automatic thread title preferences for the session.
boolean enabled
Whether automatic thread titling is enabled.
[](<#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema) > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema)>)
class ChatSessionChatKitConfiguration:
ChatKit configuration for the session.
[ChatSessionAutomaticThreadTitling](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema)>) automaticThreadTitling
Automatic thread titling preferences.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) automatic_thread_titling>)
[ChatSessionFileUpload](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema)>) fileUpload
Upload settings for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload>)
[ChatSessionHistory](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_history > (schema)>) history
History retention configuration.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) history>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema)>)
class ChatSessionChatKitConfigurationParam:
Optional per-session configuration settings for ChatKit behavior.
Optional\<AutomaticThreadTitling\> automaticThreadTitling
Configuration for automatic thread titling. When omitted, automatic thread titling is enabled by default.
Optional\<Boolean\> enabled
Enable automatic thread title generation. Defaults to true.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) automatic_thread_titling > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) automatic_thread_titling>)
Optional\<FileUpload\> fileUpload
Configuration for upload enablement and limits. When omitted, uploads are disabled by default (max\_files 10, max\_file\_size 512 MB).
Optional\<Boolean\> enabled
Enable uploads for this session. Defaults to false.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) enabled>)
Optional\<Long\> maxFileSize
Maximum size in megabytes for each uploaded file. Defaults to 512 MB, which is the maximum allowable size.
maximum512
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) max_file_size>)
Optional\<Long\> maxFiles
Maximum number of files that can be uploaded to the session. Defaults to 10.
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) max_files>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload>)
Optional\<History\> history
Configuration for chat history retention. When omitted, history is enabled by default with no limit on recent\_threads (null).
Optional\<Boolean\> enabled
Enables chat users to access previous ChatKit threads. Defaults to true.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history > (property) enabled>)
Optional\<Long\> recentThreads
Number of recent ChatKit threads users have access to. Defaults to unlimited when unset.
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history > (property) recent_threads>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema)>)
class ChatSessionExpiresAfterParam:
Controls when the session expires relative to an anchor timestamp.
JsonValue; anchor "created\_at"constant"created\_at"constant
Base timestamp used to calculate expiration. Currently fixed to `created\_at`.
[](<#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema) > (property) anchor>)
long seconds
Number of seconds after the anchor when the session expires.
maximum600
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema) > (property) seconds>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema)>)
class ChatSessionFileUpload:
Upload permissions and limits applied to the session.
boolean enabled
Indicates if uploads are enabled for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) enabled>)
Optional\<Long\> maxFileSize
Maximum upload size in megabytes.
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_file_size>)
Optional\<Long\> maxFiles
Maximum number of uploads allowed during the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_files>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema)>)
class ChatSessionHistory:
History retention preferences returned for the session.
boolean enabled
Indicates if chat history is persisted for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) enabled>)
Optional\<Long\> recentThreads
Number of prior threads surfaced in history views. Defaults to null when all history is retained.
[](<#(resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) recent_threads>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_history > (schema)>)
class ChatSessionRateLimits:
Active per-minute request limit for the session.
long maxRequestsPer1Minute
Maximum allowed requests per one-minute window.
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema) > (property) max_requests_per_1_minute>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema)>)
class ChatSessionRateLimitsParam:
Controls request rate limits for the session.
Optional\<Long\> maxRequestsPer1Minute
Maximum number of requests allowed per minute for the session. Defaults to 10.
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits_param > (schema) > (property) max_requests_per_1_minute>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits_param > (schema)>)
enum ChatSessionStatus:
ACTIVE("active")
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 0>)
EXPIRED("expired")
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 1>)
CANCELLED("cancelled")
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>)
class ChatSessionWorkflowParam:
Workflow reference and overrides applied to the chat session.
String id
Identifier for the workflow invoked by the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) id>)
Optional\<StateVariables\> stateVariables
State variables forwarded to the workflow. Keys may be up to 64 characters, values must be primitive types, and the map defaults to an empty object.
One of the following:
String
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 0>)
boolean
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 1>)
double
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables>)
Optional\<Tracing\> tracing
Optional tracing overrides for the workflow invocation. When omitted, tracing is enabled by default.
Optional\<Boolean\> enabled
Whether tracing is enabled during the session. Defaults to true.
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) tracing > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) tracing>)
Optional\<String\> version
Specific workflow version to run. Defaults to the latest deployed version.
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) version>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema)>)
class ChatKitAttachment:
Attachment metadata included on thread items.
String id
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
String mimeType
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
String name
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
Optional\<String\> previewUrl
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
Type type
Attachment discriminator.
One of the following:
IMAGE("image")
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
FILE("file")
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>)
class ChatKitResponseOutputText:
Assistant response text accompanied by optional annotations.
List\<Annotation\> annotations
Ordered list of annotations attached to the response text.
One of the following:
class File:
Annotation that references an uploaded file.
Source source
File attachment referenced by the annotation.
String filename
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
JsonValue; type "file"constant"file"constant
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
JsonValue; type "file"constant"file"constant
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
class Url:
Annotation that references a URL.
Source source
URL referenced by the annotation.
JsonValue; type "url"constant"url"constant
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
String url
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
JsonValue; type "url"constant"url"constant
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
String text
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>)
class ChatKitThread:
Represents a ChatKit thread and its current status.
String id
Identifier of the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) id>)
long createdAt
Unix timestamp (in seconds) for when the thread was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) created_at>)
JsonValue; object\_ "chatkit.thread"constant"chatkit.thread"constant
Type discriminator that is always `chatkit.thread`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) object>)
Status status
Current status for the thread. Defaults to `active` for newly created threads.
One of the following:
JsonValue;
JsonValue; type "active"constant"active"constant
Status discriminator that is always `active`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0>)
class Locked:
Indicates that a thread is locked and cannot accept new input.
Optional\<String\> reason
Reason that the thread was locked. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) reason>)
JsonValue; type "locked"constant"locked"constant
Status discriminator that is always `locked`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1>)
class Closed:
Indicates that a thread has been closed.
Optional\<String\> reason
Reason that the thread was closed. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) reason>)
JsonValue; type "closed"constant"closed"constant
Status discriminator that is always `closed`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status>)
Optional\<String\> title
Optional human-readable title for the thread. Defaults to null when no title has been generated.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) title>)
String user
Free-form string that identifies your end user who owns the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) user>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>)
class ChatKitThreadAssistantMessageItem:
Assistant-authored message within a thread.
String id
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) id>)
List\<[ChatKitResponseOutputText](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>)\> content
Ordered assistant response segments.
List\<Annotation\> annotations
Ordered list of annotations attached to the response text.
One of the following:
class File:
Annotation that references an uploaded file.
Source source
File attachment referenced by the annotation.
String filename
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
JsonValue; type "file"constant"file"constant
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
JsonValue; type "file"constant"file"constant
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
class Url:
Annotation that references a URL.
Source source
URL referenced by the annotation.
JsonValue; type "url"constant"url"constant
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
String url
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
JsonValue; type "url"constant"url"constant
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
String text
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) content>)
long createdAt
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) created_at>)
JsonValue; object\_ "chatkit.thread\_item"constant"chatkit.thread\_item"constant
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) object>)
String threadId
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) thread_id>)
JsonValue; type "chatkit.assistant\_message"constant"chatkit.assistant\_message"constant
Type discriminator that is always `chatkit.assistant\_message`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>)
class ChatKitThreadItemList:
A paginated list of thread items rendered for the ChatKit API.
List\<Data\> data
A list of items
One of the following:
class ChatKitThreadUserMessageItem:
User-authored messages within a thread.
String id
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) id>)
List\<[ChatKitAttachment](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>)\> attachments
Attachments associated with the user message. Defaults to an empty list.
String id
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
String mimeType
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
String name
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
Optional\<String\> previewUrl
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
Type type
Attachment discriminator.
One of the following:
IMAGE("image")
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
FILE("file")
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) attachments>)
List\<Content\> content
Ordered content elements supplied by the user.
One of the following:
class InputText:
Text block that a user contributed to the thread.
String text
Plain-text content supplied by the user.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
Type discriminator that is always `input\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0>)
class QuotedText:
Quoted snippet that the user referenced in their message.
String text
Quoted text content.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) text>)
JsonValue; type "quoted\_text"constant"quoted\_text"constant
Type discriminator that is always `quoted\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content>)
long createdAt
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) created_at>)
Optional\<InferenceOptions\> inferenceOptions
Inference overrides applied to the message. Defaults to null when unset.
Optional\<String\> model
Model name that generated the response. Defaults to null when using the session default.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) model>)
Optional\<ToolChoice\> toolChoice
Preferred tool to invoke. Defaults to null when ChatKit should auto-select.
String id
Identifier of the requested tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice > (property) id>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options>)
JsonValue; object\_ "chatkit.thread\_item"constant"chatkit.thread\_item"constant
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) object>)
String threadId
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) thread_id>)
JsonValue; type "chatkit.user\_message"constant"chatkit.user\_message"constant
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>)
class ChatKitThreadAssistantMessageItem:
Assistant-authored message within a thread.
String id
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) id>)
List\<[ChatKitResponseOutputText](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>)\> content
Ordered assistant response segments.
List\<Annotation\> annotations
Ordered list of annotations attached to the response text.
One of the following:
class File:
Annotation that references an uploaded file.
Source source
File attachment referenced by the annotation.
String filename
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
JsonValue; type "file"constant"file"constant
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
JsonValue; type "file"constant"file"constant
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
class Url:
Annotation that references a URL.
Source source
URL referenced by the annotation.
JsonValue; type "url"constant"url"constant
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
String url
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
JsonValue; type "url"constant"url"constant
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
String text
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) content>)
long createdAt
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) created_at>)
JsonValue; object\_ "chatkit.thread\_item"constant"chatkit.thread\_item"constant
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) object>)
String threadId
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) thread_id>)
JsonValue; type "chatkit.assistant\_message"constant"chatkit.assistant\_message"constant
Type discriminator that is always `chatkit.assistant\_message`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>)
class ChatKitWidgetItem:
Thread item that renders a widget payload.
String id
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) id>)
long createdAt
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) created_at>)
JsonValue; object\_ "chatkit.thread\_item"constant"chatkit.thread\_item"constant
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) object>)
String threadId
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) thread_id>)
JsonValue; type "chatkit.widget"constant"chatkit.widget"constant
Type discriminator that is always `chatkit.widget`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) type>)
String widget
Serialized widget payload rendered in the UI.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) widget>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>)
class ChatKitClientToolCall:
Record of a client side tool invocation initiated by the assistant.
String id
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) id>)
String arguments
JSON-encoded arguments that were sent to the tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) arguments>)
String callId
Identifier for the client tool call.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) call_id>)
long createdAt
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) created_at>)
String name
Tool name that was invoked.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) name>)
JsonValue; object\_ "chatkit.thread\_item"constant"chatkit.thread\_item"constant
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) object>)
Optional\<String\> output
JSON-encoded output captured from the tool. Defaults to null while execution is in progress.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) output>)
Status status
Execution status for the tool call.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status>)
String threadId
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) thread_id>)
JsonValue; type "chatkit.client\_tool\_call"constant"chatkit.client\_tool\_call"constant
Type discriminator that is always `chatkit.client\_tool\_call`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3>)
class ChatKitTask:
Task emitted by the workflow to show progress and status updates.
String id
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) id>)
long createdAt
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) created_at>)
Optional\<String\> heading
Optional heading for the task. Defaults to null when not provided.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) heading>)
JsonValue; object\_ "chatkit.thread\_item"constant"chatkit.thread\_item"constant
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) object>)
Optional\<String\> summary
Optional summary that describes the task. Defaults to null when omitted.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) summary>)
TaskType taskType
Subtype for the task.
One of the following:
CUSTOM("custom")
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type > (member) 0>)
THOUGHT("thought")
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type>)
String threadId
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) thread_id>)
JsonValue; type "chatkit.task"constant"chatkit.task"constant
Type discriminator that is always `chatkit.task`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4>)
class ChatKitTaskGroup:
Collection of workflow tasks grouped together in the thread.
String id
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) id>)
long createdAt
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) created_at>)
JsonValue; object\_ "chatkit.thread\_item"constant"chatkit.thread\_item"constant
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) object>)
List\<Task\> tasks
Tasks included in the group.
Optional\<String\> heading
Optional heading for the grouped task. Defaults to null when not provided.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) heading>)
Optional\<String\> summary
Optional summary that describes the grouped task. Defaults to null when omitted.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) summary>)
Type type
Subtype for the grouped task.
One of the following:
CUSTOM("custom")
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type > (member) 0>)
THOUGHT("thought")
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks>)
String threadId
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) thread_id>)
JsonValue; type "chatkit.task\_group"constant"chatkit.task\_group"constant
Type discriminator that is always `chatkit.task\_group`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data>)
Optional\<String\> firstId
The ID of the first item in the list.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) first_id>)
boolean hasMore
Whether there are more items available.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) has_more>)
Optional\<String\> lastId
The ID of the last item in the list.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) last_id>)
JsonValue; object\_ "list"constant"list"constant
The type of object returned, must be `list`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) object>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema)>)
class ChatKitThreadUserMessageItem:
User-authored messages within a thread.
String id
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) id>)
List\<[ChatKitAttachment](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>)\> attachments
Attachments associated with the user message. Defaults to an empty list.
String id
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
String mimeType
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
String name
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
Optional\<String\> previewUrl
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
Type type
Attachment discriminator.
One of the following:
IMAGE("image")
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
FILE("file")
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) attachments>)
List\<Content\> content
Ordered content elements supplied by the user.
One of the following:
class InputText:
Text block that a user contributed to the thread.
String text
Plain-text content supplied by the user.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
Type discriminator that is always `input\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0>)
class QuotedText:
Quoted snippet that the user referenced in their message.
String text
Quoted text content.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) text>)
JsonValue; type "quoted\_text"constant"quoted\_text"constant
Type discriminator that is always `quoted\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content>)
long createdAt
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) created_at>)
Optional\<InferenceOptions\> inferenceOptions
Inference overrides applied to the message. Defaults to null when unset.
Optional\<String\> model
Model name that generated the response. Defaults to null when using the session default.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) model>)
Optional\<ToolChoice\> toolChoice
Preferred tool to invoke. Defaults to null when ChatKit should auto-select.
String id
Identifier of the requested tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice > (property) id>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options>)
JsonValue; object\_ "chatkit.thread\_item"constant"chatkit.thread\_item"constant
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) object>)
String threadId
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) thread_id>)
JsonValue; type "chatkit.user\_message"constant"chatkit.user\_message"constant
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>)
class ChatKitWidgetItem:
Thread item that renders a widget payload.
String id
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) id>)
long createdAt
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) created_at>)
JsonValue; object\_ "chatkit.thread\_item"constant"chatkit.thread\_item"constant
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) object>)
String threadId
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) thread_id>)
JsonValue; type "chatkit.widget"constant"chatkit.widget"constant
Type discriminator that is always `chatkit.widget`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) type>)
String widget
Serialized widget payload rendered in the UI.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) widget>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>)
#### BetaAssistants
Build Assistants that can call models and use tools.
##### [List assistants](/api/reference/java/resources/beta/subresources/assistants/methods/list)
Deprecated
AssistantListPage beta().assistants().list(AssistantListParamsparams = AssistantListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/assistants
##### [Create assistant](/api/reference/java/resources/beta/subresources/assistants/methods/create)
Deprecated
[Assistant](</api/reference/java/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>) beta().assistants().create(AssistantCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/assistants
##### [Retrieve assistant](/api/reference/java/resources/beta/subresources/assistants/methods/retrieve)
Deprecated
[Assistant](</api/reference/java/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>) beta().assistants().retrieve(AssistantRetrieveParamsparams = AssistantRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/assistants/{assistant\_id}
##### [Modify assistant](/api/reference/java/resources/beta/subresources/assistants/methods/update)
Deprecated
[Assistant](</api/reference/java/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>) beta().assistants().update(AssistantUpdateParamsparams = AssistantUpdateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/assistants/{assistant\_id}
##### [Delete assistant](/api/reference/java/resources/beta/subresources/assistants/methods/delete)
Deprecated
[AssistantDeleted](</api/reference/java/resources/beta#(resource) beta.assistants > (model) assistant_deleted > (schema)>) beta().assistants().delete(AssistantDeleteParamsparams = AssistantDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/assistants/{assistant\_id}
##### ModelsExpand Collapse
class Assistant:
Represents an `assistant` that can call the model and use tools.
String id
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) for when the assistant was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) created_at>)
Optional\<String\> description
The description of the assistant. The maximum length is 512 characters.
maxLength512
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) description>)
Optional\<String\> instructions
The system instructions that the assistant uses. The maximum length is 256,000 characters.
maxLength256000
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) instructions>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) metadata>)
String model
ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) model>)
Optional\<String\> name
The name of the assistant. The maximum length is 256 characters.
maxLength256
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) name>)
JsonValue; object\_ "assistant"constant"assistant"constant
The object type, which is always `assistant`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) object>)
List\<[AssistantTool](</api/reference/java/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)\> tools
A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterTool:
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class FileSearchTool:
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
Optional\<FileSearch\> fileSearch
Overrides for the file search tool.
Optional\<Long\> maxNumResults
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
Optional\<RankingOptions\> rankingOptions
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
double scoreThreshold
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Optional\<Ranker\> ranker
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
AUTO("auto")
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
DEFAULT\_2024\_08\_21("default\_2024\_08\_21")
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
class FunctionTool:
[FunctionDefinition](</api/reference/java/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) function
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tools>)
Optional\<[AssistantResponseFormatOption](</api/reference/java/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)\> responseFormat
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format>)
Optional\<Double\> temperature
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
minimum0
maximum2
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) temperature>)
Optional\<ToolResources\> toolResources
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
Optional\<CodeInterpreter\> codeInterpreter
Optional\<List\<String\>\> fileIds
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter“ tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter>)
Optional\<FileSearch\> fileSearch
Optional\<List\<String\>\> vectorStoreIds
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources>)
Optional\<Double\> topP
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant > (schema)>)
class AssistantDeleted:
String id
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "assistant.deleted"constant"assistant.deleted"constant
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema)>)
class AssistantStreamEvent: A class that can be one of several variants.union
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
ThreadCreated
[Thread](</api/reference/java/resources/beta#(resource) beta.threads > (model) thread > (schema)>) data
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data>)
JsonValue; event "thread.created"constant"thread.created"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) event>)
Optional\<Boolean\> enabled
Whether to enable input audio transcription.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) enabled>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0>)
ThreadRunCreated
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data>)
JsonValue; event "thread.run.created"constant"thread.run.created"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1>)
ThreadRunQueued
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data>)
JsonValue; event "thread.run.queued"constant"thread.run.queued"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2>)
ThreadRunInProgress
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data>)
JsonValue; event "thread.run.in\_progress"constant"thread.run.in\_progress"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3>)
ThreadRunRequiresAction
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data>)
JsonValue; event "thread.run.requires\_action"constant"thread.run.requires\_action"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4>)
ThreadRunCompleted
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data>)
JsonValue; event "thread.run.completed"constant"thread.run.completed"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5>)
ThreadRunIncomplete
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data>)
JsonValue; event "thread.run.incomplete"constant"thread.run.incomplete"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6>)
ThreadRunFailed
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data>)
JsonValue; event "thread.run.failed"constant"thread.run.failed"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7>)
ThreadRunCancelling
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data>)
JsonValue; event "thread.run.cancelling"constant"thread.run.cancelling"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8>)
ThreadRunCancelled
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data>)
JsonValue; event "thread.run.cancelled"constant"thread.run.cancelled"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9>)
ThreadRunExpired
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data>)
JsonValue; event "thread.run.expired"constant"thread.run.expired"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10>)
ThreadRunStepCreated
[RunStep](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) data
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data>)
JsonValue; event "thread.run.step.created"constant"thread.run.step.created"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11>)
ThreadRunStepInProgress
[RunStep](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) data
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data>)
JsonValue; event "thread.run.step.in\_progress"constant"thread.run.step.in\_progress"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12>)
ThreadRunStepDelta
[RunStepDeltaEvent](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>) data
Represents a run step delta i.e. any changed fields on a run step during streaming.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data>)
JsonValue; event "thread.run.step.delta"constant"thread.run.step.delta"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13>)
ThreadRunStepCompleted
[RunStep](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) data
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data>)
JsonValue; event "thread.run.step.completed"constant"thread.run.step.completed"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14>)
ThreadRunStepFailed
[RunStep](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) data
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data>)
JsonValue; event "thread.run.step.failed"constant"thread.run.step.failed"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15>)
ThreadRunStepCancelled
[RunStep](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) data
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data>)
JsonValue; event "thread.run.step.cancelled"constant"thread.run.step.cancelled"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16>)
ThreadRunStepExpired
[RunStep](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) data
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data>)
JsonValue; event "thread.run.step.expired"constant"thread.run.step.expired"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17>)
ThreadMessageCreated
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) data
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data>)
JsonValue; event "thread.message.created"constant"thread.message.created"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18>)
ThreadMessageInProgress
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) data
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data>)
JsonValue; event "thread.message.in\_progress"constant"thread.message.in\_progress"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19>)
ThreadMessageDelta
[MessageDeltaEvent](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message_delta_event > (schema)>) data
Represents a message delta i.e. any changed fields on a message during streaming.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) data>)
JsonValue; event "thread.message.delta"constant"thread.message.delta"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20>)
ThreadMessageCompleted
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) data
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data>)
JsonValue; event "thread.message.completed"constant"thread.message.completed"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21>)
ThreadMessageIncomplete
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) data
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data>)
JsonValue; event "thread.message.incomplete"constant"thread.message.incomplete"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22>)
ErrorEvent
[ErrorObject](</api/reference/java/resources/$shared#(resource) $shared > (model) error_object > (schema)>) data
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data>)
JsonValue; event "error"constant"error"constant
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema)>)
class AssistantTool: A class that can be one of several variants.union
class CodeInterpreterTool:
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class FileSearchTool:
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
Optional\<FileSearch\> fileSearch
Overrides for the file search tool.
Optional\<Long\> maxNumResults
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
Optional\<RankingOptions\> rankingOptions
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
double scoreThreshold
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Optional\<Ranker\> ranker
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
AUTO("auto")
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
DEFAULT\_2024\_08\_21("default\_2024\_08\_21")
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
class FunctionTool:
[FunctionDefinition](</api/reference/java/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) function
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_tool > (schema)>)
class CodeInterpreterTool:
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class FileSearchTool:
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
Optional\<FileSearch\> fileSearch
Overrides for the file search tool.
Optional\<Long\> maxNumResults
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
Optional\<RankingOptions\> rankingOptions
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
double scoreThreshold
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Optional\<Ranker\> ranker
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
AUTO("auto")
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
DEFAULT\_2024\_08\_21("default\_2024\_08\_21")
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
class FunctionTool:
[FunctionDefinition](</api/reference/java/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) function
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
class MessageStreamEvent: A class that can be one of several variants.union
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is created.
ThreadMessageCreated
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) data
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0 > (property) data>)
JsonValue; event "thread.message.created"constant"thread.message.created"constant
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0>)
ThreadMessageInProgress
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) data
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1 > (property) data>)
JsonValue; event "thread.message.in\_progress"constant"thread.message.in\_progress"constant
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1>)
ThreadMessageDelta
[MessageDeltaEvent](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message_delta_event > (schema)>) data
Represents a message delta i.e. any changed fields on a message during streaming.
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2 > (property) data>)
JsonValue; event "thread.message.delta"constant"thread.message.delta"constant
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2>)
ThreadMessageCompleted
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) data
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3 > (property) data>)
JsonValue; event "thread.message.completed"constant"thread.message.completed"constant
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3>)
ThreadMessageIncomplete
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) data
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4 > (property) data>)
JsonValue; event "thread.message.incomplete"constant"thread.message.incomplete"constant
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema)>)
class RunStepStreamEvent: A class that can be one of several variants.union
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is created.
ThreadRunStepCreated
[RunStep](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) data
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0 > (property) data>)
JsonValue; event "thread.run.step.created"constant"thread.run.step.created"constant
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0>)
ThreadRunStepInProgress
[RunStep](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) data
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1 > (property) data>)
JsonValue; event "thread.run.step.in\_progress"constant"thread.run.step.in\_progress"constant
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1>)
ThreadRunStepDelta
[RunStepDeltaEvent](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>) data
Represents a run step delta i.e. any changed fields on a run step during streaming.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2 > (property) data>)
JsonValue; event "thread.run.step.delta"constant"thread.run.step.delta"constant
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2>)
ThreadRunStepCompleted
[RunStep](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) data
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3 > (property) data>)
JsonValue; event "thread.run.step.completed"constant"thread.run.step.completed"constant
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3>)
ThreadRunStepFailed
[RunStep](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) data
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4 > (property) data>)
JsonValue; event "thread.run.step.failed"constant"thread.run.step.failed"constant
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4>)
ThreadRunStepCancelled
[RunStep](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) data
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5 > (property) data>)
JsonValue; event "thread.run.step.cancelled"constant"thread.run.step.cancelled"constant
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5>)
ThreadRunStepExpired
[RunStep](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) data
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6 > (property) data>)
JsonValue; event "thread.run.step.expired"constant"thread.run.step.expired"constant
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema)>)
class RunStreamEvent: A class that can be one of several variants.union
Occurs when a new [run](https://platform.openai.com/docs/api-reference/runs/object) is created.
ThreadRunCreated
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0 > (property) data>)
JsonValue; event "thread.run.created"constant"thread.run.created"constant
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0>)
ThreadRunQueued
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1 > (property) data>)
JsonValue; event "thread.run.queued"constant"thread.run.queued"constant
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1>)
ThreadRunInProgress
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2 > (property) data>)
JsonValue; event "thread.run.in\_progress"constant"thread.run.in\_progress"constant
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2>)
ThreadRunRequiresAction
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3 > (property) data>)
JsonValue; event "thread.run.requires\_action"constant"thread.run.requires\_action"constant
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3>)
ThreadRunCompleted
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4 > (property) data>)
JsonValue; event "thread.run.completed"constant"thread.run.completed"constant
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4>)
ThreadRunIncomplete
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5 > (property) data>)
JsonValue; event "thread.run.incomplete"constant"thread.run.incomplete"constant
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5>)
ThreadRunFailed
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6 > (property) data>)
JsonValue; event "thread.run.failed"constant"thread.run.failed"constant
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6>)
ThreadRunCancelling
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7 > (property) data>)
JsonValue; event "thread.run.cancelling"constant"thread.run.cancelling"constant
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7>)
ThreadRunCancelled
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8 > (property) data>)
JsonValue; event "thread.run.cancelled"constant"thread.run.cancelled"constant
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8>)
ThreadRunExpired
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) data
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9 > (property) data>)
JsonValue; event "thread.run.expired"constant"thread.run.expired"constant
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema)>)
class ThreadStreamEvent:
Occurs when a new [thread](https://platform.openai.com/docs/api-reference/threads/object) is created.
[Thread](</api/reference/java/resources/beta#(resource) beta.threads > (model) thread > (schema)>) data
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) data>)
JsonValue; event "thread.created"constant"thread.created"constant
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) event>)
Optional\<Boolean\> enabled
Whether to enable input audio transcription.
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) enabled>)
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema)>)
#### BetaThreads
Build Assistants that can call models and use tools.
##### [Create thread](/api/reference/java/resources/beta/subresources/threads/methods/create)
Deprecated
[Thread](</api/reference/java/resources/beta#(resource) beta.threads > (model) thread > (schema)>) beta().threads().create(ThreadCreateParamsparams = ThreadCreateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/threads
##### [Create thread and run](/api/reference/java/resources/beta/subresources/threads/methods/create_and_run)
Deprecated
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) beta().threads().createAndRun(ThreadCreateAndRunParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/runs
##### [Retrieve thread](/api/reference/java/resources/beta/subresources/threads/methods/retrieve)
Deprecated
[Thread](</api/reference/java/resources/beta#(resource) beta.threads > (model) thread > (schema)>) beta().threads().retrieve(ThreadRetrieveParamsparams = ThreadRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}
##### [Modify thread](/api/reference/java/resources/beta/subresources/threads/methods/update)
Deprecated
[Thread](</api/reference/java/resources/beta#(resource) beta.threads > (model) thread > (schema)>) beta().threads().update(ThreadUpdateParamsparams = ThreadUpdateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/{thread\_id}
##### [Delete thread](/api/reference/java/resources/beta/subresources/threads/methods/delete)
Deprecated
[ThreadDeleted](</api/reference/java/resources/beta#(resource) beta.threads > (model) thread_deleted > (schema)>) beta().threads().delete(ThreadDeleteParamsparams = ThreadDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/threads/{thread\_id}
##### ModelsExpand Collapse
class AssistantResponseFormatOption: A class that can be one of several variants.union
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
JsonValue;
[](<#(resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
class ResponseFormatText:
Default response format. Used to generate text responses.
JsonValue; type "text"constant"text"constant
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
class ResponseFormatJsonObject:
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
JsonValue; type "json\_object"constant"json\_object"constant
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
class ResponseFormatJsonSchema:
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JsonSchema jsonSchema
Structured Outputs configuration options, including a JSON Schema.
String name
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Optional\<String\> description
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Optional\<Schema\> schema
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Optional\<Boolean\> strict
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
JsonValue; type "json\_schema"constant"json\_schema"constant
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
class AssistantToolChoice:
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type type
The type of the tool. If type is `function`, the function name must be set
One of the following:
FUNCTION("function")
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
CODE\_INTERPRETER("code\_interpreter")
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
FILE\_SEARCH("file\_search")
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Optional\<[AssistantToolChoiceFunction](</api/reference/java/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)\> function
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema)>)
class AssistantToolChoiceFunction:
String name
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)
class AssistantToolChoiceOption: A class that can be one of several variants.union
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
Auto
One of the following:
NONE("none")
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
AUTO("auto")
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
REQUIRED("required")
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
class AssistantToolChoice:
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type type
The type of the tool. If type is `function`, the function name must be set
One of the following:
FUNCTION("function")
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
CODE\_INTERPRETER("code\_interpreter")
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
FILE\_SEARCH("file\_search")
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Optional\<[AssistantToolChoiceFunction](</api/reference/java/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)\> function
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
class Thread:
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
String id
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) for when the thread was created.
formatunixtime
[](<#(resource) beta.threads > (model) thread > (schema) > (property) created_at>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) metadata>)
JsonValue; object\_ "thread"constant"thread"constant
The object type, which is always `thread`.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) object>)
Optional\<ToolResources\> toolResources
A set of resources that are made available to the assistant’s tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
Optional\<CodeInterpreter\> codeInterpreter
Optional\<List\<String\>\> fileIds
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter>)
Optional\<FileSearch\> fileSearch
Optional\<List\<String\>\> vectorStoreIds
The [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources>)
[](<#(resource) beta.threads > (model) thread > (schema)>)
class ThreadDeleted:
String id
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "thread.deleted"constant"thread.deleted"constant
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads > (model) thread_deleted > (schema)>)
#### BetaThreadsRuns
Build Assistants that can call models and use tools.
##### [List runs](/api/reference/java/resources/beta/subresources/threads/subresources/runs/methods/list)
Deprecated
RunListPage beta().threads().runs().list(RunListParamsparams = RunListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}/runs
##### [Create run](/api/reference/java/resources/beta/subresources/threads/subresources/runs/methods/create)
Deprecated
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) beta().threads().runs().create(RunCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/{thread\_id}/runs
##### [Retrieve run](/api/reference/java/resources/beta/subresources/threads/subresources/runs/methods/retrieve)
Deprecated
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) beta().threads().runs().retrieve(RunRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}/runs/{run\_id}
##### [Modify run](/api/reference/java/resources/beta/subresources/threads/subresources/runs/methods/update)
Deprecated
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) beta().threads().runs().update(RunUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/{thread\_id}/runs/{run\_id}
##### [Submit tool outputs to run](/api/reference/java/resources/beta/subresources/threads/subresources/runs/methods/submit_tool_outputs)
Deprecated
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) beta().threads().runs().submitToolOutputs(RunSubmitToolOutputsParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/{thread\_id}/runs/{run\_id}/submit\_tool\_outputs
##### [Cancel a run](/api/reference/java/resources/beta/subresources/threads/subresources/runs/methods/cancel)
Deprecated
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) beta().threads().runs().cancel(RunCancelParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/{thread\_id}/runs/{run\_id}/cancel
##### ModelsExpand Collapse
class RequiredActionFunctionToolCall:
Tool call objects
String id
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function function
The function definition.
String arguments
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
String name
The name of the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
class Run:
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
String id
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) id>)
String assistantId
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
Optional\<Long\> cancelledAt
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
Optional\<Long\> completedAt
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
long createdAt
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
Optional\<Long\> expiresAt
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
Optional\<Long\> failedAt
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
Optional\<IncompleteDetails\> incompleteDetails
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
Optional\<Reason\> reason
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
MAX\_COMPLETION\_TOKENS("max\_completion\_tokens")
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
MAX\_PROMPT\_TOKENS("max\_prompt\_tokens")
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
String instructions
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
Optional\<LastError\> lastError
The last error associated with this run. Will be `null` if there are no errors.
Code code
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
SERVER\_ERROR("server\_error")
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
RATE\_LIMIT\_EXCEEDED("rate\_limit\_exceeded")
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
INVALID\_PROMPT("invalid\_prompt")
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
String message
A human-readable description of the error.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
Optional\<Long\> maxCompletionTokens
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
Optional\<Long\> maxPromptTokens
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
String model
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) model>)
JsonValue; object\_ "thread.run"constant"thread.run"constant
The object type, which is always `thread.run`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) object>)
boolean parallelToolCalls
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
Optional\<RequiredAction\> requiredAction
Details on the action required to continue the run. Will be `null` if no action is required.
SubmitToolOutputs submitToolOutputs
Details on the tool outputs needed for this run to continue.
List\<[RequiredActionFunctionToolCall](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)\> toolCalls
A list of the relevant tool calls.
String id
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function function
The function definition.
String arguments
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
String name
The name of the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
JsonValue; type "submit\_tool\_outputs"constant"submit\_tool\_outputs"constant
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
Optional\<[AssistantResponseFormatOption](</api/reference/java/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)\> responseFormat
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
Optional\<Long\> startedAt
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
[RunStatus](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) status
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status>)
String threadId
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
Optional\<[AssistantToolChoiceOption](</api/reference/java/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)\> toolChoice
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
List\<[AssistantTool](</api/reference/java/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)\> tools
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
class CodeInterpreterTool:
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class FileSearchTool:
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
Optional\<FileSearch\> fileSearch
Overrides for the file search tool.
Optional\<Long\> maxNumResults
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
Optional\<RankingOptions\> rankingOptions
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
double scoreThreshold
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Optional\<Ranker\> ranker
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
AUTO("auto")
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
DEFAULT\_2024\_08\_21("default\_2024\_08\_21")
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
class FunctionTool:
[FunctionDefinition](</api/reference/java/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) function
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
Optional\<TruncationStrategy\> truncationStrategy
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
Type type
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
LAST\_MESSAGES("last\_messages")
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
Optional\<Long\> lastMessages
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
Optional\<Usage\> usage
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
long completionTokens
Number of completion tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
long promptTokens
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
long totalTokens
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
Optional\<Double\> temperature
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
Optional\<Double\> topP
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.threads.runs > (model) run > (schema)>)
enum RunStatus:
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
QUEUED("queued")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
IN\_PROGRESS("in\_progress")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
REQUIRES\_ACTION("requires\_action")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
CANCELLING("cancelling")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
CANCELLED("cancelled")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
FAILED("failed")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
COMPLETED("completed")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
INCOMPLETE("incomplete")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
EXPIRED("expired")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.threads.runs > (model) run_status > (schema)>)
#### BetaThreadsRunsSteps
Build Assistants that can call models and use tools.
##### [List run steps](/api/reference/java/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/list)
Deprecated
StepListPage beta().threads().runs().steps().list(StepListParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}/runs/{run\_id}/steps
##### [Retrieve run step](/api/reference/java/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/retrieve)
Deprecated
[RunStep](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) beta().threads().runs().steps().retrieve(StepRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}/runs/{run\_id}/steps/{step\_id}
##### ModelsExpand Collapse
class CodeInterpreterLogs:
Text output from the Code Interpreter tool call as part of a run step.
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
JsonValue; type "logs"constant"logs"constant
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Optional\<String\> logs
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage:
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
JsonValue; type "image"constant"image"constant
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Optional\<Image\> image
Optional\<String\> fileId
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
class CodeInterpreterToolCall:
Details of the Code Interpreter tool call the run step was involved in.
String id
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter codeInterpreter
The Code Interpreter tool call definition.
String input
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
List\<Output\> outputs
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class LogsOutput:
Text output from the Code Interpreter tool call as part of a run step.
String logs
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
JsonValue; type "logs"constant"logs"constant
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
class ImageOutput:
Image image
String fileId
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
JsonValue; type "image"constant"image"constant
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
class CodeInterpreterToolCallDelta:
Details of the Code Interpreter tool call the run step was involved in.
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
Optional\<CodeInterpreter\> codeInterpreter
The Code Interpreter tool call definition.
Optional\<String\> input
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Optional\<List\<Output\>\> outputs
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterLogs:
Text output from the Code Interpreter tool call as part of a run step.
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
JsonValue; type "logs"constant"logs"constant
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Optional\<String\> logs
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage:
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
JsonValue; type "image"constant"image"constant
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Optional\<Image\> image
Optional\<String\> fileId
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
class FileSearchToolCall:
String id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch fileSearch
For now, this is always going to be an empty object.
Optional\<RankingOptions\> rankingOptions
The ranking options for the file search.
Ranker ranker
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
DEFAULT\_2024\_08\_21("default\_2024\_08\_21")
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
double scoreThreshold
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Optional\<List\<Result\>\> results
The results of the file search.
String fileId
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
String fileName
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
double score
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Optional\<List\<Content\>\> content
The content of the result that was found. The content is only included if requested via the include query parameter.
Optional\<String\> text
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Optional\<Type\> type
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
class FileSearchToolCallDelta:
JsonValue fileSearch
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
class FunctionToolCall:
String id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function function
The definition of the function that was called.
String arguments
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
String name
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Optional\<String\> output
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
class FunctionToolCallDelta:
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
JsonValue; type "function"constant"function"constant
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Optional\<Function\> function
The definition of the function that was called.
Optional\<String\> arguments
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Optional\<String\> name
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Optional\<String\> output
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
class MessageCreationStepDetails:
Details of the message creation by the run step.
MessageCreation messageCreation
String messageId
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
JsonValue; type "message\_creation"constant"message\_creation"constant
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
class RunStep:
Represents a step in execution of a run.
String id
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
String assistantId
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
Optional\<Long\> cancelledAt
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
Optional\<Long\> completedAt
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
long createdAt
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
Optional\<Long\> expiredAt
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
Optional\<Long\> failedAt
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
Optional\<LastError\> lastError
The last error associated with this run step. Will be `null` if there are no errors.
Code code
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
SERVER\_ERROR("server\_error")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
RATE\_LIMIT\_EXCEEDED("rate\_limit\_exceeded")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
String message
A human-readable description of the error.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
JsonValue; object\_ "thread.run.step"constant"thread.run.step"constant
The object type, which is always `thread.run.step`.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
String runId
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
Status status
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
CANCELLED("cancelled")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
FAILED("failed")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
COMPLETED("completed")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
EXPIRED("expired")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
StepDetails stepDetails
The details of the run step.
One of the following:
class MessageCreationStepDetails:
Details of the message creation by the run step.
MessageCreation messageCreation
String messageId
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
JsonValue; type "message\_creation"constant"message\_creation"constant
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
class ToolCallsStepDetails:
Details of the tool call.
List\<[ToolCall](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)\> toolCalls
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterToolCall:
Details of the Code Interpreter tool call the run step was involved in.
String id
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter codeInterpreter
The Code Interpreter tool call definition.
String input
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
List\<Output\> outputs
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class LogsOutput:
Text output from the Code Interpreter tool call as part of a run step.
String logs
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
JsonValue; type "logs"constant"logs"constant
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
class ImageOutput:
Image image
String fileId
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
JsonValue; type "image"constant"image"constant
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
class FileSearchToolCall:
String id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch fileSearch
For now, this is always going to be an empty object.
Optional\<RankingOptions\> rankingOptions
The ranking options for the file search.
Ranker ranker
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
DEFAULT\_2024\_08\_21("default\_2024\_08\_21")
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
double scoreThreshold
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Optional\<List\<Result\>\> results
The results of the file search.
String fileId
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
String fileName
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
double score
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Optional\<List\<Content\>\> content
The content of the result that was found. The content is only included if requested via the include query parameter.
Optional\<String\> text
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Optional\<Type\> type
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
class FunctionToolCall:
String id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function function
The definition of the function that was called.
String arguments
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
String name
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Optional\<String\> output
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
JsonValue; type "tool\_calls"constant"tool\_calls"constant
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
String threadId
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
Type type
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
MESSAGE\_CREATION("message\_creation")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
TOOL\_CALLS("tool\_calls")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
Optional\<Usage\> usage
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
long completionTokens
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
long promptTokens
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
long totalTokens
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
class RunStepDelta:
The delta containing the fields that have changed on the run step.
Optional\<StepDetails\> stepDetails
The details of the run step.
One of the following:
class RunStepDeltaMessageDelta:
Details of the message creation by the run step.
JsonValue; type "message\_creation"constant"message\_creation"constant
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
Optional\<MessageCreation\> messageCreation
Optional\<String\> messageId
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
class ToolCallDeltaObject:
Details of the tool call.
JsonValue; type "tool\_calls"constant"tool\_calls"constant
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
Optional\<List\<[ToolCallDelta](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)\>\> toolCalls
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterToolCallDelta:
Details of the Code Interpreter tool call the run step was involved in.
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
Optional\<CodeInterpreter\> codeInterpreter
The Code Interpreter tool call definition.
Optional\<String\> input
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Optional\<List\<Output\>\> outputs
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterLogs:
Text output from the Code Interpreter tool call as part of a run step.
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
JsonValue; type "logs"constant"logs"constant
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Optional\<String\> logs
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage:
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
JsonValue; type "image"constant"image"constant
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Optional\<Image\> image
Optional\<String\> fileId
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
class FileSearchToolCallDelta:
JsonValue fileSearch
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
class FunctionToolCallDelta:
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
JsonValue; type "function"constant"function"constant
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Optional\<Function\> function
The definition of the function that was called.
Optional\<String\> arguments
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Optional\<String\> name
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Optional\<String\> output
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema) > (property) step_details>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema)>)
class RunStepDeltaEvent:
Represents a run step delta i.e. any changed fields on a run step during streaming.
String id
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) id>)
[RunStepDelta](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema)>) delta
The delta containing the fields that have changed on the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta>)
JsonValue; object\_ "thread.run.step.delta"constant"thread.run.step.delta"constant
The object type, which is always `thread.run.step.delta`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>)
class RunStepDeltaMessageDelta:
Details of the message creation by the run step.
JsonValue; type "message\_creation"constant"message\_creation"constant
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
Optional\<MessageCreation\> messageCreation
Optional\<String\> messageId
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
enum RunStepInclude:
STEP\_DETAILS\_TOOL\_CALLS\_FILE\_SEARCH\_RESULTS\_CONTENT("step\_details.tool\_calls[\*].file\_search.results[\*].content")
[](<#(resource) beta.threads.runs.steps > (model) run_step_include > (schema) > (member) 0>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_include > (schema)>)
class ToolCall: A class that can be one of several variants.union
Details of the Code Interpreter tool call the run step was involved in.
class CodeInterpreterToolCall:
Details of the Code Interpreter tool call the run step was involved in.
String id
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter codeInterpreter
The Code Interpreter tool call definition.
String input
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
List\<Output\> outputs
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class LogsOutput:
Text output from the Code Interpreter tool call as part of a run step.
String logs
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
JsonValue; type "logs"constant"logs"constant
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
class ImageOutput:
Image image
String fileId
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
JsonValue; type "image"constant"image"constant
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
class FileSearchToolCall:
String id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch fileSearch
For now, this is always going to be an empty object.
Optional\<RankingOptions\> rankingOptions
The ranking options for the file search.
Ranker ranker
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
DEFAULT\_2024\_08\_21("default\_2024\_08\_21")
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
double scoreThreshold
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Optional\<List\<Result\>\> results
The results of the file search.
String fileId
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
String fileName
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
double score
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Optional\<List\<Content\>\> content
The content of the result that was found. The content is only included if requested via the include query parameter.
Optional\<String\> text
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Optional\<Type\> type
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
class FunctionToolCall:
String id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function function
The definition of the function that was called.
String arguments
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
String name
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Optional\<String\> output
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
class ToolCallDelta: A class that can be one of several variants.union
Details of the Code Interpreter tool call the run step was involved in.
class CodeInterpreterToolCallDelta:
Details of the Code Interpreter tool call the run step was involved in.
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
Optional\<CodeInterpreter\> codeInterpreter
The Code Interpreter tool call definition.
Optional\<String\> input
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Optional\<List\<Output\>\> outputs
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterLogs:
Text output from the Code Interpreter tool call as part of a run step.
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
JsonValue; type "logs"constant"logs"constant
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Optional\<String\> logs
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage:
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
JsonValue; type "image"constant"image"constant
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Optional\<Image\> image
Optional\<String\> fileId
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
class FileSearchToolCallDelta:
JsonValue fileSearch
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
class FunctionToolCallDelta:
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
JsonValue; type "function"constant"function"constant
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Optional\<Function\> function
The definition of the function that was called.
Optional\<String\> arguments
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Optional\<String\> name
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Optional\<String\> output
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)
class ToolCallDeltaObject:
Details of the tool call.
JsonValue; type "tool\_calls"constant"tool\_calls"constant
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
Optional\<List\<[ToolCallDelta](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)\>\> toolCalls
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterToolCallDelta:
Details of the Code Interpreter tool call the run step was involved in.
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
Optional\<CodeInterpreter\> codeInterpreter
The Code Interpreter tool call definition.
Optional\<String\> input
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Optional\<List\<Output\>\> outputs
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterLogs:
Text output from the Code Interpreter tool call as part of a run step.
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
JsonValue; type "logs"constant"logs"constant
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Optional\<String\> logs
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage:
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
JsonValue; type "image"constant"image"constant
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Optional\<Image\> image
Optional\<String\> fileId
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
class FileSearchToolCallDelta:
JsonValue fileSearch
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
class FunctionToolCallDelta:
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
JsonValue; type "function"constant"function"constant
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Optional\<Function\> function
The definition of the function that was called.
Optional\<String\> arguments
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Optional\<String\> name
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Optional\<String\> output
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
class ToolCallsStepDetails:
Details of the tool call.
List\<[ToolCall](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)\> toolCalls
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterToolCall:
Details of the Code Interpreter tool call the run step was involved in.
String id
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter codeInterpreter
The Code Interpreter tool call definition.
String input
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
List\<Output\> outputs
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class LogsOutput:
Text output from the Code Interpreter tool call as part of a run step.
String logs
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
JsonValue; type "logs"constant"logs"constant
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
class ImageOutput:
Image image
String fileId
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
JsonValue; type "image"constant"image"constant
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
class FileSearchToolCall:
String id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch fileSearch
For now, this is always going to be an empty object.
Optional\<RankingOptions\> rankingOptions
The ranking options for the file search.
Ranker ranker
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
DEFAULT\_2024\_08\_21("default\_2024\_08\_21")
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
double scoreThreshold
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Optional\<List\<Result\>\> results
The results of the file search.
String fileId
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
String fileName
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
double score
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Optional\<List\<Content\>\> content
The content of the result that was found. The content is only included if requested via the include query parameter.
Optional\<String\> text
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Optional\<Type\> type
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
class FunctionToolCall:
String id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function function
The definition of the function that was called.
String arguments
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
String name
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Optional\<String\> output
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
JsonValue; type "tool\_calls"constant"tool\_calls"constant
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
#### BetaThreadsMessages
Build Assistants that can call models and use tools.
##### [List messages](/api/reference/java/resources/beta/subresources/threads/subresources/messages/methods/list)
Deprecated
MessageListPage beta().threads().messages().list(MessageListParamsparams = MessageListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}/messages
##### [Create message](/api/reference/java/resources/beta/subresources/threads/subresources/messages/methods/create)
Deprecated
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) beta().threads().messages().create(MessageCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/{thread\_id}/messages
##### [Modify message](/api/reference/java/resources/beta/subresources/threads/subresources/messages/methods/update)
Deprecated
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) beta().threads().messages().update(MessageUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/{thread\_id}/messages/{message\_id}
##### [Retrieve message](/api/reference/java/resources/beta/subresources/threads/subresources/messages/methods/retrieve)
Deprecated
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) beta().threads().messages().retrieve(MessageRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}/messages/{message\_id}
##### [Delete message](/api/reference/java/resources/beta/subresources/threads/subresources/messages/methods/delete)
Deprecated
[MessageDeleted](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message_deleted > (schema)>) beta().threads().messages().delete(MessageDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/threads/{thread\_id}/messages/{message\_id}
##### ModelsExpand Collapse
class Annotation: A class that can be one of several variants.union
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
class FileCitationAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation fileCitation
String fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FilePathAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath filePath
String fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) annotation > (schema)>)
class AnnotationDelta: A class that can be one of several variants.union
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
class FileCitationDeltaAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
Optional\<FileCitation\> fileCitation
Optional\<String\> fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
Optional\<String\> quote
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathDeltaAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
Optional\<FilePath\> filePath
Optional\<String\> fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)
class FileCitationAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation fileCitation
String fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FileCitationDeltaAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
Optional\<FileCitation\> fileCitation
Optional\<String\> fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
Optional\<String\> quote
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath filePath
String fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
class FilePathDeltaAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
Optional\<FilePath\> filePath
Optional\<String\> fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
class ImageFile:
String fileId
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
Optional\<Detail\> detail
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_file > (schema)>)
class ImageFileContentBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
[ImageFile](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) imageFile
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageFileDelta:
Optional\<Detail\> detail
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail>)
Optional\<String\> fileId
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)
class ImageFileDeltaBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
Optional\<[ImageFileDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)\> imageFile
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class ImageUrl:
String url
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
Optional\<Detail\> detail
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_url > (schema)>)
class ImageUrlContentBlock:
References an image URL in the content of a message.
[ImageUrl](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class ImageUrlDelta:
Optional\<Detail\> detail
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail>)
Optional\<String\> url
The URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)
class ImageUrlDeltaBlock:
References an image URL in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
JsonValue; type "image\_url"constant"image\_url"constant
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
Optional\<[ImageUrlDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)\> imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
class Message:
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
String id
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) id>)
Optional\<String\> assistantId
If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
Optional\<List\<Attachment\>\> attachments
A list of files attached to the message, and the tools they were added to.
Optional\<String\> fileId
The ID of the file to attach to the message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
Optional\<List\<Tool\>\> tools
The tools to add this file to.
One of the following:
class CodeInterpreterTool:
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
JsonValue;
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool being defined: `file\_search`
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
Optional\<Long\> completedAt
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
List\<[MessageContent](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)\> content
The content of the message in array of text and/or images.
One of the following:
class ImageFileContentBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
[ImageFile](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) imageFile
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageUrlContentBlock:
References an image URL in the content of a message.
[ImageUrl](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlock:
The text content that is part of a message.
[Text](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) text
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class RefusalContentBlock:
The refusal content generated by the assistant.
String refusal
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) content>)
long createdAt
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
Optional\<Long\> incompleteAt
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
Optional\<IncompleteDetails\> incompleteDetails
On an incomplete message, details about why the message is incomplete.
Reason reason
The reason the message is incomplete.
One of the following:
CONTENT\_FILTER("content\_filter")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
MAX\_TOKENS("max\_tokens")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
RUN\_CANCELLED("run\_cancelled")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 2>)
RUN\_EXPIRED("run\_expired")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 3>)
RUN\_FAILED("run\_failed")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 4>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
JsonValue; object\_ "thread.message"constant"thread.message"constant
The object type, which is always `thread.message`.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) object>)
Role role
The entity that produced the message. One of `user` or `assistant`.
One of the following:
USER("user")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role>)
Optional\<String\> runId
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
Status status
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
INCOMPLETE("incomplete")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
COMPLETED("completed")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status>)
String threadId
The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.threads.messages > (model) message > (schema)>)
class MessageContent: A class that can be one of several variants.union
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
class ImageFileContentBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
[ImageFile](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) imageFile
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageUrlContentBlock:
References an image URL in the content of a message.
[ImageUrl](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlock:
The text content that is part of a message.
[Text](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) text
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class RefusalContentBlock:
The refusal content generated by the assistant.
String refusal
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content > (schema)>)
class MessageContentDelta: A class that can be one of several variants.union
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
class ImageFileDeltaBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
Optional\<[ImageFileDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)\> imageFile
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class TextDeltaBlock:
The text content that is part of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
Optional\<[TextDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>)\> text
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
class RefusalDeltaBlock:
The refusal content that is part of a message.
long index
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
Optional\<String\> refusal
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class ImageUrlDeltaBlock:
References an image URL in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
JsonValue; type "image\_url"constant"image\_url"constant
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
Optional\<[ImageUrlDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)\> imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)
class MessageContentPartParam: A class that can be one of several variants.union
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
class ImageFileContentBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
[ImageFile](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) imageFile
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageUrlContentBlock:
References an image URL in the content of a message.
[ImageUrl](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlockParam:
The text content that is part of a message.
String text
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content_part_param > (schema)>)
class MessageDeleted:
String id
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "thread.message.deleted"constant"thread.message.deleted"constant
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
class MessageDelta:
The delta containing the fields that have changed on the Message.
Optional\<List\<[MessageContentDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)\>\> content
The content of the message in array of text and/or images.
One of the following:
class ImageFileDeltaBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
Optional\<[ImageFileDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)\> imageFile
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class TextDeltaBlock:
The text content that is part of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
Optional\<[TextDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>)\> text
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
class RefusalDeltaBlock:
The refusal content that is part of a message.
long index
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
Optional\<String\> refusal
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class ImageUrlDeltaBlock:
References an image URL in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
JsonValue; type "image\_url"constant"image\_url"constant
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
Optional\<[ImageUrlDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)\> imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) content>)
Optional\<Role\> role
The entity that produced the message. One of `user` or `assistant`.
One of the following:
USER("user")
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema)>)
class MessageDeltaEvent:
Represents a message delta i.e. any changed fields on a message during streaming.
String id
The identifier of the message, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) id>)
[MessageDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message_delta > (schema)>) delta
The delta containing the fields that have changed on the Message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta>)
JsonValue; object\_ "thread.message.delta"constant"thread.message.delta"constant
The object type, which is always `thread.message.delta`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema)>)
class RefusalContentBlock:
The refusal content generated by the assistant.
String refusal
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
class RefusalDeltaBlock:
The refusal content that is part of a message.
long index
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
Optional\<String\> refusal
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class Text:
List\<[Annotation](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)\> annotations
One of the following:
class FileCitationAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation fileCitation
String fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FilePathAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath filePath
String fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
String value
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text > (schema)>)
class TextContentBlock:
The text content that is part of a message.
[Text](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) text
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class TextContentBlockParam:
The text content that is part of a message.
String text
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
class TextDelta:
Optional\<List\<[AnnotationDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)\>\> annotations
One of the following:
class FileCitationDeltaAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
Optional\<FileCitation\> fileCitation
Optional\<String\> fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
Optional\<String\> quote
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathDeltaAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
Optional\<FilePath\> filePath
Optional\<String\> fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) annotations>)
Optional\<String\> value
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema)>)
class TextDeltaBlock:
The text content that is part of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
Optional\<[TextDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>)\> text
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)