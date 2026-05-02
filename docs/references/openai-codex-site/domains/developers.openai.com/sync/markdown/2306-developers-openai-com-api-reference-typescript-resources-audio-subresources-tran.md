Create translation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Audio](/api/reference/typescript/resources/audio)
[Translations](/api/reference/typescript/resources/audio/subresources/translations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create translation
client.audio.translations.create(TranslationCreateParams { file, model, prompt, 2 more } body, RequestOptionsoptions?): [TranslationCreateResponse](</api/reference/typescript/resources/audio#(resource) audio.translations > (model) translation_create_response > (schema)>)
POST/audio/translations
Translates audio into English.
##### ParametersExpand Collapse
body: TranslationCreateParams { file, model, prompt, 2 more }
file: [Uploadable](</api/reference/typescript/resources/audio/subresources/translations/methods/create#(resource) audio.translations > (method) create > (params) default > (param) file > (schema)>)
The audio file object (not file name) translate, in one of these formats: flac, mp3, mp4, mpeg, mpga, m4a, ogg, wav, or webm.
[](<#(resource) audio.translations > (method) create > (params) default > (param) file>)
model: (string & {}) | [AudioModel](</api/reference/typescript/resources/audio#(resource) audio > (model) audio_model > (schema)>)
ID of the model to use. Only `whisper-1` (which is powered by our open source Whisper V2 model) is currently available.
One of the following:
(string & {})
[](<#(resource) audio.translations > (method) create > (params) default > (param) model > (schema) > (variant) 0>)
AudioModel = "whisper-1" | "gpt-4o-transcribe" | "gpt-4o-mini-transcribe" | 2 more
One of the following:
"whisper-1"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 0>)
"gpt-4o-transcribe"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 1>)
"gpt-4o-mini-transcribe"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 2>)
"gpt-4o-mini-transcribe-2025-12-15"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 3>)
"gpt-4o-transcribe-diarize"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 4>)
[](<#(resource) audio > (model) audio_model > (schema)>)
[](<#(resource) audio.translations > (method) create > (params) default > (param) model>)
prompt?: string
An optional text to guide the model’s style or continue a previous audio segment. The [prompt](https://platform.openai.com/docs/guides/speech-to-text#prompting) should be in English.
[](<#(resource) audio.translations > (method) create > (params) default > (param) prompt>)
response\_format?: "json" | "text" | "srt" | 2 more
The format of the output, in one of these options: `json`, `text`, `srt`, `verbose\_json`, or `vtt`.
One of the following:
"json"
[](<#(resource) audio.translations > (method) create > (params) default > (param) response_format > (schema) > (member) 0>)
"text"
[](<#(resource) audio.translations > (method) create > (params) default > (param) response_format > (schema) > (member) 1>)
"srt"
[](<#(resource) audio.translations > (method) create > (params) default > (param) response_format > (schema) > (member) 2>)
"verbose\_json"
[](<#(resource) audio.translations > (method) create > (params) default > (param) response_format > (schema) > (member) 3>)
"vtt"
[](<#(resource) audio.translations > (method) create > (params) default > (param) response_format > (schema) > (member) 4>)
[](<#(resource) audio.translations > (method) create > (params) default > (param) response_format>)
temperature?: number
The sampling temperature, between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use [log probability](https://en.wikipedia.org/wiki/Log_probability) to automatically increase the temperature until certain thresholds are hit.
[](<#(resource) audio.translations > (method) create > (params) default > (param) temperature>)
[](<#(resource) audio.translations > (method) create > (params) default>)
##### ReturnsExpand Collapse
TranslationCreateResponse = [Translation](</api/reference/typescript/resources/audio#(resource) audio.translations > (model) translation > (schema)>) { text } | [TranslationVerbose](</api/reference/typescript/resources/audio#(resource) audio.translations > (model) translation_verbose > (schema)>) { duration, language, text, segments }
One of the following:
Translation { text }
text: string
[](<#(resource) audio.translations > (model) translation > (schema) > (property) text>)
[](<#(resource) audio.translations > (model) translation > (schema)>)
TranslationVerbose { duration, language, text, segments }
duration: number
The duration of the input audio.
formatdouble
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) duration>)
language: string
The language of the output translation (always `english`).
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) language>)
text: string
The translated text.
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) text>)
segments?: Array\<[TranscriptionSegment](</api/reference/typescript/resources/audio#(resource) audio.transcriptions > (model) transcription_segment > (schema)>) { id, avg\_logprob, compression\_ratio, 7 more } \>
Segments of the translated text and their corresponding details.
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
tokens: Array\<number\>
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) segments>)
[](<#(resource) audio.translations > (model) translation_verbose > (schema)>)
[](<#(resource) audio.translations > (model) translation_create_response > (schema)>)
### Create translation
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
import OpenAI from "openai";
const openai = new OpenAI();
async function main() {
const translation = await openai.audio.translations.create({
file: fs.createReadStream("speech.mp3"),
model: "whisper-1",
});
console.log(translation.text);
}
main();
`
```
```
`{
"text": "Hello, my name is Wolfgang and I come from Germany. Where are you heading today?"
}
`
```
##### Returns Examples
```
`{
"text": "Hello, my name is Wolfgang and I come from Germany. Where are you heading today?"
}
`
```