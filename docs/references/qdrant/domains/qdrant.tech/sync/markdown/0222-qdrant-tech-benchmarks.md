Vector Search Benchmarks - Qdrant
# Vector Search Benchmarks
#####
# Benchmarking Vector Search
At Qdrant, performance is the top-most priority. We always make sure that we use system resources efficiently so you get the **fastest and most accurate results at the cheapest cloud costs**. So all of our decisions from [choosing Rust](https://qdrant.tech/articles/why-rust/), [io optimisations](https://qdrant.tech/articles/io_uring/), [serverless support](https://qdrant.tech/articles/serverless/), [binary quantization](https://qdrant.tech/articles/binary-quantization/), to our [fastembed library](https://qdrant.tech/articles/fastembed/) are all based on our principle. In this article, we will compare how Qdrant performs against the other vector search engines.
Here are the principles we followed while designing these benchmarks:
* We do comparative benchmarks, which means we focus on **relative numbers** rather than absolute numbers.
* We use affordable hardware, so that you can reproduce the results easily.
* We run benchmarks on the same exact machines to avoid any possible hardware bias.
* All the benchmarks are [open-sourced](https://github.com/qdrant/vector-db-benchmark), so you can contribute and improve them.Scenarios we tested
1. Upload & Search benchmark on single node [Benchmark](https://qdrant.tech/benchmarks/single-node-speed-benchmark/)
2. Filtered search benchmark - [Benchmark](https://qdrant.tech/benchmarks/#filtered-search-benchmark)
3. Memory consumption benchmark - Coming soon
4. Cluster mode benchmark - Coming soon
Some of our experiment design decisions are described in the [F.A.Q Section](https://qdrant.tech/benchmarks/#benchmarks-faq).
Reach out to us on our [Discord channel](https://qdrant.to/discord) if you want to discuss anything related Qdrant or these benchmarks.
## Single node benchmarks
We benchmarked several vector search engines using various configurations of them on different datasets to check how the results may vary. Those datasets may have different vector dimensionality but also vary in terms of the distance function being used. We also tried to capture the difference we can expect while using some different configuration parameters, for both the engine itself and the search operation separately.</br></br>**Updated: January/June 2024**
Dataset:
Search threads:
Plot values:
RPS
Latency
p95 latency
Index time
*Download raw data: [here](https://qdrant.tech/benchmarks/results-1-100-thread-2024-06-15.json)*
## Observations
Most of the engines have improved since [our last run](https://qdrant.tech/benchmarks/single-node-speed-benchmark-2022/). Both life and software have trade-offs but some clearly do better:
* **`Qdrant` achieves highest RPS and lowest latencies in almost all the scenarios, no matter the precision threshold and the metric we choose.** It has also shown 4x RPS gains on one of the datasets.
* `Elasticsearch` has become considerably fast for many cases but it&rsquo;s very slow in terms of indexing time. It can be 10x slower when storing 10M+ vectors of 96 dimensions! (32mins vs 5.5 hrs)
* `Milvus` is the fastest when it comes to indexing time and maintains good precision. However, it&rsquo;s not on-par with others when it comes to RPS or latency when you have higher dimension embeddings or more number of vectors.
* `Redis` is able to achieve good RPS but mostly for lower precision. It also achieved low latency with single thread, however its latency goes up quickly with more parallel requests. Part of this speed gain comes from their custom protocol.
* `Weaviate` has improved the least since our last run.## How to read the results
* Choose the dataset and the metric you want to check.
* Select a precision threshold that would be satisfactory for your usecase. This is important because ANN search is all about trading precision for speed. This means in any vector search benchmark, **two results must be compared only when you have similar precision**. However most benchmarks miss this critical aspect.
* The table is sorted by the value of the selected metric (RPS / Latency / p95 latency / Index time), and the first entry is always the winner of the category 🏆### Latency vs RPS
In our benchmark we test two main search usage scenarios that arise in practice.
* **Requests-per-Second (RPS)**: Serve more requests per second in exchange of individual requests taking longer (i.e. higher latency). This is a typical scenario for a web application, where multiple users are searching at the same time.
To simulate this scenario, we run client requests in parallel with multiple threads and measure how many requests the engine can handle per second.
* **Latency**: React quickly to individual requests rather than serving more requests in parallel. This is a typical scenario for applications where server response time is critical. Self-driving cars, manufacturing robots, and other real-time systems are good examples of such applications.
To simulate this scenario, we run client in a single thread and measure how long each request takes.### Tested datasets
Our [benchmark tool](https://github.com/qdrant/vector-db-benchmark) is inspired by [github.com/erikbern/ann-benchmarks](https://github.com/erikbern/ann-benchmarks/). We used the following datasets to test the performance of the engines on ANN Search tasks:
|Datasets|# Vectors|Dimensions|Distance|
|[dbpedia-openai-1M-angular](https://huggingface.co/datasets/KShivendu/dbpedia-entities-openai-1M)|1M|1536|cosine|
|[deep-image-96-angular](http://sites.skoltech.ru/compvision/noimi/)|10M|96|cosine|
|[gist-960-euclidean](http://corpus-texmex.irisa.fr/)|1M|960|euclidean|
|[glove-100-angular](https://nlp.stanford.edu/projects/glove/)|1.2M|100|cosine|
### Setup
Benchmarks configuration
* This was our setup for this experiment:
* Client: 8 vcpus, 16 GiB memory, 64GiB storage (`Standard D8ls v5` on Azure Cloud)
* Server: 8 vcpus, 32 GiB memory, 64GiB storage (`Standard D8s v3` on Azure Cloud)
* The Python client uploads data to the server, waits for all required indexes to be constructed, and then performs searches with configured number of threads. We repeat this process with different configurations for each engine, and then select the best one for a given precision.
* We ran all the engines in docker and limited their memory to 25GB. This was used to ensure fairness by avoiding the case of some engine configs being too greedy with RAM usage. This 25 GB limit is completely fair because even to serve the largest `dbpedia-openai-1M-1536-angular` dataset, one hardly needs `1M \* 1536 \* 4bytes \* 1.5 = 8.6GB` of RAM (including vectors + index). Hence, we decided to provide all the engines with \~3x the requirement.
Please note that some of the configs of some engines crashed on some datasets because of the 25 GB memory limit. That&rsquo;s why you might see fewer points for some engines on choosing higher precision thresholds.
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
##
**Updated: Feb 2023**
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
# Benchmarks F.A.Q.
## Are we biased?
Probably, yes. Even if we try to be objective, we are not experts in using all the existing vector search engines.
We build Qdrant and know the most about it.
Due to that, we could have missed some important tweaks in different vector search engines.
However, we tried our best, kept scrolling the docs up and down, experimented with combinations of different configurations, and gave all of them an equal chance to stand out. If you believe you can do it better than us, our **benchmarks are fully [open-sourced](https://github.com/qdrant/vector-db-benchmark), and contributions are welcome**!
## What do we measure?
There are several factors considered while deciding on which database to use.
Of course, some of them support a different subset of functionalities, and those might be a key factor to make the decision.
But in general, we all care about the search precision, speed, and resources required to achieve it.
There is one important thing - **the speed of the vector search engines should to be compared only if they achieve the same precision**. Otherwise, they could maximize the speed factors by providing inaccurate results, which everybody would rather avoid. Thus, our benchmark results are compared only at a specific search precision threshold.
## How we select hardware?
In our experiments, we are not focusing on the absolute values of the metrics but rather on a relative comparison of different engines.
What is important is the fact we used the same machine for all the tests.
It was just wiped off between launching different engines.
We selected an average machine, which you can easily rent from almost any cloud provider. No extra quota or custom configuration is required.
## Why you are not comparing with FAISS or Annoy?
Libraries like FAISS provide a great tool to do experiments with vector search. But they are far away from real usage in production environments.
If you are using FAISS in production, in the best case, you never need to update it in real-time. In the worst case, you have to create your custom wrapper around it to support CRUD, high availability, horizontal scalability, concurrent access, and so on.
Some vector search engines even use FAISS under the hood, but a search engine is much more than just an indexing algorithm.
We do, however, use the same benchmark datasets as the famous [ann-benchmarks project](https://github.com/erikbern/ann-benchmarks), so you can align your expectations for any practical reasons.
### Why we decided to test with the Python client
There is no consensus when it comes to the best technology to run benchmarks. You’re free to choose Go, Java or Rust-based systems. But there are two main reasons for us to use Python for this:
1. While generating embeddings you&rsquo;re most likely going to use Python and python based ML frameworks.
2. Based on GitHub stars, python clients are one of the most popular clients across all the engines.
From the user’s perspective, the crucial thing is the latency perceived while using a specific library - in most cases a Python client.
Nobody can and even should redefine the whole technology stack, just because of using a specific search tool.
That’s why we decided to focus primarily on official Python libraries, provided by the database authors.
Those may use some different protocols under the hood, but at the end of the day, we do not care how the data is transferred, as long as it ends up in the target location.
## What about closed-source SaaS platforms?
There are some vector search engines available as SaaS only so that we couldn’t test them on the same machine as the rest of the systems.
That makes the comparison unfair. That’s why we purely focused on testing the Open Source vector search engines, so everybody may reproduce the benchmarks easily.
This is not the final list, and we’ll continue benchmarking as many different engines as possible.
## How to reproduce the benchmark?
The source code is available on [Github](https://github.com/qdrant/vector-db-benchmark) and has a `README.md` file describing the process of running the benchmark for a specific engine.
## How to contribute?
We made the benchmark Open Source because we believe that it has to be transparent. We could have misconfigured one of the engines or just done it inefficiently. If you feel like you could help us out, check out our [benchmark repository](https://github.com/qdrant/vector-db-benchmark).
Up!