- Qdrant
#
#####
February 13, 2023
* [Home](https://qdrant.tech/)
* /
* [Benchmarks](https://qdrant.tech/benchmarks/)
* /
*
Dataset:
Plot values:
Regular search
Filter search
*Download raw data: [here](https://qdrant.tech/benchmarks/filter-result-2023-02-03.json)*
## Filtered Results
As you can see from the charts, there are three main patterns:
* **Speed boost** - for some engines/queries, the filtered search is faster than the unfiltered one. It might happen if the filter is restrictive enough, to completely avoid the usage of the vector index.
* **Speed downturn** - some engines struggle to keep high RPS, it might be related to the requirement of building a filtering mask for the dataset, as described above.
* **Accuracy collapse** - some engines are losing accuracy dramatically under some filters. It is related to the fact that the HNSW graph becomes disconnected, and the search becomes unreliable.
Qdrant avoids all these problems and also benefits from the speed boost, as it implements an advanced [query planning strategy](https://qdrant.tech/documentation/search/#query-planning).
The Filtering Benchmark is all about changes in performance between filter and un-filtered queries. Please refer to the search benchmark for absolute speed comparison.
Share this article
[
](https://twitter.com/intent/tweet?url=https://qdrant.tech/benchmarks/filtered-search-benchmark/&amp;text=)[](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/benchmarks/filtered-search-benchmark/)
Up!