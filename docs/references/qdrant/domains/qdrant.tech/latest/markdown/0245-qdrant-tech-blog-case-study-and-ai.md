How &AI scaled global legal retrieval with Qdrant
0
# How &AI scaled global legal retrieval with Qdrant
Daniel Azoulai
&#183;
July 15, 2025
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* How &AI scaled global legal retrieval with Qdrant
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-and-ai/&amp;text=How &amp;AI scaled global legal retrieval with Qdrant>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-and-ai/)
## How &AI scaled global patent retrieval with Qdrant
[&AI](https://tryandai.com/) is on a mission to redefine patent litigation. Their platform helps legal professionals invalidate patents through intelligent prior art search, claim charting, and automated litigation support. To make this work at scale, CTO and co-founder Herbie Turner needed a vector database that could power fast, accurate retrieval across billions of documents without ballooning DevOps complexity. That’s where Qdrant came in.
## Legal tech’s toughest retrieval challenge
Patent litigation is a high-stakes game. When a company is sued for patent infringement, the best defense is often to invalidate the patent altogether. That means proving the idea was disclosed publicly before the patent was granted. Finding that “prior art” requires sifting through vast, multilingual document corpora with domain-specific technical language.
Traditionally, this is done through outsourced search firms or attorneys running boolean queries across multiple databases. It’s time-consuming, expensive, and heavily reliant on human intuition. Turner and co-founder Caleb Harris saw an opportunity to use modern AI tooling and large language models (LLMs) to reframe the problem.
&ldquo;Instead of generating legal text, which attorneys rightly distrust, we focused everything around retrieval,&rdquo; said Turner. &ldquo;If we can ground our results in real documents, hallucination risk is minimized.&rdquo;
## A retrieval-first legal AI stack
From the start, &AI framed patent invalidation and charting as semantic retrieval problems. Using OpenAI’s embedding models, they transformed structured and unstructured patent data into dense vector representations.
*&AI&rsquo;s retrieval architecture stack*
But the scale was immense. Their full corpus includes hundreds of millions of documents from international patent offices and other sources, resulting in more than 250 billion tokens. Ingesting, embedding, and searching this volume of data demanded a robust, cloud-native vector search solution.
&ldquo;We needed to scale to a number of vectors that just hadn’t been benchmarked publicly,&rdquo; said Turner. &ldquo;Qdrant was the only one that handled that load out of the box — and without needing dedicated DevOps engineers.&rdquo;
Turner had used Qdrant in a prior startup, where he appreciated the high performance and strong Rust-based architecture. But it was Qdrant’s [opinionated documentation](https://qdrant.tech/documentation/) and built-in developer tools that sealed the deal.
*“I’m all for opinionated docs,” said Turner. “Don’t make me figure out how to optimize everything myself. Qdrant tells you the right way to do things; it just works.”*
— Herbie Turner, CTO & Co-Founder, &AI
## From noisy PDFs to structured vectors
To support global scale, &AI used [Reducto](https://reducto.ai), an AI-based PDF parsing service optimized for accuracy, to process patent data spanning decades and jurisdictions. The resulting structured data was transformed into dense vectors via OpenAI’s embedding API, then indexed in Qdrant.
Patent formats change over time and across regions, so even cleaning and standardizing the data posed challenges. &AI built a preprocessing pipeline that included OCR, normalization, metadata extraction, and payload structuring.
They chose [scalar quantization](https://qdrant.tech/articles/scalar-quantization/) in Qdrant to speed up retrieval while maintaining high accuracy. Initial experiments with binary quantization revealed too much recall degradation, forcing &AI to retrieve tens of thousands of candidates just to hit their quality bar. Scalar was the sweet spot.
## Semantics over generation
Rather than rely on LLMs to generate legal output, &AI framed its tasks as retrieval problems. Everything, prior art search, invalidity charts, claim comparisons, was treated as a ranking and grounding problem.
&ldquo;We do an initial broad search to get candidates, then use metadata filtering, claim construction analysis, and context-specific re-ranking to refine results,&rdquo; said Turner.
Qdrant’s filterable HNSW, payload field indexing, and support for multi-tenancy made this possible. Public patent search operates globally, while firm-specific legal data is stored in isolated tenant spaces.
&ldquo;Having multi-tenancy built-in was huge,&rdquo; Turner said. &ldquo;It let us give firms strong guarantees around data privacy without spinning up separate infrastructure.&rdquo;
## Scaling infrastructure, not headcount
By using [Qdrant Cloud](https://qdrant.tech/cloud/), &AI avoided the need to manage DevOps or self-host massive vector clusters. Even after scaling to over 1 billion vectors, Qdrant’s managed infrastructure delivered fast search and low memory usage.
&ldquo;Patent litigation has huge stakes, one result could influence a billion-dollar case,&rdquo; said Turner. &ldquo;Accuracy is the top priority, and Qdrant let us optimize for that without compromising on cost or performance.&rdquo;
Qdrant’s support for [payload filters](https://qdrant.tech/documentation/search/filtering/), [multitenancy](https://qdrant.tech/documentation/manage-data/multitenancy/), and quantization let &AI optimize deeply. Their AI patent agent, Andy, uses natural language to guide attorneys through patent analysis tasks, drastically cutting time-to-result.
*&ldquo;With Qdrant, we scaled to a billion vectors and still respond in sub-second latency. That lets us power workflows that used to take hours in just a few minutes.&rdquo;*
## Unlocking new markets and workflows
&AI’s ability to search across the global patent corpus opened doors to new jurisdictions and legal use cases. It also gave them the confidence to offer strong guarantees to clients: yes, we’re looking at *everything*.
Their semantic-first retrieval engine also enabled new products, like real-time invalidity checks and interactive claim visualization. With data grounded, structured, and indexed in Qdrant, the team continues to build fast.
## Looking ahead
&AI is already working on the next version of Andy, expanding natural language capabilities and increasing automation in patent workflows. With Qdrant&rsquo;s upcoming inference capabilities and support for hybrid and multimodal search, Turner sees room for deeper integration.
&ldquo;We want to stay at the application layer. If Qdrant can keep lifting the infrastructure complexity off our plate, we’re happy to keep building on it.&rdquo;
As legal AI matures, &AI’s retrieval-first approach — and Qdrant’s infrastructure support — are helping bring clarity and trust to one of the most high-stakes domains in AI.
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!