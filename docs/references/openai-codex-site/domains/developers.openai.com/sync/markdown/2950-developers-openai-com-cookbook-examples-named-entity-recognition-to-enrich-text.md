Named Entity Recognition to Enrich Text
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
Oct 20, 2023
# Named Entity Recognition to Enrich Text
[ DC ](https://github.com/dcarpintero)
[ dcarpintero ](https://github.com/dcarpintero)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Named_Entity_Recognition_to_enrich_text.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Named_Entity_Recognition_to_enrich_text.ipynb)
## Named Entity Recognition (NER) to Enrich Text
`Named Entity Recognition` (NER) is a `Natural Language Processing` task that identifies and classifies named entities (NE) into predefined semantic categories (such as persons, organizations, locations, events, time expressions, and quantities). By converting raw text into structured information, NER makes data more actionable, facilitating tasks like information extraction, data aggregation, analytics, and social media monitoring.
This notebook demonstrates how to carry out NER with [chat completion](https://platform.openai.com/docs/api-reference/chat) and [functions-calling](https://platform.openai.com/docs/guides/gpt/function-calling) to enrich a text with links to a knowledge base such as Wikipedia:
**Text:**
*In Germany, in 1440, goldsmith Johannes Gutenberg invented the movable-type printing press. His work led to an information revolution and the unprecedented mass-spread of literature throughout Europe. Modelled on the design of the existing screw presses, a single Renaissance movable-type printing press could produce up to 3,600 pages per workday.*
**Text enriched with Wikipedia links:**
*In [Germany](https://en.wikipedia.org/wiki/Germany), in 1440, goldsmith [Johannes Gutenberg]() invented the [movable-type printing press](https://en.wikipedia.org/wiki/Movable_Type). His work led to an [information revolution](https://en.wikipedia.org/wiki/Information_revolution) and the unprecedented mass-spread of literature throughout [Europe](https://en.wikipedia.org/wiki/Europe). Modelled on the design of the existing screw presses, a single [Renaissance](https://en.wikipedia.org/wiki/Renaissance) [movable-type printing press](https://en.wikipedia.org/wiki/Movable_Type) could produce up to 3,600 pages per workday.*
**Inference Costs:** The notebook also illustrates how to estimate OpenAI API costs.
### 1. Setup
#### 1.1 Install/Upgrade Python packages
```
`%pip install --upgrade openai --quiet
%pip install --upgrade nlpia2-wikipedia --quiet
%pip install --upgrade tenacity --quiet`
```
```
`Note: you may need to restart the kernel to use updated packages.
Note: you may need to restart the kernel to use updated packages.
Note: you may need to restart the kernel to use updated packages.`
```
#### 1.2 Load packages and OPENAI\_API\_KEY
You can generate an API key in the OpenAI web interface. See [https://platform.openai.com/account/api-keys](https://platform.openai.com/account/api-keys) for details.
This notebook works with the latest OpeanAI models `gpt-3.5-turbo-0613` and `gpt-4-0613`.
```
`import json
import logging
import os
import openai
import wikipedia
from typing import Optional
from IPython.display import display, Markdown
from tenacity import retry, wait\_random\_exponential, stop\_after\_attempt
logging.basicConfig(level=logging.INFO, format=' %(asctime)s - %(levelname)s - %(message)s')
OPENAI\_MODEL = 'gpt-3.5-turbo-0613'
client = openai.OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))`
```
### 2. Define the NER labels to be Identified
We define a standard set of NER labels to showcase a wide range of use cases. However, for our specific task of enriching text with knowledge base links, only a subset is practically required.
```
`labels = [
"person", # people, including fictional characters
"fac", # buildings, airports, highways, bridges
"org", # organizations, companies, agencies, institutions
"gpe", # geopolitical entities like countries, cities, states
"loc", # non-gpe locations
"product", # vehicles, foods, appareal, appliances, software, toys
"event", # named sports, scientific milestones, historical events
"work\_of\_art", # titles of books, songs, movies
"law", # named laws, acts, or legislations
"language", # any named language
"date", # absolute or relative dates or periods
"time", # time units smaller than a day
"percent", # percentage (e.g., "twenty percent", "18%")
"money", # monetary values, including unit
"quantity", # measurements, e.g., weight or distance
]`
```
### 3. Prepare messages
The [chat completions API](https://platform.openai.com/docs/guides/gpt/chat-completions-api) takes a list of messages as input and delivers a model-generated message as an output. While the chat format is primarily designed for facilitating multi-turn conversations, it is equally efficient for single-turn tasks without any preceding conversation. For our purposes, we will specify a message for the system, assistant, and user roles.
#### 3.1 System Message
The `system message` (prompt) sets the assistant’s behavior by defining its desired persona and task. We also delineate the specific set of entity labels we aim to identify.
Although one can instruct the model to format its response, it has to be noted that both `gpt-3.5-turbo-0613` and `gpt-4-0613` have been fine-tuned to discern when a function should be invoked, and to reply with `JSON` formatted according to the function’s signature. This capability streamlines our prompt and enables us to receive structured data directly from the model.
```
`def system\_message(labels):
return f"""
You are an expert in Natural Language Processing. Your task is to identify common Named Entities (NER) in a given text.
The possible common Named Entities (NER) types are exclusively: ({", ".join(labels)})."""`
```
#### 3.2 Assistant Message
`Assistant messages` usually store previous assistant responses. However, as in our scenario, they can also be crafted to provide examples of the desired behavior. While OpenAI is able to execute `zero-shot` Named Entity Recognition, we have found that a `one-shot` approach produces more precise results.
```
`def assisstant\_message():
return f"""
EXAMPLE:
Text: 'In Germany, in 1440, goldsmith Johannes Gutenberg invented the movable-type printing press. His work led to an information revolution and the unprecedented mass-spread /
of literature throughout Europe. Modelled on the design of the existing screw presses, a single Renaissance movable-type printing press could produce up to 3,600 pages per workday.'
{{
"gpe": ["Germany", "Europe"],
"date": ["1440"],
"person": ["Johannes Gutenberg"],
"product": ["movable-type printing press"],
"event": ["Renaissance"],
"quantity": ["3,600 pages"],
"time": ["workday"]
}}
--"""`
```
#### 3.3 User Message
The `user message` provides the specific text for the assistant task:
```
`def user\_message(text):
return f"""
TASK:
Text: {text}
"""`
```
### 4. OpenAI Functions (and Utils)
In an OpenAI API call, we can describe `functions` to `gpt-3.5-turbo-0613` and `gpt-4-0613` and have the model intelligently choose to output a `JSON` object containing arguments to call those `functions`. It’s important to note that the [chat completions API](https://platform.openai.com/docs/guides/gpt/chat-completions-api) doesn’t actually execute the `function`. Instead, it provides the `JSON` output, which can then be used to call the `function` in our code. For more details, refer to the [OpenAI Function Calling Guide](https://platform.openai.com/docs/guides/function-calling).
Our function, `enrich\_entities(text, label\_entities)` gets a block of text and a dictionary containing identified labels and entities as parameters. It then associates the recognized entities with their corresponding links to the Wikipedia articles.
```
`@retry(wait=wait\_random\_exponential(min=1, max=10), stop=stop\_after\_attempt(5))
def find\_link(entity: str) -\> Optional[str]:
"""
Finds a Wikipedia link for a given entity.
"""
try:
titles = wikipedia.search(entity)
if titles:
# naively consider the first result as the best
page = wikipedia.page(titles[0])
return page.url
except (wikipedia.exceptions.WikipediaException) as ex:
logging.error(f'Error occurred while searching for Wikipedia link for entity {entity}: {str(ex)}')
return None`
```
```
`def find\_all\_links(label\_entities:dict) -\> dict:
"""
Finds all Wikipedia links for the dictionary entities in the whitelist label list.
"""
whitelist = ['event', 'gpe', 'org', 'person', 'product', 'work\_of\_art']
return {e: find\_link(e) for label, entities in label\_entities.items()
for e in entities
if label in whitelist}`
```
```
`def enrich\_entities(text: str, label\_entities: dict) -\> str:
"""
Enriches text with knowledge base links.
"""
entity\_link\_dict = find\_all\_links(label\_entities)
logging.info(f"entity\_link\_dict: {entity\_link\_dict}")
for entity, link in entity\_link\_dict.items():
text = text.replace(entity, f"[{entity}]({link})")
return text`
```
### 4. ChatCompletion
As previously highlighted, `gpt-3.5-turbo-0613` and `gpt-4-0613` have been fine-tuned to detect when a `function` should to be called. Moreover, they can produce a `JSON` response that conforms to the `function` signature. Here’s the sequence we follow:
1. Define our `function` and its associated `JSON` Schema.
2. Invoke the model using the `messages`, `tools` and `tool\_choice` parameters.
3. Convert the output into a `JSON` object, and then call the `function` with the `arguments` provided by the model.
In practice, one might want to re-invoke the model again by appending the `function` response as a new message, and let the model summarize the results back to the user. Nevertheless, for our purposes, this step is not needed.
*Note that in a real-case scenario it is strongly recommended to build in user confirmation flows before taking actions.*
#### 4.1 Define our Function and JSON schema
Since we want the model to output a dictionary of labels and recognized entities:
```
`{
"gpe": ["Germany", "Europe"],
"date": ["1440"],
"person": ["Johannes Gutenberg"],
"product": ["movable-type printing press"],
"event": ["Renaissance"],
"quantity": ["3,600 pages"],
"time": ["workday"]
} `
```
we need to define the corresponding `JSON` schema to be passed to the `tools` parameter:
```
`def generate\_functions(labels: dict) -\> list:
return [
{
"type": "function",
"function": {
"name": "enrich\_entities",
"description": "Enrich Text with Knowledge Base Links",
"parameters": {
"type": "object",
"properties": {
"r'^(?:' + '|'.join({labels}) + ')$'":
{
"type": "array",
"items": {
"type": "string"
}
}
},
"additionalProperties": False
},
}
}
]`
```
#### 4.2 Chat Completion
Now, we invoke the model. It’s important to note that we direct the API to use a specific function by setting the `tool\_choice` parameter to `{"type": "function", "function" : {"name": "enrich\_entities"}}`.
```
`@retry(wait=wait\_random\_exponential(min=1, max=10), stop=stop\_after\_attempt(5))
def run\_openai\_task(labels, text):
messages = [
{"role": "system", "content": system\_message(labels=labels)},
{"role": "assistant", "content": assisstant\_message()},
{"role": "user", "content": user\_message(text=text)}
]
# TODO: functions and function\_call are deprecated, need to be updated
# See: https://platform.openai.com/docs/api-reference/chat/create#chat-create-tools
response = openai.chat.completions.create(
model="gpt-3.5-turbo-0613",
messages=messages,
tools=generate\_functions(labels),
tool\_choice={"type": "function", "function" : {"name": "enrich\_entities"}},
temperature=0,
frequency\_penalty=0,
presence\_penalty=0,
)
response\_message = response.choices[0].message
available\_functions = {"enrich\_entities": enrich\_entities}
function\_name = response\_message.tool\_calls[0].function.name
function\_to\_call = available\_functions[function\_name]
logging.info(f"function\_to\_call: {function\_to\_call}")
function\_args = json.loads(response\_message.tool\_calls[0].function.arguments)
logging.info(f"function\_args: {function\_args}")
function\_response = function\_to\_call(text, function\_args)
return {"model\_response": response,
"function\_response": function\_response}`
```
### 5. Let’s Enrich a Text with Wikipedia links
#### 5.1 Run OpenAI Task
```
`text = """The Beatles were an English rock band formed in Liverpool in 1960, comprising John Lennon, Paul McCartney, George Harrison, and Ringo Starr."""
result = run\_openai\_task(labels, text)`
```
```
` 2023-10-20 18:05:51,729 - INFO - function\_to\_call: \<function enrich\_entities at 0x0000021D30C462A0\>
2023-10-20 18:05:51,730 - INFO - function\_args: {'person': ['John Lennon', 'Paul McCartney', 'George Harrison', 'Ringo Starr'], 'org': ['The Beatles'], 'gpe': ['Liverpool'], 'date': ['1960']}
2023-10-20 18:06:09,858 - INFO - entity\_link\_dict: {'John Lennon': 'https://en.wikipedia.org/wiki/John\_Lennon', 'Paul McCartney': 'https://en.wikipedia.org/wiki/Paul\_McCartney', 'George Harrison': 'https://en.wikipedia.org/wiki/George\_Harrison', 'Ringo Starr': 'https://en.wikipedia.org/wiki/Ringo\_Starr', 'The Beatles': 'https://en.wikipedia.org/wiki/The\_Beatles', 'Liverpool': 'https://en.wikipedia.org/wiki/Liverpool'}`
```
#### 5.2 Function Response
```
`display(Markdown(f"""\*\*Text:\*\* {text}
\*\*Enriched\_Text:\*\* {result['function\_response']}"""))`
```
**Text:** The Beatles were an English rock band formed in Liverpool in 1960, comprising John Lennon, Paul McCartney, George Harrison, and Ringo Starr.
**Enriched\_Text:** [The Beatles](https://en.wikipedia.org/wiki/The_Beatles) were an English rock band formed in [Liverpool](https://en.wikipedia.org/wiki/Liverpool) in 1960, comprising [John Lennon](https://en.wikipedia.org/wiki/John_Lennon), [Paul McCartney](https://en.wikipedia.org/wiki/Paul_McCartney), [George Harrison](https://en.wikipedia.org/wiki/George_Harrison), and [Ringo Starr](https://en.wikipedia.org/wiki/Ringo_Starr).
#### 5.3 Token Usage
To estimate the inference costs, we can parse the response’s “usage” field. Detailed token costs per model are available in the [OpenAI Pricing Guide](https://openai.com/pricing):
```
`# estimate inference cost assuming gpt-3.5-turbo (4K context)
i\_tokens = result["model\_response"].usage.prompt\_tokens
o\_tokens = result["model\_response"].usage.completion\_tokens
i\_cost = (i\_tokens / 1000) \* 0.0015
o\_cost = (o\_tokens / 1000) \* 0.002
print(f"""Token Usage
Prompt: {i\_tokens} tokens
Completion: {o\_tokens} tokens
Cost estimation: ${round(i\_cost + o\_cost, 5)}""")`
```
```
`Token Usage
Prompt: 331 tokens
Completion: 47 tokens
Cost estimation: $0.00059`
```