Translations | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Audio](/api/reference/java/resources/audio)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Translations
Turn audio into text or text into audio.
##### [Create translation](/api/reference/java/resources/audio/subresources/translations/methods/create)
[TranslationCreateResponse](</api/reference/java/resources/audio#(resource) audio.translations > (model) TranslationCreateResponse > (schema)>) audio().translations().create(TranslationCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/audio/translations
##### ModelsExpand Collapse
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