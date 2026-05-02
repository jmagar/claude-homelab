Translations | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Audio](/api/reference/terraform/resources/audio)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Translations
Turn audio into text or text into audio.
#### resource openai\_audio\_translation
##### required Expand Collapse
file: String
The audio file object (not file name) translate, in one of these formats: flac, mp3, mp4, mpeg, mpga, m4a, ogg, wav, or webm.
[](<#(resource) audio.translations > (terraform resource) > (attribute) file>)
model: String
ID of the model to use. Only `whisper-1` (which is powered by our open source Whisper V2 model) is currently available.
[](<#(resource) audio.translations > (terraform resource) > (attribute) model>)
##### optional Expand Collapse
prompt?: String
An optional text to guide the model’s style or continue a previous audio segment. The [prompt](https://platform.openai.com/docs/guides/speech-to-text#prompting) should be in English.
[](<#(resource) audio.translations > (terraform resource) > (attribute) prompt>)
response\_format?: String
The format of the output, in one of these options: `json`, `text`, `srt`, `verbose\_json`, or `vtt`.
[](<#(resource) audio.translations > (terraform resource) > (attribute) response_format>)
temperature?: Float64
The sampling temperature, between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use [log probability](https://en.wikipedia.org/wiki/Log_probability) to automatically increase the temperature until certain thresholds are hit.
[](<#(resource) audio.translations > (terraform resource) > (attribute) temperature>)
##### computed Expand Collapse
duration: Float64
The duration of the input audio.
[](<#(resource) audio.translations > (terraform resource) > (attribute) duration>)
language: String
The language of the output translation (always `english`).
[](<#(resource) audio.translations > (terraform resource) > (attribute) language>)
text: String
[](<#(resource) audio.translations > (terraform resource) > (attribute) text>)
segments: List[Attributes]
Segments of the translated text and their corresponding details.
id: Int64
Unique identifier of the segment.
[](<#(resource) audio.translations > (terraform resource) > (attribute) segments > (attribute) id>)
avg\_logprob: Float64
Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
[](<#(resource) audio.translations > (terraform resource) > (attribute) segments > (attribute) avg_logprob>)
compression\_ratio: Float64
Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
[](<#(resource) audio.translations > (terraform resource) > (attribute) segments > (attribute) compression_ratio>)
end: Float64
End time of the segment in seconds.
[](<#(resource) audio.translations > (terraform resource) > (attribute) segments > (attribute) end>)
no\_speech\_prob: Float64
Probability of no speech in the segment. If the value is higher than 1.0 and the `avg\_logprob` is below -1, consider this segment silent.
[](<#(resource) audio.translations > (terraform resource) > (attribute) segments > (attribute) no_speech_prob>)
seek: Int64
Seek offset of the segment.
[](<#(resource) audio.translations > (terraform resource) > (attribute) segments > (attribute) seek>)
start: Float64
Start time of the segment in seconds.
[](<#(resource) audio.translations > (terraform resource) > (attribute) segments > (attribute) start>)
temperature: Float64
Temperature parameter used for generating the segment.
[](<#(resource) audio.translations > (terraform resource) > (attribute) segments > (attribute) temperature>)
text: String
Text content of the segment.
[](<#(resource) audio.translations > (terraform resource) > (attribute) segments > (attribute) text>)
tokens: List[Int64]
Array of token IDs for the text content.
[](<#(resource) audio.translations > (terraform resource) > (attribute) segments > (attribute) tokens>)
[](<#(resource) audio.translations > (terraform resource) > (attribute) segments>)
### openai\_audio\_translation
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
`resource "openai\_audio\_translation" "example\_audio\_translation" {
file = "Example data"
model = "whisper-1"
prompt = "prompt"
response\_format = "json"
temperature = 0
}
`
```