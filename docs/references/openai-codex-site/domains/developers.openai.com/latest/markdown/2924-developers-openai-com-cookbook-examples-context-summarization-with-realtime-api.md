Context Summarization with Realtime API
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
May 10, 2025
# Context Summarization with Realtime API
[ MH ](https://www.linkedin.com/in/minhajul-hoque-83242b163/)
[ Minhajul Hoque ](https://www.linkedin.com/in/minhajul-hoque-83242b163/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Context_summarization_with_realtime_api.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Context_summarization_with_realtime_api.ipynb)
## 1. Overview
Build an end‑to‑end **voice bot** that listens to your mic, speaks back in real time and **summarises long conversations** so quality never drops.
### What You’ll Learn
1. **Live microphone streaming** → OpenAI *Realtime* (voice‑to‑voice) endpoint.
2. **Instant transcripts & speech playback** on every turn.
3. **Conversation state container** that stores **every** user/assistant message.
4. **Automatic “context trim”** – when the token window becomes very large (configurable), older turns are compressed into a summary.
5. **Extensible design** you can adapt to support customer‑support bots, kiosks, or multilingual assistants.
### Prerequisites
|Requirement|Details|
|**Python ≥ 3.10**|Will ensure that you don’t hit any issues|
|**OpenAI API key**|Set `OPENAI\_API\_KEY` in your shell or paste inline (*not ideal for prod*)|
|Mic + speakers|Grant OS permission if prompted|
**Need help setting up the key?**
>
> Follow the
[> official quick‑start guide
](https://platform.openai.com/docs/quickstart#step-2-set-your-api-key)> .
>
*Notes:*
>
>
1. > gpt-realtime supports a 32k token context window, though in certain use cases, you may notice performance degrade as you stuff more tokens into the context window.
>
2. > Token window = all tokens (words and audio tokens) the model currently keeps in memory for the session.x
>
>
### One‑liner install (run in a fresh cell)
*New API Parameters:*
>
>
1. > The Realtime API GA has releases a new parameter
[`> truncation
`](https://platform.openai.com/docs/api-reference/realtime-client-events/session/update#realtime-client-events/session/update-session-realtime-session-configuration-truncation)> . This parameter automatically optimizes context truncation, preserving relevant information while maximizing cache hit rates.
>
>
```
`# Run once to install or upgrade dependencies (comment out if already installed)
# !pip install --upgrade openai websockets sounddevice simpleaudio`
```
```
`# Standard library imports
import os
import sys
import io
import json
import base64
import pathlib
import wave
from dataclasses import dataclass, field
from typing import List, Literal
# Third-party imports
import asyncio
import numpy as np
import sounddevice as sd # microphone capture
import simpleaudio # speaker playback
import websockets # WebSocket client
import openai # OpenAI Python SDK \>= 1.14.0`
```
```
`# Set your API key safely
openai.api\_key = os.getenv("OPENAI\_API\_KEY", "")
if not openai.api\_key:
raise ValueError("OPENAI\_API\_KEY not found – please set env var or edit this cell.")`
```
## 2. Token Utilisation – Text vs Voice
Large‑token windows are precious, every extra token you use costs latency + money.
For **audio** the input token window increases much faster than for plain text because amplitude, timing, and other acoustic details must be represented.
In practice you’ll often see **≈ 10 ×** more tokens for the *same* sentence in audio versus text.
* gpt-realtime accepts up to **32k tokens** and as the token size increases, instruction adherence can drift.
* Every user/assistant turn consumes tokens → the window **only grows**.
* **Strategy**: Summarise older turns into a single assistant message, keep the last few verbatim turns, and continue.
## 3. Helper Functions
The following helper functions will enable us to run the full script.
### 3.1 Conversation State
Unlike HTTP-based Chat Completions, the Realtime API maintains an open, **stateful** session with two key components:
|Component|Purpose|
|**Session**|Controls global settings — model, voice, modalities, VAD, etc.|
|**Conversation**|Stores turn-by-turn messages between user and assistant — both audio and text.|
This notebook wraps these components inside a simple `ConversationState` object to keep your logic clean, track history, and manage summarization when context windows fill up.
```
`@dataclass
class Turn:
"""One utterance in the dialogue (user \*\*or\*\* assistant)."""
role: Literal["user", "assistant"]
item\_id: str # Server‑assigned identifier
text: str | None = None # Filled once transcript is ready
@dataclass
class ConversationState:
"""All mutable data the session needs — nothing more, nothing less."""
history: List[Turn] = field(default\_factory=list) # Ordered log
waiting: dict[str, asyncio.Future] = field(default\_factory=dict) # Pending transcript fetches
summary\_count: int = 0
latest\_tokens: int = 0 # Window size after last reply
summarising: bool = False # Guard so we don’t run two summaries at once`
```
A quick helper to peek at the transcript:
```
`def print\_history(state) -\> None:
"""Pretty-print the running transcript so far."""
print("—— Conversation so far ———————————————")
for turn in state.history:
text\_preview = (turn.text or "").strip().replace("\\n", " ")
print(f"[{turn.role:\<9}] {text\_preview} ({turn.item\_id})")
print("——————————————————————————————————————————")`
```
### 3.2 · Streaming Audio
We’ll stream raw PCM‑16 microphone data straight into the Realtime API.
The pipeline is: mic ─► async.Queue ─► WebSocket ─► Realtime API
#### 3.2.1 Capture Microphone Input
We’ll start with a coroutine that:
* Opens the default mic at **24 kHz, mono, PCM‑16** (one of the [format](https://platform.openai.com/docs/api-reference/realtime-sessions/create#realtime-sessions-create-input_audio_format) Realtime accepts).
* Slices the stream into **≈ 40 ms** blocks.
* Dumps each block into an `asyncio.Queue` so another task (next section) can forward it to OpenAI.
```
`async def mic\_to\_queue(pcm\_queue: asyncio.Queue[bytes]) -\> None:
"""
Capture raw PCM‑16 microphone audio and push \~CHUNK\_DURATION\_MS chunks
to \*pcm\_queue\* until the surrounding task is cancelled.
Parameters
----------
pcm\_queue : asyncio.Queue[bytes]
Destination queue for PCM‑16 frames (little‑endian int16).
"""
blocksize = int(SAMPLE\_RATE\_HZ \* CHUNK\_DURATION\_MS / 1000)
def \_callback(indata, \_frames, \_time, status):
if status: # XRuns, device changes, etc.
print("⚠️", status, file=sys.stderr)
try:
pcm\_queue.put\_nowait(bytes(indata)) # 1‑shot enqueue
except asyncio.QueueFull:
# Drop frame if upstream (WebSocket) can’t keep up.
pass
# RawInputStream is synchronous; wrap in context manager to auto‑close.
with sd.RawInputStream(
samplerate=SAMPLE\_RATE\_HZ,
blocksize=blocksize,
dtype="int16",
channels=1,
callback=\_callback,
):
try:
# Keep coroutine alive until cancelled by caller.
await asyncio.Event().wait()
finally:
print("⏹️ Mic stream closed.")`
```
#### 3.2.2 Send Audio Chunks to the API
Our mic task is now filling an `asyncio.Queue` with raw PCM‑16 blocks.
Next step: pull chunks off that queue, **base‑64 encode** them (the protocol requires JSON‑safe text), and ship each block to the Realtime WebSocket as an `input\_audio\_buffer.append` event.
```
`# Helper function to encode audio chunks in base64
b64 = lambda blob: base64.b64encode(blob).decode()
async def queue\_to\_websocket(pcm\_queue: asyncio.Queue[bytes], ws):
"""Read audio chunks from queue and send as JSON events."""
try:
while (chunk := await pcm\_queue.get()) is not None:
await ws.send(json.dumps({
"type": "input\_audio\_buffer.append",
"audio": b64(chunk),
}))
except websockets.ConnectionClosed:
print("WebSocket closed – stopping uploader")`
```
#### 3.2.3 Handle Incoming Events
Once audio reaches the server, the Realtime API pushes a stream of JSON events back over the **same** WebSocket.
Understanding these events is critical for:
* Printing live transcripts
* Playing incremental audio back to the user
* Keeping an accurate [`Conversation State`](https://platform.openai.com/docs/api-reference/realtime-server-events/conversation/created) so context trimming works later
|Event type|When it arrives|Why it matters|Typical handler logic|
|**`session.created`**|Immediately after the WebSocket handshake|Confirms the session is open and provides the `session.id`.|Log the ID for traceability and verify the connection.|
|**`session.updated`**|After you send a `session.update` call|Acknowledges that the server applied new session settings.|Inspect the echoed settings and update any local cache.|
|**`conversation.item.created`** (user)|A few ms after the user stops speaking (client VAD fires)|Reserves a timeline slot; transcript may still be **`null`**.|Insert a *placeholder* user turn in `state.history` marked “pending transcript”.|
|**`conversation.item.retrieved`**|\~100 – 300 ms later, once audio transcription is complete|Supplies the final user transcript (with timing).|Replace the placeholder with the transcript and print it if desired.|
|**`response.audio.delta`**|Every 20 – 60 ms while the assistant is speaking|Streams PCM‑16 audio chunks (and optional incremental text).|Buffer each chunk and play it; optionally show partial text in the console.|
|**`response.done`**|After the assistant’s last token|Signals both audio & text are complete; includes usage stats.|Finalize the assistant turn, update `state.latest\_tokens`, and log usage.|
|**`conversation.item.deleted`**|Whenever you prune with `conversation.item.delete`|Confirms a turn was removed, freeing tokens on the server.|Mirror the deletion locally so your context window matches the server’s.|
### 3.3 Detect When to Summarise
The Realtime model keeps a **large 32 k‑token window**, but quality can drift long before that limit as you stuff more context into the model.
Our goal: **auto‑summarise** once the running window nears a safe threshold (default **2 000 tokens** for the notebook), then prune the superseded turns both locally *and* server‑side.
We monitor latest\_tokens returned in `response.done`. When it exceeds SUMMARY\_TRIGGER and we have more than KEEP\_LAST\_TURNS, we spin up a background summarization coroutine.
We compress everything except the last 2 turns into a single French paragraph, then:
1. Insert that paragraph as a new assistant message at the top of the conversation.
2. Delete the message items that was used for the summary.
We will later ask the Voice agent what language was the summary to test if the Summary insertion into Realtime API Conversation Context was successful.
```
`async def run\_summary\_llm(text: str) -\> str:
"""Call a lightweight model to summarise `text`."""
resp = await asyncio.to\_thread(lambda: openai.chat.completions.create(
model=SUMMARY\_MODEL,
temperature=0,
messages=[
{"role": "system", "content": "Summarise in French the following conversation "
"in one concise paragraph so it can be used as "
"context for future dialogue."},
{"role": "user", "content": text},
],
))
return resp.choices[0].message.content.strip()`
```
Important implementation detail:
* The summary is appended as a SYSTEM message rather than an ASSISTANT message. Testing revealed that, during extended conversations, using ASSISTANT messages for summaries can cause the model to mistakenly switch from audio responses to text responses. By using SYSTEM messages for summaries (which can also include additional custom instructions), we clearly signal to the model that these are context-setting instructions, preventing it from incorrectly adopting the modality of the ongoing user-assistant interaction.
```
`async def summarise\_and\_prune(ws, state):
"""Summarise old turns, delete them server‑side, and prepend a single summary
turn locally + remotely."""
state.summarising = True
print(
f"⚠️ Token window ≈{state.latest\_tokens} ≥ {SUMMARY\_TRIGGER}. Summarising…",
)
old\_turns, recent\_turns = state.history[:-KEEP\_LAST\_TURNS], state.history[-KEEP\_LAST\_TURNS:]
convo\_text = "\\n".join(f"{t.role}: {t.text}" for t in old\_turns if t.text)
if not convo\_text:
print("Nothing to summarise (transcripts still pending).")
state.summarising = False
summary\_text = await run\_summary\_llm(convo\_text) if convo\_text else ""
state.summary\_count += 1
summary\_id = f"sum\_{state.summary\_count:03d}"
state.history[:] = [Turn("assistant", summary\_id, summary\_text)] + recent\_turns
print\_history(state)
# Create summary on server
await ws.send(json.dumps({
"type": "conversation.item.create",
"previous\_item\_id": "root",
"item": {
"id": summary\_id,
"type": "message",
"role": "system",
"content": [{"type": "input\_text", "text": summary\_text}],
},
}))
# Delete old items
for turn in old\_turns:
await ws.send(json.dumps({
"type": "conversation.item.delete",
"item\_id": turn.item\_id,
}))
print(f"✅ Summary inserted ({summary\_id})")
state.summarising = False`
```
The following function lets us poll for transcripts over time. This is useful in cases where the user’s audio hasn’t been transcribed immediately, so we can retrieve the final result later.
```
`async def fetch\_full\_item(
ws, item\_id: str, state: ConversationState, attempts: int = 1
):
"""
Ask the server for a full conversation item; retry up to 5× if the
transcript field is still null. Resolve the waiting future when done.
"""
# If there is already a pending fetch, just await it
if item\_id in state.waiting:
return await state.waiting[item\_id]
fut = asyncio.get\_running\_loop().create\_future()
state.waiting[item\_id] = fut
await ws.send(json.dumps({
"type": "conversation.item.retrieve",
"item\_id": item\_id,
}))
item = await fut
# If transcript still missing retry (max 5×)
if attempts \< 5 and not item.get("content", [{}])[0].get("transcript"):
await asyncio.sleep(0.4 \* attempts)
return await fetch\_full\_item(ws, item\_id, state, attempts + 1)
# Done – remove the marker
state.waiting.pop(item\_id, None)
return item`
```
## 4. End‑to‑End Workflow Demonstration
Run the two cells below to launch an interactive session. Interrupt the cell stop recording.
>
**> Note:
**
> This notebook uses
`> SUMMARY_TRIGGER = 2000
`> and
`> KEEP_LAST_TURNS = 2
`> to make summarization easier to demo quickly.
> In production, you should tune these values based on your application’s needs.
>
>
* > A typical
`> SUMMARY_TRIGGER
`> falls between
**> 20,000–32,000 tokens
**> , depending on how performance degrades with larger context for your use case.
>
>
```
`# Audio/config knobs
SAMPLE\_RATE\_HZ = 24\_000 # Required by pcm16
CHUNK\_DURATION\_MS = 40 # chunk size for audio capture
BYTES\_PER\_SAMPLE = 2 # pcm16 = 2 bytes/sample
SUMMARY\_TRIGGER = 2\_000 # Summarise when context ≥ this
KEEP\_LAST\_TURNS = 2 # Keep these turns verbatim
SUMMARY\_MODEL = "gpt-4o-mini" # Cheaper, fast summariser`
```
```
`# --------------------------------------------------------------------------- #
# Realtime session #
# --------------------------------------------------------------------------- #
async def realtime\_session(model="gpt-realtime", voice="shimmer", enable\_playback=True):
"""
Main coroutine: connects to the Realtime endpoint, spawns helper tasks,
and processes incoming events in a big async‑for loop.
"""
state = ConversationState() # Reset state for each run
pcm\_queue: asyncio.Queue[bytes] = asyncio.Queue()
assistant\_audio: List[bytes] = []
# ----------------------------------------------------------------------- #
# Open the WebSocket connection to the Realtime API #
# ----------------------------------------------------------------------- #
url = f"wss://api.openai.com/v1/realtime?model={model}"
headers = {"Authorization": f"Bearer {openai.api\_key}"}
async with websockets.connect(url, extra\_headers=headers, max\_size=1 \<\< 24) as ws:
# ------------------------------------------------------------------- #
# Wait until server sends session.created #
# ------------------------------------------------------------------- #
while json.loads(await ws.recv())["type"] != "session.created":
pass
print("session.created ✅")
# ------------------------------------------------------------------- #
# Configure session: voice, modalities, audio formats, transcription #
# ------------------------------------------------------------------- #
await ws.send(json.dumps({
"type": "session.update",
"session": {
"type": "realtime",
model: "gpt-realtime",
"voice": voice,
"modalities": ["audio", "text"],
"input\_audio\_format": "pcm16",
"output\_audio\_format": "pcm16",
"input\_audio\_transcription": {"model": "gpt-4o-transcribe"},
},
}))
# ------------------------------------------------------------------- #
# Launch background tasks: mic capture → queue → websocket #
# ------------------------------------------------------------------- #
mic\_task = asyncio.create\_task(mic\_to\_queue(pcm\_queue))
upl\_task = asyncio.create\_task(queue\_to\_websocket(pcm\_queue, ws))
print("🎙️ Speak now (Ctrl‑C to quit)…")
try:
# ------------------------------------------------------------------- #
# Main event loop: process incoming events from the websocket #
# ------------------------------------------------------------------- #
async for event\_raw in ws:
event = json.loads(event\_raw)
etype = event["type"]
# --------------------------------------------------------------- #
# User just spoke ⇢ conversation.item.created (role = user) #
# --------------------------------------------------------------- #
if etype == "conversation.item.created" and event["item"]["role"] == "user":
item = event["item"]
text = None
if item["content"]:
text = item["content"][0].get("transcript")
state.history.append(Turn("user", event["item"]["id"], text))
# If transcript not yet available, fetch it later
if text is None:
asyncio.create\_task(fetch\_full\_item(ws, item["id"], state))
# --------------------------------------------------------------- #
# Transcript fetched ⇢ conversation.item.retrieved #
# --------------------------------------------------------------- #
elif etype == "conversation.item.retrieved":
content = event["item"]["content"][0]
# Fill missing transcript in history
for t in state.history:
if t.item\_id == event["item"]["id"]:
t.text = content.get("transcript")
break
# --------------------------------------------------------------- #
# Assistant audio arrives in deltas #
# --------------------------------------------------------------- #
elif etype == "response.audio.delta":
assistant\_audio.append(base64.b64decode(event["delta"]))
# --------------------------------------------------------------- #
# Assistant reply finished ⇢ response.done #
# --------------------------------------------------------------- #
elif etype == "response.done":
for item in event["response"]["output"]:
if item["role"] == "assistant":
txt = item["content"][0]["transcript"]
state.history.append(Turn("assistant", item["id"], txt))
# print(f"\\n🤖 {txt}\\n")
state.latest\_tokens = event["response"]["usage"]["total\_tokens"]
print(f"—— response.done (window ≈{state.latest\_tokens} tokens) ——")
print\_history(state)
# Fetch any still‑missing user transcripts
for turn in state.history:
if (turn.role == "user"
and turn.text is None
and turn.item\_id not in state.waiting):
asyncio.create\_task(
fetch\_full\_item(ws, turn.item\_id, state)
)
# Playback collected audio once reply completes
if enable\_playback and assistant\_audio:
simpleaudio.play\_buffer(b"".join(assistant\_audio), 1, BYTES\_PER\_SAMPLE, SAMPLE\_RATE\_HZ)
assistant\_audio.clear()
# Summarise if context too large – fire in background so we don't block dialogue
if state.latest\_tokens \>= SUMMARY\_TRIGGER and len(state.history) \> KEEP\_LAST\_TURNS and not state.summarising:
asyncio.create\_task(summarise\_and\_prune(ws, state))
except KeyboardInterrupt:
print("\\nStopping…")
finally:
mic\_task.cancel()
await pcm\_queue.put(None)
await upl\_task`
```
```
`# Run the realtime session (this cell blocks until you stop it)
await realtime\_session()`
```
```
`session.created ✅
🎙️ Speak now (Ctrl‑C to quit)…
—— response.done (window ≈979 tokens) ——
—— Conversation so far ———————————————
[user ] Can you tell me a quick story? (item\_BTuMOcpUqp8qknKhLzlkA)
[assistant] Once upon a time, in a cozy little village, there was a cat named Whiskers who was always getting into trouble. One sunny day, Whiskers found a mysterious glowing stone in the garden. Curious, he pawed at it, and poof! The stone granted him the ability to talk to birds. Whiskers and his new bird friends had grand adventures, solving mysteries and exploring the village. And from that day on, Whiskers was known as the most adventurous cat in the village. The end. (item\_BTuMPRWxqpv0ph6QM46DK)
——————————————————————————————————————————
—— response.done (window ≈2755 tokens) ——
—— Conversation so far ———————————————
[user ] Can you tell me a quick story? (item\_BTuMOcpUqp8qknKhLzlkA)
[assistant] Once upon a time, in a cozy little village, there was a cat named Whiskers who was always getting into trouble. One sunny day, Whiskers found a mysterious glowing stone in the garden. Curious, he pawed at it, and poof! The stone granted him the ability to talk to birds. Whiskers and his new bird friends had grand adventures, solving mysteries and exploring the village. And from that day on, Whiskers was known as the most adventurous cat in the village. The end. (item\_BTuMPRWxqpv0ph6QM46DK)
[user ] Can you tell me three extremely funny stories? (item\_BTuNN64LdULM21OyC4vzN)
[assistant] Sure, let's dive into some giggle-worthy tales: \*\*Story One:\*\* There was a forgetful baker named Benny who baked a hundred cakes for a big wedding. But on the big day, he forgot where he put them! The entire town joined in to find the missing cakes, only to discover Benny had stored them in his neighbor's garage, thinking it was his pantry. The wedding turned into a town-wide cake feast! \*\*Story Two:\*\* A mischievous dog named Sparky loved to play pranks. One day, he swapped his owner's phone with a squeaky toy, causing a hilarious mix-up of barks, squeaks, and confused calls. Sparky's owner ended up having a full conversation with the mailman, all in squeaks! \*\*Story Three:\*\* In a small town, a parrot named Polly became a local celebrity for reciting tongue twisters. One day, Polly challenged the mayor to a tongue twister duel. The mayor, tongue-tied and laughing, declared Polly the official town jester. Polly squawked with pride, and the town rang with laughter for days. (item\_BTuNNpNxki5ynSQ5c3Xsa)
——————————————————————————————————————————
⚠️ Token window ≈2755 ≥ 2000. Summarising…
—— Conversation so far ———————————————
[assistant] L'utilisateur a demandé une histoire rapide, et l'assistant a raconté celle d'un chat nommé Whiskers qui, après avoir trouvé une pierre mystérieuse dans son jardin, a obtenu le pouvoir de parler aux oiseaux. Avec ses nouveaux amis oiseaux, Whiskers a vécu de grandes aventures, résolvant des mystères et explorant le village, devenant ainsi le chat le plus aventurier du village. (sum\_001)
[user ] Can you tell me three extremely funny stories? (item\_BTuNN64LdULM21OyC4vzN)
[assistant] Sure, let's dive into some giggle-worthy tales: \*\*Story One:\*\* There was a forgetful baker named Benny who baked a hundred cakes for a big wedding. But on the big day, he forgot where he put them! The entire town joined in to find the missing cakes, only to discover Benny had stored them in his neighbor's garage, thinking it was his pantry. The wedding turned into a town-wide cake feast! \*\*Story Two:\*\* A mischievous dog named Sparky loved to play pranks. One day, he swapped his owner's phone with a squeaky toy, causing a hilarious mix-up of barks, squeaks, and confused calls. Sparky's owner ended up having a full conversation with the mailman, all in squeaks! \*\*Story Three:\*\* In a small town, a parrot named Polly became a local celebrity for reciting tongue twisters. One day, Polly challenged the mayor to a tongue twister duel. The mayor, tongue-tied and laughing, declared Polly the official town jester. Polly squawked with pride, and the town rang with laughter for days. (item\_BTuNNpNxki5ynSQ5c3Xsa)
——————————————————————————————————————————
✅ Summary inserted (sum\_001)
—— response.done (window ≈2147 tokens) ——
—— Conversation so far ———————————————
[assistant] L'utilisateur a demandé une histoire rapide, et l'assistant a raconté celle d'un chat nommé Whiskers qui, après avoir trouvé une pierre mystérieuse dans son jardin, a obtenu le pouvoir de parler aux oiseaux. Avec ses nouveaux amis oiseaux, Whiskers a vécu de grandes aventures, résolvant des mystères et explorant le village, devenant ainsi le chat le plus aventurier du village. (sum\_001)
[user ] Can you tell me three extremely funny stories? (item\_BTuNN64LdULM21OyC4vzN)
[assistant] Sure, let's dive into some giggle-worthy tales: \*\*Story One:\*\* There was a forgetful baker named Benny who baked a hundred cakes for a big wedding. But on the big day, he forgot where he put them! The entire town joined in to find the missing cakes, only to discover Benny had stored them in his neighbor's garage, thinking it was his pantry. The wedding turned into a town-wide cake feast! \*\*Story Two:\*\* A mischievous dog named Sparky loved to play pranks. One day, he swapped his owner's phone with a squeaky toy, causing a hilarious mix-up of barks, squeaks, and confused calls. Sparky's owner ended up having a full conversation with the mailman, all in squeaks! \*\*Story Three:\*\* In a small town, a parrot named Polly became a local celebrity for reciting tongue twisters. One day, Polly challenged the mayor to a tongue twister duel. The mayor, tongue-tied and laughing, declared Polly the official town jester. Polly squawked with pride, and the town rang with laughter for days. (item\_BTuNNpNxki5ynSQ5c3Xsa)
[user ] (item\_BTuPLaCv8ATdIwAQ2rLgO)
[assistant] Sure! The first summary I provided between us was in French. (item\_BTuPLa7BaSQToGCVOmfBK)`
```
We had a conversation with our Voice AI. After several turns, the total token count reached SUMMARY\_MAX, which triggered the conversation summarization step. This generated a summary of the earlier messages.
Since there were N = 4 total messages, we summarized the first N - 2 = 2 messages:
```
`—— Conversation so far ———————————————
[user ] Can you tell me a quick story? (item\_BTuMOcpUqp8qknKhLzlkA)
[assistant] Once upon a time, in a cozy little village, there was a cat named Whiskers who was always getting into trouble. One sunny day, Whiskers found a mysterious glowing stone in the garden. Curious, he pawed at it, and poof! The stone granted him the ability to talk to birds. Whiskers and his new bird friends had grand adventures, solving mysteries and exploring the village. And from that day on, Whiskers was known as the most adventurous cat in the village. The end. (item\_BTuMPRWxqpv0ph6QM46DK)`
```
We then created a summary in French and inserted it into the conversation history using the root: true flag. This ensured the summary appeared as the first message in the conversation. After that, we deleted the original items, using `"type": "conversation.item.delete"`, that were summarized.
To validate the summary insertion, we asked the Voice AI what language the summary was in. It correctly responded:
```
`[assistant] Sure! The first summary I provided between us was in French. (item\_BTuPLa7BaSQToGCVOmfBK)`
```
## 5 · Real‑World Applications
Context summarisation can be useful for **long‑running voice experiences**.
Here are a use case ideas:
|Use‑case|Added Value|Why Useful|
|**Customer‑support voicebot**|24/7 natural phone tree; auto‑generate ticket summaries|Summarizes long customer calls for efficient handoff and record-keeping, reducing agent workload and improving response quality.|
|**Language tutor**|Real‑time conversation practice with corrective feedback|Helps track learner progress and highlights recurring mistakes, enabling personalized feedback and more effective language acquisition.|
|**AI therapist / coach**|Safe, always‑available listener that remembers sessions|Maintains continuity across sessions by recalling key topics and emotional tone, supporting a more empathetic and effective experience.|
|**Meeting assistant**|Live transcripts + concise action‑item recap in Slack|Distills lengthy meetings into actionable summaries, saving team members time and ensuring important points are not missed.|
## 6 · Next Steps & Further Reading
Try out the notebook and try integrating context summary into your application.
Few things you can try:
|Try this…|What you’ll learn|
|**A/B test summarisation**
Run your eval suite with summarisation *on* vs *off*.|Whether trimming actually improves quality for your domain—and how it affects latency & cost.|
|**Swap summary styles**
Change the system prompt to bullet points, JSON, English vs French, etc.|Which format the downstream assistant absorbs best; how language choice influences follow‑up answers.|
|**Vary thresholds**
Play with `SUMMARY\_TRIGGER\_TOKENS` (2 k → 8 k).|The sweet spot between model drift and summarisation overhead.|
|**Cost tracing**
Log `usage.total\_tokens` before/after summarisation.|Concrete ROI: token savings per hour of conversation.|
### Resources:
* [OpenAI Realtime Guide](https://platform.openai.com/docs/guides/realtime)
* [OpenAI Realtime Conversations](https://platform.openai.com/docs/guides/realtime-conversations)
* [OpenAI Realtime API Reference](https://platform.openai.com/docs/api-reference/realtime)
* [Voice AI and Voice Agents](https://voiceaiandvoiceagents.com/)