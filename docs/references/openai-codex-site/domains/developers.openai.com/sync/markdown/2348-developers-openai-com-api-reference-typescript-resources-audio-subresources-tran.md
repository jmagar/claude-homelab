Create transcription | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Audio](/api/reference/typescript/resources/audio)
[Transcriptions](/api/reference/typescript/resources/audio/subresources/transcriptions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create transcription
client.audio.transcriptions.create(TranscriptionCreateParamsbody, RequestOptionsoptions?): [TranscriptionCreateResponse](</api/reference/typescript/resources/audio#(resource) audio.transcriptions > (model) transcription_create_response > (schema)>) | Stream\<[TranscriptionStreamEvent](</api/reference/typescript/resources/audio#(resource) audio.transcriptions > (model) transcription_stream_event > (schema)>)\>
POST/audio/transcriptions
Transcribes audio into the input language.
Returns a transcription object in `json`, `diarized\_json`, or `verbose\_json`
format, or a stream of transcript events.
##### ParametersExpand Collapse
TranscriptionCreateParams = TranscriptionCreateParamsNonStreaming { stream } | TranscriptionCreateParamsStreaming { stream }
TranscriptionCreateParamsBase { file, model, chunking\_strategy, 9 more }
file: [Uploadable](</api/reference/typescript/resources/audio/subresources/transcriptions/methods/create#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) file > (schema)>)
The audio file object (not file name) to transcribe, in one of these formats: flac, mp3, mp4, mpeg, mpga, m4a, ogg, wav, or webm.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) file>)
model: (string & {}) | [AudioModel](</api/reference/typescript/resources/audio#(resource) audio > (model) audio_model > (schema)>)
ID of the model to use. The options are `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `whisper-1` (which is powered by our open source Whisper V2 model), and `gpt-4o-transcribe-diarize`.
One of the following:
(string & {})
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) model > (schema) > (variant) 0>)
AudioModel = "whisper-1" | "gpt-4o-transcribe" | "gpt-4o-mini-transcribe" | 2 more
One of the following:
"whisper-1"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 0>)
"gpt-4o-transcribe"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 1>)
"gpt-4o-mini-transcribe"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 2>)
"gpt-4o-mini-transcribe-2025-12-15"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 3>)
"gpt-4o-transcribe-diarize"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 4>)
[](<#(resource) audio > (model) audio_model > (schema)>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) model>)
chunking\_strategy?: "auto" | VadConfig { type, prefix\_padding\_ms, silence\_duration\_ms, threshold } | null
Controls how the audio is cut into chunks. When set to `"auto"`, the server first normalizes loudness and then uses voice activity detection (VAD) to choose boundaries. `server\_vad` object can be provided to tweak VAD detection parameters manually. If unset, the audio is transcribed as a single block. Required when using `gpt-4o-transcribe-diarize` for inputs longer than 30 seconds.
One of the following:
"auto"
"auto"
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 0 > (member) 0>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 0>)
VadConfig { type, prefix\_padding\_ms, silence\_duration\_ms, threshold }
type: "server\_vad"
Must be set to `server\_vad` to enable manual chunking using server side VAD.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 1 > (property) type>)
prefix\_padding\_ms?: number
Amount of audio to include before the VAD detected speech (in
milliseconds).
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 1 > (property) prefix_padding_ms>)
silence\_duration\_ms?: number
Duration of silence to detect speech stop (in milliseconds).
With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 1 > (property) silence_duration_ms>)
threshold?: number
Sensitivity threshold (0.0 to 1.0) for voice activity detection. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 1 > (property) threshold>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 1>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy>)
include?: Array\<[TranscriptionInclude](</api/reference/typescript/resources/audio#(resource) audio.transcriptions > (model) transcription_include > (schema)>) { } \>
Additional information to include in the transcription response.
`logprobs` will return the log probabilities of the tokens in the
response to understand the model’s confidence in the transcription.
`logprobs` only works with response\_format set to `json` and only with
the models `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, and `gpt-4o-mini-transcribe-2025-12-15`. This field is not supported when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) include>)
known\_speaker\_names?: Array\<string\>
Optional list of speaker names that correspond to the audio samples provided in `known\_speaker\_references[]`. Each entry should be a short identifier (for example `customer` or `agent`). Up to 4 speakers are supported.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) known_speaker_names>)
known\_speaker\_references?: Array\<string\>
Optional list of audio samples (as [data URLs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URLs)) that contain known speaker references matching `known\_speaker\_names[]`. Each sample must be between 2 and 10 seconds, and can use any of the same input audio formats supported by `file`.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) known_speaker_references>)
language?: string
The language of the input audio. Supplying the input language in [ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format will improve accuracy and latency.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) language>)
prompt?: string
An optional text to guide the model’s style or continue a previous audio segment. The [prompt](https://platform.openai.com/docs/guides/speech-to-text#prompting) should match the audio language. This field is not supported when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) prompt>)
response\_format?: [AudioResponseFormat](</api/reference/typescript/resources/audio#(resource) audio > (model) audio_response_format > (schema)>)
The format of the output, in one of these options: `json`, `text`, `srt`, `verbose\_json`, `vtt`, or `diarized\_json`. For `gpt-4o-transcribe` and `gpt-4o-mini-transcribe`, the only supported format is `json`. For `gpt-4o-transcribe-diarize`, the supported formats are `json`, `text`, and `diarized\_json`, with `diarized\_json` required to receive speaker annotations.
One of the following:
"json"
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) response_format + (resource) audio > (model) audio_response_format > (schema) > (member) 0>)
"text"
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) response_format + (resource) audio > (model) audio_response_format > (schema) > (member) 1>)
"srt"
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) response_format + (resource) audio > (model) audio_response_format > (schema) > (member) 2>)
"verbose\_json"
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) response_format + (resource) audio > (model) audio_response_format > (schema) > (member) 3>)
"vtt"
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) response_format + (resource) audio > (model) audio_response_format > (schema) > (member) 4>)
"diarized\_json"
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) response_format + (resource) audio > (model) audio_response_format > (schema) > (member) 5>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) response_format>)
stream?: false | null
If set to true, the model response data will be streamed to the client
as it is generated using [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format).
See the [Streaming section of the Speech-to-Text guide](https://platform.openai.com/docs/guides/speech-to-text?lang=curl#streaming-transcriptions)
for more information.
Note: Streaming is not supported for the `whisper-1` model and will be ignored.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) stream>)
temperature?: number
The sampling temperature, between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use [log probability](https://en.wikipedia.org/wiki/Log_probability) to automatically increase the temperature until certain thresholds are hit.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) temperature>)
timestamp\_granularities?: Array\<"word" | "segment"\>
The timestamp granularities to populate for this transcription. `response\_format` must be set `verbose\_json` to use timestamp granularities. Either or both of these options are supported: `word`, or `segment`. Note: There is no additional latency for segment timestamps, but generating word timestamps incurs additional latency.
This option is not available for `gpt-4o-transcribe-diarize`.
One of the following:
"word"
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) timestamp_granularities > (schema) > (items) > (member) 0>)
"segment"
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) timestamp_granularities > (schema) > (items) > (member) 1>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) timestamp_granularities>)
[](<#(resource) audio.transcriptions > (method) create.typescript.base_params>)
TranscriptionCreateParamsNonStreaming extends TranscriptionCreateParamsBase { file, model, chunking\_strategy, 9 more } { stream }
stream?: false | null
If set to true, the model response data will be streamed to the client
as it is generated using [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format).
See the [Streaming section of the Speech-to-Text guide](https://platform.openai.com/docs/guides/speech-to-text?lang=curl#streaming-transcriptions)
for more information.
Note: Streaming is not supported for the `whisper-1` model and will be ignored.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) stream>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming>)
TranscriptionCreateParamsStreaming extends TranscriptionCreateParamsBase { file, model, chunking\_strategy, 9 more } { stream }
stream: true
If set to true, the model response data will be streamed to the client
as it is generated using [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format).
See the [Streaming section of the Speech-to-Text guide](https://platform.openai.com/docs/guides/speech-to-text?lang=curl#streaming-transcriptions)
for more information.
Note: Streaming is not supported for the `whisper-1` model and will be ignored.
[](<#(resource) audio.transcriptions > (method) create > (params) default.streaming > (param) stream>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.streaming>)
[](<#(resource) audio.transcriptions > (method) create.typescript.params>)
##### ReturnsExpand Collapse
TranscriptionCreateResponse = [Transcription](</api/reference/typescript/resources/audio#(resource) audio.transcriptions > (model) transcription > (schema)>) { text, logprobs, usage } | [TranscriptionDiarized](</api/reference/typescript/resources/audio#(resource) audio.transcriptions > (model) transcription_diarized > (schema)>) { duration, segments, task, 2 more } | [TranscriptionVerbose](</api/reference/typescript/resources/audio#(resource) audio.transcriptions > (model) transcription_verbose > (schema)>) { duration, language, text, 3 more }
Represents a transcription response returned by model, based on the provided input.
One of the following:
Transcription { text, logprobs, usage }
Represents a transcription response returned by model, based on the provided input.
text: string
The transcribed text.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) text>)
logprobs?: Array\<Logprob\>
The log probabilities of the tokens in the transcription. Only returned with the models `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` if `logprobs` is added to the `include` array.
token?: string
The token in the transcription.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) token>)
bytes?: Array\<number\>
The bytes of the token.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob?: number
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs>)
usage?: Tokens { input\_tokens, output\_tokens, total\_tokens, 2 more } | Duration { seconds, type }
Token usage statistics for the request.
One of the following:
Tokens { input\_tokens, output\_tokens, total\_tokens, 2 more }
Usage statistics for models billed by token usage.
input\_tokens: number
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_tokens>)
output\_tokens: number
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) output_tokens>)
total\_tokens: number
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) total_tokens>)
type: "tokens"
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) type>)
input\_token\_details?: InputTokenDetails { audio\_tokens, text\_tokens }
Details about the input tokens billed for this request.
audio\_tokens?: number
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
text\_tokens?: number
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0>)
Duration { seconds, type }
Usage statistics for models billed by audio input duration.
seconds: number
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1 > (property) seconds>)
type: "duration"
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1 > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema)>)
TranscriptionDiarized { duration, segments, task, 2 more }
Represents a diarized transcription response returned by the model, including the combined transcript and speaker-segment annotations.
duration: number
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) duration>)
segments: Array\<[TranscriptionDiarizedSegment](</api/reference/typescript/resources/audio#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema)>) { id, end, speaker, 3 more } \>
Segments of the transcript annotated with timestamps and speaker labels.
id: string
Unique identifier for the segment.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) id>)
end: number
End timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) end>)
speaker: string
Speaker label for this segment. When known speakers are provided, the label matches `known\_speaker\_names[]`. Otherwise speakers are labeled sequentially using capital letters (`A`, `B`, …).
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) speaker>)
start: number
Start timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) start>)
text: string
Transcript text for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) text>)
type: "transcript.text.segment"
The type of the segment. Always `transcript.text.segment`.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) segments>)
task: "transcribe"
The type of task that was run. Always `transcribe`.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) task>)
text: string
The concatenated transcript text for the entire audio input.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) text>)
usage?: Tokens { input\_tokens, output\_tokens, total\_tokens, 2 more } | Duration { seconds, type }
Token or duration usage statistics for the request.
One of the following:
Tokens { input\_tokens, output\_tokens, total\_tokens, 2 more }
Usage statistics for models billed by token usage.
input\_tokens: number
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_tokens>)
output\_tokens: number
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) output_tokens>)
total\_tokens: number
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) total_tokens>)
type: "tokens"
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) type>)
input\_token\_details?: InputTokenDetails { audio\_tokens, text\_tokens }
Details about the input tokens billed for this request.
audio\_tokens?: number
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
text\_tokens?: number
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0>)
Duration { seconds, type }
Usage statistics for models billed by audio input duration.
seconds: number
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1 > (property) seconds>)
type: "duration"
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1 > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema)>)
TranscriptionVerbose { duration, language, text, 3 more }
Represents a verbose json transcription response returned by model, based on the provided input.
duration: number
The duration of the input audio.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) duration>)
language: string
The language of the input audio.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) language>)
text: string
The transcribed text.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) text>)
segments?: Array\<[TranscriptionSegment](</api/reference/typescript/resources/audio#(resource) audio.transcriptions > (model) transcription_segment > (schema)>) { id, avg\_logprob, compression\_ratio, 7 more } \>
Segments of the transcribed text and their corresponding details.
id: number
Unique identifier of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) id>)
avg\_logprob: number
Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) avg_logprob>)
compression\_ratio: number
Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) compression_ratio>)
end: number
End time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) end>)
no\_speech\_prob: number
Probability of no speech in the segment. If the value is higher than 1.0 and the `avg\_logprob` is below -1, consider this segment silent.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) no_speech_prob>)
seek: number
Seek offset of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) seek>)
start: number
Start time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) start>)
temperature: number
Temperature parameter used for generating the segment.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) temperature>)
text: string
Text content of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) text>)
tokens: Array\<number\>
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) segments>)
usage?: Usage { seconds, type }
Usage statistics for models billed by audio input duration.
seconds: number
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage > (property) seconds>)
type: "duration"
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage>)
words?: Array\<[TranscriptionWord](</api/reference/typescript/resources/audio#(resource) audio.transcriptions > (model) transcription_word > (schema)>) { end, start, word } \>
Extracted words and their corresponding timestamps.
end: number
End time of the word in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) end>)
start: number
Start time of the word in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) start>)
word: string
The text content of the word.
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) word>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) words>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema)>)
[](<#(resource) audio.transcriptions > (model) transcription_create_response > (schema)>)
TranscriptionStreamEvent = [TranscriptionTextSegmentEvent](</api/reference/typescript/resources/audio#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema)>) { id, end, speaker, 3 more } | [TranscriptionTextDeltaEvent](</api/reference/typescript/resources/audio#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema)>) { delta, type, logprobs, segment\_id } | [TranscriptionTextDoneEvent](</api/reference/typescript/resources/audio#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema)>) { text, type, logprobs, usage }
Emitted when a diarized transcription returns a completed segment with speaker information. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with `stream` set to `true` and `response\_format` set to `diarized\_json`.
One of the following:
TranscriptionTextSegmentEvent { id, end, speaker, 3 more }
Emitted when a diarized transcription returns a completed segment with speaker information. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with `stream` set to `true` and `response\_format` set to `diarized\_json`.
id: string
Unique identifier for the segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) id>)
end: number
End timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) end>)
speaker: string
Speaker label for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) speaker>)
start: number
Start timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) start>)
text: string
Transcript text for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) text>)
type: "transcript.text.segment"
The type of the event. Always `transcript.text.segment`.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema)>)
TranscriptionTextDeltaEvent { delta, type, logprobs, segment\_id }
Emitted when there is an additional text delta. This is also the first event emitted when the transcription starts. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
delta: string
The text delta that was additionally transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) delta>)
type: "transcript.text.delta"
The type of the event. Always `transcript.text.delta`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) type>)
logprobs?: Array\<Logprob\>
The log probabilities of the delta. Only included if you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
token?: string
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) token>)
bytes?: Array\<number\>
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob?: number
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs>)
segment\_id?: string
Identifier of the diarized segment that this delta belongs to. Only present when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) segment_id>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema)>)
TranscriptionTextDoneEvent { text, type, logprobs, usage }
Emitted when the transcription is complete. Contains the complete transcription text. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
text: string
The text that was transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) text>)
type: "transcript.text.done"
The type of the event. Always `transcript.text.done`.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) type>)
logprobs?: Array\<Logprob\>
The log probabilities of the individual tokens in the transcription. Only included if you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
token?: string
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) token>)
bytes?: Array\<number\>
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob?: number
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs>)
usage?: Usage { input\_tokens, output\_tokens, total\_tokens, 2 more }
Usage statistics for models billed by token usage.
input\_tokens: number
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_tokens>)
output\_tokens: number
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) output_tokens>)
total\_tokens: number
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) total_tokens>)
type: "tokens"
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) type>)
input\_token\_details?: InputTokenDetails { audio\_tokens, text\_tokens }
Details about the input tokens billed for this request.
audio\_tokens?: number
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) audio_tokens>)
text\_tokens?: number
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema)>)
[](<#(resource) audio.transcriptions > (model) transcription_stream_event > (schema)>)
DefaultDiarizationStreamingLogprobsWord timestampsSegment timestamps
### Create transcription
TypeScript
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
`import fs from "fs";
import OpenAI from "openai";
const openai = new OpenAI();
async function main() {
const transcription = await openai.audio.transcriptions.create({
file: fs.createReadStream("audio.mp3"),
model: "gpt-4o-transcribe",
});
console.log(transcription.text);
}
main();
`
```
```
`{
"text": "Imagine the wildest idea that you've ever had, and you're curious about how it might scale to something that's a 100, a 1,000 times bigger. This is a place where you can get to do that.",
"usage": {
"type": "tokens",
"input\_tokens": 14,
"input\_token\_details": {
"text\_tokens": 0,
"audio\_tokens": 14
},
"output\_tokens": 45,
"total\_tokens": 59
}
}
`
```
### Create transcription
TypeScript
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
`import fs from "fs";
import OpenAI from "openai";
const openai = new OpenAI();
const speakerRef = fs.readFileSync("agent.wav").toString("base64");
const transcript = await openai.audio.transcriptions.create({
file: fs.createReadStream("meeting.wav"),
model: "gpt-4o-transcribe-diarize",
response\_format: "diarized\_json",
chunking\_strategy: "auto",
extra\_body: {
known\_speaker\_names: ["agent"],
known\_speaker\_references: [`data:audio/wav;base64,${speakerRef}`],
},
});
console.log(transcript.segments);
`
```
```
`{
"task": "transcribe",
"duration": 27.4,
"text": "Agent: Thanks for calling OpenAI support.\\nA: Hi, I'm trying to enable diarization.\\nAgent: Happy to walk you through the steps.",
"segments": [
{
"type": "transcript.text.segment",
"id": "seg\_001",
"start": 0.0,
"end": 4.7,
"text": "Thanks for calling OpenAI support.",
"speaker": "agent"
},
{
"type": "transcript.text.segment",
"id": "seg\_002",
"start": 4.7,
"end": 11.8,
"text": "Hi, I'm trying to enable diarization.",
"speaker": "A"
},
{
"type": "transcript.text.segment",
"id": "seg\_003",
"start": 12.1,
"end": 18.5,
"text": "Happy to walk you through the steps.",
"speaker": "agent"
}
],
"usage": {
"type": "duration",
"seconds": 27
}
}
`
```
### Create transcription
TypeScript
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
`import fs from "fs";
import OpenAI from "openai";
const openai = new OpenAI();
const stream = await openai.audio.transcriptions.create({
file: fs.createReadStream("audio.mp3"),
model: "gpt-4o-mini-transcribe",
stream: true,
});
for await (const event of stream) {
console.log(event);
}
`
```
```
`data: {"type":"transcript.text.delta","delta":"I","logprobs":[{"token":"I","logprob":-0.00007588794,"bytes":[73]}]}
data: {"type":"transcript.text.delta","delta":" see","logprobs":[{"token":" see","logprob":-3.1281633e-7,"bytes":[32,115,101,101]}]}
data: {"type":"transcript.text.delta","delta":" skies","logprobs":[{"token":" skies","logprob":-2.3392786e-6,"bytes":[32,115,107,105,101,115]}]}
data: {"type":"transcript.text.delta","delta":" of","logprobs":[{"token":" of","logprob":-3.1281633e-7,"bytes":[32,111,102]}]}
data: {"type":"transcript.text.delta","delta":" blue","logprobs":[{"token":" blue","logprob":-1.0280384e-6,"bytes":[32,98,108,117,101]}]}
data: {"type":"transcript.text.delta","delta":" and","logprobs":[{"token":" and","logprob":-0.0005108566,"bytes":[32,97,110,100]}]}
data: {"type":"transcript.text.delta","delta":" clouds","logprobs":[{"token":" clouds","logprob":-1.9361265e-7,"bytes":[32,99,108,111,117,100,115]}]}
data: {"type":"transcript.text.delta","delta":" of","logprobs":[{"token":" of","logprob":-1.9361265e-7,"bytes":[32,111,102]}]}
data: {"type":"transcript.text.delta","delta":" white","logprobs":[{"token":" white","logprob":-7.89631e-7,"bytes":[32,119,104,105,116,101]}]}
data: {"type":"transcript.text.delta","delta":",","logprobs":[{"token":",","logprob":-0.0014890312,"bytes":[44]}]}
data: {"type":"transcript.text.delta","delta":" the","logprobs":[{"token":" the","logprob":-0.0110956915,"bytes":[32,116,104,101]}]}
data: {"type":"transcript.text.delta","delta":" bright","logprobs":[{"token":" bright","logprob":0.0,"bytes":[32,98,114,105,103,104,116]}]}
data: {"type":"transcript.text.delta","delta":" blessed","logprobs":[{"token":" blessed","logprob":-0.000045848617,"bytes":[32,98,108,101,115,115,101,100]}]}
data: {"type":"transcript.text.delta","delta":" days","logprobs":[{"token":" days","logprob":-0.000010802739,"bytes":[32,100,97,121,115]}]}
data: {"type":"transcript.text.delta","delta":",","logprobs":[{"token":",","logprob":-0.00001700133,"bytes":[44]}]}
data: {"type":"transcript.text.delta","delta":" the","logprobs":[{"token":" the","logprob":-0.0000118755715,"bytes":[32,116,104,101]}]}
data: {"type":"transcript.text.delta","delta":" dark","logprobs":[{"token":" dark","logprob":-5.5122365e-7,"bytes":[32,100,97,114,107]}]}
data: {"type":"transcript.text.delta","delta":" sacred","logprobs":[{"token":" sacred","logprob":-5.4385737e-6,"bytes":[32,115,97,99,114,101,100]}]}
data: {"type":"transcript.text.delta","delta":" nights","logprobs":[{"token":" nights","logprob":-4.00813e-6,"bytes":[32,110,105,103,104,116,115]}]}
data: {"type":"transcript.text.delta","delta":",","logprobs":[{"token":",","logprob":-0.0036910512,"bytes":[44]}]}
data: {"type":"transcript.text.delta","delta":" and","logprobs":[{"token":" and","logprob":-0.0031903093,"bytes":[32,97,110,100]}]}
data: {"type":"transcript.text.delta","delta":" I","logprobs":[{"token":" I","logprob":-1.504853e-6,"bytes":[32,73]}]}
data: {"type":"transcript.text.delta","delta":" think","logprobs":[{"token":" think","logprob":-4.3202e-7,"bytes":[32,116,104,105,110,107]}]}
data: {"type":"transcript.text.delta","delta":" to","logprobs":[{"token":" to","logprob":-1.9361265e-7,"bytes":[32,116,111]}]}
data: {"type":"transcript.text.delta","delta":" myself","logprobs":[{"token":" myself","logprob":-1.7432603e-6,"bytes":[32,109,121,115,101,108,102]}]}
data: {"type":"transcript.text.delta","delta":",","logprobs":[{"token":",","logprob":-0.29254505,"bytes":[44]}]}
data: {"type":"transcript.text.delta","delta":" what","logprobs":[{"token":" what","logprob":-0.016815351,"bytes":[32,119,104,97,116]}]}
data: {"type":"transcript.text.delta","delta":" a","logprobs":[{"token":" a","logprob":-3.1281633e-7,"bytes":[32,97]}]}
data: {"type":"transcript.text.delta","delta":" wonderful","logprobs":[{"token":" wonderful","logprob":-2.1008714e-6,"bytes":[32,119,111,110,100,101,114,102,117,108]}]}
data: {"type":"transcript.text.delta","delta":" world","logprobs":[{"token":" world","logprob":-8.180258e-6,"bytes":[32,119,111,114,108,100]}]}
data: {"type":"transcript.text.delta","delta":".","logprobs":[{"token":".","logprob":-0.014231676,"bytes":[46]}]}
data: {"type":"transcript.text.done","text":"I see skies of blue and clouds of white, the bright blessed days, the dark sacred nights, and I think to myself, what a wonderful world.","logprobs":[{"token":"I","logprob":-0.00007588794,"bytes":[73]},{"token":" see","logprob":-3.1281633e-7,"bytes":[32,115,101,101]},{"token":" skies","logprob":-2.3392786e-6,"bytes":[32,115,107,105,101,115]},{"token":" of","logprob":-3.1281633e-7,"bytes":[32,111,102]},{"token":" blue","logprob":-1.0280384e-6,"bytes":[32,98,108,117,101]},{"token":" and","logprob":-0.0005108566,"bytes":[32,97,110,100]},{"token":" clouds","logprob":-1.9361265e-7,"bytes":[32,99,108,111,117,100,115]},{"token":" of","logprob":-1.9361265e-7,"bytes":[32,111,102]},{"token":" white","logprob":-7.89631e-7,"bytes":[32,119,104,105,116,101]},{"token":",","logprob":-0.0014890312,"bytes":[44]},{"token":" the","logprob":-0.0110956915,"bytes":[32,116,104,101]},{"token":" bright","logprob":0.0,"bytes":[32,98,114,105,103,104,116]},{"token":" blessed","logprob":-0.000045848617,"bytes":[32,98,108,101,115,115,101,100]},{"token":" days","logprob":-0.000010802739,"bytes":[32,100,97,121,115]},{"token":",","logprob":-0.00001700133,"bytes":[44]},{"token":" the","logprob":-0.0000118755715,"bytes":[32,116,104,101]},{"token":" dark","logprob":-5.5122365e-7,"bytes":[32,100,97,114,107]},{"token":" sacred","logprob":-5.4385737e-6,"bytes":[32,115,97,99,114,101,100]},{"token":" nights","logprob":-4.00813e-6,"bytes":[32,110,105,103,104,116,115]},{"token":",","logprob":-0.0036910512,"bytes":[44]},{"token":" and","logprob":-0.0031903093,"bytes":[32,97,110,100]},{"token":" I","logprob":-1.504853e-6,"bytes":[32,73]},{"token":" think","logprob":-4.3202e-7,"bytes":[32,116,104,105,110,107]},{"token":" to","logprob":-1.9361265e-7,"bytes":[32,116,111]},{"token":" myself","logprob":-1.7432603e-6,"bytes":[32,109,121,115,101,108,102]},{"token":",","logprob":-0.29254505,"bytes":[44]},{"token":" what","logprob":-0.016815351,"bytes":[32,119,104,97,116]},{"token":" a","logprob":-3.1281633e-7,"bytes":[32,97]},{"token":" wonderful","logprob":-2.1008714e-6,"bytes":[32,119,111,110,100,101,114,102,117,108]},{"token":" world","logprob":-8.180258e-6,"bytes":[32,119,111,114,108,100]},{"token":".","logprob":-0.014231676,"bytes":[46]}],"usage":{"input\_tokens":14,"input\_token\_details":{"text\_tokens":0,"audio\_tokens":14},"output\_tokens":45,"total\_tokens":59}}
`
```
### Create transcription
TypeScript
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
`import fs from "fs";
import OpenAI from "openai";
const openai = new OpenAI();
async function main() {
const transcription = await openai.audio.transcriptions.create({
file: fs.createReadStream("audio.mp3"),
model: "gpt-4o-transcribe",
response\_format: "json",
include: ["logprobs"]
});
console.log(transcription);
}
main();
`
```
```
`{
"text": "Hey, my knee is hurting and I want to see the doctor tomorrow ideally.",
"logprobs": [
{ "token": "Hey", "logprob": -1.0415299, "bytes": [72, 101, 121] },
{ "token": ",", "logprob": -9.805982e-5, "bytes": [44] },
{ "token": " my", "logprob": -0.00229799, "bytes": [32, 109, 121] },
{
"token": " knee",
"logprob": -4.7159858e-5,
"bytes": [32, 107, 110, 101, 101]
},
{ "token": " is", "logprob": -0.043909557, "bytes": [32, 105, 115] },
{
"token": " hurting",
"logprob": -1.1041146e-5,
"bytes": [32, 104, 117, 114, 116, 105, 110, 103]
},
{ "token": " and", "logprob": -0.011076359, "bytes": [32, 97, 110, 100] },
{ "token": " I", "logprob": -5.3193703e-6, "bytes": [32, 73] },
{
"token": " want",
"logprob": -0.0017156356,
"bytes": [32, 119, 97, 110, 116]
},
{ "token": " to", "logprob": -7.89631e-7, "bytes": [32, 116, 111] },
{ "token": " see", "logprob": -5.5122365e-7, "bytes": [32, 115, 101, 101] },
{ "token": " the", "logprob": -0.0040786397, "bytes": [32, 116, 104, 101] },
{
"token": " doctor",
"logprob": -2.3392786e-6,
"bytes": [32, 100, 111, 99, 116, 111, 114]
},
{
"token": " tomorrow",
"logprob": -7.89631e-7,
"bytes": [32, 116, 111, 109, 111, 114, 114, 111, 119]
},
{
"token": " ideally",
"logprob": -0.5800861,
"bytes": [32, 105, 100, 101, 97, 108, 108, 121]
},
{ "token": ".", "logprob": -0.00011093382, "bytes": [46] }
],
"usage": {
"type": "tokens",
"input\_tokens": 14,
"input\_token\_details": {
"text\_tokens": 0,
"audio\_tokens": 14
},
"output\_tokens": 45,
"total\_tokens": 59
}
}
`
```
### Create transcription
TypeScript
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
`import fs from "fs";
import OpenAI from "openai";
const openai = new OpenAI();
async function main() {
const transcription = await openai.audio.transcriptions.create({
file: fs.createReadStream("audio.mp3"),
model: "whisper-1",
response\_format: "verbose\_json",
timestamp\_granularities: ["word"]
});
console.log(transcription.text);
}
main();
`
```
```
`{
"task": "transcribe",
"language": "english",
"duration": 8.470000267028809,
"text": "The beach was a popular spot on a hot summer day. People were swimming in the ocean, building sandcastles, and playing beach volleyball.",
"words": [
{
"word": "The",
"start": 0.0,
"end": 0.23999999463558197
},
...
{
"word": "volleyball",
"start": 7.400000095367432,
"end": 7.900000095367432
}
],
"usage": {
"type": "duration",
"seconds": 9
}
}
`
```
### Create transcription
TypeScript
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
`import fs from "fs";
import OpenAI from "openai";
const openai = new OpenAI();
async function main() {
const transcription = await openai.audio.transcriptions.create({
file: fs.createReadStream("audio.mp3"),
model: "whisper-1",
response\_format: "verbose\_json",
timestamp\_granularities: ["segment"]
});
console.log(transcription.text);
}
main();
`
```
```
`{
"task": "transcribe",
"language": "english",
"duration": 8.470000267028809,
"text": "The beach was a popular spot on a hot summer day. People were swimming in the ocean, building sandcastles, and playing beach volleyball.",
"segments": [
{
"id": 0,
"seek": 0,
"start": 0.0,
"end": 3.319999933242798,
"text": " The beach was a popular spot on a hot summer day.",
"tokens": [
50364, 440, 7534, 390, 257, 3743, 4008, 322, 257, 2368, 4266, 786, 13, 50530
],
"temperature": 0.0,
"avg\_logprob": -0.2860786020755768,
"compression\_ratio": 1.2363636493682861,
"no\_speech\_prob": 0.00985979475080967
},
...
],
"usage": {
"type": "duration",
"seconds": 9
}
}
`
```
##### Returns Examples
```
`{
"text": "Imagine the wildest idea that you've ever had, and you're curious about how it might scale to something that's a 100, a 1,000 times bigger. This is a place where you can get to do that.",
"usage": {
"type": "tokens",
"input\_tokens": 14,
"input\_token\_details": {
"text\_tokens": 0,
"audio\_tokens": 14
},
"output\_tokens": 45,
"total\_tokens": 59
}
}
`
```