Create transcription | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Audio](/api/reference/ruby/resources/audio)
[Transcriptions](/api/reference/ruby/resources/audio/subresources/transcriptions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create transcription
audio.transcriptions.create(\*\*kwargs) -\> [TranscriptionCreateResponse](</api/reference/ruby/resources/audio#(resource) audio.transcriptions > (model) transcription_create_response > (schema)>)
POST/audio/transcriptions
Transcribes audio into the input language.
Returns a transcription object in `json`, `diarized\_json`, or `verbose\_json`
format, or a stream of transcript events.
##### ParametersExpand Collapse
file: FileInput
The audio file object (not file name) to transcribe, in one of these formats: flac, mp3, mp4, mpeg, mpga, m4a, ogg, wav, or webm.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) file > (schema)>)
model: String | [AudioModel](</api/reference/ruby/resources/audio#(resource) audio > (model) audio_model > (schema)>)
ID of the model to use. The options are `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `whisper-1` (which is powered by our open source Whisper V2 model), and `gpt-4o-transcribe-diarize`.
One of the following:
String = String
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) model > (schema) > (variant) 0>)
AudioModel = :"whisper-1" | :"gpt-4o-transcribe" | :"gpt-4o-mini-transcribe" | 2 more
One of the following:
:"whisper-1"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 0>)
:"gpt-4o-transcribe"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 1>)
:"gpt-4o-mini-transcribe"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 2>)
:"gpt-4o-mini-transcribe-2025-12-15"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 3>)
:"gpt-4o-transcribe-diarize"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 4>)
[](<#(resource) audio > (model) audio_model > (schema)>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) model > (schema)>)
chunking\_strategy: :auto | VadConfig{ type, prefix\_padding\_ms, silence\_duration\_ms, threshold}
Controls how the audio is cut into chunks. When set to `"auto"`, the server first normalizes loudness and then uses voice activity detection (VAD) to choose boundaries. `server\_vad` object can be provided to tweak VAD detection parameters manually. If unset, the audio is transcribed as a single block. Required when using `gpt-4o-transcribe-diarize` for inputs longer than 30 seconds.
One of the following:
ChunkingStrategy = :auto
Automatically set chunking parameters based on the audio. Must be set to `"auto"`.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 0>)
class VadConfig { type, prefix\_padding\_ms, silence\_duration\_ms, threshold }
type: :server\_vad
Must be set to `server\_vad` to enable manual chunking using server side VAD.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 1 > (property) type>)
prefix\_padding\_ms: Integer
Amount of audio to include before the VAD detected speech (in
milliseconds).
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 1 > (property) prefix_padding_ms>)
silence\_duration\_ms: Integer
Duration of silence to detect speech stop (in milliseconds).
With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 1 > (property) silence_duration_ms>)
threshold: Float
Sensitivity threshold (0.0 to 1.0) for voice activity detection. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 1 > (property) threshold>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 1>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema)>)
include: Array[[TranscriptionInclude](</api/reference/ruby/resources/audio#(resource) audio.transcriptions > (model) transcription_include > (schema)>)]
Additional information to include in the transcription response.
`logprobs` will return the log probabilities of the tokens in the
response to understand the model’s confidence in the transcription.
`logprobs` only works with response\_format set to `json` and only with
the models `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, and `gpt-4o-mini-transcribe-2025-12-15`. This field is not supported when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) include > (schema)>)
known\_speaker\_names: Array[String]
Optional list of speaker names that correspond to the audio samples provided in `known\_speaker\_references[]`. Each entry should be a short identifier (for example `customer` or `agent`). Up to 4 speakers are supported.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) known_speaker_names > (schema)>)
known\_speaker\_references: Array[String]
Optional list of audio samples (as [data URLs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URLs)) that contain known speaker references matching `known\_speaker\_names[]`. Each sample must be between 2 and 10 seconds, and can use any of the same input audio formats supported by `file`.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) known_speaker_references > (schema)>)
language: String
The language of the input audio. Supplying the input language in [ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format will improve accuracy and latency.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) language > (schema)>)
prompt: String
An optional text to guide the model’s style or continue a previous audio segment. The [prompt](https://platform.openai.com/docs/guides/speech-to-text#prompting) should match the audio language. This field is not supported when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) prompt > (schema)>)
response\_format: [AudioResponseFormat](</api/reference/ruby/resources/audio#(resource) audio > (model) audio_response_format > (schema)>)
The format of the output, in one of these options: `json`, `text`, `srt`, `verbose\_json`, `vtt`, or `diarized\_json`. For `gpt-4o-transcribe` and `gpt-4o-mini-transcribe`, the only supported format is `json`. For `gpt-4o-transcribe-diarize`, the supported formats are `json`, `text`, and `diarized\_json`, with `diarized\_json` required to receive speaker annotations.
One of the following:
:json
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) response_format > (schema) + (resource) audio > (model) audio_response_format > (schema) > (member) 0>)
:text
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) response_format > (schema) + (resource) audio > (model) audio_response_format > (schema) > (member) 1>)
:srt
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) response_format > (schema) + (resource) audio > (model) audio_response_format > (schema) > (member) 2>)
:verbose\_json
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) response_format > (schema) + (resource) audio > (model) audio_response_format > (schema) > (member) 3>)
:vtt
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) response_format > (schema) + (resource) audio > (model) audio_response_format > (schema) > (member) 4>)
:diarized\_json
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) response_format > (schema) + (resource) audio > (model) audio_response_format > (schema) > (member) 5>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) response_format > (schema)>)
stream: bool
If set to true, the model response data will be streamed to the client
as it is generated using [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format).
See the [Streaming section of the Speech-to-Text guide](https://platform.openai.com/docs/guides/speech-to-text?lang=curl#streaming-transcriptions)
for more information.
Note: Streaming is not supported for the `whisper-1` model and will be ignored.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) stream > (schema)>)
temperature: Float
The sampling temperature, between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use [log probability](https://en.wikipedia.org/wiki/Log_probability) to automatically increase the temperature until certain thresholds are hit.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) temperature > (schema)>)
timestamp\_granularities: Array[:word | :segment]
The timestamp granularities to populate for this transcription. `response\_format` must be set `verbose\_json` to use timestamp granularities. Either or both of these options are supported: `word`, or `segment`. Note: There is no additional latency for segment timestamps, but generating word timestamps incurs additional latency.
This option is not available for `gpt-4o-transcribe-diarize`.
One of the following:
:word
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) timestamp_granularities > (schema) > (items) > (member) 0>)
:segment
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) timestamp_granularities > (schema) > (items) > (member) 1>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) timestamp_granularities > (schema)>)
##### ReturnsExpand Collapse
TranscriptionCreateResponse = [Transcription](</api/reference/ruby/resources/audio#(resource) audio.transcriptions > (model) transcription > (schema)>) { text, logprobs, usage } | [TranscriptionDiarized](</api/reference/ruby/resources/audio#(resource) audio.transcriptions > (model) transcription_diarized > (schema)>) { duration, segments, task, 2 more } | [TranscriptionVerbose](</api/reference/ruby/resources/audio#(resource) audio.transcriptions > (model) transcription_verbose > (schema)>) { duration, language, text, 3 more }
Represents a transcription response returned by model, based on the provided input.
One of the following:
class Transcription { text, logprobs, usage }
Represents a transcription response returned by model, based on the provided input.
text: String
The transcribed text.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) text>)
logprobs: Array[Logprob{ token, bytes, logprob}]
The log probabilities of the tokens in the transcription. Only returned with the models `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` if `logprobs` is added to the `include` array.
token: String
The token in the transcription.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) token>)
bytes: Array[Float]
The bytes of the token.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: Float
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs>)
usage: Tokens{ input\_tokens, output\_tokens, total\_tokens, 2 more} | Duration{ seconds, type}
Token usage statistics for the request.
One of the following:
class Tokens { input\_tokens, output\_tokens, total\_tokens, 2 more }
Usage statistics for models billed by token usage.
input\_tokens: Integer
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_tokens>)
output\_tokens: Integer
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) output_tokens>)
total\_tokens: Integer
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) total_tokens>)
type: :tokens
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) type>)
input\_token\_details: InputTokenDetails{ audio\_tokens, text\_tokens}
Details about the input tokens billed for this request.
audio\_tokens: Integer
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
text\_tokens: Integer
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0>)
class Duration { seconds, type }
Usage statistics for models billed by audio input duration.
seconds: Float
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1 > (property) seconds>)
type: :duration
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1 > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema)>)
class TranscriptionDiarized { duration, segments, task, 2 more }
Represents a diarized transcription response returned by the model, including the combined transcript and speaker-segment annotations.
duration: Float
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) duration>)
segments: Array[[TranscriptionDiarizedSegment](</api/reference/ruby/resources/audio#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema)>) { id, end\_, speaker, 3 more } ]
Segments of the transcript annotated with timestamps and speaker labels.
id: String
Unique identifier for the segment.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) id>)
end\_: Float
End timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) end>)
speaker: String
Speaker label for this segment. When known speakers are provided, the label matches `known\_speaker\_names[]`. Otherwise speakers are labeled sequentially using capital letters (`A`, `B`, …).
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) speaker>)
start: Float
Start timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) start>)
text: String
Transcript text for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) text>)
type: :"transcript.text.segment"
The type of the segment. Always `transcript.text.segment`.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) segments>)
task: :transcribe
The type of task that was run. Always `transcribe`.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) task>)
text: String
The concatenated transcript text for the entire audio input.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) text>)
usage: Tokens{ input\_tokens, output\_tokens, total\_tokens, 2 more} | Duration{ seconds, type}
Token or duration usage statistics for the request.
One of the following:
class Tokens { input\_tokens, output\_tokens, total\_tokens, 2 more }
Usage statistics for models billed by token usage.
input\_tokens: Integer
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_tokens>)
output\_tokens: Integer
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) output_tokens>)
total\_tokens: Integer
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) total_tokens>)
type: :tokens
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) type>)
input\_token\_details: InputTokenDetails{ audio\_tokens, text\_tokens}
Details about the input tokens billed for this request.
audio\_tokens: Integer
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
text\_tokens: Integer
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0>)
class Duration { seconds, type }
Usage statistics for models billed by audio input duration.
seconds: Float
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1 > (property) seconds>)
type: :duration
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1 > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema)>)
class TranscriptionVerbose { duration, language, text, 3 more }
Represents a verbose json transcription response returned by model, based on the provided input.
duration: Float
The duration of the input audio.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) duration>)
language: String
The language of the input audio.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) language>)
text: String
The transcribed text.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) text>)
segments: Array[[TranscriptionSegment](</api/reference/ruby/resources/audio#(resource) audio.transcriptions > (model) transcription_segment > (schema)>) { id, avg\_logprob, compression\_ratio, 7 more } ]
Segments of the transcribed text and their corresponding details.
id: Integer
Unique identifier of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) id>)
avg\_logprob: Float
Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) avg_logprob>)
compression\_ratio: Float
Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) compression_ratio>)
end\_: Float
End time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) end>)
no\_speech\_prob: Float
Probability of no speech in the segment. If the value is higher than 1.0 and the `avg\_logprob` is below -1, consider this segment silent.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) no_speech_prob>)
seek: Integer
Seek offset of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) seek>)
start: Float
Start time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) start>)
temperature: Float
Temperature parameter used for generating the segment.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) temperature>)
text: String
Text content of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) text>)
tokens: Array[Integer]
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) segments>)
usage: Usage{ seconds, type}
Usage statistics for models billed by audio input duration.
seconds: Float
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage > (property) seconds>)
type: :duration
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage>)
words: Array[[TranscriptionWord](</api/reference/ruby/resources/audio#(resource) audio.transcriptions > (model) transcription_word > (schema)>) { end\_, start, word } ]
Extracted words and their corresponding timestamps.
end\_: Float
End time of the word in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) end>)
start: Float
Start time of the word in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) start>)
word: String
The text content of the word.
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) word>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) words>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema)>)
[](<#(resource) audio.transcriptions > (model) transcription_create_response > (schema)>)
TranscriptionStreamEvent = [TranscriptionTextSegmentEvent](</api/reference/ruby/resources/audio#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema)>) { id, end\_, speaker, 3 more } | [TranscriptionTextDeltaEvent](</api/reference/ruby/resources/audio#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema)>) { delta, type, logprobs, segment\_id } | [TranscriptionTextDoneEvent](</api/reference/ruby/resources/audio#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema)>) { text, type, logprobs, usage }
Emitted when a diarized transcription returns a completed segment with speaker information. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with `stream` set to `true` and `response\_format` set to `diarized\_json`.
One of the following:
class TranscriptionTextSegmentEvent { id, end\_, speaker, 3 more }
Emitted when a diarized transcription returns a completed segment with speaker information. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with `stream` set to `true` and `response\_format` set to `diarized\_json`.
id: String
Unique identifier for the segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) id>)
end\_: Float
End timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) end>)
speaker: String
Speaker label for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) speaker>)
start: Float
Start timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) start>)
text: String
Transcript text for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) text>)
type: :"transcript.text.segment"
The type of the event. Always `transcript.text.segment`.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema)>)
class TranscriptionTextDeltaEvent { delta, type, logprobs, segment\_id }
Emitted when there is an additional text delta. This is also the first event emitted when the transcription starts. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
delta: String
The text delta that was additionally transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) delta>)
type: :"transcript.text.delta"
The type of the event. Always `transcript.text.delta`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) type>)
logprobs: Array[Logprob{ token, bytes, logprob}]
The log probabilities of the delta. Only included if you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
token: String
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) token>)
bytes: Array[Integer]
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: Float
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs>)
segment\_id: String
Identifier of the diarized segment that this delta belongs to. Only present when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) segment_id>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema)>)
class TranscriptionTextDoneEvent { text, type, logprobs, usage }
Emitted when the transcription is complete. Contains the complete transcription text. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
text: String
The text that was transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) text>)
type: :"transcript.text.done"
The type of the event. Always `transcript.text.done`.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) type>)
logprobs: Array[Logprob{ token, bytes, logprob}]
The log probabilities of the individual tokens in the transcription. Only included if you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
token: String
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) token>)
bytes: Array[Integer]
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: Float
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs>)
usage: Usage{ input\_tokens, output\_tokens, total\_tokens, 2 more}
Usage statistics for models billed by token usage.
input\_tokens: Integer
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_tokens>)
output\_tokens: Integer
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) output_tokens>)
total\_tokens: Integer
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) total_tokens>)
type: :tokens
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) type>)
input\_token\_details: InputTokenDetails{ audio\_tokens, text\_tokens}
Details about the input tokens billed for this request.
audio\_tokens: Integer
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) audio_tokens>)
text\_tokens: Integer
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema)>)
[](<#(resource) audio.transcriptions > (model) transcription_stream_event > (schema)>)
### Create transcription
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
transcription = openai.audio.transcriptions.create(file: StringIO.new("Example data"), model: :"gpt-4o-transcribe")
puts(transcription)`
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