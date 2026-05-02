Speech | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Audio](/api/reference/terraform/resources/audio)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Speech
Turn audio into text or text into audio.
#### resource openai\_audio\_speech
##### required Expand Collapse
input: String
The text to generate audio for. The maximum length is 4096 characters.
[](<#(resource) audio.speech > (terraform resource) > (attribute) input>)
model: String
One of the available [TTS models](https://platform.openai.com/docs/models#tts): `tts-1`, `tts-1-hd`, `gpt-4o-mini-tts`, or `gpt-4o-mini-tts-2025-12-15`.
[](<#(resource) audio.speech > (terraform resource) > (attribute) model>)
voice: String
The voice to use when generating the audio. Supported built-in voices are `alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `onyx`, `nova`, `sage`, `shimmer`, `verse`, `marin`, and `cedar`. You may also provide a custom voice object with an `id`, for example `{ "id": "voice\_1234" }`. Previews of the voices are available in the [Text to speech guide](https://platform.openai.com/docs/guides/text-to-speech#voice-options).
[](<#(resource) audio.speech > (terraform resource) > (attribute) voice>)
##### optional Expand Collapse
instructions?: String
Control the voice of your generated audio with additional instructions. Does not work with `tts-1` or `tts-1-hd`.
[](<#(resource) audio.speech > (terraform resource) > (attribute) instructions>)
response\_format?: String
The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`, `wav`, and `pcm`.
[](<#(resource) audio.speech > (terraform resource) > (attribute) response_format>)
speed?: Float64
The speed of the generated audio. Select a value from `0.25` to `4.0`. `1.0` is the default.
[](<#(resource) audio.speech > (terraform resource) > (attribute) speed>)
stream\_format?: String
The format to stream the audio in. Supported formats are `sse` and `audio`. `sse` is not supported for `tts-1` or `tts-1-hd`.
[](<#(resource) audio.speech > (terraform resource) > (attribute) stream_format>)
### openai\_audio\_speech
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
`resource "openai\_audio\_speech" "example\_audio\_speech" {
input = "input"
model = "string"
voice = "string"
instructions = "instructions"
response\_format = "mp3"
speed = 0.25
stream\_format = "sse"
}
`
```