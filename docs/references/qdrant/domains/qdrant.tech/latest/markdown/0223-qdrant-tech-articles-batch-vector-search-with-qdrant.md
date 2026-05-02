Mastering Batch Search for Vector Optimization - Qdrant
* [Qdrant Articles](https://qdrant.tech/articles/)
*
* Mastering Batch Search for Vector Optimization
[
Back to
Vector Search Manuals](https://qdrant.tech/articles/vector-search-manuals/)# Mastering Batch Search for Vector Optimization
Kacper Łukawski
&#183;
September 26, 2022
# How to Optimize Vector Search Using Batch Search in Qdrant 0.10.0
The latest release of Qdrant 0.10.0 has introduced a lot of functionalities that simplify some common tasks. Those new possibilities come with some slightly modified interfaces of the client library. One of the recently introduced features is the possibility to query the collection with [multiple vectors](https://qdrant.tech/blog/storing-multiple-vectors-per-object-in-qdrant/) at once — a batch search mechanism.
There are a lot of scenarios in which you may need to perform multiple non-related tasks at the same time. Previously, you only could send several requests to Qdrant API on your own. But multiple parallel requests may cause significant network overhead and slow down the process, especially in case of poor connection speed.
Now, thanks to the new batch search, you don’t need to worry about that. Qdrant will handle multiple search requests in just one API call and will perform those requests in the most optimal way.
## An example of using batch search to optimize vector search
We’ve used the official Python client to show how the batch search might be integrated with your application. Since there have been some changes in the interfaces of Qdrant 0.10.0, we’ll go step by step.
### Step 1: Creating the collection
The first step is to create a collection with a specified configuration — at least vector size and the distance function used to measure the similarity between vectors.
```
`from qdrant\_client import QdrantClient
from qdrant\_client.conversions.common\_types import VectorParams
client = QdrantClient("localhost", 6333)
if not client.collection\_exists('test\_collection'):
client.create\_collection(
collection\_name="test\_collection",
vectors\_config=VectorParams(size=4, distance=Distance.EUCLID),
)
`
```
## Step 2: Loading the vectors
With the collection created, we can put some vectors into it. We’re going to have just a few examples.
```
`vectors = [
[.1, .0, .0, .0],
[.0, .1, .0, .0],
[.0, .0, .1, .0],
[.0, .0, .0, .1],
[.1, .0, .1, .0],
[.0, .1, .0, .1],
[.1, .1, .0, .0],
[.0, .0, .1, .1],
[.1, .1, .1, .1],
]
client.upload\_collection(
collection\_name="test\_collection",
vectors=vectors,
)
`
```
## Step 3: Batch search in a single request
Now we’re ready to start looking for similar vectors, as our collection has some entries. Let’s say we want to find the distance between the selected vector and the most similar database entry and at the same time find the two most similar objects for a different vector query. Up till 0.9, we would need to call the API twice. Now, we can send both requests together:
```
`results = client.search\_batch(
collection\_name="test\_collection",
requests=[
SearchRequest(
vector=[0., 0., 2., 0.],
limit=1,
),
SearchRequest(
vector=[0., 0., 0., 0.01],
with\_vector=True,
limit=2,
)
]
)
# Out: [
# [ScoredPoint(id=2, version=0, score=1.9,
# payload=None, vector=None)],
# [ScoredPoint(id=3, version=0, score=0.09,
# payload=None, vector=[0.0, 0.0, 0.0, 0.1]),
# ScoredPoint(id=1, version=0, score=0.10049876,
# payload=None, vector=[0.0, 0.1, 0.0, 0.0])]
# ]
`
```
Each instance of the SearchRequest class may provide its own search parameters, including vector query but also some additional filters. The response will be a list of individual results for each request. In case any of the requests is malformed, there will be an exception thrown, so either all of them pass or none of them.
And that’s it! You no longer have to handle the multiple requests on your own. Qdrant will do it under the hood.
## Batch Search Benchmarks
The batch search is fairly easy to be integrated into your application, but if you prefer to see some numbers before deciding to switch, then it’s worth comparing four different options:
1. Querying the database sequentially.
2. Using many threads/processes with individual requests.
3. Utilizing the batch search of Qdrant in a single request.
4. Combining parallel processing and batch search.
In order to do that, we’ll create a richer collection of points, with vectors from the *glove-25-angular* dataset, quite a common choice for ANN comparison. If you’re interested in seeing some more details of how we benchmarked Qdrant, let’s take a [look at the Gist](https://gist.github.com/kacperlukawski/2d12faa49e06a5080f4c35ebcb89a2a3).
## The results
We launched the benchmark 5 times on 10000 test vectors and averaged the results. Presented numbers are the mean values of all the attempts:
1. Sequential search: 225.9 seconds
2. Batch search: 208.0 seconds
3. Multiprocessing search (8 processes): 194.2 seconds
4. Multiprocessing batch search (8 processes, batch size 10): 148.9 seconds
The results you may achieve on a specific setup may vary depending on the hardware, however, at the first glance, it seems that batch searching may save you quite a lot of time.
Additional improvements could be achieved in the case of distributed deployment, as Qdrant won’t need to make extensive inter-cluster requests. Moreover, if your requests share the same filtering condition, the query optimizer would be able to reuse it among batch requests.
## Summary
Batch search allows packing different queries into a single API call and retrieving the results in a single response. If you ever struggled with sending several consecutive queries into Qdrant, then you can easily switch to the new batch search method and simplify your application code. As shown in the benchmarks, that may almost effortlessly speed up your interactions with Qdrant even by over 30%, even not considering the spare network overhead and possible reuse of filters!
Ready to unlock the potential of batch search and optimize your vector search with Qdrant 0.10.0? Contact us today to learn how we can revolutionize your search capabilities!
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/batch-vector-search-with-qdrant.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/articles/batch-vector-search-with-qdrant/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/batch-vector-search-with-qdrant.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)