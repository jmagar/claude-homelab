Transcriptions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Audio](/api/reference/terraform/resources/audio)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Transcriptions
Turn audio into text or text into audio.
#### resource openai\_audio\_transcription
##### required Expand Collapse
file: String
The audio file object (not file name) to transcribe, in one of these formats: flac, mp3, mp4, mpeg, mpga, m4a, ogg, wav, or webm.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) file>)
model: String
ID of the model to use. The options are `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, `gpt-4o-mini-transcribe-2025-12-15`, `whisper-1` (which is powered by our open source Whisper V2 model), and `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) model>)
##### optional Expand Collapse
language?: String
The language of the input audio. Supplying the input language in [ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (e.g. `en`) format will improve accuracy and latency.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) language>)
prompt?: String
An optional text to guide the model’s style or continue a previous audio segment. The [prompt](https://platform.openai.com/docs/guides/speech-to-text#prompting) should match the audio language. This field is not supported when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) prompt>)
stream?: Bool
If set to true, the model response data will be streamed to the client
as it is generated using [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format).
See the [Streaming section of the Speech-to-Text guide](https://platform.openai.com/docs/guides/speech-to-text?lang=curl#streaming-transcriptions)
for more information.
Note: Streaming is not supported for the `whisper-1` model and will be ignored.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) stream>)
include?: List[String]
Additional information to include in the transcription response.
`logprobs` will return the log probabilities of the tokens in the
response to understand the model’s confidence in the transcription.
`logprobs` only works with response\_format set to `json` and only with
the models `gpt-4o-transcribe`, `gpt-4o-mini-transcribe`, and `gpt-4o-mini-transcribe-2025-12-15`. This field is not supported when using `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) include>)
known\_speaker\_names?: List[String]
Optional list of speaker names that correspond to the audio samples provided in `known\_speaker\_references[]`. Each entry should be a short identifier (for example `customer` or `agent`). Up to 4 speakers are supported.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) known_speaker_names>)
known\_speaker\_references?: List[String]
Optional list of audio samples (as [data URLs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URLs)) that contain known speaker references matching `known\_speaker\_names[]`. Each sample must be between 2 and 10 seconds, and can use any of the same input audio formats supported by `file`.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) known_speaker_references>)
chunking\_strategy?: String
Controls how the audio is cut into chunks. When set to `"auto"`, the server first normalizes loudness and then uses voice activity detection (VAD) to choose boundaries. `server\_vad` object can be provided to tweak VAD detection parameters manually. If unset, the audio is transcribed as a single block. Required when using `gpt-4o-transcribe-diarize` for inputs longer than 30 seconds.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) chunking_strategy>)
response\_format?: String
The format of the output, in one of these options: `json`, `text`, `srt`, `verbose\_json`, `vtt`, or `diarized\_json`. For `gpt-4o-transcribe` and `gpt-4o-mini-transcribe`, the only supported format is `json`. For `gpt-4o-transcribe-diarize`, the supported formats are `json`, `text`, and `diarized\_json`, with `diarized\_json` required to receive speaker annotations.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) response_format>)
temperature?: Float64
The sampling temperature, between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use [log probability](https://en.wikipedia.org/wiki/Log_probability) to automatically increase the temperature until certain thresholds are hit.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) temperature>)
timestamp\_granularities?: List[String]
The timestamp granularities to populate for this transcription. `response\_format` must be set `verbose\_json` to use timestamp granularities. Either or both of these options are supported: `word`, or `segment`. Note: There is no additional latency for segment timestamps, but generating word timestamps incurs additional latency.
This option is not available for `gpt-4o-transcribe-diarize`.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) timestamp_granularities>)
##### computed Expand Collapse
duration: Float64
Duration of the input audio in seconds.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) duration>)
task: String
The type of task that was run. Always `transcribe`.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) task>)
text: String
The transcribed text.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) text>)
logprobs: List[Attributes]
The log probabilities of the tokens in the transcription. Only returned with the models `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` if `logprobs` is added to the `include` array.
token: String
The token in the transcription.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) logprobs > (attribute) token>)
bytes: List[Float64]
The bytes of the token.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) logprobs > (attribute) bytes>)
logprob: Float64
The log probability of the token.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) logprobs > (attribute) logprob>)
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) logprobs>)
segments: List[Attributes]
Segments of the transcript annotated with timestamps and speaker labels.
id: Dynamic String | Int64
Unique identifier for the segment.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) segments > (attribute) id>)
end: Float64
End timestamp of the segment in seconds.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) segments > (attribute) end>)
speaker: String
Speaker label for this segment. When known speakers are provided, the label matches `known\_speaker\_names[]`. Otherwise speakers are labeled sequentially using capital letters (`A`, `B`, …).
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) segments > (attribute) speaker>)
start: Float64
Start timestamp of the segment in seconds.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) segments > (attribute) start>)
text: String
Transcript text for this segment.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) segments > (attribute) text>)
type: String
The type of the segment. Always `transcript.text.segment`.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) segments > (attribute) type>)
avg\_logprob: Float64
Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) segments > (attribute) avg_logprob>)
compression\_ratio: Float64
Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) segments > (attribute) compression_ratio>)
no\_speech\_prob: Float64
Probability of no speech in the segment. If the value is higher than 1.0 and the `avg\_logprob` is below -1, consider this segment silent.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) segments > (attribute) no_speech_prob>)
seek: Int64
Seek offset of the segment.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) segments > (attribute) seek>)
temperature: Float64
Temperature parameter used for generating the segment.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) segments > (attribute) temperature>)
tokens: List[Int64]
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) segments > (attribute) tokens>)
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) segments>)
usage: Attributes
Token usage statistics for the request.
input\_tokens: Int64
Number of input tokens billed for this request.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) usage > (attribute) input_tokens>)
output\_tokens: Int64
Number of output tokens generated.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) usage > (attribute) output_tokens>)
total\_tokens: Int64
Total number of tokens used (input + output).
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) usage > (attribute) total_tokens>)
type: String
The type of the usage object. Always `tokens` for this variant.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) usage > (attribute) type>)
input\_token\_details: Attributes
Details about the input tokens billed for this request.
audio\_tokens: Int64
Number of audio tokens billed for this request.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) usage > (attribute) input_token_details > (attribute) audio_tokens>)
text\_tokens: Int64
Number of text tokens billed for this request.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) usage > (attribute) input_token_details > (attribute) text_tokens>)
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) usage > (attribute) input_token_details>)
seconds: Float64
Duration of the input audio in seconds.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) usage > (attribute) seconds>)
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) usage>)
words: List[Attributes]
Extracted words and their corresponding timestamps.
end: Float64
End time of the word in seconds.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) words > (attribute) end>)
start: Float64
Start time of the word in seconds.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) words > (attribute) start>)
word: String
The text content of the word.
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) words > (attribute) word>)
[](<#(resource) audio.transcriptions > (terraform resource) > (attribute) words>)
### openai\_audio\_transcription
Terraform
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
`resource "openai\_audio\_transcription" "example\_audio\_transcription" {
file = "Example data"
model = "gpt-4o-transcribe"
chunking\_strategy = "auto"
include = ["logprobs"]
known\_speaker\_names = ["string"]
known\_speaker\_references = ["string"]
language = "language"
prompt = "prompt"
response\_format = "json"
stream = false
temperature = 0
timestamp\_granularities = ["word"]
}
`
```