Create client secret | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Realtime](/api/reference/ruby/resources/realtime)
[Client Secrets](/api/reference/ruby/resources/realtime/subresources/client_secrets)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create client secret
realtime.client\_secrets.create(\*\*kwargs) -\> [ClientSecretCreateResponse](</api/reference/ruby/resources/realtime#(resource) realtime.client_secrets > (model) client_secret_create_response > (schema)>) { expires\_at, session, value }
POST/realtime/client\_secrets
Create a Realtime client secret with an associated session configuration.
Client secrets are short-lived tokens that can be passed to a client app,
such as a web frontend or mobile client, which grants access to the Realtime API without
leaking your main API key. You can configure a custom TTL for each client secret.
You can also attach session configuration options to the client secret, which will be
applied to any sessions created using that client secret, but these can also be overridden
by the client connection.
[Learn more about authentication with client secrets over WebRTC](https://platform.openai.com/docs/guides/realtime-webrtc).
Returns the created client secret and the effective session object. The client secret is a string that looks like `ek\_1234`.
##### ParametersExpand Collapse
expires\_after: ExpiresAfter{ anchor, seconds}
Configuration for the client secret expiration. Expiration refers to the time after which
a client secret will no longer be valid for creating sessions. The session itself may
continue after that time once started. A secret can be used to create multiple sessions
until it expires.
anchor: :created\_at
The anchor point for the client secret expiration, meaning that `seconds` will be added to the `created\_at` time of the client secret to produce an expiration timestamp. Only `created\_at` is currently supported.
[](<#(resource) realtime.client_secrets > (method) create > (params) default > (param) expires_after > (schema) > (property) anchor>)
seconds: Integer
The number of seconds from the anchor point to the expiration. Select a value between `10` and `7200` (2 hours). This default to 600 seconds (10 minutes) if not specified.
formatint64
minimum10
maximum7200
[](<#(resource) realtime.client_secrets > (method) create > (params) default > (param) expires_after > (schema) > (property) seconds>)
[](<#(resource) realtime.client_secrets > (method) create > (params) default > (param) expires_after > (schema)>)
session: [RealtimeSessionCreateRequest](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_session_create_request > (schema)>) { type, audio, include, 9 more } | [RealtimeTranscriptionSessionCreateRequest](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>) { type, audio, include }
Session configuration to use for the client secret. Choose either a realtime
session or a transcription session.
One of the following:
class RealtimeSessionCreateRequest { type, audio, include, 9 more }
Realtime session object configuration.
type: :realtime
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) type>)
audio: [RealtimeAudioConfig](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_audio_config > (schema)>) { input, output }
Configuration for input and output audio.
input: [RealtimeAudioConfigInput](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_audio_config_input > (schema)>) { format\_, noise\_reduction, transcription, turn\_detection }
format\_: [RealtimeAudioFormats](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The format of the input audio.
One of the following:
class AudioPCM { rate, type }
The PCM audio format. Only a 24kHz sample rate is supported.
rate: 24000
The sample rate of the audio. Always `24000`.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) rate>)
type: :"audio/pcm"
The audio format. Always `audio/pcm`.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0>)
class AudioPCMU { type }
The G.711 μ-law format.
type: :"audio/pcmu"
The audio format. Always `audio/pcmu`.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1>)
class AudioPCMA { type }
The G.711 A-law format.
type: :"audio/pcma"
The audio format. Always `audio/pcma`.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) input + (resource) realtime > (model) realtime_audio_config_input > (schema) > (property) format>)
noise\_reduction: NoiseReduction{ type}
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
type: [NoiseReductionType](</api/reference/ruby/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
One of the following:
:near\_field
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) noise_reduction > (property) type + (resource) realtime > (model) noise_reduction_type > (schema) > (member) 0>)
:far\_field
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) noise_reduction > (property) type + (resource) realtime > (model) noise_reduction_type > (schema) > (member) 1>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) input + (resource) realtime > (model) realtime_audio_config_input > (schema) > (property) noise_reduction > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) input + (resource) realtime > (model) realtime_audio_config_input > (schema) > (property) noise_reduction>)
transcription: [AudioTranscription](</api/reference/ruby/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration for input audio transcription, defaults to off and can be set to `null` to turn off once on. Input audio transcription is not native to the model, since the model consumes audio directly. Transcription runs asynchronously through [the /audio/transcriptions endpoint](https://platform.openai.com/docs/api-reference/audio/createTranscription) and should be treated as guidance of input audio content rather than precisely what the model heard. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
language: String
The language of the input audio. Supplying the input language in
[ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
will improve accuracy and latency.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) language>)
model: String | :"whisper-1" | :"gpt-4o-mini-transcribe" | :"gpt-4o-mini-transcribe-2025-12-15" | 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
String = String
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 0>)
Model = :"whisper-1" | :"gpt-4o-mini-transcribe" | :"gpt-4o-mini-transcribe-2025-12-15" | 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
:"whisper-1"
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 0>)
:"gpt-4o-mini-transcribe"
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 1>)
:"gpt-4o-mini-transcribe-2025-12-15"
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 2>)
:"gpt-4o-transcribe"
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 3>)
:"gpt-4o-transcribe-diarize"
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 4>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model>)
prompt: String
An optional text to guide the model’s style or continue a previous audio
segment.
For `whisper-1`, the [prompt is a list of keywords](https://platform.openai.com/docs/guides/speech-to-text#prompting).
For `gpt-4o-transcribe` models (excluding `gpt-4o-transcribe-diarize`), the prompt is a free text string, for example “expect words related to technology”.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) prompt>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) input + (resource) realtime > (model) realtime_audio_config_input > (schema) > (property) transcription>)
turn\_detection: [RealtimeAudioInputTurnDetection](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_audio_input_turn_detection > (schema)>)
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with “uhhm”, the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
One of the following:
class ServerVad { type, create\_response, idle\_timeout\_ms, 4 more }
Server-side voice activity detection (VAD) which flips on when user speech is detected and off after a period of silence.
type: :server\_vad
Type of turn detection, `server\_vad` to turn on simple Server VAD.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) type>)
create\_response: bool
Whether or not to automatically generate a response when a VAD stop event occurs. If `interrupt\_response` is set to `false` this may fail to create a response if the model is already responding.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) create_response>)
idle\_timeout\_ms: Integer
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
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) idle_timeout_ms>)
interrupt\_response: bool
Whether or not to automatically interrupt (cancel) any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs. If `true` then the response will be cancelled, otherwise it will continue until complete.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) interrupt_response>)
prefix\_padding\_ms: Integer
Used only for `server\_vad` mode. Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) prefix_padding_ms>)
silence\_duration\_ms: Integer
Used only for `server\_vad` mode. Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) silence_duration_ms>)
threshold: Float
Used only for `server\_vad` mode. Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0 > (property) threshold>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 0>)
class SemanticVad { type, create\_response, eagerness, interrupt\_response }
Server-side semantic turn detection which uses a model to determine when the user has finished speaking.
type: :semantic\_vad
Type of turn detection, `semantic\_vad` to turn on Semantic VAD.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) type>)
create\_response: bool
Whether or not to automatically generate a response when a VAD stop event occurs.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) create_response>)
eagerness: :low | :medium | :high | :auto
Used only for `semantic\_vad` mode. The eagerness of the model to respond. `low` will wait longer for the user to continue speaking, `high` will respond more quickly. `auto` is the default and is equivalent to `medium`. `low`, `medium`, and `high` have max timeouts of 8s, 4s, and 2s respectively.
One of the following:
:low
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 0>)
:medium
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 1>)
:high
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 2>)
:auto
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 3>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness>)
interrupt\_response: bool
Whether or not to automatically interrupt any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs.
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1 > (property) interrupt_response>)
[](<#(resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_audio_input_turn_detection > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) input + (resource) realtime > (model) realtime_audio_config_input > (schema) > (property) turn_detection>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio + (resource) realtime > (model) realtime_audio_config > (schema) > (property) input>)
output: [RealtimeAudioConfigOutput](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_audio_config_output > (schema)>) { format\_, speed, voice }
format\_: [RealtimeAudioFormats](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The format of the output audio.
One of the following:
class AudioPCM { rate, type }
The PCM audio format. Only a 24kHz sample rate is supported.
rate: 24000
The sample rate of the audio. Always `24000`.
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) rate>)
type: :"audio/pcm"
The audio format. Always `audio/pcm`.
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0>)
class AudioPCMU { type }
The G.711 μ-law format.
type: :"audio/pcmu"
The audio format. Always `audio/pcmu`.
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1>)
class AudioPCMA { type }
The G.711 A-law format.
type: :"audio/pcma"
The audio format. Always `audio/pcma`.
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2 > (property) type>)
[](<#(resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) format>)
speed: Float
The speed of the model’s spoken response as a multiple of the original speed.
1.0 is the default speed. 0.25 is the minimum speed. 1.5 is the maximum speed. This value can only be changed in between model turns, not while a response is in progress.
This parameter is a post-processing adjustment to the audio after it is generated, it’s
also possible to prompt the model to speak faster or slower.
maximum1.5
minimum0.25
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) speed>)
voice: String | :alloy | :ash | :ballad | 7 more | ID{ id}
The voice the model uses to respond. Supported built-in voices are
`alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`, `shimmer`, `verse`,
`marin`, and `cedar`. You may also provide a custom voice object with
an `id`, for example `{ "id": "voice\_1234" }`. Voice cannot be changed
during the session once the model has responded with audio at least once.
We recommend `marin` and `cedar` for best quality.
One of the following:
String = String
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 0>)
Voice = :alloy | :ash | :ballad | 7 more
One of the following:
:alloy
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 0>)
:ash
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 1>)
:ballad
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 2>)
:coral
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 3>)
:echo
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 4>)
:sage
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 5>)
:shimmer
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 6>)
:verse
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 7>)
:marin
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 8>)
:cedar
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 1>)
class ID { id }
Custom voice reference.
id: String
The custom voice ID, e.g. `voice\_1234`.
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 2 > (property) id>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice > (variant) 2>)
[](<#(resource) realtime > (model) realtime_audio_config > (schema) > (property) output + (resource) realtime > (model) realtime_audio_config_output > (schema) > (property) voice>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio + (resource) realtime > (model) realtime_audio_config > (schema) > (property) output>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) audio>)
include: Array[:"item.input\_audio\_transcription.logprobs"]
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) include>)
instructions: String
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) instructions>)
max\_output\_tokens: Integer | :inf
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
Integer = Integer
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 0>)
MaxOutputTokens = :inf
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) max_output_tokens>)
model: String | :"gpt-realtime" | :"gpt-realtime-1.5" | :"gpt-realtime-2025-08-28" | 13 more
The Realtime model used for this session.
One of the following:
String = String
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 0>)
Model = :"gpt-realtime" | :"gpt-realtime-1.5" | :"gpt-realtime-2025-08-28" | 13 more
The Realtime model used for this session.
One of the following:
:"gpt-realtime"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 0>)
:"gpt-realtime-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 1>)
:"gpt-realtime-2025-08-28"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 2>)
:"gpt-4o-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 3>)
:"gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 4>)
:"gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 5>)
:"gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 6>)
:"gpt-4o-mini-realtime-preview"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 7>)
:"gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 8>)
:"gpt-realtime-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 9>)
:"gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 10>)
:"gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 11>)
:"gpt-audio-1.5"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 12>)
:"gpt-audio-mini"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 13>)
:"gpt-audio-mini-2025-10-06"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 14>)
:"gpt-audio-mini-2025-12-15"
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) model>)
output\_modalities: Array[:text | :audio]
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
:text
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 0>)
:audio
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) output_modalities>)
prompt: [ResponsePrompt](</api/reference/ruby/resources/responses#(resource) responses > (model) response_prompt > (schema)>) { id, variables, version }
Reference to a prompt template and its variables.
[Learn more](https://platform.openai.com/docs/guides/text?api-mode=responses#reusable-prompts).
id: String
The unique identifier of the prompt template to use.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) id>)
variables: Hash[Symbol, String | [ResponseInputText](</api/reference/ruby/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseInputImage](</api/reference/ruby/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } | [ResponseInputFile](</api/reference/ruby/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } ]
Optional map of values to substitute in for variables in your
prompt. The substitution values can either be strings, or other
Response input types like images or files.
One of the following:
String = String
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) variables > (items) > (variant) 0>)
class ResponseInputText { text, type }
A text input to the model.
text: String
The text input to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: :input\_text
The type of the input item. Always `input\_text`.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_text > (schema)>)
class ResponseInputImage { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
detail: :low | :high | :auto | :original
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
:low
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
:high
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
:auto
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
:original
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: :input\_image
The type of the input item. Always `input\_image`.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: String
The ID of the file to be sent to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: String
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema)>)
class ResponseInputFile { type, detail, file\_data, 3 more }
A file input to the model.
type: :input\_file
The type of the input item. Always `input\_file`.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: :low | :high
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
:low
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
:high
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: String
The content of the file to be sent to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: String
The ID of the file to be sent to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: String
The URL of the file to be sent to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: String
The name of the file to be sent to the model.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) variables>)
version: String
Optional version of the prompt template.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) version>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) prompt>)
tool\_choice: [RealtimeToolChoiceConfig](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_tool_choice_config > (schema)>)
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
One of the following:
ToolChoiceOptions = :none | :auto | :required
Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or
more tools.
`required` means the model must call one or more tools.
One of the following:
:none
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_options > (schema) > (member) 0>)
:auto
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_options > (schema) > (member) 1>)
:required
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_options > (schema) > (member) 2>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_options > (schema)>)
class ToolChoiceFunction { name, type }
Use this option to force the model to call a specific function.
name: String
The name of the function to call.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_function > (schema) > (property) name>)
type: :function
For function calling, the type is always `function`.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_function > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_function > (schema)>)
class ToolChoiceMcp { server\_label, type, name }
Use this option to force the model to call a specific tool on a remote MCP server.
server\_label: String
The label of the MCP server to use.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_mcp > (schema) > (property) server_label>)
type: :mcp
For MCP tools, the type is always `mcp`.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_mcp > (schema) > (property) type>)
name: String
The name of the tool to call on the server.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_mcp > (schema) > (property) name>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice + (resource) responses > (model) tool_choice_mcp > (schema)>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tool_choice>)
tools: [RealtimeToolsConfig](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_tools_config > (schema)>) { , Mcp }
Tools available to the model.
One of the following:
class RealtimeFunctionTool { description, name, parameters, type }
description: String
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
name: String
The name of the function.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
parameters: untyped
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
type: :function
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_function_tool > (schema)>)
class Mcp { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](https://platform.openai.com/docs/guides/tools-remote-mcp).
server\_label: String
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_label>)
type: :mcp
The type of the MCP tool. Always `mcp`.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) type>)
allowed\_tools: Array[String] | McpToolFilter{ read\_only, tool\_names}
List of allowed tool names or a filter object.
One of the following:
McpAllowedTools = Array[String]
A string array of allowed tool names
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 0>)
class McpToolFilter { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names: Array[String]
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) allowed_tools>)
authorization: String
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) authorization>)
connector\_id: :connector\_dropbox | :connector\_gmail | :connector\_googlecalendar | 5 more
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
:connector\_dropbox
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 0>)
:connector\_gmail
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 1>)
:connector\_googlecalendar
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 2>)
:connector\_googledrive
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 3>)
:connector\_microsoftteams
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 4>)
:connector\_outlookcalendar
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 5>)
:connector\_outlookemail
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 6>)
:connector\_sharepoint
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id > (member) 7>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) connector_id>)
defer\_loading: bool
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) defer_loading>)
headers: Hash[Symbol, String]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) headers>)
require\_approval: McpToolApprovalFilter{ always, never} | :always | :never
Specify which of the MCP server’s tools require approval.
One of the following:
class McpToolApprovalFilter { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always: Always{ read\_only, tool\_names}
A filter object to specify which tools are allowed.
read\_only: bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names: Array[String]
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always>)
never: Never{ read\_only, tool\_names}
A filter object to specify which tools are allowed.
read\_only: bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names: Array[String]
List of allowed tool names.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 0>)
McpToolApprovalSetting = :always | :never
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
:always
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 0>)
:never
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) require_approval>)
server\_description: String
Optional description of the MCP server, used to provide more context.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_description>)
server\_url: String
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1 > (property) server_url>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools + (resource) realtime > (model) realtime_tools_config_union > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tools>)
tracing: [RealtimeTracingConfig](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_tracing_config > (schema)>)
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
One of the following:
RealtimeTracingConfig = :auto
Enables tracing and sets default values for tracing configuration options. Always `auto`.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing + (resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 0>)
class TracingConfiguration { group\_id, metadata, workflow\_name }
Granular configuration for tracing.
group\_id: String
The group id to attach to this trace to enable filtering and
grouping in the Traces Dashboard.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing + (resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 1 > (property) group_id>)
metadata: untyped
The arbitrary metadata to attach to this trace to enable
filtering in the Traces Dashboard.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing + (resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 1 > (property) metadata>)
workflow\_name: String
The name of the workflow to attach to this trace. This is used to
name the trace in the Traces Dashboard.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing + (resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 1 > (property) workflow_name>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing + (resource) realtime > (model) realtime_tracing_config > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) tracing>)
truncation: [RealtimeTruncation](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
One of the following:
RealtimeTruncationStrategy = :auto | :disabled
The truncation strategy to use for the session. `auto` is the default truncation strategy. `disabled` will disable truncation and emit errors when the conversation exceeds the input token limit.
One of the following:
:auto
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 0 > (member) 0>)
:disabled
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 0 > (member) 1>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 0>)
class RealtimeTruncationRetentionRatio { retention\_ratio, type, token\_limits }
Retain a fraction of the conversation tokens when the conversation exceeds the input token limit. This allows you to amortize truncations across multiple turns, which can help improve cached token usage.
retention\_ratio: Float
Fraction of post-instruction conversation tokens to retain (`0.0` - `1.0`) when the conversation exceeds the input token limit. Setting this to `0.8` means that messages will be dropped until 80% of the maximum allowed tokens are used. This helps reduce the frequency of truncations and improve cache rates.
minimum0
maximum1
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation_retention_ratio > (schema) > (property) retention_ratio>)
type: :retention\_ratio
Use retention ratio truncation.
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation_retention_ratio > (schema) > (property) type>)
token\_limits: TokenLimits{ post\_instructions}
Optional custom token limits for this truncation strategy. If not provided, the model’s default token limits will be used.
post\_instructions: Integer
Maximum tokens allowed in the conversation after instructions (which including tool definitions). For example, setting this to 5,000 would mean that truncation would occur when the conversation exceeds 5,000 tokens after instructions. This cannot be higher than the model’s context window size minus the maximum output tokens.
minimum0
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation_retention_ratio > (schema) > (property) token_limits > (property) post_instructions>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation_retention_ratio > (schema) > (property) token_limits>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation_retention_ratio > (schema)>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema) > (property) truncation>)
[](<#(resource) realtime > (model) realtime_session_create_request > (schema)>)
class RealtimeTranscriptionSessionCreateRequest { type, audio, include }
Realtime transcription session object configuration.
type: :transcription
The type of session to create. Always `transcription` for transcription sessions.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) type>)
audio: [RealtimeTranscriptionSessionAudio](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio > (schema)>) { input }
Configuration for input and output audio.
input: [RealtimeTranscriptionSessionAudioInput](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema)>) { format\_, noise\_reduction, transcription, turn\_detection }
format\_: [RealtimeAudioFormats](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The PCM audio format. Only a 24kHz sample rate is supported.
One of the following:
class AudioPCM { rate, type }
The PCM audio format. Only a 24kHz sample rate is supported.
rate: 24000
The sample rate of the audio. Always `24000`.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) rate>)
type: :"audio/pcm"
The audio format. Always `audio/pcm`.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) type>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0>)
class AudioPCMU { type }
The G.711 μ-law format.
type: :"audio/pcmu"
The audio format. Always `audio/pcmu`.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1 > (property) type>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1>)
class AudioPCMA { type }
The G.711 A-law format.
type: :"audio/pcma"
The audio format. Always `audio/pcma`.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2 > (property) type>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio > (schema) > (property) input + (resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) format>)
noise\_reduction: NoiseReduction{ type}
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
type: [NoiseReductionType](</api/reference/ruby/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
One of the following:
:near\_field
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) noise_reduction > (property) type + (resource) realtime > (model) noise_reduction_type > (schema) > (member) 0>)
:far\_field
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) noise_reduction > (property) type + (resource) realtime > (model) noise_reduction_type > (schema) > (member) 1>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio > (schema) > (property) input + (resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) noise_reduction > (property) type>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio > (schema) > (property) input + (resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) noise_reduction>)
transcription: [AudioTranscription](</api/reference/ruby/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration for input audio transcription, defaults to off and can be set to `null` to turn off once on. Input audio transcription is not native to the model, since the model consumes audio directly. Transcription runs asynchronously through [the /audio/transcriptions endpoint](https://platform.openai.com/docs/api-reference/audio/createTranscription) and should be treated as guidance of input audio content rather than precisely what the model heard. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
language: String
The language of the input audio. Supplying the input language in
[ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
will improve accuracy and latency.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) language>)
model: String | :"whisper-1" | :"gpt-4o-mini-transcribe" | :"gpt-4o-mini-transcribe-2025-12-15" | 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
String = String
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 0>)
Model = :"whisper-1" | :"gpt-4o-mini-transcribe" | :"gpt-4o-mini-transcribe-2025-12-15" | 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
:"whisper-1"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 0>)
:"gpt-4o-mini-transcribe"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 1>)
:"gpt-4o-mini-transcribe-2025-12-15"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 2>)
:"gpt-4o-transcribe"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 3>)
:"gpt-4o-transcribe-diarize"
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 4>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model>)
prompt: String
An optional text to guide the model’s style or continue a previous audio
segment.
For `whisper-1`, the [prompt is a list of keywords](https://platform.openai.com/docs/guides/speech-to-text#prompting).
For `gpt-4o-transcribe` models (excluding `gpt-4o-transcribe-diarize`), the prompt is a free text string, for example “expect words related to technology”.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) prompt>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio > (schema) > (property) input + (resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) transcription>)
turn\_detection: [RealtimeTranscriptionSessionAudioInputTurnDetection](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema)>)
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with “uhhm”, the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
One of the following:
class ServerVad { type, create\_response, idle\_timeout\_ms, 4 more }
Server-side voice activity detection (VAD) which flips on when user speech is detected and off after a period of silence.
type: :server\_vad
Type of turn detection, `server\_vad` to turn on simple Server VAD.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) type>)
create\_response: bool
Whether or not to automatically generate a response when a VAD stop event occurs. If `interrupt\_response` is set to `false` this may fail to create a response if the model is already responding.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) create_response>)
idle\_timeout\_ms: Integer
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
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) idle_timeout_ms>)
interrupt\_response: bool
Whether or not to automatically interrupt (cancel) any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs. If `true` then the response will be cancelled, otherwise it will continue until complete.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) interrupt_response>)
prefix\_padding\_ms: Integer
Used only for `server\_vad` mode. Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) prefix_padding_ms>)
silence\_duration\_ms: Integer
Used only for `server\_vad` mode. Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) silence_duration_ms>)
threshold: Float
Used only for `server\_vad` mode. Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0 > (property) threshold>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 0>)
class SemanticVad { type, create\_response, eagerness, interrupt\_response }
Server-side semantic turn detection which uses a model to determine when the user has finished speaking.
type: :semantic\_vad
Type of turn detection, `semantic\_vad` to turn on Semantic VAD.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) type>)
create\_response: bool
Whether or not to automatically generate a response when a VAD stop event occurs.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) create_response>)
eagerness: :low | :medium | :high | :auto
Used only for `semantic\_vad` mode. The eagerness of the model to respond. `low` will wait longer for the user to continue speaking, `high` will respond more quickly. `auto` is the default and is equivalent to `medium`. `low`, `medium`, and `high` have max timeouts of 8s, 4s, and 2s respectively.
One of the following:
:low
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 0>)
:medium
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 1>)
:high
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 2>)
:auto
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness > (member) 3>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) eagerness>)
interrupt\_response: bool
Whether or not to automatically interrupt any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs.
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1 > (property) interrupt_response>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection + (resource) realtime > (model) realtime_transcription_session_audio_input_turn_detection > (schema) > (variant) 1>)
[](<#(resource) realtime > (model) realtime_transcription_session_audio > (schema) > (property) input + (resource) realtime > (model) realtime_transcription_session_audio_input > (schema) > (property) turn_detection>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio + (resource) realtime > (model) realtime_transcription_session_audio > (schema) > (property) input>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) audio>)
include: Array[:"item.input\_audio\_transcription.logprobs"]
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema) > (property) include>)
[](<#(resource) realtime > (model) realtime_transcription_session_create_request > (schema)>)
[](<#(resource) realtime.client_secrets > (method) create > (params) default > (param) session > (schema)>)
##### ReturnsExpand Collapse
class ClientSecretCreateResponse { expires\_at, session, value }
Response from creating a session and client secret for the Realtime API.
expires\_at: Integer
Expiration timestamp for the client secret, in seconds since epoch.
formatunixtime
[](<#(resource) realtime.client_secrets > (model) client_secret_create_response > (schema) > (property) expires_at>)
session: [RealtimeSessionCreateResponse](</api/reference/ruby/resources/realtime#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema)>) { client\_secret, type, audio, 10 more } | [RealtimeTranscriptionSessionCreateResponse](</api/reference/ruby/resources/realtime#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema)>) { id, object, type, 3 more }
The session configuration for either a realtime or transcription session.
One of the following:
class RealtimeSessionCreateResponse { client\_secret, type, audio, 10 more }
A new Realtime session configuration, with an ephemeral key. Default TTL
for keys is one minute.
client\_secret: [RealtimeSessionClientSecret](</api/reference/ruby/resources/realtime#(resource) realtime.client_secrets > (model) realtime_session_client_secret > (schema)>) { expires\_at, value }
Ephemeral key returned by the API.
expires\_at: Integer
Timestamp for when the token expires. Currently, all tokens expire
after one minute.
formatunixtime
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) client_secret + (resource) realtime.client_secrets > (model) realtime_session_client_secret > (schema) > (property) expires_at>)
value: String
Ephemeral key usable in client environments to authenticate connections to the Realtime API. Use this in client-side environments rather than a standard API token, which should only be used server-side.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) client_secret + (resource) realtime.client_secrets > (model) realtime_session_client_secret > (schema) > (property) value>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) client_secret>)
type: :realtime
The type of session to create. Always `realtime` for the Realtime API.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) type>)
audio: Audio{ input, output}
Configuration for input and output audio.
input: Input{ format\_, noise\_reduction, transcription, turn\_detection}
format\_: [RealtimeAudioFormats](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The format of the input audio.
One of the following:
class AudioPCM { rate, type }
The PCM audio format. Only a 24kHz sample rate is supported.
rate: 24000
The sample rate of the audio. Always `24000`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) rate>)
type: :"audio/pcm"
The audio format. Always `audio/pcm`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0>)
class AudioPCMU { type }
The G.711 μ-law format.
type: :"audio/pcmu"
The audio format. Always `audio/pcmu`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1 > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1>)
class AudioPCMA { type }
The G.711 A-law format.
type: :"audio/pcma"
The audio format. Always `audio/pcma`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2 > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) format>)
noise\_reduction: NoiseReduction{ type}
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
type: [NoiseReductionType](</api/reference/ruby/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
One of the following:
:near\_field
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction > (property) type + (resource) realtime > (model) noise_reduction_type > (schema) > (member) 0>)
:far\_field
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction > (property) type + (resource) realtime > (model) noise_reduction_type > (schema) > (member) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction>)
transcription: [AudioTranscription](</api/reference/ruby/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration for input audio transcription, defaults to off and can be set to `null` to turn off once on. Input audio transcription is not native to the model, since the model consumes audio directly. Transcription runs asynchronously through [the /audio/transcriptions endpoint](https://platform.openai.com/docs/api-reference/audio/createTranscription) and should be treated as guidance of input audio content rather than precisely what the model heard. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
language: String
The language of the input audio. Supplying the input language in
[ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
will improve accuracy and latency.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) language>)
model: String | :"whisper-1" | :"gpt-4o-mini-transcribe" | :"gpt-4o-mini-transcribe-2025-12-15" | 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
String = String
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 0>)
Model = :"whisper-1" | :"gpt-4o-mini-transcribe" | :"gpt-4o-mini-transcribe-2025-12-15" | 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
:"whisper-1"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 0>)
:"gpt-4o-mini-transcribe"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 1>)
:"gpt-4o-mini-transcribe-2025-12-15"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 2>)
:"gpt-4o-transcribe"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 3>)
:"gpt-4o-transcribe-diarize"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 4>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model>)
prompt: String
An optional text to guide the model’s style or continue a previous audio
segment.
For `whisper-1`, the [prompt is a list of keywords](https://platform.openai.com/docs/guides/speech-to-text#prompting).
For `gpt-4o-transcribe` models (excluding `gpt-4o-transcribe-diarize`), the prompt is a free text string, for example “expect words related to technology”.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) prompt>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) transcription>)
turn\_detection: ServerVad{ type, create\_response, idle\_timeout\_ms, 4 more} | SemanticVad{ type, create\_response, eagerness, interrupt\_response}
Configuration for turn detection, ether Server VAD or Semantic VAD. This can be set to `null` to turn off, in which case the client must manually trigger model response.
Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
Semantic VAD is more advanced and uses a turn detection model (in conjunction with VAD) to semantically estimate whether the user has finished speaking, then dynamically sets a timeout based on this probability. For example, if user audio trails off with “uhhm”, the model will score a low probability of turn end and wait longer for the user to continue speaking. This can be useful for more natural conversations, but may have a higher latency.
One of the following:
class ServerVad { type, create\_response, idle\_timeout\_ms, 4 more }
Server-side voice activity detection (VAD) which flips on when user speech is detected and off after a period of silence.
type: :server\_vad
Type of turn detection, `server\_vad` to turn on simple Server VAD.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) type>)
create\_response: bool
Whether or not to automatically generate a response when a VAD stop event occurs. If `interrupt\_response` is set to `false` this may fail to create a response if the model is already responding.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) create_response>)
idle\_timeout\_ms: Integer
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
interrupt\_response: bool
Whether or not to automatically interrupt (cancel) any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs. If `true` then the response will be cancelled, otherwise it will continue until complete.
If both `create\_response` and `interrupt\_response` are set to `false`, the model will never respond automatically but VAD events will still be emitted.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) interrupt_response>)
prefix\_padding\_ms: Integer
Used only for `server\_vad` mode. Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) prefix_padding_ms>)
silence\_duration\_ms: Integer
Used only for `server\_vad` mode. Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) silence_duration_ms>)
threshold: Float
Used only for `server\_vad` mode. Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0 > (property) threshold>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 0>)
class SemanticVad { type, create\_response, eagerness, interrupt\_response }
Server-side semantic turn detection which uses a model to determine when the user has finished speaking.
type: :semantic\_vad
Type of turn detection, `semantic\_vad` to turn on Semantic VAD.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) type>)
create\_response: bool
Whether or not to automatically generate a response when a VAD stop event occurs.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) create_response>)
eagerness: :low | :medium | :high | :auto
Used only for `semantic\_vad` mode. The eagerness of the model to respond. `low` will wait longer for the user to continue speaking, `high` will respond more quickly. `auto` is the default and is equivalent to `medium`. `low`, `medium`, and `high` have max timeouts of 8s, 4s, and 2s respectively.
One of the following:
:low
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 0>)
:medium
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 1>)
:high
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 2>)
:auto
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness > (member) 3>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) eagerness>)
interrupt\_response: bool
Whether or not to automatically interrupt any ongoing response with output to the default
conversation (i.e. `conversation` of `auto`) when a VAD start event occurs.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1 > (property) interrupt_response>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) input>)
output: Output{ format\_, speed, voice}
format\_: [RealtimeAudioFormats](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The format of the output audio.
One of the following:
class AudioPCM { rate, type }
The PCM audio format. Only a 24kHz sample rate is supported.
rate: 24000
The sample rate of the audio. Always `24000`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) rate>)
type: :"audio/pcm"
The audio format. Always `audio/pcm`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0>)
class AudioPCMU { type }
The G.711 μ-law format.
type: :"audio/pcmu"
The audio format. Always `audio/pcmu`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1 > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1>)
class AudioPCMA { type }
The G.711 A-law format.
type: :"audio/pcma"
The audio format. Always `audio/pcma`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2 > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) format>)
speed: Float
The speed of the model’s spoken response as a multiple of the original speed.
1.0 is the default speed. 0.25 is the minimum speed. 1.5 is the maximum speed. This value can only be changed in between model turns, not while a response is in progress.
This parameter is a post-processing adjustment to the audio after it is generated, it’s
also possible to prompt the model to speak faster or slower.
maximum1.5
minimum0.25
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) speed>)
voice: String | :alloy | :ash | :ballad | 7 more
The voice the model uses to respond. Voice cannot be changed during the
session once the model has responded with audio at least once. Current
voice options are `alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`,
`shimmer`, `verse`, `marin`, and `cedar`. We recommend `marin` and `cedar` for
best quality.
One of the following:
String = String
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 0>)
Voice = :alloy | :ash | :ballad | 7 more
The voice the model uses to respond. Voice cannot be changed during the
session once the model has responded with audio at least once. Current
voice options are `alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`,
`shimmer`, `verse`, `marin`, and `cedar`. We recommend `marin` and `cedar` for
best quality.
One of the following:
:alloy
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 0>)
:ash
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 1>)
:ballad
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 2>)
:coral
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 3>)
:echo
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 4>)
:sage
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 5>)
:shimmer
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 6>)
:verse
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 7>)
:marin
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 8>)
:cedar
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output > (property) voice>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio > (property) output>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) audio>)
include: Array[:"item.input\_audio\_transcription.logprobs"]
Additional fields to include in server outputs.
`item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) include>)
instructions: String
The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. “be extremely succinct”, “act friendly”, “here are examples of good responses”) and on audio behavior (e.g. “talk quickly”, “inject emotion into your voice”, “laugh frequently”). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) instructions>)
max\_output\_tokens: Integer | :inf
Maximum number of output tokens for a single assistant response,
inclusive of tool calls. Provide an integer between 1 and 4096 to
limit output tokens, or `inf` for the maximum available tokens for a
given model. Defaults to `inf`.
One of the following:
Integer = Integer
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) max_output_tokens > (variant) 0>)
MaxOutputTokens = :inf
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) max_output_tokens > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) max_output_tokens>)
model: String | :"gpt-realtime" | :"gpt-realtime-1.5" | :"gpt-realtime-2025-08-28" | 13 more
The Realtime model used for this session.
One of the following:
String = String
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 0>)
Model = :"gpt-realtime" | :"gpt-realtime-1.5" | :"gpt-realtime-2025-08-28" | 13 more
The Realtime model used for this session.
One of the following:
:"gpt-realtime"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 0>)
:"gpt-realtime-1.5"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 1>)
:"gpt-realtime-2025-08-28"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 2>)
:"gpt-4o-realtime-preview"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 3>)
:"gpt-4o-realtime-preview-2024-10-01"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 4>)
:"gpt-4o-realtime-preview-2024-12-17"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 5>)
:"gpt-4o-realtime-preview-2025-06-03"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 6>)
:"gpt-4o-mini-realtime-preview"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 7>)
:"gpt-4o-mini-realtime-preview-2024-12-17"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 8>)
:"gpt-realtime-mini"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 9>)
:"gpt-realtime-mini-2025-10-06"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 10>)
:"gpt-realtime-mini-2025-12-15"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 11>)
:"gpt-audio-1.5"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 12>)
:"gpt-audio-mini"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 13>)
:"gpt-audio-mini-2025-10-06"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 14>)
:"gpt-audio-mini-2025-12-15"
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1 > (member) 15>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) model>)
output\_modalities: Array[:text | :audio]
The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
that the model will respond with audio plus a transcript. `["text"]` can be used to make
the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
One of the following:
:text
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) output_modalities > (items) > (member) 0>)
:audio
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) output_modalities > (items) > (member) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) output_modalities>)
prompt: [ResponsePrompt](</api/reference/ruby/resources/responses#(resource) responses > (model) response_prompt > (schema)>) { id, variables, version }
Reference to a prompt template and its variables.
[Learn more](https://platform.openai.com/docs/guides/text?api-mode=responses#reusable-prompts).
id: String
The unique identifier of the prompt template to use.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) id>)
variables: Hash[Symbol, String | [ResponseInputText](</api/reference/ruby/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseInputImage](</api/reference/ruby/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } | [ResponseInputFile](</api/reference/ruby/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } ]
Optional map of values to substitute in for variables in your
prompt. The substitution values can either be strings, or other
Response input types like images or files.
One of the following:
String = String
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) variables > (items) > (variant) 0>)
class ResponseInputText { text, type }
A text input to the model.
text: String
The text input to the model.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: :input\_text
The type of the input item. Always `input\_text`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_text > (schema)>)
class ResponseInputImage { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
detail: :low | :high | :auto | :original
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
:low
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
:high
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
:auto
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
:original
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: :input\_image
The type of the input item. Always `input\_image`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: String
The ID of the file to be sent to the model.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: String
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema)>)
class ResponseInputFile { type, detail, file\_data, 3 more }
A file input to the model.
type: :input\_file
The type of the input item. Always `input\_file`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: :low | :high
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
:low
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
:high
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: String
The content of the file to be sent to the model.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: String
The ID of the file to be sent to the model.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: String
The URL of the file to be sent to the model.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: String
The name of the file to be sent to the model.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) variables>)
version: String
Optional version of the prompt template.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) version>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) prompt>)
tool\_choice: [ToolChoiceOptions](</api/reference/ruby/resources/responses#(resource) responses > (model) tool_choice_options > (schema)>) | [ToolChoiceFunction](</api/reference/ruby/resources/responses#(resource) responses > (model) tool_choice_function > (schema)>) { name, type } | [ToolChoiceMcp](</api/reference/ruby/resources/responses#(resource) responses > (model) tool_choice_mcp > (schema)>) { server\_label, type, name }
How the model chooses tools. Provide one of the string modes or force a specific
function/MCP tool.
One of the following:
ToolChoiceOptions = :none | :auto | :required
Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or
more tools.
`required` means the model must call one or more tools.
One of the following:
:none
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 0>)
:auto
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 1>)
:required
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 2>)
[](<#(resource) responses > (model) tool_choice_options > (schema)>)
class ToolChoiceFunction { name, type }
Use this option to force the model to call a specific function.
name: String
The name of the function to call.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) name>)
type: :function
For function calling, the type is always `function`.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) type>)
[](<#(resource) responses > (model) tool_choice_function > (schema)>)
class ToolChoiceMcp { server\_label, type, name }
Use this option to force the model to call a specific tool on a remote MCP server.
server\_label: String
The label of the MCP server to use.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) server_label>)
type: :mcp
For MCP tools, the type is always `mcp`.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) type>)
name: String
The name of the tool to call on the server.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) name>)
[](<#(resource) responses > (model) tool_choice_mcp > (schema)>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tool_choice>)
tools: Array[[RealtimeFunctionTool](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_function_tool > (schema)>) { description, name, parameters, type } | McpTool{ server\_label, type, allowed\_tools, 7 more}]
Tools available to the model.
One of the following:
class RealtimeFunctionTool { description, name, parameters, type }
description: String
The description of the function, including guidance on when and how
to call it, and guidance about what to tell the user when calling
(if anything).
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) description>)
name: String
The name of the function.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) name>)
parameters: untyped
Parameters of the function in JSON Schema.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) parameters>)
type: :function
The type of the tool, i.e. `function`.
[](<#(resource) realtime > (model) realtime_function_tool > (schema) > (property) type>)
[](<#(resource) realtime > (model) realtime_function_tool > (schema)>)
class McpTool { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](https://platform.openai.com/docs/guides/tools-remote-mcp).
server\_label: String
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) server_label>)
type: :mcp
The type of the MCP tool. Always `mcp`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) type>)
allowed\_tools: Array[String] | McpToolFilter{ read\_only, tool\_names}
List of allowed tool names or a filter object.
One of the following:
McpAllowedTools = Array[String]
A string array of allowed tool names
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 0>)
class McpToolFilter { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names: Array[String]
List of allowed tool names.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) allowed_tools>)
authorization: String
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) authorization>)
connector\_id: :connector\_dropbox | :connector\_gmail | :connector\_googlecalendar | 5 more
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
:connector\_dropbox
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 0>)
:connector\_gmail
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 1>)
:connector\_googlecalendar
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 2>)
:connector\_googledrive
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 3>)
:connector\_microsoftteams
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 4>)
:connector\_outlookcalendar
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 5>)
:connector\_outlookemail
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 6>)
:connector\_sharepoint
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id > (member) 7>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) connector_id>)
defer\_loading: bool
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) defer_loading>)
headers: Hash[Symbol, String]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) headers>)
require\_approval: McpToolApprovalFilter{ always, never} | :always | :never
Specify which of the MCP server’s tools require approval.
One of the following:
class McpToolApprovalFilter { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always: Always{ read\_only, tool\_names}
A filter object to specify which tools are allowed.
read\_only: bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names: Array[String]
List of allowed tool names.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) always>)
never: Never{ read\_only, tool\_names}
A filter object to specify which tools are allowed.
read\_only: bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names: Array[String]
List of allowed tool names.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 0>)
McpToolApprovalSetting = :always | :never
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
:always
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 0>)
:never
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) require_approval>)
server\_description: String
Optional description of the MCP server, used to provide more context.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) server_description>)
server\_url: String
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1 > (property) server_url>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools > (items) > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tools>)
tracing: :auto | TracingConfiguration{ group\_id, metadata, workflow\_name}
Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
tracing is enabled for a session, the configuration cannot be modified.
`auto` will create a trace for the session with default values for the
workflow name, group id, and metadata.
One of the following:
Tracing = :auto
Enables tracing and sets default values for tracing configuration options. Always `auto`.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 0>)
class TracingConfiguration { group\_id, metadata, workflow\_name }
Granular configuration for tracing.
group\_id: String
The group id to attach to this trace to enable filtering and
grouping in the Traces Dashboard.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 1 > (property) group_id>)
metadata: untyped
The arbitrary metadata to attach to this trace to enable
filtering in the Traces Dashboard.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 1 > (property) metadata>)
workflow\_name: String
The name of the workflow to attach to this trace. This is used to
name the trace in the Traces Dashboard.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 1 > (property) workflow_name>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) tracing>)
truncation: [RealtimeTruncation](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_truncation > (schema)>)
When the number of tokens in a conversation exceeds the model’s input token limit, the conversation be truncated, meaning messages (starting from the oldest) will not be included in the model’s context. A 32k context model with 4,096 max output tokens can only include 28,224 tokens in the context before truncation occurs.
Clients can configure truncation behavior to truncate with a lower max token limit, which is an effective way to control token usage and cost.
Truncation will reduce the number of cached tokens on the next turn (busting the cache), since messages are dropped from the beginning of the context. However, clients can also configure truncation to retain messages up to a fraction of the maximum context size, which will reduce the need for future truncations and thus improve the cache rate.
Truncation can be disabled entirely, which means the server will never truncate but would instead return an error if the conversation exceeds the model’s input token limit.
One of the following:
RealtimeTruncationStrategy = :auto | :disabled
The truncation strategy to use for the session. `auto` is the default truncation strategy. `disabled` will disable truncation and emit errors when the conversation exceeds the input token limit.
One of the following:
:auto
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 0 > (member) 0>)
:disabled
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 0 > (member) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation > (schema) > (variant) 0>)
class RealtimeTruncationRetentionRatio { retention\_ratio, type, token\_limits }
Retain a fraction of the conversation tokens when the conversation exceeds the input token limit. This allows you to amortize truncations across multiple turns, which can help improve cached token usage.
retention\_ratio: Float
Fraction of post-instruction conversation tokens to retain (`0.0` - `1.0`) when the conversation exceeds the input token limit. Setting this to `0.8` means that messages will be dropped until 80% of the maximum allowed tokens are used. This helps reduce the frequency of truncations and improve cache rates.
minimum0
maximum1
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation_retention_ratio > (schema) > (property) retention_ratio>)
type: :retention\_ratio
Use retention ratio truncation.
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation_retention_ratio > (schema) > (property) type>)
token\_limits: TokenLimits{ post\_instructions}
Optional custom token limits for this truncation strategy. If not provided, the model’s default token limits will be used.
post\_instructions: Integer
Maximum tokens allowed in the conversation after instructions (which including tool definitions). For example, setting this to 5,000 would mean that truncation would occur when the conversation exceeds 5,000 tokens after instructions. This cannot be higher than the model’s context window size minus the maximum output tokens.
minimum0
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation_retention_ratio > (schema) > (property) token_limits > (property) post_instructions>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation_retention_ratio > (schema) > (property) token_limits>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) truncation + (resource) realtime > (model) realtime_truncation_retention_ratio > (schema)>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema) > (property) truncation>)
[](<#(resource) realtime.client_secrets > (model) realtime_session_create_response > (schema)>)
class RealtimeTranscriptionSessionCreateResponse { id, object, type, 3 more }
A Realtime transcription session configuration object.
id: String
Unique identifier for the session that looks like `sess\_1234567890abcdef`.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) id>)
object: String
The object type. Always `realtime.transcription\_session`.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) object>)
type: :transcription
The type of session. Always `transcription` for transcription sessions.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) type>)
audio: Audio{ input}
Configuration for input audio for the session.
input: Input{ format\_, noise\_reduction, transcription, turn\_detection}
format\_: [RealtimeAudioFormats](</api/reference/ruby/resources/realtime#(resource) realtime > (model) realtime_audio_formats > (schema)>)
The PCM audio format. Only a 24kHz sample rate is supported.
One of the following:
class AudioPCM { rate, type }
The PCM audio format. Only a 24kHz sample rate is supported.
rate: 24000
The sample rate of the audio. Always `24000`.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) rate>)
type: :"audio/pcm"
The audio format. Always `audio/pcm`.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0 > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 0>)
class AudioPCMU { type }
The G.711 μ-law format.
type: :"audio/pcmu"
The audio format. Always `audio/pcmu`.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1 > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 1>)
class AudioPCMA { type }
The G.711 A-law format.
type: :"audio/pcma"
The audio format. Always `audio/pcma`.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2 > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) format + (resource) realtime > (model) realtime_audio_formats > (schema) > (variant) 2>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) format>)
noise\_reduction: NoiseReduction{ type}
Configuration for input audio noise reduction.
type: [NoiseReductionType](</api/reference/ruby/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
One of the following:
:near\_field
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction > (property) type + (resource) realtime > (model) noise_reduction_type > (schema) > (member) 0>)
:far\_field
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction > (property) type + (resource) realtime > (model) noise_reduction_type > (schema) > (member) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) noise_reduction>)
transcription: [AudioTranscription](</api/reference/ruby/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration of the transcription model.
language: String
The language of the input audio. Supplying the input language in
[ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
will improve accuracy and latency.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) language>)
model: String | :"whisper-1" | :"gpt-4o-mini-transcribe" | :"gpt-4o-mini-transcribe-2025-12-15" | 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
String = String
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 0>)
Model = :"whisper-1" | :"gpt-4o-mini-transcribe" | :"gpt-4o-mini-transcribe-2025-12-15" | 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
:"whisper-1"
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 0>)
:"gpt-4o-mini-transcribe"
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 1>)
:"gpt-4o-mini-transcribe-2025-12-15"
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 2>)
:"gpt-4o-transcribe"
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 3>)
:"gpt-4o-transcribe-diarize"
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 4>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model>)
prompt: String
An optional text to guide the model’s style or continue a previous audio
segment.
For `whisper-1`, the [prompt is a list of keywords](https://platform.openai.com/docs/guides/speech-to-text#prompting).
For `gpt-4o-transcribe` models (excluding `gpt-4o-transcribe-diarize`), the prompt is a free text string, for example “expect words related to technology”.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) prompt>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) transcription>)
turn\_detection: [RealtimeTranscriptionSessionTurnDetection](</api/reference/ruby/resources/realtime#(resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema)>) { prefix\_padding\_ms, silence\_duration\_ms, threshold, type }
Configuration for turn detection. Can be set to `null` to turn off. Server
VAD means that the model will detect the start and end of speech based on
audio volume and respond at the end of user speech.
prefix\_padding\_ms: Integer
Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection + (resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema) > (property) prefix_padding_ms>)
silence\_duration\_ms: Integer
Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection + (resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema) > (property) silence_duration_ms>)
threshold: Float
Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection + (resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema) > (property) threshold>)
type: String
Type of turn detection, only `server\_vad` is currently supported.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection + (resource) realtime.client_secrets > (model) realtime_transcription_session_turn_detection > (schema) > (property) type>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input > (property) turn_detection>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio > (property) input>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) audio>)
expires\_at: Integer
Expiration timestamp for the session, in seconds since epoch.
formatunixtime
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) expires_at>)
include: Array[:"item.input\_audio\_transcription.logprobs"]
Additional fields to include in server outputs.
* `item.input\_audio\_transcription.logprobs`: Include logprobs for input audio transcription.
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema) > (property) include>)
[](<#(resource) realtime.client_secrets > (model) realtime_transcription_session_create_response > (schema)>)
[](<#(resource) realtime.client_secrets > (model) client_secret_create_response > (schema) > (property) session>)
value: String
The generated client secret value.
[](<#(resource) realtime.client_secrets > (model) client_secret_create_response > (schema) > (property) value>)
[](<#(resource) realtime.client_secrets > (model) client_secret_create_response > (schema)>)
### Create client secret
Ruby
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
`require "openai"
openai = OpenAI::Client.new(api\_key: "My API Key")
client\_secret = openai.realtime.client\_secrets.create
puts(client\_secret)`
```
```
`{
"value": "ek\_68af296e8e408191a1120ab6383263c2",
"expires\_at": 1756310470,
"session": {
"type": "realtime",
"object": "realtime.session",
"id": "sess\_C9CiUVUzUzYIssh3ELY1d",
"model": "gpt-realtime",
"output\_modalities": [
"audio"
],
"instructions": "You are a friendly assistant.",
"tools": [],
"tool\_choice": "auto",
"max\_output\_tokens": "inf",
"tracing": null,
"truncation": "auto",
"prompt": null,
"expires\_at": 0,
"audio": {
"input": {
"format": {
"type": "audio/pcm",
"rate": 24000
},
"transcription": null,
"noise\_reduction": null,
"turn\_detection": {
"type": "server\_vad",
}
},
"output": {
"format": {
"type": "audio/pcm",
"rate": 24000
},
"voice": "alloy",
"speed": 1.0
}
},
"include": null
}
}
`
```
##### Returns Examples
```
`{
"value": "ek\_68af296e8e408191a1120ab6383263c2",
"expires\_at": 1756310470,
"session": {
"type": "realtime",
"object": "realtime.session",
"id": "sess\_C9CiUVUzUzYIssh3ELY1d",
"model": "gpt-realtime",
"output\_modalities": [
"audio"
],
"instructions": "You are a friendly assistant.",
"tools": [],
"tool\_choice": "auto",
"max\_output\_tokens": "inf",
"tracing": null,
"truncation": "auto",
"prompt": null,
"expires\_at": 0,
"audio": {
"input": {
"format": {
"type": "audio/pcm",
"rate": 24000
},
"transcription": null,
"noise\_reduction": null,
"turn\_detection": {
"type": "server\_vad",
}
},
"output": {
"format": {
"type": "audio/pcm",
"rate": 24000
},
"voice": "alloy",
"speed": 1.0
}
},
"include": null
}
}
`
```