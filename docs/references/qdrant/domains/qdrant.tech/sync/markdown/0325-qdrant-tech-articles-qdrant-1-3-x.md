Introducing Qdrant 1.3.0
* [Qdrant Articles](https://qdrant.tech/articles/)
*
* Introducing Qdrant 1.3.0
[
Back to
Qdrant Articles](https://qdrant.tech/articles/)# Introducing Qdrant 1.3.0
David Sertic
&#183;
June 26, 2023
A brand-new [Qdrant 1.3.0 release](https://github.com/qdrant/qdrant/releases/tag/v1.3.0) comes packed with a plethora of new features, performance improvements and bux fixes:
1. Asynchronous I/O interface: Reduce overhead by managing I/O operations asynchronously, thus minimizing context switches.
2. Oversampling for Quantization: Improve the accuracy and performance of your queries while using Scalar or Product Quantization.
3. Grouping API lookup: Storage optimization method that lets you look for points in another collection using group ids.
4. Qdrant Web UI: A convenient dashboard to help you manage data stored in Qdrant.
5. Temp directory for Snapshots: Set a separate storage directory for temporary snapshots on a faster disk.
6. Other important changes
Your feedback is valuable to us, and are always tying to include some of your feature requests into our roadmap. Join [our Discord community](https://qdrant.to/discord) and help us build Qdrant!.
## New features
### Asynchronous I/O interface
Going forward, we will support the `io\_uring` asychnronous interface for storage devices on Linux-based systems. Since its introduction, `io\_uring` has been proven to speed up slow-disk deployments as it decouples kernel work from the IO process.
This experimental feature works on Linux kernels \> 5.4
This interface uses two ring buffers to queue and manage I/O operations asynchronously, avoiding costly context switches and reducing overhead. Unlike mmap, it frees the user threads to do computations instead of waiting for the kernel to complete.
#### Enable the interface from your config file:
```
`storage:
# enable the async scorer which uses io\_uring
async\_scorer: true
`
```
You can return to the mmap based backend by either deleting the `async\_scorer` entry or setting the value to `false`.
This optimization will mainly benefit workloads with lots of disk IO (e.g. querying on-disk collections with rescoring).
Please keep in mind that this feature is experimental and that the interface may change in further versions.
### Oversampling for quantization
We are introducing [oversampling](https://qdrant.tech/documentation/manage-data/quantization/#oversampling) as a new way to help you improve the accuracy and performance of similarity search algorithms. With this method, you are able to significantly compress high-dimensional vectors in memory and then compensate the accuracy loss by re-scoring additional points with the original vectors.
You will experience much faster performance with quantization due to parallel disk usage when reading vectors. Much better IO means that you can keep quantized vectors in RAM, so the pre-selection will be even faster. Finally, once pre-selection is done, you can use parallel IO to retrieve original vectors, which is significantly faster than traversing HNSW on slow disks.
#### Set the oversampling factor via query:
Here is how you can configure the oversampling factor - define how many extra vectors should be pre-selected using the quantized index, and then re-scored using original vectors.
```
`POST /collections/{collection\_name}/points/search
{
"params": {
"quantization": {
"ignore": false,
"rescore": true,
"oversampling": 2.4
}
},
"vector": [0.2, 0.1, 0.9, 0.7],
"limit": 100
}
`
```
```
`from qdrant\_client import QdrantClient
from qdrant\_client.http import models
client = QdrantClient("localhost", port=6333)
client.search(
collection\_name="{collection\_name}",
query\_vector=[0.2, 0.1, 0.9, 0.7],
search\_params=models.SearchParams(
quantization=models.QuantizationSearchParams(
ignore=False,
rescore=True,
oversampling=2.4
)
)
)
`
```
In this case, if `oversampling` is 2.4 and `limit` is 100, then 240 vectors will be pre-selected using quantized index, and then the top 100 points will be returned after re-scoring with the unquantized vectors.
As you can see from the example above, this parameter is set during the query. This is a flexible method that will let you tune query accuracy. While the index is not changed, you can decide how many points you want to retrieve using quantized vectors.
### Grouping API lookup
In version 1.2.0, we introduced a mechanism for requesting groups of points. Our new feature extends this functionality by giving you the option to look for points in another collection using the group ids. We wanted to add this feature, since having a single point for the shared data of the same item optimizes storage use, particularly if the payload is large.
This has the extra benefit of having a single point to update when the information shared by the points in a group changes.
For example, if you have a collection of documents, you may want to chunk them and store the points for the chunks in a separate collection, making sure that you store the point id from the document it belongs in the payload of the chunk point.
#### Adding the parameter to grouping API request:
When using the grouping API, add the `with\_lookup` parameter to bring the information from those points into each group:
```
`POST /collections/chunks/points/search/groups
{
// Same as in the regular search API
"vector": [1.1],
...,
// Grouping parameters
"group\_by": "document\_id",
"limit": 2,
"group\_size": 2,
// Lookup parameters
"with\_lookup": {
// Name of the collection to look up points in
"collection\_name": "documents",
// Options for specifying what to bring from the payload
// of the looked up point, true by default
"with\_payload": ["title", "text"],
// Options for specifying what to bring from the vector(s)
// of the looked up point, true by default
"with\_vectors: false,
}
}
`
```
```
`client.search\_groups(
collection\_name="chunks",
# Same as in the regular search() API
query\_vector=[1.1],
...,
# Grouping parameters
group\_by="document\_id", # Path of the field to group by
limit=2, # Max amount of groups
group\_size=2, # Max amount of points per group
# Lookup parameters
with\_lookup=models.WithLookup(
# Name of the collection to look up points in
collection\_name="documents",
# Options for specifying what to bring from the payload
# of the looked up point, True by default
with\_payload=["title", "text"]
# Options for specifying what to bring from the vector(s)
# of the looked up point, True by default
with\_vectors=False,
)
)
`
```
### Qdrant web user interface
We are excited to announce a more user-friendly way to organize and work with your collections inside of Qdrant. Our dashboard&rsquo;s design is simple, but very intuitive and easy to access.
Try it out now! If you have Docker running, you can [quickstart Qdrant](https://qdrant.tech/documentation/quickstart/) and access the Dashboard locally from [http://localhost:6333/dashboard](http://localhost:6333/dashboard). You should see this simple access point to Qdrant:
### Temporary directory for Snapshots
Currently, temporary snapshot files are created inside the `/storage` directory. Oftentimes `/storage` is a network-mounted disk. Therefore, we found this method suboptimal because `/storage` is limited in disk size and also because writing data to it may affect disk performance as it consumes bandwidth. This new feature allows you to specify a different directory on another disk that is faster. We expect this feature to significantly optimize cloud performance.
To change it, access `config.yaml` and set `storage.temp\_path` to another directory location.
## Important changes
The latest release focuses not only on the new features but also introduces some changes making
Qdrant even more reliable.
### Optimizing group requests
Internally, `is\_empty` was not using the index when it was called, so it had to deserialize the whole payload to see if the key had values or not. Our new update makes sure to check the index first, before confirming with the payload if it is actually `empty`/`null`, so these changes improve performance only when the negated condition is true (e.g. it improves when the field is not empty). Going forward, this will improve the way grouping API requests are handled.
### Faster read access with mmap
If you used mmap, you most likely found that segments were always created with cold caches. The first request to the database needed to request the disk, which made startup slower despite plenty of RAM being available. We have implemented a way to ask the kernel to &ldquo;heat up&rdquo; the disk cache and make initialization much faster.
The function is expected to be used on startup and after segment optimization and reloading of newly indexed segment. So far this is only implemented for &ldquo;immutable&rdquo; memmaps.
## Release notes
As usual, [our release notes](https://github.com/qdrant/qdrant/releases/tag/v1.3.0) describe all the changes
introduced in the latest version.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/qdrant-1.3.x.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/articles/qdrant-1.3.x/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/qdrant-1.3.x.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)