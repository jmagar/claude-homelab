How vector search should be benchmarked? - Qdrant
# How vector search should be benchmarked?
#####
January 01, 0001
* [Home](https://qdrant.tech/)
* /
* [Benchmarks](https://qdrant.tech/benchmarks/)
* /
* How vector search should be benchmarked?
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
Share this article
[
](<https://twitter.com/intent/tweet?url=https://qdrant.tech/benchmarks/benchmarks-intro/&amp;text=How vector search should be benchmarked?>)[](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/benchmarks/benchmarks-intro/)
Up!