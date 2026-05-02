Doing RAG on PDFs using File Search in the Responses API
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
Mar 11, 2025
# Doing RAG on PDFs using File Search in the Responses API
[ PP ](https://www.linkedin.com/in/portepa/)
[ Pierre-Antoine Porte
(OpenAI)
](https://www.linkedin.com/in/portepa/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/File_Search_Responses.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/File_Search_Responses.ipynb)
Although RAG can be overwhelming, searching amongst PDF file shouldn’t be complicated. One of the most adopted options as of now is parsing your PDF, defining your chunking strategies, uploading those chunks to a storage provider, running embeddings on those chunks of texts and storing those embeddings in a vector database. And that’s only the setup — retrieving content in our LLM workflow also requires multiple steps.
This is where file search — a hosted tool you can use in the Responses API — comes in. It allows you to search your knowledge base and generate an answer based on the retrieved content. In this cookbook, we’ll upload those PDFs to a vector store on OpenAI and use file search to fetch additional context from this vector store to answer the questions we generated in the first step. Then, we’ll initially create a small set of questions based on PDFs extracted from OpenAI’s blog ([openai.com/news](https://openai.com/news)).
*File search was previously available on the Assistants API. It’s now available on the new Responses API, an API that can be stateful or stateless, and with from new features like metadata filtering*
# Creating Vector Store with our PDFs
```
`!pip install PyPDF2 pandas tqdm openai -q`
```
```
`from openai import OpenAI
from concurrent.futures import ThreadPoolExecutor
from tqdm import tqdm
import concurrent
import PyPDF2
import os
import pandas as pd
import base64
client = OpenAI(api\_key=os.getenv('OPENAI\_API\_KEY'))
dir\_pdfs = 'openai\_blog\_pdfs' # have those PDFs stored locally here
pdf\_files = [os.path.join(dir\_pdfs, f) for f in os.listdir(dir\_pdfs)]`
```
We will create a Vector Store on OpenAI API and upload our PDFs to the Vector Store. OpenAI will read those PDFs, separate the content into multiple chunks of text, run embeddings on those and store those embeddings and the text in the Vector Store. It will enable us to query this Vector Store to return relevant content based on a query.
```
`def upload\_single\_pdf(file\_path: str, vector\_store\_id: str):
file\_name = os.path.basename(file\_path)
try:
file\_response = client.files.create(file=open(file\_path, 'rb'), purpose="assistants")
attach\_response = client.vector\_stores.files.create(
vector\_store\_id=vector\_store\_id,
file\_id=file\_response.id
)
return {"file": file\_name, "status": "success"}
except Exception as e:
print(f"Error with {file\_name}: {str(e)}")
return {"file": file\_name, "status": "failed", "error": str(e)}
def upload\_pdf\_files\_to\_vector\_store(vector\_store\_id: str):
pdf\_files = [os.path.join(dir\_pdfs, f) for f in os.listdir(dir\_pdfs)]
stats = {"total\_files": len(pdf\_files), "successful\_uploads": 0, "failed\_uploads": 0, "errors": []}
print(f"{len(pdf\_files)} PDF files to process. Uploading in parallel...")
with concurrent.futures.ThreadPoolExecutor(max\_workers=10) as executor:
futures = {executor.submit(upload\_single\_pdf, file\_path, vector\_store\_id): file\_path for file\_path in pdf\_files}
for future in tqdm(concurrent.futures.as\_completed(futures), total=len(pdf\_files)):
result = future.result()
if result["status"] == "success":
stats["successful\_uploads"] += 1
else:
stats["failed\_uploads"] += 1
stats["errors"].append(result)
return stats
def create\_vector\_store(store\_name: str) -\> dict:
try:
vector\_store = client.vector\_stores.create(name=store\_name)
details = {
"id": vector\_store.id,
"name": vector\_store.name,
"created\_at": vector\_store.created\_at,
"file\_count": vector\_store.file\_counts.completed
}
print("Vector store created:", details)
return details
except Exception as e:
print(f"Error creating vector store: {e}")
return {}`
```
```
`store\_name = "openai\_blog\_store"
vector\_store\_details = create\_vector\_store(store\_name)
upload\_pdf\_files\_to\_vector\_store(vector\_store\_details["id"])`
```
```
`Vector store created: {'id': 'vs\_67d06b9b9a9c8191bafd456cf2364ce3', 'name': 'openai\_blog\_store', 'created\_at': 1741712283, 'file\_count': 0}
21 PDF files to process. Uploading in parallel...`
```
```
`100%|███████████████████████████████| 21/21 [00:09\<00:00, 2.32it/s]`
```
```
`{'total\_files': 21,
'successful\_uploads': 21,
'failed\_uploads': 0,
'errors': []}`
```
# Standalone vector search
Now that our vector store is ready, we are able to query the Vector Store directly and retrieve relevant content for a specific query. Using the new [vector search API](https://platform.openai.com/docs/api-reference/vector-stores/search), we’re able to find relevant items from our knowledge base without necessarily integrating it in an LLM query.
```
`query = "What's Deep Research?"
search\_results = client.vector\_stores.search(
vector\_store\_id=vector\_store\_details['id'],
query=query
)`
```
```
`for result in search\_results.data:
print(str(len(result.content[0].text)) + ' of character of content from ' + result.filename + ' with a relevant score of ' + str(result.score))`
```
```
`3502 of character of content from Introducing deep research \_ OpenAI.pdf with a relevant score of 0.9813588865322393
3493 of character of content from Introducing deep research \_ OpenAI.pdf with a relevant score of 0.9522476825143714
3634 of character of content from Introducing deep research \_ OpenAI.pdf with a relevant score of 0.9397930296526796
2774 of character of content from Introducing deep research \_ OpenAI.pdf with a relevant score of 0.9101975747303771
3474 of character of content from Deep research System Card \_ OpenAI.pdf with a relevant score of 0.9036647613464299
3123 of character of content from Introducing deep research \_ OpenAI.pdf with a relevant score of 0.887120981288272
3343 of character of content from Introducing deep research \_ OpenAI.pdf with a relevant score of 0.8448454849432881
3262 of character of content from Introducing deep research \_ OpenAI.pdf with a relevant score of 0.791345286655509
3271 of character of content from Introducing deep research \_ OpenAI.pdf with a relevant score of 0.7485530025091963
2721 of character of content from Introducing deep research \_ OpenAI.pdf with a relevant score of 0.734033360849088`
```
We can see that different size (and under-the-hood different texts) have been returned from the search query. They all have different relevancy score that are calculated by our ranker which uses hybrid search.
# Integrating search results with LLM in a single API call
However instead of querying the vector store and then passing the data into the Responses or Chat Completion API call, an even more convenient way to use this search results in an LLM query would be to plug use file\_search tool as part of OpenAI Responses API.
```
`query = "What's Deep Research?"
response = client.responses.create(
input= query,
model="gpt-4o-mini",
tools=[{
"type": "file\_search",
"vector\_store\_ids": [vector\_store\_details['id']],
}]
)
# Extract annotations from the response
annotations = response.output[1].content[0].annotations
# Get top-k retrieved filenames
retrieved\_files = set([result.filename for result in annotations])
print(f'Files used: {retrieved\_files}')
print('Response:')
print(response.output[1].content[0].text) # 0 being the filesearch call`
```
```
`Files used: {'Introducing deep research \_ OpenAI.pdf'}
Response:
Deep Research is a new capability introduced by OpenAI that allows users to conduct complex, multi-step research tasks on the internet efficiently. Key features include:
1. \*\*Autonomous Research\*\*: Deep Research acts as an independent agent that synthesizes vast amounts of information across the web, enabling users to receive comprehensive reports similar to those produced by a research analyst.
2. \*\*Multi-Step Reasoning\*\*: It performs deep analysis by finding, interpreting, and synthesizing data from various sources, including text, images, and PDFs.
3. \*\*Application Areas\*\*: Especially useful for professionals in fields such as finance, science, policy, and engineering, as well as for consumers seeking detailed information for purchases.
4. \*\*Efficiency\*\*: The output is fully documented with citations, making it easy to verify information, and it significantly speeds up research processes that would otherwise take hours for a human to complete.
5. \*\*Limitations\*\*: While Deep Research enhances research capabilities, it is still subject to limitations, such as potential inaccuracies in information retrieval and challenges in distinguishing authoritative data from unreliable sources.
Overall, Deep Research marks a significant advancement toward automated general intelligence (AGI) by improving access to thorough and precise research outputs.`
```
We can see that `gpt-4o-mini` was able to answer a query that required more recent, specialised knowledge about OpenAI’s Deep Research. It used content from the file `Introducing deep research \_ OpenAI.pdf` that had chunks of texts that were the most relevant. If we want to go even deeper in the analysis of chunk of text retrieved, we can also analyse the different texts that were returned by the search engine by adding `include=["output[\*].file\_search\_call.search\_results"]` to our query.
# Evaluating performance
What is key for those information retrieval system is to also measure the relevance & quality of files retrieved for those answers. The following steps of this cookbook will consist in generating an evaluation dataset and calculating different metrics over this generated dataset. This is an imperfect approach and we’ll always recommend to have a human-verified evaluation dataset for your own use-cases, but it will show you the methodology to evaluate those. It will be imperfect because some of the questions generated might be generic (e.g: What’s said by the main stakeholder in this document) and our retrieval test will have a hard time to figure out which document that question was generated for.
## Generating evaluations
We will create functions that will read through the PDFs we have locally and generate a question that can only be answered by this document. Therefore it’ll create our evaluation dataset that we can use after.
```
`def extract\_text\_from\_pdf(pdf\_path):
text = ""
try:
with open(pdf\_path, "rb") as f:
reader = PyPDF2.PdfReader(f)
for page in reader.pages:
page\_text = page.extract\_text()
if page\_text:
text += page\_text
except Exception as e:
print(f"Error reading {pdf\_path}: {e}")
return text
def generate\_questions(pdf\_path):
text = extract\_text\_from\_pdf(pdf\_path)
prompt = (
"Can you generate a question that can only be answered from this document?:\\n"
f"{text}\\n\\n"
)
response = client.responses.create(
input=prompt,
model="gpt-4o",
)
question = response.output[0].content[0].text
return question`
```
If we run the function generate\_question for the first PDF file we will be able to see the kind of question it generates.
```
`generate\_questions(pdf\_files[0])`
```
```
`'What new capabilities will ChatGPT have as a result of the partnership between OpenAI and Schibsted Media Group?'`
```
We can now generate all the questions for all the PDFs we’ve got stored locally.
```
`# Generate questions for each PDF and store in a dictionary
questions\_dict = {}
for pdf\_path in pdf\_files:
questions = generate\_questions(pdf\_path)
questions\_dict[os.path.basename(pdf\_path)] = questions`
```
```
`questions\_dict`
```
```
`{'OpenAI partners with Schibsted Media Group \_ OpenAI.pdf': 'What is the purpose of the partnership between Schibsted Media Group and OpenAI announced on February 10, 2025?',
'OpenAI and the CSU system bring AI to 500,000 students & faculty \_ OpenAI.pdf': 'What significant milestone did the California State University system achieve by partnering with OpenAI, making it the first of its kind in the United States?',
'1,000 Scientist AI Jam Session \_ OpenAI.pdf': 'What was the specific AI model used during the "1,000 Scientist AI Jam Session" event across the nine national labs?',
'Announcing The Stargate Project \_ OpenAI.pdf': 'What are the initial equity funders and lead partners in The Stargate Project announced by OpenAI, and who holds the financial and operational responsibilities?',
'Introducing Operator \_ OpenAI.pdf': 'What is the name of the new model that powers the Operator agent introduced by OpenAI?',
'Introducing NextGenAI \_ OpenAI.pdf': 'What major initiative did OpenAI launch on March 4, 2025, and which research institution from Europe is involved as a founding partner?',
'Introducing the Intelligence Age \_ OpenAI.pdf': "What is the name of the video generation tool used by OpenAI's creative team to help produce their Super Bowl ad?",
'Operator System Card \_ OpenAI.pdf': 'What is the preparedness score for the "Cybersecurity" category according to the Operator System Card?',
'Strengthening America’s AI leadership with the U.S. National Laboratories \_ OpenAI.pdf': "What is the purpose of OpenAI's agreement with the U.S. National Laboratories as described in the document?",
'OpenAI GPT-4.5 System Card \_ OpenAI.pdf': 'What is the Preparedness Framework rating for "Cybersecurity" for GPT-4.5 according to the system card?',
'Partnering with Axios expands OpenAI’s work with the news industry \_ OpenAI.pdf': "What is the goal of OpenAI's new content partnership with Axios as announced in the document?",
'OpenAI and Guardian Media Group launch content partnership \_ OpenAI.pdf': 'What is the main purpose of the partnership between OpenAI and Guardian Media Group announced on February 14, 2025?',
'Introducing GPT-4.5 \_ OpenAI.pdf': 'What is the release date of the GPT-4.5 research preview?',
'Introducing data residency in Europe \_ OpenAI.pdf': 'What are the benefits of data residency in Europe for new ChatGPT Enterprise and Edu customers according to the document?',
'The power of personalized AI \_ OpenAI.pdf': 'What is the purpose of the "Model Spec" document published by OpenAI for ChatGPT?',
'Disrupting malicious uses of AI \_ OpenAI.pdf': "What is OpenAI's mission as stated in the document?",
'Sharing the latest Model Spec \_ OpenAI.pdf': 'What is the release date of the latest Model Spec mentioned in the document?',
'Deep research System Card \_ OpenAI.pdf': "What specific publication date is mentioned in the Deep Research System Card for when the report on deep research's preparedness was released?",
'Bertelsmann powers creativity and productivity with OpenAI \_ OpenAI.pdf': 'What specific AI-powered solutions is Bertelsmann planning to implement for its divisions RTL Deutschland and Penguin Random House according to the document?',
'OpenAI’s Economic Blueprint \_ OpenAI.pdf': 'What date and location is scheduled for the kickoff event of OpenAI\\'s "Innovating for America" initiative as mentioned in the Economic Blueprint document?',
'Introducing deep research \_ OpenAI.pdf': 'What specific model powers the "deep research" capability in ChatGPT that is discussed in this document, and what are its main features designed for?'}`
```
We now have a dictionary of `filename:question` that we can loop through and ask gpt-4o(-mini) about without providing the document, and gpt-4o should be able to find the relevant document in the Vector Store.
## Evaluating
We’ll convert our dictionary into a dataframe and process it using gpt-4o-mini. We will look out for the expected file
```
`rows = []
for filename, query in questions\_dict.items():
rows.append({"query": query, "\_id": filename.replace(".pdf", "")})
# Metrics evaluation parameters
k = 5
total\_queries = len(rows)
correct\_retrievals\_at\_k = 0
reciprocal\_ranks = []
average\_precisions = []
def process\_query(row):
query = row['query']
expected\_filename = row['\_id'] + '.pdf'
# Call file\_search via Responses API
response = client.responses.create(
input=query,
model="gpt-4o-mini",
tools=[{
"type": "file\_search",
"vector\_store\_ids": [vector\_store\_details['id']],
"max\_num\_results": k,
}],
tool\_choice="required" # it will force the file\_search, while not necessary, it's better to enforce it as this is what we're testing
)
# Extract annotations from the response
annotations = None
if hasattr(response.output[1], 'content') and response.output[1].content:
annotations = response.output[1].content[0].annotations
elif hasattr(response.output[1], 'annotations'):
annotations = response.output[1].annotations
if annotations is None:
print(f"No annotations for query: {query}")
return False, 0, 0
# Get top-k retrieved filenames
retrieved\_files = [result.filename for result in annotations[:k]]
if expected\_filename in retrieved\_files:
rank = retrieved\_files.index(expected\_filename) + 1
rr = 1 / rank
correct = True
else:
rr = 0
correct = False
# Calculate Average Precision
precisions = []
num\_relevant = 0
for i, fname in enumerate(retrieved\_files):
if fname == expected\_filename:
num\_relevant += 1
precisions.append(num\_relevant / (i + 1))
avg\_precision = sum(precisions) / len(precisions) if precisions else 0
if expected\_filename not in retrieved\_files:
print("Expected file NOT found in the retrieved files!")
if retrieved\_files and retrieved\_files[0] != expected\_filename:
print(f"Query: {query}")
print(f"Expected file: {expected\_filename}")
print(f"First retrieved file: {retrieved\_files[0]}")
print(f"Retrieved files: {retrieved\_files}")
print("-" \* 50)
return correct, rr, avg\_precision`
```
```
`process\_query(rows[0])`
```
```
`(True, 1.0, 1.0)`
```
Recall & Precision are at 1 for this example, and our file ranked first so we’re having a MRR and MAP = 1 on this example.
We can now execute this processing on our set of questions.
```
`with ThreadPoolExecutor() as executor:
results = list(tqdm(executor.map(process\_query, rows), total=total\_queries))
correct\_retrievals\_at\_k = 0
reciprocal\_ranks = []
average\_precisions = []
for correct, rr, avg\_precision in results:
if correct:
correct\_retrievals\_at\_k += 1
reciprocal\_ranks.append(rr)
average\_precisions.append(avg\_precision)
recall\_at\_k = correct\_retrievals\_at\_k / total\_queries
precision\_at\_k = recall\_at\_k # In this context, same as recall
mrr = sum(reciprocal\_ranks) / total\_queries
map\_score = sum(average\_precisions) / total\_queries`
```
```
` 62%|███████████████████▏ | 13/21 [00:07\<00:03, 2.57it/s]`
```
```
`Expected file NOT found in the retrieved files!
Query: What is OpenAI's mission as stated in the document?
Expected file: Disrupting malicious uses of AI \_ OpenAI.pdf
First retrieved file: Introducing the Intelligence Age \_ OpenAI.pdf
Retrieved files: ['Introducing the Intelligence Age \_ OpenAI.pdf']
--------------------------------------------------`
```
```
` 71%|██████████████████████▏ | 15/21 [00:14\<00:06, 1.04s/it]`
```
```
`Expected file NOT found in the retrieved files!
Query: What is the purpose of the "Model Spec" document published by OpenAI for ChatGPT?
Expected file: The power of personalized AI \_ OpenAI.pdf
First retrieved file: Sharing the latest Model Spec \_ OpenAI.pdf
Retrieved files: ['Sharing the latest Model Spec \_ OpenAI.pdf', 'Sharing the latest Model Spec \_ OpenAI.pdf', 'Sharing the latest Model Spec \_ OpenAI.pdf', 'Sharing the latest Model Spec \_ OpenAI.pdf', 'Sharing the latest Model Spec \_ OpenAI.pdf']
--------------------------------------------------`
```
```
`100%|███████████████████████████████| 21/21 [00:15\<00:00, 1.38it/s]`
```
The outputs logged above would either show that a file wasn’t ranked first when our evaluation dataset expected it to rank first or that it wasn’t found at all. As we can see from our imperfect evaluation dataset, some questions were generic and expected another doc, which our retrieval system didn’t specifically retrieved for this question.
```
`# Print the metrics with k
print(f"Metrics at k={k}:")
print(f"Recall@{k}: {recall\_at\_k:.4f}")
print(f"Precision@{k}: {precision\_at\_k:.4f}")
print(f"Mean Reciprocal Rank (MRR): {mrr:.4f}")
print(f"Mean Average Precision (MAP): {map\_score:.4f}")`
```
```
`Metrics at k=5:
Recall@5: 0.9048
Precision@5: 0.9048
Mean Reciprocal Rank (MRR): 0.9048
Mean Average Precision (MAP): 0.8954`
```
With this cookbook we were able to see how to:
* Generate a dataset of evaluations using PDF context-stuffing (leveraging vision modality of 4o) and traditional PDF readers
* Create a vector store and populate it with PDF
* Get an LLM answer to a query, leveraging a RAG system available out-of-the-box with `file\_search` tool call in OpenAI’s Response API
* Understand how chunks of texts are retrieved, ranked and used as part of the Response API
* Measure accuracy, precision, retrieval, MRR and MAP on the dataset of evaluations previously generated
By using file search with Responses, you can simplify RAG architecture and leverage this in a single API call using the new Responses API. File storage, embeddings, retrieval all integrated in one tool!