Clustering
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
# Clustering
This recipe is archived and may reference outdated models or APIs.
[ BO ](https://github.com/BorisPower)[ TS ](https://github.com/ted-at-openai)[ LO ](https://github.com/logankilpatrick)
[ BorisPower , ](https://github.com/BorisPower)[ Ted Sanders
(OpenAI)
, ](https://github.com/ted-at-openai)[ logankilpatrick ](https://github.com/logankilpatrick)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Clustering.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Clustering.ipynb)
## K-means Clustering in Python using OpenAI
We use a simple k-means algorithm to demonstrate how clustering can be done. Clustering can help discover valuable, hidden groupings within the data. The dataset is created in the [Get\_embeddings\_from\_dataset Notebook](Get_embeddings_from_dataset.ipynb).
```
`# imports
import numpy as np
import pandas as pd
from ast import literal\_eval
# load data
datafile\_path = "./data/fine\_food\_reviews\_with\_embeddings\_1k.csv"
df = pd.read\_csv(datafile\_path)
df["embedding"] = df.embedding.apply(literal\_eval).apply(np.array) # convert string to numpy array
matrix = np.vstack(df.embedding.values)
matrix.shape`
```
```
`(1000, 1536)`
```
### 1. Find the clusters using K-means
We show the simplest use of K-means. You can pick the number of clusters that fits your use case best.
```
`from sklearn.cluster import KMeans
n\_clusters = 4
kmeans = KMeans(n\_clusters=n\_clusters, init="k-means++", random\_state=42)
kmeans.fit(matrix)
labels = kmeans.labels\_
df["Cluster"] = labels
df.groupby("Cluster").Score.mean().sort\_values()`
```
```
`/opt/homebrew/lib/python3.11/site-packages/sklearn/cluster/\_kmeans.py:870: FutureWarning: The default value of `n\_init` will change from 10 to 'auto' in 1.4. Set the value of `n\_init` explicitly to suppress the warning
warnings.warn(`
```
```
`Cluster
0 4.105691
1 4.191176
2 4.215613
3 4.306590
Name: Score, dtype: float64`
```
```
`from sklearn.manifold import TSNE
import matplotlib
import matplotlib.pyplot as plt
tsne = TSNE(n\_components=2, perplexity=15, random\_state=42, init="random", learning\_rate=200)
vis\_dims2 = tsne.fit\_transform(matrix)
x = [x for x, y in vis\_dims2]
y = [y for x, y in vis\_dims2]
for category, color in enumerate(["purple", "green", "red", "blue"]):
xs = np.array(x)[df.Cluster == category]
ys = np.array(y)[df.Cluster == category]
plt.scatter(xs, ys, color=color, alpha=0.3)
avg\_x = xs.mean()
avg\_y = ys.mean()
plt.scatter(avg\_x, avg\_y, marker="x", color=color, s=100)
plt.title("Clusters identified visualized in language 2d using t-SNE")`
```
```
`Text(0.5, 1.0, 'Clusters identified visualized in language 2d using t-SNE')`
```
Visualization of clusters in a 2d projection. In this run, the green cluster (#1) seems quite different from the others. Let’s see a few samples from each cluster.
### 2. Text samples in the clusters & naming the clusters
Let’s show random samples from each cluster. We’ll use gpt-4 to name the clusters, based on a random sample of 5 reviews from that cluster.
```
`from openai import OpenAI
import os
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))
# Reading a review which belong to each group.
rev\_per\_cluster = 5
for i in range(n\_clusters):
print(f"Cluster {i} Theme:", end=" ")
reviews = "\\n".join(
df[df.Cluster == i]
.combined.str.replace("Title: ", "")
.str.replace("\\n\\nContent: ", ": ")
.sample(rev\_per\_cluster, random\_state=42)
.values
)
messages = [
{"role": "user", "content": f'What do the following customer reviews have in common?\\n\\nCustomer reviews:\\n"""\\n{reviews}\\n"""\\n\\nTheme:'}
]
response = client.chat.completions.create(
model="gpt-4",
messages=messages,
temperature=0,
max\_tokens=64,
top\_p=1,
frequency\_penalty=0,
presence\_penalty=0)
print(response.choices[0].message.content.replace("\\n", ""))
sample\_cluster\_rows = df[df.Cluster == i].sample(rev\_per\_cluster, random\_state=42)
for j in range(rev\_per\_cluster):
print(sample\_cluster\_rows.Score.values[j], end=", ")
print(sample\_cluster\_rows.Summary.values[j], end=": ")
print(sample\_cluster\_rows.Text.str[:70].values[j])
print("-" \* 100)`
```
```
`Cluster 0 Theme: The theme of these customer reviews is food products purchased on Amazon.
5, Loved these gluten free healthy bars, saved $$ ordering on Amazon: These Kind Bars are so good and healthy & gluten free. My daughter ca
1, Should advertise coconut as an ingredient more prominently: First, these should be called Mac - Coconut bars, as Coconut is the #2
5, very good!!: just like the runts\<br /\>great flavor, def worth getting\<br /\>I even o
5, Excellent product: After scouring every store in town for orange peels and not finding an
5, delicious: Gummi Frogs have been my favourite candy that I have ever tried. of co
----------------------------------------------------------------------------------------------------
Cluster 1 Theme: Pet food reviews
2, Messy and apparently undelicious: My cat is not a huge fan. Sure, she'll lap up the gravy, but leaves th
4, The cats like it: My 7 cats like this food but it is a little yucky for the human. Piece
5, cant get enough of it!!!: Our lil shih tzu puppy cannot get enough of it. Everytime she sees the
1, Food Caused Illness: I switched my cats over from the Blue Buffalo Wildnerness Food to this
5, My furbabies LOVE these!: Shake the container and they come running. Even my boy cat, who isn't
----------------------------------------------------------------------------------------------------
Cluster 2 Theme: All the reviews are about different types of coffee.
5, Fog Chaser Coffee: This coffee has a full body and a rich taste. The price is far below t
5, Excellent taste: This is to me a great coffee, once you try it you will enjoy it, this
4, Good, but not Wolfgang Puck good: Honestly, I have to admit that I expected a little better. That's not
5, Just My Kind of Coffee: Coffee Masters Hazelnut coffee used to be carried in a local coffee/pa
5, Rodeo Drive is Crazy Good Coffee!: Rodeo Drive is my absolute favorite and I'm ready to order more! That
----------------------------------------------------------------------------------------------------
Cluster 3 Theme: The theme of these customer reviews is food and drink products.
5, Wonderful alternative to soda pop: This is a wonderful alternative to soda pop. It's carbonated for thos
5, So convenient, for so little!: I needed two vanilla beans for the Love Goddess cake that my husbands
2, bot very cheesy: Got this about a month ago.first of all it smells horrible...it tastes
5, Delicious!: I am not a huge beer lover. I do enjoy an occasional Blue Moon (all o
3, Just ok: I bought this brand because it was all they had at Ranch 99 near us. I
----------------------------------------------------------------------------------------------------`
```
It’s important to note that clusters will not necessarily match what you intend to use them for. A larger amount of clusters will focus on more specific patterns, whereas a small number of clusters will usually focus on largest discrepencies in the data.