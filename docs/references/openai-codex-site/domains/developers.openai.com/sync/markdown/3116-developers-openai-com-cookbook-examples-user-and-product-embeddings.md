User and product embeddings
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
# User and product embeddings
This recipe is archived and may reference outdated models or APIs.
[ BO ](https://github.com/BorisPower)
[ BorisPower ](https://github.com/BorisPower)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/User_and_product_embeddings.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/User_and_product_embeddings.ipynb)
## User and product embeddings
We calculate user and product embeddings based on the training set, and evaluate the results on the unseen test set. We will evaluate the results by plotting the user and product similarity versus the review score. The dataset is created in the [Get\_embeddings\_from\_dataset Notebook](Get_embeddings_from_dataset.ipynb).
### 1. Calculate user and product embeddings
We calculate these embeddings simply by averaging all the reviews about the same product or written by the same user within the training set.
```
`import pandas as pd
import numpy as np
from sklearn.model\_selection import train\_test\_split
from ast import literal\_eval
df = pd.read\_csv('data/fine\_food\_reviews\_with\_embeddings\_1k.csv', index\_col=0) # note that you will need to generate this file to run the code below
df.head(2)`
```
||ProductId|UserId|Score|Summary|Text|combined|n\_tokens|embedding|
|0|B003XPF9BO|A3R7JR3FMEBXQB|5|where does one start...and stop... with a tre...|Wanted to save some to bring to my Chicago fam...|Title: where does one start...and stop... wit...|52|[0.03599238395690918, -0.02116263099014759, -0...|
|297|B003VXHGPK|A21VWSCGW7UUAR|4|Good, but not Wolfgang Puck good|Honestly, I have to admit that I expected a li...|Title: Good, but not Wolfgang Puck good; Conte...|178|[-0.07042013108730316, -0.03175969794392586, -...|
```
`df['babbage\_similarity'] = df["embedding"].apply(literal\_eval).apply(np.array)
X\_train, X\_test, y\_train, y\_test = train\_test\_split(df, df.Score, test\_size = 0.2, random\_state=42)
user\_embeddings = X\_train.groupby('UserId').babbage\_similarity.apply(np.mean)
prod\_embeddings = X\_train.groupby('ProductId').babbage\_similarity.apply(np.mean)
len(user\_embeddings), len(prod\_embeddings)`
```
```
`(577, 706)`
```
We can see that most of the users and products appear within the 50k examples only once.
### 2. Evaluate the embeddings
To evaluate the recommendations, we look at the similarity of the user and product embeddings amongst the reviews in the unseen test set. We calculate the cosine distance between the user and product embeddings, which gives us a similarity score between 0 and 1. We then normalize the scores to be evenly split between 0 and 1, by calculating the percentile of the similarity score amongst all predicted scores.
```
`from utils.embeddings\_utils import cosine\_similarity
# evaluate embeddings as recommendations on X\_test
def evaluate\_single\_match(row):
user\_id = row.UserId
product\_id = row.ProductId
try:
user\_embedding = user\_embeddings[user\_id]
product\_embedding = prod\_embeddings[product\_id]
similarity = cosine\_similarity(user\_embedding, product\_embedding)
return similarity
except Exception as e:
return np.nan
X\_test['cosine\_similarity'] = X\_test.apply(evaluate\_single\_match, axis=1)
X\_test['percentile\_cosine\_similarity'] = X\_test.cosine\_similarity.rank(pct=True)`
```
#### 2.1 Visualize cosine similarity by review score
We group the cosine similarity scores by the review score, and plot the distribution of cosine similarity scores for each review score.
```
`import matplotlib.pyplot as plt
import statsmodels.api as sm
correlation = X\_test[['percentile\_cosine\_similarity', 'Score']].corr().values[0,1]
print('Correlation between user & vector similarity percentile metric and review number of stars (score): %.2f%%' % (100\*correlation))
# boxplot of cosine similarity for each score
X\_test.boxplot(column='percentile\_cosine\_similarity', by='Score')
plt.title('')
plt.show()
plt.close()`
```
```
`Correlation between user & vector similarity percentile metric and review number of stars (score): 29.56%`
```
We can observe a weak trend, showing that the higher the similarity score between the user and the product embedding, the higher the review score. Therefore, the user and product embeddings can weakly predict the review score - even before the user receives the product!
Because this signal works in a different way than the more commonly used collaborative filtering, it can act as an additional feature to slightly improve the performance on existing problems.