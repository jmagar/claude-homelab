Reranking with FastEmbed - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [FastEmbed](https://qdrant.tech/documentation/fastembed/)
*
* Reranking with FastEmbed# How to use rerankers with FastEmbed
## Rerankers
A reranker is a model that improves the ordering of search results. A subset of documents is initially retrieved using a fast, simple method (e.g., BM25 or dense embeddings). Then, a reranker &ndash; a more powerful, precise, but slower and heavier model &ndash; re-evaluates this subset to refine document relevance to the query.
Rerankers analyze token-level interactions between the query and each document in depth, making them expensive to use but precise in defining relevance. They trade speed for accuracy, so they are best used on a limited candidate set rather than the entire corpus.
## Goal of this Tutorial
It&rsquo;s common to use [cross-encoder](https://sbert.net/examples/applications/cross-encoder/README.html) models as rerankers. This tutorial uses [Jina Reranker v2 Base Multilingual](https://jina.ai/news/jina-reranker-v2-for-agentic-rag-ultra-fast-multilingual-function-calling-and-code-search/) (licensed under CC-BY-NC-4.0) &ndash; a cross-encoder reranker supported in FastEmbed.
We use the `all-MiniLM-L6-v2` dense embedding model (also supported in FastEmbed) as a first-stage retriever and then refine results with `Jina Reranker v2`.
## Setup
Install `qdrant-client` with `fastembed`.
```
`pip install "qdrant-client[fastembed]\>=1.14.1"
`
```
Import cross-encoders and text embeddings for the first-stage retrieval.
```
`from fastembed import TextEmbedding
from fastembed.rerank.cross\_encoder import TextCrossEncoder
`
```
You can list the cross-encoder rerankers supported in FastEmbed using the following command.
```
`TextCrossEncoder.list\_supported\_models()
`
```
This command displays the available models, including details such as output embedding dimensions, model description, model size, model sources, and model file.
Available models
```
`[{'model': 'Xenova/ms-marco-MiniLM-L-6-v2',
'size\_in\_GB': 0.08,
'sources': {'hf': 'Xenova/ms-marco-MiniLM-L-6-v2'},
'model\_file': 'onnx/model.onnx',
'description': 'MiniLM-L-6-v2 model optimized for re-ranking tasks.',
'license': 'apache-2.0'},
{'model': 'Xenova/ms-marco-MiniLM-L-12-v2',
'size\_in\_GB': 0.12,
'sources': {'hf': 'Xenova/ms-marco-MiniLM-L-12-v2'},
'model\_file': 'onnx/model.onnx',
'description': 'MiniLM-L-12-v2 model optimized for re-ranking tasks.',
'license': 'apache-2.0'},
{'model': 'BAAI/bge-reranker-base',
'size\_in\_GB': 1.04,
'sources': {'hf': 'BAAI/bge-reranker-base'},
'model\_file': 'onnx/model.onnx',
'description': 'BGE reranker base model for cross-encoder re-ranking.',
'license': 'mit'},
{'model': 'jinaai/jina-reranker-v1-tiny-en',
'size\_in\_GB': 0.13,
'sources': {'hf': 'jinaai/jina-reranker-v1-tiny-en'},
'model\_file': 'onnx/model.onnx',
'description': 'Designed for blazing-fast re-ranking with 8K context length and fewer parameters than jina-reranker-v1-turbo-en.',
'license': 'apache-2.0'},
{'model': 'jinaai/jina-reranker-v1-turbo-en',
'size\_in\_GB': 0.15,
'sources': {'hf': 'jinaai/jina-reranker-v1-turbo-en'},
'model\_file': 'onnx/model.onnx',
'description': 'Designed for blazing-fast re-ranking with 8K context length.',
'license': 'apache-2.0'},
{'model': 'jinaai/jina-reranker-v2-base-multilingual',
'size\_in\_GB': 1.11,
'sources': {'hf': 'jinaai/jina-reranker-v2-base-multilingual'},
'model\_file': 'onnx/model.onnx',
'description': 'A multi-lingual reranker model for cross-encoder re-ranking with 1K context length and sliding window',
'license': 'cc-by-nc-4.0'}] # some of the fields are omitted for brevity
`
```
Now, load the first-stage retriever and reranker.
```
`encoder\_name = "sentence-transformers/all-MiniLM-L6-v2"
dense\_embedding\_model = TextEmbedding(model\_name=encoder\_name)
reranker = TextCrossEncoder(model\_name='jinaai/jina-reranker-v2-base-multilingual')
`
```
The model files will be fetched and downloaded, with progress displayed.
## Embed & index data for the first-stage retrieval
We will vectorize a toy movie description dataset using the `all-MiniLM-L6-v2` model and save the embeddings in Qdrant for first-stage retrieval.
Then, we will use a cross-encoder reranking model to rerank a small subset of data retrieved in the first stage.
Movie description dataset
```
`descriptions = ["In 1431, Jeanne d'Arc is placed on trial on charges of heresy. The ecclesiastical jurists attempt to force Jeanne to recant her claims of holy visions.",
"A film projectionist longs to be a detective, and puts his meagre skills to work when he is framed by a rival for stealing his girlfriend's father's pocketwatch.",
"A group of high-end professional thieves start to feel the heat from the LAPD when they unknowingly leave a clue at their latest heist.",
"A petty thief with an utter resemblance to a samurai warlord is hired as the lord's double. When the warlord later dies the thief is forced to take up arms in his place.",
"A young boy named Kubo must locate a magical suit of armour worn by his late father in order to defeat a vengeful spirit from the past.",
"A biopic detailing the 2 decades that Punjabi Sikh revolutionary Udham Singh spent planning the assassination of the man responsible for the Jallianwala Bagh massacre.",
"When a machine that allows therapists to enter their patients' dreams is stolen, all hell breaks loose. Only a young female therapist, Paprika, can stop it.",
"An ordinary word processor has the worst night of his life after he agrees to visit a girl in Soho whom he met that evening at a coffee shop.",
"A story that revolves around drug abuse in the affluent north Indian State of Punjab and how the youth there have succumbed to it en-masse resulting in a socio-economic decline.",
"A world-weary political journalist picks up the story of a woman's search for her son, who was taken away from her decades ago after she became pregnant and was forced to live in a convent.",
"Concurrent theatrical ending of the TV series Neon Genesis Evangelion (1995).",
"During World War II, a rebellious U.S. Army Major is assigned a dozen convicted murderers to train and lead them into a mass assassination mission of German officers.",
"The toys are mistakenly delivered to a day-care center instead of the attic right before Andy leaves for college, and it's up to Woody to convince the other toys that they weren't abandoned and to return home.",
"A soldier fighting aliens gets to relive the same day over and over again, the day restarting every time he dies.",
"After two male musicians witness a mob hit, they flee the state in an all-female band disguised as women, but further complications set in.",
"Exiled into the dangerous forest by her wicked stepmother, a princess is rescued by seven dwarf miners who make her part of their household.",
"A renegade reporter trailing a young runaway heiress for a big story joins her on a bus heading from Florida to New York, and they end up stuck with each other when the bus leaves them behind at one of the stops.",
"Story of 40-man Turkish task force who must defend a relay station.",
"Spinal Tap, one of England's loudest bands, is chronicled by film director Marty DiBergi on what proves to be a fateful tour.",
"Oskar, an overlooked and bullied boy, finds love and revenge through Eli, a beautiful but peculiar girl."]
`
```
```
`descriptions\_embeddings = list(
dense\_embedding\_model.embed(descriptions)
)
`
```
Let&rsquo;s upload the embeddings to Qdrant.
Qdrant Client offers a simple in-memory mode, allowing you to experiment locally with small data volumes.
Alternatively, you can use [a free cluster](https://qdrant.tech/documentation/cloud/create-cluster/#create-a-cluster) in Qdrant Cloud for experiments.
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(":memory:") # Qdrant is running from RAM.
`
```
Let&rsquo;s create a [collection](https://qdrant.tech/documentation/manage-data/collections/) with our movie data.
```
`client.create\_collection(
collection\_name="movies",
vectors\_config={
"embedding": models.VectorParams(
size=client.get\_embedding\_size("sentence-transformers/all-MiniLM-L6-v2"),
distance=models.Distance.COSINE
)
}
)
`
```
And upload the embeddings to it.
```
`client.upload\_points(
collection\_name="movies",
points=[
models.PointStruct(
id=idx,
payload={"description": description},
vector={"embedding": vector}
)
for idx, (description, vector) in enumerate(
zip(descriptions, descriptions\_embeddings)
)
],
)
`
```
Check how points can be uploaded with builtin Fastembed integration.Upload with implicit embeddings computation
```
`client.upload\_points(
collection\_name="movies",
points=[
models.PointStruct(
id=idx,
payload={"description": description},
vector={"embedding": models.Document(text=description, model=encoder\_name)},
)
for idx, description in enumerate(descriptions)
],
)
`
```
## First-stage retrieval
Let&rsquo;s see how relevant the results will be using only an `all-MiniLM-L6-v2`-based dense retriever.
```
`query = "A story about a strong historically significant female figure."
query\_embedded = list(dense\_embedding\_model.query\_embed(query))[0]
initial\_retrieval = client.query\_points(
collection\_name="movies",
using="embedding",
query=query\_embedded,
with\_payload=True,
limit=10
)
description\_hits = []
for i, hit in enumerate(initial\_retrieval.points):
print(f'Result number {i+1} is \\"{hit.payload["description"]}\\"')
description\_hits.append(hit.payload["description"])
`
```
Check how queries can be made with builtin Fastembed integration.Query points with implicit embeddings computation
```
`query = "A story about a strong historically significant female figure."
initial\_retrieval = client.query\_points(
collection\_name="movies",
using="embedding",
query=models.Document(text=query, model=encoder\_name),
with\_payload=True,
limit=10
)
`
```
The result is as follows:
```
`Result number 1 is "A world-weary political journalist picks up the story of a woman's search for her son, who was taken away from her decades ago after she became pregnant and was forced to live in a convent."
Result number 2 is "Exiled into the dangerous forest by her wicked stepmother, a princess is rescued by seven dwarf miners who make her part of their household."
...
Result number 9 is "A biopic detailing the 2 decades that Punjabi Sikh revolutionary Udham Singh spent planning the assassination of the man responsible for the Jallianwala Bagh massacre."
Result number 10 is "In 1431, Jeanne d'Arc is placed on trial on charges of heresy. The ecclesiastical jurists attempt to force Jeanne to recant her claims of holy visions."
`
```
We can see that the description of *&ldquo;The Messenger: The Story of Joan of Arc&rdquo;*, which is the most fitting, appears 10th in the results.
Let&rsquo;s try refining the order of the retrieved subset with `Jina Reranker v2`. It takes a query and a set of documents (movie descriptions) as input and calculates a relevance score based on token-level interactions between the query and each document.
```
`new\_scores = list(
reranker.rerank(query, description\_hits)
) # returns scores between query and each document
ranking = [
(i, score) for i, score in enumerate(new\_scores)
] # saving document indices
ranking.sort(
key=lambda x: x[1], reverse=True
) # sorting them in order of relevance defined by reranker
for i, rank in enumerate(ranking):
print(f'''Reranked result number {i+1} is \\"{description\_hits[rank[0]]}\\"''')
`
```
The reranker moves the desired movie to the first position based on relevance.
```
`Reranked result number 1 is "In 1431, Jeanne d'Arc is placed on trial on charges of heresy. The ecclesiastical jurists attempt to force Jeanne to recant her claims of holy visions."
Reranked result number 2 is "Exiled into the dangerous forest by her wicked stepmother, a princess is rescued by seven dwarf miners who make her part of their household."
...
Reranked result number 9 is "An ordinary word processor has the worst night of his life after he agrees to visit a girl in Soho whom he met that evening at a coffee shop."
Reranked result number 10 is "A biopic detailing the 2 decades that Punjabi Sikh revolutionary Udham Singh spent planning the assassination of the man responsible for the Jallianwala Bagh massacre."
`
```
## Conclusion
Rerankers refine search results by reordering retrieved candidates through deeper semantic analysis. For efficiency, they should be applied **only to a small subset of retrieved results**.
Balance speed and accuracy in search by leveraging the power of rerankers!
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/fastembed/fastembed-rerankers.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/fastembed/fastembed-rerankers/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/fastembed/fastembed-rerankers.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)