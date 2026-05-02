Create transcription | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Audio](/api/reference/go/resources/audio)
[Transcriptions](/api/reference/go/resources/audio/subresources/transcriptions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create transcription
client.Audio.Transcriptions.New(ctx, body) (\*[AudioTranscriptionNewResponseUnion](</api/reference/go/resources/audio#(resource) audio.transcriptions > (model) AudioTranscriptionNewResponse > (schema)>), error)
POST/audio/transcriptions
Transcribes audio into the input language.
Returns a transcription object in `json`, `diarized\_json`, or `verbose\_json`
format, or a stream of transcript events.
##### ParametersExpand Collapse
body AudioTranscriptionNewParams
File param.Field[[Reader](</api/reference/go/resources/audio/subresources/transcriptions/methods/create#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) file > (schema)>)]
The audio file object (not file name) to transcribe, in one of these formats: flac, mp3, mp4, mpeg, mpga, m4a, ogg, wav, or webm.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) file>)
Model param.Field[[AudioModel](</api/reference/go/resources/audio#(resource) audio > (model) audio_model > (schema)>)]
ID of the model to use. The options are `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `whisper-1` (which is powered by our open source Whisper V2 model), and `gpt-4o-transcribe-diarize`.
string
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) model > (schema) > (variant) 0>)
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
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) model>)
ChunkingStrategy param.Field[[AudioTranscriptionNewParamsChunkingStrategyUnion](</api/reference/go/resources/audio/subresources/transcriptions/methods/create#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema)>)]Optional
Controls how the audio is cut into chunks. When set to `"auto"`, the server first normalizes loudness and then uses voice activity detection (VAD) to choose boundaries. `server\_vad` object can be provided to tweak VAD detection parameters manually. If unset, the audio is transcribed as a single block. Required when using `gpt-4o-transcribe-diarize` for inputs longer than 30 seconds.
Auto
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 0>)
AudioTranscriptionNewParamsChunkingStrategyVadConfig
Type string
Must be set to `server\_vad` to enable manual chunking using server side VAD.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 1 > (property) type>)
PrefixPaddingMs int64Optional
Amount of audio to include before the VAD detected speech (in
milliseconds).
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 1 > (property) prefix_padding_ms>)
SilenceDurationMs int64Optional
Duration of silence to detect speech stop (in milliseconds).
With shorter values the model will respond more quickly,
but may jump in on short pauses from the user.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 1 > (property) silence_duration_ms>)
Threshold float64Optional
Sensitivity threshold (0.0 to 1.0) for voice activity detection. A
higher threshold will require louder audio to activate the model, and
thus might perform better in noisy environments.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 1 > (property) threshold>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy > (schema) > (variant) 1>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) chunking_strategy>)
Include param.Field[[][TranscriptionInclude](</api/reference/go/resources/audio#(resource) audio.transcriptions > (model) transcription_include > (schema)>)]Optional
Additional information to include in the transcription response.
`logprobs` will return the log probabilities of the tokens in the
response to understand the model’s confidence in the transcription.
`logprobs` only works with response\_format set to `json` and only with
the models `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, and `gpt-4o-mini-transcribe-2025-12-15`. This field is not supported when using `gpt-4o-transcribe-diarize`.
const TranscriptionIncludeLogprobs [TranscriptionInclude](</api/reference/go/resources/audio#(resource) audio.transcriptions > (model) transcription_include > (schema)>) = "logprobs"
[](<#(resource) audio.transcriptions > (model) transcription_include > (schema) > (member) 0>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) include>)
KnownSpeakerNames param.Field[[]string]Optional
Optional list of speaker names that correspond to the audio samples provided in `known\_speaker\_references[]`. Each entry should be a short identifier (for example `customer` or `agent`). Up to 4 speakers are supported.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) known_speaker_names>)
KnownSpeakerReferences param.Field[[]string]Optional
Optional list of audio samples (as [data URLs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URLs)) that contain known speaker references matching `known\_speaker\_names[]`. Each sample must be between 2 and 10 seconds, and can use any of the same input audio formats supported by `file`.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) known_speaker_references>)
Language param.Field[string]Optional
The language of the input audio. Supplying the input language in [ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format will improve accuracy and latency.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) language>)
Prompt param.Field[string]Optional
An optional text to guide the model’s style or continue a previous audio segment. The [prompt](https://platform.openai.com/docs/guides/speech-to-text#prompting) should match the audio language. This field is not supported when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) prompt>)
ResponseFormat param.Field[[AudioResponseFormat](</api/reference/go/resources/audio#(resource) audio > (model) audio_response_format > (schema)>)]Optional
The format of the output, in one of these options: `json`, `text`, `srt`, `verbose\_json`, `vtt`, or `diarized\_json`. For `gpt-4o-transcribe` and `gpt-4o-mini-transcribe`, the only supported format is `json`. For `gpt-4o-transcribe-diarize`, the supported formats are `json`, `text`, and `diarized\_json`, with `diarized\_json` required to receive speaker annotations.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) response_format>)
Temperature param.Field[float64]Optional
The sampling temperature, between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use [log probability](https://en.wikipedia.org/wiki/Log_probability) to automatically increase the temperature until certain thresholds are hit.
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) temperature>)
TimestampGranularities param.Field[[]string]Optional
The timestamp granularities to populate for this transcription. `response\_format` must be set `verbose\_json` to use timestamp granularities. Either or both of these options are supported: `word`, or `segment`. Note: There is no additional latency for segment timestamps, but generating word timestamps incurs additional latency.
This option is not available for `gpt-4o-transcribe-diarize`.
const AudioTranscriptionNewParamsTimestampGranularityWord AudioTranscriptionNewParamsTimestampGranularity = "word"
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) timestamp_granularities > (schema) > (items) > (member) 0>)
const AudioTranscriptionNewParamsTimestampGranularitySegment AudioTranscriptionNewParamsTimestampGranularity = "segment"
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) timestamp_granularities > (schema) > (items) > (member) 1>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming > (param) timestamp_granularities>)
[](<#(resource) audio.transcriptions > (method) create > (params) default.non_streaming>)
##### ReturnsExpand Collapse
type AudioTranscriptionNewResponseUnion interface{…}
Represents a transcription response returned by model, based on the provided input.
One of the following:
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
[](<#(resource) audio.transcriptions > (model) AudioTranscriptionNewResponse > (schema)>)
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
### Create transcription
Go
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
`package main
import (
"bytes"
"context"
"fmt"
"io"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
transcription, err := client.Audio.Transcriptions.New(context.TODO(), openai.AudioTranscriptionNewParams{
File: io.Reader(bytes.NewBuffer([]byte("Example data"))),
Model: openai.AudioModelGPT4oTranscribe,
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", transcription)
}
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