How GlassDollar improved high-recall sourcing by migrating from Elasticsearch to Qdrant
0
# How GlassDollar improved high-recall sourcing by migrating from Elasticsearch to Qdrant
Daniel Azoulai
&#183;
March 04, 2026
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* How GlassDollar improved high-recall sourcing by migrating from Elasticsearch to Qdrant
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-glassdollar/&amp;text=How GlassDollar improved high-recall sourcing by migrating from Elasticsearch to Qdrant>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-glassdollar/)
[GlassDollar](https://www.glassdollar.com/) helps enterprises such as Siemens, Mahle, and A2A discover, compare, and run proof-of-concepts with innovative startups. The platform combines an chatbot-like experience for discovering innovate companies with tools to manager innovation projects from start to finish.
For GlassDollar, search is not a feature. It is the core mechanism that turns an enterprise problem statement into a shortlist of relevant companies, ranked and contextualized for decision-making.
## Scaling to 10 Million Documents Pushed Search to its Limits
GlassDollar’s dataset spans a few million companies. Each company can map to multiple documents, including product descriptions and technical summaries.
Early on, the team implemented vector search with Elasticsearch using OpenAI embeddings. It was a sensible default for a full-stack team that looked for a mature ecosystem and easy-to-find resources.
As the platform grew, retrieval became a bottleneck. GlassDollar wanted to index more companies, more documents per company, and more sources of text per profile. But performance slowed as the indexed corpus expanded, and it became difficult to see a path to scaling 10x or more without compromising the user experience.
The team also found themselves carrying extra complexity. To achieve acceptable quality, they maintained keyword-based logic alongside semantic retrieval, which increased operational overhead and made iteration harder.
## The Product Evolved from Fast Search to High-Recall Sourcing
GlassDollar’s early interface looked like a familiar search box, so latency targets were strict. Over time, the product shifted closer to the real-world sourcing process enterprises already used. Users described what they needed in a sentence or a paragraph and cared most about whether the right companies appeared, even if results took longer.
That change forced a new definition of success.
Instead of optimizing around a single response time target, GlassDollar focused on retrieval quality. Recall became the guiding metric, since missing the best companies was the fastest way to lose user trust.
> “At first, we were thinking in terms of speed. Later we understood that quality comes first. We measure recall now. If the best companies are not on the screen, nothing else matters.” Kamen Kanev, GlassDollar
## Accuracy Meant End-to-end Results, not Just Retriever Scores
For GlassDollar, accuracy was measured at the workflow level: did the system surface the right companies for a given enterprise need, and did users act on the results. That meant optimizing the full architecture, including [query expansion](https://qdrant.tech/documentation/search/hybrid-queries/), retrieval, ranking, and contextual ranking, rather than chasing marginal gains in any single component. Faster retrieval mattered most because it enabled more queries to improve query expansion, which raised recall and improved the final shortlist quality.
## Contextual Embeddings Improved Matching Between User Intent and Company Descriptions
One persistent challenge was representing long company descriptions in a way that matched short, intent-driven queries. Embedding an entire document often diluted meaning and reduced match quality. In practice, the team saw that how text was sliced and embedded mattered as much as the embedding model itself.
GlassDollar adopted a contextual chunking approach inspired by recent research. Instead of embedding isolated sentences, they produced segments that preserved key context across chunks. If a company positioned itself as an automotive solution provider early in its description, that context continued to appear in subsequent embedded segments. This helped retrieval when users searched for outcomes or categories that were implied rather than explicitly listed.
## Query Expansion Raised Recall but Required Faster Vector Retrieval
To push recall higher, GlassDollar leaned into query expansion. A single user prompt could generate multiple related queries, each retrieving candidates from a different angle. Results were then combined and passed into ranking and contextual ranking stages.
This approach improved coverage, but it amplified the importance of retrieval performance. If each search was slow, query expansion became impractical. The team needed a vector search that could handle more queries per request without degrading speed or cost.
## GlassDollar Migrated from Elasticsearch to Qdrant to Scale Retrieval, Reducing Costs by 40%.
To evaluate alternatives, GlassDollar built a benchmark script with a golden dataset: a set of representative queries paired with the companies they expected to retrieve. The team tested Qdrant quickly with partial indexing and minimal configuration to validate whether recall was in the right range.
The results were close enough to their Elasticsearch baseline to justify a full migration. Once Qdrant was in production, GlassDollar saw immediate gains in retrieval speed and the ability to run more expanded queries within the same time budget. They also reduced system complexity by removing keyword-specific compensations while maintaining overall quality.
Cost improved as well. After migration, infrastructure costs dropped to roughly 60 percent of the previous setup, even before the team fully indexed all planned documents and sources.
## Node.js and TypeScript Kept the System Accessible to Full-stack Engineers
A key requirement for GlassDollar was staying productive in a Node.js and TypeScript-first environment. The team used the [Qdrant Node.js SDK](https://github.com/qdrant/qdrant-js) alongside LLM APIs to build retrieval, query expansion, and ranking workflows directly inside their existing backend services.
This mattered for hiring and velocity. It enabled engineers who already shipped product in JavaScript and TypeScript to implement modern RAG pipelines without maintaining a separate Python-only stack.
## User Engagement Rripled After Retrieval Quality Improved
GlassDollar tracked success through product behavior. One signal was how often users saved (bookmarked) companies during sourcing workflows. Before the search improvements, many users either relied on manual sourcing or browsed results without committing them into a shortlist.
After migrating to Qdrant and scaling their recall-focused retrieval strategy, save activity increased sharply. In Q1, GlassDollar saw a 3x increase in bookmarks compared to previous months, driven by more engagement from existing users rather than only new user growth.
## Next Steps Focus on Repeatable Feedback Loops for Accuracy Gains
With retrieval scalability in place, GlassDollar’s roadmap centers on continuous accuracy improvements across the full RAG architecture. They will continue optimizing query expansion strategy and improving reraking models to continually improve.
The goal remains consistent: deliver the most accurate matchmaking between corporate pain points and startups through a search built for high-recall, decision-ready results.
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!