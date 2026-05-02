Azure AI Search as a vector database for OpenAI embeddings
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
Sep 11, 2023
# Azure AI Search as a vector database for OpenAI embeddings
[ FA ](https://github.com/farzad528)
[ farzad528 ](https://github.com/farzad528)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/azuresearch/Getting_started_with_azure_ai_search_and_openai.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/azuresearch/Getting_started_with_azure_ai_search_and_openai.ipynb)
This notebook provides step by step instuctions on using Azure AI Search (f.k.a Azure Cognitive Search) as a vector database with OpenAI embeddings. Azure AI Search is a cloud search service that gives developers infrastructure, APIs, and tools for building a rich search experience over private, heterogeneous content in web, mobile, and enterprise applications.
## Prerequistites:
For the purposes of this exercise you must have the following:
* [Azure AI Search Service](https://learn.microsoft.com/azure/search/)
* [OpenAI Key](https://platform.openai.com/account/api-keys) or [Azure OpenAI credentials](https://learn.microsoft.com/azure/cognitive-services/openai/)
```
`! pip install wget
! pip install azure-search-documents
! pip install azure-identity
! pip install openai`
```
## Import required libraries
```
`import json
import wget
import pandas as pd
import zipfile
from openai import AzureOpenAI
from azure.identity import DefaultAzureCredential, get\_bearer\_token\_provider
from azure.core.credentials import AzureKeyCredential
from azure.search.documents import SearchClient, SearchIndexingBufferedSender
from azure.search.documents.indexes import SearchIndexClient
from azure.search.documents.models import (
QueryAnswerType,
QueryCaptionType,
QueryType,
VectorizedQuery,
)
from azure.search.documents.indexes.models import (
HnswAlgorithmConfiguration,
HnswParameters,
SearchField,
SearchableField,
SearchFieldDataType,
SearchIndex,
SemanticConfiguration,
SemanticField,
SemanticPrioritizedFields,
SemanticSearch,
SimpleField,
VectorSearch,
VectorSearchAlgorithmKind,
VectorSearchAlgorithmMetric,
VectorSearchProfile,
)`
```
## Configure OpenAI settings
This section guides you through setting up authentication for Azure OpenAI, allowing you to securely interact with the service using either Azure Active Directory (AAD) or an API key. Before proceeding, ensure you have your Azure OpenAI endpoint and credentials ready. For detailed instructions on setting up AAD with Azure OpenAI, refer to the [official documentation](https://learn.microsoft.com/azure/ai-services/openai/how-to/managed-identity).
```
`endpoint: str = "YOUR\_AZURE\_OPENAI\_ENDPOINT"
api\_key: str = "YOUR\_AZURE\_OPENAI\_KEY"
api\_version: str = "2023-05-15"
deployment = "YOUR\_AZURE\_OPENAI\_DEPLOYMENT\_NAME"
credential = DefaultAzureCredential()
token\_provider = get\_bearer\_token\_provider(
credential, "https://cognitiveservices.azure.com/.default"
)
# Set this flag to True if you are using Azure Active Directory
use\_aad\_for\_aoai = True
if use\_aad\_for\_aoai:
# Use Azure Active Directory (AAD) authentication
client = AzureOpenAI(
azure\_endpoint=endpoint,
api\_version=api\_version,
azure\_ad\_token\_provider=token\_provider,
)
else:
# Use API key authentication
client = AzureOpenAI(
api\_key=api\_key,
api\_version=api\_version,
azure\_endpoint=endpoint,
)`
```
## Configure Azure AI Search Vector Store settings
This section explains how to set up the Azure AI Search client for integrating with the Vector Store feature. You can locate your Azure AI Search service details in the Azure Portal or programmatically via the [Search Management SDK](https://learn.microsoft.com/rest/api/searchmanagement/).
```
`# Configuration
search\_service\_endpoint: str = "YOUR\_AZURE\_SEARCH\_ENDPOINT"
search\_service\_api\_key: str = "YOUR\_AZURE\_SEARCH\_ADMIN\_KEY"
index\_name: str = "azure-ai-search-openai-cookbook-demo"
# Set this flag to True if you are using Azure Active Directory
use\_aad\_for\_search = True
if use\_aad\_for\_search:
# Use Azure Active Directory (AAD) authentication
credential = DefaultAzureCredential()
else:
# Use API key authentication
credential = AzureKeyCredential(search\_service\_api\_key)
# Initialize the SearchClient with the selected authentication method
search\_client = SearchClient(
endpoint=search\_service\_endpoint, index\_name=index\_name, credential=credential
)`
```
## Load data
```
`embeddings\_url = "https://cdn.openai.com/API/examples/data/vector\_database\_wikipedia\_articles\_embedded.zip"
# The file is \~700 MB so this will take some time
wget.download(embeddings\_url)`
```
```
`'vector\_database\_wikipedia\_articles\_embedded.zip'`
```
```
`with zipfile.ZipFile("vector\_database\_wikipedia\_articles\_embedded.zip", "r") as zip\_ref:
zip\_ref.extractall("../../data")`
```
```
`article\_df = pd.read\_csv("../../data/vector\_database\_wikipedia\_articles\_embedded.csv")
# Read vectors from strings back into a list using json.loads
article\_df["title\_vector"] = article\_df.title\_vector.apply(json.loads)
article\_df["content\_vector"] = article\_df.content\_vector.apply(json.loads)
article\_df["vector\_id"] = article\_df["vector\_id"].apply(str)
article\_df.head()`
```
||id|url|title|text|title\_vector|content\_vector|vector\_id|
|0|1|https://simple.wikipedia.org/wiki/April|April|April is the fourth month of the year in the J...|[0.001009464613161981, -0.020700545981526375, ...|[-0.011253940872848034, -0.013491976074874401,...|0|
|1|2|https://simple.wikipedia.org/wiki/August|August|August (Aug.) is the eighth month of the year ...|[0.0009286514250561595, 0.000820168002974242, ...|[0.0003609954728744924, 0.007262262050062418, ...|1|
|2|6|https://simple.wikipedia.org/wiki/Art|Art|Art is a creative activity that expresses imag...|[0.003393713850528002, 0.0061537534929811954, ...|[-0.004959689453244209, 0.015772193670272827, ...|2|
|3|8|https://simple.wikipedia.org/wiki/A|A|A or a is the first letter of the English alph...|[0.0153952119871974, -0.013759135268628597, 0....|[0.024894846603274345, -0.022186409682035446, ...|3|
|4|9|https://simple.wikipedia.org/wiki/Air|Air|Air refers to the Earth's atmosphere. Air is a...|[0.02224554680287838, -0.02044147066771984, -0...|[0.021524671465158463, 0.018522677943110466, -...|4|
## Create an index
This code snippet demonstrates how to define and create a search index using the `SearchIndexClient` from the Azure AI Search Python SDK. The index incorporates both vector search and semantic ranker capabilities. For more details, visit our documentation on how to [Create a Vector Index](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index?.tabs=config-2023-11-01,rest-2023-11-01,push,portal-check-index)
```
`# Initialize the SearchIndexClient
index\_client = SearchIndexClient(
endpoint=search\_service\_endpoint, credential=credential
)
# Define the fields for the index
fields = [
SimpleField(name="id", type=SearchFieldDataType.String),
SimpleField(name="vector\_id", type=SearchFieldDataType.String, key=True),
SimpleField(name="url", type=SearchFieldDataType.String),
SearchableField(name="title", type=SearchFieldDataType.String),
SearchableField(name="text", type=SearchFieldDataType.String),
SearchField(
name="title\_vector",
type=SearchFieldDataType.Collection(SearchFieldDataType.Single),
vector\_search\_dimensions=1536,
vector\_search\_profile\_name="my-vector-config",
),
SearchField(
name="content\_vector",
type=SearchFieldDataType.Collection(SearchFieldDataType.Single),
vector\_search\_dimensions=1536,
vector\_search\_profile\_name="my-vector-config",
),
]
# Configure the vector search configuration
vector\_search = VectorSearch(
algorithms=[
HnswAlgorithmConfiguration(
name="my-hnsw",
kind=VectorSearchAlgorithmKind.HNSW,
parameters=HnswParameters(
m=4,
ef\_construction=400,
ef\_search=500,
metric=VectorSearchAlgorithmMetric.COSINE,
),
)
],
profiles=[
VectorSearchProfile(
name="my-vector-config",
algorithm\_configuration\_name="my-hnsw",
)
],
)
# Configure the semantic search configuration
semantic\_search = SemanticSearch(
configurations=[
SemanticConfiguration(
name="my-semantic-config",
prioritized\_fields=SemanticPrioritizedFields(
title\_field=SemanticField(field\_name="title"),
keywords\_fields=[SemanticField(field\_name="url")],
content\_fields=[SemanticField(field\_name="text")],
),
)
]
)
# Create the search index with the vector search and semantic search configurations
index = SearchIndex(
name=index\_name,
fields=fields,
vector\_search=vector\_search,
semantic\_search=semantic\_search,
)
# Create or update the index
result = index\_client.create\_or\_update\_index(index)
print(f"{result.name} created")`
```
```
`azure-ai-search-openai-cookbook-demo created`
```
## Uploading Data to Azure AI Search Index
The following code snippet outlines the process of uploading a batch of documents—specifically, Wikipedia articles with pre-computed embeddings—from a pandas DataFrame to an Azure AI Search index. For a detailed guide on data import strategies and best practices, refer to [Data Import in Azure AI Search](https://learn.microsoft.com/azure/search/search-what-is-data-import).
```
`from azure.core.exceptions import HttpResponseError
# Convert the 'id' and 'vector\_id' columns to string so one of them can serve as our key field
article\_df["id"] = article\_df["id"].astype(str)
article\_df["vector\_id"] = article\_df["vector\_id"].astype(str)
# Convert the DataFrame to a list of dictionaries
documents = article\_df.to\_dict(orient="records")
# Create a SearchIndexingBufferedSender
batch\_client = SearchIndexingBufferedSender(
search\_service\_endpoint, index\_name, credential
)
try:
# Add upload actions for all documents in a single call
batch\_client.upload\_documents(documents=documents)
# Manually flush to send any remaining documents in the buffer
batch\_client.flush()
except HttpResponseError as e:
print(f"An error occurred: {e}")
finally:
# Clean up resources
batch\_client.close()
print(f"Uploaded {len(documents)} documents in total")`
```
```
`Uploaded 25000 documents in total`
```
If your dataset didn’t already contain pre-computed embeddings, you can create embeddings by using the below function using the `openai` python library. You’ll also notice the same function and model are being used to generate query embeddings for performing vector searches.
```
`# Example function to generate document embedding
def generate\_embeddings(text, model):
# Generate embeddings for the provided text using the specified model
embeddings\_response = client.embeddings.create(model=model, input=text)
# Extract the embedding data from the response
embedding = embeddings\_response.data[0].embedding
return embedding
first\_document\_content = documents[0]["text"]
print(f"Content: {first\_document\_content[:100]}")
content\_vector = generate\_embeddings(first\_document\_content, deployment)
print("Content vector generated")`
```
```
`Content: April is the fourth month of the year in the Julian and Gregorian calendars, and comes between March
Content vector generated`
```
## Perform a vector similarity search
```
`# Pure Vector Search
query = "modern art in Europe"
search\_client = SearchClient(search\_service\_endpoint, index\_name, credential)
vector\_query = VectorizedQuery(vector=generate\_embeddings(query, deployment), k\_nearest\_neighbors=3, fields="content\_vector")
results = search\_client.search(
search\_text=None,
vector\_queries= [vector\_query],
select=["title", "text", "url"]
)
for result in results:
print(f"Title: {result['title']}")
print(f"Score: {result['@search.score']}")
print(f"URL: {result['url']}\\n")`
```
```
`Title: Documenta
Score: 0.8599451
URL: https://simple.wikipedia.org/wiki/Documenta
Title: Museum of Modern Art
Score: 0.85260946
URL: https://simple.wikipedia.org/wiki/Museum%20of%20Modern%20Art
Title: Expressionism
Score: 0.852354
URL: https://simple.wikipedia.org/wiki/Expressionism`
```
## Perform a Hybrid Search
Hybrid search combines the capabilities of traditional keyword-based search with vector-based similarity search to provide more relevant and contextual results. This approach is particularly useful when dealing with complex queries that benefit from understanding the semantic meaning behind the text.
The provided code snippet demonstrates how to execute a hybrid search query:
```
`# Hybrid Search
query = "Famous battles in Scottish history"
search\_client = SearchClient(search\_service\_endpoint, index\_name, credential)
vector\_query = VectorizedQuery(vector=generate\_embeddings(query, deployment), k\_nearest\_neighbors=3, fields="content\_vector")
results = search\_client.search(
search\_text=query,
vector\_queries= [vector\_query],
select=["title", "text", "url"],
top=3
)
for result in results:
print(f"Title: {result['title']}")
print(f"Score: {result['@search.score']}")
print(f"URL: {result['url']}\\n")`
```
```
`Title: Wars of Scottish Independence
Score: 0.03306011110544205
URL: https://simple.wikipedia.org/wiki/Wars%20of%20Scottish%20Independence
Title: Battle of Bannockburn
Score: 0.022253260016441345
URL: https://simple.wikipedia.org/wiki/Battle%20of%20Bannockburn
Title: Scottish
Score: 0.016393441706895828
URL: https://simple.wikipedia.org/wiki/Scottish`
```
## Perform a Hybrid Search with Reranking (powered by Bing)
[Semantic ranker](https://learn.microsoft.com/azure/search/semantic-search-overview) measurably improves search relevance by using language understanding to rerank search results. Additionally, you can get extractive captions, answers, and highlights.
```
`# Semantic Hybrid Search
query = "What were the key technological advancements during the Industrial Revolution?"
search\_client = SearchClient(search\_service\_endpoint, index\_name, credential)
vector\_query = VectorizedQuery(
vector=generate\_embeddings(query, deployment),
k\_nearest\_neighbors=3,
fields="content\_vector",
)
results = search\_client.search(
search\_text=query,
vector\_queries=[vector\_query],
select=["title", "text", "url"],
query\_type=QueryType.SEMANTIC,
semantic\_configuration\_name="my-semantic-config",
query\_caption=QueryCaptionType.EXTRACTIVE,
query\_answer=QueryAnswerType.EXTRACTIVE,
top=3,
)
semantic\_answers = results.get\_answers()
for answer in semantic\_answers:
if answer.highlights:
print(f"Semantic Answer: {answer.highlights}")
else:
print(f"Semantic Answer: {answer.text}")
print(f"Semantic Answer Score: {answer.score}\\n")
for result in results:
print(f"Title: {result['title']}")
print(f"Reranker Score: {result['@search.reranker\_score']}")
print(f"URL: {result['url']}")
captions = result["@search.captions"]
if captions:
caption = captions[0]
if caption.highlights:
print(f"Caption: {caption.highlights}\\n")
else:
print(f"Caption: {caption.text}\\n")`
```
```
`Semantic Answer: Advancements During the industrial revolution, new technology brought many changes. For example:\<em\> Canals\</em\> were built to allow heavy goods to be moved easily where they were needed. The steam engine became the main source of power. It replaced horses and human labor. Cheap iron and steel became mass-produced.
Semantic Answer Score: 0.90478515625
Title: Industrial Revolution
Reranker Score: 3.408700942993164
URL: https://simple.wikipedia.org/wiki/Industrial%20Revolution
Caption: Advancements During the industrial revolution, new technology brought many changes. For example: Canals were built to allow heavy goods to be moved easily where they were needed. The steam engine became the main source of power. It replaced horses and human labor. Cheap iron and steel became mass-produced.
Title: Printing
Reranker Score: 1.603400707244873
URL: https://simple.wikipedia.org/wiki/Printing
Caption: Machines to speed printing, cheaper paper, automatic stitching and binding all arrived in the 19th century during the industrial revolution. What had once been done by a few men by hand was now done by limited companies on huge machines. The result was much lower prices, and a much wider readership.
Title: Industrialisation
Reranker Score: 1.3238357305526733
URL: https://simple.wikipedia.org/wiki/Industrialisation
Caption: \<em\>Industrialisation\</em\> (or\<em\> industrialization)\</em\> is a process that happens in countries when they start to use machines to do work that was once done by people.\<em\> Industrialisation changes\</em\> the things people do.\<em\> Industrialisation\</em\> caused towns to grow larger. Many people left farming to take higher paid jobs in factories in towns.`
```