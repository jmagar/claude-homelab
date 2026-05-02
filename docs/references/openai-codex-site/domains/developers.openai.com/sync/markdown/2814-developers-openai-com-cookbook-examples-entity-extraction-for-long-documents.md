Long document content extraction
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
Feb 20, 2023
# Long document content extraction
This recipe is archived and may reference outdated models or APIs.
[ CJ ](https://twitter.com/colintjarvis)
[ Colin Jarvis
(OpenAI)
](https://twitter.com/colintjarvis)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Entity_extraction_for_long_documents.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Entity_extraction_for_long_documents.ipynb)
GPT-3 can help us extract key figures, dates or other bits of important content from documents that are too big to fit into the context window. One approach for solving this is to chunk the document up and process each chunk separately, before combining into one list of answers.
In this notebook we’ll run through this approach:
* Load in a long PDF and pull the text out
* Create a prompt to be used to extract key bits of information
* Chunk up our document and process each chunk to pull any answers out
* Combine them at the end
* This simple approach will then be extended to three more difficult questions
## Approach
* **Setup**: Take a PDF, a Formula 1 Financial Regulation document on Power Units, and extract the text from it for entity extraction. We’ll use this to try to extract answers that are buried in the content.
* **Simple Entity Extraction**: Extract key bits of information from chunks of a document by:
* Creating a template prompt with our questions and an example of the format it expects
* Create a function to take a chunk of text as input, combine with the prompt and get a response
* Run a script to chunk the text, extract answers and output them for parsing
* **Complex Entity Extraction**: Ask some more difficult questions which require tougher reasoning to work out
## Setup
```
`!pip install textract
!pip install tiktoken`
```
```
`import textract
import os
import openai
import tiktoken
client = openai.OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))
# Extract the raw text from each PDF using textract
text = textract.process('data/fia\_f1\_power\_unit\_financial\_regulations\_issue\_1\_-\_2022-08-16.pdf', method='pdfminer').decode('utf-8')
clean\_text = text.replace(" ", " ").replace("\\n", "; ").replace(';',' ')`
```
## Simple Entity Extraction
```
`# Example prompt -
document = '\<document\>'
template\_prompt=f'''Extract key pieces of information from this regulation document.
If a particular piece of information is not present, output \\"Not specified\\".
When you extract a key piece of information, include the closest page number.
Use the following format:\\n0. Who is the author\\n1. What is the amount of the "Power Unit Cost Cap" in USD, GBP and EUR\\n2. What is the value of External Manufacturing Costs in USD\\n3. What is the Capital Expenditure Limit in USD\\n\\nDocument: \\"\\"\\"\<document\>\\"\\"\\"\\n\\n0. Who is the author: Tom Anderson (Page 1)\\n1.'''
print(template\_prompt)`
```
```
`Extract key pieces of information from this regulation document.
If a particular piece of information is not present, output "Not specified".
When you extract a key piece of information, include the closest page number.
Use the following format:
0. Who is the author
1. What is the amount of the "Power Unit Cost Cap" in USD, GBP and EUR
2. What is the value of External Manufacturing Costs in USD
3. What is the Capital Expenditure Limit in USD
Document: """\<document\>"""
0. Who is the author: Tom Anderson (Page 1)
1.`
```
```
`# Split a text into smaller chunks of size n, preferably ending at the end of a sentence
def create\_chunks(text, n, tokenizer):
tokens = tokenizer.encode(text)
"""Yield successive n-sized chunks from text."""
i = 0
while i \< len(tokens):
# Find the nearest end of sentence within a range of 0.5 \* n and 1.5 \* n tokens
j = min(i + int(1.5 \* n), len(tokens))
while j \> i + int(0.5 \* n):
# Decode the tokens and check for full stop or newline
chunk = tokenizer.decode(tokens[i:j])
if chunk.endswith(".") or chunk.endswith("\\n"):
break
j -= 1
# If no end of sentence found, use n tokens as the chunk size
if j == i + int(0.5 \* n):
j = min(i + n, len(tokens))
yield tokens[i:j]
i = j
def extract\_chunk(document,template\_prompt):
prompt = template\_prompt.replace('\<document\>',document)
messages = [
{"role": "system", "content": "You help extract information from documents."},
{"role": "user", "content": prompt}
]
response = client.chat.completions.create(
model='gpt-4',
messages=messages,
temperature=0,
max\_tokens=1500,
top\_p=1,
frequency\_penalty=0,
presence\_penalty=0
)
return "1." + response.choices[0].message.content`
```
```
`# Initialise tokenizer
tokenizer = tiktoken.get\_encoding("cl100k\_base")
results = []
chunks = create\_chunks(clean\_text,1000,tokenizer)
text\_chunks = [tokenizer.decode(chunk) for chunk in chunks]
for chunk in text\_chunks:
results.append(extract\_chunk(chunk,template\_prompt))
#print(chunk)
print(results[-1])`
```
```
`groups = [r.split('\\n') for r in results]
# zip the groups together
zipped = list(zip(\*groups))
zipped = [x for y in zipped for x in y if "Not specified" not in x and "\_\_" not in x]
zipped`
```
```
`['1. What is the amount of the "Power Unit Cost Cap" in USD, GBP and EUR: USD 95,000,000 (Page 2); GBP 76,459,000 (Page 2); EUR 90,210,000 (Page 2)',
'2. What is the value of External Manufacturing Costs in USD: US Dollars 20,000,000 in respect of each of the Full Year Reporting Periods ending on 31 December 2023, 31 December 2024 and 31 December 2025, adjusted for Indexation (Page 10)',
'3. What is the Capital Expenditure Limit in USD: US Dollars 30,000,000 (Page 32)']`
```
## Complex Entity Extraction
```
`# Example prompt -
template\_prompt=f'''Extract key pieces of information from this regulation document.
If a particular piece of information is not present, output \\"Not specified\\".
When you extract a key piece of information, include the closest page number.
Use the following format:\\n0. Who is the author\\n1. How is a Minor Overspend Breach calculated\\n2. How is a Major Overspend Breach calculated\\n3. Which years do these financial regulations apply to\\n\\nDocument: \\"\\"\\"\<document\>\\"\\"\\"\\n\\n0. Who is the author: Tom Anderson (Page 1)\\n1.'''
print(template\_prompt)`
```
```
`Extract key pieces of information from this regulation document.
If a particular piece of information is not present, output "Not specified".
When you extract a key piece of information, include the closest page number.
Use the following format:
0. Who is the author
1. How is a Minor Overspend Breach calculated
2. How is a Major Overspend Breach calculated
3. Which years do these financial regulations apply to
Document: """\<document\>"""
0. Who is the author: Tom Anderson (Page 1)
1.`
```
```
`results = []
for chunk in text\_chunks:
results.append(extract\_chunk(chunk,template\_prompt))
groups = [r.split('\\n') for r in results]
# zip the groups together
zipped = list(zip(\*groups))
zipped = [x for y in zipped for x in y if "Not specified" not in x and "\_\_" not in x]
zipped`
```
```
`['1. How is a Minor Overspend Breach calculated: A Minor Overspend Breach arises when a Power Unit Manufacturer submits its Full Year Reporting Documentation and Relevant Costs reported therein exceed the Power Unit Cost Cap by less than 5% (Page 24)',
'2. How is a Major Overspend Breach calculated: A Material Overspend Breach arises when a Power Unit Manufacturer submits its Full Year Reporting Documentation and Relevant Costs reported therein exceed the Power Unit Cost Cap by 5% or more (Page 25)',
'3. Which years do these financial regulations apply to: 2026 onwards (Page 1)',
'3. Which years do these financial regulations apply to: 2023, 2024, 2025, 2026 and subsequent Full Year Reporting Periods (Page 2)',
'3. Which years do these financial regulations apply to: 2022-2025 (Page 6)',
'3. Which years do these financial regulations apply to: 2023, 2024, 2025, 2026 and subsequent Full Year Reporting Periods (Page 10)',
'3. Which years do these financial regulations apply to: 2022 (Page 14)',
'3. Which years do these financial regulations apply to: 2022 (Page 16)',
'3. Which years do these financial regulations apply to: 2022 (Page 19)',
'3. Which years do these financial regulations apply to: 2022 (Page 21)',
'3. Which years do these financial regulations apply to: 2026 onwards (Page 26)',
'3. Which years do these financial regulations apply to: 2026 (Page 2)',
'3. Which years do these financial regulations apply to: 2022 (Page 30)',
'3. Which years do these financial regulations apply to: 2022 (Page 32)',
'3. Which years do these financial regulations apply to: 2023, 2024 and 2025 (Page 1)',
'3. Which years do these financial regulations apply to: 2022 (Page 37)',
'3. Which years do these financial regulations apply to: 2026 onwards (Page 40)',
'3. Which years do these financial regulations apply to: 2022 (Page 1)',
'3. Which years do these financial regulations apply to: 2026 to 2030 seasons (Page 46)',
'3. Which years do these financial regulations apply to: 2022 (Page 47)',
'3. Which years do these financial regulations apply to: 2022 (Page 1)',
'3. Which years do these financial regulations apply to: 2022 (Page 1)',
'3. Which years do these financial regulations apply to: 2022 (Page 56)',
'3. Which years do these financial regulations apply to: 2022 (Page 1)',
'3. Which years do these financial regulations apply to: 2022 (Page 16)',
'3. Which years do these financial regulations apply to: 2022 (Page 16)']`
```
## Consolidation
We’ve been able to extract the first two answers safely, while the third was confounded by the date that appeared on every page, though the correct answer is in there as well.
To tune this further you can consider experimenting with:
* A more descriptive or specific prompt
* If you have sufficient training data, fine-tuning a model to find a set of outputs very well
* The way you chunk your data - we have gone for 1000 tokens with no overlap, but more intelligent chunking that breaks info into sections, cuts by tokens or similar may get better results
However, with minimal tuning we have now answered 6 questions of varying difficulty using the contents of a long document, and have a reusable approach that we can apply to any long document requiring entity extraction. Look forward to seeing what you can do with this!