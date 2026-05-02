Beta | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Beta
#### BetaChatKit
##### ModelsExpand Collapse
type ChatKitWorkflow struct{…}
Workflow metadata and state returned for the session.
ID string
Identifier of the workflow backing the session.
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) id>)
StateVariables map[string, ChatKitWorkflowStateVariableUnion]
State variable key-value pairs applied when invoking the workflow. Defaults to null when no overrides were provided.
One of the following:
string
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 0>)
bool
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 1>)
float64
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 2>)
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables>)
Tracing ChatKitWorkflowTracing
Tracing settings applied to the workflow.
Enabled bool
Indicates whether tracing is enabled.
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing > (property) enabled>)
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing>)
Version string
Specific workflow version used for the session. Defaults to null when using the latest deployment.
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) version>)
[](<#(resource) beta.chatkit > (model) chatkit_workflow > (schema)>)
#### BetaChatKitSessions
##### [Cancel chat session](/api/reference/go/resources/beta/subresources/chatkit/subresources/sessions/methods/cancel)
client.Beta.ChatKit.Sessions.Cancel(ctx, sessionID) (\*[ChatSession](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session > (schema)>), error)
POST/chatkit/sessions/{session\_id}/cancel
##### [Create ChatKit session](/api/reference/go/resources/beta/subresources/chatkit/subresources/sessions/methods/create)
client.Beta.ChatKit.Sessions.New(ctx, body) (\*[ChatSession](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session > (schema)>), error)
POST/chatkit/sessions
#### BetaChatKitThreads
##### [List ChatKit thread items](/api/reference/go/resources/beta/subresources/chatkit/subresources/threads/methods/list_items)
client.Beta.ChatKit.Threads.ListItems(ctx, threadID, query) (\*ConversationCursorPage[ChatKitThreadItemListDataUnion], error)
GET/chatkit/threads/{thread\_id}/items
##### [Retrieve ChatKit thread](/api/reference/go/resources/beta/subresources/chatkit/subresources/threads/methods/retrieve)
client.Beta.ChatKit.Threads.Get(ctx, threadID) (\*[ChatKitThread](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>), error)
GET/chatkit/threads/{thread\_id}
##### [Delete ChatKit thread](/api/reference/go/resources/beta/subresources/chatkit/subresources/threads/methods/delete)
client.Beta.ChatKit.Threads.Delete(ctx, threadID) (\*[BetaChatKitThreadDeleteResponse](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) BetaChatKitThreadDeleteResponse > (schema)>), error)
DELETE/chatkit/threads/{thread\_id}
##### [List ChatKit threads](/api/reference/go/resources/beta/subresources/chatkit/subresources/threads/methods/list)
client.Beta.ChatKit.Threads.List(ctx, query) (\*ConversationCursorPage[[ChatKitThread](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>)], error)
GET/chatkit/threads
##### ModelsExpand Collapse
type ChatSession struct{…}
Represents a ChatKit session and its resolved configuration.
ID string
Identifier for the ChatKit session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) id>)
ChatKitConfiguration [ChatSessionChatKitConfiguration](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema)>)
Resolved ChatKit feature configuration for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration>)
ClientSecret string
Ephemeral client secret that authenticates session requests.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) client_secret>)
ExpiresAt int64
Unix timestamp (in seconds) for when the session expires.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) expires_at>)
MaxRequestsPer1Minute int64
Convenience copy of the per-minute request limit.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) max_requests_per_1_minute>)
Object ChatKitSession
Type discriminator that is always `chatkit.session`.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) object>)
RateLimits [ChatSessionRateLimits](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema)>)
Resolved rate limit values.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) rate_limits>)
Status [ChatSessionStatus](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>)
Current lifecycle state of the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status>)
User string
User identifier associated with the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) user>)
Workflow [ChatKitWorkflow](</api/reference/go/resources/beta#(resource) beta.chatkit > (model) chatkit_workflow > (schema)>)
Workflow metadata for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema)>)
type ChatSessionAutomaticThreadTitling struct{…}
Automatic thread title preferences for the session.
Enabled bool
Whether automatic thread titling is enabled.
[](<#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema) > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema)>)
type ChatSessionChatKitConfiguration struct{…}
ChatKit configuration for the session.
AutomaticThreadTitling [ChatSessionAutomaticThreadTitling](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema)>)
Automatic thread titling preferences.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) automatic_thread_titling>)
FileUpload [ChatSessionFileUpload](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema)>)
Upload settings for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload>)
History [ChatSessionHistory](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_history > (schema)>)
History retention configuration.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) history>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema)>)
type ChatSessionChatKitConfigurationParamResp struct{…}
Optional per-session configuration settings for ChatKit behavior.
AutomaticThreadTitling ChatSessionChatKitConfigurationParamAutomaticThreadTitlingRespOptional
Configuration for automatic thread titling. When omitted, automatic thread titling is enabled by default.
Enabled boolOptional
Enable automatic thread title generation. Defaults to true.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) automatic_thread_titling > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) automatic_thread_titling>)
FileUpload ChatSessionChatKitConfigurationParamFileUploadRespOptional
Configuration for upload enablement and limits. When omitted, uploads are disabled by default (max\_files 10, max\_file\_size 512 MB).
Enabled boolOptional
Enable uploads for this session. Defaults to false.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) enabled>)
MaxFileSize int64Optional
Maximum size in megabytes for each uploaded file. Defaults to 512 MB, which is the maximum allowable size.
maximum512
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) max_file_size>)
MaxFiles int64Optional
Maximum number of files that can be uploaded to the session. Defaults to 10.
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload > (property) max_files>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) file_upload>)
History ChatSessionChatKitConfigurationParamHistoryRespOptional
Configuration for chat history retention. When omitted, history is enabled by default with no limit on recent\_threads (null).
Enabled boolOptional
Enables chat users to access previous ChatKit threads. Defaults to true.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history > (property) enabled>)
RecentThreads int64Optional
Number of recent ChatKit threads users have access to. Defaults to unlimited when unset.
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history > (property) recent_threads>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema) > (property) history>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema)>)
type ChatSessionExpiresAfterParamResp struct{…}
Controls when the session expires relative to an anchor timestamp.
Anchor CreatedAt
Base timestamp used to calculate expiration. Currently fixed to `created\_at`.
[](<#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema) > (property) anchor>)
Seconds int64
Number of seconds after the anchor when the session expires.
maximum600
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema) > (property) seconds>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema)>)
type ChatSessionFileUpload struct{…}
Upload permissions and limits applied to the session.
Enabled bool
Indicates if uploads are enabled for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) enabled>)
MaxFileSize int64
Maximum upload size in megabytes.
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_file_size>)
MaxFiles int64
Maximum number of uploads allowed during the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_files>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema)>)
type ChatSessionHistory struct{…}
History retention preferences returned for the session.
Enabled bool
Indicates if chat history is persisted for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) enabled>)
RecentThreads int64
Number of prior threads surfaced in history views. Defaults to null when all history is retained.
[](<#(resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) recent_threads>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_history > (schema)>)
type ChatSessionRateLimits struct{…}
Active per-minute request limit for the session.
MaxRequestsPer1Minute int64
Maximum allowed requests per one-minute window.
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema) > (property) max_requests_per_1_minute>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema)>)
type ChatSessionRateLimitsParamResp struct{…}
Controls request rate limits for the session.
MaxRequestsPer1Minute int64Optional
Maximum number of requests allowed per minute for the session. Defaults to 10.
minimum1
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits_param > (schema) > (property) max_requests_per_1_minute>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_rate_limits_param > (schema)>)
type ChatSessionStatus string
One of the following:
const ChatSessionStatusActive [ChatSessionStatus](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>) = "active"
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 0>)
const ChatSessionStatusExpired [ChatSessionStatus](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>) = "expired"
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 1>)
const ChatSessionStatusCancelled [ChatSessionStatus](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>) = "cancelled"
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>)
type ChatSessionWorkflowParamResp struct{…}
Workflow reference and overrides applied to the chat session.
ID string
Identifier for the workflow invoked by the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) id>)
StateVariables map[string, ChatSessionWorkflowParamStateVariableUnionResp]Optional
State variables forwarded to the workflow. Keys may be up to 64 characters, values must be primitive types, and the map defaults to an empty object.
One of the following:
string
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 0>)
bool
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 1>)
float64
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables > (items) > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) state_variables>)
Tracing ChatSessionWorkflowParamTracingRespOptional
Optional tracing overrides for the workflow invocation. When omitted, tracing is enabled by default.
Enabled boolOptional
Whether tracing is enabled during the session. Defaults to true.
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) tracing > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) tracing>)
Version stringOptional
Specific workflow version to run. Defaults to the latest deployed version.
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema) > (property) version>)
[](<#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema)>)
type ChatKitAttachment struct{…}
Attachment metadata included on thread items.
ID string
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
MimeType string
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
Name string
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
PreviewURL string
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
Type ChatKitAttachmentType
Attachment discriminator.
One of the following:
const ChatKitAttachmentTypeImage ChatKitAttachmentType = "image"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
const ChatKitAttachmentTypeFile ChatKitAttachmentType = "file"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>)
type ChatKitResponseOutputText struct{…}
Assistant response text accompanied by optional annotations.
Annotations []ChatKitResponseOutputTextAnnotationUnion
Ordered list of annotations attached to the response text.
One of the following:
type ChatKitResponseOutputTextAnnotationFile struct{…}
Annotation that references an uploaded file.
Source ChatKitResponseOutputTextAnnotationFileSource
File attachment referenced by the annotation.
Filename string
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
Type File
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
Type File
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
type ChatKitResponseOutputTextAnnotationURL struct{…}
Annotation that references a URL.
Source ChatKitResponseOutputTextAnnotationURLSource
URL referenced by the annotation.
Type URL
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
URL string
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
Type URL
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
Text string
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
Type OutputText
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>)
type ChatKitThread struct{…}
Represents a ChatKit thread and its current status.
ID string
Identifier of the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) for when the thread was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) created_at>)
Object ChatKitThread
Type discriminator that is always `chatkit.thread`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) object>)
Status ChatKitThreadStatusUnion
Current status for the thread. Defaults to `active` for newly created threads.
One of the following:
type ChatKitThreadStatusActive struct{…}
Indicates that a thread is active.
Type Active
Status discriminator that is always `active`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0>)
type ChatKitThreadStatusLocked struct{…}
Indicates that a thread is locked and cannot accept new input.
Reason string
Reason that the thread was locked. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) reason>)
Type Locked
Status discriminator that is always `locked`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1>)
type ChatKitThreadStatusClosed struct{…}
Indicates that a thread has been closed.
Reason string
Reason that the thread was closed. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) reason>)
Type Closed
Status discriminator that is always `closed`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status>)
Title string
Optional human-readable title for the thread. Defaults to null when no title has been generated.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) title>)
User string
Free-form string that identifies your end user who owns the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) user>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>)
type ChatKitThreadAssistantMessageItem struct{…}
Assistant-authored message within a thread.
ID string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) id>)
Content [][ChatKitResponseOutputText](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>)
Ordered assistant response segments.
Annotations []ChatKitResponseOutputTextAnnotationUnion
Ordered list of annotations attached to the response text.
One of the following:
type ChatKitResponseOutputTextAnnotationFile struct{…}
Annotation that references an uploaded file.
Source ChatKitResponseOutputTextAnnotationFileSource
File attachment referenced by the annotation.
Filename string
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
Type File
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
Type File
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
type ChatKitResponseOutputTextAnnotationURL struct{…}
Annotation that references a URL.
Source ChatKitResponseOutputTextAnnotationURLSource
URL referenced by the annotation.
Type URL
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
URL string
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
Type URL
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
Text string
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
Type OutputText
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) content>)
CreatedAt int64
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) created_at>)
Object ChatKitThreadItem
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) object>)
ThreadID string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) thread_id>)
Type ChatKitAssistantMessage
Type discriminator that is always `chatkit.assistant\_message`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>)
type ChatKitThreadItemList struct{…}
A paginated list of thread items rendered for the ChatKit API.
Data []ChatKitThreadItemListDataUnion
A list of items
One of the following:
type ChatKitThreadUserMessageItem struct{…}
User-authored messages within a thread.
ID string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) id>)
Attachments [][ChatKitAttachment](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>)
Attachments associated with the user message. Defaults to an empty list.
ID string
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
MimeType string
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
Name string
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
PreviewURL string
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
Type ChatKitAttachmentType
Attachment discriminator.
One of the following:
const ChatKitAttachmentTypeImage ChatKitAttachmentType = "image"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
const ChatKitAttachmentTypeFile ChatKitAttachmentType = "file"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) attachments>)
Content []ChatKitThreadUserMessageItemContentUnion
Ordered content elements supplied by the user.
One of the following:
type ChatKitThreadUserMessageItemContentInputText struct{…}
Text block that a user contributed to the thread.
Text string
Plain-text content supplied by the user.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) text>)
Type InputText
Type discriminator that is always `input\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0>)
type ChatKitThreadUserMessageItemContentQuotedText struct{…}
Quoted snippet that the user referenced in their message.
Text string
Quoted text content.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) text>)
Type QuotedText
Type discriminator that is always `quoted\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content>)
CreatedAt int64
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) created_at>)
InferenceOptions ChatKitThreadUserMessageItemInferenceOptions
Inference overrides applied to the message. Defaults to null when unset.
Model string
Model name that generated the response. Defaults to null when using the session default.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) model>)
ToolChoice ChatKitThreadUserMessageItemInferenceOptionsToolChoice
Preferred tool to invoke. Defaults to null when ChatKit should auto-select.
ID string
Identifier of the requested tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice > (property) id>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options>)
Object ChatKitThreadItem
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) object>)
ThreadID string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) thread_id>)
Type ChatKitUserMessage
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>)
type ChatKitThreadAssistantMessageItem struct{…}
Assistant-authored message within a thread.
ID string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) id>)
Content [][ChatKitResponseOutputText](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>)
Ordered assistant response segments.
Annotations []ChatKitResponseOutputTextAnnotationUnion
Ordered list of annotations attached to the response text.
One of the following:
type ChatKitResponseOutputTextAnnotationFile struct{…}
Annotation that references an uploaded file.
Source ChatKitResponseOutputTextAnnotationFileSource
File attachment referenced by the annotation.
Filename string
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
Type File
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
Type File
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
type ChatKitResponseOutputTextAnnotationURL struct{…}
Annotation that references a URL.
Source ChatKitResponseOutputTextAnnotationURLSource
URL referenced by the annotation.
Type URL
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
URL string
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
Type URL
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
Text string
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
Type OutputText
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) content>)
CreatedAt int64
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) created_at>)
Object ChatKitThreadItem
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) object>)
ThreadID string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) thread_id>)
Type ChatKitAssistantMessage
Type discriminator that is always `chatkit.assistant\_message`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>)
type ChatKitWidgetItem struct{…}
Thread item that renders a widget payload.
ID string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) created_at>)
Object ChatKitThreadItem
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) object>)
ThreadID string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) thread_id>)
Type ChatKitWidget
Type discriminator that is always `chatkit.widget`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) type>)
Widget string
Serialized widget payload rendered in the UI.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) widget>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>)
type ChatKitThreadItemListDataChatKitClientToolCall struct{…}
Record of a client side tool invocation initiated by the assistant.
ID string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) id>)
Arguments string
JSON-encoded arguments that were sent to the tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) arguments>)
CallID string
Identifier for the client tool call.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) call_id>)
CreatedAt int64
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) created_at>)
Name string
Tool name that was invoked.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) name>)
Object ChatKitThreadItem
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) object>)
Output string
JSON-encoded output captured from the tool. Defaults to null while execution is in progress.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) output>)
Status string
Execution status for the tool call.
One of the following:
const ChatKitThreadItemListDataChatKitClientToolCallStatusInProgress ChatKitThreadItemListDataChatKitClientToolCallStatus = "in\_progress"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 0>)
const ChatKitThreadItemListDataChatKitClientToolCallStatusCompleted ChatKitThreadItemListDataChatKitClientToolCallStatus = "completed"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status>)
ThreadID string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) thread_id>)
Type ChatKitClientToolCall
Type discriminator that is always `chatkit.client\_tool\_call`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3>)
type ChatKitThreadItemListDataChatKitTask struct{…}
Task emitted by the workflow to show progress and status updates.
ID string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) created_at>)
Heading string
Optional heading for the task. Defaults to null when not provided.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) heading>)
Object ChatKitThreadItem
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) object>)
Summary string
Optional summary that describes the task. Defaults to null when omitted.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) summary>)
TaskType string
Subtype for the task.
One of the following:
const ChatKitThreadItemListDataChatKitTaskTaskTypeCustom ChatKitThreadItemListDataChatKitTaskTaskType = "custom"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type > (member) 0>)
const ChatKitThreadItemListDataChatKitTaskTaskTypeThought ChatKitThreadItemListDataChatKitTaskTaskType = "thought"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type>)
ThreadID string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) thread_id>)
Type ChatKitTask
Type discriminator that is always `chatkit.task`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4>)
type ChatKitThreadItemListDataChatKitTaskGroup struct{…}
Collection of workflow tasks grouped together in the thread.
ID string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) created_at>)
Object ChatKitThreadItem
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) object>)
Tasks []ChatKitThreadItemListDataChatKitTaskGroupTask
Tasks included in the group.
Heading string
Optional heading for the grouped task. Defaults to null when not provided.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) heading>)
Summary string
Optional summary that describes the grouped task. Defaults to null when omitted.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) summary>)
Type string
Subtype for the grouped task.
One of the following:
const ChatKitThreadItemListDataChatKitTaskGroupTaskTypeCustom ChatKitThreadItemListDataChatKitTaskGroupTaskType = "custom"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type > (member) 0>)
const ChatKitThreadItemListDataChatKitTaskGroupTaskTypeThought ChatKitThreadItemListDataChatKitTaskGroupTaskType = "thought"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks>)
ThreadID string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) thread_id>)
Type ChatKitTaskGroup
Type discriminator that is always `chatkit.task\_group`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data>)
FirstID string
The ID of the first item in the list.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) first_id>)
HasMore bool
Whether there are more items available.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) has_more>)
LastID string
The ID of the last item in the list.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) last_id>)
Object List
The type of object returned, must be `list`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) object>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema)>)
type ChatKitThreadUserMessageItem struct{…}
User-authored messages within a thread.
ID string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) id>)
Attachments [][ChatKitAttachment](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>)
Attachments associated with the user message. Defaults to an empty list.
ID string
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
MimeType string
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
Name string
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
PreviewURL string
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
Type ChatKitAttachmentType
Attachment discriminator.
One of the following:
const ChatKitAttachmentTypeImage ChatKitAttachmentType = "image"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
const ChatKitAttachmentTypeFile ChatKitAttachmentType = "file"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) attachments>)
Content []ChatKitThreadUserMessageItemContentUnion
Ordered content elements supplied by the user.
One of the following:
type ChatKitThreadUserMessageItemContentInputText struct{…}
Text block that a user contributed to the thread.
Text string
Plain-text content supplied by the user.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) text>)
Type InputText
Type discriminator that is always `input\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0>)
type ChatKitThreadUserMessageItemContentQuotedText struct{…}
Quoted snippet that the user referenced in their message.
Text string
Quoted text content.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) text>)
Type QuotedText
Type discriminator that is always `quoted\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content>)
CreatedAt int64
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) created_at>)
InferenceOptions ChatKitThreadUserMessageItemInferenceOptions
Inference overrides applied to the message. Defaults to null when unset.
Model string
Model name that generated the response. Defaults to null when using the session default.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) model>)
ToolChoice ChatKitThreadUserMessageItemInferenceOptionsToolChoice
Preferred tool to invoke. Defaults to null when ChatKit should auto-select.
ID string
Identifier of the requested tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice > (property) id>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options>)
Object ChatKitThreadItem
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) object>)
ThreadID string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) thread_id>)
Type ChatKitUserMessage
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>)
type ChatKitWidgetItem struct{…}
Thread item that renders a widget payload.
ID string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) created_at>)
Object ChatKitThreadItem
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) object>)
ThreadID string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) thread_id>)
Type ChatKitWidget
Type discriminator that is always `chatkit.widget`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) type>)
Widget string
Serialized widget payload rendered in the UI.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) widget>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>)
#### BetaAssistants
Build Assistants that can call models and use tools.
##### [List assistants](/api/reference/go/resources/beta/subresources/assistants/methods/list)
Deprecated
client.Beta.Assistants.List(ctx, query) (\*CursorPage[[Assistant](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>)], error)
GET/assistants
##### [Create assistant](/api/reference/go/resources/beta/subresources/assistants/methods/create)
Deprecated
client.Beta.Assistants.New(ctx, body) (\*[Assistant](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>), error)
POST/assistants
##### [Retrieve assistant](/api/reference/go/resources/beta/subresources/assistants/methods/retrieve)
Deprecated
client.Beta.Assistants.Get(ctx, assistantID) (\*[Assistant](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>), error)
GET/assistants/{assistant\_id}
##### [Modify assistant](/api/reference/go/resources/beta/subresources/assistants/methods/update)
Deprecated
client.Beta.Assistants.Update(ctx, assistantID, body) (\*[Assistant](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>), error)
POST/assistants/{assistant\_id}
##### [Delete assistant](/api/reference/go/resources/beta/subresources/assistants/methods/delete)
Deprecated
client.Beta.Assistants.Delete(ctx, assistantID) (\*[AssistantDeleted](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_deleted > (schema)>), error)
DELETE/assistants/{assistant\_id}
##### ModelsExpand Collapse
type Assistant struct{…}
Represents an `assistant` that can call the model and use tools.
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) for when the assistant was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) created_at>)
Description string
The description of the assistant. The maximum length is 512 characters.
maxLength512
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) description>)
Instructions string
The system instructions that the assistant uses. The maximum length is 256,000 characters.
maxLength256000
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) instructions>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) metadata>)
Model string
ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) model>)
Name string
The name of the assistant. The maximum length is 256 characters.
maxLength256
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) name>)
Object Assistant
The object type, which is always `assistant`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) object>)
Tools [][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
type FunctionTool struct{…}
Function [FunctionDefinition](</api/reference/go/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tools>)
ResponseFormat [AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)Optional
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format>)
Temperature float64Optional
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
minimum0
maximum2
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) temperature>)
ToolResources AssistantToolResourcesOptional
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
CodeInterpreter AssistantToolResourcesCodeInterpreterOptional
FileIDs []stringOptional
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter“ tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter>)
FileSearch AssistantToolResourcesFileSearchOptional
VectorStoreIDs []stringOptional
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources>)
TopP float64Optional
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant > (schema)>)
type AssistantDeleted struct{…}
ID string
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) id>)
Deleted bool
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) deleted>)
Object AssistantDeleted
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema)>)
type AssistantStreamEventUnion interface{…}
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
type AssistantStreamEventThreadCreated struct{…}
Occurs when a new [thread](https://platform.openai.com/docs/api-reference/threads/object) is created.
Data [Thread](</api/reference/go/resources/beta#(resource) beta.threads > (model) thread > (schema)>)
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data>)
Event ThreadCreated
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) event>)
Enabled boolOptional
Whether to enable input audio transcription.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) enabled>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0>)
type AssistantStreamEventThreadRunCreated struct{…}
Occurs when a new [run](https://platform.openai.com/docs/api-reference/runs/object) is created.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data>)
Event ThreadRunCreated
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1>)
type AssistantStreamEventThreadRunQueued struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `queued` status.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data>)
Event ThreadRunQueued
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2>)
type AssistantStreamEventThreadRunInProgress struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to an `in\_progress` status.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data>)
Event ThreadRunInProgress
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3>)
type AssistantStreamEventThreadRunRequiresAction struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `requires\_action` status.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data>)
Event ThreadRunRequiresAction
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4>)
type AssistantStreamEventThreadRunCompleted struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is completed.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data>)
Event ThreadRunCompleted
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5>)
type AssistantStreamEventThreadRunIncomplete struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) ends with status `incomplete`.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data>)
Event ThreadRunIncomplete
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6>)
type AssistantStreamEventThreadRunFailed struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) fails.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data>)
Event ThreadRunFailed
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7>)
type AssistantStreamEventThreadRunCancelling struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `cancelling` status.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data>)
Event ThreadRunCancelling
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8>)
type AssistantStreamEventThreadRunCancelled struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is cancelled.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data>)
Event ThreadRunCancelled
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9>)
type AssistantStreamEventThreadRunExpired struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) expires.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data>)
Event ThreadRunExpired
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10>)
type AssistantStreamEventThreadRunStepCreated struct{…}
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is created.
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data>)
Event ThreadRunStepCreated
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11>)
type AssistantStreamEventThreadRunStepInProgress struct{…}
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) moves to an `in\_progress` state.
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data>)
Event ThreadRunStepInProgress
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12>)
type AssistantStreamEventThreadRunStepDelta struct{…}
Occurs when parts of a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) are being streamed.
Data [RunStepDeltaEvent](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>)
Represents a run step delta i.e. any changed fields on a run step during streaming.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data>)
Event ThreadRunStepDelta
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13>)
type AssistantStreamEventThreadRunStepCompleted struct{…}
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is completed.
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data>)
Event ThreadRunStepCompleted
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14>)
type AssistantStreamEventThreadRunStepFailed struct{…}
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) fails.
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data>)
Event ThreadRunStepFailed
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15>)
type AssistantStreamEventThreadRunStepCancelled struct{…}
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is cancelled.
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data>)
Event ThreadRunStepCancelled
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16>)
type AssistantStreamEventThreadRunStepExpired struct{…}
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) expires.
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data>)
Event ThreadRunStepExpired
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17>)
type AssistantStreamEventThreadMessageCreated struct{…}
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is created.
Data [Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data>)
Event ThreadMessageCreated
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18>)
type AssistantStreamEventThreadMessageInProgress struct{…}
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) moves to an `in\_progress` state.
Data [Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data>)
Event ThreadMessageInProgress
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19>)
type AssistantStreamEventThreadMessageDelta struct{…}
Occurs when parts of a [Message](https://platform.openai.com/docs/api-reference/messages/object) are being streamed.
Data [MessageDeltaEvent](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_delta_event > (schema)>)
Represents a message delta i.e. any changed fields on a message during streaming.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) data>)
Event ThreadMessageDelta
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20>)
type AssistantStreamEventThreadMessageCompleted struct{…}
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is completed.
Data [Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data>)
Event ThreadMessageCompleted
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21>)
type AssistantStreamEventThreadMessageIncomplete struct{…}
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) ends before it is completed.
Data [Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data>)
Event ThreadMessageIncomplete
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22>)
type AssistantStreamEventErrorEvent struct{…}
Occurs when an [error](https://platform.openai.com/docs/guides/error-codes#api-errors) occurs. This can happen due to an internal server error or a timeout.
Data [ErrorObject](</api/reference/go/resources/$shared#(resource) $shared > (model) error_object > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data>)
Event Error
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema)>)
type AssistantToolUnion interface{…}
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
type FunctionTool struct{…}
Function [FunctionDefinition](</api/reference/go/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_tool > (schema)>)
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
type FunctionTool struct{…}
Function [FunctionDefinition](</api/reference/go/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
type MessageStreamEventUnion interface{…}
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is created.
One of the following:
MessageStreamEventThreadMessageCreated
Data [Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0 > (property) data>)
Event ThreadMessageCreated
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0>)
MessageStreamEventThreadMessageInProgress
Data [Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1 > (property) data>)
Event ThreadMessageInProgress
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1>)
MessageStreamEventThreadMessageDelta
Data [MessageDeltaEvent](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_delta_event > (schema)>)
Represents a message delta i.e. any changed fields on a message during streaming.
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2 > (property) data>)
Event ThreadMessageDelta
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2>)
MessageStreamEventThreadMessageCompleted
Data [Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3 > (property) data>)
Event ThreadMessageCompleted
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3>)
MessageStreamEventThreadMessageIncomplete
Data [Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4 > (property) data>)
Event ThreadMessageIncomplete
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema)>)
type RunStepStreamEventUnion interface{…}
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is created.
One of the following:
RunStepStreamEventThreadRunStepCreated
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0 > (property) data>)
Event ThreadRunStepCreated
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0>)
RunStepStreamEventThreadRunStepInProgress
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1 > (property) data>)
Event ThreadRunStepInProgress
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1>)
RunStepStreamEventThreadRunStepDelta
Data [RunStepDeltaEvent](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>)
Represents a run step delta i.e. any changed fields on a run step during streaming.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2 > (property) data>)
Event ThreadRunStepDelta
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2>)
RunStepStreamEventThreadRunStepCompleted
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3 > (property) data>)
Event ThreadRunStepCompleted
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3>)
RunStepStreamEventThreadRunStepFailed
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4 > (property) data>)
Event ThreadRunStepFailed
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4>)
RunStepStreamEventThreadRunStepCancelled
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5 > (property) data>)
Event ThreadRunStepCancelled
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5>)
RunStepStreamEventThreadRunStepExpired
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6 > (property) data>)
Event ThreadRunStepExpired
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema)>)
type RunStreamEventUnion interface{…}
Occurs when a new [run](https://platform.openai.com/docs/api-reference/runs/object) is created.
One of the following:
RunStreamEventThreadRunCreated
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0 > (property) data>)
Event ThreadRunCreated
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0>)
RunStreamEventThreadRunQueued
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1 > (property) data>)
Event ThreadRunQueued
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1>)
RunStreamEventThreadRunInProgress
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2 > (property) data>)
Event ThreadRunInProgress
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2>)
RunStreamEventThreadRunRequiresAction
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3 > (property) data>)
Event ThreadRunRequiresAction
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3>)
RunStreamEventThreadRunCompleted
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4 > (property) data>)
Event ThreadRunCompleted
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4>)
RunStreamEventThreadRunIncomplete
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5 > (property) data>)
Event ThreadRunIncomplete
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5>)
RunStreamEventThreadRunFailed
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6 > (property) data>)
Event ThreadRunFailed
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6>)
RunStreamEventThreadRunCancelling
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7 > (property) data>)
Event ThreadRunCancelling
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7>)
RunStreamEventThreadRunCancelled
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8 > (property) data>)
Event ThreadRunCancelled
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8>)
RunStreamEventThreadRunExpired
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9 > (property) data>)
Event ThreadRunExpired
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema)>)
type ThreadStreamEvent struct{…}
Occurs when a new [thread](https://platform.openai.com/docs/api-reference/threads/object) is created.
Data [Thread](</api/reference/go/resources/beta#(resource) beta.threads > (model) thread > (schema)>)
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) data>)
Event ThreadCreated
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) event>)
Enabled boolOptional
Whether to enable input audio transcription.
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) enabled>)
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema)>)
#### BetaThreads
Build Assistants that can call models and use tools.
##### [Create thread](/api/reference/go/resources/beta/subresources/threads/methods/create)
Deprecated
client.Beta.Threads.New(ctx, body) (\*[Thread](</api/reference/go/resources/beta#(resource) beta.threads > (model) thread > (schema)>), error)
POST/threads
##### [Create thread and run](/api/reference/go/resources/beta/subresources/threads/methods/create_and_run)
Deprecated
client.Beta.Threads.NewAndRun(ctx, body) (\*[Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>), error)
POST/threads/runs
##### [Retrieve thread](/api/reference/go/resources/beta/subresources/threads/methods/retrieve)
Deprecated
client.Beta.Threads.Get(ctx, threadID) (\*[Thread](</api/reference/go/resources/beta#(resource) beta.threads > (model) thread > (schema)>), error)
GET/threads/{thread\_id}
##### [Modify thread](/api/reference/go/resources/beta/subresources/threads/methods/update)
Deprecated
client.Beta.Threads.Update(ctx, threadID, body) (\*[Thread](</api/reference/go/resources/beta#(resource) beta.threads > (model) thread > (schema)>), error)
POST/threads/{thread\_id}
##### [Delete thread](/api/reference/go/resources/beta/subresources/threads/methods/delete)
Deprecated
client.Beta.Threads.Delete(ctx, threadID) (\*[ThreadDeleted](</api/reference/go/resources/beta#(resource) beta.threads > (model) thread_deleted > (schema)>), error)
DELETE/threads/{thread\_id}
##### ModelsExpand Collapse
type AssistantResponseFormatOptionUnion interface{…}
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
type Auto string
`auto` is the default value
[](<#(resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
type ResponseFormatText struct{…}
Default response format. Used to generate text responses.
Type Text
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
type ResponseFormatJSONObject struct{…}
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
Type JSONObject
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
type ResponseFormatJSONSchema struct{…}
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JSONSchema ResponseFormatJSONSchemaJSONSchema
Structured Outputs configuration options, including a JSON Schema.
Name string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Description stringOptional
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Schema map[string, any]Optional
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Strict boolOptional
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
Type JSONSchema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
type AssistantToolChoice struct{…}
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type AssistantToolChoiceType
The type of the tool. If type is `function`, the function name must be set
One of the following:
const AssistantToolChoiceTypeFunction AssistantToolChoiceType = "function"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
const AssistantToolChoiceTypeCodeInterpreter AssistantToolChoiceType = "code\_interpreter"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
const AssistantToolChoiceTypeFileSearch AssistantToolChoiceType = "file\_search"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Function [AssistantToolChoiceFunction](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)Optional
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema)>)
type AssistantToolChoiceFunction struct{…}
Name string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)
type AssistantToolChoiceOptionUnion interface{…}
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
type AssistantToolChoiceOptionAuto string
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
const AssistantToolChoiceOptionAutoNone AssistantToolChoiceOptionAuto = "none"
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
const AssistantToolChoiceOptionAutoAuto AssistantToolChoiceOptionAuto = "auto"
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
const AssistantToolChoiceOptionAutoRequired AssistantToolChoiceOptionAuto = "required"
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
type AssistantToolChoice struct{…}
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type AssistantToolChoiceType
The type of the tool. If type is `function`, the function name must be set
One of the following:
const AssistantToolChoiceTypeFunction AssistantToolChoiceType = "function"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
const AssistantToolChoiceTypeCodeInterpreter AssistantToolChoiceType = "code\_interpreter"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
const AssistantToolChoiceTypeFileSearch AssistantToolChoiceType = "file\_search"
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Function [AssistantToolChoiceFunction](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)Optional
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
type Thread struct{…}
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) for when the thread was created.
formatunixtime
[](<#(resource) beta.threads > (model) thread > (schema) > (property) created_at>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) metadata>)
Object Thread
The object type, which is always `thread`.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) object>)
ToolResources ThreadToolResources
A set of resources that are made available to the assistant’s tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
CodeInterpreter ThreadToolResourcesCodeInterpreterOptional
FileIDs []stringOptional
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter>)
FileSearch ThreadToolResourcesFileSearchOptional
VectorStoreIDs []stringOptional
The [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources>)
[](<#(resource) beta.threads > (model) thread > (schema)>)
type ThreadDeleted struct{…}
ID string
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) id>)
Deleted bool
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) deleted>)
Object ThreadDeleted
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads > (model) thread_deleted > (schema)>)
#### BetaThreadsRuns
Build Assistants that can call models and use tools.
##### [List runs](/api/reference/go/resources/beta/subresources/threads/subresources/runs/methods/list)
Deprecated
client.Beta.Threads.Runs.List(ctx, threadID, query) (\*CursorPage[[Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)], error)
GET/threads/{thread\_id}/runs
##### [Create run](/api/reference/go/resources/beta/subresources/threads/subresources/runs/methods/create)
Deprecated
client.Beta.Threads.Runs.New(ctx, threadID, params) (\*[Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>), error)
POST/threads/{thread\_id}/runs
##### [Retrieve run](/api/reference/go/resources/beta/subresources/threads/subresources/runs/methods/retrieve)
Deprecated
client.Beta.Threads.Runs.Get(ctx, threadID, runID) (\*[Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>), error)
GET/threads/{thread\_id}/runs/{run\_id}
##### [Modify run](/api/reference/go/resources/beta/subresources/threads/subresources/runs/methods/update)
Deprecated
client.Beta.Threads.Runs.Update(ctx, threadID, runID, body) (\*[Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>), error)
POST/threads/{thread\_id}/runs/{run\_id}
##### [Submit tool outputs to run](/api/reference/go/resources/beta/subresources/threads/subresources/runs/methods/submit_tool_outputs)
Deprecated
client.Beta.Threads.Runs.SubmitToolOutputs(ctx, threadID, runID, body) (\*[Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>), error)
POST/threads/{thread\_id}/runs/{run\_id}/submit\_tool\_outputs
##### [Cancel a run](/api/reference/go/resources/beta/subresources/threads/subresources/runs/methods/cancel)
Deprecated
client.Beta.Threads.Runs.Cancel(ctx, threadID, runID) (\*[Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>), error)
POST/threads/{thread\_id}/runs/{run\_id}/cancel
##### ModelsExpand Collapse
type RequiredActionFunctionToolCall struct{…}
Tool call objects
ID string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function RequiredActionFunctionToolCallFunction
The function definition.
Arguments string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
type Run struct{…}
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
ExpiresAt int64
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
IncompleteDetails RunIncompleteDetails
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
Reason stringOptional
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
const RunIncompleteDetailsReasonMaxCompletionTokens RunIncompleteDetailsReason = "max\_completion\_tokens"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const RunIncompleteDetailsReasonMaxPromptTokens RunIncompleteDetailsReason = "max\_prompt\_tokens"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
Instructions string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
LastError RunLastError
The last error associated with this run. Will be `null` if there are no errors.
Code string
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
const RunLastErrorCodeServerError RunLastErrorCode = "server\_error"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
const RunLastErrorCodeRateLimitExceeded RunLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
const RunLastErrorCodeInvalidPrompt RunLastErrorCode = "invalid\_prompt"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
MaxCompletionTokens int64
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
MaxPromptTokens int64
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
Model string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) model>)
Object ThreadRun
The object type, which is always `thread.run`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) object>)
ParallelToolCalls bool
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
RequiredAction RunRequiredAction
Details on the action required to continue the run. Will be `null` if no action is required.
SubmitToolOutputs RunRequiredActionSubmitToolOutputs
Details on the tool outputs needed for this run to continue.
ToolCalls [][RequiredActionFunctionToolCall](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
A list of the relevant tool calls.
ID string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function RequiredActionFunctionToolCallFunction
The function definition.
Arguments string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
Type SubmitToolOutputs
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
ResponseFormat [AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
StartedAt int64
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
Status [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
ToolChoice [AssistantToolChoiceOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
Tools [][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
type FunctionTool struct{…}
Function [FunctionDefinition](</api/reference/go/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
TruncationStrategy RunTruncationStrategy
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
Type string
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
const RunTruncationStrategyTypeAuto RunTruncationStrategyType = "auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
const RunTruncationStrategyTypeLastMessages RunTruncationStrategyType = "last\_messages"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
LastMessages int64Optional
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
Usage RunUsage
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
CompletionTokens int64
Number of completion tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
Temperature float64Optional
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
TopP float64Optional
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.threads.runs > (model) run > (schema)>)
type RunStatus string
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
const RunStatusQueued [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "queued"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
const RunStatusInProgress [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "in\_progress"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
const RunStatusRequiresAction [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "requires\_action"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
const RunStatusCancelling [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelling"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
const RunStatusCancelled [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelled"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
const RunStatusFailed [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "failed"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
const RunStatusCompleted [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "completed"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
const RunStatusIncomplete [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "incomplete"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
const RunStatusExpired [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "expired"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.threads.runs > (model) run_status > (schema)>)
#### BetaThreadsRunsSteps
Build Assistants that can call models and use tools.
##### [List run steps](/api/reference/go/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/list)
Deprecated
client.Beta.Threads.Runs.Steps.List(ctx, threadID, runID, query) (\*CursorPage[[RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)], error)
GET/threads/{thread\_id}/runs/{run\_id}/steps
##### [Retrieve run step](/api/reference/go/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/retrieve)
Deprecated
client.Beta.Threads.Runs.Steps.Get(ctx, threadID, runID, stepID, query) (\*[RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>), error)
GET/threads/{thread\_id}/runs/{run\_id}/steps/{step\_id}
##### ModelsExpand Collapse
type CodeInterpreterLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Logs stringOptional
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
type CodeInterpreterOutputImage struct{…}
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Image CodeInterpreterOutputImageImageOptional
FileID stringOptional
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
type CodeInterpreterToolCall struct{…}
Details of the Code Interpreter tool call the run step was involved in.
ID string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallCodeInterpreter
The Code Interpreter tool call definition.
Input string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallCodeInterpreterOutputUnion
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterToolCallCodeInterpreterOutputLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Logs string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
type CodeInterpreterToolCallCodeInterpreterOutputImage struct{…}
Image CodeInterpreterToolCallCodeInterpreterOutputImageImage
FileID string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
type CodeInterpreterToolCallDelta struct{…}
Details of the Code Interpreter tool call the run step was involved in.
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallDeltaCodeInterpreterOptional
The Code Interpreter tool call definition.
Input stringOptional
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallDeltaCodeInterpreterOutputUnionOptional
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Logs stringOptional
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
type CodeInterpreterOutputImage struct{…}
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Image CodeInterpreterOutputImageImageOptional
FileID stringOptional
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
type FileSearchToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch FileSearchToolCallFileSearch
For now, this is always going to be an empty object.
RankingOptions FileSearchToolCallFileSearchRankingOptionsOptional
The ranking options for the file search.
Ranker string
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolCallFileSearchRankingOptionsRankerAuto FileSearchToolCallFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolCallFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolCallFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Results []FileSearchToolCallFileSearchResultOptional
The results of the file search.
FileID string
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
FileName string
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
Score float64
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Content []FileSearchToolCallFileSearchResultContentOptional
The content of the result that was found. The content is only included if requested via the include query parameter.
Text stringOptional
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Type stringOptional
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
type FileSearchToolCallDelta struct{…}
FileSearch any
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
type FunctionToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function FunctionToolCallFunction
The definition of the function that was called.
Arguments string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Output string
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
type FunctionToolCallDelta struct{…}
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Function FunctionToolCallDeltaFunctionOptional
The definition of the function that was called.
Arguments stringOptional
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Name stringOptional
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Output stringOptional
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
type MessageCreationStepDetails struct{…}
Details of the message creation by the run step.
MessageCreation MessageCreationStepDetailsMessageCreation
MessageID string
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
Type MessageCreation
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
type RunStep struct{…}
Represents a step in execution of a run.
ID string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
ExpiredAt int64
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
LastError RunStepLastError
The last error associated with this run step. Will be `null` if there are no errors.
Code string
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
const RunStepLastErrorCodeServerError RunStepLastErrorCode = "server\_error"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
const RunStepLastErrorCodeRateLimitExceeded RunStepLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
Object ThreadRunStep
The object type, which is always `thread.run.step`.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
RunID string
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
Status RunStepStatus
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
const RunStepStatusInProgress RunStepStatus = "in\_progress"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
const RunStepStatusCancelled RunStepStatus = "cancelled"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
const RunStepStatusFailed RunStepStatus = "failed"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
const RunStepStatusCompleted RunStepStatus = "completed"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
const RunStepStatusExpired RunStepStatus = "expired"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
StepDetails RunStepStepDetailsUnion
The details of the run step.
One of the following:
type MessageCreationStepDetails struct{…}
Details of the message creation by the run step.
MessageCreation MessageCreationStepDetailsMessageCreation
MessageID string
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
Type MessageCreation
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
type ToolCallsStepDetails struct{…}
Details of the tool call.
ToolCalls [][ToolCallUnion](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterToolCall struct{…}
Details of the Code Interpreter tool call the run step was involved in.
ID string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallCodeInterpreter
The Code Interpreter tool call definition.
Input string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallCodeInterpreterOutputUnion
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterToolCallCodeInterpreterOutputLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Logs string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
type CodeInterpreterToolCallCodeInterpreterOutputImage struct{…}
Image CodeInterpreterToolCallCodeInterpreterOutputImageImage
FileID string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
type FileSearchToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch FileSearchToolCallFileSearch
For now, this is always going to be an empty object.
RankingOptions FileSearchToolCallFileSearchRankingOptionsOptional
The ranking options for the file search.
Ranker string
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolCallFileSearchRankingOptionsRankerAuto FileSearchToolCallFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolCallFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolCallFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Results []FileSearchToolCallFileSearchResultOptional
The results of the file search.
FileID string
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
FileName string
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
Score float64
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Content []FileSearchToolCallFileSearchResultContentOptional
The content of the result that was found. The content is only included if requested via the include query parameter.
Text stringOptional
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Type stringOptional
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
type FunctionToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function FunctionToolCallFunction
The definition of the function that was called.
Arguments string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Output string
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
Type ToolCalls
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
Type RunStepType
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
const RunStepTypeMessageCreation RunStepType = "message\_creation"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
const RunStepTypeToolCalls RunStepType = "tool\_calls"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
Usage RunStepUsage
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
CompletionTokens int64
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
type RunStepDelta struct{…}
The delta containing the fields that have changed on the run step.
StepDetails RunStepDeltaStepDetailsUnionOptional
The details of the run step.
One of the following:
type RunStepDeltaMessageDelta struct{…}
Details of the message creation by the run step.
Type MessageCreation
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
MessageCreation RunStepDeltaMessageDeltaMessageCreationOptional
MessageID stringOptional
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
type ToolCallDeltaObject struct{…}
Details of the tool call.
Type ToolCalls
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
ToolCalls [][ToolCallDeltaUnion](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)Optional
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterToolCallDelta struct{…}
Details of the Code Interpreter tool call the run step was involved in.
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallDeltaCodeInterpreterOptional
The Code Interpreter tool call definition.
Input stringOptional
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallDeltaCodeInterpreterOutputUnionOptional
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Logs stringOptional
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
type CodeInterpreterOutputImage struct{…}
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Image CodeInterpreterOutputImageImageOptional
FileID stringOptional
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
type FileSearchToolCallDelta struct{…}
FileSearch any
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
type FunctionToolCallDelta struct{…}
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Function FunctionToolCallDeltaFunctionOptional
The definition of the function that was called.
Arguments stringOptional
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Name stringOptional
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Output stringOptional
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema) > (property) step_details>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema)>)
type RunStepDeltaEvent struct{…}
Represents a run step delta i.e. any changed fields on a run step during streaming.
ID string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) id>)
Delta [RunStepDelta](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema)>)
The delta containing the fields that have changed on the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta>)
Object ThreadRunStepDelta
The object type, which is always `thread.run.step.delta`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>)
type RunStepDeltaMessageDelta struct{…}
Details of the message creation by the run step.
Type MessageCreation
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
MessageCreation RunStepDeltaMessageDeltaMessageCreationOptional
MessageID stringOptional
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
type RunStepInclude string
[](<#(resource) beta.threads.runs.steps > (model) run_step_include > (schema)>)
type ToolCallUnion interface{…}
Details of the Code Interpreter tool call the run step was involved in.
One of the following:
type CodeInterpreterToolCall struct{…}
Details of the Code Interpreter tool call the run step was involved in.
ID string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallCodeInterpreter
The Code Interpreter tool call definition.
Input string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallCodeInterpreterOutputUnion
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterToolCallCodeInterpreterOutputLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Logs string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
type CodeInterpreterToolCallCodeInterpreterOutputImage struct{…}
Image CodeInterpreterToolCallCodeInterpreterOutputImageImage
FileID string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
type FileSearchToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch FileSearchToolCallFileSearch
For now, this is always going to be an empty object.
RankingOptions FileSearchToolCallFileSearchRankingOptionsOptional
The ranking options for the file search.
Ranker string
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolCallFileSearchRankingOptionsRankerAuto FileSearchToolCallFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolCallFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolCallFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Results []FileSearchToolCallFileSearchResultOptional
The results of the file search.
FileID string
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
FileName string
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
Score float64
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Content []FileSearchToolCallFileSearchResultContentOptional
The content of the result that was found. The content is only included if requested via the include query parameter.
Text stringOptional
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Type stringOptional
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
type FunctionToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function FunctionToolCallFunction
The definition of the function that was called.
Arguments string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Output string
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
type ToolCallDeltaUnion interface{…}
Details of the Code Interpreter tool call the run step was involved in.
One of the following:
type CodeInterpreterToolCallDelta struct{…}
Details of the Code Interpreter tool call the run step was involved in.
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallDeltaCodeInterpreterOptional
The Code Interpreter tool call definition.
Input stringOptional
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallDeltaCodeInterpreterOutputUnionOptional
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Logs stringOptional
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
type CodeInterpreterOutputImage struct{…}
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Image CodeInterpreterOutputImageImageOptional
FileID stringOptional
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
type FileSearchToolCallDelta struct{…}
FileSearch any
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
type FunctionToolCallDelta struct{…}
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Function FunctionToolCallDeltaFunctionOptional
The definition of the function that was called.
Arguments stringOptional
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Name stringOptional
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Output stringOptional
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)
type ToolCallDeltaObject struct{…}
Details of the tool call.
Type ToolCalls
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
ToolCalls [][ToolCallDeltaUnion](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)Optional
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterToolCallDelta struct{…}
Details of the Code Interpreter tool call the run step was involved in.
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallDeltaCodeInterpreterOptional
The Code Interpreter tool call definition.
Input stringOptional
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallDeltaCodeInterpreterOutputUnionOptional
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Logs stringOptional
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
type CodeInterpreterOutputImage struct{…}
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Image CodeInterpreterOutputImageImageOptional
FileID stringOptional
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
type FileSearchToolCallDelta struct{…}
FileSearch any
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
type FunctionToolCallDelta struct{…}
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Function FunctionToolCallDeltaFunctionOptional
The definition of the function that was called.
Arguments stringOptional
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Name stringOptional
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Output stringOptional
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
type ToolCallsStepDetails struct{…}
Details of the tool call.
ToolCalls [][ToolCallUnion](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterToolCall struct{…}
Details of the Code Interpreter tool call the run step was involved in.
ID string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallCodeInterpreter
The Code Interpreter tool call definition.
Input string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallCodeInterpreterOutputUnion
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterToolCallCodeInterpreterOutputLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Logs string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
type CodeInterpreterToolCallCodeInterpreterOutputImage struct{…}
Image CodeInterpreterToolCallCodeInterpreterOutputImageImage
FileID string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
type FileSearchToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch FileSearchToolCallFileSearch
For now, this is always going to be an empty object.
RankingOptions FileSearchToolCallFileSearchRankingOptionsOptional
The ranking options for the file search.
Ranker string
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolCallFileSearchRankingOptionsRankerAuto FileSearchToolCallFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolCallFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolCallFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Results []FileSearchToolCallFileSearchResultOptional
The results of the file search.
FileID string
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
FileName string
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
Score float64
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Content []FileSearchToolCallFileSearchResultContentOptional
The content of the result that was found. The content is only included if requested via the include query parameter.
Text stringOptional
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Type stringOptional
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
type FunctionToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function FunctionToolCallFunction
The definition of the function that was called.
Arguments string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Output string
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
Type ToolCalls
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
#### BetaThreadsMessages
Build Assistants that can call models and use tools.
##### [List messages](/api/reference/go/resources/beta/subresources/threads/subresources/messages/methods/list)
Deprecated
client.Beta.Threads.Messages.List(ctx, threadID, query) (\*CursorPage[[Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)], error)
GET/threads/{thread\_id}/messages
##### [Create message](/api/reference/go/resources/beta/subresources/threads/subresources/messages/methods/create)
Deprecated
client.Beta.Threads.Messages.New(ctx, threadID, body) (\*[Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>), error)
POST/threads/{thread\_id}/messages
##### [Modify message](/api/reference/go/resources/beta/subresources/threads/subresources/messages/methods/update)
Deprecated
client.Beta.Threads.Messages.Update(ctx, threadID, messageID, body) (\*[Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>), error)
POST/threads/{thread\_id}/messages/{message\_id}
##### [Retrieve message](/api/reference/go/resources/beta/subresources/threads/subresources/messages/methods/retrieve)
Deprecated
client.Beta.Threads.Messages.Get(ctx, threadID, messageID) (\*[Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>), error)
GET/threads/{thread\_id}/messages/{message\_id}
##### [Delete message](/api/reference/go/resources/beta/subresources/threads/subresources/messages/methods/delete)
Deprecated
client.Beta.Threads.Messages.Delete(ctx, threadID, messageID) (\*[MessageDeleted](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_deleted > (schema)>), error)
DELETE/threads/{thread\_id}/messages/{message\_id}
##### ModelsExpand Collapse
type AnnotationUnion interface{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
One of the following:
type FileCitationAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation FileCitationAnnotationFileCitation
FileID string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
type FilePathAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath FilePathAnnotationFilePath
FileID string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) annotation > (schema)>)
type AnnotationDeltaUnion interface{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
One of the following:
type FileCitationDeltaAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
Index int64
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
EndIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
FileCitation FileCitationDeltaAnnotationFileCitationOptional
FileID stringOptional
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
Quote stringOptional
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
StartIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
Text stringOptional
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
type FilePathDeltaAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
Index int64
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
EndIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
FilePath FilePathDeltaAnnotationFilePathOptional
FileID stringOptional
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
StartIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
Text stringOptional
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)
type FileCitationAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation FileCitationAnnotationFileCitation
FileID string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
type FileCitationDeltaAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
Index int64
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
EndIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
FileCitation FileCitationDeltaAnnotationFileCitationOptional
FileID stringOptional
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
Quote stringOptional
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
StartIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
Text stringOptional
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
type FilePathAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath FilePathAnnotationFilePath
FileID string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
type FilePathDeltaAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
Index int64
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
EndIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
FilePath FilePathDeltaAnnotationFilePathOptional
FileID stringOptional
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
StartIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
Text stringOptional
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
type ImageFile struct{…}
FileID string
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
Detail ImageFileDetailOptional
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
const ImageFileDetailAuto ImageFileDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
const ImageFileDetailLow ImageFileDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
const ImageFileDetailHigh ImageFileDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_file > (schema)>)
type ImageFileContentBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
ImageFile [ImageFile](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
type ImageFileDelta struct{…}
Detail ImageFileDeltaDetailOptional
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
const ImageFileDeltaDetailAuto ImageFileDeltaDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 0>)
const ImageFileDeltaDetailLow ImageFileDeltaDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 1>)
const ImageFileDeltaDetailHigh ImageFileDeltaDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail>)
FileID stringOptional
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)
type ImageFileDeltaBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
ImageFile [ImageFileDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
type ImageURL struct{…}
URL string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
Detail ImageURLDetailOptional
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
const ImageURLDetailAuto ImageURLDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
const ImageURLDetailLow ImageURLDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
const ImageURLDetailHigh ImageURLDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_url > (schema)>)
type ImageURLContentBlock struct{…}
References an image URL in the content of a message.
ImageURL [ImageURL](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
type ImageURLDelta struct{…}
Detail ImageURLDeltaDetailOptional
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
const ImageURLDeltaDetailAuto ImageURLDeltaDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 0>)
const ImageURLDeltaDetailLow ImageURLDeltaDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 1>)
const ImageURLDeltaDetailHigh ImageURLDeltaDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail>)
URL stringOptional
The URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)
type ImageURLDeltaBlock struct{…}
References an image URL in the content of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
Type ImageURL
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
ImageURL [ImageURLDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
type Message struct{…}
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) id>)
AssistantID string
If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
Attachments []MessageAttachment
A list of files attached to the message, and the tools they were added to.
FileID stringOptional
The ID of the file to attach to the message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
Tools []MessageAttachmentToolUnionOptional
The tools to add this file to.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type MessageAttachmentToolAssistantToolsFileSearchTypeOnly struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
CompletedAt int64
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
Content [][MessageContentUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)
The content of the message in array of text and/or images.
One of the following:
type ImageFileContentBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
ImageFile [ImageFile](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
type ImageURLContentBlock struct{…}
References an image URL in the content of a message.
ImageURL [ImageURL](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
type TextContentBlock struct{…}
The text content that is part of a message.
Text [Text](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
type RefusalContentBlock struct{…}
The refusal content generated by the assistant.
Refusal string
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) content>)
CreatedAt int64
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
IncompleteAt int64
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
IncompleteDetails MessageIncompleteDetails
On an incomplete message, details about why the message is incomplete.
Reason string
The reason the message is incomplete.
One of the following:
const MessageIncompleteDetailsReasonContentFilter MessageIncompleteDetailsReason = "content\_filter"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const MessageIncompleteDetailsReasonMaxTokens MessageIncompleteDetailsReason = "max\_tokens"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
const MessageIncompleteDetailsReasonRunCancelled MessageIncompleteDetailsReason = "run\_cancelled"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 2>)
const MessageIncompleteDetailsReasonRunExpired MessageIncompleteDetailsReason = "run\_expired"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 3>)
const MessageIncompleteDetailsReasonRunFailed MessageIncompleteDetailsReason = "run\_failed"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 4>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
Object ThreadMessage
The object type, which is always `thread.message`.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) object>)
Role MessageRole
The entity that produced the message. One of `user` or `assistant`.
One of the following:
const MessageRoleUser MessageRole = "user"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
const MessageRoleAssistant MessageRole = "assistant"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role>)
RunID string
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
Status MessageStatus
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
const MessageStatusInProgress MessageStatus = "in\_progress"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
const MessageStatusIncomplete MessageStatus = "incomplete"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
const MessageStatusCompleted MessageStatus = "completed"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status>)
ThreadID string
The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.threads.messages > (model) message > (schema)>)
type MessageContentUnion interface{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
One of the following:
type ImageFileContentBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
ImageFile [ImageFile](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
type ImageURLContentBlock struct{…}
References an image URL in the content of a message.
ImageURL [ImageURL](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
type TextContentBlock struct{…}
The text content that is part of a message.
Text [Text](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
type RefusalContentBlock struct{…}
The refusal content generated by the assistant.
Refusal string
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content > (schema)>)
type MessageContentDeltaUnion interface{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
One of the following:
type ImageFileDeltaBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
ImageFile [ImageFileDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
type TextDeltaBlock struct{…}
The text content that is part of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
Text [TextDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
type RefusalDeltaBlock struct{…}
The refusal content that is part of a message.
Index int64
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
Refusal stringOptional
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
type ImageURLDeltaBlock struct{…}
References an image URL in the content of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
Type ImageURL
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
ImageURL [ImageURLDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)
type MessageContentPartParamUnionResp interface{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
One of the following:
type ImageFileContentBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
ImageFile [ImageFile](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
type ImageURLContentBlock struct{…}
References an image URL in the content of a message.
ImageURL [ImageURL](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
type TextContentBlockParam struct{…}
The text content that is part of a message.
Text string
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content_part_param > (schema)>)
type MessageDeleted struct{…}
ID string
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) id>)
Deleted bool
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) deleted>)
Object ThreadMessageDeleted
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
type MessageDelta struct{…}
The delta containing the fields that have changed on the Message.
Content [][MessageContentDeltaUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)Optional
The content of the message in array of text and/or images.
One of the following:
type ImageFileDeltaBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
ImageFile [ImageFileDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
type TextDeltaBlock struct{…}
The text content that is part of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
Text [TextDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
type RefusalDeltaBlock struct{…}
The refusal content that is part of a message.
Index int64
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
Refusal stringOptional
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
type ImageURLDeltaBlock struct{…}
References an image URL in the content of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
Type ImageURL
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
ImageURL [ImageURLDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) content>)
Role MessageDeltaRoleOptional
The entity that produced the message. One of `user` or `assistant`.
One of the following:
const MessageDeltaRoleUser MessageDeltaRole = "user"
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 0>)
const MessageDeltaRoleAssistant MessageDeltaRole = "assistant"
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema)>)
type MessageDeltaEvent struct{…}
Represents a message delta i.e. any changed fields on a message during streaming.
ID string
The identifier of the message, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) id>)
Delta [MessageDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_delta > (schema)>)
The delta containing the fields that have changed on the Message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta>)
Object ThreadMessageDelta
The object type, which is always `thread.message.delta`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema)>)
type RefusalContentBlock struct{…}
The refusal content generated by the assistant.
Refusal string
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
type RefusalDeltaBlock struct{…}
The refusal content that is part of a message.
Index int64
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
Refusal stringOptional
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
type Text struct{…}
Annotations [][AnnotationUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)
One of the following:
type FileCitationAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation FileCitationAnnotationFileCitation
FileID string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
type FilePathAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath FilePathAnnotationFilePath
FileID string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
Value string
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text > (schema)>)
type TextContentBlock struct{…}
The text content that is part of a message.
Text [Text](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
type TextContentBlockParam struct{…}
The text content that is part of a message.
Text string
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
type TextDelta struct{…}
Annotations [][AnnotationDeltaUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)Optional
One of the following:
type FileCitationDeltaAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
Index int64
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
EndIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
FileCitation FileCitationDeltaAnnotationFileCitationOptional
FileID stringOptional
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
Quote stringOptional
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
StartIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
Text stringOptional
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
type FilePathDeltaAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
Index int64
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
EndIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
FilePath FilePathDeltaAnnotationFilePathOptional
FileID stringOptional
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
StartIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
Text stringOptional
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) annotations>)
Value stringOptional
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema)>)
type TextDeltaBlock struct{…}
The text content that is part of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
Text [TextDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)