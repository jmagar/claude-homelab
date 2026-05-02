Transcriptions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Audio](/api/reference/python/resources/audio)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Transcriptions
Turn audio into text or text into audio.
##### [Create transcription](/api/reference/python/resources/audio/subresources/transcriptions/methods/create)
audio.transcriptions.create(TranscriptionCreateParams\*\*kwargs) -\> [TranscriptionCreateResponse](</api/reference/python/resources/audio#(resource) audio.transcriptions > (model) transcription_create_response > (schema)>)
POST/audio/transcriptions
##### ModelsExpand Collapse
class Transcription: …
Represents a transcription response returned by model, based on the provided input.
text: str
The transcribed text.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) text>)
logprobs: Optional[List[Logprob]]
The log probabilities of the tokens in the transcription. Only returned with the models `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` if `logprobs` is added to the `include` array.
token: Optional[str]
The token in the transcription.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) token>)
bytes: Optional[List[float]]
The bytes of the token.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: Optional[float]
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs>)
usage: Optional[Usage]
Token usage statistics for the request.
One of the following:
class UsageTokens: …
Usage statistics for models billed by token usage.
input\_tokens: int
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_tokens>)
output\_tokens: int
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) output_tokens>)
total\_tokens: int
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) total_tokens>)
type: Literal["tokens"]
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) type>)
input\_token\_details: Optional[UsageTokensInputTokenDetails]
Details about the input tokens billed for this request.
audio\_tokens: Optional[int]
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
text\_tokens: Optional[int]
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0>)
class UsageDuration: …
Usage statistics for models billed by audio input duration.
seconds: float
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1 > (property) seconds>)
type: Literal["duration"]
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1 > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema)>)
class TranscriptionDiarized: …
Represents a diarized transcription response returned by the model, including the combined transcript and speaker-segment annotations.
duration: float
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) duration>)
segments: List[[TranscriptionDiarizedSegment](</api/reference/python/resources/audio#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema)>)]
Segments of the transcript annotated with timestamps and speaker labels.
id: str
Unique identifier for the segment.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) id>)
end: float
End timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) end>)
speaker: str
Speaker label for this segment. When known speakers are provided, the label matches `known\_speaker\_names[]`. Otherwise speakers are labeled sequentially using capital letters (`A`, `B`, …).
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) speaker>)
start: float
Start timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) start>)
text: str
Transcript text for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) text>)
type: Literal["transcript.text.segment"]
The type of the segment. Always `transcript.text.segment`.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) segments>)
task: Literal["transcribe"]
The type of task that was run. Always `transcribe`.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) task>)
text: str
The concatenated transcript text for the entire audio input.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) text>)
usage: Optional[Usage]
Token or duration usage statistics for the request.
One of the following:
class UsageTokens: …
Usage statistics for models billed by token usage.
input\_tokens: int
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_tokens>)
output\_tokens: int
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) output_tokens>)
total\_tokens: int
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) total_tokens>)
type: Literal["tokens"]
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) type>)
input\_token\_details: Optional[UsageTokensInputTokenDetails]
Details about the input tokens billed for this request.
audio\_tokens: Optional[int]
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
text\_tokens: Optional[int]
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0>)
class UsageDuration: …
Usage statistics for models billed by audio input duration.
seconds: float
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1 > (property) seconds>)
type: Literal["duration"]
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1 > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema)>)
class TranscriptionDiarizedSegment: …
A segment of diarized transcript text with speaker metadata.
id: str
Unique identifier for the segment.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) id>)
end: float
End timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) end>)
speaker: str
Speaker label for this segment. When known speakers are provided, the label matches `known\_speaker\_names[]`. Otherwise speakers are labeled sequentially using capital letters (`A`, `B`, …).
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) speaker>)
start: float
Start timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) start>)
text: str
Transcript text for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) text>)
type: Literal["transcript.text.segment"]
The type of the segment. Always `transcript.text.segment`.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema)>)
Literal["logprobs"]
[](<#(resource) audio.transcriptions > (model) transcription_include > (schema)>)
class TranscriptionSegment: …
id: int
Unique identifier of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) id>)
avg\_logprob: float
Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) avg_logprob>)
compression\_ratio: float
Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) compression_ratio>)
end: float
End time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) end>)
no\_speech\_prob: float
Probability of no speech in the segment. If the value is higher than 1.0 and the `avg\_logprob` is below -1, consider this segment silent.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) no_speech_prob>)
seek: int
Seek offset of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) seek>)
start: float
Start time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) start>)
temperature: float
Temperature parameter used for generating the segment.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) temperature>)
text: str
Text content of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) text>)
tokens: List[int]
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema)>)
[TranscriptionStreamEvent](</api/reference/python/resources/audio#(resource) audio.transcriptions > (model) transcription_stream_event > (schema)>)
Emitted when a diarized transcription returns a completed segment with speaker information. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with `stream` set to `true` and `response\_format` set to `diarized\_json`.
One of the following:
class TranscriptionTextSegmentEvent: …
Emitted when a diarized transcription returns a completed segment with speaker information. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with `stream` set to `true` and `response\_format` set to `diarized\_json`.
id: str
Unique identifier for the segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) id>)
end: float
End timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) end>)
speaker: str
Speaker label for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) speaker>)
start: float
Start timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) start>)
text: str
Transcript text for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) text>)
type: Literal["transcript.text.segment"]
The type of the event. Always `transcript.text.segment`.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema)>)
class TranscriptionTextDeltaEvent: …
Emitted when there is an additional text delta. This is also the first event emitted when the transcription starts. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
delta: str
The text delta that was additionally transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) delta>)
type: Literal["transcript.text.delta"]
The type of the event. Always `transcript.text.delta`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) type>)
logprobs: Optional[List[Logprob]]
The log probabilities of the delta. Only included if you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
token: Optional[str]
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) token>)
bytes: Optional[List[int]]
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: Optional[float]
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs>)
segment\_id: Optional[str]
Identifier of the diarized segment that this delta belongs to. Only present when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) segment_id>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema)>)
class TranscriptionTextDoneEvent: …
Emitted when the transcription is complete. Contains the complete transcription text. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
text: str
The text that was transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) text>)
type: Literal["transcript.text.done"]
The type of the event. Always `transcript.text.done`.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) type>)
logprobs: Optional[List[Logprob]]
The log probabilities of the individual tokens in the transcription. Only included if you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
token: Optional[str]
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) token>)
bytes: Optional[List[int]]
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: Optional[float]
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs>)
usage: Optional[Usage]
Usage statistics for models billed by token usage.
input\_tokens: int
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_tokens>)
output\_tokens: int
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) output_tokens>)
total\_tokens: int
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) total_tokens>)
type: Literal["tokens"]
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) type>)
input\_token\_details: Optional[UsageInputTokenDetails]
Details about the input tokens billed for this request.
audio\_tokens: Optional[int]
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) audio_tokens>)
text\_tokens: Optional[int]
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema)>)
[](<#(resource) audio.transcriptions > (model) transcription_stream_event > (schema)>)
class TranscriptionTextDeltaEvent: …
Emitted when there is an additional text delta. This is also the first event emitted when the transcription starts. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
delta: str
The text delta that was additionally transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) delta>)
type: Literal["transcript.text.delta"]
The type of the event. Always `transcript.text.delta`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) type>)
logprobs: Optional[List[Logprob]]
The log probabilities of the delta. Only included if you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
token: Optional[str]
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) token>)
bytes: Optional[List[int]]
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: Optional[float]
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) logprobs>)
segment\_id: Optional[str]
Identifier of the diarized segment that this delta belongs to. Only present when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema) > (property) segment_id>)
[](<#(resource) audio.transcriptions > (model) transcription_text_delta_event > (schema)>)
class TranscriptionTextDoneEvent: …
Emitted when the transcription is complete. Contains the complete transcription text. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `Stream` parameter set to `true`.
text: str
The text that was transcribed.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) text>)
type: Literal["transcript.text.done"]
The type of the event. Always `transcript.text.done`.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) type>)
logprobs: Optional[List[Logprob]]
The log probabilities of the individual tokens in the transcription. Only included if you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with the `include[]` parameter set to `logprobs`.
token: Optional[str]
The token that was used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) token>)
bytes: Optional[List[int]]
The bytes that were used to generate the log probability.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: Optional[float]
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) logprobs>)
usage: Optional[Usage]
Usage statistics for models billed by token usage.
input\_tokens: int
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_tokens>)
output\_tokens: int
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) output_tokens>)
total\_tokens: int
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) total_tokens>)
type: Literal["tokens"]
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) type>)
input\_token\_details: Optional[UsageInputTokenDetails]
Details about the input tokens billed for this request.
audio\_tokens: Optional[int]
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) audio_tokens>)
text\_tokens: Optional[int]
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription_text_done_event > (schema)>)
class TranscriptionTextSegmentEvent: …
Emitted when a diarized transcription returns a completed segment with speaker information. Only emitted when you [create a transcription](https://platform.openai.com/docs/api-reference/audio/create-transcription) with `stream` set to `true` and `response\_format` set to `diarized\_json`.
id: str
Unique identifier for the segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) id>)
end: float
End timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) end>)
speaker: str
Speaker label for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) speaker>)
start: float
Start timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) start>)
text: str
Transcript text for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) text>)
type: Literal["transcript.text.segment"]
The type of the event. Always `transcript.text.segment`.
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema) > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_text_segment_event > (schema)>)
class TranscriptionVerbose: …
Represents a verbose json transcription response returned by model, based on the provided input.
duration: float
The duration of the input audio.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) duration>)
language: str
The language of the input audio.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) language>)
text: str
The transcribed text.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) text>)
segments: Optional[List[[TranscriptionSegment](</api/reference/python/resources/audio#(resource) audio.transcriptions > (model) transcription_segment > (schema)>)]]
Segments of the transcribed text and their corresponding details.
id: int
Unique identifier of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) id>)
avg\_logprob: float
Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) avg_logprob>)
compression\_ratio: float
Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) compression_ratio>)
end: float
End time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) end>)
no\_speech\_prob: float
Probability of no speech in the segment. If the value is higher than 1.0 and the `avg\_logprob` is below -1, consider this segment silent.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) no_speech_prob>)
seek: int
Seek offset of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) seek>)
start: float
Start time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) start>)
temperature: float
Temperature parameter used for generating the segment.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) temperature>)
text: str
Text content of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) text>)
tokens: List[int]
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) segments>)
usage: Optional[Usage]
Usage statistics for models billed by audio input duration.
seconds: float
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage > (property) seconds>)
type: Literal["duration"]
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage>)
words: Optional[List[[TranscriptionWord](</api/reference/python/resources/audio#(resource) audio.transcriptions > (model) transcription_word > (schema)>)]]
Extracted words and their corresponding timestamps.
end: float
End time of the word in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) end>)
start: float
Start time of the word in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) start>)
word: str
The text content of the word.
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) word>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) words>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema)>)
class TranscriptionWord: …
end: float
End time of the word in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) end>)
start: float
Start time of the word in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) start>)
word: str
The text content of the word.
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) word>)
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema)>)
[TranscriptionCreateResponse](</api/reference/python/resources/audio#(resource) audio.transcriptions > (model) transcription_create_response > (schema)>)
Represents a transcription response returned by model, based on the provided input.
One of the following:
class Transcription: …
Represents a transcription response returned by model, based on the provided input.
text: str
The transcribed text.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) text>)
logprobs: Optional[List[Logprob]]
The log probabilities of the tokens in the transcription. Only returned with the models `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` if `logprobs` is added to the `include` array.
token: Optional[str]
The token in the transcription.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) token>)
bytes: Optional[List[float]]
The bytes of the token.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: Optional[float]
The log probability of the token.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs > (items) > (property) logprob>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) logprobs>)
usage: Optional[Usage]
Token usage statistics for the request.
One of the following:
class UsageTokens: …
Usage statistics for models billed by token usage.
input\_tokens: int
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_tokens>)
output\_tokens: int
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) output_tokens>)
total\_tokens: int
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) total_tokens>)
type: Literal["tokens"]
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) type>)
input\_token\_details: Optional[UsageTokensInputTokenDetails]
Details about the input tokens billed for this request.
audio\_tokens: Optional[int]
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
text\_tokens: Optional[int]
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 0>)
class UsageDuration: …
Usage statistics for models billed by audio input duration.
seconds: float
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1 > (property) seconds>)
type: Literal["duration"]
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1 > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage > (variant) 1>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription > (schema)>)
class TranscriptionDiarized: …
Represents a diarized transcription response returned by the model, including the combined transcript and speaker-segment annotations.
duration: float
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) duration>)
segments: List[[TranscriptionDiarizedSegment](</api/reference/python/resources/audio#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema)>)]
Segments of the transcript annotated with timestamps and speaker labels.
id: str
Unique identifier for the segment.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) id>)
end: float
End timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) end>)
speaker: str
Speaker label for this segment. When known speakers are provided, the label matches `known\_speaker\_names[]`. Otherwise speakers are labeled sequentially using capital letters (`A`, `B`, …).
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) speaker>)
start: float
Start timestamp of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) start>)
text: str
Transcript text for this segment.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) text>)
type: Literal["transcript.text.segment"]
The type of the segment. Always `transcript.text.segment`.
[](<#(resource) audio.transcriptions > (model) transcription_diarized_segment > (schema) > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) segments>)
task: Literal["transcribe"]
The type of task that was run. Always `transcribe`.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) task>)
text: str
The concatenated transcript text for the entire audio input.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) text>)
usage: Optional[Usage]
Token or duration usage statistics for the request.
One of the following:
class UsageTokens: …
Usage statistics for models billed by token usage.
input\_tokens: int
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_tokens>)
output\_tokens: int
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) output_tokens>)
total\_tokens: int
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) total_tokens>)
type: Literal["tokens"]
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) type>)
input\_token\_details: Optional[UsageTokensInputTokenDetails]
Details about the input tokens billed for this request.
audio\_tokens: Optional[int]
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) audio_tokens>)
text\_tokens: Optional[int]
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details > (property) text_tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0 > (property) input_token_details>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 0>)
class UsageDuration: …
Usage statistics for models billed by audio input duration.
seconds: float
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1 > (property) seconds>)
type: Literal["duration"]
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1 > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage > (variant) 1>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema) > (property) usage>)
[](<#(resource) audio.transcriptions > (model) transcription_diarized > (schema)>)
class TranscriptionVerbose: …
Represents a verbose json transcription response returned by model, based on the provided input.
duration: float
The duration of the input audio.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) duration>)
language: str
The language of the input audio.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) language>)
text: str
The transcribed text.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) text>)
segments: Optional[List[[TranscriptionSegment](</api/reference/python/resources/audio#(resource) audio.transcriptions > (model) transcription_segment > (schema)>)]]
Segments of the transcribed text and their corresponding details.
id: int
Unique identifier of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) id>)
avg\_logprob: float
Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) avg_logprob>)
compression\_ratio: float
Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) compression_ratio>)
end: float
End time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) end>)
no\_speech\_prob: float
Probability of no speech in the segment. If the value is higher than 1.0 and the `avg\_logprob` is below -1, consider this segment silent.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) no_speech_prob>)
seek: int
Seek offset of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) seek>)
start: float
Start time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) start>)
temperature: float
Temperature parameter used for generating the segment.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) temperature>)
text: str
Text content of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) text>)
tokens: List[int]
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) segments>)
usage: Optional[Usage]
Usage statistics for models billed by audio input duration.
seconds: float
Duration of the input audio in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage > (property) seconds>)
type: Literal["duration"]
The type of the usage object. Always `duration` for this variant.
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage > (property) type>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) usage>)
words: Optional[List[[TranscriptionWord](</api/reference/python/resources/audio#(resource) audio.transcriptions > (model) transcription_word > (schema)>)]]
Extracted words and their corresponding timestamps.
end: float
End time of the word in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) end>)
start: float
Start time of the word in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) start>)
word: str
The text content of the word.
[](<#(resource) audio.transcriptions > (model) transcription_word > (schema) > (property) word>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema) > (property) words>)
[](<#(resource) audio.transcriptions > (model) transcription_verbose > (schema)>)
[](<#(resource) audio.transcriptions > (model) transcription_create_response > (schema)>)