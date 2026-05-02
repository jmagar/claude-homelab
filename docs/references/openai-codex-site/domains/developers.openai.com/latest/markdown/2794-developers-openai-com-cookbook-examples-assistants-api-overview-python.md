Assistants API Overview (Python SDK)
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
Nov 10, 2023
# Assistants API Overview (Python SDK)
[ IB ](https://twitter.com/ilanbigio)
[ Ilan Bigio
(OpenAI)
](https://twitter.com/ilanbigio)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Assistants_API_overview_python.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Assistants_API_overview_python.ipynb)
The new [Assistants API](https://platform.openai.com/docs/assistants/overview) is a stateful evolution of our [Chat Completions API](https://platform.openai.com/docs/guides/text-generation/chat-completions-api) meant to simplify the creation of assistant-like experiences, and enable developer access to powerful tools like Code Interpreter and File Search.
## Chat Completions API vs Assistants API
The primitives of the **Chat Completions API** are `Messages`, on which you perform a `Completion` with a `Model` (`gpt-4o`, `gpt-4o-mini`, etc). It is lightweight and powerful, but inherently stateless, which means you have to manage conversation state, tool definitions, retrieval documents, and code execution manually.
The primitives of the **Assistants API** are
* `Assistants`, which encapsulate a base model, instructions, tools, and (context) documents,
* `Threads`, which represent the state of a conversation, and
* `Runs`, which power the execution of an `Assistant` on a `Thread`, including textual responses and multi-step tool use.
We’ll take a look at how these can be used to create powerful, stateful experiences.
## Setup
### Python SDK
>
**> Note
**> We’ve updated our
[> Python SDK
](https://github.com/openai/openai-python)> to add support for the Assistants API, so you’ll need to update it to the latest version (
`> 1.59.4
`> at time of writing).
>
```
`!pip install --upgrade openai`
```
```
`Requirement already satisfied: openai in /Users/lee.spacagna/myenv/lib/python3.12/site-packages (1.59.4)
Requirement already satisfied: anyio\<5,\>=3.5.0 in /Users/lee.spacagna/myenv/lib/python3.12/site-packages (from openai) (3.7.1)
Requirement already satisfied: distro\<2,\>=1.7.0 in /Users/lee.spacagna/myenv/lib/python3.12/site-packages (from openai) (1.9.0)
Requirement already satisfied: httpx\<1,\>=0.23.0 in /Users/lee.spacagna/myenv/lib/python3.12/site-packages (from openai) (0.27.0)
Requirement already satisfied: jiter\<1,\>=0.4.0 in /Users/lee.spacagna/myenv/lib/python3.12/site-packages (from openai) (0.7.0)
Requirement already satisfied: pydantic\<3,\>=1.9.0 in /Users/lee.spacagna/myenv/lib/python3.12/site-packages (from openai) (2.8.2)
Requirement already satisfied: sniffio in /Users/lee.spacagna/myenv/lib/python3.12/site-packages (from openai) (1.3.1)
Requirement already satisfied: tqdm\>4 in /Users/lee.spacagna/myenv/lib/python3.12/site-packages (from openai) (4.66.4)
Requirement already satisfied: typing-extensions\<5,\>=4.11 in /Users/lee.spacagna/myenv/lib/python3.12/site-packages (from openai) (4.12.2)
Requirement already satisfied: idna\>=2.8 in /Users/lee.spacagna/myenv/lib/python3.12/site-packages (from anyio\<5,\>=3.5.0-\>openai) (3.7)
Requirement already satisfied: certifi in /Users/lee.spacagna/myenv/lib/python3.12/site-packages (from httpx\<1,\>=0.23.0-\>openai) (2024.7.4)
Requirement already satisfied: httpcore==1.\* in /Users/lee.spacagna/myenv/lib/python3.12/site-packages (from httpx\<1,\>=0.23.0-\>openai) (1.0.5)
Requirement already satisfied: h11\<0.15,\>=0.13 in /Users/lee.spacagna/myenv/lib/python3.12/site-packages (from httpcore==1.\*-\>httpx\<1,\>=0.23.0-\>openai) (0.14.0)
Requirement already satisfied: annotated-types\>=0.4.0 in /Users/lee.spacagna/myenv/lib/python3.12/site-packages (from pydantic\<3,\>=1.9.0-\>openai) (0.7.0)
Requirement already satisfied: pydantic-core==2.20.1 in /Users/lee.spacagna/myenv/lib/python3.12/site-packages (from pydantic\<3,\>=1.9.0-\>openai) (2.20.1)`
```
And make sure it’s up to date by running:
```
`!pip show openai | grep Version`
```
```
`Version: 1.59.4`
```
### Pretty Printing Helper
```
`import json
def show\_json(obj):
display(json.loads(obj.model\_dump\_json()))`
```
## Complete Example with Assistants API
### Assistants
The easiest way to get started with the Assistants API is through the [Assistants Playground](https://platform.openai.com/playground).
Let’s begin by creating an assistant! We’ll create a Math Tutor just like in our [docs](https://platform.openai.com/docs/assistants/overview).
You can also create Assistants directly through the Assistants API, like so:
```
`from openai import OpenAI
import os
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))
assistant = client.beta.assistants.create(
name="Math Tutor",
instructions="You are a personal math tutor. Answer questions briefly, in a sentence or less.",
model="gpt-4o",
)
show\_json(assistant)`
```
```
`{'id': 'asst\_qvXmYlZV8zhABI2RtPzDfV6z',
'created\_at': 1736340398,
'description': None,
'instructions': 'You are a personal math tutor. Answer questions briefly, in a sentence or less.',
'metadata': {},
'model': 'gpt-4o',
'name': 'Math Tutor',
'object': 'assistant',
'tools': [],
'response\_format': 'auto',
'temperature': 1.0,
'tool\_resources': {'code\_interpreter': None, 'file\_search': None},
'top\_p': 1.0} 'tools': [],
'response\_format': 'auto',
'temperature': 1.0,
'tool\_resources': {'code\_interpreter': None, 'file\_search': None},
'top\_p': 1.0}`
```
Regardless of whether you create your Assistant through the Dashboard or with the API, you’ll want to keep track of the Assistant ID. This is how you’ll refer to your Assistant throughout Threads and Runs.
Next, we’ll create a new Thread and add a Message to it. This will hold the state of our conversation, so we don’t have re-send the entire message history each time.
### Threads
Create a new thread:
```
`thread = client.beta.threads.create()
show\_json(thread)`
```
```
`{'id': 'thread\_j4dc1TiHPfkviKUHNi4aAsA6',
'created\_at': 1736340398,
'metadata': {},
'object': 'thread',
'tool\_resources': {'code\_interpreter': None, 'file\_search': None}} 'object': 'thread',
'tool\_resources': {'code\_interpreter': None, 'file\_search': None}}`
```
Then add the Message to the thread:
```
`message = client.beta.threads.messages.create(
thread\_id=thread.id,
role="user",
content="I need to solve the equation `3x + 11 = 14`. Can you help me?",
)
show\_json(message)`
```
```
`{'id': 'msg\_1q4Y7ZZ9gIcPoAKSx9UtrrKJ',
'assistant\_id': None,
'attachments': [],
'completed\_at': None,
'attachments': [],
'completed\_at': None,
'content': [{'text': {'annotations': [],
'value': 'I need to solve the equation `3x + 11 = 14`. Can you help me?'},
'type': 'text'}],
'created\_at': 1736340400,
'incomplete\_at': None,
'incomplete\_details': None,
'metadata': {},
'object': 'thread.message',
'role': 'user',
'run\_id': None,
'status': None,
'thread\_id': 'thread\_j4dc1TiHPfkviKUHNi4aAsA6'}`
```
>
**> Note
**> Even though you’re no longer sending the entire history each time, you will still be charged for the tokens of the entire conversation history with each Run.
>
### Runs
Notice how the Thread we created is **not** associated with the Assistant we created earlier! Threads exist independently from Assistants, which may be different from what you’d expect if you’ve used ChatGPT (where a thread is tied to a model/GPT).
To get a completion from an Assistant for a given Thread, we must create a Run. Creating a Run will indicate to an Assistant it should look at the messages in the Thread and take action: either by adding a single response, or using tools.
>
**> Note
**> Runs are a key difference between the Assistants API and Chat Completions API. While in Chat Completions the model will only ever respond with a single message, in the Assistants API a Run may result in an Assistant using one or multiple tools, and potentially adding multiple messages to the Thread.
>
To get our Assistant to respond to the user, let’s create the Run. As mentioned earlier, you must specify *both* the Assistant and the Thread.
```
`run = client.beta.threads.runs.create(
thread\_id=thread.id,
assistant\_id=assistant.id,
)
show\_json(run)`
```
```
`{'id': 'run\_qVYsWok6OCjHxkajpIrdHuVP',
'assistant\_id': 'asst\_qvXmYlZV8zhABI2RtPzDfV6z',
'cancelled\_at': None,
'completed\_at': None,
'created\_at': 1736340403,
'expires\_at': 1736341003,
'failed\_at': None,
'incomplete\_details': None,
'incomplete\_details': None,
'instructions': 'You are a personal math tutor. Answer questions briefly, in a sentence or less.',
'last\_error': None,
'max\_completion\_tokens': None,
'max\_prompt\_tokens': None,
'max\_completion\_tokens': None,
'max\_prompt\_tokens': None,
'metadata': {},
'model': 'gpt-4o',
'object': 'thread.run',
'parallel\_tool\_calls': True,
'parallel\_tool\_calls': True,
'required\_action': None,
'response\_format': 'auto',
'response\_format': 'auto',
'started\_at': None,
'status': 'queued',
'thread\_id': 'thread\_j4dc1TiHPfkviKUHNi4aAsA6',
'tool\_choice': 'auto',
'tools': [],
'truncation\_strategy': {'type': 'auto', 'last\_messages': None},
'usage': None,
'temperature': 1.0,
'top\_p': 1.0,
'tool\_resources': {}}`
```
Unlike creating a completion in the Chat Completions API, **creating a Run is an asynchronous operation**. It will return immediately with the Run’s metadata, which includes a `status` that will initially be set to `queued`. The `status` will be updated as the Assistant performs operations (like using tools and adding messages).
To know when the Assistant has completed processing, we can poll the Run in a loop. (Support for streaming is coming soon!) While here we are only checking for a `queued` or `in\_progress` status, in practice a Run may undergo a [variety of status changes](https://platform.openai.com/docs/api-reference/runs/object#runs/object-status) which you can choose to surface to the user. (These are called Steps, and will be covered later.)
```
`import time
def wait\_on\_run(run, thread):
while run.status == "queued" or run.status == "in\_progress":
run = client.beta.threads.runs.retrieve(
thread\_id=thread.id,
run\_id=run.id,
)
time.sleep(0.5)
return run`
```
```
`run = wait\_on\_run(run, thread)
show\_json(run)`
```
```
`{'id': 'run\_qVYsWok6OCjHxkajpIrdHuVP',
'assistant\_id': 'asst\_qvXmYlZV8zhABI2RtPzDfV6z',
'cancelled\_at': None,
'completed\_at': 1736340406,
'created\_at': 1736340403,
'expires\_at': None,
'failed\_at': None,
'incomplete\_details': None,
'incomplete\_details': None,
'instructions': 'You are a personal math tutor. Answer questions briefly, in a sentence or less.',
'last\_error': None,
'max\_completion\_tokens': None,
'max\_prompt\_tokens': None,
'max\_completion\_tokens': None,
'max\_prompt\_tokens': None,
'metadata': {},
'model': 'gpt-4o',
'object': 'thread.run',
'parallel\_tool\_calls': True,
'parallel\_tool\_calls': True,
'required\_action': None,
'response\_format': 'auto',
'started\_at': 1736340405,
'status': 'completed',
'thread\_id': 'thread\_j4dc1TiHPfkviKUHNi4aAsA6',
'tool\_choice': 'auto',
'tools': [],
'truncation\_strategy': {'type': 'auto', 'last\_messages': None},
'usage': {'completion\_tokens': 35,
'prompt\_tokens': 66,
'total\_tokens': 101,
'prompt\_token\_details': {'cached\_tokens': 0},
'completion\_tokens\_details': {'reasoning\_tokens': 0}},
'temperature': 1.0,
'top\_p': 1.0,
'tool\_resources': {}}`
```
### Messages
Now that the Run has completed, we can list the Messages in the Thread to see what got added by the Assistant.
```
`messages = client.beta.threads.messages.list(thread\_id=thread.id)
show\_json(messages)`
```
```
`{'data': [{'id': 'msg\_A5eAN6ZAJDmFBOYutEm5DFCy',
'assistant\_id': 'asst\_qvXmYlZV8zhABI2RtPzDfV6z',
'attachments': [],
'completed\_at': None,
'content': [{'text': {'annotations': [],
'value': 'Sure! Subtract 11 from both sides to get \\\\(3x = 3\\\\), then divide by 3 to find \\\\(x = 1\\\\).'},
'type': 'text'}],
'created\_at': 1736340405,
'incomplete\_at': None,
'incomplete\_details': None,
'metadata': {},
'object': 'thread.message',
'role': 'assistant',
'run\_id': 'run\_qVYsWok6OCjHxkajpIrdHuVP',
'status': None,
'thread\_id': 'thread\_j4dc1TiHPfkviKUHNi4aAsA6'},
{'id': 'msg\_1q4Y7ZZ9gIcPoAKSx9UtrrKJ',
'assistant\_id': None,
'attachments': [],
'completed\_at': None,
'attachments': [],
'completed\_at': None,
'content': [{'text': {'annotations': [],
'value': 'I need to solve the equation `3x + 11 = 14`. Can you help me?'},
'type': 'text'}],
'created\_at': 1736340400,
'incomplete\_at': None,
'incomplete\_details': None,
'metadata': {},
'object': 'thread.message',
'role': 'user',
'run\_id': None,
'status': None,
'thread\_id': 'thread\_j4dc1TiHPfkviKUHNi4aAsA6'}],
'object': 'list',
'first\_id': 'msg\_A5eAN6ZAJDmFBOYutEm5DFCy',
'last\_id': 'msg\_1q4Y7ZZ9gIcPoAKSx9UtrrKJ',
'has\_more': False}`
```
As you can see, Messages are ordered in reverse-chronological order – this was done so the most recent results are always on the first `page` (since results can be paginated). Do keep a look out for this, since this is the opposite order to messages in the Chat Completions API.
Let’s ask our Assistant to explain the result a bit further!
```
`# Create a message to append to our thread
message = client.beta.threads.messages.create(
thread\_id=thread.id, role="user", content="Could you explain this to me?"
)
# Execute our run
run = client.beta.threads.runs.create(
thread\_id=thread.id,
assistant\_id=assistant.id,
)
# Wait for completion
wait\_on\_run(run, thread)
# Retrieve all the messages added after our last user message
messages = client.beta.threads.messages.list(
thread\_id=thread.id, order="asc", after=message.id
)
show\_json(messages)`
```
```
`{'data': [{'id': 'msg\_wSHHvaMnaWktZWsKs6gyoPUB',
'assistant\_id': 'asst\_qvXmYlZV8zhABI2RtPzDfV6z',
'attachments': [],
'completed\_at': None,
'content': [{'text': {'annotations': [],
'value': 'Certainly! To isolate \\\\(x\\\\), first subtract 11 from both sides of the equation \\\\(3x + 11 = 14\\\\), resulting in \\\\(3x = 3\\\\). Then, divide both sides by 3 to solve for \\\\(x\\\\), giving you \\\\(x = 1\\\\).'},
'type': 'text'}],
'created\_at': 1736340414,
'incomplete\_at': None,
'incomplete\_details': None,
'metadata': {},
'object': 'thread.message',
'role': 'assistant',
'run\_id': 'run\_lJsumsDtPTmdG3Enx2CfYrrq',
'status': None,
'thread\_id': 'thread\_j4dc1TiHPfkviKUHNi4aAsA6'}],
'object': 'list',
'first\_id': 'msg\_wSHHvaMnaWktZWsKs6gyoPUB',
'last\_id': 'msg\_wSHHvaMnaWktZWsKs6gyoPUB',
'has\_more': False}`
```
This may feel like a lot of steps to get a response back, especially for this simple example. However, you’ll soon see how we can add very powerful functionality to our Assistant without changing much code at all!
### Example
Let’s take a look at how we could potentially put all of this together. Below is all the code you need to use an Assistant you’ve created.
Since we’ve already created our Math Assistant, I’ve saved its ID in `MATH\_ASSISTANT\_ID`. I then defined two functions:
* `submit\_message`: create a Message on a Thread, then start (and return) a new Run
* `get\_response`: returns the list of Messages in a Thread
```
`from openai import OpenAI
MATH\_ASSISTANT\_ID = assistant.id # or a hard-coded ID like "asst-..."
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))
def submit\_message(assistant\_id, thread, user\_message):
client.beta.threads.messages.create(
thread\_id=thread.id, role="user", content=user\_message
)
return client.beta.threads.runs.create(
thread\_id=thread.id,
assistant\_id=assistant\_id,
)
def get\_response(thread):
return client.beta.threads.messages.list(thread\_id=thread.id, order="asc")`
```
I’ve also defined a `create\_thread\_and\_run` function that I can re-use (which is actually almost identical to the [`client.beta.threads.create\_and\_run`](https://platform.openai.com/docs/api-reference/runs/createThreadAndRun) compound function in our API ;) ). Finally, we can submit our mock user requests each to a new Thread.
Notice how all of these API calls are asynchronous operations; this means we actually get async behavior in our code without the use of async libraries! (e.g. `asyncio`)
```
`def create\_thread\_and\_run(user\_input):
thread = client.beta.threads.create()
run = submit\_message(MATH\_ASSISTANT\_ID, thread, user\_input)
return thread, run
# Emulating concurrent user requests
thread1, run1 = create\_thread\_and\_run(
"I need to solve the equation `3x + 11 = 14`. Can you help me?"
)
thread2, run2 = create\_thread\_and\_run("Could you explain linear algebra to me?")
thread3, run3 = create\_thread\_and\_run("I don't like math. What can I do?")
# Now all Runs are executing...`
```
Once all Runs are going, we can wait on each and get the responses.
```
`import time
# Pretty printing helper
def pretty\_print(messages):
print("# Messages")
for m in messages:
print(f"{m.role}: {m.content[0].text.value}")
print()
# Waiting in a loop
def wait\_on\_run(run, thread):
while run.status == "queued" or run.status == "in\_progress":
run = client.beta.threads.runs.retrieve(
thread\_id=thread.id,
run\_id=run.id,
)
time.sleep(0.5)
return run
# Wait for Run 1
run1 = wait\_on\_run(run1, thread1)
pretty\_print(get\_response(thread1))
# Wait for Run 2
run2 = wait\_on\_run(run2, thread2)
pretty\_print(get\_response(thread2))
# Wait for Run 3
run3 = wait\_on\_run(run3, thread3)
pretty\_print(get\_response(thread3))
# Thank our assistant on Thread 3 :)
run4 = submit\_message(MATH\_ASSISTANT\_ID, thread3, "Thank you!")
run4 = wait\_on\_run(run4, thread3)
pretty\_print(get\_response(thread3))`
```
```
`# Messages
user: I need to solve the equation `3x + 11 = 14`. Can you help me?
assistant: Sure! Subtract 11 from both sides to get \\(3x = 3\\), then divide by 3 to find \\(x = 1\\).
# Messages
user: Could you explain linear algebra to me?
assistant: Linear algebra is the branch of mathematics concerning vector spaces, linear transformations, and systems of linear equations, often represented with matrices.
# Messages
user: I don't like math. What can I do?
assistant: Try relating math to real-life interests or hobbies, practice with fun games or apps, and gradually build confidence with easier problems.
# Messages
user: I don't like math. What can I do?
assistant: Try relating math to real-life interests or hobbies, practice with fun games or apps, and gradually build confidence with easier problems.
user: Thank you!
assistant: You're welcome! If you have any more questions, feel free to ask!`
```
Et voilà!
You may have noticed that this code is not actually specific to our math Assistant at all… this code will work for any new Assistant you create simply by changing the Assistant ID! That is the power of the Assistants API.
## Tools
A key feature of the Assistants API is the ability to equip our Assistants with Tools, like Code Interpreter, File Search, and custom Functions. Let’s take a look at each.
### Code Interpreter
Let’s equip our Math Tutor with the [Code Interpreter](https://platform.openai.com/docs/assistants/tools/code-interpreter) tool, which we can do from the Dashboard…
…or the API, using the Assistant ID.
```
`assistant = client.beta.assistants.update(
MATH\_ASSISTANT\_ID,
tools=[{"type": "code\_interpreter"}],
)
show\_json(assistant)`
```
```
`{'id': 'asst\_qvXmYlZV8zhABI2RtPzDfV6z',
'created\_at': 1736340398,
'description': None,
'instructions': 'You are a personal math tutor. Answer questions briefly, in a sentence or less.',
'metadata': {},
'model': 'gpt-4o',
'name': 'Math Tutor',
'object': 'assistant',
'tools': [{'type': 'code\_interpreter'}],
'response\_format': 'auto',
'temperature': 1.0,
'tool\_resources': {'code\_interpreter': {'file\_ids': []}, 'file\_search': None},
'top\_p': 1.0} 'tools': [{'type': 'code\_interpreter'}],
'response\_format': 'auto',
'temperature': 1.0,
'tool\_resources': {'code\_interpreter': {'file\_ids': []}, 'file\_search': None},
'top\_p': 1.0}`
```
Now, let’s ask the Assistant to use its new tool.
```
`thread, run = create\_thread\_and\_run(
"Generate the first 20 fibbonaci numbers with code."
)
run = wait\_on\_run(run, thread)
pretty\_print(get\_response(thread))`
```
```
`# Messages
user: Generate the first 20 fibbonaci numbers with code.
assistant: The first 20 Fibonacci numbers are: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181.`
```
And that’s it! The Assistant used Code Interpreter in the background, and gave us a final response.
For some use cases this may be enough – however, if we want more details on what precisely an Assistant is doing we can take a look at a Run’s Steps.
### Steps
A Run is composed of one or more Steps. Like a Run, each Step has a `status` that you can query. This is useful for surfacing the progress of a Step to a user (e.g. a spinner while the Assistant is writing code or performing retrieval).
```
`run\_steps = client.beta.threads.runs.steps.list(
thread\_id=thread.id, run\_id=run.id, order="asc"
)`
```
Let’s take a look at each Step’s `step\_details`.
```
`for step in run\_steps.data:
step\_details = step.step\_details
print(json.dumps(show\_json(step\_details), indent=4))`
```
```
`{'tool\_calls': [{'id': 'call\_E1EE1loDmcWoc7FpkOMKYj6n',
'code\_interpreter': {'input': 'def generate\_fibonacci(n):\\n fib\_sequence = [0, 1]\\n while len(fib\_sequence) \< n:\\n next\_value = fib\_sequence[-1] + fib\_sequence[-2]\\n fib\_sequence.append(next\_value)\\n return fib\_sequence\\n\\n# Generate the first 20 Fibonacci numbers\\nfirst\_20\_fibonacci = generate\_fibonacci(20)\\nfirst\_20\_fibonacci',
'outputs': []},
'type': 'code\_interpreter'}],
'type': 'tool\_calls'}`
```
```
`null`
```
```
`{'message\_creation': {'message\_id': 'msg\_RzTnbBMmzDYHk79a0x9qM5uU'},
'type': 'message\_creation'}`
```
```
`null`
```
We can see the `step\_details` for two Steps:
1. `tool\_calls` (plural, since it could be more than one in a single Step)
2. `message\_creation`
The first Step is a `tool\_calls`, specifically using the `code\_interpreter` which contains:
* `input`, which was the Python code generated before the tool was called, and
* `output`, which was the result of running the Code Interpreter.
The second Step is a `message\_creation`, which contains the `message` that was added to the Thread to communicate the results to the user.
### File search
Another powerful tool in the Assistants API is [File search](https://platform.openai.com/docs/assistants/tools/file-search). This allows the uploading of files to the Assistant to be used as a knowledge base when answering questions.
```
`# Upload the file
file = client.files.create(
file=open(
"data/language\_models\_are\_unsupervised\_multitask\_learners.pdf",
"rb",
),
purpose="assistants",
)
# Create a vector store
vector\_store = client.beta.vector\_stores.create(
name="language\_models\_are\_unsupervised\_multitask\_learners",
)
# Add the file to the vector store
vector\_store\_file = client.beta.vector\_stores.files.create\_and\_poll(
vector\_store\_id=vector\_store.id,
file\_id=file.id,
)
# Confirm the file was added
while vector\_store\_file.status == "in\_progress":
time.sleep(1)
if vector\_store\_file.status == "completed":
print("File added to vector store")
elif vector\_store\_file.status == "failed":
raise Exception("Failed to add file to vector store")
# Update Assistant
assistant = client.beta.assistants.update(
MATH\_ASSISTANT\_ID,
tools=[{"type": "code\_interpreter"}, {"type": "file\_search"}],
tool\_resources={
"file\_search":{
"vector\_store\_ids": [vector\_store.id]
},
"code\_interpreter": {
"file\_ids": [file.id]
}
},
)
show\_json(assistant)`
```
```
`File added to vector store`
```
```
`{'id': 'asst\_qvXmYlZV8zhABI2RtPzDfV6z',
'created\_at': 1736340398,
'description': None,
'instructions': 'You are a personal math tutor. Answer questions briefly, in a sentence or less.',
'metadata': {},
'model': 'gpt-4o',
'name': 'Math Tutor',
'object': 'assistant',
'tools': [{'type': 'code\_interpreter'},
{'type': 'file\_search',
'file\_search': {'max\_num\_results': None,
'ranking\_options': {'score\_threshold': 0.0,
'ranker': 'default\_2024\_08\_21'}}}],
'response\_format': 'auto',
'temperature': 1.0,
'tool\_resources': {'code\_interpreter': {'file\_ids': ['file-GQFm2i7N8LrAQatefWKEsE']},
'file\_search': {'vector\_store\_ids': ['vs\_dEArILZSJh7J799QACi3QhuU']}},
'top\_p': 1.0}`
```
```
`thread, run = create\_thread\_and\_run(
"What are some cool math concepts behind this ML paper pdf? Explain in two sentences."
)
run = wait\_on\_run(run, thread)
pretty\_print(get\_response(thread))`
```
```
`# Messages
user: What are some cool math concepts behind this ML paper pdf? Explain in two sentences.
assistant: The paper explores the concept of multitask learning where a single model is used to perform various tasks, modeling the conditional distribution \\( p(\\text{output} | \\text{input, task}) \\), inspired by probabilistic approaches【6:10†source】. It also discusses the use of Transformer-based architectures and parallel corpus substitution in language models, enhancing their ability to generalize across domain tasks without explicit task-specific supervision【6:2†source】【6:5†source】.`
```
>
**> Note
**> There are more intricacies in File Search, like
[> Annotations
](https://platform.openai.com/docs/assistants/how-it-works/managing-threads-and-messages)> , which may be covered in another cookbook.
>
```
`# Delete the vector store
client.beta.vector\_stores.delete(vector\_store.id)`
```
```
`VectorStoreDeleted(id='vs\_dEArILZSJh7J799QACi3QhuU', deleted=True, object='vector\_store.deleted')`
```
### Functions
As a final powerful tool for your Assistant, you can specify custom [Functions](https://platform.openai.com/docs/assistants/tools/function-calling) (much like the [Function Calling](https://platform.openai.com/docs/guides/function-calling) in the Chat Completions API). During a Run, the Assistant can then indicate it wants to call one or more functions you specified. You are then responsible for calling the Function, and providing the output back to the Assistant.
Let’s take a look at an example by defining a `display\_quiz()` Function for our Math Tutor.
This function will take a `title` and an array of `question`s, display the quiz, and get input from the user for each:
* `title`
* `questions`
* `question\_text`
* `question\_type`: [`MULTIPLE\_CHOICE`, `FREE\_RESPONSE`]
* `choices`: [“choice 1”, “choice 2”, …]
I’ll mocking out responses with `get\_mock\_response...`. This is where you’d get the user’s actual input.
```
`def get\_mock\_response\_from\_user\_multiple\_choice():
return "a"
def get\_mock\_response\_from\_user\_free\_response():
return "I don't know."
def display\_quiz(title, questions):
print("Quiz:", title)
print()
responses = []
for q in questions:
print(q["question\_text"])
response = ""
# If multiple choice, print options
if q["question\_type"] == "MULTIPLE\_CHOICE":
for i, choice in enumerate(q["choices"]):
print(f"{i}. {choice}")
response = get\_mock\_response\_from\_user\_multiple\_choice()
# Otherwise, just get response
elif q["question\_type"] == "FREE\_RESPONSE":
response = get\_mock\_response\_from\_user\_free\_response()
responses.append(response)
print()
return responses`
```
Here’s what a sample quiz would look like:
```
`responses = display\_quiz(
"Sample Quiz",
[
{"question\_text": "What is your name?", "question\_type": "FREE\_RESPONSE"},
{
"question\_text": "What is your favorite color?",
"question\_type": "MULTIPLE\_CHOICE",
"choices": ["Red", "Blue", "Green", "Yellow"],
},
],
)
print("Responses:", responses)`
```
```
`Quiz: Sample Quiz
What is your name?
What is your favorite color?
0. Red
1. Blue
2. Green
3. Yellow
Responses: ["I don't know.", 'a']`
```
Now, let’s define the interface of this function in JSON format, so our Assistant can call it:
```
`function\_json = {
"name": "display\_quiz",
"description": "Displays a quiz to the student, and returns the student's response. A single quiz can have multiple questions.",
"parameters": {
"type": "object",
"properties": {
"title": {"type": "string"},
"questions": {
"type": "array",
"description": "An array of questions, each with a title and potentially options (if multiple choice).",
"items": {
"type": "object",
"properties": {
"question\_text": {"type": "string"},
"question\_type": {
"type": "string",
"enum": ["MULTIPLE\_CHOICE", "FREE\_RESPONSE"]
},
"choices": {"type": "array", "items": {"type": "string"}}
},
"required": ["question\_text"]
}
}
},
"required": ["title", "questions"]
}
}`
```
Once again, let’s update our Assistant either through the Dashboard or the API.
>
**> Note
**> Pasting the function JSON into the Dashboard was a bit finicky due to indentation, etc. I just asked ChatGPT to format my function the same as one of the examples on the Dashboard :).
>
```
`assistant = client.beta.assistants.update(
MATH\_ASSISTANT\_ID,
tools=[
{"type": "code\_interpreter"},
{"type": "file\_search"},
{"type": "function", "function": function\_json},
],
)
show\_json(assistant)`
```
```
`{'id': 'asst\_qvXmYlZV8zhABI2RtPzDfV6z',
'created\_at': 1736340398,
'description': None,
'instructions': 'You are a personal math tutor. Answer questions briefly, in a sentence or less.',
'metadata': {},
'model': 'gpt-4o',
'name': 'Math Tutor',
'object': 'assistant',
'tools': [{'type': 'code\_interpreter'},
{'type': 'file\_search',
'file\_search': {'max\_num\_results': None,
'ranking\_options': {'score\_threshold': 0.0,
'ranker': 'default\_2024\_08\_21'}}},
{'function': {'name': 'display\_quiz',
'description': "Displays a quiz to the student, and returns the student's response. A single quiz can have multiple questions.",
'description': "Displays a quiz to the student, and returns the student's response. A single quiz can have multiple questions.",
'parameters': {'type': 'object',
'properties': {'title': {'type': 'string'},
'questions': {'type': 'array',
'description': 'An array of questions, each with a title and potentially options (if multiple choice).',
'items': {'type': 'object',
'properties': {'question\_text': {'type': 'string'},
'question\_type': {'type': 'string',
'enum': ['MULTIPLE\_CHOICE', 'FREE\_RESPONSE']},
'choices': {'type': 'array', 'items': {'type': 'string'}}},
'required': ['question\_text']}}},
'required': ['title', 'questions']},
'strict': False},
'type': 'function'}],
'response\_format': 'auto',
'temperature': 1.0,
'tool\_resources': {'code\_interpreter': {'file\_ids': ['file-GQFm2i7N8LrAQatefWKEsE']},
'file\_search': {'vector\_store\_ids': []}},
'top\_p': 1.0}`
```
And now, we ask for a quiz.
```
`thread, run = create\_thread\_and\_run(
"Make a quiz with 2 questions: One open ended, one multiple choice. Then, give me feedback for the responses."
)
run = wait\_on\_run(run, thread)
run.status`
```
```
`'requires\_action'`
```
Now, however, when we check the Run’s `status` we see `requires\_action`! Let’s take a closer.
```
`show\_json(run)`
```
```
`{'id': 'run\_ekMRSI2h35asEzKirRf4BTwZ',
'assistant\_id': 'asst\_qvXmYlZV8zhABI2RtPzDfV6z',
'cancelled\_at': None,
'completed\_at': None,
'created\_at': 1736341020,
'expires\_at': 1736341620,
'failed\_at': None,
'incomplete\_details': None,
'incomplete\_details': None,
'instructions': 'You are a personal math tutor. Answer questions briefly, in a sentence or less.',
'last\_error': None,
'max\_completion\_tokens': None,
'max\_prompt\_tokens': None,
'max\_completion\_tokens': None,
'max\_prompt\_tokens': None,
'metadata': {},
'model': 'gpt-4o',
'object': 'thread.run',
'parallel\_tool\_calls': True,
'required\_action': {'submit\_tool\_outputs': {'tool\_calls': [{'id': 'call\_uvJEn0fxM4sgmzek8wahBGLi',
'function': {'arguments': '{"title":"Math Quiz","questions":[{"question\_text":"What is the derivative of the function f(x) = 3x^2 + 2x - 5?","question\_type":"FREE\_RESPONSE"},{"question\_text":"What is the value of \\\\\\\\( \\\\\\\\int\_{0}^{1} 2x \\\\\\\\, dx \\\\\\\\)?","question\_type":"MULTIPLE\_CHOICE","choices":["0","1","2","3"]}]}',
'name': 'display\_quiz'},
'type': 'function'}]},
'type': 'submit\_tool\_outputs'},
'response\_format': 'auto',
'started\_at': 1736341022,
'status': 'requires\_action',
'thread\_id': 'thread\_8bK2PXfoeijEHBVEzYuJXt17',
'tool\_choice': 'auto',
'tools': [{'type': 'code\_interpreter'},
{'type': 'file\_search',
'file\_search': {'max\_num\_results': None,
'ranking\_options': {'score\_threshold': 0.0,
'ranker': 'default\_2024\_08\_21'}}},
{'function': {'name': 'display\_quiz',
'description': "Displays a quiz to the student, and returns the student's response. A single quiz can have multiple questions.",
'description': "Displays a quiz to the student, and returns the student's response. A single quiz can have multiple questions.",
'parameters': {'type': 'object',
'properties': {'title': {'type': 'string'},
'questions': {'type': 'array',
'description': 'An array of questions, each with a title and potentially options (if multiple choice).',
'items': {'type': 'object',
'properties': {'question\_text': {'type': 'string'},
'question\_type': {'type': 'string',
'enum': ['MULTIPLE\_CHOICE', 'FREE\_RESPONSE']},
'choices': {'type': 'array', 'items': {'type': 'string'}}},
'required': ['question\_text']}}},
'required': ['title', 'questions']},
'strict': False},
'type': 'function'}],
'truncation\_strategy': {'type': 'auto', 'last\_messages': None},
'usage': None,
'temperature': 1.0,
'top\_p': 1.0,
'tool\_resources': {}} 'strict': False},
'type': 'function'}],
'truncation\_strategy': {'type': 'auto', 'last\_messages': None},
'usage': None,
'temperature': 1.0,
'top\_p': 1.0,
'tool\_resources': {}}`
```
The `required\_action` field indicates a Tool is waiting for us to run it and submit its output back to the Assistant. Specifically, the `display\_quiz` function! Let’s start by parsing the `name` and `arguments`.
>
**> Note
**> While in this case we know there is only one Tool call, in practice the Assistant may choose to call multiple tools.
>
```
`# Extract single tool call
tool\_call = run.required\_action.submit\_tool\_outputs.tool\_calls[0]
name = tool\_call.function.name
arguments = json.loads(tool\_call.function.arguments)
print("Function Name:", name)
print("Function Arguments:")
arguments`
```
```
`Function Name: display\_quiz
Function Arguments:`
```
```
`{'title': 'Math Quiz',
'questions': [{'question\_text': 'What is the derivative of the function f(x) = 3x^2 + 2x - 5?',
'question\_type': 'FREE\_RESPONSE'},
{'question\_text': 'What is the value of \\\\( \\\\int\_{0}^{1} 2x \\\\, dx \\\\)?',
'question\_type': 'MULTIPLE\_CHOICE',
'choices': ['0', '1', '2', '3']}]}`
```
Now let’s actually call our `display\_quiz` function with the arguments provided by the Assistant:
```
`responses = display\_quiz(arguments["title"], arguments["questions"])
print("Responses:", responses)`
```
```
`Quiz: Math Quiz
Quiz: Math Quiz
What is the derivative of the function f(x) = 3x^2 + 2x - 5?
What is the value of \\( \\int\_{0}^{1} 2x \\, dx \\)?
0. 0
1. 1
2. 2
3. 3
Responses: ["I don't know.", 'a']`
```
Great! (Remember these responses are the one’s we mocked earlier. In reality, we’d be getting input from the back from this function call.)
Now that we have our responses, let’s submit them back to the Assistant. We’ll need the `tool\_call` ID, found in the `tool\_call` we parsed out earlier. We’ll also need to encode our `list`of responses into a `str`.
```
`run = client.beta.threads.runs.submit\_tool\_outputs(
thread\_id=thread.id,
run\_id=run.id,
tool\_outputs=tool\_outputs
)
show\_json(run)`
```
```
`{'id': 'run\_ekMRSI2h35asEzKirRf4BTwZ',
'assistant\_id': 'asst\_qvXmYlZV8zhABI2RtPzDfV6z',
'cancelled\_at': None,
'completed\_at': None,
'created\_at': 1736341020,
'expires\_at': 1736341620,
'failed\_at': None,
'incomplete\_details': None,
'incomplete\_details': None,
'instructions': 'You are a personal math tutor. Answer questions briefly, in a sentence or less.',
'last\_error': None,
'max\_completion\_tokens': None,
'max\_prompt\_tokens': None,
'max\_completion\_tokens': None,
'max\_prompt\_tokens': None,
'metadata': {},
'model': 'gpt-4o',
'object': 'thread.run',
'parallel\_tool\_calls': True,
'parallel\_tool\_calls': True,
'required\_action': None,
'response\_format': 'auto',
'started\_at': 1736341022,
'status': 'queued',
'thread\_id': 'thread\_8bK2PXfoeijEHBVEzYuJXt17',
'tool\_choice': 'auto',
'tools': [{'type': 'code\_interpreter'},
{'type': 'file\_search',
'file\_search': {'max\_num\_results': None,
'ranking\_options': {'score\_threshold': 0.0,
'ranker': 'default\_2024\_08\_21'}}},
{'function': {'name': 'display\_quiz',
'description': "Displays a quiz to the student, and returns the student's response. A single quiz can have multiple questions.",
'description': "Displays a quiz to the student, and returns the student's response. A single quiz can have multiple questions.",
'parameters': {'type': 'object',
'properties': {'title': {'type': 'string'},
'questions': {'type': 'array',
'description': 'An array of questions, each with a title and potentially options (if multiple choice).',
'items': {'type': 'object',
'properties': {'question\_text': {'type': 'string'},
'question\_type': {'type': 'string',
'enum': ['MULTIPLE\_CHOICE', 'FREE\_RESPONSE']},
'choices': {'type': 'array', 'items': {'type': 'string'}}},
'required': ['question\_text']}}},
'required': ['title', 'questions']},
'strict': False},
'type': 'function'}],
'truncation\_strategy': {'type': 'auto', 'last\_messages': None},
'usage': None,
'temperature': 1.0,
'top\_p': 1.0,
'tool\_resources': {}} 'strict': False},
'type': 'function'}],
'truncation\_strategy': {'type': 'auto', 'last\_messages': None},
'usage': None,
'temperature': 1.0,
'top\_p': 1.0,
'tool\_resources': {}}`
```
We can now wait for the Run to complete once again, and check our Thread!
```
`run = wait\_on\_run(run, thread)
pretty\_print(get\_response(thread))`
```
```
`# Messages
user: Make a quiz with 2 questions: One open ended, one multiple choice. Then, give me feedback for the responses.
assistant: Since no specific information was found in the uploaded file, I'll create a general math quiz for you:
1. \*\*Open-ended Question\*\*: What is the derivative of the function \\( f(x) = 3x^2 + 2x - 5 \\)?
2. \*\*Multiple Choice Question\*\*: What is the value of \\( \\int\_{0}^{1} 2x \\, dx \\)?
- A) 0
- B) 1
- C) 2
- D) 3
I will now present the quiz to you for response.
assistant: Here is the feedback for your responses:
1. \*\*Derivative Question\*\*:
- Your Response: "I don't know."
- Feedback: The derivative of \\( f(x) = 3x^2 + 2x - 5 \\) is \\( f'(x) = 6x + 2 \\).
2. \*\*Integration Question\*\*:
- Your Response: A) 0
- Feedback: The correct answer is B) 1. The integration \\(\\int\_{0}^{1} 2x \\, dx \\) evaluates to 1.`
```
Woohoo 🎉
## Conclusion
We covered a lot of ground in this notebook, give yourself a high-five! Hopefully you should now have a strong foundation to build powerful, stateful experiences with tools like Code Interpreter, Retrieval, and Functions!
There’s a few sections we didn’t cover for the sake of brevity, so here’s a few resources to explore further:
* [Annotations](https://platform.openai.com/docs/assistants/how-it-works/managing-threads-and-messages): parsing file citations
* [Files](https://platform.openai.com/docs/api-reference/assistants/file-object): Thread scoped vs Assistant scoped
* [Parallel Function Calls](https://platform.openai.com/docs/guides/function-calling/parallel-function-calling): calling multiple tools in a single Step
* Multi-Assistant Thread Runs: single Thread with Messages from multiple Assistants
* Streaming: coming soon!
Now go off and build something ama[zing](https://www.youtube.com/watch?v=xvFZjo5PgG0&#x26;pp=ygUQcmljayByb2xsIG5vIGFkcw==)!