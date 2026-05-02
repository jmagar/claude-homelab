Regression using the embeddings
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
# Regression using the embeddings
This recipe is archived and may reference outdated models or APIs.
[ BO ](https://github.com/BorisPower)[ TS ](https://github.com/ted-at-openai)[ LO ](https://github.com/logankilpatrick)
[ BorisPower , ](https://github.com/BorisPower)[ Ted Sanders
(OpenAI)
, ](https://github.com/ted-at-openai)[ logankilpatrick ](https://github.com/logankilpatrick)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Regression_using_embeddings.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Regression_using_embeddings.ipynb)
## Regression using the embeddings
Regression means predicting a number, rather than one of the categories. We will predict the score based on the embedding of the review’s text. We split the dataset into a training and a testing set for all of the following tasks, so we can realistically evaluate performance on unseen data. The dataset is created in the [Get\_embeddings\_from\_dataset Notebook](Get_embeddings_from_dataset.ipynb).
We’re predicting the score of the review, which is a number between 1 and 5 (1-star being negative and 5-star positive).
```
`import pandas as pd
import numpy as np
from ast import literal\_eval
from sklearn.ensemble import RandomForestRegressor
from sklearn.model\_selection import train\_test\_split
from sklearn.metrics import mean\_squared\_error, mean\_absolute\_error
datafile\_path = "data/fine\_food\_reviews\_with\_embeddings\_1k.csv"
df = pd.read\_csv(datafile\_path)
df["embedding"] = df.embedding.apply(literal\_eval).apply(np.array)
X\_train, X\_test, y\_train, y\_test = train\_test\_split(list(df.embedding.values), df.Score, test\_size=0.2, random\_state=42)
rfr = RandomForestRegressor(n\_estimators=100)
rfr.fit(X\_train, y\_train)
preds = rfr.predict(X\_test)
mse = mean\_squared\_error(y\_test, preds)
mae = mean\_absolute\_error(y\_test, preds)
print(f"text-embedding-3-small performance on 1k Amazon reviews: mse={mse:.2f}, mae={mae:.2f}")`
```
```
`text-embedding-3-small performance on 1k Amazon reviews: mse=0.65, mae=0.52`
```
```
`bmse = mean\_squared\_error(y\_test, np.repeat(y\_test.mean(), len(y\_test)))
bmae = mean\_absolute\_error(y\_test, np.repeat(y\_test.mean(), len(y\_test)))
print(
f"Dummy mean prediction performance on Amazon reviews: mse={bmse:.2f}, mae={bmae:.2f}"
)`
```
```
`Dummy mean prediction performance on Amazon reviews: mse=1.73, mae=1.03`
```
We can see that the embeddings are able to predict the scores with an average error of 0.53 per score prediction. This is roughly equivalent to predicting half of reviews perfectly, and half off by one star.
You could also train a classifier to predict the label, or use the embeddings within an existing ML model to encode free text features.