Get embeddings from dataset
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
# Get embeddings from dataset
This recipe is archived and may reference outdated models or APIs.
[ BO ](https://github.com/BorisPower)[ TS ](https://github.com/ted-at-openai)
[ BorisPower , ](https://github.com/BorisPower)[ Ted Sanders
(OpenAI)
](https://github.com/ted-at-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Get_embeddings_from_dataset.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Get_embeddings_from_dataset.ipynb)
This notebook gives an example on how to get embeddings from a large dataset.
## 1. Load the dataset
The dataset used in this example is [fine-food reviews](https://www.kaggle.com/snap/amazon-fine-food-reviews) from Amazon. The dataset contains a total of 568,454 food reviews Amazon users left up to October 2012. We will use a subset of this dataset, consisting of 1,000 most recent reviews for illustration purposes. The reviews are in English and tend to be positive or negative. Each review has a ProductId, UserId, Score, review title (Summary) and review body (Text).
We will combine the review summary and review text into a single combined text. The model will encode this combined text and it will output a single vector embedding.
To run this notebook, you will need to install: pandas, openai, transformers, plotly, matplotlib, scikit-learn, torch (transformer dep), torchvision, and scipy.
```
`import pandas as pd
import tiktoken
from utils.embeddings\_utils import get\_embedding`
```
```
`embedding\_model = "text-embedding-3-small"
embedding\_encoding = "cl100k\_base"
max\_tokens = 8000 # the maximum for text-embedding-3-small is 8191`
```
```
`# load & inspect dataset
input\_datapath = "data/fine\_food\_reviews\_1k.csv" # to save space, we provide a pre-filtered dataset
df = pd.read\_csv(input\_datapath, index\_col=0)
df = df[["Time", "ProductId", "UserId", "Score", "Summary", "Text"]]
df = df.dropna()
df["combined"] = (
"Title: " + df.Summary.str.strip() + "; Content: " + df.Text.str.strip()
)
df.head(2)`
```
||Time|ProductId|UserId|Score|Summary|Text|combined|
|0|1351123200|B003XPF9BO|A3R7JR3FMEBXQB|5|where does one start...and stop... with a tre...|Wanted to save some to bring to my Chicago fam...|Title: where does one start...and stop... wit...|
|1|1351123200|B003JK537S|A3JBPC3WFUT5ZP|1|Arrived in pieces|Not pleased at all. When I opened the box, mos...|Title: Arrived in pieces; Content: Not pleased...|
```
`# subsample to 1k most recent reviews and remove samples that are too long
top\_n = 1000
df = df.sort\_values("Time").tail(top\_n \* 2) # first cut to first 2k entries, assuming less than half will be filtered out
df.drop("Time", axis=1, inplace=True)
encoding = tiktoken.get\_encoding(embedding\_encoding)
# omit reviews that are too long to embed
df["n\_tokens"] = df.combined.apply(lambda x: len(encoding.encode(x)))
df = df[df.n\_tokens \<= max\_tokens].tail(top\_n)
len(df)`
```
```
`1000`
```
## 2. Get embeddings and save them for future reuse
```
`# Ensure you have your API key set in your environment per the README: https://github.com/openai/openai-python#usage
# This may take a few minutes
df["embedding"] = df.combined.apply(lambda x: get\_embedding(x, model=embedding\_model))
df.to\_csv("data/fine\_food\_reviews\_with\_embeddings\_1k.csv")`
```
```
`a = get\_embedding("hi", model=embedding\_model)`
```