Steering Text-to-Speech for more dynamic audio generation
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ Home ](/cookbook)
### Topics
* [ Agents ](/cookbook/topic/agents)
* [ Evals ](/cookbook/topic/evals)
* [ Multimodal ](/cookbook/topic/multimodal)
* [ Text ](/cookbook/topic/text)
* [ Guardrails ](/cookbook/topic/guardrails)
* [ Optimization ](/cookbook/topic/optimization)
* [ ChatGPT ](/cookbook/topic/chatgpt)
* [ Codex ](/cookbook/topic/codex)
* [ gpt-oss ](/cookbook/topic/gpt-oss)
### Contribute
* [ Cookbook on GitHub ](https://github.com/openai/openai-cookbook)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Copy Page
Nov 1, 2024
# Steering Text-to-Speech for more dynamic audio generation
[ EN ](https://github.com/ericning-o)[ GB ](https://github.com/gbergengruen)
[ Eric Ning
(OpenAI)
, ](https://github.com/ericning-o)[ Guillermo Bergengruen ](https://github.com/gbergengruen)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/voice_solutions/steering_tts.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/voice_solutions/steering_tts.ipynb)
## Steering Text-to-Speech for more dynamic audio generation
Our traditional [TTS APIs](https://platform.openai.com/docs/guides/text-to-speech) don’t have the ability to steer the voice of the generated audio. For example, if you wanted to convert a paragraph of text to audio, you would not be able to give any specific instructions on audio generation.
With [audio chat completions](https://platform.openai.com/docs/guides/audio/quickstart), you can give specific instructions before generating the audio. This allows you to tell the API to speak at different speeds, tones, and accents. With appropriate instructions, these voices can be more dynamic, natural, and context-appropriate.
### Traditional TTS
Traditional TTS can specify voices, but not the tone, accent, or any other contextual audio parameters.
```
`from openai import OpenAI
client = OpenAI()
tts\_text = """
Once upon a time, Leo the lion cub woke up to the smell of pancakes and scrambled eggs.
His tummy rumbled with excitement as he raced to the kitchen. Mama Lion had made a breakfast feast!
Leo gobbled up his pancakes, sipped his orange juice, and munched on some juicy berries.
"""
speech\_file\_path = "./sounds/default\_tts.mp3"
response = client.audio.speech.create(
model="tts-1-hd",
voice="alloy",
input=tts\_text,
)
response.write\_to\_file(speech\_file\_path)`
```
### Chat Completions TTS
With chat completions, you can give specific instructions before generating the audio. In the following example, we generate a British accent in a learning setting for children. This is particularly useful for educational applications where the voice of the assistant is important for the learning experience.
```
`import base64
speech\_file\_path = "./sounds/chat\_completions\_tts.mp3"
completion = client.chat.completions.create(
model="gpt-4o-audio-preview",
modalities=["text", "audio"],
audio={"voice": "alloy", "format": "mp3"},
messages=[
{
"role": "system",
"content": "You are a helpful assistant that can generate audio from text. Speak in a British accent and enunciate like you're talking to a child.",
},
{
"role": "user",
"content": tts\_text,
}
],
)
mp3\_bytes = base64.b64decode(completion.choices[0].message.audio.data)
with open(speech\_file\_path, "wb") as f:
f.write(mp3\_bytes)
speech\_file\_path = "./sounds/chat\_completions\_tts\_fast.mp3"
completion = client.chat.completions.create(
model="gpt-4o-audio-preview",
modalities=["text", "audio"],
audio={"voice": "alloy", "format": "mp3"},
messages=[
{
"role": "system",
"content": "You are a helpful assistant that can generate audio from text. Speak in a British accent and speak really fast.",
},
{
"role": "user",
"content": tts\_text,
}
],
)
mp3\_bytes = base64.b64decode(completion.choices[0].message.audio.data)
with open(speech\_file\_path, "wb") as f:
f.write(mp3\_bytes)`
```
### Chat Completions Multilingual TTS
We can also generate audio in different language accents. In the following example, we generate audio in a specific Spanish Uruguayan accent.
```
`completion = client.chat.completions.create(
model="gpt-4o",
messages=[
{
"role": "system",
"content": "You are an expert translator. Translate any text given into Spanish like you are from Uruguay.",
},
{
"role": "user",
"content": tts\_text,
}
],
)
translated\_text = completion.choices[0].message.content
print(translated\_text)
speech\_file\_path = "./sounds/chat\_completions\_tts\_es\_uy.mp3"
completion = client.chat.completions.create(
model="gpt-4o-audio-preview",
modalities=["text", "audio"],
audio={"voice": "alloy", "format": "mp3"},
messages=[
{
"role": "system",
"content": "You are a helpful assistant that can generate audio from text. Speak any text that you receive in a Uruguayan spanish accent and more slowly.",
},
{
"role": "user",
"content": translated\_text,
}
],
)
mp3\_bytes = base64.b64decode(completion.choices[0].message.audio.data)
with open(speech\_file\_path, "wb") as f:
f.write(mp3\_bytes)`
```
```
`Había una vez un leoncito llamado Leo que se despertó con el aroma de panqueques y huevos revueltos. Su pancita gruñía de emoción mientras corría hacia la cocina. ¡Mamá León había preparado un festín de desayuno! Leo devoró sus panqueques, sorbió su jugo de naranja y mordisqueó algunas bayas jugosas.`
```
## Conclusion
The ability to steer the voice of the generated audio opens up a lot of possibilities for richer audio experiences. There are many use cases such as:
* **Enhanced Expressiveness**: Steerable TTS allows adjustments in tone, pitch, speed, and emotion, enabling the voice to convey different moods (e.g., excitement, calmness, urgency).
* **Language learning and education**: Steerable TTS can mimic accents, inflections, and pronunciation, which is beneficial for language learners and educational applications where accurate intonation and emphasis are critical.
* **Contextual Voice**: Steerable TTS adapts the voice to fit the content’s context, such as formal tones for professional documents or friendly, conversational styles for social interactions. This helps create more natural conversations in virtual assistants and chatbots.