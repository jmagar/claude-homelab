MCP-Powered Agentic Voice Framework
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
Jun 17, 2025
# MCP-Powered Agentic Voice Framework
[ SK ](https://www.linkedin.com/in/shikharkwatra/)[ CZ ](<https://github.com/Cece Z>)[ SL ](<https://github.com/Sibon li>)
[ Shikhar Kwatra
(OpenAI)
, ](https://www.linkedin.com/in/shikharkwatra/)[ Cece Z , ](<https://github.com/Cece Z>)[ Sibon li ](<https://github.com/Sibon li>)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/partners/mcp_powered_voice_agents/mcp_powered_agents_cookbook.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/partners/mcp_powered_voice_agents/mcp_powered_agents_cookbook.ipynb)
### Agents
Agents are becoming the de-facto framework in which we orchestrate various, often specialized, LLMs applications to work with one another. Many practical applications require the use of external tools to create a complex workflow for LLM-based agents.
Model Context Protocol (MCP) has quickly become the open standard for building Agentic systems. The protocol provides easy integration of common tool services and the interoperability between models across the AI ecosystem.
### What is MCP?
Model Context Protocol (MCP) is an open protocol designed to standardize how AI models - especially large language models (LLMs) - interface with external tools, data sources, and context providers in a secure, modular, and composable way. MCP provides a unified framework for sending structured requests from an agent or application to a set of “tool services,” such as databases, APIs, or custom logic modules. By adopting MCP, developers can,
* Decouple agent logic from tool implementations: Agents can call out to tools (like a database or search service) using a standard protocol, rather than relying on hardcoded integrations.
* Enforce consistent security and governance: MCP defines authentication, authorization, and data boundary controls between the model and external resources.
* Support modular, reusable agent architectures: Tools can be swapped, updated, or extended without changing the agent code, making it easy to evolve complex workflows.
* Run tools locally or remotely: The same protocol works whether a tool is running in the customer’s environment or in the cloud, supporting privacy and data residency requirements.
MCP acts as the “middleware” that bridges AI models and the external world, enabling secure, flexible, and maintainable integration of real-world context and capabilities into conversational or autonomous agents.
### Agents in the enterprise
In today’s enterprise landscape, conversational agents - especially voice-powered ones—are quickly becoming a standard for customer support, internal helpdesks, and task automation. Yet, building robust, scalable voice agents is challenging due to fragmented tooling, integration complexity, and the need for reliable orchestration of backend systems. A common pattern seen across the enterprise landscape is to develop agents that are backed by knowledge bases (both structured and unstructured). These bots are divided into several categories:
* copilots for internal use, and
* customer-facing assistants.
The latter of the two use cases, i.e. customer-facing assistants, tends to have a higher requirement for both accuracy, usability and design. Additionally, one common requirement for customer-facing chatbots is the need to add voice as a modality for user interface (i.e. for phone call automation).
These Q&A chatbots apply to a wide range of industries: healthcare, government, legal and other industries that requires a easy way for knowledge retrieval at a user’s fingertips.
One such industry is the insurance industry, where we’ve seen tremendous value for customers we work with in the space. Insurance policies are complex and navigating the system can often be difficult for policy holders.
### What’s in this Cookbook?
In this cookbook, we provide an end-to-end modular recipe leveraging MCP for building voice-enabled agents using the [OpenAI Agents SDK](https://openai.github.io/openai-agents-python/). In particular, we demonstrate how we can use it for dynamic context management and using agentic tool-calling. We demonstrate the capabilities of such a system for the aforementioned insurance use-case. In this example, we demonstrate the use of MCP for various tools that you may want for your application. Specifically, we showcase the use of custom MCP servers (for text retrieval and web search) as well as using predefined MCP servers (for SQLite).
### End-to-end Flow
This section outlines a straightforward setup for deploying microservices for tools within the MCP framework, specifically focusing on RAG, database lookup, and web search functionalities. The MCP servers are responsible not only for hosting these services but also for performing RAG indexing to support backend operations.
We employ a “chained” approach for voice input and output throughout the system. During inference, the workflow begins by capturing a user’s voice input, which is transcribed to text using a speech-to-text system. This transcribed text is then sent to the Planner agent, which determines which tools to invoke and makes requests to the appropriate microservices. After retrieving tool outputs, the Planner agent synthesizes a cohesive, contextually appropriate response. This textual response is subsequently converted to audio using a text-to-speech system, delivering the final voice response to the user.
The end-to-end workflow is summarized in the diagram below:
### Installing dependencies
First, we install the library dependencies for the project.
>
> Note: One specific dependency that may be needed on your machine, is to install
`> ffmpeg
`> . If you are using a mac, you will need to install this separately using
`> brew install ffmpeg
`> .
>
```
`#install dependencies
%pip install asyncio ffmpeg ffprobe mcp openai openai-agents pydub scipy sounddevice uv --quiet
%pip install "openai-agents[voice]" --quiet`
```
```
`
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m A new release of pip is available: [0m[31;49m24.0[0m[39;49m -\> [0m[32;49m25.1.1[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m To update, run: [0m[32;49mpip install --upgrade pip[0m
Note: you may need to restart the kernel to use updated packages.
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m A new release of pip is available: [0m[31;49m24.0[0m[39;49m -\> [0m[32;49m25.1.1[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m To update, run: [0m[32;49mpip install --upgrade pip[0m
Note: you may need to restart the kernel to use updated packages.`
```
### Setup
To execute this cookbook, you’ll need to install the following packages providing access to OpenAI’s API, the Agents SDK, MCP, and libraries for audio processing. Additionally, you can set your OpenAI API key for use by the agents via the `set\_default\_openai\_key` function.
```
`import socket
import time
import warnings
from typing import List, Optional, AsyncGenerator
from numpy.typing import NDArray
warnings.filterwarnings("ignore", category=SyntaxWarning)
async def wait\_for\_server\_ready(port: int = 8000, timeout: float = 10) -\> None:
"""Wait for SSE server to be ready"""
start = time.time()
while time.time() - start \< timeout:
try:
with socket.create\_connection(("localhost", port), timeout=1):
print("✅ SSE server TCP port is accepting connections.")
return
except OSError as e:
if time.time() - start \> timeout - 1: # Only print on last attempt
print(f"Waiting for server... ({e})")
time.sleep(0.5)
raise RuntimeError("❌ SSE server did not become ready in time.")`
```
### Defining Tool-use Agents through custom MCP services
First, we define a custom MCP service that host the RAG and web search tools using the `FastMCP` interface. Specifically, we add `@mcp.tool` functions for:
1. Retrieving information from a RAG service
2. Searching the broader internet for information using OpenAI’s `web\_search`
For the purpose in this cookbook, we’ll run both tools under the same service.
The below code has been provided in `search\_server.py` within the same directory. Run the code to start the server. As the server runs, your files will be indexed and stored in the vector store.
You can run the `search\_server.py` file by running the following command:
```
````bash
uv run python search\_server.py
````
```
Once the server is running, you can access the vector store and files at [https://platform.openai.com/storage/files](https://platform.openai.com/storage/files) and [https://platform.openai.com/storage/vector\_stores](https://platform.openai.com/storage/vector_stores) respectively, and continue with running the next cells in the notebook.
```
`# search\_server.py
import os
from mcp.server.fastmcp import FastMCP
from openai import OpenAI
from agents import set\_tracing\_export\_api\_key
# Create server
mcp = FastMCP("Search Server")
\_vector\_store\_id = ""
def \_run\_rag(query: str) -\> str:
"""Do a search for answers within the knowledge base and internal documents of the user.
Args:
query: The user query
"""
results = client.vector\_stores.search(
vector\_store\_id=\_vector\_store\_id,
query=query,
rewrite\_query=True, # Query rewriting generally improves results
)
return results.data[0].content[0].text
def \_summarize\_rag\_response(rag\_output: str) -\> str:
"""Summarize the RAG response using GPT-4
Args:
rag\_output: The RAG response
"""
response = client.responses.create(
model="gpt-4.1-mini",
tools=[{"type": "web\_search\_preview"}],
input="Summarize the following text concisely: \\n\\n" + rag\_output,
)
return response.output\_text
@mcp.tool()
def generate\_rag\_output(query: str) -\> str:
"""Generate a summarized RAG output for a given query.
Args:
query: The user query
"""
print("[debug-server] generate\_rag\_output: ", query)
rag\_output = \_run\_rag(query)
return \_summarize\_rag\_response(rag\_output)
@mcp.tool()
def run\_web\_search(query: str) -\> str:
"""Run a web search for the given query.
Args:
query: The user query
"""
print("[debug-server] run\_web\_search:", query)
response = client.responses.create(
model="gpt-4.1-mini",
tools=[{"type": "web\_search\_preview"}],
input=query,
)
return response.output\_text
def index\_documents(directory: str):
"""Index the documents in the given directory to the vector store
Args:
directory: The directory to index the documents from
"""
# OpenAI supported file extensions for retrieval (see docs)
SUPPORTED\_EXTENSIONS = {'.pdf', '.txt', '.md', '.docx', '.pptx', '.csv', '.rtf', '.html', '.json', '.xml'}
# Collect all files in the specified directory
files = [os.path.join(directory, f) for f in os.listdir(directory)]
# Filter files for supported extensions only
supported\_files = []
for file\_path in files:
\_, ext = os.path.splitext(file\_path)
if ext.lower() in SUPPORTED\_EXTENSIONS:
supported\_files.append(file\_path)
else:
print(f"[warning] Skipping unsupported file for retrieval: {file\_path}")
vector\_store = client.vector\_stores.create( # Create vector store
name="Support FAQ",
)
global \_vector\_store\_id
\_vector\_store\_id = vector\_store.id
for file\_path in supported\_files:
# Upload each file to the vector store, ensuring the file handle is closed
with open(file\_path, "rb") as fp:
client.vector\_stores.files.upload\_and\_poll(
vector\_store\_id=vector\_store.id,
file=fp
)
print(f"[debug-server] uploading file: {file\_path}")
if \_\_name\_\_ == "\_\_main\_\_":
oai\_api\_key = os.environ.get("OPENAI\_API\_KEY")
if not oai\_api\_key:
raise ValueError("OPENAI\_API\_KEY environment variable is not set")
set\_tracing\_export\_api\_key(oai\_api\_key)
client = OpenAI(api\_key=oai\_api\_key)
current\_dir = os.path.dirname(os.path.abspath(\_\_file\_\_))
samples\_dir = os.path.join(current\_dir, "sample\_files")
index\_documents(samples\_dir)
mcp.run(transport="sse")`
```
As seen above, we also include the RAG indexing as part of this workflow. In real-world applications, this will not be necessary for every run and if you have a large corpus of data, you may put this in a separate process.
In addition to simple RAG retrieval, we add an extra step to summarize the RAG output. This step is not always necessary, though we’ve found this to provide more succinct responses to the planner. Whether to do this depends on your system and your latency requirements.
### Using Pre-defined MCP Servers
While implementing custom MCPs servers is relatively straightforward, the power of MCP is the ability to use pre-defined servers that others have built and maintain. Using existing implementations enables more rapid development, has a consistent interface with other tools, and makes data integration more seamless.
For our database lookup tool, we use the prebuilt [SQLite server](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/sqlite) implementation. As you will see below, we can implement this simply with just a comand line prompt and providing it with a `\*.db` file with the data.
### Defining the Planner Agent
Next, we can define how the MCP server will generate meaningful responses. The planner agent is a key component within MCP’s agent orchestration pipeline. Its primary function is to decompose user requests into actionable steps and decide which tools, APIs, or agents should be called at each stage. Given the input as text, the planner parses and analyzes the request, maintaining context across multiple turns. Based on the conversation state, it invokes MCP tool services by dispatching tool calls via the MCP server’s orchestration layer. The agent then collects intermediate results, synthesizes responses, and guides the conversation toward resolution.
A key design consideration is the model selection for the planner. While larger models like `4.1` offer superior reasoning, low end-to-end latency is critical in voice-driven applications. For this reason, we select the `4.1-mini` model, which achieves a strong balance between reasoning ability and response speed.
```
`from agents import Agent, trace
from agents.mcp import MCPServer, MCPServerSse, MCPServerStdio
from agents.extensions.handoff\_prompt import prompt\_with\_handoff\_instructions
voice\_system\_prompt = """[Voice Output Guidelines]
Your responses will be delivered via voice, so please:
1. Use conversational, natural language that sounds good when spoken
2. Keep responses concise - ideally 1-2 sentences per point
3. Avoid technical jargon unless necessary, and explain terms simply
4. Pause naturally between topics using brief sentences
5. Be warm and personable in tone
"""
async def create\_insurance\_agents(mcp\_servers: list[MCPServer]) -\> Agent:
"""Create the insurance agent workflow with voice optimization"""
# Main insurance agent with MCP tools
insurance\_agent = Agent(
name="InsuranceAssistant",
instructions=voice\_system\_prompt + prompt\_with\_handoff\_instructions("""
#Identity
You an a helpful chatbot that answers questions about our insurance plans.
#Task
Use the tools provided to answer the questions.
#Instructions
\* Information about plans and policies are best answered with sqlite or rag\_output tools.
\* web\_search should be used for answering generic health questions that are not directly related to our insurance plans.
\* Evaluate the quality of the answer after the tool call.
\* Assess whether you are confident in the answer generated.
\* If your confidence is low, try use another tool.
"""),
mcp\_servers=mcp\_servers,
model="gpt-4.1-mini",
)
return insurance\_agent`
```
```
`[non-fatal] Tracing client error 400: {
"error": {
"message": "Invalid type for 'data[2].span\_data.result': expected an array of strings, but got null instead.",
"type": "invalid\_request\_error",
"param": "data[2].span\_data.result",
"code": "invalid\_type"
}
}`
```
In the agent definition, we clearly specify when each tool should be used. This ensures better control over responses and improves answer relevance. We also provide the Voice Agent with guidelines to set the desired tone and level of precision in its replies.
### Defining configurations for voice
Next, we define the configurations for our voice module, both for speech-to-text (STT) and text-to-speech (TTS). We use the OpenAI Agent Voice library to handling both input and output of voice. As defaults, this API calls the `gpt-4o-transcribe` and `gpt-4o-mini-tts` for STT and TTS, respectively.
For more content on defining voice assistants, see [this Cookbook](https://cookbook.openai.com/examples/agents_sdk/app_assistant_voice_agents).
```
`import numpy as np
import sounddevice as sd
from agents.voice import (
AudioInput,
SingleAgentVoiceWorkflow,
VoicePipeline,
VoicePipelineConfig,
TTSModelSettings
)
AudioBuffer = List[NDArray[np.int16]]
AUDIO\_CONFIG = {
"samplerate": 24000,
"channels": 1,
"dtype": "int16",
"blocksize": 2400,
"silence\_threshold": 500,
"silence\_duration": 1.5,
"min\_speech\_duration": 0.5,
}
insurance\_tts\_settings = TTSModelSettings(
instructions=(
"Personality: Professional, knowledgeable, and helpful insurance advisor"
"Tone: Friendly, clear, and reassuring, making customers feel confident about their insurance choices"
"Pronunciation: Clear and articulate, ensuring insurance terms are easily understood"
"Tempo: Moderate pace with natural pauses, especially when explaining complex insurance concepts"
"Emotion: Warm and supportive, conveying trust and expertise in insurance matters"
)
)
class AudioStreamManager:
"""Context manager for handling audio streams"""
def \_\_init\_\_(self, input\_stream: sd.InputStream, output\_stream: sd.OutputStream):
self.input\_stream = input\_stream
self.output\_stream = output\_stream
async def \_\_aenter\_\_(self):
try:
self.input\_stream.start()
self.output\_stream.start()
return self
except sd.PortAudioError as e:
raise RuntimeError(f"Failed to start audio streams: {e}")
async def \_\_aexit\_\_(self, exc\_type, exc\_val, exc\_tb):
try:
if self.input\_stream:
self.input\_stream.stop()
self.input\_stream.close()
if self.output\_stream:
self.output\_stream.stop()
self.output\_stream.close()
except Exception as e:
print(f"Warning: Error during audio stream cleanup: {e}")`
```
In enterprise scenarios, the tone and style of audio responses are critical to system usability. Speech output should consistently reflect professionalism and align with the company’s brand identity. For most applications, this means generating a realistic voice that mirrors the courteous, approachable demeanor typical of call-center representatives. With TTS, we can leverage prompt engineering to guide the model toward producing audio that better matches specific customer use cases and brand values.
### Processing Voice I/O
After configuring the voice settings, the next step is to implement functions for processing incoming audio and generating spoken responses. Pay particular attention to the `silence\_threshold` parameter in your configuration—this plays a crucial role in accurately detecting when a user has finished speaking and helps with speech endpoint detection.
```
`import asyncio
async def continuous\_voice\_conversation(agent: Agent):
"""Run a continuous voice conversation with automatic speech detection"""
voice\_config = VoicePipelineConfig(
tts\_settings=insurance\_tts\_settings,
)
pipeline = VoicePipeline(
workflow=SingleAgentVoiceWorkflow(agent),
config=voice\_config
)
audio\_queue: asyncio.Queue[NDArray[np.int16]] = asyncio.Queue()
is\_agent\_speaking = False
def audio\_callback(indata: NDArray[np.int16], frames: int, time\_info: dict, status: sd.CallbackFlags) -\> None:
"""Callback for continuous audio input"""
if status:
print(f"Audio input status: {status}")
if not is\_agent\_speaking: # Only record when agent isn't speaking
audio\_queue.put\_nowait(indata.copy())
input\_stream = sd.InputStream(
samplerate=AUDIO\_CONFIG["samplerate"],
channels=AUDIO\_CONFIG["channels"],
dtype=AUDIO\_CONFIG["dtype"],
callback=audio\_callback,
blocksize=AUDIO\_CONFIG["blocksize"]
)
output\_stream = sd.OutputStream(
samplerate=AUDIO\_CONFIG["samplerate"],
channels=AUDIO\_CONFIG["channels"],
dtype=AUDIO\_CONFIG["dtype"]
)
print("🎙️ Insurance Voice Assistant Ready!")
print("Start speaking at any time. Say 'goodbye' to exit.")
print("-" \* 50)
async with AudioStreamManager(input\_stream, output\_stream):
silence\_threshold = AUDIO\_CONFIG["silence\_threshold"]
silence\_duration = 0
max\_silence = AUDIO\_CONFIG["silence\_duration"]
audio\_buffer: AudioBuffer = []
while True:
try:
chunk = await asyncio.wait\_for(audio\_queue.get(), timeout=0.1)
if np.abs(chunk).mean() \> silence\_threshold:
audio\_buffer.append(chunk)
silence\_duration = 0
elif audio\_buffer:
silence\_duration += 0.1
audio\_buffer.append(chunk)
if silence\_duration \>= max\_silence:
try:
full\_audio = np.concatenate(audio\_buffer, axis=0)
if len(full\_audio) \> AUDIO\_CONFIG["samplerate"] \* AUDIO\_CONFIG["min\_speech\_duration"]:
print("\\n🤔 Processing speech...")
is\_agent\_speaking = True
audio\_input = AudioInput(buffer=full\_audio)
with trace("Insurance Voice Query"):
result = await pipeline.run(audio\_input)
print("💬 Assistant responding...")
async for event in result.stream():
if event.type == "voice\_stream\_event\_audio":
output\_stream.write(event.data)
elif event.type == "voice\_stream\_event\_transcript":
print(f" \> {event.text}", end="", flush=True)
print("\\n")
except Exception as e:
print(f"\\n❌ Error processing speech: {e}")
finally:
is\_agent\_speaking = False
audio\_buffer = []
silence\_duration = 0
except asyncio.TimeoutError:
continue
except KeyboardInterrupt:
print("\\n\\n👋 Goodbye!")
break
except Exception as e:
print(f"\\n❌ Unexpected error: {e}")
if isinstance(e, (sd.PortAudioError, RuntimeError)):
raise`
```
### Setting up the server process
Next, we add a simple convenience function for bringing up servers locally:
```
`import shutil
import subprocess
import nest\_asyncio
class ServerProcess:
"""Context manager for handling the SSE server process"""
def \_\_init\_\_(self, server\_file: str):
self.server\_file = server\_file
self.process: Optional[subprocess.Popen] = None
async def \_\_aenter\_\_(self):
if not shutil.which("uv"):
raise RuntimeError(
"uv is not installed. Please install it: https://docs.astral.sh/uv/getting-started/installation/"
)
print("Starting SSE server at http://localhost:8000/sse ...")
self.process = subprocess.Popen(["uv", "run", self.server\_file])
try:
await wait\_for\_server\_ready()
nest\_asyncio.apply()
print("SSE server started. Starting voice assistant...\\n")
return self
except Exception as e:
if self.process:
self.process.terminate()
raise RuntimeError(f"Failed to start SSE server: {e}")
async def \_\_aexit\_\_(self, exc\_type, exc\_val, exc\_tb):
if self.process:
try:
self.process.terminate()
self.process.wait(timeout=5)
if self.process.poll() is None:
self.process.kill()
except Exception as e:
print(f"Warning: Error during server shutdown: {e}")`
```
### Specifying the MCP tool services
In our `main` function, we can bring up the various tool-use services we’re interested in.
For our custom server for (RAG and web search), we can use the `MCPServerSse` function to start a server (in this case locally). To bring up the standard MCP SQLite service, we call `MCPServerStdio` with simple arguments provided, in this case, the local `database.db` file.
```
`import os
async def main():
"""Main function to run the voice assistant"""
this\_dir=os.getcwd()
#this\_dir = os.path.dirname(os.path.abspath(\_\_file\_\_))
server\_file= os.path.join(this\_dir, "search\_server.py")
#server\_file = os.path.join(this\_dir, "search\_server.py")
async with ServerProcess(server\_file):
# Initialize MCP servers
async with MCPServerSse(
name="SSE Python Server",
params={
"url": "http://localhost:8000/sse",
"timeout": 15.0,
},
client\_session\_timeout\_seconds=15.0,
) as search\_server:
async with MCPServerStdio(
cache\_tools\_list=True,
params={"command": "uvx", "args": ["mcp-server-sqlite", "--db-path", "./database.db"]},
) as sql\_server:
# Create insurance agent with MCP tools
agent = await create\_insurance\_agents([search\_server, sql\_server])
# Run the voice assistant
try:
await continuous\_voice\_conversation(agent)
except Exception as e:
print(f"\\nError in voice conversation: {e}")
raise`
```
## Summarizing the flow
Now that we have the various pieces in place, we can take a step back and visualize the overall workflow of our system:
### Tying it all together
Finally, we can instantiate the custom tool-use server and bring up the service:
```
`import asyncio
try:
asyncio.get\_running\_loop().create\_task(main())
except RuntimeError:
# For Jupyter, use nest\_asyncio and run main as a task
import nest\_asyncio
nest\_asyncio.apply()
task = asyncio.create\_task(main())
try:
await task
except KeyboardInterrupt:
print("\\nShutting down gracefully...")
except Exception as e:
print(f"\\nFatal error: {e}")
raise`
```
## Example outputs
Now that we have built the system end-to-end, we can now use it to answer questions. Here, we use our system to provide answers for a few common insurance questions based on the policy information docs. Below are some sample voice outputs from our agents based on some common questions users have:
**How are prescription drugs covered under this plan?** (uses retrieval)
```
`from IPython.display import display, Audio
import os
# Get the absolute path to the audio file
audio\_path = os.path.join(os.getcwd(), "sample\_output", "rag.mp3")
# Check if the file exists before trying to play it
if os.path.exists(audio\_path):
display(Audio(audio\_path))
else:
print(f"Audio file not found at: {audio\_path}")`
```
Your browser does not support the audio element.
**Which policies have monthly premium less than $300?** (uses DB lookup with SQL)
```
`display(Audio("sample\_output/sqlite.mp3"))`
```
Your browser does not support the audio element.
**What are effective treatments for diabetes?** (uses Web Search)
```
`display(Audio("sample\_output/web\_search.mp3"))`
```
Your browser does not support the audio element.
## Examining Traces
By default, model and tool calls that are used in our application are added to the [Traces](https://platform.openai.com/traces) dashboard out-of-the-box. These traces provide meaningful insight into what users experience as they use our agents.
Beyond agent performance, one critical aspect of building voice agents is the latency of responses. With the Traces dashboard, we are able to view the breakdown of walltime for each step to help debug and find areas of improvement for latency:
Explore individual traces to see each function call and its output, as shown below.
Traces offer granular visibility into function calls and their execution times, making it easy to identify sources of latency (for example, the web search tool above). Analyzing response time variability for each tool invocation helps you pinpoint bottlenecks and opportunities for optimization in production systems.
## Conclusion
This cookbook has guided you through building a complete agent solution that harnesses the flexibility and strength of the MCP platform. By integrating the Voice Agents SDK, we illustrated how to develop a consumer-ready product powered by these technologies. We’ve shown how OpenAI’s tools and the Agents API can be effectively combined with MCP to deliver impactful applications.
We hope this guide has offered both practical instruction and inspiration, helping you create your own MCP-powered voice agents tailored to your specific needs.
### Contributors
This cookbook serves as a joint collaboration effort between OpenAI and [Brain Co](https://www.braincompany.ai/en/).
* [Cece Z](https://www.linkedin.com/in/cecez/)
* [Sibon Li](https://www.linkedin.com/in/sibon-li-9a9bba34/)
* [Shikhar Kwatra](https://www.linkedin.com/in/shikharkwatra/)