Single node benchmarks - Qdrant
# Single node benchmarks
#####
August 23, 2022
* [Home](https://qdrant.tech/)
* /
* [Benchmarks](https://qdrant.tech/benchmarks/)
* /
* Single node benchmarks
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
Share this article
[
](<https://twitter.com/intent/tweet?url=https://qdrant.tech/benchmarks/single-node-speed-benchmark/&amp;text=Single node benchmarks>)[](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/benchmarks/single-node-speed-benchmark/)
Up!