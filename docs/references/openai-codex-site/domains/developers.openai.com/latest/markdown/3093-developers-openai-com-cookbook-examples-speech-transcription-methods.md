Comparing Speech-to-Text Methods with the OpenAI API
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
Apr 29, 2025
# Comparing Speech-to-Text Methods with the OpenAI API
[ MH ](https://www.linkedin.com/in/minhajul-hoque-83242b163/)
[ Minhajul Hoque ](https://www.linkedin.com/in/minhajul-hoque-83242b163/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Speech_transcription_methods.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Speech_transcription_methods.ipynb)
## Overview
This notebook provides a clear, hands-on guide for beginners to quickly get started with Speech-to-Text (STT) using the OpenAI API. You’ll explore multiple practical methods, their use cases, and considerations.
By the end you will be able to select and use the appropriate transcription method for your use use cases.
*Note:*
* *This notebook uses WAV audio files for simplicity. It does **not** demonstrate real-time microphone streaming (such as from a web app or direct mic input).*
* *This notebook uses WebSockets to connect to the Realtime API. Alternatively, you can use WebRTC, see the [OpenAI docs](https://platform.openai.com/docs/guides/realtime#connect-with-webrtc) for details.*
### 📊 Quick-look
|Mode|Latency to **first token**|Best for (real examples)|Advantages|Key limitations|
|File upload + `stream=False` (blocking)|seconds|Voicemail, meeting recordings|Simple to set up|• No partial results, users see nothing until file finishes
• Max 25 MB per request (you must chunk long audio)|
|File upload + `stream=True`|subseconds|Voice memos in mobile apps|Simple to set up & provides a “live” feel via token streaming|• Still requires a completed file
• You implement progress bars / chunked uploads|
|Realtime WebSocket|subseconds|Live captions in webinars|True real-time; accepts a continuous audio stream|• Audio must be pcm16, g711\_ulaw, or g711\_alaw
• Session ≤ 30 min, reconnect & stitch
• You handle speaker-turn formatting to build the full transcript|
|Agents SDK VoicePipeline|subseconds|Internal help-desk assistant|Real-time streaming and easy to build agentic workflows|• Python-only beta
• API surface may change|
## Installation (one‑time)
To set up your environment, uncomment and run the following cell in a new Python environment:
```
`!pip install --upgrade -q openai openai-agents websockets sounddevice pyaudio nest\_asyncio resampy httpx websocket-client`
```
This installs the necessary packages required to follow along with the notebook.
## Authentication
Before proceeding, ensure you have set your OpenAI API key as an environment variable named OPENAI\_API\_KEY. You can typically set this in your terminal or notebook environment: `export OPENAI\_API\_KEY="your-api-key-here"`
Verify that your API key is set correctly by running the next cell.
```
`# ─── Standard Library ──────────────────────────────────────────────────────────
import asyncio
import struct
import base64 # encode raw PCM bytes → base64 before sending JSON
import json # compose/parse WebSocket messages
import os
import time
from typing import List
from pathlib import Path
# ─── Third-Party ───────────────────────────────────────────────────────────────
import nest\_asyncio
import numpy as np
from openai import OpenAI
import resampy # high-quality sample-rate conversion
import soundfile as sf # reads many audio formats into float32 arrays
import websockets # asyncio-based WebSocket client
from agents import Agent
from agents.voice import (
SingleAgentVoiceWorkflow,
StreamedAudioInput,
VoicePipeline,
VoicePipelineConfig,
)
from IPython.display import Audio, display
# ───────────────────────────────────────────────────────────────────────────────
nest\_asyncio.apply()
# ✏️ Put your key in an env-var or just replace the call below.
OPENAI\_API\_KEY = os.getenv("OPENAI\_API\_KEY")
client = OpenAI(api\_key=OPENAI\_API\_KEY)
print("✅ OpenAI client ready")`
```
```
`✅ OpenAI client ready`
```
## 1 · Speech-to-Text with Audio File
*model = gpt-4o-transcribe*
### When to use
* You have a completed audio file (up to 25 MB).The following input file types are supported: mp3, mp4, mpeg, mpga, m4a, wav, and webm.
* Suitable for batch processing tasks like podcasts, call-center recordings, or voice memos.
* Real-time feedback or partial results are not required.
### How it works
#### Benefits
* **Ease of use:** Single HTTP request – perfect for automation or backend scripts.
* **Accuracy:** Processes the entire audio in one go, improving context and transcription quality.
* **File support:** Handles WAV, MP3, MP4, M4A, FLAC, Ogg, and more.
#### Limitations
* **No partial results:** You must wait until processing finishes before seeing any transcript.
* **Latency scales with duration:** Longer recordings mean longer wait times.
* **File-size cap:** Up to 25 MB (≈ 30 min at 16-kHz mono WAV).
* **Offline use only:** Not intended for real-time scenarios such as live captioning or conversational AI.
Let’s first preview the audio file. I’ve downloaded the audio file from [here](https://pixabay.com/sound-effects/search/male-speech/).
```
`AUDIO\_PATH = Path('./data/sample\_audio\_files/lotsoftimes-78085.mp3') # change me
MODEL\_NAME = "gpt-4o-transcribe"
if AUDIO\_PATH.exists():
display(Audio(str(AUDIO\_PATH)))
else:
print('⚠️ Provide a valid audio file')`
```
Your browser does not support the audio element.
Now, we can call the STT endpoint to transcribe the audio.
```
`if AUDIO\_PATH.exists():
with AUDIO\_PATH.open('rb') as f:
transcript = client.audio.transcriptions.create(
file=f,
model=MODEL\_NAME,
response\_format='text',
)
print('\\n--- TRANSCRIPT ---\\n')
print(transcript)`
```
```
`
--- TRANSCRIPT ---
And lots of times you need to give people more than one link at a time. A band could give their fans a couple new videos from a live concert, a behind-the-scenes photo gallery, an album to purchase, like these next few links.`
```
## 2 · Speech-to-Text with Audio File: Streaming
*model = gpt-4o-transcribe*
### When to use
* You already have a fully recorded audio file.
* You need immediate transcription results (partial or final) as they arrive.
* Scenarios where partial feedback improves UX, e.g., uploading a long voice memo.
#### Benefits
* **Real-time feel:** Users see transcription updates almost immediately.
* **Progress visibility:** Intermediate transcripts show ongoing progress.
* **Improved UX:** Instant feedback keeps users engaged.
#### Limitations
* **Requires full audio file upfront:** Not suitable for live audio feeds.
* **Implementation overhead:** You must handle streaming logic and progress updates yourself.
```
`if AUDIO\_PATH.exists():
with AUDIO\_PATH.open('rb') as f:
stream = client.audio.transcriptions.create(
file=f,
model=MODEL\_NAME,
response\_format='text',
stream=True
)
for event in stream:
# If this is an incremental update, you can get the delta using `event.delta`
if getattr(event, "delta", None):
print(event.delta, end="", flush=True)
time.sleep(0.05) # simulate real-time pacing
# When transcription is complete, you can get the final transcript using `event.text`
elif getattr(event, "text", None):
print()
print("\\n" + event.text)`
```
```
`And lots of times you need to give people more than one link at a time. A band could give their fans a couple new videos from a live concert, a behind-the-scenes photo gallery, an album to purchase, like these next few links.
And lots of times you need to give people more than one link at a time. A band could give their fans a couple new videos from a live concert, a behind-the-scenes photo gallery, an album to purchase, like these next few links.`
```
## 3 · Realtime Transcription API
*model = gpt-4o-transcribe*
### When to use
* Live captioning for real-time scenarios (e.g., meetings, demos).
* Need built-in voice-activity detection, noise suppression, or token-level log probabilities.
* Comfortable handling WebSockets and real-time event streams.
### How it works
#### Benefits
* **Ultra-low latency:** Typically 300–800 ms, enabling near-instant transcription.
* **Dynamic updates:** Supports partial and final transcripts, enhancing the user experience.
* **Advanced features:** Built-in turn detection, noise reduction, and optional detailed log-probabilities.
#### Limitations
* **Complex integration:** Requires managing WebSockets, Base64 encoding, and robust error handling.
* **Session constraints:** Limited to 30-minute sessions.
* **Restricted formats:** Accepts only raw PCM (no MP3 or Opus); For pcm16, input audio must be 16-bit PCM at a 24kHz sample rate, single channel (mono), and little-endian byte order.
```
`TARGET\_SR = 24\_000
PCM\_SCALE = 32\_767
CHUNK\_SAMPLES = 3\_072 # ≈128 ms at 24 kHz
RT\_URL = "wss://api.openai.com/v1/realtime?intent=transcription"
EV\_DELTA = "conversation.item.input\_audio\_transcription.delta"
EV\_DONE = "conversation.item.input\_audio\_transcription.completed"
# ── helpers ────────────────────────────────────────────────────────────────
def float\_to\_16bit\_pcm(float32\_array):
clipped = [max(-1.0, min(1.0, x)) for x in float32\_array]
pcm16 = b''.join(struct.pack('\<h', int(x \* 32767)) for x in clipped)
return pcm16
def base64\_encode\_audio(float32\_array):
pcm\_bytes = float\_to\_16bit\_pcm(float32\_array)
encoded = base64.b64encode(pcm\_bytes).decode('ascii')
return encoded
def load\_and\_resample(path: str, sr: int = TARGET\_SR) -\> np.ndarray:
"""Return mono PCM-16 as a NumPy array."""
data, file\_sr = sf.read(path, dtype="float32")
if data.ndim \> 1:
data = data.mean(axis=1)
if file\_sr != sr:
data = resampy.resample(data, file\_sr, sr)
return data
async def \_send\_audio(ws, pcm: np.ndarray, chunk: int, sr: int) -\> None:
"""Producer: stream base-64 chunks at real-time pace, then signal EOF."""
dur = 0.025 # Add pacing to ensure real-time transcription
t\_next = time.monotonic()
for i in range(0, len(pcm), chunk):
float\_chunk = pcm[i:i + chunk]
payload = {
"type": "input\_audio\_buffer.append",
"audio": base64\_encode\_audio(float\_chunk),
}
await ws.send(json.dumps(payload))
t\_next += dur
await asyncio.sleep(max(0, t\_next - time.monotonic()))
await ws.send(json.dumps({"type": "input\_audio\_buffer.end"}))
async def \_recv\_transcripts(ws, collected: List[str]) -\> None:
"""
Consumer: build `current` from streaming deltas, promote it to `collected`
whenever a …completed event arrives, and flush the remainder on socket
close so no words are lost.
"""
current: List[str] = []
try:
async for msg in ws:
ev = json.loads(msg)
typ = ev.get("type")
if typ == EV\_DELTA:
delta = ev.get("delta")
if delta:
current.append(delta)
print(delta, end="", flush=True)
elif typ == EV\_DONE:
# sentence finished → move to permanent list
collected.append("".join(current))
current.clear()
except websockets.ConnectionClosedOK:
pass
# socket closed → flush any remaining partial sentence
if current:
collected.append("".join(current))
def \_session(model: str, vad: float = 0.5) -\> dict:
return {
"type": "transcription\_session.update",
"session": {
"input\_audio\_format": "pcm16",
"turn\_detection": {"type": "server\_vad", "threshold": vad},
"input\_audio\_transcription": {"model": model},
},
}
async def transcribe\_audio\_async(
wav\_path,
api\_key,
\*,
model: str = MODEL\_NAME,
chunk: int = CHUNK\_SAMPLES,
) -\> str:
pcm = load\_and\_resample(wav\_path)
headers = {"Authorization": f"Bearer {api\_key}", "OpenAI-Beta": "realtime=v1"}
async with websockets.connect(RT\_URL, additional\_headers=headers, max\_size=None) as ws:
await ws.send(json.dumps(\_session(model)))
transcripts: List[str] = []
await asyncio.gather(
\_send\_audio(ws, pcm, chunk, TARGET\_SR),
\_recv\_transcripts(ws, transcripts),
) # returns when server closes
return " ".join(transcripts)`
```
```
`transcript = await transcribe\_audio\_async(AUDIO\_PATH, OPENAI\_API\_KEY)
transcript`
```
```
`And lots of times you need to give people more than one link at a time.A band could give their fans a couple new videos from a live concert, a behind-the-scenes photo galleryLike these next few linksAn album to purchase.`
```
```
`'And lots of times you need to give people more than one link at a time. A band could give their fans a couple new videos from a live concert, a behind-the-scenes photo gallery Like these next few linksAn album to purchase. '`
```
## 4 · Agents SDK Realtime Transcription
*models = gpt-4o-transcribe, gpt-4o-mini*
### When to use
* Leveraging the OpenAI Agents SDK for real-time transcription and synthesis with minimal setup.
* You want to integrate transcription directly into agent-driven workflows.
* Prefer high-level management of audio input/output, WebSockets, and buffering.
### How it works
**Benefits**
* **Minimal boilerplate:** `VoicePipeline` handles resampling, VAD, buffering, token auth, and reconnects.
* **Seamless agent integration**: Enables direct interaction with GPT agents using real-time audio transcription.
**Limitations**
* **Python-only beta:** not yet available in other languages; APIs may change.
* **Less control:** fine-tuning VAD thresholds or packet scheduling requires digging into SDK internals.
```
`# ── 1 · agent that replies in French ---------------------------------------
fr\_agent = Agent(
name="Assistant-FR",
instructions=
"Translate the user's words into French.",
model="gpt-4o-mini",
)
# ── 2 · workflow that PRINTS what it yields --------------------------------
class PrintingWorkflow(SingleAgentVoiceWorkflow):
"""Subclass that prints every chunk it yields (the agent's reply)."""
async def run(self, transcription: str):
# Optionally: also print the user transcription
print()
print("[User]:", transcription)
print("[Assistant]: ", end="", flush=True)
async for chunk in super().run(transcription):
print(chunk, end="", flush=True) # \<-- agent (French) text
yield chunk # still forward to TTS
pipeline = VoicePipeline(
workflow=PrintingWorkflow(fr\_agent),
stt\_model=MODEL\_NAME,
config=VoicePipelineConfig(tracing\_disabled=True),
)
# ── 3 · helper to stream \~40 ms chunks at 24 kHz ---------------------------
def load\_and\_resample(path: str, sr: int = 24\_000) -\> np.ndarray:
"""Return mono PCM-16 as a NumPy array."""
data, file\_sr = sf.read(path, dtype="float32")
if data.ndim \> 1:
data = data.mean(axis=1)
if file\_sr != sr:
data = resampy.resample(data, file\_sr, sr)
return data
def audio\_chunks(path: str, target\_sr: int = 24\_000, chunk\_ms: int = 40):
# 1️⃣ reuse the helper
audio = load\_and\_resample(path, target\_sr)
# 2️⃣ float-32 → int16 NumPy array
pcm = (np.clip(audio, -1, 1) \* 32\_767).astype(np.int16)
# 3️⃣ yield real-time sized hops
hop = int(target\_sr \* chunk\_ms / 1\_000)
for off in range(0, len(pcm), hop):
yield pcm[off : off + hop]
# ── 4 · stream the file ----------------------------------------------------
async def stream\_audio(path: str):
sai = StreamedAudioInput()
run\_task = asyncio.create\_task(pipeline.run(sai))
for chunk in audio\_chunks(path):
await sai.add\_audio(chunk)
await asyncio.sleep(len(chunk) / 24\_000) # real-time pacing
# just stop pushing; session ends automatically
await run\_task # wait for pipeline to finish`
```
```
`await stream\_audio(AUDIO\_PATH)`
```
```
`
[User]: And lots of times you need to give people more than one link at a time.
[Assistant]: Et souvent, vous devez donner aux gens plusieurs liens à la fois.
[User]: A band could give their fans a couple new videos from a live concert, a behind-the-scenes photo gallery.
[Assistant]: Un groupe pourrait donner à ses fans quelques nouvelles vidéos d'un concert live, ainsi qu'une galerie de photos des coulisses.
[User]: An album to purchase.
[Assistant]:`
```
```
`Un album à acheter.
[User]: like these next few links.
[Assistant]: comme ces quelques liens suivants.`
```
## Conclusion
In this notebook you explored multiple ways to convert speech to text with the OpenAI API and the Agents SDK, ranging from simple file uploads to fully-interactive, real-time streaming. Each workflow shines in a different scenario, so pick the one that best matches your product’s needs.
### Key takeaways
* **Match the method to the use-case:**
• Offline batch jobs → file-based transcription.
• Near-real-time updates → HTTP-streaming.
• Conversational, low-latency experiences → WebSocket or Agents SDK.
* **Weigh trade-offs:** latency, implementation effort, supported formats, and session limits all differ by approach.
* **Stay current:** the models and SDK continue to improve; new features ship regularly.
### Next steps
1. Try out the notebook!
2. Integrate your chosen workflow into your application.
3. Send us feedback! Community insights help drive the next round of model upgrades.
## References
* Explore the [Transcriptions API docs](https://platform.openai.com/docs/api-reference/audio).
* Read the [Realtime guide](https://platform.openai.com/docs/guides/realtime?use-case=transcription).
* Explore the [Agents SDK reference](https://openai.github.io/openai-agents-python/).
* Explore the [Agents SDK Voice Pipeline reference](https://openai.github.io/openai-agents-python/voice/)