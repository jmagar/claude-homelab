Robust question answering with Chroma and OpenAI
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
Apr 23, 2025
# Robust question answering with Chroma and OpenAI
[ AT ](https://github.com/atroyn)[ BB ](https://www.linkedin.com/in/brandonbaker18)
[ atroyn , ](https://github.com/atroyn)[ Brandon Baker
(OpenAI)
](https://www.linkedin.com/in/brandonbaker18)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/chroma/hyde-with-chroma-and-openai.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/chroma/hyde-with-chroma-and-openai.ipynb)
This notebook guides you step-by-step through answering questions about a collection of data, using [Chroma](https://trychroma.com), an open-source embeddings database, along with OpenAI’s [text embeddings](https://platform.openai.com/docs/guides/embeddings/use-cases) and [chat completion](https://platform.openai.com/docs/guides/chat) API’s.
Additionally, this notebook demonstrates some of the tradeoffs in making a question answering system more robust. As we shall see, *simple querying doesn’t always create the best results*!
## Question Answering with LLMs
Large language models (LLMs) like OpenAI’s ChatGPT can be used to answer questions about data that the model may not have been trained on, or have access to. For example;
* Personal data like e-mails and notes
* Highly specialized data like archival or legal documents
* Newly created data like recent news stories
In order to overcome this limitation, we can use a data store which is amenable to querying in natural language, just like the LLM itself. An embeddings store like Chroma represents documents as [embeddings](https://openai.com/blog/introducing-text-and-code-embeddings), alongside the documents themselves.
By embedding a text query, Chroma can find relevant documents, which we can then pass to the LLM to answer our question. We’ll show detailed examples and variants of this approach.
# Setup and preliminaries
First we make sure the python dependencies we need are installed.
```
`%pip install -qU openai chromadb pandas`
```
```
`Note: you may need to restart the kernel to use updated packages.`
```
We use OpenAI’s API’s throughout this notebook. You can get an API key from [https://beta.openai.com/account/api-keys](https://beta.openai.com/account/api-keys)
You can add your API key as an environment variable by executing the command `export OPENAI\_API\_KEY=sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx` in a terminal. Note that you will need to reload the notebook if the environment variable wasn’t set yet. Alternatively, you can set it in the notebook, see below.
```
`import os
from openai import OpenAI
# Uncomment the following line to set the environment variable in the notebook
# os.environ["OPENAI\_API\_KEY"] = 'sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
api\_key = os.getenv("OPENAI\_API\_KEY")
if api\_key:
client = OpenAI(api\_key=api\_key)
print("OpenAI client is ready")
else:
print("OPENAI\_API\_KEY environment variable not found")`
```
```
`OpenAI client is ready`
```
```
`# Set the model for all API calls
OPENAI\_MODEL = "gpt-4o"`
```
# Dataset
Throughout this notebook, we use the [SciFact dataset](https://github.com/allenai/scifact). This is a curated dataset of expert annotated scientific claims, with an accompanying text corpus of paper titles and abstracts. Each claim may be supported, contradicted, or not have enough evidence either way, according to the documents in the corpus.
Having the corpus available as ground-truth allows us to investigate how well the following approaches to LLM question answering perform.
```
`# Load the claim dataset
import pandas as pd
data\_path = '../../data'
claim\_df = pd.read\_json(f'{data\_path}/scifact\_claims.jsonl', lines=True)
claim\_df.head()`
```
||id|claim|evidence|cited\_doc\_ids|
|0|1|0-dimensional biomaterials show inductive prop...|{}|[31715818]|
|1|3|1,000 genomes project enables mapping of genet...|{'14717500': [{'sentences': [2, 5], 'label': '...|[14717500]|
|2|5|1/2000 in UK have abnormal PrP positivity.|{'13734012': [{'sentences': [4], 'label': 'SUP...|[13734012]|
|3|13|5% of perinatal mortality is due to low birth ...|{}|[1606628]|
|4|36|A deficiency of vitamin B12 increases blood le...|{}|[5152028, 11705328]|
# Just asking the model
ChatGPT was trained on a large amount of scientific information. As a baseline, we’d like to understand what the model already knows without any further context. This will allow us to calibrate overall performance.
We construct an appropriate prompt, with some example facts, then query the model with each claim in the dataset. We ask the model to assess a claim as ‘True’, ‘False’, or ‘NEE’ if there is not enough evidence one way or the other.
```
`def build\_prompt(claim):
return [
{"role": "system", "content": "I will ask you to assess a scientific claim. Output only the text 'True' if the claim is true, 'False' if the claim is false, or 'NEE' if there's not enough evidence."},
{"role": "user", "content": f"""
Example:
Claim:
0-dimensional biomaterials show inductive properties.
Assessment:
False
Claim:
1/2000 in UK have abnormal PrP positivity.
Assessment:
True
Claim:
Aspirin inhibits the production of PGE2.
Assessment:
False
End of examples. Assess the following claim:
Claim:
{claim}
Assessment:
"""}
]
def assess\_claims(claims):
responses = []
# Query the OpenAI API
for claim in claims:
response = client.chat.completions.create(
model=OPENAI\_MODEL,
messages=build\_prompt(claim),
max\_tokens=3,
)
# Strip any punctuation or whitespace from the response
responses.append(response.choices[0].message.content.strip('., '))
return responses`
```
We sample 50 claims from the dataset
```
`# Let's take a look at 50 claims
samples = claim\_df.sample(50)
claims = samples['claim'].tolist()`
```
We evaluate the ground-truth according to the dataset. From the dataset description, each claim is either supported or contradicted by the evidence, or else there isn’t enough evidence either way.
```
`def get\_groundtruth(evidence):
groundtruth = []
for e in evidence:
# Evidence is empty
if len(e) == 0:
groundtruth.append('NEE')
else:
# In this dataset, all evidence for a given claim is consistent, either SUPPORT or CONTRADICT
if list(e.values())[0][0]['label'] == 'SUPPORT':
groundtruth.append('True')
else:
groundtruth.append('False')
return groundtruth`
```
```
`evidence = samples['evidence'].tolist()
groundtruth = get\_groundtruth(evidence)`
```
We also output the confusion matrix, comparing the model’s assessments with the ground truth, in an easy to read table.
```
`def confusion\_matrix(inferred, groundtruth):
assert len(inferred) == len(groundtruth)
confusion = {
'True': {'True': 0, 'False': 0, 'NEE': 0},
'False': {'True': 0, 'False': 0, 'NEE': 0},
'NEE': {'True': 0, 'False': 0, 'NEE': 0},
}
for i, g in zip(inferred, groundtruth):
confusion[i][g] += 1
# Pretty print the confusion matrix
print('\\tGroundtruth')
print('\\tTrue\\tFalse\\tNEE')
for i in confusion:
print(i, end='\\t')
for g in confusion[i]:
print(confusion[i][g], end='\\t')
print()
return confusion`
```
We ask the model to directly assess the claims, without additional context.
```
`gpt\_inferred = assess\_claims(claims)
confusion\_matrix(gpt\_inferred, groundtruth)`
```
```
` Groundtruth
True False NEE
True 9 3 15
False 0 3 2
NEE 8 6 4`
```
```
`{'True': {'True': 9, 'False': 3, 'NEE': 15},
'False': {'True': 0, 'False': 3, 'NEE': 2},
'NEE': {'True': 8, 'False': 6, 'NEE': 4}}`
```
## Results
From these results we see that the LLM is strongly biased to assess claims as true, even when they are false, and also tends to assess false claims as not having enough evidence. Note that ‘not enough evidence’ is with respect to the model’s assessment of the claim in a vacuum, without additional context.
# Adding context
We now add the additional context available from the corpus of paper titles and abstracts. This section shows how to load a text corpus into Chroma, using OpenAI text embeddings.
First, we load the text corpus.
```
`# Load the corpus into a dataframe
corpus\_df = pd.read\_json(f'{data\_path}/scifact\_corpus.jsonl', lines=True)
corpus\_df.head()`
```
||doc\_id|title|abstract|structured|
|0|4983|Microstructural development of human newborn c...|[Alterations of the architecture of cerebral w...|False|
|1|5836|Induction of myelodysplasia by myeloid-derived...|[Myelodysplastic syndromes (MDS) are age-depen...|False|
|2|7912|BC1 RNA, the transcript from a master gene for...|[ID elements are short interspersed elements (...|False|
|3|18670|The DNA Methylome of Human Peripheral Blood Mo...|[DNA methylation plays an important role in bi...|False|
|4|19238|The human myelin basic protein gene is include...|[Two human Golli (for gene expressed in the ol...|False|
## Loading the corpus into Chroma
The next step is to load the corpus into Chroma. Given an embedding function, Chroma will automatically handle embedding each document, and will store it alongside its text and metadata, making it simple to query.
We instantiate a (ephemeral) Chroma client, and create a collection for the SciFact title and abstract corpus.
Chroma can also be instantiated in a persisted configuration; learn more at the [Chroma docs](https://docs.trychroma.com/usage-guide?lang=py).
```
`import chromadb
from chromadb.utils.embedding\_functions import OpenAIEmbeddingFunction
# We initialize an embedding function, and provide it to the collection.
embedding\_function = OpenAIEmbeddingFunction(api\_key=os.getenv("OPENAI\_API\_KEY"))
chroma\_client = chromadb.Client() # Ephemeral by default
scifact\_corpus\_collection = chroma\_client.create\_collection(name='scifact\_corpus', embedding\_function=embedding\_function)`
```
Next we load the corpus into Chroma. Because this data loading is memory intensive, we recommend using a batched loading scheme in batches of 50-1000. For this example it should take just over one minute for the entire corpus. It’s being embedded in the background, automatically, using the `embedding\_function` we specified earlier.
```
`batch\_size = 100
for i in range(0, len(corpus\_df), batch\_size):
batch\_df = corpus\_df[i:i+batch\_size]
scifact\_corpus\_collection.add(
ids=batch\_df['doc\_id'].apply(lambda x: str(x)).tolist(), # Chroma takes string IDs.
documents=(batch\_df['title'] + '. ' + batch\_df['abstract'].apply(lambda x: ' '.join(x))).to\_list(), # We concatenate the title and abstract.
metadatas=[{"structured": structured} for structured in batch\_df['structured'].to\_list()] # We also store the metadata, though we don't use it in this example.
)`
```
## Retrieving context
Next we retrieve documents from the corpus which may be relevant to each claim in our sample. We want to provide these as context to the LLM for evaluating the claims. We retrieve the 3 most relevant documents for each claim, according to the embedding distance.
```
`claim\_query\_result = scifact\_corpus\_collection.query(query\_texts=claims, include=['documents', 'distances'], n\_results=3)`
```
We create a new prompt, this time taking into account the additional context we retrieve from the corpus.
```
`def build\_prompt\_with\_context(claim, context):
return [{'role': 'system', 'content': "I will ask you to assess whether a particular scientific claim, based on evidence provided. Output only the text 'True' if the claim is true, 'False' if the claim is false, or 'NEE' if there's not enough evidence."},
{'role': 'user', 'content': f""""
The evidence is the following:
{' '.join(context)}
Assess the following claim on the basis of the evidence. Output only the text 'True' if the claim is true, 'False' if the claim is false, or 'NEE' if there's not enough evidence. Do not output any other text.
Claim:
{claim}
Assessment:
"""}]
def assess\_claims\_with\_context(claims, contexts):
responses = []
# Query the OpenAI API
for claim, context in zip(claims, contexts):
# If no evidence is provided, return NEE
if len(context) == 0:
responses.append('NEE')
continue
response = client.chat.completions.create(
model=OPENAI\_MODEL,
messages=build\_prompt\_with\_context(claim=claim, context=context),
max\_tokens=3,
)
# Strip any punctuation or whitespace from the response
responses.append(response.choices[0].message.content.strip('., '))
return responses`
```
Then ask the model to evaluate the claims with the retrieved context.
```
`gpt\_with\_context\_evaluation = assess\_claims\_with\_context(claims, claim\_query\_result['documents'])
confusion\_matrix(gpt\_with\_context\_evaluation, groundtruth)`
```
```
` Groundtruth
True False NEE
True 13 1 4
False 1 10 2
NEE 3 1 15`
```
```
`{'True': {'True': 13, 'False': 1, 'NEE': 4},
'False': {'True': 1, 'False': 10, 'NEE': 2},
'NEE': {'True': 3, 'False': 1, 'NEE': 15}}`
```
## Results
We see that the model performs better overall, and is now significantly better at correctly identifying false claims. Additionally, most NEE cases are also correctly identified now.
Taking a look at the retrieved documents, we see that they are sometimes not relevant to the claim - this causes the model to be confused by the extra information, and it may decide that sufficient evidence is present, even when the information is irrelevant. This happens because we always ask for the 3 ‘most’ relevant documents, but these might not be relevant at all beyond a certain point.
## Filtering context on relevance
Along with the documents themselves, Chroma returns a distance score. We can try thresholding on distance, so that fewer irrelevant documents make it into the context we provide the model.
If, after filtering on the threshold, no context documents remain, we bypass the model and simply return that there is not enough evidence.
```
`def filter\_query\_result(query\_result, distance\_threshold=0.25):
# For each query result, retain only the documents whose distance is below the threshold
for ids, docs, distances in zip(query\_result['ids'], query\_result['documents'], query\_result['distances']):
for i in range(len(ids)-1, -1, -1):
if distances[i] \> distance\_threshold:
ids.pop(i)
docs.pop(i)
distances.pop(i)
return query\_result`
```
```
`filtered\_claim\_query\_result = filter\_query\_result(claim\_query\_result)`
```
Now we assess the claims using this cleaner context.
```
`gpt\_with\_filtered\_context\_evaluation = assess\_claims\_with\_context(claims, filtered\_claim\_query\_result['documents'])
confusion\_matrix(gpt\_with\_filtered\_context\_evaluation, groundtruth)`
```
```
` Groundtruth
True False NEE
True 9 0 1
False 0 7 0
NEE 8 5 20`
```
```
`{'True': {'True': 9, 'False': 0, 'NEE': 1},
'False': {'True': 0, 'False': 7, 'NEE': 0},
'NEE': {'True': 8, 'False': 5, 'NEE': 20}}`
```
## Results
The model now assesses many fewer claims as True or False when there is not enough evidence present. However, it also is now much more cautious, tending to label most items as not enough evidence, biasing away from certainty. Most claims are now assessed as having not enough evidence, because a large fraction of them are filtered out by the distance threshold. It’s possible to tune the distance threshold to find the optimal operating point, but this can be difficult, and is dataset and embedding model dependent.
# Hypothetical Document Embeddings: Using hallucinations productively
We want to be able to retrieve relevant documents, without retrieving less relevant ones which might confuse the model. One way to accomplish this is to improve the retrieval query.
Until now, we have queried the dataset using *claims* which are single sentence statements, while the corpus contains *abstracts* describing a scientific paper. Intuitively, while these might be related, there are significant differences in their structure and meaning. These differences are encoded by the embedding model, and so influence the distances between the query and the most relevant results.
We can overcome this by leveraging the power of LLMs to generate relevant text. While the facts might be hallucinated, the content and structure of the documents the models generate is more similar to the documents in our corpus, than the queries are. This could lead to better queries and hence better results.
This approach is called [Hypothetical Document Embeddings (HyDE)](https://arxiv.org/abs/2212.10496), and has been shown to be quite good at the retrieval task. It should help us bring more relevant information into the context, without polluting it.
TL;DR:
* you get much better matches when you embed whole abstracts rather than single sentences
* but claims are usually single sentences
* So HyDE shows that using GPT3 to expand claims into hallucinated abstracts and then searching based on those abstracts works (claims -\> abstracts -\> results) better than searching directly (claims -\> results)
First, we use in-context examples to prompt the model to generate documents similar to what’s in the corpus, for each claim we want to assess.
```
`def build\_hallucination\_prompt(claim):
return [{'role': 'system', 'content': """I will ask you to write an abstract for a scientific paper which supports or refutes a given claim. It should be written in scientific language, include a title. Output only one abstract, then stop.
An Example:
Claim:
A high microerythrocyte count raises vulnerability to severe anemia in homozygous alpha (+)- thalassemia trait subjects.
Abstract:
BACKGROUND The heritable haemoglobinopathy alpha(+)-thalassaemia is caused by the reduced synthesis of alpha-globin chains that form part of normal adult haemoglobin (Hb). Individuals homozygous for alpha(+)-thalassaemia have microcytosis and an increased erythrocyte count. Alpha(+)-thalassaemia homozygosity confers considerable protection against severe malaria, including severe malarial anaemia (SMA) (Hb concentration \< 50 g/l), but does not influence parasite count. We tested the hypothesis that the erythrocyte indices associated with alpha(+)-thalassaemia homozygosity provide a haematological benefit during acute malaria.
METHODS AND FINDINGS Data from children living on the north coast of Papua New Guinea who had participated in a case-control study of the protection afforded by alpha(+)-thalassaemia against severe malaria were reanalysed to assess the genotype-specific reduction in erythrocyte count and Hb levels associated with acute malarial disease. We observed a reduction in median erythrocyte count of approximately 1.5 x 10(12)/l in all children with acute falciparum malaria relative to values in community children (p \< 0.001). We developed a simple mathematical model of the linear relationship between Hb concentration and erythrocyte count. This model predicted that children homozygous for alpha(+)-thalassaemia lose less Hb than children of normal genotype for a reduction in erythrocyte count of \>1.1 x 10(12)/l as a result of the reduced mean cell Hb in homozygous alpha(+)-thalassaemia. In addition, children homozygous for alpha(+)-thalassaemia require a 10% greater reduction in erythrocyte count than children of normal genotype (p = 0.02) for Hb concentration to fall to 50 g/l, the cutoff for SMA. We estimated that the haematological profile in children homozygous for alpha(+)-thalassaemia reduces the risk of SMA during acute malaria compared to children of normal genotype (relative risk 0.52; 95% confidence interval [CI] 0.24-1.12, p = 0.09).
CONCLUSIONS The increased erythrocyte count and microcytosis in children homozygous for alpha(+)-thalassaemia may contribute substantially to their protection against SMA. A lower concentration of Hb per erythrocyte and a larger population of erythrocytes may be a biologically advantageous strategy against the significant reduction in erythrocyte count that occurs during acute infection with the malaria parasite Plasmodium falciparum. This haematological profile may reduce the risk of anaemia by other Plasmodium species, as well as other causes of anaemia. Other host polymorphisms that induce an increased erythrocyte count and microcytosis may confer a similar advantage.
End of example.
"""}, {'role': 'user', 'content': f""""
Perform the task for the following claim.
Claim:
{claim}
Abstract:
"""}]
def hallucinate\_evidence(claims):
responses = []
# Query the OpenAI API
for claim in claims:
response = client.chat.completions.create(
model=OPENAI\_MODEL,
messages=build\_hallucination\_prompt(claim),
)
responses.append(response.choices[0].message.content)
return responses`
```
We hallucinate a document for each claim.
*NB: This can take a while, about 7m for 100 claims*. You can reduce the number of claims we want to assess to get results more quickly.
```
`hallucinated\_evidence = hallucinate\_evidence(claims)`
```
We use the hallucinated documents as queries into the corpus, and filter the results using the same distance threshold.
```
`hallucinated\_query\_result = scifact\_corpus\_collection.query(query\_texts=hallucinated\_evidence, include=['documents', 'distances'], n\_results=3)
filtered\_hallucinated\_query\_result = filter\_query\_result(hallucinated\_query\_result)`
```
We then ask the model to assess the claims, using the new context.
```
`gpt\_with\_hallucinated\_context\_evaluation = assess\_claims\_with\_context(claims, filtered\_hallucinated\_query\_result['documents'])
confusion\_matrix(gpt\_with\_hallucinated\_context\_evaluation, groundtruth)`
```
```
` Groundtruth
True False NEE
True 13 0 3
False 1 10 1
NEE 3 2 17`
```
```
`{'True': {'True': 13, 'False': 0, 'NEE': 3},
'False': {'True': 1, 'False': 10, 'NEE': 1},
'NEE': {'True': 3, 'False': 2, 'NEE': 17}}`
```
## Results
Combining HyDE with a simple distance threshold leads to a significant improvement. The model no longer biases assessing claims as True, nor toward their not being enough evidence. It also correctly assesses when there isn’t enough evidence more often.
# Conclusion
Equipping LLMs with a context based on a corpus of documents is a powerful technique for bringing the general reasoning and natural language interactions of LLMs to your own data. However, it’s important to know that naive query and retrieval may not produce the best possible results! Ultimately understanding the data will help get the most out of the retrieval based question-answering approach.