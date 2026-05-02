Transcriptions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Audio](/api/reference/resources/audio)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Transcriptions
Turn audio into text or text into audio.
##### [Create transcription](/api/reference/resources/audio/subresources/transcriptions/methods/create)
POST/audio/transcriptions
##### ModelsExpand Collapse
Transcription object { text, logprobs, usage }
Represents a transcription response returned by model, based on the provided input.
text: string
The transcribed text.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) text>)
logprobs: optional array of object { token, bytes, logprob }
The log probabilities of the tokens in the transcription. Only returned with the models `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` if `logprobs` is added to the `include` array.
token: optional string
The token in the transcription.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) token>)
bytes: optional array of number
The bytes of the token.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: optional number
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs>)
usage: optional object { input\_tokens, output\_tokens, total\_tokens, 2 more } or object { seconds, type }
Token usage statistics for the request.
One of the following:
TokenUsage object { input\_tokens, output\_tokens, total\_tokens, 2 more }
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
input\_token\_details: optional object { audio\_tokens, text\_tokens }
Details about the input tokens billed for this request.
audio\_tokens: optional number
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
text\_tokens: optional number
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0>)
DurationUsage object { seconds, type }
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
TranscriptionDiarized object { duration, segments, task, 2 more }
Represents a diarized transcription response returned by the model, including the combined transcript and speaker-segment annotations.
duration: number
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) duration>)
segments: array of [TranscriptionDiarizedSegment](</api/reference/resources/audio#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema)>) { id, end, speaker, 3 more }
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
usage: optional object { input\_tokens, output\_tokens, total\_tokens, 2 more } or object { seconds, type }
Token or duration usage statistics for the request.
One of the following:
Tokens object { input\_tokens, output\_tokens, total\_tokens, 2 more }
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
input\_token\_details: optional object { audio\_tokens, text\_tokens }
Details about the input tokens billed for this request.
audio\_tokens: optional number
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
text\_tokens: optional number
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0>)
Duration object { seconds, type }
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
TranscriptionDiarizedSegment object { id, end, speaker, 3 more }
A segment of diarized transcript text with speaker metadata.
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
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema)>)
TranscriptionInclude = "logprobs"
[](<#(resource) audio.transcriptions > (model) transcription_include > (schema)>)
TranscriptionSegment object { id, avg\_logprob, compression\_ratio, 7 more }
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
tokens: array of number
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema)>)
TranscriptionStreamEvent = [TranscriptionTextSegmentEvent](</api/reference/resources/audio#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema)>) { id, end, speaker, 3 more } or [TranscriptionTextDeltaEvent](</api/reference/resources/audio#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema)>) { delta, type, logprobs, segment\_id } or [TranscriptionTextDoneEvent](</api/reference/resources/audio#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema)>) { text, type, logprobs, usage }
Emitted when a diarized transcription returns a completed segment with speaker information. Only emitted when you [create a transcription](/docs/api-reference/audio/create-transcription) with `stream` set to `true` and `response\_format` set to `diarized\_json`.
One of the following:
TranscriptionTextSegmentEvent object { id, end, speaker, 3 more }
Emitted when a diarized transcription returns a completed segment with speaker information. Only emitted when you [create a transcription](/docs/api-reference/audio/create-transcription) with `stream` set to `true` and `response\_format` set to `diarized\_json`.
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
TranscriptionTextDeltaEvent object { delta, type, logprobs, segment\_id }
Emitted when there is an additional text delta. This is also the first event emitted when the transcription starts. Only emitted when you [create a transcription](/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
delta: string
The text delta that was additionally transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) delta>)
type: "transcript.text.delta"
The type of the event. Always `transcript.text.delta`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) type>)
logprobs: optional array of object { token, bytes, logprob }
The log probabilities of the delta. Only included if you [create a transcription](/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
token: optional string
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) token>)
bytes: optional array of number
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: optional number
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs>)
segment\_id: optional string
Identifier of the diarized segment that this delta belongs to. Only present when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) segment_id>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema)>)
TranscriptionTextDoneEvent object { text, type, logprobs, usage }
Emitted when the transcription is complete. Contains the complete transcription text. Only emitted when you [create a transcription](/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
text: string
The text that was transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) text>)
type: "transcript.text.done"
The type of the event. Always `transcript.text.done`.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) type>)
logprobs: optional array of object { token, bytes, logprob }
The log probabilities of the individual tokens in the transcription. Only included if you [create a transcription](/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
token: optional string
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) token>)
bytes: optional array of number
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: optional number
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs>)
usage: optional object { input\_tokens, output\_tokens, total\_tokens, 2 more }
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
input\_token\_details: optional object { audio\_tokens, text\_tokens }
Details about the input tokens billed for this request.
audio\_tokens: optional number
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) audio_tokens>)
text\_tokens: optional number
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema)>)
[](<#(resource) audio.transcriptions > (model) transcription_stream_event > (schema)>)
TranscriptionTextDeltaEvent object { delta, type, logprobs, segment\_id }
Emitted when there is an additional text delta. This is also the first event emitted when the transcription starts. Only emitted when you [create a transcription](/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
delta: string
The text delta that was additionally transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) delta>)
type: "transcript.text.delta"
The type of the event. Always `transcript.text.delta`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) type>)
logprobs: optional array of object { token, bytes, logprob }
The log probabilities of the delta. Only included if you [create a transcription](/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
token: optional string
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) token>)
bytes: optional array of number
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: optional number
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs>)
segment\_id: optional string
Identifier of the diarized segment that this delta belongs to. Only present when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) segment_id>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema)>)
TranscriptionTextDoneEvent object { text, type, logprobs, usage }
Emitted when the transcription is complete. Contains the complete transcription text. Only emitted when you [create a transcription](/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
text: string
The text that was transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) text>)
type: "transcript.text.done"
The type of the event. Always `transcript.text.done`.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) type>)
logprobs: optional array of object { token, bytes, logprob }
The log probabilities of the individual tokens in the transcription. Only included if you [create a transcription](/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
token: optional string
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) token>)
bytes: optional array of number
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: optional number
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs>)
usage: optional object { input\_tokens, output\_tokens, total\_tokens, 2 more }
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
input\_token\_details: optional object { audio\_tokens, text\_tokens }
Details about the input tokens billed for this request.
audio\_tokens: optional number
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) audio_tokens>)
text\_tokens: optional number
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema)>)
TranscriptionTextSegmentEvent object { id, end, speaker, 3 more }
Emitted when a diarized transcription returns a completed segment with speaker information. Only emitted when you [create a transcription](/docs/api-reference/audio/create-transcription) with `stream` set to `true` and `response\_format` set to `diarized\_json`.
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
TranscriptionVerbose object { duration, language, text, 3 more }
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
segments: optional array of [TranscriptionSegment](</api/reference/resources/audio#(resource) audio.transcriptions > (model) transcription_segment > (schema)>) { id, avg\_logprob, compression\_ratio, 7 more }
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
tokens: array of number
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) segments>)
usage: optional object { seconds, type }
Usage statistics for models billed by audio input duration.
seconds: number
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage > (property) seconds>)
type: "duration"
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage>)
words: optional array of [TranscriptionWord](</api/reference/resources/audio#(resource) audio.transcriptions > (model) transcription_word > (schema)>) { end, start, word }
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
TranscriptionWord object { end, start, word }
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
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema)>)
TranscriptionCreateResponse = [Transcription](</api/reference/resources/audio#(resource) audio.transcriptions > (model) transcription > (schema)>) { text, logprobs, usage } or [TranscriptionDiarized](</api/reference/resources/audio#(resource) audio.transcriptions > (model) transcription_diarized > (schema)>) { duration, segments, task, 2 more } or [TranscriptionVerbose](</api/reference/resources/audio#(resource) audio.transcriptions > (model) transcription_verbose > (schema)>) { duration, language, text, 3 more }
Represents a transcription response returned by model, based on the provided input.
One of the following:
Transcription object { text, logprobs, usage }
Represents a transcription response returned by model, based on the provided input.
text: string
The transcribed text.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) text>)
logprobs: optional array of object { token, bytes, logprob }
The log probabilities of the tokens in the transcription. Only returned with the models `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` if `logprobs` is added to the `include` array.
token: optional string
The token in the transcription.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) token>)
bytes: optional array of number
The bytes of the token.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: optional number
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs>)
usage: optional object { input\_tokens, output\_tokens, total\_tokens, 2 more } or object { seconds, type }
Token usage statistics for the request.
One of the following:
TokenUsage object { input\_tokens, output\_tokens, total\_tokens, 2 more }
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
input\_token\_details: optional object { audio\_tokens, text\_tokens }
Details about the input tokens billed for this request.
audio\_tokens: optional number
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
text\_tokens: optional number
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0>)
DurationUsage object { seconds, type }
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
TranscriptionDiarized object { duration, segments, task, 2 more }
Represents a diarized transcription response returned by the model, including the combined transcript and speaker-segment annotations.
duration: number
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) duration>)
segments: array of [TranscriptionDiarizedSegment](</api/reference/resources/audio#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema)>) { id, end, speaker, 3 more }
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
usage: optional object { input\_tokens, output\_tokens, total\_tokens, 2 more } or object { seconds, type }
Token or duration usage statistics for the request.
One of the following:
Tokens object { input\_tokens, output\_tokens, total\_tokens, 2 more }
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
input\_token\_details: optional object { audio\_tokens, text\_tokens }
Details about the input tokens billed for this request.
audio\_tokens: optional number
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
text\_tokens: optional number
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0>)
Duration object { seconds, type }
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
TranscriptionVerbose object { duration, language, text, 3 more }
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
segments: optional array of [TranscriptionSegment](</api/reference/resources/audio#(resource) audio.transcriptions > (model) transcription_segment > (schema)>) { id, avg\_logprob, compression\_ratio, 7 more }
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
tokens: array of number
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) segments>)
usage: optional object { seconds, type }
Usage statistics for models billed by audio input duration.
seconds: number
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage > (property) seconds>)
type: "duration"
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage>)
words: optional array of [TranscriptionWord](</api/reference/resources/audio#(resource) audio.transcriptions > (model) transcription_word > (schema)>) { end, start, word }
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