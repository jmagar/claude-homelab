How Bazaarvoice scaled AI-powered product insights with Qdrant
0
# How Bazaarvoice scaled AI-powered product insights with Qdrant
Daniel Azoulai
&#183;
February 10, 2026
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* How Bazaarvoice scaled AI-powered product insights with Qdrant
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-bazaarvoice/&amp;text=How Bazaarvoice scaled AI-powered product insights with Qdrant>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-bazaarvoice/)
## Turning billions of reviews into real-time, actionable intelligence
Bazaarvoice powers ratings and reviews across the global ecommerce ecosystem, connecting brands, retailers, and consumers through authentic product feedback. From brand-owned storefronts to major retailers, Bazaarvoice sources, verifies, and amplifies reviews at a scale few companies ever reach.
As large language models (LLMs) became production-ready, Bazaarvoice saw an opportunity to enhance the experiences of their clients&rsquo; shoppers. The company wanted to help shoppers ask questions directly on product detail pages using natural language and help brands extract meaningful insights from vast volumes of unstructured customer feedback.
Delivering those experiences required a new foundation. Bazaarvoice needed vector search that could scale to billions of embeddings, support strict tenant isolation, and enable flexible query patterns. That requirement ultimately led the team to Qdrant.
## The challenge: Vector search at scale without operational overload
Bazaarvoice’s core data set is dominated by text reviews, with some images and videos layered in. What makes this data uniquely challenging is not only its size, but its structure. Reviews are syndicated across brands and retailers, meaning a single product can accumulate feedback from many different sources.
This created two fundamental constraints: First, the system had to scale to billions of vectors while remaining cost-efficient. Second, queries had to be scoped dynamically. Most searches are limited to a specific client, product, or category. Searching the entire corpus every time would waste compute, memory, and time.
To move quickly, Bazaarvoice initially implemented vector search using PostgreSQL with the pgvector extension. While this allowed the team to ship early versions of AI-powered features, it was never intended as a long-term solution.
> “We only did Postgres to get a product out the door quickly. We knew when we did it, it was not the right long-term choice.”
> — Dr. Lou Kratz, Senior Principal Engineer, Bazaarvoice
As usage grew, the drawbacks became unavoidable. Every new client or product required manual partition creation. Cross-product queries forced Postgres to iterate across thousands of partitions, causing query latency to spike. At the same time, storage and RAM requirements climbed into the multi-terabyte range.
Bazaarvoice needed to build a vector search that could handle selective search at scale without forcing the team to engineer and maintain a parallel partitioning system.
## Why Bazaarvoice chose Qdrant
The team evaluated several approaches, including traditional search engines and other vector databases, but ruled out systems that relied on global approximate nearest neighbor search followed by post-filtering.
With over a billion vectors, post-filtering meant searching far more data than necessary.
> “Why would we search a billion vectors when we only need to search ten thousand?”
> — Dr. Lou Kratz, Senior Principal Engineer, Bazaarvoice
Qdrant stood out for a few key reasons:
* [Multitenancy](https://qdrant.tech/documentation/manage-data/multitenancy/) with payload-based partitioning, allowing searches to be scoped by client, product, or category at query time
* [Quantization](https://qdrant.tech/documentation/manage-data/quantization/), enabling dramatic reductions in storage and RAM requirements which translates directly to cost
* [Hybrid cloud deployment](https://qdrant.tech/hybrid-cloud/), running inside Bazaarvoice’s VPC on Kubernetes
* Operational simplicity, eliminating manual partition management entirely
From the outset, the team defined clear success criteria: sub-100 millisecond query latency, approximately 98 percent nearest neighbor recall, and hands-off scaling as new clients and products were added continuously.
## Migrating billions of vectors under real-world constraints
The migration from PostgreSQL to Qdrant involved moving between four and five terabytes of data while continuing to ingest new reviews through streaming pipelines. At the same time, message retention limits created a narrow window to complete the migration safely.
> “We had to move about 4 to 5 TBs of data while new data kept coming in. There was a real time crunch.”
> — Abhijeet Dhupia, Senior Machine Learning Engineer, Bazaarvoice
During the migration, all data was disk-backed to avoid exhausting RAM. Despite this unoptimized configuration, teams immediately noticed performance improvements.
> “Even with everything on disk, the feedback was that it was pretty fast compared to where we were earlier.”
> — Abhijeet Dhupia, Senior Machine Learning Engineer, Bazaarvoice
Today, Bazaarvoice runs 2.7 billion review vectors in Qdrant and continues to tune the system as usage grows.
## Results: \~99% lower vector storage footprint with fast, accurate queries
The most immediate impact came from storage and infrastructure efficiency.
Bazaarvoice reduced its vector storage footprint by approximately 100x, compressing what previously required 4 to 5 terabytes in PostgreSQL down to a few hundred gigabytes in Qdrant. Quantization made it possible to keep billions of vectors accessible without the RAM requirements that full-resolution embeddings would have imposed.
> “Everyone talks about speed and accuracy. Storage is the story nobody talks about, and it’s the most important one at this scale.”
> — Dr. Lou Kratz, Senior Principal Engineer, Bazaarvoice
Performance improved at the same time. Even during migration, with disk-based collections, the system consistently delivered sub-100 millisecond query latency while maintaining approximately 98 percent nearest neighbor accuracy. That balance allowed Bazaarvoice to dramatically lower infrastructure costs without sacrificing user experience.
Just as important, Qdrant removed a major source of engineering friction. Under the previous architecture, every new client or product would have required new Postgres partitions. At full scale, this would have meant maintaining close to one million partitions.
With Qdrant’s flexible indexing, cross-product and cross-category queries now work at query time without performance degradation.
> “In Postgres, you’d end up iterating over ten thousand partitions and the query would just go kaput. That simply doesn’t happen anymore.”
> — Dr. Lou Kratz, Senior Principal Engineer, Bazaarvoice
## Unlocking New Product Development
By solving storage, cost, and operational complexity in one move, Qdrant unlocked entirely new product development at Bazaarvoice.
Within a single year, the team shipped two new AI-powered products on top of the same vector infrastructure. The AI Shopping Assistant went live in 2026, allowing shoppers to ask natural language questions directly on product pages. AI Insights, currently in prerelease, enables brands to explore sentiment and themes across entire product lines using conversational queries.
> “We’re shipping the AI products we actually bought this for now. And we’re doing it from a single place.”
> — Dr. Lou Kratz, Senior Principal Engineer, Bazaarvoice
From a developer perspective, the experience remained consistent across environments. The open-source container made local development and CI/CD straightforward, while the hybrid cloud deployment satisfied security and compliance requirements.
> “It does one thing and it does it really well. It feels simple, even though I know it’s not.”
> — Dr. Lou Kratz, Senior Principal Engineer, Bazaarvoice
## What’s next for Bazaarvoice
With Qdrant established as the central vector layer, Bazaarvoice plans to migrate additional workloads, including review summaries, into the same system. The team is also optimizing collections to further improve latency as AI-driven features move from prerelease into broader adoption.
For Bazaarvoice, the transition to Qdrant was not just a database migration. It was a structural shift that made large-scale, AI-powered commerce experiences faster to build, cheaper to run, and easier to evolve.
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!