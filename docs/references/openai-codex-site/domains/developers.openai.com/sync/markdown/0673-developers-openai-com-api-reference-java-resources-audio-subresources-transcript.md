Create transcription | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Audio](/api/reference/java/resources/audio)
[Transcriptions](/api/reference/java/resources/audio/subresources/transcriptions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create transcription
[TranscriptionCreateResponse](</api/reference/java/resources/audio#(resource) audio.transcriptions > (model) TranscriptionCreateResponse > (schema)>) audio().transcriptions().create(TranscriptionCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/audio/transcriptions
Transcribes audio into the input language.
Returns a transcription object in `json`, `diarized\_json`, or `verbose\_json`
format, or a stream of transcript events.
##### ParametersExpand Collapse
TranscriptionCreateParams params
InputStream file
The audio file object (not file name) to transcribe, in one of these formats: flac, mp3, mp4, mpeg, mpga, m4a, ogg, wav, or webm.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) file>)
[AudioModel](</api/reference/java/resources/audio#(resource) audio > (model) audio_model > (schema)>) model
ID of the model to use. The options are `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `whisper-1` (which is powered by our open source Whisper V2 model), and `gpt-4o-transcribe-diarize`.
WHISPER\_1("whisper-1")
[](<#(resource) audio > (model) audio_model > (schema) > (member) 0>)
GPT\_4O\_TRANSCRIBE("gpt-4o-transcribe")
[](<#(resource) audio > (model) audio_model > (schema) > (member) 1>)
GPT\_4O\_MINI\_TRANSCRIBE("gpt-4o-mini-transcribe")
[](<#(resource) audio > (model) audio_model > (schema) > (member) 2>)
GPT\_4O\_MINI\_TRANSCRIBE\_2025\_12\_15("gpt-4o-mini-transcribe-2025-12-15")
[](<#(resource) audio > (model) audio_model > (schema) > (member) 3>)
GPT\_4O\_TRANSCRIBE\_DIARIZE("gpt-4o-transcribe-diarize")
[](<#(resource) audio > (model) audio_model > (schema) > (member) 4>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) model>)
Optional\<ChunkingStrategy\> chunkingStrategy
Controls how the audio is cut into chunks. When set to `"auto"`, the server first normalizes loudness and then uses voice activity detection (VAD) to choose boundaries. `server\_vad` object can be provided to tweak VAD detection parameters manually. If unset, the audio is transcribed as a single block. Required when using `gpt-4o-transcribe-diarize` for inputs longer than 30 seconds.
JsonValue;
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) chunking_strategy > (variant) 0>)
class VadConfig:
Type type
Must be set to `server\_vad` to enable manual chunking using server side VAD.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) chunking_strategy > (variant) 1 > (property) type>)
Optional\<Long\> prefixPaddingMs
Amount of audio to include before the VAD detected speech (in
milliseconds).
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) chunking_strategy > (variant) 1 > (property) prefix_padding_ms>)
Optional\<Long\> silenceDurationMs
Duration of silence to detect speech stop (in milliseconds).
With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) chunking_strategy > (variant) 1 > (property) silence_duration_ms>)
Optional\<Double\> threshold
Sensitivity threshold (0.0 to 1.0) for voice activity detection. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) chunking_strategy > (variant) 1 > (property) threshold>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) chunking_strategy > (variant) 1>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) chunking_strategy>)
Optional\<List\<[TranscriptionInclude](</api/reference/java/resources/audio#(resource) audio.transcriptions > (model) transcription_include > (schema)>)\>\> include
Additional information to include in the transcription response.
`logprobs` will return the log probabilities of the tokens in the
response to understand the model’s confidence in the transcription.
`logprobs` only works with response\_format set to `json` and only with
the models `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, and `gpt-4o-mini-transcribe-2025-12-15`. This field is not supported when using `gpt-4o-transcribe-diarize`.
LOGPROBS("logprobs")
[](<#(resource) audio.transcriptions > (model) transcription_include > (schema) > (member) 0>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) include>)
Optional\<List\<String\>\> knownSpeakerNames
Optional list of speaker names that correspond to the audio samples provided in `known\_speaker\_references[]`. Each entry should be a short identifier (for example `customer` or `agent`). Up to 4 speakers are supported.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) known_speaker_names>)
Optional\<List\<String\>\> knownSpeakerReferences
Optional list of audio samples (as [data URLs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URLs)) that contain known speaker references matching `known\_speaker\_names[]`. Each sample must be between 2 and 10 seconds, and can use any of the same input audio formats supported by `file`.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) known_speaker_references>)
Optional\<String\> language
The language of the input audio. Supplying the input language in [ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format will improve accuracy and latency.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) language>)
Optional\<String\> prompt
An optional text to guide the model’s style or continue a previous audio segment. The [prompt](https://platform.openai.com/docs/guides/speech-to-text#prompting) should match the audio language. This field is not supported when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) prompt>)
Optional\<[AudioResponseFormat](</api/reference/java/resources/audio#(resource) audio > (model) audio_response_format > (schema)>)\> responseFormat
The format of the output, in one of these options: `json`, `text`, `srt`, `verbose\_json`, `vtt`, or `diarized\_json`. For `gpt-4o-transcribe` and `gpt-4o-mini-transcribe`, the only supported format is `json`. For `gpt-4o-transcribe-diarize`, the supported formats are `json`, `text`, and `diarized\_json`, with `diarized\_json` required to receive speaker annotations.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) response_format>)
Optional\<Double\> temperature
The sampling temperature, between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use [log probability](https://en.wikipedia.org/wiki/Log_probability) to automatically increase the temperature until certain thresholds are hit.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) temperature>)
Optional\<List\<TimestampGranularity\>\> timestampGranularities
The timestamp granularities to populate for this transcription. `response\_format` must be set `verbose\_json` to use timestamp granularities. Either or both of these options are supported: `word`, or `segment`. Note: There is no additional latency for segment timestamps, but generating word timestamps incurs additional latency.
This option is not available for `gpt-4o-transcribe-diarize`.
WORD("word")
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) timestamp_granularities > (items) > (member) 0>)
SEGMENT("segment")
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) timestamp_granularities > (items) > (member) 1>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) timestamp_granularities>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming>)
##### ReturnsExpand Collapse
class TranscriptionCreateResponse: A class that can be one of several variants.union
Represents a transcription response returned by model, based on the provided input.
class Transcription:
Represents a transcription response returned by model, based on the provided input.
String text
The transcribed text.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) text>)
Optional\<List\<Logprob\>\> logprobs
The log probabilities of the tokens in the transcription. Only returned with the models `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` if `logprobs` is added to the `include` array.
Optional\<String\> token
The token in the transcription.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) token>)
Optional\<List\<Double\>\> bytes
The bytes of the token.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) bytes>)
Optional\<Double\> logprob
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs>)
Optional\<Usage\> usage
Token usage statistics for the request.
One of the following:
class Tokens:
Usage statistics for models billed by token usage.
long inputTokens
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_tokens>)
long outputTokens
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) output_tokens>)
long totalTokens
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) total_tokens>)
JsonValue; type "tokens"constant"tokens"constant
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) type>)
Optional\<InputTokenDetails\> inputTokenDetails
Details about the input tokens billed for this request.
Optional\<Long\> audioTokens
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
Optional\<Long\> textTokens
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0>)
class Duration:
Usage statistics for models billed by audio input duration.
double seconds
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1 > (property) seconds>)
JsonValue; type "duration"constant"duration"constant
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1 > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema)>)
class TranscriptionDiarized:
Represents a diarized transcription response returned by the model, including the combined transcript and speaker-segment annotations.
double duration
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) duration>)
List\<[TranscriptionDiarizedSegment](</api/reference/java/resources/audio#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema)>)\> segments
Segments of the transcript annotated with timestamps and speaker labels.
String id
Unique identifier for the segment.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) id>)
double end
End timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) end>)
String speaker
Speaker label for this segment. When known speakers are provided, the label matches `known\_speaker\_names[]`. Otherwise speakers are labeled sequentially using capital letters (`A`, `B`, …).
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) speaker>)
double start
Start timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) start>)
String text
Transcript text for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) text>)
JsonValue; type "transcript.text.segment"constant"transcript.text.segment"constant
The type of the segment. Always `transcript.text.segment`.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) segments>)
JsonValue; task "transcribe"constant"transcribe"constant
The type of task that was run. Always `transcribe`.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) task>)
String text
The concatenated transcript text for the entire audio input.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) text>)
Optional\<Usage\> usage
Token or duration usage statistics for the request.
One of the following:
class Tokens:
Usage statistics for models billed by token usage.
long inputTokens
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_tokens>)
long outputTokens
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) output_tokens>)
long totalTokens
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) total_tokens>)
JsonValue; type "tokens"constant"tokens"constant
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) type>)
Optional\<InputTokenDetails\> inputTokenDetails
Details about the input tokens billed for this request.
Optional\<Long\> audioTokens
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
Optional\<Long\> textTokens
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0>)
class Duration:
Usage statistics for models billed by audio input duration.
double seconds
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1 > (property) seconds>)
JsonValue; type "duration"constant"duration"constant
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1 > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema)>)
class TranscriptionVerbose:
Represents a verbose json transcription response returned by model, based on the provided input.
double duration
The duration of the input audio.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) duration>)
String language
The language of the input audio.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) language>)
String text
The transcribed text.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) text>)
Optional\<List\<[TranscriptionSegment](</api/reference/java/resources/audio#(resource) audio.transcriptions > (model) transcription_segment > (schema)>)\>\> segments
Segments of the transcribed text and their corresponding details.
long id
Unique identifier of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) id>)
double avgLogprob
Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) avg_logprob>)
double compressionRatio
Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) compression_ratio>)
double end
End time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) end>)
double noSpeechProb
Probability of no speech in the segment. If the value is higher than 1.0 and the `avg\_logprob` is below -1, consider this segment silent.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) no_speech_prob>)
long seek
Seek offset of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) seek>)
double start
Start time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) start>)
double temperature
Temperature parameter used for generating the segment.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) temperature>)
String text
Text content of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) text>)
List\<long\> tokens
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) segments>)
Optional\<Usage\> usage
Usage statistics for models billed by audio input duration.
double seconds
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage > (property) seconds>)
JsonValue; type "duration"constant"duration"constant
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage>)
Optional\<List\<[TranscriptionWord](</api/reference/java/resources/audio#(resource) audio.transcriptions > (model) transcription_word > (schema)>)\>\> words
Extracted words and their corresponding timestamps.
double end
End time of the word in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) end>)
double start
Start time of the word in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) start>)
String word
The text content of the word.
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) word>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) words>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema)>)
[](<#(resource) audio.transcriptions > (model) TranscriptionCreateResponse > (schema)>)
class TranscriptionStreamEvent: A class that can be one of several variants.union
Emitted when a diarized transcription returns a completed segment with speaker information. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with `stream` set to `true` and `response\_format` set to `diarized\_json`.
class TranscriptionTextSegmentEvent:
Emitted when a diarized transcription returns a completed segment with speaker information. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with `stream` set to `true` and `response\_format` set to `diarized\_json`.
String id
Unique identifier for the segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) id>)
double end
End timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) end>)
String speaker
Speaker label for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) speaker>)
double start
Start timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) start>)
String text
Transcript text for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) text>)
JsonValue; type "transcript.text.segment"constant"transcript.text.segment"constant
The type of the event. Always `transcript.text.segment`.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema)>)
class TranscriptionTextDeltaEvent:
Emitted when there is an additional text delta. This is also the first event emitted when the transcription starts. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
String delta
The text delta that was additionally transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) delta>)
JsonValue; type "transcript.text.delta"constant"transcript.text.delta"constant
The type of the event. Always `transcript.text.delta`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) type>)
Optional\<List\<Logprob\>\> logprobs
The log probabilities of the delta. Only included if you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
Optional\<String\> token
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) token>)
Optional\<List\<Long\>\> bytes
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) bytes>)
Optional\<Double\> logprob
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs>)
Optional\<String\> segmentId
Identifier of the diarized segment that this delta belongs to. Only present when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) segment_id>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema)>)
class TranscriptionTextDoneEvent:
Emitted when the transcription is complete. Contains the complete transcription text. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
String text
The text that was transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) text>)
JsonValue; type "transcript.text.done"constant"transcript.text.done"constant
The type of the event. Always `transcript.text.done`.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) type>)
Optional\<List\<Logprob\>\> logprobs
The log probabilities of the individual tokens in the transcription. Only included if you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
Optional\<String\> token
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) token>)
Optional\<List\<Long\>\> bytes
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) bytes>)
Optional\<Double\> logprob
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs>)
Optional\<Usage\> usage
Usage statistics for models billed by token usage.
long inputTokens
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_tokens>)
long outputTokens
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) output_tokens>)
long totalTokens
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) total_tokens>)
JsonValue; type "tokens"constant"tokens"constant
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) type>)
Optional\<InputTokenDetails\> inputTokenDetails
Details about the input tokens billed for this request.
Optional\<Long\> audioTokens
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) audio_tokens>)
Optional\<Long\> textTokens
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema)>)
[](<#(resource) audio.transcriptions > (model) transcription_stream_event > (schema)>)
### Create transcription
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.audio.AudioModel;
import com.openai.models.audio.transcriptions.TranscriptionCreateParams;
import com.openai.models.audio.transcriptions.TranscriptionCreateResponse;
import java.io.ByteArrayInputStream;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
TranscriptionCreateParams params = TranscriptionCreateParams.builder()
.file(new ByteArrayInputStream("Example data".getBytes()))
.model(AudioModel.GPT\_4O\_TRANSCRIBE)
.build();
TranscriptionCreateResponse transcription = client.audio().transcriptions().create(params);
}
}`
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