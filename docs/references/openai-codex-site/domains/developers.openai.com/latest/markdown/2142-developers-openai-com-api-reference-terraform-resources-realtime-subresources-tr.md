Transcription Sessions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Realtime](/api/reference/terraform/resources/realtime)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Transcription Sessions
#### resource openai\_realtime\_transcription\_session
##### optional Expand Collapse
include?: List[String]
The set of items to include in the transcription. Current available items are:
`item.input\_audio\_transcription.logprobs`
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) include>)
input\_audio\_noise\_reduction?: Attributes
Configuration for input audio noise reduction. This can be set to `null` to turn off.
Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.
type?: String
Type of noise reduction. `near\_field` is for close-talking microphones such as headphones, `far\_field` is for far-field microphones such as laptop or conference room microphones.
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) input_audio_noise_reduction > (attribute) type>)
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) input_audio_noise_reduction>)
input\_audio\_transcription?: Attributes
Configuration for input audio transcription. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.
language?: String
The language of the input audio. Supplying the input language in
[ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format
will improve accuracy and latency.
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) input_audio_transcription > (attribute) language>)
model?: String
The model to use for transcription. Current options are `whisper-1`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `gpt-4o-transcribe`, and `gpt-4o-transcribe-diarize`. Use `gpt-4o-transcribe-diarize` when you need diarization with speaker labels.
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) input_audio_transcription > (attribute) model>)
prompt?: String
An optional text to guide the model’s style or continue a previous audio
segment.
For `whisper-1`, the [prompt is a list of keywords](https://platform.openai.com/docs/guides/speech-to-text#prompting).
For `gpt-4o-transcribe` models (excluding `gpt-4o-transcribe-diarize`), the prompt is a free text string, for example “expect words related to technology”.
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) input_audio_transcription > (attribute) prompt>)
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) input_audio_transcription>)
turn\_detection?: Attributes
Configuration for turn detection. Can be set to `null` to turn off. Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
prefix\_padding\_ms?: Int64
Amount of audio to include before the VAD detected speech (in
milliseconds). Defaults to 300ms.
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) turn_detection > (attribute) prefix_padding_ms>)
silence\_duration\_ms?: Int64
Duration of silence to detect speech stop (in milliseconds). Defaults
to 500ms. With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) turn_detection > (attribute) silence_duration_ms>)
threshold?: Float64
Activation threshold for VAD (0.0 to 1.0), this defaults to 0.5. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) turn_detection > (attribute) threshold>)
type?: String
Type of turn detection. Only `server\_vad` is currently supported for transcription sessions.
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) turn_detection > (attribute) type>)
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) turn_detection>)
input\_audio\_format?: String
The format of input audio. Options are `pcm16`, `g711\_ulaw`, or `g711\_alaw`.
For `pcm16`, input audio must be 16-bit PCM at a 24kHz sample rate,
single channel (mono), and little-endian byte order.
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) input_audio_format>)
##### computed Expand Collapse
modalities: List[String]
The set of modalities the model can respond with. To disable audio,
set this to [“text”].
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) modalities>)
client\_secret: Attributes
Ephemeral key returned by the API. Only present when the session is
created on the server via REST API.
expires\_at: Int64
Timestamp for when the token expires. Currently, all tokens expire
after one minute.
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) client_secret > (attribute) expires_at>)
value: String
Ephemeral key usable in client environments to authenticate connections
to the Realtime API. Use this in client-side environments rather than
a standard API token, which should only be used server-side.
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) client_secret > (attribute) value>)
[](<#(resource) realtime.transcription_sessions > (terraform resource) > (attribute) client_secret>)