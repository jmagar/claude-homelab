How to format inputs to ChatGPT models
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
Mar 1, 2023
# How to format inputs to ChatGPT models
This recipe is archived and may reference outdated models or APIs.
[ TS ](https://github.com/ted-at-openai)
[ Ted Sanders
(OpenAI)
](https://github.com/ted-at-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/How_to_format_inputs_to_ChatGPT_models.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/How_to_format_inputs_to_ChatGPT_models.ipynb)
ChatGPT is powered by `gpt-3.5-turbo` and `gpt-4`, OpenAI’s most advanced models.
You can build your own applications with `gpt-3.5-turbo` or `gpt-4` using the OpenAI API.
Chat models take a series of messages as input, and return an AI-written message as output.
This guide illustrates the chat format with a few example API calls.
## 1. Import the openai library
```
`# if needed, install and/or upgrade to the latest version of the OpenAI Python library
%pip install --upgrade openai`
```
```
`# import the OpenAI Python library for calling the OpenAI API
from openai import OpenAI
import os
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))`
```
## 2. An example chat completion API call
A chat completion API call parameters,
**Required**
* `model`: the name of the model you want to use (e.g., `gpt-3.5-turbo`, `gpt-4`, `gpt-3.5-turbo-16k-1106`)
* `messages`: a list of message objects, where each object has two required fields:
* `role`: the role of the messenger (either `system`, `user`, `assistant` or `tool`)
* `content`: the content of the message (e.g., `Write me a beautiful poem`)
Messages can also contain an optional `name` field, which give the messenger a name. E.g., `example-user`, `Alice`, `BlackbeardBot`. Names may not contain spaces.
**Optional**
* `frequency\_penalty`: Penalizes tokens based on their frequency, reducing repetition.
* `logit\_bias`: Modifies likelihood of specified tokens with bias values.
* `logprobs`: Returns log probabilities of output tokens if true.
* `top\_logprobs`: Specifies the number of most likely tokens to return at each position.
* `max\_tokens`: Sets the maximum number of generated tokens in chat completion.
* `n`: Generates a specified number of chat completion choices for each input.
* `presence\_penalty`: Penalizes new tokens based on their presence in the text.
* `response\_format`: Specifies the output format, e.g., JSON mode.
* `seed`: Ensures deterministic sampling with a specified seed.
* `stop`: Specifies up to 4 sequences where the API should stop generating tokens.
* `stream`: Sends partial message deltas as tokens become available.
* `temperature`: Sets the sampling temperature between 0 and 2.
* `top\_p`: Uses nucleus sampling; considers tokens with top\_p probability mass.
* `tools`: Lists functions the model may call.
* `tool\_choice`: Controls the model’s function calls (none/auto/function).
* `user`: Unique identifier for end-user monitoring and abuse detection.
As of January 2024, you can also optionally submit a list of `functions` that tell GPT whether it can generate JSON to feed into a function. For details, see the [documentation](https://platform.openai.com/docs/guides/function-calling), [API reference](https://platform.openai.com/docs/api-reference/chat), or the Cookbook guide [How to call functions with chat models](How_to_call_functions_with_chat_models.ipynb).
Typically, a conversation will start with a system message that tells the assistant how to behave, followed by alternating user and assistant messages, but you are not required to follow this format.
Let’s look at an example chat API calls to see how the chat format works in practice.
```
`# Example OpenAI Python library request
MODEL = "gpt-3.5-turbo"
response = client.chat.completions.create(
model=MODEL,
messages=[
{"role": "system", "content": "You are a helpful assistant."},
{"role": "user", "content": "Knock knock."},
{"role": "assistant", "content": "Who's there?"},
{"role": "user", "content": "Orange."},
],
temperature=0,
)`
```
```
`print(json.dumps(json.loads(response.model\_dump\_json()), indent=4))`
```
```
`{
"id": "chatcmpl-8dee9DuEFcg2QILtT2a6EBXZnpirM",
"choices": [
{
"finish\_reason": "stop",
"index": 0,
"logprobs": null,
"message": {
"content": "Orange who?",
"role": "assistant",
"function\_call": null,
"tool\_calls": null
}
}
],
"created": 1704461729,
"model": "gpt-3.5-turbo-0613",
"object": "chat.completion",
"system\_fingerprint": null,
"usage": {
"completion\_tokens": 3,
"prompt\_tokens": 35,
"total\_tokens": 38
}
}`
```
As you can see, the response object has a few fields:
* `id`: the ID of the request
* `choices`: a list of completion objects (only one, unless you set `n` greater than 1)
* `finish\_reason`: the reason the model stopped generating text (either `stop`, or `length` if `max\_tokens` limit was reached)
* `index`: The index of the choice in the list of choices.
* `logprobs`: Log probability information for the choice.
* `message`: the message object generated by the model
* `content`: content of message
* `role`: The role of the author of this message.
* `tool\_calls`: The tool calls generated by the model, such as function calls. if the tools is given
* `created`: the timestamp of the request
* `model`: the full name of the model used to generate the response
* `object`: the type of object returned (e.g., `chat.completion`)
* `system\_fingerprint`: This fingerprint represents the backend configuration that the model runs with.
* `usage`: the number of tokens used to generate the replies, counting prompt, completion, and total
Extract just the reply with:
```
`response.choices[0].message.content`
```
```
`'Orange who?'`
```
Even non-conversation-based tasks can fit into the chat format, by placing the instruction in the first user message.
For example, to ask the model to explain asynchronous programming in the style of the pirate Blackbeard, we can structure conversation as follows:
```
`# example with a system message
response = client.chat.completions.create(
model=MODEL,
messages=[
{"role": "system", "content": "You are a helpful assistant."},
{"role": "user", "content": "Explain asynchronous programming in the style of the pirate Blackbeard."},
],
temperature=0,
)
print(response.choices[0].message.content)`
```
```
`Arr, me matey! Let me tell ye a tale of asynchronous programming, in the style of the fearsome pirate Blackbeard!
Picture this, me hearties. In the vast ocean of programming, there be times when ye need to perform multiple tasks at once. But fear not, for asynchronous programming be here to save the day!
Ye see, in traditional programming, ye be waitin' for one task to be done before movin' on to the next. But with asynchronous programming, ye can be takin' care of multiple tasks at the same time, just like a pirate multitaskin' on the high seas!
Instead of waitin' for a task to be completed, ye can be sendin' it off on its own journey, while ye move on to the next task. It be like havin' a crew of trusty sailors, each takin' care of their own duties, without waitin' for the others.
Now, ye may be wonderin', how does this sorcery work? Well, me matey, it be all about callbacks and promises. When ye be sendin' off a task, ye be attachin' a callback function to it. This be like leavin' a message in a bottle, tellin' the task what to do when it be finished.
While the task be sailin' on its own, ye can be movin' on to the next task, without wastin' any precious time. And when the first task be done, it be sendin' a signal back to ye, lettin' ye know it be finished. Then ye can be takin' care of the callback function, like openin' the bottle and readin' the message inside.
But wait, there be more! With promises, ye can be makin' even fancier arrangements. Instead of callbacks, ye be makin' a promise that the task will be completed. It be like a contract between ye and the task, swearin' that it will be done.
Ye can be attachin' multiple promises to a task, promisin' different outcomes. And when the task be finished, it be fulfillin' the promises, lettin' ye know it be done. Then ye can be handlin' the fulfillments, like collectin' the rewards of yer pirate adventures!
So, me hearties, that be the tale of asynchronous programming, told in the style of the fearsome pirate Blackbeard! With callbacks and promises, ye can be takin' care of multiple tasks at once, just like a pirate conquerin' the seven seas!`
```
```
`# example without a system message
response = client.chat.completions.create(
model=MODEL,
messages=[
{"role": "user", "content": "Explain asynchronous programming in the style of the pirate Blackbeard."},
],
temperature=0,
)
print(response.choices[0].message.content)`
```
```
`Arr, me hearties! Gather 'round and listen up, for I be tellin' ye about the mysterious art of asynchronous programming, in the style of the fearsome pirate Blackbeard!
Now, ye see, in the world of programming, there be times when we need to perform tasks that take a mighty long time to complete. These tasks might involve fetchin' data from the depths of the internet, or performin' complex calculations that would make even Davy Jones scratch his head.
In the olden days, we pirates used to wait patiently for each task to finish afore movin' on to the next one. But that be a waste of precious time, me hearties! We be pirates, always lookin' for ways to be more efficient and plunder more booty!
That be where asynchronous programming comes in, me mateys. It be a way to tackle multiple tasks at once, without waitin' for each one to finish afore movin' on. It be like havin' a crew of scallywags workin' on different tasks simultaneously, while ye be overseein' the whole operation.
Ye see, in asynchronous programming, we be breakin' down our tasks into smaller chunks called "coroutines." Each coroutine be like a separate pirate, workin' on its own task. When a coroutine be startin' its work, it don't wait for the task to finish afore movin' on to the next one. Instead, it be movin' on to the next task, lettin' the first one continue in the background.
Now, ye might be wonderin', "But Blackbeard, how be we know when a task be finished if we don't wait for it?" Ah, me hearties, that be where the magic of callbacks and promises come in!
When a coroutine be startin' its work, it be attachin' a callback or a promise to it. This be like leavin' a message in a bottle, tellin' the coroutine what to do when it be finished. So, while the coroutine be workin' away, the rest of the crew be movin' on to other tasks, plunderin' more booty along the way.
When a coroutine be finished with its task, it be sendin' a signal to the callback or fulfillin' the promise, lettin' the rest of the crew know that it be done. Then, the crew can gather 'round and handle the results of the completed task, celebratin' their victory and countin' their plunder.
So, me hearties, asynchronous programming be like havin' a crew of pirates workin' on different tasks at once, without waitin' for each one to finish afore movin' on. It be a way to be more efficient, plunder more booty, and conquer the vast seas of programming!
Now, set sail, me mateys, and embrace the power of asynchronous programming like true pirates of the digital realm! Arr!`
```
## 3. Tips for instructing gpt-3.5-turbo-0301
Best practices for instructing models may change from model version to model version. The advice that follows applies to `gpt-3.5-turbo-0301` and may not apply to future models.
### System messages
The system message can be used to prime the assistant with different personalities or behaviors.
Be aware that `gpt-3.5-turbo-0301` does not generally pay as much attention to the system message as `gpt-4-0314` or `gpt-3.5-turbo-0613`. Therefore, for `gpt-3.5-turbo-0301`, we recommend placing important instructions in the user message instead. Some developers have found success in continually moving the system message near the end of the conversation to keep the model’s attention from drifting away as conversations get longer.
```
`# An example of a system message that primes the assistant to explain concepts in great depth
response = client.chat.completions.create(
model=MODEL,
messages=[
{"role": "system", "content": "You are a friendly and helpful teaching assistant. You explain concepts in great depth using simple terms, and you give examples to help people learn. At the end of each explanation, you ask a question to check for understanding"},
{"role": "user", "content": "Can you explain how fractions work?"},
],
temperature=0,
)
print(response.choices[0].message.content)`
```
```
`Of course! Fractions are a way to represent parts of a whole. They are made up of two numbers: a numerator and a denominator. The numerator tells you how many parts you have, and the denominator tells you how many equal parts make up the whole.
Let's take an example to understand this better. Imagine you have a pizza that is divided into 8 equal slices. If you eat 3 slices, you can represent that as the fraction 3/8. Here, the numerator is 3 because you ate 3 slices, and the denominator is 8 because the whole pizza is divided into 8 slices.
Fractions can also be used to represent numbers less than 1. For example, if you eat half of a pizza, you can write it as 1/2. Here, the numerator is 1 because you ate one slice, and the denominator is 2 because the whole pizza is divided into 2 equal parts.
Now, let's talk about equivalent fractions. Equivalent fractions are different fractions that represent the same amount. For example, 1/2 and 2/4 are equivalent fractions because they both represent half of something. To find equivalent fractions, you can multiply or divide both the numerator and denominator by the same number.
Here's a question to check your understanding: If you have a cake divided into 12 equal slices and you eat 4 slices, what fraction of the cake did you eat?`
```
```
`# An example of a system message that primes the assistant to give brief, to-the-point answers
response = client.chat.completions.create(
model=MODEL,
messages=[
{"role": "system", "content": "You are a laconic assistant. You reply with brief, to-the-point answers with no elaboration."},
{"role": "user", "content": "Can you explain how fractions work?"},
],
temperature=0,
)
print(response.choices[0].message.content)`
```
```
`Fractions represent parts of a whole. They have a numerator (top number) and a denominator (bottom number).`
```
### Few-shot prompting
In some cases, it’s easier to show the model what you want rather than tell the model what you want.
One way to show the model what you want is with faked example messages.
For example:
```
`# An example of a faked few-shot conversation to prime the model into translating business jargon to simpler speech
response = client.chat.completions.create(
model=MODEL,
messages=[
{"role": "system", "content": "You are a helpful, pattern-following assistant."},
{"role": "user", "content": "Help me translate the following corporate jargon into plain English."},
{"role": "assistant", "content": "Sure, I'd be happy to!"},
{"role": "user", "content": "New synergies will help drive top-line growth."},
{"role": "assistant", "content": "Things working well together will increase revenue."},
{"role": "user", "content": "Let's circle back when we have more bandwidth to touch base on opportunities for increased leverage."},
{"role": "assistant", "content": "Let's talk later when we're less busy about how to do better."},
{"role": "user", "content": "This late pivot means we don't have time to boil the ocean for the client deliverable."},
],
temperature=0,
)
print(response.choices[0].message.content)`
```
```
`This sudden change in direction means we don't have enough time to complete the entire project for the client.`
```
To help clarify that the example messages are not part of a real conversation, and shouldn’t be referred back to by the model, you can try setting the `name` field of `system` messages to `example\_user` and `example\_assistant`.
Transforming the few-shot example above, we could write:
```
`# The business jargon translation example, but with example names for the example messages
response = client.chat.completions.create(
model=MODEL,
messages=[
{"role": "system", "content": "You are a helpful, pattern-following assistant that translates corporate jargon into plain English."},
{"role": "system", "name":"example\_user", "content": "New synergies will help drive top-line growth."},
{"role": "system", "name": "example\_assistant", "content": "Things working well together will increase revenue."},
{"role": "system", "name":"example\_user", "content": "Let's circle back when we have more bandwidth to touch base on opportunities for increased leverage."},
{"role": "system", "name": "example\_assistant", "content": "Let's talk later when we're less busy about how to do better."},
{"role": "user", "content": "This late pivot means we don't have time to boil the ocean for the client deliverable."},
],
temperature=0,
)
print(response.choices[0].message.content)`
```
```
`This sudden change in direction means we don't have enough time to complete the entire project for the client.`
```
Not every attempt at engineering conversations will succeed at first.
If your first attempts fail, don’t be afraid to experiment with different ways of priming or conditioning the model.
As an example, one developer discovered an increase in accuracy when they inserted a user message that said “Great job so far, these have been perfect” to help condition the model into providing higher quality responses.
For more ideas on how to lift the reliability of the models, consider reading our guide on [techniques to increase reliability](../techniques_to_improve_reliability). It was written for non-chat models, but many of its principles still apply.
## 4. Counting tokens
When you submit your request, the API transforms the messages into a sequence of tokens.
The number of tokens used affects:
* the cost of the request
* the time it takes to generate the response
* when the reply gets cut off from hitting the maximum token limit (4,096 for `gpt-3.5-turbo` or 8,192 for `gpt-4`)
You can use the following function to count the number of tokens that a list of messages will use.
Note that the exact way that tokens are counted from messages may change from model to model. Consider the counts from the function below an estimate, not a timeless guarantee.
In particular, requests that use the optional functions input will consume extra tokens on top of the estimates calculated below.
Read more about counting tokens in [How to count tokens with tiktoken](How_to_count_tokens_with_tiktoken.ipynb).
```
`import tiktoken
def num\_tokens\_from\_messages(messages, model="gpt-3.5-turbo-0613"):
"""Return the number of tokens used by a list of messages."""
try:
encoding = tiktoken.encoding\_for\_model(model)
except KeyError:
print("Warning: model not found. Using cl100k\_base encoding.")
encoding = tiktoken.get\_encoding("cl100k\_base")
if model in {
"gpt-3.5-turbo-0613",
"gpt-3.5-turbo-16k-0613",
"gpt-4-0314",
"gpt-4-32k-0314",
"gpt-4-0613",
"gpt-4-32k-0613",
}:
tokens\_per\_message = 3
tokens\_per\_name = 1
elif model == "gpt-3.5-turbo-0301":
tokens\_per\_message = 4 # every message follows \<|start|\>{role/name}\\n{content}\<|end|\>\\n
tokens\_per\_name = -1 # if there's a name, the role is omitted
elif "gpt-3.5-turbo" in model:
print("Warning: gpt-3.5-turbo may update over time. Returning num tokens assuming gpt-3.5-turbo-0613.")
return num\_tokens\_from\_messages(messages, model="gpt-3.5-turbo-0613")
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
# "gpt-3.5-turbo-0301",
# "gpt-4-0314",
# "gpt-4-0613",
"gpt-3.5-turbo-1106",
"gpt-3.5-turbo",
"gpt-4",
"gpt-4-1106-preview",
]:
print(model)
# example token count from the function defined above
print(f"{num\_tokens\_from\_messages(example\_messages, model)} prompt tokens counted by num\_tokens\_from\_messages().")
# example token count from the OpenAI API
response = client.chat.completions.create(model=model,
messages=example\_messages,
temperature=0,
max\_tokens=1)
token = response.usage.prompt\_tokens
print(f'{token} prompt tokens counted by the OpenAI API.')
print()`
```
```
`gpt-3.5-turbo-1106
Warning: gpt-3.5-turbo may update over time. Returning num tokens assuming gpt-3.5-turbo-0613.
129 prompt tokens counted by num\_tokens\_from\_messages().
129 prompt tokens counted by the OpenAI API.
gpt-3.5-turbo
Warning: gpt-3.5-turbo may update over time. Returning num tokens assuming gpt-3.5-turbo-0613.
129 prompt tokens counted by num\_tokens\_from\_messages().
129 prompt tokens counted by the OpenAI API.
gpt-4
Warning: gpt-4 may update over time. Returning num tokens assuming gpt-4-0613.
129 prompt tokens counted by num\_tokens\_from\_messages().
129 prompt tokens counted by the OpenAI API.
gpt-4-1106-preview
Warning: gpt-4 may update over time. Returning num tokens assuming gpt-4-0613.
129 prompt tokens counted by num\_tokens\_from\_messages().
129 prompt tokens counted by the OpenAI API.`
```