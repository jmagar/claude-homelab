Kairoswealth & Qdrant: Transforming Wealth Management with AI-Driven Insights and Scalable Vector Search
0
# Kairoswealth & Qdrant: Transforming Wealth Management with AI-Driven Insights and Scalable Vector Search
Qdrant
&#183;
July 10, 2024
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* Kairoswealth & Qdrant: Transforming Wealth Management with AI-Driven Insights and Scalable Vector Search
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-kairoswealth/&amp;text=Kairoswealth & Qdrant: Transforming Wealth Management with AI-Driven Insights and Scalable Vector Search>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-kairoswealth/)
## **About Kairoswealth**
[Kairoswealth](https://kairoswealth.com/) is a comprehensive wealth management platform designed to provide users with a holistic view of their financial portfolio. The platform offers access to unique financial products and automates back-office operations through its AI assistant, Gaia.
## **Motivations for Adopting a Vector Database**
“At Kairoswealth we encountered several use cases necessitating the ability to run similarity queries on large datasets. Key applications included product recommendations and retrieval-augmented generation (RAG),” says [Vincent Teyssier](https://www.linkedin.com/in/vincent-teyssier/), Chief Technology & AI Officer at Kairoswealth. These needs drove the search for a more robust and scalable vector database solution.
## **Challenges with Previous Solutions**
“We faced several critical showstoppers with our previous vector database solution, which led us to seek an alternative,” says Teyssier. These challenges included:
* **Performance Scalability:** Significant performance degradation occurred as more data was added, despite various optimizations.
* **Robust Multi-Tenancy:** The previous solution struggled with multi-tenancy, impacting performance.
* **RAM Footprint:** High memory consumption was an issue.## **Qdrant Use Cases at Kairoswealth**
Kairoswealth leverages Qdrant for several key use cases:
* **Internal Data RAG:** Efficiently handling internal RAG use cases.
* **Financial Regulatory Reports RAG:** Managing and generating financial reports.
* **Recommendations:** Enhancing the accuracy and efficiency of recommendations with the Kairoswealth platform.
## **Why Kairoswealth Chose Qdrant**
Some of the key reasons, why Kairoswealth landed on Qdrant as the vector database of choice are:
1. **High Performance with 2.4M Vectors:** “Qdrant efficiently handled the indexing of 1.2 million vectors with 16 metadata fields each, maintaining high performance with no degradation. Similarity queries and scrolls run in less than 0.3 seconds. When we doubled the dataset to 2.4 million vectors, performance remained consistent.So we decided to double that to 2.4M vectors, and it&rsquo;s as if we were inserting our first vector!” says Teyssier.
2. **8x Memory Efficiency:** The database storage size with Qdrant was eight times smaller than the previous solution, enabling the deployment of the entire dataset on smaller instances and saving significant infrastructure costs.
3. **Embedded Capabilities:** “Beyond simple search and similarity, Qdrant hosts a bunch of very nice features around recommendation engines, adding positive and negative examples for better spacial narrowing, efficient multi-tenancy, and many more,” says Teyssier.
4. **Support and Community:** “The Qdrant team, led by Andre Zayarni, provides exceptional support and has a strong passion for data engineering,” notes Teyssier, “the team&rsquo;s commitment to open-source and their active engagement in helping users, from beginners to veterans, is highly valued by Kairoswealth.”## **Conclusion**
Kairoswealth&rsquo;s transition to Qdrant has enabled them to overcome significant challenges related to performance, scalability, and memory efficiency, while also benefiting from advanced features and robust support. This partnership positions Kairoswealth to continue innovating in the wealth management sector, leveraging the power of AI to deliver superior services to their clients.
## **Future Roadmap for Kairoswealth**
Kairoswealth is seizing the opportunity to disrupt the wealth management sector, which has traditionally been underserved by technology. For example, they are developing the Kairos Terminal, a natural language interface that translates user queries into OpenBB commands (a set of tools for financial analysis and data visualization within the OpenBB Terminal). With regards to the future of the wealth management sector, Teyssier notes that “the integration of Generative AI will automate back-office tasks such as data collation, data reconciliation, and market research. This technology will also enable wealth managers to scale their services to broader segments, including affluent clients, by automating relationship management and interactions.”
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!