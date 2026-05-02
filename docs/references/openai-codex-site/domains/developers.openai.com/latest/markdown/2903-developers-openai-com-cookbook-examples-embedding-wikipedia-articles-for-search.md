Embedding Wikipedia articles for search
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
Nov 26, 2024
# Embedding Wikipedia articles for search
[ TS ](https://github.com/ted-at-openai)
[ Ted Sanders
(OpenAI)
](https://github.com/ted-at-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Embedding_Wikipedia_articles_for_search.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Embedding_Wikipedia_articles_for_search.ipynb)
This notebook shows how we prepared a dataset of Wikipedia articles for search, used in [Question\_answering\_using\_embeddings.ipynb](Question_answering_using_embeddings.ipynb).
Procedure:
1. Prerequisites: Import libraries, set API key (if needed)
2. Collect: We download a few hundred Wikipedia articles about the 2022 Olympics
3. Chunk: Documents are split into short, semi-self-contained sections to be embedded
4. Embed: Each section is embedded with the OpenAI API
5. Store: Embeddings are saved in a CSV file (for large datasets, use a vector database)
## 0. Prerequisites
### Import libraries
```
`# imports
import mwclient # for downloading example Wikipedia articles
import mwparserfromhell # for splitting Wikipedia articles into sections
from openai import OpenAI # for generating embeddings
import os # for environment variables
import pandas as pd # for DataFrames to store article sections and embeddings
import re # for cutting \<ref\> links out of Wikipedia articles
import tiktoken # for counting tokens
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))`
```
Install any missing libraries with `pip install` in your terminal. E.g.,
```
`pip install openai`
```
(You can also do this in a notebook cell with `!pip install openai`.)
If you install any libraries, be sure to restart the notebook kernel.
### Set API key (if needed)
Note that the OpenAI library will try to read your API key from the `OPENAI\_API\_KEY` environment variable. If you haven’t already, set this environment variable by following [these instructions](https://help.openai.com/en/articles/5112595-best-practices-for-api-key-safety).
## 1. Collect documents
In this example, we’ll download a few hundred Wikipedia articles related to the 2022 Winter Olympics.
```
`# get Wikipedia pages about the 2022 Winter Olympics
CATEGORY\_TITLE = "Category:2022 Winter Olympics"
WIKI\_SITE = "en.wikipedia.org"
def titles\_from\_category(
category: mwclient.listing.Category, max\_depth: int
) -\> set[str]:
"""Return a set of page titles in a given Wiki category and its subcategories."""
titles = set()
for cm in category.members():
if type(cm) == mwclient.page.Page:
# ^type() used instead of isinstance() to catch match w/ no inheritance
titles.add(cm.name)
elif isinstance(cm, mwclient.listing.Category) and max\_depth \> 0:
deeper\_titles = titles\_from\_category(cm, max\_depth=max\_depth - 1)
titles.update(deeper\_titles)
return titles
site = mwclient.Site(WIKI\_SITE)
category\_page = site.pages[CATEGORY\_TITLE]
titles = titles\_from\_category(category\_page, max\_depth=1)
# ^note: max\_depth=1 means we go one level deep in the category tree
print(f"Found {len(titles)} article titles in {CATEGORY\_TITLE}.")`
```
```
`Found 179 article titles in Category:2022 Winter Olympics.`
```
## 2. Chunk documents
Now that we have our reference documents, we need to prepare them for search.
Because GPT can only read a limited amount of text at once, we’ll split each document into chunks short enough to be read.
For this specific example on Wikipedia articles, we’ll:
* Discard less relevant-looking sections like External Links and Footnotes
* Clean up the text by removing reference tags (e.g., ), whitespace, and super short sections
* Split each article into sections
* Prepend titles and subtitles to each section’s text, to help GPT understand the context
* If a section is long (say, \> 1,600 tokens), we’ll recursively split it into smaller sections, trying to split along semantic boundaries like paragraphs
```
`# define functions to split Wikipedia pages into sections
SECTIONS\_TO\_IGNORE = [
"See also",
"References",
"External links",
"Further reading",
"Footnotes",
"Bibliography",
"Sources",
"Citations",
"Literature",
"Footnotes",
"Notes and references",
"Photo gallery",
"Works cited",
"Photos",
"Gallery",
"Notes",
"References and sources",
"References and notes",
]
def all\_subsections\_from\_section(
section: mwparserfromhell.wikicode.Wikicode,
parent\_titles: list[str],
sections\_to\_ignore: set[str],
) -\> list[tuple[list[str], str]]:
"""
From a Wikipedia section, return a flattened list of all nested subsections.
Each subsection is a tuple, where:
- the first element is a list of parent subtitles, starting with the page title
- the second element is the text of the subsection (but not any children)
"""
headings = [str(h) for h in section.filter\_headings()]
title = headings[0]
if title.strip("=" + " ") in sections\_to\_ignore:
# ^wiki headings are wrapped like "== Heading =="
return []
titles = parent\_titles + [title]
full\_text = str(section)
section\_text = full\_text.split(title)[1]
if len(headings) == 1:
return [(titles, section\_text)]
else:
first\_subtitle = headings[1]
section\_text = section\_text.split(first\_subtitle)[0]
results = [(titles, section\_text)]
for subsection in section.get\_sections(levels=[len(titles) + 1]):
results.extend(all\_subsections\_from\_section(subsection, titles, sections\_to\_ignore))
return results
def all\_subsections\_from\_title(
title: str,
sections\_to\_ignore: set[str] = SECTIONS\_TO\_IGNORE,
site\_name: str = WIKI\_SITE,
) -\> list[tuple[list[str], str]]:
"""From a Wikipedia page title, return a flattened list of all nested subsections.
Each subsection is a tuple, where:
- the first element is a list of parent subtitles, starting with the page title
- the second element is the text of the subsection (but not any children)
"""
site = mwclient.Site(site\_name)
page = site.pages[title]
text = page.text()
parsed\_text = mwparserfromhell.parse(text)
headings = [str(h) for h in parsed\_text.filter\_headings()]
if headings:
summary\_text = str(parsed\_text).split(headings[0])[0]
else:
summary\_text = str(parsed\_text)
results = [([title], summary\_text)]
for subsection in parsed\_text.get\_sections(levels=[2]):
results.extend(all\_subsections\_from\_section(subsection, [title], sections\_to\_ignore))
return results`
```
```
`# split pages into sections
# may take \~1 minute per 100 articles
wikipedia\_sections = []
for title in titles:
wikipedia\_sections.extend(all\_subsections\_from\_title(title))
print(f"Found {len(wikipedia\_sections)} sections in {len(titles)} pages.")`
```
```
`Found 1838 sections in 179 pages.`
```
```
`# clean text
def clean\_section(section: tuple[list[str], str]) -\> tuple[list[str], str]:
"""
Return a cleaned up section with:
- \<ref\>xyz\</ref\> patterns removed
- leading/trailing whitespace removed
"""
titles, text = section
text = re.sub(r"\<ref.\*?\</ref\>", "", text)
text = text.strip()
return (titles, text)
wikipedia\_sections = [clean\_section(ws) for ws in wikipedia\_sections]
# filter out short/blank sections
def keep\_section(section: tuple[list[str], str]) -\> bool:
"""Return True if the section should be kept, False otherwise."""
titles, text = section
if len(text) \< 16:
return False
else:
return True
original\_num\_sections = len(wikipedia\_sections)
wikipedia\_sections = [ws for ws in wikipedia\_sections if keep\_section(ws)]
print(f"Filtered out {original\_num\_sections-len(wikipedia\_sections)} sections, leaving {len(wikipedia\_sections)} sections.")`
```
```
`Filtered out 89 sections, leaving 1749 sections.`
```
```
`# print example data
for ws in wikipedia\_sections[:5]:
print(ws[0])
display(ws[1][:77] + "...")
print()`
```
```
`['Concerns and controversies at the 2022 Winter Olympics']`
```
```
`'{{Short description|Overview of concerns and controversies surrounding the Ga...'`
```
```
`
['Concerns and controversies at the 2022 Winter Olympics', '==Criticism of host selection==']`
```
```
`'American sportscaster [[Bob Costas]] criticized the [[International Olympic C...'`
```
```
`
['Concerns and controversies at the 2022 Winter Olympics', '==Organizing concerns and controversies==', '===Cost and climate===']`
```
```
`'Several cities withdrew their applications during [[Bids for the 2022 Winter ...'`
```
```
`
['Concerns and controversies at the 2022 Winter Olympics', '==Organizing concerns and controversies==', '===Promotional song===']`
```
```
`'Some commentators alleged that one of the early promotional songs for the [[2...'`
```
```
`
['Concerns and controversies at the 2022 Winter Olympics', '== Diplomatic boycotts or non-attendance ==']`
```
```
`'\<section begin=boycotts /\>\\n[[File:2022 Winter Olympics (Beijing) diplomatic b...'`
```
Next, we’ll recursively split long sections into smaller sections.
There’s no perfect recipe for splitting text into sections.
Some tradeoffs include:
* Longer sections may be better for questions that require more context
* Longer sections may be worse for retrieval, as they may have more topics muddled together
* Shorter sections are better for reducing costs (which are proportional to the number of tokens)
* Shorter sections allow more sections to be retrieved, which may help with recall
* Overlapping sections may help prevent answers from being cut by section boundaries
Here, we’ll use a simple approach and limit sections to 1,600 tokens each, recursively halving any sections that are too long. To avoid cutting in the middle of useful sentences, we’ll split along paragraph boundaries when possible.
```
`GPT\_MODEL = "gpt-4o-mini" # only matters insofar as it selects which tokenizer to use
def num\_tokens(text: str, model: str = GPT\_MODEL) -\> int:
"""Return the number of tokens in a string."""
encoding = tiktoken.encoding\_for\_model(model)
return len(encoding.encode(text))
def halved\_by\_delimiter(string: str, delimiter: str = "\\n") -\> list[str, str]:
"""Split a string in two, on a delimiter, trying to balance tokens on each side."""
chunks = string.split(delimiter)
if len(chunks) == 1:
return [string, ""] # no delimiter found
elif len(chunks) == 2:
return chunks # no need to search for halfway point
else:
total\_tokens = num\_tokens(string)
halfway = total\_tokens // 2
best\_diff = halfway
for i, chunk in enumerate(chunks):
left = delimiter.join(chunks[: i + 1])
left\_tokens = num\_tokens(left)
diff = abs(halfway - left\_tokens)
if diff \>= best\_diff:
break
else:
best\_diff = diff
left = delimiter.join(chunks[:i])
right = delimiter.join(chunks[i:])
return [left, right]
def truncated\_string(
string: str,
model: str,
max\_tokens: int,
print\_warning: bool = True,
) -\> str:
"""Truncate a string to a maximum number of tokens."""
encoding = tiktoken.encoding\_for\_model(model)
encoded\_string = encoding.encode(string)
truncated\_string = encoding.decode(encoded\_string[:max\_tokens])
if print\_warning and len(encoded\_string) \> max\_tokens:
print(f"Warning: Truncated string from {len(encoded\_string)} tokens to {max\_tokens} tokens.")
return truncated\_string
def split\_strings\_from\_subsection(
subsection: tuple[list[str], str],
max\_tokens: int = 1000,
model: str = GPT\_MODEL,
max\_recursion: int = 5,
) -\> list[str]:
"""
Split a subsection into a list of subsections, each with no more than max\_tokens.
Each subsection is a tuple of parent titles [H1, H2, ...] and text (str).
"""
titles, text = subsection
string = "\\n\\n".join(titles + [text])
num\_tokens\_in\_string = num\_tokens(string)
# if length is fine, return string
if num\_tokens\_in\_string \<= max\_tokens:
return [string]
# if recursion hasn't found a split after X iterations, just truncate
elif max\_recursion == 0:
return [truncated\_string(string, model=model, max\_tokens=max\_tokens)]
# otherwise, split in half and recurse
else:
titles, text = subsection
for delimiter in ["\\n\\n", "\\n", ". "]:
left, right = halved\_by\_delimiter(text, delimiter=delimiter)
if left == "" or right == "":
# if either half is empty, retry with a more fine-grained delimiter
continue
else:
# recurse on each half
results = []
for half in [left, right]:
half\_subsection = (titles, half)
half\_strings = split\_strings\_from\_subsection(
half\_subsection,
max\_tokens=max\_tokens,
model=model,
max\_recursion=max\_recursion - 1,
)
results.extend(half\_strings)
return results
# otherwise no split was found, so just truncate (should be very rare)
return [truncated\_string(string, model=model, max\_tokens=max\_tokens)]`
```
```
`# split sections into chunks
MAX\_TOKENS = 1600
wikipedia\_strings = []
for section in wikipedia\_sections:
wikipedia\_strings.extend(split\_strings\_from\_subsection(section, max\_tokens=MAX\_TOKENS))
print(f"{len(wikipedia\_sections)} Wikipedia sections split into {len(wikipedia\_strings)} strings.")`
```
```
`1749 Wikipedia sections split into 2052 strings.`
```
```
`# print example data
print(wikipedia\_strings[1])`
```
```
`Concerns and controversies at the 2022 Winter Olympics
==Criticism of host selection==
American sportscaster [[Bob Costas]] criticized the [[International Olympic Committee]]'s (IOC) decision to award the games to China saying "The IOC deserves all of the disdain and disgust that comes their way for going back to China yet again" referencing China's human rights record.
After winning two gold medals and returning to his home country of Sweden skater [[Nils van der Poel]] criticized the IOC's selection of China as the host saying "I think it is extremely irresponsible to give it to a country that violates human rights as blatantly as the Chinese regime is doing." He had declined to criticize China before leaving for the games saying "I don't think it would be particularly wise for me to criticize the system I'm about to transition to, if I want to live a long and productive life."`
```
## 3. Embed document chunks
Now that we’ve split our library into shorter self-contained strings, we can compute embeddings for each.
(For large embedding jobs, use a script like [api\_request\_parallel\_processor.py](https://github.com/openai/openai-cookbook/blob/main/examples/api_request_parallel_processor.py) to parallelize requests while throttling to stay under rate limits.)
```
`EMBEDDING\_MODEL = "text-embedding-3-small"
BATCH\_SIZE = 1000 # you can submit up to 2048 embedding inputs per request
embeddings = []
for batch\_start in range(0, len(wikipedia\_strings), BATCH\_SIZE):
batch\_end = batch\_start + BATCH\_SIZE
batch = wikipedia\_strings[batch\_start:batch\_end]
print(f"Batch {batch\_start} to {batch\_end-1}")
response = client.embeddings.create(model=EMBEDDING\_MODEL, input=batch)
for i, be in enumerate(response.data):
assert i == be.index # double check embeddings are in same order as input
batch\_embeddings = [e.embedding for e in response.data]
embeddings.extend(batch\_embeddings)
df = pd.DataFrame({"text": wikipedia\_strings, "embedding": embeddings})`
```
```
`Batch 0 to 999
Batch 1000 to 1999
Batch 2000 to 2999`
```
## 4. Store document chunks and embeddings
Because this example only uses a few thousand strings, we’ll store them in a CSV file.
(For larger datasets, use a vector database, which will be more performant.)
```
`# save document chunks and embeddings
SAVE\_PATH = "data/winter\_olympics\_2022.csv"
df.to\_csv(SAVE\_PATH, index=False)`
```