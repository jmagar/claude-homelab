How FAZ unlocked 75 years of journalism with Qdrant
0
# How FAZ unlocked 75 years of journalism with Qdrant
Manuel Meyer
&#183;
July 03, 2025
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* How FAZ unlocked 75 years of journalism with Qdrant
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-faz/&amp;text=How FAZ unlocked 75 years of journalism with Qdrant>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-faz/)
# How FAZ Built a Hybrid Search Engine with Qdrant to Unlock 75 Years of Journalism
[Frankfurter Allgemeine Zeitung (FAZ)](https://www.frankfurterallgemeine.de/die-faz), a major national newspaper in Germany, has spent decades building a rich archive of journalistic content, stretching back to 1949. The FAZ archive has long built expertise in making its extensive collection of over 75 years accessible and searchable for both internal and external customers through keyword- and index-based search engines. New AI-powered search technologies were therefore immediately recognized as an opportunity to unlock the potential of the comprehensive archive in entirely new ways and to systematically address the limitations of traditional search methods. The solution they arrived at involved a thoughtful orchestration of technologies - with Qdrant at the heart.
This undertaking was driven by a cross-functional team:
* **Jens Peter Kutz**, AI project lead for the archive, spearheaded semantic search and indexing efforts.
* **Hans Peter Troetscher**, Department Head of Data Management and Applications, oversaw the system architecture and overall vision.
* **René Weber**, IT Systems Administrator, focused on the challenges of deployment and orchestration within FAZ’s Azure environment.## The Challenge: Turning an Archive into a Research Engine
FAZ’s archive includes tens of millions of articles - from modern digital content to OCR-scanned historical documents. Editors and researchers needed a way to move beyond simple keyword matching and unlock deeper insights from their archive. A new search experience would need to understand meaning, support structured filters, and operate within strict infrastructure constraints.
The team set out to build a semantic search platform as a first step. Early experiments embedded article paragraphs using Azure OpenAI’s text-embedding-3-large model, resulting in high-dimensional vector representations of content. Embedding was performed on a paragraph-by-paragraph basis to ensure relevance and granularity. The team also tested how the system performed with retro-digitized content containing OCR errors from scanned sources.
## Why Qdrant Was the Right Fit
From the outset, FAZ had specific technical and organizational needs:
* The solution had to run within their own **Azure Kubernetes Service (AKS)** environment.
* It had to support complex, schema-less **metadata payloads** for every paragraph.
* It had to support **real-time updates and deletions** for articles that are corrected or depublished.
* And it needed to offer **sub-second performance** at scale, despite constant data updates.
Qdrant checked all the boxes. Its [hybrid cloud deployment model](https://qdrant.tech/hybrid-cloud/) gave FAZ full control over infrastructure and privacy. The ability to associate each vector with rich metadata - including over 60 fields like author, date, and article type - was critical. And with native support for **scalar quantization**, HNSW indexing, and fast upserts, Qdrant could keep pace with the daily demands of a live newsroom.
The developer experience was another major win. As Jens Peter Kutz explained, &ldquo;The documentation is structured, clear, and immensely helpful - especially when ramping up on an entirely new stack.&rdquo;
## Metadata: The Backbone of Intelligent Search
One of Qdrant’s most powerful features for FAZ is its ability to handle rich metadata payloads. Each embedded paragraph is associated with fields like:
* Publication date
* Author and section
* Article type (e.g., editorial, interview)
* Word count
* Source type (e.g., print vs. online)
* Indexing metadata and extraction confidence levels
These payloads allow users to filter results by time range, author, section, or even article length. FAZ built a UI that lets users apply these filters manually - or have them inferred from natural language prompts by GPT-4.
Qdrant&rsquo;s ability to handle over 60 payload fields and frequent updates is crucial for FAZ&rsquo;s workflow, as articles need to be continuously updated and sometimes removed, particularly with online content being more dynamic than print articles. The system needs to manage daily updates as new content is published and existing articles are modified.
Additionally, FAZ enriches the user experience by retrieving adjacent context vectors, such as preceding and following paragraphs, to generate fluent and explainable answers. This context stitching is dynamically computed during query time.
## Performance at Scale
The current system indexes over 14 million vectors across several decades, with a target of 40-50 million vectors covering the full archive. Ingest operations occur daily, as new publications are embedded and indexed. FAZ uses quantization to optimize memory usage and maximize throughput across search and update pipelines.
Benchmarking results during internal testing showed that Qdrant consistently delivered **\<1s response times** on full-archive similarity search - despite applying complex payload filters and returning rich, annotated metadata with each result.
Custom ingestion scripts in Python integrate with OpenAI’s embedding service and Qdrant’s API, handling everything from embedding to payload assembly and indexing.
## A Foundation for AI-Driven Journalism
FAZ has built a powerful search system that makes over seven decades of journalism accessible and relevant for modern editorial workflows. By combining Azure OpenAI’s semantic embeddings with Qdrant’s metadata-aware vector search, they’ve developed a hybrid solution that understands both language and structure. The system delivers fast, relevant results with highlighted context and similarity scores, enabling journalists to explore their archive more intuitively than ever before.
With millions of vectors already indexed and ongoing plans to scale across the full archive, FAZ is not only setting a new benchmark for archival search, but also laying the groundwork for next-generation capabilities that will further enhance precision, flexibility, and editorial control.
## What’s Next: Building Toward Hybrid Search
The initial system focuses on dense vector similarity to support natural language queries. A user might ask, “Why is inflation rising?” and receive answer passages pulled from semantically relevant articles across decades of FAZ journalism. This semantic-first approach was intentional. The FAZ team chose to first build a search engine in its purest semantic form to better understand its capabilities, advantages, and limits.
As the team gained experience with the semantic search engine, they began to see opportunities to expand its capabilities. While dense vector retrieval works well for exploratory and abstract queries, future enhancements by the team will focus on supporting workflows that involve searching for exact names, dates, or publication references. These use cases present a clear opportunity to complement semantic search with keyword-based retrieval and structured filtering, bringing greater precision and control to the platform.
To address these needs, FAZ is now planning the next stage of its platform: a hybrid search architecture that combines the strengths of both semantic and symbolic retrieval.
The new system combines:
* **Dense vector embeddings** for broad semantic understanding
* **Sparse vectors (e.g. BM25-like)** using Qdrant’s native support for hybrid search
* **Structured metadata filtering** (authors, sections, date ranges)
* **Query interpretation via GPT-4** for automatic filter setting and query routing
&ldquo;We’re not just building a search tool - we’re building a search interpreter. And Qdrant is a central node in that architecture.&rdquo;, said Hans Peter Troetscher
This direction promises to give journalists and researchers a search experience that combines semantic understanding with precise control, supporting both intuitive exploration and exact retrieval across decades of content.
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!