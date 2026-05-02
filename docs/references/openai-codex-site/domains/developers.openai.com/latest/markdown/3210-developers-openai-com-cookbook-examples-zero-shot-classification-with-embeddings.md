Zero-shot classification with embeddings
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
# Zero-shot classification with embeddings
This recipe is archived and may reference outdated models or APIs.
[ BO ](https://github.com/BorisPower)[ TS ](https://github.com/ted-at-openai)[ LO ](https://github.com/logankilpatrick)
[ BorisPower , ](https://github.com/BorisPower)[ Ted Sanders
(OpenAI)
, ](https://github.com/ted-at-openai)[ logankilpatrick ](https://github.com/logankilpatrick)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Zero-shot_classification_with_embeddings.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Zero-shot_classification_with_embeddings.ipynb)
## Zero-shot classification with embeddings
In this notebook we will classify the sentiment of reviews using embeddings and zero labeled data! The dataset is created in the [Get\_embeddings\_from\_dataset Notebook](Get_embeddings_from_dataset.ipynb).
We’ll define positive sentiment to be 4- and 5-star reviews, and negative sentiment to be 1- and 2-star reviews. 3-star reviews are considered neutral and we won’t use them for this example.
We will perform zero-shot classification by embedding descriptions of each class and then comparing new samples to those class embeddings.
```
`import pandas as pd
import numpy as np
from ast import literal\_eval
from sklearn.metrics import classification\_report
EMBEDDING\_MODEL = "text-embedding-3-small"
datafile\_path = "data/fine\_food\_reviews\_with\_embeddings\_1k.csv"
df = pd.read\_csv(datafile\_path)
df["embedding"] = df.embedding.apply(literal\_eval).apply(np.array)
# convert 5-star rating to binary sentiment
df = df[df.Score != 3]
df["sentiment"] = df.Score.replace({1: "negative", 2: "negative", 4: "positive", 5: "positive"})`
```
### Zero-Shot Classification
To perform zero shot classification, we want to predict labels for our samples without any training. To do this, we can simply embed short descriptions of each label, such as positive and negative, and then compare the cosine distance between embeddings of samples and label descriptions.
The highest similarity label to the sample input is the predicted label. We can also define a prediction score to be the difference between the cosine distance to the positive and to the negative label. This score can be used for plotting a precision-recall curve, which can be used to select a different tradeoff between precision and recall, by selecting a different threshold.
```
`from utils.embeddings\_utils import cosine\_similarity, get\_embedding
from sklearn.metrics import PrecisionRecallDisplay
def evaluate\_embeddings\_approach(
labels = ['negative', 'positive'],
model = EMBEDDING\_MODEL,
):
label\_embeddings = [get\_embedding(label, model=model) for label in labels]
def label\_score(review\_embedding, label\_embeddings):
return cosine\_similarity(review\_embedding, label\_embeddings[1]) - cosine\_similarity(review\_embedding, label\_embeddings[0])
probas = df["embedding"].apply(lambda x: label\_score(x, label\_embeddings))
preds = probas.apply(lambda x: 'positive' if x\>0 else 'negative')
report = classification\_report(df.sentiment, preds)
print(report)
display = PrecisionRecallDisplay.from\_predictions(df.sentiment, probas, pos\_label='positive')
\_ = display.ax\_.set\_title("2-class Precision-Recall curve")
evaluate\_embeddings\_approach(labels=['negative', 'positive'], model=EMBEDDING\_MODEL)`
```
```
` precision recall f1-score support
negative 0.54 0.92 0.68 136
positive 0.98 0.87 0.92 789
accuracy 0.87 925
macro avg 0.76 0.89 0.80 925
weighted avg 0.92 0.87 0.89 925`
```
We can see that this classifier already performs extremely well. We used similarity embeddings, and the simplest possible label name. Let’s try to improve on this by using more descriptive label names, and search embeddings.
```
`evaluate\_embeddings\_approach(labels=['An Amazon review with a negative sentiment.', 'An Amazon review with a positive sentiment.'])`
```
```
` precision recall f1-score support
negative 0.76 0.96 0.85 136
positive 0.99 0.95 0.97 789
accuracy 0.95 925
macro avg 0.88 0.96 0.91 925
weighted avg 0.96 0.95 0.95 925`
```
Using the search embeddings and descriptive names leads to an additional improvement in performance.
```
`evaluate\_embeddings\_approach(labels=['An Amazon review with a negative sentiment.', 'An Amazon review with a positive sentiment.'])`
```
```
` precision recall f1-score support
negative 0.76 0.96 0.85 136
positive 0.99 0.95 0.97 789
accuracy 0.95 925
macro avg 0.88 0.96 0.91 925
weighted avg 0.96 0.95 0.95 925`
```
As shown above, zero-shot classification with embeddings can lead to great results, especially when the labels are more descriptive than just simple words.