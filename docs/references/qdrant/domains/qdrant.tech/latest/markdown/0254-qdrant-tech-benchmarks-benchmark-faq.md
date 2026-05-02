Benchmarks F.A.Q. - Qdrant
# Benchmarks F.A.Q.
#####
January 01, 0001
* [Home](https://qdrant.tech/)
* /
* [Benchmarks](https://qdrant.tech/benchmarks/)
* /
* Benchmarks F.A.Q.
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
Share this article
[
](<https://twitter.com/intent/tweet?url=https://qdrant.tech/benchmarks/benchmark-faq/&amp;text=Benchmarks F.A.Q.>)[](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/benchmarks/benchmark-faq/)
Up!