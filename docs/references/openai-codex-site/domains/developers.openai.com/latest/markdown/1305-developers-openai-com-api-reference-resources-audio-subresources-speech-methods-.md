Create speech | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Audio](/api/reference/resources/audio)
[Speech](/api/reference/resources/audio/subresources/speech)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create speech
POST/audio/speech
Generates audio from the input text.
Returns the audio file content, or a stream of audio events.
##### Body ParametersJSONExpand Collapse
input: string
The text to generate audio for. The maximum length is 4096 characters.
maxLength4096
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) input > (schema)>)
model: string or [SpeechModel](</api/reference/resources/audio#(resource) audio.speech > (model) speech_model > (schema)>)
One of the available [TTS models](/docs/models#tts): `tts-1`, `tts-1-hd`, `gpt-4o-mini-tts`, or `gpt-4o-mini-tts-2025-12-15`.
One of the following:
string
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) model > (schema) > (variant) 0>)
SpeechModel = "tts-1" or "tts-1-hd" or "gpt-4o-mini-tts" or "gpt-4o-mini-tts-2025-12-15"
One of the following:
"tts-1"
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 0>)
"tts-1-hd"
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 1>)
"gpt-4o-mini-tts"
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 2>)
"gpt-4o-mini-tts-2025-12-15"
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 3>)
[](<#(resource) audio.speech > (model) speech_model > (schema)>)
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) model > (schema)>)
voice: string or "alloy" or "ash" or "ballad" or 7 more or object { id }
The voice to use when generating the audio. Supported built-in voices are `alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `onyx`, `nova`, `sage`, `shimmer`, `verse`, `marin`, and `cedar`. You may also provide a custom voice object with an `id`, for example `{ "id": "voice\_1234" }`. Previews of the voices are available in the [Text to speech guide](/docs/guides/text-to-speech#voice-options).
One of the following:
string
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) voice > (schema) > (variant) 0>)
"alloy" or "ash" or "ballad" or 7 more
One of the following:
"alloy"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 0>)
"ash"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 1>)
"ballad"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 2>)
"coral"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 3>)
"echo"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 4>)
"sage"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 5>)
"shimmer"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 6>)
"verse"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 7>)
"marin"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 8>)
"cedar"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1 > (member) 9>)
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) voice > (schema) > (variant) 1>)
ID object { id }
Custom voice reference.
id: string
The custom voice ID, e.g. `voice\_1234`.
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) voice > (schema) > (variant) 2 > (property) id>)
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) voice > (schema) > (variant) 2>)
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) voice > (schema)>)
instructions: optional string
Control the voice of your generated audio with additional instructions. Does not work with `tts-1` or `tts-1-hd`.
maxLength4096
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) instructions > (schema)>)
response\_format: optional "mp3" or "opus" or "aac" or 3 more
The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`, `wav`, and `pcm`.
One of the following:
"mp3"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) response_format > (schema) > (member) 0>)
"opus"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) response_format > (schema) > (member) 1>)
"aac"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) response_format > (schema) > (member) 2>)
"flac"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) response_format > (schema) > (member) 3>)
"wav"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) response_format > (schema) > (member) 4>)
"pcm"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) response_format > (schema) > (member) 5>)
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) response_format > (schema)>)
speed: optional number
The speed of the generated audio. Select a value from `0.25` to `4.0`. `1.0` is the default.
minimum0.25
maximum4
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) speed > (schema)>)
stream\_format: optional "sse" or "audio"
The format to stream the audio in. Supported formats are `sse` and `audio`. `sse` is not supported for `tts-1` or `tts-1-hd`.
One of the following:
"sse"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) stream_format > (schema) > (member) 0>)
"audio"
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) stream_format > (schema) > (member) 1>)
[](<#(resource) audio.speech > (method) create > (params) 0 > (param) stream_format > (schema)>)
DefaultSSE Stream Format
### Create speech
HTTP
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
`curl https://api.openai.com/v1/audio/speech \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json" \\
-d '{
"model": "gpt-4o-mini-tts",
"input": "The quick brown fox jumped over the lazy dog.",
"voice": "alloy"
}' \\
--output speech.mp3
`
```
### Create speech
HTTP
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
`curl https://api.openai.com/v1/audio/speech \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json" \\
-d '{
"model": "gpt-4o-mini-tts",
"input": "The quick brown fox jumped over the lazy dog.",
"voice": "alloy",
"stream\_format": "sse"
}'
`
```
##### Returns Examples