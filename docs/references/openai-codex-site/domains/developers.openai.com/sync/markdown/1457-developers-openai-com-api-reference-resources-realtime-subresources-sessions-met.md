Create session | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Realtime](/api/reference/resources/realtime)
[Sessions](/api/reference/resources/realtime/subresources/sessions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create session
Deprecated: Deprecated in favor of the realtime GA API, see https://platform.openai.com/docs/guides/realtime#beta-to-ga-migration
POST/realtime/sessions
Create an ephemeral API token for use in client-side applications with the
Realtime API. Can be configured with the same session parameters as the
`session.update` client event.
It responds with a session object, plus a `client\_secret` key which contains
a usable ephemeral API token that can be used to authenticate browser clients
for the Realtime API.
Returns the created Realtime session object, plus an ephemeral key.
##### Body ParametersJSONExpand Collapse
client\_secret: object { expires\_at, value }
Ephemeral key returned by the API.
expires\_at: number
Timestamp for when the token expires. Currently, all tokens expire
after one minute.
formatunixtime
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) client_secret > (schema) > (property) expires_at>)
value: string
Ephemeral key usable in client environments to authenticate connections
to the Realtime API. Use this in client-side environments rather than
a standard API token, which should only be used server-side.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) client_secret > (schema) > (property) value>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) client_secret > (schema)>)
input\_audio\_format: optional string
The format of input audio. Options are `pcm16`, `g711\_ulaw`, or `g711\_alaw`.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) input_audio_format > (schema)>)
input\_audio\_transcription: optional object { model }
Configuration for input audio transcription, defaults to off and can be
set to `null` to turn off once on. Input audio transcription is not native
to the model, since the model consumes audio directly. Transcription runs
asynchronously and should be treated as rough guidance
rather than the representation understood by the model.
model: optional string
The model to use for transcription.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) input_audio_transcription > (schema) > (property) model>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) input_audio_transcription > (schema)>)
instructions: optional string
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) instructions > (schema)>)
max\_response\_output\_tokens: optional number or "inf"
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
number
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) max_response_output_tokens > (schema) > (variant) 0>)
"inf"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) max_response_output_tokens > (schema) > (variant) 1>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) max_response_output_tokens > (schema)>)
modalities: optional array of "text" or "audio"
The set of modalities the model can respond with. To disable audio,
set this to [“text”].
One of the following:
"text"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) modalities > (schema) > (items) > (member) 0>)
"audio"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) modalities > (schema) > (items) > (member) 1>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) modalities > (schema)>)
output\_audio\_format: optional string
The format of output audio. Options are `pcm16`, `g711\_ulaw`, or `g711\_alaw`.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) output_audio_format > (schema)>)
prompt: optional [ResponsePrompt](</api/reference/resources/responses#(resource) responses > (model) response_prompt > (schema)>) { id, variables, version }
Reference to a prompt template and its variables.
[Learn more](/docs/guides/text?api-mode=responses#reusable-prompts).
id: string
The unique identifier of the prompt template to use.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_prompt > (schema) > (property) id>)
variables: optional map[string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or [ResponseInputImage](</api/reference/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } or [ResponseInputFile](</api/reference/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } ]
Optional map of values to substitute in for variables in your
prompt. The substitution values can either be strings, or other
Response input types like images or files.
One of the following:
string
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_prompt > (schema) > (property) variables > (items) > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage object { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision).
detail: "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: optional string
The content of the file to be sent to the model.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_prompt > (schema) > (property) variables>)
version: optional string
Optional version of the prompt template.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema) + (resource) responses > (model) response_prompt > (schema) > (property) version>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) prompt > (schema)>)
speed: optional number
The speed of the model’s spoken response. 1.0 is the default speed. 0.25 is
the minimum speed. 1.5 is the maximum speed. This value can only be changed
in between model turns, not while a response is in progress.
maximum1.5
minimum0.25
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) speed > (schema)>)
temperature: optional number
Sampling temperature for the model, limited to [0.6, 1.2]. Defaults to 0.8.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) temperature > (schema)>)
tool\_choice: optional string
How the model chooses tools. Options are `auto`, `none`, `required`, or
specify a function.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) tool_choice > (schema)>)
tools: optional array of object { description, name, parameters, type }
Tools (functions) available to the model.
description: optional string
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) tools > (schema) > (items) > (property) description>)
name: optional string
The name of the function.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) tools > (schema) > (items) > (property) name>)
parameters: optional unknown
Parameters of the function in JSON Schema.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) tools > (schema) > (items) > (property) parameters>)
type: optional "function"
The type of the tool, i.e. `function`.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) tools > (schema) > (items) > (property) type>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) tools > (schema)>)
tracing: optional "auto" or object { group\_id, metadata, workflow\_name }
Configuration options for tracing. Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
One of the following:
"auto"
Default tracing mode for the session.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) tracing > (schema) > (variant) 0>)
TracingConfiguration object { group\_id, metadata, workflow\_name }
Granular configuration for tracing.
group\_id: optional string
The group id to attach to this trace to enable filtering and
grouping in the traces dashboard.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) tracing > (schema) > (variant) 1 > (property) group_id>)
metadata: optional unknown
The arbitrary metadata to attach to this trace to enable
filtering in the traces dashboard.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) tracing > (schema) > (variant) 1 > (property) metadata>)
workflow\_name: optional string
The name of the workflow to attach to this trace. This is used to
name the trace in the traces dashboard.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) tracing > (schema) > (variant) 1 > (property) workflow_name>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) tracing > (schema) > (variant) 1>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) tracing > (schema)>)
truncation: optional [RealtimeTruncation](</api/reference/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
One of the following:
"auto" or "disabled"
The truncation strategy to use for the session. `auto` is the default truncation strategy. `disabled` will disable truncation and emit errors when the conversation exceeds the input token limit.
One of the following:
"auto"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) truncation > (schema) + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 0 > (member) 0>)
"disabled"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) truncation > (schema) + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 0 > (member) 1>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) truncation > (schema) + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 0>)
RetentionRatioTruncation object { retention\_ratio, type, token\_limits }
Retain a fraction of the conversation tokens when the conversation exceeds the input token limit. This allows you to amortize truncations across multiple turns, which can help improve cached token usage.
retention\_ratio: number
Fraction of post-instruction conversation tokens to retain (`0.0` - `1.0`) when the conversation exceeds the input token limit. Setting this to `0.8` means that messages will be dropped until 80% of the maximum allowed tokens are used. This helps reduce the frequency of truncations and improve cache rates.
minimum0
maximum1
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) truncation > (schema) + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 1 > (property) retention_ratio>)
type: "retention\_ratio"
Use retention ratio truncation.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) truncation > (schema) + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 1 > (property) type>)
token\_limits: optional object { post\_instructions }
Optional custom token limits for this truncation strategy. If not provided, the model’s default token limits will be used.
post\_instructions: optional number
Maximum tokens allowed in the conversation after instructions (which including tool definitions). For example, setting this to 5,000 would mean that truncation would occur when the conversation exceeds 5,000 tokens after instructions. This cannot be higher than the model’s context window size minus the maximum output tokens.
minimum0
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) truncation > (schema) + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 1 > (property) token_limits > (property) post_instructions>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) truncation > (schema) + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 1 > (property) token_limits>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) truncation > (schema) + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 1>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) truncation > (schema)>)
turn\_detection: optional object { prefix\_padding\_ms, silence\_duration\_ms, threshold, type }
Configuration for turn detection. Can be set to `null` to turn off. Server
VAD means that the model will detect the start and end of speech based on
audio volume and respond at the end of user speech.
prefix\_padding\_ms: optional number
Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) turn_detection > (schema) > (property) prefix_padding_ms>)
silence\_duration\_ms: optional number
Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) turn_detection > (schema) > (property) silence_duration_ms>)
threshold: optional number
Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) turn_detection > (schema) > (property) threshold>)
type: optional string
Type of turn detection, only `server\_vad` is currently supported.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) turn_detection > (schema) > (property) type>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) turn_detection > (schema)>)
voice: optional string or "alloy" or "ash" or "ballad" or 7 more or object { id }
The voice the model uses to respond. Supported built-in voices are
`alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`, `shimmer`, `verse`,
`marin`, and `cedar`. You may also provide a custom voice object with an
`id`, for example `{ "id": "voice\_1234" }`. Voice cannot be changed during
the session once the model has responded with audio at least once.
One of the following:
string
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) voice > (schema) > (variant) 0>)
"alloy" or "ash" or "ballad" or 7 more
One of the following:
"alloy"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 0>)
"ash"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 1>)
"ballad"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 2>)
"coral"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 3>)
"echo"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 4>)
"sage"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 5>)
"shimmer"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 6>)
"verse"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 7>)
"marin"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 8>)
"cedar"
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 9>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1>)
ID object { id }
Custom voice reference.
id: string
The custom voice ID, e.g. `voice\_1234`.
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) voice > (schema) > (variant) 2 > (property) id>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) voice > (schema) > (variant) 2>)
[](<#(resource) realtime.sessions > (method) create > (params) 0 > (param) voice > (schema)>)
##### ReturnsExpand Collapse
id: optional string
Unique identifier for the session that looks like `sess\_1234567890abcdef`.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) id>)
audio: optional object { input, output }
Configuration for input and output audio for the session.
input: optional object { format, noise\_reduction, transcription, turn\_detection }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The PCM audio format. Only a 24kHz sample rate is supported.
One of the following:
PCMAudioFormat object { rate, type }
The PCM audio format. Only a 24kHz sample rate is supported.
rate: optional 24000
The sample rate of the audio. Always `24000`.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) rate>)
type: optional "audio/pcm"
The audio format. Always `audio/pcm`.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) type>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0>)
PCMUAudioFormat object { type }
The G.711 μ-law format.
type: optional "audio/pcmu"
The audio format. Always `audio/pcmu`.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1 > (property) type>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1>)
PCMAAudioFormat object { type }
The G.711 A-law format.
type: optional "audio/pcma"
The audio format. Always `audio/pcma`.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2 > (property) type>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) format>)
noise\_reduction: optional object { type }
Configuration for input audio noise reduction.
type: optional [NoiseReductionType](</api/reference/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
One of the following:
"near\_field"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction > (property) type + (resource) realtime > (model) noise_reduction_type > (schema) > (member) 0>)
"far\_field"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction > (property) type + (resource) realtime > (model) noise_reduction_type > (schema) > (member) 1>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction > (property) type>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction>)
transcription: optional [AudioTranscription](</api/reference/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration for input audio transcription.
language: optional string
The language of the input audio. Supplying the input language in
[ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
will improve accuracy and latency.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) language>)
model: optional string or "whisper-1" or "gpt-4o-mini-transcribe" or "gpt-4o-mini-transcribe-2025-12-15" or 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
string
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 0>)
"whisper-1" or "gpt-4o-mini-transcribe" or "gpt-4o-mini-transcribe-2025-12-15" or 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
"whisper-1"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 0>)
"gpt-4o-mini-transcribe"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 1>)
"gpt-4o-mini-transcribe-2025-12-15"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 2>)
"gpt-4o-transcribe"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 3>)
"gpt-4o-transcribe-diarize"
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 4>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model>)
prompt: optional string
An optional text to guide the model’s style or continue a previous audio
segment.
For `whisper-1`, the [prompt is a list of keywords](/docs/guides/speech-to-text#prompting).
For `gpt-4o-transcribe` models (excluding `gpt-4o-transcribe-diarize`), the prompt is a free text string, for example “expect words related to technology”.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) prompt>)
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
One of the following:
PCMAudioFormat object { rate, type }
The PCM audio format. Only a 24kHz sample rate is supported.
rate: optional 24000
The sample rate of the audio. Always `24000`.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) rate>)
type: optional "audio/pcm"
The audio format. Always `audio/pcm`.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) type>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0>)
PCMUAudioFormat object { type }
The G.711 μ-law format.
type: optional "audio/pcmu"
The audio format. Always `audio/pcmu`.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1 > (property) type>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1>)
PCMAAudioFormat object { type }
The G.711 A-law format.
type: optional "audio/pcma"
The audio format. Always `audio/pcma`.
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2 > (property) type>)
[](<#(resource) realtime.sessions > (model) session_create_response > (schema) > (property) audio > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2>)
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
### Create session
HTTP
HTTP
HTTP
TypeScript
TypeScript
Python
Python
Java
Java
Go
Go
Ruby
Ruby
Terraform
Terraform
```
`curl -X POST https://api.openai.com/v1/realtime/sessions \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json" \\
-d '{
"model": "gpt-realtime",
"modalities": ["audio", "text"],
"instructions": "You are a friendly assistant."
}'
`
```
```
`{
"id": "sess\_001",
"object": "realtime.session",
"model": "gpt-realtime-2025-08-25",
"modalities": ["audio", "text"],
"instructions": "You are a friendly assistant.",
"voice": "alloy",
"input\_audio\_format": "pcm16",
"output\_audio\_format": "pcm16",
"input\_audio\_transcription": {
"model": "whisper-1"
},
"turn\_detection": null,
"tools": [],
"tool\_choice": "none",
"temperature": 0.7,
"max\_response\_output\_tokens": 200,
"speed": 1.1,
"tracing": "auto",
"client\_secret": {
"value": "ek\_abc123",
"expires\_at": 1234567890
}
}
`
```
##### Returns Examples
```
`{
"id": "sess\_001",
"object": "realtime.session",
"model": "gpt-realtime-2025-08-25",
"modalities": ["audio", "text"],
"instructions": "You are a friendly assistant.",
"voice": "alloy",
"input\_audio\_format": "pcm16",
"output\_audio\_format": "pcm16",
"input\_audio\_transcription": {
"model": "whisper-1"
},
"turn\_detection": null,
"tools": [],
"tool\_choice": "none",
"temperature": 0.7,
"max\_response\_output\_tokens": 200,
"speed": 1.1,
"tracing": "auto",
"client\_secret": {
"value": "ek\_abc123",
"expires\_at": 1234567890
}
}
`
```