How Kakao Built an AI-Powered Internal Service Desk with Qdrant
0
# How Kakao Built an AI-Powered Internal Service Desk with Qdrant
David Koh - Kakao Connectivity Platform
&#183;
January 27, 2026
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* How Kakao Built an AI-Powered Internal Service Desk with Qdrant
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-kakao/&amp;text=How Kakao Built an AI-Powered Internal Service Desk with Qdrant>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-kakao/)
[Kakao](https://www.kakaocorp.com/) is one of South Korea&rsquo;s leading technology companies, best known for KakaoTalk, the country&rsquo;s dominant messaging platform with over 48 million monthly active users. Beyond messaging, Kakao operates a broad ecosystem of services including maps, mobility, fintech, and enterprise solutions.
## Helping employees find answers faster without sacrificing precision or control
Kakao’s Connectivity Platform team set out to solve a familiar internal problem: employees across the organization needed a faster, more reliable way to get answers about internal systems, APIs, and operational procedures. The result was **Service Desk Agent**, an AI-powered internal service desk designed to answer questions in natural language using Kakao’s internal documentation and historical inquiry data.
Built as a Retrieval-Augmented Generation (RAG) system on top of LangGraph, Service Desk Agent acts as a conversational interface to Kakao’s internal knowledge. This helps employees resolve issues quickly, while reducing repetitive work for their support staff.
## The challenge: searching complex internal knowledge at scale
From the beginning, the team faced a search problem that couldn’t be solved with a single retrieval approach.
Service Desk Agent needed to work across two very different types of data:
1. Long-form technical documentation, including project guides and API specifications, where understanding context matters. But, exact system names and proper nouns still need to be matched.
2. Historical Q&A and incident data, which often includes precise error messages, commands, and configuration details.
Pure keyword search struggled with semantic questions. Pure vector search struggled with exact terms and proper nouns. Neither approach alone was sufficient.
At the same time, Kakao had strict infrastructure and operational requirements. All data needed to remain within internal infrastructure, the system had to be deployable on Kubernetes, and the solution needed a permissive open-source license with strong official documentation for operations like upgrades, backup, and recovery.
This was a greenfield project; Kakao wasn’t replacing an existing vector database. Instead, the team evaluated several options, including Milvus, Weaviate, Qdrant, and Elasticsearch, to determine the best foundation for RAG-based internal AI services.
## Why Kakao chose Qdrant
After evaluating multiple vector databases, the Connectivity Platform team selected Qdrant as their first vector search solution.
The decision came down to a combination of search quality, performance, and operational fit.
Qdrant’s hybrid search capabilities were a key factor. By supporting both dense vectors for semantic search and sparse vectors for keyword-based retrieval—combined using [Reciprocal Rank Fusion (RRF)](https://qdrant.tech/documentation/search/hybrid-queries/#reciprocal-rank-fusion-rrf), the team could address both conceptual questions and exact-match queries in a single system. Named Vectors made it possible to manage multiple vector types within the same collection.
Performance was another major consideration. Qdrant’s [Rust-based architecture](https://qdrant.tech/articles/why-rust/), efficient [HNSW implementation](https://qdrant.tech/course/essentials/day-2/what-is-hnsw/), and support for [scalar quantization (INT8)](https://qdrant.tech/documentation/manage-data/quantization/#scalar-quantization) provided low-latency search while optimizing memory usage. This was crucial for an internal service expected to scale over time.
From an operational standpoint, Qdrant fit naturally into Kakao’s environment. Its single-binary design simplified deployment, it ran reliably on Kubernetes, and it allowed Kakao to retain full control over data by self-hosting within internal infrastructure.
Finally, the team highlighted the developer experience: a well-designed Python SDK with async support, an intuitive Web UI for debugging and exploration, and detailed official documentation covering both usage and performance tuning.
## How Service Desk Agent uses Qdrant
Qdrant sits at the core of Service Desk Agent’s RAG architecture, acting as the system’s primary vector store.
The team integrated Qdrant using the asynchronous Python client (`AsyncQdrantClient`) to handle high query concurrency, with secure HTTPS communication for all data access.
Collections were designed around data sources, with separate collections for internal technical documentation, historical inquiry data, and a semantic cache used to speed up repeated queries. Metadata filtering allows the system to narrow search scope by service or time period, while maintaining fast response times.
Each collection stores both dense and sparse vectors using [Named Vectors](https://qdrant.tech/documentation/manage-data/vectors/#named-vectors). Hybrid search results are merged using RRF to produce more accurate answers across different query types.
An automated indexing pipeline handles document ingestion end-to-end. This ranges from cleansing and chunking, to embedding generation, to batch upserts into Qdrant.
The entire system runs on Kakao’s internal Kubernetes cluster, using a replication-based Qdrant setup for high availability and rolling updates for zero-downtime deployments. The system integrates with distributed locking and state management solutions within the broader application architecture.
## The result: faster answers, lower support load
Today, Service Desk Agent supports approximately 1 million vectors, with the dataset continuing to grow as more internal knowledge is indexed. The system operates across multiple collections and uses 3072-dimensional embeddings from OpenAI’s model.
By combining hybrid search, metadata filtering, and semantic caching, the team was able to improve both search quality and response times. Scalar quantization reduced memory usage, while tuned HNSW parameters helped maintain low latency under load.
From a business perspective, the impact has been clear:
* Reduced workload for support staff, as more inquiries are resolved automatically before tickets are created.
* Improved employee satisfaction, with faster, self-service access to internal knowledge.
* Higher development productivity, enabled by Qdrant’s SDK, documentation, and ease of integration during rapid prototyping.
Before Service Desk Agent, employees searched across multiple internal knowledge bases manually; a process that could take several minutes depending on query complexity. Now, end-to-end response time averages under 30 seconds, from query submission to complete answer delivery.
## What’s next
Kakao plans to continue expanding Service Desk Agent by indexing more of its internal knowledge base. The team is also exploring deeper GraphRAG integration, potential multimodal search capabilities, and sharding strategies to support future scale and performance needs.
Within the Connectivity Platform team, Qdrant has become the foundation for RAG-based internal AI services. It provides the hybrid search, flexibility, and operational stability required to support AI-driven knowledge access at scale.
*This post authored by David Koh — Kakao Connectivity Platform*
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!