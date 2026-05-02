Realtime | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Realtime
##### ModelsExpand Collapse
AudioTranscription object { language, model, prompt }
language: optional string
The language of the input audio. Supplying the input language in
[ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
will improve accuracy and latency.
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) language>)
model: optional string or "whisper-1" or "gpt-4o-mini-transcribe" or "gpt-4o-mini-transcribe-2025-12-15" or 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
string
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 0>)
"whisper-1" or "gpt-4o-mini-transcribe" or "gpt-4o-mini-transcribe-2025-12-15" or 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
"whisper-1"
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 0>)
"gpt-4o-mini-transcribe"
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 1>)
"gpt-4o-mini-transcribe-2025-12-15"
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 2>)
"gpt-4o-transcribe"
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 3>)
"gpt-4o-transcribe-diarize"
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 4>)
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) model>)
prompt: optional string
An optional text to guide the model’s style or continue a previous audio
segment.
For `whisper-1`, the [prompt is a list of keywords](/docs/guides/speech-to-text#prompting).
For `gpt-4o-transcribe` models (excluding `gpt-4o-transcribe-diarize`), the prompt is a free text string, for example “expect words related to technology”.
[](<#(resource) realtime > (model) audio_transcription > (schema) > (property) prompt>)
[](<#(resource) realtime > (model) audio_transcription > (schema)>)
ConversationCreatedEvent object { conversation, event\_id, type }
Returned when a conversation is created. Emitted right after session creation.
conversation: object { id, object }
The conversation resource.
id: optional string
The unique ID of the conversation.
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) conversation > (property) id>)
object: optional string
The object type, must be `realtime.conversation`.
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) conversation > (property) object>)
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) conversation>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) event_id>)
type: "conversation.created"
The event type, must be `conversation.created`.
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_created_event > (schema)>)
ConversationItem = [RealtimeConversationItemSystemMessage](</api/reference/resources/realtime#(resource) realtime > (model) realtime_conversation_item_system_message > (schema)>) { content, role, type, 3 more } or [RealtimeConversationItemUserMessage](</api/reference/resources/realtime#(resource) realtime > (model) realtime_conversation_item_user_message > (schema)>) { content, role, type, 3 more } or [RealtimeConversationItemAssistantMessage](</api/reference/resources/realtime#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema)>) { content, role, type, 3 more } or 6 more
A single item within a Realtime conversation.
One of the following:
RealtimeConversationItemSystemMessage object { content, role, type, 3 more }
A system message in a Realtime conversation can be used to provide additional context or instructions to the model. This is similar but distinct from the instruction prompt provided at the start of a conversation, as system messages can be added at any point in the conversation. For major changes to the conversation’s behavior, use instructions, but for smaller updates (e.g. “the user is now asking about a different topic”), use system messages.
content: array of object { text, type }
The content of the message.
text: optional string
The text content.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) text>)
type: optional "input\_text"
The content type. Always `input\_text` for system messages.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content>)
role: "system"
The role of the message sender. Always `system`.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema)>)
RealtimeConversationItemUserMessage object { content, role, type, 3 more }
A user message item in a Realtime conversation.
content: array of object { audio, detail, image\_url, 3 more }
The content of the message.
audio: optional string
Base64-encoded audio bytes (for `input\_audio`), these will be parsed as the format specified in the session input audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) audio>)
detail: optional "auto" or "low" or "high"
The detail level of the image (for `input\_image`). `auto` will default to `high`.
One of the following:
"auto"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 0>)
"low"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 1>)
"high"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail>)
image\_url: optional string
Base64-encoded image bytes (for `input\_image`) as a data URI. For example `data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...`. Supported formats are PNG and JPEG.
formaturi
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) image_url>)
text: optional string
The text content (for `input\_text`).
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) text>)
transcript: optional string
Transcript of the audio (for `input\_audio`). This is not sent to the model, but will be attached to the message item for reference.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) transcript>)
type: optional "input\_text" or "input\_audio" or "input\_image"
The content type (`input\_text`, `input\_audio`, or `input\_image`).
One of the following:
"input\_text"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
"input\_audio"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
"input\_image"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content>)
role: "user"
The role of the message sender. Always `user`.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema)>)
RealtimeConversationItemAssistantMessage object { content, role, type, 3 more }
An assistant message item in a Realtime conversation.
content: array of object { audio, text, transcript, type }
The content of the message.
audio: optional string
Base64-encoded audio bytes, these will be parsed as the format specified in the session output audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) audio>)
text: optional string
The text content.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) text>)
transcript: optional string
The transcript of the audio content, this will always be present if the output type is `audio`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) transcript>)
type: optional "output\_text" or "output\_audio"
The content type, `output\_text` or `output\_audio` depending on the session `output\_modalities` configuration.
One of the following:
"output\_text"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
"output\_audio"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content>)
role: "assistant"
The role of the message sender. Always `assistant`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema)>)
RealtimeConversationItemFunctionCall object { arguments, name, type, 4 more }
A function call item in a Realtime conversation.
arguments: string
The arguments of the function call. This is a JSON-encoded string representing the arguments passed to the function, for example `{"arg1": "value1", "arg2": 42}`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) arguments>)
name: string
The name of the function being called.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) name>)
type: "function\_call"
The type of the item. Always `function\_call`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) id>)
call\_id: optional string
The ID of the function call.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) call_id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema)>)
RealtimeConversationItemFunctionCallOutput object { call\_id, output, type, 3 more }
A function call output item in a Realtime conversation.
call\_id: string
The ID of the function call this output is for.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) call_id>)
output: string
The output of the function call, this is free text and can contain any information or simply be empty.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) output>)
type: "function\_call\_output"
The type of the item. Always `function\_call\_output`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema)>)
RealtimeMcpApprovalResponse object { id, approval\_request\_id, approve, 2 more }
A Realtime item responding to an MCP approval request.
id: string
The unique ID of the approval response.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) id>)
approval\_request\_id: string
The ID of the approval request being answered.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approval_request_id>)
approve: boolean
Whether the request was approved.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approve>)
type: "mcp\_approval\_response"
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) type>)
reason: optional string
Optional reason for the decision.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) reason>)
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema)>)
RealtimeMcpListTools object { server\_label, tools, type, id }
A Realtime item listing tools available on an MCP server.
server\_label: string
The label of the MCP server.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) server_label>)
tools: array of object { input\_schema, name, annotations, description }
The tools available on the server.
input\_schema: unknown
The JSON schema describing the tool’s input.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) input_schema>)
name: string
The name of the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) name>)
annotations: optional unknown
Additional annotations about the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) annotations>)
description: optional string
The description of the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) description>)
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools>)
type: "mcp\_list\_tools"
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) type>)
id: optional string
The unique ID of the list.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) id>)
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema)>)
RealtimeMcpToolCall object { id, arguments, name, 5 more }
A Realtime item representing an invocation of a tool on an MCP server.
id: string
The unique ID of the tool call.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) id>)
arguments: string
A JSON string of the arguments passed to the tool.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) arguments>)
name: string
The name of the tool that was run.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) name>)
server\_label: string
The label of the MCP server running the tool.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) server_label>)
type: "mcp\_call"
The type of the item. Always `mcp\_call`.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) type>)
approval\_request\_id: optional string
The ID of an associated approval request, if any.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) approval_request_id>)
error: optional [RealtimeMcpProtocolError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcp_protocol_error > (schema)>) { code, message, type } or [RealtimeMcpToolExecutionError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>) { message, type } or [RealtimeMcphttpError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcphttp_error > (schema)>) { code, message, type }
The error from the tool call, if any.
One of the following:
RealtimeMcpProtocolError object { code, message, type }
code: number
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) code>)
message: string
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) message>)
type: "protocol\_error"
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema)>)
RealtimeMcpToolExecutionError object { message, type }
message: string
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) message>)
type: "tool\_execution\_error"
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>)
RealtimeMcphttpError object { code, message, type }
code: number
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) code>)
message: string
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) message>)
type: "http\_error"
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema)>)
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) error>)
output: optional string
The output from the tool call.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) output>)
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema)>)
RealtimeMcpApprovalRequest object { id, arguments, name, 2 more }
A Realtime item requesting human approval of a tool invocation.
id: string
The unique ID of the approval request.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) id>)
arguments: string
A JSON string of arguments for the tool.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) arguments>)
name: string
The name of the tool to run.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) name>)
server\_label: string
The label of the MCP server making the request.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) server_label>)
type: "mcp\_approval\_request"
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema)>)
[](<#(resource) realtime > (model) conversation_item > (schema)>)
ConversationItemAdded object { event\_id, item, type, previous\_item\_id }
Sent by the server when an Item is added to the default Conversation. This can happen in several cases:
* When the client sends a `conversation.item.create` event.
* When the input audio buffer is committed. In this case the item will be a user message containing the audio from the buffer.
* When the model is generating a Response. In this case the `conversation.item.added` event will be sent when the model starts generating a specific Item, and thus it will not yet have any content (and `status` will be `in\_progress`).
The event will include the full content of the Item (except when model is generating a Response) except for audio data, which can be retrieved separately with a `conversation.item.retrieve` event if necessary.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_added > (schema) > (property) event_id>)
item: [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) conversation_item_added > (schema) > (property) item>)
type: "conversation.item.added"
The event type, must be `conversation.item.added`.
[](<#(resource) realtime > (model) conversation_item_added > (schema) > (property) type>)
previous\_item\_id: optional string
The ID of the item that precedes this one, if any. This is used to
maintain ordering when items are inserted.
[](<#(resource) realtime > (model) conversation_item_added > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) conversation_item_added > (schema)>)
ConversationItemCreateEvent object { item, type, event\_id, previous\_item\_id }
Add a new Item to the Conversation’s context, including messages, function
calls, and function call responses. This event can be used both to populate a
“history” of the conversation and to add new items mid-stream, but has the
current limitation that it cannot populate assistant audio messages.
If successful, the server will respond with a `conversation.item.created`
event, otherwise an `error` event will be sent.
item: [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item>)
type: "conversation.item.create"
The event type, must be `conversation.item.create`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) event_id>)
previous\_item\_id: optional string
The ID of the preceding item after which the new item will be inserted. If not set, the new item will be appended to the end of the conversation.
If set to `root`, the new item will be added to the beginning of the conversation.
If set to an existing ID, it allows an item to be inserted mid-conversation. If the ID cannot be found, an error will be returned and the item will not be added.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema)>)
ConversationItemCreatedEvent object { event\_id, item, type, previous\_item\_id }
Returned when a conversation item is created. There are several scenarios that produce this event:
* The server is generating a Response, which if successful will produce
either one or two Items, which will be of type `message`
(role `assistant`) or type `function\_call`.
* The input audio buffer has been committed, either by the client or the
server (in `server\_vad` mode). The server will take the content of the
input audio buffer and add it to a new user message Item.
* The client has sent a `conversation.item.create` event to add a new Item
to the Conversation.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_created_event > (schema) > (property) event_id>)
item: [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) conversation_item_created_event > (schema) > (property) item>)
type: "conversation.item.created"
The event type, must be `conversation.item.created`.
[](<#(resource) realtime > (model) conversation_item_created_event > (schema) > (property) type>)
previous\_item\_id: optional string
The ID of the preceding item in the Conversation context, allows the
client to understand the order of the conversation. Can be `null` if the
item has no predecessor.
[](<#(resource) realtime > (model) conversation_item_created_event > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) conversation_item_created_event > (schema)>)
ConversationItemDeleteEvent object { item\_id, type, event\_id }
Send this event when you want to remove any item from the conversation
history. The server will respond with a `conversation.item.deleted` event,
unless the item does not exist in the conversation history, in which case the
server will respond with an error.
item\_id: string
The ID of the item to delete.
[](<#(resource) realtime > (model) conversation_item_delete_event > (schema) > (property) item_id>)
type: "conversation.item.delete"
The event type, must be `conversation.item.delete`.
[](<#(resource) realtime > (model) conversation_item_delete_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) conversation_item_delete_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) conversation_item_delete_event > (schema)>)
ConversationItemDeletedEvent object { event\_id, item\_id, type }
Returned when an item in the conversation is deleted by the client with a
`conversation.item.delete` event. This event is used to synchronize the
server’s understanding of the conversation history with the client’s view.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_deleted_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item that was deleted.
[](<#(resource) realtime > (model) conversation_item_deleted_event > (schema) > (property) item_id>)
type: "conversation.item.deleted"
The event type, must be `conversation.item.deleted`.
[](<#(resource) realtime > (model) conversation_item_deleted_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_deleted_event > (schema)>)
ConversationItemDone object { event\_id, item, type, previous\_item\_id }
Returned when a conversation item is finalized.
The event will include the full content of the Item except for audio data, which can be retrieved separately with a `conversation.item.retrieve` event if needed.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_done > (schema) > (property) event_id>)
item: [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) conversation_item_done > (schema) > (property) item>)
type: "conversation.item.done"
The event type, must be `conversation.item.done`.
[](<#(resource) realtime > (model) conversation_item_done > (schema) > (property) type>)
previous\_item\_id: optional string
The ID of the item that precedes this one, if any. This is used to
maintain ordering when items are inserted.
[](<#(resource) realtime > (model) conversation_item_done > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) conversation_item_done > (schema)>)
ConversationItemInputAudioTranscriptionCompletedEvent object { content\_index, event\_id, item\_id, 4 more }
This event is the output of audio transcription for user audio written to the
user audio buffer. Transcription begins when the input audio buffer is
committed by the client or server (when VAD is enabled). Transcription runs
asynchronously with Response creation, so this event may come before or after
the Response events.
Realtime API models accept audio natively, and thus input transcription is a
separate process run on a separate ASR (Automatic Speech Recognition) model.
The transcript may diverge somewhat from the model’s interpretation, and
should be treated as a rough guide.
content\_index: number
The index of the content part containing the audio.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) content_index>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item containing the audio that is being transcribed.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) item_id>)
transcript: string
The transcribed text.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) transcript>)
type: "conversation.item.input\_audio\_transcription.completed"
The event type, must be
`conversation.item.input\_audio\_transcription.completed`.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) type>)
usage: object { input\_tokens, output\_tokens, total\_tokens, 2 more } or object { seconds, type }
Usage statistics for the transcription, this is billed according to the ASR model’s pricing rather than the realtime model’s pricing.
One of the following:
TokenUsage object { input\_tokens, output\_tokens, total\_tokens, 2 more }
Usage statistics for models billed by token usage.
input\_tokens: number
Number of input tokens billed for this request.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) input_tokens>)
output\_tokens: number
Number of output tokens generated.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) output_tokens>)
total\_tokens: number
Total number of tokens used (input + output).
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) total_tokens>)
type: "tokens"
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) type>)
input\_token\_details: optional object { audio\_tokens, text\_tokens }
Details about the input tokens billed for this request.
audio\_tokens: optional number
Number of audio tokens billed for this request.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
text\_tokens: optional number
Number of text tokens billed for this request.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0>)
DurationUsage object { seconds, type }
Usage statistics for models billed by audio input duration.
seconds: number
Duration of the input audio in seconds.
formatdouble
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 1 > (property) seconds>)
type: "duration"
The type of the usage object. Always `duration` for this variant.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 1 > (property) type>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 1>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage>)
logprobs: optional array of [LogProbProperties](</api/reference/resources/realtime#(resource) realtime > (model) log_prob_properties > (schema)>) { token, bytes, logprob }
The log probabilities of the transcription.
token: string
The token that was used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) token>)
bytes: array of number
The bytes that were used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) bytes>)
logprob: number
The log probability of the token.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) logprob>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) logprobs>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema)>)
ConversationItemInputAudioTranscriptionDeltaEvent object { event\_id, item\_id, type, 3 more }
Returned when the text value of an input audio transcription content part is updated with incremental transcription results.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item containing the audio that is being transcribed.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) item_id>)
type: "conversation.item.input\_audio\_transcription.delta"
The event type, must be `conversation.item.input\_audio\_transcription.delta`.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) type>)
content\_index: optional number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) content_index>)
delta: optional string
The text delta.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) delta>)
logprobs: optional array of [LogProbProperties](</api/reference/resources/realtime#(resource) realtime > (model) log_prob_properties > (schema)>) { token, bytes, logprob }
The log probabilities of the transcription. These can be enabled by configurating the session with `"include": ["item.input\_audio\_transcription.logprobs"]`. Each entry in the array corresponds a log probability of which token would be selected for this chunk of transcription. This can help to identify if it was possible there were multiple valid options for a given chunk of transcription.
token: string
The token that was used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) token>)
bytes: array of number
The bytes that were used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) bytes>)
logprob: number
The log probability of the token.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) logprob>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) logprobs>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema)>)
ConversationItemInputAudioTranscriptionFailedEvent object { content\_index, error, event\_id, 2 more }
Returned when input audio transcription is configured, and a transcription
request for a user message failed. These events are separate from other
`error` events so that the client can identify the related Item.
content\_index: number
The index of the content part containing the audio.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) content_index>)
error: object { code, message, param, type }
Details of the transcription error.
code: optional string
Error code, if any.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error > (property) code>)
message: optional string
A human-readable error message.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error > (property) message>)
param: optional string
Parameter related to the error, if any.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error > (property) param>)
type: optional string
The type of error.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error > (property) type>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) event_id>)
item\_id: string
The ID of the user message item.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) item_id>)
type: "conversation.item.input\_audio\_transcription.failed"
The event type, must be
`conversation.item.input\_audio\_transcription.failed`.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema)>)
ConversationItemInputAudioTranscriptionSegment object { id, content\_index, end, 6 more }
Returned when an input audio transcription segment is identified for an item.
id: string
The segment identifier.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) id>)
content\_index: number
The index of the input audio content part within the item.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) content_index>)
end: number
End time of the segment in seconds.
formatdouble
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) end>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) event_id>)
item\_id: string
The ID of the item containing the input audio content.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) item_id>)
speaker: string
The detected speaker label for this segment.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) speaker>)
start: number
Start time of the segment in seconds.
formatdouble
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) start>)
text: string
The text for this segment.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) text>)
type: "conversation.item.input\_audio\_transcription.segment"
The event type, must be `conversation.item.input\_audio\_transcription.segment`.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema)>)
ConversationItemRetrieveEvent object { item\_id, type, event\_id }
Send this event when you want to retrieve the server’s representation of a specific item in the conversation history. This is useful, for example, to inspect user audio after noise cancellation and VAD.
The server will respond with a `conversation.item.retrieved` event,
unless the item does not exist in the conversation history, in which case the
server will respond with an error.
item\_id: string
The ID of the item to retrieve.
[](<#(resource) realtime > (model) conversation_item_retrieve_event > (schema) > (property) item_id>)
type: "conversation.item.retrieve"
The event type, must be `conversation.item.retrieve`.
[](<#(resource) realtime > (model) conversation_item_retrieve_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) conversation_item_retrieve_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) conversation_item_retrieve_event > (schema)>)
ConversationItemTruncateEvent object { audio\_end\_ms, content\_index, item\_id, 2 more }
Send this event to truncate a previous assistant message’s audio. The server
will produce audio faster than realtime, so this event is useful when the user
interrupts to truncate audio that has already been sent to the client but not
yet played. This will synchronize the server’s understanding of the audio with
the client’s playback.
Truncating audio will delete the server-side text transcript to ensure there
is not text in the context that hasn’t been heard by the user.
If successful, the server will respond with a `conversation.item.truncated`
event.
audio\_end\_ms: number
Inclusive duration up to which audio is truncated, in milliseconds. If
the audio\_end\_ms is greater than the actual audio duration, the server
will respond with an error.
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) audio_end_ms>)
content\_index: number
The index of the content part to truncate. Set this to `0`.
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) content_index>)
item\_id: string
The ID of the assistant message item to truncate. Only assistant message
items can be truncated.
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) item_id>)
type: "conversation.item.truncate"
The event type, must be `conversation.item.truncate`.
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema)>)
ConversationItemTruncatedEvent object { audio\_end\_ms, content\_index, event\_id, 2 more }
Returned when an earlier assistant audio message item is truncated by the
client with a `conversation.item.truncate` event. This event is used to
synchronize the server’s understanding of the audio with the client’s playback.
This action will truncate the audio and remove the server-side text transcript
to ensure there is no text in the context that hasn’t been heard by the user.
audio\_end\_ms: number
The duration up to which the audio was truncated, in milliseconds.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) audio_end_ms>)
content\_index: number
The index of the content part that was truncated.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) content_index>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) event_id>)
item\_id: string
The ID of the assistant message item that was truncated.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) item_id>)
type: "conversation.item.truncated"
The event type, must be `conversation.item.truncated`.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema)>)
ConversationItemWithReference object { id, arguments, call\_id, 7 more }
The item to add to the conversation.
id: optional string
For an item of type (`message` | `function\_call` | `function\_call\_output`)
this field allows the client to assign the unique ID of the item. It is
not required because the server will generate one if not provided.
For an item of type `item\_reference`, this field is required and is a
reference to any item that has previously existed in the conversation.
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) id>)
arguments: optional string
The arguments of the function call (for `function\_call` items).
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) arguments>)
call\_id: optional string
The ID of the function call (for `function\_call` and
`function\_call\_output` items). If passed on a `function\_call\_output`
item, the server will check that a `function\_call` item with the same
ID exists in the conversation history.
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) call_id>)
content: optional array of object { id, audio, text, 2 more }
The content of the message, applicable for `message` items.
* Message items of role `system` support only `input\_text` content
* Message items of role `user` support `input\_text` and `input\_audio`
content
* Message items of role `assistant` support `text` content.
id: optional string
ID of a previous conversation item to reference (for `item\_reference`
content types in `response.create` events). These can reference both
client and server created items.
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) id>)
audio: optional string
Base64-encoded audio bytes, used for `input\_audio` content type.
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) audio>)
text: optional string
The text content, used for `input\_text` and `text` content types.
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) text>)
transcript: optional string
The transcript of the audio, used for `input\_audio` content type.
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) transcript>)
type: optional "input\_audio" or "input\_text" or "item\_reference" or "text"
The content type (`input\_text`, `input\_audio`, `item\_reference`, `text`).
One of the following:
"input\_audio"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) type > (member) 0>)
"input\_text"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) type > (member) 1>)
"item\_reference"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) type > (member) 2>)
"text"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) type > (member) 3>)
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) content>)
name: optional string
The name of the function being called (for `function\_call` items).
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) name>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`.
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) object>)
output: optional string
The output of the function call (for `function\_call\_output` items).
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) output>)
role: optional "user" or "assistant" or "system"
The role of the message sender (`user`, `assistant`, `system`), only
applicable for `message` items.
One of the following:
"user"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) role > (member) 1>)
"system"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) role > (member) 2>)
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) role>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item (`completed`, `incomplete`, `in\_progress`). These have no effect
on the conversation, but are accepted for consistency with the
`conversation.item.created` event.
One of the following:
"completed"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) status>)
type: optional "message" or "function\_call" or "function\_call\_output"
The type of the item (`message`, `function\_call`, `function\_call\_output`, `item\_reference`).
One of the following:
"message"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) type > (member) 0>)
"function\_call"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) type > (member) 1>)
"function\_call\_output"
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) type > (member) 2>)
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_with_reference > (schema)>)
InputAudioBufferAppendEvent object { audio, type, event\_id }
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
audio: string
Base64-encoded audio bytes. This must be in the format specified by the
`input\_audio\_format` field in the session configuration.
[](<#(resource) realtime > (model) input_audio_buffer_append_event > (schema) > (property) audio>)
type: "input\_audio\_buffer.append"
The event type, must be `input\_audio\_buffer.append`.
[](<#(resource) realtime > (model) input_audio_buffer_append_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) input_audio_buffer_append_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) input_audio_buffer_append_event > (schema)>)
InputAudioBufferClearEvent object { type, event\_id }
Send this event to clear the audio bytes in the buffer. The server will
respond with an `input\_audio\_buffer.cleared` event.
type: "input\_audio\_buffer.clear"
The event type, must be `input\_audio\_buffer.clear`.
[](<#(resource) realtime > (model) input_audio_buffer_clear_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) input_audio_buffer_clear_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) input_audio_buffer_clear_event > (schema)>)
InputAudioBufferClearedEvent object { event\_id, type }
Returned when the input audio buffer is cleared by the client with a
`input\_audio\_buffer.clear` event.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_cleared_event > (schema) > (property) event_id>)
type: "input\_audio\_buffer.cleared"
The event type, must be `input\_audio\_buffer.cleared`.
[](<#(resource) realtime > (model) input_audio_buffer_cleared_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_cleared_event > (schema)>)
InputAudioBufferCommitEvent object { type, event\_id }
Send this event to commit the user input audio buffer, which will create a new user message item in the conversation. This event will produce an error if the input audio buffer is empty. When in Server VAD mode, the client does not need to send this event, the server will commit the audio buffer automatically.
Committing the input audio buffer will trigger input audio transcription (if enabled in session configuration), but it will not create a response from the model. The server will respond with an `input\_audio\_buffer.committed` event.
type: "input\_audio\_buffer.commit"
The event type, must be `input\_audio\_buffer.commit`.
[](<#(resource) realtime > (model) input_audio_buffer_commit_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) input_audio_buffer_commit_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) input_audio_buffer_commit_event > (schema)>)
InputAudioBufferCommittedEvent object { event\_id, item\_id, type, previous\_item\_id }
Returned when an input audio buffer is committed, either by the client or
automatically in server VAD mode. The `item\_id` property is the ID of the user
message item that will be created, thus a `conversation.item.created` event
will also be sent to the client.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema) > (property) event_id>)
item\_id: string
The ID of the user message item that will be created.
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema) > (property) item_id>)
type: "input\_audio\_buffer.committed"
The event type, must be `input\_audio\_buffer.committed`.
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema) > (property) type>)
previous\_item\_id: optional string
The ID of the preceding item after which the new item will be inserted.
Can be `null` if the item has no predecessor.
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema)>)
InputAudioBufferDtmfEventReceivedEvent object { event, received\_at, type }
**SIP Only:** Returned when an DTMF event is received. A DTMF event is a message that
represents a telephone keypad press (0–9, \*, #, A–D). The `event` property
is the keypad that the user press. The `received\_at` is the UTC Unix Timestamp
that the server received the event.
event: string
The telephone keypad that was pressed by the user.
[](<#(resource) realtime > (model) input_audio_buffer_dtmf_event_received_event > (schema) > (property) event>)
received\_at: number
UTC Unix Timestamp when DTMF Event was received by server.
[](<#(resource) realtime > (model) input_audio_buffer_dtmf_event_received_event > (schema) > (property) received_at>)
type: "input\_audio\_buffer.dtmf\_event\_received"
The event type, must be `input\_audio\_buffer.dtmf\_event\_received`.
[](<#(resource) realtime > (model) input_audio_buffer_dtmf_event_received_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_dtmf_event_received_event > (schema)>)
InputAudioBufferSpeechStartedEvent object { audio\_start\_ms, event\_id, item\_id, type }
Sent by the server when in `server\_vad` mode to indicate that speech has been
detected in the audio buffer. This can happen any time audio is added to the
buffer (unless speech is already detected). The client may want to use this
event to interrupt audio playback or provide visual feedback to the user.
The client should expect to receive a `input\_audio\_buffer.speech\_stopped` event
when speech stops. The `item\_id` property is the ID of the user message item
that will be created when speech stops and will also be included in the
`input\_audio\_buffer.speech\_stopped` event (unless the client manually commits
the audio buffer during VAD activation).
audio\_start\_ms: number
Milliseconds from the start of all audio written to the buffer during the
session when speech was first detected. This will correspond to the
beginning of audio sent to the model, and thus includes the
`prefix\_padding\_ms` configured in the Session.
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema) > (property) audio_start_ms>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema) > (property) event_id>)
item\_id: string
The ID of the user message item that will be created when speech stops.
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema) > (property) item_id>)
type: "input\_audio\_buffer.speech\_started"
The event type, must be `input\_audio\_buffer.speech\_started`.
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema)>)
InputAudioBufferSpeechStoppedEvent object { audio\_end\_ms, event\_id, item\_id, type }
Returned in `server\_vad` mode when the server detects the end of speech in
the audio buffer. The server will also send an `conversation.item.created`
event with the user message item that is created from the audio buffer.
audio\_end\_ms: number
Milliseconds since the session started when speech stopped. This will
correspond to the end of audio sent to the model, and thus includes the
`min\_silence\_duration\_ms` configured in the Session.
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema) > (property) audio_end_ms>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema) > (property) event_id>)
item\_id: string
The ID of the user message item that will be created.
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema) > (property) item_id>)
type: "input\_audio\_buffer.speech\_stopped"
The event type, must be `input\_audio\_buffer.speech\_stopped`.
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema)>)
InputAudioBufferTimeoutTriggered object { audio\_end\_ms, audio\_start\_ms, event\_id, 2 more }
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
audio\_end\_ms: number
Millisecond offset of audio written to the input audio buffer at the time the timeout was triggered.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) audio_end_ms>)
audio\_start\_ms: number
Millisecond offset of audio written to the input audio buffer that was after the playback time of the last model response.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) audio_start_ms>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) event_id>)
item\_id: string
The ID of the item associated with this segment.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) item_id>)
type: "input\_audio\_buffer.timeout\_triggered"
The event type, must be `input\_audio\_buffer.timeout\_triggered`.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema)>)
LogProbProperties object { token, bytes, logprob }
A log probability object.
token: string
The token that was used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) token>)
bytes: array of number
The bytes that were used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) bytes>)
logprob: number
The log probability of the token.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) logprob>)
[](<#(resource) realtime > (model) log_prob_properties > (schema)>)
McpListToolsCompleted object { event\_id, item\_id, type }
Returned when listing MCP tools has completed for an item.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) mcp_list_tools_completed > (schema) > (property) event_id>)
item\_id: string
The ID of the MCP list tools item.
[](<#(resource) realtime > (model) mcp_list_tools_completed > (schema) > (property) item_id>)
type: "mcp\_list\_tools.completed"
The event type, must be `mcp\_list\_tools.completed`.
[](<#(resource) realtime > (model) mcp_list_tools_completed > (schema) > (property) type>)
[](<#(resource) realtime > (model) mcp_list_tools_completed > (schema)>)
McpListToolsFailed object { event\_id, item\_id, type }
Returned when listing MCP tools has failed for an item.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) mcp_list_tools_failed > (schema) > (property) event_id>)
item\_id: string
The ID of the MCP list tools item.
[](<#(resource) realtime > (model) mcp_list_tools_failed > (schema) > (property) item_id>)
type: "mcp\_list\_tools.failed"
The event type, must be `mcp\_list\_tools.failed`.
[](<#(resource) realtime > (model) mcp_list_tools_failed > (schema) > (property) type>)
[](<#(resource) realtime > (model) mcp_list_tools_failed > (schema)>)
McpListToolsInProgress object { event\_id, item\_id, type }
Returned when listing MCP tools is in progress for an item.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) mcp_list_tools_in_progress > (schema) > (property) event_id>)
item\_id: string
The ID of the MCP list tools item.
[](<#(resource) realtime > (model) mcp_list_tools_in_progress > (schema) > (property) item_id>)
type: "mcp\_list\_tools.in\_progress"
The event type, must be `mcp\_list\_tools.in\_progress`.
[](<#(resource) realtime > (model) mcp_list_tools_in_progress > (schema) > (property) type>)
[](<#(resource) realtime > (model) mcp_list_tools_in_progress > (schema)>)
NoiseReductionType = "near\_field" or "far\_field"
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
One of the following:
"near\_field"
[](<#(resource) realtime > (model) noise_reduction_type > (schema) > (member) 0>)
"far\_field"
[](<#(resource) realtime > (model) noise_reduction_type > (schema) > (member) 1>)
[](<#(resource) realtime > (model) noise_reduction_type > (schema)>)
OutputAudioBufferClearEvent object { type, event\_id }
**WebRTC/SIP Only:** Emit to cut off the current audio response. This will trigger the server to
stop generating audio and emit a `output\_audio\_buffer.cleared` event. This
event should be preceded by a `response.cancel` client event to stop the
generation of the current response.
[Learn more](/docs/guides/realtime-conversations#client-and-server-events-for-audio-in-webrtc).
type: "output\_audio\_buffer.clear"
The event type, must be `output\_audio\_buffer.clear`.
[](<#(resource) realtime > (model) output_audio_buffer_clear_event > (schema) > (property) type>)
event\_id: optional string
The unique ID of the client event used for error handling.
[](<#(resource) realtime > (model) output_audio_buffer_clear_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) output_audio_buffer_clear_event > (schema)>)
RateLimitsUpdatedEvent object { event\_id, rate\_limits, type }
Emitted at the beginning of a Response to indicate the updated rate limits.
When a Response is created some tokens will be “reserved” for the output
tokens, the rate limits shown here reflect that reservation, which is then
adjusted accordingly once the Response is completed.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) event_id>)
rate\_limits: array of object { limit, name, remaining, reset\_seconds }
List of rate limit information.
limit: optional number
The maximum allowed value for the rate limit.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) limit>)
name: optional "requests" or "tokens"
The name of the rate limit (`requests`, `tokens`).
One of the following:
"requests"
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) name > (member) 0>)
"tokens"
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) name > (member) 1>)
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) name>)
remaining: optional number
The remaining value before the limit is reached.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) remaining>)
reset\_seconds: optional number
Seconds until the rate limit resets.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) reset_seconds>)
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits>)
type: "rate\_limits.updated"
The event type, must be `rate\_limits.updated`.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema)>)
RealtimeAudioConfig object { input, output }
Configuration for input and output audio.
input: optional [RealtimeAudioConfigInput](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_config_input > (schema)>) { format, noise\_reduction, transcription, turn\_detection }
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) input>)
output: optional [RealtimeAudioConfigOutput](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_config_output > (schema)>) { format, speed, voice }
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema)>)
RealtimeAudioConfigInput object { format, noise\_reduction, transcription, turn\_detection }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The format of the input audio.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format>)
noise\_reduction: optional object { type }
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
type: optional [NoiseReductionType](</api/reference/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) noise_reduction > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) noise_reduction>)
transcription: optional [AudioTranscription](</api/reference/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration for input audio transcription, defaults to off and can be set to `null` to turn off once on. Input audio transcription is not native to the model, since the model consumes audio directly. Transcription runs asynchronously through [the /audio/transcriptions endpoint](/docs/api-reference/audio/createTranscription) and should be treated as guidance of input audio content rather than precisely what the model heard. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription>)
turn\_detection: optional [RealtimeAudioInputTurnDetection](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema)>)
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with “uhhm”, the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema)>)
RealtimeAudioConfigOutput object { format, speed, voice }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The format of the output audio.
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format>)
speed: optional number
The speed of the model’s spoken response as a multiple of the original speed.
1.0 is the default speed. 0.25 is the minimum speed. 1.5 is the maximum speed. This value can only be changed in between model turns, not while a response is in progress.
This parameter is a post-processing adjustment to the audio after it is generated, it’s
also possible to prompt the model to speak faster or slower.
maximum1.5
minimum0.25
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) speed>)
voice: optional string or "alloy" or "ash" or "ballad" or 7 more or object { id }
The voice the model uses to respond. Supported built-in voices are
`alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`, `shimmer`, `verse`,
`marin`, and `cedar`. You may also provide a custom voice object with
an `id`, for example `{ "id": "voice\_1234" }`. Voice cannot be changed
during the session once the model has responded with audio at least once.
We recommend `marin` and `cedar` for best quality.
One of the following:
string
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 0>)
"alloy" or "ash" or "ballad" or 7 more
One of the following:
"alloy"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 0>)
"ash"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 1>)
"ballad"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 2>)
"coral"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 3>)
"echo"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 4>)
"sage"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 5>)
"shimmer"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 6>)
"verse"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 7>)
"marin"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 8>)
"cedar"
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1>)
ID object { id }
Custom voice reference.
id: string
The custom voice ID, e.g. `voice\_1234`.
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 2 > (property) id>)
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 2>)
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice>)
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema)>)
RealtimeAudioFormats = object { rate, type } or object { type } or object { type }
The PCM audio format. Only a 24kHz sample rate is supported.
One of the following:
PCMAudioFormat object { rate, type }
The PCM audio format. Only a 24kHz sample rate is supported.
rate: optional 24000
The sample rate of the audio. Always `24000`.
[](<#(resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) rate>)
type: optional "audio/pcm"
The audio format. Always `audio/pcm`.
[](<#(resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0>)
PCMUAudioFormat object { type }
The G.711 μ-law format.
type: optional "audio/pcmu"
The audio format. Always `audio/pcmu`.
[](<#(resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1>)
PCMAAudioFormat object { type }
The G.711 A-law format.
type: optional "audio/pcma"
The audio format. Always `audio/pcma`.
[](<#(resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2>)
[](<#(resource) realtime > (model) realtime_audio_formats > (schema)>)
RealtimeAudioInputTurnDetection = object { type, create\_response, idle\_timeout\_ms, 4 more } or object { type, create\_response, eagerness, interrupt\_response }
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with “uhhm”, the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
One of the following:
ServerVad object { type, create\_response, idle\_timeout\_ms, 4 more }
Server-side voice activity detection (VAD) which flips on when user speech is detected and off after a period of silence.
type: "server\_vad"
Type of turn detection, `server\_vad` to turn on simple Server VAD.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) type>)
create\_response: optional boolean
Whether or not to automatically generate a response when a VAD stop event occurs. If `interrupt\_response` is set to `false` this may fail to create a response if the model is already responding.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) create_response>)
idle\_timeout\_ms: optional number
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
interrupt\_response: optional boolean
Whether or not to automatically interrupt (cancel) any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs. If `true` then the response will be cancelled, otherwise it will continue until complete.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) interrupt_response>)
prefix\_padding\_ms: optional number
Used only for `server\_vad` mode. Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) prefix_padding_ms>)
silence\_duration\_ms: optional number
Used only for `server\_vad` mode. Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) silence_duration_ms>)
threshold: optional number
Used only for `server\_vad` mode. Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) threshold>)
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0>)
SemanticVad object { type, create\_response, eagerness, interrupt\_response }
Server-side semantic turn detection which uses a model to determine when the user has finished speaking.
type: "semantic\_vad"
Type of turn detection, `semantic\_vad` to turn on Semantic VAD.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) type>)
create\_response: optional boolean
Whether or not to automatically generate a response when a VAD stop event occurs.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) create_response>)
eagerness: optional "low" or "medium" or "high" or "auto"
Used only for `semantic\_vad` mode. The eagerness of the model to respond. `low` will wait longer for the user to continue speaking, `high` will respond more quickly. `auto` is the default and is equivalent to `medium`. `low`, `medium`, and `high` have max timeouts of 8s, 4s, and 2s respectively.
One of the following:
"low"
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 0>)
"medium"
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 1>)
"high"
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 2>)
"auto"
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 3>)
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness>)
interrupt\_response: optional boolean
Whether or not to automatically interrupt any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs.
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) interrupt_response>)
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema)>)
RealtimeClientEvent = [ConversationItemCreateEvent](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item_create_event > (schema)>) { item, type, event\_id, previous\_item\_id } or [ConversationItemDeleteEvent](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item_delete_event > (schema)>) { item\_id, type, event\_id } or [ConversationItemRetrieveEvent](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item_retrieve_event > (schema)>) { item\_id, type, event\_id } or 8 more
A realtime client event.
One of the following:
ConversationItemCreateEvent object { item, type, event\_id, previous\_item\_id }
Add a new Item to the Conversation’s context, including messages, function
calls, and function call responses. This event can be used both to populate a
“history” of the conversation and to add new items mid-stream, but has the
current limitation that it cannot populate assistant audio messages.
If successful, the server will respond with a `conversation.item.created`
event, otherwise an `error` event will be sent.
item: [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item>)
type: "conversation.item.create"
The event type, must be `conversation.item.create`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) event_id>)
previous\_item\_id: optional string
The ID of the preceding item after which the new item will be inserted. If not set, the new item will be appended to the end of the conversation.
If set to `root`, the new item will be added to the beginning of the conversation.
If set to an existing ID, it allows an item to be inserted mid-conversation. If the ID cannot be found, an error will be returned and the item will not be added.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema)>)
ConversationItemDeleteEvent object { item\_id, type, event\_id }
Send this event when you want to remove any item from the conversation
history. The server will respond with a `conversation.item.deleted` event,
unless the item does not exist in the conversation history, in which case the
server will respond with an error.
item\_id: string
The ID of the item to delete.
[](<#(resource) realtime > (model) conversation_item_delete_event > (schema) > (property) item_id>)
type: "conversation.item.delete"
The event type, must be `conversation.item.delete`.
[](<#(resource) realtime > (model) conversation_item_delete_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) conversation_item_delete_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) conversation_item_delete_event > (schema)>)
ConversationItemRetrieveEvent object { item\_id, type, event\_id }
Send this event when you want to retrieve the server’s representation of a specific item in the conversation history. This is useful, for example, to inspect user audio after noise cancellation and VAD.
The server will respond with a `conversation.item.retrieved` event,
unless the item does not exist in the conversation history, in which case the
server will respond with an error.
item\_id: string
The ID of the item to retrieve.
[](<#(resource) realtime > (model) conversation_item_retrieve_event > (schema) > (property) item_id>)
type: "conversation.item.retrieve"
The event type, must be `conversation.item.retrieve`.
[](<#(resource) realtime > (model) conversation_item_retrieve_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) conversation_item_retrieve_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) conversation_item_retrieve_event > (schema)>)
ConversationItemTruncateEvent object { audio\_end\_ms, content\_index, item\_id, 2 more }
Send this event to truncate a previous assistant message’s audio. The server
will produce audio faster than realtime, so this event is useful when the user
interrupts to truncate audio that has already been sent to the client but not
yet played. This will synchronize the server’s understanding of the audio with
the client’s playback.
Truncating audio will delete the server-side text transcript to ensure there
is not text in the context that hasn’t been heard by the user.
If successful, the server will respond with a `conversation.item.truncated`
event.
audio\_end\_ms: number
Inclusive duration up to which audio is truncated, in milliseconds. If
the audio\_end\_ms is greater than the actual audio duration, the server
will respond with an error.
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) audio_end_ms>)
content\_index: number
The index of the content part to truncate. Set this to `0`.
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) content_index>)
item\_id: string
The ID of the assistant message item to truncate. Only assistant message
items can be truncated.
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) item_id>)
type: "conversation.item.truncate"
The event type, must be `conversation.item.truncate`.
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) conversation_item_truncate_event > (schema)>)
InputAudioBufferAppendEvent object { audio, type, event\_id }
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
audio: string
Base64-encoded audio bytes. This must be in the format specified by the
`input\_audio\_format` field in the session configuration.
[](<#(resource) realtime > (model) input_audio_buffer_append_event > (schema) > (property) audio>)
type: "input\_audio\_buffer.append"
The event type, must be `input\_audio\_buffer.append`.
[](<#(resource) realtime > (model) input_audio_buffer_append_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) input_audio_buffer_append_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) input_audio_buffer_append_event > (schema)>)
InputAudioBufferClearEvent object { type, event\_id }
Send this event to clear the audio bytes in the buffer. The server will
respond with an `input\_audio\_buffer.cleared` event.
type: "input\_audio\_buffer.clear"
The event type, must be `input\_audio\_buffer.clear`.
[](<#(resource) realtime > (model) input_audio_buffer_clear_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) input_audio_buffer_clear_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) input_audio_buffer_clear_event > (schema)>)
OutputAudioBufferClearEvent object { type, event\_id }
**WebRTC/SIP Only:** Emit to cut off the current audio response. This will trigger the server to
stop generating audio and emit a `output\_audio\_buffer.cleared` event. This
event should be preceded by a `response.cancel` client event to stop the
generation of the current response.
[Learn more](/docs/guides/realtime-conversations#client-and-server-events-for-audio-in-webrtc).
type: "output\_audio\_buffer.clear"
The event type, must be `output\_audio\_buffer.clear`.
[](<#(resource) realtime > (model) output_audio_buffer_clear_event > (schema) > (property) type>)
event\_id: optional string
The unique ID of the client event used for error handling.
[](<#(resource) realtime > (model) output_audio_buffer_clear_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) output_audio_buffer_clear_event > (schema)>)
InputAudioBufferCommitEvent object { type, event\_id }
Send this event to commit the user input audio buffer, which will create a new user message item in the conversation. This event will produce an error if the input audio buffer is empty. When in Server VAD mode, the client does not need to send this event, the server will commit the audio buffer automatically.
Committing the input audio buffer will trigger input audio transcription (if enabled in session configuration), but it will not create a response from the model. The server will respond with an `input\_audio\_buffer.committed` event.
type: "input\_audio\_buffer.commit"
The event type, must be `input\_audio\_buffer.commit`.
[](<#(resource) realtime > (model) input_audio_buffer_commit_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) input_audio_buffer_commit_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) input_audio_buffer_commit_event > (schema)>)
ResponseCancelEvent object { type, event\_id, response\_id }
Send this event to cancel an in-progress response. The server will respond
with a `response.done` event with a status of `response.status=cancelled`. If
there is no response to cancel, the server will respond with an error. It’s safe
to call `response.cancel` even if no response is in progress, an error will be
returned the session will remain unaffected.
type: "response.cancel"
The event type, must be `response.cancel`.
[](<#(resource) realtime > (model) response_cancel_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) response_cancel_event > (schema) > (property) event_id>)
response\_id: optional string
A specific response ID to cancel - if not provided, will cancel an
in-progress response in the default conversation.
[](<#(resource) realtime > (model) response_cancel_event > (schema) > (property) response_id>)
[](<#(resource) realtime > (model) response_cancel_event > (schema)>)
ResponseCreateEvent object { type, event\_id, response }
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
type: "response.create"
The event type, must be `response.create`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) event_id>)
response: optional [RealtimeResponseCreateParams](</api/reference/resources/realtime#(resource) realtime > (model) realtime_response_create_params > (schema)>) { audio, conversation, input, 7 more }
Create a new Realtime response with these parameters
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response>)
[](<#(resource) realtime > (model) response_create_event > (schema)>)
SessionUpdateEvent object { session, type, event\_id }
Send this event to update the session’s configuration.
The client may send this event at any time to update any field
except for `voice` and `model`. `voice` can be updated only if there have been no other audio outputs yet.
When the server receives a `session.update`, it will respond
with a `session.updated` event showing the full, effective configuration.
Only the fields that are present in the `session.update` are updated. To clear a field like
`instructions`, pass an empty string. To clear a field like `tools`, pass an empty array.
To clear a field like `turn\_detection`, pass `null`.
session: [RealtimeSessionCreateRequest](</api/reference/resources/realtime#(resource) realtime > (model) realtime_session_create_request > (schema)>) { type, audio, include, 9 more } or [RealtimeTranscriptionSessionCreateRequest](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>) { type, audio, include }
Update the Realtime session. Choose either a realtime
session or a transcription session.
One of the following:
RealtimeSessionCreateRequest object { type, audio, include, 9 more }
Realtime session object configuration.
type: "realtime"
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) type>)
audio: optional [RealtimeAudioConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_config > (schema)>) { input, output }
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) include>)
instructions: optional string
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) instructions>)
max\_output\_tokens: optional number or "inf"
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
number
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 0>)
"inf"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens>)
model: optional string or "gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 0>)
"gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
"gpt-realtime"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 0>)
"gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 1>)
"gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 2>)
"gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 3>)
"gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 4>)
"gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 5>)
"gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 6>)
"gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 7>)
"gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 8>)
"gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 9>)
"gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 10>)
"gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 11>)
"gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 12>)
"gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 13>)
"gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 14>)
"gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model>)
output\_modalities: optional array of "text" or "audio"
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
"text"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 0>)
"audio"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities>)
prompt: optional [ResponsePrompt](</api/reference/resources/responses#(resource) responses > (model) response_prompt > (schema)>) { id, variables, version }
Reference to a prompt template and its variables.
[Learn more](/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt>)
tool\_choice: optional [RealtimeToolChoiceConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice>)
tools: optional [RealtimeToolsConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tools_config > (schema)>) { , McpTool }
Tools available to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools>)
tracing: optional [RealtimeTracingConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tracing_config > (schema)>)
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing>)
truncation: optional [RealtimeTruncation](</api/reference/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema)>)
RealtimeTranscriptionSessionCreateRequest object { type, audio, include }
Realtime transcription session object configuration.
type: "transcription"
The type of session to create. Always `transcription` for transcription sessions.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) type>)
audio: optional [RealtimeTranscriptionSessionAudio](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>) { input }
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) include>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>)
[](<#(resource) realtime > (model) session_update_event > (schema) > (property) session>)
type: "session.update"
The event type, must be `session.update`.
[](<#(resource) realtime > (model) session_update_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event. This is an arbitrary string that a client may assign. It will be passed back if there is an error with the event, but the corresponding `session.updated` event will not include it.
maxLength512
[](<#(resource) realtime > (model) session_update_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) session_update_event > (schema)>)
[](<#(resource) realtime > (model) realtime_client_event > (schema)>)
RealtimeConversationItemAssistantMessage object { content, role, type, 3 more }
An assistant message item in a Realtime conversation.
content: array of object { audio, text, transcript, type }
The content of the message.
audio: optional string
Base64-encoded audio bytes, these will be parsed as the format specified in the session output audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) audio>)
text: optional string
The text content.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) text>)
transcript: optional string
The transcript of the audio content, this will always be present if the output type is `audio`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) transcript>)
type: optional "output\_text" or "output\_audio"
The content type, `output\_text` or `output\_audio` depending on the session `output\_modalities` configuration.
One of the following:
"output\_text"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
"output\_audio"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content>)
role: "assistant"
The role of the message sender. Always `assistant`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema)>)
RealtimeConversationItemFunctionCall object { arguments, name, type, 4 more }
A function call item in a Realtime conversation.
arguments: string
The arguments of the function call. This is a JSON-encoded string representing the arguments passed to the function, for example `{"arg1": "value1", "arg2": 42}`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) arguments>)
name: string
The name of the function being called.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) name>)
type: "function\_call"
The type of the item. Always `function\_call`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) id>)
call\_id: optional string
The ID of the function call.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) call_id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema)>)
RealtimeConversationItemFunctionCallOutput object { call\_id, output, type, 3 more }
A function call output item in a Realtime conversation.
call\_id: string
The ID of the function call this output is for.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) call_id>)
output: string
The output of the function call, this is free text and can contain any information or simply be empty.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) output>)
type: "function\_call\_output"
The type of the item. Always `function\_call\_output`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema)>)
RealtimeConversationItemSystemMessage object { content, role, type, 3 more }
A system message in a Realtime conversation can be used to provide additional context or instructions to the model. This is similar but distinct from the instruction prompt provided at the start of a conversation, as system messages can be added at any point in the conversation. For major changes to the conversation’s behavior, use instructions, but for smaller updates (e.g. “the user is now asking about a different topic”), use system messages.
content: array of object { text, type }
The content of the message.
text: optional string
The text content.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) text>)
type: optional "input\_text"
The content type. Always `input\_text` for system messages.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content>)
role: "system"
The role of the message sender. Always `system`.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema)>)
RealtimeConversationItemUserMessage object { content, role, type, 3 more }
A user message item in a Realtime conversation.
content: array of object { audio, detail, image\_url, 3 more }
The content of the message.
audio: optional string
Base64-encoded audio bytes (for `input\_audio`), these will be parsed as the format specified in the session input audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) audio>)
detail: optional "auto" or "low" or "high"
The detail level of the image (for `input\_image`). `auto` will default to `high`.
One of the following:
"auto"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 0>)
"low"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 1>)
"high"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail>)
image\_url: optional string
Base64-encoded image bytes (for `input\_image`) as a data URI. For example `data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...`. Supported formats are PNG and JPEG.
formaturi
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) image_url>)
text: optional string
The text content (for `input\_text`).
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) text>)
transcript: optional string
Transcript of the audio (for `input\_audio`). This is not sent to the model, but will be attached to the message item for reference.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) transcript>)
type: optional "input\_text" or "input\_audio" or "input\_image"
The content type (`input\_text`, `input\_audio`, or `input\_image`).
One of the following:
"input\_text"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
"input\_audio"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
"input\_image"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content>)
role: "user"
The role of the message sender. Always `user`.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema)>)
RealtimeError object { message, type, code, 2 more }
Details of the error.
message: string
A human-readable error message.
[](<#(resource) realtime > (model) realtime_error > (schema) > (property) message>)
type: string
The type of error (e.g., “invalid\_request\_error”, “server\_error”).
[](<#(resource) realtime > (model) realtime_error > (schema) > (property) type>)
code: optional string
Error code, if any.
[](<#(resource) realtime > (model) realtime_error > (schema) > (property) code>)
event\_id: optional string
The event\_id of the client event that caused the error, if applicable.
[](<#(resource) realtime > (model) realtime_error > (schema) > (property) event_id>)
param: optional string
Parameter related to the error, if any.
[](<#(resource) realtime > (model) realtime_error > (schema) > (property) param>)
[](<#(resource) realtime > (model) realtime_error > (schema)>)
RealtimeErrorEvent object { error, event\_id, type }
Returned when an error occurs, which could be a client problem or a server
problem. Most errors are recoverable and the session will stay open, we
recommend to implementors to monitor and log error messages by default.
error: [RealtimeError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_error > (schema)>) { message, type, code, 2 more }
Details of the error.
[](<#(resource) realtime > (model) realtime_error_event > (schema) > (property) error>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) realtime_error_event > (schema) > (property) event_id>)
type: "error"
The event type, must be `error`.
[](<#(resource) realtime > (model) realtime_error_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_error_event > (schema)>)
RealtimeFunctionTool object { description, name, parameters, type }
description: optional string
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
name: optional string
The name of the function.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
parameters: optional unknown
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
type: optional "function"
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_function_tool > (schema)>)
RealtimeMcpApprovalRequest object { id, arguments, name, 2 more }
A Realtime item requesting human approval of a tool invocation.
id: string
The unique ID of the approval request.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) id>)
arguments: string
A JSON string of arguments for the tool.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) arguments>)
name: string
The name of the tool to run.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) name>)
server\_label: string
The label of the MCP server making the request.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) server_label>)
type: "mcp\_approval\_request"
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema)>)
RealtimeMcpApprovalResponse object { id, approval\_request\_id, approve, 2 more }
A Realtime item responding to an MCP approval request.
id: string
The unique ID of the approval response.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) id>)
approval\_request\_id: string
The ID of the approval request being answered.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approval_request_id>)
approve: boolean
Whether the request was approved.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approve>)
type: "mcp\_approval\_response"
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) type>)
reason: optional string
Optional reason for the decision.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) reason>)
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema)>)
RealtimeMcpListTools object { server\_label, tools, type, id }
A Realtime item listing tools available on an MCP server.
server\_label: string
The label of the MCP server.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) server_label>)
tools: array of object { input\_schema, name, annotations, description }
The tools available on the server.
input\_schema: unknown
The JSON schema describing the tool’s input.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) input_schema>)
name: string
The name of the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) name>)
annotations: optional unknown
Additional annotations about the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) annotations>)
description: optional string
The description of the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) description>)
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools>)
type: "mcp\_list\_tools"
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) type>)
id: optional string
The unique ID of the list.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) id>)
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema)>)
RealtimeMcpProtocolError object { code, message, type }
code: number
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) code>)
message: string
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) message>)
type: "protocol\_error"
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema)>)
RealtimeMcpToolCall object { id, arguments, name, 5 more }
A Realtime item representing an invocation of a tool on an MCP server.
id: string
The unique ID of the tool call.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) id>)
arguments: string
A JSON string of the arguments passed to the tool.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) arguments>)
name: string
The name of the tool that was run.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) name>)
server\_label: string
The label of the MCP server running the tool.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) server_label>)
type: "mcp\_call"
The type of the item. Always `mcp\_call`.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) type>)
approval\_request\_id: optional string
The ID of an associated approval request, if any.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) approval_request_id>)
error: optional [RealtimeMcpProtocolError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcp_protocol_error > (schema)>) { code, message, type } or [RealtimeMcpToolExecutionError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>) { message, type } or [RealtimeMcphttpError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcphttp_error > (schema)>) { code, message, type }
The error from the tool call, if any.
One of the following:
RealtimeMcpProtocolError object { code, message, type }
code: number
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) code>)
message: string
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) message>)
type: "protocol\_error"
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema)>)
RealtimeMcpToolExecutionError object { message, type }
message: string
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) message>)
type: "tool\_execution\_error"
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>)
RealtimeMcphttpError object { code, message, type }
code: number
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) code>)
message: string
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) message>)
type: "http\_error"
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema)>)
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) error>)
output: optional string
The output from the tool call.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) output>)
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema)>)
RealtimeMcpToolExecutionError object { message, type }
message: string
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) message>)
type: "tool\_execution\_error"
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>)
RealtimeMcphttpError object { code, message, type }
code: number
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) code>)
message: string
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) message>)
type: "http\_error"
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema)>)
RealtimeResponse object { id, audio, conversation\_id, 8 more }
The response resource.
id: optional string
The unique ID of the response, will look like `resp\_1234`.
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) id>)
audio: optional object { output }
Configuration for audio output.
output: optional object { format, voice }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The format of the output audio.
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) format>)
voice: optional string or "alloy" or "ash" or "ballad" or 7 more
The voice the model uses to respond. Voice cannot be changed during the
session once the model has responded with audio at least once. Current
voice options are `alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`,
`shimmer`, `verse`, `marin`, and `cedar`. We recommend `marin` and `cedar` for
best quality.
One of the following:
string
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 0>)
"alloy" or "ash" or "ballad" or 7 more
The voice the model uses to respond. Voice cannot be changed during the
session once the model has responded with audio at least once. Current
voice options are `alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`,
`shimmer`, `verse`, `marin`, and `cedar`. We recommend `marin` and `cedar` for
best quality.
One of the following:
"alloy"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 0>)
"ash"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 1>)
"ballad"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 2>)
"coral"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 3>)
"echo"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 4>)
"sage"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 5>)
"shimmer"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 6>)
"verse"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 7>)
"marin"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 8>)
"cedar"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1>)
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output > (property) voice>)
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio > (property) output>)
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) audio>)
conversation\_id: optional string
Which conversation the response is added to, determined by the `conversation`
field in the `response.create` event. If `auto`, the response will be added to
the default conversation and the value of `conversation\_id` will be an id like
`conv\_1234`. If `none`, the response will not be added to any conversation and
the value of `conversation\_id` will be `null`. If responses are being triggered
automatically by VAD the response will be added to the default conversation
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) conversation_id>)
max\_output\_tokens: optional number or "inf"
Maximum number of output tokens for a single assistant response,
inclusive of tool calls, that was used in this response.
One of the following:
number
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) max_output_tokens > (variant) 0>)
"inf"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) max_output_tokens>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) metadata>)
object: optional "realtime.response"
The object type, must be `realtime.response`.
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) object>)
output: optional array of [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
The list of output items generated by the response.
One of the following:
RealtimeConversationItemSystemMessage object { content, role, type, 3 more }
A system message in a Realtime conversation can be used to provide additional context or instructions to the model. This is similar but distinct from the instruction prompt provided at the start of a conversation, as system messages can be added at any point in the conversation. For major changes to the conversation’s behavior, use instructions, but for smaller updates (e.g. “the user is now asking about a different topic”), use system messages.
content: array of object { text, type }
The content of the message.
text: optional string
The text content.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) text>)
type: optional "input\_text"
The content type. Always `input\_text` for system messages.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content>)
role: "system"
The role of the message sender. Always `system`.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema)>)
RealtimeConversationItemUserMessage object { content, role, type, 3 more }
A user message item in a Realtime conversation.
content: array of object { audio, detail, image\_url, 3 more }
The content of the message.
audio: optional string
Base64-encoded audio bytes (for `input\_audio`), these will be parsed as the format specified in the session input audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) audio>)
detail: optional "auto" or "low" or "high"
The detail level of the image (for `input\_image`). `auto` will default to `high`.
One of the following:
"auto"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 0>)
"low"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 1>)
"high"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail>)
image\_url: optional string
Base64-encoded image bytes (for `input\_image`) as a data URI. For example `data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...`. Supported formats are PNG and JPEG.
formaturi
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) image_url>)
text: optional string
The text content (for `input\_text`).
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) text>)
transcript: optional string
Transcript of the audio (for `input\_audio`). This is not sent to the model, but will be attached to the message item for reference.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) transcript>)
type: optional "input\_text" or "input\_audio" or "input\_image"
The content type (`input\_text`, `input\_audio`, or `input\_image`).
One of the following:
"input\_text"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
"input\_audio"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
"input\_image"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content>)
role: "user"
The role of the message sender. Always `user`.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema)>)
RealtimeConversationItemAssistantMessage object { content, role, type, 3 more }
An assistant message item in a Realtime conversation.
content: array of object { audio, text, transcript, type }
The content of the message.
audio: optional string
Base64-encoded audio bytes, these will be parsed as the format specified in the session output audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) audio>)
text: optional string
The text content.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) text>)
transcript: optional string
The transcript of the audio content, this will always be present if the output type is `audio`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) transcript>)
type: optional "output\_text" or "output\_audio"
The content type, `output\_text` or `output\_audio` depending on the session `output\_modalities` configuration.
One of the following:
"output\_text"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
"output\_audio"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content>)
role: "assistant"
The role of the message sender. Always `assistant`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema)>)
RealtimeConversationItemFunctionCall object { arguments, name, type, 4 more }
A function call item in a Realtime conversation.
arguments: string
The arguments of the function call. This is a JSON-encoded string representing the arguments passed to the function, for example `{"arg1": "value1", "arg2": 42}`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) arguments>)
name: string
The name of the function being called.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) name>)
type: "function\_call"
The type of the item. Always `function\_call`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) id>)
call\_id: optional string
The ID of the function call.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) call_id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema)>)
RealtimeConversationItemFunctionCallOutput object { call\_id, output, type, 3 more }
A function call output item in a Realtime conversation.
call\_id: string
The ID of the function call this output is for.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) call_id>)
output: string
The output of the function call, this is free text and can contain any information or simply be empty.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) output>)
type: "function\_call\_output"
The type of the item. Always `function\_call\_output`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema)>)
RealtimeMcpApprovalResponse object { id, approval\_request\_id, approve, 2 more }
A Realtime item responding to an MCP approval request.
id: string
The unique ID of the approval response.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) id>)
approval\_request\_id: string
The ID of the approval request being answered.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approval_request_id>)
approve: boolean
Whether the request was approved.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approve>)
type: "mcp\_approval\_response"
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) type>)
reason: optional string
Optional reason for the decision.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) reason>)
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema)>)
RealtimeMcpListTools object { server\_label, tools, type, id }
A Realtime item listing tools available on an MCP server.
server\_label: string
The label of the MCP server.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) server_label>)
tools: array of object { input\_schema, name, annotations, description }
The tools available on the server.
input\_schema: unknown
The JSON schema describing the tool’s input.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) input_schema>)
name: string
The name of the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) name>)
annotations: optional unknown
Additional annotations about the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) annotations>)
description: optional string
The description of the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) description>)
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools>)
type: "mcp\_list\_tools"
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) type>)
id: optional string
The unique ID of the list.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) id>)
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema)>)
RealtimeMcpToolCall object { id, arguments, name, 5 more }
A Realtime item representing an invocation of a tool on an MCP server.
id: string
The unique ID of the tool call.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) id>)
arguments: string
A JSON string of the arguments passed to the tool.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) arguments>)
name: string
The name of the tool that was run.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) name>)
server\_label: string
The label of the MCP server running the tool.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) server_label>)
type: "mcp\_call"
The type of the item. Always `mcp\_call`.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) type>)
approval\_request\_id: optional string
The ID of an associated approval request, if any.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) approval_request_id>)
error: optional [RealtimeMcpProtocolError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcp_protocol_error > (schema)>) { code, message, type } or [RealtimeMcpToolExecutionError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>) { message, type } or [RealtimeMcphttpError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcphttp_error > (schema)>) { code, message, type }
The error from the tool call, if any.
One of the following:
RealtimeMcpProtocolError object { code, message, type }
code: number
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) code>)
message: string
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) message>)
type: "protocol\_error"
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema)>)
RealtimeMcpToolExecutionError object { message, type }
message: string
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) message>)
type: "tool\_execution\_error"
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>)
RealtimeMcphttpError object { code, message, type }
code: number
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) code>)
message: string
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) message>)
type: "http\_error"
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema)>)
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) error>)
output: optional string
The output from the tool call.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) output>)
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema)>)
RealtimeMcpApprovalRequest object { id, arguments, name, 2 more }
A Realtime item requesting human approval of a tool invocation.
id: string
The unique ID of the approval request.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) id>)
arguments: string
A JSON string of arguments for the tool.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) arguments>)
name: string
The name of the tool to run.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) name>)
server\_label: string
The label of the MCP server making the request.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) server_label>)
type: "mcp\_approval\_request"
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema)>)
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) output>)
output\_modalities: optional array of "text" or "audio"
The set of modalities the model used to respond, currently the only possible values are
`[\\"audio\\"]`, `[\\"text\\"]`. Audio output always include a text transcript. Setting the
output to mode `text` will disable audio output from the model.
One of the following:
"text"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) output_modalities > (items) > (member) 0>)
"audio"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) output_modalities>)
status: optional "completed" or "cancelled" or "failed" or 2 more
The final status of the response (`completed`, `cancelled`, `failed`, or
`incomplete`, `in\_progress`).
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) status > (member) 0>)
"cancelled"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) status > (member) 1>)
"failed"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) status > (member) 2>)
"incomplete"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) status > (member) 3>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) status > (member) 4>)
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) status>)
status\_details: optional [RealtimeResponseStatus](</api/reference/resources/realtime#(resource) realtime > (model) realtime_response_status > (schema)>) { error, reason, type }
Additional details about the status.
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) status_details>)
usage: optional [RealtimeResponseUsage](</api/reference/resources/realtime#(resource) realtime > (model) realtime_response_usage > (schema)>) { input\_token\_details, input\_tokens, output\_token\_details, 2 more }
Usage statistics for the Response, this will correspond to billing. A
Realtime API session will maintain a conversation context and append new
Items to the Conversation, thus output from previous turns (text and
audio tokens) will become the input for later turns.
[](<#(resource) realtime > (model) realtime_response > (schema) > (property) usage>)
[](<#(resource) realtime > (model) realtime_response > (schema)>)
RealtimeResponseCreateAudioOutput object { output }
Configuration for audio input and output.
output: optional object { format, voice }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The format of the output audio.
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) format>)
voice: optional string or "alloy" or "ash" or "ballad" or 7 more or object { id }
The voice the model uses to respond. Supported built-in voices are
`alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`, `shimmer`, `verse`,
`marin`, and `cedar`. You may also provide a custom voice object with
an `id`, for example `{ "id": "voice\_1234" }`. Voice cannot be changed
during the session once the model has responded with audio at least once.
We recommend `marin` and `cedar` for best quality.
One of the following:
string
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 0>)
"alloy" or "ash" or "ballad" or 7 more
One of the following:
"alloy"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 0>)
"ash"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 1>)
"ballad"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 2>)
"coral"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 3>)
"echo"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 4>)
"sage"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 5>)
"shimmer"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 6>)
"verse"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 7>)
"marin"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 8>)
"cedar"
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1>)
ID object { id }
Custom voice reference.
id: string
The custom voice ID, e.g. `voice\_1234`.
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 2 > (property) id>)
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 2>)
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice>)
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output>)
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema)>)
RealtimeResponseCreateParams object { audio, conversation, input, 7 more }
Create a new Realtime response with these parameters
audio: optional [RealtimeResponseCreateAudioOutput](</api/reference/resources/realtime#(resource) realtime > (model) realtime_response_create_audio_output > (schema)>) { output }
Configuration for audio input and output.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio>)
conversation: optional string or "auto" or "none"
Controls which conversation the response is added to. Currently supports
`auto` and `none`, with `auto` as the default value. The `auto` value
means that the contents of the response will be added to the default
conversation. Set this to `none` to create an out-of-band response which
will not add items to default conversation.
One of the following:
string
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) conversation > (variant) 0>)
"auto" or "none"
Controls which conversation the response is added to. Currently supports
`auto` and `none`, with `auto` as the default value. The `auto` value
means that the contents of the response will be added to the default
conversation. Set this to `none` to create an out-of-band response which
will not add items to default conversation.
One of the following:
"auto"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) conversation > (variant) 1 > (member) 0>)
"none"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) conversation > (variant) 1 > (member) 1>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) conversation > (variant) 1>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) conversation>)
input: optional array of [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
Input items to include in the prompt for the model. Using this field
creates a new context for this Response instead of using the default
conversation. An empty array `[]` will clear the context for this Response.
Note that this can include references to items that previously appeared in the session
using their id.
One of the following:
RealtimeConversationItemSystemMessage object { content, role, type, 3 more }
A system message in a Realtime conversation can be used to provide additional context or instructions to the model. This is similar but distinct from the instruction prompt provided at the start of a conversation, as system messages can be added at any point in the conversation. For major changes to the conversation’s behavior, use instructions, but for smaller updates (e.g. “the user is now asking about a different topic”), use system messages.
content: array of object { text, type }
The content of the message.
text: optional string
The text content.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) text>)
type: optional "input\_text"
The content type. Always `input\_text` for system messages.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content>)
role: "system"
The role of the message sender. Always `system`.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_system_message > (schema)>)
RealtimeConversationItemUserMessage object { content, role, type, 3 more }
A user message item in a Realtime conversation.
content: array of object { audio, detail, image\_url, 3 more }
The content of the message.
audio: optional string
Base64-encoded audio bytes (for `input\_audio`), these will be parsed as the format specified in the session input audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) audio>)
detail: optional "auto" or "low" or "high"
The detail level of the image (for `input\_image`). `auto` will default to `high`.
One of the following:
"auto"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 0>)
"low"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 1>)
"high"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail>)
image\_url: optional string
Base64-encoded image bytes (for `input\_image`) as a data URI. For example `data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...`. Supported formats are PNG and JPEG.
formaturi
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) image_url>)
text: optional string
The text content (for `input\_text`).
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) text>)
transcript: optional string
Transcript of the audio (for `input\_audio`). This is not sent to the model, but will be attached to the message item for reference.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) transcript>)
type: optional "input\_text" or "input\_audio" or "input\_image"
The content type (`input\_text`, `input\_audio`, or `input\_image`).
One of the following:
"input\_text"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
"input\_audio"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
"input\_image"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content>)
role: "user"
The role of the message sender. Always `user`.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_user_message > (schema)>)
RealtimeConversationItemAssistantMessage object { content, role, type, 3 more }
An assistant message item in a Realtime conversation.
content: array of object { audio, text, transcript, type }
The content of the message.
audio: optional string
Base64-encoded audio bytes, these will be parsed as the format specified in the session output audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) audio>)
text: optional string
The text content.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) text>)
transcript: optional string
The transcript of the audio content, this will always be present if the output type is `audio`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) transcript>)
type: optional "output\_text" or "output\_audio"
The content type, `output\_text` or `output\_audio` depending on the session `output\_modalities` configuration.
One of the following:
"output\_text"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
"output\_audio"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content>)
role: "assistant"
The role of the message sender. Always `assistant`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_assistant_message > (schema)>)
RealtimeConversationItemFunctionCall object { arguments, name, type, 4 more }
A function call item in a Realtime conversation.
arguments: string
The arguments of the function call. This is a JSON-encoded string representing the arguments passed to the function, for example `{"arg1": "value1", "arg2": 42}`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) arguments>)
name: string
The name of the function being called.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) name>)
type: "function\_call"
The type of the item. Always `function\_call`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) id>)
call\_id: optional string
The ID of the function call.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) call_id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call > (schema)>)
RealtimeConversationItemFunctionCallOutput object { call\_id, output, type, 3 more }
A function call output item in a Realtime conversation.
call\_id: string
The ID of the function call this output is for.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) call_id>)
output: string
The output of the function call, this is free text and can contain any information or simply be empty.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) output>)
type: "function\_call\_output"
The type of the item. Always `function\_call\_output`.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status>)
[](<#(resource) realtime > (model) realtime_conversation_item_function_call_output > (schema)>)
RealtimeMcpApprovalResponse object { id, approval\_request\_id, approve, 2 more }
A Realtime item responding to an MCP approval request.
id: string
The unique ID of the approval response.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) id>)
approval\_request\_id: string
The ID of the approval request being answered.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approval_request_id>)
approve: boolean
Whether the request was approved.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approve>)
type: "mcp\_approval\_response"
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) type>)
reason: optional string
Optional reason for the decision.
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) reason>)
[](<#(resource) realtime > (model) realtime_mcp_approval_response > (schema)>)
RealtimeMcpListTools object { server\_label, tools, type, id }
A Realtime item listing tools available on an MCP server.
server\_label: string
The label of the MCP server.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) server_label>)
tools: array of object { input\_schema, name, annotations, description }
The tools available on the server.
input\_schema: unknown
The JSON schema describing the tool’s input.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) input_schema>)
name: string
The name of the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) name>)
annotations: optional unknown
Additional annotations about the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) annotations>)
description: optional string
The description of the tool.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) description>)
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools>)
type: "mcp\_list\_tools"
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) type>)
id: optional string
The unique ID of the list.
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) id>)
[](<#(resource) realtime > (model) realtime_mcp_list_tools > (schema)>)
RealtimeMcpToolCall object { id, arguments, name, 5 more }
A Realtime item representing an invocation of a tool on an MCP server.
id: string
The unique ID of the tool call.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) id>)
arguments: string
A JSON string of the arguments passed to the tool.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) arguments>)
name: string
The name of the tool that was run.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) name>)
server\_label: string
The label of the MCP server running the tool.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) server_label>)
type: "mcp\_call"
The type of the item. Always `mcp\_call`.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) type>)
approval\_request\_id: optional string
The ID of an associated approval request, if any.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) approval_request_id>)
error: optional [RealtimeMcpProtocolError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcp_protocol_error > (schema)>) { code, message, type } or [RealtimeMcpToolExecutionError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>) { message, type } or [RealtimeMcphttpError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcphttp_error > (schema)>) { code, message, type }
The error from the tool call, if any.
One of the following:
RealtimeMcpProtocolError object { code, message, type }
code: number
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) code>)
message: string
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) message>)
type: "protocol\_error"
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_protocol_error > (schema)>)
RealtimeMcpToolExecutionError object { message, type }
message: string
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) message>)
type: "tool\_execution\_error"
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>)
RealtimeMcphttpError object { code, message, type }
code: number
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) code>)
message: string
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) message>)
type: "http\_error"
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcphttp_error > (schema)>)
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) error>)
output: optional string
The output from the tool call.
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) output>)
[](<#(resource) realtime > (model) realtime_mcp_tool_call > (schema)>)
RealtimeMcpApprovalRequest object { id, arguments, name, 2 more }
A Realtime item requesting human approval of a tool invocation.
id: string
The unique ID of the approval request.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) id>)
arguments: string
A JSON string of arguments for the tool.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) arguments>)
name: string
The name of the tool to run.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) name>)
server\_label: string
The label of the MCP server making the request.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) server_label>)
type: "mcp\_approval\_request"
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_mcp_approval_request > (schema)>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) input>)
instructions: optional string
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) instructions>)
max\_output\_tokens: optional number or "inf"
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
number
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) max_output_tokens > (variant) 0>)
"inf"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) max_output_tokens>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) metadata>)
output\_modalities: optional array of "text" or "audio"
The set of modalities the model used to respond, currently the only possible values are
`[\\"audio\\"]`, `[\\"text\\"]`. Audio output always include a text transcript. Setting the
output to mode `text` will disable audio output from the model.
One of the following:
"text"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) output_modalities > (items) > (member) 0>)
"audio"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) output_modalities>)
prompt: optional [ResponsePrompt](</api/reference/resources/responses#(resource) responses > (model) response_prompt > (schema)>) { id, variables, version }
Reference to a prompt template and its variables.
[Learn more](/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt>)
tool\_choice: optional [ToolChoiceOptions](</api/reference/resources/responses#(resource) responses > (model) tool_choice_options > (schema)>) or [ToolChoiceFunction](</api/reference/resources/responses#(resource) responses > (model) tool_choice_function > (schema)>) { name, type } or [ToolChoiceMcp](</api/reference/resources/responses#(resource) responses > (model) tool_choice_mcp > (schema)>) { server\_label, type, name }
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
One of the following:
ToolChoiceOptions = "none" or "auto" or "required"
Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or
more tools.
`required` means the model must call one or more tools.
One of the following:
"none"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 0>)
"auto"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 1>)
"required"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 2>)
[](<#(resource) responses > (model) tool_choice_options > (schema)>)
ToolChoiceFunction object { name, type }
Use this option to force the model to call a specific function.
name: string
The name of the function to call.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) name>)
type: "function"
For function calling, the type is always `function`.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) type>)
[](<#(resource) responses > (model) tool_choice_function > (schema)>)
ToolChoiceMcp object { server\_label, type, name }
Use this option to force the model to call a specific tool on a remote MCP server.
server\_label: string
The label of the MCP server to use.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) server_label>)
type: "mcp"
For MCP tools, the type is always `mcp`.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) type>)
name: optional string
The name of the tool to call on the server.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) name>)
[](<#(resource) responses > (model) tool_choice_mcp > (schema)>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tool_choice>)
tools: optional array of [RealtimeFunctionTool](</api/reference/resources/realtime#(resource) realtime > (model) realtime_function_tool > (schema)>) { description, name, parameters, type } or object { server\_label, type, allowed\_tools, 7 more }
Tools available to the model.
One of the following:
RealtimeFunctionTool object { description, name, parameters, type }
description: optional string
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
name: optional string
The name of the function.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
parameters: optional unknown
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
type: optional "function"
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_function_tool > (schema)>)
McpTool object { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) type>)
allowed\_tools: optional array of string or object { read\_only, tool\_names }
List of allowed tool names or a filter object.
One of the following:
McpAllowedTools = array of string
A string array of allowed tool names
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 0>)
McpToolFilter object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools>)
authorization: optional string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) authorization>)
connector\_id: optional "connector\_dropbox" or "connector\_gmail" or "connector\_googlecalendar" or 5 more
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](/docs/guides/tools-remote-mcp#connectors).
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
"connector\_dropbox"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 7>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id>)
defer\_loading: optional boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) defer_loading>)
headers: optional map[string]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) headers>)
require\_approval: optional object { always, never } or "always" or "never"
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter object { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always>)
never: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0>)
McpToolApprovalSetting = "always" or "never"
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
"always"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval>)
server\_description: optional string
Optional description of the MCP server, used to provide more context.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) server_description>)
server\_url: optional string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) server_url>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema)>)
RealtimeResponseStatus object { error, reason, type }
Additional details about the status.
error: optional object { code, type }
A description of the error that caused the response to fail,
populated when the `status` is `failed`.
code: optional string
Error code, if any.
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) error > (property) code>)
type: optional string
The type of error.
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) error > (property) type>)
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) error>)
reason: optional "turn\_detected" or "client\_cancelled" or "max\_output\_tokens" or "content\_filter"
The reason the Response did not complete. For a `cancelled` Response, one of `turn\_detected` (the server VAD detected a new start of speech) or `client\_cancelled` (the client sent a cancel event). For an `incomplete` Response, one of `max\_output\_tokens` or `content\_filter` (the server-side safety filter activated and cut off the response).
One of the following:
"turn\_detected"
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) reason > (member) 0>)
"client\_cancelled"
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) reason > (member) 1>)
"max\_output\_tokens"
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) reason > (member) 2>)
"content\_filter"
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) reason > (member) 3>)
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) reason>)
type: optional "completed" or "cancelled" or "failed" or "incomplete"
The type of error that caused the response to fail, corresponding
with the `status` field (`completed`, `cancelled`, `incomplete`,
`failed`).
One of the following:
"completed"
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) type > (member) 0>)
"cancelled"
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) type > (member) 1>)
"failed"
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) type > (member) 2>)
"incomplete"
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) type > (member) 3>)
[](<#(resource) realtime > (model) realtime_response_status > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_response_status > (schema)>)
RealtimeResponseUsage object { input\_token\_details, input\_tokens, output\_token\_details, 2 more }
Usage statistics for the Response, this will correspond to billing. A
Realtime API session will maintain a conversation context and append new
Items to the Conversation, thus output from previous turns (text and
audio tokens) will become the input for later turns.
input\_token\_details: optional [RealtimeResponseUsageInputTokenDetails](</api/reference/resources/realtime#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema)>) { audio\_tokens, cached\_tokens, cached\_tokens\_details, 2 more }
Details about the input tokens used in the Response. Cached tokens are tokens from previous turns in the conversation that are included as context for the current response. Cached tokens here are counted as a subset of input tokens, meaning input tokens will include cached and uncached tokens.
[](<#(resource) realtime > (model) realtime_response_usage > (schema) > (property) input_token_details>)
input\_tokens: optional number
The number of input tokens used in the Response, including text and
audio tokens.
[](<#(resource) realtime > (model) realtime_response_usage > (schema) > (property) input_tokens>)
output\_token\_details: optional [RealtimeResponseUsageOutputTokenDetails](</api/reference/resources/realtime#(resource) realtime > (model) realtime_response_usage_output_token_details > (schema)>) { audio\_tokens, text\_tokens }
Details about the output tokens used in the Response.
[](<#(resource) realtime > (model) realtime_response_usage > (schema) > (property) output_token_details>)
output\_tokens: optional number
The number of output tokens sent in the Response, including text and
audio tokens.
[](<#(resource) realtime > (model) realtime_response_usage > (schema) > (property) output_tokens>)
total\_tokens: optional number
The total number of tokens in the Response including input and output
text and audio tokens.
[](<#(resource) realtime > (model) realtime_response_usage > (schema) > (property) total_tokens>)
[](<#(resource) realtime > (model) realtime_response_usage > (schema)>)
RealtimeResponseUsageInputTokenDetails object { audio\_tokens, cached\_tokens, cached\_tokens\_details, 2 more }
Details about the input tokens used in the Response. Cached tokens are tokens from previous turns in the conversation that are included as context for the current response. Cached tokens here are counted as a subset of input tokens, meaning input tokens will include cached and uncached tokens.
audio\_tokens: optional number
The number of audio tokens used as input for the Response.
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema) > (property) audio_tokens>)
cached\_tokens: optional number
The number of cached tokens used as input for the Response.
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema) > (property) cached_tokens>)
cached\_tokens\_details: optional object { audio\_tokens, image\_tokens, text\_tokens }
Details about the cached tokens used as input for the Response.
audio\_tokens: optional number
The number of cached audio tokens used as input for the Response.
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema) > (property) cached_tokens_details > (property) audio_tokens>)
image\_tokens: optional number
The number of cached image tokens used as input for the Response.
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema) > (property) cached_tokens_details > (property) image_tokens>)
text\_tokens: optional number
The number of cached text tokens used as input for the Response.
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema) > (property) cached_tokens_details > (property) text_tokens>)
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema) > (property) cached_tokens_details>)
image\_tokens: optional number
The number of image tokens used as input for the Response.
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema) > (property) image_tokens>)
text\_tokens: optional number
The number of text tokens used as input for the Response.
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema) > (property) text_tokens>)
[](<#(resource) realtime > (model) realtime_response_usage_input_token_details > (schema)>)
RealtimeResponseUsageOutputTokenDetails object { audio\_tokens, text\_tokens }
Details about the output tokens used in the Response.
audio\_tokens: optional number
The number of audio tokens used in the Response.
[](<#(resource) realtime > (model) realtime_response_usage_output_token_details > (schema) > (property) audio_tokens>)
text\_tokens: optional number
The number of text tokens used in the Response.
[](<#(resource) realtime > (model) realtime_response_usage_output_token_details > (schema) > (property) text_tokens>)
[](<#(resource) realtime > (model) realtime_response_usage_output_token_details > (schema)>)
RealtimeServerEvent = [ConversationCreatedEvent](</api/reference/resources/realtime#(resource) realtime > (model) conversation_created_event > (schema)>) { conversation, event\_id, type } or [ConversationItemCreatedEvent](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item_created_event > (schema)>) { event\_id, item, type, previous\_item\_id } or [ConversationItemDeletedEvent](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item_deleted_event > (schema)>) { event\_id, item\_id, type } or 43 more
A realtime server event.
One of the following:
ConversationCreatedEvent object { conversation, event\_id, type }
Returned when a conversation is created. Emitted right after session creation.
conversation: object { id, object }
The conversation resource.
id: optional string
The unique ID of the conversation.
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) conversation > (property) id>)
object: optional string
The object type, must be `realtime.conversation`.
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) conversation > (property) object>)
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) conversation>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) event_id>)
type: "conversation.created"
The event type, must be `conversation.created`.
[](<#(resource) realtime > (model) conversation_created_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_created_event > (schema)>)
ConversationItemCreatedEvent object { event\_id, item, type, previous\_item\_id }
Returned when a conversation item is created. There are several scenarios that produce this event:
* The server is generating a Response, which if successful will produce
either one or two Items, which will be of type `message`
(role `assistant`) or type `function\_call`.
* The input audio buffer has been committed, either by the client or the
server (in `server\_vad` mode). The server will take the content of the
input audio buffer and add it to a new user message Item.
* The client has sent a `conversation.item.create` event to add a new Item
to the Conversation.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_created_event > (schema) > (property) event_id>)
item: [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) conversation_item_created_event > (schema) > (property) item>)
type: "conversation.item.created"
The event type, must be `conversation.item.created`.
[](<#(resource) realtime > (model) conversation_item_created_event > (schema) > (property) type>)
previous\_item\_id: optional string
The ID of the preceding item in the Conversation context, allows the
client to understand the order of the conversation. Can be `null` if the
item has no predecessor.
[](<#(resource) realtime > (model) conversation_item_created_event > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) conversation_item_created_event > (schema)>)
ConversationItemDeletedEvent object { event\_id, item\_id, type }
Returned when an item in the conversation is deleted by the client with a
`conversation.item.delete` event. This event is used to synchronize the
server’s understanding of the conversation history with the client’s view.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_deleted_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item that was deleted.
[](<#(resource) realtime > (model) conversation_item_deleted_event > (schema) > (property) item_id>)
type: "conversation.item.deleted"
The event type, must be `conversation.item.deleted`.
[](<#(resource) realtime > (model) conversation_item_deleted_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_deleted_event > (schema)>)
ConversationItemInputAudioTranscriptionCompletedEvent object { content\_index, event\_id, item\_id, 4 more }
This event is the output of audio transcription for user audio written to the
user audio buffer. Transcription begins when the input audio buffer is
committed by the client or server (when VAD is enabled). Transcription runs
asynchronously with Response creation, so this event may come before or after
the Response events.
Realtime API models accept audio natively, and thus input transcription is a
separate process run on a separate ASR (Automatic Speech Recognition) model.
The transcript may diverge somewhat from the model’s interpretation, and
should be treated as a rough guide.
content\_index: number
The index of the content part containing the audio.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) content_index>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item containing the audio that is being transcribed.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) item_id>)
transcript: string
The transcribed text.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) transcript>)
type: "conversation.item.input\_audio\_transcription.completed"
The event type, must be
`conversation.item.input\_audio\_transcription.completed`.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) type>)
usage: object { input\_tokens, output\_tokens, total\_tokens, 2 more } or object { seconds, type }
Usage statistics for the transcription, this is billed according to the ASR model’s pricing rather than the realtime model’s pricing.
One of the following:
TokenUsage object { input\_tokens, output\_tokens, total\_tokens, 2 more }
Usage statistics for models billed by token usage.
input\_tokens: number
Number of input tokens billed for this request.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) input_tokens>)
output\_tokens: number
Number of output tokens generated.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) output_tokens>)
total\_tokens: number
Total number of tokens used (input + output).
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) total_tokens>)
type: "tokens"
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) type>)
input\_token\_details: optional object { audio\_tokens, text\_tokens }
Details about the input tokens billed for this request.
audio\_tokens: optional number
Number of audio tokens billed for this request.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
text\_tokens: optional number
Number of text tokens billed for this request.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 0>)
DurationUsage object { seconds, type }
Usage statistics for models billed by audio input duration.
seconds: number
Duration of the input audio in seconds.
formatdouble
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 1 > (property) seconds>)
type: "duration"
The type of the usage object. Always `duration` for this variant.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 1 > (property) type>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage > (variant) 1>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) usage>)
logprobs: optional array of [LogProbProperties](</api/reference/resources/realtime#(resource) realtime > (model) log_prob_properties > (schema)>) { token, bytes, logprob }
The log probabilities of the transcription.
token: string
The token that was used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) token>)
bytes: array of number
The bytes that were used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) bytes>)
logprob: number
The log probability of the token.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) logprob>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema) > (property) logprobs>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_completed_event > (schema)>)
ConversationItemInputAudioTranscriptionDeltaEvent object { event\_id, item\_id, type, 3 more }
Returned when the text value of an input audio transcription content part is updated with incremental transcription results.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item containing the audio that is being transcribed.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) item_id>)
type: "conversation.item.input\_audio\_transcription.delta"
The event type, must be `conversation.item.input\_audio\_transcription.delta`.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) type>)
content\_index: optional number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) content_index>)
delta: optional string
The text delta.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) delta>)
logprobs: optional array of [LogProbProperties](</api/reference/resources/realtime#(resource) realtime > (model) log_prob_properties > (schema)>) { token, bytes, logprob }
The log probabilities of the transcription. These can be enabled by configurating the session with `"include": ["item.input\_audio\_transcription.logprobs"]`. Each entry in the array corresponds a log probability of which token would be selected for this chunk of transcription. This can help to identify if it was possible there were multiple valid options for a given chunk of transcription.
token: string
The token that was used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) token>)
bytes: array of number
The bytes that were used to generate the log probability.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) bytes>)
logprob: number
The log probability of the token.
[](<#(resource) realtime > (model) log_prob_properties > (schema) > (property) logprob>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema) > (property) logprobs>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_delta_event > (schema)>)
ConversationItemInputAudioTranscriptionFailedEvent object { content\_index, error, event\_id, 2 more }
Returned when input audio transcription is configured, and a transcription
request for a user message failed. These events are separate from other
`error` events so that the client can identify the related Item.
content\_index: number
The index of the content part containing the audio.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) content_index>)
error: object { code, message, param, type }
Details of the transcription error.
code: optional string
Error code, if any.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error > (property) code>)
message: optional string
A human-readable error message.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error > (property) message>)
param: optional string
Parameter related to the error, if any.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error > (property) param>)
type: optional string
The type of error.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error > (property) type>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) error>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) event_id>)
item\_id: string
The ID of the user message item.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) item_id>)
type: "conversation.item.input\_audio\_transcription.failed"
The event type, must be
`conversation.item.input\_audio\_transcription.failed`.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_failed_event > (schema)>)
ConversationItemRetrieved object { event\_id, item, type }
Returned when a conversation item is retrieved with `conversation.item.retrieve`. This is provided as a way to fetch the server’s representation of an item, for example to get access to the post-processed audio data after noise cancellation and VAD. It includes the full content of the Item, including audio data.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 6 > (property) event_id>)
item: [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 6 > (property) item>)
type: "conversation.item.retrieved"
The event type, must be `conversation.item.retrieved`.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 6 > (property) type>)
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 6>)
ConversationItemTruncatedEvent object { audio\_end\_ms, content\_index, event\_id, 2 more }
Returned when an earlier assistant audio message item is truncated by the
client with a `conversation.item.truncate` event. This event is used to
synchronize the server’s understanding of the audio with the client’s playback.
This action will truncate the audio and remove the server-side text transcript
to ensure there is no text in the context that hasn’t been heard by the user.
audio\_end\_ms: number
The duration up to which the audio was truncated, in milliseconds.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) audio_end_ms>)
content\_index: number
The index of the content part that was truncated.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) content_index>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) event_id>)
item\_id: string
The ID of the assistant message item that was truncated.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) item_id>)
type: "conversation.item.truncated"
The event type, must be `conversation.item.truncated`.
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_truncated_event > (schema)>)
RealtimeErrorEvent object { error, event\_id, type }
Returned when an error occurs, which could be a client problem or a server
problem. Most errors are recoverable and the session will stay open, we
recommend to implementors to monitor and log error messages by default.
error: [RealtimeError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_error > (schema)>) { message, type, code, 2 more }
Details of the error.
[](<#(resource) realtime > (model) realtime_error_event > (schema) > (property) error>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) realtime_error_event > (schema) > (property) event_id>)
type: "error"
The event type, must be `error`.
[](<#(resource) realtime > (model) realtime_error_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_error_event > (schema)>)
InputAudioBufferClearedEvent object { event\_id, type }
Returned when the input audio buffer is cleared by the client with a
`input\_audio\_buffer.clear` event.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_cleared_event > (schema) > (property) event_id>)
type: "input\_audio\_buffer.cleared"
The event type, must be `input\_audio\_buffer.cleared`.
[](<#(resource) realtime > (model) input_audio_buffer_cleared_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_cleared_event > (schema)>)
InputAudioBufferCommittedEvent object { event\_id, item\_id, type, previous\_item\_id }
Returned when an input audio buffer is committed, either by the client or
automatically in server VAD mode. The `item\_id` property is the ID of the user
message item that will be created, thus a `conversation.item.created` event
will also be sent to the client.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema) > (property) event_id>)
item\_id: string
The ID of the user message item that will be created.
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema) > (property) item_id>)
type: "input\_audio\_buffer.committed"
The event type, must be `input\_audio\_buffer.committed`.
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema) > (property) type>)
previous\_item\_id: optional string
The ID of the preceding item after which the new item will be inserted.
Can be `null` if the item has no predecessor.
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) input_audio_buffer_committed_event > (schema)>)
InputAudioBufferDtmfEventReceivedEvent object { event, received\_at, type }
**SIP Only:** Returned when an DTMF event is received. A DTMF event is a message that
represents a telephone keypad press (0–9, \*, #, A–D). The `event` property
is the keypad that the user press. The `received\_at` is the UTC Unix Timestamp
that the server received the event.
event: string
The telephone keypad that was pressed by the user.
[](<#(resource) realtime > (model) input_audio_buffer_dtmf_event_received_event > (schema) > (property) event>)
received\_at: number
UTC Unix Timestamp when DTMF Event was received by server.
[](<#(resource) realtime > (model) input_audio_buffer_dtmf_event_received_event > (schema) > (property) received_at>)
type: "input\_audio\_buffer.dtmf\_event\_received"
The event type, must be `input\_audio\_buffer.dtmf\_event\_received`.
[](<#(resource) realtime > (model) input_audio_buffer_dtmf_event_received_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_dtmf_event_received_event > (schema)>)
InputAudioBufferSpeechStartedEvent object { audio\_start\_ms, event\_id, item\_id, type }
Sent by the server when in `server\_vad` mode to indicate that speech has been
detected in the audio buffer. This can happen any time audio is added to the
buffer (unless speech is already detected). The client may want to use this
event to interrupt audio playback or provide visual feedback to the user.
The client should expect to receive a `input\_audio\_buffer.speech\_stopped` event
when speech stops. The `item\_id` property is the ID of the user message item
that will be created when speech stops and will also be included in the
`input\_audio\_buffer.speech\_stopped` event (unless the client manually commits
the audio buffer during VAD activation).
audio\_start\_ms: number
Milliseconds from the start of all audio written to the buffer during the
session when speech was first detected. This will correspond to the
beginning of audio sent to the model, and thus includes the
`prefix\_padding\_ms` configured in the Session.
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema) > (property) audio_start_ms>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema) > (property) event_id>)
item\_id: string
The ID of the user message item that will be created when speech stops.
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema) > (property) item_id>)
type: "input\_audio\_buffer.speech\_started"
The event type, must be `input\_audio\_buffer.speech\_started`.
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_speech_started_event > (schema)>)
InputAudioBufferSpeechStoppedEvent object { audio\_end\_ms, event\_id, item\_id, type }
Returned in `server\_vad` mode when the server detects the end of speech in
the audio buffer. The server will also send an `conversation.item.created`
event with the user message item that is created from the audio buffer.
audio\_end\_ms: number
Milliseconds since the session started when speech stopped. This will
correspond to the end of audio sent to the model, and thus includes the
`min\_silence\_duration\_ms` configured in the Session.
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema) > (property) audio_end_ms>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema) > (property) event_id>)
item\_id: string
The ID of the user message item that will be created.
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema) > (property) item_id>)
type: "input\_audio\_buffer.speech\_stopped"
The event type, must be `input\_audio\_buffer.speech\_stopped`.
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_speech_stopped_event > (schema)>)
RateLimitsUpdatedEvent object { event\_id, rate\_limits, type }
Emitted at the beginning of a Response to indicate the updated rate limits.
When a Response is created some tokens will be “reserved” for the output
tokens, the rate limits shown here reflect that reservation, which is then
adjusted accordingly once the Response is completed.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) event_id>)
rate\_limits: array of object { limit, name, remaining, reset\_seconds }
List of rate limit information.
limit: optional number
The maximum allowed value for the rate limit.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) limit>)
name: optional "requests" or "tokens"
The name of the rate limit (`requests`, `tokens`).
One of the following:
"requests"
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) name > (member) 0>)
"tokens"
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) name > (member) 1>)
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) name>)
remaining: optional number
The remaining value before the limit is reached.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) remaining>)
reset\_seconds: optional number
Seconds until the rate limit resets.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits > (items) > (property) reset_seconds>)
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) rate_limits>)
type: "rate\_limits.updated"
The event type, must be `rate\_limits.updated`.
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) rate_limits_updated_event > (schema)>)
ResponseAudioDeltaEvent object { content\_index, delta, event\_id, 4 more }
Returned when the model-generated audio is updated.
content\_index: number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) content_index>)
delta: string
Base64-encoded audio data delta.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) delta>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) response_id>)
type: "response.output\_audio.delta"
The event type, must be `response.output\_audio.delta`.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_audio_delta_event > (schema)>)
ResponseAudioDoneEvent object { content\_index, event\_id, item\_id, 3 more }
Returned when the model-generated audio is done. Also emitted when a Response
is interrupted, incomplete, or cancelled.
content\_index: number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) content_index>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) response_id>)
type: "response.output\_audio.done"
The event type, must be `response.output\_audio.done`.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_audio_done_event > (schema)>)
ResponseAudioTranscriptDeltaEvent object { content\_index, delta, event\_id, 4 more }
Returned when the model-generated transcription of audio output is updated.
content\_index: number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) content_index>)
delta: string
The transcript delta.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) delta>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) response_id>)
type: "response.output\_audio\_transcript.delta"
The event type, must be `response.output\_audio\_transcript.delta`.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema)>)
ResponseAudioTranscriptDoneEvent object { content\_index, event\_id, item\_id, 4 more }
Returned when the model-generated transcription of audio output is done
streaming. Also emitted when a Response is interrupted, incomplete, or
cancelled.
content\_index: number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) content_index>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) response_id>)
transcript: string
The final transcript of the audio.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) transcript>)
type: "response.output\_audio\_transcript.done"
The event type, must be `response.output\_audio\_transcript.done`.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema)>)
ResponseContentPartAddedEvent object { content\_index, event\_id, item\_id, 4 more }
Returned when a new content part is added to an assistant message item during
response generation.
content\_index: number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) content_index>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item to which the content part was added.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) output_index>)
part: object { audio, text, transcript, type }
The content part that was added.
audio: optional string
Base64-encoded audio data (if type is “audio”).
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) audio>)
text: optional string
The text content (if type is “text”).
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) text>)
transcript: optional string
The transcript of the audio (if type is “audio”).
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) transcript>)
type: optional "audio" or "text"
The content type (“text”, “audio”).
One of the following:
"audio"
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) type > (member) 0>)
"text"
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) type > (member) 1>)
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) type>)
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) response_id>)
type: "response.content\_part.added"
The event type, must be `response.content\_part.added`.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_content_part_added_event > (schema)>)
ResponseContentPartDoneEvent object { content\_index, event\_id, item\_id, 4 more }
Returned when a content part is done streaming in an assistant message item.
Also emitted when a Response is interrupted, incomplete, or cancelled.
content\_index: number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) content_index>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) output_index>)
part: object { audio, text, transcript, type }
The content part that is done.
audio: optional string
Base64-encoded audio data (if type is “audio”).
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) audio>)
text: optional string
The text content (if type is “text”).
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) text>)
transcript: optional string
The transcript of the audio (if type is “audio”).
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) transcript>)
type: optional "audio" or "text"
The content type (“text”, “audio”).
One of the following:
"audio"
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) type > (member) 0>)
"text"
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) type > (member) 1>)
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) type>)
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) response_id>)
type: "response.content\_part.done"
The event type, must be `response.content\_part.done`.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_content_part_done_event > (schema)>)
ResponseCreatedEvent object { event\_id, response, type }
Returned when a new Response is created. The first event of response creation,
where the response is in an initial state of `in\_progress`.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_created_event > (schema) > (property) event_id>)
response: [RealtimeResponse](</api/reference/resources/realtime#(resource) realtime > (model) realtime_response > (schema)>) { id, audio, conversation\_id, 8 more }
The response resource.
[](<#(resource) realtime > (model) response_created_event > (schema) > (property) response>)
type: "response.created"
The event type, must be `response.created`.
[](<#(resource) realtime > (model) response_created_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_created_event > (schema)>)
ResponseDoneEvent object { event\_id, response, type }
Returned when a Response is done streaming. Always emitted, no matter the
final state. The Response object included in the `response.done` event will
include all output Items in the Response but will omit the raw audio data.
Clients should check the `status` field of the Response to determine if it was successful
(`completed`) or if there was another outcome: `cancelled`, `failed`, or `incomplete`.
A response will contain all output items that were generated during the response, excluding
any audio content.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_done_event > (schema) > (property) event_id>)
response: [RealtimeResponse](</api/reference/resources/realtime#(resource) realtime > (model) realtime_response > (schema)>) { id, audio, conversation\_id, 8 more }
The response resource.
[](<#(resource) realtime > (model) response_done_event > (schema) > (property) response>)
type: "response.done"
The event type, must be `response.done`.
[](<#(resource) realtime > (model) response_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_done_event > (schema)>)
ResponseFunctionCallArgumentsDeltaEvent object { call\_id, delta, event\_id, 4 more }
Returned when the model-generated function call arguments are updated.
call\_id: string
The ID of the function call.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) call_id>)
delta: string
The arguments delta as a JSON string.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) delta>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) event_id>)
item\_id: string
The ID of the function call item.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) response_id>)
type: "response.function\_call\_arguments.delta"
The event type, must be `response.function\_call\_arguments.delta`.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema)>)
ResponseFunctionCallArgumentsDoneEvent object { arguments, call\_id, event\_id, 5 more }
Returned when the model-generated function call arguments are done streaming.
Also emitted when a Response is interrupted, incomplete, or cancelled.
arguments: string
The final arguments as a JSON string.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) arguments>)
call\_id: string
The ID of the function call.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) call_id>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) event_id>)
item\_id: string
The ID of the function call item.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) item_id>)
name: string
The name of the function that was called.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) name>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) response_id>)
type: "response.function\_call\_arguments.done"
The event type, must be `response.function\_call\_arguments.done`.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema)>)
ResponseOutputItemAddedEvent object { event\_id, item, output\_index, 2 more }
Returned when a new Item is created during Response generation.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) event_id>)
item: [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) item>)
output\_index: number
The index of the output item in the Response.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) output_index>)
response\_id: string
The ID of the Response to which the item belongs.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) response_id>)
type: "response.output\_item.added"
The event type, must be `response.output\_item.added`.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_output_item_added_event > (schema)>)
ResponseOutputItemDoneEvent object { event\_id, item, output\_index, 2 more }
Returned when an Item is done streaming. Also emitted when a Response is
interrupted, incomplete, or cancelled.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) event_id>)
item: [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) item>)
output\_index: number
The index of the output item in the Response.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) output_index>)
response\_id: string
The ID of the Response to which the item belongs.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) response_id>)
type: "response.output\_item.done"
The event type, must be `response.output\_item.done`.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_output_item_done_event > (schema)>)
ResponseTextDeltaEvent object { content\_index, delta, event\_id, 4 more }
Returned when the text value of an “output\_text” content part is updated.
content\_index: number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) content_index>)
delta: string
The text delta.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) delta>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) response_id>)
type: "response.output\_text.delta"
The event type, must be `response.output\_text.delta`.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_text_delta_event > (schema)>)
ResponseTextDoneEvent object { content\_index, event\_id, item\_id, 4 more }
Returned when the text value of an “output\_text” content part is done streaming. Also
emitted when a Response is interrupted, incomplete, or cancelled.
content\_index: number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) content_index>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) response_id>)
text: string
The final text content.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) text>)
type: "response.output\_text.done"
The event type, must be `response.output\_text.done`.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_text_done_event > (schema)>)
SessionCreatedEvent object { event\_id, session, type }
Returned when a Session is created. Emitted automatically when a new
connection is established as the first server event. This event will contain
the default Session configuration.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) session_created_event > (schema) > (property) event_id>)
session: [RealtimeSessionCreateRequest](</api/reference/resources/realtime#(resource) realtime > (model) realtime_session_create_request > (schema)>) { type, audio, include, 9 more } or [RealtimeTranscriptionSessionCreateRequest](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>) { type, audio, include }
The session configuration.
One of the following:
RealtimeSessionCreateRequest object { type, audio, include, 9 more }
Realtime session object configuration.
type: "realtime"
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) type>)
audio: optional [RealtimeAudioConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_config > (schema)>) { input, output }
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) include>)
instructions: optional string
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) instructions>)
max\_output\_tokens: optional number or "inf"
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
number
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 0>)
"inf"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens>)
model: optional string or "gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 0>)
"gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
"gpt-realtime"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 0>)
"gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 1>)
"gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 2>)
"gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 3>)
"gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 4>)
"gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 5>)
"gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 6>)
"gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 7>)
"gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 8>)
"gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 9>)
"gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 10>)
"gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 11>)
"gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 12>)
"gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 13>)
"gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 14>)
"gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model>)
output\_modalities: optional array of "text" or "audio"
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
"text"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 0>)
"audio"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities>)
prompt: optional [ResponsePrompt](</api/reference/resources/responses#(resource) responses > (model) response_prompt > (schema)>) { id, variables, version }
Reference to a prompt template and its variables.
[Learn more](/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt>)
tool\_choice: optional [RealtimeToolChoiceConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice>)
tools: optional [RealtimeToolsConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tools_config > (schema)>) { , McpTool }
Tools available to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools>)
tracing: optional [RealtimeTracingConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tracing_config > (schema)>)
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing>)
truncation: optional [RealtimeTruncation](</api/reference/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema)>)
RealtimeTranscriptionSessionCreateRequest object { type, audio, include }
Realtime transcription session object configuration.
type: "transcription"
The type of session to create. Always `transcription` for transcription sessions.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) type>)
audio: optional [RealtimeTranscriptionSessionAudio](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>) { input }
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) include>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>)
[](<#(resource) realtime > (model) session_created_event > (schema) > (property) session>)
type: "session.created"
The event type, must be `session.created`.
[](<#(resource) realtime > (model) session_created_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) session_created_event > (schema)>)
SessionUpdatedEvent object { event\_id, session, type }
Returned when a session is updated with a `session.update` event, unless
there is an error.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) session_updated_event > (schema) > (property) event_id>)
session: [RealtimeSessionCreateRequest](</api/reference/resources/realtime#(resource) realtime > (model) realtime_session_create_request > (schema)>) { type, audio, include, 9 more } or [RealtimeTranscriptionSessionCreateRequest](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>) { type, audio, include }
The session configuration.
One of the following:
RealtimeSessionCreateRequest object { type, audio, include, 9 more }
Realtime session object configuration.
type: "realtime"
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) type>)
audio: optional [RealtimeAudioConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_config > (schema)>) { input, output }
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) include>)
instructions: optional string
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) instructions>)
max\_output\_tokens: optional number or "inf"
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
number
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 0>)
"inf"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens>)
model: optional string or "gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 0>)
"gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
"gpt-realtime"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 0>)
"gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 1>)
"gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 2>)
"gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 3>)
"gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 4>)
"gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 5>)
"gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 6>)
"gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 7>)
"gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 8>)
"gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 9>)
"gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 10>)
"gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 11>)
"gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 12>)
"gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 13>)
"gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 14>)
"gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model>)
output\_modalities: optional array of "text" or "audio"
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
"text"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 0>)
"audio"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities>)
prompt: optional [ResponsePrompt](</api/reference/resources/responses#(resource) responses > (model) response_prompt > (schema)>) { id, variables, version }
Reference to a prompt template and its variables.
[Learn more](/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt>)
tool\_choice: optional [RealtimeToolChoiceConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice>)
tools: optional [RealtimeToolsConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tools_config > (schema)>) { , McpTool }
Tools available to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools>)
tracing: optional [RealtimeTracingConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tracing_config > (schema)>)
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing>)
truncation: optional [RealtimeTruncation](</api/reference/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema)>)
RealtimeTranscriptionSessionCreateRequest object { type, audio, include }
Realtime transcription session object configuration.
type: "transcription"
The type of session to create. Always `transcription` for transcription sessions.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) type>)
audio: optional [RealtimeTranscriptionSessionAudio](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>) { input }
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) include>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>)
[](<#(resource) realtime > (model) session_updated_event > (schema) > (property) session>)
type: "session.updated"
The event type, must be `session.updated`.
[](<#(resource) realtime > (model) session_updated_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) session_updated_event > (schema)>)
OutputAudioBufferStarted object { event\_id, response\_id, type }
**WebRTC/SIP Only:** Emitted when the server begins streaming audio to the client. This event is
emitted after an audio content part has been added (`response.content\_part.added`)
to the response.
[Learn more](/docs/guides/realtime-conversations#client-and-server-events-for-audio-in-webrtc).
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 31 > (property) event_id>)
response\_id: string
The unique ID of the response that produced the audio.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 31 > (property) response_id>)
type: "output\_audio\_buffer.started"
The event type, must be `output\_audio\_buffer.started`.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 31 > (property) type>)
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 31>)
OutputAudioBufferStopped object { event\_id, response\_id, type }
**WebRTC/SIP Only:** Emitted when the output audio buffer has been completely drained on the server,
and no more audio is forthcoming. This event is emitted after the full response
data has been sent to the client (`response.done`).
[Learn more](/docs/guides/realtime-conversations#client-and-server-events-for-audio-in-webrtc).
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 32 > (property) event_id>)
response\_id: string
The unique ID of the response that produced the audio.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 32 > (property) response_id>)
type: "output\_audio\_buffer.stopped"
The event type, must be `output\_audio\_buffer.stopped`.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 32 > (property) type>)
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 32>)
OutputAudioBufferCleared object { event\_id, response\_id, type }
**WebRTC/SIP Only:** Emitted when the output audio buffer is cleared. This happens either in VAD
mode when the user has interrupted (`input\_audio\_buffer.speech\_started`),
or when the client has emitted the `output\_audio\_buffer.clear` event to manually
cut off the current audio response.
[Learn more](/docs/guides/realtime-conversations#client-and-server-events-for-audio-in-webrtc).
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 33 > (property) event_id>)
response\_id: string
The unique ID of the response that produced the audio.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 33 > (property) response_id>)
type: "output\_audio\_buffer.cleared"
The event type, must be `output\_audio\_buffer.cleared`.
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 33 > (property) type>)
[](<#(resource) realtime > (model) realtime_server_event > (schema) > (variant) 33>)
ConversationItemAdded object { event\_id, item, type, previous\_item\_id }
Sent by the server when an Item is added to the default Conversation. This can happen in several cases:
* When the client sends a `conversation.item.create` event.
* When the input audio buffer is committed. In this case the item will be a user message containing the audio from the buffer.
* When the model is generating a Response. In this case the `conversation.item.added` event will be sent when the model starts generating a specific Item, and thus it will not yet have any content (and `status` will be `in\_progress`).
The event will include the full content of the Item (except when model is generating a Response) except for audio data, which can be retrieved separately with a `conversation.item.retrieve` event if necessary.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_added > (schema) > (property) event_id>)
item: [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) conversation_item_added > (schema) > (property) item>)
type: "conversation.item.added"
The event type, must be `conversation.item.added`.
[](<#(resource) realtime > (model) conversation_item_added > (schema) > (property) type>)
previous\_item\_id: optional string
The ID of the item that precedes this one, if any. This is used to
maintain ordering when items are inserted.
[](<#(resource) realtime > (model) conversation_item_added > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) conversation_item_added > (schema)>)
ConversationItemDone object { event\_id, item, type, previous\_item\_id }
Returned when a conversation item is finalized.
The event will include the full content of the Item except for audio data, which can be retrieved separately with a `conversation.item.retrieve` event if needed.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_done > (schema) > (property) event_id>)
item: [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) conversation_item_done > (schema) > (property) item>)
type: "conversation.item.done"
The event type, must be `conversation.item.done`.
[](<#(resource) realtime > (model) conversation_item_done > (schema) > (property) type>)
previous\_item\_id: optional string
The ID of the item that precedes this one, if any. This is used to
maintain ordering when items are inserted.
[](<#(resource) realtime > (model) conversation_item_done > (schema) > (property) previous_item_id>)
[](<#(resource) realtime > (model) conversation_item_done > (schema)>)
InputAudioBufferTimeoutTriggered object { audio\_end\_ms, audio\_start\_ms, event\_id, 2 more }
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
audio\_end\_ms: number
Millisecond offset of audio written to the input audio buffer at the time the timeout was triggered.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) audio_end_ms>)
audio\_start\_ms: number
Millisecond offset of audio written to the input audio buffer that was after the playback time of the last model response.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) audio_start_ms>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) event_id>)
item\_id: string
The ID of the item associated with this segment.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) item_id>)
type: "input\_audio\_buffer.timeout\_triggered"
The event type, must be `input\_audio\_buffer.timeout\_triggered`.
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema) > (property) type>)
[](<#(resource) realtime > (model) input_audio_buffer_timeout_triggered > (schema)>)
ConversationItemInputAudioTranscriptionSegment object { id, content\_index, end, 6 more }
Returned when an input audio transcription segment is identified for an item.
id: string
The segment identifier.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) id>)
content\_index: number
The index of the input audio content part within the item.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) content_index>)
end: number
End time of the segment in seconds.
formatdouble
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) end>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) event_id>)
item\_id: string
The ID of the item containing the input audio content.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) item_id>)
speaker: string
The detected speaker label for this segment.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) speaker>)
start: number
Start time of the segment in seconds.
formatdouble
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) start>)
text: string
The text for this segment.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) text>)
type: "conversation.item.input\_audio\_transcription.segment"
The event type, must be `conversation.item.input\_audio\_transcription.segment`.
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_input_audio_transcription_segment > (schema)>)
McpListToolsInProgress object { event\_id, item\_id, type }
Returned when listing MCP tools is in progress for an item.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) mcp_list_tools_in_progress > (schema) > (property) event_id>)
item\_id: string
The ID of the MCP list tools item.
[](<#(resource) realtime > (model) mcp_list_tools_in_progress > (schema) > (property) item_id>)
type: "mcp\_list\_tools.in\_progress"
The event type, must be `mcp\_list\_tools.in\_progress`.
[](<#(resource) realtime > (model) mcp_list_tools_in_progress > (schema) > (property) type>)
[](<#(resource) realtime > (model) mcp_list_tools_in_progress > (schema)>)
McpListToolsCompleted object { event\_id, item\_id, type }
Returned when listing MCP tools has completed for an item.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) mcp_list_tools_completed > (schema) > (property) event_id>)
item\_id: string
The ID of the MCP list tools item.
[](<#(resource) realtime > (model) mcp_list_tools_completed > (schema) > (property) item_id>)
type: "mcp\_list\_tools.completed"
The event type, must be `mcp\_list\_tools.completed`.
[](<#(resource) realtime > (model) mcp_list_tools_completed > (schema) > (property) type>)
[](<#(resource) realtime > (model) mcp_list_tools_completed > (schema)>)
McpListToolsFailed object { event\_id, item\_id, type }
Returned when listing MCP tools has failed for an item.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) mcp_list_tools_failed > (schema) > (property) event_id>)
item\_id: string
The ID of the MCP list tools item.
[](<#(resource) realtime > (model) mcp_list_tools_failed > (schema) > (property) item_id>)
type: "mcp\_list\_tools.failed"
The event type, must be `mcp\_list\_tools.failed`.
[](<#(resource) realtime > (model) mcp_list_tools_failed > (schema) > (property) type>)
[](<#(resource) realtime > (model) mcp_list_tools_failed > (schema)>)
ResponseMcpCallArgumentsDelta object { delta, event\_id, item\_id, 4 more }
Returned when MCP tool call arguments are updated during response generation.
delta: string
The JSON-encoded arguments delta.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) delta>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) event_id>)
item\_id: string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) response_id>)
type: "response.mcp\_call\_arguments.delta"
The event type, must be `response.mcp\_call\_arguments.delta`.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) type>)
obfuscation: optional string
If present, indicates the delta text was obfuscated.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) obfuscation>)
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema)>)
ResponseMcpCallArgumentsDone object { arguments, event\_id, item\_id, 3 more }
Returned when MCP tool call arguments are finalized during response generation.
arguments: string
The final JSON-encoded arguments string.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) arguments>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) event_id>)
item\_id: string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) response_id>)
type: "response.mcp\_call\_arguments.done"
The event type, must be `response.mcp\_call\_arguments.done`.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema)>)
ResponseMcpCallInProgress object { event\_id, item\_id, output\_index, type }
Returned when an MCP tool call has started and is in progress.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema) > (property) event_id>)
item\_id: string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema) > (property) output_index>)
type: "response.mcp\_call.in\_progress"
The event type, must be `response.mcp\_call.in\_progress`.
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema)>)
ResponseMcpCallCompleted object { event\_id, item\_id, output\_index, type }
Returned when an MCP tool call has completed successfully.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema) > (property) event_id>)
item\_id: string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema) > (property) output_index>)
type: "response.mcp\_call.completed"
The event type, must be `response.mcp\_call.completed`.
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema)>)
ResponseMcpCallFailed object { event\_id, item\_id, output\_index, type }
Returned when an MCP tool call has failed.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema) > (property) event_id>)
item\_id: string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema) > (property) output_index>)
type: "response.mcp\_call.failed"
The event type, must be `response.mcp\_call.failed`.
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema)>)
[](<#(resource) realtime > (model) realtime_server_event > (schema)>)
RealtimeSession object { id, expires\_at, include, 17 more }
Realtime session object for the beta interface.
id: optional string
Unique identifier for the session that looks like `sess\_1234567890abcdef`.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) id>)
expires\_at: optional number
Expiration timestamp for the session, in seconds since epoch.
formatunixtime
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) expires_at>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
* `item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) include>)
input\_audio\_format: optional "pcm16" or "g711\_ulaw" or "g711\_alaw"
The format of input audio. Options are `pcm16`, `g711\_ulaw`, or `g711\_alaw`.
For `pcm16`, input audio must be 16-bit PCM at a 24kHz sample rate,
single channel (mono), and little-endian byte order.
One of the following:
"pcm16"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) input_audio_format > (member) 0>)
"g711\_ulaw"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) input_audio_format > (member) 1>)
"g711\_alaw"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) input_audio_format > (member) 2>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) input_audio_format>)
input\_audio\_noise\_reduction: optional object { type }
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
type: optional [NoiseReductionType](</api/reference/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) input_audio_noise_reduction > (property) type>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) input_audio_noise_reduction>)
input\_audio\_transcription: optional [AudioTranscription](</api/reference/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration for input audio transcription, defaults to off and can be set to `null` to turn off once on. Input audio transcription is not native to the model, since the model consumes audio directly. Transcription runs asynchronously through [the /audio/transcriptions endpoint](https://platform.openai.com/docs/api-reference/audio/createTranscription) and should be treated as guidance of input audio content rather than precisely what the model heard. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) input_audio_transcription>)
instructions: optional string
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
max\_response\_output\_tokens: optional number or "inf"
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
number
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) max_response_output_tokens > (variant) 0>)
"inf"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) max_response_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) max_response_output_tokens>)
modalities: optional array of "text" or "audio"
The set of modalities the model can respond with. To disable audio,
set this to [“text”].
One of the following:
"text"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) modalities > (items) > (member) 0>)
"audio"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) modalities>)
model: optional string or "gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 0>)
"gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
"gpt-realtime"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 0>)
"gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 1>)
"gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 2>)
"gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 3>)
"gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 4>)
"gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 5>)
"gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 6>)
"gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 7>)
"gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 8>)
"gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 9>)
"gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 10>)
"gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 11>)
"gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 12>)
"gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 13>)
"gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 14>)
"gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) model>)
object: optional "realtime.session"
The object type. Always `realtime.session`.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) object>)
output\_audio\_format: optional "pcm16" or "g711\_ulaw" or "g711\_alaw"
The format of output audio. Options are `pcm16`, `g711\_ulaw`, or `g711\_alaw`.
For `pcm16`, output audio is sampled at a rate of 24kHz.
One of the following:
"pcm16"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) output_audio_format > (member) 0>)
"g711\_ulaw"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) output_audio_format > (member) 1>)
"g711\_alaw"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) output_audio_format > (member) 2>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) output_audio_format>)
prompt: optional [ResponsePrompt](</api/reference/resources/responses#(resource) responses > (model) response_prompt > (schema)>) { id, variables, version }
Reference to a prompt template and its variables.
[Learn more](/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) prompt>)
speed: optional number
The speed of the model’s spoken response. 1.0 is the default speed. 0.25 is
the minimum speed. 1.5 is the maximum speed. This value can only be changed
in between model turns, not while a response is in progress.
maximum1.5
minimum0.25
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) speed>)
temperature: optional number
Sampling temperature for the model, limited to [0.6, 1.2]. For audio models a temperature of 0.8 is highly recommended for best performance.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) temperature>)
tool\_choice: optional string
How the model chooses tools. Options are `auto`, `none`, `required`, or
specify a function.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) tool_choice>)
tools: optional array of [RealtimeFunctionTool](</api/reference/resources/realtime#(resource) realtime > (model) realtime_function_tool > (schema)>) { description, name, parameters, type }
Tools (functions) available to the model.
description: optional string
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
name: optional string
The name of the function.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
parameters: optional unknown
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
type: optional "function"
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) tools>)
tracing: optional "auto" or object { group\_id, metadata, workflow\_name }
Configuration options for tracing. Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
One of the following:
"auto"
Default tracing mode for the session.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) tracing > (variant) 0>)
TracingConfiguration object { group\_id, metadata, workflow\_name }
Granular configuration for tracing.
group\_id: optional string
The group id to attach to this trace to enable filtering and
grouping in the traces dashboard.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) tracing > (variant) 1 > (property) group_id>)
metadata: optional unknown
The arbitrary metadata to attach to this trace to enable
filtering in the traces dashboard.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) tracing > (variant) 1 > (property) metadata>)
workflow\_name: optional string
The name of the workflow to attach to this trace. This is used to
name the trace in the traces dashboard.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) tracing > (variant) 1 > (property) workflow_name>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) tracing > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) tracing>)
turn\_detection: optional object { type, create\_response, idle\_timeout\_ms, 4 more } or object { type, create\_response, eagerness, interrupt\_response }
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with “uhhm”, the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
One of the following:
ServerVad object { type, create\_response, idle\_timeout\_ms, 4 more }
Server-side voice activity detection (VAD) which flips on when user speech is detected and off after a period of silence.
type: "server\_vad"
Type of turn detection, `server\_vad` to turn on simple Server VAD.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 0 > (property) type>)
create\_response: optional boolean
Whether or not to automatically generate a response when a VAD stop event occurs. If `interrupt\_response` is set to `false` this may fail to create a response if the model is already responding.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 0 > (property) create_response>)
idle\_timeout\_ms: optional number
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
interrupt\_response: optional boolean
Whether or not to automatically interrupt (cancel) any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs. If `true` then the response will be cancelled, otherwise it will continue until complete.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 0 > (property) interrupt_response>)
prefix\_padding\_ms: optional number
Used only for `server\_vad` mode. Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 0 > (property) prefix_padding_ms>)
silence\_duration\_ms: optional number
Used only for `server\_vad` mode. Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 0 > (property) silence_duration_ms>)
threshold: optional number
Used only for `server\_vad` mode. Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 0 > (property) threshold>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 0>)
SemanticVad object { type, create\_response, eagerness, interrupt\_response }
Server-side semantic turn detection which uses a model to determine when the user has finished speaking.
type: "semantic\_vad"
Type of turn detection, `semantic\_vad` to turn on Semantic VAD.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1 > (property) type>)
create\_response: optional boolean
Whether or not to automatically generate a response when a VAD stop event occurs.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1 > (property) create_response>)
eagerness: optional "low" or "medium" or "high" or "auto"
Used only for `semantic\_vad` mode. The eagerness of the model to respond. `low` will wait longer for the user to continue speaking, `high` will respond more quickly. `auto` is the default and is equivalent to `medium`. `low`, `medium`, and `high` have max timeouts of 8s, 4s, and 2s respectively.
One of the following:
"low"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 0>)
"medium"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 1>)
"high"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 2>)
"auto"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 3>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1 > (property) eagerness>)
interrupt\_response: optional boolean
Whether or not to automatically interrupt any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs.
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1 > (property) interrupt_response>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) turn_detection>)
voice: optional string or "alloy" or "ash" or "ballad" or 7 more
The voice the model uses to respond. Voice cannot be changed during the
session once the model has responded with audio at least once. Current
voice options are `alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`,
`shimmer`, and `verse`.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 0>)
"alloy" or "ash" or "ballad" or 7 more
The voice the model uses to respond. Voice cannot be changed during the
session once the model has responded with audio at least once. Current
voice options are `alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`,
`shimmer`, and `verse`.
One of the following:
"alloy"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 0>)
"ash"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 1>)
"ballad"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 2>)
"coral"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 3>)
"echo"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 4>)
"sage"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 5>)
"shimmer"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 6>)
"verse"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 7>)
"marin"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 8>)
"cedar"
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session > (schema) > (property) voice>)
[](<#(resource) realtime > (model) realtime_session > (schema)>)
RealtimeSessionCreateRequest object { type, audio, include, 9 more }
Realtime session object configuration.
type: "realtime"
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) type>)
audio: optional [RealtimeAudioConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_config > (schema)>) { input, output }
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) include>)
instructions: optional string
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) instructions>)
max\_output\_tokens: optional number or "inf"
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
number
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 0>)
"inf"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens>)
model: optional string or "gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 0>)
"gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
"gpt-realtime"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 0>)
"gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 1>)
"gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 2>)
"gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 3>)
"gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 4>)
"gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 5>)
"gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 6>)
"gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 7>)
"gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 8>)
"gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 9>)
"gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 10>)
"gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 11>)
"gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 12>)
"gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 13>)
"gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 14>)
"gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model>)
output\_modalities: optional array of "text" or "audio"
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
"text"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 0>)
"audio"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities>)
prompt: optional [ResponsePrompt](</api/reference/resources/responses#(resource) responses > (model) response_prompt > (schema)>) { id, variables, version }
Reference to a prompt template and its variables.
[Learn more](/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt>)
tool\_choice: optional [RealtimeToolChoiceConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice>)
tools: optional [RealtimeToolsConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tools_config > (schema)>) { , McpTool }
Tools available to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools>)
tracing: optional [RealtimeTracingConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tracing_config > (schema)>)
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing>)
truncation: optional [RealtimeTruncation](</api/reference/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema)>)
RealtimeToolChoiceConfig = [ToolChoiceOptions](</api/reference/resources/responses#(resource) responses > (model) tool_choice_options > (schema)>) or [ToolChoiceFunction](</api/reference/resources/responses#(resource) responses > (model) tool_choice_function > (schema)>) { name, type } or [ToolChoiceMcp](</api/reference/resources/responses#(resource) responses > (model) tool_choice_mcp > (schema)>) { server\_label, type, name }
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
One of the following:
ToolChoiceOptions = "none" or "auto" or "required"
Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or
more tools.
`required` means the model must call one or more tools.
One of the following:
"none"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 0>)
"auto"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 1>)
"required"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 2>)
[](<#(resource) responses > (model) tool_choice_options > (schema)>)
ToolChoiceFunction object { name, type }
Use this option to force the model to call a specific function.
name: string
The name of the function to call.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) name>)
type: "function"
For function calling, the type is always `function`.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) type>)
[](<#(resource) responses > (model) tool_choice_function > (schema)>)
ToolChoiceMcp object { server\_label, type, name }
Use this option to force the model to call a specific tool on a remote MCP server.
server\_label: string
The label of the MCP server to use.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) server_label>)
type: "mcp"
For MCP tools, the type is always `mcp`.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) type>)
name: optional string
The name of the tool to call on the server.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) name>)
[](<#(resource) responses > (model) tool_choice_mcp > (schema)>)
[](<#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)
RealtimeToolsConfig = array of [RealtimeToolsConfigUnion](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tools_config_union > (schema)>)
Tools available to the model.
One of the following:
RealtimeFunctionTool object { description, name, parameters, type }
description: optional string
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
name: optional string
The name of the function.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
parameters: optional unknown
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
type: optional "function"
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_function_tool > (schema)>)
McpTool object { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) type>)
allowed\_tools: optional array of string or object { read\_only, tool\_names }
List of allowed tool names or a filter object.
One of the following:
McpAllowedTools = array of string
A string array of allowed tool names
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 0>)
McpToolFilter object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools>)
authorization: optional string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) authorization>)
connector\_id: optional "connector\_dropbox" or "connector\_gmail" or "connector\_googlecalendar" or 5 more
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](/docs/guides/tools-remote-mcp#connectors).
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
"connector\_dropbox"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 7>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id>)
defer\_loading: optional boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) defer_loading>)
headers: optional map[string]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) headers>)
require\_approval: optional object { always, never } or "always" or "never"
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter object { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always>)
never: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0>)
McpToolApprovalSetting = "always" or "never"
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
"always"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval>)
server\_description: optional string
Optional description of the MCP server, used to provide more context.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_description>)
server\_url: optional string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_url>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_tools_config > (schema)>)
RealtimeToolsConfigUnion = [RealtimeFunctionTool](</api/reference/resources/realtime#(resource) realtime > (model) realtime_function_tool > (schema)>) { description, name, parameters, type } or object { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](/docs/guides/tools-remote-mcp).
One of the following:
RealtimeFunctionTool object { description, name, parameters, type }
description: optional string
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
name: optional string
The name of the function.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
parameters: optional unknown
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
type: optional "function"
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_function_tool > (schema)>)
McpTool object { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) type>)
allowed\_tools: optional array of string or object { read\_only, tool\_names }
List of allowed tool names or a filter object.
One of the following:
McpAllowedTools = array of string
A string array of allowed tool names
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 0>)
McpToolFilter object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools>)
authorization: optional string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) authorization>)
connector\_id: optional "connector\_dropbox" or "connector\_gmail" or "connector\_googlecalendar" or 5 more
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](/docs/guides/tools-remote-mcp#connectors).
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
"connector\_dropbox"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 7>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id>)
defer\_loading: optional boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) defer_loading>)
headers: optional map[string]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) headers>)
require\_approval: optional object { always, never } or "always" or "never"
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter object { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always>)
never: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0>)
McpToolApprovalSetting = "always" or "never"
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
"always"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval>)
server\_description: optional string
Optional description of the MCP server, used to provide more context.
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_description>)
server\_url: optional string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_url>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_tools_config_union > (schema)>)
RealtimeTracingConfig = "auto" or object { group\_id, metadata, workflow\_name }
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
One of the following:
Auto = "auto"
Enables tracing and sets default values for tracing configuration options. Always `auto`.
[](<#(resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 0>)
TracingConfiguration object { group\_id, metadata, workflow\_name }
Granular configuration for tracing.
group\_id: optional string
The group id to attach to this trace to enable filtering and
grouping in the Traces Dashboard.
[](<#(resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 1 > (property) group_id>)
metadata: optional unknown
The arbitrary metadata to attach to this trace to enable
filtering in the Traces Dashboard.
[](<#(resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 1 > (property) metadata>)
workflow\_name: optional string
The name of the workflow to attach to this trace. This is used to
name the trace in the Traces Dashboard.
[](<#(resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 1 > (property) workflow_name>)
[](<#(resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_tracing_config > (schema)>)
RealtimeTranscriptionSessionAudio object { input }
Configuration for input and output audio.
input: optional [RealtimeTranscriptionSessionAudioInput](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema)>) { format, noise\_reduction, transcription, turn\_detection }
[](<#(resource) realtime > (model) realtime_transcription_session_audio > (schema) > (property) input>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>)
RealtimeTranscriptionSessionAudioInput object { format, noise\_reduction, transcription, turn\_detection }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The PCM audio format. Only a 24kHz sample rate is supported.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format>)
noise\_reduction: optional object { type }
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
type: optional [NoiseReductionType](</api/reference/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) noise_reduction > (property) type>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) noise_reduction>)
transcription: optional [AudioTranscription](</api/reference/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration for input audio transcription, defaults to off and can be set to `null` to turn off once on. Input audio transcription is not native to the model, since the model consumes audio directly. Transcription runs asynchronously through [the /audio/transcriptions endpoint](/docs/api-reference/audio/createTranscription) and should be treated as guidance of input audio content rather than precisely what the model heard. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription>)
turn\_detection: optional [RealtimeTranscriptionSessionAudioInputTurnDetection](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema)>)
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with “uhhm”, the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema)>)
RealtimeTranscriptionSessionAudioInputTurnDetection = object { type, create\_response, idle\_timeout\_ms, 4 more } or object { type, create\_response, eagerness, interrupt\_response }
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with “uhhm”, the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
One of the following:
ServerVad object { type, create\_response, idle\_timeout\_ms, 4 more }
Server-side voice activity detection (VAD) which flips on when user speech is detected and off after a period of silence.
type: "server\_vad"
Type of turn detection, `server\_vad` to turn on simple Server VAD.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) type>)
create\_response: optional boolean
Whether or not to automatically generate a response when a VAD stop event occurs. If `interrupt\_response` is set to `false` this may fail to create a response if the model is already responding.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) create_response>)
idle\_timeout\_ms: optional number
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
interrupt\_response: optional boolean
Whether or not to automatically interrupt (cancel) any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs. If `true` then the response will be cancelled, otherwise it will continue until complete.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) interrupt_response>)
prefix\_padding\_ms: optional number
Used only for `server\_vad` mode. Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) prefix_padding_ms>)
silence\_duration\_ms: optional number
Used only for `server\_vad` mode. Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) silence_duration_ms>)
threshold: optional number
Used only for `server\_vad` mode. Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) threshold>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0>)
SemanticVad object { type, create\_response, eagerness, interrupt\_response }
Server-side semantic turn detection which uses a model to determine when the user has finished speaking.
type: "semantic\_vad"
Type of turn detection, `semantic\_vad` to turn on Semantic VAD.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) type>)
create\_response: optional boolean
Whether or not to automatically generate a response when a VAD stop event occurs.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) create_response>)
eagerness: optional "low" or "medium" or "high" or "auto"
Used only for `semantic\_vad` mode. The eagerness of the model to respond. `low` will wait longer for the user to continue speaking, `high` will respond more quickly. `auto` is the default and is equivalent to `medium`. `low`, `medium`, and `high` have max timeouts of 8s, 4s, and 2s respectively.
One of the following:
"low"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 0>)
"medium"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 1>)
"high"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 2>)
"auto"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 3>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness>)
interrupt\_response: optional boolean
Whether or not to automatically interrupt any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) interrupt_response>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema)>)
RealtimeTranscriptionSessionCreateRequest object { type, audio, include }
Realtime transcription session object configuration.
type: "transcription"
The type of session to create. Always `transcription` for transcription sessions.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) type>)
audio: optional [RealtimeTranscriptionSessionAudio](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>) { input }
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) include>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>)
RealtimeTruncation = "auto" or "disabled" or object { retention\_ratio, type, token\_limits }
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
One of the following:
"auto" or "disabled"
The truncation strategy to use for the session. `auto` is the default truncation strategy. `disabled` will disable truncation and emit errors when the conversation exceeds the input token limit.
One of the following:
"auto"
[](<#(resource) realtime > (model) realtime_truncation > (schema) > (variant) 0 > (member) 0>)
"disabled"
[](<#(resource) realtime > (model) realtime_truncation > (schema) > (variant) 0 > (member) 1>)
[](<#(resource) realtime > (model) realtime_truncation > (schema) > (variant) 0>)
RetentionRatioTruncation object { retention\_ratio, type, token\_limits }
Retain a fraction of the conversation tokens when the conversation exceeds the input token limit. This allows you to amortize truncations across multiple turns, which can help improve cached token usage.
retention\_ratio: number
Fraction of post-instruction conversation tokens to retain (`0.0` - `1.0`) when the conversation exceeds the input token limit. Setting this to `0.8` means that messages will be dropped until 80% of the maximum allowed tokens are used. This helps reduce the frequency of truncations and improve cache rates.
minimum0
maximum1
[](<#(resource) realtime > (model) realtime_truncation > (schema) > (variant) 1 > (property) retention_ratio>)
type: "retention\_ratio"
Use retention ratio truncation.
[](<#(resource) realtime > (model) realtime_truncation > (schema) > (variant) 1 > (property) type>)
token\_limits: optional object { post\_instructions }
Optional custom token limits for this truncation strategy. If not provided, the model’s default token limits will be used.
post\_instructions: optional number
Maximum tokens allowed in the conversation after instructions (which including tool definitions). For example, setting this to 5,000 would mean that truncation would occur when the conversation exceeds 5,000 tokens after instructions. This cannot be higher than the model’s context window size minus the maximum output tokens.
minimum0
[](<#(resource) realtime > (model) realtime_truncation > (schema) > (variant) 1 > (property) token_limits > (property) post_instructions>)
[](<#(resource) realtime > (model) realtime_truncation > (schema) > (variant) 1 > (property) token_limits>)
[](<#(resource) realtime > (model) realtime_truncation > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_truncation > (schema)>)
ResponseAudioDeltaEvent object { content\_index, delta, event\_id, 4 more }
Returned when the model-generated audio is updated.
content\_index: number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) content_index>)
delta: string
Base64-encoded audio data delta.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) delta>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) response_id>)
type: "response.output\_audio.delta"
The event type, must be `response.output\_audio.delta`.
[](<#(resource) realtime > (model) response_audio_delta_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_audio_delta_event > (schema)>)
ResponseAudioDoneEvent object { content\_index, event\_id, item\_id, 3 more }
Returned when the model-generated audio is done. Also emitted when a Response
is interrupted, incomplete, or cancelled.
content\_index: number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) content_index>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) response_id>)
type: "response.output\_audio.done"
The event type, must be `response.output\_audio.done`.
[](<#(resource) realtime > (model) response_audio_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_audio_done_event > (schema)>)
ResponseAudioTranscriptDeltaEvent object { content\_index, delta, event\_id, 4 more }
Returned when the model-generated transcription of audio output is updated.
content\_index: number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) content_index>)
delta: string
The transcript delta.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) delta>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) response_id>)
type: "response.output\_audio\_transcript.delta"
The event type, must be `response.output\_audio\_transcript.delta`.
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_audio_transcript_delta_event > (schema)>)
ResponseAudioTranscriptDoneEvent object { content\_index, event\_id, item\_id, 4 more }
Returned when the model-generated transcription of audio output is done
streaming. Also emitted when a Response is interrupted, incomplete, or
cancelled.
content\_index: number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) content_index>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) response_id>)
transcript: string
The final transcript of the audio.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) transcript>)
type: "response.output\_audio\_transcript.done"
The event type, must be `response.output\_audio\_transcript.done`.
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_audio_transcript_done_event > (schema)>)
ResponseCancelEvent object { type, event\_id, response\_id }
Send this event to cancel an in-progress response. The server will respond
with a `response.done` event with a status of `response.status=cancelled`. If
there is no response to cancel, the server will respond with an error. It’s safe
to call `response.cancel` even if no response is in progress, an error will be
returned the session will remain unaffected.
type: "response.cancel"
The event type, must be `response.cancel`.
[](<#(resource) realtime > (model) response_cancel_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) response_cancel_event > (schema) > (property) event_id>)
response\_id: optional string
A specific response ID to cancel - if not provided, will cancel an
in-progress response in the default conversation.
[](<#(resource) realtime > (model) response_cancel_event > (schema) > (property) response_id>)
[](<#(resource) realtime > (model) response_cancel_event > (schema)>)
ResponseContentPartAddedEvent object { content\_index, event\_id, item\_id, 4 more }
Returned when a new content part is added to an assistant message item during
response generation.
content\_index: number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) content_index>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item to which the content part was added.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) output_index>)
part: object { audio, text, transcript, type }
The content part that was added.
audio: optional string
Base64-encoded audio data (if type is “audio”).
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) audio>)
text: optional string
The text content (if type is “text”).
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) text>)
transcript: optional string
The transcript of the audio (if type is “audio”).
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) transcript>)
type: optional "audio" or "text"
The content type (“text”, “audio”).
One of the following:
"audio"
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) type > (member) 0>)
"text"
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) type > (member) 1>)
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part > (property) type>)
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) part>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) response_id>)
type: "response.content\_part.added"
The event type, must be `response.content\_part.added`.
[](<#(resource) realtime > (model) response_content_part_added_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_content_part_added_event > (schema)>)
ResponseContentPartDoneEvent object { content\_index, event\_id, item\_id, 4 more }
Returned when a content part is done streaming in an assistant message item.
Also emitted when a Response is interrupted, incomplete, or cancelled.
content\_index: number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) content_index>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) output_index>)
part: object { audio, text, transcript, type }
The content part that is done.
audio: optional string
Base64-encoded audio data (if type is “audio”).
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) audio>)
text: optional string
The text content (if type is “text”).
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) text>)
transcript: optional string
The transcript of the audio (if type is “audio”).
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) transcript>)
type: optional "audio" or "text"
The content type (“text”, “audio”).
One of the following:
"audio"
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) type > (member) 0>)
"text"
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) type > (member) 1>)
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part > (property) type>)
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) part>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) response_id>)
type: "response.content\_part.done"
The event type, must be `response.content\_part.done`.
[](<#(resource) realtime > (model) response_content_part_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_content_part_done_event > (schema)>)
ResponseCreateEvent object { type, event\_id, response }
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
type: "response.create"
The event type, must be `response.create`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) event_id>)
response: optional [RealtimeResponseCreateParams](</api/reference/resources/realtime#(resource) realtime > (model) realtime_response_create_params > (schema)>) { audio, conversation, input, 7 more }
Create a new Realtime response with these parameters
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response>)
[](<#(resource) realtime > (model) response_create_event > (schema)>)
ResponseCreatedEvent object { event\_id, response, type }
Returned when a new Response is created. The first event of response creation,
where the response is in an initial state of `in\_progress`.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_created_event > (schema) > (property) event_id>)
response: [RealtimeResponse](</api/reference/resources/realtime#(resource) realtime > (model) realtime_response > (schema)>) { id, audio, conversation\_id, 8 more }
The response resource.
[](<#(resource) realtime > (model) response_created_event > (schema) > (property) response>)
type: "response.created"
The event type, must be `response.created`.
[](<#(resource) realtime > (model) response_created_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_created_event > (schema)>)
ResponseDoneEvent object { event\_id, response, type }
Returned when a Response is done streaming. Always emitted, no matter the
final state. The Response object included in the `response.done` event will
include all output Items in the Response but will omit the raw audio data.
Clients should check the `status` field of the Response to determine if it was successful
(`completed`) or if there was another outcome: `cancelled`, `failed`, or `incomplete`.
A response will contain all output items that were generated during the response, excluding
any audio content.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_done_event > (schema) > (property) event_id>)
response: [RealtimeResponse](</api/reference/resources/realtime#(resource) realtime > (model) realtime_response > (schema)>) { id, audio, conversation\_id, 8 more }
The response resource.
[](<#(resource) realtime > (model) response_done_event > (schema) > (property) response>)
type: "response.done"
The event type, must be `response.done`.
[](<#(resource) realtime > (model) response_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_done_event > (schema)>)
ResponseFunctionCallArgumentsDeltaEvent object { call\_id, delta, event\_id, 4 more }
Returned when the model-generated function call arguments are updated.
call\_id: string
The ID of the function call.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) call_id>)
delta: string
The arguments delta as a JSON string.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) delta>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) event_id>)
item\_id: string
The ID of the function call item.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) response_id>)
type: "response.function\_call\_arguments.delta"
The event type, must be `response.function\_call\_arguments.delta`.
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_function_call_arguments_delta_event > (schema)>)
ResponseFunctionCallArgumentsDoneEvent object { arguments, call\_id, event\_id, 5 more }
Returned when the model-generated function call arguments are done streaming.
Also emitted when a Response is interrupted, incomplete, or cancelled.
arguments: string
The final arguments as a JSON string.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) arguments>)
call\_id: string
The ID of the function call.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) call_id>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) event_id>)
item\_id: string
The ID of the function call item.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) item_id>)
name: string
The name of the function that was called.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) name>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) response_id>)
type: "response.function\_call\_arguments.done"
The event type, must be `response.function\_call\_arguments.done`.
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_function_call_arguments_done_event > (schema)>)
ResponseMcpCallArgumentsDelta object { delta, event\_id, item\_id, 4 more }
Returned when MCP tool call arguments are updated during response generation.
delta: string
The JSON-encoded arguments delta.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) delta>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) event_id>)
item\_id: string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) response_id>)
type: "response.mcp\_call\_arguments.delta"
The event type, must be `response.mcp\_call\_arguments.delta`.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) type>)
obfuscation: optional string
If present, indicates the delta text was obfuscated.
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema) > (property) obfuscation>)
[](<#(resource) realtime > (model) response_mcp_call_arguments_delta > (schema)>)
ResponseMcpCallArgumentsDone object { arguments, event\_id, item\_id, 3 more }
Returned when MCP tool call arguments are finalized during response generation.
arguments: string
The final JSON-encoded arguments string.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) arguments>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) event_id>)
item\_id: string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) response_id>)
type: "response.mcp\_call\_arguments.done"
The event type, must be `response.mcp\_call\_arguments.done`.
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_mcp_call_arguments_done > (schema)>)
ResponseMcpCallCompleted object { event\_id, item\_id, output\_index, type }
Returned when an MCP tool call has completed successfully.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema) > (property) event_id>)
item\_id: string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema) > (property) output_index>)
type: "response.mcp\_call.completed"
The event type, must be `response.mcp\_call.completed`.
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_mcp_call_completed > (schema)>)
ResponseMcpCallFailed object { event\_id, item\_id, output\_index, type }
Returned when an MCP tool call has failed.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema) > (property) event_id>)
item\_id: string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema) > (property) output_index>)
type: "response.mcp\_call.failed"
The event type, must be `response.mcp\_call.failed`.
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_mcp_call_failed > (schema)>)
ResponseMcpCallInProgress object { event\_id, item\_id, output\_index, type }
Returned when an MCP tool call has started and is in progress.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema) > (property) event_id>)
item\_id: string
The ID of the MCP tool call item.
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema) > (property) output_index>)
type: "response.mcp\_call.in\_progress"
The event type, must be `response.mcp\_call.in\_progress`.
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_mcp_call_in_progress > (schema)>)
ResponseOutputItemAddedEvent object { event\_id, item, output\_index, 2 more }
Returned when a new Item is created during Response generation.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) event_id>)
item: [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) item>)
output\_index: number
The index of the output item in the Response.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) output_index>)
response\_id: string
The ID of the Response to which the item belongs.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) response_id>)
type: "response.output\_item.added"
The event type, must be `response.output\_item.added`.
[](<#(resource) realtime > (model) response_output_item_added_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_output_item_added_event > (schema)>)
ResponseOutputItemDoneEvent object { event\_id, item, output\_index, 2 more }
Returned when an Item is done streaming. Also emitted when a Response is
interrupted, incomplete, or cancelled.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) event_id>)
item: [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) item>)
output\_index: number
The index of the output item in the Response.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) output_index>)
response\_id: string
The ID of the Response to which the item belongs.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) response_id>)
type: "response.output\_item.done"
The event type, must be `response.output\_item.done`.
[](<#(resource) realtime > (model) response_output_item_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_output_item_done_event > (schema)>)
ResponseTextDeltaEvent object { content\_index, delta, event\_id, 4 more }
Returned when the text value of an “output\_text” content part is updated.
content\_index: number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) content_index>)
delta: string
The text delta.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) delta>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) response_id>)
type: "response.output\_text.delta"
The event type, must be `response.output\_text.delta`.
[](<#(resource) realtime > (model) response_text_delta_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_text_delta_event > (schema)>)
ResponseTextDoneEvent object { content\_index, event\_id, item\_id, 4 more }
Returned when the text value of an “output\_text” content part is done streaming. Also
emitted when a Response is interrupted, incomplete, or cancelled.
content\_index: number
The index of the content part in the item’s content array.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) content_index>)
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) event_id>)
item\_id: string
The ID of the item.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) item_id>)
output\_index: number
The index of the output item in the response.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) output_index>)
response\_id: string
The ID of the response.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) response_id>)
text: string
The final text content.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) text>)
type: "response.output\_text.done"
The event type, must be `response.output\_text.done`.
[](<#(resource) realtime > (model) response_text_done_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_text_done_event > (schema)>)
SessionCreatedEvent object { event\_id, session, type }
Returned when a Session is created. Emitted automatically when a new
connection is established as the first server event. This event will contain
the default Session configuration.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) session_created_event > (schema) > (property) event_id>)
session: [RealtimeSessionCreateRequest](</api/reference/resources/realtime#(resource) realtime > (model) realtime_session_create_request > (schema)>) { type, audio, include, 9 more } or [RealtimeTranscriptionSessionCreateRequest](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>) { type, audio, include }
The session configuration.
One of the following:
RealtimeSessionCreateRequest object { type, audio, include, 9 more }
Realtime session object configuration.
type: "realtime"
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) type>)
audio: optional [RealtimeAudioConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_config > (schema)>) { input, output }
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) include>)
instructions: optional string
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) instructions>)
max\_output\_tokens: optional number or "inf"
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
number
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 0>)
"inf"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens>)
model: optional string or "gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 0>)
"gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
"gpt-realtime"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 0>)
"gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 1>)
"gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 2>)
"gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 3>)
"gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 4>)
"gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 5>)
"gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 6>)
"gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 7>)
"gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 8>)
"gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 9>)
"gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 10>)
"gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 11>)
"gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 12>)
"gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 13>)
"gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 14>)
"gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model>)
output\_modalities: optional array of "text" or "audio"
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
"text"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 0>)
"audio"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities>)
prompt: optional [ResponsePrompt](</api/reference/resources/responses#(resource) responses > (model) response_prompt > (schema)>) { id, variables, version }
Reference to a prompt template and its variables.
[Learn more](/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt>)
tool\_choice: optional [RealtimeToolChoiceConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice>)
tools: optional [RealtimeToolsConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tools_config > (schema)>) { , McpTool }
Tools available to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools>)
tracing: optional [RealtimeTracingConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tracing_config > (schema)>)
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing>)
truncation: optional [RealtimeTruncation](</api/reference/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema)>)
RealtimeTranscriptionSessionCreateRequest object { type, audio, include }
Realtime transcription session object configuration.
type: "transcription"
The type of session to create. Always `transcription` for transcription sessions.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) type>)
audio: optional [RealtimeTranscriptionSessionAudio](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>) { input }
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) include>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>)
[](<#(resource) realtime > (model) session_created_event > (schema) > (property) session>)
type: "session.created"
The event type, must be `session.created`.
[](<#(resource) realtime > (model) session_created_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) session_created_event > (schema)>)
SessionUpdateEvent object { session, type, event\_id }
Send this event to update the session’s configuration.
The client may send this event at any time to update any field
except for `voice` and `model`. `voice` can be updated only if there have been no other audio outputs yet.
When the server receives a `session.update`, it will respond
with a `session.updated` event showing the full, effective configuration.
Only the fields that are present in the `session.update` are updated. To clear a field like
`instructions`, pass an empty string. To clear a field like `tools`, pass an empty array.
To clear a field like `turn\_detection`, pass `null`.
session: [RealtimeSessionCreateRequest](</api/reference/resources/realtime#(resource) realtime > (model) realtime_session_create_request > (schema)>) { type, audio, include, 9 more } or [RealtimeTranscriptionSessionCreateRequest](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>) { type, audio, include }
Update the Realtime session. Choose either a realtime
session or a transcription session.
One of the following:
RealtimeSessionCreateRequest object { type, audio, include, 9 more }
Realtime session object configuration.
type: "realtime"
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) type>)
audio: optional [RealtimeAudioConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_config > (schema)>) { input, output }
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) include>)
instructions: optional string
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) instructions>)
max\_output\_tokens: optional number or "inf"
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
number
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 0>)
"inf"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens>)
model: optional string or "gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 0>)
"gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
"gpt-realtime"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 0>)
"gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 1>)
"gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 2>)
"gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 3>)
"gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 4>)
"gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 5>)
"gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 6>)
"gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 7>)
"gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 8>)
"gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 9>)
"gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 10>)
"gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 11>)
"gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 12>)
"gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 13>)
"gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 14>)
"gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model>)
output\_modalities: optional array of "text" or "audio"
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
"text"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 0>)
"audio"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities>)
prompt: optional [ResponsePrompt](</api/reference/resources/responses#(resource) responses > (model) response_prompt > (schema)>) { id, variables, version }
Reference to a prompt template and its variables.
[Learn more](/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt>)
tool\_choice: optional [RealtimeToolChoiceConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice>)
tools: optional [RealtimeToolsConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tools_config > (schema)>) { , McpTool }
Tools available to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools>)
tracing: optional [RealtimeTracingConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tracing_config > (schema)>)
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing>)
truncation: optional [RealtimeTruncation](</api/reference/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema)>)
RealtimeTranscriptionSessionCreateRequest object { type, audio, include }
Realtime transcription session object configuration.
type: "transcription"
The type of session to create. Always `transcription` for transcription sessions.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) type>)
audio: optional [RealtimeTranscriptionSessionAudio](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>) { input }
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) include>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>)
[](<#(resource) realtime > (model) session_update_event > (schema) > (property) session>)
type: "session.update"
The event type, must be `session.update`.
[](<#(resource) realtime > (model) session_update_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event. This is an arbitrary string that a client may assign. It will be passed back if there is an error with the event, but the corresponding `session.updated` event will not include it.
maxLength512
[](<#(resource) realtime > (model) session_update_event > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) session_update_event > (schema)>)
SessionUpdatedEvent object { event\_id, session, type }
Returned when a session is updated with a `session.update` event, unless
there is an error.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) session_updated_event > (schema) > (property) event_id>)
session: [RealtimeSessionCreateRequest](</api/reference/resources/realtime#(resource) realtime > (model) realtime_session_create_request > (schema)>) { type, audio, include, 9 more } or [RealtimeTranscriptionSessionCreateRequest](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>) { type, audio, include }
The session configuration.
One of the following:
RealtimeSessionCreateRequest object { type, audio, include, 9 more }
Realtime session object configuration.
type: "realtime"
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) type>)
audio: optional [RealtimeAudioConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_config > (schema)>) { input, output }
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) include>)
instructions: optional string
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) instructions>)
max\_output\_tokens: optional number or "inf"
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
number
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 0>)
"inf"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens>)
model: optional string or "gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 0>)
"gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
"gpt-realtime"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 0>)
"gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 1>)
"gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 2>)
"gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 3>)
"gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 4>)
"gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 5>)
"gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 6>)
"gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 7>)
"gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 8>)
"gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 9>)
"gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 10>)
"gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 11>)
"gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 12>)
"gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 13>)
"gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 14>)
"gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model>)
output\_modalities: optional array of "text" or "audio"
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
"text"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 0>)
"audio"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities>)
prompt: optional [ResponsePrompt](</api/reference/resources/responses#(resource) responses > (model) response_prompt > (schema)>) { id, variables, version }
Reference to a prompt template and its variables.
[Learn more](/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt>)
tool\_choice: optional [RealtimeToolChoiceConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice>)
tools: optional [RealtimeToolsConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tools_config > (schema)>) { , McpTool }
Tools available to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools>)
tracing: optional [RealtimeTracingConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tracing_config > (schema)>)
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing>)
truncation: optional [RealtimeTruncation](</api/reference/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema)>)
RealtimeTranscriptionSessionCreateRequest object { type, audio, include }
Realtime transcription session object configuration.
type: "transcription"
The type of session to create. Always `transcription` for transcription sessions.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) type>)
audio: optional [RealtimeTranscriptionSessionAudio](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>) { input }
Configuration for input and output audio.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) include>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>)
[](<#(resource) realtime > (model) session_updated_event > (schema) > (property) session>)
type: "session.updated"
The event type, must be `session.updated`.
[](<#(resource) realtime > (model) session_updated_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) session_updated_event > (schema)>)
TranscriptionSessionUpdate object { session, type, event\_id }
Send this event to update a transcription session.
session: object { include, input\_audio\_format, input\_audio\_noise\_reduction, 2 more }
Realtime transcription session object configuration.
include: optional array of "item.input\_audio\_transcription.logprobs"
The set of items to include in the transcription. Current available items are:
`item.input\_audio\_transcription.logprobs`
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) include>)
input\_audio\_format: optional "pcm16" or "g711\_ulaw" or "g711\_alaw"
The format of input audio. Options are `pcm16`, `g711\_ulaw`, or `g711\_alaw`.
For `pcm16`, input audio must be 16-bit PCM at a 24kHz sample rate,
single channel (mono), and little-endian byte order.
One of the following:
"pcm16"
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) input_audio_format > (member) 0>)
"g711\_ulaw"
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) input_audio_format > (member) 1>)
"g711\_alaw"
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) input_audio_format > (member) 2>)
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) input_audio_format>)
input\_audio\_noise\_reduction: optional object { type }
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
type: optional [NoiseReductionType](</api/reference/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) input_audio_noise_reduction > (property) type>)
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) input_audio_noise_reduction>)
input\_audio\_transcription: optional [AudioTranscription](</api/reference/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration for input audio transcription. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) input_audio_transcription>)
turn\_detection: optional object { prefix\_padding\_ms, silence\_duration\_ms, threshold, type }
Configuration for turn detection. Can be set to `null` to turn off. Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
prefix\_padding\_ms: optional number
Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) turn_detection > (property) prefix_padding_ms>)
silence\_duration\_ms: optional number
Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) turn_detection > (property) silence_duration_ms>)
threshold: optional number
Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) turn_detection > (property) threshold>)
type: optional "server\_vad"
Type of turn detection. Only `server\_vad` is currently supported for transcription sessions.
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) turn_detection > (property) type>)
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session > (property) turn_detection>)
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) session>)
type: "transcription\_session.update"
The event type, must be `transcription\_session.update`.
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
[](<#(resource) realtime > (model) transcription_session_update > (schema) > (property) event_id>)
[](<#(resource) realtime > (model) transcription_session_update > (schema)>)
TranscriptionSessionUpdatedEvent object { event\_id, session, type }
Returned when a transcription session is updated with a `transcription\_session.update` event, unless
there is an error.
event\_id: string
The unique ID of the server event.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) event_id>)
session: object { client\_secret, input\_audio\_format, input\_audio\_transcription, 2 more }
A new Realtime transcription session configuration.
When a session is created on the server via REST API, the session object
also contains an ephemeral key. Default TTL for keys is 10 minutes. This
property is not present when a session is updated via the WebSocket API.
client\_secret: object { expires\_at, value }
Ephemeral key returned by the API. Only present when the session is
created on the server via REST API.
expires\_at: number
Timestamp for when the token expires. Currently, all tokens expire
after one minute.
formatunixtime
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) client_secret > (property) expires_at>)
value: string
Ephemeral key usable in client environments to authenticate connections
to the Realtime API. Use this in client-side environments rather than
a standard API token, which should only be used server-side.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) client_secret > (property) value>)
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) client_secret>)
input\_audio\_format: optional string
The format of input audio. Options are `pcm16`, `g711\_ulaw`, or `g711\_alaw`.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) input_audio_format>)
input\_audio\_transcription: optional [AudioTranscription](</api/reference/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration of the transcription model.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) input_audio_transcription>)
modalities: optional array of "text" or "audio"
The set of modalities the model can respond with. To disable audio,
set this to [“text”].
One of the following:
"text"
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) modalities > (items) > (member) 0>)
"audio"
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) modalities>)
turn\_detection: optional object { prefix\_padding\_ms, silence\_duration\_ms, threshold, type }
Configuration for turn detection. Can be set to `null` to turn off. Server
VAD means that the model will detect the start and end of speech based on
audio volume and respond at the end of user speech.
prefix\_padding\_ms: optional number
Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) turn_detection > (property) prefix_padding_ms>)
silence\_duration\_ms: optional number
Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) turn_detection > (property) silence_duration_ms>)
threshold: optional number
Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) turn_detection > (property) threshold>)
type: optional string
Type of turn detection, only `server\_vad` is currently supported.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) turn_detection > (property) type>)
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session > (property) turn_detection>)
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) session>)
type: "transcription\_session.updated"
The event type, must be `transcription\_session.updated`.
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema) > (property) type>)
[](<#(resource) realtime > (model) transcription_session_updated_event > (schema)>)
#### RealtimeClient Secrets
##### [Create client secret](/api/reference/resources/realtime/subresources/client_secrets/methods/create)
POST/realtime/client\_secrets
##### ModelsExpand Collapse
RealtimeSessionClientSecret object { expires\_at, value }
Ephemeral key returned by the API.
expires\_at: number
Timestamp for when the token expires. Currently, all tokens expire
after one minute.
formatunixtime
[](<#(resource) realtime.client_secrets > (model) realtime_session_client_secret > (schema) > (property) expires_at>)
value: string
Ephemeral key usable in client environments to authenticate connections to the Realtime API. Use this in client-side environments rather than a standard API token, which should only be used server-side.
[](<#(resource) realtime.client_secrets > (model) realtime_session_client_secret > (schema) > (property) value>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_client_secret > (schema)>)
RealtimeSessionCreateResponse object { client\_secret, type, audio, 10 more }
A new Realtime session configuration, with an ephemeral key. Default TTL
for keys is one minute.
client\_secret: [RealtimeSessionClientSecret](</api/reference/resources/realtime#(resource) realtime.client_secrets > (model) realtime_session_client_secret > (schema)>) { expires\_at, value }
Ephemeral key returned by the API.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) client_secret>)
type: "realtime"
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) type>)
audio: optional object { input, output }
Configuration for input and output audio.
input: optional object { format, noise\_reduction, transcription, turn\_detection }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The format of the input audio.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) format>)
noise\_reduction: optional object { type }
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
type: optional [NoiseReductionType](</api/reference/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction>)
transcription: optional [AudioTranscription](</api/reference/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration for input audio transcription, defaults to off and can be set to `null` to turn off once on. Input audio transcription is not native to the model, since the model consumes audio directly. Transcription runs asynchronously through [the /audio/transcriptions endpoint](/docs/api-reference/audio/createTranscription) and should be treated as guidance of input audio content rather than precisely what the model heard. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) transcription>)
turn\_detection: optional object { type, create\_response, idle\_timeout\_ms, 4 more } or object { type, create\_response, eagerness, interrupt\_response }
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with “uhhm”, the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
One of the following:
ServerVad object { type, create\_response, idle\_timeout\_ms, 4 more }
Server-side voice activity detection (VAD) which flips on when user speech is detected and off after a period of silence.
type: "server\_vad"
Type of turn detection, `server\_vad` to turn on simple Server VAD.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) type>)
create\_response: optional boolean
Whether or not to automatically generate a response when a VAD stop event occurs. If `interrupt\_response` is set to `false` this may fail to create a response if the model is already responding.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) create_response>)
idle\_timeout\_ms: optional number
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
interrupt\_response: optional boolean
Whether or not to automatically interrupt (cancel) any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs. If `true` then the response will be cancelled, otherwise it will continue until complete.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) interrupt_response>)
prefix\_padding\_ms: optional number
Used only for `server\_vad` mode. Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) prefix_padding_ms>)
silence\_duration\_ms: optional number
Used only for `server\_vad` mode. Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) silence_duration_ms>)
threshold: optional number
Used only for `server\_vad` mode. Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) threshold>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0>)
SemanticVad object { type, create\_response, eagerness, interrupt\_response }
Server-side semantic turn detection which uses a model to determine when the user has finished speaking.
type: "semantic\_vad"
Type of turn detection, `semantic\_vad` to turn on Semantic VAD.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) type>)
create\_response: optional boolean
Whether or not to automatically generate a response when a VAD stop event occurs.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) create_response>)
eagerness: optional "low" or "medium" or "high" or "auto"
Used only for `semantic\_vad` mode. The eagerness of the model to respond. `low` will wait longer for the user to continue speaking, `high` will respond more quickly. `auto` is the default and is equivalent to `medium`. `low`, `medium`, and `high` have max timeouts of 8s, 4s, and 2s respectively.
One of the following:
"low"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 0>)
"medium"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 1>)
"high"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 2>)
"auto"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 3>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness>)
interrupt\_response: optional boolean
Whether or not to automatically interrupt any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) interrupt_response>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input>)
output: optional object { format, speed, voice }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The format of the output audio.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) format>)
speed: optional number
The speed of the model’s spoken response as a multiple of the original speed.
1.0 is the default speed. 0.25 is the minimum speed. 1.5 is the maximum speed. This value can only be changed in between model turns, not while a response is in progress.
This parameter is a post-processing adjustment to the audio after it is generated, it’s
also possible to prompt the model to speak faster or slower.
maximum1.5
minimum0.25
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) speed>)
voice: optional string or "alloy" or "ash" or "ballad" or 7 more
The voice the model uses to respond. Voice cannot be changed during the
session once the model has responded with audio at least once. Current
voice options are `alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`,
`shimmer`, `verse`, `marin`, and `cedar`. We recommend `marin` and `cedar` for
best quality.
One of the following:
string
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 0>)
"alloy" or "ash" or "ballad" or 7 more
The voice the model uses to respond. Voice cannot be changed during the
session once the model has responded with audio at least once. Current
voice options are `alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`,
`shimmer`, `verse`, `marin`, and `cedar`. We recommend `marin` and `cedar` for
best quality.
One of the following:
"alloy"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 0>)
"ash"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 1>)
"ballad"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 2>)
"coral"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 3>)
"echo"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 4>)
"sage"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 5>)
"shimmer"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 6>)
"verse"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 7>)
"marin"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 8>)
"cedar"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) include>)
instructions: optional string
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) instructions>)
max\_output\_tokens: optional number or "inf"
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
number
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) max_output_tokens > (variant) 0>)
"inf"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) max_output_tokens>)
model: optional string or "gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 0>)
"gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
"gpt-realtime"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 0>)
"gpt-realtime-1.5"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 1>)
"gpt-realtime-2025-08-28"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 2>)
"gpt-4o-realtime-preview"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 3>)
"gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 4>)
"gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 5>)
"gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 6>)
"gpt-4o-mini-realtime-preview"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 7>)
"gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 8>)
"gpt-realtime-mini"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 9>)
"gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 10>)
"gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 11>)
"gpt-audio-1.5"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 12>)
"gpt-audio-mini"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 13>)
"gpt-audio-mini-2025-10-06"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 14>)
"gpt-audio-mini-2025-12-15"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model>)
output\_modalities: optional array of "text" or "audio"
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
"text"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) output_modalities > (items) > (member) 0>)
"audio"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) output_modalities>)
prompt: optional [ResponsePrompt](</api/reference/resources/responses#(resource) responses > (model) response_prompt > (schema)>) { id, variables, version }
Reference to a prompt template and its variables.
[Learn more](/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt>)
tool\_choice: optional [ToolChoiceOptions](</api/reference/resources/responses#(resource) responses > (model) tool_choice_options > (schema)>) or [ToolChoiceFunction](</api/reference/resources/responses#(resource) responses > (model) tool_choice_function > (schema)>) { name, type } or [ToolChoiceMcp](</api/reference/resources/responses#(resource) responses > (model) tool_choice_mcp > (schema)>) { server\_label, type, name }
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
One of the following:
ToolChoiceOptions = "none" or "auto" or "required"
Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or
more tools.
`required` means the model must call one or more tools.
One of the following:
"none"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 0>)
"auto"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 1>)
"required"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 2>)
[](<#(resource) responses > (model) tool_choice_options > (schema)>)
ToolChoiceFunction object { name, type }
Use this option to force the model to call a specific function.
name: string
The name of the function to call.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) name>)
type: "function"
For function calling, the type is always `function`.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) type>)
[](<#(resource) responses > (model) tool_choice_function > (schema)>)
ToolChoiceMcp object { server\_label, type, name }
Use this option to force the model to call a specific tool on a remote MCP server.
server\_label: string
The label of the MCP server to use.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) server_label>)
type: "mcp"
For MCP tools, the type is always `mcp`.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) type>)
name: optional string
The name of the tool to call on the server.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) name>)
[](<#(resource) responses > (model) tool_choice_mcp > (schema)>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tool_choice>)
tools: optional array of [RealtimeFunctionTool](</api/reference/resources/realtime#(resource) realtime > (model) realtime_function_tool > (schema)>) { description, name, parameters, type } or object { server\_label, type, allowed\_tools, 7 more }
Tools available to the model.
One of the following:
RealtimeFunctionTool object { description, name, parameters, type }
description: optional string
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
name: optional string
The name of the function.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
parameters: optional unknown
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
type: optional "function"
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_function_tool > (schema)>)
McpTool object { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) type>)
allowed\_tools: optional array of string or object { read\_only, tool\_names }
List of allowed tool names or a filter object.
One of the following:
McpAllowedTools = array of string
A string array of allowed tool names
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 0>)
McpToolFilter object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools>)
authorization: optional string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) authorization>)
connector\_id: optional "connector\_dropbox" or "connector\_gmail" or "connector\_googlecalendar" or 5 more
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](/docs/guides/tools-remote-mcp#connectors).
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
"connector\_dropbox"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 7>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id>)
defer\_loading: optional boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) defer_loading>)
headers: optional map[string]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) headers>)
require\_approval: optional object { always, never } or "always" or "never"
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter object { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always>)
never: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0>)
McpToolApprovalSetting = "always" or "never"
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
"always"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval>)
server\_description: optional string
Optional description of the MCP server, used to provide more context.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) server_description>)
server\_url: optional string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) server_url>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools>)
tracing: optional "auto" or object { group\_id, metadata, workflow\_name }
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
One of the following:
Auto = "auto"
Enables tracing and sets default values for tracing configuration options. Always `auto`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 0>)
TracingConfiguration object { group\_id, metadata, workflow\_name }
Granular configuration for tracing.
group\_id: optional string
The group id to attach to this trace to enable filtering and
grouping in the Traces Dashboard.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 1 > (property) group_id>)
metadata: optional unknown
The arbitrary metadata to attach to this trace to enable
filtering in the Traces Dashboard.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 1 > (property) metadata>)
workflow\_name: optional string
The name of the workflow to attach to this trace. This is used to
name the trace in the Traces Dashboard.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 1 > (property) workflow_name>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing>)
truncation: optional [RealtimeTruncation](</api/reference/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) truncation>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema)>)
RealtimeTranscriptionSessionCreateResponse object { id, object, type, 3 more }
A Realtime transcription session configuration object.
id: string
Unique identifier for the session that looks like `sess\_1234567890abcdef`.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) id>)
object: string
The object type. Always `realtime.transcription\_session`.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) object>)
type: "transcription"
The type of session. Always `transcription` for transcription sessions.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) type>)
audio: optional object { input }
Configuration for input audio for the session.
input: optional object { format, noise\_reduction, transcription, turn\_detection }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The PCM audio format. Only a 24kHz sample rate is supported.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) format>)
noise\_reduction: optional object { type }
Configuration for input audio noise reduction.
type: optional [NoiseReductionType](</api/reference/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction>)
transcription: optional [AudioTranscription](</api/reference/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration of the transcription model.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) transcription>)
turn\_detection: optional [RealtimeTranscriptionSessionTurnDetection](</api/reference/resources/realtime#(resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema)>) { prefix\_padding\_ms, silence\_duration\_ms, threshold, type }
Configuration for turn detection. Can be set to `null` to turn off. Server
VAD means that the model will detect the start and end of speech based on
audio volume and respond at the end of user speech.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio>)
expires\_at: optional number
Expiration timestamp for the session, in seconds since epoch.
formatunixtime
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) expires_at>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
* `item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) include>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema)>)
RealtimeTranscriptionSessionTurnDetection object { prefix\_padding\_ms, silence\_duration\_ms, threshold, type }
Configuration for turn detection. Can be set to `null` to turn off. Server
VAD means that the model will detect the start and end of speech based on
audio volume and respond at the end of user speech.
prefix\_padding\_ms: optional number
Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema) > (property) prefix_padding_ms>)
silence\_duration\_ms: optional number
Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema) > (property) silence_duration_ms>)
threshold: optional number
Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema) > (property) threshold>)
type: optional string
Type of turn detection, only `server\_vad` is currently supported.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema) > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema)>)
ClientSecretCreateResponse object { expires\_at, session, value }
Response from creating a session and client secret for the Realtime API.
expires\_at: number
Expiration timestamp for the client secret, in seconds since epoch.
formatunixtime
[](<#(resource) realtime.client_secrets > (model) client_secret_create_response > (schema) > (property) expires_at>)
session: [RealtimeSessionCreateResponse](</api/reference/resources/realtime#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema)>) { client\_secret, type, audio, 10 more } or [RealtimeTranscriptionSessionCreateResponse](</api/reference/resources/realtime#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema)>) { id, object, type, 3 more }
The session configuration for either a realtime or transcription session.
One of the following:
RealtimeSessionCreateResponse object { client\_secret, type, audio, 10 more }
A new Realtime session configuration, with an ephemeral key. Default TTL
for keys is one minute.
client\_secret: [RealtimeSessionClientSecret](</api/reference/resources/realtime#(resource) realtime.client_secrets > (model) realtime_session_client_secret > (schema)>) { expires\_at, value }
Ephemeral key returned by the API.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) client_secret>)
type: "realtime"
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) type>)
audio: optional object { input, output }
Configuration for input and output audio.
input: optional object { format, noise\_reduction, transcription, turn\_detection }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The format of the input audio.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) format>)
noise\_reduction: optional object { type }
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
type: optional [NoiseReductionType](</api/reference/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction>)
transcription: optional [AudioTranscription](</api/reference/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration for input audio transcription, defaults to off and can be set to `null` to turn off once on. Input audio transcription is not native to the model, since the model consumes audio directly. Transcription runs asynchronously through [the /audio/transcriptions endpoint](/docs/api-reference/audio/createTranscription) and should be treated as guidance of input audio content rather than precisely what the model heard. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) transcription>)
turn\_detection: optional object { type, create\_response, idle\_timeout\_ms, 4 more } or object { type, create\_response, eagerness, interrupt\_response }
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with “uhhm”, the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
One of the following:
ServerVad object { type, create\_response, idle\_timeout\_ms, 4 more }
Server-side voice activity detection (VAD) which flips on when user speech is detected and off after a period of silence.
type: "server\_vad"
Type of turn detection, `server\_vad` to turn on simple Server VAD.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) type>)
create\_response: optional boolean
Whether or not to automatically generate a response when a VAD stop event occurs. If `interrupt\_response` is set to `false` this may fail to create a response if the model is already responding.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) create_response>)
idle\_timeout\_ms: optional number
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
interrupt\_response: optional boolean
Whether or not to automatically interrupt (cancel) any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs. If `true` then the response will be cancelled, otherwise it will continue until complete.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) interrupt_response>)
prefix\_padding\_ms: optional number
Used only for `server\_vad` mode. Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) prefix_padding_ms>)
silence\_duration\_ms: optional number
Used only for `server\_vad` mode. Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) silence_duration_ms>)
threshold: optional number
Used only for `server\_vad` mode. Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) threshold>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0>)
SemanticVad object { type, create\_response, eagerness, interrupt\_response }
Server-side semantic turn detection which uses a model to determine when the user has finished speaking.
type: "semantic\_vad"
Type of turn detection, `semantic\_vad` to turn on Semantic VAD.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) type>)
create\_response: optional boolean
Whether or not to automatically generate a response when a VAD stop event occurs.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) create_response>)
eagerness: optional "low" or "medium" or "high" or "auto"
Used only for `semantic\_vad` mode. The eagerness of the model to respond. `low` will wait longer for the user to continue speaking, `high` will respond more quickly. `auto` is the default and is equivalent to `medium`. `low`, `medium`, and `high` have max timeouts of 8s, 4s, and 2s respectively.
One of the following:
"low"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 0>)
"medium"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 1>)
"high"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 2>)
"auto"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 3>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness>)
interrupt\_response: optional boolean
Whether or not to automatically interrupt any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) interrupt_response>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input>)
output: optional object { format, speed, voice }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The format of the output audio.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) format>)
speed: optional number
The speed of the model’s spoken response as a multiple of the original speed.
1.0 is the default speed. 0.25 is the minimum speed. 1.5 is the maximum speed. This value can only be changed in between model turns, not while a response is in progress.
This parameter is a post-processing adjustment to the audio after it is generated, it’s
also possible to prompt the model to speak faster or slower.
maximum1.5
minimum0.25
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) speed>)
voice: optional string or "alloy" or "ash" or "ballad" or 7 more
The voice the model uses to respond. Voice cannot be changed during the
session once the model has responded with audio at least once. Current
voice options are `alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`,
`shimmer`, `verse`, `marin`, and `cedar`. We recommend `marin` and `cedar` for
best quality.
One of the following:
string
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 0>)
"alloy" or "ash" or "ballad" or 7 more
The voice the model uses to respond. Voice cannot be changed during the
session once the model has responded with audio at least once. Current
voice options are `alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`,
`shimmer`, `verse`, `marin`, and `cedar`. We recommend `marin` and `cedar` for
best quality.
One of the following:
"alloy"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 0>)
"ash"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 1>)
"ballad"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 2>)
"coral"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 3>)
"echo"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 4>)
"sage"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 5>)
"shimmer"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 6>)
"verse"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 7>)
"marin"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 8>)
"cedar"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) include>)
instructions: optional string
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) instructions>)
max\_output\_tokens: optional number or "inf"
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
number
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) max_output_tokens > (variant) 0>)
"inf"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) max_output_tokens>)
model: optional string or "gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
string
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 0>)
"gpt-realtime" or "gpt-realtime-1.5" or "gpt-realtime-2025-08-28" or 13 more
The Realtime model used for this session.
One of the following:
"gpt-realtime"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 0>)
"gpt-realtime-1.5"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 1>)
"gpt-realtime-2025-08-28"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 2>)
"gpt-4o-realtime-preview"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 3>)
"gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 4>)
"gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 5>)
"gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 6>)
"gpt-4o-mini-realtime-preview"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 7>)
"gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 8>)
"gpt-realtime-mini"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 9>)
"gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 10>)
"gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 11>)
"gpt-audio-1.5"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 12>)
"gpt-audio-mini"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 13>)
"gpt-audio-mini-2025-10-06"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 14>)
"gpt-audio-mini-2025-12-15"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model>)
output\_modalities: optional array of "text" or "audio"
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
"text"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) output_modalities > (items) > (member) 0>)
"audio"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) output_modalities>)
prompt: optional [ResponsePrompt](</api/reference/resources/responses#(resource) responses > (model) response_prompt > (schema)>) { id, variables, version }
Reference to a prompt template and its variables.
[Learn more](/docs/guides/text?api-mode=responses#reusable-prompts).
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt>)
tool\_choice: optional [ToolChoiceOptions](</api/reference/resources/responses#(resource) responses > (model) tool_choice_options > (schema)>) or [ToolChoiceFunction](</api/reference/resources/responses#(resource) responses > (model) tool_choice_function > (schema)>) { name, type } or [ToolChoiceMcp](</api/reference/resources/responses#(resource) responses > (model) tool_choice_mcp > (schema)>) { server\_label, type, name }
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
One of the following:
ToolChoiceOptions = "none" or "auto" or "required"
Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or
more tools.
`required` means the model must call one or more tools.
One of the following:
"none"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 0>)
"auto"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 1>)
"required"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 2>)
[](<#(resource) responses > (model) tool_choice_options > (schema)>)
ToolChoiceFunction object { name, type }
Use this option to force the model to call a specific function.
name: string
The name of the function to call.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) name>)
type: "function"
For function calling, the type is always `function`.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) type>)
[](<#(resource) responses > (model) tool_choice_function > (schema)>)
ToolChoiceMcp object { server\_label, type, name }
Use this option to force the model to call a specific tool on a remote MCP server.
server\_label: string
The label of the MCP server to use.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) server_label>)
type: "mcp"
For MCP tools, the type is always `mcp`.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) type>)
name: optional string
The name of the tool to call on the server.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) name>)
[](<#(resource) responses > (model) tool_choice_mcp > (schema)>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tool_choice>)
tools: optional array of [RealtimeFunctionTool](</api/reference/resources/realtime#(resource) realtime > (model) realtime_function_tool > (schema)>) { description, name, parameters, type } or object { server\_label, type, allowed\_tools, 7 more }
Tools available to the model.
One of the following:
RealtimeFunctionTool object { description, name, parameters, type }
description: optional string
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
name: optional string
The name of the function.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
parameters: optional unknown
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
type: optional "function"
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_function_tool > (schema)>)
McpTool object { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) type>)
allowed\_tools: optional array of string or object { read\_only, tool\_names }
List of allowed tool names or a filter object.
One of the following:
McpAllowedTools = array of string
A string array of allowed tool names
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 0>)
McpToolFilter object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools>)
authorization: optional string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) authorization>)
connector\_id: optional "connector\_dropbox" or "connector\_gmail" or "connector\_googlecalendar" or 5 more
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](/docs/guides/tools-remote-mcp#connectors).
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
"connector\_dropbox"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 7>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id>)
defer\_loading: optional boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) defer_loading>)
headers: optional map[string]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) headers>)
require\_approval: optional object { always, never } or "always" or "never"
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter object { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always>)
never: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0>)
McpToolApprovalSetting = "always" or "never"
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
"always"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval>)
server\_description: optional string
Optional description of the MCP server, used to provide more context.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) server_description>)
server\_url: optional string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) server_url>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools>)
tracing: optional "auto" or object { group\_id, metadata, workflow\_name }
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
One of the following:
Auto = "auto"
Enables tracing and sets default values for tracing configuration options. Always `auto`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 0>)
TracingConfiguration object { group\_id, metadata, workflow\_name }
Granular configuration for tracing.
group\_id: optional string
The group id to attach to this trace to enable filtering and
grouping in the Traces Dashboard.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 1 > (property) group_id>)
metadata: optional unknown
The arbitrary metadata to attach to this trace to enable
filtering in the Traces Dashboard.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 1 > (property) metadata>)
workflow\_name: optional string
The name of the workflow to attach to this trace. This is used to
name the trace in the Traces Dashboard.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 1 > (property) workflow_name>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing>)
truncation: optional [RealtimeTruncation](</api/reference/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) truncation>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema)>)
RealtimeTranscriptionSessionCreateResponse object { id, object, type, 3 more }
A Realtime transcription session configuration object.
id: string
Unique identifier for the session that looks like `sess\_1234567890abcdef`.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) id>)
object: string
The object type. Always `realtime.transcription\_session`.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) object>)
type: "transcription"
The type of session. Always `transcription` for transcription sessions.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) type>)
audio: optional object { input }
Configuration for input audio for the session.
input: optional object { format, noise\_reduction, transcription, turn\_detection }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The PCM audio format. Only a 24kHz sample rate is supported.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) format>)
noise\_reduction: optional object { type }
Configuration for input audio noise reduction.
type: optional [NoiseReductionType](</api/reference/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction>)
transcription: optional [AudioTranscription](</api/reference/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration of the transcription model.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) transcription>)
turn\_detection: optional [RealtimeTranscriptionSessionTurnDetection](</api/reference/resources/realtime#(resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema)>) { prefix\_padding\_ms, silence\_duration\_ms, threshold, type }
Configuration for turn detection. Can be set to `null` to turn off. Server
VAD means that the model will detect the start and end of speech based on
audio volume and respond at the end of user speech.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio>)
expires\_at: optional number
Expiration timestamp for the session, in seconds since epoch.
formatunixtime
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) expires_at>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
* `item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) include>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema)>)
[](<#(resource) realtime.client_secrets > (model) client_secret_create_response > (schema) > (property) session>)
value: string
The generated client secret value.
[](<#(resource) realtime.client_secrets > (model) client_secret_create_response > (schema) > (property) value>)
[](<#(resource) realtime.client_secrets > (model) client_secret_create_response > (schema)>)
#### RealtimeCalls
##### [Accept call](/api/reference/resources/realtime/subresources/calls/methods/accept)
POST/realtime/calls/{call\_id}/accept
##### [Hang up call](/api/reference/resources/realtime/subresources/calls/methods/hangup)
POST/realtime/calls/{call\_id}/hangup
##### [Refer call](/api/reference/resources/realtime/subresources/calls/methods/refer)
POST/realtime/calls/{call\_id}/refer
##### [Reject call](/api/reference/resources/realtime/subresources/calls/methods/reject)
POST/realtime/calls/{call\_id}/reject
#### RealtimeSessions
##### [Create session](/api/reference/resources/realtime/subresources/sessions/methods/create)
Deprecated
POST/realtime/sessions
##### ModelsExpand Collapse
SessionCreateResponse object { id, audio, expires\_at, 10 more }
A Realtime session configuration object.
id: optional string
Unique identifier for the session that looks like `sess\_1234567890abcdef`.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) id>)
audio: optional object { input, output }
Configuration for input and output audio for the session.
input: optional object { format, noise\_reduction, transcription, turn\_detection }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The PCM audio format. Only a 24kHz sample rate is supported.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) format>)
noise\_reduction: optional object { type }
Configuration for input audio noise reduction.
type: optional [NoiseReductionType](</api/reference/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction > (property) type>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction>)
transcription: optional [AudioTranscription](</api/reference/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration for input audio transcription.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) transcription>)
turn\_detection: optional object { prefix\_padding\_ms, silence\_duration\_ms, threshold, type }
Configuration for turn detection.
prefix\_padding\_ms: optional number
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (property) prefix_padding_ms>)
silence\_duration\_ms: optional number
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (property) silence_duration_ms>)
threshold: optional number
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (property) threshold>)
type: optional string
Type of turn detection, only `server\_vad` is currently supported.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (property) type>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input>)
output: optional object { format, speed, voice }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The PCM audio format. Only a 24kHz sample rate is supported.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) format>)
speed: optional number
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) speed>)
voice: optional string or "alloy" or "ash" or "ballad" or 7 more
One of the following:
string
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 0>)
"alloy" or "ash" or "ballad" or 7 more
One of the following:
"alloy"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 0>)
"ash"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 1>)
"ballad"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 2>)
"coral"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 3>)
"echo"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 4>)
"sage"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 5>)
"shimmer"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 6>)
"verse"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 7>)
"marin"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 8>)
"cedar"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) voice>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio>)
expires\_at: optional number
Expiration timestamp for the session, in seconds since epoch.
formatunixtime
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) expires_at>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
* `item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) include>)
instructions: optional string
The default system instructions (i.e. system message) prepended to model
calls. This field allows the client to guide the model on desired
responses. The model can be instructed on response content and format,
(e.g. “be extremely succinct”, “act friendly”, “here are examples of good
responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion
into your voice”, “laugh frequently”). The instructions are not guaranteed
to be followed by the model, but they provide guidance to the model on the
desired behavior.
Note that the server sets default instructions which will be used if this
field is not set and are visible in the `session.created` event at the
start of the session.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) instructions>)
max\_output\_tokens: optional number or "inf"
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
number
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) max_output_tokens > (variant) 0>)
"inf"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) max_output_tokens>)
model: optional string
The Realtime model used for this session.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) model>)
object: optional string
The object type. Always `realtime.session`.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) object>)
output\_modalities: optional array of "text" or "audio"
The set of modalities the model can respond with. To disable audio,
set this to [“text”].
One of the following:
"text"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) output_modalities > (items) > (member) 0>)
"audio"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) output_modalities>)
tool\_choice: optional string
How the model chooses tools. Options are `auto`, `none`, `required`, or
specify a function.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) tool_choice>)
tools: optional array of [RealtimeFunctionTool](</api/reference/resources/realtime#(resource) realtime > (model) realtime_function_tool > (schema)>) { description, name, parameters, type }
Tools (functions) available to the model.
description: optional string
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
name: optional string
The name of the function.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
parameters: optional unknown
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
type: optional "function"
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) tools>)
tracing: optional "auto" or object { group\_id, metadata, workflow\_name }
Configuration options for tracing. Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
One of the following:
"auto"
Default tracing mode for the session.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) tracing > (variant) 0>)
TracingConfiguration object { group\_id, metadata, workflow\_name }
Granular configuration for tracing.
group\_id: optional string
The group id to attach to this trace to enable filtering and
grouping in the traces dashboard.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) tracing > (variant) 1 > (property) group_id>)
metadata: optional unknown
The arbitrary metadata to attach to this trace to enable
filtering in the traces dashboard.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) tracing > (variant) 1 > (property) metadata>)
workflow\_name: optional string
The name of the workflow to attach to this trace. This is used to
name the trace in the traces dashboard.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) tracing > (variant) 1 > (property) workflow_name>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) tracing > (variant) 1>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) tracing>)
turn\_detection: optional object { prefix\_padding\_ms, silence\_duration\_ms, threshold, type }
Configuration for turn detection. Can be set to `null` to turn off. Server
VAD means that the model will detect the start and end of speech based on
audio volume and respond at the end of user speech.
prefix\_padding\_ms: optional number
Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) turn_detection > (property) prefix_padding_ms>)
silence\_duration\_ms: optional number
Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) turn_detection > (property) silence_duration_ms>)
threshold: optional number
Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) turn_detection > (property) threshold>)
type: optional string
Type of turn detection, only `server\_vad` is currently supported.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) turn_detection > (property) type>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) turn_detection>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema)>)
#### RealtimeTranscription Sessions
##### [Create transcription session](/api/reference/resources/realtime/subresources/transcription_sessions/methods/create)
Deprecated
POST/realtime/transcription\_sessions
##### ModelsExpand Collapse
TranscriptionSessionCreateResponse object { client\_secret, input\_audio\_format, input\_audio\_transcription, 2 more }
A new Realtime transcription session configuration.
When a session is created on the server via REST API, the session object
also contains an ephemeral key. Default TTL for keys is 10 minutes. This
property is not present when a session is updated via the WebSocket API.
client\_secret: object { expires\_at, value }
Ephemeral key returned by the API. Only present when the session is
created on the server via REST API.
expires\_at: number
Timestamp for when the token expires. Currently, all tokens expire
after one minute.
formatunixtime
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) client_secret > (property) expires_at>)
value: string
Ephemeral key usable in client environments to authenticate connections
to the Realtime API. Use this in client-side environments rather than
a standard API token, which should only be used server-side.
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) client_secret > (property) value>)
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) client_secret>)
input\_audio\_format: optional string
The format of input audio. Options are `pcm16`, `g711\_ulaw`, or `g711\_alaw`.
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) input_audio_format>)
input\_audio\_transcription: optional [AudioTranscription](</api/reference/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration of the transcription model.
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) input_audio_transcription>)
modalities: optional array of "text" or "audio"
The set of modalities the model can respond with. To disable audio,
set this to [“text”].
One of the following:
"text"
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) modalities > (items) > (member) 0>)
"audio"
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) modalities > (items) > (member) 1>)
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) modalities>)
turn\_detection: optional object { prefix\_padding\_ms, silence\_duration\_ms, threshold, type }
Configuration for turn detection. Can be set to `null` to turn off. Server
VAD means that the model will detect the start and end of speech based on
audio volume and respond at the end of user speech.
prefix\_padding\_ms: optional number
Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) turn_detection > (property) prefix_padding_ms>)
silence\_duration\_ms: optional number
Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) turn_detection > (property) silence_duration_ms>)
threshold: optional number
Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) turn_detection > (property) threshold>)
type: optional string
Type of turn detection, only `server\_vad` is currently supported.
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) turn_detection > (property) type>)
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) turn_detection>)
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema)>)