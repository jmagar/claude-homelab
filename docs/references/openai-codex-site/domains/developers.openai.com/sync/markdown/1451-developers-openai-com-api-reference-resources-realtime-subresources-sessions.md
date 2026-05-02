Sessions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Realtime](/api/reference/resources/realtime)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Sessions
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