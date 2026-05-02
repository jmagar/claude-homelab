Create transcription session | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Realtime](/api/reference/resources/realtime)
[Transcription Sessions](/api/reference/resources/realtime/subresources/transcription_sessions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create transcription session
Deprecated: Deprecated in favor of the realtime GA API, see https://platform.openai.com/docs/guides/realtime#beta-to-ga-migration
POST/realtime/transcription\_sessions
Create an ephemeral API token for use in client-side applications with the
Realtime API specifically for realtime transcriptions.
Can be configured with the same session parameters as the `transcription\_session.update` client event.
It responds with a session object, plus a `client\_secret` key which contains
a usable ephemeral API token that can be used to authenticate browser clients
for the Realtime API.
Returns the created Realtime transcription session object, plus an ephemeral key.
##### Body ParametersJSONExpand Collapse
include: optional array of "item.input\_audio\_transcription.logprobs"
The set of items to include in the transcription. Current available items are:
`item.input\_audio\_transcription.logprobs`
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) include > (schema)>)
input\_audio\_format: optional "pcm16" or "g711\_ulaw" or "g711\_alaw"
The format of input audio. Options are `pcm16`, `g711\_ulaw`, or `g711\_alaw`.
For `pcm16`, input audio must be 16-bit PCM at a 24kHz sample rate,
single channel (mono), and little-endian byte order.
One of the following:
"pcm16"
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_format > (schema) > (member) 0>)
"g711\_ulaw"
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_format > (schema) > (member) 1>)
"g711\_alaw"
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_format > (schema) > (member) 2>)
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_format > (schema)>)
input\_audio\_noise\_reduction: optional object { type }
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
type: optional [NoiseReductionType](</api/reference/resources/realtime#(resource) realtime > (model) noise_reduction_type > (schema)>)
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
One of the following:
"near\_field"
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_noise_reduction > (schema) > (property) type + (resource) realtime > (model) noise_reduction_type > (schema) > (member) 0>)
"far\_field"
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_noise_reduction > (schema) > (property) type + (resource) realtime > (model) noise_reduction_type > (schema) > (member) 1>)
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_noise_reduction > (schema) > (property) type>)
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_noise_reduction > (schema)>)
input\_audio\_transcription: optional [AudioTranscription](</api/reference/resources/realtime#(resource) realtime > (model) audio_transcription > (schema)>) { language, model, prompt }
Configuration for input audio transcription. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
language: optional string
The language of the input audio. Supplying the input language in
[ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
will improve accuracy and latency.
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_transcription > (schema) + (resource) realtime > (model) audio_transcription > (schema) > (property) language>)
model: optional string or "whisper-1" or "gpt-4o-mini-transcribe" or "gpt-4o-mini-transcribe-2025-12-15" or 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
string
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_transcription > (schema) + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 0>)
"whisper-1" or "gpt-4o-mini-transcribe" or "gpt-4o-mini-transcribe-2025-12-15" or 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
"whisper-1"
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_transcription > (schema) + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 0>)
"gpt-4o-mini-transcribe"
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_transcription > (schema) + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 1>)
"gpt-4o-mini-transcribe-2025-12-15"
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_transcription > (schema) + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 2>)
"gpt-4o-transcribe"
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_transcription > (schema) + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 3>)
"gpt-4o-transcribe-diarize"
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_transcription > (schema) + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 4>)
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_transcription > (schema) + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_transcription > (schema) + (resource) realtime > (model) audio_transcription > (schema) > (property) model>)
prompt: optional string
An optional text to guide the model’s style or continue a previous audio
segment.
For `whisper-1`, the [prompt is a list of keywords](/docs/guides/speech-to-text#prompting).
For `gpt-4o-transcribe` models (excluding `gpt-4o-transcribe-diarize`), the prompt is a free text string, for example “expect words related to technology”.
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_transcription > (schema) + (resource) realtime > (model) audio_transcription > (schema) > (property) prompt>)
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) input_audio_transcription > (schema)>)
turn\_detection: optional object { prefix\_padding\_ms, silence\_duration\_ms, threshold, type }
Configuration for turn detection. Can be set to `null` to turn off. Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
prefix\_padding\_ms: optional number
Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) turn_detection > (schema) > (property) prefix_padding_ms>)
silence\_duration\_ms: optional number
Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) turn_detection > (schema) > (property) silence_duration_ms>)
threshold: optional number
Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) turn_detection > (schema) > (property) threshold>)
type: optional "server\_vad"
Type of turn detection. Only `server\_vad` is currently supported for transcription sessions.
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) turn_detection > (schema) > (property) type>)
[](<#(resource) realtime.transcription_sessions > (method) create > (params) 0 > (param) turn_detection > (schema)>)
##### ReturnsExpand Collapse
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
language: optional string
The language of the input audio. Supplying the input language in
[ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
will improve accuracy and latency.
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) input_audio_transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) language>)
model: optional string or "whisper-1" or "gpt-4o-mini-transcribe" or "gpt-4o-mini-transcribe-2025-12-15" or 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
string
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) input_audio_transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 0>)
"whisper-1" or "gpt-4o-mini-transcribe" or "gpt-4o-mini-transcribe-2025-12-15" or 2 more
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
One of the following:
"whisper-1"
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) input_audio_transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 0>)
"gpt-4o-mini-transcribe"
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) input_audio_transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 1>)
"gpt-4o-mini-transcribe-2025-12-15"
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) input_audio_transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 2>)
"gpt-4o-transcribe"
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) input_audio_transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 3>)
"gpt-4o-transcribe-diarize"
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) input_audio_transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1 > (member) 4>)
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) input_audio_transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model > (variant) 1>)
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) input_audio_transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) model>)
prompt: optional string
An optional text to guide the model’s style or continue a previous audio
segment.
For `whisper-1`, the [prompt is a list of keywords](/docs/guides/speech-to-text#prompting).
For `gpt-4o-transcribe` models (excluding `gpt-4o-transcribe-diarize`), the prompt is a free text string, for example “expect words related to technology”.
[](<#(resource) realtime.transcription_sessions > (model) transcription_session_create_response > (schema) > (property) input_audio_transcription + (resource) realtime > (model) audio_transcription > (schema) > (property) prompt>)
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
### Create transcription session
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
`curl -X POST https://api.openai.com/v1/realtime/transcription\_sessions \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json" \\
-d '{}'
`
```
```
`{
"id": "sess\_BBwZc7cFV3XizEyKGDCGL",
"object": "realtime.transcription\_session",
"modalities": ["audio", "text"],
"turn\_detection": {
"type": "server\_vad",
"threshold": 0.5,
"prefix\_padding\_ms": 300,
"silence\_duration\_ms": 200
},
"input\_audio\_format": "pcm16",
"input\_audio\_transcription": {
"model": "gpt-4o-transcribe",
"language": null,
"prompt": ""
},
"client\_secret": null
}
`
```
##### Returns Examples
```
`{
"id": "sess\_BBwZc7cFV3XizEyKGDCGL",
"object": "realtime.transcription\_session",
"modalities": ["audio", "text"],
"turn\_detection": {
"type": "server\_vad",
"threshold": 0.5,
"prefix\_padding\_ms": 300,
"silence\_duration\_ms": 200
},
"input\_audio\_format": "pcm16",
"input\_audio\_transcription": {
"model": "gpt-4o-transcribe",
"language": null,
"prompt": ""
},
"client\_secret": null
}
`
```