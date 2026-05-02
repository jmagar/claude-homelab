How to stream completions
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
Sep 2, 2022
# How to stream completions
This recipe is archived and may reference outdated models or APIs.
[ TS ](https://github.com/ted-at-openai)
[ Ted Sanders
(OpenAI)
](https://github.com/ted-at-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/How_to_stream_completions.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/How_to_stream_completions.ipynb)
By default, when you request a completion from the OpenAI, the entire completion is generated before being sent back in a single response.
If you’re generating long completions, waiting for the response can take many seconds.
To get responses sooner, you can ‘stream’ the completion as it’s being generated. This allows you to start printing or processing the beginning of the completion before the full completion is finished.
To stream completions, set `stream=True` when calling the chat completions or completions endpoints. This will return an object that streams back the response as [data-only server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#event_stream_format). Extract chunks from the `delta` field rather than the `message` field.
## Downsides
Note that using `stream=True` in a production application makes it more difficult to moderate the content of the completions, as partial completions may be more difficult to evaluate. This may have implications for [approved usage](https://beta.openai.com/docs/usage-guidelines).
## Example code
Below, this notebook shows:
1. What a typical chat completion response looks like
2. What a streaming chat completion response looks like
3. How much time is saved by streaming a chat completion
4. How to get token usage data for streamed chat completion response
```
`# !pip install openai`
```
```
`# imports
import time # for measuring time duration of API calls
from openai import OpenAI
import os
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))`
```
### 1. What a typical chat completion response looks like
With a typical ChatCompletions API call, the response is first computed and then returned all at once.
```
`# Example of an OpenAI ChatCompletion request
# https://platform.openai.com/docs/guides/text-generation/chat-completions-api
# record the time before the request is sent
start\_time = time.time()
# send a ChatCompletion request to count to 100
response = client.chat.completions.create(
model='gpt-4o-mini',
messages=[
{'role': 'user', 'content': 'Count to 100, with a comma between each number and no newlines. E.g., 1, 2, 3, ...'}
],
temperature=0,
)
# calculate the time it took to receive the response
response\_time = time.time() - start\_time
# print the time delay and text received
print(f"Full response received {response\_time:.2f} seconds after request")
print(f"Full response received:\\n{response}")`
```
```
`Full response received 1.88 seconds after request
Full response received:
ChatCompletion(id='chatcmpl-9lMgdoiMfxVHPDNVCtvXuTWcQ2GGb', choices=[Choice(finish\_reason='stop', index=0, logprobs=None, message=ChatCompletionMessage(content='1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100', role='assistant', function\_call=None, tool\_calls=None))], created=1721075651, model='gpt-july-test', object='chat.completion', system\_fingerprint='fp\_e9b8ed65d2', usage=CompletionUsage(completion\_tokens=298, prompt\_tokens=36, total\_tokens=334))`
```
The reply can be extracted with `response.choices[0].message`.
The content of the reply can be extracted with `response.choices[0].message.content`.
```
`reply = response.choices[0].message
print(f"Extracted reply: \\n{reply}")
reply\_content = response.choices[0].message.content
print(f"Extracted content: \\n{reply\_content}")`
```
```
`Extracted reply:
ChatCompletionMessage(content='1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100', role='assistant', function\_call=None, tool\_calls=None)
Extracted content:
1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100`
```
### 2. How to stream a chat completion
With a streaming API call, the response is sent back incrementally in chunks via an [event stream](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#event_stream_format). In Python, you can iterate over these events with a `for` loop.
Let’s see what it looks like:
```
`# Example of an OpenAI ChatCompletion request with stream=True
# https://platform.openai.com/docs/api-reference/streaming#chat/create-stream
# a ChatCompletion request
response = client.chat.completions.create(
model='gpt-4o-mini',
messages=[
{'role': 'user', 'content': "What's 1+1? Answer in one word."}
],
temperature=0,
stream=True # this time, we set stream=True
)
for chunk in response:
print(chunk)
print(chunk.choices[0].delta.content)
print("\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*")`
```
```
`ChatCompletionChunk(id='chatcmpl-9lMgfRSWPHcw51s6wxKT1YEO2CKpd', choices=[Choice(delta=ChoiceDelta(content='', function\_call=None, role='assistant', tool\_calls=None), finish\_reason=None, index=0, logprobs=None)], created=1721075653, model='gpt-july-test', object='chat.completion.chunk', system\_fingerprint='fp\_e9b8ed65d2', usage=None)
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
ChatCompletionChunk(id='chatcmpl-9lMgfRSWPHcw51s6wxKT1YEO2CKpd', choices=[Choice(delta=ChoiceDelta(content='Two', function\_call=None, role=None, tool\_calls=None), finish\_reason=None, index=0, logprobs=None)], created=1721075653, model='gpt-july-test', object='chat.completion.chunk', system\_fingerprint='fp\_e9b8ed65d2', usage=None)
Two
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
ChatCompletionChunk(id='chatcmpl-9lMgfRSWPHcw51s6wxKT1YEO2CKpd', choices=[Choice(delta=ChoiceDelta(content='.', function\_call=None, role=None, tool\_calls=None), finish\_reason=None, index=0, logprobs=None)], created=1721075653, model='gpt-july-test', object='chat.completion.chunk', system\_fingerprint='fp\_e9b8ed65d2', usage=None)
.
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
ChatCompletionChunk(id='chatcmpl-9lMgfRSWPHcw51s6wxKT1YEO2CKpd', choices=[Choice(delta=ChoiceDelta(content=None, function\_call=None, role=None, tool\_calls=None), finish\_reason='stop', index=0, logprobs=None)], created=1721075653, model='gpt-july-test', object='chat.completion.chunk', system\_fingerprint='fp\_e9b8ed65d2', usage=None)
None
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*`
```
As you can see above, streaming responses have a `delta` field rather than a `message` field. `delta` can hold things like:
* a role token (e.g., `{"role": "assistant"}`)
* a content token (e.g., `{"content": "\\n\\n"}`)
* nothing (e.g., `{}`), when the stream is over
### 3. How much time is saved by streaming a chat completion
Now let’s ask `gpt-4o-mini` to count to 100 again, and see how long it takes.
```
`# Example of an OpenAI ChatCompletion request with stream=True
# https://platform.openai.com/docs/api-reference/streaming#chat/create-stream
# record the time before the request is sent
start\_time = time.time()
# send a ChatCompletion request to count to 100
response = client.chat.completions.create(
model='gpt-4o-mini',
messages=[
{'role': 'user', 'content': 'Count to 100, with a comma between each number and no newlines. E.g., 1, 2, 3, ...'}
],
temperature=0,
stream=True # again, we set stream=True
)
# create variables to collect the stream of chunks
collected\_chunks = []
collected\_messages = []
# iterate through the stream of events
for chunk in response:
chunk\_time = time.time() - start\_time # calculate the time delay of the chunk
collected\_chunks.append(chunk) # save the event response
chunk\_message = chunk.choices[0].delta.content # extract the message
collected\_messages.append(chunk\_message) # save the message
print(f"Message received {chunk\_time:.2f} seconds after request: {chunk\_message}") # print the delay and text
# print the time delay and text received
print(f"Full response received {chunk\_time:.2f} seconds after request")
# clean None in collected\_messages
collected\_messages = [m for m in collected\_messages if m is not None]
full\_reply\_content = ''.join(collected\_messages)
print(f"Full conversation received: {full\_reply\_content}")`
```
```
`Message received 1.14 seconds after request:
Message received 1.14 seconds after request: 1
Message received 1.14 seconds after request: ,
Message received 1.14 seconds after request:
Message received 1.14 seconds after request: 2
Message received 1.16 seconds after request: ,
Message received 1.16 seconds after request:
Message received 1.16 seconds after request: 3
Message received 1.35 seconds after request: ,
Message received 1.35 seconds after request:
Message received 1.35 seconds after request: 4
Message received 1.36 seconds after request: ,
Message received 1.36 seconds after request:
Message received 1.36 seconds after request: 5
Message received 1.36 seconds after request: ,
Message received 1.36 seconds after request:
Message received 1.36 seconds after request: 6
Message received 1.36 seconds after request: ,
Message received 1.36 seconds after request:
Message received 1.36 seconds after request: 7
Message received 1.36 seconds after request: ,
Message received 1.36 seconds after request:
Message received 1.36 seconds after request: 8
Message received 1.36 seconds after request: ,
Message received 1.36 seconds after request:
Message received 1.36 seconds after request: 9
Message received 1.36 seconds after request: ,
Message received 1.36 seconds after request:
Message received 1.36 seconds after request: 10
Message received 1.36 seconds after request: ,
Message received 1.36 seconds after request:
Message received 1.36 seconds after request: 11
Message received 1.36 seconds after request: ,
Message received 1.36 seconds after request:
Message received 1.36 seconds after request: 12
Message received 1.36 seconds after request: ,
Message received 1.36 seconds after request:
Message received 1.45 seconds after request: 13
Message received 1.45 seconds after request: ,
Message received 1.45 seconds after request:
Message received 1.45 seconds after request: 14
Message received 1.45 seconds after request: ,
Message received 1.45 seconds after request:
Message received 1.45 seconds after request: 15
Message received 1.45 seconds after request: ,
Message received 1.45 seconds after request:
Message received 1.46 seconds after request: 16
Message received 1.46 seconds after request: ,
Message received 1.46 seconds after request:
Message received 1.47 seconds after request: 17
Message received 1.47 seconds after request: ,
Message received 1.47 seconds after request:
Message received 1.49 seconds after request: 18
Message received 1.49 seconds after request: ,
Message received 1.49 seconds after request:
Message received 1.52 seconds after request: 19
Message received 1.52 seconds after request: ,
Message received 1.52 seconds after request:
Message received 1.53 seconds after request: 20
Message received 1.53 seconds after request: ,
Message received 1.53 seconds after request:
Message received 1.55 seconds after request: 21
Message received 1.55 seconds after request: ,
Message received 1.55 seconds after request:
Message received 1.56 seconds after request: 22
Message received 1.56 seconds after request: ,
Message received 1.56 seconds after request:
Message received 1.58 seconds after request: 23
Message received 1.58 seconds after request: ,
Message received 1.58 seconds after request:
Message received 1.59 seconds after request: 24
Message received 1.59 seconds after request: ,
Message received 1.59 seconds after request:
Message received 1.62 seconds after request: 25
Message received 1.62 seconds after request: ,
Message received 1.62 seconds after request:
Message received 1.62 seconds after request: 26
Message received 1.62 seconds after request: ,
Message received 1.62 seconds after request:
Message received 1.65 seconds after request: 27
Message received 1.65 seconds after request: ,
Message received 1.65 seconds after request:
Message received 1.67 seconds after request: 28
Message received 1.67 seconds after request: ,
Message received 1.67 seconds after request:
Message received 1.69 seconds after request: 29
Message received 1.69 seconds after request: ,
Message received 1.69 seconds after request:
Message received 1.80 seconds after request: 30
Message received 1.80 seconds after request: ,
Message received 1.80 seconds after request:
Message received 1.80 seconds after request: 31
Message received 1.80 seconds after request: ,
Message received 1.80 seconds after request:
Message received 1.80 seconds after request: 32
Message received 1.80 seconds after request: ,
Message received 1.80 seconds after request:
Message received 1.80 seconds after request: 33
Message received 1.80 seconds after request: ,
Message received 1.80 seconds after request:
Message received 1.80 seconds after request: 34
Message received 1.80 seconds after request: ,
Message received 1.80 seconds after request:
Message received 1.80 seconds after request: 35
Message received 1.80 seconds after request: ,
Message received 1.80 seconds after request:
Message received 1.80 seconds after request: 36
Message received 1.80 seconds after request: ,
Message received 1.80 seconds after request:
Message received 1.82 seconds after request: 37
Message received 1.82 seconds after request: ,
Message received 1.82 seconds after request:
Message received 1.83 seconds after request: 38
Message received 1.83 seconds after request: ,
Message received 1.83 seconds after request:
Message received 1.84 seconds after request: 39
Message received 1.84 seconds after request: ,
Message received 1.84 seconds after request:
Message received 1.87 seconds after request: 40
Message received 1.87 seconds after request: ,
Message received 1.87 seconds after request:
Message received 1.88 seconds after request: 41
Message received 1.88 seconds after request: ,
Message received 1.88 seconds after request:
Message received 1.91 seconds after request: 42
Message received 1.91 seconds after request: ,
Message received 1.91 seconds after request:
Message received 1.93 seconds after request: 43
Message received 1.93 seconds after request: ,
Message received 1.93 seconds after request:
Message received 1.93 seconds after request: 44
Message received 1.93 seconds after request: ,
Message received 1.93 seconds after request:
Message received 1.95 seconds after request: 45
Message received 1.95 seconds after request: ,
Message received 1.95 seconds after request:
Message received 2.00 seconds after request: 46
Message received 2.00 seconds after request: ,
Message received 2.00 seconds after request:
Message received 2.00 seconds after request: 47
Message received 2.00 seconds after request: ,
Message received 2.00 seconds after request:
Message received 2.00 seconds after request: 48
Message received 2.00 seconds after request: ,
Message received 2.00 seconds after request:
Message received 2.00 seconds after request: 49
Message received 2.00 seconds after request: ,
Message received 2.00 seconds after request:
Message received 2.00 seconds after request: 50
Message received 2.00 seconds after request: ,
Message received 2.00 seconds after request:
Message received 2.00 seconds after request: 51
Message received 2.00 seconds after request: ,
Message received 2.04 seconds after request:
Message received 2.04 seconds after request: 52
Message received 2.04 seconds after request: ,
Message received 2.04 seconds after request:
Message received 2.04 seconds after request: 53
Message received 2.04 seconds after request: ,
Message received 2.13 seconds after request:
Message received 2.13 seconds after request: 54
Message received 2.14 seconds after request: ,
Message received 2.14 seconds after request:
Message received 2.14 seconds after request: 55
Message received 2.14 seconds after request: ,
Message received 2.14 seconds after request:
Message received 2.14 seconds after request: 56
Message received 2.14 seconds after request: ,
Message received 2.14 seconds after request:
Message received 2.16 seconds after request: 57
Message received 2.16 seconds after request: ,
Message received 2.16 seconds after request:
Message received 2.17 seconds after request: 58
Message received 2.17 seconds after request: ,
Message received 2.17 seconds after request:
Message received 2.19 seconds after request: 59
Message received 2.19 seconds after request: ,
Message received 2.19 seconds after request:
Message received 2.21 seconds after request: 60
Message received 2.21 seconds after request: ,
Message received 2.21 seconds after request:
Message received 2.34 seconds after request: 61
Message received 2.34 seconds after request: ,
Message received 2.34 seconds after request:
Message received 2.34 seconds after request: 62
Message received 2.34 seconds after request: ,
Message received 2.34 seconds after request:
Message received 2.34 seconds after request: 63
Message received 2.34 seconds after request: ,
Message received 2.34 seconds after request:
Message received 2.34 seconds after request: 64
Message received 2.34 seconds after request: ,
Message received 2.34 seconds after request:
Message received 2.34 seconds after request: 65
Message received 2.34 seconds after request: ,
Message received 2.34 seconds after request:
Message received 2.34 seconds after request: 66
Message received 2.34 seconds after request: ,
Message received 2.34 seconds after request:
Message received 2.34 seconds after request: 67
Message received 2.34 seconds after request: ,
Message received 2.34 seconds after request:
Message received 2.36 seconds after request: 68
Message received 2.36 seconds after request: ,
Message received 2.36 seconds after request:
Message received 2.36 seconds after request: 69
Message received 2.36 seconds after request: ,
Message received 2.36 seconds after request:
Message received 2.38 seconds after request: 70
Message received 2.38 seconds after request: ,
Message received 2.38 seconds after request:
Message received 2.39 seconds after request: 71
Message received 2.39 seconds after request: ,
Message received 2.39 seconds after request:
Message received 2.39 seconds after request: 72
Message received 2.39 seconds after request: ,
Message received 2.39 seconds after request:
Message received 2.39 seconds after request: 73
Message received 2.39 seconds after request: ,
Message received 2.39 seconds after request:
Message received 2.39 seconds after request: 74
Message received 2.39 seconds after request: ,
Message received 2.39 seconds after request:
Message received 2.39 seconds after request: 75
Message received 2.39 seconds after request: ,
Message received 2.40 seconds after request:
Message received 2.40 seconds after request: 76
Message received 2.40 seconds after request: ,
Message received 2.42 seconds after request:
Message received 2.42 seconds after request: 77
Message received 2.42 seconds after request: ,
Message received 2.51 seconds after request:
Message received 2.51 seconds after request: 78
Message received 2.51 seconds after request: ,
Message received 2.52 seconds after request:
Message received 2.52 seconds after request: 79
Message received 2.52 seconds after request: ,
Message received 2.52 seconds after request:
Message received 2.52 seconds after request: 80
Message received 2.52 seconds after request: ,
Message received 2.52 seconds after request:
Message received 2.52 seconds after request: 81
Message received 2.52 seconds after request: ,
Message received 2.52 seconds after request:
Message received 2.52 seconds after request: 82
Message received 2.52 seconds after request: ,
Message received 2.60 seconds after request:
Message received 2.60 seconds after request: 83
Message received 2.60 seconds after request: ,
Message received 2.64 seconds after request:
Message received 2.64 seconds after request: 84
Message received 2.64 seconds after request: ,
Message received 2.64 seconds after request:
Message received 2.64 seconds after request: 85
Message received 2.64 seconds after request: ,
Message received 2.64 seconds after request:
Message received 2.66 seconds after request: 86
Message received 2.66 seconds after request: ,
Message received 2.66 seconds after request:
Message received 2.66 seconds after request: 87
Message received 2.66 seconds after request: ,
Message received 2.66 seconds after request:
Message received 2.68 seconds after request: 88
Message received 2.68 seconds after request: ,
Message received 2.68 seconds after request:
Message received 2.69 seconds after request: 89
Message received 2.69 seconds after request: ,
Message received 2.69 seconds after request:
Message received 2.72 seconds after request: 90
Message received 2.72 seconds after request: ,
Message received 2.72 seconds after request:
Message received 2.82 seconds after request: 91
Message received 2.82 seconds after request: ,
Message received 2.82 seconds after request:
Message received 2.82 seconds after request: 92
Message received 2.82 seconds after request: ,
Message received 2.82 seconds after request:
Message received 2.82 seconds after request: 93
Message received 2.82 seconds after request: ,
Message received 2.82 seconds after request:
Message received 2.82 seconds after request: 94
Message received 2.82 seconds after request: ,
Message received 2.82 seconds after request:
Message received 2.82 seconds after request: 95
Message received 2.82 seconds after request: ,
Message received 2.82 seconds after request:
Message received 2.82 seconds after request: 96
Message received 2.82 seconds after request: ,
Message received 2.82 seconds after request:
Message received 2.82 seconds after request: 97
Message received 2.82 seconds after request: ,
Message received 2.82 seconds after request:
Message received 2.82 seconds after request: 98
Message received 2.82 seconds after request: ,
Message received 2.82 seconds after request:
Message received 2.82 seconds after request: 99
Message received 2.82 seconds after request: ,
Message received 2.82 seconds after request:
Message received 2.82 seconds after request: 100
Message received 2.82 seconds after request: None
Full response received 2.82 seconds after request
Full conversation received: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100`
```
#### Time comparison
In the example above, both requests took about 4 to 5 seconds to fully complete. Request times will vary depending on load and other stochastic factors.
However, with the streaming request, we received the first token after 0.1 seconds, and subsequent tokens every \~0.01-0.02 seconds.
### 4. How to get token usage data for streamed chat completion response
You can get token usage statistics for your streamed response by setting `stream\_options={"include\_usage": True}`. When you do so, an extra chunk will be streamed as the final chunk. You can access the usage data for the entire request via the `usage` field on this chunk. A few important notes when you set `stream\_options={"include\_usage": True}`:
* The value for the `usage` field on all chunks except for the last one will be null.
* The `usage` field on the last chunk contains token usage statistics for the entire request.
* The `choices` field on the last chunk will always be an empty array `[]`.
Let’s see how it works using the example in 2.
```
`# Example of an OpenAI ChatCompletion request with stream=True and stream\_options={"include\_usage": True}
# a ChatCompletion request
response = client.chat.completions.create(
model='gpt-4o-mini',
messages=[
{'role': 'user', 'content': "What's 1+1? Answer in one word."}
],
temperature=0,
stream=True,
stream\_options={"include\_usage": True}, # retrieving token usage for stream response
)
for chunk in response:
print(f"choices: {chunk.choices}\\nusage: {chunk.usage}")
print("\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*")`
```
```
`choices: [Choice(delta=ChoiceDelta(content='', function\_call=None, role='assistant', tool\_calls=None), finish\_reason=None, index=0, logprobs=None)]
usage: None
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
choices: [Choice(delta=ChoiceDelta(content='Two', function\_call=None, role=None, tool\_calls=None), finish\_reason=None, index=0, logprobs=None)]
usage: None
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
choices: [Choice(delta=ChoiceDelta(content='.', function\_call=None, role=None, tool\_calls=None), finish\_reason=None, index=0, logprobs=None)]
usage: None
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
choices: [Choice(delta=ChoiceDelta(content=None, function\_call=None, role=None, tool\_calls=None), finish\_reason='stop', index=0, logprobs=None)]
usage: None
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
choices: []
usage: CompletionUsage(completion\_tokens=2, prompt\_tokens=18, total\_tokens=20)
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*`
```