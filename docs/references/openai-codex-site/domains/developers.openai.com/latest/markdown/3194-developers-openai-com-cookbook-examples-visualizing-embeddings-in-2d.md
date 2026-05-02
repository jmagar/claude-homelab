Visualizing the embeddings in 2D
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
# Visualizing the embeddings in 2D
This recipe is archived and may reference outdated models or APIs.
[ BO ](https://github.com/BorisPower)[ TS ](https://github.com/ted-at-openai)
[ BorisPower , ](https://github.com/BorisPower)[ Ted Sanders
(OpenAI)
](https://github.com/ted-at-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Visualizing_embeddings_in_2D.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Visualizing_embeddings_in_2D.ipynb)
## Visualizing the embeddings in 2D
We will use t-SNE to reduce the dimensionality of the embeddings from 1536 to 2. Once the embeddings are reduced to two dimensions, we can plot them in a 2D scatter plot. The dataset is created in the [Get\_embeddings\_from\_dataset Notebook](Get_embeddings_from_dataset.ipynb).
### 1. Reduce dimensionality
We reduce the dimensionality to 2 dimensions using t-SNE decomposition.
```
`import pandas as pd
from sklearn.manifold import TSNE
import numpy as np
from ast import literal\_eval
# Load the embeddings
datafile\_path = "data/fine\_food\_reviews\_with\_embeddings\_1k.csv"
df = pd.read\_csv(datafile\_path)
# Convert to a list of lists of floats
matrix = np.array(df.embedding.apply(literal\_eval).to\_list())
# Create a t-SNE model and transform the data
tsne = TSNE(n\_components=2, perplexity=15, random\_state=42, init='random', learning\_rate=200)
vis\_dims = tsne.fit\_transform(matrix)
vis\_dims.shape`
```
```
`(1000, 2)`
```
### 2. Plotting the embeddings
We colour each review by its star rating, ranging from red to green.
We can observe a decent data separation even in the reduced 2 dimensions.
```
`import matplotlib.pyplot as plt
import matplotlib
import numpy as np
colors = ["red", "darkorange", "gold", "turquoise", "darkgreen"]
x = [x for x,y in vis\_dims]
y = [y for x,y in vis\_dims]
color\_indices = df.Score.values - 1
colormap = matplotlib.colors.ListedColormap(colors)
plt.scatter(x, y, c=color\_indices, cmap=colormap, alpha=0.3)
for score in [0,1,2,3,4]:
avg\_x = np.array(x)[df.Score-1==score].mean()
avg\_y = np.array(y)[df.Score-1==score].mean()
color = colors[score]
plt.scatter(avg\_x, avg\_y, marker='x', color=color, s=100)
plt.title("Amazon ratings visualized in language using t-SNE")`
```
```
`Text(0.5, 1.0, 'Amazon ratings visualized in language using t-SNE')`
```