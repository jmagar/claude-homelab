Realtime | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Realtime
##### ModelsExpand Collapse
type AudioTranscription struct{…}
Language stringOptional
The language of the input audio. Supplying the input language in
[ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
will improve accuracy and latency.
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) language>)
Model AudioTranscriptionModelOptional
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
string
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 0>)
type AudioTranscriptionModel string
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
const AudioTranscriptionModelWhisper1 AudioTranscriptionModel = "whisper-1"
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 0>)
const AudioTranscriptionModelGPT4oMiniTranscribe AudioTranscriptionModel = "gpt-4o-mini-transcribe"
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 1>)
const AudioTranscriptionModelGPT4oMiniTranscribe2025\_12\_15 AudioTranscriptionModel = "gpt-4o-mini-transcribe-2025-12-15"
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 2>)
const AudioTranscriptionModelGPT4oTranscribe AudioTranscriptionModel = "gpt-4o-transcribe"
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 3>)
const AudioTranscriptionModelGPT4oTranscribeDiarize AudioTranscriptionModel = "gpt-4o-transcribe-diarize"
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 4>)
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) model>)
Prompt stringOptional
An optional text to guide the model’s style or continue a previous audio
segment.
For `whisper-1`, the [prompt is a list of keywords](https://platform.openai.com/docs/guides/speech-to-text#prompting).
For `gpt-4o-transcribe` models (excluding `gpt-4o-transcribe-diarize`), the prompt is a free text string, for example “expect words related to technology”.
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) prompt>)
[](<#(resource) realtime > (model) audio_transcription > (schema)>)
type ConversationCreatedEvent struct{…}
Returned when a conversation is created. Emitted right after session creation.
Conversation ConversationCreatedEventConversation
The conversation resource.
ID stringOptional
The unique ID of the conversation.
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) conversation > (property) id>)
Object stringOptional
The object type, must be `realtime.conversation`.
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) conversation > (property) object>)
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) conversation>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) event_id>)
Type ConversationCreated
The event type, must be `conversation.created`.
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_created_event > (schema)>)
type ConversationItemUnion interface{…}
A single item within a Realtime conversation.
One of the following:
type RealtimeConversationItemSystemMessage struct{…}
A system message in a Realtime conversation can be used to provide additional context or instructions to the model. This is similar but distinct from the instruction prompt provided at the start of a conversation, as system messages can be added at any point in the conversation. For major changes to the conversation’s behavior, use instructions, but for smaller updates (e.g. “the user is now asking about a different topic”), use system messages.
Content []RealtimeConversationItemSystemMessageContent
The content of the message.
Text stringOptional
The text content.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) text>)
Type stringOptional
The content type. Always `input\_text` for system messages.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content>)
Role System
The role of the message sender. Always `system`.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) role>)
Type Message
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) id>)
Object RealtimeConversationItemSystemMessageObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) object>)
Status RealtimeConversationItemSystemMessageStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemSystemMessageStatusCompleted RealtimeConversationItemSystemMessageStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemSystemMessageStatusIncomplete RealtimeConversationItemSystemMessageStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemSystemMessageStatusInProgress RealtimeConversationItemSystemMessageStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema)>)
type RealtimeConversationItemUserMessage struct{…}
A user message item in a Realtime conversation.
Content []RealtimeConversationItemUserMessageContent
The content of the message.
Audio stringOptional
Base64-encoded audio bytes (for `input\_audio`), these will be parsed as the format specified in the session input audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) audio>)
Detail stringOptional
The detail level of the image (for `input\_image`). `auto` will default to `high`.
One of the following:
const RealtimeConversationItemUserMessageContentDetailAuto RealtimeConversationItemUserMessageContentDetail = "auto"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 0>)
const RealtimeConversationItemUserMessageContentDetailLow RealtimeConversationItemUserMessageContentDetail = "low"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 1>)
const RealtimeConversationItemUserMessageContentDetailHigh RealtimeConversationItemUserMessageContentDetail = "high"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail>)
ImageURL stringOptional
Base64-encoded image bytes (for `input\_image`) as a data URI. For example `data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...`. Supported formats are PNG and JPEG.
formaturi
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) image_url>)
Text stringOptional
The text content (for `input\_text`).
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) text>)
Transcript stringOptional
Transcript of the audio (for `input\_audio`). This is not sent to the model, but will be attached to the message item for reference.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) transcript>)
Type stringOptional
The content type (`input\_text`, `input\_audio`, or `input\_image`).
One of the following:
const RealtimeConversationItemUserMessageContentTypeInputText RealtimeConversationItemUserMessageContentType = "input\_text"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
const RealtimeConversationItemUserMessageContentTypeInputAudio RealtimeConversationItemUserMessageContentType = "input\_audio"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
const RealtimeConversationItemUserMessageContentTypeInputImage RealtimeConversationItemUserMessageContentType = "input\_image"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content>)
Role User
The role of the message sender. Always `user`.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) role>)
Type Message
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) id>)
Object RealtimeConversationItemUserMessageObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) object>)
Status RealtimeConversationItemUserMessageStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemUserMessageStatusCompleted RealtimeConversationItemUserMessageStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemUserMessageStatusIncomplete RealtimeConversationItemUserMessageStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemUserMessageStatusInProgress RealtimeConversationItemUserMessageStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema)>)
type RealtimeConversationItemAssistantMessage struct{…}
An assistant message item in a Realtime conversation.
Content []RealtimeConversationItemAssistantMessageContent
The content of the message.
Audio stringOptional
Base64-encoded audio bytes, these will be parsed as the format specified in the session output audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) audio>)
Text stringOptional
The text content.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) text>)
Transcript stringOptional
The transcript of the audio content, this will always be present if the output type is `audio`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) transcript>)
Type stringOptional
The content type, `output\_text` or `output\_audio` depending on the session `output\_modalities` configuration.
One of the following:
const RealtimeConversationItemAssistantMessageContentTypeOutputText RealtimeConversationItemAssistantMessageContentType = "output\_text"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
const RealtimeConversationItemAssistantMessageContentTypeOutputAudio RealtimeConversationItemAssistantMessageContentType = "output\_audio"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content>)
Role Assistant
The role of the message sender. Always `assistant`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) role>)
Type Message
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) id>)
Object RealtimeConversationItemAssistantMessageObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) object>)
Status RealtimeConversationItemAssistantMessageStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemAssistantMessageStatusCompleted RealtimeConversationItemAssistantMessageStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemAssistantMessageStatusIncomplete RealtimeConversationItemAssistantMessageStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemAssistantMessageStatusInProgress RealtimeConversationItemAssistantMessageStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema)>)
type RealtimeConversationItemFunctionCall struct{…}
A function call item in a Realtime conversation.
Arguments string
The arguments of the function call. This is a JSON-encoded string representing the arguments passed to the function, for example `{"arg1": "value1", "arg2": 42}`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) arguments>)
Name string
The name of the function being called.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) name>)
Type FunctionCall
The type of the item. Always `function\_call`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) id>)
CallID stringOptional
The ID of the function call.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) call_id>)
Object RealtimeConversationItemFunctionCallObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) object>)
Status RealtimeConversationItemFunctionCallStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemFunctionCallStatusCompleted RealtimeConversationItemFunctionCallStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemFunctionCallStatusIncomplete RealtimeConversationItemFunctionCallStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemFunctionCallStatusInProgress RealtimeConversationItemFunctionCallStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema)>)
type RealtimeConversationItemFunctionCallOutput struct{…}
A function call output item in a Realtime conversation.
CallID string
The ID of the function call this output is for.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) call_id>)
Output string
The output of the function call, this is free text and can contain any information or simply be empty.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) output>)
Type FunctionCallOutput
The type of the item. Always `function\_call\_output`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) id>)
Object RealtimeConversationItemFunctionCallOutputObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) object>)
Status RealtimeConversationItemFunctionCallOutputStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemFunctionCallOutputStatusCompleted RealtimeConversationItemFunctionCallOutputStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemFunctionCallOutputStatusIncomplete RealtimeConversationItemFunctionCallOutputStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemFunctionCallOutputStatusInProgress RealtimeConversationItemFunctionCallOutputStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema)>)
type RealtimeMcpApprovalResponse struct{…}
A Realtime item responding to an MCP approval request.
ID string
The unique ID of the approval response.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) id>)
ApprovalRequestID string
The ID of the approval request being answered.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approval_request_id>)
Approve bool
Whether the request was approved.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approve>)
Type McpApprovalResponse
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) type>)
Reason stringOptional
Optional reason for the decision.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) reason>)
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema)>)
type RealtimeMcpListTools struct{…}
A Realtime item listing tools available on an MCP server.
ServerLabel string
The label of the MCP server.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) server_label>)
Tools []RealtimeMcpListToolsTool
The tools available on the server.
InputSchema any
The JSON schema describing the tool’s input.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) input_schema>)
Name string
The name of the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) name>)
Annotations anyOptional
Additional annotations about the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) annotations>)
Description stringOptional
The description of the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) description>)
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools>)
Type McpListTools
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) type>)
ID stringOptional
The unique ID of the list.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) id>)
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema)>)
type RealtimeMcpToolCall struct{…}
A Realtime item representing an invocation of a tool on an MCP server.
ID string
The unique ID of the tool call.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) id>)
Arguments string
A JSON string of the arguments passed to the tool.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) arguments>)
Name string
The name of the tool that was run.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) name>)
ServerLabel string
The label of the MCP server running the tool.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) server_label>)
Type McpCall
The type of the item. Always `mcp\_call`.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) type>)
ApprovalRequestID stringOptional
The ID of an associated approval request, if any.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) approval_request_id>)
Error RealtimeMcpToolCallErrorUnionOptional
The error from the tool call, if any.
One of the following:
type RealtimeMcpProtocolError struct{…}
Code int64
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) code>)
Message string
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) message>)
Type ProtocolError
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema)>)
type RealtimeMcpToolExecutionError struct{…}
Message string
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) message>)
Type ToolExecutionError
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>)
type RealtimeMcphttpError struct{…}
Code int64
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) code>)
Message string
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) message>)
Type HTTPError
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema)>)
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) error>)
Output stringOptional
The output from the tool call.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) output>)
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema)>)
type RealtimeMcpApprovalRequest struct{…}
A Realtime item requesting human approval of a tool invocation.
ID string
The unique ID of the approval request.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) id>)
Arguments string
A JSON string of arguments for the tool.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) arguments>)
Name string
The name of the tool to run.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) name>)
ServerLabel string
The label of the MCP server making the request.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) server_label>)
Type McpApprovalRequest
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema)>)
[](<#(resource) realtime > (model) conversation_item > (schema)>)
type ConversationItemAdded struct{…}
Sent by the server when an Item is added to the default Conversation. This can happen in several cases:
* When the client sends a `conversation.item.create` event.
* When the input audio buffer is committed. In this case the item will be a user message containing the audio from the buffer.
* When the model is generating a Response. In this case the `conversation.item.added` event will be sent when the model starts generating a specific Item, and thus it will not yet have any content (and `status` will be `in\_progress`).
The event will include the full content of the Item (except when model is generating a Response) except for audio data, which can be retrieved separately with a `conversation.item.retrieve` event if necessary.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_added > (schema) > (property) event_id>)
Item [ConversationItemUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) conversation_item_added > (schema) > (property) item>)
Type ConversationItemAdded
The event type, must be `conversation.item.added`.
[](<#(resource) realtime > (model) conversation_item_added > (schema) > (property) type>)
PreviousItemID stringOptional
The ID of the item that precedes this one, if any. This is used to
maintain ordering when items are inserted.
[](<#(resource) realtime > (model) conversation_item_added > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) conversation_item_added > (schema)>)
type ConversationItemCreateEvent struct{…}
Add a new Item to the Conversation’s context, including messages, function
calls, and function call responses. This event can be used both to populate a
“history” of the conversation and to add new items mid-stream, but has the
current limitation that it cannot populate assistant audio messages.
If successful, the server will respond with a `conversation.item.created`
event, otherwise an `error` event will be sent.
Item [ConversationItemUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item>)
Type ConversationItemCreate
The event type, must be `conversation.item.create`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) event_id>)
PreviousItemID stringOptional
The ID of the preceding item after which the new item will be inserted. If not set, the new item will be appended to the end of the conversation.
If set to `root`, the new item will be added to the beginning of the conversation.
If set to an existing ID, it allows an item to be inserted mid-conversation. If the ID cannot be found, an error will be returned and the item will not be added.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema)>)
type ConversationItemCreatedEvent struct{…}
Returned when a conversation item is created. There are several scenarios that produce this event:
* The server is generating a Response, which if successful will produce
either one or two Items, which will be of type `message`
(role `assistant`) or type `function\_call`.
* The input audio buffer has been committed, either by the client or the
server (in `server\_vad` mode). The server will take the content of the
input audio buffer and add it to a new user message Item.
* The client has sent a `conversation.item.create` event to add a new Item
to the Conversation.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_created_event > (schema) > (property) event_id>)
Item [ConversationItemUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) conversation_item_created_event > (schema) > (property) item>)
Type ConversationItemCreated
The event type, must be `conversation.item.created`.
[](<#(resource) realtime > (model) conversation_item_created_event > (schema) > (property) type>)
PreviousItemID stringOptional
The ID of the preceding item in the Conversation context, allows the
client to understand the order of the conversation. Can be `null` if the
item has no predecessor.
[](<#(resource) realtime > (model) conversation_item_created_event > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) conversation_item_created_event > (schema)>)
type ConversationItemDeleteEvent struct{…}
Send this event when you want to remove any item from the conversation
history. The server will respond with a `conversation.item.deleted` event,
unless the item does not exist in the conversation history, in which case the
server will respond with an error.
ItemID string
The ID of the item to delete.
[](<#(resource) realtime > (model) conversation_item_delete_event > (schema) > (property) item_id>)
Type ConversationItemDelete
The event type, must be `conversation.item.delete`.
[](<#(resource) realtime > (model) conversation_item_delete_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) conversation_item_delete_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) conversation_item_delete_event > (schema)>)
type ConversationItemDeletedEvent struct{…}
Returned when an item in the conversation is deleted by the client with a
`conversation.item.delete` event. This event is used to synchronize the
server’s understanding of the conversation history with the client’s view.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_deleted_event > (schema) > (property) event_id>)
ItemID string
The ID of the item that was deleted.
[](<#(resource) realtime > (model) conversation_item_deleted_event > (schema) > (property) item_id>)
Type ConversationItemDeleted
The event type, must be `conversation.item.deleted`.
[](<#(resource) realtime > (model) conversation_item_deleted_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_deleted_event > (schema)>)
type ConversationItemDone struct{…}
Returned when a conversation item is finalized.
The event will include the full content of the Item except for audio data, which can be retrieved separately with a `conversation.item.retrieve` event if needed.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_done > (schema) > (property) event_id>)
Item [ConversationItemUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) conversation_item_done > (schema) > (property) item>)
Type ConversationItemDone
The event type, must be `conversation.item.done`.
[](<#(resource) realtime > (model) conversation_item_done > (schema) > (property) type>)
PreviousItemID stringOptional
The ID of the item that precedes this one, if any. This is used to
maintain ordering when items are inserted.
[](<#(resource) realtime > (model) conversation_item_done > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) conversation_item_done > (schema)>)
type ConversationItemInputAudioTranscriptionCompletedEvent struct{…}
This event is the output of audio transcription for user audio written to the
user audio buffer. Transcription begins when the input audio buffer is
committed by the client or server (when VAD is enabled). Transcription runs
asynchronously with Response creation, so this event may come before or after
the Response events.
Realtime API models accept audio natively, and thus input transcription is a
separate process run on a separate ASR (Automatic Speech Recognition) model.
The transcript may diverge somewhat from the model’s interpretation, and
should be treated as a rough guide.
ContentIndex int64
The index of the content part containing the audio.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) content_index>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) event_id>)
ItemID string
The ID of the item containing the audio that is being transcribed.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) item_id>)
Transcript string
The transcribed text.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) transcript>)
Type ConversationItemInputAudioTranscriptionCompleted
The event type, must be
`conversation.item.input\_audio\_transcription.completed`.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) type>)
Usage ConversationItemInputAudioTranscriptionCompletedEventUsageUnion
Usage statistics for the transcription, this is billed according to the ASR model’s pricing rather than the realtime model’s pricing.
One of the following:
ConversationItemInputAudioTranscriptionCompletedEventUsageTranscriptTextUsageTokens
InputTokens int64
Number of input tokens billed for this request.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) input_tokens>)
OutputTokens int64
Number of output tokens generated.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) output_tokens>)
TotalTokens int64
Total number of tokens used (input + output).
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) total_tokens>)
Type Tokens
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) type>)
InputTokenDetails ConversationItemInputAudioTranscriptionCompletedEventUsageTranscriptTextUsageTokensInputTokenDetailsOptional
Details about the input tokens billed for this request.
AudioTokens int64Optional
Number of audio tokens billed for this request.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
TextTokens int64Optional
Number of text tokens billed for this request.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0>)
ConversationItemInputAudioTranscriptionCompletedEventUsageTranscriptTextUsageDuration
Seconds float64
Duration of the input audio in seconds.
formatdouble
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 1 > (property) seconds>)
Type Duration
The type of the usage object. Always `duration` for this variant.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 1 > (property) type>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 1>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage>)
Logprobs [][LogProbProperties](</api/reference/go/resources/realtime#(resource) realtime > (model) log_prob_properties > (schema)>)Optional
The log probabilities of the transcription.
Token string
The token that was used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) token>)
Bytes []int64
The bytes that were used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) bytes>)
Logprob float64
The log probability of the token.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) logprob>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) logprobs>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema)>)
type ConversationItemInputAudioTranscriptionDeltaEvent struct{…}
Returned when the text value of an input audio transcription content part is updated with incremental transcription results.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) event_id>)
ItemID string
The ID of the item containing the audio that is being transcribed.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) item_id>)
Type ConversationItemInputAudioTranscriptionDelta
The event type, must be `conversation.item.input\_audio\_transcription.delta`.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) type>)
ContentIndex int64Optional
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) content_index>)
Delta stringOptional
The text delta.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) delta>)
Logprobs [][LogProbProperties](</api/reference/go/resources/realtime#(resource) realtime > (model) log_prob_properties > (schema)>)Optional
The log probabilities of the transcription. These can be enabled by configurating the session with `"include": ["item.input\_audio\_transcription.logprobs"]`. Each entry in the array corresponds a log probability of which token would be selected for this chunk of transcription. This can help to identify if it was possible there were multiple valid options for a given chunk of transcription.
Token string
The token that was used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) token>)
Bytes []int64
The bytes that were used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) bytes>)
Logprob float64
The log probability of the token.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) logprob>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) logprobs>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema)>)
type ConversationItemInputAudioTranscriptionFailedEvent struct{…}
Returned when input audio transcription is configured, and a transcription
request for a user message failed. These events are separate from other
`error` events so that the client can identify the related Item.
ContentIndex int64
The index of the content part containing the audio.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) content_index>)
Error ConversationItemInputAudioTranscriptionFailedEventError
Details of the transcription error.
Code stringOptional
Error code, if any.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error > (property) code>)
Message stringOptional
A human-readable error message.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error > (property) message>)
Param stringOptional
Parameter related to the error, if any.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error > (property) param>)
Type stringOptional
The type of error.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error > (property) type>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) event_id>)
ItemID string
The ID of the user message item.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) item_id>)
Type ConversationItemInputAudioTranscriptionFailed
The event type, must be
`conversation.item.input\_audio\_transcription.failed`.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema)>)
type ConversationItemInputAudioTranscriptionSegment struct{…}
Returned when an input audio transcription segment is identified for an item.
ID string
The segment identifier.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) id>)
ContentIndex int64
The index of the input audio content part within the item.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) content_index>)
End float64
End time of the segment in seconds.
formatdouble
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) end>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) event_id>)
ItemID string
The ID of the item containing the input audio content.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) item_id>)
Speaker string
The detected speaker label for this segment.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) speaker>)
Start float64
Start time of the segment in seconds.
formatdouble
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) start>)
Text string
The text for this segment.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) text>)
Type ConversationItemInputAudioTranscriptionSegment
The event type, must be `conversation.item.input\_audio\_transcription.segment`.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema)>)
type ConversationItemRetrieveEvent struct{…}
Send this event when you want to retrieve the server’s representation of a specific item in the conversation history. This is useful, for example, to inspect user audio after noise cancellation and VAD.
The server will respond with a `conversation.item.retrieved` event,
unless the item does not exist in the conversation history, in which case the
server will respond with an error.
ItemID string
The ID of the item to retrieve.
[](<#(resource) realtime > (model) conversation_item_retrieve_event > (schema) > (property) item_id>)
Type ConversationItemRetrieve
The event type, must be `conversation.item.retrieve`.
[](<#(resource) realtime > (model) conversation_item_retrieve_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) conversation_item_retrieve_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) conversation_item_retrieve_event > (schema)>)
type ConversationItemTruncateEvent struct{…}
Send this event to truncate a previous assistant message’s audio. The server
will produce audio faster than realtime, so this event is useful when the user
interrupts to truncate audio that has already been sent to the client but not
yet played. This will synchronize the server’s understanding of the audio with
the client’s playback.
Truncating audio will delete the server-side text transcript to ensure there
is not text in the context that hasn’t been heard by the user.
If successful, the server will respond with a `conversation.item.truncated`
event.
AudioEndMs int64
Inclusive duration up to which audio is truncated, in milliseconds. If
the audio\_end\_ms is greater than the actual audio duration, the server
will respond with an error.
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) audio_end_ms>)
ContentIndex int64
The index of the content part to truncate. Set this to `0`.
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) content_index>)
ItemID string
The ID of the assistant message item to truncate. Only assistant message
items can be truncated.
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) item_id>)
Type ConversationItemTruncate
The event type, must be `conversation.item.truncate`.
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema)>)
type ConversationItemTruncatedEvent struct{…}
Returned when an earlier assistant audio message item is truncated by the
client with a `conversation.item.truncate` event. This event is used to
synchronize the server’s understanding of the audio with the client’s playback.
This action will truncate the audio and remove the server-side text transcript
to ensure there is no text in the context that hasn’t been heard by the user.
AudioEndMs int64
The duration up to which the audio was truncated, in milliseconds.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) audio_end_ms>)
ContentIndex int64
The index of the content part that was truncated.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) content_index>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) event_id>)
ItemID string
The ID of the assistant message item that was truncated.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) item_id>)
Type ConversationItemTruncated
The event type, must be `conversation.item.truncated`.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema)>)
type ConversationItemWithReference struct{…}
The item to add to the conversation.
ID stringOptional
For an item of type (`message` | `function\_call` | `function\_call\_output`)
this field allows the client to assign the unique ID of the item. It is
not required because the server will generate one if not provided.
For an item of type `item\_reference`, this field is required and is a
reference to any item that has previously existed in the conversation.
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) id>)
Arguments stringOptional
The arguments of the function call (for `function\_call` items).
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) arguments>)
CallID stringOptional
The ID of the function call (for `function\_call` and
`function\_call\_output` items). If passed on a `function\_call\_output`
item, the server will check that a `function\_call` item with the same
ID exists in the conversation history.
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) call_id>)
Content []ConversationItemWithReferenceContentOptional
The content of the message, applicable for `message` items.
* Message items of role `system` support only `input\_text` content
* Message items of role `user` support `input\_text` and `input\_audio`
content
* Message items of role `assistant` support `text` content.
ID stringOptional
ID of a previous conversation item to reference (for `item\_reference`
content types in `response.create` events). These can reference both
client and server created items.
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) id>)
Audio stringOptional
Base64-encoded audio bytes, used for `input\_audio` content type.
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) audio>)
Text stringOptional
The text content, used for `input\_text` and `text` content types.
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) text>)
Transcript stringOptional
The transcript of the audio, used for `input\_audio` content type.
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) transcript>)
Type stringOptional
The content type (`input\_text`, `input\_audio`, `item\_reference`, `text`).
One of the following:
const ConversationItemWithReferenceContentTypeInputText ConversationItemWithReferenceContentType = "input\_text"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) type > (member) 0>)
const ConversationItemWithReferenceContentTypeInputAudio ConversationItemWithReferenceContentType = "input\_audio"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) type > (member) 1>)
const ConversationItemWithReferenceContentTypeItemReference ConversationItemWithReferenceContentType = "item\_reference"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) type > (member) 2>)
const ConversationItemWithReferenceContentTypeText ConversationItemWithReferenceContentType = "text"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) type > (member) 3>)
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content>)
Name stringOptional
The name of the function being called (for `function\_call` items).
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) name>)
Object ConversationItemWithReferenceObjectOptional
Identifier for the API object being returned - always `realtime.item`.
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) object>)
Output stringOptional
The output of the function call (for `function\_call\_output` items).
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) output>)
Role ConversationItemWithReferenceRoleOptional
The role of the message sender (`user`, `assistant`, `system`), only
applicable for `message` items.
One of the following:
const ConversationItemWithReferenceRoleUser ConversationItemWithReferenceRole = "user"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) role > (member) 0>)
const ConversationItemWithReferenceRoleAssistant ConversationItemWithReferenceRole = "assistant"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) role > (member) 1>)
const ConversationItemWithReferenceRoleSystem ConversationItemWithReferenceRole = "system"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) role > (member) 2>)
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) role>)
Status ConversationItemWithReferenceStatusOptional
The status of the item (`completed`, `incomplete`, `in\_progress`). These have no effect
on the conversation, but are accepted for consistency with the
`conversation.item.created` event.
One of the following:
const ConversationItemWithReferenceStatusCompleted ConversationItemWithReferenceStatus = "completed"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) status > (member) 0>)
const ConversationItemWithReferenceStatusIncomplete ConversationItemWithReferenceStatus = "incomplete"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) status > (member) 1>)
const ConversationItemWithReferenceStatusInProgress ConversationItemWithReferenceStatus = "in\_progress"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) status>)
Type ConversationItemWithReferenceTypeOptional
The type of the item (`message`, `function\_call`, `function\_call\_output`, `item\_reference`).
One of the following:
const ConversationItemWithReferenceTypeMessage ConversationItemWithReferenceType = "message"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) type > (member) 0>)
const ConversationItemWithReferenceTypeFunctionCall ConversationItemWithReferenceType = "function\_call"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) type > (member) 1>)
const ConversationItemWithReferenceTypeFunctionCallOutput ConversationItemWithReferenceType = "function\_call\_output"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) type > (member) 2>)
const ConversationItemWithReferenceTypeItemReference ConversationItemWithReferenceType = "item\_reference"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) type > (member) 3>)
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema)>)
type InputAudioBufferAppendEvent struct{…}
Send this event to append audio bytes to the input audio buffer. The audio
buffer is temporary storage you can write to and later commit. A “commit” will create a new
user message item in the conversation history from the buffer content and clear the buffer.
Input audio transcription (if enabled) will be generated when the buffer is committed.
If VAD is enabled the audio buffer is used to detect speech and the server will decide
when to commit. When Server VAD is disabled, you must commit the audio buffer
manually. Input audio noise reduction operates on writes to the audio buffer.
The client may choose how much audio to place in each event up to a maximum
of 15 MiB, for example streaming smaller chunks from the client may allow the
VAD to be more responsive. Unlike most other client events, the server will
not send a confirmation response to this event.
Audio string
Base64-encoded audio bytes. This must be in the format specified by the
`input\_audio\_format` field in the session configuration.
[](<#(resource) realtime > (model) input_audio_buffer_append_event > (schema) > (property) audio>)
Type InputAudioBufferAppend
The event type, must be `input\_audio\_buffer.append`.
[](<#(resource) realtime > (model) input_audio_buffer_append_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) input_audio_buffer_append_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) input_audio_buffer_append_event > (schema)>)
type InputAudioBufferClearEvent struct{…}
Send this event to clear the audio bytes in the buffer. The server will
respond with an `input\_audio\_buffer.cleared` event.
Type InputAudioBufferClear
The event type, must be `input\_audio\_buffer.clear`.
[](<#(resource) realtime > (model) input_audio_buffer_clear_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) input_audio_buffer_clear_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) input_audio_buffer_clear_event > (schema)>)
type InputAudioBufferClearedEvent struct{…}
Returned when the input audio buffer is cleared by the client with a
`input\_audio\_buffer.clear` event.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_cleared_event > (schema) > (property) event_id>)
Type InputAudioBufferCleared
The event type, must be `input\_audio\_buffer.cleared`.
[](<#(resource) realtime > (model) input_audio_buffer_cleared_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_cleared_event > (schema)>)
type InputAudioBufferCommitEvent struct{…}
Send this event to commit the user input audio buffer, which will create a new user message item in the conversation. This event will produce an error if the input audio buffer is empty. When in Server VAD mode, the client does not need to send this event, the server will commit the audio buffer automatically.
Committing the input audio buffer will trigger input audio transcription (if enabled in session configuration), but it will not create a response from the model. The server will respond with an `input\_audio\_buffer.committed` event.
Type InputAudioBufferCommit
The event type, must be `input\_audio\_buffer.commit`.
[](<#(resource) realtime > (model) input_audio_buffer_commit_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) input_audio_buffer_commit_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) input_audio_buffer_commit_event > (schema)>)
type InputAudioBufferCommittedEvent struct{…}
Returned when an input audio buffer is committed, either by the client or
automatically in server VAD mode. The `item\_id` property is the ID of the user
message item that will be created, thus a `conversation.item.created` event
will also be sent to the client.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema) > (property) event_id>)
ItemID string
The ID of the user message item that will be created.
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema) > (property) item_id>)
Type InputAudioBufferCommitted
The event type, must be `input\_audio\_buffer.committed`.
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema) > (property) type>)
PreviousItemID stringOptional
The ID of the preceding item after which the new item will be inserted.
Can be `null` if the item has no predecessor.
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema)>)
type InputAudioBufferDtmfEventReceivedEvent struct{…}
**SIP Only:** Returned when an DTMF event is received. A DTMF event is a message that
represents a telephone keypad press (0–9, \*, #, A–D). The `event` property
is the keypad that the user press. The `received\_at` is the UTC Unix Timestamp
that the server received the event.
Event string
The telephone keypad that was pressed by the user.
[](<#(resource) realtime > (model) input_audio_buffer_dtmf_event_received_event > (schema) > (property) event>)
ReceivedAt int64
UTC Unix Timestamp when DTMF Event was received by server.
[](<#(resource) realtime > (model) input_audio_buffer_dtmf_event_received_event > (schema) > (property) received_at>)
Type InputAudioBufferDtmfEventReceived
The event type, must be `input\_audio\_buffer.dtmf\_event\_received`.
[](<#(resource) realtime > (model) input_audio_buffer_dtmf_event_received_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_dtmf_event_received_event > (schema)>)
type InputAudioBufferSpeechStartedEvent struct{…}
Sent by the server when in `server\_vad` mode to indicate that speech has been
detected in the audio buffer. This can happen any time audio is added to the
buffer (unless speech is already detected). The client may want to use this
event to interrupt audio playback or provide visual feedback to the user.
The client should expect to receive a `input\_audio\_buffer.speech\_stopped` event
when speech stops. The `item\_id` property is the ID of the user message item
that will be created when speech stops and will also be included in the
`input\_audio\_buffer.speech\_stopped` event (unless the client manually commits
the audio buffer during VAD activation).
AudioStartMs int64
Milliseconds from the start of all audio written to the buffer during the
session when speech was first detected. This will correspond to the
beginning of audio sent to the model, and thus includes the
`prefix\_padding\_ms` configured in the Session.
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema) > (property) audio_start_ms>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema) > (property) event_id>)
ItemID string
The ID of the user message item that will be created when speech stops.
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema) > (property) item_id>)
Type InputAudioBufferSpeechStarted
The event type, must be `input\_audio\_buffer.speech\_started`.
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema)>)
type InputAudioBufferSpeechStoppedEvent struct{…}
Returned in `server\_vad` mode when the server detects the end of speech in
the audio buffer. The server will also send an `conversation.item.created`
event with the user message item that is created from the audio buffer.
AudioEndMs int64
Milliseconds since the session started when speech stopped. This will
correspond to the end of audio sent to the model, and thus includes the
`min\_silence\_duration\_ms` configured in the Session.
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema) > (property) audio_end_ms>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema) > (property) event_id>)
ItemID string
The ID of the user message item that will be created.
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema) > (property) item_id>)
Type InputAudioBufferSpeechStopped
The event type, must be `input\_audio\_buffer.speech\_stopped`.
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema)>)
type InputAudioBufferTimeoutTriggered struct{…}
Returned when the Server VAD timeout is triggered for the input audio buffer. This is configured
with `idle\_timeout\_ms` in the `turn\_detection` settings of the session, and it indicates that
there hasn’t been any speech detected for the configured duration.
The `audio\_start\_ms` and `audio\_end\_ms` fields indicate the segment of audio after the last
model response up to the triggering time, as an offset from the beginning of audio written
to the input audio buffer. This means it demarcates the segment of audio that was silent and
the difference between the start and end values will roughly match the configured timeout.
The empty audio will be committed to the conversation as an `input\_audio` item (there will be a
`input\_audio\_buffer.committed` event) and a model response will be generated. There may be speech
that didn’t trigger VAD but is still detected by the model, so the model may respond with
something relevant to the conversation or a prompt to continue speaking.
AudioEndMs int64
Millisecond offset of audio written to the input audio buffer at the time the timeout was triggered.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) audio_end_ms>)
AudioStartMs int64
Millisecond offset of audio written to the input audio buffer that was after the playback time of the last model response.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) audio_start_ms>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) event_id>)
ItemID string
The ID of the item associated with this segment.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) item_id>)
Type InputAudioBufferTimeoutTriggered
The event type, must be `input\_audio\_buffer.timeout\_triggered`.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema)>)
type LogProbProperties struct{…}
A log probability object.
Token string
The token that was used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) token>)
Bytes []int64
The bytes that were used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) bytes>)
Logprob float64
The log probability of the token.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) logprob>)
[](<#(resource) realtime > (model) log_prob_properties > (schema)>)
type McpListToolsCompleted struct{…}
Returned when listing MCP tools has completed for an item.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) mcp_list_tools_completed > (schema) > (property) event_id>)
ItemID string
The ID of the MCP list tools item.
[](<#(resource) realtime > (model) mcp_list_tools_completed > (schema) > (property) item_id>)
Type McpListToolsCompleted
The event type, must be `mcp\_list\_tools.completed`.
[](<#(resource) realtime > (model) mcp_list_tools_completed > (schema) > (property) type>)
[](<#(resource) realtime > (model) mcp_list_tools_completed > (schema)>)
type McpListToolsFailed struct{…}
Returned when listing MCP tools has failed for an item.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) mcp_list_tools_failed > (schema) > (property) event_id>)
ItemID string
The ID of the MCP list tools item.
[](<#(resource) realtime > (model) mcp_list_tools_failed > (schema) > (property) item_id>)
Type McpListToolsFailed
The event type, must be `mcp\_list\_tools.failed`.
[](<#(resource) realtime > (model) mcp_list_tools_failed > (schema) > (property) type>)
[](<#(resource) realtime > (model) mcp_list_tools_failed > (schema)>)
type McpListToolsInProgress struct{…}
Returned when listing MCP tools is in progress for an item.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) mcp_list_tools_in_progress > (schema) > (property) event_id>)
ItemID string
The ID of the MCP list tools item.
[](<#(resource) realtime > (model) mcp_list_tools_in_progress > (schema) > (property) item_id>)
Type McpListToolsInProgress
The event type, must be `mcp\_list\_tools.in\_progress`.
[](<#(resource) realtime > (model) mcp_list_tools_in_progress > (schema) > (property) type>)
[](<#(resource) realtime > (model) mcp_list_tools_in_progress > (schema)>)
type NoiseReductionType string
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
One of the following:
const NoiseReductionTypeNearField [NoiseReductionType](</api/reference/go/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>) = "near\_field"
[](<#(resource) realtime > (model) noise_reduction_type > (schema) > (member) 0>)
const NoiseReductionTypeFarField [NoiseReductionType](</api/reference/go/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>) = "far\_field"
[](<#(resource) realtime > (model) noise_reduction_type > (schema) > (member) 1>)
[](<#(resource) realtime > (model) noise_reduction_type > (schema)>)
type OutputAudioBufferClearEvent struct{…}
**WebRTC/SIP Only:** Emit to cut off the current audio response. This will trigger the server to
stop generating audio and emit a `output\_audio\_buffer.cleared` event. This
event should be preceded by a `response.cancel` client event to stop the
generation of the current response.
[Learn more](https://platform.openai.com/docs/guides/realtime-conversations#client-and-server-events-for-audio-in-webrtc).
Type OutputAudioBufferClear
The event type, must be `output\_audio\_buffer.clear`.
[](<#(resource) realtime > (model) output_audio_buffer_clear_event > (schema) > (property) type>)
EventID stringOptional
The unique ID of the client event used for error handling.
[](<#(resource) realtime > (model) output_audio_buffer_clear_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) output_audio_buffer_clear_event > (schema)>)
type RateLimitsUpdatedEvent struct{…}
Emitted at the beginning of a Response to indicate the updated rate limits.
When a Response is created some tokens will be “reserved” for the output
tokens, the rate limits shown here reflect that reservation, which is then
adjusted accordingly once the Response is completed.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) event_id>)
RateLimits []RateLimitsUpdatedEventRateLimit
List of rate limit information.
Limit int64Optional
The maximum allowed value for the rate limit.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) limit>)
Name stringOptional
The name of the rate limit (`requests`, `tokens`).
One of the following:
const RateLimitsUpdatedEventRateLimitNameRequests RateLimitsUpdatedEventRateLimitName = "requests"
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) name > (member) 0>)
const RateLimitsUpdatedEventRateLimitNameTokens RateLimitsUpdatedEventRateLimitName = "tokens"
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) name > (member) 1>)
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) name>)
Remaining int64Optional
The remaining value before the limit is reached.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) remaining>)
ResetSeconds float64Optional
Seconds until the rate limit resets.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) reset_seconds>)
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits>)
Type RateLimitsUpdated
The event type, must be `rate\_limits.updated`.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema)>)
type RealtimeAudioConfig struct{…}
Configuration for input and output audio.
Input [RealtimeAudioConfigInput](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_config_input > (schema)>)Optional
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) input>)
Output [RealtimeAudioConfigOutput](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_config_output > (schema)>)Optional
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema)>)
type RealtimeAudioConfigInput struct{…}
Format [RealtimeAudioFormatsUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)Optional
The format of the input audio.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format>)
NoiseReduction RealtimeAudioConfigInputNoiseReductionOptional
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
Type [NoiseReductionType](</api/reference/go/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)Optional
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) noise_reduction > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) noise_reduction>)
Transcription [AudioTranscription](</api/reference/go/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>)Optional
Configuration for input audio transcription, defaults to off and can be set to `null` to turn off once on. Input audio transcription is not native to the model, since the model consumes audio directly. Transcription runs asynchronously through [the /audio/transcriptions endpoint](https://platform.openai.com/docs/api-reference/audio/createTranscription) and should be treated as guidance of input audio content rather than precisely what the model heard. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription>)
TurnDetection [RealtimeAudioInputTurnDetectionUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema)>)Optional
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with “uhhm”, the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema)>)
type RealtimeAudioConfigOutput struct{…}
Format [RealtimeAudioFormatsUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)Optional
The format of the output audio.
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format>)
Speed float64Optional
The speed of the model’s spoken response as a multiple of the original speed.
1.0 is the default speed. 0.25 is the minimum speed. 1.5 is the maximum speed. This value can only be changed in between model turns, not while a response is in progress.
This parameter is a post-processing adjustment to the audio after it is generated, it’s
also possible to prompt the model to speak faster or slower.
maximum1.5
minimum0.25
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) speed>)
Voice RealtimeAudioConfigOutputVoiceUnionOptional
The voice the model uses to respond. Supported built-in voices are
`alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`, `shimmer`, `verse`,
`marin`, and `cedar`. You may also provide a custom voice object with
an `id`, for example `{ "id": "voice\_1234" }`. Voice cannot be changed
during the session once the model has responded with audio at least once.
We recommend `marin` and `cedar` for best quality.
One of the following:
string
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 0>)
string
One of the following:
const RealtimeAudioConfigOutputVoiceStringAlloy RealtimeAudioConfigOutputVoiceString = "alloy"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 0>)
const RealtimeAudioConfigOutputVoiceStringAsh RealtimeAudioConfigOutputVoiceString = "ash"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 1>)
const RealtimeAudioConfigOutputVoiceStringBallad RealtimeAudioConfigOutputVoiceString = "ballad"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 2>)
const RealtimeAudioConfigOutputVoiceStringCoral RealtimeAudioConfigOutputVoiceString = "coral"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 3>)
const RealtimeAudioConfigOutputVoiceStringEcho RealtimeAudioConfigOutputVoiceString = "echo"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 4>)
const RealtimeAudioConfigOutputVoiceStringSage RealtimeAudioConfigOutputVoiceString = "sage"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 5>)
const RealtimeAudioConfigOutputVoiceStringShimmer RealtimeAudioConfigOutputVoiceString = "shimmer"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 6>)
const RealtimeAudioConfigOutputVoiceStringVerse RealtimeAudioConfigOutputVoiceString = "verse"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 7>)
const RealtimeAudioConfigOutputVoiceStringMarin RealtimeAudioConfigOutputVoiceString = "marin"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 8>)
const RealtimeAudioConfigOutputVoiceStringCedar RealtimeAudioConfigOutputVoiceString = "cedar"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1>)
RealtimeAudioConfigOutputVoiceID
ID string
The custom voice ID, e.g. `voice\_1234`.
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 2 > (property) id>)
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 2>)
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice>)
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema)>)
type RealtimeAudioFormatsUnion interface{…}
The PCM audio format. Only a 24kHz sample rate is supported.
One of the following:
type RealtimeAudioFormatsAudioPCM struct{…}
The PCM audio format. Only a 24kHz sample rate is supported.
Rate int64Optional
The sample rate of the audio. Always `24000`.
[](<#(resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) rate>)
Type stringOptional
The audio format. Always `audio/pcm`.
[](<#(resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0>)
type RealtimeAudioFormatsAudioPCMU struct{…}
The G.711 μ-law format.
Type stringOptional
The audio format. Always `audio/pcmu`.
[](<#(resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1>)
type RealtimeAudioFormatsAudioPCMA struct{…}
The G.711 A-law format.
Type stringOptional
The audio format. Always `audio/pcma`.
[](<#(resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2>)
[](<#(resource) realtime > (model) realtime_audio_formats > (schema)>)
type RealtimeAudioInputTurnDetectionUnion interface{…}
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with “uhhm”, the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
One of the following:
RealtimeAudioInputTurnDetectionServerVad
Type ServerVad
Type of turn detection, `server\_vad` to turn on simple Server VAD.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) type>)
CreateResponse boolOptional
Whether or not to automatically generate a response when a VAD stop event occurs. If `interrupt\_response` is set to `false` this may fail to create a response if the model is already responding.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) create_response>)
IdleTimeoutMs int64Optional
Optional timeout after which a model response will be triggered automatically. This is
useful for situations in which a long pause from the user is unexpected, such as a phone
call. The model will effectively prompt the user to continue the conversation based
on the current context.
The timeout value will be applied after the last model response’s audio has finished playing,
i.e. it’s set to the `response.done` time plus audio playback duration.
An `input\_audio\_buffer.timeout\_triggered` event (plus events
associated with the Response) will be emitted when the timeout is reached.
Idle timeout is currently only supported for `server\_vad` mode.
minimum5000
maximum30000
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) idle_timeout_ms>)
InterruptResponse boolOptional
Whether or not to automatically interrupt (cancel) any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs. If `true` then the response will be cancelled, otherwise it will continue until complete.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) interrupt_response>)
PrefixPaddingMs int64Optional
Used only for `server\_vad` mode. Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) prefix_padding_ms>)
SilenceDurationMs int64Optional
Used only for `server\_vad` mode. Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) silence_duration_ms>)
Threshold float64Optional
Used only for `server\_vad` mode. Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) threshold>)
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0>)
RealtimeAudioInputTurnDetectionSemanticVad
Type SemanticVad
Type of turn detection, `semantic\_vad` to turn on Semantic VAD.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) type>)
CreateResponse boolOptional
Whether or not to automatically generate a response when a VAD stop event occurs.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) create_response>)
Eagerness stringOptional
Used only for `semantic\_vad` mode. The eagerness of the model to respond. `low` will wait longer for the user to continue speaking, `high` will respond more quickly. `auto` is the default and is equivalent to `medium`. `low`, `medium`, and `high` have max timeouts of 8s, 4s, and 2s respectively.
One of the following:
const RealtimeAudioInputTurnDetectionSemanticVadEagernessLow RealtimeAudioInputTurnDetectionSemanticVadEagerness = "low"
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 0>)
const RealtimeAudioInputTurnDetectionSemanticVadEagernessMedium RealtimeAudioInputTurnDetectionSemanticVadEagerness = "medium"
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 1>)
const RealtimeAudioInputTurnDetectionSemanticVadEagernessHigh RealtimeAudioInputTurnDetectionSemanticVadEagerness = "high"
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 2>)
const RealtimeAudioInputTurnDetectionSemanticVadEagernessAuto RealtimeAudioInputTurnDetectionSemanticVadEagerness = "auto"
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 3>)
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness>)
InterruptResponse boolOptional
Whether or not to automatically interrupt any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) interrupt_response>)
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema)>)
type RealtimeClientEventUnion interface{…}
A realtime client event.
One of the following:
type ConversationItemCreateEvent struct{…}
Add a new Item to the Conversation’s context, including messages, function
calls, and function call responses. This event can be used both to populate a
“history” of the conversation and to add new items mid-stream, but has the
current limitation that it cannot populate assistant audio messages.
If successful, the server will respond with a `conversation.item.created`
event, otherwise an `error` event will be sent.
Item [ConversationItemUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item>)
Type ConversationItemCreate
The event type, must be `conversation.item.create`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) event_id>)
PreviousItemID stringOptional
The ID of the preceding item after which the new item will be inserted. If not set, the new item will be appended to the end of the conversation.
If set to `root`, the new item will be added to the beginning of the conversation.
If set to an existing ID, it allows an item to be inserted mid-conversation. If the ID cannot be found, an error will be returned and the item will not be added.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema)>)
type ConversationItemDeleteEvent struct{…}
Send this event when you want to remove any item from the conversation
history. The server will respond with a `conversation.item.deleted` event,
unless the item does not exist in the conversation history, in which case the
server will respond with an error.
ItemID string
The ID of the item to delete.
[](<#(resource) realtime > (model) conversation_item_delete_event > (schema) > (property) item_id>)
Type ConversationItemDelete
The event type, must be `conversation.item.delete`.
[](<#(resource) realtime > (model) conversation_item_delete_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) conversation_item_delete_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) conversation_item_delete_event > (schema)>)
type ConversationItemRetrieveEvent struct{…}
Send this event when you want to retrieve the server’s representation of a specific item in the conversation history. This is useful, for example, to inspect user audio after noise cancellation and VAD.
The server will respond with a `conversation.item.retrieved` event,
unless the item does not exist in the conversation history, in which case the
server will respond with an error.
ItemID string
The ID of the item to retrieve.
[](<#(resource) realtime > (model) conversation_item_retrieve_event > (schema) > (property) item_id>)
Type ConversationItemRetrieve
The event type, must be `conversation.item.retrieve`.
[](<#(resource) realtime > (model) conversation_item_retrieve_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) conversation_item_retrieve_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) conversation_item_retrieve_event > (schema)>)
type ConversationItemTruncateEvent struct{…}
Send this event to truncate a previous assistant message’s audio. The server
will produce audio faster than realtime, so this event is useful when the user
interrupts to truncate audio that has already been sent to the client but not
yet played. This will synchronize the server’s understanding of the audio with
the client’s playback.
Truncating audio will delete the server-side text transcript to ensure there
is not text in the context that hasn’t been heard by the user.
If successful, the server will respond with a `conversation.item.truncated`
event.
AudioEndMs int64
Inclusive duration up to which audio is truncated, in milliseconds. If
the audio\_end\_ms is greater than the actual audio duration, the server
will respond with an error.
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) audio_end_ms>)
ContentIndex int64
The index of the content part to truncate. Set this to `0`.
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) content_index>)
ItemID string
The ID of the assistant message item to truncate. Only assistant message
items can be truncated.
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) item_id>)
Type ConversationItemTruncate
The event type, must be `conversation.item.truncate`.
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema)>)
type InputAudioBufferAppendEvent struct{…}
Send this event to append audio bytes to the input audio buffer. The audio
buffer is temporary storage you can write to and later commit. A “commit” will create a new
user message item in the conversation history from the buffer content and clear the buffer.
Input audio transcription (if enabled) will be generated when the buffer is committed.
If VAD is enabled the audio buffer is used to detect speech and the server will decide
when to commit. When Server VAD is disabled, you must commit the audio buffer
manually. Input audio noise reduction operates on writes to the audio buffer.
The client may choose how much audio to place in each event up to a maximum
of 15 MiB, for example streaming smaller chunks from the client may allow the
VAD to be more responsive. Unlike most other client events, the server will
not send a confirmation response to this event.
Audio string
Base64-encoded audio bytes. This must be in the format specified by the
`input\_audio\_format` field in the session configuration.
[](<#(resource) realtime > (model) input_audio_buffer_append_event > (schema) > (property) audio>)
Type InputAudioBufferAppend
The event type, must be `input\_audio\_buffer.append`.
[](<#(resource) realtime > (model) input_audio_buffer_append_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) input_audio_buffer_append_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) input_audio_buffer_append_event > (schema)>)
type InputAudioBufferClearEvent struct{…}
Send this event to clear the audio bytes in the buffer. The server will
respond with an `input\_audio\_buffer.cleared` event.
Type InputAudioBufferClear
The event type, must be `input\_audio\_buffer.clear`.
[](<#(resource) realtime > (model) input_audio_buffer_clear_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) input_audio_buffer_clear_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) input_audio_buffer_clear_event > (schema)>)
type OutputAudioBufferClearEvent struct{…}
**WebRTC/SIP Only:** Emit to cut off the current audio response. This will trigger the server to
stop generating audio and emit a `output\_audio\_buffer.cleared` event. This
event should be preceded by a `response.cancel` client event to stop the
generation of the current response.
[Learn more](https://platform.openai.com/docs/guides/realtime-conversations#client-and-server-events-for-audio-in-webrtc).
Type OutputAudioBufferClear
The event type, must be `output\_audio\_buffer.clear`.
[](<#(resource) realtime > (model) output_audio_buffer_clear_event > (schema) > (property) type>)
EventID stringOptional
The unique ID of the client event used for error handling.
[](<#(resource) realtime > (model) output_audio_buffer_clear_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) output_audio_buffer_clear_event > (schema)>)
type InputAudioBufferCommitEvent struct{…}
Send this event to commit the user input audio buffer, which will create a new user message item in the conversation. This event will produce an error if the input audio buffer is empty. When in Server VAD mode, the client does not need to send this event, the server will commit the audio buffer automatically.
Committing the input audio buffer will trigger input audio transcription (if enabled in session configuration), but it will not create a response from the model. The server will respond with an `input\_audio\_buffer.committed` event.
Type InputAudioBufferCommit
The event type, must be `input\_audio\_buffer.commit`.
[](<#(resource) realtime > (model) input_audio_buffer_commit_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) input_audio_buffer_commit_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) input_audio_buffer_commit_event > (schema)>)
type ResponseCancelEvent struct{…}
Send this event to cancel an in-progress response. The server will respond
with a `response.done` event with a status of `response.status=cancelled`. If
there is no response to cancel, the server will respond with an error. It’s safe
to call `response.cancel` even if no response is in progress, an error will be
returned the session will remain unaffected.
Type ResponseCancel
The event type, must be `response.cancel`.
[](<#(resource) realtime > (model) response_cancel_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) response_cancel_event > (schema) > (property) event_id>)
ResponseID stringOptional
A specific response ID to cancel - if not provided, will cancel an
in-progress response in the default conversation.
[](<#(resource) realtime > (model) response_cancel_event > (schema) > (property) response_id>)
[](<#(resource) realtime > (model) response_cancel_event > (schema)>)
type ResponseCreateEvent struct{…}
This event instructs the server to create a Response, which means triggering
model inference. When in Server VAD mode, the server will create Responses
automatically.
A Response will include at least one Item, and may have two, in which case
the second will be a function call. These Items will be appended to the
conversation history by default.
The server will respond with a `response.created` event, events for Items
and content created, and finally a `response.done` event to indicate the
Response is complete.
The `response.create` event includes inference configuration like
`instructions` and `tools`. If these are set, they will override the Session’s
configuration for this Response only.
Responses can be created out-of-band of the default Conversation, meaning that they can
have arbitrary input, and it’s possible to disable writing the output to the Conversation.
Only one Response can write to the default Conversation at a time, but otherwise multiple
Responses can be created in parallel. The `metadata` field is a good way to disambiguate
multiple simultaneous Responses.
Clients can set `conversation` to `none` to create a Response that does not write to the default
Conversation. Arbitrary input can be provided with the `input` field, which is an array accepting
raw Items and references to existing Items.
Type ResponseCreate
The event type, must be `response.create`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) event_id>)
Response [RealtimeResponseCreateParamsResp](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_response_create_params > (schema)>)Optional
Create a new Realtime response with these parameters
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response>)
[](<#(resource) realtime > (model) response_create_event > (schema)>)
type SessionUpdateEvent struct{…}
Send this event to update the session’s configuration.
The client may send this event at any time to update any field
except for `voice` and `model`. `voice` can be updated only if there have been no other audio outputs yet.
When the server receives a `session.update`, it will respond
with a `session.updated` event showing the full, effective configuration.
Only the fields that are present in the `session.update` are updated. To clear a field like
`instructions`, pass an empty string. To clear a field like `tools`, pass an empty array.
To clear a field like `turn\_detection`, pass `null`.
Session SessionUpdateEventSessionUnion
Update the Realtime session. Choose either a realtime
session or a transcription session.
One of the following:
type RealtimeSessionCreateRequest struct{…}
Realtime session object configuration.
Type Realtime
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) type>)
Audio [RealtimeAudioConfig](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_config > (schema)>)Optional
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio>)
Include []stringOptional
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) include>)
Instructions stringOptional
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) instructions>)
MaxOutputTokens RealtimeSessionCreateRequestMaxOutputTokensUnionOptional
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
int64
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 0>)
Inf
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens>)
Model RealtimeSessionCreateRequestModelOptional
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 0>)
RealtimeSessionCreateRequestModel
One of the following:
const RealtimeSessionCreateRequestModelGPTRealtime RealtimeSessionCreateRequestModel = "gpt-realtime"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 0>)
const RealtimeSessionCreateRequestModelGPTRealtime1\_5 RealtimeSessionCreateRequestModel = "gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 1>)
const RealtimeSessionCreateRequestModelGPTRealtime2025\_08\_28 RealtimeSessionCreateRequestModel = "gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 2>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 3>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2024\_10\_01 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 4>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2024\_12\_17 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 5>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2025\_06\_03 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 6>)
const RealtimeSessionCreateRequestModelGPT4oMiniRealtimePreview RealtimeSessionCreateRequestModel = "gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 7>)
const RealtimeSessionCreateRequestModelGPT4oMiniRealtimePreview2024\_12\_17 RealtimeSessionCreateRequestModel = "gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 8>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini RealtimeSessionCreateRequestModel = "gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 9>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini2025\_10\_06 RealtimeSessionCreateRequestModel = "gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 10>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini2025\_12\_15 RealtimeSessionCreateRequestModel = "gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 11>)
const RealtimeSessionCreateRequestModelGPTAudio1\_5 RealtimeSessionCreateRequestModel = "gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 12>)
const RealtimeSessionCreateRequestModelGPTAudioMini RealtimeSessionCreateRequestModel = "gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 13>)
const RealtimeSessionCreateRequestModelGPTAudioMini2025\_10\_06 RealtimeSessionCreateRequestModel = "gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 14>)
const RealtimeSessionCreateRequestModelGPTAudioMini2025\_12\_15 RealtimeSessionCreateRequestModel = "gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model>)
OutputModalities []stringOptional
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
const RealtimeSessionCreateRequestOutputModalityText RealtimeSessionCreateRequestOutputModality = "text"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 0>)
const RealtimeSessionCreateRequestOutputModalityAudio RealtimeSessionCreateRequestOutputModality = "audio"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities>)
Prompt [ResponsePrompt](</api/reference/go/resources/responses#(resource) responses > (model) response_prompt > (schema)>)Optional
Reference to a prompt template and its variables.
[Learn more](https://platform.openai.com/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt>)
ToolChoice [RealtimeToolChoiceConfigUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)Optional
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice>)
Tools [RealtimeToolsConfig](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tools_config > (schema)>)Optional
Tools available to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools>)
Tracing [RealtimeTracingConfigUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tracing_config > (schema)>)Optional
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing>)
Truncation [RealtimeTruncationUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)Optional
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema)>)
type RealtimeTranscriptionSessionCreateRequest struct{…}
Realtime transcription session object configuration.
Type Transcription
The type of session to create. Always `transcription` for transcription sessions.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) type>)
Audio [RealtimeTranscriptionSessionAudio](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>)Optional
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio>)
Include []stringOptional
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) include>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>)
[](<#(resource) realtime > (model) session_update_event > (schema) > (property) session>)
Type SessionUpdate
The event type, must be `session.update`.
[](<#(resource) realtime > (model) session_update_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event. This is an arbitrary string that a client may assign. It will be passed back if there is an error with the event, but the corresponding `session.updated` event will not include it.
maxLength512
[](<#(resource) realtime > (model) session_update_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) session_update_event > (schema)>)
[](<#(resource) realtime > (model) realtime_client_event > (schema)>)
type RealtimeConversationItemAssistantMessage struct{…}
An assistant message item in a Realtime conversation.
Content []RealtimeConversationItemAssistantMessageContent
The content of the message.
Audio stringOptional
Base64-encoded audio bytes, these will be parsed as the format specified in the session output audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) audio>)
Text stringOptional
The text content.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) text>)
Transcript stringOptional
The transcript of the audio content, this will always be present if the output type is `audio`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) transcript>)
Type stringOptional
The content type, `output\_text` or `output\_audio` depending on the session `output\_modalities` configuration.
One of the following:
const RealtimeConversationItemAssistantMessageContentTypeOutputText RealtimeConversationItemAssistantMessageContentType = "output\_text"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
const RealtimeConversationItemAssistantMessageContentTypeOutputAudio RealtimeConversationItemAssistantMessageContentType = "output\_audio"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content>)
Role Assistant
The role of the message sender. Always `assistant`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) role>)
Type Message
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) id>)
Object RealtimeConversationItemAssistantMessageObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) object>)
Status RealtimeConversationItemAssistantMessageStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemAssistantMessageStatusCompleted RealtimeConversationItemAssistantMessageStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemAssistantMessageStatusIncomplete RealtimeConversationItemAssistantMessageStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemAssistantMessageStatusInProgress RealtimeConversationItemAssistantMessageStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema)>)
type RealtimeConversationItemFunctionCall struct{…}
A function call item in a Realtime conversation.
Arguments string
The arguments of the function call. This is a JSON-encoded string representing the arguments passed to the function, for example `{"arg1": "value1", "arg2": 42}`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) arguments>)
Name string
The name of the function being called.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) name>)
Type FunctionCall
The type of the item. Always `function\_call`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) id>)
CallID stringOptional
The ID of the function call.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) call_id>)
Object RealtimeConversationItemFunctionCallObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) object>)
Status RealtimeConversationItemFunctionCallStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemFunctionCallStatusCompleted RealtimeConversationItemFunctionCallStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemFunctionCallStatusIncomplete RealtimeConversationItemFunctionCallStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemFunctionCallStatusInProgress RealtimeConversationItemFunctionCallStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema)>)
type RealtimeConversationItemFunctionCallOutput struct{…}
A function call output item in a Realtime conversation.
CallID string
The ID of the function call this output is for.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) call_id>)
Output string
The output of the function call, this is free text and can contain any information or simply be empty.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) output>)
Type FunctionCallOutput
The type of the item. Always `function\_call\_output`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) id>)
Object RealtimeConversationItemFunctionCallOutputObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) object>)
Status RealtimeConversationItemFunctionCallOutputStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemFunctionCallOutputStatusCompleted RealtimeConversationItemFunctionCallOutputStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemFunctionCallOutputStatusIncomplete RealtimeConversationItemFunctionCallOutputStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemFunctionCallOutputStatusInProgress RealtimeConversationItemFunctionCallOutputStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema)>)
type RealtimeConversationItemSystemMessage struct{…}
A system message in a Realtime conversation can be used to provide additional context or instructions to the model. This is similar but distinct from the instruction prompt provided at the start of a conversation, as system messages can be added at any point in the conversation. For major changes to the conversation’s behavior, use instructions, but for smaller updates (e.g. “the user is now asking about a different topic”), use system messages.
Content []RealtimeConversationItemSystemMessageContent
The content of the message.
Text stringOptional
The text content.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) text>)
Type stringOptional
The content type. Always `input\_text` for system messages.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content>)
Role System
The role of the message sender. Always `system`.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) role>)
Type Message
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) id>)
Object RealtimeConversationItemSystemMessageObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) object>)
Status RealtimeConversationItemSystemMessageStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemSystemMessageStatusCompleted RealtimeConversationItemSystemMessageStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemSystemMessageStatusIncomplete RealtimeConversationItemSystemMessageStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemSystemMessageStatusInProgress RealtimeConversationItemSystemMessageStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema)>)
type RealtimeConversationItemUserMessage struct{…}
A user message item in a Realtime conversation.
Content []RealtimeConversationItemUserMessageContent
The content of the message.
Audio stringOptional
Base64-encoded audio bytes (for `input\_audio`), these will be parsed as the format specified in the session input audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) audio>)
Detail stringOptional
The detail level of the image (for `input\_image`). `auto` will default to `high`.
One of the following:
const RealtimeConversationItemUserMessageContentDetailAuto RealtimeConversationItemUserMessageContentDetail = "auto"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 0>)
const RealtimeConversationItemUserMessageContentDetailLow RealtimeConversationItemUserMessageContentDetail = "low"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 1>)
const RealtimeConversationItemUserMessageContentDetailHigh RealtimeConversationItemUserMessageContentDetail = "high"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail>)
ImageURL stringOptional
Base64-encoded image bytes (for `input\_image`) as a data URI. For example `data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...`. Supported formats are PNG and JPEG.
formaturi
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) image_url>)
Text stringOptional
The text content (for `input\_text`).
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) text>)
Transcript stringOptional
Transcript of the audio (for `input\_audio`). This is not sent to the model, but will be attached to the message item for reference.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) transcript>)
Type stringOptional
The content type (`input\_text`, `input\_audio`, or `input\_image`).
One of the following:
const RealtimeConversationItemUserMessageContentTypeInputText RealtimeConversationItemUserMessageContentType = "input\_text"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
const RealtimeConversationItemUserMessageContentTypeInputAudio RealtimeConversationItemUserMessageContentType = "input\_audio"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
const RealtimeConversationItemUserMessageContentTypeInputImage RealtimeConversationItemUserMessageContentType = "input\_image"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content>)
Role User
The role of the message sender. Always `user`.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) role>)
Type Message
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) id>)
Object RealtimeConversationItemUserMessageObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) object>)
Status RealtimeConversationItemUserMessageStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemUserMessageStatusCompleted RealtimeConversationItemUserMessageStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemUserMessageStatusIncomplete RealtimeConversationItemUserMessageStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemUserMessageStatusInProgress RealtimeConversationItemUserMessageStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema)>)
type RealtimeError struct{…}
Details of the error.
Message string
A human-readable error message.
[](<#(resource) realtime > (model) realtime_error > (schema) > (property) message>)
Type string
The type of error (e.g., “invalid\_request\_error”, “server\_error”).
[](<#(resource) realtime > (model) realtime_error > (schema) > (property) type>)
Code stringOptional
Error code, if any.
[](<#(resource) realtime > (model) realtime_error > (schema) > (property) code>)
EventID stringOptional
The event\_id of the client event that caused the error, if applicable.
[](<#(resource) realtime > (model) realtime_error > (schema) > (property) event_id>)
Param stringOptional
Parameter related to the error, if any.
[](<#(resource) realtime > (model) realtime_error > (schema) > (property) param>)
[](<#(resource) realtime > (model) realtime_error > (schema)>)
type RealtimeErrorEvent struct{…}
Returned when an error occurs, which could be a client problem or a server
problem. Most errors are recoverable and the session will stay open, we
recommend to implementors to monitor and log error messages by default.
Error [RealtimeError](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_error > (schema)>)
Details of the error.
[](<#(resource) realtime > (model) realtime_error_event > (schema) > (property) error>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) realtime_error_event > (schema) > (property) event_id>)
Type Error
The event type, must be `error`.
[](<#(resource) realtime > (model) realtime_error_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_error_event > (schema)>)
type RealtimeFunctionTool struct{…}
Description stringOptional
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
Name stringOptional
The name of the function.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
Parameters anyOptional
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
Type RealtimeFunctionToolTypeOptional
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_function_tool > (schema)>)
type RealtimeMcpApprovalRequest struct{…}
A Realtime item requesting human approval of a tool invocation.
ID string
The unique ID of the approval request.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) id>)
Arguments string
A JSON string of arguments for the tool.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) arguments>)
Name string
The name of the tool to run.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) name>)
ServerLabel string
The label of the MCP server making the request.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) server_label>)
Type McpApprovalRequest
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema)>)
type RealtimeMcpApprovalResponse struct{…}
A Realtime item responding to an MCP approval request.
ID string
The unique ID of the approval response.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) id>)
ApprovalRequestID string
The ID of the approval request being answered.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approval_request_id>)
Approve bool
Whether the request was approved.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approve>)
Type McpApprovalResponse
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) type>)
Reason stringOptional
Optional reason for the decision.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) reason>)
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema)>)
type RealtimeMcpListTools struct{…}
A Realtime item listing tools available on an MCP server.
ServerLabel string
The label of the MCP server.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) server_label>)
Tools []RealtimeMcpListToolsTool
The tools available on the server.
InputSchema any
The JSON schema describing the tool’s input.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) input_schema>)
Name string
The name of the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) name>)
Annotations anyOptional
Additional annotations about the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) annotations>)
Description stringOptional
The description of the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) description>)
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools>)
Type McpListTools
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) type>)
ID stringOptional
The unique ID of the list.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) id>)
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema)>)
type RealtimeMcpProtocolError struct{…}
Code int64
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) code>)
Message string
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) message>)
Type ProtocolError
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema)>)
type RealtimeMcpToolCall struct{…}
A Realtime item representing an invocation of a tool on an MCP server.
ID string
The unique ID of the tool call.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) id>)
Arguments string
A JSON string of the arguments passed to the tool.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) arguments>)
Name string
The name of the tool that was run.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) name>)
ServerLabel string
The label of the MCP server running the tool.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) server_label>)
Type McpCall
The type of the item. Always `mcp\_call`.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) type>)
ApprovalRequestID stringOptional
The ID of an associated approval request, if any.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) approval_request_id>)
Error RealtimeMcpToolCallErrorUnionOptional
The error from the tool call, if any.
One of the following:
type RealtimeMcpProtocolError struct{…}
Code int64
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) code>)
Message string
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) message>)
Type ProtocolError
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema)>)
type RealtimeMcpToolExecutionError struct{…}
Message string
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) message>)
Type ToolExecutionError
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>)
type RealtimeMcphttpError struct{…}
Code int64
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) code>)
Message string
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) message>)
Type HTTPError
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema)>)
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) error>)
Output stringOptional
The output from the tool call.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) output>)
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema)>)
type RealtimeMcpToolExecutionError struct{…}
Message string
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) message>)
Type ToolExecutionError
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>)
type RealtimeMcphttpError struct{…}
Code int64
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) code>)
Message string
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) message>)
Type HTTPError
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema)>)
type RealtimeResponse struct{…}
The response resource.
ID stringOptional
The unique ID of the response, will look like `resp\_1234`.
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) id>)
Audio RealtimeResponseAudioOptional
Configuration for audio output.
Output RealtimeResponseAudioOutputOptional
Format [RealtimeAudioFormatsUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)Optional
The format of the output audio.
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) format>)
Voice stringOptional
The voice the model uses to respond. Voice cannot be changed during the
session once the model has responded with audio at least once. Current
voice options are `alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`,
`shimmer`, `verse`, `marin`, and `cedar`. We recommend `marin` and `cedar` for
best quality.
One of the following:
string
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 0>)
string
One of the following:
const RealtimeResponseAudioOutputVoiceAlloy RealtimeResponseAudioOutputVoice = "alloy"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 0>)
const RealtimeResponseAudioOutputVoiceAsh RealtimeResponseAudioOutputVoice = "ash"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 1>)
const RealtimeResponseAudioOutputVoiceBallad RealtimeResponseAudioOutputVoice = "ballad"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 2>)
const RealtimeResponseAudioOutputVoiceCoral RealtimeResponseAudioOutputVoice = "coral"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 3>)
const RealtimeResponseAudioOutputVoiceEcho RealtimeResponseAudioOutputVoice = "echo"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 4>)
const RealtimeResponseAudioOutputVoiceSage RealtimeResponseAudioOutputVoice = "sage"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 5>)
const RealtimeResponseAudioOutputVoiceShimmer RealtimeResponseAudioOutputVoice = "shimmer"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 6>)
const RealtimeResponseAudioOutputVoiceVerse RealtimeResponseAudioOutputVoice = "verse"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 7>)
const RealtimeResponseAudioOutputVoiceMarin RealtimeResponseAudioOutputVoice = "marin"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 8>)
const RealtimeResponseAudioOutputVoiceCedar RealtimeResponseAudioOutputVoice = "cedar"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1>)
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice>)
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output>)
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio>)
ConversationID stringOptional
Which conversation the response is added to, determined by the `conversation`
field in the `response.create` event. If `auto`, the response will be added to
the default conversation and the value of `conversation\_id` will be an id like
`conv\_1234`. If `none`, the response will not be added to any conversation and
the value of `conversation\_id` will be `null`. If responses are being triggered
automatically by VAD the response will be added to the default conversation
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) conversation_id>)
MaxOutputTokens RealtimeResponseMaxOutputTokensUnionOptional
Maximum number of output tokens for a single assistant response,
inclusive of tool calls, that was used in this response.
One of the following:
int64
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) max_output_tokens > (variant) 0>)
Inf
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) max_output_tokens>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)Optional
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) metadata>)
Object RealtimeResponseObjectOptional
The object type, must be `realtime.response`.
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) object>)
Output [][ConversationItemUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)Optional
The list of output items generated by the response.
One of the following:
type RealtimeConversationItemSystemMessage struct{…}
A system message in a Realtime conversation can be used to provide additional context or instructions to the model. This is similar but distinct from the instruction prompt provided at the start of a conversation, as system messages can be added at any point in the conversation. For major changes to the conversation’s behavior, use instructions, but for smaller updates (e.g. “the user is now asking about a different topic”), use system messages.
Content []RealtimeConversationItemSystemMessageContent
The content of the message.
Text stringOptional
The text content.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) text>)
Type stringOptional
The content type. Always `input\_text` for system messages.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content>)
Role System
The role of the message sender. Always `system`.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) role>)
Type Message
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) id>)
Object RealtimeConversationItemSystemMessageObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) object>)
Status RealtimeConversationItemSystemMessageStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemSystemMessageStatusCompleted RealtimeConversationItemSystemMessageStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemSystemMessageStatusIncomplete RealtimeConversationItemSystemMessageStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemSystemMessageStatusInProgress RealtimeConversationItemSystemMessageStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema)>)
type RealtimeConversationItemUserMessage struct{…}
A user message item in a Realtime conversation.
Content []RealtimeConversationItemUserMessageContent
The content of the message.
Audio stringOptional
Base64-encoded audio bytes (for `input\_audio`), these will be parsed as the format specified in the session input audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) audio>)
Detail stringOptional
The detail level of the image (for `input\_image`). `auto` will default to `high`.
One of the following:
const RealtimeConversationItemUserMessageContentDetailAuto RealtimeConversationItemUserMessageContentDetail = "auto"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 0>)
const RealtimeConversationItemUserMessageContentDetailLow RealtimeConversationItemUserMessageContentDetail = "low"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 1>)
const RealtimeConversationItemUserMessageContentDetailHigh RealtimeConversationItemUserMessageContentDetail = "high"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail>)
ImageURL stringOptional
Base64-encoded image bytes (for `input\_image`) as a data URI. For example `data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...`. Supported formats are PNG and JPEG.
formaturi
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) image_url>)
Text stringOptional
The text content (for `input\_text`).
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) text>)
Transcript stringOptional
Transcript of the audio (for `input\_audio`). This is not sent to the model, but will be attached to the message item for reference.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) transcript>)
Type stringOptional
The content type (`input\_text`, `input\_audio`, or `input\_image`).
One of the following:
const RealtimeConversationItemUserMessageContentTypeInputText RealtimeConversationItemUserMessageContentType = "input\_text"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
const RealtimeConversationItemUserMessageContentTypeInputAudio RealtimeConversationItemUserMessageContentType = "input\_audio"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
const RealtimeConversationItemUserMessageContentTypeInputImage RealtimeConversationItemUserMessageContentType = "input\_image"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content>)
Role User
The role of the message sender. Always `user`.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) role>)
Type Message
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) id>)
Object RealtimeConversationItemUserMessageObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) object>)
Status RealtimeConversationItemUserMessageStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemUserMessageStatusCompleted RealtimeConversationItemUserMessageStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemUserMessageStatusIncomplete RealtimeConversationItemUserMessageStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemUserMessageStatusInProgress RealtimeConversationItemUserMessageStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema)>)
type RealtimeConversationItemAssistantMessage struct{…}
An assistant message item in a Realtime conversation.
Content []RealtimeConversationItemAssistantMessageContent
The content of the message.
Audio stringOptional
Base64-encoded audio bytes, these will be parsed as the format specified in the session output audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) audio>)
Text stringOptional
The text content.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) text>)
Transcript stringOptional
The transcript of the audio content, this will always be present if the output type is `audio`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) transcript>)
Type stringOptional
The content type, `output\_text` or `output\_audio` depending on the session `output\_modalities` configuration.
One of the following:
const RealtimeConversationItemAssistantMessageContentTypeOutputText RealtimeConversationItemAssistantMessageContentType = "output\_text"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
const RealtimeConversationItemAssistantMessageContentTypeOutputAudio RealtimeConversationItemAssistantMessageContentType = "output\_audio"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content>)
Role Assistant
The role of the message sender. Always `assistant`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) role>)
Type Message
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) id>)
Object RealtimeConversationItemAssistantMessageObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) object>)
Status RealtimeConversationItemAssistantMessageStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemAssistantMessageStatusCompleted RealtimeConversationItemAssistantMessageStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemAssistantMessageStatusIncomplete RealtimeConversationItemAssistantMessageStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemAssistantMessageStatusInProgress RealtimeConversationItemAssistantMessageStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema)>)
type RealtimeConversationItemFunctionCall struct{…}
A function call item in a Realtime conversation.
Arguments string
The arguments of the function call. This is a JSON-encoded string representing the arguments passed to the function, for example `{"arg1": "value1", "arg2": 42}`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) arguments>)
Name string
The name of the function being called.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) name>)
Type FunctionCall
The type of the item. Always `function\_call`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) id>)
CallID stringOptional
The ID of the function call.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) call_id>)
Object RealtimeConversationItemFunctionCallObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) object>)
Status RealtimeConversationItemFunctionCallStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemFunctionCallStatusCompleted RealtimeConversationItemFunctionCallStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemFunctionCallStatusIncomplete RealtimeConversationItemFunctionCallStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemFunctionCallStatusInProgress RealtimeConversationItemFunctionCallStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema)>)
type RealtimeConversationItemFunctionCallOutput struct{…}
A function call output item in a Realtime conversation.
CallID string
The ID of the function call this output is for.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) call_id>)
Output string
The output of the function call, this is free text and can contain any information or simply be empty.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) output>)
Type FunctionCallOutput
The type of the item. Always `function\_call\_output`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) id>)
Object RealtimeConversationItemFunctionCallOutputObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) object>)
Status RealtimeConversationItemFunctionCallOutputStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemFunctionCallOutputStatusCompleted RealtimeConversationItemFunctionCallOutputStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemFunctionCallOutputStatusIncomplete RealtimeConversationItemFunctionCallOutputStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemFunctionCallOutputStatusInProgress RealtimeConversationItemFunctionCallOutputStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema)>)
type RealtimeMcpApprovalResponse struct{…}
A Realtime item responding to an MCP approval request.
ID string
The unique ID of the approval response.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) id>)
ApprovalRequestID string
The ID of the approval request being answered.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approval_request_id>)
Approve bool
Whether the request was approved.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approve>)
Type McpApprovalResponse
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) type>)
Reason stringOptional
Optional reason for the decision.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) reason>)
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema)>)
type RealtimeMcpListTools struct{…}
A Realtime item listing tools available on an MCP server.
ServerLabel string
The label of the MCP server.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) server_label>)
Tools []RealtimeMcpListToolsTool
The tools available on the server.
InputSchema any
The JSON schema describing the tool’s input.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) input_schema>)
Name string
The name of the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) name>)
Annotations anyOptional
Additional annotations about the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) annotations>)
Description stringOptional
The description of the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) description>)
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools>)
Type McpListTools
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) type>)
ID stringOptional
The unique ID of the list.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) id>)
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema)>)
type RealtimeMcpToolCall struct{…}
A Realtime item representing an invocation of a tool on an MCP server.
ID string
The unique ID of the tool call.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) id>)
Arguments string
A JSON string of the arguments passed to the tool.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) arguments>)
Name string
The name of the tool that was run.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) name>)
ServerLabel string
The label of the MCP server running the tool.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) server_label>)
Type McpCall
The type of the item. Always `mcp\_call`.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) type>)
ApprovalRequestID stringOptional
The ID of an associated approval request, if any.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) approval_request_id>)
Error RealtimeMcpToolCallErrorUnionOptional
The error from the tool call, if any.
One of the following:
type RealtimeMcpProtocolError struct{…}
Code int64
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) code>)
Message string
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) message>)
Type ProtocolError
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema)>)
type RealtimeMcpToolExecutionError struct{…}
Message string
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) message>)
Type ToolExecutionError
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>)
type RealtimeMcphttpError struct{…}
Code int64
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) code>)
Message string
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) message>)
Type HTTPError
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema)>)
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) error>)
Output stringOptional
The output from the tool call.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) output>)
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema)>)
type RealtimeMcpApprovalRequest struct{…}
A Realtime item requesting human approval of a tool invocation.
ID string
The unique ID of the approval request.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) id>)
Arguments string
A JSON string of arguments for the tool.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) arguments>)
Name string
The name of the tool to run.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) name>)
ServerLabel string
The label of the MCP server making the request.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) server_label>)
Type McpApprovalRequest
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema)>)
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) output>)
OutputModalities []stringOptional
The set of modalities the model used to respond, currently the only possible values are
`[\\"audio\\"]`, `[\\"text\\"]`. Audio output always include a text transcript. Setting the
output to mode `text` will disable audio output from the model.
One of the following:
const RealtimeResponseOutputModalityText RealtimeResponseOutputModality = "text"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) output_modalities > (items) > (member) 0>)
const RealtimeResponseOutputModalityAudio RealtimeResponseOutputModality = "audio"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) output_modalities>)
Status RealtimeResponseStatusOptional
The final status of the response (`completed`, `cancelled`, `failed`, or
`incomplete`, `in\_progress`).
One of the following:
const RealtimeResponseStatusCompleted RealtimeResponseStatus = "completed"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) status > (member) 0>)
const RealtimeResponseStatusCancelled RealtimeResponseStatus = "cancelled"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) status > (member) 1>)
const RealtimeResponseStatusFailed RealtimeResponseStatus = "failed"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) status > (member) 2>)
const RealtimeResponseStatusIncomplete RealtimeResponseStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) status > (member) 3>)
const RealtimeResponseStatusInProgress RealtimeResponseStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) status > (member) 4>)
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) status>)
StatusDetails [RealtimeResponseStatus](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_response_status > (schema)>)Optional
Additional details about the status.
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) status_details>)
Usage [RealtimeResponseUsage](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_response_usage > (schema)>)Optional
Usage statistics for the Response, this will correspond to billing. A
Realtime API session will maintain a conversation context and append new
Items to the Conversation, thus output from previous turns (text and
audio tokens) will become the input for later turns.
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) usage>)
[](<#(resource) realtime > (model) realtime_response > (schema)>)
type RealtimeResponseCreateAudioOutput struct{…}
Configuration for audio input and output.
Output RealtimeResponseCreateAudioOutputOutputOptional
Format [RealtimeAudioFormatsUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)Optional
The format of the output audio.
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) format>)
Voice RealtimeResponseCreateAudioOutputOutputVoiceUnionOptional
The voice the model uses to respond. Supported built-in voices are
`alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`, `shimmer`, `verse`,
`marin`, and `cedar`. You may also provide a custom voice object with
an `id`, for example `{ "id": "voice\_1234" }`. Voice cannot be changed
during the session once the model has responded with audio at least once.
We recommend `marin` and `cedar` for best quality.
One of the following:
string
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 0>)
string
One of the following:
const RealtimeResponseCreateAudioOutputOutputVoiceStringAlloy RealtimeResponseCreateAudioOutputOutputVoiceString = "alloy"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 0>)
const RealtimeResponseCreateAudioOutputOutputVoiceStringAsh RealtimeResponseCreateAudioOutputOutputVoiceString = "ash"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 1>)
const RealtimeResponseCreateAudioOutputOutputVoiceStringBallad RealtimeResponseCreateAudioOutputOutputVoiceString = "ballad"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 2>)
const RealtimeResponseCreateAudioOutputOutputVoiceStringCoral RealtimeResponseCreateAudioOutputOutputVoiceString = "coral"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 3>)
const RealtimeResponseCreateAudioOutputOutputVoiceStringEcho RealtimeResponseCreateAudioOutputOutputVoiceString = "echo"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 4>)
const RealtimeResponseCreateAudioOutputOutputVoiceStringSage RealtimeResponseCreateAudioOutputOutputVoiceString = "sage"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 5>)
const RealtimeResponseCreateAudioOutputOutputVoiceStringShimmer RealtimeResponseCreateAudioOutputOutputVoiceString = "shimmer"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 6>)
const RealtimeResponseCreateAudioOutputOutputVoiceStringVerse RealtimeResponseCreateAudioOutputOutputVoiceString = "verse"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 7>)
const RealtimeResponseCreateAudioOutputOutputVoiceStringMarin RealtimeResponseCreateAudioOutputOutputVoiceString = "marin"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 8>)
const RealtimeResponseCreateAudioOutputOutputVoiceStringCedar RealtimeResponseCreateAudioOutputOutputVoiceString = "cedar"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1>)
RealtimeResponseCreateAudioOutputOutputVoiceID
ID string
The custom voice ID, e.g. `voice\_1234`.
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 2 > (property) id>)
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 2>)
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice>)
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output>)
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema)>)
type RealtimeResponseCreateMcpTool struct{…}
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](https://platform.openai.com/docs/guides/tools-remote-mcp).
ServerLabel string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) server_label>)
Type Mcp
The type of the MCP tool. Always `mcp`.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) type>)
AllowedTools RealtimeResponseCreateMcpToolAllowedToolsUnionOptional
List of allowed tool names or a filter object.
One of the following:
[]string
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) allowed_tools > (variant) 0>)
RealtimeResponseCreateMcpToolAllowedToolsMcpToolFilter
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) allowed_tools > (variant) 1 > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) allowed_tools > (variant) 1>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) allowed_tools>)
Authorization stringOptional
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) authorization>)
ConnectorID RealtimeResponseCreateMcpToolConnectorIDOptional
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](https://platform.openai.com/docs/guides/tools-remote-mcp#connectors).
Currently supported `connector\_id` values are:
* Dropbox: `connector\_dropbox`
* Gmail: `connector\_gmail`
* Google Calendar: `connector\_googlecalendar`
* Google Drive: `connector\_googledrive`
* Microsoft Teams: `connector\_microsoftteams`
* Outlook Calendar: `connector\_outlookcalendar`
* Outlook Email: `connector\_outlookemail`
* SharePoint: `connector\_sharepoint`
One of the following:
const RealtimeResponseCreateMcpToolConnectorIDConnectorDropbox RealtimeResponseCreateMcpToolConnectorID = "connector\_dropbox"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id > (member) 0>)
const RealtimeResponseCreateMcpToolConnectorIDConnectorGmail RealtimeResponseCreateMcpToolConnectorID = "connector\_gmail"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id > (member) 1>)
const RealtimeResponseCreateMcpToolConnectorIDConnectorGooglecalendar RealtimeResponseCreateMcpToolConnectorID = "connector\_googlecalendar"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id > (member) 2>)
const RealtimeResponseCreateMcpToolConnectorIDConnectorGoogledrive RealtimeResponseCreateMcpToolConnectorID = "connector\_googledrive"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id > (member) 3>)
const RealtimeResponseCreateMcpToolConnectorIDConnectorMicrosoftteams RealtimeResponseCreateMcpToolConnectorID = "connector\_microsoftteams"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id > (member) 4>)
const RealtimeResponseCreateMcpToolConnectorIDConnectorOutlookcalendar RealtimeResponseCreateMcpToolConnectorID = "connector\_outlookcalendar"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id > (member) 5>)
const RealtimeResponseCreateMcpToolConnectorIDConnectorOutlookemail RealtimeResponseCreateMcpToolConnectorID = "connector\_outlookemail"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id > (member) 6>)
const RealtimeResponseCreateMcpToolConnectorIDConnectorSharepoint RealtimeResponseCreateMcpToolConnectorID = "connector\_sharepoint"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id > (member) 7>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id>)
DeferLoading boolOptional
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) defer_loading>)
Headers map[string, string]Optional
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) headers>)
RequireApproval RealtimeResponseCreateMcpToolRequireApprovalUnionOptional
Specify which of the MCP server’s tools require approval.
One of the following:
RealtimeResponseCreateMcpToolRequireApprovalMcpToolApprovalFilter
Always RealtimeResponseCreateMcpToolRequireApprovalMcpToolApprovalFilterAlwaysOptional
A filter object to specify which tools are allowed.
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 0 > (property) always>)
Never RealtimeResponseCreateMcpToolRequireApprovalMcpToolApprovalFilterNeverOptional
A filter object to specify which tools are allowed.
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 0>)
string
One of the following:
const RealtimeResponseCreateMcpToolRequireApprovalMcpToolApprovalSettingAlways RealtimeResponseCreateMcpToolRequireApprovalMcpToolApprovalSetting = "always"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 1 > (member) 0>)
const RealtimeResponseCreateMcpToolRequireApprovalMcpToolApprovalSettingNever RealtimeResponseCreateMcpToolRequireApprovalMcpToolApprovalSetting = "never"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 1>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval>)
ServerDescription stringOptional
Optional description of the MCP server, used to provide more context.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) server_description>)
ServerURL stringOptional
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) server_url>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema)>)
type RealtimeResponseCreateParamsResp struct{…}
Create a new Realtime response with these parameters
Audio [RealtimeResponseCreateAudioOutput](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_response_create_audio_output > (schema)>)Optional
Configuration for audio input and output.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio>)
Conversation RealtimeResponseCreateParamsConversationOptional
Controls which conversation the response is added to. Currently supports
`auto` and `none`, with `auto` as the default value. The `auto` value
means that the contents of the response will be added to the default
conversation. Set this to `none` to create an out-of-band response which
will not add items to default conversation.
One of the following:
string
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) conversation > (variant) 0>)
RealtimeResponseCreateParamsConversation
One of the following:
const RealtimeResponseCreateParamsConversationAuto RealtimeResponseCreateParamsConversation = "auto"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) conversation > (variant) 1 > (member) 0>)
const RealtimeResponseCreateParamsConversationNone RealtimeResponseCreateParamsConversation = "none"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) conversation > (variant) 1 > (member) 1>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) conversation > (variant) 1>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) conversation>)
Input [][ConversationItemUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)Optional
Input items to include in the prompt for the model. Using this field
creates a new context for this Response instead of using the default
conversation. An empty array `[]` will clear the context for this Response.
Note that this can include references to items that previously appeared in the session
using their id.
One of the following:
type RealtimeConversationItemSystemMessage struct{…}
A system message in a Realtime conversation can be used to provide additional context or instructions to the model. This is similar but distinct from the instruction prompt provided at the start of a conversation, as system messages can be added at any point in the conversation. For major changes to the conversation’s behavior, use instructions, but for smaller updates (e.g. “the user is now asking about a different topic”), use system messages.
Content []RealtimeConversationItemSystemMessageContent
The content of the message.
Text stringOptional
The text content.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) text>)
Type stringOptional
The content type. Always `input\_text` for system messages.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content>)
Role System
The role of the message sender. Always `system`.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) role>)
Type Message
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) id>)
Object RealtimeConversationItemSystemMessageObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) object>)
Status RealtimeConversationItemSystemMessageStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemSystemMessageStatusCompleted RealtimeConversationItemSystemMessageStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemSystemMessageStatusIncomplete RealtimeConversationItemSystemMessageStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemSystemMessageStatusInProgress RealtimeConversationItemSystemMessageStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema)>)
type RealtimeConversationItemUserMessage struct{…}
A user message item in a Realtime conversation.
Content []RealtimeConversationItemUserMessageContent
The content of the message.
Audio stringOptional
Base64-encoded audio bytes (for `input\_audio`), these will be parsed as the format specified in the session input audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) audio>)
Detail stringOptional
The detail level of the image (for `input\_image`). `auto` will default to `high`.
One of the following:
const RealtimeConversationItemUserMessageContentDetailAuto RealtimeConversationItemUserMessageContentDetail = "auto"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 0>)
const RealtimeConversationItemUserMessageContentDetailLow RealtimeConversationItemUserMessageContentDetail = "low"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 1>)
const RealtimeConversationItemUserMessageContentDetailHigh RealtimeConversationItemUserMessageContentDetail = "high"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail>)
ImageURL stringOptional
Base64-encoded image bytes (for `input\_image`) as a data URI. For example `data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...`. Supported formats are PNG and JPEG.
formaturi
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) image_url>)
Text stringOptional
The text content (for `input\_text`).
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) text>)
Transcript stringOptional
Transcript of the audio (for `input\_audio`). This is not sent to the model, but will be attached to the message item for reference.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) transcript>)
Type stringOptional
The content type (`input\_text`, `input\_audio`, or `input\_image`).
One of the following:
const RealtimeConversationItemUserMessageContentTypeInputText RealtimeConversationItemUserMessageContentType = "input\_text"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
const RealtimeConversationItemUserMessageContentTypeInputAudio RealtimeConversationItemUserMessageContentType = "input\_audio"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
const RealtimeConversationItemUserMessageContentTypeInputImage RealtimeConversationItemUserMessageContentType = "input\_image"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content>)
Role User
The role of the message sender. Always `user`.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) role>)
Type Message
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) id>)
Object RealtimeConversationItemUserMessageObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) object>)
Status RealtimeConversationItemUserMessageStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemUserMessageStatusCompleted RealtimeConversationItemUserMessageStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemUserMessageStatusIncomplete RealtimeConversationItemUserMessageStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemUserMessageStatusInProgress RealtimeConversationItemUserMessageStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema)>)
type RealtimeConversationItemAssistantMessage struct{…}
An assistant message item in a Realtime conversation.
Content []RealtimeConversationItemAssistantMessageContent
The content of the message.
Audio stringOptional
Base64-encoded audio bytes, these will be parsed as the format specified in the session output audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) audio>)
Text stringOptional
The text content.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) text>)
Transcript stringOptional
The transcript of the audio content, this will always be present if the output type is `audio`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) transcript>)
Type stringOptional
The content type, `output\_text` or `output\_audio` depending on the session `output\_modalities` configuration.
One of the following:
const RealtimeConversationItemAssistantMessageContentTypeOutputText RealtimeConversationItemAssistantMessageContentType = "output\_text"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
const RealtimeConversationItemAssistantMessageContentTypeOutputAudio RealtimeConversationItemAssistantMessageContentType = "output\_audio"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content>)
Role Assistant
The role of the message sender. Always `assistant`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) role>)
Type Message
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) id>)
Object RealtimeConversationItemAssistantMessageObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) object>)
Status RealtimeConversationItemAssistantMessageStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemAssistantMessageStatusCompleted RealtimeConversationItemAssistantMessageStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemAssistantMessageStatusIncomplete RealtimeConversationItemAssistantMessageStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemAssistantMessageStatusInProgress RealtimeConversationItemAssistantMessageStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema)>)
type RealtimeConversationItemFunctionCall struct{…}
A function call item in a Realtime conversation.
Arguments string
The arguments of the function call. This is a JSON-encoded string representing the arguments passed to the function, for example `{"arg1": "value1", "arg2": 42}`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) arguments>)
Name string
The name of the function being called.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) name>)
Type FunctionCall
The type of the item. Always `function\_call`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) id>)
CallID stringOptional
The ID of the function call.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) call_id>)
Object RealtimeConversationItemFunctionCallObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) object>)
Status RealtimeConversationItemFunctionCallStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemFunctionCallStatusCompleted RealtimeConversationItemFunctionCallStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemFunctionCallStatusIncomplete RealtimeConversationItemFunctionCallStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemFunctionCallStatusInProgress RealtimeConversationItemFunctionCallStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema)>)
type RealtimeConversationItemFunctionCallOutput struct{…}
A function call output item in a Realtime conversation.
CallID string
The ID of the function call this output is for.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) call_id>)
Output string
The output of the function call, this is free text and can contain any information or simply be empty.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) output>)
Type FunctionCallOutput
The type of the item. Always `function\_call\_output`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) type>)
ID stringOptional
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) id>)
Object RealtimeConversationItemFunctionCallOutputObjectOptional
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) object>)
Status RealtimeConversationItemFunctionCallOutputStatusOptional
The status of the item. Has no effect on the conversation.
One of the following:
const RealtimeConversationItemFunctionCallOutputStatusCompleted RealtimeConversationItemFunctionCallOutputStatus = "completed"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 0>)
const RealtimeConversationItemFunctionCallOutputStatusIncomplete RealtimeConversationItemFunctionCallOutputStatus = "incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 1>)
const RealtimeConversationItemFunctionCallOutputStatusInProgress RealtimeConversationItemFunctionCallOutputStatus = "in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema)>)
type RealtimeMcpApprovalResponse struct{…}
A Realtime item responding to an MCP approval request.
ID string
The unique ID of the approval response.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) id>)
ApprovalRequestID string
The ID of the approval request being answered.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approval_request_id>)
Approve bool
Whether the request was approved.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approve>)
Type McpApprovalResponse
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) type>)
Reason stringOptional
Optional reason for the decision.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) reason>)
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema)>)
type RealtimeMcpListTools struct{…}
A Realtime item listing tools available on an MCP server.
ServerLabel string
The label of the MCP server.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) server_label>)
Tools []RealtimeMcpListToolsTool
The tools available on the server.
InputSchema any
The JSON schema describing the tool’s input.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) input_schema>)
Name string
The name of the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) name>)
Annotations anyOptional
Additional annotations about the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) annotations>)
Description stringOptional
The description of the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) description>)
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools>)
Type McpListTools
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) type>)
ID stringOptional
The unique ID of the list.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) id>)
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema)>)
type RealtimeMcpToolCall struct{…}
A Realtime item representing an invocation of a tool on an MCP server.
ID string
The unique ID of the tool call.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) id>)
Arguments string
A JSON string of the arguments passed to the tool.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) arguments>)
Name string
The name of the tool that was run.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) name>)
ServerLabel string
The label of the MCP server running the tool.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) server_label>)
Type McpCall
The type of the item. Always `mcp\_call`.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) type>)
ApprovalRequestID stringOptional
The ID of an associated approval request, if any.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) approval_request_id>)
Error RealtimeMcpToolCallErrorUnionOptional
The error from the tool call, if any.
One of the following:
type RealtimeMcpProtocolError struct{…}
Code int64
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) code>)
Message string
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) message>)
Type ProtocolError
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema)>)
type RealtimeMcpToolExecutionError struct{…}
Message string
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) message>)
Type ToolExecutionError
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>)
type RealtimeMcphttpError struct{…}
Code int64
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) code>)
Message string
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) message>)
Type HTTPError
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema)>)
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) error>)
Output stringOptional
The output from the tool call.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) output>)
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema)>)
type RealtimeMcpApprovalRequest struct{…}
A Realtime item requesting human approval of a tool invocation.
ID string
The unique ID of the approval request.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) id>)
Arguments string
A JSON string of arguments for the tool.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) arguments>)
Name string
The name of the tool to run.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) name>)
ServerLabel string
The label of the MCP server making the request.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) server_label>)
Type McpApprovalRequest
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema)>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) input>)
Instructions stringOptional
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) instructions>)
MaxOutputTokens RealtimeResponseCreateParamsMaxOutputTokensUnionRespOptional
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
int64
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) max_output_tokens > (variant) 0>)
Inf
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) max_output_tokens>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)Optional
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) metadata>)
OutputModalities []stringOptional
The set of modalities the model used to respond, currently the only possible values are
`[\\"audio\\"]`, `[\\"text\\"]`. Audio output always include a text transcript. Setting the
output to mode `text` will disable audio output from the model.
One of the following:
const RealtimeResponseCreateParamsOutputModalityText RealtimeResponseCreateParamsOutputModality = "text"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) output_modalities > (items) > (member) 0>)
const RealtimeResponseCreateParamsOutputModalityAudio RealtimeResponseCreateParamsOutputModality = "audio"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) output_modalities>)
Prompt [ResponsePrompt](</api/reference/go/resources/responses#(resource) responses > (model) response_prompt > (schema)>)Optional
Reference to a prompt template and its variables.
[Learn more](https://platform.openai.com/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt>)
ToolChoice RealtimeResponseCreateParamsToolChoiceUnionRespOptional
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
One of the following:
type ToolChoiceOptions string
Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or
more tools.
`required` means the model must call one or more tools.
One of the following:
const ToolChoiceOptionsNone [ToolChoiceOptions](</api/reference/go/resources/responses#(resource) responses > (model) tool_choice_options > (schema)>) = "none"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 0>)
const ToolChoiceOptionsAuto [ToolChoiceOptions](</api/reference/go/resources/responses#(resource) responses > (model) tool_choice_options > (schema)>) = "auto"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 1>)
const ToolChoiceOptionsRequired [ToolChoiceOptions](</api/reference/go/resources/responses#(resource) responses > (model) tool_choice_options > (schema)>) = "required"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 2>)
[](<#(resource) responses > (model) tool_choice_options > (schema)>)
type ToolChoiceFunction struct{…}
Use this option to force the model to call a specific function.
Name string
The name of the function to call.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) name>)
Type Function
For function calling, the type is always `function`.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) type>)
[](<#(resource) responses > (model) tool_choice_function > (schema)>)
type ToolChoiceMcp struct{…}
Use this option to force the model to call a specific tool on a remote MCP server.
ServerLabel string
The label of the MCP server to use.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) server_label>)
Type Mcp
For MCP tools, the type is always `mcp`.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) type>)
Name stringOptional
The name of the tool to call on the server.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) name>)
[](<#(resource) responses > (model) tool_choice_mcp > (schema)>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tool_choice>)
Tools []RealtimeResponseCreateParamsToolUnionRespOptional
Tools available to the model.
One of the following:
type RealtimeFunctionTool struct{…}
Description stringOptional
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
Name stringOptional
The name of the function.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
Parameters anyOptional
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
Type RealtimeFunctionToolTypeOptional
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_function_tool > (schema)>)
type RealtimeResponseCreateMcpTool struct{…}
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](https://platform.openai.com/docs/guides/tools-remote-mcp).
ServerLabel string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) server_label>)
Type Mcp
The type of the MCP tool. Always `mcp`.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) type>)
AllowedTools RealtimeResponseCreateMcpToolAllowedToolsUnionOptional
List of allowed tool names or a filter object.
One of the following:
[]string
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) allowed_tools > (variant) 0>)
RealtimeResponseCreateMcpToolAllowedToolsMcpToolFilter
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) allowed_tools > (variant) 1 > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) allowed_tools > (variant) 1>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) allowed_tools>)
Authorization stringOptional
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) authorization>)
ConnectorID RealtimeResponseCreateMcpToolConnectorIDOptional
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](https://platform.openai.com/docs/guides/tools-remote-mcp#connectors).
Currently supported `connector\_id` values are:
* Dropbox: `connector\_dropbox`
* Gmail: `connector\_gmail`
* Google Calendar: `connector\_googlecalendar`
* Google Drive: `connector\_googledrive`
* Microsoft Teams: `connector\_microsoftteams`
* Outlook Calendar: `connector\_outlookcalendar`
* Outlook Email: `connector\_outlookemail`
* SharePoint: `connector\_sharepoint`
One of the following:
const RealtimeResponseCreateMcpToolConnectorIDConnectorDropbox RealtimeResponseCreateMcpToolConnectorID = "connector\_dropbox"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id > (member) 0>)
const RealtimeResponseCreateMcpToolConnectorIDConnectorGmail RealtimeResponseCreateMcpToolConnectorID = "connector\_gmail"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id > (member) 1>)
const RealtimeResponseCreateMcpToolConnectorIDConnectorGooglecalendar RealtimeResponseCreateMcpToolConnectorID = "connector\_googlecalendar"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id > (member) 2>)
const RealtimeResponseCreateMcpToolConnectorIDConnectorGoogledrive RealtimeResponseCreateMcpToolConnectorID = "connector\_googledrive"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id > (member) 3>)
const RealtimeResponseCreateMcpToolConnectorIDConnectorMicrosoftteams RealtimeResponseCreateMcpToolConnectorID = "connector\_microsoftteams"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id > (member) 4>)
const RealtimeResponseCreateMcpToolConnectorIDConnectorOutlookcalendar RealtimeResponseCreateMcpToolConnectorID = "connector\_outlookcalendar"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id > (member) 5>)
const RealtimeResponseCreateMcpToolConnectorIDConnectorOutlookemail RealtimeResponseCreateMcpToolConnectorID = "connector\_outlookemail"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id > (member) 6>)
const RealtimeResponseCreateMcpToolConnectorIDConnectorSharepoint RealtimeResponseCreateMcpToolConnectorID = "connector\_sharepoint"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id > (member) 7>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) connector_id>)
DeferLoading boolOptional
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) defer_loading>)
Headers map[string, string]Optional
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) headers>)
RequireApproval RealtimeResponseCreateMcpToolRequireApprovalUnionOptional
Specify which of the MCP server’s tools require approval.
One of the following:
RealtimeResponseCreateMcpToolRequireApprovalMcpToolApprovalFilter
Always RealtimeResponseCreateMcpToolRequireApprovalMcpToolApprovalFilterAlwaysOptional
A filter object to specify which tools are allowed.
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 0 > (property) always>)
Never RealtimeResponseCreateMcpToolRequireApprovalMcpToolApprovalFilterNeverOptional
A filter object to specify which tools are allowed.
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 0>)
string
One of the following:
const RealtimeResponseCreateMcpToolRequireApprovalMcpToolApprovalSettingAlways RealtimeResponseCreateMcpToolRequireApprovalMcpToolApprovalSetting = "always"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 1 > (member) 0>)
const RealtimeResponseCreateMcpToolRequireApprovalMcpToolApprovalSettingNever RealtimeResponseCreateMcpToolRequireApprovalMcpToolApprovalSetting = "never"
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval > (variant) 1>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) require_approval>)
ServerDescription stringOptional
Optional description of the MCP server, used to provide more context.
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) server_description>)
ServerURL stringOptional
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema) > (property) server_url>)
[](<#(resource) realtime > (model) realtime_response_create_mcp_tool > (schema)>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema)>)
type RealtimeResponseStatus struct{…}
Additional details about the status.
Error RealtimeResponseStatusErrorOptional
A description of the error that caused the response to fail,
populated when the `status` is `failed`.
Code stringOptional
Error code, if any.
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) error > (property) code>)
Type stringOptional
The type of error.
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) error > (property) type>)
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) error>)
Reason RealtimeResponseStatusReasonOptional
The reason the Response did not complete. For a `cancelled` Response, one of `turn\_detected` (the server VAD detected a new start of speech) or `client\_cancelled` (the client sent a cancel event). For an `incomplete` Response, one of `max\_output\_tokens` or `content\_filter` (the server-side safety filter activated and cut off the response).
One of the following:
const RealtimeResponseStatusReasonTurnDetected RealtimeResponseStatusReason = "turn\_detected"
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) reason > (member) 0>)
const RealtimeResponseStatusReasonClientCancelled RealtimeResponseStatusReason = "client\_cancelled"
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) reason > (member) 1>)
const RealtimeResponseStatusReasonMaxOutputTokens RealtimeResponseStatusReason = "max\_output\_tokens"
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) reason > (member) 2>)
const RealtimeResponseStatusReasonContentFilter RealtimeResponseStatusReason = "content\_filter"
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) reason > (member) 3>)
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) reason>)
Type RealtimeResponseStatusTypeOptional
The type of error that caused the response to fail, corresponding
with the `status` field (`completed`, `cancelled`, `incomplete`,
`failed`).
One of the following:
const RealtimeResponseStatusTypeCompleted RealtimeResponseStatusType = "completed"
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) type > (member) 0>)
const RealtimeResponseStatusTypeCancelled RealtimeResponseStatusType = "cancelled"
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) type > (member) 1>)
const RealtimeResponseStatusTypeIncomplete RealtimeResponseStatusType = "incomplete"
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) type > (member) 2>)
const RealtimeResponseStatusTypeFailed RealtimeResponseStatusType = "failed"
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) type > (member) 3>)
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_response_status > (schema)>)
type RealtimeResponseUsage struct{…}
Usage statistics for the Response, this will correspond to billing. A
Realtime API session will maintain a conversation context and append new
Items to the Conversation, thus output from previous turns (text and
audio tokens) will become the input for later turns.
InputTokenDetails [RealtimeResponseUsageInputTokenDetails](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema)>)Optional
Details about the input tokens used in the Response. Cached tokens are tokens from previous turns in the conversation that are included as context for the current response. Cached tokens here are counted as a subset of input tokens, meaning input tokens will include cached and uncached tokens.
[](<#(resource) realtime > (model) realtime_response_usage > (schema) > (property) input_token_details>)
InputTokens int64Optional
The number of input tokens used in the Response, including text and
audio tokens.
[](<#(resource) realtime > (model) realtime_response_usage > (schema) > (property) input_tokens>)
OutputTokenDetails [RealtimeResponseUsageOutputTokenDetails](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_response_usage_output_token_details > (schema)>)Optional
Details about the output tokens used in the Response.
[](<#(resource) realtime > (model) realtime_response_usage > (schema) > (property) output_token_details>)
OutputTokens int64Optional
The number of output tokens sent in the Response, including text and
audio tokens.
[](<#(resource) realtime > (model) realtime_response_usage > (schema) > (property) output_tokens>)
TotalTokens int64Optional
The total number of tokens in the Response including input and output
text and audio tokens.
[](<#(resource) realtime > (model) realtime_response_usage > (schema) > (property) total_tokens>)
[](<#(resource) realtime > (model) realtime_response_usage > (schema)>)
type RealtimeResponseUsageInputTokenDetails struct{…}
Details about the input tokens used in the Response. Cached tokens are tokens from previous turns in the conversation that are included as context for the current response. Cached tokens here are counted as a subset of input tokens, meaning input tokens will include cached and uncached tokens.
AudioTokens int64Optional
The number of audio tokens used as input for the Response.
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema) > (property) audio_tokens>)
CachedTokens int64Optional
The number of cached tokens used as input for the Response.
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema) > (property) cached_tokens>)
CachedTokensDetails RealtimeResponseUsageInputTokenDetailsCachedTokensDetailsOptional
Details about the cached tokens used as input for the Response.
AudioTokens int64Optional
The number of cached audio tokens used as input for the Response.
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema) > (property) cached_tokens_details > (property) audio_tokens>)
ImageTokens int64Optional
The number of cached image tokens used as input for the Response.
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema) > (property) cached_tokens_details > (property) image_tokens>)
TextTokens int64Optional
The number of cached text tokens used as input for the Response.
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema) > (property) cached_tokens_details > (property) text_tokens>)
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema) > (property) cached_tokens_details>)
ImageTokens int64Optional
The number of image tokens used as input for the Response.
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema) > (property) image_tokens>)
TextTokens int64Optional
The number of text tokens used as input for the Response.
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema) > (property) text_tokens>)
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema)>)
type RealtimeResponseUsageOutputTokenDetails struct{…}
Details about the output tokens used in the Response.
AudioTokens int64Optional
The number of audio tokens used in the Response.
[](<#(resource) realtime > (model) realtime_response_usage_output_token_details > (schema) > (property) audio_tokens>)
TextTokens int64Optional
The number of text tokens used in the Response.
[](<#(resource) realtime > (model) realtime_response_usage_output_token_details > (schema) > (property) text_tokens>)
[](<#(resource) realtime > (model) realtime_response_usage_output_token_details > (schema)>)
type RealtimeServerEventUnion interface{…}
A realtime server event.
One of the following:
type ConversationCreatedEvent struct{…}
Returned when a conversation is created. Emitted right after session creation.
Conversation ConversationCreatedEventConversation
The conversation resource.
ID stringOptional
The unique ID of the conversation.
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) conversation > (property) id>)
Object stringOptional
The object type, must be `realtime.conversation`.
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) conversation > (property) object>)
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) conversation>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) event_id>)
Type ConversationCreated
The event type, must be `conversation.created`.
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_created_event > (schema)>)
type ConversationItemCreatedEvent struct{…}
Returned when a conversation item is created. There are several scenarios that produce this event:
* The server is generating a Response, which if successful will produce
either one or two Items, which will be of type `message`
(role `assistant`) or type `function\_call`.
* The input audio buffer has been committed, either by the client or the
server (in `server\_vad` mode). The server will take the content of the
input audio buffer and add it to a new user message Item.
* The client has sent a `conversation.item.create` event to add a new Item
to the Conversation.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_created_event > (schema) > (property) event_id>)
Item [ConversationItemUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) conversation_item_created_event > (schema) > (property) item>)
Type ConversationItemCreated
The event type, must be `conversation.item.created`.
[](<#(resource) realtime > (model) conversation_item_created_event > (schema) > (property) type>)
PreviousItemID stringOptional
The ID of the preceding item in the Conversation context, allows the
client to understand the order of the conversation. Can be `null` if the
item has no predecessor.
[](<#(resource) realtime > (model) conversation_item_created_event > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) conversation_item_created_event > (schema)>)
type ConversationItemDeletedEvent struct{…}
Returned when an item in the conversation is deleted by the client with a
`conversation.item.delete` event. This event is used to synchronize the
server’s understanding of the conversation history with the client’s view.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_deleted_event > (schema) > (property) event_id>)
ItemID string
The ID of the item that was deleted.
[](<#(resource) realtime > (model) conversation_item_deleted_event > (schema) > (property) item_id>)
Type ConversationItemDeleted
The event type, must be `conversation.item.deleted`.
[](<#(resource) realtime > (model) conversation_item_deleted_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_deleted_event > (schema)>)
type ConversationItemInputAudioTranscriptionCompletedEvent struct{…}
This event is the output of audio transcription for user audio written to the
user audio buffer. Transcription begins when the input audio buffer is
committed by the client or server (when VAD is enabled). Transcription runs
asynchronously with Response creation, so this event may come before or after
the Response events.
Realtime API models accept audio natively, and thus input transcription is a
separate process run on a separate ASR (Automatic Speech Recognition) model.
The transcript may diverge somewhat from the model’s interpretation, and
should be treated as a rough guide.
ContentIndex int64
The index of the content part containing the audio.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) content_index>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) event_id>)
ItemID string
The ID of the item containing the audio that is being transcribed.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) item_id>)
Transcript string
The transcribed text.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) transcript>)
Type ConversationItemInputAudioTranscriptionCompleted
The event type, must be
`conversation.item.input\_audio\_transcription.completed`.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) type>)
Usage ConversationItemInputAudioTranscriptionCompletedEventUsageUnion
Usage statistics for the transcription, this is billed according to the ASR model’s pricing rather than the realtime model’s pricing.
One of the following:
ConversationItemInputAudioTranscriptionCompletedEventUsageTranscriptTextUsageTokens
InputTokens int64
Number of input tokens billed for this request.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) input_tokens>)
OutputTokens int64
Number of output tokens generated.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) output_tokens>)
TotalTokens int64
Total number of tokens used (input + output).
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) total_tokens>)
Type Tokens
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) type>)
InputTokenDetails ConversationItemInputAudioTranscriptionCompletedEventUsageTranscriptTextUsageTokensInputTokenDetailsOptional
Details about the input tokens billed for this request.
AudioTokens int64Optional
Number of audio tokens billed for this request.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
TextTokens int64Optional
Number of text tokens billed for this request.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0>)
ConversationItemInputAudioTranscriptionCompletedEventUsageTranscriptTextUsageDuration
Seconds float64
Duration of the input audio in seconds.
formatdouble
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 1 > (property) seconds>)
Type Duration
The type of the usage object. Always `duration` for this variant.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 1 > (property) type>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 1>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage>)
Logprobs [][LogProbProperties](</api/reference/go/resources/realtime#(resource) realtime > (model) log_prob_properties > (schema)>)Optional
The log probabilities of the transcription.
Token string
The token that was used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) token>)
Bytes []int64
The bytes that were used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) bytes>)
Logprob float64
The log probability of the token.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) logprob>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) logprobs>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema)>)
type ConversationItemInputAudioTranscriptionDeltaEvent struct{…}
Returned when the text value of an input audio transcription content part is updated with incremental transcription results.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) event_id>)
ItemID string
The ID of the item containing the audio that is being transcribed.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) item_id>)
Type ConversationItemInputAudioTranscriptionDelta
The event type, must be `conversation.item.input\_audio\_transcription.delta`.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) type>)
ContentIndex int64Optional
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) content_index>)
Delta stringOptional
The text delta.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) delta>)
Logprobs [][LogProbProperties](</api/reference/go/resources/realtime#(resource) realtime > (model) log_prob_properties > (schema)>)Optional
The log probabilities of the transcription. These can be enabled by configurating the session with `"include": ["item.input\_audio\_transcription.logprobs"]`. Each entry in the array corresponds a log probability of which token would be selected for this chunk of transcription. This can help to identify if it was possible there were multiple valid options for a given chunk of transcription.
Token string
The token that was used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) token>)
Bytes []int64
The bytes that were used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) bytes>)
Logprob float64
The log probability of the token.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) logprob>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) logprobs>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema)>)
type ConversationItemInputAudioTranscriptionFailedEvent struct{…}
Returned when input audio transcription is configured, and a transcription
request for a user message failed. These events are separate from other
`error` events so that the client can identify the related Item.
ContentIndex int64
The index of the content part containing the audio.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) content_index>)
Error ConversationItemInputAudioTranscriptionFailedEventError
Details of the transcription error.
Code stringOptional
Error code, if any.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error > (property) code>)
Message stringOptional
A human-readable error message.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error > (property) message>)
Param stringOptional
Parameter related to the error, if any.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error > (property) param>)
Type stringOptional
The type of error.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error > (property) type>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) event_id>)
ItemID string
The ID of the user message item.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) item_id>)
Type ConversationItemInputAudioTranscriptionFailed
The event type, must be
`conversation.item.input\_audio\_transcription.failed`.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema)>)
RealtimeServerEventConversationItemRetrieved
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 6 > (property) event_id>)
Item [ConversationItemUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 6 > (property) item>)
Type ConversationItemRetrieved
The event type, must be `conversation.item.retrieved`.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 6 > (property) type>)
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 6>)
type ConversationItemTruncatedEvent struct{…}
Returned when an earlier assistant audio message item is truncated by the
client with a `conversation.item.truncate` event. This event is used to
synchronize the server’s understanding of the audio with the client’s playback.
This action will truncate the audio and remove the server-side text transcript
to ensure there is no text in the context that hasn’t been heard by the user.
AudioEndMs int64
The duration up to which the audio was truncated, in milliseconds.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) audio_end_ms>)
ContentIndex int64
The index of the content part that was truncated.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) content_index>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) event_id>)
ItemID string
The ID of the assistant message item that was truncated.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) item_id>)
Type ConversationItemTruncated
The event type, must be `conversation.item.truncated`.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema)>)
type RealtimeErrorEvent struct{…}
Returned when an error occurs, which could be a client problem or a server
problem. Most errors are recoverable and the session will stay open, we
recommend to implementors to monitor and log error messages by default.
Error [RealtimeError](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_error > (schema)>)
Details of the error.
[](<#(resource) realtime > (model) realtime_error_event > (schema) > (property) error>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) realtime_error_event > (schema) > (property) event_id>)
Type Error
The event type, must be `error`.
[](<#(resource) realtime > (model) realtime_error_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_error_event > (schema)>)
type InputAudioBufferClearedEvent struct{…}
Returned when the input audio buffer is cleared by the client with a
`input\_audio\_buffer.clear` event.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_cleared_event > (schema) > (property) event_id>)
Type InputAudioBufferCleared
The event type, must be `input\_audio\_buffer.cleared`.
[](<#(resource) realtime > (model) input_audio_buffer_cleared_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_cleared_event > (schema)>)
type InputAudioBufferCommittedEvent struct{…}
Returned when an input audio buffer is committed, either by the client or
automatically in server VAD mode. The `item\_id` property is the ID of the user
message item that will be created, thus a `conversation.item.created` event
will also be sent to the client.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema) > (property) event_id>)
ItemID string
The ID of the user message item that will be created.
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema) > (property) item_id>)
Type InputAudioBufferCommitted
The event type, must be `input\_audio\_buffer.committed`.
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema) > (property) type>)
PreviousItemID stringOptional
The ID of the preceding item after which the new item will be inserted.
Can be `null` if the item has no predecessor.
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema)>)
type InputAudioBufferDtmfEventReceivedEvent struct{…}
**SIP Only:** Returned when an DTMF event is received. A DTMF event is a message that
represents a telephone keypad press (0–9, \*, #, A–D). The `event` property
is the keypad that the user press. The `received\_at` is the UTC Unix Timestamp
that the server received the event.
Event string
The telephone keypad that was pressed by the user.
[](<#(resource) realtime > (model) input_audio_buffer_dtmf_event_received_event > (schema) > (property) event>)
ReceivedAt int64
UTC Unix Timestamp when DTMF Event was received by server.
[](<#(resource) realtime > (model) input_audio_buffer_dtmf_event_received_event > (schema) > (property) received_at>)
Type InputAudioBufferDtmfEventReceived
The event type, must be `input\_audio\_buffer.dtmf\_event\_received`.
[](<#(resource) realtime > (model) input_audio_buffer_dtmf_event_received_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_dtmf_event_received_event > (schema)>)
type InputAudioBufferSpeechStartedEvent struct{…}
Sent by the server when in `server\_vad` mode to indicate that speech has been
detected in the audio buffer. This can happen any time audio is added to the
buffer (unless speech is already detected). The client may want to use this
event to interrupt audio playback or provide visual feedback to the user.
The client should expect to receive a `input\_audio\_buffer.speech\_stopped` event
when speech stops. The `item\_id` property is the ID of the user message item
that will be created when speech stops and will also be included in the
`input\_audio\_buffer.speech\_stopped` event (unless the client manually commits
the audio buffer during VAD activation).
AudioStartMs int64
Milliseconds from the start of all audio written to the buffer during the
session when speech was first detected. This will correspond to the
beginning of audio sent to the model, and thus includes the
`prefix\_padding\_ms` configured in the Session.
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema) > (property) audio_start_ms>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema) > (property) event_id>)
ItemID string
The ID of the user message item that will be created when speech stops.
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema) > (property) item_id>)
Type InputAudioBufferSpeechStarted
The event type, must be `input\_audio\_buffer.speech\_started`.
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema)>)
type InputAudioBufferSpeechStoppedEvent struct{…}
Returned in `server\_vad` mode when the server detects the end of speech in
the audio buffer. The server will also send an `conversation.item.created`
event with the user message item that is created from the audio buffer.
AudioEndMs int64
Milliseconds since the session started when speech stopped. This will
correspond to the end of audio sent to the model, and thus includes the
`min\_silence\_duration\_ms` configured in the Session.
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema) > (property) audio_end_ms>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema) > (property) event_id>)
ItemID string
The ID of the user message item that will be created.
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema) > (property) item_id>)
Type InputAudioBufferSpeechStopped
The event type, must be `input\_audio\_buffer.speech\_stopped`.
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema)>)
type RateLimitsUpdatedEvent struct{…}
Emitted at the beginning of a Response to indicate the updated rate limits.
When a Response is created some tokens will be “reserved” for the output
tokens, the rate limits shown here reflect that reservation, which is then
adjusted accordingly once the Response is completed.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) event_id>)
RateLimits []RateLimitsUpdatedEventRateLimit
List of rate limit information.
Limit int64Optional
The maximum allowed value for the rate limit.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) limit>)
Name stringOptional
The name of the rate limit (`requests`, `tokens`).
One of the following:
const RateLimitsUpdatedEventRateLimitNameRequests RateLimitsUpdatedEventRateLimitName = "requests"
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) name > (member) 0>)
const RateLimitsUpdatedEventRateLimitNameTokens RateLimitsUpdatedEventRateLimitName = "tokens"
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) name > (member) 1>)
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) name>)
Remaining int64Optional
The remaining value before the limit is reached.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) remaining>)
ResetSeconds float64Optional
Seconds until the rate limit resets.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) reset_seconds>)
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits>)
Type RateLimitsUpdated
The event type, must be `rate\_limits.updated`.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema)>)
type ResponseAudioDeltaEvent struct{…}
Returned when the model-generated audio is updated.
ContentIndex int64
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) content_index>)
Delta string
Base64-encoded audio data delta.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) delta>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) event_id>)
ItemID string
The ID of the item.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) response_id>)
Type ResponseOutputAudioDelta
The event type, must be `response.output\_audio.delta`.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_audio_delta_event > (schema)>)
type ResponseAudioDoneEvent struct{…}
Returned when the model-generated audio is done. Also emitted when a Response
is interrupted, incomplete, or cancelled.
ContentIndex int64
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) content_index>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) event_id>)
ItemID string
The ID of the item.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) response_id>)
Type ResponseOutputAudioDone
The event type, must be `response.output\_audio.done`.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_audio_done_event > (schema)>)
type ResponseAudioTranscriptDeltaEvent struct{…}
Returned when the model-generated transcription of audio output is updated.
ContentIndex int64
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) content_index>)
Delta string
The transcript delta.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) delta>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) event_id>)
ItemID string
The ID of the item.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) response_id>)
Type ResponseOutputAudioTranscriptDelta
The event type, must be `response.output\_audio\_transcript.delta`.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema)>)
type ResponseAudioTranscriptDoneEvent struct{…}
Returned when the model-generated transcription of audio output is done
streaming. Also emitted when a Response is interrupted, incomplete, or
cancelled.
ContentIndex int64
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) content_index>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) event_id>)
ItemID string
The ID of the item.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) response_id>)
Transcript string
The final transcript of the audio.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) transcript>)
Type ResponseOutputAudioTranscriptDone
The event type, must be `response.output\_audio\_transcript.done`.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema)>)
type ResponseContentPartAddedEvent struct{…}
Returned when a new content part is added to an assistant message item during
response generation.
ContentIndex int64
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) content_index>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) event_id>)
ItemID string
The ID of the item to which the content part was added.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) output_index>)
Part ResponseContentPartAddedEventPart
The content part that was added.
Audio stringOptional
Base64-encoded audio data (if type is “audio”).
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) audio>)
Text stringOptional
The text content (if type is “text”).
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) text>)
Transcript stringOptional
The transcript of the audio (if type is “audio”).
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) transcript>)
Type stringOptional
The content type (“text”, “audio”).
One of the following:
const ResponseContentPartAddedEventPartTypeText ResponseContentPartAddedEventPartType = "text"
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) type > (member) 0>)
const ResponseContentPartAddedEventPartTypeAudio ResponseContentPartAddedEventPartType = "audio"
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) type > (member) 1>)
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) type>)
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) response_id>)
Type ResponseContentPartAdded
The event type, must be `response.content\_part.added`.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_content_part_added_event > (schema)>)
type ResponseContentPartDoneEvent struct{…}
Returned when a content part is done streaming in an assistant message item.
Also emitted when a Response is interrupted, incomplete, or cancelled.
ContentIndex int64
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) content_index>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) event_id>)
ItemID string
The ID of the item.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) output_index>)
Part ResponseContentPartDoneEventPart
The content part that is done.
Audio stringOptional
Base64-encoded audio data (if type is “audio”).
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) audio>)
Text stringOptional
The text content (if type is “text”).
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) text>)
Transcript stringOptional
The transcript of the audio (if type is “audio”).
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) transcript>)
Type stringOptional
The content type (“text”, “audio”).
One of the following:
const ResponseContentPartDoneEventPartTypeText ResponseContentPartDoneEventPartType = "text"
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) type > (member) 0>)
const ResponseContentPartDoneEventPartTypeAudio ResponseContentPartDoneEventPartType = "audio"
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) type > (member) 1>)
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) type>)
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) response_id>)
Type ResponseContentPartDone
The event type, must be `response.content\_part.done`.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_content_part_done_event > (schema)>)
type ResponseCreatedEvent struct{…}
Returned when a new Response is created. The first event of response creation,
where the response is in an initial state of `in\_progress`.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_created_event > (schema) > (property) event_id>)
Response [RealtimeResponse](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_response > (schema)>)
The response resource.
[](<#(resource) realtime > (model) response_created_event > (schema) > (property) response>)
Type ResponseCreated
The event type, must be `response.created`.
[](<#(resource) realtime > (model) response_created_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_created_event > (schema)>)
type ResponseDoneEvent struct{…}
Returned when a Response is done streaming. Always emitted, no matter the
final state. The Response object included in the `response.done` event will
include all output Items in the Response but will omit the raw audio data.
Clients should check the `status` field of the Response to determine if it was successful
(`completed`) or if there was another outcome: `cancelled`, `failed`, or `incomplete`.
A response will contain all output items that were generated during the response, excluding
any audio content.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_done_event > (schema) > (property) event_id>)
Response [RealtimeResponse](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_response > (schema)>)
The response resource.
[](<#(resource) realtime > (model) response_done_event > (schema) > (property) response>)
Type ResponseDone
The event type, must be `response.done`.
[](<#(resource) realtime > (model) response_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_done_event > (schema)>)
type ResponseFunctionCallArgumentsDeltaEvent struct{…}
Returned when the model-generated function call arguments are updated.
CallID string
The ID of the function call.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) call_id>)
Delta string
The arguments delta as a JSON string.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) delta>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) event_id>)
ItemID string
The ID of the function call item.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) response_id>)
Type ResponseFunctionCallArgumentsDelta
The event type, must be `response.function\_call\_arguments.delta`.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema)>)
type ResponseFunctionCallArgumentsDoneEvent struct{…}
Returned when the model-generated function call arguments are done streaming.
Also emitted when a Response is interrupted, incomplete, or cancelled.
Arguments string
The final arguments as a JSON string.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) arguments>)
CallID string
The ID of the function call.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) call_id>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) event_id>)
ItemID string
The ID of the function call item.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) item_id>)
Name string
The name of the function that was called.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) name>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) response_id>)
Type ResponseFunctionCallArgumentsDone
The event type, must be `response.function\_call\_arguments.done`.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema)>)
type ResponseOutputItemAddedEvent struct{…}
Returned when a new Item is created during Response generation.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) event_id>)
Item [ConversationItemUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) item>)
OutputIndex int64
The index of the output item in the Response.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) output_index>)
ResponseID string
The ID of the Response to which the item belongs.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) response_id>)
Type ResponseOutputItemAdded
The event type, must be `response.output\_item.added`.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_output_item_added_event > (schema)>)
type ResponseOutputItemDoneEvent struct{…}
Returned when an Item is done streaming. Also emitted when a Response is
interrupted, incomplete, or cancelled.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) event_id>)
Item [ConversationItemUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) item>)
OutputIndex int64
The index of the output item in the Response.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) output_index>)
ResponseID string
The ID of the Response to which the item belongs.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) response_id>)
Type ResponseOutputItemDone
The event type, must be `response.output\_item.done`.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_output_item_done_event > (schema)>)
type ResponseTextDeltaEvent struct{…}
Returned when the text value of an “output\_text” content part is updated.
ContentIndex int64
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) content_index>)
Delta string
The text delta.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) delta>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) event_id>)
ItemID string
The ID of the item.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) response_id>)
Type ResponseOutputTextDelta
The event type, must be `response.output\_text.delta`.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_text_delta_event > (schema)>)
type ResponseTextDoneEvent struct{…}
Returned when the text value of an “output\_text” content part is done streaming. Also
emitted when a Response is interrupted, incomplete, or cancelled.
ContentIndex int64
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) content_index>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) event_id>)
ItemID string
The ID of the item.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) response_id>)
Text string
The final text content.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) text>)
Type ResponseOutputTextDone
The event type, must be `response.output\_text.done`.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_text_done_event > (schema)>)
type SessionCreatedEvent struct{…}
Returned when a Session is created. Emitted automatically when a new
connection is established as the first server event. This event will contain
the default Session configuration.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) session_created_event > (schema) > (property) event_id>)
Session SessionCreatedEventSessionUnion
The session configuration.
One of the following:
type RealtimeSessionCreateRequest struct{…}
Realtime session object configuration.
Type Realtime
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) type>)
Audio [RealtimeAudioConfig](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_config > (schema)>)Optional
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio>)
Include []stringOptional
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) include>)
Instructions stringOptional
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) instructions>)
MaxOutputTokens RealtimeSessionCreateRequestMaxOutputTokensUnionOptional
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
int64
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 0>)
Inf
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens>)
Model RealtimeSessionCreateRequestModelOptional
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 0>)
RealtimeSessionCreateRequestModel
One of the following:
const RealtimeSessionCreateRequestModelGPTRealtime RealtimeSessionCreateRequestModel = "gpt-realtime"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 0>)
const RealtimeSessionCreateRequestModelGPTRealtime1\_5 RealtimeSessionCreateRequestModel = "gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 1>)
const RealtimeSessionCreateRequestModelGPTRealtime2025\_08\_28 RealtimeSessionCreateRequestModel = "gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 2>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 3>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2024\_10\_01 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 4>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2024\_12\_17 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 5>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2025\_06\_03 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 6>)
const RealtimeSessionCreateRequestModelGPT4oMiniRealtimePreview RealtimeSessionCreateRequestModel = "gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 7>)
const RealtimeSessionCreateRequestModelGPT4oMiniRealtimePreview2024\_12\_17 RealtimeSessionCreateRequestModel = "gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 8>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini RealtimeSessionCreateRequestModel = "gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 9>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini2025\_10\_06 RealtimeSessionCreateRequestModel = "gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 10>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini2025\_12\_15 RealtimeSessionCreateRequestModel = "gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 11>)
const RealtimeSessionCreateRequestModelGPTAudio1\_5 RealtimeSessionCreateRequestModel = "gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 12>)
const RealtimeSessionCreateRequestModelGPTAudioMini RealtimeSessionCreateRequestModel = "gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 13>)
const RealtimeSessionCreateRequestModelGPTAudioMini2025\_10\_06 RealtimeSessionCreateRequestModel = "gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 14>)
const RealtimeSessionCreateRequestModelGPTAudioMini2025\_12\_15 RealtimeSessionCreateRequestModel = "gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model>)
OutputModalities []stringOptional
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
const RealtimeSessionCreateRequestOutputModalityText RealtimeSessionCreateRequestOutputModality = "text"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 0>)
const RealtimeSessionCreateRequestOutputModalityAudio RealtimeSessionCreateRequestOutputModality = "audio"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities>)
Prompt [ResponsePrompt](</api/reference/go/resources/responses#(resource) responses > (model) response_prompt > (schema)>)Optional
Reference to a prompt template and its variables.
[Learn more](https://platform.openai.com/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt>)
ToolChoice [RealtimeToolChoiceConfigUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)Optional
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice>)
Tools [RealtimeToolsConfig](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tools_config > (schema)>)Optional
Tools available to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools>)
Tracing [RealtimeTracingConfigUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tracing_config > (schema)>)Optional
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing>)
Truncation [RealtimeTruncationUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)Optional
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema)>)
type RealtimeTranscriptionSessionCreateRequest struct{…}
Realtime transcription session object configuration.
Type Transcription
The type of session to create. Always `transcription` for transcription sessions.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) type>)
Audio [RealtimeTranscriptionSessionAudio](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>)Optional
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio>)
Include []stringOptional
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) include>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>)
[](<#(resource) realtime > (model) session_created_event > (schema) > (property) session>)
Type SessionCreated
The event type, must be `session.created`.
[](<#(resource) realtime > (model) session_created_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) session_created_event > (schema)>)
type SessionUpdatedEvent struct{…}
Returned when a session is updated with a `session.update` event, unless
there is an error.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) session_updated_event > (schema) > (property) event_id>)
Session SessionUpdatedEventSessionUnion
The session configuration.
One of the following:
type RealtimeSessionCreateRequest struct{…}
Realtime session object configuration.
Type Realtime
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) type>)
Audio [RealtimeAudioConfig](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_config > (schema)>)Optional
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio>)
Include []stringOptional
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) include>)
Instructions stringOptional
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) instructions>)
MaxOutputTokens RealtimeSessionCreateRequestMaxOutputTokensUnionOptional
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
int64
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 0>)
Inf
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens>)
Model RealtimeSessionCreateRequestModelOptional
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 0>)
RealtimeSessionCreateRequestModel
One of the following:
const RealtimeSessionCreateRequestModelGPTRealtime RealtimeSessionCreateRequestModel = "gpt-realtime"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 0>)
const RealtimeSessionCreateRequestModelGPTRealtime1\_5 RealtimeSessionCreateRequestModel = "gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 1>)
const RealtimeSessionCreateRequestModelGPTRealtime2025\_08\_28 RealtimeSessionCreateRequestModel = "gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 2>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 3>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2024\_10\_01 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 4>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2024\_12\_17 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 5>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2025\_06\_03 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 6>)
const RealtimeSessionCreateRequestModelGPT4oMiniRealtimePreview RealtimeSessionCreateRequestModel = "gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 7>)
const RealtimeSessionCreateRequestModelGPT4oMiniRealtimePreview2024\_12\_17 RealtimeSessionCreateRequestModel = "gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 8>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini RealtimeSessionCreateRequestModel = "gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 9>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini2025\_10\_06 RealtimeSessionCreateRequestModel = "gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 10>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini2025\_12\_15 RealtimeSessionCreateRequestModel = "gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 11>)
const RealtimeSessionCreateRequestModelGPTAudio1\_5 RealtimeSessionCreateRequestModel = "gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 12>)
const RealtimeSessionCreateRequestModelGPTAudioMini RealtimeSessionCreateRequestModel = "gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 13>)
const RealtimeSessionCreateRequestModelGPTAudioMini2025\_10\_06 RealtimeSessionCreateRequestModel = "gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 14>)
const RealtimeSessionCreateRequestModelGPTAudioMini2025\_12\_15 RealtimeSessionCreateRequestModel = "gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model>)
OutputModalities []stringOptional
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
const RealtimeSessionCreateRequestOutputModalityText RealtimeSessionCreateRequestOutputModality = "text"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 0>)
const RealtimeSessionCreateRequestOutputModalityAudio RealtimeSessionCreateRequestOutputModality = "audio"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities>)
Prompt [ResponsePrompt](</api/reference/go/resources/responses#(resource) responses > (model) response_prompt > (schema)>)Optional
Reference to a prompt template and its variables.
[Learn more](https://platform.openai.com/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt>)
ToolChoice [RealtimeToolChoiceConfigUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)Optional
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice>)
Tools [RealtimeToolsConfig](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tools_config > (schema)>)Optional
Tools available to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools>)
Tracing [RealtimeTracingConfigUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tracing_config > (schema)>)Optional
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing>)
Truncation [RealtimeTruncationUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)Optional
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema)>)
type RealtimeTranscriptionSessionCreateRequest struct{…}
Realtime transcription session object configuration.
Type Transcription
The type of session to create. Always `transcription` for transcription sessions.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) type>)
Audio [RealtimeTranscriptionSessionAudio](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>)Optional
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio>)
Include []stringOptional
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) include>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>)
[](<#(resource) realtime > (model) session_updated_event > (schema) > (property) session>)
Type SessionUpdated
The event type, must be `session.updated`.
[](<#(resource) realtime > (model) session_updated_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) session_updated_event > (schema)>)
RealtimeServerEventOutputAudioBufferStarted
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 31 > (property) event_id>)
ResponseID string
The unique ID of the response that produced the audio.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 31 > (property) response_id>)
Type OutputAudioBufferStarted
The event type, must be `output\_audio\_buffer.started`.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 31 > (property) type>)
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 31>)
RealtimeServerEventOutputAudioBufferStopped
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 32 > (property) event_id>)
ResponseID string
The unique ID of the response that produced the audio.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 32 > (property) response_id>)
Type OutputAudioBufferStopped
The event type, must be `output\_audio\_buffer.stopped`.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 32 > (property) type>)
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 32>)
RealtimeServerEventOutputAudioBufferCleared
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 33 > (property) event_id>)
ResponseID string
The unique ID of the response that produced the audio.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 33 > (property) response_id>)
Type OutputAudioBufferCleared
The event type, must be `output\_audio\_buffer.cleared`.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 33 > (property) type>)
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 33>)
type ConversationItemAdded struct{…}
Sent by the server when an Item is added to the default Conversation. This can happen in several cases:
* When the client sends a `conversation.item.create` event.
* When the input audio buffer is committed. In this case the item will be a user message containing the audio from the buffer.
* When the model is generating a Response. In this case the `conversation.item.added` event will be sent when the model starts generating a specific Item, and thus it will not yet have any content (and `status` will be `in\_progress`).
The event will include the full content of the Item (except when model is generating a Response) except for audio data, which can be retrieved separately with a `conversation.item.retrieve` event if necessary.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_added > (schema) > (property) event_id>)
Item [ConversationItemUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) conversation_item_added > (schema) > (property) item>)
Type ConversationItemAdded
The event type, must be `conversation.item.added`.
[](<#(resource) realtime > (model) conversation_item_added > (schema) > (property) type>)
PreviousItemID stringOptional
The ID of the item that precedes this one, if any. This is used to
maintain ordering when items are inserted.
[](<#(resource) realtime > (model) conversation_item_added > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) conversation_item_added > (schema)>)
type ConversationItemDone struct{…}
Returned when a conversation item is finalized.
The event will include the full content of the Item except for audio data, which can be retrieved separately with a `conversation.item.retrieve` event if needed.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_done > (schema) > (property) event_id>)
Item [ConversationItemUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) conversation_item_done > (schema) > (property) item>)
Type ConversationItemDone
The event type, must be `conversation.item.done`.
[](<#(resource) realtime > (model) conversation_item_done > (schema) > (property) type>)
PreviousItemID stringOptional
The ID of the item that precedes this one, if any. This is used to
maintain ordering when items are inserted.
[](<#(resource) realtime > (model) conversation_item_done > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) conversation_item_done > (schema)>)
type InputAudioBufferTimeoutTriggered struct{…}
Returned when the Server VAD timeout is triggered for the input audio buffer. This is configured
with `idle\_timeout\_ms` in the `turn\_detection` settings of the session, and it indicates that
there hasn’t been any speech detected for the configured duration.
The `audio\_start\_ms` and `audio\_end\_ms` fields indicate the segment of audio after the last
model response up to the triggering time, as an offset from the beginning of audio written
to the input audio buffer. This means it demarcates the segment of audio that was silent and
the difference between the start and end values will roughly match the configured timeout.
The empty audio will be committed to the conversation as an `input\_audio` item (there will be a
`input\_audio\_buffer.committed` event) and a model response will be generated. There may be speech
that didn’t trigger VAD but is still detected by the model, so the model may respond with
something relevant to the conversation or a prompt to continue speaking.
AudioEndMs int64
Millisecond offset of audio written to the input audio buffer at the time the timeout was triggered.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) audio_end_ms>)
AudioStartMs int64
Millisecond offset of audio written to the input audio buffer that was after the playback time of the last model response.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) audio_start_ms>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) event_id>)
ItemID string
The ID of the item associated with this segment.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) item_id>)
Type InputAudioBufferTimeoutTriggered
The event type, must be `input\_audio\_buffer.timeout\_triggered`.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema)>)
type ConversationItemInputAudioTranscriptionSegment struct{…}
Returned when an input audio transcription segment is identified for an item.
ID string
The segment identifier.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) id>)
ContentIndex int64
The index of the input audio content part within the item.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) content_index>)
End float64
End time of the segment in seconds.
formatdouble
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) end>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) event_id>)
ItemID string
The ID of the item containing the input audio content.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) item_id>)
Speaker string
The detected speaker label for this segment.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) speaker>)
Start float64
Start time of the segment in seconds.
formatdouble
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) start>)
Text string
The text for this segment.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) text>)
Type ConversationItemInputAudioTranscriptionSegment
The event type, must be `conversation.item.input\_audio\_transcription.segment`.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema)>)
type McpListToolsInProgress struct{…}
Returned when listing MCP tools is in progress for an item.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) mcp_list_tools_in_progress > (schema) > (property) event_id>)
ItemID string
The ID of the MCP list tools item.
[](<#(resource) realtime > (model) mcp_list_tools_in_progress > (schema) > (property) item_id>)
Type McpListToolsInProgress
The event type, must be `mcp\_list\_tools.in\_progress`.
[](<#(resource) realtime > (model) mcp_list_tools_in_progress > (schema) > (property) type>)
[](<#(resource) realtime > (model) mcp_list_tools_in_progress > (schema)>)
type McpListToolsCompleted struct{…}
Returned when listing MCP tools has completed for an item.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) mcp_list_tools_completed > (schema) > (property) event_id>)
ItemID string
The ID of the MCP list tools item.
[](<#(resource) realtime > (model) mcp_list_tools_completed > (schema) > (property) item_id>)
Type McpListToolsCompleted
The event type, must be `mcp\_list\_tools.completed`.
[](<#(resource) realtime > (model) mcp_list_tools_completed > (schema) > (property) type>)
[](<#(resource) realtime > (model) mcp_list_tools_completed > (schema)>)
type McpListToolsFailed struct{…}
Returned when listing MCP tools has failed for an item.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) mcp_list_tools_failed > (schema) > (property) event_id>)
ItemID string
The ID of the MCP list tools item.
[](<#(resource) realtime > (model) mcp_list_tools_failed > (schema) > (property) item_id>)
Type McpListToolsFailed
The event type, must be `mcp\_list\_tools.failed`.
[](<#(resource) realtime > (model) mcp_list_tools_failed > (schema) > (property) type>)
[](<#(resource) realtime > (model) mcp_list_tools_failed > (schema)>)
type ResponseMcpCallArgumentsDelta struct{…}
Returned when MCP tool call arguments are updated during response generation.
Delta string
The JSON-encoded arguments delta.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) delta>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) event_id>)
ItemID string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) response_id>)
Type ResponseMcpCallArgumentsDelta
The event type, must be `response.mcp\_call\_arguments.delta`.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) type>)
Obfuscation stringOptional
If present, indicates the delta text was obfuscated.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) obfuscation>)
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema)>)
type ResponseMcpCallArgumentsDone struct{…}
Returned when MCP tool call arguments are finalized during response generation.
Arguments string
The final JSON-encoded arguments string.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) arguments>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) event_id>)
ItemID string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) response_id>)
Type ResponseMcpCallArgumentsDone
The event type, must be `response.mcp\_call\_arguments.done`.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema)>)
type ResponseMcpCallInProgress struct{…}
Returned when an MCP tool call has started and is in progress.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema) > (property) event_id>)
ItemID string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema) > (property) output_index>)
Type ResponseMcpCallInProgress
The event type, must be `response.mcp\_call.in\_progress`.
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema)>)
type ResponseMcpCallCompleted struct{…}
Returned when an MCP tool call has completed successfully.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema) > (property) event_id>)
ItemID string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema) > (property) output_index>)
Type ResponseMcpCallCompleted
The event type, must be `response.mcp\_call.completed`.
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema)>)
type ResponseMcpCallFailed struct{…}
Returned when an MCP tool call has failed.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema) > (property) event_id>)
ItemID string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema) > (property) output_index>)
Type ResponseMcpCallFailed
The event type, must be `response.mcp\_call.failed`.
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema)>)
[](<#(resource) realtime > (model) realtime_server_event > (schema)>)
type RealtimeSession struct{…}
Realtime session object for the beta interface.
ID stringOptional
Unique identifier for the session that looks like `sess\_1234567890abcdef`.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) id>)
ExpiresAt int64Optional
Expiration timestamp for the session, in seconds since epoch.
formatunixtime
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) expires_at>)
Include []stringOptional
Additional fields to include in server outputs.
* `item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) include>)
InputAudioFormat RealtimeSessionInputAudioFormatOptional
The format of input audio. Options are `pcm16`, `g711\_ulaw`, or `g711\_alaw`.
For `pcm16`, input audio must be 16-bit PCM at a 24kHz sample rate,
single channel (mono), and little-endian byte order.
One of the following:
const RealtimeSessionInputAudioFormatPcm16 RealtimeSessionInputAudioFormat = "pcm16"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) input_audio_format > (member) 0>)
const RealtimeSessionInputAudioFormatG711Ulaw RealtimeSessionInputAudioFormat = "g711\_ulaw"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) input_audio_format > (member) 1>)
const RealtimeSessionInputAudioFormatG711Alaw RealtimeSessionInputAudioFormat = "g711\_alaw"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) input_audio_format > (member) 2>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) input_audio_format>)
InputAudioNoiseReduction RealtimeSessionInputAudioNoiseReductionOptional
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
Type [NoiseReductionType](</api/reference/go/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)Optional
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) input_audio_noise_reduction > (property) type>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) input_audio_noise_reduction>)
InputAudioTranscription [AudioTranscription](</api/reference/go/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>)Optional
Configuration for input audio transcription, defaults to off and can be set to `null` to turn off once on. Input audio transcription is not native to the model, since the model consumes audio directly. Transcription runs asynchronously through [the /audio/transcriptions endpoint](https://platform.openai.com/docs/api-reference/audio/createTranscription) and should be treated as guidance of input audio content rather than precisely what the model heard. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) input_audio_transcription>)
Instructions stringOptional
The default system instructions (i.e. system message) prepended to model
calls. This field allows the client to guide the model on desired
responses. The model can be instructed on response content and format,
(e.g. “be extremely succinct”, “act friendly”, “here are examples of good
responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion
into your voice”, “laugh frequently”). The instructions are not
guaranteed to be followed by the model, but they provide guidance to the
model on the desired behavior.
Note that the server sets default instructions which will be used if this
field is not set and are visible in the `session.created` event at the
start of the session.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) instructions>)
MaxResponseOutputTokens RealtimeSessionMaxResponseOutputTokensUnionOptional
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
int64
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) max_response_output_tokens > (variant) 0>)
Inf
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) max_response_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) max_response_output_tokens>)
Modalities []stringOptional
The set of modalities the model can respond with. To disable audio,
set this to [“text”].
One of the following:
const RealtimeSessionModalityText RealtimeSessionModality = "text"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) modalities > (items) > (member) 0>)
const RealtimeSessionModalityAudio RealtimeSessionModality = "audio"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) modalities>)
Model RealtimeSessionModelOptional
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 0>)
RealtimeSessionModel
One of the following:
const RealtimeSessionModelGPTRealtime RealtimeSessionModel = "gpt-realtime"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 0>)
const RealtimeSessionModelGPTRealtime1\_5 RealtimeSessionModel = "gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 1>)
const RealtimeSessionModelGPTRealtime2025\_08\_28 RealtimeSessionModel = "gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 2>)
const RealtimeSessionModelGPT4oRealtimePreview RealtimeSessionModel = "gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 3>)
const RealtimeSessionModelGPT4oRealtimePreview2024\_10\_01 RealtimeSessionModel = "gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 4>)
const RealtimeSessionModelGPT4oRealtimePreview2024\_12\_17 RealtimeSessionModel = "gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 5>)
const RealtimeSessionModelGPT4oRealtimePreview2025\_06\_03 RealtimeSessionModel = "gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 6>)
const RealtimeSessionModelGPT4oMiniRealtimePreview RealtimeSessionModel = "gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 7>)
const RealtimeSessionModelGPT4oMiniRealtimePreview2024\_12\_17 RealtimeSessionModel = "gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 8>)
const RealtimeSessionModelGPTRealtimeMini RealtimeSessionModel = "gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 9>)
const RealtimeSessionModelGPTRealtimeMini2025\_10\_06 RealtimeSessionModel = "gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 10>)
const RealtimeSessionModelGPTRealtimeMini2025\_12\_15 RealtimeSessionModel = "gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 11>)
const RealtimeSessionModelGPTAudio1\_5 RealtimeSessionModel = "gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 12>)
const RealtimeSessionModelGPTAudioMini RealtimeSessionModel = "gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 13>)
const RealtimeSessionModelGPTAudioMini2025\_10\_06 RealtimeSessionModel = "gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 14>)
const RealtimeSessionModelGPTAudioMini2025\_12\_15 RealtimeSessionModel = "gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model>)
Object RealtimeSessionObjectOptional
The object type. Always `realtime.session`.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) object>)
OutputAudioFormat RealtimeSessionOutputAudioFormatOptional
The format of output audio. Options are `pcm16`, `g711\_ulaw`, or `g711\_alaw`.
For `pcm16`, output audio is sampled at a rate of 24kHz.
One of the following:
const RealtimeSessionOutputAudioFormatPcm16 RealtimeSessionOutputAudioFormat = "pcm16"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) output_audio_format > (member) 0>)
const RealtimeSessionOutputAudioFormatG711Ulaw RealtimeSessionOutputAudioFormat = "g711\_ulaw"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) output_audio_format > (member) 1>)
const RealtimeSessionOutputAudioFormatG711Alaw RealtimeSessionOutputAudioFormat = "g711\_alaw"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) output_audio_format > (member) 2>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) output_audio_format>)
Prompt [ResponsePrompt](</api/reference/go/resources/responses#(resource) responses > (model) response_prompt > (schema)>)Optional
Reference to a prompt template and its variables.
[Learn more](https://platform.openai.com/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) prompt>)
Speed float64Optional
The speed of the model’s spoken response. 1.0 is the default speed. 0.25 is
the minimum speed. 1.5 is the maximum speed. This value can only be changed
in between model turns, not while a response is in progress.
maximum1.5
minimum0.25
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) speed>)
Temperature float64Optional
Sampling temperature for the model, limited to [0.6, 1.2]. For audio models a temperature of 0.8 is highly recommended for best performance.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) temperature>)
ToolChoice stringOptional
How the model chooses tools. Options are `auto`, `none`, `required`, or
specify a function.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) tool_choice>)
Tools [][RealtimeFunctionTool](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_function_tool > (schema)>)Optional
Tools (functions) available to the model.
Description stringOptional
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
Name stringOptional
The name of the function.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
Parameters anyOptional
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
Type RealtimeFunctionToolTypeOptional
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) tools>)
Tracing RealtimeSessionTracingUnionOptional
Configuration options for tracing. Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
One of the following:
Auto
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) tracing > (variant) 0>)
RealtimeSessionTracingTracingConfiguration
GroupID stringOptional
The group id to attach to this trace to enable filtering and
grouping in the traces dashboard.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) tracing > (variant) 1 > (property) group_id>)
Metadata anyOptional
The arbitrary metadata to attach to this trace to enable
filtering in the traces dashboard.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) tracing > (variant) 1 > (property) metadata>)
WorkflowName stringOptional
The name of the workflow to attach to this trace. This is used to
name the trace in the traces dashboard.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) tracing > (variant) 1 > (property) workflow_name>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) tracing > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) tracing>)
TurnDetection RealtimeSessionTurnDetectionUnionOptional
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with “uhhm”, the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
One of the following:
RealtimeSessionTurnDetectionServerVad
Type ServerVad
Type of turn detection, `server\_vad` to turn on simple Server VAD.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 0 > (property) type>)
CreateResponse boolOptional
Whether or not to automatically generate a response when a VAD stop event occurs. If `interrupt\_response` is set to `false` this may fail to create a response if the model is already responding.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 0 > (property) create_response>)
IdleTimeoutMs int64Optional
Optional timeout after which a model response will be triggered automatically. This is
useful for situations in which a long pause from the user is unexpected, such as a phone
call. The model will effectively prompt the user to continue the conversation based
on the current context.
The timeout value will be applied after the last model response’s audio has finished playing,
i.e. it’s set to the `response.done` time plus audio playback duration.
An `input\_audio\_buffer.timeout\_triggered` event (plus events
associated with the Response) will be emitted when the timeout is reached.
Idle timeout is currently only supported for `server\_vad` mode.
minimum5000
maximum30000
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 0 > (property) idle_timeout_ms>)
InterruptResponse boolOptional
Whether or not to automatically interrupt (cancel) any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs. If `true` then the response will be cancelled, otherwise it will continue until complete.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 0 > (property) interrupt_response>)
PrefixPaddingMs int64Optional
Used only for `server\_vad` mode. Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 0 > (property) prefix_padding_ms>)
SilenceDurationMs int64Optional
Used only for `server\_vad` mode. Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 0 > (property) silence_duration_ms>)
Threshold float64Optional
Used only for `server\_vad` mode. Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 0 > (property) threshold>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 0>)
RealtimeSessionTurnDetectionSemanticVad
Type SemanticVad
Type of turn detection, `semantic\_vad` to turn on Semantic VAD.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1 > (property) type>)
CreateResponse boolOptional
Whether or not to automatically generate a response when a VAD stop event occurs.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1 > (property) create_response>)
Eagerness stringOptional
Used only for `semantic\_vad` mode. The eagerness of the model to respond. `low` will wait longer for the user to continue speaking, `high` will respond more quickly. `auto` is the default and is equivalent to `medium`. `low`, `medium`, and `high` have max timeouts of 8s, 4s, and 2s respectively.
One of the following:
const RealtimeSessionTurnDetectionSemanticVadEagernessLow RealtimeSessionTurnDetectionSemanticVadEagerness = "low"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 0>)
const RealtimeSessionTurnDetectionSemanticVadEagernessMedium RealtimeSessionTurnDetectionSemanticVadEagerness = "medium"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 1>)
const RealtimeSessionTurnDetectionSemanticVadEagernessHigh RealtimeSessionTurnDetectionSemanticVadEagerness = "high"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 2>)
const RealtimeSessionTurnDetectionSemanticVadEagernessAuto RealtimeSessionTurnDetectionSemanticVadEagerness = "auto"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 3>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1 > (property) eagerness>)
InterruptResponse boolOptional
Whether or not to automatically interrupt any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1 > (property) interrupt_response>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection>)
Voice RealtimeSessionVoiceOptional
The voice the model uses to respond. Voice cannot be changed during the
session once the model has responded with audio at least once. Current
voice options are `alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`,
`shimmer`, and `verse`.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 0>)
RealtimeSessionVoice
One of the following:
const RealtimeSessionVoiceAlloy RealtimeSessionVoice = "alloy"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 0>)
const RealtimeSessionVoiceAsh RealtimeSessionVoice = "ash"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 1>)
const RealtimeSessionVoiceBallad RealtimeSessionVoice = "ballad"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 2>)
const RealtimeSessionVoiceCoral RealtimeSessionVoice = "coral"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 3>)
const RealtimeSessionVoiceEcho RealtimeSessionVoice = "echo"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 4>)
const RealtimeSessionVoiceSage RealtimeSessionVoice = "sage"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 5>)
const RealtimeSessionVoiceShimmer RealtimeSessionVoice = "shimmer"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 6>)
const RealtimeSessionVoiceVerse RealtimeSessionVoice = "verse"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 7>)
const RealtimeSessionVoiceMarin RealtimeSessionVoice = "marin"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 8>)
const RealtimeSessionVoiceCedar RealtimeSessionVoice = "cedar"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice>)
[](<#(resource) realtime > (model) realtime_session > (schema)>)
type RealtimeSessionCreateRequest struct{…}
Realtime session object configuration.
Type Realtime
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) type>)
Audio [RealtimeAudioConfig](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_config > (schema)>)Optional
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio>)
Include []stringOptional
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) include>)
Instructions stringOptional
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) instructions>)
MaxOutputTokens RealtimeSessionCreateRequestMaxOutputTokensUnionOptional
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
int64
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 0>)
Inf
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens>)
Model RealtimeSessionCreateRequestModelOptional
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 0>)
RealtimeSessionCreateRequestModel
One of the following:
const RealtimeSessionCreateRequestModelGPTRealtime RealtimeSessionCreateRequestModel = "gpt-realtime"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 0>)
const RealtimeSessionCreateRequestModelGPTRealtime1\_5 RealtimeSessionCreateRequestModel = "gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 1>)
const RealtimeSessionCreateRequestModelGPTRealtime2025\_08\_28 RealtimeSessionCreateRequestModel = "gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 2>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 3>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2024\_10\_01 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 4>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2024\_12\_17 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 5>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2025\_06\_03 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 6>)
const RealtimeSessionCreateRequestModelGPT4oMiniRealtimePreview RealtimeSessionCreateRequestModel = "gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 7>)
const RealtimeSessionCreateRequestModelGPT4oMiniRealtimePreview2024\_12\_17 RealtimeSessionCreateRequestModel = "gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 8>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini RealtimeSessionCreateRequestModel = "gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 9>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini2025\_10\_06 RealtimeSessionCreateRequestModel = "gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 10>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini2025\_12\_15 RealtimeSessionCreateRequestModel = "gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 11>)
const RealtimeSessionCreateRequestModelGPTAudio1\_5 RealtimeSessionCreateRequestModel = "gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 12>)
const RealtimeSessionCreateRequestModelGPTAudioMini RealtimeSessionCreateRequestModel = "gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 13>)
const RealtimeSessionCreateRequestModelGPTAudioMini2025\_10\_06 RealtimeSessionCreateRequestModel = "gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 14>)
const RealtimeSessionCreateRequestModelGPTAudioMini2025\_12\_15 RealtimeSessionCreateRequestModel = "gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model>)
OutputModalities []stringOptional
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
const RealtimeSessionCreateRequestOutputModalityText RealtimeSessionCreateRequestOutputModality = "text"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 0>)
const RealtimeSessionCreateRequestOutputModalityAudio RealtimeSessionCreateRequestOutputModality = "audio"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities>)
Prompt [ResponsePrompt](</api/reference/go/resources/responses#(resource) responses > (model) response_prompt > (schema)>)Optional
Reference to a prompt template and its variables.
[Learn more](https://platform.openai.com/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt>)
ToolChoice [RealtimeToolChoiceConfigUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)Optional
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice>)
Tools [RealtimeToolsConfig](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tools_config > (schema)>)Optional
Tools available to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools>)
Tracing [RealtimeTracingConfigUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tracing_config > (schema)>)Optional
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing>)
Truncation [RealtimeTruncationUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)Optional
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema)>)
type RealtimeToolChoiceConfigUnion interface{…}
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
One of the following:
type ToolChoiceOptions string
Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or
more tools.
`required` means the model must call one or more tools.
One of the following:
const ToolChoiceOptionsNone [ToolChoiceOptions](</api/reference/go/resources/responses#(resource) responses > (model) tool_choice_options > (schema)>) = "none"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 0>)
const ToolChoiceOptionsAuto [ToolChoiceOptions](</api/reference/go/resources/responses#(resource) responses > (model) tool_choice_options > (schema)>) = "auto"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 1>)
const ToolChoiceOptionsRequired [ToolChoiceOptions](</api/reference/go/resources/responses#(resource) responses > (model) tool_choice_options > (schema)>) = "required"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 2>)
[](<#(resource) responses > (model) tool_choice_options > (schema)>)
type ToolChoiceFunction struct{…}
Use this option to force the model to call a specific function.
Name string
The name of the function to call.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) name>)
Type Function
For function calling, the type is always `function`.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) type>)
[](<#(resource) responses > (model) tool_choice_function > (schema)>)
type ToolChoiceMcp struct{…}
Use this option to force the model to call a specific tool on a remote MCP server.
ServerLabel string
The label of the MCP server to use.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) server_label>)
Type Mcp
For MCP tools, the type is always `mcp`.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) type>)
Name stringOptional
The name of the tool to call on the server.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) name>)
[](<#(resource) responses > (model) tool_choice_mcp > (schema)>)
[](<#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)
type RealtimeToolsConfig [][RealtimeToolsConfigUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tools_config_union > (schema)>)
Tools available to the model.
One of the following:
type RealtimeFunctionTool struct{…}
Description stringOptional
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
Name stringOptional
The name of the function.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
Parameters anyOptional
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
Type RealtimeFunctionToolTypeOptional
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_function_tool > (schema)>)
RealtimeToolsConfigUnionMcp
ServerLabel string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_label>)
Type Mcp
The type of the MCP tool. Always `mcp`.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) type>)
AllowedTools RealtimeToolsConfigUnionMcpAllowedToolsOptional
List of allowed tool names or a filter object.
One of the following:
[]string
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 0>)
RealtimeToolsConfigUnionMcpAllowedToolsMcpToolFilter
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools>)
Authorization stringOptional
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) authorization>)
ConnectorID stringOptional
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](https://platform.openai.com/docs/guides/tools-remote-mcp#connectors).
Currently supported `connector\_id` values are:
* Dropbox: `connector\_dropbox`
* Gmail: `connector\_gmail`
* Google Calendar: `connector\_googlecalendar`
* Google Drive: `connector\_googledrive`
* Microsoft Teams: `connector\_microsoftteams`
* Outlook Calendar: `connector\_outlookcalendar`
* Outlook Email: `connector\_outlookemail`
* SharePoint: `connector\_sharepoint`
One of the following:
const RealtimeToolsConfigUnionMcpConnectorIDConnectorDropbox RealtimeToolsConfigUnionMcpConnectorID = "connector\_dropbox"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 0>)
const RealtimeToolsConfigUnionMcpConnectorIDConnectorGmail RealtimeToolsConfigUnionMcpConnectorID = "connector\_gmail"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 1>)
const RealtimeToolsConfigUnionMcpConnectorIDConnectorGooglecalendar RealtimeToolsConfigUnionMcpConnectorID = "connector\_googlecalendar"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 2>)
const RealtimeToolsConfigUnionMcpConnectorIDConnectorGoogledrive RealtimeToolsConfigUnionMcpConnectorID = "connector\_googledrive"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 3>)
const RealtimeToolsConfigUnionMcpConnectorIDConnectorMicrosoftteams RealtimeToolsConfigUnionMcpConnectorID = "connector\_microsoftteams"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 4>)
const RealtimeToolsConfigUnionMcpConnectorIDConnectorOutlookcalendar RealtimeToolsConfigUnionMcpConnectorID = "connector\_outlookcalendar"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 5>)
const RealtimeToolsConfigUnionMcpConnectorIDConnectorOutlookemail RealtimeToolsConfigUnionMcpConnectorID = "connector\_outlookemail"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 6>)
const RealtimeToolsConfigUnionMcpConnectorIDConnectorSharepoint RealtimeToolsConfigUnionMcpConnectorID = "connector\_sharepoint"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 7>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id>)
DeferLoading boolOptional
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) defer_loading>)
Headers map[string, string]Optional
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) headers>)
RequireApproval RealtimeToolsConfigUnionMcpRequireApprovalOptional
Specify which of the MCP server’s tools require approval.
One of the following:
RealtimeToolsConfigUnionMcpRequireApprovalMcpToolApprovalFilter
Always RealtimeToolsConfigUnionMcpRequireApprovalMcpToolApprovalFilterAlwaysOptional
A filter object to specify which tools are allowed.
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always>)
Never RealtimeToolsConfigUnionMcpRequireApprovalMcpToolApprovalFilterNeverOptional
A filter object to specify which tools are allowed.
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0>)
string
One of the following:
const RealtimeToolsConfigUnionMcpRequireApprovalMcpToolApprovalSettingAlways RealtimeToolsConfigUnionMcpRequireApprovalMcpToolApprovalSetting = "always"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 0>)
const RealtimeToolsConfigUnionMcpRequireApprovalMcpToolApprovalSettingNever RealtimeToolsConfigUnionMcpRequireApprovalMcpToolApprovalSetting = "never"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval>)
ServerDescription stringOptional
Optional description of the MCP server, used to provide more context.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_description>)
ServerURL stringOptional
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_url>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_tools_config > (schema)>)
type RealtimeToolsConfigUnion interface{…}
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](https://platform.openai.com/docs/guides/tools-remote-mcp).
One of the following:
type RealtimeFunctionTool struct{…}
Description stringOptional
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
Name stringOptional
The name of the function.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
Parameters anyOptional
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
Type RealtimeFunctionToolTypeOptional
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_function_tool > (schema)>)
RealtimeToolsConfigUnionMcp
ServerLabel string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_label>)
Type Mcp
The type of the MCP tool. Always `mcp`.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) type>)
AllowedTools RealtimeToolsConfigUnionMcpAllowedToolsOptional
List of allowed tool names or a filter object.
One of the following:
[]string
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 0>)
RealtimeToolsConfigUnionMcpAllowedToolsMcpToolFilter
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools>)
Authorization stringOptional
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) authorization>)
ConnectorID stringOptional
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](https://platform.openai.com/docs/guides/tools-remote-mcp#connectors).
Currently supported `connector\_id` values are:
* Dropbox: `connector\_dropbox`
* Gmail: `connector\_gmail`
* Google Calendar: `connector\_googlecalendar`
* Google Drive: `connector\_googledrive`
* Microsoft Teams: `connector\_microsoftteams`
* Outlook Calendar: `connector\_outlookcalendar`
* Outlook Email: `connector\_outlookemail`
* SharePoint: `connector\_sharepoint`
One of the following:
const RealtimeToolsConfigUnionMcpConnectorIDConnectorDropbox RealtimeToolsConfigUnionMcpConnectorID = "connector\_dropbox"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 0>)
const RealtimeToolsConfigUnionMcpConnectorIDConnectorGmail RealtimeToolsConfigUnionMcpConnectorID = "connector\_gmail"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 1>)
const RealtimeToolsConfigUnionMcpConnectorIDConnectorGooglecalendar RealtimeToolsConfigUnionMcpConnectorID = "connector\_googlecalendar"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 2>)
const RealtimeToolsConfigUnionMcpConnectorIDConnectorGoogledrive RealtimeToolsConfigUnionMcpConnectorID = "connector\_googledrive"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 3>)
const RealtimeToolsConfigUnionMcpConnectorIDConnectorMicrosoftteams RealtimeToolsConfigUnionMcpConnectorID = "connector\_microsoftteams"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 4>)
const RealtimeToolsConfigUnionMcpConnectorIDConnectorOutlookcalendar RealtimeToolsConfigUnionMcpConnectorID = "connector\_outlookcalendar"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 5>)
const RealtimeToolsConfigUnionMcpConnectorIDConnectorOutlookemail RealtimeToolsConfigUnionMcpConnectorID = "connector\_outlookemail"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 6>)
const RealtimeToolsConfigUnionMcpConnectorIDConnectorSharepoint RealtimeToolsConfigUnionMcpConnectorID = "connector\_sharepoint"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 7>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id>)
DeferLoading boolOptional
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) defer_loading>)
Headers map[string, string]Optional
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) headers>)
RequireApproval RealtimeToolsConfigUnionMcpRequireApprovalOptional
Specify which of the MCP server’s tools require approval.
One of the following:
RealtimeToolsConfigUnionMcpRequireApprovalMcpToolApprovalFilter
Always RealtimeToolsConfigUnionMcpRequireApprovalMcpToolApprovalFilterAlwaysOptional
A filter object to specify which tools are allowed.
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always>)
Never RealtimeToolsConfigUnionMcpRequireApprovalMcpToolApprovalFilterNeverOptional
A filter object to specify which tools are allowed.
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0>)
string
One of the following:
const RealtimeToolsConfigUnionMcpRequireApprovalMcpToolApprovalSettingAlways RealtimeToolsConfigUnionMcpRequireApprovalMcpToolApprovalSetting = "always"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 0>)
const RealtimeToolsConfigUnionMcpRequireApprovalMcpToolApprovalSettingNever RealtimeToolsConfigUnionMcpRequireApprovalMcpToolApprovalSetting = "never"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval>)
ServerDescription stringOptional
Optional description of the MCP server, used to provide more context.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_description>)
ServerURL stringOptional
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_url>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema)>)
type RealtimeTracingConfigUnion interface{…}
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
One of the following:
Auto
[](<#(resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 0>)
RealtimeTracingConfigTracingConfiguration
GroupID stringOptional
The group id to attach to this trace to enable filtering and
grouping in the Traces Dashboard.
[](<#(resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 1 > (property) group_id>)
Metadata anyOptional
The arbitrary metadata to attach to this trace to enable
filtering in the Traces Dashboard.
[](<#(resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 1 > (property) metadata>)
WorkflowName stringOptional
The name of the workflow to attach to this trace. This is used to
name the trace in the Traces Dashboard.
[](<#(resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 1 > (property) workflow_name>)
[](<#(resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_tracing_config > (schema)>)
type RealtimeTranscriptionSessionAudio struct{…}
Configuration for input and output audio.
Input [RealtimeTranscriptionSessionAudioInput](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema)>)Optional
[](<#(resource) realtime > (model) realtime_transcription_session_audio > (schema) > (property) input>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>)
type RealtimeTranscriptionSessionAudioInput struct{…}
Format [RealtimeAudioFormatsUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)Optional
The PCM audio format. Only a 24kHz sample rate is supported.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format>)
NoiseReduction RealtimeTranscriptionSessionAudioInputNoiseReductionOptional
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
Type [NoiseReductionType](</api/reference/go/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)Optional
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) noise_reduction > (property) type>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) noise_reduction>)
Transcription [AudioTranscription](</api/reference/go/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>)Optional
Configuration for input audio transcription, defaults to off and can be set to `null` to turn off once on. Input audio transcription is not native to the model, since the model consumes audio directly. Transcription runs asynchronously through [the /audio/transcriptions endpoint](https://platform.openai.com/docs/api-reference/audio/createTranscription) and should be treated as guidance of input audio content rather than precisely what the model heard. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription>)
TurnDetection [RealtimeTranscriptionSessionAudioInputTurnDetectionUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema)>)Optional
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with “uhhm”, the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema)>)
type RealtimeTranscriptionSessionAudioInputTurnDetectionUnion interface{…}
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with “uhhm”, the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
One of the following:
RealtimeTranscriptionSessionAudioInputTurnDetectionServerVad
Type ServerVad
Type of turn detection, `server\_vad` to turn on simple Server VAD.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) type>)
CreateResponse boolOptional
Whether or not to automatically generate a response when a VAD stop event occurs. If `interrupt\_response` is set to `false` this may fail to create a response if the model is already responding.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) create_response>)
IdleTimeoutMs int64Optional
Optional timeout after which a model response will be triggered automatically. This is
useful for situations in which a long pause from the user is unexpected, such as a phone
call. The model will effectively prompt the user to continue the conversation based
on the current context.
The timeout value will be applied after the last model response’s audio has finished playing,
i.e. it’s set to the `response.done` time plus audio playback duration.
An `input\_audio\_buffer.timeout\_triggered` event (plus events
associated with the Response) will be emitted when the timeout is reached.
Idle timeout is currently only supported for `server\_vad` mode.
minimum5000
maximum30000
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) idle_timeout_ms>)
InterruptResponse boolOptional
Whether or not to automatically interrupt (cancel) any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs. If `true` then the response will be cancelled, otherwise it will continue until complete.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) interrupt_response>)
PrefixPaddingMs int64Optional
Used only for `server\_vad` mode. Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) prefix_padding_ms>)
SilenceDurationMs int64Optional
Used only for `server\_vad` mode. Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) silence_duration_ms>)
Threshold float64Optional
Used only for `server\_vad` mode. Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) threshold>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0>)
RealtimeTranscriptionSessionAudioInputTurnDetectionSemanticVad
Type SemanticVad
Type of turn detection, `semantic\_vad` to turn on Semantic VAD.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) type>)
CreateResponse boolOptional
Whether or not to automatically generate a response when a VAD stop event occurs.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) create_response>)
Eagerness stringOptional
Used only for `semantic\_vad` mode. The eagerness of the model to respond. `low` will wait longer for the user to continue speaking, `high` will respond more quickly. `auto` is the default and is equivalent to `medium`. `low`, `medium`, and `high` have max timeouts of 8s, 4s, and 2s respectively.
One of the following:
const RealtimeTranscriptionSessionAudioInputTurnDetectionSemanticVadEagernessLow RealtimeTranscriptionSessionAudioInputTurnDetectionSemanticVadEagerness = "low"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 0>)
const RealtimeTranscriptionSessionAudioInputTurnDetectionSemanticVadEagernessMedium RealtimeTranscriptionSessionAudioInputTurnDetectionSemanticVadEagerness = "medium"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 1>)
const RealtimeTranscriptionSessionAudioInputTurnDetectionSemanticVadEagernessHigh RealtimeTranscriptionSessionAudioInputTurnDetectionSemanticVadEagerness = "high"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 2>)
const RealtimeTranscriptionSessionAudioInputTurnDetectionSemanticVadEagernessAuto RealtimeTranscriptionSessionAudioInputTurnDetectionSemanticVadEagerness = "auto"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 3>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness>)
InterruptResponse boolOptional
Whether or not to automatically interrupt any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) interrupt_response>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema)>)
type RealtimeTranscriptionSessionCreateRequest struct{…}
Realtime transcription session object configuration.
Type Transcription
The type of session to create. Always `transcription` for transcription sessions.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) type>)
Audio [RealtimeTranscriptionSessionAudio](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>)Optional
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio>)
Include []stringOptional
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) include>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>)
type RealtimeTruncationUnion interface{…}
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
One of the following:
type RealtimeTruncationRealtimeTruncationStrategy string
The truncation strategy to use for the session. `auto` is the default truncation strategy. `disabled` will disable truncation and emit errors when the conversation exceeds the input token limit.
One of the following:
const RealtimeTruncationRealtimeTruncationStrategyAuto RealtimeTruncationRealtimeTruncationStrategy = "auto"
[](<#(resource) realtime > (model) realtime_truncation > (schema) > (variant) 0 > (member) 0>)
const RealtimeTruncationRealtimeTruncationStrategyDisabled RealtimeTruncationRealtimeTruncationStrategy = "disabled"
[](<#(resource) realtime > (model) realtime_truncation > (schema) > (variant) 0 > (member) 1>)
[](<#(resource) realtime > (model) realtime_truncation > (schema) > (variant) 0>)
type RealtimeTruncationRetentionRatio struct{…}
Retain a fraction of the conversation tokens when the conversation exceeds the input token limit. This allows you to amortize truncations across multiple turns, which can help improve cached token usage.
RetentionRatio float64
Fraction of post-instruction conversation tokens to retain (`0.0` - `1.0`) when the conversation exceeds the input token limit. Setting this to `0.8` means that messages will be dropped until 80% of the maximum allowed tokens are used. This helps reduce the frequency of truncations and improve cache rates.
minimum0
maximum1
[](<#(resource) realtime > (model) realtime_truncation_retention_ratio > (schema) > (property) retention_ratio>)
Type RetentionRatio
Use retention ratio truncation.
[](<#(resource) realtime > (model) realtime_truncation_retention_ratio > (schema) > (property) type>)
TokenLimits RealtimeTruncationRetentionRatioTokenLimitsOptional
Optional custom token limits for this truncation strategy. If not provided, the model’s default token limits will be used.
PostInstructions int64Optional
Maximum tokens allowed in the conversation after instructions (which including tool definitions). For example, setting this to 5,000 would mean that truncation would occur when the conversation exceeds 5,000 tokens after instructions. This cannot be higher than the model’s context window size minus the maximum output tokens.
minimum0
[](<#(resource) realtime > (model) realtime_truncation_retention_ratio > (schema) > (property) token_limits > (property) post_instructions>)
[](<#(resource) realtime > (model) realtime_truncation_retention_ratio > (schema) > (property) token_limits>)
[](<#(resource) realtime > (model) realtime_truncation_retention_ratio > (schema)>)
[](<#(resource) realtime > (model) realtime_truncation > (schema)>)
type RealtimeTruncationRetentionRatio struct{…}
Retain a fraction of the conversation tokens when the conversation exceeds the input token limit. This allows you to amortize truncations across multiple turns, which can help improve cached token usage.
RetentionRatio float64
Fraction of post-instruction conversation tokens to retain (`0.0` - `1.0`) when the conversation exceeds the input token limit. Setting this to `0.8` means that messages will be dropped until 80% of the maximum allowed tokens are used. This helps reduce the frequency of truncations and improve cache rates.
minimum0
maximum1
[](<#(resource) realtime > (model) realtime_truncation_retention_ratio > (schema) > (property) retention_ratio>)
Type RetentionRatio
Use retention ratio truncation.
[](<#(resource) realtime > (model) realtime_truncation_retention_ratio > (schema) > (property) type>)
TokenLimits RealtimeTruncationRetentionRatioTokenLimitsOptional
Optional custom token limits for this truncation strategy. If not provided, the model’s default token limits will be used.
PostInstructions int64Optional
Maximum tokens allowed in the conversation after instructions (which including tool definitions). For example, setting this to 5,000 would mean that truncation would occur when the conversation exceeds 5,000 tokens after instructions. This cannot be higher than the model’s context window size minus the maximum output tokens.
minimum0
[](<#(resource) realtime > (model) realtime_truncation_retention_ratio > (schema) > (property) token_limits > (property) post_instructions>)
[](<#(resource) realtime > (model) realtime_truncation_retention_ratio > (schema) > (property) token_limits>)
[](<#(resource) realtime > (model) realtime_truncation_retention_ratio > (schema)>)
type ResponseAudioDeltaEvent struct{…}
Returned when the model-generated audio is updated.
ContentIndex int64
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) content_index>)
Delta string
Base64-encoded audio data delta.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) delta>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) event_id>)
ItemID string
The ID of the item.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) response_id>)
Type ResponseOutputAudioDelta
The event type, must be `response.output\_audio.delta`.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_audio_delta_event > (schema)>)
type ResponseAudioDoneEvent struct{…}
Returned when the model-generated audio is done. Also emitted when a Response
is interrupted, incomplete, or cancelled.
ContentIndex int64
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) content_index>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) event_id>)
ItemID string
The ID of the item.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) response_id>)
Type ResponseOutputAudioDone
The event type, must be `response.output\_audio.done`.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_audio_done_event > (schema)>)
type ResponseAudioTranscriptDeltaEvent struct{…}
Returned when the model-generated transcription of audio output is updated.
ContentIndex int64
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) content_index>)
Delta string
The transcript delta.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) delta>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) event_id>)
ItemID string
The ID of the item.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) response_id>)
Type ResponseOutputAudioTranscriptDelta
The event type, must be `response.output\_audio\_transcript.delta`.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema)>)
type ResponseAudioTranscriptDoneEvent struct{…}
Returned when the model-generated transcription of audio output is done
streaming. Also emitted when a Response is interrupted, incomplete, or
cancelled.
ContentIndex int64
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) content_index>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) event_id>)
ItemID string
The ID of the item.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) response_id>)
Transcript string
The final transcript of the audio.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) transcript>)
Type ResponseOutputAudioTranscriptDone
The event type, must be `response.output\_audio\_transcript.done`.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema)>)
type ResponseCancelEvent struct{…}
Send this event to cancel an in-progress response. The server will respond
with a `response.done` event with a status of `response.status=cancelled`. If
there is no response to cancel, the server will respond with an error. It’s safe
to call `response.cancel` even if no response is in progress, an error will be
returned the session will remain unaffected.
Type ResponseCancel
The event type, must be `response.cancel`.
[](<#(resource) realtime > (model) response_cancel_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) response_cancel_event > (schema) > (property) event_id>)
ResponseID stringOptional
A specific response ID to cancel - if not provided, will cancel an
in-progress response in the default conversation.
[](<#(resource) realtime > (model) response_cancel_event > (schema) > (property) response_id>)
[](<#(resource) realtime > (model) response_cancel_event > (schema)>)
type ResponseContentPartAddedEvent struct{…}
Returned when a new content part is added to an assistant message item during
response generation.
ContentIndex int64
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) content_index>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) event_id>)
ItemID string
The ID of the item to which the content part was added.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) output_index>)
Part ResponseContentPartAddedEventPart
The content part that was added.
Audio stringOptional
Base64-encoded audio data (if type is “audio”).
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) audio>)
Text stringOptional
The text content (if type is “text”).
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) text>)
Transcript stringOptional
The transcript of the audio (if type is “audio”).
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) transcript>)
Type stringOptional
The content type (“text”, “audio”).
One of the following:
const ResponseContentPartAddedEventPartTypeText ResponseContentPartAddedEventPartType = "text"
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) type > (member) 0>)
const ResponseContentPartAddedEventPartTypeAudio ResponseContentPartAddedEventPartType = "audio"
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) type > (member) 1>)
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) type>)
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) response_id>)
Type ResponseContentPartAdded
The event type, must be `response.content\_part.added`.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_content_part_added_event > (schema)>)
type ResponseContentPartDoneEvent struct{…}
Returned when a content part is done streaming in an assistant message item.
Also emitted when a Response is interrupted, incomplete, or cancelled.
ContentIndex int64
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) content_index>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) event_id>)
ItemID string
The ID of the item.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) output_index>)
Part ResponseContentPartDoneEventPart
The content part that is done.
Audio stringOptional
Base64-encoded audio data (if type is “audio”).
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) audio>)
Text stringOptional
The text content (if type is “text”).
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) text>)
Transcript stringOptional
The transcript of the audio (if type is “audio”).
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) transcript>)
Type stringOptional
The content type (“text”, “audio”).
One of the following:
const ResponseContentPartDoneEventPartTypeText ResponseContentPartDoneEventPartType = "text"
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) type > (member) 0>)
const ResponseContentPartDoneEventPartTypeAudio ResponseContentPartDoneEventPartType = "audio"
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) type > (member) 1>)
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) type>)
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) response_id>)
Type ResponseContentPartDone
The event type, must be `response.content\_part.done`.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_content_part_done_event > (schema)>)
type ResponseCreateEvent struct{…}
This event instructs the server to create a Response, which means triggering
model inference. When in Server VAD mode, the server will create Responses
automatically.
A Response will include at least one Item, and may have two, in which case
the second will be a function call. These Items will be appended to the
conversation history by default.
The server will respond with a `response.created` event, events for Items
and content created, and finally a `response.done` event to indicate the
Response is complete.
The `response.create` event includes inference configuration like
`instructions` and `tools`. If these are set, they will override the Session’s
configuration for this Response only.
Responses can be created out-of-band of the default Conversation, meaning that they can
have arbitrary input, and it’s possible to disable writing the output to the Conversation.
Only one Response can write to the default Conversation at a time, but otherwise multiple
Responses can be created in parallel. The `metadata` field is a good way to disambiguate
multiple simultaneous Responses.
Clients can set `conversation` to `none` to create a Response that does not write to the default
Conversation. Arbitrary input can be provided with the `input` field, which is an array accepting
raw Items and references to existing Items.
Type ResponseCreate
The event type, must be `response.create`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) event_id>)
Response [RealtimeResponseCreateParamsResp](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_response_create_params > (schema)>)Optional
Create a new Realtime response with these parameters
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response>)
[](<#(resource) realtime > (model) response_create_event > (schema)>)
type ResponseCreatedEvent struct{…}
Returned when a new Response is created. The first event of response creation,
where the response is in an initial state of `in\_progress`.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_created_event > (schema) > (property) event_id>)
Response [RealtimeResponse](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_response > (schema)>)
The response resource.
[](<#(resource) realtime > (model) response_created_event > (schema) > (property) response>)
Type ResponseCreated
The event type, must be `response.created`.
[](<#(resource) realtime > (model) response_created_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_created_event > (schema)>)
type ResponseDoneEvent struct{…}
Returned when a Response is done streaming. Always emitted, no matter the
final state. The Response object included in the `response.done` event will
include all output Items in the Response but will omit the raw audio data.
Clients should check the `status` field of the Response to determine if it was successful
(`completed`) or if there was another outcome: `cancelled`, `failed`, or `incomplete`.
A response will contain all output items that were generated during the response, excluding
any audio content.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_done_event > (schema) > (property) event_id>)
Response [RealtimeResponse](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_response > (schema)>)
The response resource.
[](<#(resource) realtime > (model) response_done_event > (schema) > (property) response>)
Type ResponseDone
The event type, must be `response.done`.
[](<#(resource) realtime > (model) response_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_done_event > (schema)>)
type ResponseFunctionCallArgumentsDeltaEvent struct{…}
Returned when the model-generated function call arguments are updated.
CallID string
The ID of the function call.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) call_id>)
Delta string
The arguments delta as a JSON string.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) delta>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) event_id>)
ItemID string
The ID of the function call item.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) response_id>)
Type ResponseFunctionCallArgumentsDelta
The event type, must be `response.function\_call\_arguments.delta`.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema)>)
type ResponseFunctionCallArgumentsDoneEvent struct{…}
Returned when the model-generated function call arguments are done streaming.
Also emitted when a Response is interrupted, incomplete, or cancelled.
Arguments string
The final arguments as a JSON string.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) arguments>)
CallID string
The ID of the function call.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) call_id>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) event_id>)
ItemID string
The ID of the function call item.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) item_id>)
Name string
The name of the function that was called.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) name>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) response_id>)
Type ResponseFunctionCallArgumentsDone
The event type, must be `response.function\_call\_arguments.done`.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema)>)
type ResponseMcpCallArgumentsDelta struct{…}
Returned when MCP tool call arguments are updated during response generation.
Delta string
The JSON-encoded arguments delta.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) delta>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) event_id>)
ItemID string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) response_id>)
Type ResponseMcpCallArgumentsDelta
The event type, must be `response.mcp\_call\_arguments.delta`.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) type>)
Obfuscation stringOptional
If present, indicates the delta text was obfuscated.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) obfuscation>)
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema)>)
type ResponseMcpCallArgumentsDone struct{…}
Returned when MCP tool call arguments are finalized during response generation.
Arguments string
The final JSON-encoded arguments string.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) arguments>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) event_id>)
ItemID string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) response_id>)
Type ResponseMcpCallArgumentsDone
The event type, must be `response.mcp\_call\_arguments.done`.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema)>)
type ResponseMcpCallCompleted struct{…}
Returned when an MCP tool call has completed successfully.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema) > (property) event_id>)
ItemID string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema) > (property) output_index>)
Type ResponseMcpCallCompleted
The event type, must be `response.mcp\_call.completed`.
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema)>)
type ResponseMcpCallFailed struct{…}
Returned when an MCP tool call has failed.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema) > (property) event_id>)
ItemID string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema) > (property) output_index>)
Type ResponseMcpCallFailed
The event type, must be `response.mcp\_call.failed`.
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema)>)
type ResponseMcpCallInProgress struct{…}
Returned when an MCP tool call has started and is in progress.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema) > (property) event_id>)
ItemID string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema) > (property) output_index>)
Type ResponseMcpCallInProgress
The event type, must be `response.mcp\_call.in\_progress`.
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema)>)
type ResponseOutputItemAddedEvent struct{…}
Returned when a new Item is created during Response generation.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) event_id>)
Item [ConversationItemUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) item>)
OutputIndex int64
The index of the output item in the Response.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) output_index>)
ResponseID string
The ID of the Response to which the item belongs.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) response_id>)
Type ResponseOutputItemAdded
The event type, must be `response.output\_item.added`.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_output_item_added_event > (schema)>)
type ResponseOutputItemDoneEvent struct{…}
Returned when an Item is done streaming. Also emitted when a Response is
interrupted, incomplete, or cancelled.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) event_id>)
Item [ConversationItemUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) item>)
OutputIndex int64
The index of the output item in the Response.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) output_index>)
ResponseID string
The ID of the Response to which the item belongs.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) response_id>)
Type ResponseOutputItemDone
The event type, must be `response.output\_item.done`.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_output_item_done_event > (schema)>)
type ResponseTextDeltaEvent struct{…}
Returned when the text value of an “output\_text” content part is updated.
ContentIndex int64
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) content_index>)
Delta string
The text delta.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) delta>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) event_id>)
ItemID string
The ID of the item.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) response_id>)
Type ResponseOutputTextDelta
The event type, must be `response.output\_text.delta`.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_text_delta_event > (schema)>)
type ResponseTextDoneEvent struct{…}
Returned when the text value of an “output\_text” content part is done streaming. Also
emitted when a Response is interrupted, incomplete, or cancelled.
ContentIndex int64
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) content_index>)
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) event_id>)
ItemID string
The ID of the item.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) item_id>)
OutputIndex int64
The index of the output item in the response.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) output_index>)
ResponseID string
The ID of the response.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) response_id>)
Text string
The final text content.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) text>)
Type ResponseOutputTextDone
The event type, must be `response.output\_text.done`.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_text_done_event > (schema)>)
type SessionCreatedEvent struct{…}
Returned when a Session is created. Emitted automatically when a new
connection is established as the first server event. This event will contain
the default Session configuration.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) session_created_event > (schema) > (property) event_id>)
Session SessionCreatedEventSessionUnion
The session configuration.
One of the following:
type RealtimeSessionCreateRequest struct{…}
Realtime session object configuration.
Type Realtime
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) type>)
Audio [RealtimeAudioConfig](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_config > (schema)>)Optional
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio>)
Include []stringOptional
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) include>)
Instructions stringOptional
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) instructions>)
MaxOutputTokens RealtimeSessionCreateRequestMaxOutputTokensUnionOptional
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
int64
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 0>)
Inf
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens>)
Model RealtimeSessionCreateRequestModelOptional
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 0>)
RealtimeSessionCreateRequestModel
One of the following:
const RealtimeSessionCreateRequestModelGPTRealtime RealtimeSessionCreateRequestModel = "gpt-realtime"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 0>)
const RealtimeSessionCreateRequestModelGPTRealtime1\_5 RealtimeSessionCreateRequestModel = "gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 1>)
const RealtimeSessionCreateRequestModelGPTRealtime2025\_08\_28 RealtimeSessionCreateRequestModel = "gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 2>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 3>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2024\_10\_01 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 4>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2024\_12\_17 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 5>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2025\_06\_03 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 6>)
const RealtimeSessionCreateRequestModelGPT4oMiniRealtimePreview RealtimeSessionCreateRequestModel = "gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 7>)
const RealtimeSessionCreateRequestModelGPT4oMiniRealtimePreview2024\_12\_17 RealtimeSessionCreateRequestModel = "gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 8>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini RealtimeSessionCreateRequestModel = "gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 9>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini2025\_10\_06 RealtimeSessionCreateRequestModel = "gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 10>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini2025\_12\_15 RealtimeSessionCreateRequestModel = "gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 11>)
const RealtimeSessionCreateRequestModelGPTAudio1\_5 RealtimeSessionCreateRequestModel = "gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 12>)
const RealtimeSessionCreateRequestModelGPTAudioMini RealtimeSessionCreateRequestModel = "gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 13>)
const RealtimeSessionCreateRequestModelGPTAudioMini2025\_10\_06 RealtimeSessionCreateRequestModel = "gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 14>)
const RealtimeSessionCreateRequestModelGPTAudioMini2025\_12\_15 RealtimeSessionCreateRequestModel = "gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model>)
OutputModalities []stringOptional
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
const RealtimeSessionCreateRequestOutputModalityText RealtimeSessionCreateRequestOutputModality = "text"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 0>)
const RealtimeSessionCreateRequestOutputModalityAudio RealtimeSessionCreateRequestOutputModality = "audio"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities>)
Prompt [ResponsePrompt](</api/reference/go/resources/responses#(resource) responses > (model) response_prompt > (schema)>)Optional
Reference to a prompt template and its variables.
[Learn more](https://platform.openai.com/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt>)
ToolChoice [RealtimeToolChoiceConfigUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)Optional
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice>)
Tools [RealtimeToolsConfig](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tools_config > (schema)>)Optional
Tools available to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools>)
Tracing [RealtimeTracingConfigUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tracing_config > (schema)>)Optional
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing>)
Truncation [RealtimeTruncationUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)Optional
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema)>)
type RealtimeTranscriptionSessionCreateRequest struct{…}
Realtime transcription session object configuration.
Type Transcription
The type of session to create. Always `transcription` for transcription sessions.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) type>)
Audio [RealtimeTranscriptionSessionAudio](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>)Optional
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio>)
Include []stringOptional
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) include>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>)
[](<#(resource) realtime > (model) session_created_event > (schema) > (property) session>)
Type SessionCreated
The event type, must be `session.created`.
[](<#(resource) realtime > (model) session_created_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) session_created_event > (schema)>)
type SessionUpdateEvent struct{…}
Send this event to update the session’s configuration.
The client may send this event at any time to update any field
except for `voice` and `model`. `voice` can be updated only if there have been no other audio outputs yet.
When the server receives a `session.update`, it will respond
with a `session.updated` event showing the full, effective configuration.
Only the fields that are present in the `session.update` are updated. To clear a field like
`instructions`, pass an empty string. To clear a field like `tools`, pass an empty array.
To clear a field like `turn\_detection`, pass `null`.
Session SessionUpdateEventSessionUnion
Update the Realtime session. Choose either a realtime
session or a transcription session.
One of the following:
type RealtimeSessionCreateRequest struct{…}
Realtime session object configuration.
Type Realtime
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) type>)
Audio [RealtimeAudioConfig](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_config > (schema)>)Optional
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio>)
Include []stringOptional
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) include>)
Instructions stringOptional
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) instructions>)
MaxOutputTokens RealtimeSessionCreateRequestMaxOutputTokensUnionOptional
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
int64
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 0>)
Inf
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens>)
Model RealtimeSessionCreateRequestModelOptional
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 0>)
RealtimeSessionCreateRequestModel
One of the following:
const RealtimeSessionCreateRequestModelGPTRealtime RealtimeSessionCreateRequestModel = "gpt-realtime"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 0>)
const RealtimeSessionCreateRequestModelGPTRealtime1\_5 RealtimeSessionCreateRequestModel = "gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 1>)
const RealtimeSessionCreateRequestModelGPTRealtime2025\_08\_28 RealtimeSessionCreateRequestModel = "gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 2>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 3>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2024\_10\_01 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 4>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2024\_12\_17 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 5>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2025\_06\_03 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 6>)
const RealtimeSessionCreateRequestModelGPT4oMiniRealtimePreview RealtimeSessionCreateRequestModel = "gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 7>)
const RealtimeSessionCreateRequestModelGPT4oMiniRealtimePreview2024\_12\_17 RealtimeSessionCreateRequestModel = "gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 8>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini RealtimeSessionCreateRequestModel = "gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 9>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini2025\_10\_06 RealtimeSessionCreateRequestModel = "gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 10>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini2025\_12\_15 RealtimeSessionCreateRequestModel = "gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 11>)
const RealtimeSessionCreateRequestModelGPTAudio1\_5 RealtimeSessionCreateRequestModel = "gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 12>)
const RealtimeSessionCreateRequestModelGPTAudioMini RealtimeSessionCreateRequestModel = "gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 13>)
const RealtimeSessionCreateRequestModelGPTAudioMini2025\_10\_06 RealtimeSessionCreateRequestModel = "gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 14>)
const RealtimeSessionCreateRequestModelGPTAudioMini2025\_12\_15 RealtimeSessionCreateRequestModel = "gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model>)
OutputModalities []stringOptional
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
const RealtimeSessionCreateRequestOutputModalityText RealtimeSessionCreateRequestOutputModality = "text"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 0>)
const RealtimeSessionCreateRequestOutputModalityAudio RealtimeSessionCreateRequestOutputModality = "audio"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities>)
Prompt [ResponsePrompt](</api/reference/go/resources/responses#(resource) responses > (model) response_prompt > (schema)>)Optional
Reference to a prompt template and its variables.
[Learn more](https://platform.openai.com/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt>)
ToolChoice [RealtimeToolChoiceConfigUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)Optional
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice>)
Tools [RealtimeToolsConfig](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tools_config > (schema)>)Optional
Tools available to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools>)
Tracing [RealtimeTracingConfigUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tracing_config > (schema)>)Optional
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing>)
Truncation [RealtimeTruncationUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)Optional
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema)>)
type RealtimeTranscriptionSessionCreateRequest struct{…}
Realtime transcription session object configuration.
Type Transcription
The type of session to create. Always `transcription` for transcription sessions.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) type>)
Audio [RealtimeTranscriptionSessionAudio](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>)Optional
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio>)
Include []stringOptional
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) include>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>)
[](<#(resource) realtime > (model) session_update_event > (schema) > (property) session>)
Type SessionUpdate
The event type, must be `session.update`.
[](<#(resource) realtime > (model) session_update_event > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event. This is an arbitrary string that a client may assign. It will be passed back if there is an error with the event, but the corresponding `session.updated` event will not include it.
maxLength512
[](<#(resource) realtime > (model) session_update_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) session_update_event > (schema)>)
type SessionUpdatedEvent struct{…}
Returned when a session is updated with a `session.update` event, unless
there is an error.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) session_updated_event > (schema) > (property) event_id>)
Session SessionUpdatedEventSessionUnion
The session configuration.
One of the following:
type RealtimeSessionCreateRequest struct{…}
Realtime session object configuration.
Type Realtime
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) type>)
Audio [RealtimeAudioConfig](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_config > (schema)>)Optional
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio>)
Include []stringOptional
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) include>)
Instructions stringOptional
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) instructions>)
MaxOutputTokens RealtimeSessionCreateRequestMaxOutputTokensUnionOptional
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
int64
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 0>)
Inf
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens>)
Model RealtimeSessionCreateRequestModelOptional
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 0>)
RealtimeSessionCreateRequestModel
One of the following:
const RealtimeSessionCreateRequestModelGPTRealtime RealtimeSessionCreateRequestModel = "gpt-realtime"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 0>)
const RealtimeSessionCreateRequestModelGPTRealtime1\_5 RealtimeSessionCreateRequestModel = "gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 1>)
const RealtimeSessionCreateRequestModelGPTRealtime2025\_08\_28 RealtimeSessionCreateRequestModel = "gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 2>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 3>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2024\_10\_01 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 4>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2024\_12\_17 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 5>)
const RealtimeSessionCreateRequestModelGPT4oRealtimePreview2025\_06\_03 RealtimeSessionCreateRequestModel = "gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 6>)
const RealtimeSessionCreateRequestModelGPT4oMiniRealtimePreview RealtimeSessionCreateRequestModel = "gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 7>)
const RealtimeSessionCreateRequestModelGPT4oMiniRealtimePreview2024\_12\_17 RealtimeSessionCreateRequestModel = "gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 8>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini RealtimeSessionCreateRequestModel = "gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 9>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini2025\_10\_06 RealtimeSessionCreateRequestModel = "gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 10>)
const RealtimeSessionCreateRequestModelGPTRealtimeMini2025\_12\_15 RealtimeSessionCreateRequestModel = "gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 11>)
const RealtimeSessionCreateRequestModelGPTAudio1\_5 RealtimeSessionCreateRequestModel = "gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 12>)
const RealtimeSessionCreateRequestModelGPTAudioMini RealtimeSessionCreateRequestModel = "gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 13>)
const RealtimeSessionCreateRequestModelGPTAudioMini2025\_10\_06 RealtimeSessionCreateRequestModel = "gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 14>)
const RealtimeSessionCreateRequestModelGPTAudioMini2025\_12\_15 RealtimeSessionCreateRequestModel = "gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model>)
OutputModalities []stringOptional
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
const RealtimeSessionCreateRequestOutputModalityText RealtimeSessionCreateRequestOutputModality = "text"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 0>)
const RealtimeSessionCreateRequestOutputModalityAudio RealtimeSessionCreateRequestOutputModality = "audio"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities>)
Prompt [ResponsePrompt](</api/reference/go/resources/responses#(resource) responses > (model) response_prompt > (schema)>)Optional
Reference to a prompt template and its variables.
[Learn more](https://platform.openai.com/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt>)
ToolChoice [RealtimeToolChoiceConfigUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)Optional
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice>)
Tools [RealtimeToolsConfig](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tools_config > (schema)>)Optional
Tools available to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools>)
Tracing [RealtimeTracingConfigUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_tracing_config > (schema)>)Optional
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing>)
Truncation [RealtimeTruncationUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)Optional
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema)>)
type RealtimeTranscriptionSessionCreateRequest struct{…}
Realtime transcription session object configuration.
Type Transcription
The type of session to create. Always `transcription` for transcription sessions.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) type>)
Audio [RealtimeTranscriptionSessionAudio](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>)Optional
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio>)
Include []stringOptional
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) include>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>)
[](<#(resource) realtime > (model) session_updated_event > (schema) > (property) session>)
Type SessionUpdated
The event type, must be `session.updated`.
[](<#(resource) realtime > (model) session_updated_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) session_updated_event > (schema)>)
type TranscriptionSessionUpdate struct{…}
Send this event to update a transcription session.
Session TranscriptionSessionUpdateSession
Realtime transcription session object configuration.
Include []stringOptional
The set of items to include in the transcription. Current available items are:
`item.input\_audio\_transcription.logprobs`
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) include>)
InputAudioFormat stringOptional
The format of input audio. Options are `pcm16`, `g711\_ulaw`, or `g711\_alaw`.
For `pcm16`, input audio must be 16-bit PCM at a 24kHz sample rate,
single channel (mono), and little-endian byte order.
One of the following:
const TranscriptionSessionUpdateSessionInputAudioFormatPcm16 TranscriptionSessionUpdateSessionInputAudioFormat = "pcm16"
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) input_audio_format > (member) 0>)
const TranscriptionSessionUpdateSessionInputAudioFormatG711Ulaw TranscriptionSessionUpdateSessionInputAudioFormat = "g711\_ulaw"
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) input_audio_format > (member) 1>)
const TranscriptionSessionUpdateSessionInputAudioFormatG711Alaw TranscriptionSessionUpdateSessionInputAudioFormat = "g711\_alaw"
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) input_audio_format > (member) 2>)
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) input_audio_format>)
InputAudioNoiseReduction TranscriptionSessionUpdateSessionInputAudioNoiseReductionOptional
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
Type [NoiseReductionType](</api/reference/go/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)Optional
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) input_audio_noise_reduction > (property) type>)
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) input_audio_noise_reduction>)
InputAudioTranscription [AudioTranscription](</api/reference/go/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>)Optional
Configuration for input audio transcription. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) input_audio_transcription>)
TurnDetection TranscriptionSessionUpdateSessionTurnDetectionOptional
Configuration for turn detection. Can be set to `null` to turn off. Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
PrefixPaddingMs int64Optional
Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) turn_detection > (property) prefix_padding_ms>)
SilenceDurationMs int64Optional
Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) turn_detection > (property) silence_duration_ms>)
Threshold float64Optional
Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) turn_detection > (property) threshold>)
Type stringOptional
Type of turn detection. Only `server\_vad` is currently supported for transcription sessions.
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) turn_detection > (property) type>)
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) turn_detection>)
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session>)
Type TranscriptionSessionUpdate
The event type, must be `transcription\_session.update`.
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) type>)
EventID stringOptional
Optional client-generated ID used to identify this event.
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) transcription_session_update > (schema)>)
type TranscriptionSessionUpdatedEvent struct{…}
Returned when a transcription session is updated with a `transcription\_session.update` event, unless
there is an error.
EventID string
The unique ID of the server event.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) event_id>)
Session TranscriptionSessionUpdatedEventSession
A new Realtime transcription session configuration.
When a session is created on the server via REST API, the session object
also contains an ephemeral key. Default TTL for keys is 10 minutes. This
property is not present when a session is updated via the WebSocket API.
ClientSecret TranscriptionSessionUpdatedEventSessionClientSecret
Ephemeral key returned by the API. Only present when the session is
created on the server via REST API.
ExpiresAt int64
Timestamp for when the token expires. Currently, all tokens expire
after one minute.
formatunixtime
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) client_secret > (property) expires_at>)
Value string
Ephemeral key usable in client environments to authenticate connections
to the Realtime API. Use this in client-side environments rather than
a standard API token, which should only be used server-side.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) client_secret > (property) value>)
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) client_secret>)
InputAudioFormat stringOptional
The format of input audio. Options are `pcm16`, `g711\_ulaw`, or `g711\_alaw`.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) input_audio_format>)
InputAudioTranscription [AudioTranscription](</api/reference/go/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>)Optional
Configuration of the transcription model.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) input_audio_transcription>)
Modalities []stringOptional
The set of modalities the model can respond with. To disable audio,
set this to [“text”].
One of the following:
const TranscriptionSessionUpdatedEventSessionModalityText TranscriptionSessionUpdatedEventSessionModality = "text"
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) modalities > (items) > (member) 0>)
const TranscriptionSessionUpdatedEventSessionModalityAudio TranscriptionSessionUpdatedEventSessionModality = "audio"
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) modalities>)
TurnDetection TranscriptionSessionUpdatedEventSessionTurnDetectionOptional
Configuration for turn detection. Can be set to `null` to turn off. Server
VAD means that the model will detect the start and end of speech based on
audio volume and respond at the end of user speech.
PrefixPaddingMs int64Optional
Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) turn_detection > (property) prefix_padding_ms>)
SilenceDurationMs int64Optional
Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) turn_detection > (property) silence_duration_ms>)
Threshold float64Optional
Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) turn_detection > (property) threshold>)
Type stringOptional
Type of turn detection, only `server\_vad` is currently supported.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) turn_detection > (property) type>)
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) turn_detection>)
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session>)
Type TranscriptionSessionUpdated
The event type, must be `transcription\_session.updated`.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema)>)
#### RealtimeClient Secrets
##### [Create client secret](/api/reference/go/resources/realtime/subresources/client_secrets/methods/create)
client.Realtime.ClientSecrets.New(ctx, body) (\*[ClientSecretNewResponse](</api/reference/go/resources/realtime#(resource) realtime.client_secrets > (model) ClientSecretNewResponse > (schema)>), error)
POST/realtime/client\_secrets
##### ModelsExpand Collapse
type RealtimeSessionClientSecret struct{…}
Ephemeral key returned by the API.
ExpiresAt int64
Timestamp for when the token expires. Currently, all tokens expire
after one minute.
formatunixtime
[](<#(resource) realtime.client_secrets > (model) realtime_session_client_secret > (schema) > (property) expires_at>)
Value string
Ephemeral key usable in client environments to authenticate connections to the Realtime API. Use this in client-side environments rather than a standard API token, which should only be used server-side.
[](<#(resource) realtime.client_secrets > (model) realtime_session_client_secret > (schema) > (property) value>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_client_secret > (schema)>)
type RealtimeSessionCreateResponse struct{…}
A new Realtime session configuration, with an ephemeral key. Default TTL
for keys is one minute.
ClientSecret [RealtimeSessionClientSecret](</api/reference/go/resources/realtime#(resource) realtime.client_secrets > (model) realtime_session_client_secret > (schema)>)
Ephemeral key returned by the API.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) client_secret>)
Type Realtime
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) type>)
Audio RealtimeSessionCreateResponseAudioOptional
Configuration for input and output audio.
Input RealtimeSessionCreateResponseAudioInputOptional
Format [RealtimeAudioFormatsUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)Optional
The format of the input audio.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) format>)
NoiseReduction RealtimeSessionCreateResponseAudioInputNoiseReductionOptional
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
Type [NoiseReductionType](</api/reference/go/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)Optional
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction>)
Transcription [AudioTranscription](</api/reference/go/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>)Optional
Configuration for input audio transcription, defaults to off and can be set to `null` to turn off once on. Input audio transcription is not native to the model, since the model consumes audio directly. Transcription runs asynchronously through [the /audio/transcriptions endpoint](https://platform.openai.com/docs/api-reference/audio/createTranscription) and should be treated as guidance of input audio content rather than precisely what the model heard. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) transcription>)
TurnDetection RealtimeSessionCreateResponseAudioInputTurnDetectionUnionOptional
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with “uhhm”, the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
One of the following:
type RealtimeSessionCreateResponseAudioInputTurnDetectionServerVad struct{…}
Server-side voice activity detection (VAD) which flips on when user speech is detected and off after a period of silence.
Type ServerVad
Type of turn detection, `server\_vad` to turn on simple Server VAD.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) type>)
CreateResponse boolOptional
Whether or not to automatically generate a response when a VAD stop event occurs. If `interrupt\_response` is set to `false` this may fail to create a response if the model is already responding.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) create_response>)
IdleTimeoutMs int64Optional
Optional timeout after which a model response will be triggered automatically. This is
useful for situations in which a long pause from the user is unexpected, such as a phone
call. The model will effectively prompt the user to continue the conversation based
on the current context.
The timeout value will be applied after the last model response’s audio has finished playing,
i.e. it’s set to the `response.done` time plus audio playback duration.
An `input\_audio\_buffer.timeout\_triggered` event (plus events
associated with the Response) will be emitted when the timeout is reached.
Idle timeout is currently only supported for `server\_vad` mode.
minimum5000
maximum30000
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) idle_timeout_ms>)
InterruptResponse boolOptional
Whether or not to automatically interrupt (cancel) any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs. If `true` then the response will be cancelled, otherwise it will continue until complete.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) interrupt_response>)
PrefixPaddingMs int64Optional
Used only for `server\_vad` mode. Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) prefix_padding_ms>)
SilenceDurationMs int64Optional
Used only for `server\_vad` mode. Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) silence_duration_ms>)
Threshold float64Optional
Used only for `server\_vad` mode. Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) threshold>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0>)
type RealtimeSessionCreateResponseAudioInputTurnDetectionSemanticVad struct{…}
Server-side semantic turn detection which uses a model to determine when the user has finished speaking.
Type SemanticVad
Type of turn detection, `semantic\_vad` to turn on Semantic VAD.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) type>)
CreateResponse boolOptional
Whether or not to automatically generate a response when a VAD stop event occurs.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) create_response>)
Eagerness stringOptional
Used only for `semantic\_vad` mode. The eagerness of the model to respond. `low` will wait longer for the user to continue speaking, `high` will respond more quickly. `auto` is the default and is equivalent to `medium`. `low`, `medium`, and `high` have max timeouts of 8s, 4s, and 2s respectively.
One of the following:
const RealtimeSessionCreateResponseAudioInputTurnDetectionSemanticVadEagernessLow RealtimeSessionCreateResponseAudioInputTurnDetectionSemanticVadEagerness = "low"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 0>)
const RealtimeSessionCreateResponseAudioInputTurnDetectionSemanticVadEagernessMedium RealtimeSessionCreateResponseAudioInputTurnDetectionSemanticVadEagerness = "medium"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 1>)
const RealtimeSessionCreateResponseAudioInputTurnDetectionSemanticVadEagernessHigh RealtimeSessionCreateResponseAudioInputTurnDetectionSemanticVadEagerness = "high"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 2>)
const RealtimeSessionCreateResponseAudioInputTurnDetectionSemanticVadEagernessAuto RealtimeSessionCreateResponseAudioInputTurnDetectionSemanticVadEagerness = "auto"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 3>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness>)
InterruptResponse boolOptional
Whether or not to automatically interrupt any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) interrupt_response>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input>)
Output RealtimeSessionCreateResponseAudioOutputOptional
Format [RealtimeAudioFormatsUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)Optional
The format of the output audio.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) format>)
Speed float64Optional
The speed of the model’s spoken response as a multiple of the original speed.
1.0 is the default speed. 0.25 is the minimum speed. 1.5 is the maximum speed. This value can only be changed in between model turns, not while a response is in progress.
This parameter is a post-processing adjustment to the audio after it is generated, it’s
also possible to prompt the model to speak faster or slower.
maximum1.5
minimum0.25
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) speed>)
Voice stringOptional
The voice the model uses to respond. Voice cannot be changed during the
session once the model has responded with audio at least once. Current
voice options are `alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`,
`shimmer`, `verse`, `marin`, and `cedar`. We recommend `marin` and `cedar` for
best quality.
One of the following:
string
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 0>)
string
One of the following:
const RealtimeSessionCreateResponseAudioOutputVoiceAlloy RealtimeSessionCreateResponseAudioOutputVoice = "alloy"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 0>)
const RealtimeSessionCreateResponseAudioOutputVoiceAsh RealtimeSessionCreateResponseAudioOutputVoice = "ash"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 1>)
const RealtimeSessionCreateResponseAudioOutputVoiceBallad RealtimeSessionCreateResponseAudioOutputVoice = "ballad"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 2>)
const RealtimeSessionCreateResponseAudioOutputVoiceCoral RealtimeSessionCreateResponseAudioOutputVoice = "coral"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 3>)
const RealtimeSessionCreateResponseAudioOutputVoiceEcho RealtimeSessionCreateResponseAudioOutputVoice = "echo"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 4>)
const RealtimeSessionCreateResponseAudioOutputVoiceSage RealtimeSessionCreateResponseAudioOutputVoice = "sage"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 5>)
const RealtimeSessionCreateResponseAudioOutputVoiceShimmer RealtimeSessionCreateResponseAudioOutputVoice = "shimmer"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 6>)
const RealtimeSessionCreateResponseAudioOutputVoiceVerse RealtimeSessionCreateResponseAudioOutputVoice = "verse"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 7>)
const RealtimeSessionCreateResponseAudioOutputVoiceMarin RealtimeSessionCreateResponseAudioOutputVoice = "marin"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 8>)
const RealtimeSessionCreateResponseAudioOutputVoiceCedar RealtimeSessionCreateResponseAudioOutputVoice = "cedar"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio>)
Include []stringOptional
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) include>)
Instructions stringOptional
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) instructions>)
MaxOutputTokens RealtimeSessionCreateResponseMaxOutputTokensUnionOptional
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
int64
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) max_output_tokens > (variant) 0>)
type Inf string
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) max_output_tokens>)
Model RealtimeSessionCreateResponseModelOptional
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 0>)
type RealtimeSessionCreateResponseModel string
The Realtime model used for this session.
One of the following:
const RealtimeSessionCreateResponseModelGPTRealtime RealtimeSessionCreateResponseModel = "gpt-realtime"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 0>)
const RealtimeSessionCreateResponseModelGPTRealtime1\_5 RealtimeSessionCreateResponseModel = "gpt-realtime-1.5"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 1>)
const RealtimeSessionCreateResponseModelGPTRealtime2025\_08\_28 RealtimeSessionCreateResponseModel = "gpt-realtime-2025-08-28"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 2>)
const RealtimeSessionCreateResponseModelGPT4oRealtimePreview RealtimeSessionCreateResponseModel = "gpt-4o-realtime-preview"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 3>)
const RealtimeSessionCreateResponseModelGPT4oRealtimePreview2024\_10\_01 RealtimeSessionCreateResponseModel = "gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 4>)
const RealtimeSessionCreateResponseModelGPT4oRealtimePreview2024\_12\_17 RealtimeSessionCreateResponseModel = "gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 5>)
const RealtimeSessionCreateResponseModelGPT4oRealtimePreview2025\_06\_03 RealtimeSessionCreateResponseModel = "gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 6>)
const RealtimeSessionCreateResponseModelGPT4oMiniRealtimePreview RealtimeSessionCreateResponseModel = "gpt-4o-mini-realtime-preview"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 7>)
const RealtimeSessionCreateResponseModelGPT4oMiniRealtimePreview2024\_12\_17 RealtimeSessionCreateResponseModel = "gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 8>)
const RealtimeSessionCreateResponseModelGPTRealtimeMini RealtimeSessionCreateResponseModel = "gpt-realtime-mini"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 9>)
const RealtimeSessionCreateResponseModelGPTRealtimeMini2025\_10\_06 RealtimeSessionCreateResponseModel = "gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 10>)
const RealtimeSessionCreateResponseModelGPTRealtimeMini2025\_12\_15 RealtimeSessionCreateResponseModel = "gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 11>)
const RealtimeSessionCreateResponseModelGPTAudio1\_5 RealtimeSessionCreateResponseModel = "gpt-audio-1.5"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 12>)
const RealtimeSessionCreateResponseModelGPTAudioMini RealtimeSessionCreateResponseModel = "gpt-audio-mini"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 13>)
const RealtimeSessionCreateResponseModelGPTAudioMini2025\_10\_06 RealtimeSessionCreateResponseModel = "gpt-audio-mini-2025-10-06"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 14>)
const RealtimeSessionCreateResponseModelGPTAudioMini2025\_12\_15 RealtimeSessionCreateResponseModel = "gpt-audio-mini-2025-12-15"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model>)
OutputModalities []stringOptional
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
const RealtimeSessionCreateResponseOutputModalityText RealtimeSessionCreateResponseOutputModality = "text"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) output_modalities > (items) > (member) 0>)
const RealtimeSessionCreateResponseOutputModalityAudio RealtimeSessionCreateResponseOutputModality = "audio"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) output_modalities>)
Prompt [ResponsePrompt](</api/reference/go/resources/responses#(resource) responses > (model) response_prompt > (schema)>)Optional
Reference to a prompt template and its variables.
[Learn more](https://platform.openai.com/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt>)
ToolChoice RealtimeSessionCreateResponseToolChoiceUnionOptional
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
One of the following:
type ToolChoiceOptions string
Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or
more tools.
`required` means the model must call one or more tools.
One of the following:
const ToolChoiceOptionsNone [ToolChoiceOptions](</api/reference/go/resources/responses#(resource) responses > (model) tool_choice_options > (schema)>) = "none"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 0>)
const ToolChoiceOptionsAuto [ToolChoiceOptions](</api/reference/go/resources/responses#(resource) responses > (model) tool_choice_options > (schema)>) = "auto"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 1>)
const ToolChoiceOptionsRequired [ToolChoiceOptions](</api/reference/go/resources/responses#(resource) responses > (model) tool_choice_options > (schema)>) = "required"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 2>)
[](<#(resource) responses > (model) tool_choice_options > (schema)>)
type ToolChoiceFunction struct{…}
Use this option to force the model to call a specific function.
Name string
The name of the function to call.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) name>)
Type Function
For function calling, the type is always `function`.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) type>)
[](<#(resource) responses > (model) tool_choice_function > (schema)>)
type ToolChoiceMcp struct{…}
Use this option to force the model to call a specific tool on a remote MCP server.
ServerLabel string
The label of the MCP server to use.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) server_label>)
Type Mcp
For MCP tools, the type is always `mcp`.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) type>)
Name stringOptional
The name of the tool to call on the server.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) name>)
[](<#(resource) responses > (model) tool_choice_mcp > (schema)>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tool_choice>)
Tools []RealtimeSessionCreateResponseToolUnionOptional
Tools available to the model.
One of the following:
type RealtimeFunctionTool struct{…}
Description stringOptional
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
Name stringOptional
The name of the function.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
Parameters anyOptional
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
Type RealtimeFunctionToolTypeOptional
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_function_tool > (schema)>)
type RealtimeSessionCreateResponseToolMcpTool struct{…}
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](https://platform.openai.com/docs/guides/tools-remote-mcp).
ServerLabel string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) server_label>)
Type Mcp
The type of the MCP tool. Always `mcp`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) type>)
AllowedTools RealtimeSessionCreateResponseToolMcpToolAllowedToolsUnionOptional
List of allowed tool names or a filter object.
One of the following:
type RealtimeSessionCreateResponseToolMcpToolAllowedToolsMcpAllowedTools []string
A string array of allowed tool names
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 0>)
type RealtimeSessionCreateResponseToolMcpToolAllowedToolsMcpToolFilter struct{…}
A filter object to specify which tools are allowed.
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools>)
Authorization stringOptional
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) authorization>)
ConnectorID stringOptional
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](https://platform.openai.com/docs/guides/tools-remote-mcp#connectors).
Currently supported `connector\_id` values are:
* Dropbox: `connector\_dropbox`
* Gmail: `connector\_gmail`
* Google Calendar: `connector\_googlecalendar`
* Google Drive: `connector\_googledrive`
* Microsoft Teams: `connector\_microsoftteams`
* Outlook Calendar: `connector\_outlookcalendar`
* Outlook Email: `connector\_outlookemail`
* SharePoint: `connector\_sharepoint`
One of the following:
const RealtimeSessionCreateResponseToolMcpToolConnectorIDConnectorDropbox RealtimeSessionCreateResponseToolMcpToolConnectorID = "connector\_dropbox"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 0>)
const RealtimeSessionCreateResponseToolMcpToolConnectorIDConnectorGmail RealtimeSessionCreateResponseToolMcpToolConnectorID = "connector\_gmail"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 1>)
const RealtimeSessionCreateResponseToolMcpToolConnectorIDConnectorGooglecalendar RealtimeSessionCreateResponseToolMcpToolConnectorID = "connector\_googlecalendar"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 2>)
const RealtimeSessionCreateResponseToolMcpToolConnectorIDConnectorGoogledrive RealtimeSessionCreateResponseToolMcpToolConnectorID = "connector\_googledrive"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 3>)
const RealtimeSessionCreateResponseToolMcpToolConnectorIDConnectorMicrosoftteams RealtimeSessionCreateResponseToolMcpToolConnectorID = "connector\_microsoftteams"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 4>)
const RealtimeSessionCreateResponseToolMcpToolConnectorIDConnectorOutlookcalendar RealtimeSessionCreateResponseToolMcpToolConnectorID = "connector\_outlookcalendar"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 5>)
const RealtimeSessionCreateResponseToolMcpToolConnectorIDConnectorOutlookemail RealtimeSessionCreateResponseToolMcpToolConnectorID = "connector\_outlookemail"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 6>)
const RealtimeSessionCreateResponseToolMcpToolConnectorIDConnectorSharepoint RealtimeSessionCreateResponseToolMcpToolConnectorID = "connector\_sharepoint"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 7>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id>)
DeferLoading boolOptional
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) defer_loading>)
Headers map[string, string]Optional
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) headers>)
RequireApproval RealtimeSessionCreateResponseToolMcpToolRequireApprovalUnionOptional
Specify which of the MCP server’s tools require approval.
One of the following:
type RealtimeSessionCreateResponseToolMcpToolRequireApprovalMcpToolApprovalFilter struct{…}
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
Always RealtimeSessionCreateResponseToolMcpToolRequireApprovalMcpToolApprovalFilterAlwaysOptional
A filter object to specify which tools are allowed.
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always>)
Never RealtimeSessionCreateResponseToolMcpToolRequireApprovalMcpToolApprovalFilterNeverOptional
A filter object to specify which tools are allowed.
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0>)
type RealtimeSessionCreateResponseToolMcpToolRequireApprovalMcpToolApprovalSetting string
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
const RealtimeSessionCreateResponseToolMcpToolRequireApprovalMcpToolApprovalSettingAlways RealtimeSessionCreateResponseToolMcpToolRequireApprovalMcpToolApprovalSetting = "always"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 0>)
const RealtimeSessionCreateResponseToolMcpToolRequireApprovalMcpToolApprovalSettingNever RealtimeSessionCreateResponseToolMcpToolRequireApprovalMcpToolApprovalSetting = "never"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval>)
ServerDescription stringOptional
Optional description of the MCP server, used to provide more context.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) server_description>)
ServerURL stringOptional
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) server_url>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools>)
Tracing RealtimeSessionCreateResponseTracingUnionOptional
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
One of the following:
type Auto string
Enables tracing and sets default values for tracing configuration options. Always `auto`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 0>)
type RealtimeSessionCreateResponseTracingTracingConfiguration struct{…}
Granular configuration for tracing.
GroupID stringOptional
The group id to attach to this trace to enable filtering and
grouping in the Traces Dashboard.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 1 > (property) group_id>)
Metadata anyOptional
The arbitrary metadata to attach to this trace to enable
filtering in the Traces Dashboard.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 1 > (property) metadata>)
WorkflowName stringOptional
The name of the workflow to attach to this trace. This is used to
name the trace in the Traces Dashboard.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 1 > (property) workflow_name>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing>)
Truncation [RealtimeTruncationUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)Optional
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) truncation>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema)>)
type RealtimeTranscriptionSessionCreateResponse struct{…}
A Realtime transcription session configuration object.
ID string
Unique identifier for the session that looks like `sess\_1234567890abcdef`.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) id>)
Object string
The object type. Always `realtime.transcription\_session`.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) object>)
Type Transcription
The type of session. Always `transcription` for transcription sessions.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) type>)
Audio RealtimeTranscriptionSessionCreateResponseAudioOptional
Configuration for input audio for the session.
Input RealtimeTranscriptionSessionCreateResponseAudioInputOptional
Format [RealtimeAudioFormatsUnion](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)Optional
The PCM audio format. Only a 24kHz sample rate is supported.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) format>)
NoiseReduction RealtimeTranscriptionSessionCreateResponseAudioInputNoiseReductionOptional
Configuration for input audio noise reduction.
Type [NoiseReductionType](</api/reference/go/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)Optional
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction>)
Transcription [AudioTranscription](</api/reference/go/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>)Optional
Configuration of the transcription model.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) transcription>)
TurnDetection [RealtimeTranscriptionSessionTurnDetection](</api/reference/go/resources/realtime#(resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema)>)Optional
Configuration for turn detection. Can be set to `null` to turn off. Server
VAD means that the model will detect the start and end of speech based on
audio volume and respond at the end of user speech.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio>)
ExpiresAt int64Optional
Expiration timestamp for the session, in seconds since epoch.
formatunixtime
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) expires_at>)
Include []stringOptional
Additional fields to include in server outputs.
* `item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) include>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema)>)
type RealtimeTranscriptionSessionTurnDetection struct{…}
Configuration for turn detection. Can be set to `null` to turn off. Server
VAD means that the model will detect the start and end of speech based on
audio volume and respond at the end of user speech.
PrefixPaddingMs int64Optional
Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema) > (property) prefix_padding_ms>)
SilenceDurationMs int64Optional
Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema) > (property) silence_duration_ms>)
Threshold float64Optional
Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema) > (property) threshold>)
Type stringOptional
Type of turn detection, only `server\_vad` is currently supported.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema) > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema)>)
#### RealtimeCalls
##### [Accept call](/api/reference/go/resources/realtime/subresources/calls/methods/accept)
client.Realtime.Calls.Accept(ctx, callID, body) error
POST/realtime/calls/{call\_id}/accept
##### [Hang up call](/api/reference/go/resources/realtime/subresources/calls/methods/hangup)
client.Realtime.Calls.Hangup(ctx, callID) error
POST/realtime/calls/{call\_id}/hangup
##### [Refer call](/api/reference/go/resources/realtime/subresources/calls/methods/refer)
client.Realtime.Calls.Refer(ctx, callID, body) error
POST/realtime/calls/{call\_id}/refer
##### [Reject call](/api/reference/go/resources/realtime/subresources/calls/methods/reject)
client.Realtime.Calls.Reject(ctx, callID, body) error
POST/realtime/calls/{call\_id}/reject
#### RealtimeSessions
#### RealtimeTranscription Sessions