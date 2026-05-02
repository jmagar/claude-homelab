Code search using embeddings
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
# Code search using embeddings
This recipe is archived and may reference outdated models or APIs.
[ BO ](https://github.com/BorisPower)[ LO ](https://github.com/logankilpatrick)[ EL ](https://github.com/eli64s)
[ BorisPower , ](https://github.com/BorisPower)[ logankilpatrick , ](https://github.com/logankilpatrick)[ eli64s ](https://github.com/eli64s)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Code_search_using_embeddings.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Code_search_using_embeddings.ipynb)
## Code search using embeddings
This notebook shows how Ada embeddings can be used to implement semantic code search. For this demonstration, we use our own [openai-python code repository](https://github.com/openai/openai-python). We implement a simple version of file parsing and extracting of functions from python files, which can be embedded, indexed, and queried.
### Helper Functions
We first setup some simple parsing functions that allow us to extract important information from our codebase.
```
`import pandas as pd
from pathlib import Path
DEF\_PREFIXES = ['def ', 'async def ']
NEWLINE = '\\n'
def get\_function\_name(code):
"""
Extract function name from a line beginning with 'def' or 'async def'.
"""
for prefix in DEF\_PREFIXES:
if code.startswith(prefix):
return code[len(prefix): code.index('(')]
def get\_until\_no\_space(all\_lines, i):
"""
Get all lines until a line outside the function definition is found.
"""
ret = [all\_lines[i]]
for j in range(i + 1, len(all\_lines)):
if len(all\_lines[j]) == 0 or all\_lines[j][0] in [' ', '\\t', ')']:
ret.append(all\_lines[j])
else:
break
return NEWLINE.join(ret)
def get\_functions(filepath):
"""
Get all functions in a Python file.
"""
with open(filepath, 'r') as file:
all\_lines = file.read().replace('\\r', NEWLINE).split(NEWLINE)
for i, l in enumerate(all\_lines):
for prefix in DEF\_PREFIXES:
if l.startswith(prefix):
code = get\_until\_no\_space(all\_lines, i)
function\_name = get\_function\_name(code)
yield {
'code': code,
'function\_name': function\_name,
'filepath': filepath,
}
break
def extract\_functions\_from\_repo(code\_root):
"""
Extract all .py functions from the repository.
"""
code\_files = list(code\_root.glob('\*\*/\*.py'))
num\_files = len(code\_files)
print(f'Total number of .py files: {num\_files}')
if num\_files == 0:
print('Verify openai-python repo exists and code\_root is set correctly.')
return None
all\_funcs = [
func
for code\_file in code\_files
for func in get\_functions(str(code\_file))
]
num\_funcs = len(all\_funcs)
print(f'Total number of functions extracted: {num\_funcs}')
return all\_funcs`
```
# Data Loading
We’ll first load the openai-python folder and extract the needed information using the functions we defined above.
```
`# Set user root directory to the 'openai-python' repository
root\_dir = Path.home()
# Assumes the 'openai-python' repository exists in the user's root directory
code\_root = root\_dir / 'openai-python'
# Extract all functions from the repository
all\_funcs = extract\_functions\_from\_repo(code\_root)`
```
```
`Total number of .py files: 51
Total number of functions extracted: 97`
```
Now that we have our content, we can pass the data to the `text-embedding-3-small` model and get back our vector embeddings.
```
`from utils.embeddings\_utils import get\_embedding
df = pd.DataFrame(all\_funcs)
df['code\_embedding'] = df['code'].apply(lambda x: get\_embedding(x, model='text-embedding-3-small'))
df['filepath'] = df['filepath'].map(lambda x: Path(x).relative\_to(code\_root))
df.to\_csv("data/code\_search\_openai-python.csv", index=False)
df.head()`
```
||code|function\_name|filepath|code\_embedding|
|0|def \_console\_log\_level():\\n if openai.log i...|\_console\_log\_level|openai/util.py|[0.005937571171671152, 0.05450401455163956, 0....|
|1|def log\_debug(message, \*\*params):\\n msg = l...|log\_debug|openai/util.py|[0.017557814717292786, 0.05647840350866318, -0...|
|2|def log\_info(message, \*\*params):\\n msg = lo...|log\_info|openai/util.py|[0.022524144500494003, 0.06219055876135826, -0...|
|3|def log\_warn(message, \*\*params):\\n msg = lo...|log\_warn|openai/util.py|[0.030524108558893204, 0.0667714849114418, -0....|
|4|def logfmt(props):\\n def fmt(key, val):\\n ...|logfmt|openai/util.py|[0.05337328091263771, 0.03697286546230316, -0....|
### Testing
Let’s test our endpoint with some simple queries. If you’re familiar with the `openai-python` repository, you’ll see that we’re able to easily find functions we’re looking for only a simple English description.
We define a search\_functions method that takes our data that contains our embeddings, a query string, and some other configuration options. The process of searching our database works like such:
1. We first embed our query string (code\_query) with `text-embedding-3-small`. The reasoning here is that a query string like ‘a function that reverses a string’ and a function like ‘def reverse(string): return string[::-1]’ will be very similar when embedded.
2. We then calculate the cosine similarity between our query string embedding and all data points in our database. This gives a distance between each point and our query.
3. We finally sort all of our data points by their distance to our query string and return the number of results requested in the function parameters.
```
`from utils.embeddings\_utils import cosine\_similarity
def search\_functions(df, code\_query, n=3, pprint=True, n\_lines=7):
embedding = get\_embedding(code\_query, model='text-embedding-3-small')
df['similarities'] = df.code\_embedding.apply(lambda x: cosine\_similarity(x, embedding))
res = df.sort\_values('similarities', ascending=False).head(n)
if pprint:
for r in res.iterrows():
print(f"{r[1].filepath}:{r[1].function\_name} score={round(r[1].similarities, 3)}")
print("\\n".join(r[1].code.split("\\n")[:n\_lines]))
print('-' \* 70)
return res`
```
```
`res = search\_functions(df, 'fine-tuning input data validation logic', n=3)`
```
```
`openai/validators.py:format\_inferrer\_validator score=0.453
def format\_inferrer\_validator(df):
"""
This validator will infer the likely fine-tuning format of the data, and display it to the user if it is classification.
It will also suggest to use ada and explain train/validation split benefits.
"""
ft\_type = infer\_task\_type(df)
immediate\_msg = None
----------------------------------------------------------------------
openai/validators.py:infer\_task\_type score=0.37
def infer\_task\_type(df):
"""
Infer the likely fine-tuning task type from the data
"""
CLASSIFICATION\_THRESHOLD = 3 # min\_average instances of each class
if sum(df.prompt.str.len()) == 0:
return "open-ended generation"
----------------------------------------------------------------------
openai/validators.py:apply\_validators score=0.369
def apply\_validators(
df,
fname,
remediation,
validators,
auto\_accept,
write\_out\_file\_func,
----------------------------------------------------------------------`
```
```
`res = search\_functions(df, 'find common suffix', n=2, n\_lines=10)`
```
```
`openai/validators.py:get\_common\_xfix score=0.487
def get\_common\_xfix(series, xfix="suffix"):
"""
Finds the longest common suffix or prefix of all the values in a series
"""
common\_xfix = ""
while True:
common\_xfixes = (
series.str[-(len(common\_xfix) + 1) :]
if xfix == "suffix"
else series.str[: len(common\_xfix) + 1]
----------------------------------------------------------------------
openai/validators.py:common\_completion\_suffix\_validator score=0.449
def common\_completion\_suffix\_validator(df):
"""
This validator will suggest to add a common suffix to the completion if one doesn't already exist in case of classification or conditional generation.
"""
error\_msg = None
immediate\_msg = None
optional\_msg = None
optional\_fn = None
ft\_type = infer\_task\_type(df)
----------------------------------------------------------------------`
```
```
`res = search\_functions(df, 'Command line interface for fine-tuning', n=1, n\_lines=20)`
```
```
`openai/cli.py:tools\_register score=0.391
def tools\_register(parser):
subparsers = parser.add\_subparsers(
title="Tools", help="Convenience client side tools"
)
def help(args):
parser.print\_help()
parser.set\_defaults(func=help)
sub = subparsers.add\_parser("fine\_tunes.prepare\_data")
sub.add\_argument(
"-f",
"--file",
required=True,
help="JSONL, JSON, CSV, TSV, TXT or XLSX file containing prompt-completion examples to be analyzed."
"This should be the local file path.",
)
sub.add\_argument(
"-q",
----------------------------------------------------------------------`
```