Classification using embeddings
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
Jul 11, 2022
# Classification using embeddings
This recipe is archived and may reference outdated models or APIs.
[ TS ](https://github.com/ted-at-openai)[ LO ](https://github.com/logankilpatrick)
[ Ted Sanders
(OpenAI)
, ](https://github.com/ted-at-openai)[ logankilpatrick ](https://github.com/logankilpatrick)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Classification_using_embeddings.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Classification_using_embeddings.ipynb)
## Classification using embeddings
There are many ways to classify text. This notebook shares an example of text classification using embeddings. For many text classification tasks, we’ve seen fine-tuned models do better than embeddings. See an example of fine-tuned models for classification in [Fine-tuned\_classification.ipynb](Fine-tuned_classification.ipynb). We also recommend having more examples than embedding dimensions, which we don’t quite achieve here.
In this text classification task, we predict the score of a food review (1 to 5) based on the embedding of the review’s text. We split the dataset into a training and a testing set for all the following tasks, so we can realistically evaluate performance on unseen data. The dataset is created in the [Get\_embeddings\_from\_dataset Notebook](Get_embeddings_from_dataset.ipynb).
```
`import pandas as pd
import numpy as np
from ast import literal\_eval
from sklearn.ensemble import RandomForestClassifier
from sklearn.model\_selection import train\_test\_split
from sklearn.metrics import classification\_report, accuracy\_score
datafile\_path = "data/fine\_food\_reviews\_with\_embeddings\_1k.csv"
df = pd.read\_csv(datafile\_path)
df["embedding"] = df.embedding.apply(literal\_eval).apply(np.array) # convert string to array
# split data into train and test
X\_train, X\_test, y\_train, y\_test = train\_test\_split(
list(df.embedding.values), df.Score, test\_size=0.2, random\_state=42
)
# train random forest classifier
clf = RandomForestClassifier(n\_estimators=100)
clf.fit(X\_train, y\_train)
preds = clf.predict(X\_test)
probas = clf.predict\_proba(X\_test)
report = classification\_report(y\_test, preds)
print(report)`
```
```
` precision recall f1-score support
1 0.90 0.45 0.60 20
2 1.00 0.38 0.55 8
3 1.00 0.18 0.31 11
4 0.88 0.26 0.40 27
5 0.76 1.00 0.86 134
accuracy 0.78 200
macro avg 0.91 0.45 0.54 200
weighted avg 0.81 0.78 0.73 200`
```
We can see that the model has learnt to distinguish between the categories decently. 5-star reviews show the best performance overall, and this is not too surprising, since they are the most common in the dataset.
```
`from utils.embeddings\_utils import plot\_multiclass\_precision\_recall
plot\_multiclass\_precision\_recall(probas, y\_test, [1, 2, 3, 4, 5], clf)`
```
```
`RandomForestClassifier() - Average precision score over all classes: 0.90`
```
Unsurprisingly 5-star and 1-star reviews seem to be easier to predict. Perhaps with more data, the nuances between 2-4 stars could be better predicted, but there’s also probably more subjectivity in how people use the inbetween scores.