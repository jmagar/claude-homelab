Fine-Tuned Q&A - collect data
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
Mar 10, 2022
# Fine-Tuned Q&A - collect data
This recipe is archived and may reference outdated models or APIs.
[ TS ](https://github.com/ted-at-openai)[ BO ](https://github.com/BorisPower)
[ Ted Sanders
(OpenAI)
, ](https://github.com/ted-at-openai)[ BorisPower ](https://github.com/BorisPower)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/fine-tuned_qa/olympics-1-collect-data.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/fine-tuned_qa/olympics-1-collect-data.ipynb)
Note: To answer questions based on text documents, we recommend the procedure in [Question Answering using Embeddings](https://github.com/openai/openai-cookbook/blob/main/examples/Question_answering_using_embeddings.ipynb). Some of the code below may rely on [deprecated API endpoints](https://github.com/openai/openai-cookbook/tree/main/transition_guides_for_deprecated_API_endpoints).
# 1. Collect Wikipedia data about Olympic Games 2020
The idea of this project is to create a question answering model, based on a few paragraphs of provided text. Base GPT-3 models do a good job at answering questions when the answer is contained within the paragraph, however if the answer isn’t contained, the base models tend to try their best to answer anyway, often leading to confabulated answers.
To create a model which answers questions only if there is sufficient context for doing so, we first create a dataset of questions and answers based on paragraphs of text. In order to train the model to answer only when the answer is present, we also add adversarial examples, where the question doesn’t match the context. In those cases, we ask the model to output “No sufficient context for answering the question”.
We will perform this task in three notebooks:
1. The first (this) notebook focuses on collecting recent data, which GPT-3 didn’t see during its pre-training. We picked the topic of Olympic Games 2020 (which actually took place in the summer of 2021), and downloaded 713 unique pages. We organized the dataset by individual sections, which will serve as context for asking and answering the questions.
2. The [second notebook](olympics-2-create-qa.ipynb) will utilize Davinci-instruct to ask a few questions based on a Wikipedia section, as well as answer those questions, based on that section.
3. The [third notebook](olympics-3-train-qa.ipynb) will utilize the dataset of context, question and answer pairs to additionally create adversarial questions and context pairs, where the question was not generated on that context. In those cases the model will be prompted to answer “No sufficient context for answering the question”. We will also train a discriminator model, which predicts whether the question can be answered based on the context or not.
## 1.1 Data extraction using the wikipedia API
Extracting the data will take about half an hour, and processing will likely take about as much.
```
`import pandas as pd
import wikipedia
def filter\_olympic\_2020\_titles(titles):
"""
Get the titles which are related to Olympic games hosted in 2020, given a list of titles
"""
titles = [title for title in titles if '2020' in title and 'olympi' in title.lower()]
return titles
def get\_wiki\_page(title):
"""
Get the wikipedia page given a title
"""
try:
return wikipedia.page(title)
except wikipedia.exceptions.DisambiguationError as e:
return wikipedia.page(e.options[0])
except wikipedia.exceptions.PageError as e:
return None
def recursively\_find\_all\_pages(titles, titles\_so\_far=set()):
"""
Recursively find all the pages that are linked to the Wikipedia titles in the list
"""
all\_pages = []
titles = list(set(titles) - titles\_so\_far)
titles = filter\_olympic\_2020\_titles(titles)
titles\_so\_far.update(titles)
for title in titles:
page = get\_wiki\_page(title)
if page is None:
continue
all\_pages.append(page)
new\_pages = recursively\_find\_all\_pages(page.links, titles\_so\_far)
for pg in new\_pages:
if pg.title not in [p.title for p in all\_pages]:
all\_pages.append(pg)
titles\_so\_far.update(page.links)
return all\_pages
pages = recursively\_find\_all\_pages(["2020 Summer Olympics"])
len(pages)`
```
```
`909`
```
## 1.2 Filtering the Wikipedia pages and splitting them into sections by headings
We remove sections unlikely to contain textual information, and ensure that each section is not longer than the token limit
```
`
import re
from typing import Set
from transformers import GPT2TokenizerFast
import numpy as np
from nltk.tokenize import sent\_tokenize
tokenizer = GPT2TokenizerFast.from\_pretrained("gpt2")
def count\_tokens(text: str) -\> int:
"""count the number of tokens in a string"""
return len(tokenizer.encode(text))
def reduce\_long(
long\_text: str, long\_text\_tokens: bool = False, max\_len: int = 590
) -\> str:
"""
Reduce a long text to a maximum of `max\_len` tokens by potentially cutting at a sentence end
"""
if not long\_text\_tokens:
long\_text\_tokens = count\_tokens(long\_text)
if long\_text\_tokens \> max\_len:
sentences = sent\_tokenize(long\_text.replace("\\n", " "))
ntokens = 0
for i, sentence in enumerate(sentences):
ntokens += 1 + count\_tokens(sentence)
if ntokens \> max\_len:
return ". ".join(sentences[:i]) + "."
return long\_text
discard\_categories = ['See also', 'References', 'External links', 'Further reading', "Footnotes",
"Bibliography", "Sources", "Citations", "Literature", "Footnotes", "Notes and references",
"Photo gallery", "Works cited", "Photos", "Gallery", "Notes", "References and sources",
"References and notes",]
def extract\_sections(
wiki\_text: str,
title: str,
max\_len: int = 1500,
discard\_categories: Set[str] = discard\_categories,
) -\> str:
"""
Extract the sections of a Wikipedia page, discarding the references and other low information sections
"""
if len(wiki\_text) == 0:
return []
# find all headings and the corresponding contents
headings = re.findall("==+ .\* ==+", wiki\_text)
for heading in headings:
wiki\_text = wiki\_text.replace(heading, "==+ !! ==+")
contents = wiki\_text.split("==+ !! ==+")
contents = [c.strip() for c in contents]
assert len(headings) == len(contents) - 1
cont = contents.pop(0).strip()
outputs = [(title, "Summary", cont, count\_tokens(cont)+4)]
# discard the discard categories, accounting for a tree structure
max\_level = 100
keep\_group\_level = max\_level
remove\_group\_level = max\_level
nheadings, ncontents = [], []
for heading, content in zip(headings, contents):
plain\_heading = " ".join(heading.split(" ")[1:-1])
num\_equals = len(heading.split(" ")[0])
if num\_equals \<= keep\_group\_level:
keep\_group\_level = max\_level
if num\_equals \> remove\_group\_level:
if (
num\_equals \<= keep\_group\_level
):
continue
keep\_group\_level = max\_level
if plain\_heading in discard\_categories:
remove\_group\_level = num\_equals
keep\_group\_level = max\_level
continue
nheadings.append(heading.replace("=", "").strip())
ncontents.append(content)
remove\_group\_level = max\_level
# count the tokens of each section
ncontent\_ntokens = [
count\_tokens(c)
+ 3
+ count\_tokens(" ".join(h.split(" ")[1:-1]))
- (1 if len(c) == 0 else 0)
for h, c in zip(nheadings, ncontents)
]
# Create a tuple of (title, section\_name, content, number of tokens)
outputs += [(title, h, c, t) if t\<max\_len
else (title, h, reduce\_long(c, max\_len), count\_tokens(reduce\_long(c,max\_len)))
for h, c, t in zip(nheadings, ncontents, ncontent\_ntokens)]
return outputs
# Example page being processed into sections
bermuda\_page = get\_wiki\_page('Bermuda at the 2020 Summer Olympics')
ber = extract\_sections(bermuda\_page.content, bermuda\_page.title)
# Example section
ber[-1]`
```
```
`('Bermuda at the 2020 Summer Olympics',
'Equestrian',
"Bermuda entered one dressage rider into the Olympic competition by finishing in the top four, outside the group selection, of the individual FEI Olympic Rankings for Groups D and E (North, Central, and South America), marking the country's recurrence to the sport after an eight-year absence. The quota was later withdrawn, following an injury of Annabelle Collins' main horse Joyero and a failure to obtain minimum eligibility requirements (MER) aboard a new horse Chuppy Checker.",
104)`
```
### 1.2.1 We create a dataset and filter out any sections with fewer than 40 tokens, as those are unlikely to contain enough context to ask a good question.
```
`res = []
for page in pages:
res += extract\_sections(page.content, page.title)
df = pd.DataFrame(res, columns=["title", "heading", "content", "tokens"])
df = df[df.tokens\>40]
df = df.drop\_duplicates(['title','heading'])
df = df.reset\_index().drop('index',axis=1) # reset index
df.head()`
```
```
`Token indices sequence length is longer than the specified maximum sequence length for this model (1060 \> 1024). Running this sequence through the model will result in indexing errors`
```
||title|heading|content|tokens|
|0|2020 Summer Olympics|Summary|The 2020 Summer Olympics (Japanese: 2020年夏季オリン...|713|
|1|2020 Summer Olympics|Host city selection|The International Olympic Committee (IOC) vote...|126|
|2|2020 Summer Olympics|Impact of the COVID-19 pandemic|In January 2020, concerns were raised about th...|369|
|3|2020 Summer Olympics|Qualifying event cancellation and postponement|Concerns about the pandemic began to affect qu...|298|
|4|2020 Summer Olympics|Effect on doping tests|Mandatory doping tests were being severely res...|163|
### Save the section dataset
We will save the section dataset, for the [next notebook](olympics-2-create-qa.ipynb)
```
`df.to\_csv('olympics-data/olympics\_sections.csv', index=False)`
```
## 1.3 (Optional) Exploring the data
```
`df.title.value\_counts().head()`
```
```
`Concerns and controversies at the 2020 Summer Olympics 51
United States at the 2020 Summer Olympics 46
Great Britain at the 2020 Summer Olympics 42
Canada at the 2020 Summer Olympics 39
Olympic Games 39
Name: title, dtype: int64`
```
There appear to be winter and summer Olympics 2020. We chose to leave a little ambiguity and noise in the dataset, even though we were interested only in the Summer Olympics 2020.
```
`df.title.str.contains('Summer').value\_counts()`
```
```
`True 3567
False 305
Name: title, dtype: int64`
```
```
`df.title.str.contains('Winter').value\_counts()`
```
```
`False 3774
True 98
Name: title, dtype: int64`
```
```
`import pandas as pd
from matplotlib import pyplot as plt
df = pd.read\_csv('olympics-data/olympics\_sections.csv')
df[['tokens']].hist()
# add axis descriptions and title
plt.xlabel('Number of tokens')
plt.ylabel('Number of Wikipedia sections')
plt.title('Distribution of number of tokens in Wikipedia sections')
plt.show()`
```
We can see that the majority of section are fairly short (less than 500 tokens).