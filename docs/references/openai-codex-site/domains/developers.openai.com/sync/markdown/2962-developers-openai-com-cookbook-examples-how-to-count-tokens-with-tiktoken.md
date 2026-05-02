How to count tokens with Tiktoken
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
Dec 16, 2022
# How to count tokens with Tiktoken
This recipe is archived and may reference outdated models or APIs.
[ TS ](https://github.com/ted-at-openai)
[ Ted Sanders
(OpenAI)
](https://github.com/ted-at-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/How_to_count_tokens_with_tiktoken.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/How_to_count_tokens_with_tiktoken.ipynb)
[`tiktoken`](https://github.com/openai/tiktoken/blob/main/README.md) is a fast open-source tokenizer by OpenAI.
Given a text string (e.g., `"tiktoken is great!"`) and an encoding (e.g., `"cl100k\_base"`), a tokenizer can split the text string into a list of tokens (e.g., `["t", "ik", "token", " is", " great", "!"]`).
Splitting text strings into tokens is useful because GPT models see text in the form of tokens. Knowing how many tokens are in a text string can tell you (a) whether the string is too long for a text model to process and (b) how much an OpenAI API call costs (as usage is priced by token).
## Encodings
Encodings specify how text is converted into tokens. Different models use different encodings.
`tiktoken` supports three encodings used by OpenAI models:
|Encoding name|OpenAI models|
|`o200k\_base`|`gpt-4o`, `gpt-4o-mini`|
|`cl100k\_base`|`gpt-4-turbo`, `gpt-4`, `gpt-3.5-turbo`, `text-embedding-ada-002`, `text-embedding-3-small`, `text-embedding-3-large`|
|`p50k\_base`|Codex models, `text-davinci-002`, `text-davinci-003`|
|`r50k\_base` (or `gpt2`)|GPT-3 models like `davinci`|
You can retrieve the encoding for a model using `tiktoken.encoding\_for\_model()` as follows:
```
`encoding = tiktoken.encoding\_for\_model('gpt-4o-mini')`
```
Note that `p50k\_base` overlaps substantially with `r50k\_base`, and for non-code applications, they will usually give the same tokens.
## Tokenizer libraries by language
For `o200k\_base`, `cl100k\_base` and `p50k\_base` encodings:
* Python: [tiktoken](https://github.com/openai/tiktoken/blob/main/README.md)
* .NET / C#: [SharpToken](https://github.com/dmitry-brazhenko/SharpToken), [TiktokenSharp](https://github.com/aiqinxuancai/TiktokenSharp)
* Java: [jtokkit](https://github.com/knuddelsgmbh/jtokkit)
* Golang: [tiktoken-go](https://github.com/pkoukk/tiktoken-go)
* Rust: [tiktoken-rs](https://github.com/zurawiki/tiktoken-rs)
For `r50k\_base` (`gpt2`) encodings, tokenizers are available in many languages.
* Python: [tiktoken](https://github.com/openai/tiktoken/blob/main/README.md) (or alternatively [GPT2TokenizerFast](https://huggingface.co/docs/transformers/model_doc/gpt2#transformers.GPT2TokenizerFast))
* JavaScript: [gpt-3-encoder](https://www.npmjs.com/package/gpt-3-encoder)
* .NET / C#: [GPT Tokenizer](https://github.com/dluc/openai-tools)
* Java: [gpt2-tokenizer-java](https://github.com/hyunwoongko/gpt2-tokenizer-java)
* PHP: [GPT-3-Encoder-PHP](https://github.com/CodeRevolutionPlugins/GPT-3-Encoder-PHP)
* Golang: [tiktoken-go](https://github.com/pkoukk/tiktoken-go)
* Rust: [tiktoken-rs](https://github.com/zurawiki/tiktoken-rs)
(OpenAI makes no endorsements or guarantees of third-party libraries.)
## How strings are typically tokenized
In English, tokens commonly range in length from one character to one word (e.g., `"t"` or `" great"`), though in some languages tokens can be shorter than one character or longer than one word. Spaces are usually grouped with the starts of words (e.g., `" is"` instead of `"is "` or `" "`+`"is"`). You can quickly check how a string is tokenized at the [OpenAI Tokenizer](https://beta.openai.com/tokenizer), or the third-party [Tiktokenizer](https://tiktokenizer.vercel.app/) webapp.
## 0. Install `tiktoken`
If needed, install `tiktoken` with `pip`:
```
`%pip install --upgrade tiktoken -q
%pip install --upgrade openai -q`
```
```
`
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m A new release of pip is available: [0m[31;49m24.0[0m[39;49m -\> [0m[32;49m24.2[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m To update, run: [0m[32;49mpip install --upgrade pip[0m
Note: you may need to restart the kernel to use updated packages.
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m A new release of pip is available: [0m[31;49m24.0[0m[39;49m -\> [0m[32;49m24.2[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m To update, run: [0m[32;49mpip install --upgrade pip[0m
Note: you may need to restart the kernel to use updated packages.`
```
## 1. Import `tiktoken`
```
`import tiktoken`
```
## 2. Load an encoding
Use `tiktoken.get\_encoding()` to load an encoding by name.
The first time this runs, it will require an internet connection to download. Later runs won’t need an internet connection.
```
`encoding = tiktoken.get\_encoding("cl100k\_base")`
```
Use `tiktoken.encoding\_for\_model()` to automatically load the correct encoding for a given model name.
```
`encoding = tiktoken.encoding\_for\_model("gpt-4o-mini")`
```
## 3. Turn text into tokens with `encoding.encode()`
The `.encode()` method converts a text string into a list of token integers.
```
`encoding.encode("tiktoken is great!")`
```
```
`[83, 8251, 2488, 382, 2212, 0]`
```
Count tokens by counting the length of the list returned by `.encode()`.
```
`def num\_tokens\_from\_string(string: str, encoding\_name: str) -\> int:
"""Returns the number of tokens in a text string."""
encoding = tiktoken.get\_encoding(encoding\_name)
num\_tokens = len(encoding.encode(string))
return num\_tokens`
```
```
`num\_tokens\_from\_string("tiktoken is great!", "o200k\_base")`
```
```
`6`
```
## 4. Turn tokens into text with `encoding.decode()`
`.decode()` converts a list of token integers to a string.
```
`encoding.decode([83, 8251, 2488, 382, 2212, 0])`
```
```
`'tiktoken is great!'`
```
Warning: although `.decode()` can be applied to single tokens, beware that it can be lossy for tokens that aren’t on utf-8 boundaries.
For single tokens, `.decode\_single\_token\_bytes()` safely converts a single integer token to the bytes it represents.
```
`[encoding.decode\_single\_token\_bytes(token) for token in [83, 8251, 2488, 382, 2212, 0]]`
```
```
`[b't', b'ikt', b'oken', b' is', b' great', b'!']`
```
(The `b` in front of the strings indicates that the strings are byte strings.)
## 5. Comparing encodings
Different encodings vary in how they split words, group spaces, and handle non-English characters. Using the methods above, we can compare different encodings on a few example strings.
```
`def compare\_encodings(example\_string: str) -\> None:
"""Prints a comparison of three string encodings."""
# print the example string
print(f'\\nExample string: "{example\_string}"')
# for each encoding, print the # of tokens, the token integers, and the token bytes
for encoding\_name in ["r50k\_base", "p50k\_base", "cl100k\_base", "o200k\_base"]:
encoding = tiktoken.get\_encoding(encoding\_name)
token\_integers = encoding.encode(example\_string)
num\_tokens = len(token\_integers)
token\_bytes = [encoding.decode\_single\_token\_bytes(token) for token in token\_integers]
print()
print(f"{encoding\_name}: {num\_tokens} tokens")
print(f"token integers: {token\_integers}")
print(f"token bytes: {token\_bytes}")`
```
```
`compare\_encodings("antidisestablishmentarianism")`
```
```
`
Example string: "antidisestablishmentarianism"
r50k\_base: 5 tokens
token integers: [415, 29207, 44390, 3699, 1042]
token bytes: [b'ant', b'idis', b'establishment', b'arian', b'ism']
p50k\_base: 5 tokens
token integers: [415, 29207, 44390, 3699, 1042]
token bytes: [b'ant', b'idis', b'establishment', b'arian', b'ism']
cl100k\_base: 6 tokens
token integers: [519, 85342, 34500, 479, 8997, 2191]
token bytes: [b'ant', b'idis', b'establish', b'ment', b'arian', b'ism']
o200k\_base: 6 tokens
token integers: [493, 129901, 376, 160388, 21203, 2367]
token bytes: [b'ant', b'idis', b'est', b'ablishment', b'arian', b'ism']`
```
```
`compare\_encodings("2 + 2 = 4")`
```
```
`
Example string: "2 + 2 = 4"
r50k\_base: 5 tokens
token integers: [17, 1343, 362, 796, 604]
token bytes: [b'2', b' +', b' 2', b' =', b' 4']
p50k\_base: 5 tokens
token integers: [17, 1343, 362, 796, 604]
token bytes: [b'2', b' +', b' 2', b' =', b' 4']
cl100k\_base: 7 tokens
token integers: [17, 489, 220, 17, 284, 220, 19]
token bytes: [b'2', b' +', b' ', b'2', b' =', b' ', b'4']
o200k\_base: 7 tokens
token integers: [17, 659, 220, 17, 314, 220, 19]
token bytes: [b'2', b' +', b' ', b'2', b' =', b' ', b'4']`
```
```
`compare\_encodings("お誕生日おめでとう")`
```
```
`
Example string: "お誕生日おめでとう"
r50k\_base: 14 tokens
token integers: [2515, 232, 45739, 243, 37955, 33768, 98, 2515, 232, 1792, 223, 30640, 30201, 29557]
token bytes: [b'\\xe3\\x81', b'\\x8a', b'\\xe8\\xaa', b'\\x95', b'\\xe7\\x94\\x9f', b'\\xe6\\x97', b'\\xa5', b'\\xe3\\x81', b'\\x8a', b'\\xe3\\x82', b'\\x81', b'\\xe3\\x81\\xa7', b'\\xe3\\x81\\xa8', b'\\xe3\\x81\\x86']
p50k\_base: 14 tokens
token integers: [2515, 232, 45739, 243, 37955, 33768, 98, 2515, 232, 1792, 223, 30640, 30201, 29557]
token bytes: [b'\\xe3\\x81', b'\\x8a', b'\\xe8\\xaa', b'\\x95', b'\\xe7\\x94\\x9f', b'\\xe6\\x97', b'\\xa5', b'\\xe3\\x81', b'\\x8a', b'\\xe3\\x82', b'\\x81', b'\\xe3\\x81\\xa7', b'\\xe3\\x81\\xa8', b'\\xe3\\x81\\x86']
cl100k\_base: 9 tokens
token integers: [33334, 45918, 243, 21990, 9080, 33334, 62004, 16556, 78699]
token bytes: [b'\\xe3\\x81\\x8a', b'\\xe8\\xaa', b'\\x95', b'\\xe7\\x94\\x9f', b'\\xe6\\x97\\xa5', b'\\xe3\\x81\\x8a', b'\\xe3\\x82\\x81', b'\\xe3\\x81\\xa7', b'\\xe3\\x81\\xa8\\xe3\\x81\\x86']
o200k\_base: 8 tokens
token integers: [8930, 9697, 243, 128225, 8930, 17693, 4344, 48669]
token bytes: [b'\\xe3\\x81\\x8a', b'\\xe8\\xaa', b'\\x95', b'\\xe7\\x94\\x9f\\xe6\\x97\\xa5', b'\\xe3\\x81\\x8a', b'\\xe3\\x82\\x81', b'\\xe3\\x81\\xa7', b'\\xe3\\x81\\xa8\\xe3\\x81\\x86']`
```
## 6. Counting tokens for chat completions API calls
ChatGPT models like `gpt-4o-mini` and `gpt-4` use tokens in the same way as older completions models, but because of their message-based formatting, it’s more difficult to count how many tokens will be used by a conversation.
Below is an example function for counting tokens for messages passed to `gpt-3.5-turbo`, `gpt-4`, `gpt-4o` and `gpt-4o-mini`.
Note that the exact way that tokens are counted from messages may change from model to model. Consider the counts from the function below an estimate, not a timeless guarantee.
In particular, requests that use the optional functions input will consume extra tokens on top of the estimates calculated below.
```
`def num\_tokens\_from\_messages(messages, model="gpt-4o-mini-2024-07-18"):
"""Return the number of tokens used by a list of messages."""
try:
encoding = tiktoken.encoding\_for\_model(model)
except KeyError:
print("Warning: model not found. Using o200k\_base encoding.")
encoding = tiktoken.get\_encoding("o200k\_base")
if model in {
"gpt-3.5-turbo-0125",
"gpt-4-0314",
"gpt-4-32k-0314",
"gpt-4-0613",
"gpt-4-32k-0613",
"gpt-4o-mini-2024-07-18",
"gpt-4o-2024-08-06"
}:
tokens\_per\_message = 3
tokens\_per\_name = 1
elif "gpt-3.5-turbo" in model:
print("Warning: gpt-3.5-turbo may update over time. Returning num tokens assuming gpt-3.5-turbo-0125.")
return num\_tokens\_from\_messages(messages, model="gpt-3.5-turbo-0125")
elif "gpt-4o-mini" in model:
print("Warning: gpt-4o-mini may update over time. Returning num tokens assuming gpt-4o-mini-2024-07-18.")
return num\_tokens\_from\_messages(messages, model="gpt-4o-mini-2024-07-18")
elif "gpt-4o" in model:
print("Warning: gpt-4o and gpt-4o-mini may update over time. Returning num tokens assuming gpt-4o-2024-08-06.")
return num\_tokens\_from\_messages(messages, model="gpt-4o-2024-08-06")
elif "gpt-4" in model:
print("Warning: gpt-4 may update over time. Returning num tokens assuming gpt-4-0613.")
return num\_tokens\_from\_messages(messages, model="gpt-4-0613")
else:
raise NotImplementedError(
f"""num\_tokens\_from\_messages() is not implemented for model {model}."""
)
num\_tokens = 0
for message in messages:
num\_tokens += tokens\_per\_message
for key, value in message.items():
num\_tokens += len(encoding.encode(value))
if key == "name":
num\_tokens += tokens\_per\_name
num\_tokens += 3 # every reply is primed with \<|start|\>assistant\<|message|\>
return num\_tokens`
```
```
`# let's verify the function above matches the OpenAI API response
from openai import OpenAI
import os
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))
example\_messages = [
{
"role": "system",
"content": "You are a helpful, pattern-following assistant that translates corporate jargon into plain English.",
},
{
"role": "system",
"name": "example\_user",
"content": "New synergies will help drive top-line growth.",
},
{
"role": "system",
"name": "example\_assistant",
"content": "Things working well together will increase revenue.",
},
{
"role": "system",
"name": "example\_user",
"content": "Let's circle back when we have more bandwidth to touch base on opportunities for increased leverage.",
},
{
"role": "system",
"name": "example\_assistant",
"content": "Let's talk later when we're less busy about how to do better.",
},
{
"role": "user",
"content": "This late pivot means we don't have time to boil the ocean for the client deliverable.",
},
]
for model in [
"gpt-3.5-turbo",
"gpt-4-0613",
"gpt-4",
"gpt-4o",
"gpt-4o-mini"
]:
print(model)
# example token count from the function defined above
print(f"{num\_tokens\_from\_messages(example\_messages, model)} prompt tokens counted by num\_tokens\_from\_messages().")
# example token count from the OpenAI API
response = client.chat.completions.create(model=model,
messages=example\_messages,
temperature=0,
max\_tokens=1)
print(f'{response.usage.prompt\_tokens} prompt tokens counted by the OpenAI API.')
print()`
```
```
`gpt-3.5-turbo
Warning: gpt-3.5-turbo may update over time. Returning num tokens assuming gpt-3.5-turbo-0125.
129 prompt tokens counted by num\_tokens\_from\_messages().
129 prompt tokens counted by the OpenAI API.
gpt-4-0613
129 prompt tokens counted by num\_tokens\_from\_messages().
129 prompt tokens counted by the OpenAI API.
gpt-4
Warning: gpt-4 may update over time. Returning num tokens assuming gpt-4-0613.
129 prompt tokens counted by num\_tokens\_from\_messages().
129 prompt tokens counted by the OpenAI API.
gpt-4o
Warning: gpt-4o and gpt-4o-mini may update over time. Returning num tokens assuming gpt-4o-2024-08-06.
124 prompt tokens counted by num\_tokens\_from\_messages().
124 prompt tokens counted by the OpenAI API.
gpt-4o-mini
Warning: gpt-4o-mini may update over time. Returning num tokens assuming gpt-4o-mini-2024-07-18.
124 prompt tokens counted by num\_tokens\_from\_messages().
124 prompt tokens counted by the OpenAI API.`
```
## 7. Counting tokens for chat completions with tool calls
Next, we will look into how to apply this calculations to messages that may contain function calls. This is not immediately trivial, due to the formatting of the tools themselves.
Below is an example function for counting tokens for messages that contain tools, passed to `gpt-3.5-turbo`, `gpt-4`, `gpt-4o` and `gpt-4o-mini`.
```
`def num\_tokens\_for\_tools(functions, messages, model):
# Initialize function settings to 0
func\_init = 0
prop\_init = 0
prop\_key = 0
enum\_init = 0
enum\_item = 0
func\_end = 0
if model in [
"gpt-4o",
"gpt-4o-mini"
]:
# Set function settings for the above models
func\_init = 7
prop\_init = 3
prop\_key = 3
enum\_init = -3
enum\_item = 3
func\_end = 12
elif model in [
"gpt-3.5-turbo",
"gpt-4"
]:
# Set function settings for the above models
func\_init = 10
prop\_init = 3
prop\_key = 3
enum\_init = -3
enum\_item = 3
func\_end = 12
else:
raise NotImplementedError(
f"""num\_tokens\_for\_tools() is not implemented for model {model}."""
)
try:
encoding = tiktoken.encoding\_for\_model(model)
except KeyError:
print("Warning: model not found. Using o200k\_base encoding.")
encoding = tiktoken.get\_encoding("o200k\_base")
func\_token\_count = 0
if len(functions) \> 0:
for f in functions:
func\_token\_count += func\_init # Add tokens for start of each function
function = f["function"]
f\_name = function["name"]
f\_desc = function["description"]
if f\_desc.endswith("."):
f\_desc = f\_desc[:-1]
line = f\_name + ":" + f\_desc
func\_token\_count += len(encoding.encode(line)) # Add tokens for set name and description
if len(function["parameters"]["properties"]) \> 0:
func\_token\_count += prop\_init # Add tokens for start of each property
for key in list(function["parameters"]["properties"].keys()):
func\_token\_count += prop\_key # Add tokens for each set property
p\_name = key
p\_type = function["parameters"]["properties"][key]["type"]
p\_desc = function["parameters"]["properties"][key]["description"]
if "enum" in function["parameters"]["properties"][key].keys():
func\_token\_count += enum\_init # Add tokens if property has enum list
for item in function["parameters"]["properties"][key]["enum"]:
func\_token\_count += enum\_item
func\_token\_count += len(encoding.encode(item))
if p\_desc.endswith("."):
p\_desc = p\_desc[:-1]
line = f"{p\_name}:{p\_type}:{p\_desc}"
func\_token\_count += len(encoding.encode(line))
func\_token\_count += func\_end
messages\_token\_count = num\_tokens\_from\_messages(messages, model)
total\_tokens = messages\_token\_count + func\_token\_count
return total\_tokens`
```
```
`tools = [
{
"type": "function",
"function": {
"name": "get\_current\_weather",
"description": "Get the current weather in a given location",
"parameters": {
"type": "object",
"properties": {
"location": {
"type": "string",
"description": "The city and state, e.g. San Francisco, CA",
},
"unit": {"type": "string",
"description": "The unit of temperature to return",
"enum": ["celsius", "fahrenheit"]},
},
"required": ["location"],
},
}
}
]
example\_messages = [
{
"role": "system",
"content": "You are a helpful assistant that can answer to questions about the weather.",
},
{
"role": "user",
"content": "What's the weather like in San Francisco?",
},
]
for model in [
"gpt-3.5-turbo",
"gpt-4",
"gpt-4o",
"gpt-4o-mini"
]:
print(model)
# example token count from the function defined above
print(f"{num\_tokens\_for\_tools(tools, example\_messages, model)} prompt tokens counted by num\_tokens\_for\_tools().")
# example token count from the OpenAI API
response = client.chat.completions.create(model=model,
messages=example\_messages,
tools=tools,
temperature=0)
print(f'{response.usage.prompt\_tokens} prompt tokens counted by the OpenAI API.')
print()`
```
```
`gpt-3.5-turbo
Warning: gpt-3.5-turbo may update over time. Returning num tokens assuming gpt-3.5-turbo-0125.
105 prompt tokens counted by num\_tokens\_for\_tools().
105 prompt tokens counted by the OpenAI API.
gpt-4
Warning: gpt-4 may update over time. Returning num tokens assuming gpt-4-0613.
105 prompt tokens counted by num\_tokens\_for\_tools().
105 prompt tokens counted by the OpenAI API.
gpt-4o
Warning: gpt-4o and gpt-4o-mini may update over time. Returning num tokens assuming gpt-4o-2024-08-06.
101 prompt tokens counted by num\_tokens\_for\_tools().
101 prompt tokens counted by the OpenAI API.
gpt-4o-mini
Warning: gpt-4o-mini may update over time. Returning num tokens assuming gpt-4o-mini-2024-07-18.
101 prompt tokens counted by num\_tokens\_for\_tools().
101 prompt tokens counted by the OpenAI API.`
```