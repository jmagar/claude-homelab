Create speech | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Audio](/api/reference/typescript/resources/audio)
[Speech](/api/reference/typescript/resources/audio/subresources/speech)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create speech
client.audio.speech.create(SpeechCreateParams { input, model, voice, 4 more } body, RequestOptionsoptions?): Response
POST/audio/speech
Generates audio from the input text.
Returns the audio file content, or a stream of audio events.
##### ParametersExpand Collapse
body: SpeechCreateParams { input, model, voice, 4 more }
input: string
The text to generate audio for. The maximum length is 4096 characters.
maxLength4096
[](<#(resource) audio.speech > (method) create > (params) default > (param) input>)
model: (string & {}) | [SpeechModel](</api/reference/typescript/resources/audio#(resource) audio.speech > (model) speech_model > (schema)>)
One of the available [TTS models](https://platform.openai.com/docs/models#tts): `tts-1`, `tts-1-hd`, `gpt-4o-mini-tts`, or `gpt-4o-mini-tts-2025-12-15`.
One of the following:
(string & {})
[](<#(resource) audio.speech > (method) create > (params) default > (param) model > (schema) > (variant) 0>)
SpeechModel = "tts-1" | "tts-1-hd" | "gpt-4o-mini-tts" | "gpt-4o-mini-tts-2025-12-15"
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
[](<#(resource) audio.speech > (method) create > (params) default > (param) model>)
voice: string | "alloy" | "ash" | "ballad" | 7 more | ID { id }
The voice to use when generating the audio. Supported built-in voices are `alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `onyx`, `nova`, `sage`, `shimmer`, `verse`, `marin`, and `cedar`. You may also provide a custom voice object with an `id`, for example `{ "id": "voice\_1234" }`. Previews of the voices are available in the [Text to speech guide](https://platform.openai.com/docs/guides/text-to-speech#voice-options).
One of the following:
string
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 0>)
"alloy" | "ash" | "ballad" | 7 more
"alloy"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 0>)
"ash"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 1>)
"ballad"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 2>)
"coral"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 3>)
"echo"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 4>)
"sage"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 5>)
"shimmer"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 6>)
"verse"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 7>)
"marin"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 8>)
"cedar"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 9>)
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1>)
ID { id }
Custom voice reference.
id: string
The custom voice ID, e.g. `voice\_1234`.
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 2 > (property) id>)
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 2>)
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice>)
instructions?: string
Control the voice of your generated audio with additional instructions. Does not work with `tts-1` or `tts-1-hd`.
maxLength4096
[](<#(resource) audio.speech > (method) create > (params) default > (param) instructions>)
response\_format?: "mp3" | "opus" | "aac" | 3 more
The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`, `wav`, and `pcm`.
One of the following:
"mp3"
[](<#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema) > (member) 0>)
"opus"
[](<#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema) > (member) 1>)
"aac"
[](<#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema) > (member) 2>)
"flac"
[](<#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema) > (member) 3>)
"wav"
[](<#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema) > (member) 4>)
"pcm"
[](<#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema) > (member) 5>)
[](<#(resource) audio.speech > (method) create > (params) default > (param) response_format>)
speed?: number
The speed of the generated audio. Select a value from `0.25` to `4.0`. `1.0` is the default.
minimum0.25
maximum4
[](<#(resource) audio.speech > (method) create > (params) default > (param) speed>)
stream\_format?: "sse" | "audio"
The format to stream the audio in. Supported formats are `sse` and `audio`. `sse` is not supported for `tts-1` or `tts-1-hd`.
One of the following:
"sse"
[](<#(resource) audio.speech > (method) create > (params) default > (param) stream_format > (schema) > (member) 0>)
"audio"
[](<#(resource) audio.speech > (method) create > (params) default > (param) stream_format > (schema) > (member) 1>)
[](<#(resource) audio.speech > (method) create > (params) default > (param) stream_format>)
[](<#(resource) audio.speech > (method) create > (params) default>)
##### ReturnsExpand Collapse
unnamed\_schema\_1 = Response
[](<#(resource) audio.speech > (method) create > (network schema)>)
### Create speech
TypeScript
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
`import fs from "fs";
import path from "path";
import OpenAI from "openai";
const openai = new OpenAI();
const speechFile = path.resolve("./speech.mp3");
async function main() {
const mp3 = await openai.audio.speech.create({
model: "gpt-4o-mini-tts",
voice: "alloy",
input: "Today is a wonderful day to build something people love!",
});
console.log(speechFile);
const buffer = Buffer.from(await mp3.arrayBuffer());
await fs.promises.writeFile(speechFile, buffer);
}
main();
`
```
##### Returns Examples