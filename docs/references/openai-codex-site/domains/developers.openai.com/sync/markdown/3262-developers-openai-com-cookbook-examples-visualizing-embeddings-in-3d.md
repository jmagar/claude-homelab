Visualizing embeddings in 3D
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
# Visualizing embeddings in 3D
This recipe is archived and may reference outdated models or APIs.
[ BO ](https://github.com/BorisPower)[ TS ](https://github.com/ted-at-openai)
[ BorisPower , ](https://github.com/BorisPower)[ Ted Sanders
(OpenAI)
](https://github.com/ted-at-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Visualizing_embeddings_in_3D.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Visualizing_embeddings_in_3D.ipynb)
The example uses [PCA](https://scikit-learn.org/stable/modules/generated/sklearn.decomposition.PCA.html) to reduce the dimensionality fo the embeddings from 1536 to 3. Then we can visualize the data points in a 3D plot. The small dataset `dbpedia\_samples.jsonl` is curated by randomly sampling 200 samples from [DBpedia validation dataset](https://www.kaggle.com/danofer/dbpedia-classes?select=DBPEDIA_val.csv).
### 1. Load the dataset and query embeddings
```
`import pandas as pd
samples = pd.read\_json("data/dbpedia\_samples.jsonl", lines=True)
categories = sorted(samples["category"].unique())
print("Categories of DBpedia samples:", samples["category"].value\_counts())
samples.head()`
```
```
`Categories of DBpedia samples: Artist 21
Film 19
Plant 19
OfficeHolder 18
Company 17
NaturalPlace 16
Athlete 16
Village 12
WrittenWork 11
Building 11
Album 11
Animal 11
EducationalInstitution 10
MeanOfTransportation 8
Name: category, dtype: int64`
```
||text|category|
|0|Morada Limited is a textile company based in ...|Company|
|1|The Armenian Mirror-Spectator is a newspaper ...|WrittenWork|
|2|Mt. Kinka (金華山 Kinka-zan) also known as Kinka...|NaturalPlace|
|3|Planning the Play of a Bridge Hand is a book ...|WrittenWork|
|4|Wang Yuanping (born 8 December 1976) is a ret...|Athlete|
```
`from utils.embeddings\_utils import get\_embeddings
# NOTE: The following code will send a query of batch size 200 to /embeddings
matrix = get\_embeddings(samples["text"].to\_list(), model="text-embedding-3-small")`
```
### 2. Reduce the embedding dimensionality
```
`from sklearn.decomposition import PCA
pca = PCA(n\_components=3)
vis\_dims = pca.fit\_transform(matrix)
samples["embed\_vis"] = vis\_dims.tolist()`
```
### 3. Plot the embeddings of lower dimensionality
```
`%matplotlib widget
import matplotlib.pyplot as plt
import numpy as np
fig = plt.figure(figsize=(10, 5))
ax = fig.add\_subplot(projection='3d')
cmap = plt.get\_cmap("tab20")
# Plot each sample category individually such that we can set label name.
for i, cat in enumerate(categories):
sub\_matrix = np.array(samples[samples["category"] == cat]["embed\_vis"].to\_list())
x=sub\_matrix[:, 0]
y=sub\_matrix[:, 1]
z=sub\_matrix[:, 2]
colors = [cmap(i/len(categories))] \* len(sub\_matrix)
ax.scatter(x, y, zs=z, zdir='z', c=colors, label=cat)
ax.set\_xlabel('x')
ax.set\_ylabel('y')
ax.set\_zlabel('z')
ax.legend(bbox\_to\_anchor=(1.1, 1))`
```
```
`\<matplotlib.legend.Legend at 0x1622180a0\>`
```