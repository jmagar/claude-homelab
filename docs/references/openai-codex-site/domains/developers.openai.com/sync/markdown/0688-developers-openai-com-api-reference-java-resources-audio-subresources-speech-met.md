Create speech | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Audio](/api/reference/java/resources/audio)
[Speech](/api/reference/java/resources/audio/subresources/speech)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create speech
HttpResponse audio().speech().create(SpeechCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/audio/speech
Generates audio from the input text.
Returns the audio file content, or a stream of audio events.
##### ParametersExpand Collapse
SpeechCreateParams params
String input
The text to generate audio for. The maximum length is 4096 characters.
maxLength4096
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) input>)
[SpeechModel](</api/reference/java/resources/audio#(resource) audio.speech > (model) speech_model > (schema)>) model
One of the available [TTS models](https://platform.openai.com/docs/models#tts): `tts-1`, `tts-1-hd`, `gpt-4o-mini-tts`, or `gpt-4o-mini-tts-2025-12-15`.
TTS\_1("tts-1")
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 0>)
TTS\_1\_HD("tts-1-hd")
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 1>)
GPT\_4O\_MINI\_TTS("gpt-4o-mini-tts")
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 2>)
GPT\_4O\_MINI\_TTS\_2025\_12\_15("gpt-4o-mini-tts-2025-12-15")
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 3>)
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) model>)
Voice voice
The voice to use when generating the audio. Supported built-in voices are `alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `onyx`, `nova`, `sage`, `shimmer`, `verse`, `marin`, and `cedar`. You may also provide a custom voice object with an `id`, for example `{ "id": "voice\_1234" }`. Previews of the voices are available in the [Text to speech guide](https://platform.openai.com/docs/guides/text-to-speech#voice-options).
String
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) voice > (variant) 0>)
enum UnionMember1:
ALLOY("alloy")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) voice > (variant) 1 > (member) 0>)
ASH("ash")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) voice > (variant) 1 > (member) 1>)
BALLAD("ballad")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) voice > (variant) 1 > (member) 2>)
CORAL("coral")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) voice > (variant) 1 > (member) 3>)
ECHO("echo")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) voice > (variant) 1 > (member) 4>)
SAGE("sage")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) voice > (variant) 1 > (member) 5>)
SHIMMER("shimmer")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) voice > (variant) 1 > (member) 6>)
VERSE("verse")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) voice > (variant) 1 > (member) 7>)
MARIN("marin")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) voice > (variant) 1 > (member) 8>)
CEDAR("cedar")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) voice > (variant) 1>)
class Id:
Custom voice reference.
String id
The custom voice ID, e.g. `voice\_1234`.
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) voice > (variant) 2 > (property) id>)
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) voice > (variant) 2>)
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) voice>)
Optional\<String\> instructions
Control the voice of your generated audio with additional instructions. Does not work with `tts-1` or `tts-1-hd`.
maxLength4096
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) instructions>)
Optional\<ResponseFormat\> responseFormat
The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`, `wav`, and `pcm`.
MP3("mp3")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) response_format > (member) 0>)
OPUS("opus")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) response_format > (member) 1>)
AAC("aac")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) response_format > (member) 2>)
FLAC("flac")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) response_format > (member) 3>)
WAV("wav")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) response_format > (member) 4>)
PCM("pcm")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) response_format > (member) 5>)
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) response_format>)
Optional\<Double\> speed
The speed of the generated audio. Select a value from `0.25` to `4.0`. `1.0` is the default.
minimum0.25
maximum4
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) speed>)
Optional\<StreamFormat\> streamFormat
The format to stream the audio in. Supported formats are `sse` and `audio`. `sse` is not supported for `tts-1` or `tts-1-hd`.
SSE("sse")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) stream_format > (member) 0>)
AUDIO("audio")
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) stream_format > (member) 1>)
[](<#(resource) audio.speech > (method) create > (params) default > (param) body > (schema) > (property) stream_format>)
[](<#(resource) audio.speech > (method) create > (params) default>)
### Create speech
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.core.http.HttpResponse;
import com.openai.models.audio.speech.SpeechCreateParams;
import com.openai.models.audio.speech.SpeechModel;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
SpeechCreateParams params = SpeechCreateParams.builder()
.input("input")
.model(SpeechModel.TTS\_1)
.voice("string")
.build();
HttpResponse speech = client.audio().speech().create(params);
}
}`
```
##### Returns Examples