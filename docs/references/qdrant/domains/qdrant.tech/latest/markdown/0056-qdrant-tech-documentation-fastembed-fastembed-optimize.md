Optimize Throughput - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [FastEmbed](https://qdrant.tech/documentation/fastembed/)
*
* Optimize Throughput# Optimize FastEmbed Throughput
By default, FastEmbed processes documents sequentially in the main processing thread. To optimize throughput, FastEmbed supports processing documents in parallel.
When parallel processing is enabled, FastEmbed splits a dataset across multiple workers, each running an independent copy of the embedding model. Internally, documents are split into batches and put on a shared input queue. Each batch is then processed by one of the workers, put on a shared output queue, and then collected and reordered to match the original input order.
To configure FastEmbed for parallel processing, use the following parameters:
* `parallel`: the number of workers.
* When set to `None` (default), the embedding model runs in the main process.
* When set to `0`, FastEmbed detects the number of available CPU cores and parallelizes across that many workers.
* When set to `1` or higher, FastEmbed uses the specified number of workers.
* Batch size: the number of documents that each worker processes in each batch. Adjusting this to balance memory usage and processing speed. Lower it if you&rsquo;re running out of memory during local inference. Raise it to improve throughput if you have plenty of memory and are processing large document sets.
To configure the batch size, use:
* `batch\_size`: stand-alone FastEmbed parameter for batch processing. Defaults to `256` for text and `16` for images.
* `local\_inference\_batch\_size`: Qdrant Client parameter for batch processing. Defaults to `8`.
* `lazy\_load`: set to `True` to avoid loading the embedding model until it&rsquo;s needed for inference. Enabling lazy loading prevents loading the model in the main process when using multiple workers, which saves memory and reduces startup time.
## Parallelize FastEmbed with the Qdrant Client
When using FastEmbed with Qdrant Client, specify the `local\_inference\_batch\_size` parameter when initializing the client to configure the batch size. For example:
```
`client = QdrantClient(
url=QDRANT\_URL,
api\_key=QDRANT\_API\_KEY,
local\_inference\_batch\_size=256, # FastEmbed batch size
)
`
```
Next, when creating points, set `lazy\_load` to `True` in the inference object to avoid loading the embedding model in the main process:
```
`point = models.PointStruct(
id=1,
vector=models.Document(
text="The text to embed",
model="BAAI/bge-small-en-v1.5",
options={
"lazy\_load": True,
},
)
)
`
```
When using [`fastembed-gpu`](https://qdrant.github.io/fastembed/examples/FastEmbed_GPU/), also set `cuda` to `True` to enable GPU acceleration:
```
`point = models.PointStruct(
id=1,
vector=models.Document(
text="The text to embed",
model="BAAI/bge-small-en-v1.5",
options={
"lazy\_load": True,
"cuda": True,
},
)
)
`
```
Finally, when uploading points, set the `parallel` parameter to the desired number of workers:
```
`client.upload\_points(
collection\_name=COLLECTION\_NAME,
points=points,
parallel=4 # use 4 workers to process documents in parallel
)
`
```
## Parallelize Standalone FastEmbed
When using FastEmbed as a standalone library, first enable lazy loading of the embedding model:
```
`model = TextEmbedding(
model\_name="BAAI/bge-small-en-v1.5",
lazy\_load=True, # don't load the model until first embed call
)
`
```
FastEmbed supports [distributing the workload across multiple GPU devices](https://qdrant.github.io/fastembed/examples/FastEmbed_GPU/). To enable this:
* Install `fastembed-gpu`.
* Set `cuda` to `True` to enable GPU acceleration.
* Configure `device\_ids` with a list of GPU device IDs to assign workers to. For example, `device\_ids=[0, 1]` assigns workers to GPUs 0 and 1. If not specified, FastEmbed will assign all workers to the default GPU device.
```
`model = TextEmbedding(
model\_name="BAAI/bge-small-en-v1.5",
lazy\_load=True, # don't load the model until first embed call
cuda=True, # enable GPU acceleration
device\_ids=[0, 1], # spread workers across GPUs 0 and 1
)
`
```
When generating embeddings, set the batch size with `batch\_size` and the number of workers with `parallel`:
```
`embeddings = list(model.embed(docs, batch\_size=256, parallel=4))
`
```
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/fastembed/fastembed-optimize.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/fastembed/fastembed-optimize/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/fastembed/fastembed-optimize.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)