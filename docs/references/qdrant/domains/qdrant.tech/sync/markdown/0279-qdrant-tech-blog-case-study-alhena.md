How Alhena AI unified its AI stack and improved ecommerce conversions with Qdrant
0
# How Alhena AI unified its AI stack and improved ecommerce conversions with Qdrant
Daniel Azoulai
&#183;
July 10, 2025
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* How Alhena AI unified its AI stack and improved ecommerce conversions with Qdrant
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-alhena/&amp;text=How Alhena AI unified its AI stack and improved ecommerce conversions with Qdrant>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-alhena/)
# How Alhena AI unified its AI stack and accelerated ecommerce outcomes with Qdrant
## Building AI agents that drive both revenue and support outcomes
[Alhena AI](https://alhena.ai/) is redefining the ecommerce experience through intelligent agents that assist customers before and after a purchase. On the front end, these agents help users find the perfect product based on nuanced preferences. On the back end, they resolve complex support queries without escalating to a human.
To deliver this experience, Alhena must combine natural language understanding, context-aware retrieval, and high-performance infrastructure. That means building agents that are not only fast and accurate, but also scalable across customers with vastly different catalogs and architectures.
## Infra challenges: fragmented vector search with mounting complexity
As Alhena began onboarding more ecommerce clients, its vector search layer started to crack under pressure. The team was juggling FAISS and Pinecone, each selected for different needs. FAISS was lightweight and easy to use for small indexes, but lacked robust filtering and scalability. Pinecone handled large indexes better but introduced latency on smaller ones and had limited support for advanced filtering or sparse embeddings.
To make this work, engineers wrote custom routing logic to decide which index to use based on the use case. They layered SQL systems on top of FAISS to simulate metadata filters. They worked around Pinecone&rsquo;s limitations with post-processing. The result was a growing tangle of complexity that slowed down customer onboarding, reduced system reliability, and constrained the product roadmap.
This complexity impacted the business. New customer deployments required time-consuming backend tuning. Larger ecommerce clients with extensive catalogs experienced delayed agent responses. And the inconsistent behavior across index types made it harder to guarantee SLAs for latency and answer quality.
## Why Alhena chose Qdrant: A single backend for all workloads
Alhena set out to find a solution that could unify its vector search layer across all clients and workloads. It needed a system that could support both small and large indexes with consistent performance, offer true hybrid search capabilities, and handle metadata filtering and boosting without extra infrastructure layers.
After a proof of concept, Alhena migrated 100 percent of its traffic to Qdrant Cloud. This consolidation allowed the team to retire FAISS, Pinecone, and Weaviate, streamlining both infrastructure and deployment workflows.
*“We replaced FAISS, Pinecone, and Weaviate with Qdrant Cloud. It simplified everything and gave us better performance across the board.”*
— Kshitiz Parashar, Founding Engineer and Vector Infra Lead, Alhena AI
## Unlocking business value through performance, flexibility, and control
The move to Qdrant brought immediate technical benefits. But more importantly, it unlocked new capabilities for Alhena’s business.
By supporting both dense and sparse embeddings in a single query, Qdrant’s hybrid search allowed agents to return more relevant results across a wider range of customer queries. This led to better product recommendations, which directly impacted conversion rates on ecommerce sites. Combined with metadata filters and real-time boosting, the agents could now tailor answers to align with a retailer&rsquo;s business priorities, such as promoting high-margin SKUs or deprioritizing out-of-stock items.
With Qdrant handling retrieval, Alhena no longer needed to customize infrastructure per client. Agents could be deployed in minutes regardless of catalog size. That translated into faster onboarding, fewer implementation blockers, and more predictable margins as the company scaled.
*“The more questions the AI can answer, the more revenue our customers make. Qdrant helps us surface better context and more accurate answers.”*
— Kshitiz Parashar
## Hitting production-grade performance targets
Latency was a critical metric for Alhena. With FAISS, vector search on catalogs with 100,000+ items went far above their latency budget. That delayed the start of agent response streaming, making the AI feel sluggish and hurting the user experience. Pinecone helped on large indexes, but introduced latency on small ones, and couldn’t handle hybrid filtering needs.
Qdrant reduced retrieval latency by up to 90% on the same datasets. That enabled Alhena to meet its internal P95 SLA from query to first token, even after accounting for hallucination detection, policy enforcement, and contextual rewriting.
*“We track every millisecond. Qdrant helped us cut vector retrieval time by 90 percent at scale. That’s what made it possible to stay under our latency SLA.”*
— Kang-Chi Ho
## Production architecture built for speed and safety
Alhena’s agent platform is composed of multiple intelligent subsystems, each with a distinct role. When a query arrives, it is rewritten contextually, evaluated for safety by a policy enforcer, and checked for hallucination risk by a fact-validation agent. These components operate in parallel, with token buffering to avoid blocking response time.
Qdrant powers the retrieval layer that feeds relevant chunks and structured knowledge into this agent pipeline. It enables fast, filtered, ranked results that serve both the semantic intent and business constraints of each ecommerce customer.
The ability to boost specific items within a vector search query has proven particularly valuable. Alhena’s clients can now promote seasonal offers or brand-prioritized items directly within their product recommendation logic, without changing upstream LLM behavior.
## **Multitenancy was key to scaling**
Multi-tenancy played a critical role in Alhena’s ability to scale while keeping operations lean. Instead of spinning up a separate collection for each customer, Alhena isolated data within shared collections, preserving tenant-level boundaries without introducing additional infrastructure complexity. This model dramatically reduced collection sprawl, simplified version control, and allowed the team to support hundreds of thousands of end customers while maintaining just a few collections.
*“Multitenancy is a feature we find highly beneficial. It allows us to scale to hundreds of thousands of customers while managing only a few collections, thereby avoiding challenges in collection management. Additionally, we benefit from searching within their own search space. For each company, we implemented a delicate version control to ensure zero downtime after a new training finishes.”*
— Kang-Chi Ho, Founding AI Engineer, Alhena AI
## Simplifying global deployment through Qdrant Cloud
Alhena serves customers in both the US and EU, and data residency is a growing concern. Before Qdrant, hosting and scaling regional instances with FAISS or Pinecone required custom Kubernetes deployments and persistent storage management. Now, with Qdrant Cloud, the team can spin up managed clusters in any region with a few clicks.
Feature upgrades are seamless. Boosting, hybrid search, and sparse-dense fusion were all integrated without breaking changes. As Alhena’s needs evolve, Qdrant’s managed infrastructure keeps pace, so there’s no more fighting the database when building new product capabilities.
*“We were live in two weeks. And when Qdrant releases something like boosting, we can start using it the same day. That kind of agility really matters.”*
— Kshitiz Parashar
## Enabling the next phase of product innovation
With a unified, high-performance vector backend in place, Alhena is now building for the future. Multimodal search is in the roadmap, allowing users to upload a photo and find visually similar products. Qdrant’s image-text embedding support makes this straightforward. The team plans to deploy a separate collection for visual embeddings without touching the core retrieval system.
*“We&rsquo;re using all of Qdrant’s capabilities: hybrid search, keyword-only fallback, boosting, filtering. And it just works, whether the catalog has 1,000 or 100,000 items.”*
— Kshitiz Parashar
## From fragmentation to focus
Migrating to Qdrant Cloud allowed Alhena to unify its vector infrastructure, improve system performance, and accelerate go-to-market motion. Engineering teams now spend less time managing complexity and more time building differentiated features. Customers get faster onboarding and better-performing AI agents. Ecommerce buyers get smarter recommendations and faster support.
Most importantly, Alhena now has a retrieval layer that scales with them, not against them.
*“Qdrant gave us sub-second hybrid search, simplified our stack, and unlocked better conversions. It’s the infrastructure foundation for our entire agent platform.”*
— Kang-Chi Ho
###
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!