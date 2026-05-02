Create translation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Audio](/api/reference/java/resources/audio)
[Translations](/api/reference/java/resources/audio/subresources/translations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create translation
[TranslationCreateResponse](</api/reference/java/resources/audio#(resource) audio.translations > (model) TranslationCreateResponse > (schema)>) audio().translations().create(TranslationCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/audio/translations
Translates audio into English.
##### ParametersExpand Collapse
TranslationCreateParams params
InputStream file
The audio file object (not file name) translate, in one of these formats: flac, mp3, mp4, mpeg, mpga, m4a, ogg, wav, or webm.
[](<#(resource) audio.translations > (method) create > (params) default > (param) body > (schema) > (property) file>)
[AudioModel](</api/reference/java/resources/audio#(resource) audio > (model) audio_model > (schema)>) model
ID of the model to use. Only `whisper-1` (which is powered by our open source Whisper V2 model) is currently available.
WHISPER\_1("whisper-1")
[](<#(resource) audio > (model) audio_model > (schema) > (member) 0>)
GPT\_4O\_TRANSCRIBE("gpt-4o-transcribe")
[](<#(resource) audio > (model) audio_model > (schema) > (member) 1>)
GPT\_4O\_MINI\_TRANSCRIBE("gpt-4o-mini-transcribe")
[](<#(resource) audio > (model) audio_model > (schema) > (member) 2>)
GPT\_4O\_MINI\_TRANSCRIBE\_2025\_12\_15("gpt-4o-mini-transcribe-2025-12-15")
[](<#(resource) audio > (model) audio_model > (schema) > (member) 3>)
GPT\_4O\_TRANSCRIBE\_DIARIZE("gpt-4o-transcribe-diarize")
[](<#(resource) audio > (model) audio_model > (schema) > (member) 4>)
[](<#(resource) audio.translations > (method) create > (params) default > (param) body > (schema) > (property) model>)
Optional\<String\> prompt
An optional text to guide the model’s style or continue a previous audio segment. The [prompt](https://platform.openai.com/docs/guides/speech-to-text#prompting) should be in English.
[](<#(resource) audio.translations > (method) create > (params) default > (param) body > (schema) > (property) prompt>)
Optional\<ResponseFormat\> responseFormat
The format of the output, in one of these options: `json`, `text`, `srt`, `verbose\_json`, or `vtt`.
JSON("json")
[](<#(resource) audio.translations > (method) create > (params) default > (param) body > (schema) > (property) response_format > (member) 0>)
TEXT("text")
[](<#(resource) audio.translations > (method) create > (params) default > (param) body > (schema) > (property) response_format > (member) 1>)
SRT("srt")
[](<#(resource) audio.translations > (method) create > (params) default > (param) body > (schema) > (property) response_format > (member) 2>)
VERBOSE\_JSON("verbose\_json")
[](<#(resource) audio.translations > (method) create > (params) default > (param) body > (schema) > (property) response_format > (member) 3>)
VTT("vtt")
[](<#(resource) audio.translations > (method) create > (params) default > (param) body > (schema) > (property) response_format > (member) 4>)
[](<#(resource) audio.translations > (method) create > (params) default > (param) body > (schema) > (property) response_format>)
Optional\<Double\> temperature
The sampling temperature, between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use [log probability](https://en.wikipedia.org/wiki/Log_probability) to automatically increase the temperature until certain thresholds are hit.
[](<#(resource) audio.translations > (method) create > (params) default > (param) body > (schema) > (property) temperature>)
[](<#(resource) audio.translations > (method) create > (params) default>)
##### ReturnsExpand Collapse
class TranslationCreateResponse: A class that can be one of several variants.union
class Translation:
String text
[](<#(resource) audio.translations > (model) translation > (schema) > (property) text>)
[](<#(resource) audio.translations > (model) translation > (schema)>)
class TranslationVerbose:
double duration
The duration of the input audio.
formatdouble
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) duration>)
String language
The language of the output translation (always `english`).
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) language>)
String text
The translated text.
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) text>)
Optional\<List\<[TranscriptionSegment](</api/reference/java/resources/audio#(resource) audio.transcriptions > (model) transcription_segment > (schema)>)\>\> segments
Segments of the translated text and their corresponding details.
long id
Unique identifier of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) id>)
double avgLogprob
Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) avg_logprob>)
double compressionRatio
Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) compression_ratio>)
double end
End time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) end>)
double noSpeechProb
Probability of no speech in the segment. If the value is higher than 1.0 and the `avg\_logprob` is below -1, consider this segment silent.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) no_speech_prob>)
long seek
Seek offset of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) seek>)
double start
Start time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) start>)
double temperature
Temperature parameter used for generating the segment.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) temperature>)
String text
Text content of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) text>)
List\<long\> tokens
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) segments>)
[](<#(resource) audio.translations > (model) translation_verbose > (schema)>)
[](<#(resource) audio.translations > (model) TranslationCreateResponse > (schema)>)
### Create translation
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
import com.openai.models.audio.AudioModel;
import com.openai.models.audio.translations.TranslationCreateParams;
import com.openai.models.audio.translations.TranslationCreateResponse;
import java.io.ByteArrayInputStream;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
TranslationCreateParams params = TranslationCreateParams.builder()
.file(new ByteArrayInputStream("Example data".getBytes()))
.model(AudioModel.WHISPER\_1)
.build();
TranslationCreateResponse translation = client.audio().translations().create(params);
}
}`
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