Customizing embeddings
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
# Customizing embeddings
This recipe is archived and may reference outdated models or APIs.
[ TS ](https://github.com/ted-at-openai)[ BO ](https://github.com/BorisPower)
[ Ted Sanders
(OpenAI)
, ](https://github.com/ted-at-openai)[ BorisPower ](https://github.com/BorisPower)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Customizing_embeddings.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Customizing_embeddings.ipynb)
This notebook demonstrates one way to customize OpenAI embeddings to a particular task.
The input is training data in the form of [text\_1, text\_2, label] where label is +1 if the pairs are similar and -1 if the pairs are dissimilar.
The output is a matrix that you can use to multiply your embeddings. The product of this multiplication is a ‘custom embedding’ that will better emphasize aspects of the text relevant to your use case. In binary classification use cases, we’ve seen error rates drop by as much as 50%.
In the following example, I use 1,000 sentence pairs picked from the SNLI corpus. Each pair of sentences are logically entailed (i.e., one implies the other). These pairs are our positives (label = 1). We generate synthetic negatives by combining sentences from different pairs, which are presumed to not be logically entailed (label = -1).
For a clustering use case, you can generate positives by creating pairs from texts in the same clusters and generate negatives by creating pairs from sentences in different clusters.
With other data sets, we have seen decent improvement with as little as \~100 training examples. Of course, performance will be better with more examples.
# 0. Imports
```
`# imports
from typing import List, Tuple # for type hints
import numpy as np # for manipulating arrays
import pandas as pd # for manipulating data in dataframes
import pickle # for saving the embeddings cache
import plotly.express as px # for plots
import random # for generating run IDs
from sklearn.model\_selection import train\_test\_split # for splitting train & test data
import torch # for matrix optimization
from utils.embeddings\_utils import get\_embedding, cosine\_similarity # for embeddings`
```
## 1. Inputs
Most inputs are here. The key things to change are where to load your datset from, where to save a cache of embeddings to, and which embedding engine you want to use.
Depending on how your data is formatted, you’ll want to rewrite the process\_input\_data function.
```
`# input parameters
embedding\_cache\_path = "data/snli\_embedding\_cache.pkl" # embeddings will be saved/loaded here
default\_embedding\_engine = "text-embedding-3-small"
num\_pairs\_to\_embed = 1000 # 1000 is arbitrary
local\_dataset\_path = "data/snli\_1.0\_train\_2k.csv" # download from: https://nlp.stanford.edu/projects/snli/
def process\_input\_data(df: pd.DataFrame) -\> pd.DataFrame:
# you can customize this to preprocess your own dataset
# output should be a dataframe with 3 columns: text\_1, text\_2, label (1 for similar, -1 for dissimilar)
df["label"] = df["gold\_label"]
df = df[df["label"].isin(["entailment"])]
df["label"] = df["label"].apply(lambda x: {"entailment": 1, "contradiction": -1}[x])
df = df.rename(columns={"sentence1": "text\_1", "sentence2": "text\_2"})
df = df[["text\_1", "text\_2", "label"]]
df = df.head(num\_pairs\_to\_embed)
return df`
```
## 2. Load and process input data
```
`# load data
df = pd.read\_csv(local\_dataset\_path)
# process input data
df = process\_input\_data(df) # this demonstrates training data containing only positives
# view data
df.head()`
```
```
`/var/folders/r4/x3kdvs816995fnnph2gdpwp40000gn/T/ipykernel\_17509/1977422881.py:13: SettingWithCopyWarning:
A value is trying to be set on a copy of a slice from a DataFrame.
Try using .loc[row\_indexer,col\_indexer] = value instead
See the caveats in the documentation: https://pandas.pydata.org/pandas-docs/stable/user\_guide/indexing.html#returning-a-view-versus-a-copy
df["label"] = df["label"].apply(lambda x: {"entailment": 1, "contradiction": -1}[x])`
```
||text\_1|text\_2|label|
|2|A person on a horse jumps over a broken down a...|A person is outdoors, on a horse.|1|
|4|Children smiling and waving at camera|There are children present|1|
|7|A boy is jumping on skateboard in the middle o...|The boy does a skateboarding trick.|1|
|14|Two blond women are hugging one another.|There are women showing affection.|1|
|17|A few people in a restaurant setting, one of t...|The diners are at a restaurant.|1|
## 3. Split data into training test sets
Note that it’s important to split data into training and test sets *before* generating synethetic negatives or positives. You don’t want any text strings in the training data to show up in the test data. If there’s contamination, the test metrics will look better than they’ll actually be in production.
```
`# split data into train and test sets
test\_fraction = 0.5 # 0.5 is fairly arbitrary
random\_seed = 123 # random seed is arbitrary, but is helpful in reproducibility
train\_df, test\_df = train\_test\_split(
df, test\_size=test\_fraction, stratify=df["label"], random\_state=random\_seed
)
train\_df.loc[:, "dataset"] = "train"
test\_df.loc[:, "dataset"] = "test"`
```
## 4. Generate synthetic negatives
This is another piece of the code that you will need to modify to match your use case.
If you have data with positives and negatives, you can skip this section.
If you have data with only positives, you can mostly keep it as is, where it generates negatives only.
If you have multiclass data, you will want to generate both positives and negatives. The positives can be pairs of text that share labels, and the negatives can be pairs of text that do not share labels.
The final output should be a dataframe with text pairs, where each pair is labeled -1 or 1.
```
`# generate negatives
def dataframe\_of\_negatives(dataframe\_of\_positives: pd.DataFrame) -\> pd.DataFrame:
"""Return dataframe of negative pairs made by combining elements of positive pairs."""
texts = set(dataframe\_of\_positives["text\_1"].values) | set(
dataframe\_of\_positives["text\_2"].values
)
all\_pairs = {(t1, t2) for t1 in texts for t2 in texts if t1 \< t2}
positive\_pairs = set(
tuple(text\_pair)
for text\_pair in dataframe\_of\_positives[["text\_1", "text\_2"]].values
)
negative\_pairs = all\_pairs - positive\_pairs
df\_of\_negatives = pd.DataFrame(list(negative\_pairs), columns=["text\_1", "text\_2"])
df\_of\_negatives["label"] = -1
return df\_of\_negatives`
```
```
`negatives\_per\_positive = (
1 # it will work at higher values too, but more data will be slower
)
# generate negatives for training dataset
train\_df\_negatives = dataframe\_of\_negatives(train\_df)
train\_df\_negatives["dataset"] = "train"
# generate negatives for test dataset
test\_df\_negatives = dataframe\_of\_negatives(test\_df)
test\_df\_negatives["dataset"] = "test"
# sample negatives and combine with positives
train\_df = pd.concat(
[
train\_df,
train\_df\_negatives.sample(
n=len(train\_df) \* negatives\_per\_positive, random\_state=random\_seed
),
]
)
test\_df = pd.concat(
[
test\_df,
test\_df\_negatives.sample(
n=len(test\_df) \* negatives\_per\_positive, random\_state=random\_seed
),
]
)
df = pd.concat([train\_df, test\_df])`
```
## 5. Calculate embeddings and cosine similarities
Here, I create a cache to save the embeddings. This is handy so that you don’t have to pay again if you want to run the code again.
```
`# establish a cache of embeddings to avoid recomputing
# cache is a dict of tuples (text, engine) -\> embedding
try:
with open(embedding\_cache\_path, "rb") as f:
embedding\_cache = pickle.load(f)
except FileNotFoundError:
precomputed\_embedding\_cache\_path = "https://cdn.openai.com/API/examples/data/snli\_embedding\_cache.pkl"
embedding\_cache = pd.read\_pickle(precomputed\_embedding\_cache\_path)
# this function will get embeddings from the cache and save them there afterward
def get\_embedding\_with\_cache(
text: str,
engine: str = default\_embedding\_engine,
embedding\_cache: dict = embedding\_cache,
embedding\_cache\_path: str = embedding\_cache\_path,
) -\> list:
if (text, engine) not in embedding\_cache.keys():
# if not in cache, call API to get embedding
embedding\_cache[(text, engine)] = get\_embedding(text, engine)
# save embeddings cache to disk after each update
with open(embedding\_cache\_path, "wb") as embedding\_cache\_file:
pickle.dump(embedding\_cache, embedding\_cache\_file)
return embedding\_cache[(text, engine)]
# create column of embeddings
for column in ["text\_1", "text\_2"]:
df[f"{column}\_embedding"] = df[column].apply(get\_embedding\_with\_cache)
# create column of cosine similarity between embeddings
df["cosine\_similarity"] = df.apply(
lambda row: cosine\_similarity(row["text\_1\_embedding"], row["text\_2\_embedding"]),
axis=1,
)`
```
## 6. Plot distribution of cosine similarity
Here we measure similarity of text using cosine similarity. In our experience, most distance functions (L1, L2, cosine similarity) all work about the same. Note that our embeddings are already normalized to length 1, so cosine similarity is equivalent to dot product.
The graphs show how much the overlap there is between the distribution of cosine similarities for similar and dissimilar pairs. If there is a high amount of overlap, that means there are some dissimilar pairs with greater cosine similarity than some similar pairs.
The accuracy I compute is the accuracy of a simple rule that predicts ‘similar (1)’ if the cosine similarity is above some threshold X and otherwise predicts ‘dissimilar (0)‘.
```
`# calculate accuracy (and its standard error) of predicting label=1 if similarity\>x
# x is optimized by sweeping from -1 to 1 in steps of 0.01
def accuracy\_and\_se(cosine\_similarity: float, labeled\_similarity: int) -\> Tuple[float]:
accuracies = []
for threshold\_thousandths in range(-1000, 1000, 1):
threshold = threshold\_thousandths / 1000
total = 0
correct = 0
for cs, ls in zip(cosine\_similarity, labeled\_similarity):
total += 1
if cs \> threshold:
prediction = 1
else:
prediction = -1
if prediction == ls:
correct += 1
accuracy = correct / total
accuracies.append(accuracy)
a = max(accuracies)
n = len(cosine\_similarity)
standard\_error = (a \* (1 - a) / n) \*\* 0.5 # standard error of binomial
return a, standard\_error
# check that training and test sets are balanced
px.histogram(
df,
x="cosine\_similarity",
color="label",
barmode="overlay",
width=500,
facet\_row="dataset",
).show()
for dataset in ["train", "test"]:
data = df[df["dataset"] == dataset]
a, se = accuracy\_and\_se(data["cosine\_similarity"], data["label"])
print(f"{dataset} accuracy: {a:0.1%} ± {1.96 \* se:0.1%}")`
```
```
`train accuracy: 89.1% ± 2.4%
test accuracy: 88.8% ± 2.4%`
```
## 7. Optimize the matrix using the training data provided
```
`def embedding\_multiplied\_by\_matrix(
embedding: List[float], matrix: torch.tensor
) -\> np.array:
embedding\_tensor = torch.tensor(embedding).float()
modified\_embedding = embedding\_tensor @ matrix
modified\_embedding = modified\_embedding.detach().numpy()
return modified\_embedding
# compute custom embeddings and new cosine similarities
def apply\_matrix\_to\_embeddings\_dataframe(matrix: torch.tensor, df: pd.DataFrame):
for column in ["text\_1\_embedding", "text\_2\_embedding"]:
df[f"{column}\_custom"] = df[column].apply(
lambda x: embedding\_multiplied\_by\_matrix(x, matrix)
)
df["cosine\_similarity\_custom"] = df.apply(
lambda row: cosine\_similarity(
row["text\_1\_embedding\_custom"], row["text\_2\_embedding\_custom"]
),
axis=1,
)`
```
```
`def optimize\_matrix(
modified\_embedding\_length: int = 2048, # in my brief experimentation, bigger was better (2048 is length of babbage encoding)
batch\_size: int = 100,
max\_epochs: int = 100,
learning\_rate: float = 100.0, # seemed to work best when similar to batch size - feel free to try a range of values
dropout\_fraction: float = 0.0, # in my testing, dropout helped by a couple percentage points (definitely not necessary)
df: pd.DataFrame = df,
print\_progress: bool = True,
save\_results: bool = True,
) -\> torch.tensor:
"""Return matrix optimized to minimize loss on training data."""
run\_id = random.randint(0, 2 \*\* 31 - 1) # (range is arbitrary)
# convert from dataframe to torch tensors
# e is for embedding, s for similarity label
def tensors\_from\_dataframe(
df: pd.DataFrame,
embedding\_column\_1: str,
embedding\_column\_2: str,
similarity\_label\_column: str,
) -\> Tuple[torch.tensor]:
e1 = np.stack(np.array(df[embedding\_column\_1].values))
e2 = np.stack(np.array(df[embedding\_column\_2].values))
s = np.stack(np.array(df[similarity\_label\_column].astype("float").values))
e1 = torch.from\_numpy(e1).float()
e2 = torch.from\_numpy(e2).float()
s = torch.from\_numpy(s).float()
return e1, e2, s
e1\_train, e2\_train, s\_train = tensors\_from\_dataframe(
df[df["dataset"] == "train"], "text\_1\_embedding", "text\_2\_embedding", "label"
)
e1\_test, e2\_test, s\_test = tensors\_from\_dataframe(
df[df["dataset"] == "test"], "text\_1\_embedding", "text\_2\_embedding", "label"
)
# create dataset and loader
dataset = torch.utils.data.TensorDataset(e1\_train, e2\_train, s\_train)
train\_loader = torch.utils.data.DataLoader(
dataset, batch\_size=batch\_size, shuffle=True
)
# define model (similarity of projected embeddings)
def model(embedding\_1, embedding\_2, matrix, dropout\_fraction=dropout\_fraction):
e1 = torch.nn.functional.dropout(embedding\_1, p=dropout\_fraction)
e2 = torch.nn.functional.dropout(embedding\_2, p=dropout\_fraction)
modified\_embedding\_1 = e1 @ matrix # @ is matrix multiplication
modified\_embedding\_2 = e2 @ matrix
similarity = torch.nn.functional.cosine\_similarity(
modified\_embedding\_1, modified\_embedding\_2
)
return similarity
# define loss function to minimize
def mse\_loss(predictions, targets):
difference = predictions - targets
return torch.sum(difference \* difference) / difference.numel()
# initialize projection matrix
embedding\_length = len(df["text\_1\_embedding"].values[0])
matrix = torch.randn(
embedding\_length, modified\_embedding\_length, requires\_grad=True
)
epochs, types, losses, accuracies, matrices = [], [], [], [], []
for epoch in range(1, 1 + max\_epochs):
# iterate through training dataloader
for a, b, actual\_similarity in train\_loader:
# generate prediction
predicted\_similarity = model(a, b, matrix)
# get loss and perform backpropagation
loss = mse\_loss(predicted\_similarity, actual\_similarity)
loss.backward()
# update the weights
with torch.no\_grad():
matrix -= matrix.grad \* learning\_rate
# set gradients to zero
matrix.grad.zero\_()
# calculate test loss
test\_predictions = model(e1\_test, e2\_test, matrix)
test\_loss = mse\_loss(test\_predictions, s\_test)
# compute custom embeddings and new cosine similarities
apply\_matrix\_to\_embeddings\_dataframe(matrix, df)
# calculate test accuracy
for dataset in ["train", "test"]:
data = df[df["dataset"] == dataset]
a, se = accuracy\_and\_se(data["cosine\_similarity\_custom"], data["label"])
# record results of each epoch
epochs.append(epoch)
types.append(dataset)
losses.append(loss.item() if dataset == "train" else test\_loss.item())
accuracies.append(a)
matrices.append(matrix.detach().numpy())
# optionally print accuracies
if print\_progress is True:
print(
f"Epoch {epoch}/{max\_epochs}: {dataset} accuracy: {a:0.1%} ± {1.96 \* se:0.1%}"
)
data = pd.DataFrame(
{"epoch": epochs, "type": types, "loss": losses, "accuracy": accuracies}
)
data["run\_id"] = run\_id
data["modified\_embedding\_length"] = modified\_embedding\_length
data["batch\_size"] = batch\_size
data["max\_epochs"] = max\_epochs
data["learning\_rate"] = learning\_rate
data["dropout\_fraction"] = dropout\_fraction
data[
"matrix"
] = matrices # saving every single matrix can get big; feel free to delete/change
if save\_results is True:
data.to\_csv(f"{run\_id}\_optimization\_results.csv", index=False)
return data`
```
```
`# example hyperparameter search
# I recommend starting with max\_epochs=10 while initially exploring
results = []
max\_epochs = 30
dropout\_fraction = 0.2
for batch\_size, learning\_rate in [(10, 10), (100, 100), (1000, 1000)]:
result = optimize\_matrix(
batch\_size=batch\_size,
learning\_rate=learning\_rate,
max\_epochs=max\_epochs,
dropout\_fraction=dropout\_fraction,
save\_results=False,
)
results.append(result)`
```
```
`Epoch 1/30: train accuracy: 89.1% ± 2.4%
Epoch 1/30: test accuracy: 88.4% ± 2.4%
Epoch 2/30: train accuracy: 89.5% ± 2.3%
Epoch 2/30: test accuracy: 88.8% ± 2.4%
Epoch 3/30: train accuracy: 90.6% ± 2.2%
Epoch 3/30: test accuracy: 89.3% ± 2.3%
Epoch 4/30: train accuracy: 91.2% ± 2.2%
Epoch 4/30: test accuracy: 89.7% ± 2.3%
Epoch 5/30: train accuracy: 91.5% ± 2.1%
Epoch 5/30: test accuracy: 90.0% ± 2.3%
Epoch 6/30: train accuracy: 91.9% ± 2.1%
Epoch 6/30: test accuracy: 90.4% ± 2.2%
Epoch 7/30: train accuracy: 92.2% ± 2.0%
Epoch 7/30: test accuracy: 90.7% ± 2.2%
Epoch 8/30: train accuracy: 92.7% ± 2.0%
Epoch 8/30: test accuracy: 90.9% ± 2.2%
Epoch 9/30: train accuracy: 92.7% ± 2.0%
Epoch 9/30: test accuracy: 91.0% ± 2.2%
Epoch 10/30: train accuracy: 93.0% ± 1.9%
Epoch 10/30: test accuracy: 91.6% ± 2.1%
Epoch 11/30: train accuracy: 93.1% ± 1.9%
Epoch 11/30: test accuracy: 91.8% ± 2.1%
Epoch 12/30: train accuracy: 93.4% ± 1.9%
Epoch 12/30: test accuracy: 92.1% ± 2.0%
Epoch 13/30: train accuracy: 93.6% ± 1.9%
Epoch 13/30: test accuracy: 92.4% ± 2.0%
Epoch 14/30: train accuracy: 93.7% ± 1.8%
Epoch 14/30: test accuracy: 92.7% ± 2.0%
Epoch 15/30: train accuracy: 93.7% ± 1.8%
Epoch 15/30: test accuracy: 92.7% ± 2.0%
Epoch 16/30: train accuracy: 94.0% ± 1.8%
Epoch 16/30: test accuracy: 93.0% ± 1.9%
Epoch 17/30: train accuracy: 94.0% ± 1.8%
Epoch 17/30: test accuracy: 93.0% ± 1.9%
Epoch 18/30: train accuracy: 94.2% ± 1.8%
Epoch 18/30: test accuracy: 93.1% ± 1.9%
Epoch 19/30: train accuracy: 94.2% ± 1.8%
Epoch 19/30: test accuracy: 93.1% ± 1.9%
Epoch 20/30: train accuracy: 94.3% ± 1.8%
Epoch 20/30: test accuracy: 93.0% ± 1.9%
Epoch 21/30: train accuracy: 94.5% ± 1.7%
Epoch 21/30: test accuracy: 93.1% ± 1.9%
Epoch 22/30: train accuracy: 94.5% ± 1.7%
Epoch 22/30: test accuracy: 93.3% ± 1.9%
Epoch 23/30: train accuracy: 94.6% ± 1.7%
Epoch 23/30: test accuracy: 93.3% ± 1.9%
Epoch 24/30: train accuracy: 94.6% ± 1.7%
Epoch 24/30: test accuracy: 93.3% ± 1.9%
Epoch 25/30: train accuracy: 94.8% ± 1.7%
Epoch 25/30: test accuracy: 93.3% ± 1.9%
Epoch 26/30: train accuracy: 94.8% ± 1.7%
Epoch 26/30: test accuracy: 93.4% ± 1.9%
Epoch 27/30: train accuracy: 94.8% ± 1.7%
Epoch 27/30: test accuracy: 93.4% ± 1.9%
Epoch 28/30: train accuracy: 94.9% ± 1.7%
Epoch 28/30: test accuracy: 93.4% ± 1.9%
Epoch 29/30: train accuracy: 94.9% ± 1.7%
Epoch 29/30: test accuracy: 93.4% ± 1.9%
Epoch 30/30: train accuracy: 94.9% ± 1.7%
Epoch 30/30: test accuracy: 93.3% ± 1.9%
Epoch 1/30: train accuracy: 89.7% ± 2.3%
Epoch 1/30: test accuracy: 89.1% ± 2.4%
Epoch 2/30: train accuracy: 89.8% ± 2.3%
Epoch 2/30: test accuracy: 89.9% ± 2.3%
Epoch 3/30: train accuracy: 90.3% ± 2.2%
Epoch 3/30: test accuracy: 90.0% ± 2.3%
Epoch 4/30: train accuracy: 91.0% ± 2.2%
Epoch 4/30: test accuracy: 90.3% ± 2.2%
Epoch 5/30: train accuracy: 91.3% ± 2.1%
Epoch 5/30: test accuracy: 90.3% ± 2.2%
Epoch 6/30: train accuracy: 91.8% ± 2.1%
Epoch 6/30: test accuracy: 90.4% ± 2.2%
Epoch 7/30: train accuracy: 92.4% ± 2.0%
Epoch 7/30: test accuracy: 91.0% ± 2.2%
Epoch 8/30: train accuracy: 92.8% ± 2.0%
Epoch 8/30: test accuracy: 91.3% ± 2.1%
Epoch 9/30: train accuracy: 93.1% ± 1.9%
Epoch 9/30: test accuracy: 91.6% ± 2.1%
Epoch 10/30: train accuracy: 93.4% ± 1.9%
Epoch 10/30: test accuracy: 91.9% ± 2.1%
Epoch 11/30: train accuracy: 93.4% ± 1.9%
Epoch 11/30: test accuracy: 91.8% ± 2.1%
Epoch 12/30: train accuracy: 93.6% ± 1.9%
Epoch 12/30: test accuracy: 92.1% ± 2.0%
Epoch 13/30: train accuracy: 93.7% ± 1.8%
Epoch 13/30: test accuracy: 92.4% ± 2.0%
Epoch 14/30: train accuracy: 93.7% ± 1.8%
Epoch 14/30: test accuracy: 92.5% ± 2.0%
Epoch 15/30: train accuracy: 93.9% ± 1.8%
Epoch 15/30: test accuracy: 92.8% ± 2.0%
Epoch 16/30: train accuracy: 94.0% ± 1.8%
Epoch 16/30: test accuracy: 92.8% ± 2.0%
Epoch 17/30: train accuracy: 94.0% ± 1.8%
Epoch 17/30: test accuracy: 92.8% ± 2.0%
Epoch 18/30: train accuracy: 94.2% ± 1.8%
Epoch 18/30: test accuracy: 92.8% ± 2.0%
Epoch 19/30: train accuracy: 94.2% ± 1.8%
Epoch 19/30: test accuracy: 92.8% ± 2.0%
Epoch 20/30: train accuracy: 94.2% ± 1.8%
Epoch 20/30: test accuracy: 93.1% ± 1.9%
Epoch 21/30: train accuracy: 94.3% ± 1.8%
Epoch 21/30: test accuracy: 93.3% ± 1.9%
Epoch 22/30: train accuracy: 94.3% ± 1.8%
Epoch 22/30: test accuracy: 93.3% ± 1.9%
Epoch 23/30: train accuracy: 94.5% ± 1.7%
Epoch 23/30: test accuracy: 93.3% ± 1.9%
Epoch 24/30: train accuracy: 94.5% ± 1.7%
Epoch 24/30: test accuracy: 93.3% ± 1.9%
Epoch 25/30: train accuracy: 94.6% ± 1.7%
Epoch 25/30: test accuracy: 93.4% ± 1.9%
Epoch 26/30: train accuracy: 94.6% ± 1.7%
Epoch 26/30: test accuracy: 93.3% ± 1.9%
Epoch 27/30: train accuracy: 94.6% ± 1.7%
Epoch 27/30: test accuracy: 93.4% ± 1.9%
Epoch 28/30: train accuracy: 94.8% ± 1.7%
Epoch 28/30: test accuracy: 93.4% ± 1.9%
Epoch 29/30: train accuracy: 94.8% ± 1.7%
Epoch 29/30: test accuracy: 93.3% ± 1.9%
Epoch 30/30: train accuracy: 94.8% ± 1.7%
Epoch 30/30: test accuracy: 93.4% ± 1.9%
Epoch 1/30: train accuracy: 90.7% ± 2.2%
Epoch 1/30: test accuracy: 89.9% ± 2.3%
Epoch 2/30: train accuracy: 90.9% ± 2.2%
Epoch 2/30: test accuracy: 90.3% ± 2.2%
Epoch 3/30: train accuracy: 91.6% ± 2.1%
Epoch 3/30: test accuracy: 90.3% ± 2.2%
Epoch 4/30: train accuracy: 92.2% ± 2.0%
Epoch 4/30: test accuracy: 90.7% ± 2.2%
Epoch 5/30: train accuracy: 92.4% ± 2.0%
Epoch 5/30: test accuracy: 91.3% ± 2.1%
Epoch 6/30: train accuracy: 92.5% ± 2.0%
Epoch 6/30: test accuracy: 91.8% ± 2.1%
Epoch 7/30: train accuracy: 93.0% ± 1.9%
Epoch 7/30: test accuracy: 92.2% ± 2.0%
Epoch 8/30: train accuracy: 93.1% ± 1.9%
Epoch 8/30: test accuracy: 92.7% ± 2.0%
Epoch 9/30: train accuracy: 93.3% ± 1.9%
Epoch 9/30: test accuracy: 92.5% ± 2.0%
Epoch 10/30: train accuracy: 93.4% ± 1.9%
Epoch 10/30: test accuracy: 92.7% ± 2.0%
Epoch 11/30: train accuracy: 93.6% ± 1.9%
Epoch 11/30: test accuracy: 92.8% ± 2.0%
Epoch 12/30: train accuracy: 93.7% ± 1.8%
Epoch 12/30: test accuracy: 92.8% ± 2.0%
Epoch 13/30: train accuracy: 94.0% ± 1.8%
Epoch 13/30: test accuracy: 93.0% ± 1.9%
Epoch 14/30: train accuracy: 93.9% ± 1.8%
Epoch 14/30: test accuracy: 93.0% ± 1.9%
Epoch 15/30: train accuracy: 94.2% ± 1.8%
Epoch 15/30: test accuracy: 93.0% ± 1.9%
Epoch 16/30: train accuracy: 94.2% ± 1.8%
Epoch 16/30: test accuracy: 93.0% ± 1.9%
Epoch 17/30: train accuracy: 94.3% ± 1.8%
Epoch 17/30: test accuracy: 93.0% ± 1.9%
Epoch 18/30: train accuracy: 94.5% ± 1.7%
Epoch 18/30: test accuracy: 93.1% ± 1.9%
Epoch 19/30: train accuracy: 94.5% ± 1.7%
Epoch 19/30: test accuracy: 93.1% ± 1.9%
Epoch 20/30: train accuracy: 94.6% ± 1.7%
Epoch 20/30: test accuracy: 93.3% ± 1.9%
Epoch 21/30: train accuracy: 94.8% ± 1.7%
Epoch 21/30: test accuracy: 93.3% ± 1.9%
Epoch 22/30: train accuracy: 94.8% ± 1.7%
Epoch 22/30: test accuracy: 93.4% ± 1.9%
Epoch 23/30: train accuracy: 94.8% ± 1.7%
Epoch 23/30: test accuracy: 93.4% ± 1.9%
Epoch 24/30: train accuracy: 94.8% ± 1.7%
Epoch 24/30: test accuracy: 93.4% ± 1.9%
Epoch 25/30: train accuracy: 94.8% ± 1.7%
Epoch 25/30: test accuracy: 93.4% ± 1.9%
Epoch 26/30: train accuracy: 94.9% ± 1.7%
Epoch 26/30: test accuracy: 93.6% ± 1.9%
Epoch 27/30: train accuracy: 94.9% ± 1.7%
Epoch 27/30: test accuracy: 93.6% ± 1.9%
Epoch 28/30: train accuracy: 94.9% ± 1.7%
Epoch 28/30: test accuracy: 93.6% ± 1.9%
Epoch 29/30: train accuracy: 95.1% ± 1.6%
Epoch 29/30: test accuracy: 93.6% ± 1.9%
Epoch 30/30: train accuracy: 95.1% ± 1.6%
Epoch 30/30: test accuracy: 93.6% ± 1.9%`
```
```
`runs\_df = pd.concat(results)
# plot training loss and test loss over time
px.line(
runs\_df,
line\_group="run\_id",
x="epoch",
y="loss",
color="type",
hover\_data=["batch\_size", "learning\_rate", "dropout\_fraction"],
facet\_row="learning\_rate",
facet\_col="batch\_size",
width=500,
).show()
# plot accuracy over time
px.line(
runs\_df,
line\_group="run\_id",
x="epoch",
y="accuracy",
color="type",
hover\_data=["batch\_size", "learning\_rate", "dropout\_fraction"],
facet\_row="learning\_rate",
facet\_col="batch\_size",
width=500,
).show()`
```
## 8. Plot the before & after, showing the results of the best matrix found during training
The better the matrix is, the more cleanly it will separate the similar and dissimilar pairs.
```
`# apply result of best run to original data
best\_run = runs\_df.sort\_values(by="accuracy", ascending=False).iloc[0]
best\_matrix = best\_run["matrix"]
apply\_matrix\_to\_embeddings\_dataframe(best\_matrix, df)`
```
```
`# plot similarity distribution BEFORE customization
px.histogram(
df,
x="cosine\_similarity",
color="label",
barmode="overlay",
width=500,
facet\_row="dataset",
).show()
test\_df = df[df["dataset"] == "test"]
a, se = accuracy\_and\_se(test\_df["cosine\_similarity"], test\_df["label"])
print(f"Test accuracy: {a:0.1%} ± {1.96 \* se:0.1%}")
# plot similarity distribution AFTER customization
px.histogram(
df,
x="cosine\_similarity\_custom",
color="label",
barmode="overlay",
width=500,
facet\_row="dataset",
).show()
a, se = accuracy\_and\_se(test\_df["cosine\_similarity\_custom"], test\_df["label"])
print(f"Test accuracy after customization: {a:0.1%} ± {1.96 \* se:0.1%}")`
```
```
`Test accuracy: 88.8% ± 2.4%`
```
```
`Test accuracy after customization: 93.6% ± 1.9%`
```
```
`best\_matrix # this is what you can multiply your embeddings by`
```
```
`array([[-1.2566795e+00, -1.5297449e+00, -1.3271648e-01, ...,
-1.2859761e+00, -5.3254390e-01, 4.8364732e-01],
[-1.4826347e+00, 9.2656955e-02, -4.2437232e-01, ...,
1.1872858e+00, -1.0831847e+00, -1.0683593e+00],
[-2.2029283e+00, -1.9703420e+00, 3.1125939e-01, ...,
2.2947595e+00, 5.5780332e-03, -6.0171342e-01],
...,
[-1.1019799e-01, 1.3599515e+00, -4.7677776e-01, ...,
6.5626711e-01, 7.2359240e-01, 3.0733588e+00],
[ 1.6624762e-03, 4.2648423e-01, -1.1380885e+00, ...,
8.7202555e-01, 9.3173909e-01, -1.6760436e+00],
[ 7.7449006e-01, 4.9213606e-01, 3.5407653e-01, ...,
1.3460466e+00, -1.9509128e-01, 7.7514690e-01]], dtype=float32)`
```