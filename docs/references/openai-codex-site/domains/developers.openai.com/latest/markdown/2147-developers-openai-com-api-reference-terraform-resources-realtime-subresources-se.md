Sessions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Realtime](/api/reference/terraform/resources/realtime)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Sessions
#### resource openai\_realtime\_session
##### required Expand Collapse
client\_secret: Attributes
Ephemeral key returned by the API.
expires\_at: Int64
Timestamp for when the token expires. Currently, all tokens expire
after one minute.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) client_secret > (attribute) expires_at>)
value: String
Ephemeral key usable in client environments to authenticate connections
to the Realtime API. Use this in client-side environments rather than
a standard API token, which should only be used server-side.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) client_secret > (attribute) value>)
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) client_secret>)
##### optional Expand Collapse
input\_audio\_format?: String
The format of input audio. Options are `pcm16`, `g711\_ulaw`, or `g711\_alaw`.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) input_audio_format>)
instructions?: String
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) instructions>)
output\_audio\_format?: String
The format of output audio. Options are `pcm16`, `g711\_ulaw`, or `g711\_alaw`.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) output_audio_format>)
temperature?: Float64
Sampling temperature for the model, limited to [0.6, 1.2]. Defaults to 0.8.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) temperature>)
tool\_choice?: String
How the model chooses tools. Options are `auto`, `none`, `required`, or
specify a function.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) tool_choice>)
tracing?: String
Configuration options for tracing. Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) tracing>)
truncation?: String
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) truncation>)
voice?: String
The voice the model uses to respond. Supported built-in voices are
`alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`, `shimmer`, `verse`,
`marin`, and `cedar`. You may also provide a custom voice object with an
`id`, for example `{ "id": "voice\_1234" }`. Voice cannot be changed during
the session once the model has responded with audio at least once.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) voice>)
modalities?: List[String]
The set of modalities the model can respond with. To disable audio,
set this to [“text”].
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) modalities>)
input\_audio\_transcription?: Attributes
Configuration for input audio transcription, defaults to off and can be
set to `null` to turn off once on. Input audio transcription is not native
to the model, since the model consumes audio directly. Transcription runs
asynchronously and should be treated as rough guidance
rather than the representation understood by the model.
model?: String
The model to use for transcription.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) input_audio_transcription > (attribute) model>)
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) input_audio_transcription>)
prompt?: Attributes
Reference to a prompt template and its variables.
[Learn more](https://platform.openai.com/docs/guides/text?api-mode=responses#reusable-prompts).
id: String
The unique identifier of the prompt template to use.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) prompt > (attribute) id>)
variables?: Map[String]
Optional map of values to substitute in for variables in your
prompt. The substitution values can either be strings, or other
Response input types like images or files.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) prompt > (attribute) variables>)
version?: String
Optional version of the prompt template.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) prompt > (attribute) version>)
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) prompt>)
tools?: List[Attributes]
Tools (functions) available to the model.
description?: String
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) tools > (attribute) description>)
name?: String
The name of the function.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) tools > (attribute) name>)
parameters?: JSON
Parameters of the function in JSON Schema.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) tools > (attribute) parameters>)
type?: String
The type of the tool, i.e. `function`.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) tools > (attribute) type>)
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) tools>)
turn\_detection?: Attributes
Configuration for turn detection. Can be set to `null` to turn off. Server
VAD means that the model will detect the start and end of speech based on
audio volume and respond at the end of user speech.
prefix\_padding\_ms?: Int64
Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) turn_detection > (attribute) prefix_padding_ms>)
silence\_duration\_ms?: Int64
Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) turn_detection > (attribute) silence_duration_ms>)
threshold?: Float64
Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) turn_detection > (attribute) threshold>)
type?: String
Type of turn detection, only `server\_vad` is currently supported.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) turn_detection > (attribute) type>)
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) turn_detection>)
max\_response\_output\_tokens?: Dynamic Int64 | String
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) max_response_output_tokens>)
speed?: Float64
The speed of the model’s spoken response. 1.0 is the default speed. 0.25 is
the minimum speed. 1.5 is the maximum speed. This value can only be changed
in between model turns, not while a response is in progress.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) speed>)
##### computed Expand Collapse
id: String
Unique identifier for the session that looks like `sess\_1234567890abcdef`.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) id>)
expires\_at: Int64
Expiration timestamp for the session, in seconds since epoch.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) expires_at>)
model: String
The Realtime model used for this session.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) model>)
object: String
The object type. Always `realtime.session`.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) object>)
include: List[String]
Additional fields to include in server outputs.
* `item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) include>)
output\_modalities: List[String]
The set of modalities the model can respond with. To disable audio,
set this to [“text”].
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) output_modalities>)
audio: Attributes
Configuration for input and output audio for the session.
input: Attributes
format: Attributes
The PCM audio format. Only a 24kHz sample rate is supported.
rate: Int64
The sample rate of the audio. Always `24000`.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) input > (attribute) format > (attribute) rate>)
type: String
The audio format. Always `audio/pcm`.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) input > (attribute) format > (attribute) type>)
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) input > (attribute) format>)
noise\_reduction: Attributes
Configuration for input audio noise reduction.
type: String
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) input > (attribute) noise_reduction > (attribute) type>)
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) input > (attribute) noise_reduction>)
transcription: Attributes
Configuration for input audio transcription.
language: String
The language of the input audio. Supplying the input language in
[ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
will improve accuracy and latency.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) input > (attribute) transcription > (attribute) language>)
model: String
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) input > (attribute) transcription > (attribute) model>)
prompt: String
An optional text to guide the model’s style or continue a previous audio
segment.
For `whisper-1`, the [prompt is a list of keywords](https://platform.openai.com/docs/guides/speech-to-text#prompting).
For `gpt-4o-transcribe` models (excluding `gpt-4o-transcribe-diarize`), the prompt is a free text string, for example “expect words related to technology”.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) input > (attribute) transcription > (attribute) prompt>)
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) input > (attribute) transcription>)
turn\_detection: Attributes
Configuration for turn detection.
prefix\_padding\_ms: Int64
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) input > (attribute) turn_detection > (attribute) prefix_padding_ms>)
silence\_duration\_ms: Int64
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) input > (attribute) turn_detection > (attribute) silence_duration_ms>)
threshold: Float64
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) input > (attribute) turn_detection > (attribute) threshold>)
type: String
Type of turn detection, only `server\_vad` is currently supported.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) input > (attribute) turn_detection > (attribute) type>)
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) input > (attribute) turn_detection>)
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) input>)
output: Attributes
format: Attributes
The PCM audio format. Only a 24kHz sample rate is supported.
rate: Int64
The sample rate of the audio. Always `24000`.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) output > (attribute) format > (attribute) rate>)
type: String
The audio format. Always `audio/pcm`.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) output > (attribute) format > (attribute) type>)
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) output > (attribute) format>)
speed: Float64
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) output > (attribute) speed>)
voice: String
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) output > (attribute) voice>)
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio > (attribute) output>)
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) audio>)
max\_output\_tokens: Dynamic Int64 | String
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
[](<#(resource) realtime.sessions > (terraform resource) > (attribute) max_output_tokens>)