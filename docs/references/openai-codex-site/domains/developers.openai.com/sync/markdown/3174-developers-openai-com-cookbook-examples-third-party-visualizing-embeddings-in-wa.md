Visualizing embeddings in Weights and Biases
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
Feb 1, 2023
# Visualizing embeddings in Weights and Biases
This recipe is archived and may reference outdated models or APIs.
[ SC ](https://github.com/scottire)
[ scottire ](https://github.com/scottire)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/third_party/Visualizing_embeddings_in_wandb.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/third_party/Visualizing_embeddings_in_wandb.ipynb)
## Visualizing embeddings in W&B
We will upload the data to [Weights & Biases](http://wandb.ai) and use an [Embedding Projector](https://docs.wandb.ai/ref/app/features/panels/weave/embedding-projector) to visualize the embeddings using common dimension reduction algorithms like PCA, UMAP, and t-SNE. The dataset is created in the [Get\_embeddings\_from\_dataset Notebook](Get_embeddings_from_dataset.ipynb).
## What is Weights & Biases?
[Weights & Biases](http://wandb.ai) is a machine learning platform used by OpenAI and other ML teams to build better models faster. They use it to quickly track experiments, evaluate model performance, reproduce models, visualize results, and share findings with colleagues.
### 1. Log the data to W&B
We create a [W&B Table](https://docs.wandb.ai/guides/data-vis/log-tables) with the original data and the embeddings. Each review is a new row and the 1536 embedding floats are given their own column named `emb\_{i}`.
```
`import pandas as pd
from sklearn.manifold import TSNE
import numpy as np
from ast import literal\_eval
# Load the embeddings
datafile\_path = "data/fine\_food\_reviews\_with\_embeddings\_1k.csv"
df = pd.read\_csv(datafile\_path)
# Convert to a list of lists of floats
matrix = np.array(df.embedding.apply(literal\_eval).to\_list())`
```
```
`import wandb
original\_cols = df.columns[1:-1].tolist()
embedding\_cols = ['emb\_'+str(idx) for idx in range(len(matrix[0]))]
table\_cols = original\_cols + embedding\_cols
with wandb.init(project='openai\_embeddings'):
table = wandb.Table(columns=table\_cols)
for i, row in enumerate(df.to\_dict(orient="records")):
original\_data = [row[col\_name] for col\_name in original\_cols]
embedding\_data = matrix[i].tolist()
table.add\_data(\*(original\_data + embedding\_data))
wandb.log({'openai\_embedding\_table': table})`
```
### 2. Render as 2D Projection
After navigating to the W&B run link, we click the ⚙️ icon in the top right of the Table and change “Render As:” to “Combined 2D Projection”.
Example: [http://wandb.me/openai\_embeddings](http://wandb.me/openai_embeddings)