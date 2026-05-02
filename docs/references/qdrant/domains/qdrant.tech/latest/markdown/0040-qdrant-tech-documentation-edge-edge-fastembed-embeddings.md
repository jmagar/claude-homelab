On-Device Embeddings - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Qdrant Edge](https://qdrant.tech/documentation/edge/)
*
* On-Device Embeddings# On-Device Embeddings with Qdrant Edge and FastEmbed
When using Python, you can use the [FastEmbed](https://qdrant.tech/documentation/fastembed/) library to generate embeddings for use with Qdrant Edge. FastEmbed provides multimodal models that run efficiently on edge devices to generate vector embeddings from text and images.
# Provision the Device
Assuming the devices on which you will run Qdrant Edge have intermittent or no internet connectivity, you need to provision them with the necessary dependencies and model files ahead of time. First, install FastEmbed and the Qdrant Edge Python bindings:
```
`pip install fastembed qdrant-edge-py
`
```
Next, download the embedding models and save them locally on the device. Instantiate instances of `ImageEmbedding` and `TextEmbedding`, setting the `cache\_dir` parameter to a local directory:
```
`from fastembed import ImageEmbedding, TextEmbedding
TEXT\_MODEL\_NAME='Qdrant/clip-ViT-B-32-text'
VISION\_MODEL\_NAME='Qdrant/clip-ViT-B-32-vision'
MODELS\_DIR="./qdrant-edge-directory/models"
ImageEmbedding(
model\_name=VISION\_MODEL\_NAME,
cache\_dir=MODELS\_DIR
)
TextEmbedding(
model\_name=TEXT\_MODEL\_NAME,
cache\_dir=MODELS\_DIR
)
`
```
The models will be downloaded and cached in the specified `MODELS\_DIR` directory, from where you can use them to generate embeddings.
# Generate Image Embeddings
First, initialize an Edge Shard as described in the [Qdrant Edge Quickstart Guide](https://qdrant.tech/documentation/edge/edge-quickstart/).
Details
```
`from pathlib import Path
from qdrant\_edge import (
Distance,
EdgeConfig,
EdgeShard,
EdgeVectorParams,
)
SHARD\_DIRECTORY = "./qdrant-edge-directory"
VECTOR\_DIMENSION = 512
VECTOR\_NAME="my-vector"
Path(SHARD\_DIRECTORY).mkdir(parents=True, exist\_ok=True)
config = EdgeConfig(
vectors={
VECTOR\_NAME: EdgeVectorParams(
size=VECTOR\_DIMENSION,
distance=Distance.Cosine,
)
}
)
edge\_shard = EdgeShard.create(SHARD\_DIRECTORY, config)
`
```
Assuming you have an image file `temp.jpg`, you can generate an embedding for it using FastEmbed&rsquo;s `ImageEmbedding` class and then store it in the Edge Shard:
```
`from pathlib import Path
from qdrant\_edge import Point, UpdateOperation
import uuid
IMAGES\_DIR = "images"
image\_model = ImageEmbedding(
model\_name=VISION\_MODEL\_NAME,
cache\_dir=MODELS\_DIR,
local\_files\_only=True
)
embeddings = list(image\_model.embed([Path(IMAGES\_DIR) / "temp.jpg"]))[0]
point = Point(
id=str(uuid.uuid4()),
vector={VECTOR\_NAME: embeddings.tolist()}
)
edge\_shard.update(UpdateOperation.upsert\_points([point]))
`
```
Note the use of `cache\_dir=MODELS\_DIR` and `local\_files\_only=True` to load the image embedding model from the local directory where it was previously downloaded.
# Generate Text Embeddings
At query time, you can generate text embeddings using FastEmbed&rsquo;s `TextEmbedding` class. For example, to query the Edge Shard:
```
`from qdrant\_edge import Query, QueryRequest
text\_model = TextEmbedding(
model\_name=TEXT\_MODEL\_NAME,
cache\_dir=MODELS\_DIR,
local\_files\_only=True
)
embeddings = list(text\_model.embed(["\<search terms\>"]))[0]
results = edge\_shard.query(
QueryRequest(
query=Query.Nearest(embeddings.tolist(),using=VECTOR\_NAME),
limit=10,
with\_vector=False,
with\_payload=True
)
)
`
```
Again, using `cache\_dir=MODELS\_DIR` and `local\_files\_only=True` ensures the text embedding model is loaded from the local directory.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/edge/edge-fastembed-embeddings.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/edge/edge-fastembed-embeddings/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/edge/edge-fastembed-embeddings.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)