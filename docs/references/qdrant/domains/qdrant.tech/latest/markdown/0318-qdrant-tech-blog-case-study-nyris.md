Nyris & Qdrant: How Vectors are the Future of Visual Search
0
# Nyris & Qdrant: How Vectors are the Future of Visual Search
Qdrant
&#183;
September 10, 2024
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* Nyris & Qdrant: How Vectors are the Future of Visual Search
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-nyris/&amp;text=Nyris & Qdrant: How Vectors are the Future of Visual Search>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-nyris/)
## About Nyris
Founded in 2015 by CTO Markus Lukasson and his sister Anna Lukasson-Herzig, [Nyris](https://www.nyris.io/) offers advanced visual search solutions for companies, positioning itself as the &ldquo;Google Lens&rdquo; for corporate data. Their technology powers use cases such as visual search on websites of large retailers and machine manufacturing companies that require visual identification of spare parts. The primary goal is to identify items in a product catalog or spare parts as quickly as possible. With a strong foundation in e-commerce and nearly a decade of experience in vector search, Nyris is at the forefront of visual search innovation.
Beyond visual search, Nyris also provides synthetic data solutions, particularly for manufacturing and engineering sectors. Often, customers in these industries lack sufficient photos of parts to leverage visual search effectively. However, they do possess CAD files for their products. Nyris generates synthetic images from these CAD files, enabling visual search without needing actual product photos in the database.
Prominent clients such as IKEA, Trumpf (a precision laser manufacturer), and DMG Mori rely on Nyris to support their field engineers in maintaining parts.
## Overcoming Limitations in Visual Product Search
During his time at Amazon, Lukasson observed that search engines like Google often outperformed Amazon&rsquo;s search capabilities for product searches. Recognizing the need for more precise search solutions in industries like e-commerce and spare part management, he identified a significant gap: Traditional keyword-based searches often fail, especially in situations where field engineers struggle to describe parts accurately with keywords. Visual search offers a solution, providing faster and more accurate results by leveraging images, which carry significantly more information than text-based queries.
In their quest for the perfect visual search provider, Nyris ultimately decided to develop their own solution.
## The Path to Vector-Based Visual Search
Initially in 2015, the team explored traditional search algorithms based on key value SIFT (Scale Invariant Feature Transform) features to locate specific elements within images. However, they quickly realized that these methods were imprecise and unreliable. To address this, Nyris began experimenting with the first Convolutional Neural Networks (CNNs) to extract embeddings for vector search.
In the early days of vector search, there were few solutions available. Nyris initially developed their own vector search solution but later transitioned to SingleStore. At that time, SingleStore was the only option that could deliver efficient and fast brute-force vector search at scale. As Nyris&rsquo;s data grew, the need for rapid scaling became evident. They found that many standard database features, such as real-time analytics and atomicity, were unnecessary for their specific needs. Instead, what Nyris required was a solution focused on fast and efficient vector search capabilities, along with features that would enhance the search experience for their customers.
With the emergence of pure-play, native vector search engines, Nyris conducted extensive research and benchmarks. Ultimately, they chose Qdrant as their vector search engine of choice. Qdrant stood out for its accuracy, speed, and the ability to handle large datasets efficiently, meeting all of Nyris&rsquo;s requirements for a robust and scalable vector search solution.
### The Selection Process
As part of their selection process, Nyris evaluated several critical factors to ensure they chose the best vector search engine solution:
* **Accuracy and Speed**: These were primary considerations. Nyris needed to understand the performance differences between the [HNSW](https://qdrant.tech/articles/filterable-hnsw/) graph-based approach and brute-force search. In particular, they examined edge cases that required numerous filters, sometimes necessitating a switch to brute-force search. Even in these scenarios, Qdrant demonstrated impressive speed and reliability, meeting Nyris&rsquo;s stringent performance requirements.
* **Insert Speed**: Nyris assessed how quickly data could be inserted into the database, including the performance during simultaneous data ingests and query requests. Qdrant excelled in this area, providing the necessary efficiency for their operations.
* **Total Cost of Ownership**: Nyris analyzed the infrastructure costs and licensing fees associated with each solution. Qdrant offered a competitive total cost of ownership, making it an economically viable option.
* **Data Sovereignty**: The ability to deploy Qdrant in their own clusters was a key aspect for Nyris, ensuring they maintained control over their data and complied with relevant data sovereignty requirements.
* **Dedicated Vector Search Engine:** One of the key advantages of Qdrant, as Lukasson highlights, is its specialization as a dedicated, native vector search engine. &ldquo;Qdrant, being purpose-built for vector search, can introduce relevant features much faster, like [quantization](https://qdrant.tech/documentation/manage-data/quantization/), integer8 support, and float32 rescoring. These advancements make searches more precise and cost-effective without sacrificing accuracy—exactly what Nyris needs,&rdquo; said Lukasson. &ldquo;When optimizing for search accuracy and speed, compromises aren&rsquo;t an option. Just as you wouldn&rsquo;t use a truck to race in Formula 1, we needed a solution designed specifically for vector search, not just a general database with vector search tacked on. With every Qdrant release, we gain new, tailored features that directly enhance our use case.”## Key Benefits of Qdrant in Production
Nyris has found several aspects of Qdrant particularly beneficial in their production environment:
* **Enhanced Security with JWT**: [JSON Web Tokens](https://qdrant.tech/documentation/security/#granular-access-control-with-jwt) provide enhanced security and performance, critical for safeguarding their data.
* **Seamless Scalability**: Qdrant&rsquo;s ability to [scale effortlessly across nodes](https://qdrant.tech/documentation/distributed_deployment/) ensures consistent high performance, even as Nyris&rsquo;s data volume grows.
* **Flexible Search Options**: The availability of both graph-based and brute-force search methods offers Nyris the flexibility to tailor the search approach to specific use case requirements.
* **Versatile Data Handling**: Qdrant imposes almost no restrictions on data types and vector sizes, allowing Nyris to manage diverse and complex datasets effectively.
* **Built with Rust**: The use of [Rust](https://qdrant.tech/articles/why-rust/) ensures superior performance and future-proofing, while its open-source nature allows Nyris to inspect and customize the code as necessary.
* **Cost-Effective High Performance Search**: Qdrant’s efficient search capabilities ensure that Nyris can maintain high performance at a reasonable cost. With Qdrant, Nyris can search through extensive datasets efficiently, making it a crucial part of their technology stack.
By hosting Qdrant on Google Cloud within their Kubernetes Cluster, Nyris benefits from the scalability and reliability essential for their demanding operations, ensuring a robust and efficient visual search solution.
## Why Pure-Vector Search is the Future for Product Search
Nyris’s vision is to identify every single product and spare part within milliseconds, and Qdrant plays an integral role in this. When envisioning the future of product search, Lukasson is convinced that vector representations will be the key to advancing search capabilities. Unlike keyword searches, vector search can seamlessly integrate various modalities, such as text, images, as well as depth or audio. This holistic approach will transform product and spare part searches, allowing for a single vector representation that encompasses a product’s text, visual and geometric descriptions.
“While traditional algorithms like BM25 are fast and cheap and still have a place in the search stack, vectors will replace them in the coming years,&rdquo; says Lukasson. &ldquo;Today, we have separate spaces for text search, visual search, and other modalities, but we envision a future with a unified vector representation that encompasses all relevant item data. No matter what input you use for your query, the search results will be accurate. The days of scrolling through thousands of results or encountering &rsquo;no results&rsquo; pages will soon be over. Every search request will deliver the right product or spare part in milliseconds.”
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!