Realtime client events | OpenAI API Reference
[Skip to content](#_top)
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
input: optional [RealtimeAudioConfigInput](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_config_input > (schema)>) { format, noise\_reduction, transcription, turn\_detection }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The format of the input audio.
One of the following:
PCMAudioFormat object { rate, type }
The PCM audio format. Only a 24kHz sample rate is supported.
rate: optional 24000
The sample rate of the audio. Always `24000`.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) rate>)
type: optional "audio/pcm"
The audio format. Always `audio/pcm`.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0>)
PCMUAudioFormat object { type }
The G.711 μ-law format.
type: optional "audio/pcmu"
The audio format. Always `audio/pcmu`.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1>)
PCMAAudioFormat object { type }
The G.711 A-law format.
type: optional "audio/pcma"
The audio format. Always `audio/pcma`.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) input + (resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format>)
noise\_reduction: optional object { type }
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
type: optional [NoiseReductionType](</api/reference/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
One of the following:
"near\_field"
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) noise_reduction > (property) type + (resource) realtime > (model) noise_reduction_type > (schema) > (member) 0>)
"far\_field"
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) noise_reduction > (property) type + (resource) realtime > (model) noise_reduction_type > (schema) > (member) 1>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) input + (resource) realtime > (model) realtime_audio_config_input > (schema) > (property) noise_reduction > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) input + (resource) realtime > (model) realtime_audio_config_input > (schema) > (property) noise_reduction>)
transcription: optional [AudioTranscription](</api/reference/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration for input audio transcription, defaults to off and can be set to `null` to turn off once on. Input audio transcription is not native to the model, since the model consumes audio directly. Transcription runs asynchronously through [the /audio/transcriptions endpoint](/docs/api-reference/audio/createTranscription) and should be treated as guidance of input audio content rather than precisely what the model heard. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
language: optional string
The language of the input audio. Supplying the input language in
[ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
will improve accuracy and latency.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) language>)
model: optional string or "whisper-1" or "gpt-4o-mini-transcribe" or "gpt-4o-mini-transcribe-2025-12-15" or 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
string
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 0>)
"whisper-1" or "gpt-4o-mini-transcribe" or "gpt-4o-mini-transcribe-2025-12-15" or 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
"whisper-1"
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 0>)
"gpt-4o-mini-transcribe"
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 1>)
"gpt-4o-mini-transcribe-2025-12-15"
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 2>)
"gpt-4o-transcribe"
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 3>)
"gpt-4o-transcribe-diarize"
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 4>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model>)
prompt: optional string
An optional text to guide the model's style or continue a previous audio
segment.
For `whisper-1`, the [prompt is a list of keywords](/docs/guides/speech-to-text#prompting).
For `gpt-4o-transcribe` models (excluding `gpt-4o-transcribe-diarize`), the prompt is a free text string, for example "expect words related to technology".
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) prompt>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) input + (resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription>)
turn\_detection: optional [RealtimeAudioInputTurnDetection](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema)>)
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with "uhhm", the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
One of the following:
ServerVad object { type, create\_response, idle\_timeout\_ms, 4 more }
Server-side voice activity detection (VAD) which flips on when user speech is detected and off after a period of silence.
type: "server\_vad"
Type of turn detection, `server\_vad` to turn on simple Server VAD.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) type>)
create\_response: optional boolean
Whether or not to automatically generate a response when a VAD stop event occurs. If `interrupt\_response` is set to `false` this may fail to create a response if the model is already responding.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) create_response>)
idle\_timeout\_ms: optional number
Optional timeout after which a model response will be triggered automatically. This is
useful for situations in which a long pause from the user is unexpected, such as a phone
call. The model will effectively prompt the user to continue the conversation based
on the current context.
The timeout value will be applied after the last model response's audio has finished playing,
i.e. it's set to the `response.done` time plus audio playback duration.
An `input\_audio\_buffer.timeout\_triggered` event (plus events
associated with the Response) will be emitted when the timeout is reached.
Idle timeout is currently only supported for `server\_vad` mode.
minimum5000
maximum30000
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) idle_timeout_ms>)
interrupt\_response: optional boolean
Whether or not to automatically interrupt (cancel) any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs. If `true` then the response will be cancelled, otherwise it will continue until complete.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) interrupt_response>)
prefix\_padding\_ms: optional number
Used only for `server\_vad` mode. Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) prefix_padding_ms>)
silence\_duration\_ms: optional number
Used only for `server\_vad` mode. Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) silence_duration_ms>)
threshold: optional number
Used only for `server\_vad` mode. Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) threshold>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0>)
SemanticVad object { type, create\_response, eagerness, interrupt\_response }
Server-side semantic turn detection which uses a model to determine when the user has finished speaking.
type: "semantic\_vad"
Type of turn detection, `semantic\_vad` to turn on Semantic VAD.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) type>)
create\_response: optional boolean
Whether or not to automatically generate a response when a VAD stop event occurs.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) create_response>)
eagerness: optional "low" or "medium" or "high" or "auto"
Used only for `semantic\_vad` mode. The eagerness of the model to respond. `low` will wait longer for the user to continue speaking, `high` will respond more quickly. `auto` is the default and is equivalent to `medium`. `low`, `medium`, and `high` have max timeouts of 8s, 4s, and 2s respectively.
One of the following:
"low"
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 0>)
"medium"
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 1>)
"high"
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 2>)
"auto"
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 3>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness>)
interrupt\_response: optional boolean
Whether or not to automatically interrupt any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) interrupt_response>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) input + (resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio + (resource) realtime > (model) realtime_audio_config > (schema) > (property) input>)
output: optional [RealtimeAudioConfigOutput](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_config_output > (schema)>) { format, speed, voice }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The format of the output audio.
One of the following:
PCMAudioFormat object { rate, type }
The PCM audio format. Only a 24kHz sample rate is supported.
rate: optional 24000
The sample rate of the audio. Always `24000`.
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) rate>)
type: optional "audio/pcm"
The audio format. Always `audio/pcm`.
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0>)
PCMUAudioFormat object { type }
The G.711 μ-law format.
type: optional "audio/pcmu"
The audio format. Always `audio/pcmu`.
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1>)
PCMAAudioFormat object { type }
The G.711 A-law format.
type: optional "audio/pcma"
The audio format. Always `audio/pcma`.
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format>)
speed: optional number
The speed of the model's spoken response as a multiple of the original speed.
1.0 is the default speed. 0.25 is the minimum speed. 1.5 is the maximum speed. This value can only be changed in between model turns, not while a response is in progress.
This parameter is a post-processing adjustment to the audio after it is generated, it's
also possible to prompt the model to speak faster or slower.
maximum1.5
minimum0.25
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) speed>)
voice: optional string or "alloy" or "ash" or "ballad" or 7 more or object { id }
The voice the model uses to respond. Supported built-in voices are
`alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`, `shimmer`, `verse`,
`marin`, and `cedar`. You may also provide a custom voice object with
an `id`, for example `{ "id": "voice\_1234" }`. Voice cannot be changed
during the session once the model has responded with audio at least once.
We recommend `marin` and `cedar` for best quality.
One of the following:
string
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 0>)
"alloy" or "ash" or "ballad" or 7 more
One of the following:
"alloy"
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 0>)
"ash"
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 1>)
"ballad"
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 2>)
"coral"
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 3>)
"echo"
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 4>)
"sage"
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 5>)
"shimmer"
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 6>)
"verse"
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 7>)
"marin"
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 8>)
"cedar"
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1>)
ID object { id }
Custom voice reference.
id: string
The custom voice ID, e.g. `voice\_1234`.
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 2 > (property) id>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 2>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio + (resource) realtime > (model) realtime_audio_config > (schema) > (property) output>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio>)
include: optional array of "item.input\_audio\_transcription.logprobs"
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) include>)
instructions: optional string
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. "be extremely succinct", "act friendly", "here are examples of good responses") and on audio behavior (e.g. "talk quickly", "inject emotion into your voice", "laugh frequently"). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
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
id: string
The unique identifier of the prompt template to use.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) id>)
variables: optional map[string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or [ResponseInputImage](</api/reference/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } or [ResponseInputFile](</api/reference/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } ]
Optional map of values to substitute in for variables in your
prompt. The substitution values can either be strings, or other
Response input types like images or files.
One of the following:
string
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) variables > (items) > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage object { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision).
detail: "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: optional string
The content of the file to be sent to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) variables>)
version: optional string
Optional version of the prompt template.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) version>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt>)
tool\_choice: optional [RealtimeToolChoiceConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)
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
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_options > (schema) > (member) 0>)
"auto"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_options > (schema) > (member) 1>)
"required"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_options > (schema) > (member) 2>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_options > (schema)>)
ToolChoiceFunction object { name, type }
Use this option to force the model to call a specific function.
name: string
The name of the function to call.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_function > (schema) > (property) name>)
type: "function"
For function calling, the type is always `function`.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_function > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_function > (schema)>)
ToolChoiceMcp object { server\_label, type, name }
Use this option to force the model to call a specific tool on a remote MCP server.
server\_label: string
The label of the MCP server to use.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_mcp > (schema) > (property) server_label>)
type: "mcp"
For MCP tools, the type is always `mcp`.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_mcp > (schema) > (property) type>)
name: optional string
The name of the tool to call on the server.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_mcp > (schema) > (property) name>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_mcp > (schema)>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice>)
tools: optional [RealtimeToolsConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tools_config > (schema)>) { , McpTool }
Tools available to the model.
One of the following:
RealtimeFunctionTool object { description, name, parameters, type }
description: optional string
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
name: optional string
The name of the function.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
parameters: optional unknown
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
type: optional "function"
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_function_tool > (schema)>)
McpTool object { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) type>)
allowed\_tools: optional array of string or object { read\_only, tool\_names }
List of allowed tool names or a filter object.
One of the following:
McpAllowedTools = array of string
A string array of allowed tool names
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 0>)
McpToolFilter object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools>)
authorization: optional string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) authorization>)
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
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 7>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id>)
defer\_loading: optional boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) defer_loading>)
headers: optional map[string]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) headers>)
require\_approval: optional object { always, never } or "always" or "never"
Specify which of the MCP server's tools require approval.
One of the following:
McpToolApprovalFilter object { always, never }
Specify which of the MCP server's tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always>)
never: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0>)
McpToolApprovalSetting = "always" or "never"
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
"always"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval>)
server\_description: optional string
Optional description of the MCP server, used to provide more context.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_description>)
server\_url: optional string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_url>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools>)
tracing: optional [RealtimeTracingConfig](</api/reference/resources/realtime#(resource) realtime > (model) realtime_tracing_config > (schema)>)
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
One of the following:
Auto = "auto"
Enables tracing and sets default values for tracing configuration options. Always `auto`.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing + (resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 0>)
TracingConfiguration object { group\_id, metadata, workflow\_name }
Granular configuration for tracing.
group\_id: optional string
The group id to attach to this trace to enable filtering and
grouping in the Traces Dashboard.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing + (resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 1 > (property) group_id>)
metadata: optional unknown
The arbitrary metadata to attach to this trace to enable
filtering in the Traces Dashboard.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing + (resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 1 > (property) metadata>)
workflow\_name: optional string
The name of the workflow to attach to this trace. This is used to
name the trace in the Traces Dashboard.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing + (resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 1 > (property) workflow_name>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing + (resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing>)
truncation: optional [RealtimeTruncation](</api/reference/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)
When the number of tokens in a conversation exceeds the model's input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model's context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model's input token limit.
One of the following:
"auto" or "disabled"
The truncation strategy to use for the session. `auto` is the default truncation strategy. `disabled` will disable truncation and emit errors when the conversation exceeds the input token limit.
One of the following:
"auto"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 0 > (member) 0>)
"disabled"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 0 > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 0>)
RetentionRatioTruncation object { retention\_ratio, type, token\_limits }
Retain a fraction of the conversation tokens when the conversation exceeds the input token limit. This allows you to amortize truncations across multiple turns, which can help improve cached token usage.
retention\_ratio: number
Fraction of post-instruction conversation tokens to retain (`0.0` - `1.0`) when the conversation exceeds the input token limit. Setting this to `0.8` means that messages will be dropped until 80% of the maximum allowed tokens are used. This helps reduce the frequency of truncations and improve cache rates.
minimum0
maximum1
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 1 > (property) retention_ratio>)
type: "retention\_ratio"
Use retention ratio truncation.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 1 > (property) type>)
token\_limits: optional object { post\_instructions }
Optional custom token limits for this truncation strategy. If not provided, the model's default token limits will be used.
post\_instructions: optional number
Maximum tokens allowed in the conversation after instructions (which including tool definitions). For example, setting this to 5,000 would mean that truncation would occur when the conversation exceeds 5,000 tokens after instructions. This cannot be higher than the model's context window size minus the maximum output tokens.
minimum0
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 1 > (property) token_limits > (property) post_instructions>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 1 > (property) token_limits>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema)>)
RealtimeTranscriptionSessionCreateRequest object { type, audio, include }
Realtime transcription session object configuration.
type: "transcription"
The type of session to create. Always `transcription` for transcription sessions.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) type>)
audio: optional [RealtimeTranscriptionSessionAudio](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>) { input }
Configuration for input and output audio.
input: optional [RealtimeTranscriptionSessionAudioInput](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema)>) { format, noise\_reduction, transcription, turn\_detection }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The PCM audio format. Only a 24kHz sample rate is supported.
One of the following:
PCMAudioFormat object { rate, type }
The PCM audio format. Only a 24kHz sample rate is supported.
rate: optional 24000
The sample rate of the audio. Always `24000`.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) rate>)
type: optional "audio/pcm"
The audio format. Always `audio/pcm`.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) type>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0>)
PCMUAudioFormat object { type }
The G.711 μ-law format.
type: optional "audio/pcmu"
The audio format. Always `audio/pcmu`.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1 > (property) type>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1>)
PCMAAudioFormat object { type }
The G.711 A-law format.
type: optional "audio/pcma"
The audio format. Always `audio/pcma`.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2 > (property) type>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio > (schema) > (property) input + (resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format>)
noise\_reduction: optional object { type }
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
type: optional [NoiseReductionType](</api/reference/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
One of the following:
"near\_field"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) noise_reduction > (property) type + (resource) realtime > (model) noise_reduction_type > (schema) > (member) 0>)
"far\_field"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) noise_reduction > (property) type + (resource) realtime > (model) noise_reduction_type > (schema) > (member) 1>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio > (schema) > (property) input + (resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) noise_reduction > (property) type>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio > (schema) > (property) input + (resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) noise_reduction>)
transcription: optional [AudioTranscription](</api/reference/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration for input audio transcription, defaults to off and can be set to `null` to turn off once on. Input audio transcription is not native to the model, since the model consumes audio directly. Transcription runs asynchronously through [the /audio/transcriptions endpoint](/docs/api-reference/audio/createTranscription) and should be treated as guidance of input audio content rather than precisely what the model heard. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
language: optional string
The language of the input audio. Supplying the input language in
[ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
will improve accuracy and latency.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) language>)
model: optional string or "whisper-1" or "gpt-4o-mini-transcribe" or "gpt-4o-mini-transcribe-2025-12-15" or 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
string
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 0>)
"whisper-1" or "gpt-4o-mini-transcribe" or "gpt-4o-mini-transcribe-2025-12-15" or 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
"whisper-1"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 0>)
"gpt-4o-mini-transcribe"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 1>)
"gpt-4o-mini-transcribe-2025-12-15"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 2>)
"gpt-4o-transcribe"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 3>)
"gpt-4o-transcribe-diarize"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 4>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model>)
prompt: optional string
An optional text to guide the model's style or continue a previous audio
segment.
For `whisper-1`, the [prompt is a list of keywords](/docs/guides/speech-to-text#prompting).
For `gpt-4o-transcribe` models (excluding `gpt-4o-transcribe-diarize`), the prompt is a free text string, for example "expect words related to technology".
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) prompt>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio > (schema) > (property) input + (resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription>)
turn\_detection: optional [RealtimeTranscriptionSessionAudioInputTurnDetection](</api/reference/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema)>)
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with "uhhm", the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
One of the following:
ServerVad object { type, create\_response, idle\_timeout\_ms, 4 more }
Server-side voice activity detection (VAD) which flips on when user speech is detected and off after a period of silence.
type: "server\_vad"
Type of turn detection, `server\_vad` to turn on simple Server VAD.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) type>)
create\_response: optional boolean
Whether or not to automatically generate a response when a VAD stop event occurs. If `interrupt\_response` is set to `false` this may fail to create a response if the model is already responding.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) create_response>)
idle\_timeout\_ms: optional number
Optional timeout after which a model response will be triggered automatically. This is
useful for situations in which a long pause from the user is unexpected, such as a phone
call. The model will effectively prompt the user to continue the conversation based
on the current context.
The timeout value will be applied after the last model response's audio has finished playing,
i.e. it's set to the `response.done` time plus audio playback duration.
An `input\_audio\_buffer.timeout\_triggered` event (plus events
associated with the Response) will be emitted when the timeout is reached.
Idle timeout is currently only supported for `server\_vad` mode.
minimum5000
maximum30000
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) idle_timeout_ms>)
interrupt\_response: optional boolean
Whether or not to automatically interrupt (cancel) any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs. If `true` then the response will be cancelled, otherwise it will continue until complete.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) interrupt_response>)
prefix\_padding\_ms: optional number
Used only for `server\_vad` mode. Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) prefix_padding_ms>)
silence\_duration\_ms: optional number
Used only for `server\_vad` mode. Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) silence_duration_ms>)
threshold: optional number
Used only for `server\_vad` mode. Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) threshold>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0>)
SemanticVad object { type, create\_response, eagerness, interrupt\_response }
Server-side semantic turn detection which uses a model to determine when the user has finished speaking.
type: "semantic\_vad"
Type of turn detection, `semantic\_vad` to turn on Semantic VAD.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) type>)
create\_response: optional boolean
Whether or not to automatically generate a response when a VAD stop event occurs.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) create_response>)
eagerness: optional "low" or "medium" or "high" or "auto"
Used only for `semantic\_vad` mode. The eagerness of the model to respond. `low` will wait longer for the user to continue speaking, `high` will respond more quickly. `auto` is the default and is equivalent to `medium`. `low`, `medium`, and `high` have max timeouts of 8s, 4s, and 2s respectively.
One of the following:
"low"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 0>)
"medium"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 1>)
"high"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 2>)
"auto"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 3>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness>)
interrupt\_response: optional boolean
Whether or not to automatically interrupt any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) interrupt_response>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio > (schema) > (property) input + (resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio + (resource) realtime > (model) realtime_transcription_session_audio > (schema) > (property) input>)
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
OBJECT### session.update
```
`{
"type": "session.update",
"session": {
"type": "realtime",
"instructions": "You are a creative assistant that helps with design tasks.",
"tools": [
{
"type": "function",
"name": "display\_color\_palette",
"description": "Call this function when a user asks for a color palette.",
"parameters": {
"type": "object",
"properties": {
"theme": {
"type": "string",
"description": "Description of the theme for the color scheme."
},
"colors": {
"type": "array",
"description": "Array of five hex color codes based on the theme.",
"items": {
"type": "string",
"description": "Hex color code"
}
}
},
"required": [
"theme",
"colors"
]
}
}
],
"tool\_choice": "auto"
}
}`
```
Send this event to append audio bytes to the input audio buffer. The audio
buffer is temporary storage you can write to and later commit. A "commit" will create a new
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
OBJECT### input\_audio\_buffer.append
```
`{
"event\_id": "event\_456",
"type": "input\_audio\_buffer.append",
"audio": "Base64EncodedAudioData"
}`
```
Send this event to commit the user input audio buffer, which will create a new user message item in the conversation. This event will produce an error if the input audio buffer is empty. When in Server VAD mode, the client does not need to send this event, the server will commit the audio buffer automatically.
Committing the input audio buffer will trigger input audio transcription (if enabled in session configuration), but it will not create a response from the model. The server will respond with an `input\_audio\_buffer.committed` event.
type: "input\_audio\_buffer.commit"
The event type, must be `input\_audio\_buffer.commit`.
[](<#(resource) realtime > (model) input_audio_buffer_commit_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) input_audio_buffer_commit_event > (schema) > (property) event_id>)
OBJECT### input\_audio\_buffer.commit
```
`{
"event\_id": "event\_789",
"type": "input\_audio\_buffer.commit"
}`
```
Send this event to clear the audio bytes in the buffer. The server will
respond with an `input\_audio\_buffer.cleared` event.
type: "input\_audio\_buffer.clear"
The event type, must be `input\_audio\_buffer.clear`.
[](<#(resource) realtime > (model) input_audio_buffer_clear_event > (schema) > (property) type>)
event\_id: optional string
Optional client-generated ID used to identify this event.
maxLength512
[](<#(resource) realtime > (model) input_audio_buffer_clear_event > (schema) > (property) event_id>)
OBJECT### input\_audio\_buffer.clear
```
`{
"event\_id": "event\_012",
"type": "input\_audio\_buffer.clear"
}`
```
Add a new Item to the Conversation's context, including messages, function
calls, and function call responses. This event can be used both to populate a
"history" of the conversation and to add new items mid-stream, but has the
current limitation that it cannot populate assistant audio messages.
If successful, the server will respond with a `conversation.item.created`
event, otherwise an `error` event will be sent.
item: [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
A single item within a Realtime conversation.
One of the following:
RealtimeConversationItemSystemMessage object { content, role, type, 3 more }
A system message in a Realtime conversation can be used to provide additional context or instructions to the model. This is similar but distinct from the instruction prompt provided at the start of a conversation, as system messages can be added at any point in the conversation. For major changes to the conversation's behavior, use instructions, but for smaller updates (e.g. "the user is now asking about a different topic"), use system messages.
content: array of object { text, type }
The content of the message.
text: optional string
The text content.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) text>)
type: optional "input\_text"
The content type. Always `input\_text` for system messages.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content>)
role: "system"
The role of the message sender. Always `system`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_system_message > (schema)>)
RealtimeConversationItemUserMessage object { content, role, type, 3 more }
A user message item in a Realtime conversation.
content: array of object { audio, detail, image\_url, 3 more }
The content of the message.
audio: optional string
Base64-encoded audio bytes (for `input\_audio`), these will be parsed as the format specified in the session input audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) audio>)
detail: optional "auto" or "low" or "high"
The detail level of the image (for `input\_image`). `auto` will default to `high`.
One of the following:
"auto"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 0>)
"low"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 1>)
"high"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 2>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail>)
image\_url: optional string
Base64-encoded image bytes (for `input\_image`) as a data URI. For example `data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...`. Supported formats are PNG and JPEG.
formaturi
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) image_url>)
text: optional string
The text content (for `input\_text`).
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) text>)
transcript: optional string
Transcript of the audio (for `input\_audio`). This is not sent to the model, but will be attached to the message item for reference.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) transcript>)
type: optional "input\_text" or "input\_audio" or "input\_image"
The content type (`input\_text`, `input\_audio`, or `input\_image`).
One of the following:
"input\_text"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
"input\_audio"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
"input\_image"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 2>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content>)
role: "user"
The role of the message sender. Always `user`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_user_message > (schema)>)
RealtimeConversationItemAssistantMessage object { content, role, type, 3 more }
An assistant message item in a Realtime conversation.
content: array of object { audio, text, transcript, type }
The content of the message.
audio: optional string
Base64-encoded audio bytes, these will be parsed as the format specified in the session output audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) audio>)
text: optional string
The text content.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) text>)
transcript: optional string
The transcript of the audio content, this will always be present if the output type is `audio`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) transcript>)
type: optional "output\_text" or "output\_audio"
The content type, `output\_text` or `output\_audio` depending on the session `output\_modalities` configuration.
One of the following:
"output\_text"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
"output\_audio"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content>)
role: "assistant"
The role of the message sender. Always `assistant`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema)>)
RealtimeConversationItemFunctionCall object { arguments, name, type, 4 more }
A function call item in a Realtime conversation.
arguments: string
The arguments of the function call. This is a JSON-encoded string representing the arguments passed to the function, for example `{"arg1": "value1", "arg2": 42}`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) arguments>)
name: string
The name of the function being called.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) name>)
type: "function\_call"
The type of the item. Always `function\_call`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) id>)
call\_id: optional string
The ID of the function call.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) call_id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call > (schema)>)
RealtimeConversationItemFunctionCallOutput object { call\_id, output, type, 3 more }
A function call output item in a Realtime conversation.
call\_id: string
The ID of the function call this output is for.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) call_id>)
output: string
The output of the function call, this is free text and can contain any information or simply be empty.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) output>)
type: "function\_call\_output"
The type of the item. Always `function\_call\_output`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema)>)
RealtimeMcpApprovalResponse object { id, approval\_request\_id, approve, 2 more }
A Realtime item responding to an MCP approval request.
id: string
The unique ID of the approval response.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) id>)
approval\_request\_id: string
The ID of the approval request being answered.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approval_request_id>)
approve: boolean
Whether the request was approved.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approve>)
type: "mcp\_approval\_response"
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) type>)
reason: optional string
Optional reason for the decision.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) reason>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_approval_response > (schema)>)
RealtimeMcpListTools object { server\_label, tools, type, id }
A Realtime item listing tools available on an MCP server.
server\_label: string
The label of the MCP server.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) server_label>)
tools: array of object { input\_schema, name, annotations, description }
The tools available on the server.
input\_schema: unknown
The JSON schema describing the tool's input.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) input_schema>)
name: string
The name of the tool.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) name>)
annotations: optional unknown
Additional annotations about the tool.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) annotations>)
description: optional string
The description of the tool.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) description>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools>)
type: "mcp\_list\_tools"
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) type>)
id: optional string
The unique ID of the list.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) id>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_list_tools > (schema)>)
RealtimeMcpToolCall object { id, arguments, name, 5 more }
A Realtime item representing an invocation of a tool on an MCP server.
id: string
The unique ID of the tool call.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) id>)
arguments: string
A JSON string of the arguments passed to the tool.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) arguments>)
name: string
The name of the tool that was run.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) name>)
server\_label: string
The label of the MCP server running the tool.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) server_label>)
type: "mcp\_call"
The type of the item. Always `mcp\_call`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) type>)
approval\_request\_id: optional string
The ID of an associated approval request, if any.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) approval_request_id>)
error: optional [RealtimeMcpProtocolError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcp_protocol_error > (schema)>) { code, message, type } or [RealtimeMcpToolExecutionError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>) { message, type } or [RealtimeMcphttpError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcphttp_error > (schema)>) { code, message, type }
The error from the tool call, if any.
One of the following:
RealtimeMcpProtocolError object { code, message, type }
code: number
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) code>)
message: string
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) message>)
type: "protocol\_error"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_protocol_error > (schema)>)
RealtimeMcpToolExecutionError object { message, type }
message: string
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) message>)
type: "tool\_execution\_error"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>)
RealtimeMcphttpError object { code, message, type }
code: number
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) code>)
message: string
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) message>)
type: "http\_error"
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcphttp_error > (schema)>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) error>)
output: optional string
The output from the tool call.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) output>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_tool_call > (schema)>)
RealtimeMcpApprovalRequest object { id, arguments, name, 2 more }
A Realtime item requesting human approval of a tool invocation.
id: string
The unique ID of the approval request.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) id>)
arguments: string
A JSON string of arguments for the tool.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) arguments>)
name: string
The name of the tool to run.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) name>)
server\_label: string
The label of the MCP server making the request.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) server_label>)
type: "mcp\_approval\_request"
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) type>)
[](<#(resource) realtime > (model) conversation_item_create_event > (schema) > (property) item + (resource) realtime > (model) realtime_mcp_approval_request > (schema)>)
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
OBJECT### conversation.item.create
```
`{
"type": "conversation.item.create",
"item": {
"type": "message",
"role": "user",
"content": [
{
"type": "input\_text",
"text": "hi"
}
]
}
}`
```
Send this event when you want to retrieve the server's representation of a specific item in the conversation history. This is useful, for example, to inspect user audio after noise cancellation and VAD.
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
OBJECT### conversation.item.retrieve
```
`{
"event\_id": "event\_901",
"type": "conversation.item.retrieve",
"item\_id": "item\_003"
}`
```
Send this event to truncate a previous assistant message’s audio. The server
will produce audio faster than realtime, so this event is useful when the user
interrupts to truncate audio that has already been sent to the client but not
yet played. This will synchronize the server's understanding of the audio with
the client's playback.
Truncating audio will delete the server-side text transcript to ensure there
is not text in the context that hasn't been heard by the user.
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
OBJECT### conversation.item.truncate
```
`{
"event\_id": "event\_678",
"type": "conversation.item.truncate",
"item\_id": "item\_002",
"content\_index": 0,
"audio\_end\_ms": 1500
}`
```
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
OBJECT### conversation.item.delete
```
`{
"event\_id": "event\_901",
"type": "conversation.item.delete",
"item\_id": "item\_003"
}`
```
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
`instructions` and `tools`. If these are set, they will override the Session's
configuration for this Response only.
Responses can be created out-of-band of the default Conversation, meaning that they can
have arbitrary input, and it's possible to disable writing the output to the Conversation.
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
audio: optional [RealtimeResponseCreateAudioOutput](</api/reference/resources/realtime#(resource) realtime > (model) realtime_response_create_audio_output > (schema)>) { output }
Configuration for audio input and output.
output: optional object { format, voice }
format: optional [RealtimeAudioFormats](</api/reference/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The format of the output audio.
One of the following:
PCMAudioFormat object { rate, type }
The PCM audio format. Only a 24kHz sample rate is supported.
rate: optional 24000
The sample rate of the audio. Always `24000`.
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) rate>)
type: optional "audio/pcm"
The audio format. Always `audio/pcm`.
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) type>)
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0>)
PCMUAudioFormat object { type }
The G.711 μ-law format.
type: optional "audio/pcmu"
The audio format. Always `audio/pcmu`.
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1 > (property) type>)
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1>)
PCMAAudioFormat object { type }
The G.711 A-law format.
type: optional "audio/pcma"
The audio format. Always `audio/pcma`.
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2 > (property) type>)
[](<#(resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) format>)
voice: optional string or "alloy" or "ash" or "ballad" or 7 more or object { id }
The voice the model uses to respond. Supported built-in voices are
`alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`, `shimmer`, `verse`,
`marin`, and `cedar`. You may also provide a custom voice object with
an `id`, for example `{ "id": "voice\_1234" }`. Voice cannot be changed
during the session once the model has responded with audio at least once.
We recommend `marin` and `cedar` for best quality.
One of the following:
string
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 0>)
"alloy" or "ash" or "ballad" or 7 more
One of the following:
"alloy"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 0>)
"ash"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 1>)
"ballad"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 2>)
"coral"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 3>)
"echo"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 4>)
"sage"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 5>)
"shimmer"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 6>)
"verse"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 7>)
"marin"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 8>)
"cedar"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 1>)
ID object { id }
Custom voice reference.
id: string
The custom voice ID, e.g. `voice\_1234`.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 2 > (property) id>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice > (variant) 2>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output > (property) voice>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio + (resource) realtime > (model) realtime_response_create_audio_output > (schema) > (property) output>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) audio>)
conversation: optional string or "auto" or "none"
Controls which conversation the response is added to. Currently supports
`auto` and `none`, with `auto` as the default value. The `auto` value
means that the contents of the response will be added to the default
conversation. Set this to `none` to create an out-of-band response which
will not add items to default conversation.
One of the following:
string
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) conversation > (variant) 0>)
"auto" or "none"
Controls which conversation the response is added to. Currently supports
`auto` and `none`, with `auto` as the default value. The `auto` value
means that the contents of the response will be added to the default
conversation. Set this to `none` to create an out-of-band response which
will not add items to default conversation.
One of the following:
"auto"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) conversation > (variant) 1 > (member) 0>)
"none"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) conversation > (variant) 1 > (member) 1>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) conversation > (variant) 1>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) conversation>)
input: optional array of [ConversationItem](</api/reference/resources/realtime#(resource) realtime > (model) conversation_item > (schema)>)
Input items to include in the prompt for the model. Using this field
creates a new context for this Response instead of using the default
conversation. An empty array `[]` will clear the context for this Response.
Note that this can include references to items that previously appeared in the session
using their id.
One of the following:
RealtimeConversationItemSystemMessage object { content, role, type, 3 more }
A system message in a Realtime conversation can be used to provide additional context or instructions to the model. This is similar but distinct from the instruction prompt provided at the start of a conversation, as system messages can be added at any point in the conversation. For major changes to the conversation's behavior, use instructions, but for smaller updates (e.g. "the user is now asking about a different topic"), use system messages.
content: array of object { text, type }
The content of the message.
text: optional string
The text content.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) text>)
type: optional "input\_text"
The content type. Always `input\_text` for system messages.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) content>)
role: "system"
The role of the message sender. Always `system`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_system_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_system_message > (schema)>)
RealtimeConversationItemUserMessage object { content, role, type, 3 more }
A user message item in a Realtime conversation.
content: array of object { audio, detail, image\_url, 3 more }
The content of the message.
audio: optional string
Base64-encoded audio bytes (for `input\_audio`), these will be parsed as the format specified in the session input audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) audio>)
detail: optional "auto" or "low" or "high"
The detail level of the image (for `input\_image`). `auto` will default to `high`.
One of the following:
"auto"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 0>)
"low"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 1>)
"high"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail > (member) 2>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) detail>)
image\_url: optional string
Base64-encoded image bytes (for `input\_image`) as a data URI. For example `data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...`. Supported formats are PNG and JPEG.
formaturi
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) image_url>)
text: optional string
The text content (for `input\_text`).
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) text>)
transcript: optional string
Transcript of the audio (for `input\_audio`). This is not sent to the model, but will be attached to the message item for reference.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) transcript>)
type: optional "input\_text" or "input\_audio" or "input\_image"
The content type (`input\_text`, `input\_audio`, or `input\_image`).
One of the following:
"input\_text"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
"input\_audio"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
"input\_image"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type > (member) 2>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) content>)
role: "user"
The role of the message sender. Always `user`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_user_message > (schema)>)
RealtimeConversationItemAssistantMessage object { content, role, type, 3 more }
An assistant message item in a Realtime conversation.
content: array of object { audio, text, transcript, type }
The content of the message.
audio: optional string
Base64-encoded audio bytes, these will be parsed as the format specified in the session output audio type configuration. This defaults to PCM 16-bit 24kHz mono if not specified.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) audio>)
text: optional string
The text content.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) text>)
transcript: optional string
The transcript of the audio content, this will always be present if the output type is `audio`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) transcript>)
type: optional "output\_text" or "output\_audio"
The content type, `output\_text` or `output\_audio` depending on the session `output\_modalities` configuration.
One of the following:
"output\_text"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 0>)
"output\_audio"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type > (member) 1>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) content>)
role: "assistant"
The role of the message sender. Always `assistant`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) role>)
type: "message"
The type of the item. Always `message`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema) > (property) status>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_assistant_message > (schema)>)
RealtimeConversationItemFunctionCall object { arguments, name, type, 4 more }
A function call item in a Realtime conversation.
arguments: string
The arguments of the function call. This is a JSON-encoded string representing the arguments passed to the function, for example `{"arg1": "value1", "arg2": 42}`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) arguments>)
name: string
The name of the function being called.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) name>)
type: "function\_call"
The type of the item. Always `function\_call`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) id>)
call\_id: optional string
The ID of the function call.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) call_id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call > (schema) > (property) status>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call > (schema)>)
RealtimeConversationItemFunctionCallOutput object { call\_id, output, type, 3 more }
A function call output item in a Realtime conversation.
call\_id: string
The ID of the function call this output is for.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) call_id>)
output: string
The output of the function call, this is free text and can contain any information or simply be empty.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) output>)
type: "function\_call\_output"
The type of the item. Always `function\_call\_output`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) type>)
id: optional string
The unique ID of the item. This may be provided by the client or generated by the server.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) id>)
object: optional "realtime.item"
Identifier for the API object being returned - always `realtime.item`. Optional when creating a new item.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) object>)
status: optional "completed" or "incomplete" or "in\_progress"
The status of the item. Has no effect on the conversation.
One of the following:
"completed"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status > (member) 2>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema) > (property) status>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_conversation_item_function_call_output > (schema)>)
RealtimeMcpApprovalResponse object { id, approval\_request\_id, approve, 2 more }
A Realtime item responding to an MCP approval request.
id: string
The unique ID of the approval response.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) id>)
approval\_request\_id: string
The ID of the approval request being answered.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approval_request_id>)
approve: boolean
Whether the request was approved.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) approve>)
type: "mcp\_approval\_response"
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) type>)
reason: optional string
Optional reason for the decision.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_approval_response > (schema) > (property) reason>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_approval_response > (schema)>)
RealtimeMcpListTools object { server\_label, tools, type, id }
A Realtime item listing tools available on an MCP server.
server\_label: string
The label of the MCP server.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) server_label>)
tools: array of object { input\_schema, name, annotations, description }
The tools available on the server.
input\_schema: unknown
The JSON schema describing the tool's input.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) input_schema>)
name: string
The name of the tool.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) name>)
annotations: optional unknown
Additional annotations about the tool.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) annotations>)
description: optional string
The description of the tool.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools > (items) > (property) description>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) tools>)
type: "mcp\_list\_tools"
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) type>)
id: optional string
The unique ID of the list.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_list_tools > (schema) > (property) id>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_list_tools > (schema)>)
RealtimeMcpToolCall object { id, arguments, name, 5 more }
A Realtime item representing an invocation of a tool on an MCP server.
id: string
The unique ID of the tool call.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) id>)
arguments: string
A JSON string of the arguments passed to the tool.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) arguments>)
name: string
The name of the tool that was run.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) name>)
server\_label: string
The label of the MCP server running the tool.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) server_label>)
type: "mcp\_call"
The type of the item. Always `mcp\_call`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) type>)
approval\_request\_id: optional string
The ID of an associated approval request, if any.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) approval_request_id>)
error: optional [RealtimeMcpProtocolError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcp_protocol_error > (schema)>) { code, message, type } or [RealtimeMcpToolExecutionError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>) { message, type } or [RealtimeMcphttpError](</api/reference/resources/realtime#(resource) realtime > (model) realtime_mcphttp_error > (schema)>) { code, message, type }
The error from the tool call, if any.
One of the following:
RealtimeMcpProtocolError object { code, message, type }
code: number
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) code>)
message: string
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) message>)
type: "protocol\_error"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_protocol_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_protocol_error > (schema)>)
RealtimeMcpToolExecutionError object { message, type }
message: string
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) message>)
type: "tool\_execution\_error"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_tool_execution_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_tool_execution_error > (schema)>)
RealtimeMcphttpError object { code, message, type }
code: number
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) code>)
message: string
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) message>)
type: "http\_error"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcphttp_error > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcphttp_error > (schema)>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) error>)
output: optional string
The output from the tool call.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_tool_call > (schema) > (property) output>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_tool_call > (schema)>)
RealtimeMcpApprovalRequest object { id, arguments, name, 2 more }
A Realtime item requesting human approval of a tool invocation.
id: string
The unique ID of the approval request.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) id>)
arguments: string
A JSON string of arguments for the tool.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) arguments>)
name: string
The name of the tool to run.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) name>)
server\_label: string
The label of the MCP server making the request.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) server_label>)
type: "mcp\_approval\_request"
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_approval_request > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_mcp_approval_request > (schema)>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) input>)
instructions: optional string
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. "be extremely succinct", "act friendly", "here are examples of good responses") and on audio behavior (e.g. "talk quickly", "inject emotion into your voice", "laugh frequently"). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) instructions>)
max\_output\_tokens: optional number or "inf"
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
number
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) max_output_tokens > (variant) 0>)
"inf"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) max_output_tokens>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) metadata>)
output\_modalities: optional array of "text" or "audio"
The set of modalities the model used to respond, currently the only possible values are
`[\\"audio\\"]`, `[\\"text\\"]`. Audio output always include a text transcript. Setting the
output to mode `text` will disable audio output from the model.
One of the following:
"text"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) output_modalities > (items) > (member) 0>)
"audio"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) output_modalities>)
prompt: optional [ResponsePrompt](</api/reference/resources/responses#(resource) responses > (model) response_prompt > (schema)>) { id, variables, version }
Reference to a prompt template and its variables.
[Learn more](/docs/guides/text?api-mode=responses#reusable-prompts).
id: string
The unique identifier of the prompt template to use.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) id>)
variables: optional map[string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or [ResponseInputImage](</api/reference/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } or [ResponseInputFile](</api/reference/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } ]
Optional map of values to substitute in for variables in your
prompt. The substitution values can either be strings, or other
Response input types like images or files.
One of the following:
string
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) variables > (items) > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage object { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision).
detail: "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: optional string
The content of the file to be sent to the model.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) variables>)
version: optional string
Optional version of the prompt template.
[](<#(resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) version>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) prompt>)
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
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) responses > (model) tool_choice_options > (schema) > (member) 0>)
"auto"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) responses > (model) tool_choice_options > (schema) > (member) 1>)
"required"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) responses > (model) tool_choice_options > (schema) > (member) 2>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) responses > (model) tool_choice_options > (schema)>)
ToolChoiceFunction object { name, type }
Use this option to force the model to call a specific function.
name: string
The name of the function to call.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) responses > (model) tool_choice_function > (schema) > (property) name>)
type: "function"
For function calling, the type is always `function`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) responses > (model) tool_choice_function > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) responses > (model) tool_choice_function > (schema)>)
ToolChoiceMcp object { server\_label, type, name }
Use this option to force the model to call a specific tool on a remote MCP server.
server\_label: string
The label of the MCP server to use.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) responses > (model) tool_choice_mcp > (schema) > (property) server_label>)
type: "mcp"
For MCP tools, the type is always `mcp`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) responses > (model) tool_choice_mcp > (schema) > (property) type>)
name: optional string
The name of the tool to call on the server.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) responses > (model) tool_choice_mcp > (schema) > (property) name>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) responses > (model) tool_choice_mcp > (schema)>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tool_choice>)
tools: optional array of [RealtimeFunctionTool](</api/reference/resources/realtime#(resource) realtime > (model) realtime_function_tool > (schema)>) { description, name, parameters, type } or object { server\_label, type, allowed\_tools, 7 more }
Tools available to the model.
One of the following:
RealtimeFunctionTool object { description, name, parameters, type }
description: optional string
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
name: optional string
The name of the function.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
parameters: optional unknown
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
type: optional "function"
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_function_tool > (schema)>)
McpTool object { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) type>)
allowed\_tools: optional array of string or object { read\_only, tool\_names }
List of allowed tool names or a filter object.
One of the following:
McpAllowedTools = array of string
A string array of allowed tool names
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 0>)
McpToolFilter object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools>)
authorization: optional string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) authorization>)
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
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 7>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id>)
defer\_loading: optional boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) defer_loading>)
headers: optional map[string]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) headers>)
require\_approval: optional object { always, never } or "always" or "never"
Specify which of the MCP server's tools require approval.
One of the following:
McpToolApprovalFilter object { always, never }
Specify which of the MCP server's tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always>)
never: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0>)
McpToolApprovalSetting = "always" or "never"
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
"always"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval>)
server\_description: optional string
Optional description of the MCP server, used to provide more context.
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) server_description>)
server\_url: optional string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1 > (property) server_url>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools > (items) > (variant) 1>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response + (resource) realtime > (model) realtime_response_create_params > (schema) > (property) tools>)
[](<#(resource) realtime > (model) response_create_event > (schema) > (property) response>)
OBJECT### response.create
```
`// Trigger a response with the default Conversation and no special parameters
{
"type": "response.create",
}
// Trigger an out-of-band response that does not write to the default Conversation
{
"type": "response.create",
"response": {
"instructions": "Provide a concise answer.",
"tools": [], // clear any session tools
"conversation": "none",
"output\_modalities": ["text"],
"metadata": {
"response\_purpose": "summarization"
},
"input": [
{
"type": "item\_reference",
"id": "item\_12345"
},
{
"type": "message",
"role": "user",
"content": [
{
"type": "input\_text",
"text": "Summarize the above message in one sentence."
}
]
}
]
}
}`
```
Send this event to cancel an in-progress response. The server will respond
with a `response.done` event with a status of `response.status=cancelled`. If
there is no response to cancel, the server will respond with an error. It's safe
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
OBJECT### response.cancel
```
`{
"type": "response.cancel",
"response\_id": "resp\_12345"
}`
```
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
OBJECT### output\_audio\_buffer.clear
```
`{
"event\_id": "optional\_client\_event\_id",
"type": "output\_audio\_buffer.clear"
}`
```