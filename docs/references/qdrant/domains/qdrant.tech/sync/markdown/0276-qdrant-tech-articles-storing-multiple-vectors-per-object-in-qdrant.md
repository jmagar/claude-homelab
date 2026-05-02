Optimizing Semantic Search by Managing Multiple Vectors - Qdrant
* [Qdrant Articles](https://qdrant.tech/articles/)
*
* Optimizing Semantic Search by Managing Multiple Vectors
[
Back to
Vector Search Manuals](https://qdrant.tech/articles/vector-search-manuals/)# Optimizing Semantic Search by Managing Multiple Vectors
Kacper Łukawski
&#183;
October 05, 2022
# How to Optimize Vector Storage by Storing Multiple Vectors Per Object
In a real case scenario, a single object might be described in several different ways. If you run an e-commerce business, then your items will typically have a name, longer textual description and also a bunch of photos. While cooking, you may care about the list of ingredients, and description of the taste but also the recipe and the way your meal is going to look. Up till now, if you wanted to enable [semantic search](https://qdrant.tech/documentation/tutorials/search-beginners/) with multiple vectors per object, Qdrant would require you to create separate collections for each vector type, even though they could share some other attributes in a payload. However, since Qdrant 0.10 you are able to store all those vectors together in the same collection and share a single copy of the payload!
Running the new version of Qdrant is as simple as it always was. By running the following command, you are able to set up a single instance that will also expose the HTTP API:
```
`docker run -p 6333:6333 qdrant/qdrant:v0.10.1
`
```
## Creating a collection
Adding new functionalities typically requires making some changes to the interfaces, so no surprise we had to do it to enable the multiple vectors support. Currently, if you want to create a collection, you need to define the configuration of all the vectors you want to store for each object. Each vector type has its own name and the distance function used to measure how far the points are.
```
`from qdrant\_client import QdrantClient
from qdrant\_client.http.models import VectorParams, Distance
client = QdrantClient()
client.create\_collection(
collection\_name="multiple\_vectors",
vectors\_config={
"title": VectorParams(
size=100,
distance=Distance.EUCLID,
),
"image": VectorParams(
size=786,
distance=Distance.COSINE,
),
}
)
`
```
In case you want to keep a single vector per collection, you can still do it without putting a name though.
```
`client.create\_collection(
collection\_name="single\_vector",
vectors\_config=VectorParams(
size=100,
distance=Distance.COSINE,
)
)
`
```
All the search-related operations have slightly changed their interfaces as well, so you can choose which vector to use in a specific request. However, it might be easier to see all the changes by following an end-to-end Qdrant usage on a real-world example.
## Building service with multiple embeddings
Quite a common approach to building search engines is to combine semantic textual capabilities with image search as well. For that purpose, we need a dataset containing both images and their textual descriptions. There are several datasets available with [MS\_COCO\_2017\_URL\_TEXT](https://huggingface.co/datasets/ChristophSchuhmann/MS_COCO_2017_URL_TEXT) being probably the simplest available. And because it’s available on HuggingFace, we can easily use it with their [datasets](https://huggingface.co/docs/datasets/index) library.
```
`from datasets import load\_dataset
dataset = load\_dataset("ChristophSchuhmann/MS\_COCO\_2017\_URL\_TEXT")
`
```
Right now, we have a dataset with a structure containing the image URL and its textual description in English. For simplicity, we can convert it to the DataFrame, as this structure might be quite convenient for future processing.
```
`import pandas as pd
dataset\_df = pd.DataFrame(dataset["train"])
`
```
The dataset consists of two columns: *TEXT* and *URL*. Thus, each data sample is described by two separate pieces of information and each of them has to be encoded with a different model.
## Processing the data with pretrained models
Thanks to [embetter](https://github.com/koaning/embetter), we can reuse some existing pretrained models and use a convenient scikit-learn API, including pipelines. This library also provides some utilities to load the images, but only supports the local filesystem, so we need to create our own class that will download the file, given its URL.
```
`from pathlib import Path
from urllib.request import urlretrieve
from embetter.base import EmbetterBase
class DownloadFile(EmbetterBase):
def \_\_init\_\_(self, out\_dir: Path):
self.out\_dir = out\_dir
def transform(self, X, y=None):
output\_paths = []
for x in X:
output\_file = self.out\_dir / Path(x).name
urlretrieve(x, output\_file)
output\_paths.append(str(output\_file))
return output\_paths
`
```
Now we’re ready to define the pipelines to process our images and texts using *all-MiniLM-L6-v2* and *vit\_base\_patch16\_224* models respectively. First of all, let’s start with Qdrant configuration.
## Creating Qdrant collection
We’re going to put two vectors per object (one for image and another one for text), so we need to create a collection with a configuration allowing us to do so.
```
`from qdrant\_client import QdrantClient
from qdrant\_client.http.models import VectorParams, Distance
client = QdrantClient(timeout=None)
client.create\_collection(
collection\_name="ms-coco-2017",
vectors\_config={
"text": VectorParams(
size=384,
distance=Distance.EUCLID,
),
"image": VectorParams(
size=1000,
distance=Distance.COSINE,
),
},
)
`
```
## Defining the pipelines
And since we have all the puzzles already in place, we can start the processing to convert raw data into the embeddings we need. The pretrained models come in handy.
```
`from sklearn.pipeline import make\_pipeline
from embetter.grab import ColumnGrabber
from embetter.vision import ImageLoader, TimmEncoder
from embetter.text import SentenceEncoder
output\_directory = Path("./images")
image\_pipeline = make\_pipeline(
ColumnGrabber("URL"),
DownloadFile(output\_directory),
ImageLoader(),
TimmEncoder("vit\_base\_patch16\_224"),
)
text\_pipeline = make\_pipeline(
ColumnGrabber("TEXT"),
SentenceEncoder("all-MiniLM-L6-v2"),
)
`
```
Thanks to the scikit-learn API, we can simply call each pipeline on the created DataFrame and put created vectors into Qdrant to enable fast vector search. For convenience, we’re going to put the vectors as other columns in our DataFrame.
```
`sample\_df = dataset\_df.sample(n=2000, random\_state=643)
image\_vectors = image\_pipeline.transform(sample\_df)
text\_vectors = text\_pipeline.transform(sample\_df)
sample\_df["image\_vector"] = image\_vectors.tolist()
sample\_df["text\_vector"] = text\_vectors.tolist()
`
```
The created vectors might be easily put into Qdrant. For the sake of simplicity, we’re going to skip it, but if you are interested in details, please check out the [Jupyter notebook](https://gist.github.com/kacperlukawski/961aaa7946f55110abfcd37fbe869b8f) going step by step.
## Searching with multiple vectors
If you decided to describe each object with several [neural embeddings](https://qdrant.tech/articles/neural-search-tutorial/), then at each search operation you need to provide the vector name along with the [vector embedding](https://qdrant.tech/articles/what-are-embeddings/), so the engine knows which one to use. The interface of the search operation is pretty straightforward and requires an instance of NamedVector.
```
`from qdrant\_client.http.models import NamedVector
text\_results = client.search(
collection\_name="ms-coco-2017",
query\_vector=NamedVector(
name="text",
vector=row["text\_vector"],
),
limit=5,
with\_vectors=False,
with\_payload=True,
)
`
```
If we, on the other hand, decided to search using the image embedding, then we just provide the vector name we have chosen while creating the collection, so instead of “text”, we would provide “image”, as this is how we configured it at the very beginning.
## The results: image vs text search
Since we have two different vectors describing each object, we can perform the search query using any of those. That shouldn’t be surprising then, that the results are different depending on the chosen embedding method. The images below present the results returned by Qdrant for the image/text on the left-hand side.
### Image search
If we query the system using image embedding, then it returns the following results:
Image search results
### Text search
However, if we use textual description embedding, then the results are slightly different:
Text search However, if we use textual description embedding, then the results are slightly different:
It is not surprising that a method used for creating neural encoding plays an important role in the search process and its quality. If your data points might be described using several vectors, then the latest release of Qdrant gives you an opportunity to store them together and reuse the payloads, instead of creating several collections and querying them separately.
### Summary:
* Qdrant 0.10 introduces efficient vector storage optimization, allowing seamless management of multiple vectors per object within a single collection.
* This update streamlines semantic search capabilities by eliminating the need for separate collections for each vector type, enhancing search accuracy and performance.
* With Qdrant&rsquo;s new features, users can easily configure vector parameters, including size and distance functions, for each vector type, optimizing search results and user experience.
If you’d like to check out some other examples, please check out our [full notebook](https://gist.github.com/kacperlukawski/961aaa7946f55110abfcd37fbe869b8f) presenting the search results and the whole pipeline implementation.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/storing-multiple-vectors-per-object-in-qdrant.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/articles/storing-multiple-vectors-per-object-in-qdrant/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/storing-multiple-vectors-per-object-in-qdrant.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)