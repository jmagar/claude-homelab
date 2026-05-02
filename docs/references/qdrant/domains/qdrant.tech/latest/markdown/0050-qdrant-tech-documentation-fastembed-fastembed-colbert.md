Working with ColBERT - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [FastEmbed](https://qdrant.tech/documentation/fastembed/)
*
* Working with ColBERT# How to Generate ColBERT Multivectors with FastEmbed
## ColBERT
ColBERT is an embedding model that produces a matrix (multivector) representation of input text,
generating one vector per token (a token being a meaningful text unit for a machine learning model).
This approach allows ColBERT to capture more nuanced input semantics than many dense embedding models,
which represent an entire input with a single vector. By producing more granular input representations,
ColBERT becomes a strong retriever. However, this advantage comes at the cost of increased resource consumption compared to
traditional dense embedding models, both in terms of speed and memory.
Despite ColBERT being a powerful retriever, its speed limitation might make it less suitable for large-scale retrieval.
Therefore, we generally recommend using ColBERT for reranking a small set of already retrieved examples, rather than for first-stage retrieval.
A simple dense retriever can initially retrieve around 100-500 candidates, which can then be reranked with ColBERT to bring the most relevant results
to the top.
ColBERT is a considerable alternative of a reranking model to [cross-encoders](https://sbert.net/examples/applications/cross-encoder/README.html), since
it tends to be faster on inference time due to its `late interaction` mechanism.
How does `late interaction` work? Cross-encoders ingest a query and a document glued together as one input.
A cross-encoder model divides this input into meaningful (for the model) parts and checks how these parts relate.
So, all interactions between the query and the document happen &ldquo;early&rdquo; inside the model.
Late interaction models, such as ColBERT, only do the first part, generating document and query parts suitable for comparison.
All interactions between these parts are expected to be done &ldquo;later&rdquo; outside the model.
## Using ColBERT in Qdrant
Qdrant supports [multivector representations](https://qdrant.tech/documentation/manage-data/vectors/#multivectors) out of the box so that you can use any late interaction model as `ColBERT` or `ColPali` in Qdrant without any additional pre/post-processing.
This tutorial uses ColBERT as a first-stage retriever on a toy dataset.
You can see how to use ColBERT as a reranker in our [multi-stage queries documentation](https://qdrant.tech/documentation/search/hybrid-queries/#multi-stage-queries).
## Setup
Install `fastembed`.
```
`pip install fastembed
`
```
Imports late interaction models for text embedding.
```
`from fastembed import LateInteractionTextEmbedding
`
```
You can list which late interaction models are supported in FastEmbed.
```
`LateInteractionTextEmbedding.list\_supported\_models()
`
```
This command displays the available models. The output shows details about the model, including output embedding dimensions, model description, model size, model sources, and model file.
```
`[{'model': 'colbert-ir/colbertv2.0',
'dim': 128,
'description': 'Late interaction model',
'size\_in\_GB': 0.44,
'sources': {'hf': 'colbert-ir/colbertv2.0'},
'model\_file': 'model.onnx'},
{'model': 'answerdotai/answerai-colbert-small-v1',
'dim': 96,
'description': 'Text embeddings, Unimodal (text), Multilingual (\~100 languages), 512 input tokens truncation, 2024 year',
'size\_in\_GB': 0.13,
'sources': {'hf': 'answerdotai/answerai-colbert-small-v1'},
'model\_file': 'vespa\_colbert.onnx'}]
`
```
Now, load the model.
```
`model\_name = "colbert-ir/colbertv2.0"
embedding\_model = LateInteractionTextEmbedding(model\_name)
`
```
The model files will be fetched and downloaded, with progress showing.
## Embed data
We will vectorize a toy movie description dataset with ColBERT:
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
The vectorization is done with an `embed` generator function.
```
`descriptions\_embeddings = list(
embedding\_model.embed(descriptions)
)
`
```
Let&rsquo;s check the size of one of the produced embeddings.
```
`descriptions\_embeddings[0].shape
`
```
We get the following result
```
`(48, 128)
`
```
That means that for the first description, we have **48** vectors of lengths **128** representing it.
## Upload embeddings to Qdrant
Install `qdrant-client`
```
`pip install "qdrant-client\>=1.14.2"
`
```
Qdrant Client has a simple in-memory mode that allows you to experiment locally on small data volumes.
Alternatively, you could use for experiments [a free cluster](https://qdrant.tech/documentation/cloud/create-cluster/#create-a-cluster) in Qdrant Cloud.
```
`from qdrant\_client import QdrantClient, models
qdrant\_client = QdrantClient(":memory:") # Qdrant is running from RAM.
`
```
Now, let&rsquo;s create a small [collection](https://qdrant.tech/documentation/manage-data/collections/) with our movie data.
For that, we will use the [multivectors](https://qdrant.tech/documentation/manage-data/vectors/#multivectors) functionality supported in Qdrant.
To configure multivector collection, we need to specify:
* similarity metric between vectors;
* the size of each vector (for ColBERT, it&rsquo;s **128**);
* similarity metric between multivectors (matrices), for example, `maximum`, so for vector from matrix A, we find the most similar vector from matrix B, and their similarity score will be out matrix similarity.
```
`qdrant\_client.create\_collection(
collection\_name="movies",
vectors\_config=models.VectorParams(
size=128, #size of each vector produced by ColBERT
distance=models.Distance.COSINE, #similarity metric between each vector
multivector\_config=models.MultiVectorConfig(
comparator=models.MultiVectorComparator.MAX\_SIM #similarity metric between multivectors (matrices)
),
),
)
`
```
To make this collection human-readable, let&rsquo;s save movie metadata (name, description in text form and movie&rsquo;s length) together with an embedded description.
Movie metadata
```
`metadata = [{"movie\_name": "The Passion of Joan of Arc", "movie\_watch\_time\_min": 114, "movie\_description": "In 1431, Jeanne d'Arc is placed on trial on charges of heresy. The ecclesiastical jurists attempt to force Jeanne to recant her claims of holy visions."},
{"movie\_name": "Sherlock Jr.", "movie\_watch\_time\_min": 45, "movie\_description": "A film projectionist longs to be a detective, and puts his meagre skills to work when he is framed by a rival for stealing his girlfriend's father's pocketwatch."},
{"movie\_name": "Heat", "movie\_watch\_time\_min": 170, "movie\_description": "A group of high-end professional thieves start to feel the heat from the LAPD when they unknowingly leave a clue at their latest heist."},
{"movie\_name": "Kagemusha", "movie\_watch\_time\_min": 162, "movie\_description": "A petty thief with an utter resemblance to a samurai warlord is hired as the lord's double. When the warlord later dies the thief is forced to take up arms in his place."},
{"movie\_name": "Kubo and the Two Strings", "movie\_watch\_time\_min": 101, "movie\_description": "A young boy named Kubo must locate a magical suit of armour worn by his late father in order to defeat a vengeful spirit from the past."},
{"movie\_name": "Sardar Udham", "movie\_watch\_time\_min": 164, "movie\_description": "A biopic detailing the 2 decades that Punjabi Sikh revolutionary Udham Singh spent planning the assassination of the man responsible for the Jallianwala Bagh massacre."},
{"movie\_name": "Paprika", "movie\_watch\_time\_min": 90, "movie\_description": "When a machine that allows therapists to enter their patients' dreams is stolen, all hell breaks loose. Only a young female therapist, Paprika, can stop it."},
{"movie\_name": "After Hours", "movie\_watch\_time\_min": 97, "movie\_description": "An ordinary word processor has the worst night of his life after he agrees to visit a girl in Soho whom he met that evening at a coffee shop."},
{"movie\_name": "Udta Punjab", "movie\_watch\_time\_min": 148, "movie\_description": "A story that revolves around drug abuse in the affluent north Indian State of Punjab and how the youth there have succumbed to it en-masse resulting in a socio-economic decline."},
{"movie\_name": "Philomena", "movie\_watch\_time\_min": 98, "movie\_description": "A world-weary political journalist picks up the story of a woman's search for her son, who was taken away from her decades ago after she became pregnant and was forced to live in a convent."},
{"movie\_name": "Neon Genesis Evangelion: The End of Evangelion", "movie\_watch\_time\_min": 87, "movie\_description": "Concurrent theatrical ending of the TV series Neon Genesis Evangelion (1995)."},
{"movie\_name": "The Dirty Dozen", "movie\_watch\_time\_min": 150, "movie\_description": "During World War II, a rebellious U.S. Army Major is assigned a dozen convicted murderers to train and lead them into a mass assassination mission of German officers."},
{"movie\_name": "Toy Story 3", "movie\_watch\_time\_min": 103, "movie\_description": "The toys are mistakenly delivered to a day-care center instead of the attic right before Andy leaves for college, and it's up to Woody to convince the other toys that they weren't abandoned and to return home."},
{"movie\_name": "Edge of Tomorrow", "movie\_watch\_time\_min": 113, "movie\_description": "A soldier fighting aliens gets to relive the same day over and over again, the day restarting every time he dies."},
{"movie\_name": "Some Like It Hot", "movie\_watch\_time\_min": 121, "movie\_description": "After two male musicians witness a mob hit, they flee the state in an all-female band disguised as women, but further complications set in."},
{"movie\_name": "Snow White and the Seven Dwarfs", "movie\_watch\_time\_min": 83, "movie\_description": "Exiled into the dangerous forest by her wicked stepmother, a princess is rescued by seven dwarf miners who make her part of their household."},
{"movie\_name": "It Happened One Night", "movie\_watch\_time\_min": 105, "movie\_description": "A renegade reporter trailing a young runaway heiress for a big story joins her on a bus heading from Florida to New York, and they end up stuck with each other when the bus leaves them behind at one of the stops."},
{"movie\_name": "Nefes: Vatan Sagolsun", "movie\_watch\_time\_min": 128, "movie\_description": "Story of 40-man Turkish task force who must defend a relay station."},
{"movie\_name": "This Is Spinal Tap", "movie\_watch\_time\_min": 82, "movie\_description": "Spinal Tap, one of England's loudest bands, is chronicled by film director Marty DiBergi on what proves to be a fateful tour."},
{"movie\_name": "Let the Right One In", "movie\_watch\_time\_min": 114, "movie\_description": "Oskar, an overlooked and bullied boy, finds love and revenge through Eli, a beautiful but peculiar girl."}]
`
```
```
`qdrant\_client.upload\_points(
collection\_name="movies",
points=[
models.PointStruct(
id=idx,
payload=metadata[idx],
vector=vector
)
for idx, vector in enumerate(descriptions\_embeddings)
],
)
`
```
Qdrant client has an integration with Fastembed which allows to skip the explicit process of vectors computation. (An example is under the spoiler).Upload with implicit embeddings computation
```
`description\_documents = [models.Document(text=description, model=model\_name) for description in descriptions]
qdrant\_client.upload\_points(
collection\_name="movies",
points=[
models.PointStruct(
id=idx,
payload=metadata[idx],
vector=description\_document
)
for idx, description\_document in enumerate(description\_documents)
],
)
`
```
## Querying
ColBERT uses two distinct methods for embedding documents and queries, as do we in Fastembed. However, we altered query pre-processing used in ColBERT, so we don&rsquo;t have to cut all queries after 32-token length but ingest longer queries directly.
```
`qdrant\_client.query\_points(
collection\_name="movies",
query=list(embedding\_model.query\_embed("A movie for kids with fantasy elements and wonders"))[0], #converting generator object into numpy.ndarray
limit=1, #How many closest to the query movies we would like to get
#with\_vectors=True, #If this option is used, vectors will also be returned
with\_payload=True #So metadata is provided in the output
)
`
```
Example of query\_points with implicit embedding computation. (Under the spoiler).Query points with implicit embeddings computation
```
`query\_document = models.Document(text="A movie for kids with fantasy elements and wonders", model=model\_name)
qdrant\_client.query\_points(
collection\_name="movies",
query=query\_document,
limit=1,
)
`
```
The result is the following:
```
`QueryResponse(points=[ScoredPoint(id=4, version=0, score=12.063469,
payload={'movie\_name': 'Kubo and the Two Strings', 'movie\_watch\_time\_min': 101,
'movie\_description': 'A young boy named Kubo must locate a magical suit of armour worn by his late father in order to defeat a vengeful spirit from the past.'},
vector=None, shard\_key=None, order\_value=None)])
`
```
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/fastembed/fastembed-colbert.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/fastembed/fastembed-colbert/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/fastembed/fastembed-colbert.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)