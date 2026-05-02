Azure AI Search with Azure Functions and GPT Actions in ChatGPT
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
Jul 8, 2024
# Azure AI Search with Azure Functions and GPT Actions in ChatGPT
[ MA ](https://github.com/maxreid-openai)
[ maxreid-openai
(OpenAI)
](https://github.com/maxreid-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/rag-quickstart/azure/Azure_AI_Search_with_Azure_Functions_and_GPT_Actions_in_ChatGPT.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/chatgpt/rag-quickstart/azure/Azure_AI_Search_with_Azure_Functions_and_GPT_Actions_in_ChatGPT.ipynb)
This notebook provides step by step instuctions on using Azure AI Search (f.k.a Azure Cognitive Search) as a vector database with OpenAI embeddings, then creating an Azure Function on top to plug into a Custom GPT in ChatGPT.
This can be a solution for customers looking to set up RAG infrastructure contained within Azure, and exposing it as an endpoint to integrate that with other platforms such as ChatGPT.
Azure AI Search is a cloud search service that gives developers infrastructure, APIs, and tools for building a rich search experience over private, heterogeneous content in web, mobile, and enterprise applications.
Azure Functions is a serverless compute service that runs event-driven code, automatically managing infrastructure, scaling, and integrating with other Azure services.
## Prerequisites:
For the purposes of this exercise you must have the following:
* Azure user with permission to create [Azure AI Search Service](https://learn.microsoft.com/azure/search/) and Azure Function Apps
* Azure subscription ID and a resource group.
* [OpenAI Key](https://platform.openai.com/account/api-keys)
# Architecture
Below is a diagram of the architecture of this solution, which we’ll walk through step-by-step.
>
> Note: This architecture pattern of vector data store + serverless functions can be extrapolated to other vector data stores. For example, if you would want to use something like Postgres within Azure, you’d change the
[> Configure Azure AI Search Settings
](#configure-azure-ai-search-settings)> step to set-up the requirements for Postgres, you’d modify the
[> Create Azure AI Vector Search
](#create-azure-ai-vector-search)> to create the database and table in Postgres instead, and you’d update the
`> function_app.py
`> code in this repository to query Postgres instead of Azure AI Search. The data preparation and creation of the Azure Function would stay consistent.
>
1. **[Setup of Environment](#set-up-environment)**
Setup environment by installing and importing the required libraries and configuring our Azure settings. Includes:
* [Install and Import Required Libraries](#install-and-import-required-libraries)
* [Configure OpenAI Settings](#configure-openai-settings)
* [Configure Azure AI Search Settings](#configure-azure-ai-search-settings)
* **[Prepare Data](#prepare-data)** Prepare the data for uploading by embedding the documents, as well as capturing additional metadata. We will use a subset of OpenAI’s docs as example data for this.
* **[Create Azure AI Vector Search](#create-azure-ai-vector-search)** Create an Azure AI Vector Search and upload the data we’ve prepared. Includes:
* [Create Index](#create-index): Steps to create an index in Azure AI Search.
* [Upload Data](#upload-data): Instructions to upload data to Azure AI Search.
* [Test Search](#test-search): Steps to test the search functionality.
* **[Create Azure Function](#create-azure-function)** Create an Azure Function to interact with the Azure AI Vector Search. Includes:
* [Create Storage Account](#create-storage-account): Steps to create a storage account for the Azure Function.
* [Create Function App](#create-function-app): Instructions to create a function app in Azure.
* **[Input in a Custom GPT in ChatGPT](#input-in-a-custom-gpt-in-chatgpt)** Integrate the Azure Function with a Custom GPT in ChatGPT. Includes:
* [Create OpenAPI Spec](#create-openapi-spec): Steps to create an OpenAPI specification for the Azure Function.
* [Create GPT Instructions](#create-gpt-instructions): Instructions to create GPT-specific instructions for the integration.
# Set up environment
We’ll set up our environment by importing the required libraries and configuring our Azure settings.
## Install and import required libraries
We categorize these libraries into standard Python libraries, third-party libraries, and Azure-related libraries for readability.
```
`! pip install -q wget
! pip install -q azure-search-documents
! pip install -q azure-identity
! pip install -q openai
! pip install -q azure-mgmt-search
! pip install -q pandas
! pip install -q azure-mgmt-resource
! pip install -q azure-mgmt-storage
! pip install -q pyperclip
! pip install -q PyPDF2
! pip install -q tiktoken`
```
```
`# Standard Libraries
import json
import os
import platform
import subprocess
import csv
from itertools import islice
import uuid
import shutil
import concurrent.futures
# Third-Party Libraries
import pandas as pd
from PyPDF2 import PdfReader
import tiktoken
from dotenv import load\_dotenv
import pyperclip
# OpenAI Libraries (note we use OpenAI directly here, but you can replace with Azure OpenAI as needed)
from openai import OpenAI
# Azure Identity and Credentials
from azure.identity import DefaultAzureCredential, InteractiveBrowserCredential
from azure.core.credentials import AzureKeyCredential
from azure.core.exceptions import HttpResponseError
# Azure Search Documents
from azure.search.documents import SearchClient, SearchIndexingBufferedSender
from azure.search.documents.indexes import SearchIndexClient
from azure.search.documents.models import (
VectorizedQuery
)
from azure.search.documents.indexes.models import (
HnswAlgorithmConfiguration,
HnswParameters,
SearchField,
SearchableField,
SearchFieldDataType,
SearchIndex,
SimpleField,
VectorSearch,
VectorSearchAlgorithmKind,
VectorSearchAlgorithmMetric,
VectorSearchProfile,
)
# Azure Management Clients
from azure.mgmt.search import SearchManagementClient
from azure.mgmt.resource import ResourceManagementClient, SubscriptionClient
from azure.mgmt.storage import StorageManagementClient`
```
## Configure OpenAI settings
Before going through this section, make sure you have your OpenAI API key.
```
`openai\_api\_key = os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as an env var\>") # Saving this as a variable to reference in function app in later step
openai\_client = OpenAI(api\_key=openai\_api\_key)
embeddings\_model = "text-embedding-3-small" # We'll use this by default, but you can change to your text-embedding-3-large if desired`
```
## Configure Azure AI Search Settings
You can locate your Azure AI Search service details in the Azure Portal or programmatically via the [Search Management SDK](https://learn.microsoft.com/rest/api/searchmanagement/).
#### Prerequisites:
* Subscription ID from Azure
* Resource Group name from Azure
* Region in Azure
```
`# Update the below with your values
subscription\_id="\<enter\_your\_subscription\_id\>"
resource\_group="\<enter\_your\_resource\_group\>"
## Make sure to choose a region that supports the proper products. We've defaulted to "eastus" below. https://azure.microsoft.com/en-us/explore/global-infrastructure/products-by-region/#products-by-region\_tab5
region = "eastus"
credential = InteractiveBrowserCredential()
subscription\_client = SubscriptionClient(credential)
subscription = next(subscription\_client.subscriptions.list())`
```
#### Create and Configure Azure AI Search Service
Below we’ll generate a unique name for the search service, set up the service properties, and create the search service.
```
`# Initialize the SearchManagementClient with the provided credentials and subscription ID
search\_management\_client = SearchManagementClient(
credential=credential,
subscription\_id=subscription\_id,
)
# Generate a unique name for the search service using UUID, but you can change this if you'd like.
generated\_uuid = str(uuid.uuid4())
search\_service\_name = "search-service-gpt-demo" + generated\_uuid
## The below is the default endpoint structure that is created when you create a search service. This may differ based on your Azure settings.
search\_service\_endpoint = 'https://'+search\_service\_name+'.search.windows.net'
# Create or update the search service with the specified parameters
response = search\_management\_client.services.begin\_create\_or\_update(
resource\_group\_name=resource\_group,
search\_service\_name=search\_service\_name,
service={
"location": region,
"properties": {"hostingMode": "default", "partitionCount": 1, "replicaCount": 1},
# We are using the free pricing tier for this demo. You are only allowed one free search service per subscription.
"sku": {"name": "free"},
"tags": {"app-name": "Search service demo"},
},
).result()
# Convert the response to a dictionary and then to a pretty-printed JSON string
response\_dict = response.as\_dict()
response\_json = json.dumps(response\_dict, indent=4)
print(response\_json)
print("Search Service Name:" + search\_service\_name)
print("Search Service Endpoint:" + search\_service\_endpoint)`
```
#### Get the Search Service API Key
Now that we have the search service up and running, we need the [Search Service API Key](https://learn.microsoft.com/en-us/azure/search/search-security-api-keys?tabs=rest-use,portal-find,portal-query), which we’ll use to initiate the index creation, and later to execute the search.
```
`# Retrieve the admin keys for the search service
try:
response = search\_management\_client.admin\_keys.get(
resource\_group\_name=resource\_group,
search\_service\_name=search\_service\_name,
)
# Extract the primary API key from the response and save as a variable to be used later
search\_service\_api\_key = response.primary\_key
print("Successfully retrieved the API key.")
except Exception as e:
print(f"Failed to retrieve the API key: {e}")`
```
# Prepare data
We’re going to embed and store a few pages of the OpenAI docs in the oai\_docs folder. We’ll first embed each, add it to a CSV, and then use that CSV to upload to the index.
In order to handle longer text files beyond the context of 8191 tokens, we can either use the chunk embeddings separately, or combine them in some way, such as averaging (weighted by the size of each chunk).
We will take a function from Python’s own cookbook that breaks up a sequence into chunks.
```
`def batched(iterable, n):
"""Batch data into tuples of length n. The last batch may be shorter."""
# batched('ABCDEFG', 3) --\> ABC DEF G
if n \< 1:
raise ValueError('n must be at least one')
it = iter(iterable)
while (batch := tuple(islice(it, n))):
yield batch`
```
Now we define a function that encodes a string into tokens and then breaks it up into chunks. We’ll use tiktoken, a fast open-source tokenizer by OpenAI.
To read more about counting tokens with Tiktoken, check out [this cookbook](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken).
```
`def chunked\_tokens(text, chunk\_length, encoding\_name='cl100k\_base'):
# Get the encoding object for the specified encoding name. OpenAI's tiktoken library, which is used in this notebook, currently supports two encodings: 'bpe' and 'cl100k\_base'. The 'bpe' encoding is used for GPT-3 and earlier models, while 'cl100k\_base' is used for newer models like GPT-4.
encoding = tiktoken.get\_encoding(encoding\_name)
# Encode the input text into tokens
tokens = encoding.encode(text)
# Create an iterator that yields chunks of tokens of the specified length
chunks\_iterator = batched(tokens, chunk\_length)
# Yield each chunk from the iterator
yield from chunks\_iterator`
```
Finally, we can write a function that safely handles embedding requests, even when the input text is longer than the maximum context length, by chunking the input tokens and embedding each chunk individually. The average flag can be set to True to return the weighted average of the chunk embeddings, or False to simply return the unmodified list of chunk embeddings.
>
> Note: there are other, more sophisticated techniques you can take here, including:
>
>
* > using GPT-4o to capture images/chart descriptions for embedding.
>
* > keeping text overlap between the chunks to minimize cutting off important context.
>
* > chunking based on paragraphs or sections.
>
* > adding more descriptive metadata about each article.
>
>
```
`## Change the below based on model. The below is for the latest embeddings models from OpenAI, so you can leave as is unless you are using a different embedding model..
EMBEDDING\_CTX\_LENGTH = 8191
EMBEDDING\_ENCODING='cl100k\_base'`
```
```
`def generate\_embeddings(text, model):
# Generate embeddings for the provided text using the specified model
embeddings\_response = openai\_client.embeddings.create(model=model, input=text)
# Extract the embedding data from the response
embedding = embeddings\_response.data[0].embedding
return embedding
def len\_safe\_get\_embedding(text, model=embeddings\_model, max\_tokens=EMBEDDING\_CTX\_LENGTH, encoding\_name=EMBEDDING\_ENCODING):
# Initialize lists to store embeddings and corresponding text chunks
chunk\_embeddings = []
chunk\_texts = []
# Iterate over chunks of tokens from the input text
for chunk in chunked\_tokens(text, chunk\_length=max\_tokens, encoding\_name=encoding\_name):
# Generate embeddings for each chunk and append to the list
chunk\_embeddings.append(generate\_embeddings(chunk, model=model))
# Decode the chunk back to text and append to the list
chunk\_texts.append(tiktoken.get\_encoding(encoding\_name).decode(chunk))
# Return the list of chunk embeddings and the corresponding text chunks
return chunk\_embeddings, chunk\_texts`
```
Next, we can define a helper function that will capture additional metadata about the documents. This is useful to use as a metadata filter for search queries, and capturing richer data for search.
In this example, I’ll choose from a list of categories to use later on in a metadata filter.
```
`## These are the categories I will be using for the categorization task. You can change these as needed based on your use case.
categories = ['authentication','models','techniques','tools','setup','billing\_limits','other']
def categorize\_text(text, categories):
# Create a prompt for categorization
messages = [
{"role": "system", "content": f"""You are an expert in LLMs, and you will be given text that corresponds to an article in OpenAI's documentation.
Categorize the document into one of these categories: {', '.join(categories)}. Only respond with the category name and nothing else."""},
{"role": "user", "content": text}
]
try:
# Call the OpenAI API to categorize the text
response = openai\_client.chat.completions.create(
model="gpt-4o",
messages=messages
)
# Extract the category from the response
category = response.choices[0].message.content
return category
except Exception as e:
print(f"Error categorizing text: {str(e)}")
return None`
```
Now, we can define some helper functions to process the .txt files in the oai\_docs folder within the data folder. You can use this with your own data as well and supports both .txt and .pdf files.
```
`def extract\_text\_from\_pdf(pdf\_path):
# Initialize the PDF reader
reader = PdfReader(pdf\_path)
text = ""
# Iterate through each page in the PDF and extract text
for page in reader.pages:
text += page.extract\_text()
return text
def process\_file(file\_path, idx, categories, embeddings\_model):
file\_name = os.path.basename(file\_path)
print(f"Processing file {idx + 1}: {file\_name}")
# Read text content from .txt files
if file\_name.endswith('.txt'):
with open(file\_path, 'r', encoding='utf-8') as file:
text = file.read()
# Extract text content from .pdf files
elif file\_name.endswith('.pdf'):
text = extract\_text\_from\_pdf(file\_path)
title = file\_name
# Generate embeddings for the title
title\_vectors, title\_text = len\_safe\_get\_embedding(title, embeddings\_model)
print(f"Generated title embeddings for {file\_name}")
# Generate embeddings for the content
content\_vectors, content\_text = len\_safe\_get\_embedding(text, embeddings\_model)
print(f"Generated content embeddings for {file\_name}")
category = categorize\_text(' '.join(content\_text), categories)
print(f"Categorized {file\_name} as {category}")
# Prepare the data to be appended
data = []
for i, content\_vector in enumerate(content\_vectors):
data.append({
"id": f"{idx}\_{i}",
"vector\_id": f"{idx}\_{i}",
"title": title\_text[0],
"text": content\_text[i],
"title\_vector": json.dumps(title\_vectors[0]), # Assuming title is short and has only one chunk
"content\_vector": json.dumps(content\_vector),
"category": category
})
print(f"Appended data for chunk {i + 1}/{len(content\_vectors)} of {file\_name}")
return data`
```
We’ll now use this helper function to process our OpenAI documentation. Feel free to update this to use your own data by changing the folder in `process\_files` below.
Note that this will process the documents in chosen folder concurrently, so this should take \<30 seconds if using txt files, and slightly longer if using PDFs.
```
`## Customize the location below if you are using different data besides the OpenAI documentation. Note that if you are using a different dataset, you will need to update the categories list as well.
folder\_name = "../../../data/oai\_docs"
files = [os.path.join(folder\_name, f) for f in os.listdir(folder\_name) if f.endswith('.txt') or f.endswith('.pdf')]
data = []
# Process each file concurrently
with concurrent.futures.ThreadPoolExecutor() as executor:
futures = {executor.submit(process\_file, file\_path, idx, categories, embeddings\_model): idx for idx, file\_path in enumerate(files)}
for future in concurrent.futures.as\_completed(futures):
try:
result = future.result()
data.extend(result)
except Exception as e:
print(f"Error processing file: {str(e)}")
# Write the data to a CSV file
csv\_file = os.path.join("..", "embedded\_data.csv")
with open(csv\_file, 'w', newline='', encoding='utf-8') as csvfile:
fieldnames = ["id", "vector\_id", "title", "text", "title\_vector", "content\_vector","category"]
writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
writer.writeheader()
for row in data:
writer.writerow(row)
print(f"Wrote row with id {row['id']} to CSV")
# Convert the CSV file to a Dataframe
article\_df = pd.read\_csv("../embedded\_data.csv")
# Read vectors from strings back into a list using json.loads
article\_df["title\_vector"] = article\_df.title\_vector.apply(json.loads)
article\_df["content\_vector"] = article\_df.content\_vector.apply(json.loads)
article\_df["vector\_id"] = article\_df["vector\_id"].apply(str)
article\_df["category"] = article\_df["category"].apply(str)
article\_df.head()`
```
We now have an `embedded\_data.csv` file with six columns that we can upload to our vector database!
# Create Azure AI Vector Search
## Create index
We’ll define and create a search index using the `SearchIndexClient` from the Azure AI Search Python SDK. The index incorporates both vector search and hybrid search capabilities. For more details, visit Microsoft’s documentation on how to [Create a Vector Index](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index?.tabs=config-2023-11-01,rest-2023-11-01,push,portal-check-index)
```
`index\_name = "azure-ai-search-openai-cookbook-demo"
# index\_name = "\<insert\_name\_for\_index\>"
index\_client = SearchIndexClient(
endpoint=search\_service\_endpoint, credential=AzureKeyCredential(search\_service\_api\_key)
)
# Define the fields for the index. Update these based on your data.
# Each field represents a column in the search index
fields = [
SimpleField(name="id", type=SearchFieldDataType.String), # Simple string field for document ID
SimpleField(name="vector\_id", type=SearchFieldDataType.String, key=True), # Key field for the index
# SimpleField(name="url", type=SearchFieldDataType.String), # URL field (commented out)
SearchableField(name="title", type=SearchFieldDataType.String), # Searchable field for document title
SearchableField(name="text", type=SearchFieldDataType.String), # Searchable field for document text
SearchField(
name="title\_vector",
type=SearchFieldDataType.Collection(SearchFieldDataType.Single), # Collection of single values for title vector
vector\_search\_dimensions=1536, # Number of dimensions in the vector
vector\_search\_profile\_name="my-vector-config", # Profile name for vector search configuration
),
SearchField(
name="content\_vector",
type=SearchFieldDataType.Collection(SearchFieldDataType.Single), # Collection of single values for content vector
vector\_search\_dimensions=1536, # Number of dimensions in the vector
vector\_search\_profile\_name="my-vector-config", # Profile name for vector search configuration
),
SearchableField(name="category", type=SearchFieldDataType.String, filterable=True), # Searchable field for document category
]
# This configuration defines the algorithm and parameters for vector search
vector\_search = VectorSearch(
algorithms=[
HnswAlgorithmConfiguration(
name="my-hnsw", # Name of the HNSW algorithm configuration
kind=VectorSearchAlgorithmKind.HNSW, # Type of algorithm
parameters=HnswParameters(
m=4, # Number of bi-directional links created for every new element
ef\_construction=400, # Size of the dynamic list for the nearest neighbors during construction
ef\_search=500, # Size of the dynamic list for the nearest neighbors during search
metric=VectorSearchAlgorithmMetric.COSINE, # Distance metric used for the search
),
)
],
profiles=[
VectorSearchProfile(
name="my-vector-config", # Name of the vector search profile
algorithm\_configuration\_name="my-hnsw", # Reference to the algorithm configuration
)
],
)
# Create the search index with the vector search configuration
# This combines all the configurations into a single search index
index = SearchIndex(
name=index\_name, # Name of the index
fields=fields, # Fields defined for the index
vector\_search=vector\_search # Vector search configuration
)
# Create or update the index
# This sends the index definition to the Azure Search service
result = index\_client.create\_index(index)
print(f"{result.name} created") # Output the name of the created index`
```
## Upload Data
Now we’ll upload the articles from above that we’ve stored in `embedded\_data.csv` from a pandas DataFrame to an Azure AI Search index. For a detailed guide on data import strategies and best practices, refer to [Data Import in Azure AI Search](https://learn.microsoft.com/azure/search/search-what-is-data-import).
```
`# Convert the 'id' and 'vector\_id' columns to string so one of them can serve as our key field
article\_df["id"] = article\_df["id"].astype(str)
article\_df["vector\_id"] = article\_df["vector\_id"].astype(str)
# Convert the DataFrame to a list of dictionaries
documents = article\_df.to\_dict(orient="records")
# Log the number of documents to be uploaded
print(f"Number of documents to upload: {len(documents)}")
# Create a SearchIndexingBufferedSender
batch\_client = SearchIndexingBufferedSender(
search\_service\_endpoint, index\_name, AzureKeyCredential(search\_service\_api\_key)
)
# Get the first document to check its schema
first\_document = documents[0]
# Get the index schema
index\_schema = index\_client.get\_index(index\_name)
# Get the field names from the index schema
index\_fields = {field.name: field.type for field in index\_schema.fields}
# Check each field in the first document
for field, value in first\_document.items():
if field not in index\_fields:
print(f"Field '{field}' is not in the index schema.")
# Check for any fields in the index schema that are not in the documents
for field in index\_fields:
if field not in first\_document:
print(f"Field '{field}' is in the index schema but not in the documents.")
try:
if documents:
# Add upload actions for all documents in a single call
upload\_result = batch\_client.upload\_documents(documents=documents)
# Check if the upload was successful
# Manually flush to send any remaining documents in the buffer
batch\_client.flush()
print(f"Uploaded {len(documents)} documents in total")
else:
print("No documents to upload.")
except HttpResponseError as e:
print(f"An error occurred: {e}")
raise # Re-raise the exception to ensure it errors out
finally:
# Clean up resources
batch\_client.close()`
```
## Test search
Now that the data is uploaded, we’ll test both vector similarity search and hybrid search locally below to make sure it is working as expected.
You can test both a pure vector search and hybrid search. Pure vector search passes in `None` to the `search\_text` below and will only search on vector similarity. Hybrid search will combines the capabilities of traditional keyword-based search by passing in the query text `query` to the `search\_text` with vector-based similarity search to provide more relevant and contextual results.
```
`query = "What model should I use to embed?"
# Note: we'll have the GPT choose the category automatically once we put it in ChatGPT
category ="models"
search\_client = SearchClient(search\_service\_endpoint, index\_name, AzureKeyCredential(search\_service\_api\_key))
vector\_query = VectorizedQuery(vector=generate\_embeddings(query, embeddings\_model), k\_nearest\_neighbors=3, fields="content\_vector")
results = search\_client.search(
search\_text=None, # Pass in None if you want to use pure vector search, and `query` if you want to use hybrid search
vector\_queries= [vector\_query],
select=["title", "text"],
filter=f"category eq '{category}'"
)
for result in results:
print(result)`
```
## Create Azure Function
Azure Functions are an easy way to build an API on top of our new AI search. Our code (see the `function\_app.py` file in this folder, or linked [here](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/rag-quickstart/azure/function_app.py)) does the following:
1. Takes in an input of the user’s query, search index endpoint, the index name, the k\_nearest\_neighbors\*, the search column to use (either content\_vector or title\_vector), and whether it should use a hybrid query
2. Takes the user’s query and embeds it.
3. Conducts a vector search and retrieves relevant text chunks.
4. Returns those relevant text chunks as the response body.
\*In the context of vector search, k\_nearest\_neighbors specifies the number of “closest” vectors (in terms of cosine similarity) that the search should return. For example, if k\_nearest\_neighbors is set to 3, the search will return the 3 vectors in the index that are most similar to the query vector.
>
> Note that this Azure Function
*> does not have any authentication
*> . However, you can set authentication on it following docs
[> here
](https://learn.microsoft.com/en-us/azure/azure-functions/security-concepts?tabs=v4)
>
### Create storage account
We can create a new storage account using the code below, but feel free to skip that block and modify the subsequent steps to use an existing storage account. This may take up to 30 seconds.
```
`## Update below with a different name
storage\_account\_name = "\<enter-storage-account-name\>"
## Use below SKU or any other SKU as per your requirement
sku = "Standard\_LRS"
resource\_client = ResourceManagementClient(credential, subscription\_id)
storage\_client = StorageManagementClient(credential, subscription\_id)
# Create resource group if it doesn't exist
rg\_result = resource\_client.resource\_groups.create\_or\_update(resource\_group, {"location": region})
# Create storage account
storage\_async\_operation = storage\_client.storage\_accounts.begin\_create(
resource\_group,
storage\_account\_name,
{
"sku": {"name": sku},
"kind": "StorageV2",
"location": region,
},
)
storage\_account = storage\_async\_operation.result()
print(f"Storage account {storage\_account.name} created")`
```
### Create Function App
This Function App is where the python code will execute once it is triggered via a GPT Action. To read more about Function Apps, see the docs [here](https://learn.microsoft.com/en-us/azure/azure-functions/functions-overview?pivots=programming-language-csharp).
To deploy Function Apps, we’ll need to use the Azure CLI and Azure Functions Core Tools.
>
> The below will attempt to install it and run it based on your platform type in your virtual environment, but if that does not work, read the Azure documentation to figure out how to install
[> Azure Function Core Tools
](https://learn.microsoft.com/en-us/azure/azure-functions/create-first-function-cli-python?tabs=linux,bash,azure-cli,browser)> and
[> Azure CLI
](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)> . After doing that, run the below
`> subprocess.run
`> commands in your terminal after navigating to this folder.
>
First we’ll make sure we have the relevant tools in the environment in order to run the Azure commands necessary. This may take a few minutes to install.
```
`os\_type = platform.system()
if os\_type == "Windows":
# Install Azure Functions Core Tools on Windows
subprocess.run(["npm", "install", "-g", "azure-functions-core-tools@3", "--unsafe-perm", "true"], check=True)
# Install Azure CLI on Windows
subprocess.run(["powershell", "-Command", "Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\\\\AzureCLI.msi; Start-Process msiexec.exe -ArgumentList '/I AzureCLI.msi /quiet' -Wait"], check=True)
elif os\_type == "Darwin": # MacOS
# Install Azure Functions Core Tools on MacOS
if platform.machine() == 'arm64':
# For M1 Macs
subprocess.run(["arch", "-arm64", "brew", "install", "azure-functions-core-tools@3"], check=True)
else:
# For Intel Macs
subprocess.run(["brew", "install", "azure-functions-core-tools@3"], check=True)
# Install Azure CLI on MacOS
subprocess.run(["brew", "update"], check=True)
subprocess.run(["brew", "install", "azure-cli"], check=True)
elif os\_type == "Linux":
# Install Azure Functions Core Tools on Linux
subprocess.run(["curl", "https://packages.microsoft.com/keys/microsoft.asc", "|", "gpg", "--dearmor", "\>", "microsoft.gpg"], check=True, shell=True)
subprocess.run(["sudo", "mv", "microsoft.gpg", "/etc/apt/trusted.gpg.d/microsoft.gpg"], check=True)
subprocess.run(["sudo", "sh", "-c", "'echo \\"deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb\_release -cs)-prod $(lsb\_release -cs) main\\" \> /etc/apt/sources.list.d/dotnetdev.list'"], check=True, shell=True)
subprocess.run(["sudo", "apt-get", "update"], check=True)
subprocess.run(["sudo", "apt-get", "install", "azure-functions-core-tools-3"], check=True)
# Install Azure CLI on Linux
subprocess.run(["curl", "-sL", "https://aka.ms/InstallAzureCLIDeb", "|", "sudo", "bash"], check=True, shell=True)
else:
# Raise an error if the operating system is not supported
raise OSError("Unsupported operating system")
# Verify the installation of Azure Functions Core Tools
subprocess.run(["func", "--version"], check=True)
# Verify the installation of Azure CLI
subprocess.run(["az", "--version"], check=True)
subprocess.run([
"az", "login"
], check=True)`
```
Now, we need to create a `local.settings.json` file with our key environment variables for Azure
```
`local\_settings\_content = f"""
{{
"IsEncrypted": false,
"Values": {{
"AzureWebJobsStorage": "UseDevelopmentStorage=true",
"FUNCTIONS\_WORKER\_RUNTIME": "python",
"OPENAI\_API\_KEY": "{openai\_api\_key}",
"EMBEDDINGS\_MODEL": "{embeddings\_model}",
"SEARCH\_SERVICE\_API\_KEY": "{search\_service\_api\_key}",
}}
}}
"""
with open("local.settings.json", "w") as file:
file.write(local\_settings\_content)`
```
Check the `local.settings.json` file and make sure that the environment variables match what you expect.
Now, give your app a name below, and you are ready to create your Function App and then publish your function.
```
`# Replace this with your own values. This name will appear in the URL of the API call https://\<app\_name\>.azurewebsites.net
app\_name = "\<app-name\>"
subprocess.run([
"az", "functionapp", "create",
"--resource-group", resource\_group,
"--consumption-plan-location", region,
"--runtime", "python",
"--name", app\_name,
"--storage-account", storage\_account\_name,
"--os-type", "Linux",
], check=True)`
```
Once we’ve created the Function App, we now want to add the configuration variables to the function app to use in the function. Specifically, we need the `OPENAI\_API\_KEY`, the `SEARCH\_SERVICE\_API\_KEY`, and the `EMBEDDINGS\_MODEL` as these are all used in the `function\_app.py` code.
```
`# Collect the relevant environment variables
env\_vars = {
"OPENAI\_API\_KEY": openai\_api\_key,
"SEARCH\_SERVICE\_API\_KEY": search\_service\_api\_key,
"EMBEDDINGS\_MODEL": embeddings\_model
}
# Create the settings argument for the az functionapp create command
settings\_args = []
for key, value in env\_vars.items():
settings\_args.append(f"{key}={value}")
subprocess.run([
"az", "functionapp", "config", "appsettings", "set",
"--name", app\_name,
"--resource-group", resource\_group,
"--settings", \*settings\_args
], check=True)`
```
We are now ready to publish your function code `function\_app.py` to the Azure Function. This may take up to 10 minutes to deploy. Once this is finished, we now have an API endpoint using an Azure Function on top of Azure AI Search.
```
`subprocess.run([
"func", "azure", "functionapp", "publish", app\_name
], check=True)`
```
## Input in a Custom GPT in ChatGPT
Now that we have an Azure Function that queries this Vector Search Index, let’s put it as a GPT Action!
See documentation [here](https://openai.com/index/introducing-gpts/) on GPTs and [here](https://platform.openai.com/docs/actions) on GPT Actions. Use the below as the instructions for the GPT and as the OpenAPI spec for the GPT Action.
### Create OpenAPI Spec
Below is a sample OpenAPI spec. When we run the block below, a functional spec should be copied to the clipboard to paste in the GPT Action.
Note that this does not have any authentication by default, but you can set up Azure Functions with OAuth by following the pattern in [this cookbook](https://cookbook.openai.com/examples/chatgpt/gpt_actions_library/gpt_middleware_azure_function#part-2-set-up-auth) in the Authentication section or looking at the documentation [here](https://learn.microsoft.com/en-us/azure/app-service/overview-authentication-authorization).
```
`
spec = f"""
openapi: 3.1.0
info:
title: Vector Similarity Search API
description: API for performing vector similarity search.
version: 1.0.0
servers:
- url: https://{app\_name}.azurewebsites.net/api
description: Main (production) server
paths:
/vector\_similarity\_search:
post:
operationId: vectorSimilaritySearch
summary: Perform a vector similarity search.
requestBody:
required: true
content:
application/json:
schema:
type: object
properties:
search\_service\_endpoint:
type: string
description: The endpoint of the search service.
index\_name:
type: string
description: The name of the search index.
query:
type: string
description: The search query.
k\_nearest\_neighbors:
type: integer
description: The number of nearest neighbors to return.
search\_column:
type: string
description: The name of the search column.
use\_hybrid\_query:
type: boolean
description: Whether to use a hybrid query.
category:
type: string
description: category to filter.
required:
- search\_service\_endpoint
- index\_name
- query
- k\_nearest\_neighbors
- search\_column
- use\_hybrid\_query
responses:
'200':
description: A successful response with the search results.
content:
application/json:
schema:
type: object
properties:
results:
type: array
items:
type: object
properties:
id:
type: string
description: The identifier of the result item.
score:
type: number
description: The similarity score of the result item.
content:
type: object
description: The content of the result item.
'400':
description: Bad request due to missing or invalid parameters.
'500':
description: Internal server error.
"""
pyperclip.copy(spec)
print("OpenAPI spec copied to clipboard")
print(spec)`
```
### Create GPT Instructions
Feel free to modify instructions as you see fit. Check out our docs [here](https://platform.openai.com/docs/guides/prompt-engineering) for some tips on prompt engineering.
```
`instructions = f'''
You are an OAI docs assistant. You have an action in your knowledge base where you can make a POST request to search for information. The POST request should always include: {{
"search\_service\_endpoint": "{search\_service\_endpoint}",
"index\_name": {index\_name},
"query": "\<user\_query\>",
"k\_nearest\_neighbors": 1,
"search\_column": "content\_vector",
"use\_hybrid\_query": true,
"category": "\<category\>"
}}. Only the query and category change based on the user's request. Your goal is to assist users by performing searches using this POST request and providing them with relevant information based on the query.
You must only include knowledge you get from your action in your response.
The category must be from the following list: {categories}, which you should determine based on the user's query. If you cannot determine, then do not include the category in the POST request.
'''
pyperclip.copy(instructions)
print("GPT Instructions copied to clipboard")
print(instructions)`
```
We now have a GPT that queries a vector database!
# Recap
We’ve now successfully integrated Azure AI Search with GPT Actions in ChatGPT by doing the following:
1. embedded them using OpenAI’s embeddings, while adding some additional metadata using gpt-4o.
2. uploaded that data to Azure AI Search.
3. created an endpoint to query it using Azure Functions.
4. incorporated it into a Custom GPT.
Our GPT can now retrieve information to help answer user queries, making it much more accurate and customized to our data. Here’s the GPT in action:
#