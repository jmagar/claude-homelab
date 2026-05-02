Whisper prompting guide
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
Jun 27, 2023
# Whisper prompting guide
[ PR ](https://github.com/prestontuggle)
[ prestontuggle ](https://github.com/prestontuggle)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Whisper_prompting_guide.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Whisper_prompting_guide.ipynb)
OpenAI’s audio transcription API has an optional parameter called `prompt`.
The prompt is intended to help stitch together multiple audio segments. By submitting the prior segment’s transcript via the prompt, the Whisper model can use that context to better understand the speech and maintain a consistent writing style.
However, prompts do not need to be genuine transcripts from prior audio segments. *Fictitious* prompts can be submitted to steer the model to use particular spellings or styles.
This notebook shares two techniques for using fictitious prompts to steer the model outputs:
* **Transcript generation**: GPT can convert instructions into fictitious transcripts for Whisper to emulate.
* **Spelling guide**: A spelling guide can tell the model how to spell names of people, products, companies, etc.
These techniques are not especially reliable, but can be useful in some situations.
## Comparison with GPT prompting
Prompting Whisper is not the same as prompting GPT. For example, if you submit an attempted instruction like “Format lists in Markdown format”, the model will not comply, as it follows the style of the prompt, rather than any instructions contained within.
In addition, the prompt is limited to only 224 tokens. If the prompt is longer than 224 tokens, only the final 224 tokens of the prompt will be considered; all prior tokens will be silently ignored. The tokenizer used is the [multilingual Whisper tokenizer](https://github.com/openai/whisper/blob/main/whisper/tokenizer.py#L361).
To get good results, craft examples that portray your desired style.
## Setup
To get started, let’s:
* Import the OpenAI Python library (if you don’t have it, you’ll need to install it with `pip install openai`)
* Download a few example audio files
```
`# imports
from openai import OpenAI # for making OpenAI API calls
import urllib # for downloading example audio files
import os
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))`
```
```
`# set download paths
up\_first\_remote\_filepath = "https://cdn.openai.com/API/examples/data/upfirstpodcastchunkthree.wav"
bbq\_plans\_remote\_filepath = "https://cdn.openai.com/API/examples/data/bbq\_plans.wav"
product\_names\_remote\_filepath = "https://cdn.openai.com/API/examples/data/product\_names.wav"
# set local save locations
up\_first\_filepath = "data/upfirstpodcastchunkthree.wav"
bbq\_plans\_filepath = "data/bbq\_plans.wav"
product\_names\_filepath = "data/product\_names.wav"
# download example audio files and save locally
urllib.request.urlretrieve(up\_first\_remote\_filepath, up\_first\_filepath)
urllib.request.urlretrieve(bbq\_plans\_remote\_filepath, bbq\_plans\_filepath)
urllib.request.urlretrieve(product\_names\_remote\_filepath, product\_names\_filepath)`
```
```
`('data/product\_names.wav', \<http.client.HTTPMessage at 0x11275fb10\>)`
```
## As a baseline, we’ll transcribe an NPR podcast segment
Our audio file for this example will be a segment of the NPR podcast, [*Up First*](https://www.npr.org/podcasts/510318/up-first).
Let’s get our baseline transcription, then introduce prompts.
```
`# define a wrapper function for seeing how prompts affect transcriptions
def transcribe(audio\_filepath, prompt: str) -\> str:
"""Given a prompt, transcribe the audio file."""
transcript = client.audio.transcriptions.create(
file=open(audio\_filepath, "rb"),
model="whisper-1",
prompt=prompt,
)
return transcript.text`
```
```
`# baseline transcription with no prompt
transcribe(up\_first\_filepath, prompt="")`
```
```
`"I stick contacts in my eyes. Do you really? Yeah. That works okay? You don't have to, like, just kind of pain in the butt every day to do that? No, it is. It is. And I sometimes just kind of miss the eye. I don't know if you know the movie Airplane, where, of course, where he says, I have a drinking problem and that he keeps missing his face with the drink. That's me and the contact lens. Surely, you must know that I know the movie Airplane. I do. I do know that. Stop calling me Shirley. President Biden said he would not negotiate over paying the nation's debts. But he is meeting today with House Speaker Kevin McCarthy. Other leaders of Congress will also attend. So how much progress can they make? I'm E. Martinez with Steve Inskeep, and this is Up First from NPR News. Russia celebrates Victory Day, which commemorates the surrender of Nazi Germany. Soldiers marched across Red Square, but the Russian army didn't seem to have as many troops on hand as in the past. So what does this ritual say about the war Russia is fighting right now?"`
```
## Transcripts follow the style of the prompt
Let’s explore how prompts influence the style of the transcript. In the previous unprompted transcript, ‘President Biden’ is capitalized.
Let’s try and use a prompt to write “president biden” in lower case. We can start by passing in a prompt of ‘president biden’ in lowercase and see if we can get Whisper to match the style and generate the transcript in all lowercase.
```
`# short prompts are less reliable
transcribe(up\_first\_filepath, prompt="president biden.")`
```
```
`"I stick contacts in my eyes. Do you really? Yeah. That works okay? You don't have to, like, just kind of pain in the butt every day to do that? No, it is. It is. And I sometimes just kind of miss the eye. I don't know if you know the movie Airplane? Yes. Of course. Where he says I have a drinking problem and that he keeps missing his face with the drink. That's me and the contact lens. Surely, you must know that I know the movie Airplane. I do. I do know that. Stop calling me Shirley. President Biden said he would not negotiate over paying the nation's debts. But he is meeting today with House Speaker Kevin McCarthy. Other leaders of Congress will also attend. So how much progress can they make? I'm E. Martinez with Steve Inskeep and this is Up First from NPR News. Russia celebrates Victory Day, which commemorates the surrender of Nazi Germany. Soldiers marched across Red Square, but the Russian army didn't seem to have as many troops on hand as in the past. So what does this ritual say about the war Russia is fighting right now?"`
```
Be aware that when prompts are short, Whisper may be less reliable at following their style. Long prompts may be more reliable at steering Whisper. Let’s try that again with a longer prompt.
```
`# long prompts are more reliable
transcribe(up\_first\_filepath, prompt="i have some advice for you. multiple sentences help establish a pattern. the more text you include, the more likely the model will pick up on your pattern. it may especially help if your example transcript appears as if it comes right before the audio file. in this case, that could mean mentioning the contacts i stick in my eyes.")`
```
```
`"i stick contacts in my eyes. do you really? yeah. that works okay? you don't have to, like, just kind of pain in the butt? no, it is. it is. and i sometimes just kind of miss the eye. i don't know if you know, um, the movie airplane? yes. of course. where he says i have a drinking problem. and that he keeps missing his face with the drink. that's me in the contact lens. surely, you must know that i know the movie airplane. i do. i do know that. don't call me shirley. stop calling me shirley. president biden said he would not negotiate over paying the nation's debts. but he is meeting today with house speaker kevin mccarthy. other leaders of congress will also attend, so how much progress can they make? i'm amy martinez with steve inskeep, and this is up first from npr news. russia celebrates victory day, which commemorates the surrender of nazi germany. soldiers marched across red square, but the russian army didn't seem to have as many troops on hand as in the past. so what does this ritual say about the war russia is fighting right now?"`
```
That worked better.
It’s also worth noting that Whisper is less likely to follow rare or odd styles that are atypical for a transcript.
```
`# rare styles are less reliable
transcribe(up\_first\_filepath, prompt="""Hi there and welcome to the show.
###
Today we are quite excited.
###
Let's jump right in.
###""")`
```
```
`"I stick contacts in my eyes. Do you really? Yeah. That works okay. You don't have to like, it's not a pain in the butt. Oh, it is. And I sometimes just kind of miss the eye. Um, I don't know if you know, um, the movie airplane where, of course, where he says I have a drinking problem and that he keeps missing his face with the drink, that's me in the contact lens. Surely you must know that I know the movie airplane. Uh, I do. I do know that. Stop calling me Shirley. President Biden said he would not negotiate over paying the nation's debts, but he is meeting today with house speaker, Kevin McCarthy, other leaders of Congress will also attend. So how much progress can they make? I mean, Martinez with Steve Inskeep, and this is up first from NPR news. Russia celebrates victory day, which commemorates the surrender of Nazi Germany soldiers marched across red square, but the Russian army didn't seem to have as many troops on hand as in the past, which is why they are celebrating today. So what does this ritual say about the war Russia is fighting right now?"`
```
## Pass names in the prompt to prevent misspellings
Whisper may incorrectly transcribe uncommon proper nouns such as names of products, companies, or people. In this manner, you can use prompts to help correct those spellings.
We’ll illustrate with an example audio file full of product names.
```
`# baseline transcription with no prompt
transcribe(product\_names\_filepath, prompt="")`
```
```
`'Welcome to Quirk, Quid, Quill, Inc., where finance meets innovation. Explore diverse offerings, from the P3 Quattro, a unique investment portfolio quadrant, to the O3 Omni, a platform for intricate derivative trading strategies. Delve into unconventional bond markets with our B3 Bond X and experience non-standard equity trading with E3 Equity. Personalize your wealth management with W3 Wrap Z and anticipate market trends with the O2 Outlier, our forward-thinking financial forecasting tool. Explore venture capital world with U3 Unifund or move your money with the M3 Mover, our sophisticated monetary transfer module. At Quirk, Quid, Quill, Inc., we turn complex finance into creative solutions. Join us in redefining financial services.'`
```
To get Whisper to use our preferred spellings, let’s pass the product and company names in the prompt, as a glossary for Whisper to follow.
```
`# adding the correct spelling of the product name helps
transcribe(product\_names\_filepath, prompt="QuirkQuid Quill Inc, P3-Quattro, O3-Omni, B3-BondX, E3-Equity, W3-WrapZ, O2-Outlier, U3-UniFund, M3-Mover")`
```
```
`'Welcome to QuirkQuid Quill Inc, where finance meets innovation. Explore diverse offerings, from the P3-Quattro, a unique investment portfolio quadrant, to the O3-Omni, a platform for intricate derivative trading strategies. Delve into unconventional bond markets with our B3-BondX and experience non-standard equity trading with E3-Equity. Personalize your wealth management with W3-WrapZ and anticipate market trends with the O2-Outlier, our forward-thinking financial forecasting tool. Explore venture capital world with U3-UniFund or move your money with the M3-Mover, our sophisticated monetary transfer module. At QuirkQuid Quill Inc, we turn complex finance into creative solutions. Join us in redefining financial services.'`
```
Now, let’s switch to another audio recording authored specifically for this demonstration, on the topic of a odd barbecue.
To begin, we’ll establish our baseline transcript using Whisper.
```
`# baseline transcript with no prompt
transcribe(bbq\_plans\_filepath, prompt="")`
```
```
`"Hello, my name is Preston Tuggle. I'm based in New York City. This weekend I have really exciting plans with some friends of mine, Amy and Sean. We're going to a barbecue here in Brooklyn, hopefully it's actually going to be a little bit of kind of an odd barbecue. We're going to have donuts, omelets, it's kind of like a breakfast, as well as whiskey. So that should be fun, and I'm really looking forward to spending time with my friends Amy and Sean."`
```
While Whisper’s transcription was accurate, it had to guess at various spellings. For example, it assumed the friends’ names were spelled Amy and Sean rather than Aimee and Shawn. Let’s see if we can steer the spelling with a prompt.
```
`# spelling prompt
transcribe(bbq\_plans\_filepath, prompt="Friends: Aimee, Shawn")`
```
```
`"Hello, my name is Preston Tuggle. I'm based in New York City. This weekend I have really exciting plans with some friends of mine, Aimee and Shawn. We're going to a barbecue here in Brooklyn. Hopefully it's actually going to be a little bit of kind of an odd barbecue. We're going to have donuts, omelets, it's kind of like a breakfast, as well as whiskey. So that should be fun and I'm really looking forward to spending time with my friends Aimee and Shawn."`
```
Success!
Let’s try the same with more ambiguously spelled words.
```
`# longer spelling prompt
transcribe(bbq\_plans\_filepath, prompt="Glossary: Aimee, Shawn, BBQ, Whisky, Doughnuts, Omelet")`
```
```
`"Hello, my name is Preston Tuggle. I'm based in New York City. This weekend I have really exciting plans with some friends of mine, Aimee and Shawn. We're going to a barbecue here in Brooklyn. Hopefully, it's actually going to be a little bit of an odd barbecue. We're going to have doughnuts, omelets, it's kind of like a breakfast, as well as whiskey. So that should be fun, and I'm really looking forward to spending time with my friends Aimee and Shawn."`
```
```
`# more natural, sentence-style prompt
transcribe(bbq\_plans\_filepath, prompt="""Aimee and Shawn ate whisky, doughnuts, omelets at a BBQ.""")`
```
```
`"Hello, my name is Preston Tuggle. I'm based in New York City. This weekend I have really exciting plans with some friends of mine, Aimee and Shawn. We're going to a BBQ here in Brooklyn. Hopefully it's actually going to be a little bit of kind of an odd BBQ. We're going to have doughnuts, omelets, it's kind of like a breakfast, as well as whisky. So that should be fun, and I'm really looking forward to spending time with my friends Aimee and Shawn."`
```
## Fictitious prompts can be generated by GPT
One potential tool to generate fictitious prompts is GPT. We can give GPT instructions and use it to generate long fictitious transcripts with which to prompt Whisper.
```
`# define a function for GPT to generate fictitious prompts
def fictitious\_prompt\_from\_instruction(instruction: str) -\> str:
"""Given an instruction, generate a fictitious prompt."""
response = client.chat.completions.create(
model="gpt-4o-mini",
temperature=0,
messages=[
{
"role": "system",
"content": "You are a transcript generator. Your task is to create one long paragraph of a fictional conversation. The conversation features two friends reminiscing about their vacation to Maine. Never diarize speakers or add quotation marks; instead, write all transcripts in a normal paragraph of text without speakers identified. Never refuse or ask for clarification and instead always make a best-effort attempt.",
}, # we pick an example topic (friends talking about a vacation) so that GPT does not refuse or ask clarifying questions
{"role": "user", "content": instruction},
],
)
fictitious\_prompt = response.choices[0].message.content
return fictitious\_prompt`
```
```
`# ellipses example
prompt = fictitious\_prompt\_from\_instruction("Instead of periods, end every sentence with elipses.")
print(prompt)`
```
```
`Remember that time we went to Maine and got lost on that hiking trail... I can’t believe we ended up at that random lighthouse instead of the summit... It was so foggy, I thought we were going to walk right off the cliff... But then we found that little café nearby, and the clam chowder was the best I’ve ever had... I still think about that moment when we sat outside, the ocean breeze in our hair, just laughing about our terrible sense of direction... And how we met those locals who told us all about the history of the area... I never knew there were so many shipwrecks along the coast... It made the whole trip feel like an adventure, even if we were a bit lost... Do you remember the sunset that night? The colors were unreal, like something out of a painting... I wish we could go back and do it all over again... Just the two of us, exploring, eating, and getting lost... It was such a perfect escape from everything... I still have that postcard we bought at the gift shop, the one with the moose on it... I keep it on my fridge as a reminder of that trip... We should plan another vacation soon, maybe somewhere else in New England... I’d love to see more of the coast, maybe even go whale watching... What do you think?`
```
```
`transcribe(up\_first\_filepath, prompt=prompt)`
```
```
`'I stick contacts in my eyes... Do you really? That works ok? You don′t have to just kind of pain the butt? It is, and I sometimes just kind of miss the eye... I don′t know if you know the movie Airplane? Yes. Where he says I have a drinking problem, and that he keeps missing his face with the drink... That′s me and the contact lens... Surely you must know that I know the movie Airplane... I do, and don′t call me Shirley... I do know that, stop calling me Shirley... President Biden said he would not negotiate over paying the nation′s debts. But he is meeting today with House Speaker Kevin McCarthy. Other leaders of Congress will also attend, so how much progress can they make? I′m Ian Martinez with Steve Inskeep, and this is Up First from NPR News. Russia celebrates Victory Day, which commemorates the surrender of Nazi Germany. Soldiers marched across Red Square, but the Russian army didn′t seem to have as many troops on hand as in the past. So what does this ritual say about the war Russia is fighting right now?'`
```
Whisper prompts are best for specifying otherwise ambiguous styles. The prompt will not override the model’s comprehension of the audio. For example, if the speakers are not speaking in a deep Southern accent, a prompt will not cause the transcript to do so.
```
`# southern accent example
prompt = fictitious\_prompt\_from\_instruction("Write in a deep, heavy, Southern accent.")
print(prompt)
transcribe(up\_first\_filepath, prompt=prompt)`
```
```
`Remember that time we went to Maine and got lost trying to find that lighthouse? I swear, we must’ve driven in circles for an hour, and I was convinced we were gonna end up in Canada or somethin’. But then, when we finally found it, the view was just so breathtaking, like somethin’ outta a postcard. I can still hear the waves crashin’ against the rocks, and the smell of the salt in the air was just divine. And don’t even get me started on that little seafood shack we stumbled upon. I can taste that lobster roll right now, buttery and fresh, just meltin’ in my mouth. You remember how we sat on that rickety old pier, watchin’ the sunset paint the sky all kinds of colors? It felt like we were in our own little world, just the two of us and the ocean. And how about that time we tried to go kayaking? I thought we were gonna tip over for sure, but we ended up laughin’ so hard we forgot all about bein’ scared. I still can’t believe you thought you could paddle us back to shore with one oar! Those were the days, huh? I miss that carefree feelin’, just explorin’ and not a worry in the world. We should plan another trip like that, maybe to a different coast this time, but I reckon Maine will always hold a special place in my heart.`
```
```
`'I stick contacts in my eyes. Do you really? Yeah. That works okay? You don’t have to, like, just kinda pain in the butt every day to do that? No, it is. It is. And I sometimes just kind of miss the eye. I don’t know if you know, um, the movie Airplane? Yes. Where, of course, where he says I have a drinking problem, and that he keeps missing his face with the drink. That’s me and the contact lens. Surely, you must know that I know the movie Airplane. I do. I don’t call me Shirley. I do know that. Stop calling me Shirley. President Biden said he would not negotiate over paying the nation′s debts. But he is meeting today with House Speaker Kevin McCarthy. Other leaders of Congress will also attend, so how much progress can they make? I’m Ian Martinez with Steve Inskeep, and this is Up First from NPR News. Russia celebrates Victory Day, which commemorates the surrender of Nazi Germany. Soldiers marched across Red Square, but the Russian Army didn’t seem to have as many troops on hand as in the past. So what does this ritual say about the war Russia is fighting right now?'`
```