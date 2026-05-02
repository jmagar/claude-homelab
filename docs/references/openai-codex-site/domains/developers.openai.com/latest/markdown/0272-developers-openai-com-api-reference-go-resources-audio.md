Audio | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Audio
##### ModelsExpand Collapse
type AudioModel string
One of the following:
const AudioModelWhisper1 [AudioModel](</api/reference/go/resources/audio#(resource) audio > (model) audio_model > (schema)>) = "whisper-1"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 0>)
const AudioModelGPT4oTranscribe [AudioModel](</api/reference/go/resources/audio#(resource) audio > (model) audio_model > (schema)>) = "gpt-4o-transcribe"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 1>)
const AudioModelGPT4oMiniTranscribe [AudioModel](</api/reference/go/resources/audio#(resource) audio > (model) audio_model > (schema)>) = "gpt-4o-mini-transcribe"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 2>)
const AudioModelGPT4oMiniTranscribe2025\_12\_15 [AudioModel](</api/reference/go/resources/audio#(resource) audio > (model) audio_model > (schema)>) = "gpt-4o-mini-transcribe-2025-12-15"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 3>)
const AudioModelGPT4oTranscribeDiarize [AudioModel](</api/reference/go/resources/audio#(resource) audio > (model) audio_model > (schema)>) = "gpt-4o-transcribe-diarize"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 4>)
[](<#(resource) audio > (model) audio_model > (schema)>)
type AudioResponseFormat string
The format of the output, in one of these options: `json`, `text`, `srt`, `verbose\_json`, `vtt`, or `diarized\_json`. For `gpt-4o-transcribe` and `gpt-4o-mini-transcribe`, the only supported format is `json`. For `gpt-4o-transcribe-diarize`, the supported formats are `json`, `text`, and `diarized\_json`, with `diarized\_json` required to receive speaker annotations.
One of the following:
const AudioResponseFormatJSON [AudioResponseFormat](</api/reference/go/resources/audio#(resource) audio > (model) audio_response_format > (schema)>) = "json"
[](<#(resource) audio > (model) audio_response_format > (schema) > (member) 0>)
const AudioResponseFormatText [AudioResponseFormat](</api/reference/go/resources/audio#(resource) audio > (model) audio_response_format > (schema)>) = "text"
[](<#(resource) audio > (model) audio_response_format > (schema) > (member) 1>)
const AudioResponseFormatSRT [AudioResponseFormat](</api/reference/go/resources/audio#(resource) audio > (model) audio_response_format > (schema)>) = "srt"
[](<#(resource) audio > (model) audio_response_format > (schema) > (member) 2>)
const AudioResponseFormatVerboseJSON [AudioResponseFormat](</api/reference/go/resources/audio#(resource) audio > (model) audio_response_format > (schema)>) = "verbose\_json"
[](<#(resource) audio > (model) audio_response_format > (schema) > (member) 3>)
const AudioResponseFormatVTT [AudioResponseFormat](</api/reference/go/resources/audio#(resource) audio > (model) audio_response_format > (schema)>) = "vtt"
[](<#(resource) audio > (model) audio_response_format > (schema) > (member) 4>)
const AudioResponseFormatDiarizedJSON [AudioResponseFormat](</api/reference/go/resources/audio#(resource) audio > (model) audio_response_format > (schema)>) = "diarized\_json"
[](<#(resource) audio > (model) audio_response_format > (schema) > (member) 5>)
[](<#(resource) audio > (model) audio_response_format > (schema)>)
#### AudioTranscriptions
Turn audio into text or text into audio.
##### [Create transcription](/api/reference/go/resources/audio/subresources/transcriptions/methods/create)
client.Audio.Transcriptions.New(ctx, body) (\*[AudioTranscriptionNewResponseUnion](</api/reference/go/resources/audio#(resource) audio.transcriptions > (model) AudioTranscriptionNewResponse > (schema)>), error)
POST/audio/transcriptions
##### ModelsExpand Collapse
type Transcription struct{…}
Represents a transcription response returned by model, based on the provided input.
Text string
The transcribed text.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) text>)
Logprobs []TranscriptionLogprobOptional
The log probabilities of the tokens in the transcription. Only returned with the models `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` if `logprobs` is added to the `include` array.
Token stringOptional
The token in the transcription.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) token>)
Bytes []float64Optional
The bytes of the token.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) bytes>)
Logprob float64Optional
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs>)
Usage TranscriptionUsageUnionOptional
Token usage statistics for the request.
One of the following:
type TranscriptionUsageTokens struct{…}
Usage statistics for models billed by token usage.
InputTokens int64
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_tokens>)
OutputTokens int64
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) output_tokens>)
TotalTokens int64
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) total_tokens>)
Type Tokens
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) type>)
InputTokenDetails TranscriptionUsageTokensInputTokenDetailsOptional
Details about the input tokens billed for this request.
AudioTokens int64Optional
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
TextTokens int64Optional
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0>)
type TranscriptionUsageDuration struct{…}
Usage statistics for models billed by audio input duration.
Seconds float64
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1 > (property) seconds>)
Type Duration
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1 > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema)>)
type TranscriptionDiarized struct{…}
Represents a diarized transcription response returned by the model, including the combined transcript and speaker-segment annotations.
Duration float64
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) duration>)
Segments [][TranscriptionDiarizedSegment](</api/reference/go/resources/audio#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema)>)
Segments of the transcript annotated with timestamps and speaker labels.
ID string
Unique identifier for the segment.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) id>)
End float64
End timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) end>)
Speaker string
Speaker label for this segment. When known speakers are provided, the label matches `known\_speaker\_names[]`. Otherwise speakers are labeled sequentially using capital letters (`A`, `B`, …).
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) speaker>)
Start float64
Start timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) start>)
Text string
Transcript text for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) text>)
Type TranscriptTextSegment
The type of the segment. Always `transcript.text.segment`.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) segments>)
Task Transcribe
The type of task that was run. Always `transcribe`.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) task>)
Text string
The concatenated transcript text for the entire audio input.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) text>)
Usage TranscriptionDiarizedUsageUnionOptional
Token or duration usage statistics for the request.
One of the following:
TranscriptionDiarizedUsageTokens
InputTokens int64
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_tokens>)
OutputTokens int64
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) output_tokens>)
TotalTokens int64
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) total_tokens>)
Type Tokens
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) type>)
InputTokenDetails TranscriptionDiarizedUsageTokensInputTokenDetailsOptional
Details about the input tokens billed for this request.
AudioTokens int64Optional
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
TextTokens int64Optional
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0>)
TranscriptionDiarizedUsageDuration
Seconds float64
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1 > (property) seconds>)
Type Duration
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1 > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema)>)
type TranscriptionDiarizedSegment struct{…}
A segment of diarized transcript text with speaker metadata.
ID string
Unique identifier for the segment.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) id>)
End float64
End timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) end>)
Speaker string
Speaker label for this segment. When known speakers are provided, the label matches `known\_speaker\_names[]`. Otherwise speakers are labeled sequentially using capital letters (`A`, `B`, …).
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) speaker>)
Start float64
Start timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) start>)
Text string
Transcript text for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) text>)
Type TranscriptTextSegment
The type of the segment. Always `transcript.text.segment`.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema)>)
type TranscriptionInclude string
[](<#(resource) audio.transcriptions > (model) transcription_include > (schema)>)
type TranscriptionSegment struct{…}
ID int64
Unique identifier of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) id>)
AvgLogprob float64
Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) avg_logprob>)
CompressionRatio float64
Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) compression_ratio>)
End float64
End time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) end>)
NoSpeechProb float64
Probability of no speech in the segment. If the value is higher than 1.0 and the `avg\_logprob` is below -1, consider this segment silent.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) no_speech_prob>)
Seek int64
Seek offset of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) seek>)
Start float64
Start time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) start>)
Temperature float64
Temperature parameter used for generating the segment.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) temperature>)
Text string
Text content of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) text>)
Tokens []int64
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema)>)
type TranscriptionStreamEventUnion interface{…}
Emitted when a diarized transcription returns a completed segment with speaker information. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with `stream` set to `true` and `response\_format` set to `diarized\_json`.
One of the following:
type TranscriptionTextSegmentEvent struct{…}
Emitted when a diarized transcription returns a completed segment with speaker information. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with `stream` set to `true` and `response\_format` set to `diarized\_json`.
ID string
Unique identifier for the segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) id>)
End float64
End timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) end>)
Speaker string
Speaker label for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) speaker>)
Start float64
Start timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) start>)
Text string
Transcript text for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) text>)
Type TranscriptTextSegment
The type of the event. Always `transcript.text.segment`.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema)>)
type TranscriptionTextDeltaEvent struct{…}
Emitted when there is an additional text delta. This is also the first event emitted when the transcription starts. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
Delta string
The text delta that was additionally transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) delta>)
Type TranscriptTextDelta
The type of the event. Always `transcript.text.delta`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) type>)
Logprobs []TranscriptionTextDeltaEventLogprobOptional
The log probabilities of the delta. Only included if you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
Token stringOptional
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) token>)
Bytes []int64Optional
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) bytes>)
Logprob float64Optional
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs>)
SegmentID stringOptional
Identifier of the diarized segment that this delta belongs to. Only present when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) segment_id>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema)>)
type TranscriptionTextDoneEvent struct{…}
Emitted when the transcription is complete. Contains the complete transcription text. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
Text string
The text that was transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) text>)
Type TranscriptTextDone
The type of the event. Always `transcript.text.done`.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) type>)
Logprobs []TranscriptionTextDoneEventLogprobOptional
The log probabilities of the individual tokens in the transcription. Only included if you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
Token stringOptional
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) token>)
Bytes []int64Optional
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) bytes>)
Logprob float64Optional
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs>)
Usage TranscriptionTextDoneEventUsageOptional
Usage statistics for models billed by token usage.
InputTokens int64
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_tokens>)
OutputTokens int64
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) output_tokens>)
TotalTokens int64
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) total_tokens>)
Type Tokens
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) type>)
InputTokenDetails TranscriptionTextDoneEventUsageInputTokenDetailsOptional
Details about the input tokens billed for this request.
AudioTokens int64Optional
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) audio_tokens>)
TextTokens int64Optional
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema)>)
[](<#(resource) audio.transcriptions > (model) transcription_stream_event > (schema)>)
type TranscriptionTextDeltaEvent struct{…}
Emitted when there is an additional text delta. This is also the first event emitted when the transcription starts. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
Delta string
The text delta that was additionally transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) delta>)
Type TranscriptTextDelta
The type of the event. Always `transcript.text.delta`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) type>)
Logprobs []TranscriptionTextDeltaEventLogprobOptional
The log probabilities of the delta. Only included if you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
Token stringOptional
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) token>)
Bytes []int64Optional
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) bytes>)
Logprob float64Optional
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs>)
SegmentID stringOptional
Identifier of the diarized segment that this delta belongs to. Only present when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) segment_id>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema)>)
type TranscriptionTextDoneEvent struct{…}
Emitted when the transcription is complete. Contains the complete transcription text. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
Text string
The text that was transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) text>)
Type TranscriptTextDone
The type of the event. Always `transcript.text.done`.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) type>)
Logprobs []TranscriptionTextDoneEventLogprobOptional
The log probabilities of the individual tokens in the transcription. Only included if you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
Token stringOptional
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) token>)
Bytes []int64Optional
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) bytes>)
Logprob float64Optional
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs>)
Usage TranscriptionTextDoneEventUsageOptional
Usage statistics for models billed by token usage.
InputTokens int64
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_tokens>)
OutputTokens int64
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) output_tokens>)
TotalTokens int64
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) total_tokens>)
Type Tokens
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) type>)
InputTokenDetails TranscriptionTextDoneEventUsageInputTokenDetailsOptional
Details about the input tokens billed for this request.
AudioTokens int64Optional
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) audio_tokens>)
TextTokens int64Optional
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema)>)
type TranscriptionTextSegmentEvent struct{…}
Emitted when a diarized transcription returns a completed segment with speaker information. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with `stream` set to `true` and `response\_format` set to `diarized\_json`.
ID string
Unique identifier for the segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) id>)
End float64
End timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) end>)
Speaker string
Speaker label for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) speaker>)
Start float64
Start timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) start>)
Text string
Transcript text for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) text>)
Type TranscriptTextSegment
The type of the event. Always `transcript.text.segment`.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema)>)
type TranscriptionVerbose struct{…}
Represents a verbose json transcription response returned by model, based on the provided input.
Duration float64
The duration of the input audio.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) duration>)
Language string
The language of the input audio.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) language>)
Text string
The transcribed text.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) text>)
Segments [][TranscriptionSegment](</api/reference/go/resources/audio#(resource) audio.transcriptions > (model) transcription_segment > (schema)>)Optional
Segments of the transcribed text and their corresponding details.
ID int64
Unique identifier of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) id>)
AvgLogprob float64
Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) avg_logprob>)
CompressionRatio float64
Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) compression_ratio>)
End float64
End time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) end>)
NoSpeechProb float64
Probability of no speech in the segment. If the value is higher than 1.0 and the `avg\_logprob` is below -1, consider this segment silent.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) no_speech_prob>)
Seek int64
Seek offset of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) seek>)
Start float64
Start time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) start>)
Temperature float64
Temperature parameter used for generating the segment.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) temperature>)
Text string
Text content of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) text>)
Tokens []int64
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) segments>)
Usage TranscriptionVerboseUsageOptional
Usage statistics for models billed by audio input duration.
Seconds float64
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage > (property) seconds>)
Type Duration
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage>)
Words [][TranscriptionWord](</api/reference/go/resources/audio#(resource) audio.transcriptions > (model) transcription_word > (schema)>)Optional
Extracted words and their corresponding timestamps.
End float64
End time of the word in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) end>)
Start float64
Start time of the word in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) start>)
Word string
The text content of the word.
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) word>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) words>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema)>)
type TranscriptionWord struct{…}
End float64
End time of the word in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) end>)
Start float64
Start time of the word in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) start>)
Word string
The text content of the word.
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) word>)
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema)>)
#### AudioTranslations
Turn audio into text or text into audio.
##### [Create translation](/api/reference/go/resources/audio/subresources/translations/methods/create)
client.Audio.Translations.New(ctx, body) (\*[Translation](</api/reference/go/resources/audio#(resource) audio.translations > (model) translation > (schema)>), error)
POST/audio/translations
##### ModelsExpand Collapse
type Translation struct{…}
Text string
[](<#(resource) audio.translations > (model) translation > (schema) > (property) text>)
[](<#(resource) audio.translations > (model) translation > (schema)>)
type TranslationVerbose struct{…}
Duration float64
The duration of the input audio.
formatdouble
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) duration>)
Language string
The language of the output translation (always `english`).
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) language>)
Text string
The translated text.
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) text>)
Segments [][TranscriptionSegment](</api/reference/go/resources/audio#(resource) audio.transcriptions > (model) transcription_segment > (schema)>)Optional
Segments of the translated text and their corresponding details.
ID int64
Unique identifier of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) id>)
AvgLogprob float64
Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) avg_logprob>)
CompressionRatio float64
Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) compression_ratio>)
End float64
End time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) end>)
NoSpeechProb float64
Probability of no speech in the segment. If the value is higher than 1.0 and the `avg\_logprob` is below -1, consider this segment silent.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) no_speech_prob>)
Seek int64
Seek offset of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) seek>)
Start float64
Start time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) start>)
Temperature float64
Temperature parameter used for generating the segment.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) temperature>)
Text string
Text content of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) text>)
Tokens []int64
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) segments>)
[](<#(resource) audio.translations > (model) translation_verbose > (schema)>)
#### AudioSpeech
Turn audio into text or text into audio.
##### [Create speech](/api/reference/go/resources/audio/subresources/speech/methods/create)
client.Audio.Speech.New(ctx, body) (\*Response, error)
POST/audio/speech
##### ModelsExpand Collapse
type SpeechModel string
One of the following:
const SpeechModelTTS1 [SpeechModel](</api/reference/go/resources/audio#(resource) audio.speech > (model) speech_model > (schema)>) = "tts-1"
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 0>)
const SpeechModelTTS1HD [SpeechModel](</api/reference/go/resources/audio#(resource) audio.speech > (model) speech_model > (schema)>) = "tts-1-hd"
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 1>)
const SpeechModelGPT4oMiniTTS [SpeechModel](</api/reference/go/resources/audio#(resource) audio.speech > (model) speech_model > (schema)>) = "gpt-4o-mini-tts"
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 2>)
const SpeechModelGPT4oMiniTTS2025\_12\_15 [SpeechModel](</api/reference/go/resources/audio#(resource) audio.speech > (model) speech_model > (schema)>) = "gpt-4o-mini-tts-2025-12-15"
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 3>)
[](<#(resource) audio.speech > (model) speech_model > (schema)>)
#### AudioVoices
Turn audio into text or text into audio.
#### AudioVoice Consents
Turn audio into text or text into audio.