Recommendation using embeddings and nearest neighbor search
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
# Recommendation using embeddings and nearest neighbor search
This recipe is archived and may reference outdated models or APIs.
[ TS ](https://github.com/ted-at-openai)[ BO ](https://github.com/BorisPower)[ LO ](https://github.com/logankilpatrick)
[ Ted Sanders
(OpenAI)
, ](https://github.com/ted-at-openai)[ BorisPower , ](https://github.com/BorisPower)[ logankilpatrick ](https://github.com/logankilpatrick)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Recommendation_using_embeddings.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Recommendation_using_embeddings.ipynb)
Recommendations are widespread across the web.
* ‘Bought that item? Try these similar items.’
* ‘Enjoy that book? Try these similar titles.’
* ‘Not the help page you were looking for? Try these similar pages.’
This notebook demonstrates how to use embeddings to find similar items to recommend. In particular, we use [AG’s corpus of news articles](http://groups.di.unipi.it/~gulli/AG_corpus_of_news_articles.html) as our dataset.
Our model will answer the question: given an article, what other articles are most similar to it?
```
`import pandas as pd
import pickle
from utils.embeddings\_utils import (
get\_embedding,
distances\_from\_embeddings,
tsne\_components\_from\_embeddings,
chart\_from\_components,
indices\_of\_nearest\_neighbors\_from\_distances,
)
EMBEDDING\_MODEL = "text-embedding-3-small"`
```
### 2. Load data
Next, let’s load the AG news data and see what it looks like.
```
`# load data (full dataset available at http://groups.di.unipi.it/\~gulli/AG\_corpus\_of\_news\_articles.html)
dataset\_path = "data/AG\_news\_samples.csv"
df = pd.read\_csv(dataset\_path)
n\_examples = 5
df.head(n\_examples)`
```
||title|description|label\_int|label|
|0|World Briefings|BRITAIN: BLAIR WARNS OF CLIMATE THREAT Prime M...|1|World|
|1|Nvidia Puts a Firewall on a Motherboard (PC Wo...|PC World - Upcoming chip set will include buil...|4|Sci/Tech|
|2|Olympic joy in Greek, Chinese press|Newspapers in Greece reflect a mixture of exhi...|2|Sports|
|3|U2 Can iPod with Pictures|SAN JOSE, Calif. -- Apple Computer (Quote, Cha...|4|Sci/Tech|
|4|The Dream Factory|Any product, any shape, any size -- manufactur...|4|Sci/Tech|
Let’s take a look at those same examples, but not truncated by ellipses.
```
`# print the title, description, and label of each example
for idx, row in df.head(n\_examples).iterrows():
print("")
print(f"Title: {row['title']}")
print(f"Description: {row['description']}")
print(f"Label: {row['label']}")`
```
```
`
Title: World Briefings
Description: BRITAIN: BLAIR WARNS OF CLIMATE THREAT Prime Minister Tony Blair urged the international community to consider global warming a dire threat and agree on a plan of action to curb the quot;alarming quot; growth of greenhouse gases.
Label: World
Title: Nvidia Puts a Firewall on a Motherboard (PC World)
Description: PC World - Upcoming chip set will include built-in security features for your PC.
Label: Sci/Tech
Title: Olympic joy in Greek, Chinese press
Description: Newspapers in Greece reflect a mixture of exhilaration that the Athens Olympics proved successful, and relief that they passed off without any major setback.
Label: Sports
Title: U2 Can iPod with Pictures
Description: SAN JOSE, Calif. -- Apple Computer (Quote, Chart) unveiled a batch of new iPods, iTunes software and promos designed to keep it atop the heap of digital music players.
Label: Sci/Tech
Title: The Dream Factory
Description: Any product, any shape, any size -- manufactured on your desktop! The future is the fabricator. By Bruce Sterling from Wired magazine.
Label: Sci/Tech`
```
### 3. Build cache to save embeddings
Before getting embeddings for these articles, let’s set up a cache to save the embeddings we generate. In general, it’s a good idea to save your embeddings so you can re-use them later. If you don’t save them, you’ll pay again each time you compute them again.
The cache is a dictionary that maps tuples of `(text, model)` to an embedding, which is a list of floats. The cache is saved as a Python pickle file.
```
`# establish a cache of embeddings to avoid recomputing
# cache is a dict of tuples (text, model) -\> embedding, saved as a pickle file
# set path to embedding cache
embedding\_cache\_path = "data/recommendations\_embeddings\_cache.pkl"
# load the cache if it exists, and save a copy to disk
try:
embedding\_cache = pd.read\_pickle(embedding\_cache\_path)
except FileNotFoundError:
embedding\_cache = {}
with open(embedding\_cache\_path, "wb") as embedding\_cache\_file:
pickle.dump(embedding\_cache, embedding\_cache\_file)
# define a function to retrieve embeddings from the cache if present, and otherwise request via the API
def embedding\_from\_string(
string: str,
model: str = EMBEDDING\_MODEL,
embedding\_cache=embedding\_cache
) -\> list:
"""Return embedding of given string, using a cache to avoid recomputing."""
if (string, model) not in embedding\_cache.keys():
embedding\_cache[(string, model)] = get\_embedding(string, model)
with open(embedding\_cache\_path, "wb") as embedding\_cache\_file:
pickle.dump(embedding\_cache, embedding\_cache\_file)
return embedding\_cache[(string, model)]`
```
Let’s check that it works by getting an embedding.
```
`# as an example, take the first description from the dataset
example\_string = df["description"].values[0]
print(f"\\nExample string: {example\_string}")
# print the first 10 dimensions of the embedding
example\_embedding = embedding\_from\_string(example\_string)
print(f"\\nExample embedding: {example\_embedding[:10]}...")`
```
```
`
Example string: BRITAIN: BLAIR WARNS OF CLIMATE THREAT Prime Minister Tony Blair urged the international community to consider global warming a dire threat and agree on a plan of action to curb the quot;alarming quot; growth of greenhouse gases.
Example embedding: [0.0545826330780983, -0.00428084097802639, 0.04785159230232239, 0.01587914116680622, -0.03640881925821304, 0.0143799539655447, -0.014267769642174244, -0.015175441280007362, -0.002344391541555524, 0.011075624264776707]...`
```
### 4. Recommend similar articles based on embeddings
To find similar articles, let’s follow a three-step plan:
1. Get the similarity embeddings of all the article descriptions
2. Calculate the distance between a source title and all other articles
3. Print out the other articles closest to the source title
```
`def print\_recommendations\_from\_strings(
strings: list[str],
index\_of\_source\_string: int,
k\_nearest\_neighbors: int = 1,
model=EMBEDDING\_MODEL,
) -\> list[int]:
"""Print out the k nearest neighbors of a given string."""
# get embeddings for all strings
embeddings = [embedding\_from\_string(string, model=model) for string in strings]
# get the embedding of the source string
query\_embedding = embeddings[index\_of\_source\_string]
# get distances between the source embedding and other embeddings (function from utils.embeddings\_utils.py)
distances = distances\_from\_embeddings(query\_embedding, embeddings, distance\_metric="cosine")
# get indices of nearest neighbors (function from utils.utils.embeddings\_utils.py)
indices\_of\_nearest\_neighbors = indices\_of\_nearest\_neighbors\_from\_distances(distances)
# print out source string
query\_string = strings[index\_of\_source\_string]
print(f"Source string: {query\_string}")
# print out its k nearest neighbors
k\_counter = 0
for i in indices\_of\_nearest\_neighbors:
# skip any strings that are identical matches to the starting string
if query\_string == strings[i]:
continue
# stop after printing out k articles
if k\_counter \>= k\_nearest\_neighbors:
break
k\_counter += 1
# print out the similar strings and their distances
print(
f"""
--- Recommendation #{k\_counter} (nearest neighbor {k\_counter} of {k\_nearest\_neighbors}) ---
String: {strings[i]}
Distance: {distances[i]:0.3f}"""
)
return indices\_of\_nearest\_neighbors`
```
### 5. Example recommendations
Let’s look for articles similar to first one, which was about Tony Blair.
```
`article\_descriptions = df["description"].tolist()
tony\_blair\_articles = print\_recommendations\_from\_strings(
strings=article\_descriptions, # let's base similarity off of the article description
index\_of\_source\_string=0, # articles similar to the first one about Tony Blair
k\_nearest\_neighbors=5, # 5 most similar articles
)`
```
```
`Source string: BRITAIN: BLAIR WARNS OF CLIMATE THREAT Prime Minister Tony Blair urged the international community to consider global warming a dire threat and agree on a plan of action to curb the quot;alarming quot; growth of greenhouse gases.
--- Recommendation #1 (nearest neighbor 1 of 5) ---
String: The anguish of hostage Kenneth Bigley in Iraq hangs over Prime Minister Tony Blair today as he faces the twin test of a local election and a debate by his Labour Party about the divisive war.
Distance: 0.514
--- Recommendation #2 (nearest neighbor 2 of 5) ---
String: THE re-election of British Prime Minister Tony Blair would be seen as an endorsement of the military action in Iraq, Prime Minister John Howard said today.
Distance: 0.516
--- Recommendation #3 (nearest neighbor 3 of 5) ---
String: Israel is prepared to back a Middle East conference convened by Tony Blair early next year despite having expressed fears that the British plans were over-ambitious and designed
Distance: 0.546
--- Recommendation #4 (nearest neighbor 4 of 5) ---
String: Allowing dozens of casinos to be built in the UK would bring investment and thousands of jobs, Tony Blair says.
Distance: 0.568
--- Recommendation #5 (nearest neighbor 5 of 5) ---
String: AFP - A battle group of British troops rolled out of southern Iraq on a US-requested mission to deadlier areas near Baghdad, in a major political gamble for British Prime Minister Tony Blair.
Distance: 0.579`
```
Pretty good! 4 of the 5 recommendations explicitly mention Tony Blair and the fifth is an article from London about climate change, topics that might be often associated with Tony Blair.
Let’s see how our recommender does on the second example article about NVIDIA’s new chipset with more security.
```
`chipset\_security\_articles = print\_recommendations\_from\_strings(
strings=article\_descriptions, # let's base similarity off of the article description
index\_of\_source\_string=1, # let's look at articles similar to the second one about a more secure chipset
k\_nearest\_neighbors=5, # let's look at the 5 most similar articles
)`
```
```
`Source string: PC World - Upcoming chip set will include built-in security features for your PC.
--- Recommendation #1 (nearest neighbor 1 of 5) ---
String: PC World - Updated antivirus software for businesses adds intrusion prevention features.
Distance: 0.422
--- Recommendation #2 (nearest neighbor 2 of 5) ---
String: PC World - Symantec, McAfee hope raising virus-definition fees will move users to\\ suites.
Distance: 0.518
--- Recommendation #3 (nearest neighbor 3 of 5) ---
String: originally offered on notebook PCs -- to its Opteron 32- and 64-bit x86 processors for server applications. The technology will help servers to run
Distance: 0.522
--- Recommendation #4 (nearest neighbor 4 of 5) ---
String: PC World - Send your video throughout your house--wirelessly--with new gateways and media adapters.
Distance: 0.532
--- Recommendation #5 (nearest neighbor 5 of 5) ---
String: Chips that help a computer's main microprocessors perform specific types of math problems are becoming a big business once again.\\
Distance: 0.532`
```
From the printed distances, you can see that the #1 recommendation is much closer than all the others (0.11 vs 0.14+). And the #1 recommendation looks very similar to the starting article - it’s another article from PC World about increasing computer security. Pretty good!
## Appendix: Using embeddings in more sophisticated recommenders
A more sophisticated way to build a recommender system is to train a machine learning model that takes in tens or hundreds of signals, such as item popularity or user click data. Even in this system, embeddings can be a very useful signal into the recommender, especially for items that are being ‘cold started’ with no user data yet (e.g., a brand new product added to the catalog without any clicks yet).
## Appendix: Using embeddings to visualize similar articles
To get a sense of what our nearest neighbor recommender is doing, let’s visualize the article embeddings. Although we can’t plot the 2048 dimensions of each embedding vector, we can use techniques like [t-SNE](https://en.wikipedia.org/wiki/T-distributed_stochastic_neighbor_embedding) or [PCA](https://en.wikipedia.org/wiki/Principal_component_analysis) to compress the embeddings down into 2 or 3 dimensions, which we can chart.
Before visualizing the nearest neighbors, let’s visualize all of the article descriptions using t-SNE. Note that t-SNE is not deterministic, meaning that results may vary from run to run.
```
`# get embeddings for all article descriptions
embeddings = [embedding\_from\_string(string) for string in article\_descriptions]
# compress the 2048-dimensional embeddings into 2 dimensions using t-SNE
tsne\_components = tsne\_components\_from\_embeddings(embeddings)
# get the article labels for coloring the chart
labels = df["label"].tolist()
chart\_from\_components(
components=tsne\_components,
labels=labels,
strings=article\_descriptions,
width=600,
height=500,
title="t-SNE components of article descriptions",
)`
```
As you can see in the chart above, even the highly compressed embeddings do a good job of clustering article descriptions by category. And it’s worth emphasizing: this clustering is done with no knowledge of the labels themselves!
Also, if you look closely at the most egregious outliers, they are often due to mislabeling rather than poor embedding. For example, the majority of the blue World points in the green Sports cluster appear to be Sports stories.
Next, let’s recolor the points by whether they are a source article, its nearest neighbors, or other.
```
`# create labels for the recommended articles
def nearest\_neighbor\_labels(
list\_of\_indices: list[int],
k\_nearest\_neighbors: int = 5
) -\> list[str]:
"""Return a list of labels to color the k nearest neighbors."""
labels = ["Other" for \_ in list\_of\_indices]
source\_index = list\_of\_indices[0]
labels[source\_index] = "Source"
for i in range(k\_nearest\_neighbors):
nearest\_neighbor\_index = list\_of\_indices[i + 1]
labels[nearest\_neighbor\_index] = f"Nearest neighbor (top {k\_nearest\_neighbors})"
return labels
tony\_blair\_labels = nearest\_neighbor\_labels(tony\_blair\_articles, k\_nearest\_neighbors=5)
chipset\_security\_labels = nearest\_neighbor\_labels(chipset\_security\_articles, k\_nearest\_neighbors=5
)`
```
```
`# a 2D chart of nearest neighbors of the Tony Blair article
chart\_from\_components(
components=tsne\_components,
labels=tony\_blair\_labels,
strings=article\_descriptions,
width=600,
height=500,
title="Nearest neighbors of the Tony Blair article",
category\_orders={"label": ["Other", "Nearest neighbor (top 5)", "Source"]},
)`
```
Looking at the 2D chart above, we can see that the articles about Tony Blair are somewhat close together inside of the World news cluster. Interestingly, although the 5 nearest neighbors (red) were closest in high dimensional space, they are not the closest points in this compressed 2D space. Compressing the embeddings down to 2 dimensions discards much of their information, and the nearest neighbors in the 2D space don’t seem to be as relevant as those in the full embedding space.
```
`# a 2D chart of nearest neighbors of the chipset security article
chart\_from\_components(
components=tsne\_components,
labels=chipset\_security\_labels,
strings=article\_descriptions,
width=600,
height=500,
title="Nearest neighbors of the chipset security article",
category\_orders={"label": ["Other", "Nearest neighbor (top 5)", "Source"]},
)`
```
For the chipset security example, the 4 closest nearest neighbors in the full embedding space remain nearest neighbors in this compressed 2D visualization. The fifth is displayed as more distant, despite being closer in the full embedding space.
Should you want to, you can also make an interactive 3D plot of the embeddings with the function `chart\_from\_components\_3D`. (Doing so will require recomputing the t-SNE components with `n\_components=3`.)