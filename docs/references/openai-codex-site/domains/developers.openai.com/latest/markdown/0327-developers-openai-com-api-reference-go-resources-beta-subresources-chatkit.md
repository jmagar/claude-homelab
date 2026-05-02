ChatKit | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Beta](/api/reference/go/resources/beta)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# ChatKit
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
#### ChatKitSessions
##### [Cancel chat session](/api/reference/go/resources/beta/subresources/chatkit/subresources/sessions/methods/cancel)
client.Beta.ChatKit.Sessions.Cancel(ctx, sessionID) (\*[ChatSession](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session > (schema)>), error)
POST/chatkit/sessions/{session\_id}/cancel
##### [Create ChatKit session](/api/reference/go/resources/beta/subresources/chatkit/subresources/sessions/methods/create)
client.Beta.ChatKit.Sessions.New(ctx, body) (\*[ChatSession](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session > (schema)>), error)
POST/chatkit/sessions
#### ChatKitThreads
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