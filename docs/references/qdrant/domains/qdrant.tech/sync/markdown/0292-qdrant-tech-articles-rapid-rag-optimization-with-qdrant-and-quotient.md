Optimizing RAG Through an Evaluation-Based Methodology - Qdrant
* [Qdrant Articles](https://qdrant.tech/articles/)
*
* Optimizing RAG Through an Evaluation-Based Methodology
[
Back to
RAG & GenAI](https://qdrant.tech/articles/rag-and-genai/)# Optimizing RAG Through an Evaluation-Based Methodology
Atita Arora
&#183;
June 12, 2024
In today&rsquo;s fast-paced, information-rich world, AI is revolutionizing knowledge management. The systematic process of capturing, distributing, and effectively using knowledge within an organization is one of the fields in which AI provides exceptional value today.
> The potential for AI-powered knowledge management increases when leveraging
[> Retrieval Augmented Generation (RAG)
](https://qdrant.tech/rag/rag-evaluation-guide/)> , a methodology that enables LLMs to access a vast, diverse repository of factual information from knowledge stores, such as vector databases.
This process enhances the accuracy, relevance, and reliability of generated text, thereby mitigating the risk of faulty, incorrect, or nonsensical results sometimes associated with traditional LLMs. This method not only ensures that the answers are contextually relevant but also up-to-date, reflecting the latest insights and data available.
While RAG enhances the accuracy, relevance, and reliability of traditional LLM solutions, **an evaluation strategy can further help teams ensure their AI products meet these benchmarks of success.**
## Relevant tools for this experiment
In this article, we’ll break down a RAG Optimization workflow experiment that demonstrates that evaluation is essential to build a successful RAG strategy. We will use Qdrant and Quotient for this experiment.
[Qdrant](https://qdrant.tech/) is a vector database and vector similarity search engine designed for efficient storage and retrieval of high-dimensional vectors. Because Qdrant offers efficient indexing and searching capabilities, it is ideal for implementing RAG solutions, where quickly and accurately retrieving relevant information from extremely large datasets is crucial. Qdrant also offers a wealth of additional features, such as quantization, multivector support and multi-tenancy.
Alongside Qdrant we will use Quotient, which provides a seamless way to evaluate your RAG implementation, accelerating and improving the experimentation process.
[Quotient](https://www.quotientai.co/) is a platform that provides tooling for AI developers to build [evaluation frameworks](https://qdrant.tech/rag/rag-evaluation-guide/) and conduct experiments on their products. Evaluation is how teams surface the shortcomings of their applications and improve performance in key benchmarks such as faithfulness, and semantic similarity. Iteration is key to building innovative AI products that will deliver value to end users.
> 💡 The
[> accompanying notebook
](https://github.com/qdrant/qdrant-rag-eval/tree/master/workshop-rag-eval-qdrant-quotient)> for this exercise can be found on GitHub for future reference.
## Summary of key findings
1. **Irrelevance and Hallucinations**: When the documents retrieved are irrelevant, evidenced by low scores in both Chunk Relevance and Context Relevance, the model is prone to generating inaccurate or fabricated information.
2. **Optimizing Document Retrieval**: By retrieving a greater number of documents and reducing the chunk size, we observed improved outcomes in the model&rsquo;s performance.
3. **Adaptive Retrieval Needs**: Certain queries may benefit from accessing more documents. Implementing a dynamic retrieval strategy that adjusts based on the query could enhance accuracy.
4. **Influence of Model and Prompt Variations**: Alterations in language models or the prompts used can significantly impact the quality of the generated responses, suggesting that fine-tuning these elements could optimize performance.
Let us walk you through how we arrived at these findings!
## Building a RAG pipeline
To evaluate a RAG pipeline, we will have to build a RAG Pipeline first. In the interest of simplicity, we are building a Naive RAG in this article. There are certainly other versions of RAG :
The illustration below depicts how we can leverage a [RAG Evaluation framework](https://qdrant.tech/rag/rag-evaluation-guide/) to assess the quality of RAG Application.
We are going to build a RAG application using Qdrant’s Documentation and the premeditated [hugging face dataset](https://huggingface.co/datasets/atitaarora/qdrant_doc).
We will then assess our RAG application’s ability to answer questions about Qdrant.
To prepare our knowledge store we will use Qdrant, which can be leveraged in 3 different ways as below :
```
`client = qdrant\_client.QdrantClient(
os.environ.get("QDRANT\_URL"),
api\_key=os.environ.get("QDRANT\_API\_KEY"),
)
`
```
We will be using [Qdrant Cloud](https://cloud.qdrant.io/login) so it is a good idea to provide the `QDRANT\_URL` and `QDRANT\_API\_KEY` as environment variables for easier access.
Moving on, we will need to define the collection name as :
```
`COLLECTION\_NAME = "qdrant-docs-quotient"
`
```
In this case , we may need to create different collections based on the experiments we conduct.
To help us provide seamless embedding creations throughout the experiment, we will use Qdrant’s own embeddings library [Fastembed](https://qdrant.github.io/fastembed/) which supports [many different models](https://qdrant.github.io/fastembed/examples/Supported_Models/) including dense as well as sparse vector models.
Before implementing RAG, we need to prepare and index our data in Qdrant.
This involves converting textual data into vectors using a suitable encoder (e.g., sentence transformers), and storing these vectors in Qdrant for retrieval.
```
`from langchain.text\_splitter import RecursiveCharacterTextSplitter
from langchain.docstore.document import Document as LangchainDocument
## Load the dataset with qdrant documentation
dataset = load\_dataset("atitaarora/qdrant\_doc", split="train")
## Dataset to langchain document
langchain\_docs = [
LangchainDocument(page\_content=doc["text"], metadata={"source": doc["source"]})
for doc in dataset
]
len(langchain\_docs)
#Outputs
#240
`
```
You can preview documents in the dataset as below :
```
`## Here's an example of what a document in our dataset looks like
print(dataset[100]['text'])
`
```
## Evaluation dataset
To measure the quality of our RAG setup, we will need a representative evaluation dataset. This dataset should contain realistic questions and the expected answers.
Additionally, including the expected contexts for which your RAG pipeline is designed to retrieve information would be beneficial.
We will be using a [prebuilt evaluation dataset](https://huggingface.co/datasets/atitaarora/qdrant_doc_qna).
If you are struggling to make an evaluation dataset for your use case , you can use your documents and some techniques described in this [notebook](https://github.com/qdrant/qdrant-rag-eval/blob/master/synthetic_qna/notebook/Synthetic_question_generation.ipynb)
### Building the RAG pipeline
We establish the data preprocessing parameters essential for the RAG pipeline and configure the Qdrant vector database according to the specified criteria.
Key parameters under consideration are:
* **Chunk size**
* **Chunk overlap**
* **Embedding model**
* **Number of documents retrieved (retrieval window)**
Following the ingestion of data in Qdrant, we proceed to retrieve pertinent documents corresponding to each query. These documents are then seamlessly integrated into our evaluation dataset, enriching the contextual information within the designated **`context`** column to fulfil the evaluation aspect.
Next we define methods to take care of logistics with respect to adding documents to Qdrant
```
`import uuid
from qdrant\_client import models
def add\_documents(client, collection\_name, chunk\_size, chunk\_overlap, embedding\_model\_name):
"""
This function adds documents to the desired Qdrant collection given the specified RAG parameters.
"""
## Processing each document with desired TEXT\_SPLITTER\_ALGO, CHUNK\_SIZE, CHUNK\_OVERLAP
text\_splitter = RecursiveCharacterTextSplitter(
chunk\_size=chunk\_size,
chunk\_overlap=chunk\_overlap,
add\_start\_index=True,
separators=["\\n\\n", "\\n", ".", " ", ""],
)
docs\_processed = []
for doc in langchain\_docs:
docs\_processed += text\_splitter.split\_documents([doc])
## Processing documents to be encoded by Fastembed
docs\_contents = []
docs\_metadatas = []
for doc in docs\_processed:
if hasattr(doc, 'page\_content') and hasattr(doc, 'metadata'):
docs\_contents.append(doc.page\_content)
docs\_metadatas.append(doc.metadata)
else:
# Handle the case where attributes are missing
print("Warning: Some documents do not have 'page\_content' or 'metadata' attributes.")
print("processed: ", len(docs\_processed))
print("content: ", len(docs\_contents))
print("metadata: ", len(docs\_metadatas))
if not client.collection\_exists(collection\_name):
client.create\_collection(
collection\_name=collection\_name,
vectors\_config=models.VectorParams(size=384, distance=models.Distance.COSINE),
)
client.upsert(
collection\_name=collection\_name,
points=[
models.PointStruct(
id=uuid.uuid4().hex,
vector=models.Document(text=content, model=embedding\_model\_name),
payload={"metadata": metadata, "document": content},
)
for metadata, content in zip(docs\_metadatas, docs\_contents)
],
)
`
```
and retrieving documents from Qdrant during our RAG Pipeline assessment.
```
`def get\_documents(collection\_name, query, num\_documents=3):
"""
This function retrieves the desired number of documents from the Qdrant collection given a query.
It returns a list of the retrieved documents.
"""
search\_results = client.query\_points(
collection\_name=collection\_name,
query=models.Document(text=query, model=embedding\_model\_name),
limit=num\_documents,
).points
results = [r.payload["document"] for r in search\_results]
return results
`
```
### Setting up Quotient
You will need an account log in, which you can get by requesting access on [Quotient&rsquo;s website](https://www.quotientai.co/). Once you have an account, you can create an API key by running the `quotient authenticate` CLI command.
💡 Be sure to save your API key, since it will only be displayed once (Note: you will not have to repeat this step again until your API key expires).
**Once you have your API key, make sure to set it as an environment variable called `QUOTIENT\_API\_KEY`**
```
`# Import QuotientAI client and connect to QuotientAI
from quotientai.client import QuotientClient
from quotientai.utils import show\_job\_progress
# IMPORTANT: be sure to set your API key as an environment variable called QUOTIENT\_API\_KEY
# You will need this set before running the code below. You may also uncomment the following line and insert your API key:
# os.environ['QUOTIENT\_API\_KEY'] = "YOUR\_API\_KEY"
quotient = QuotientClient()
`
```
**QuotientAI** provides a seamless way to integrate *RAG evaluation* into your applications. Here, we&rsquo;ll see how to use it to evaluate text generated from an LLM, based on retrieved knowledge from the Qdrant vector database.
After retrieving the top similar documents and populating the `context` column, we can submit the evaluation dataset to Quotient and execute an evaluation job. To run a job, all you need is your evaluation dataset and a `recipe`.
***A recipe is a combination of a prompt template and a specified LLM.***
**Quotient** orchestrates the evaluation run and handles version control and asset management throughout the experimentation process.
***Prior to assessing our RAG solution, it&rsquo;s crucial to outline our optimization goals.***
In the context of *question-answering on Qdrant documentation*, our focus extends beyond merely providing helpful responses. Ensuring the absence of any *inaccurate or misleading information* is paramount.
In other words, **we want to minimize hallucinations** in the LLM outputs.
For our evaluation, we will be considering the following metrics, with a focus on **Faithfulness**:
* **Context Relevance**
* **Chunk Relevance**
* **Faithfulness**
* **ROUGE-L**
* **BERT Sentence Similarity**
* **BERTScore**### Evaluation in action
The function below takes an evaluation dataset as input, which in this case contains questions and their corresponding answers. It retrieves relevant documents based on the questions in the dataset and populates the context field with this information from Qdrant. The prepared dataset is then submitted to QuotientAI for evaluation for the chosen metrics. After the evaluation is complete, the function displays aggregated statistics on the evaluation metrics followed by the summarized evaluation results.
```
`def run\_eval(eval\_df, collection\_name, recipe\_id, num\_docs=3, path="eval\_dataset\_qdrant\_questions.csv"):
"""
This function evaluates the performance of a complete RAG pipeline on a given evaluation dataset.
Given an evaluation dataset (containing questions and ground truth answers),
this function retrieves relevant documents, populates the context field, and submits the dataset to QuotientAI for evaluation.
Once the evaluation is complete, aggregated statistics on the evaluation metrics are displayed.
The evaluation results are returned as a pandas dataframe.
"""
# Add context to each question by retrieving relevant documents
eval\_df['documents'] = eval\_df.apply(lambda x: get\_documents(collection\_name=collection\_name,
query=x['input\_text'],
num\_documents=num\_docs), axis=1)
eval\_df['context'] = eval\_df.apply(lambda x: "\\n".join(x['documents']), axis=1)
# Now we'll save the eval\_df to a CSV
eval\_df.to\_csv(path, index=False)
# Upload the eval dataset to QuotientAI
dataset = quotient.create\_dataset(
file\_path=path,
name="qdrant-questions-eval-v1",
)
# Create a new task for the dataset
task = quotient.create\_task(
dataset\_id=dataset['id'],
name='qdrant-questions-qa-v1',
task\_type='question\_answering'
)
# Run a job to evaluate the model
job = quotient.create\_job(
task\_id=task['id'],
recipe\_id=recipe\_id,
num\_fewshot\_examples=0,
limit=500,
metric\_ids=[5, 7, 8, 11, 12, 13, 50],
)
# Show the progress of the job
show\_job\_progress(quotient, job['id'])
# Once the job is complete, we can get our results
data = quotient.get\_eval\_results(job\_id=job['id'])
# Add the results to a pandas dataframe to get statistics on performance
df = pd.json\_normalize(data, "results")
df\_stats = df[df.columns[df.columns.str.contains("metric|completion\_time")]]
df.columns = df.columns.str.replace("metric.", "")
df\_stats.columns = df\_stats.columns.str.replace("metric.", "")
metrics = {
'completion\_time\_ms':'Completion Time (ms)',
'chunk\_relevance': 'Chunk Relevance',
'selfcheckgpt\_nli\_relevance':"Context Relevance",
'selfcheckgpt\_nli':"Faithfulness",
'rougeL\_fmeasure':"ROUGE-L",
'bert\_score\_f1':"BERTScore",
'bert\_sentence\_similarity': "BERT Sentence Similarity",
'completion\_verbosity':"Completion Verbosity",
'verbosity\_ratio':"Verbosity Ratio",}
df = df.rename(columns=metrics)
df\_stats = df\_stats.rename(columns=metrics)
display(df\_stats[metrics.values()].describe())
return df
main\_metrics = [
'Context Relevance',
'Chunk Relevance',
'Faithfulness',
'ROUGE-L',
'BERT Sentence Similarity',
'BERTScore',
]
`
```
## Experimentation
Our approach is rooted in the belief that improvement thrives in an environment of exploration and discovery. By systematically testing and tweaking various components of the RAG pipeline, we aim to incrementally enhance its capabilities and performance.
In the following section, we dive into the details of our experimentation process, outlining the specific experiments conducted and the insights gained.
### Experiment 1 - Baseline
Parameters
* **Embedding Model: `bge-small-en`**
* **Chunk size: `512`**
* **Chunk overlap: `64`**
* **Number of docs retrieved (Retireval Window): `3`**
* **LLM: `Mistral-7B-Instruct`**
We’ll process our documents based on configuration above and ingest them into Qdrant using `add\_documents` method introduced earlier
```
`#experiment1 - base config
chunk\_size = 512
chunk\_overlap = 64
embedding\_model\_name = "BAAI/bge-small-en"
num\_docs = 3
COLLECTION\_NAME = f"experiment\_{chunk\_size}\_{chunk\_overlap}\_{embedding\_model\_name.split('/')[1]}"
add\_documents(client,
collection\_name=COLLECTION\_NAME,
chunk\_size=chunk\_size,
chunk\_overlap=chunk\_overlap,
embedding\_model\_name=embedding\_model\_name)
#Outputs
#processed: 4504
#content: 4504
#metadata: 4504
`
```
Notice the `COLLECTION\_NAME` which helps us segregate and identify our collections based on the experiments conducted.
To proceed with the evaluation, let’s create the `evaluation recipe` up next
```
`# Create a recipe for the generator model and prompt template
recipe\_mistral = quotient.create\_recipe(
model\_id=10,
prompt\_template\_id=1,
name='mistral-7b-instruct-qa-with-rag',
description='Mistral-7b-instruct using a prompt template that includes context.'
)
recipe\_mistral
#Outputs recipe JSON with the used prompt template
#'prompt\_template': {'id': 1,
# 'name': 'Default Question Answering Template',
# 'variables': '["input\_text","context"]',
# 'created\_at': '2023-12-21T22:01:54.632367',
# 'template\_string': 'Question: {input\_text}\\\\n\\\\nContext: {context}\\\\n\\\\nAnswer:',
# 'owner\_profile\_id': None}
`
```
To get a list of your existing recipes, you can simply run:
```
`quotient.list\_recipes()
`
```
Notice the recipe template is a simplest prompt using `Question` from evaluation template `Context` from document chunks retrieved from Qdrant and `Answer` generated by the pipeline.
To kick off the evaluation
```
`# Kick off an evaluation job
experiment\_1 = run\_eval(eval\_df,
collection\_name=COLLECTION\_NAME,
recipe\_id=recipe\_mistral['id'],
num\_docs=num\_docs,
path=f"{COLLECTION\_NAME}\_{num\_docs}\_mistral.csv")
`
```
This may take few minutes (depending on the size of evaluation dataset!)
We can look at the results from our first (baseline) experiment as below :
Notice that we have a pretty **low average Chunk Relevance** and **very large standard deviations for both Chunk Relevance and Context Relevance**.
Let&rsquo;s take a look at some of the lower performing datapoints with **poor Faithfulness**:
```
`with pd.option\_context('display.max\_colwidth', 0):
display(experiment\_1[['content.input\_text', 'content.answer','content.documents','Chunk Relevance','Context Relevance','Faithfulness']
].sort\_values(by='Faithfulness').head(2))
`
```
In instances where the retrieved documents are **irrelevant (where both Chunk Relevance and Context Relevance are low)**, the model also shows **tendencies to hallucinate** and **produce poor quality responses**.
The quality of the retrieved text directly impacts the quality of the LLM-generated answer. Therefore, our focus will be on enhancing the RAG setup by **adjusting the chunking parameters**.
### Experiment 2 - Adjusting the chunk parameter
Keeping all other parameters constant, we changed the `chunk size` and `chunk overlap` to see if we can improve our results.
Parameters :
* **Embedding Model : `bge-small-en`**
* **Chunk size: `1024`**
* **Chunk overlap: `128`**
* **Number of docs retrieved (Retireval Window): `3`**
* **LLM: `Mistral-7B-Instruct`**
We will reprocess the data with the updated parameters above:
```
`## for iteration 2 - lets modify chunk configuration
## We will start with creating separate collection to store vectors
chunk\_size = 1024
chunk\_overlap = 128
embedding\_model\_name = "BAAI/bge-small-en"
num\_docs = 3
COLLECTION\_NAME = f"experiment\_{chunk\_size}\_{chunk\_overlap}\_{embedding\_model\_name.split('/')[1]}"
add\_documents(client,
collection\_name=COLLECTION\_NAME,
chunk\_size=chunk\_size,
chunk\_overlap=chunk\_overlap,
embedding\_model\_name=embedding\_model\_name)
#Outputs
#processed: 2152
#content: 2152
#metadata: 2152
`
```
Followed by running evaluation :
and **comparing it with the results from Experiment 1:**
We observed slight enhancements in our LLM completion metrics (including BERT Sentence Similarity, BERTScore, ROUGE-L, and Knowledge F1) with the increase in *chunk size*. However, it&rsquo;s noteworthy that there was a significant decrease in *Faithfulness*, which is the primary metric we are aiming to optimize.
Moreover, *Context Relevance* demonstrated an increase, indicating that the RAG pipeline retrieved more relevant information required to address the query. Nonetheless, there was a considerable drop in *Chunk Relevance*, implying that a smaller portion of the retrieved documents contained pertinent information for answering the question.
**The correlation between the rise in Context Relevance and the decline in Chunk Relevance suggests that retrieving more documents using the smaller chunk size might yield improved results.**
### Experiment 3 - Increasing the number of documents retrieved (retrieval window)
This time, we are using the same RAG setup as `Experiment 1`, but increasing the number of retrieved documents from **3** to **5**.
Parameters :
* **Embedding Model : `bge-small-en`**
* **Chunk size: `512`**
* **Chunk overlap: `64`**
* **Number of docs retrieved (Retrieval Window): `5`**
* **LLM: : `Mistral-7B-Instruct`**
We can use the collection from Experiment 1 and run evaluation with modified `num\_docs` parameter as :
```
`#collection name from Experiment 1
COLLECTION\_NAME = f"experiment\_{chunk\_size}\_{chunk\_overlap}\_{embedding\_model\_name.split('/')[1]}"
#running eval for experiment 3
experiment\_3 = run\_eval(eval\_df,
collection\_name=COLLECTION\_NAME,
recipe\_id=recipe\_mistral['id'],
num\_docs=num\_docs,
path=f"{COLLECTION\_NAME}\_{num\_docs}\_mistral.csv")
`
```
Observe the results as below :
Comparing the results with Experiment 1 and 2 :
As anticipated, employing the smaller chunk size while retrieving a larger number of documents resulted in achieving the highest levels of both *Context Relevance* and *Chunk Relevance.* Additionally, it yielded the **best** (albeit marginal) *Faithfulness* score, indicating a *reduced occurrence of inaccuracies or hallucinations*.
Looks like we have achieved a good hold on our chunking parameters but it is worth testing another embedding model to see if we can get better results.
### Experiment 4 - Changing the embedding model
Let us try using **MiniLM** for this experiment
\*\*\*\*Parameters :
* **Embedding Model : `MiniLM-L6-v2`**
* **Chunk size: `512`**
* **Chunk overlap: `64`**
* **Number of docs retrieved (Retrieval Window): `5`**
* **LLM: : `Mistral-7B-Instruct`**
We will have to create another collection for this experiment :
```
`#experiment-4
chunk\_size=512
chunk\_overlap=64
embedding\_model\_name="sentence-transformers/all-MiniLM-L6-v2"
num\_docs=5
COLLECTION\_NAME = f"experiment\_{chunk\_size}\_{chunk\_overlap}\_{embedding\_model\_name.split('/')[1]}"
add\_documents(client,
collection\_name=COLLECTION\_NAME,
chunk\_size=chunk\_size,
chunk\_overlap=chunk\_overlap,
embedding\_model\_name=embedding\_model\_name)
#Outputs
#processed: 4504
#content: 4504
#metadata: 4504
`
```
We will observe our evaluations as :
Comparing these with our previous experiments :
It appears that `bge-small` was more proficient in capturing the semantic nuances of the Qdrant Documentation.
Up to this point, our experimentation has focused solely on the *retrieval aspect* of our RAG pipeline. Now, let&rsquo;s explore altering the *generation aspect* or LLM while retaining the optimal parameters identified in Experiment 3.
### Experiment 5 - Changing the LLM
Parameters :
* **Embedding Model : `bge-small-en`**
* **Chunk size: `512`**
* **Chunk overlap: `64`**
* **Number of docs retrieved (Retrieval Window): `5`**
* **LLM: : `GPT-3.5-turbo`**
For this we can repurpose our collection from Experiment 3 while the evaluations to use a new recipe with **GPT-3.5-turbo** model.
```
`#collection name from Experiment 3
COLLECTION\_NAME = f"experiment\_{chunk\_size}\_{chunk\_overlap}\_{embedding\_model\_name.split('/')[1]}"
# We have to create a recipe using the same prompt template and GPT-3.5-turbo
recipe\_gpt = quotient.create\_recipe(
model\_id=5,
prompt\_template\_id=1,
name='gpt3.5-qa-with-rag-recipe-v1',
description='GPT-3.5 using a prompt template that includes context.'
)
recipe\_gpt
#Outputs
#{'id': 495,
# 'name': 'gpt3.5-qa-with-rag-recipe-v1',
# 'description': 'GPT-3.5 using a prompt template that includes context.',
# 'model\_id': 5,
# 'prompt\_template\_id': 1,
# 'created\_at': '2024-05-03T12:14:58.779585',
# 'owner\_profile\_id': 34,
# 'system\_prompt\_id': None,
# 'prompt\_template': {'id': 1,
# 'name': 'Default Question Answering Template',
# 'variables': '["input\_text","context"]',
# 'created\_at': '2023-12-21T22:01:54.632367',
# 'template\_string': 'Question: {input\_text}\\\\n\\\\nContext: {context}\\\\n\\\\nAnswer:',
# 'owner\_profile\_id': None},
# 'model': {'id': 5,
# 'name': 'gpt-3.5-turbo',
# 'endpoint': 'https://api.openai.com/v1/chat/completions',
# 'revision': 'placeholder',
# 'created\_at': '2024-02-06T17:01:21.408454',
# 'model\_type': 'OpenAI',
# 'description': 'Returns a maximum of 4K output tokens.',
# 'owner\_profile\_id': None,
# 'external\_model\_config\_id': None,
# 'instruction\_template\_cls': 'NoneType'}}
`
```
Running the evaluations as :
```
`experiment\_5 = run\_eval(eval\_df,
collection\_name=COLLECTION\_NAME,
recipe\_id=recipe\_gpt['id'],
num\_docs=num\_docs,
path=f"{COLLECTION\_NAME}\_{num\_docs}\_gpt.csv")
`
```
We observe :
and comparing all the 5 experiments as below :
**GPT-3.5 surpassed Mistral-7B in all metrics**! Notably, Experiment 5 exhibited the **lowest occurrence of hallucination**.
## Conclusions
Let’s take a look at our results from all 5 experiments above
We still have a long way to go in improving the retrieval performance of RAG, as indicated by our generally poor results thus far. It might be beneficial to **explore alternative embedding models** or **different retrieval strategies** to address this issue.
The significant variations in *Context Relevance* suggest that **certain questions may necessitate retrieving more documents than others**. Therefore, investigating a **dynamic retrieval strategy** could be worthwhile.
Furthermore, there&rsquo;s ongoing **exploration required on the generative aspect** of RAG.
Modifying LLMs or prompts can substantially impact the overall quality of responses.
This iterative process demonstrates how, starting from scratch, continual evaluation and adjustments throughout experimentation can lead to the development of an enhanced RAG system.
## Watch this workshop on YouTube
> A workshop version of this article is
[> available on YouTube
](https://www.youtube.com/watch?v=3MEMPZR1aZA)> . Follow along using our
[> GitHub notebook
](https://github.com/qdrant/qdrant-rag-eval/tree/master/workshop-rag-eval-qdrant-quotient)> .
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/rapid-rag-optimization-with-qdrant-and-quotient.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/articles/rapid-rag-optimization-with-qdrant-and-quotient/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/rapid-rag-optimization-with-qdrant-and-quotient.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)