Qdrant Fundamentals
* [Documentation](https://qdrant.tech/documentation/)
*
* [FAQ](https://qdrant.tech/documentation/faq/)
*
* Qdrant Fundamentals# Frequently Asked Questions: General Topics
||||||
|[Vectors](https://qdrant.tech/documentation/faq/qdrant-fundamentals/#vectors)|[Search](https://qdrant.tech/documentation/faq/qdrant-fundamentals/#search)|[Collections](https://qdrant.tech/documentation/faq/qdrant-fundamentals/#collections)|[Compatibility](https://qdrant.tech/documentation/faq/qdrant-fundamentals/#compatibility)|[Cloud](https://qdrant.tech/documentation/faq/qdrant-fundamentals/#cloud)|
## Vectors
### What is the maximum vector dimension supported by Qdrant?
In dense vectors, Qdrant supports up to 65,535 dimensions.
### What is the maximum size of vector metadata that can be stored?
There is no inherent limitation on metadata size, but it should be [optimized for performance and resource usage](https://qdrant.tech/documentation/ops-optimization/optimize/). Users can set upper limits in the configuration.
### Can the same similarity search query yield different results on different machines?
Yes, due to differences in hardware configurations and parallel processing, results may vary slightly.
### How do I choose the right vector embeddings for my use case?
This depends on the nature of your data and the specific application. Consider factors like dimensionality, domain-specific models, and the performance characteristics of different embeddings.
### How does Qdrant handle different vector embeddings from various providers in the same collection?
Qdrant natively [supports multiple vectors per data point](https://qdrant.tech/documentation/manage-data/vectors/#multivectors), allowing different embeddings from various providers to coexist within the same collection.
### Can I migrate my embeddings from another vector store to Qdrant?
Yes, Qdrant supports migration of embeddings from other vector stores, facilitating easy transitions and adoption of Qdrant’s features.
### Why the amount of indexed vectors doesn&rsquo;t match the amount of vectors in the collection?
Qdrant doesn&rsquo;t always need to index all vectors in the collection.
It stores data is segments, and if the segment is small enough, it is more efficient to perform a full-scan search on it.
Make sure to check that the collection status is `green` and that the number of unindexed vectors smaller than indexing threshold.
### Why collection info shows inaccurate number of points?
Collection info API in Qdrant returns an approximate number of points in the collection.
If you need an exact number, you can use the [count](https://qdrant.tech/documentation/manage-data/points/#counting-points) API.
### Vectors in the collection don&rsquo;t match what I uploaded.
There are two possible reasons for this:
* You used the `Cosine` distance metric in the [collection settings](https://qdrant.tech/documentation/manage-data/collections/#collections). In this case, Qdrant pre-normalizes your vectors for faster distance computation. If you strictly need the original vectors to be preserved, consider using the `Dot` distance metric instead.
* You used the `uint8` [datatype](https://qdrant.tech/documentation/manage-data/vectors/#datatypes) to store vectors. `uint8` requires a special format for input values, which might not be compatible with the typical output of embedding models.## Search
### How does Qdrant handle real-time data updates and search?
Qdrant supports live updates for vector data, with newly inserted, updated and deleted vectors available for immediate search. The system uses full-scan search on unindexed segments during background index updates.
### My search results contain vectors with null values. Why?
By default, Qdrant tries to minimize network traffic and doesn&rsquo;t return vectors in search results.
But you can force Qdrant to do so by setting the `with\_vector` parameter of the Search/Scroll to `true`.
If you&rsquo;re still seeing `"vector": null` in your results, it might be that the vector you&rsquo;re passing is not in the correct format, or there&rsquo;s an issue with how you&rsquo;re calling the upsert method.
### How can I search without a vector?
You are likely looking for the [scroll](https://qdrant.tech/documentation/manage-data/points/#scroll-points) method. It allows you to retrieve the records based on filters or even iterate over all the records in the collection.
### Does Qdrant support a full-text search or a hybrid search?
Qdrant is a vector search engine in the first place, and we only implement full-text support as long as it doesn&rsquo;t compromise the vector search use case.
That includes both the interface and the performance.
What Qdrant can do:
* Search with full-text filters
* Apply full-text filters to the vector search (i.e., perform vector search among the records with specific words or phrases)
* Do prefix search and semantic [search-as-you-type](https://qdrant.tech/articles/search-as-you-type/)
* Sparse vectors, as used in [SPLADE](https://github.com/naver/splade) or similar models
* [Multi-vectors](https://qdrant.tech/documentation/manage-data/vectors/#multivectors), for example ColBERT and other late-interaction models
* Combination of the [multiple searches](https://qdrant.tech/documentation/search/hybrid-queries/)
What Qdrant doesn&rsquo;t plan to support:
* Non-vector-based retrieval or ranking functions
* Built-in ontologies or knowledge graphs
* Query analyzers and other NLP tools
Of course, you can always combine Qdrant with any specialized tool you need, including full-text search engines.
Read more about [our approach](https://qdrant.tech/articles/hybrid-search/) to hybrid search.
## Collections
### How many collections can I create?
As many as you want, but be aware that each collection requires additional resources.
It is *highly* recommended not to create many small collections, as it will lead to significant resource consumption overhead.
We consider creating a collection for each user/dialog/document as an antipattern.
Please read more about collections, isolation, and multiple users in our [Multitenancy](https://qdrant.tech/documentation/manage-data/collections/#multitenancy) tutorial.
### How do I upload a large number of vectors into a Qdrant collection?
Read about our recommendations in the [bulk upload](https://qdrant.tech/documentation/tutorials-develop/bulk-upload/) tutorial.
### Can I only store quantized vectors and discard full precision vectors?
No, Qdrant requires full precision vectors for operations like reindexing, rescoring, etc.
## Compatibility
### Is Qdrant compatible with CPUs or GPUs for vector computation?
Qdrant primarily relies on CPU acceleration for scalability and efficiency. However, we also support GPU-accelerated indexing on all major vendors.
### Do you guarantee compatibility across versions?
In case your version is older, we only guarantee compatibility between two consecutive minor versions. This also applies to client versions. Ensure your client version is never more than one minor version away from your cluster version.
While we will assist with break/fix troubleshooting of issues and errors specific to our products, Qdrant is not accountable for reviewing, writing (or rewriting), or debugging custom code.
### Do you support downgrades?
We do not support downgrading a cluster on any of our products. If you deploy a newer version of Qdrant, your
data is automatically migrated to the newer storage format. This migration is not reversible.
### How do I avoid issues when updating to the latest version?
We only guarantee compatibility if you update between consecutive versions. You would need to upgrade versions one at a time: `1.1 -\> 1.2`, then `1.2 -\> 1.3`, then `1.3 -\> 1.4`.
### Should I create payload indexes before or after uploading?
Create payload indexes before uploading to avoid index rebuilding. However, there are scenarios where defining idexes after uploading is okay. For example, you can configure a new filter logic after launch.
You should always index first if you know your filters upfront. If you need to index another payload later, you can still do it, but be aware of the performance hit.
## Should I create one Qdrant collection per user?
No. Creating one collection per user is more resource intensive.
Instead of creating separate collections for each user, we recommend creating a [single collection](https://qdrant.tech/documentation/manage-data/multitenancy/) and separate access using payloads. Each Qdrant point can have a payload as metadata. For multitenancy, you can include a `user\_id` or `tenant\_id` for each point. To optimize storage further, you can enable [tenant indexing](https://qdrant.tech/documentation/manage-data/indexing/#tenant-index) for payload fields.
## Cloud
### Is it possible to scale down a Qdrant Cloud cluster?
Yes, it is possible to both vertically and horizontally scale down a Qdrant Cloud cluster.
Note, that during the vertical scaling down, the disk size cannot be reduced.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/faq/qdrant-fundamentals.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/faq/qdrant-fundamentals/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/faq/qdrant-fundamentals.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)