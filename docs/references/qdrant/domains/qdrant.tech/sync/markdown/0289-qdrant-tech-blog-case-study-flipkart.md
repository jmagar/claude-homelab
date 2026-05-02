Building real-time multimodal similarity search in Flipkart Trust & Safety with Qdrant
0
# Building real-time multimodal similarity search in Flipkart Trust & Safety with Qdrant
Daniel Azoulai
&#183;
January 09, 2026
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* Building real-time multimodal similarity search in Flipkart Trust & Safety with Qdrant
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-flipkart/&amp;text=Building real-time multimodal similarity search in Flipkart Trust & Safety with Qdrant>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-flipkart/)
### Tackling fraud and abuse with scalable similarity search
At Flipkart, the Trust & Safety team is focused on detecting and preventing platform abuse and fraud. A critical part of this work involves running large-scale similarity searches across customer and seller-submitted data, particularly images. This allows the team to identify patterns associated with fraudulent activity, such as repeat returns or duplicate seller claims, before they cause downstream harm.
*“Platform integrity is a constant challenge. To stay ahead of fraudulent actors, we needed a system that could compare multimodal data in real time, not just in long-running batch jobs.”*
— Sourabh Sarkar, SDE-III, Trust & Safety at Flipkart
### Limitations of prior batch-based methods
The team’s earlier approach to similarity search used HBase with Locality-Sensitive Hashing (LSH). While workable for batch analysis, this system was slow and could not keep up with the demands of real-time fraud prevention. In some cases, finding similar images in historical data could take up to nine hours.
Additionally, Flipkart’s embedding models produce high-dimensional vectors (2048 dimensions), which added pressure on indexing performance and made efficient real-time querying more difficult.
### Evaluating open-source options and selecting Qdrant
To address these challenges, the team evaluated multiple open-source vector databases through a proof-of-concept. They chose Qdrant because it provided:
• **Deployment flexibility** with official Debian packaging, which fit well with Flipkart’s internal infrastructure
• **Efficient HNSW indexing** capable of handling simultaneous reads and writes
• **Support for high-dimensional embeddings**, critical for the models in production
### Building a multi-tenant similarity service
The Trust & Safety team then built a new multi-tenant similarity service. This platform now supports several important use cases:
• **Fraud detection:** Real-time image similarity checks to identify potentially abusive behavior
• **Address clustering:** Grouping unstructured customer addresses to improve last-mile delivery routing
• **Retrieval-augmented generation (RAG):** Serving as the retrieval layer for internal GenAI initiatives
*“What used to take hours in our old batch workflows can now be done in under a minute. That change has been crucial in stopping fraud before it impacts customers.”*
— Sourabh Sarkar, SDE-III, Trust & Safety at Flipkart
### Detection time reduced from 9 hours to 1 minute
The shift from batch processing to real-time search has significantly reduced detection time, from nine hours to under one minute. This improvement enables much earlier intervention against fraud.
From a developer perspective, integration with the Java gRPC SDK and Prometheus metrics endpoint simplified adoption and monitoring. The team also built custom adapters and backup scripts, ensuring the service could be reused by multiple teams without duplicating effort.
### Looking ahead: Expanding beyond fraud detection
The Trust & Safety team continues to broaden its capabilities. Upcoming projects include:
• Expanding retrieval use cases for company-wide RAG systems
• Standardizing on a Kubernetes-based Qdrant deployment as the embedding store across different groups at Flipkart
• Exploring integrations with agentic AI frameworks to further automate detection and prevention workflows
*“We see vector databases becoming a key part of modern AI infrastructure. It’s not only for fraud detection, but also as a foundation for new AI systems we’re experimenting with.”*
— Sourabh Sarkar, SDE-III, Trust & Safety at Flipkart
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!