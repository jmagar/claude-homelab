How GoodData turbocharged AI analytics with Qdrant
0
# How GoodData turbocharged AI analytics with Qdrant
Daniel Azoulai
&#183;
July 09, 2025
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* How GoodData turbocharged AI analytics with Qdrant
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-gooddata/&amp;text=How GoodData turbocharged AI analytics with Qdrant>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-gooddata/)
### GoodData&rsquo;s Evolution into AI-Powered Analytics
AI is redefining how people interact with data, pushing analytics platforms beyond static dashboards toward intelligent, conversational experiences. While traditionally recognized as a powerful BI platform, GoodData is laser-focused on accelerating both &rsquo;time to insight&rsquo; and &rsquo;time to solution&rsquo; by enhancing productivity for analysts and business users alike.
What sets GoodData apart is its unique position in the market: a composable, API-first platform designed for teams that build data products, not just consume them. With deep support for white-labeled analytics, embedded use cases, and governed self-service at scale, GoodData delivers the flexibility modern organizations need. With AI being integrated across every layer of the platform, GoodData is helping their over 140,000 end customers move from traditional BI to intelligent, real-time decision-making.
### Scaling AI Capabilities to Meet Enterprise Demands
Initially, GoodData’s prototype leveraging OpenAI faced scalability limitations. The initial version attempted to load GoodData’s entire semantic model into the AI context for every user query. This led to high compute costs, slow response times, and exceeded technical limits of large language models. Instead, directly embedding extensive semantic layers into LLM contexts proved costly, slow, and impractical.
Jan Soubusta, Field CTO at GoodData, recalled:
*&ldquo;Putting the whole semantic layer directly into an LLM was unsustainable. The response times ballooned, and we consistently hit context size limits.&rdquo;*
This shift in approach was essential, as most GoodData customers work with complex data models, often spanning tens or even hundreds of datasets and metrics, unlike traditional desktop BI tools, which typically support a single user working with a single dataset at any given time.
### Deploying Qdrant’s Scalable Vector Database
GoodData transitioned to a Retrieval-Augmented Generation (RAG) strategy, requiring a high-performance vector database. After exploring DuckDB and pgvector, GoodData chose Qdrant due to its high-availability architecture and superior performance.
GoodData leveraged Qdrant’s official Helm chart, deploying smoothly in Kubernetes and efficiently managing near-real-time embedding updates, crucial for multilingual semantic layers.
### Real-Time Performance and Scalability Gains
For enterprise customers embedding GoodData as whitelabeled analytics solutions, these improvements mean AI assistants can respond as quickly as a human analyst, responding with relevant metrics, dashboards, or insights in mere seconds.
And adopting Qdrant brought significant benefits to empower GoodData’s AI assistant to do this, include:
* Embedding updates completed in seconds (hundreds to thousands per minute).
* Semantic search results returned within 100 milliseconds.
* AI assistant responses are maintained at approximately 5–10 seconds, with Qdrant’s latency overhead negligible.
Jan emphasized performance efficiency:
*&ldquo;The overhead from Qdrant is negligible; queries run in tens of milliseconds, making it ideal for real-time analytics applications.&rdquo;*
### Positioned for Advanced AI Growth
This shift positions GoodData not just as a dashboard provider, but as a foundation for next-gen AI applications embedded directly into enterprise products. In the future, GoodData expects to add significant personalization via
* AI-powered data stories
* Turnkey agent-to-agent interfaces and orchestration
* GenAI- supported findops optimization
* Perceptive &ldquo;always on&rdquo; analytics.
Qdrant provides GoodData a stable, scalable foundation for expanding into document-based semantic search and ontology management. With Qdrant, GoodData confidently supports complex, real-time AI use cases, enhancing end-user accessibility and productivity.
*Architecture to enable real-time monitoring and AI-driven search capabilities in Kubernetes environment.*
### Additional resources
1. [GoodData live demo](https://www.gooddata.com/request-a-demo/)
2. [Free GoodData trial](https://registration.cloud.gooddata.com/register?_gl=1*oqcu0a*_gcl_au*MTk0NDk5NjYyOC4xNzIzNzI2Njk4)
3. [Qdrant Cloud signup](https://cloud.qdrant.io/signup)
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!