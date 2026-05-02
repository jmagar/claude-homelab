How Dust Scaled to 5,000+ Data Sources with Qdrant
0
# How Dust Scaled to 5,000+ Data Sources with Qdrant
Daniel Azoulai
&#183;
April 29, 2025
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* How Dust Scaled to 5,000+ Data Sources with Qdrant
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-dust-v2/&amp;text=How Dust Scaled to 5,000+ Data Sources with Qdrant>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-dust-v2/)
## Inside Dust’s Vector Stack Overhaul: Scaling to 5,000+ Data Sources with Qdrant
### The Challenge: Scaling AI Infrastructure for Thousands of Data Sources
Dust, an OS for AI-native companies enabling users to build AI agents powered by actions and company knowledge, faced a set of growing technical hurdles as it scaled its operations. The company&rsquo;s core product enables users to give AI agents secure access to internal and external data resources, enabling enhanced workflows and faster access to information. However, this mission hit bottlenecks when their infrastructure began to strain under the weight of thousands of data sources and increasingly demanding user queries.
Initially, Dust employed a strategy of creating a separate vector collection per data source, which rapidly became unsustainable. As the number of data sources ballooned beyond 5,000, the platform began experiencing significant performance degradation. RAM consumption skyrocketed, and vector search performance slowed dramatically, especially as the memory-mapped vectors spilled onto disk storage. At one point, they were managing nearly a thousand collections simultaneously and processing over a million vector upsert and delete operations in a single cycle.
### Evaluation and Selection: Why Dust Chose Qdrant
The Dust team explored several popular vector databases. While each had merits, none met all of Dust’s increasingly complex needs. Some providers’ developer experience didn’t align with their workflows, and others lacked the deployment flexibility required. Dust needed a solution capable of handling multi-tenancy at scale, embedding model flexibility, efficient memory usage, and deep configurability.
Qdrant stood out thanks to its open-source Rust foundation, giving Dust the control they needed over memory, performance, and customization. Its intuitive API and strong developer community also made the integration experience more seamless. Critically, Qdrant’s design allowed Dust to consolidate their fragmented architecture—replacing thousands of individual collections with a few shared, multi-tenant ones powered by robust sharding and payload filtering.
### Implementation Highlights: Advanced Architecture with Qdrant
One of the most impactful features Dust adopted was scalar quantization. This reduced vector storage size by a factor of four, enabling the team to keep data in memory rather than falling back to slower disk storage. This shift alone led to dramatic latency improvements. Where queries in large collections once took 5 to 10 seconds, they now returned in under a second. Even in collections with over a million vectors and heavy payloads, search responses consistently clocked in well below the one-second mark.
Dust also built a custom `DustQdrantClient` to manage all vector-related operations. This client abstracted away differences between cluster versions, embedding models, and sharding logic, simplifying ongoing development. Their infrastructure runs in Google Cloud Platform, with Qdrant deployed in isolated VPCs that communicate with Dust&rsquo;s core APIs using secure authentication. The architecture is replicated across two major regions—US and EU—ensuring both high availability and compliance with data residency laws.
### Results: Faster Performance, Lower Costs, Better User Experience
The impact of Qdrant was felt immediately. Search latency was slashed from multi-second averages to sub-second responsiveness. Collections that once consumed over 30 GB of RAM were optimized to run efficiently at a quarter of that size. The shift to in-memory quantized vectors, while keeping original vectors on disk for fallback, proved to be the perfect hybrid model for balancing performance and resource usage.
These backend improvements directly translated into user-facing gains. Dust’s AI agents became more responsive and reliable. Even as customers loaded larger and more complex datasets, the system continued to deliver consistent performance. The platform’s ability to scale without degrading UX marked a turning point, empowering Dust to expand its customer base with confidence.
The move to a multi-embedding-model architecture also paid dividends. By grouping data sources by embedder, Dust enabled smoother migrations and more efficient model experimentation. Qdrant’s flexibility let them evolve their architecture without reindexing massive datasets or disrupting end-user functionality.
### Lessons Learned and Roadmap
As they scaled, Dust uncovered a critical insight: users tend to ask more structured, analytical questions when they know a database is involved—queries better suited to SQL than vector search. This prompted the team to pair Qdrant with a text-to-SQL system, blending unstructured and structured query capabilities for a more versatile agent.
Looking forward, Qdrant remains a foundational pillar of Dust’s product roadmap. They’re building multi-region sharding for more granular data residency, scaling their clusters both vertically and horizontally, and supporting newer embedding models from providers like OpenAI and Mistral. Future collections will be organized by embedder, with tenant-aware sharding and index optimizations tailored to each use case.
### A new tier of performance, scalability, and architectural flexibility
By adopting Qdrant, Dust unlocked a new tier of performance, scalability, and architectural flexibility. Their platform is now equipped to support millions of vectors, operate efficiently across regions, and deliver low-latency search, even at enterprise scale. For teams building sophisticated AI agents, Qdrant provides not just a vector database—but the infrastructure backbone to grow with confidence.
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!