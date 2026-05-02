Building a Chain-of-Thought Medical Chatbot with Qdrant and DSPy
* [Documentation](https://qdrant.tech/documentation/)
*
* [Build Prototypes](https://qdrant.tech/documentation/examples/)
*
* Building a Chain-of-Thought Medical Chatbot with Qdrant and DSPy# Building a Chain-of-Thought Medical Chatbot with Qdrant and DSPy
Accessing medical information from LLMs can lead to hallucinations or outdated information. Relying on this type of information can result in serious medical consequences. Building a trustworthy and context-aware medical chatbot can solve this.
In this article, we will look at how to tackle these challenges using:
* **Retrieval-Augmented Generation (RAG)**: Instead of answering the questions from scratch, the bot retrieves the information from medical literature before answering questions.
* **Filtering**: Users can filter the results by specialty and publication year, ensuring the information is accurate and up-to-date.
Let’s discover the technologies needed to build the medical bot.
## Tech Stack Overview
To build a robust and trustworthy medical chatbot, we will combine the following technologies:
* [**Qdrant Cloud**](https://qdrant.tech/cloud/): Qdrant is a high-performance vector search engine for storing and retrieving large collections of embeddings. In this project, we will use it to enable fast and accurate search across millions of medical documents, supporting dense and multi-vector (ColBERT) retrieval for context-aware answers.
* [**Stanford DSPy**](https://qdrant.tech/documentation/frameworks/dspy/)**:** DSPy is the AI framework we will use to obtain the final answer. It allows the medical bot to retrieve the relevant information and reason step-by-step to produce accurate and explainable answers.
## Dataset Preparation and Indexing
A medical chatbot is only as good as the knowledge it has access to. For this project, we will leverage the [MIRIAD medical dataset](https://huggingface.co/datasets/miriad/miriad-5.8M), a large-scale collection of medical passages enriched with metadata such as publication year and specialty.
### Indexing with Dense and ColBERT Multivectors
To enable high-quality retrieval, we will embed each medical passage with two models:
* **Dense Embeddings**: These are generated using the `BAAI/bge-small-en` model and capture the passages&rsquo; general semantic meaning.
* **ColBERT Multivectors**: These provide more fine-grained representations, enabling precise ranking of results.
```
`dense\_documents = [
models.Document(text=doc, model="BAAI/bge-small-en") for doc in ds["passage\_text"]
]
colbert\_documents = [
models.Document(text=doc, model="colbert-ir/colbertv2.0")
for doc in ds["passage\_text"]
]
collection\_name = "miriad"
# Create collection
if not client.collection\_exists(collection\_name):
client.create\_collection(
collection\_name=collection\_name,
vectors\_config={
"dense": models.VectorParams(size=384, distance=models.Distance.COSINE),
"colbert": models.VectorParams(
size=128,
distance=models.Distance.COSINE,
multivector\_config=models.MultiVectorConfig(
comparator=models.MultiVectorComparator.MAX\_SIM
),
hnsw\_config=models.HnswConfigDiff(m=0), # reranker: no indexing
),
},
)
`
```
We disable indexing for the ColBERT multivector since it will only be used for reranking. To learn more about this, check out the [How to Effectively Use Multivector Representations in Qdrant for Reranking](https://qdrant.tech/documentation/advanced-tutorials/using-multivector-representations/) article.
### Batch Uploading to Qdrant
To avoid hitting API limits, we upload the data in batches, each batch containing:
* The passage text
* ColBERT and dense embeddings.
* `year` and `specialty` metadata fields.
```
`BATCH\_SIZE = 3
points\_batch = []
for i in range(len(ds["passage\_text"])):
point = models.PointStruct(
id=i,
vector={"dense": dense\_documents[i], "colbert": colbert\_documents[i]},
payload={
"passage\_text": ds["passage\_text"][i],
"year": ds["year"][i],
"specialty": ds["specialty"][i],
},
)
points\_batch.append(point)
if len(points\_batch) == BATCH\_SIZE:
client.upsert(collection\_name=collection\_name, points=points\_batch)
print(f"Uploaded batch ending at index {i}")
points\_batch = []
# Final flush
if points\_batch:
client.upsert(collection\_name=collection\_name, points=points\_batch)
print("Uploaded final batch.")
`
```
## Retrieval-Augmented Generation (RAG) Pipeline
Our chatbot will use a Retrieval-Augmented Generation (RAG) pipeline to ensure its answers are grounded in medical literature.
### Integration of DSPy and Qdrant
At the heart of the application is the Qdrant vector database that provides the information sent to DSPy to generate the final answer. This is what happens when a user submits a query:
* DSPy searches against the Qdrant vector database to retrieve the top documents and answers the query. The results are also filtered with a particular year range for a specific specialty.
* The retrieved passages are then reranked using ColBERT multivector embeddings, leading to the most relevant and contextually appropriate answers.
* DSPy uses these passages to guide the language model through a chain-of-thought reasoning to generate the most accurate answer.
```
`def rerank\_with\_colbert(query\_text, min\_year, max\_year, specialty):
from fastembed import TextEmbedding, LateInteractionTextEmbedding
# Encode query once with both models
dense\_model = TextEmbedding("BAAI/bge-small-en")
colbert\_model = LateInteractionTextEmbedding("colbert-ir/colbertv2.0")
dense\_query = list(dense\_model.embed(query\_text))[0]
colbert\_query = list(colbert\_model.embed(query\_text))[0]
# Combined query: retrieve with dense,
# rerank with ColBERT
results = client.query\_points(
collection\_name=collection\_name,
prefetch=models.Prefetch(query=dense\_query, using="dense"),
query=colbert\_query,
using="colbert",
limit=5,
with\_payload=True,
query\_filter=Filter(
must=[
FieldCondition(key="specialty", match=MatchValue(value=specialty)),
FieldCondition(
key="year",
range=models.Range(gt=None, gte=min\_year, lt=None, lte=max\_year),
),
]
),
)
points = results.points
docs = []
for point in points:
docs.append(point.payload["passage\_text"])
return docs
`
```
The pipeline ensures that each response is grounded in real and recent medical literature and is aligned with the user&rsquo;s needs.
## Guardrails and Medical Question Detection
Since this is a medical chatbot, we can introduce a simple guardrail to ensure it doesn’t respond to unrelated questions like the weather. This can be implemented using a DSPy module.
The chatbot checks if every question is medical-related before attempting to answer it. This is achieved by a DSPy module that classifies each incoming query as medical or not. If the question is not medical-related, the chatbot declines to answer, reducing the risk of misinformation or inappropriate responses.
```
`class MedicalGuardrail(dspy.Module):
def forward(self, question):
prompt = (
"""
Is the following question a medical question?
Answer with 'Yes' or 'No'.n"
f"Question: {question}n"
"Answer:
"""
)
response = dspy.settings.lm(prompt)
answer = response[0].strip().lower()
return answer.startswith("yes")
if not self.guardrail.forward(question):
class DummyResult:
final\_answer = """
Sorry, I can only answer medical questions.
Please ask a question related to medicine or healthcare
"""
return DummyResult()
`
```
By combining this guardrail with specialty and year filtering, we ensure that the chatbot:
* Only answers medical questions.
* Answers questions from recent medical literature.
* Doesn’t make up answers by grounding its answers in the provided literature.
## Conclusion
By leveraging Qdrant and DSPy, you can build a medical chatbot that generates accurate and up-to-date medical responses. Qdrant provides the technology and enables fast and scalable retrieval, while DSPy synthesizes this information to provide correct answers grounded in the medical literature. As a result, you can achieve a medical system that is truthful, safe, and provides relevant responses. Check out the entire project from this [notebook](https://github.com/qdrant/examples/blob/master/DSPy-medical-bot/medical_bot_DSPy_Qdrant.ipynb). You’ll need a free [Qdrant Cloud](https://qdrant.tech/cloud/) account to run the notebook.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/examples/Qdrant-DSPy-medicalbot.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/examples/qdrant-dspy-medicalbot/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/examples/Qdrant-DSPy-medicalbot.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)