Multi-Tool Orchestration with RAG approach using OpenAI's Responses API
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
Mar 28, 2025
# Multi-Tool Orchestration with RAG approach using OpenAI's Responses API
[ SK ](https://www.linkedin.com/in/shikharkwatra/)
[ Shikhar Kwatra
(OpenAI)
](https://www.linkedin.com/in/shikharkwatra/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/responses_api/responses_api_tool_orchestration.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/responses_api/responses_api_tool_orchestration.ipynb)
### Multi-Tool Orchestration with RAG approach using OpenAI’s Responses API
This cookbook guides you through building dynamic, multi-tool workflows using OpenAI’s Responses API. It demonstrates how to implement a Retrieval-Augmented Generation (RAG) approach that intelligently routes user queries to the appropriate in-built or external tools. Whether your query calls for general knowledge or requires accessing specific internal context from a vector database (like Pinecone), this guide shows you how to integrate function calls, web searches in-built tool, and leverage document retrieval to generate accurate, context-aware responses.
For a practical example of performing RAG on PDFs using the Responses API’s file search feature, refer to [this](https://cookbook.openai.com/examples/file_search_responses) notebook.
This example showcases the flexibility of the Responses API, illustrating that beyond the internal `file\_search` tool—which connects to an internal vector store—there is also the capability to easily connect to external vector databases. This allows for the implementation of a RAG approach in conjunction with hosted tooling, providing a versatile solution for various retrieval and generation tasks.
```
`#%pip install datasets tqdm pandas pinecone openai --quiet
import os
import time
from tqdm.auto import tqdm
from pandas import DataFrame
from datasets import load\_dataset
import random
import string
# Import OpenAI client and initialize with your API key.
from openai import OpenAI
client = OpenAI(api\_key=os.getenv("OPENAI\_API\_KEY"))
# Import Pinecone client and related specifications.
from pinecone import Pinecone
from pinecone import ServerlessSpec`
```
```
`
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m A new release of pip is available: [0m[31;49m24.0[0m[39;49m -\> [0m[32;49m25.0.1[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m To update, run: [0m[32;49mpip install --upgrade pip[0m
Note: you may need to restart the kernel to use updated packages.`
```
```
`/Users/shikhar/openai\_projects/github\_repos/success-git/success\_new/success/oneoffs/shikhar/responses\_rag\_cookbook/env/lib/python3.11/site-packages/tqdm/auto.py:21: TqdmWarning: IProgress not found. Please update jupyter and ipywidgets. See https://ipywidgets.readthedocs.io/en/stable/user\_install.html
from .autonotebook import tqdm as notebook\_tqdm`
```
In this example we use a sample medical reasoning dataset from Hugging Face. We convert the dataset into a Pandas DataFrame and merge the “Question” and “Response” columns into a single string. This merged text is used for embedding and later stored as metadata.
```
`# Load the dataset (ensure you're logged in with huggingface-cli if needed)
ds = load\_dataset("FreedomIntelligence/medical-o1-reasoning-SFT", "en", split='train[:100]', trust\_remote\_code=True)
ds\_dataframe = DataFrame(ds)
# Merge the Question and Response columns into a single string.
ds\_dataframe['merged'] = ds\_dataframe.apply(
lambda row: f"Question: {row['Question']} Answer: {row['Response']}", axis=1
)
print("Example merged text:", ds\_dataframe['merged'].iloc[0])`
```
```
`Example merged text: Question: A 61-year-old woman with a long history of involuntary urine loss during activities like coughing or sneezing but no leakage at night undergoes a gynecological exam and Q-tip test. Based on these findings, what would cystometry most likely reveal about her residual volume and detrusor contractions? Answer: Cystometry in this case of stress urinary incontinence would most likely reveal a normal post-void residual volume, as stress incontinence typically does not involve issues with bladder emptying. Additionally, since stress urinary incontinence is primarily related to physical exertion and not an overactive bladder, you would not expect to see any involuntary detrusor contractions during the test.`
```
```
`ds\_dataframe`
```
||Question|Complex\_CoT|Response|merged|
|0|A 61-year-old woman with a long history of inv...|Okay, let's think about this step by step. The...|Cystometry in this case of stress urinary inco...|Question: A 61-year-old woman with a long hist...|
|1|A 45-year-old man with a history of alcohol us...|Alright, let’s break this down. We have a 45-y...|Considering the clinical presentation of sudde...|Question: A 45-year-old man with a history of ...|
|2|A 45-year-old man presents with symptoms inclu...|Okay, so here's a 45-year-old guy who's experi...|Based on the clinical findings presented—wide-...|Question: A 45-year-old man presents with symp...|
|3|A patient with psoriasis was treated with syst...|I'm thinking about this patient with psoriasis...|The development of generalized pustules in a p...|Question: A patient with psoriasis was treated...|
|4|What is the most likely diagnosis for a 2-year...|Okay, so we're dealing with a 2-year-old child...|Based on the described symptoms and the unusua...|Question: What is the most likely diagnosis fo...|
|...|...|...|...|...|
|95|An electrical current flows along a flat plate...|Alright, to find out the temperature at the ce...|The correct answer is F. 1549°F.|Question: An electrical current flows along a ...|
|96|A herpetologist bitten by a poisonous snake is...|Alright, so we're dealing with a case where a ...|The snake venom is most likely affecting the a...|Question: A herpetologist bitten by a poisonou...|
|97|A 34 years old person has rapidly developing c...|Alright, let's break down what's happening wit...|The symptoms described in the question fit mos...|Question: A 34 years old person has rapidly de...|
|98|What is the term used to describe the type of ...|Okay, so I need to figure out what kind of inj...|The term used to describe the type of injury c...|Question: What is the term used to describe th...|
|99|During the process of chlorination of water, t...|Alright, let's think this through starting fro...|The effective disinfecting action during the c...|Question: During the process of chlorination o...|
100 rows × 4 columns
### Create a Pinecone Index Based on the Dataset
Use the dataset itself to determine the embedding dimensionality. For example, compute one embedding from the merged column and then create the index accordingly.
```
`MODEL = "text-embedding-3-small" # Replace with your production embedding model if needed
# Compute an embedding for the first document to obtain the embedding dimension.
sample\_embedding\_resp = client.embeddings.create(
input=[ds\_dataframe['merged'].iloc[0]],
model=MODEL
)
embed\_dim = len(sample\_embedding\_resp.data[0].embedding)
print(f"Embedding dimension: {embed\_dim}")`
```
```
`Embedding dimension: 1536`
```
```
`
# Initialize Pinecone using your API key.
pc = Pinecone(api\_key=os.getenv("PINECONE\_API\_KEY"))
# Define the Pinecone serverless specification.
AWS\_REGION = "us-east-1"
spec = ServerlessSpec(cloud="aws", region=AWS\_REGION)
# Create a random index name with lower case alphanumeric characters and '-'
index\_name = 'pinecone-index-' + ''.join(random.choices(string.ascii\_lowercase + string.digits, k=10))
# Create the index if it doesn't already exist.
if index\_name not in pc.list\_indexes().names():
pc.create\_index(
index\_name,
dimension=embed\_dim,
metric='dotproduct',
spec=spec
)
# Connect to the index.
index = pc.Index(index\_name)
time.sleep(1)
print("Index stats:", index.describe\_index\_stats())`
```
```
`Index stats: {'dimension': 1536,
'index\_fullness': 0.0,
'metric': 'dotproduct',
'namespaces': {},
'total\_vector\_count': 0,
'vector\_type': 'dense'}`
```
#### Upsert the Dataset into Pinecone index
Process the dataset in batches, generate embeddings for each merged text, prepare metadata (including separate Question and Answer fields), and upsert each batch into the index. You may also update metadata for specific entries if needed.
```
`batch\_size = 32
for i in tqdm(range(0, len(ds\_dataframe['merged']), batch\_size), desc="Upserting to Pinecone"):
i\_end = min(i + batch\_size, len(ds\_dataframe['merged']))
lines\_batch = ds\_dataframe['merged'][i: i\_end]
ids\_batch = [str(n) for n in range(i, i\_end)]
# Create embeddings for the current batch.
res = client.embeddings.create(input=[line for line in lines\_batch], model=MODEL)
embeds = [record.embedding for record in res.data]
# Prepare metadata by extracting original Question and Answer.
meta = []
for record in ds\_dataframe.iloc[i:i\_end].to\_dict('records'):
q\_text = record['Question']
a\_text = record['Response']
# Optionally update metadata for specific entries.
meta.append({"Question": q\_text, "Answer": a\_text})
# Upsert the batch into Pinecone.
vectors = list(zip(ids\_batch, embeds, meta))
index.upsert(vectors=vectors)`
```
```
`Upserting to Pinecone: 100%|██████████| 4/4 [00:06\<00:00, 1.64s/it]`
```
### Query the Pinecone Index
Create a natural language query, compute its embedding, and perform a similarity search on the Pinecone index. The returned results include metadata that provides context for generating answers.
```
`def query\_pinecone\_index(client, index, model, query\_text):
# Generate an embedding for the query.
query\_embedding = client.embeddings.create(input=query\_text, model=model).data[0].embedding
# Query the index and return top 5 matches.
res = index.query(vector=[query\_embedding], top\_k=5, include\_metadata=True)
print("Query Results:")
for match in res['matches']:
print(f"{match['score']:.2f}: {match['metadata'].get('Question', 'N/A')} - {match['metadata'].get('Answer', 'N/A')}")
return res`
```
```
`# Example usage with a different query from the train/test set
query = (
"A 45-year-old man with a history of alcohol use presents with symptoms including confusion, ataxia, and ophthalmoplegia. "
"What is the most likely diagnosis and the recommended treatment?"
)
query\_pinecone\_index(client, index, MODEL, query)`
```
```
`Query Results:
0.70: A 45-year-old man with a history of alcohol use, who has been abstinent for the past 10 years, presents with sudden onset dysarthria, shuffling gait, and intention tremors. Given this clinical presentation and history, what is the most likely diagnosis? - Considering the clinical presentation of sudden onset dysarthria, shuffling gait, and intention tremors in a 45-year-old man with a history of alcohol use who has been abstinent for the past 10 years, the most likely diagnosis is acquired hepatocerebral degeneration.
This condition is associated with chronic liver disease, which can often be a consequence of long-term alcohol use. Despite the patient's abstinence from alcohol for a decade, previous alcohol use may have led to underlying liver dysfunction. This dysfunction, even if subclinical, can cause encephalopathy due to the accumulation of neurotoxic substances that affect the brain. The sudden onset of these neurological symptoms aligns with how acquired hepatocerebral degeneration can manifest, making it a probable diagnosis in this scenario.
0.55: A 45-year-old man presents with symptoms including a wide-based gait, a blank facial expression, hallucinations, memory issues, a resting tremor that resolves with movement, and bradykinesia. Based on these clinical findings, what is most likely to be observed in the histological specimen of his brain? - Based on the clinical findings presented—wide-based gait, blank facial expression, hallucinations, memory issues, resting tremor that resolves with movement, and bradykinesia—it is likely that the 45-year-old man is experiencing a condition related to Parkinsonism, possibly Parkinson's disease or dementia with Lewy bodies. Both of these conditions are associated with the presence of Lewy bodies in the brain. Lewy bodies are abnormal aggregates of protein, primarily alpha-synuclein, which can cause both the motor and cognitive symptoms observed in this patient. Therefore, in the histological specimen of his brain, you would most likely observe the presence of Lewy bodies.
0.53: A 73-year-old man is evaluated for increasing forgetfulness, getting lost while walking, irritability, and difficulty recalling recent events while retaining detailed memories from over 20 years ago. On examination, he is oriented to person and place but disoriented to time, and an MRI of the brain reveals significant changes. Considering these symptoms and the imaging findings, what is the most likely underlying pathological process contributing to the patient's condition? - The symptoms and MRI findings of this 73-year-old man suggest the most likely underlying pathological process is the buildup of amyloid-beta plaques and tau protein tangles, which are characteristic of Alzheimer's disease. These changes often begin in brain regions involved in memory, such as the hippocampus and temporal lobes, leading to the gradual memory decline, disorientation, and personality changes observed in the patient.
0.42: A 2-day-old male newborn delivered at 36 weeks presents with generalized convulsions, lethargy, feeding difficulties, icterus, purpura, posterior uveitis, and failed auditory screening. Cranial ultrasonography shows ventricular dilatation and hyperechoic foci in multiple brain areas. Considering these clinical signs and history, what is the most likely diagnosis? - The symptoms and findings you've described in this 2-day-old newborn point towards congenital Toxoplasmosis. The combination of neurological symptoms (such as convulsions and ventricular dilatation with hyperechoic foci), the presence of posterior uveitis, and the skin manifestations like purpura, all fit into the classic presentation of a TORCH infection. Toxoplasmosis, specifically, is known to cause widespread calcifications in the brain, not limited to the periventricular areas, which matches the ultrasound findings. Additionally, while hearing loss is more traditionally associated with CMV, it can also occur in Toxoplasmosis. Thus, the most likely diagnosis given this clinical picture is congenital Toxoplasmosis.
0.42: A 45-year-old male patient experiences double vision specifically when walking upstairs. Considering his well-controlled history of Type-II diabetes, which cranial nerve is most likely involved in his symptoms? - Based on the symptoms described, the cranial nerve most likely involved in the double vision experienced by this patient while walking upstairs is the trochlear nerve, or cranial nerve IV. This nerve controls the superior oblique muscle, which plays a role in stabilizing the eye during certain movements, including the coordination required when looking upwards while walking upstairs. Given the patient's history of diabetes, cranial neuropathies can occur, and CN IV involvement can lead to vertical diplopia that becomes noticeable during specific activities like walking up stairs. Therefore, the trochlear nerve is a likely candidate for the involvement in these symptoms.`
```
```
`{'matches': [{'id': '1',
'metadata': {'Answer': 'Considering the clinical presentation of '
'sudden onset dysarthria, shuffling gait, '
'and intention tremors in a 45-year-old '
'man with a history of alcohol use who '
'has been abstinent for the past 10 '
'years, the most likely diagnosis is '
'acquired hepatocerebral degeneration.\\n'
'\\n'
'This condition is associated with '
'chronic liver disease, which can often '
'be a consequence of long-term alcohol '
"use. Despite the patient's abstinence "
'from alcohol for a decade, previous '
'alcohol use may have led to underlying '
'liver dysfunction. This dysfunction, '
'even if subclinical, can cause '
'encephalopathy due to the accumulation '
'of neurotoxic substances that affect the '
'brain. The sudden onset of these '
'neurological symptoms aligns with how '
'acquired hepatocerebral degeneration can '
'manifest, making it a probable diagnosis '
'in this scenario.',
'Question': 'A 45-year-old man with a history of '
'alcohol use, who has been abstinent '
'for the past 10 years, presents with '
'sudden onset dysarthria, shuffling '
'gait, and intention tremors. Given '
'this clinical presentation and '
'history, what is the most likely '
'diagnosis?'},
'score': 0.697534442,
'values': []},
{'id': '2',
'metadata': {'Answer': 'Based on the clinical findings '
'presented—wide-based gait, blank facial '
'expression, hallucinations, memory '
'issues, resting tremor that resolves '
'with movement, and bradykinesia—it is '
'likely that the 45-year-old man is '
'experiencing a condition related to '
"Parkinsonism, possibly Parkinson's "
'disease or dementia with Lewy bodies. '
'Both of these conditions are associated '
'with the presence of Lewy bodies in the '
'brain. Lewy bodies are abnormal '
'aggregates of protein, primarily '
'alpha-synuclein, which can cause both '
'the motor and cognitive symptoms '
'observed in this patient. Therefore, in '
'the histological specimen of his brain, '
'you would most likely observe the '
'presence of Lewy bodies.',
'Question': 'A 45-year-old man presents with '
'symptoms including a wide-based gait, '
'a blank facial expression, '
'hallucinations, memory issues, a '
'resting tremor that resolves with '
'movement, and bradykinesia. Based on '
'these clinical findings, what is most '
'likely to be observed in the '
'histological specimen of his brain?'},
'score': 0.55345,
'values': []},
{'id': '19',
'metadata': {'Answer': 'The symptoms and MRI findings of this '
'73-year-old man suggest the most likely '
'underlying pathological process is the '
'buildup of amyloid-beta plaques and tau '
'protein tangles, which are '
"characteristic of Alzheimer's disease. "
'These changes often begin in brain '
'regions involved in memory, such as the '
'hippocampus and temporal lobes, leading '
'to the gradual memory decline, '
'disorientation, and personality changes '
'observed in the patient.',
'Question': 'A 73-year-old man is evaluated for '
'increasing forgetfulness, getting lost '
'while walking, irritability, and '
'difficulty recalling recent events '
'while retaining detailed memories from '
'over 20 years ago. On examination, he '
'is oriented to person and place but '
'disoriented to time, and an MRI of the '
'brain reveals significant changes. '
'Considering these symptoms and the '
'imaging findings, what is the most '
'likely underlying pathological process '
"contributing to the patient's "
'condition?'},
'score': 0.526201367,
'values': []},
{'id': '38',
'metadata': {'Answer': "The symptoms and findings you've "
'described in this 2-day-old newborn '
'point towards congenital Toxoplasmosis. '
'The combination of neurological symptoms '
'(such as convulsions and ventricular '
'dilatation with hyperechoic foci), the '
'presence of posterior uveitis, and the '
'skin manifestations like purpura, all '
'fit into the classic presentation of a '
'TORCH infection. Toxoplasmosis, '
'specifically, is known to cause '
'widespread calcifications in the brain, '
'not limited to the periventricular '
'areas, which matches the ultrasound '
'findings. Additionally, while hearing '
'loss is more traditionally associated '
'with CMV, it can also occur in '
'Toxoplasmosis. Thus, the most likely '
'diagnosis given this clinical picture is '
'congenital Toxoplasmosis.',
'Question': 'A 2-day-old male newborn delivered at '
'36 weeks presents with generalized '
'convulsions, lethargy, feeding '
'difficulties, icterus, purpura, '
'posterior uveitis, and failed auditory '
'screening. Cranial ultrasonography '
'shows ventricular dilatation and '
'hyperechoic foci in multiple brain '
'areas. Considering these clinical '
'signs and history, what is the most '
'likely diagnosis?'},
'score': 0.422916651,
'values': []},
{'id': '31',
'metadata': {'Answer': 'Based on the symptoms described, the '
'cranial nerve most likely involved in '
'the double vision experienced by this '
'patient while walking upstairs is the '
'trochlear nerve, or cranial nerve IV. '
'This nerve controls the superior oblique '
'muscle, which plays a role in '
'stabilizing the eye during certain '
'movements, including the coordination '
'required when looking upwards while '
"walking upstairs. Given the patient's "
'history of diabetes, cranial '
'neuropathies can occur, and CN IV '
'involvement can lead to vertical '
'diplopia that becomes noticeable during '
'specific activities like walking up '
'stairs. Therefore, the trochlear nerve '
'is a likely candidate for the '
'involvement in these symptoms.',
'Question': 'A 45-year-old male patient experiences '
'double vision specifically when '
'walking upstairs. Considering his '
'well-controlled history of Type-II '
'diabetes, which cranial nerve is most '
'likely involved in his symptoms?'},
'score': 0.420719624,
'values': []}],
'namespace': '',
'usage': {'read\_units': 6}}`
```
### Generate a Response Using the Retrieved Context
Select the best matching result from your query results and use the OpenAI Responses API to generate a final answer by combining the retrieved context with the original question.
```
`# Retrieve and concatenate top 3 match contexts.
matches = index.query(
vector=[client.embeddings.create(input=query, model=MODEL).data[0].embedding],
top\_k=3,
include\_metadata=True
)['matches']
context = "\\n\\n".join(
f"Question: {m['metadata'].get('Question', '')}\\nAnswer: {m['metadata'].get('Answer', '')}"
for m in matches
)
# Use the context to generate a final answer.
response = client.responses.create(
model="gpt-4o",
input=f"Provide the answer based on the context: {context} and the question: {query} as per the internal knowledge base",
)
print("\\nFinal Answer:")
print(response.output\_text)`
```
```
`
Final Answer:
The presentation of confusion, ataxia, and ophthalmoplegia in a 45-year-old man with a history of alcohol use is suggestive of Wernicke's encephalopathy. This condition is caused by thiamine (vitamin B1) deficiency, often associated with chronic alcohol use.
The recommended treatment is the immediate administration of thiamine, typically given intravenously or intramuscularly, to prevent progression to more severe neurological damage or Korsakoff syndrome.`
```
### Orchestrate Multi-Tool Calls
Now, we’ll define the built-in function available through the Responses API, including the ability to invoke the external Vector Store - Pinecone as an example.
*Web Search Preview Tool*: Enables the model to perform live web searches and preview the results. This is ideal for retrieving real-time or up-to-date information from the internet.
*Pinecone Search Tool*: Allows the model to query a vector database using semantic search. This is especially useful for retrieving relevant documents—such as medical literature or other domain-specific content—that have been stored in a vectorized format.
```
`# Tools definition: The list of tools includes:
# - A web search preview tool.
# - A Pinecone search tool for retrieving medical documents.
# Define available tools.
tools = [
{"type": "web\_search\_preview",
"user\_location": {
"type": "approximate",
"country": "US",
"region": "California",
"city": "SF"
},
"search\_context\_size": "medium"},
{
"type": "function",
"name": "PineconeSearchDocuments",
"description": "Search for relevant documents based on the medical question asked by the user that is stored within the vector database using a semantic query.",
"parameters": {
"type": "object",
"properties": {
"query": {
"type": "string",
"description": "The natural language query to search the vector database."
},
"top\_k": {
"type": "integer",
"description": "Number of top results to return.",
"default": 3
}
},
"required": ["query"],
"additionalProperties": False
}
}
]`
```
```
`# Example queries that the model should route appropriately.
queries = [
{"query": "Who won the cricket world cup in 1983?"},
{"query": "What is the most common cause of death in the United States according to the internet?"},
{"query": ("A 7-year-old boy with sickle cell disease is experiencing knee and hip pain, "
"has been admitted for pain crises in the past, and now walks with a limp. "
"His exam shows a normal, cool hip with decreased range of motion and pain with ambulation. "
"What is the most appropriate next step in management according to the internal knowledge base?")}
]`
```
```
`# Process each query dynamically.
for item in queries:
input\_messages = [{"role": "user", "content": item["query"]}]
print("\\n🌟--- Processing Query ---🌟")
print(f"🔍 \*\*User Query:\*\* {item['query']}")
# Call the Responses API with tools enabled and allow parallel tool calls.
response = client.responses.create(
model="gpt-4o",
input=[
{"role": "system", "content": "When prompted with a question, select the right tool to use based on the question."
},
{"role": "user", "content": item["query"]}
],
tools=tools,
parallel\_tool\_calls=True
)
print("\\n✨ \*\*Initial Response Output:\*\*")
print(response.output)
# Determine if a tool call is needed and process accordingly.
if response.output:
tool\_call = response.output[0]
if tool\_call.type in ["web\_search\_preview", "function\_call"]:
tool\_name = tool\_call.name if tool\_call.type == "function\_call" else "web\_search\_preview"
print(f"\\n🔧 \*\*Model triggered a tool call:\*\* {tool\_name}")
if tool\_name == "PineconeSearchDocuments":
print("🔍 \*\*Invoking PineconeSearchDocuments tool...\*\*")
res = query\_pinecone\_index(client, index, MODEL, item["query"])
if res["matches"]:
best\_match = res["matches"][0]["metadata"]
result = f"\*\*Question:\*\* {best\_match.get('Question', 'N/A')}\\n\*\*Answer:\*\* {best\_match.get('Answer', 'N/A')}"
else:
result = "\*\*No matching documents found in the index.\*\*"
print("✅ \*\*PineconeSearchDocuments tool invoked successfully.\*\*")
else:
print("🔍 \*\*Invoking simulated web search tool...\*\*")
result = "\*\*Simulated web search result.\*\*"
print("✅ \*\*Simulated web search tool invoked successfully.\*\*")
# Append the tool call and its output back into the conversation.
input\_messages.append(tool\_call)
input\_messages.append({
"type": "function\_call\_output",
"call\_id": tool\_call.call\_id,
"output": str(result)
})
# Get the final answer incorporating the tool's result.
final\_response = client.responses.create(
model="gpt-4o",
input=input\_messages,
tools=tools,
parallel\_tool\_calls=True
)
print("\\n💡 \*\*Final Answer:\*\*")
print(final\_response.output\_text)
else:
# If no tool call is triggered, print the response directly.
print("💡 \*\*Final Answer:\*\*")
print(response.output\_text)`
```
```
`
🌟--- Processing Query ---🌟
🔍 \*\*User Query:\*\* Who won the cricket world cup in 1983?
✨ \*\*Initial Response Output:\*\*
[ResponseOutputMessage(id='msg\_67e6e7a9f7508191a9d18c3ff25310290811a0720cf47168', content=[ResponseOutputText(annotations=[], text='India won the Cricket World Cup in 1983.', type='output\_text')], role='assistant', status='completed', type='message')]
💡 \*\*Final Answer:\*\*
India won the Cricket World Cup in 1983.
🌟--- Processing Query ---🌟
🔍 \*\*User Query:\*\* What is the most common cause of death in the United States according to the internet?
✨ \*\*Initial Response Output:\*\*
[ResponseFunctionWebSearch(id='ws\_67e6e7aad0248191ab974d4b09b460c90537f90023d2dd32', status='completed', type='web\_search\_call'), ResponseOutputMessage(id='msg\_67e6e7ace08081918f06b5cac32e8c0e0537f90023d2dd32', content=[ResponseOutputText(annotations=[AnnotationURLCitation(end\_index=363, start\_index=225, title='10 Leading Causes of Death in the U.S.', type='url\_citation', url='https://www.usnews.com/news/healthiest-communities/slideshows/top-10-causes-of-death-in-america?slide=11&utm\_source=openai'), AnnotationURLCitation(end\_index=753, start\_index=625, title='Top causes of death in the US — see the CDC’s latest list - Rifnote', type='url\_citation', url='https://rifnote.com/health/2024/08/11/top-causes-of-death-in-the-us-see-the-cdcs-latest-list/?utm\_source=openai'), AnnotationURLCitation(end\_index=1014, start\_index=886, title='Top causes of death in the US — see the CDC’s latest list - Rifnote', type='url\_citation', url='https://rifnote.com/health/2024/08/11/top-causes-of-death-in-the-us-see-the-cdcs-latest-list/?utm\_source=openai'), AnnotationURLCitation(end\_index=1216, start\_index=1061, title='US deaths are down and life expectancy is up, but improvements are slowing', type='url\_citation', url='https://apnews.com/article/be061f9f14c883178eea6dddc9550e60?utm\_source=openai'), AnnotationURLCitation(end\_index=1394, start\_index=1219, title='A Mysterious Health Wave Is Breaking Out Across the U.S.', type='url\_citation', url='https://www.theatlantic.com/ideas/archive/2024/12/violence-obesity-overdoses-health-covid/681079/?utm\_source=openai')], text='According to the Centers for Disease Control and Prevention (CDC), heart disease was the leading cause of death in the United States in 2023, accounting for 680,980 deaths, which is approximately 22% of all deaths that year. ([usnews.com](https://www.usnews.com/news/healthiest-communities/slideshows/top-10-causes-of-death-in-america?slide=11&utm\_source=openai))\\n\\nThe top 10 causes of death in the U.S. for 2023 were:\\n\\n1. Heart disease\\n2. Cancer\\n3. Unintentional injury\\n4. Stroke\\n5. Chronic lower respiratory diseases\\n6. Alzheimer’s disease\\n7. Diabetes\\n8. Kidney disease\\n9. Chronic liver disease and cirrhosis\\n10. COVID-19\\n\\n([rifnote.com](https://rifnote.com/health/2024/08/11/top-causes-of-death-in-the-us-see-the-cdcs-latest-list/?utm\_source=openai))\\n\\nNotably, COVID-19, which was the fourth leading cause of death in 2022, dropped to the tenth position in 2023, with 76,446 deaths. ([rifnote.com](https://rifnote.com/health/2024/08/11/top-causes-of-death-in-the-us-see-the-cdcs-latest-list/?utm\_source=openai))\\n\\n\\n## Recent Trends in U.S. Mortality Rates:\\n- [US deaths are down and life expectancy is up, but improvements are slowing](https://apnews.com/article/be061f9f14c883178eea6dddc9550e60?utm\_source=openai)\\n- [A Mysterious Health Wave Is Breaking Out Across the U.S.](https://www.theatlantic.com/ideas/archive/2024/12/violence-obesity-overdoses-health-covid/681079/?utm\_source=openai) ', type='output\_text')], role='assistant', status='completed', type='message')]
💡 \*\*Final Answer:\*\*
According to the Centers for Disease Control and Prevention (CDC), heart disease was the leading cause of death in the United States in 2023, accounting for 680,980 deaths, which is approximately 22% of all deaths that year. ([usnews.com](https://www.usnews.com/news/healthiest-communities/slideshows/top-10-causes-of-death-in-america?slide=11&utm\_source=openai))
The top 10 causes of death in the U.S. for 2023 were:
1. Heart disease
2. Cancer
3. Unintentional injury
4. Stroke
5. Chronic lower respiratory diseases
6. Alzheimer’s disease
7. Diabetes
8. Kidney disease
9. Chronic liver disease and cirrhosis
10. COVID-19
([rifnote.com](https://rifnote.com/health/2024/08/11/top-causes-of-death-in-the-us-see-the-cdcs-latest-list/?utm\_source=openai))
Notably, COVID-19, which was the fourth leading cause of death in 2022, dropped to the tenth position in 2023, with 76,446 deaths. ([rifnote.com](https://rifnote.com/health/2024/08/11/top-causes-of-death-in-the-us-see-the-cdcs-latest-list/?utm\_source=openai))
## Recent Trends in U.S. Mortality Rates:
- [US deaths are down and life expectancy is up, but improvements are slowing](https://apnews.com/article/be061f9f14c883178eea6dddc9550e60?utm\_source=openai)
- [A Mysterious Health Wave Is Breaking Out Across the U.S.](https://www.theatlantic.com/ideas/archive/2024/12/violence-obesity-overdoses-health-covid/681079/?utm\_source=openai)
🌟--- Processing Query ---🌟
🔍 \*\*User Query:\*\* A 7-year-old boy with sickle cell disease is experiencing knee and hip pain, has been admitted for pain crises in the past, and now walks with a limp. His exam shows a normal, cool hip with decreased range of motion and pain with ambulation. What is the most appropriate next step in management according to the internal knowledge base?
✨ \*\*Initial Response Output:\*\*
[ResponseFunctionToolCall(arguments='{"query":"7-year-old sickle cell disease knee hip pain limp normal cool hip decreased range of motion"}', call\_id='call\_ds0ETZbYtX71U2bQZXTBEWxN', name='PineconeSearchDocuments', type='function\_call', id='fc\_67e6e7b03ee48191bb400c13c359c35e0aeeec60d0806312', status='completed')]
🔧 \*\*Model triggered a tool call:\*\* PineconeSearchDocuments
🔍 \*\*Invoking PineconeSearchDocuments tool...\*\*
Query Results:
0.87: A 7-year-old boy with sickle cell disease is experiencing knee and hip pain, has been admitted for pain crises in the past, and now walks with a limp. His physical exam shows a normal and cool hip to the touch, with decreased range of motion at the hip and pain with ambulation. Given these findings, what is the most appropriate next step in the management of this patient's hip pain? - In managing the hip pain of a 7-year-old boy with sickle cell disease, who presents with knee and hip pain, a limp, and decreased range of motion in the hip, the most appropriate next step is to obtain an X-ray of the hip. This will help evaluate the possibility of avascular necrosis (AVN) or other structural abnormalities. X-rays are typically the first-line imaging technique in such cases due to their accessibility and ability to reveal gross pathological changes. If the X-ray does not provide conclusive information and clinical suspicion of AVN remains high, an MRI may subsequently be considered for a more detailed assessment.
0.55: What is the most likely diagnosis for a 2-year-old 70 kg child who presents with limitation of abduction and internal rotation, tenderness in Scarpa's triangle, and abduction of the limb upon flexing the hip? - Based on the described symptoms and the unusual weight for a 2-year-old child, the most likely diagnosis is Slipped Capital Femoral Epiphysis (SCFE). Even though SCFE typically occurs in older children, mainly adolescents, the combination of excessive weight, limited hip abduction and internal rotation, tenderness in the hip area, and the characteristic limb movement (abduction upon hip flexion) strongly points towards SCFE as the most plausible diagnosis in this scenario.
0.48: A 5-year-old boy has recurrent abdominal pain primarily occurring during school hours, with no significant findings on physical examination and normal stool characteristics. His symptoms resolve at home, and his laboratory tests and abdominal exam are unremarkable. Considering the psychological factors involved, what is the most appropriate next step in managing his condition? - Given the symptoms and the context you've provided, it seems quite possible that the boy's recurrent abdominal pain is linked to psychological stressors related to school. Since all medical tests and examinations have returned normal results, this suggests that the pain might be stress-induced, possibly due to anxiety or stress at school.
The most appropriate next step is to focus on addressing any potential psychological or emotional factors. Consulting a psychologist or school counselor would be beneficial. They can work with the boy to explore any underlying emotional issues or anxieties about school. Through conversation, play, or other therapeutic techniques suitable for his age, they can help identify and manage any stressors he might be facing. This approach could not only help alleviate his abdominal pain but also improve his overall well-being by addressing the source of his anxiety.
0.44: In a patient who, five days post-open colectomy for colon cancer, develops severe pain and swelling of the left calf along with necrotic lesions, a fever, and thrombocytopenia while on unfractionated heparin, what is the most appropriate next step in management? - In this clinical scenario, the presentation of severe pain and swelling in the calf, necrotic skin lesions, fever, and thrombocytopenia in a patient receiving unfractionated heparin strongly suggests heparin-induced thrombocytopenia (HIT). HIT is a prothrombotic disorder caused by antibodies against heparin-platelet factor 4 complexes, leading to platelet activation, thrombocytopenia, and an increased risk of thrombosis.
The most appropriate next step in management is to immediately discontinue the unfractionated heparin to prevent further complications related to thrombosis. Simultaneously, it's crucial to initiate an alternative anticoagulant that does not cross-react with HIT antibodies to manage the thrombotic risk. Argatroban or fondaparinux are commonly used anticoagulants in this context as they are safe and effective for patients with HIT. Direct-acting oral anticoagulants (DOACs) are also potential options, but argatroban is often preferred initially due to its intravenous route and ability to be titrated easily in acute care settings. This dual approach addresses both the cause and the risk effectively.
0.44: In a patient with sickle cell anaemia presenting with multiple non-suppurative osteomyelitic dactylitis, what is the most likely causative organism? - In a patient with sickle cell anemia presenting with multiple non-suppurative osteomyelitic dactylitis, the most likely causative organism is Salmonella species. In individuals with sickle cell disease, Salmonella is particularly notorious for causing osteomyelitis. The relationship between sickle cell anemia and Salmonella infections, especially in the bone, is well-documented, and their presentations can often be less typical and less suppurative than those caused by other common bacteria like Staphylococcus aureus.
✅ \*\*PineconeSearchDocuments tool invoked successfully.\*\*
💡 \*\*Final Answer:\*\*
The most appropriate next step in the management of this 7-year-old boy with sickle cell disease and hip pain is to obtain an X-ray of the hip. This will help evaluate for potential avascular necrosis or other structural issues. If the X-ray is inconclusive and there is still a high suspicion of avascular necrosis, further imaging with an MRI may be considered.`
```
As shown above, depending on the query, appropriate tool is invoked in order to determine the optimal response.
For instance, looking at the third example, when the model triggers the tool named “PineconeSearchDocuments”, the code calls `query\_pinecone\_index` with the current query and then extracts the best match (or an appropriate context) as the result. For non health related inqueries or queries where explicit internet search is asked, the code calls the web\_search\_call function and for other queries, it may choose to not call any tool and rather provide a response based on the question under consideration.
Finally, the tool call and its output are appended to the conversation, and the final answer is generated by the Responses API.
### Multi-tool orchestration flow
Now let us try to modify the input query and the system instructions to the responses API in order to follow a tool calling sequence and generate the output.
```
`# Process one query as an example to understand the tool calls and function calls as part of the response output
item = "What is the most common cause of death in the United States"
# Initialize input messages with the user's query.
input\_messages = [{"role": "user", "content": item}]
print("\\n🌟--- Processing Query ---🌟")
print(f"🔍 \*\*User Query:\*\* {item}")
# Call the Responses API with tools enabled and allow parallel tool calls.
print("\\n🔧 \*\*Calling Responses API with Tools Enabled\*\*")
print("\\n🕵️‍♂️ \*\*Step 1: Web Search Call\*\*")
print(" - Initiating web search to gather initial information.")
print("\\n📚 \*\*Step 2: Pinecone Search Call\*\*")
print(" - Querying Pinecone to find relevant examples from the internal knowledge base.")
response = client.responses.create(
model="gpt-4o",
input=[
{"role": "system", "content": "Every time it's prompted with a question, first call the web search tool for results, then call `PineconeSearchDocuments` to find real examples in the internal knowledge base."},
{"role": "user", "content": item}
],
tools=tools,
parallel\_tool\_calls=True
)
# Print the initial response output.
print("input\_messages", input\_messages)
print("\\n✨ \*\*Initial Response Output:\*\*")
print(response.output)`
```
```
`
🌟--- Processing Query ---🌟
🔍 \*\*User Query:\*\* What is the most common cause of death in the United States
🔧 \*\*Calling Responses API with Tools Enabled\*\*
🕵️‍♂️ \*\*Step 1: Web Search Call\*\*
- Initiating web search to gather initial information.
📚 \*\*Step 2: Pinecone Search Call\*\*
- Querying Pinecone to find relevant examples from the internal knowledge base.
input\_messages [{'role': 'user', 'content': 'What is the most common cause of death in the United States'}]
✨ \*\*Initial Response Output:\*\*
[ResponseFunctionWebSearch(id='ws\_67e6e83241ac81918f93ffc96491ec390fdddafaeefcefc1', status='completed', type='web\_search\_call'), ResponseOutputMessage(id='msg\_67e6e833a2cc8191a9df22f324a876b00fdddafaeefcefc1', content=[ResponseOutputText(annotations=[AnnotationURLCitation(end\_index=698, start\_index=613, title='Products - Data Briefs - Number 521 - December 2024', type='url\_citation', url='https://www.cdc.gov/nchs/products/databriefs/db521.htm?utm\_source=openai'), AnnotationURLCitation(end\_index=984, start\_index=891, title='US deaths are down and life expectancy is up, but improvements are slowing', type='url\_citation', url='https://apnews.com/article/be061f9f14c883178eea6dddc9550e60?utm\_source=openai'), AnnotationURLCitation(end\_index=1186, start\_index=1031, title='US deaths are down and life expectancy is up, but improvements are slowing', type='url\_citation', url='https://apnews.com/article/be061f9f14c883178eea6dddc9550e60?utm\_source=openai')], text="As of 2023, the leading causes of death in the United States are:\\n\\n1. \*\*Heart Disease\*\*: 680,981 deaths\\n2. \*\*Cancer\*\*: 613,352 deaths\\n3. \*\*Unintentional Injuries\*\*: 222,698 deaths\\n4. \*\*Stroke\*\*: 162,639 deaths\\n5. \*\*Chronic Lower Respiratory Diseases\*\*: 145,357 deaths\\n6. \*\*Alzheimer's Disease\*\*: 114,034 deaths\\n7. \*\*Diabetes\*\*: 95,190 deaths\\n8. \*\*Kidney Disease\*\*: 55,253 deaths\\n9. \*\*Chronic Liver Disease and Cirrhosis\*\*: 52,222 deaths\\n10. \*\*COVID-19\*\*: 49,932 deaths\\n\\nNotably, COVID-19 has dropped from the fourth leading cause in 2022 to the tenth in 2023, reflecting a significant decrease in related deaths. ([cdc.gov](https://www.cdc.gov/nchs/products/databriefs/db521.htm?utm\_source=openai))\\n\\nOverall, the U.S. experienced a decline in total deaths and a modest increase in life expectancy in 2023, attributed to reductions in deaths from COVID-19, heart disease, and drug overdoses. ([apnews.com](https://apnews.com/article/be061f9f14c883178eea6dddc9550e60?utm\_source=openai))\\n\\n\\n## Recent Trends in U.S. Mortality Rates:\\n- [US deaths are down and life expectancy is up, but improvements are slowing](https://apnews.com/article/be061f9f14c883178eea6dddc9550e60?utm\_source=openai) ", type='output\_text')], role='assistant', status='completed', type='message'), ResponseFunctionToolCall(arguments='{"query":"most common cause of death in the United States","top\_k":3}', call\_id='call\_6YWhEw3QSI7wGZBlNs5Pz4zI', name='PineconeSearchDocuments', type='function\_call', id='fc\_67e6e8364e4c819198501fba5d3f155b0fdddafaeefcefc1', status='completed')]`
```
```
`# Understand the tool calls and function calls as part of the response output
import pandas as pd
# Create a list to store the tool call and function call details
tool\_calls = []
# Iterate through the response output and collect the details
for i in response.output:
tool\_calls.append({
"Type": i.type,
"Call ID": i.call\_id if hasattr(i, 'call\_id') else i.id if hasattr(i, 'id') else "N/A",
"Output": str(i.output) if hasattr(i, 'output') else "N/A",
"Name": i.name if hasattr(i, 'name') else "N/A"
})
# Convert the list to a DataFrame for tabular display
df\_tool\_calls = pd.DataFrame(tool\_calls)
# Display the DataFrame
df\_tool\_calls`
```
||Type|Call ID|Output|Name|
|0|web\_search\_call|ws\_67e6e83241ac81918f93ffc96491ec390fdddafaeef...|N/A|N/A|
|1|message|msg\_67e6e833a2cc8191a9df22f324a876b00fdddafaee...|N/A|N/A|
|2|function\_call|call\_6YWhEw3QSI7wGZBlNs5Pz4zI|N/A|PineconeSearchDocuments|
```
`tool\_call\_1 = response.output[0]
print(tool\_call\_1)
print(tool\_call\_1.id)
tool\_call\_2 = response.output[2]
print(tool\_call\_2)
print(tool\_call\_2.call\_id)`
```
```
`ResponseFunctionWebSearch(id='ws\_67e6e83241ac81918f93ffc96491ec390fdddafaeefcefc1', status='completed', type='web\_search\_call')
ws\_67e6e83241ac81918f93ffc96491ec390fdddafaeefcefc1
ResponseFunctionToolCall(arguments='{"query":"most common cause of death in the United States","top\_k":3}', call\_id='call\_6YWhEw3QSI7wGZBlNs5Pz4zI', name='PineconeSearchDocuments', type='function\_call', id='fc\_67e6e8364e4c819198501fba5d3f155b0fdddafaeefcefc1', status='completed')
call\_6YWhEw3QSI7wGZBlNs5Pz4zI`
```
```
`# append the tool call and its output back into the conversation.
input\_messages.append(response.output[2])
input\_messages.append({
"type": "function\_call\_output",
"call\_id": tool\_call\_2.call\_id,
"output": str(result)
})
print(input\_messages)`
```
```
`[{'role': 'user', 'content': 'What is the most common cause of death in the United States'}, ResponseFunctionToolCall(arguments='{"query":"most common cause of death in the United States"}', call\_id='call\_8Vzsn4RwMOgXyX98UpZY8hls', name='PineconeSearchDocuments', type='function\_call', id='fc\_67e348f36f7c81919d0aeef1855df3f20d0bd7f2a5744b88', status='completed')]
[{'role': 'user', 'content': 'What is the most common cause of death in the United States'}, ResponseFunctionToolCall(arguments='{"query":"most common cause of death in the United States"}', call\_id='call\_8Vzsn4RwMOgXyX98UpZY8hls', name='PineconeSearchDocuments', type='function\_call', id='fc\_67e348f36f7c81919d0aeef1855df3f20d0bd7f2a5744b88', status='completed'), {'type': 'function\_call\_output', 'call\_id': 'call\_8Vzsn4RwMOgXyX98UpZY8hls', 'output': "\*\*Question:\*\* A 7-year-old boy with sickle cell disease is experiencing knee and hip pain, has been admitted for pain crises in the past, and now walks with a limp. His physical exam shows a normal and cool hip to the touch, with decreased range of motion at the hip and pain with ambulation. Given these findings, what is the most appropriate next step in the management of this patient's hip pain?\\n\*\*Answer:\*\* In managing the hip pain of a 7-year-old boy with sickle cell disease, who presents with knee and hip pain, a limp, and decreased range of motion in the hip, the most appropriate next step is to obtain an X-ray of the hip. This will help evaluate the possibility of avascular necrosis (AVN) or other structural abnormalities. X-rays are typically the first-line imaging technique in such cases due to their accessibility and ability to reveal gross pathological changes. If the X-ray does not provide conclusive information and clinical suspicion of AVN remains high, an MRI may subsequently be considered for a more detailed assessment."}]`
```
```
`
# Get the final answer incorporating the tool's result.
print("\\n🔧 \*\*Calling Responses API for Final Answer\*\*")
response\_2 = client.responses.create(
model="gpt-4o",
input=input\_messages,
)
print(response\_2)`
```
```
`
🔧 \*\*Calling Responses API for Final Answer\*\*
Response(id='resp\_67e6e886ac7081918b07224fb1ed38ab05c4a598f9697c7c', created\_at=1743186054.0, error=None, incomplete\_details=None, instructions=None, metadata={}, model='gpt-4o-2024-08-06', object='response', output=[ResponseOutputMessage(id='msg\_67e6e8872ddc81918e92c9e4508abbe005c4a598f9697c7c', content=[ResponseOutputText(annotations=[], text='The most common cause of death in the United States is heart disease.', type='output\_text')], role='assistant', status='completed', type='message')], parallel\_tool\_calls=True, temperature=1.0, tool\_choice='auto', tools=[], top\_p=1.0, max\_output\_tokens=None, previous\_response\_id=None, reasoning=Reasoning(effort=None, generate\_summary=None), status='completed', text=ResponseTextConfig(format=ResponseFormatText(type='text')), truncation='disabled', usage=ResponseUsage(input\_tokens=37, input\_tokens\_details=InputTokensDetails(cached\_tokens=0), output\_tokens=15, output\_tokens\_details=OutputTokensDetails(reasoning\_tokens=0), total\_tokens=52), user=None, store=False)`
```
```
`# print the final answer
print(response\_2.output\_text)`
```
```
`The most common cause of death in the United States is heart disease.`
```
Here, we have seen how to utilize OpenAI’s Responses API to implement a Retrieval-Augmented Generation (RAG) approach with multi-tool calling capabilities. It showcases an example where the model selects the appropriate tool based on the input query: general questions may be handled by built-in tools such as web-search, while specific medical inquiries related to internal knowledge are addressed by retrieving context from a vector database (such as Pinecone) via function calls. Additonally, we have showcased how multiple tool calls can be sequentially combined to generate a final response based on our instructions provided to responses API.
As you continue to experiment and build upon these concepts, consider exploring additional resources and examples to further enhance your understanding and applications
Happy coding!