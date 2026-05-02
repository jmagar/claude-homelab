Filtered search benchmark - Qdrant
# Filtered search benchmark
#####
February 13, 2023
* [Home](https://qdrant.tech/)
* /
* [Benchmarks](https://qdrant.tech/benchmarks/)
* /
* Filtered search benchmark
# Filtered search benchmark
Applying filters to search results brings a whole new level of complexity.
It is no longer enough to apply one algorithm to plain data. With filtering, it becomes a matter of the *cross-integration* of the different indices.
To measure how well different search engines perform in this scenario, we have prepared a set of **Filtered ANN Benchmark Datasets** -
[https://github.com/qdrant/ann-filtering-benchmark-datasets](https://github.com/qdrant/ann-filtering-benchmark-datasets)
It is similar to the ones used in the [ann-benchmarks project](https://github.com/erikbern/ann-benchmarks/) but enriched with payload metadata and pre-generated filtering requests. It includes synthetic and real-world datasets with various filters, from keywords to geo-spatial queries.
### Why filtering is not trivial?
Not many ANN algorithms are compatible with filtering.
HNSW is one of the few of them, but search engines approach its integration in different ways:
* Some use **post-filtering**, which applies filters after ANN search. It doesn&rsquo;t scale well as it either loses results or requires many candidates on the first stage.
* Others use **pre-filtering**, which requires a binary mask of the whole dataset to be passed into the ANN algorithm. It is also not scalable, as the mask size grows linearly with the dataset size.
On top of it, there is also a problem with search accuracy.
It appears if too many vectors are filtered out, so the HNSW graph becomes disconnected.
Qdrant uses a different approach, not requiring pre- or post-filtering while addressing the accuracy problem.
Read more about the Qdrant approach in our [Filterable HNSW](https://qdrant.tech/articles/filterable-hnsw/) article.
Share this article
[
](<https://twitter.com/intent/tweet?url=https://qdrant.tech/benchmarks/filtered-search-intro/&amp;text=Filtered search benchmark>)[](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/benchmarks/filtered-search-intro/)
Up!