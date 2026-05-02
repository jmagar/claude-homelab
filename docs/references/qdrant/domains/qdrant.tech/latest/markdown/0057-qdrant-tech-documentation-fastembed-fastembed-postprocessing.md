Multi-Vector Postprocessing - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [FastEmbed](https://qdrant.tech/documentation/fastembed/)
*
* Multi-Vector Postprocessing# Multi-Vector Postprocessing
FastEmbed&rsquo;s postprocessing module provides techniques for transforming and optimizing embeddings after generation. These
postprocessing methods can improve search performance, reduce storage requirements, or adapt embeddings for specific use
cases.
Currently, the postprocessing module includes MUVERA (Multi-Vector Retrieval Algorithm) for speeding up multi-vector
embeddings. Additional postprocessing techniques are planned for future releases.
## MUVERA
MUVERA transforms variable-length sequences of vectors into fixed-dimensional single-vector representations. These
approximations can be used for fast initial retrieval using traditional vector search methods like HNSW. Once you&rsquo;ve
retrieved a small set of candidates quickly, you can then rerank them using the original multi-vector representations
for maximum accuracy.
This hybrid approach combines the speed of single-vector search with the accuracy of multi-vector retrieval. Instead of
comparing all documents in your collection using expensive multi-vector similarity computations, MUVERA lets you:
1. **Retrieve quickly**: Use MUVERA embeddings to find the top candidates with traditional vector search with oversampling
2. **Rerank precisely**: Apply multi-vector similarity with MaxSim only to this small candidate set
The trade-off is increased storage requirements, as you need to store both the MUVERA embeddings and the original
multi-vector representations. However, the performance gains make this approach practical for production systems with
large document collections, and other techniques, such as off-loading to disk, may help you reduce the cost.
For a detailed technical explanation of how MUVERA works, see our article: [MUVERA: Making Multivectors More
Performant](https://qdrant.tech/articles/muvera-embeddings/).
## Using MUVERA in FastEmbed
This tutorial demonstrates using MUVERA for fast retrieval with ColBERT reranking on a toy dataset. If you&rsquo;re new to
multi-vector embeddings, we recommend first reading [How to Generate ColBERT Multivectors with
FastEmbed](https://qdrant.tech/documentation/fastembed/fastembed-colbert/).
### Setup
Install FastEmbed 0.7.2 or later to access MUVERA postprocessing.
```
`pip install "fastembed\>=0.7.2"
`
```
Import the necessary modules for late interaction embeddings and MUVERA postprocessing.
```
`from fastembed import LateInteractionTextEmbedding
from fastembed.postprocess import Muvera
`
```
### Load Model and Create MUVERA Processor
Load the ColBERT model and wrap it with a MUVERA processor.
```
`model\_name = "colbert-ir/colbertv2.0"
model = LateInteractionTextEmbedding(model\_name=model\_name)
# Create MUVERA processor with recommended parameters
muvera = Muvera.from\_multivector\_model(
model=model,
k\_sim=6,
dim\_proj=32,
r\_reps=20
)
`
```
The MUVERA parameters control the size and quality of the resulting embeddings. These recommended values balance speed
and accuracy. The `k\_sim` parameter determines the number of clusters (2^6 = 64), `dim\_proj` sets the projection
dimensions, and `r\_reps` specifies the number of repetitions for robustness.
Larger parameter values (e.g., k\_sim=7, dim\_proj=64) produce more accurate but larger embeddings. Experiment with
different configurations based on your accuracy and storage requirements.### Embed Data with ColBERT
We&rsquo;ll use a toy movie description dataset to demonstrate MUVERA.
Movie description dataset
```
`descriptions = [
"In 1431, Jeanne d'Arc is placed on trial on charges of heresy. The ecclesiastical jurists attempt to force Jeanne to recant her claims of holy visions.",
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
"Oskar, an overlooked and bullied boy, finds love and revenge through Eli, a beautiful but peculiar girl."
]
`
```
Generate multi-vector embeddings for the movie descriptions.
```
`descriptions\_embeddings = list(model.embed(descriptions))
`
```
Let&rsquo;s check the shape of one of the multi-vector embeddings.
```
`descriptions\_embeddings[0].shape
`
```
The first document consists of 33 tokens, each represented by a 128-dimensional vector.
```
`(33, 128)
`
```
### Process with MUVERA
Now, transform the multi-vector embeddings into MUVERA&rsquo;s single-vector representations.
```
`muvera\_embeddings = [
muvera.process\_document(emb) for emb in descriptions\_embeddings
]
`
```
Let&rsquo;s check the shape of a MUVERA embedding.
```
`muvera\_embeddings[0].shape
`
```
The MUVERA dimensionality depends on the method configuration, and in our case it will be quite high.
```
`(40960,)
`
```
The MUVERA embedding is a single vector with 40,960 dimensions. While this is larger than typical dense embeddings
(which are usually a few hundred to a few thousand dimensions), it&rsquo;s significantly faster to search than the original
multi-vector representation because traditional vector search indexes like HNSW are optimized for single-vector
similarity.
### Upload to Qdrant
Install `qdrant-client`.
```
`pip install "qdrant-client\>=1.14.2"
`
```
We&rsquo;ll use Qdrant running locally in a Docker container for this example. Alternatively, you can use [a free
cluster](https://qdrant.tech/documentation/cloud/create-cluster/#create-a-cluster) in Qdrant Cloud.
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient("http://localhost:6333")
`
```
Create a [collection](https://qdrant.tech/documentation/manage-data/collections/) that stores both MUVERA embeddings and the original
multi-vector representations using [named vectors](https://qdrant.tech/documentation/manage-data/vectors/#named-vectors).
```
`client.create\_collection(
collection\_name="movies-muvera",
vectors\_config={
"muvera": models.VectorParams(
size=muvera.embedding\_size, # Depends on the MUVERA configuration
distance=models.Distance.COSINE
),
"colbert": models.VectorParams(
size=model.embedding\_size, # Model-specific
distance=models.Distance.COSINE,
multivector\_config=models.MultiVectorConfig(
comparator=models.MultiVectorComparator.MAX\_SIM
)
)
}
)
`
```
Upload both representations to the collection.
```
`client.upload\_points(
collection\_name="movies-muvera",
points=[
models.PointStruct(
id=idx,
payload={"description": description},
vector={
"muvera": muvera\_emb,
"colbert": colbert\_emb
}
)
for idx, (description, muvera\_emb, colbert\_emb) in enumerate(
zip(descriptions, muvera\_embeddings, descriptions\_embeddings)
)
]
)
`
```
### Hybrid Search: MUVERA Retrieval + ColBERT Reranking
Now let&rsquo;s perform a search using the hybrid approach. Qdrant supports [multi-stage
queries](https://qdrant.tech/documentation/search/hybrid-queries/#multi-stage-queries) through the `prefetch` parameter, which lets us
combine MUVERA&rsquo;s fast retrieval with ColBERT&rsquo;s accurate rescoring in a single query.
First, create query embeddings in both formats.
```
`query = "A movie for kids with fantasy elements and wonders"
query\_multivec = list(model.query\_embed(query))[0]
query\_muvera = muvera.process\_query(query\_multivec)
`
```
Now perform a two-stage query using Qdrant&rsquo;s native multi-stage search:
```
`results = client.query\_points(
collection\_name="movies-muvera",
prefetch=models.Prefetch(
query=query\_muvera,
using="muvera",
limit=20, # Stage 1: Retrieve 20 candidates with MUVERA (fast)
),
query=query\_multivec, # Stage 2: Rescore with ColBERT multi-vector (accurate)
using="colbert",
limit=3, # Return top 3 results after rescoring
with\_payload=True
)
`
```
The `prefetch` parameter retrieves candidates using MUVERA, then the main `query` rescores those candidates using
ColBERT&rsquo;s multi-vector representation. Qdrant automatically handles the MaxSim computation for multi-vector similarity.
Qdrant's multi-stage query API handles the two-stage retrieval natively - no manual reranking code needed! Learn more
about [multi-stage queries](https://qdrant.tech/documentation/search/hybrid-queries/#multi-stage-queries).
Display the results.
```
`for i, point in enumerate(results.points, 1):
print(f'Result {i}: "{point.payload["description"]}"')
print(f"Score: {point.score:.2f}\\n")
`
```
Here is how they should look like for the toy dataset we&rsquo;re using:
```
`Result 1: "A young boy named Kubo must locate a magical suit of armour worn by his late father in order to defeat a vengeful spirit from the past."
Score: 12.06
Result 2: "Oskar, an overlooked and bullied boy, finds love and revenge through Eli, a beautiful but peculiar girl."
Score: 10.75
Result 3: "When a machine that allows therapists to enter their patients' dreams is stolen, all hell breaks loose. Only a young female therapist, Paprika, can stop it."
Score: 10.04
`
```
This hybrid approach maintains nearly the same accuracy as full multi-vector search across the entire collection while
being significantly faster. The expensive multi-vector similarity computation is only applied to the 20 candidates
retrieved by MUVERA rather than all documents in the collection.
### Conclusion
MUVERA postprocessing enables practical large-scale multi-vector search by creating fast-to-search approximations of
multi-vector embeddings. The recommended approach combines MUVERA with Qdrant&rsquo;s native multi-stage query capabilities:
1. **Fast retrieval**: Use MUVERA embeddings with `prefetch` to retrieve candidate documents
2. **Precise reranking**: Qdrant automatically rescores candidates with ColBERT multi-vectors
This hybrid pattern scales efficiently to large collections by limiting expensive multi-vector computations to only the
candidate set retrieved by MUVERA, while maintaining nearly identical search quality compared to pure multi-vector search.
The trade-off is increased storage, as you need to maintain both representations in your collection.
MUVERA is particularly valuable for production systems with large document collections where multi-vector search would
otherwise be too slow for first-stage retrieval. The combination of FastEmbed&rsquo;s MUVERA postprocessing and Qdrant&rsquo;s
multi-stage queries provides a seamless, performant solution.
Upgrade to FastEmbed 0.7.2 or later with `pip install --upgrade fastembed` to start using MUVERA postprocessing today.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/fastembed/fastembed-postprocessing.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/fastembed/fastembed-postprocessing/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/fastembed/fastembed-postprocessing.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)