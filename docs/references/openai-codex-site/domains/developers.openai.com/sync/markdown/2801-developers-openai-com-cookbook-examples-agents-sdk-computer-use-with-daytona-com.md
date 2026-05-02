Computer Use Agents in Daytona Sandboxes
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
Apr 19, 2026
# Computer Use Agents in Daytona Sandboxes
[ LP ](https://github.com/rovle)
[ Lovre Pesut ](https://github.com/rovle)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/agents_sdk/computer_use_with_daytona/computer_use_with_daytona.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/agents_sdk/computer_use_with_daytona/computer_use_with_daytona.ipynb)
Plenty of useful work still lives behind browser UIs with no public API: third-party dashboards, admin panels, form-heavy workflows. The [Agents SDK](https://openai.github.io/openai-agents-python/)’s Computer Use tool lets an agent see and control a desktop. In this cookbook, we use a [Daytona](https://www.daytona.io/) sandbox as the source of that desktop.
The Computer Use tool needs just a handful of primitives to drive a desktop: screenshot, click, type, scroll, press keys. A Daytona sandbox wraps a Linux desktop (browser included) in a Python SDK that exposes exactly those primitives. A thin adapter implementing the Agents SDK’s `AsyncComputer` interface plugs the sandbox into the tool.
The agent loop runs in this notebook while the sandbox does the actual clicking and typing. As a demo, in this cookbook we have an agent fill out a web form. The form itself is served inside the sandbox on `localhost:8080`, and the whole session is recorded to an `.mp4` embedded below.
The same pattern works for any task you’d describe as “open an app, navigate somewhere, interact with the screen”: testing UI flows end-to-end, driving legacy desktop software, or any workflow that only exists as a human-facing interface.
Below you can watch an agent drive the sandbox to fill out a complex multi-page form. The rest of this cookbook walks through the machinery that makes it run.
## Requirements
* Python 3.10+
* A [Daytona](https://www.daytona.io/) account and an API key, exported as `DAYTONA\_API\_KEY`
* An OpenAI API key, exported as `OPENAI\_API\_KEY`
* The OpenAI Agents SDK and the Daytona Python SDK (see the install cell below)
Keep both API keys in your shell environment. This notebook reads them with `os.environ[...]` and never writes them to the sandbox.
## Install dependencies
Clone the cookbook and move into this example directory:
```
`git clone https://github.com/openai/openai-cookbook.git
cd openai-cookbook/examples/agents\_sdk/computer\_use\_with\_daytona`
```
Open `computer\_use\_with\_daytona.ipynb` from that directory and install the dependencies below.
```
`%pip install -r requirements.txt --quiet`
```
## Imports and environment
We import from three places: the Agents SDK (`Agent`, `Runner`, `ComputerTool`, and the `AsyncComputer` / `Button` / `Environment` types we’ll implement against), the Daytona SDK (`AsyncDaytona` plus `CreateSandboxFromSnapshotParams`), and the usual standard-library async/path helpers. `IPython.display.Video` is only needed at the very end, to play the recording inline.
```
`from \_\_future\_\_ import annotations
import asyncio
import logging
import os
from pathlib import Path
from typing import Any
from daytona import AsyncDaytona, CreateSandboxFromSnapshotParams
from agents import Agent, AsyncComputer, Button, ComputerTool, Environment, Runner, trace
from IPython.display import Video
# The Daytona and OpenAI keys live in the shell environment.
assert os.environ.get("DAYTONA\_API\_KEY"), "DAYTONA\_API\_KEY is not set."
assert os.environ.get("OPENAI\_API\_KEY"), "OPENAI\_API\_KEY is not set."
logger = logging.getLogger("computer\_use\_with\_daytona")`
```
## The computer-use adapter
The Agents SDK’s [Computer Use tool](https://platform.openai.com/docs/guides/tools-computer-use) works against any object that implements the `AsyncComputer` interface: a screenshot method that returns a base64 PNG, plus `click`, `double\_click`, `scroll`, `type`, `keypress`, `move`, `drag`, and `wait`. The harness drives this interface; the model never talks to Daytona directly.
Daytona’s desktop sandbox exposes a matching API under `sandbox.computer\_use.\*`: `screenshot.take\_full\_screen()`, `mouse.click/move/scroll/drag`, `keyboard.type/press`, plus `start()` / `stop()` for the underlying Xvfb and VNC processes. The class below is the adapter between the two.
```
`\_DEFAULT\_WIDTH, \_DEFAULT\_HEIGHT = 1024, 768
# CUA emits DOM KeyboardEvent.key-style names (for example "ArrowDown"); Daytona
# uses robotgo key names internally. Lowercase, then translate the few that
# differ. Keys not in the table pass through unchanged.
\_CUA\_KEY\_TO\_DAYTONA: dict[str, str] = {
"arrowdown": "down",
"arrowleft": "left",
"arrowright": "right",
"arrowup": "up",
"option": "alt",
"super": "cmd",
"win": "cmd",
}
def \_normalize\_key(key: str) -\> str:
if len(key) \> 1:
key = \_CUA\_KEY\_TO\_DAYTONA.get(key.lower(), key.lower())
return key
class DaytonaAsyncComputer(AsyncComputer):
"""AsyncComputer implementation backed by a Daytona sandbox desktop."""
def \_\_init\_\_(
self,
sandbox: Any,
\*,
width: int = \_DEFAULT\_WIDTH,
height: int = \_DEFAULT\_HEIGHT,
) -\> None:
self.\_sandbox = sandbox
self.\_width = width
self.\_height = height
async def \_\_aenter\_\_(self) -\> DaytonaAsyncComputer:
await self.\_sandbox.computer\_use.start()
# Give Xvfb, the window manager, and the VNC server a moment to come up.
await asyncio.sleep(2)
return self
async def \_\_aexit\_\_(self, exc\_type: Any, exc\_val: Any, exc\_tb: Any) -\> None:
try:
await self.\_sandbox.computer\_use.stop()
except asyncio.CancelledError:
raise
except Exception:
logger.warning("Failed to stop computer-use processes", exc\_info=True)
@property
def environment(self) -\> Environment:
# CUA's Environment enum is {"windows", "mac", "ubuntu", "browser"} — there is
# no generic "linux", so "ubuntu" is the right value for any Linux desktop
# (the snapshot here is Debian) since it selects Linux-style UI conventions.
return "ubuntu"
@property
def dimensions(self) -\> tuple[int, int]:
return (self.\_width, self.\_height)
async def screenshot(self) -\> str:
response = await self.\_sandbox.computer\_use.screenshot.take\_full\_screen()
return response.screenshot or ""
async def click(self, x: int, y: int, button: Button) -\> None:
if button not in ("left", "right"):
logger.warning("Daytona does not support %s clicks; ignoring.", button)
return
await self.\_sandbox.computer\_use.mouse.click(x, y, button)
async def double\_click(self, x: int, y: int) -\> None:
await self.\_sandbox.computer\_use.mouse.click(x, y, "left", True)
async def scroll(self, x: int, y: int, scroll\_x: int, scroll\_y: int) -\> None:
if scroll\_y != 0:
direction = "down" if scroll\_y \> 0 else "up"
amount = max(1, abs(scroll\_y) // 100)
await self.\_sandbox.computer\_use.mouse.scroll(x, y, direction, amount)
if scroll\_x != 0:
logger.warning(
"Daytona does not support horizontal scrolling; ignoring scroll\_x=%d.",
scroll\_x,
)
async def type(self, text: str) -\> None:
await self.\_sandbox.computer\_use.keyboard.type(text)
async def wait(self) -\> None:
await asyncio.sleep(1)
async def move(self, x: int, y: int) -\> None:
await self.\_sandbox.computer\_use.mouse.move(x, y)
async def keypress(self, keys: list[str]) -\> None:
if not keys:
return
if len(keys) == 1:
await self.\_sandbox.computer\_use.keyboard.press(\_normalize\_key(keys[0]))
else:
# Multiple keys: treat the last as the primary key, the rest as modifiers.
\*modifiers, key = keys
await self.\_sandbox.computer\_use.keyboard.press(
\_normalize\_key(key), [\_normalize\_key(m) for m in modifiers]
)
async def drag(self, path: list[tuple[int, int]]) -\> None:
if len(path) \< 2:
return
# Daytona drag takes start -\> end; chain segments for multi-point paths.
for i in range(len(path) - 1):
sx, sy = path[i]
ex, ey = path[i + 1]
await self.\_sandbox.computer\_use.mouse.drag(sx, sy, ex, ey)`
```
## The form, the data, and the prompt
The form we’ll fill lives in `form.html` in this folder. It is a single-page HTML registration form with five fieldsets: personal info, professional details, conference preferences, travel/accommodation, and additional info. The fields cover text inputs, emails, phone, dates, `\<select\>` dropdowns, radio groups, multi-select checkbox groups with a maximum limit, and a textarea. It also includes client-side validation and a confirmation view, so we can visually tell the run succeeded.
We tell the agent what to do in three parts:
* `APPLICANT\_DATA`: the facts the agent must enter, loaded from `fake\_applicant\_data.txt` in this folder.
* `INSTRUCTIONS`: the system prompt, guidance on filling the form.
* `TASK`: the short user turn that kicks off the run.
We also pin the sandbox snapshot and the server port here. The snapshot `daytonaio/sandbox:0.6.0` is the Daytona-published image with a desktop environment and a browser preinstalled.
```
`# Desktop snapshot that ships with a browser and a desktop environment.
\_DESKTOP\_SNAPSHOT = "daytonaio/sandbox:0.6.0"
# Where the form lives inside the sandbox, and the port we serve it on.
\_FORM\_DIR = "/home/daytona/form"
\_SERVER\_PORT = 8080
# The applicant facts the agent must enter.
APPLICANT\_DATA = Path("fake\_applicant\_data.txt").read\_text()
INSTRUCTIONS = """\\
You control a remote Linux desktop via mouse, keyboard, and screenshots.
A conference registration form is being served at http://localhost:8080.
When asked to fill the form:
1. Open a browser (look for one in the taskbar or application menu).
2. Navigate to http://localhost:8080.
3. Fill every field using the applicant data the user provides. The form
spans multiple sections, so scroll down to see them all.
4. Click "Complete Registration".
5. When you see the "Registration Complete!" confirmation, take a screenshot
and say DONE.
"""
TASK = f"Fill the conference registration form with this applicant data:\\n\\n{APPLICANT\_DATA}"`
```
## Create the sandbox
`AsyncDaytona()` reads the API key from `DAYTONA\_API\_KEY`. `daytona.create(...)` spins up a sandbox from the desktop snapshot; the call returns once the sandbox is ready for filesystem and process operations. The sandbox handle is what we pass to everything downstream: the form uploader, the HTTP server launcher, the recording API, and the `DaytonaAsyncComputer` adapter.
We hold onto `daytona` and `sandbox` as notebook-level variables so later cells can operate on them, and we tear them down explicitly in the last cell.
```
`daytona = AsyncDaytona()
sandbox = await daytona.create(
CreateSandboxFromSnapshotParams(snapshot=\_DESKTOP\_SNAPSHOT),
)
print(f"Sandbox ready: {sandbox.id}")`
```
```
`Sandbox ready: 6a6ca6a5-f49a-4562-a3f2-4d1717c0131d`
```
## Serve the form inside the sandbox
We upload `form.html` into the sandbox and serve it with `python3 -m http.server` on port 8080. Two small details:
1. The Daytona Python SDK uploads bytes, not paths, so we read `form.html` on the host and push the bytes to `/home/daytona/form/index.html`.
2. `sandbox.process.exec(...)` waits for the child’s stdout/stderr pipes to close, so a naive `python3 -m http.server &` would hang even though the shell exits — the backgrounded server keeps those pipes open. Redirecting stdout/stderr to a log file closes the inherited pipes, so `exec` returns immediately and the server keeps running.
```
`form\_html = Path("form.html").read\_bytes()
await sandbox.fs.create\_folder(\_FORM\_DIR, "0755")
await sandbox.fs.upload\_file(form\_html, f"{\_FORM\_DIR}/index.html")
print(f"Form uploaded to {\_FORM\_DIR}/index.html")
await sandbox.process.exec(
f"sh -c 'cd {\_FORM\_DIR} && python3 -m http.server {\_SERVER\_PORT} "
f"\> /tmp/httpd.log 2\>&1 &'"
)
# Poll until the server answers (or fail after a few seconds).
for \_ in range(10):
check = await sandbox.process.exec(
f"curl -sf -o /dev/null http://localhost:{\_SERVER\_PORT}/"
)
if check.exit\_code == 0:
break
await asyncio.sleep(0.5)
else:
raise RuntimeError(f"HTTP server did not respond on port {\_SERVER\_PORT}")
print(f"HTTP server started on port {\_SERVER\_PORT}")`
```
```
`Form uploaded to /home/daytona/form/index.html
HTTP server started on port 8080`
```
## Run the agent
This is the main event. We:
1. Enter the `DaytonaAsyncComputer` context manager, which starts the sandbox’s computer-use processes (Xvfb, window manager, VNC).
2. Start a session recording. `sandbox.computer\_use.recording.start(...)` returns a handle we need later to stop and download.
3. Build the `Agent` with a single tool, `ComputerTool(computer=computer)`, and run it with `Runner.run(...)` inside a `trace(...)` block so the run shows up in the OpenAI [traces dashboard](https://platform.openai.com/traces).
4. In a `finally` block, stop the recording and download it locally, using the filename Daytona reports (currently an `.mp4`).
`max\_turns=50` is a generous ceiling for a form this size; a good run will come in well under that.
```
`async with DaytonaAsyncComputer(sandbox) as computer:
recording = await sandbox.computer\_use.recording.start("form-fill")
print(f"Recording started: {recording.id}")
try:
with trace("Daytona form-fill demo"):
agent = Agent(
name="Form filler",
instructions=INSTRUCTIONS,
tools=[ComputerTool(computer=computer)],
model="gpt-5.4",
)
result = await Runner.run(agent, TASK, max\_turns=50)
print(f"\\n--- Final output ---\\n{result.final\_output}")
finally:
stopped = await sandbox.computer\_use.recording.stop(recording.id)
print(f"\\nRecording stopped: {stopped.file\_name} ({stopped.status})")
local\_recording\_path = Path(stopped.file\_name).name
await sandbox.computer\_use.recording.download(recording.id, local\_recording\_path)
print(f"Recording downloaded to: {local\_recording\_path}")`
```
```
`Recording started: de5b8077-352e-41b0-b2da-165ede8cbca0
--- Final output ---
DONE
Recording stopped: de5b8077-352e-41b0-b2da-165ede8cbca0\_form-fill\_20260419\_161419.mp4 (completed)
Recording downloaded to: de5b8077-352e-41b0-b2da-165ede8cbca0\_form-fill\_20260419\_161419.mp4`
```
## Watch the recording
Play it inline to see the agent fill the form included in this folder end to end.
```
`Video(local\_recording\_path, embed=True)`
```
Your browser does not support the video tag.
## Clean up the sandbox
Delete the sandbox when you’re done. Daytona will also tear it down automatically on its own schedule, but explicit deletion keeps the account tidy and guarantees you aren’t billed for idle time.
```
`await daytona.delete(sandbox)
print(f"Sandbox {sandbox.id} deleted.")`
```
```
`Sandbox 6a6ca6a5-f49a-4562-a3f2-4d1717c0131d deleted.`
```
## Where to take this next
* **Other kinds of forms.** This pattern works for any web form the agent can reach from a browser. Swap `form.html` for a different page, or drop the HTTP server and point the agent at an external URL.
* **Other backends.** `AsyncComputer` is the portable interface here. If you swap the adapter and the sandbox for a different CUA-capable desktop, the rest of the notebook stays the same.
* **Evals.** Verification can run inside the sandbox: compare the submitted payload against `APPLICANT\_DATA` and you have a deterministic form-filling eval.