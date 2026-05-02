Clustering for transaction classification
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
Oct 20, 2022
# Clustering for transaction classification
This recipe is archived and may reference outdated models or APIs.
[ CJ ](https://twitter.com/colintjarvis)[ TS ](https://github.com/ted-at-openai)
[ Colin Jarvis
(OpenAI)
, ](https://twitter.com/colintjarvis)[ Ted Sanders
(OpenAI)
](https://github.com/ted-at-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Clustering_for_transaction_classification.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Clustering_for_transaction_classification.ipynb)
This notebook covers use cases where your data is unlabelled but has features that can be used to cluster them into meaningful categories. The challenge with clustering is making the features that make those clusters stand out human-readable, and that is where we’ll look to use GPT-3 to generate meaningful cluster descriptions for us. We can then use these to apply labels to a previously unlabelled dataset.
To feed the model we use embeddings created using the approach displayed in the notebook [Multiclass classification for transactions Notebook](Multiclass_classification_for_transactions.ipynb), applied to the full 359 transactions in the dataset to give us a bigger pool for learning
## Setup
```
`# optional env import
from dotenv import load\_dotenv
load\_dotenv()`
```
```
`True`
```
```
`# imports
from openai import OpenAI
import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
from sklearn.manifold import TSNE
import matplotlib
import matplotlib.pyplot as plt
import os
from ast import literal\_eval
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))
COMPLETIONS\_MODEL = "gpt-3.5-turbo"
# This path leads to a file with data and precomputed embeddings
embedding\_path = "data/library\_transactions\_with\_embeddings\_359.csv"`
```
## Clustering
We’ll reuse the approach from the [Clustering Notebook](Clustering.ipynb), using K-Means to cluster our dataset using the feature embeddings we created previously. We’ll then use the Completions endpoint to generate cluster descriptions for us and judge their effectiveness
```
`df = pd.read\_csv(embedding\_path)
df.head()`
```
||Date|Supplier|Description|Transaction value (£)|combined|n\_tokens|embedding|
|0|21/04/2016|M & J Ballantyne Ltd|George IV Bridge Work|35098.0|Supplier: M & J Ballantyne Ltd; Description: G...|118|[-0.013169967569410801, -0.004833734128624201,...|
|1|26/04/2016|Private Sale|Literary & Archival Items|30000.0|Supplier: Private Sale; Description: Literary ...|114|[-0.019571533426642418, -0.010801066644489765,...|
|2|30/04/2016|City Of Edinburgh Council|Non Domestic Rates|40800.0|Supplier: City Of Edinburgh Council; Descripti...|114|[-0.0054041435942053795, -6.548957026097924e-0...|
|3|09/05/2016|Computacenter Uk|Kelvin Hall|72835.0|Supplier: Computacenter Uk; Description: Kelvi...|113|[-0.004776035435497761, -0.005533686839044094,...|
|4|09/05/2016|John Graham Construction Ltd|Causewayside Refurbishment|64361.0|Supplier: John Graham Construction Ltd; Descri...|117|[0.003290407592430711, -0.0073441751301288605,...|
```
`embedding\_df = pd.read\_csv(embedding\_path)
embedding\_df["embedding"] = embedding\_df.embedding.apply(literal\_eval).apply(np.array)
matrix = np.vstack(embedding\_df.embedding.values)
matrix.shape`
```
```
`(359, 1536)`
```
```
`n\_clusters = 5
kmeans = KMeans(n\_clusters=n\_clusters, init="k-means++", random\_state=42, n\_init=10)
kmeans.fit(matrix)
labels = kmeans.labels\_
embedding\_df["Cluster"] = labels`
```
```
`tsne = TSNE(
n\_components=2, perplexity=15, random\_state=42, init="random", learning\_rate=200
)
vis\_dims2 = tsne.fit\_transform(matrix)
x = [x for x, y in vis\_dims2]
y = [y for x, y in vis\_dims2]
for category, color in enumerate(["purple", "green", "red", "blue","yellow"]):
xs = np.array(x)[embedding\_df.Cluster == category]
ys = np.array(y)[embedding\_df.Cluster == category]
plt.scatter(xs, ys, color=color, alpha=0.3)
avg\_x = xs.mean()
avg\_y = ys.mean()
plt.scatter(avg\_x, avg\_y, marker="x", color=color, s=100)
plt.title("Clusters identified visualized in language 2d using t-SNE")`
```
```
`Text(0.5, 1.0, 'Clusters identified visualized in language 2d using t-SNE')`
```
```
`# We'll read 10 transactions per cluster as we're expecting some variation
transactions\_per\_cluster = 10
for i in range(n\_clusters):
print(f"Cluster {i} Theme:\\n")
transactions = "\\n".join(
embedding\_df[embedding\_df.Cluster == i]
.combined.str.replace("Supplier: ", "")
.str.replace("Description: ", ": ")
.str.replace("Value: ", ": ")
.sample(transactions\_per\_cluster, random\_state=42)
.values
)
response = client.chat.completions.create(
model=COMPLETIONS\_MODEL,
# We'll include a prompt to instruct the model what sort of description we're looking for
messages=[
{"role": "user",
"content": f'''We want to group these transactions into meaningful clusters so we can target the areas we are spending the most money.
What do the following transactions have in common?\\n\\nTransactions:\\n"""\\n{transactions}\\n"""\\n\\nTheme:'''}
],
temperature=0,
max\_tokens=100,
top\_p=1,
frequency\_penalty=0,
presence\_penalty=0,
)
print(response.choices[0].message.content.replace("\\n", ""))
print("\\n")
sample\_cluster\_rows = embedding\_df[embedding\_df.Cluster == i].sample(transactions\_per\_cluster, random\_state=42)
for j in range(transactions\_per\_cluster):
print(sample\_cluster\_rows.Supplier.values[j], end=", ")
print(sample\_cluster\_rows.Description.values[j], end="\\n")
print("-" \* 100)
print("\\n")`
```
```
`Cluster 0 Theme:
The common theme among these transactions is that they all involve spending money on various expenses such as electricity, non-domestic rates, IT equipment, computer equipment, and the purchase of an electric van.
EDF ENERGY, Electricity Oct 2019 3 buildings
City Of Edinburgh Council, Non Domestic Rates
EDF, Electricity
EX LIBRIS, IT equipment
City Of Edinburgh Council, Non Domestic Rates
CITY OF EDINBURGH COUNCIL, Rates for 33 Salisbury Place
EDF Energy, Electricity
XMA Scotland Ltd, IT equipment
Computer Centre UK Ltd, Computer equipment
ARNOLD CLARK, Purchase of an electric van
----------------------------------------------------------------------------------------------------
Cluster 1 Theme:
The common theme among these transactions is that they all involve payments for various goods and services. Some specific examples include student bursary costs, collection of papers, architectural works, legal deposit services, papers related to Alisdair Gray, resources on slavery abolition and social justice, collection items, online/print subscriptions, ALDL charges, and literary/archival items.
Institute of Conservation, This payment covers 2 invoices for student bursary costs
PRIVATE SALE, Collection of papers of an individual
LEE BOYD LIMITED, Architectural Works
ALDL, Legal Deposit Services
RICK GEKOSKI, Papers 1970's to 2019 Alisdair Gray
ADAM MATTHEW DIGITAL LTD, Resource - slavery abolution and social justice
PROQUEST INFORMATION AND LEARN, This payment covers multiple invoices for collection items
LM Information Delivery UK LTD, Payment of 18 separate invoice for Online/Print subscriptions Jan 20-Dec 20
ALDL, ALDL Charges
Private Sale, Literary & Archival Items
----------------------------------------------------------------------------------------------------
Cluster 2 Theme:
The common theme among these transactions is that they all involve spending money at Kelvin Hall.
CBRE, Kelvin Hall
GLASGOW CITY COUNCIL, Kelvin Hall
University Of Glasgow, Kelvin Hall
GLASGOW LIFE, Oct 20 to Dec 20 service charge - Kelvin Hall
Computacenter Uk, Kelvin Hall
XMA Scotland Ltd, Kelvin Hall
GLASGOW LIFE, Service Charges Kelvin Hall 01/07/19-30/09/19
Glasgow Life, Kelvin Hall Service Charges
Glasgow City Council, Kelvin Hall
GLASGOW LIFE, Quarterly service charge KH
----------------------------------------------------------------------------------------------------
Cluster 3 Theme:
The common theme among these transactions is that they all involve payments for facility management fees and services provided by ECG Facilities Service.
ECG FACILITIES SERVICE, This payment covers multiple invoices for facility management fees
ECG FACILITIES SERVICE, Facilities Management Charge
ECG FACILITIES SERVICE, Inspection and Maintenance of all Library properties
ECG Facilities Service, Facilities Management Charge
ECG FACILITIES SERVICE, Maintenance contract - October
ECG FACILITIES SERVICE, Electrical and mechanical works
ECG FACILITIES SERVICE, This payment covers multiple invoices for facility management fees
ECG FACILITIES SERVICE, CB Bolier Replacement (1),USP Batteries,Gutter Works & Cleaning of pigeon fouling
ECG Facilities Service, Facilities Management Charge
ECG Facilities Service, Facilities Management Charge
----------------------------------------------------------------------------------------------------
Cluster 4 Theme:
The common theme among these transactions is that they all involve construction or refurbishment work.
M & J Ballantyne Ltd, George IV Bridge Work
John Graham Construction Ltd, Causewayside Refurbishment
John Graham Construction Ltd, Causewayside Refurbishment
John Graham Construction Ltd, Causewayside Refurbishment
John Graham Construction Ltd, Causewayside Refurbishment
ARTHUR MCKAY BUILDING SERVICES, Causewayside Work
John Graham Construction Ltd, Causewayside Refurbishment
Morris & Spottiswood Ltd, George IV Bridge Work
ECG FACILITIES SERVICE, Causewayside IT Work
John Graham Construction Ltd, Causewayside Refurbishment
----------------------------------------------------------------------------------------------------`
```
### Conclusion
We now have five new clusters that we can use to describe our data. Looking at the visualisation some of our clusters have some overlap and we’ll need some tuning to get to the right place, but already we can see that GPT-3 has made some effective inferences. In particular, it picked up that items including legal deposits were related to literature archival, which is true but the model was given no clues on. Very cool, and with some tuning we can create a base set of clusters that we can then use with a multiclass classifier to generalise to other transactional datasets we might use.