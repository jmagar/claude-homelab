GCP BigQuery Vector Search with GCP Functions and GPT Actions in ChatGPT
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
Aug 2, 2024
# GCP BigQuery Vector Search with GCP Functions and GPT Actions in ChatGPT
[ PP ](https://www.linkedin.com/in/portepa/)[ MA ](https://github.com/maxreid-openai)
[ Pierre-Antoine Porte
(OpenAI)
, ](https://www.linkedin.com/in/portepa/)[ maxreid-openai
(OpenAI)
](https://github.com/maxreid-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/rag-quickstart/gcp/Getting_started_with_bigquery_vector_search_and_openai.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/chatgpt/rag-quickstart/gcp/Getting_started_with_bigquery_vector_search_and_openai.ipynb)
This notebook provides step-by-step instructions on using Google Cloud BigQuery as a database with vector search capabilities, with OpenAI embeddings, then creating a Google Cloud Function on top to plug into a Custom GPT in ChatGPT.
This can be a solution for customers looking to set up RAG infrastructure contained within Google Cloud Platform (GCP), and exposing it as an endpoint to integrate that with other platforms such as ChatGPT.
Google Cloud BigQuery is a fully-managed, serverless data warehouse that enables super-fast SQL queries using the processing power of Google’s infrastructure. It allows developers to store and analyze massive datasets with ease.
Google Cloud Functions is a lightweight, event-based, asynchronous compute solution that allows you to create small, single-purpose functions that respond to cloud events without managing servers or runtime environments.
## Pre-requisites:
To run this cookbook, you must have:
* A GCP project you have access to
* GCP user with permission to create a BigQuery dataset and Google Cloud Function
* [GCP CLI](https://cloud.google.com/sdk/docs/downloads-interactive) installed and connected
* OpenAI API key
* ChatGPT Plus, Teams or Enterprise subscription
## Architecture
Below is a diagram of the architecture of this solution, which we’ll walk through step-by-step:
1. **[Setup of Environment](#set-up-environment)** Setup environment by installing and importing the required libraries and configuring our GCP settings. Includes:
* [Install and Import Required Libraries](#install-and-import-required-libraries)
* [Configure GCP project](#configure-gcp-project)
* [Configure OpenAI Settings](#configure-openai-settings)
* **[Prepare Data](#prepare-data)** Prepare the data for uploading by embedding the documents, as well as capturing additional metadata. We will use a subset of OpenAI’s docs as example data for this.
* **[Create BigQuery Table with Vector search](#create-bigquery-table-with-vector-search)**
Create a BigQuery table and upload the data we’ve prepared. Includes:
* [Create Dataset](#create-bigquery-dataset): Steps to create a dataset in BigQuery.
* [Create Table and upload data](#creating-table-and-upload-data): Instructions to create a table in BigQuery.
* **[Create GCP Function](#create-gcp-function)** using gcloud CLI and environment variables computed previously
* **[Input in a Custom GPT in ChatGPT](#input-in-a-custom-gpt-in-chatgpt)** Perform searches on the embedded data in BigQuery:
* [Vector Search](#test-search): Steps to perform vector-based search queries.
* [Metadata filtering Search](#perform-search-with-metadata-filtering): Instructions for performing metadata filtering.
# Set up environment
## Install and import required libraries
The below libraries can be categorized as standard Python libraries, third-party libraries, and GCP-related libraries.
```
`! pip install -q google-auth
! pip install -q openai
! pip install -q pandas
! pip install -q google-cloud-functions
! pip install -q python-dotenv
! pip install -q pyperclip
! pip install -q PyPDF2
! pip install -q tiktoken
! pip install -q google-cloud-bigquery
! pip install -q pyyaml`
```
```
`# Standard Libraries
import json
import os
import csv
import shutil
from itertools import islice
import concurrent.futures
import yaml
# Third-Party Libraries
import pandas as pd
import numpy as np
from PyPDF2 import PdfReader
import tiktoken
from dotenv import load\_dotenv
import pyperclip
# OpenAI Libraries
from openai import OpenAI
# Google Cloud Identity and Credentials
from google.auth import default
from google.cloud import bigquery
from google.cloud import functions\_v1`
```
## Configure GCP project
If not already set-up, we’ll install GCP CLI’s, authenticate to GCP and set your default project.
```
`# Add gcloud to PATH
os.environ['PATH'] += os.pathsep + os.path.expanduser('\~/google-cloud-sdk/bin')
# Verify gcloud is in PATH
! gcloud --version`
```
```
`! gcloud auth application-default login`
```
```
`project\_id = "\<insert\_project\_id\>" # Replace with your actual project ID
! gcloud config set project {project\_id}`
```
```
`! gcloud services enable cloudfunctions.googleapis.com
! gcloud services enable cloudbuild.googleapis.com
! gcloud services enable bigquery.googleapis.com`
```
## Configure OpenAI settings
This section guides you through setting up authentication for OpenAI. Before going through this section, make sure you have your OpenAI API key.
```
`openai\_api\_key = os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as an env var\>") # Saving this as a variable to reference in function app in later step
openai\_client = OpenAI(api\_key=openai\_api\_key)
embeddings\_model = "text-embedding-3-small" # We'll use this by default, but you can change to your text-embedding-3-large if desired`
```
## Configure GCP BigQuery with Vector Search capabilities
This section explains how to create a dataset in BigQuery and store vectors of float, used for embeddings & vector search.
```
`from google.auth import default
# Use default credentials
credentials, project\_id = default()
region = "us-central1" # e.g: "us-central1"
print("Default Project ID:", project\_id)`
```
# Prepare data
We’re going to embed and store a few pages of the OpenAI docs in the oai\_docs folder. We’ll first embed each, add it to a CSV, and then use that CSV to upload to the index.
We are going to use some techniques highlighted in [this cookbook](khttps://github.com/openai/openai-cookbook/blob/main/examples/Embedding_long_inputs.ipynb). This is a quick way to embed text, without taking into account variables like sections, using our vision model to describe images/graphs/diagrams, overlapping text between chunks for longer documents, etc.
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
> Note: there are other techniques you can take here, including:
>
>
* > using GPT-4o to capture images/chart descriptions for embedding
>
* > chunking based on paragraphs or sections
>
* > adding more descriptive metadata about each article.
>
>
```
`EMBEDDING\_CTX\_LENGTH = 8191
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
Next, we can define a helper function that will capture additional metadata about the documents. In this example, I’ll choose from a list of categories to use later on in a metadata filter
```
`categories = ['authentication','models','techniques','tools','setup','billing\_limits','other']
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
return None
# Example usage`
```
Now, we can define some helper functions to process the .txt files in the oai\_docs folder. Feel free to use this on your own data, this supports both .txt and .pdf files.
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
We’ll now use this helper function to process our OpenAI documentation. Feel free to update this to use your own data by changing the folder in process\_files below.
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
# Create BigQuery table with Vector Search
## Create BigQuery dataset
We’ll leverage Google SDK and create a dataset named “oai\_docs” with a table name of “embedded\_data”, but feel free to change those variables (you can also change regions).
*PS: We won’t create a BigQuery index, that could improve the performance of the vector search, because such index requires more than 1k rows in our dataset which we don’t have in our example, but feel free to leverage that for your own use-case.*
```
`# Create bigquery table
from google.cloud import bigquery
from google.api\_core.exceptions import Conflict
# Define the dataset ID (project\_id.dataset\_id)
raw\_dataset\_id = 'oai\_docs'
dataset\_id = project\_id + '.' + raw\_dataset\_id
client = bigquery.Client(credentials=credentials, project=project\_id)
# Construct a full Dataset object to send to the API
dataset = bigquery.Dataset(dataset\_id)
# Specify the geographic location where the dataset should reside
dataset.location = "US"
# Send the dataset to the API for creation
try:
dataset = client.create\_dataset(dataset, timeout=30)
print(f"Created dataset {client.project}.{dataset.dataset\_id}")
except Conflict:
print(f"dataset {dataset.dataset\_id } already exists")`
```
```
`# Read the CSV file, properly handling multiline fields
csv\_file\_path = "../embedded\_data.csv"
df = pd.read\_csv(csv\_file\_path, engine='python', quotechar='"', quoting=1)
# Display the first few rows of the dataframe
df.head()`
```
## Creating table and upload data
We’ll create the table with the attribute name and types. Note the ‘content\_vector’ attribute that allows to store a vector of float for a single row, which we’ll use for our vector search.
This code will then loop on our CSVs previously created to insert the rows into Bigquery.
If you run this code multiple time, multiple identical rows will be inserted which will give less accurate results when doing search (you could put uniqueness on IDs or clean the DB each time).
```
`# Read the CSV file, properly handling multiline fields
dataset\_id = project\_id + '.' + raw\_dataset\_id
client = bigquery.Client(credentials=credentials, project=project\_id)
csv\_file\_path = "../embedded\_data.csv"
df = pd.read\_csv(csv\_file\_path, engine='python', quotechar='"', quoting=1)
# Preprocess the data to ensure content\_vector is correctly formatted
# removing last and first character which are brackets [], comma splitting and converting to float
def preprocess\_content\_vector(row):
row['content\_vector'] = [float(x) for x in row['content\_vector'][1:-1].split(',')]
return row
# Apply preprocessing to the dataframe
df = df.apply(preprocess\_content\_vector, axis=1)
# Define the schema of the final table
final\_schema = [
bigquery.SchemaField("id", "STRING"),
bigquery.SchemaField("vector\_id", "STRING"),
bigquery.SchemaField("title", "STRING"),
bigquery.SchemaField("text", "STRING"),
bigquery.SchemaField("title\_vector", "STRING"),
bigquery.SchemaField("content\_vector", "FLOAT64", mode="REPEATED"),
bigquery.SchemaField("category", "STRING"),
]
# Define the final table ID
raw\_table\_id = 'embedded\_data'
final\_table\_id = f'{dataset\_id}.' + raw\_table\_id
# Create the final table object
final\_table = bigquery.Table(final\_table\_id, schema=final\_schema)
# Send the table to the API for creation
final\_table = client.create\_table(final\_table, exists\_ok=True) # API request
print(f"Created final table {project\_id}.{final\_table.dataset\_id}.{final\_table.table\_id}")
# Convert DataFrame to list of dictionaries for BigQuery insertion
rows\_to\_insert = df.to\_dict(orient='records')
# Upload data to the final table
errors = client.insert\_rows\_json(f"{final\_table.dataset\_id}.{final\_table.table\_id}", rows\_to\_insert) # API request
if errors:
print(f"Encountered errors while inserting rows: {errors}")
else:
print(f"Successfully loaded data into {dataset\_id}:{final\_table\_id}")`
```
# Test search
Now that the data is uploaded, we’ll test both pure vector similarity search and with metadata filtering locally below to make sure it is working as expected.
You can test both a pure vector search and metadata filtering.
The query below is pure vector search, where we don’t filter out on category.
```
`query = "What model should I use to embed?"
category = "models"
embedding\_query = generate\_embeddings(query, embeddings\_model)
embedding\_query\_list = ', '.join(map(str, embedding\_query))
query = f"""
WITH search\_results AS (
SELECT query.id AS query\_id, base.id AS base\_id, distance
FROM VECTOR\_SEARCH(
TABLE oai\_docs.embedded\_data, 'content\_vector',
(SELECT ARRAY[{embedding\_query\_list}] AS content\_vector, 'query\_vector' AS id),
top\_k =\> 2, distance\_type =\> 'COSINE', options =\> '{{"use\_brute\_force": true}}')
)
SELECT sr.query\_id, sr.base\_id, sr.distance, ed.text, ed.title
FROM search\_results sr
JOIN oai\_docs.embedded\_data ed ON sr.base\_id = ed.id
ORDER BY sr.distance ASC
"""
query\_job = client.query(query)
results = query\_job.result() # Wait for the job to complete
for row in results:
print(f"query\_id: {row['query\_id']}, base\_id: {row['base\_id']}, distance: {row['distance']}, text\_truncated: {row['text'][0:100]}")`
```
## Perform search with metadata filtering
Metadata filtering allows to restrict findings that have certain attributes on top of having the closest semantic findings of vector search.
The provided code snippet demonstrates how to execute a query with metadata filtering:
```
`
query = "What model should I use to embed?"
category = "models"
embedding\_query = generate\_embeddings(query, embeddings\_model)
embedding\_query\_list = ', '.join(map(str, embedding\_query))
query = f"""
WITH search\_results AS (
SELECT query.id AS query\_id, base.id AS base\_id, distance
FROM VECTOR\_SEARCH(
(SELECT \* FROM oai\_docs.embedded\_data WHERE category = '{category}'),
'content\_vector',
(SELECT ARRAY[{embedding\_query\_list}] AS content\_vector, 'query\_vector' AS id),
top\_k =\> 4, distance\_type =\> 'COSINE', options =\> '{{"use\_brute\_force": true}}')
)
SELECT sr.query\_id, sr.base\_id, sr.distance, ed.text, ed.title, ed.category
FROM search\_results sr
JOIN oai\_docs.embedded\_data ed ON sr.base\_id = ed.id
ORDER BY sr.distance ASC
"""
query\_job = client.query(query)
results = query\_job.result() # Wait for the job to complete
for row in results:
print(f"category: {row['category']}, title: {row['title']}, base\_id: {row['base\_id']}, distance: {row['distance']}, text\_truncated: {row['text'][0:100]}")`
```
# Create GCP function
## Exporting variables
We’ll deploy the function in `main.py` in this folder (also available [here](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/rag-quickstart/gcp/main.py)).
In a first step, we’ll export the variables to target our table/dataset as well as to generate Embeddings using OpenAI’s API.
```
`# Create a dictionary to store the environment variables (they were used previously and are just retrieved)
env\_variables = {
'OPENAI\_API\_KEY': openai\_api\_key,
'EMBEDDINGS\_MODEL': embeddings\_model,
'PROJECT\_ID': project\_id,
'DATASET\_ID': raw\_dataset\_id,
'TABLE\_ID': raw\_table\_id
}
# Write the environment variables to a YAML file
with open('env.yml', 'w') as yaml\_file:
yaml.dump(env\_variables, yaml\_file, default\_flow\_style=False)
print("env.yml file created successfully.")`
```
## Deploying the function
We will now create a google function called “openai\_docs\_search” for our current project, for that we’ll launch the CLI command below, leveraging the previously created environment variables. Note that this function can be called from everywhere without authentication, do not use that for production or add additional authentication mechanism.
```
`! gcloud functions deploy openai\_docs\_search \\
--runtime python39 \\
--trigger-http \\
--allow-unauthenticated \\
--env-vars-file env.yml`
```
# Input in a Custom GPT in ChatGPT
Now that we have a GCP Function that queries this Vector Search Index, let’s put it as a GPT Action!
See documentation [here](https://openai.com/index/introducing-gpts/) on GPTs and [here](https://platform.openai.com/docs/actions) on GPT Actions. Use the below as the instructions for the GPT and as the OpenAPI spec for the GPT Action.
## Create OpenAPI Spec
Below is a sample OpenAPI spec. When we run the block below, a functional spec should be copied to the clipboard to paste in the GPT Action.
Note that this does not have any authentication by default, but you can set up GCP Functions with Auth by following GCP’s docs [here](https://cloud.google.com/functions/docs/securing/authenticating).
```
`spec = f"""
openapi: 3.1.0
info:
title: OpenAI API documentation search
description: API to perform a semantic search over OpenAI APIs
version: 1.0.0
servers:
- url: https://{region}-{project\_id}.cloudfunctions.net
description: Main (production) server
paths:
/openai\_docs\_search:
post:
operationId: openai\_docs\_search
summary: Perform a search
description: Returns search results for the given query parameters.
requestBody:
required: true
content:
application/json:
schema:
type: object
properties:
query:
type: string
description: The search query string
top\_k:
type: integer
description: Number of top results to return. Maximum is 3.
category:
type: string
description: The category to filter on, on top of similarity search (used for metadata filtering). Possible values are {categories}.
responses:
'200':
description: A JSON response with the search results
content:
application/json:
schema:
type: object
properties:
items:
type: array
items:
type: object
properties:
text:
type: string
example: "Learn how to turn text into numbers, unlocking use cases like search..."
title:
type: string
example: "embeddings.txt"
distance:
type: number
format: float
example: 0.484939891778730
category:
type: string
example: "models"
"""
print(spec)
pyperclip.copy(spec)
print("OpenAPI spec copied to clipboard")`
```
## Create GPT Instructions
Feel free to modify instructions as you see fit. Check out our docs [here](https://platform.openai.com/docs/guides/prompt-engineering) for some tips on prompt engineering.
```
`instructions = f'''
You are an OpenAI docs assistant. You have an action in your knowledge base where you can make a POST request to search for information. The POST request should always include: {{
"query": "\<user\_query\>",
"k\_": \<integer\>,
"category": \<string, but optional\>
}}. Your goal is to assist users by performing searches using this POST request and providing them with relevant information based on the query.
You must only include knowledge you get from your action in your response.
The category must be from the following list: {categories}, which you should determine based on the user's query. If you cannot determine, then do not include the category in the POST request.
'''
pyperclip.copy(instructions)
print("GPT Instructions copied to clipboard")
print(instructions)`
```
# Recap
We’ve now succesfully integrated GCP BigQuery Vector Search with GPT Actions in ChatGPT by doing the following:
1. Embedded docs using OpenAI’s embeddings, while adding some additional metadata using gpt-4o.
2. Uploaded that data to GCP BigQuery (raw data and vectors of embeddings)
3. Created an endpoint on GCP Functions to retrieve those
4. Incorporated it into a custom GPT.
Our GPT can now retrieve informaiton to help answer user queries, making it much more accurate and customized to our data. Here’s the GPT in action: