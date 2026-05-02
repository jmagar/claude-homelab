Database Optimization - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [FAQ](https://qdrant.tech/documentation/faq/)
*
* Database Optimization# Frequently Asked Questions: Database Optimization
### How do I reduce memory usage?
The primary source of memory usage is vector data. There are several ways to address that:
* Configure [Quantization](https://qdrant.tech/documentation/manage-data/quantization/) to reduce the memory usage of vectors.
* Configure on-disk vector storage
The choice of the approach depends on your requirements.
Read more about [configuring the optimal](https://qdrant.tech/documentation/ops-optimization/optimize/) use of Qdrant.
### How do you choose the machine configuration?
There are two main scenarios of Qdrant usage in terms of resource consumption:
* **Performance-optimized** &ndash; when you need to serve vector search as fast (many) as possible. In this case, you need to have as much vector data in RAM as possible. Use our [calculator](https://cloud.qdrant.io/calculator) to estimate the required RAM.
* **Storage-optimized** &ndash; when you need to store many vectors and minimize costs by compromising some search speed. In this case, pay attention to the disk speed instead. More about it in the article about [Memory Consumption](https://qdrant.tech/articles/memory-consumption/).### I configured on-disk vector storage, but memory usage is still high. Why?
Firstly, memory usage metrics as reported by `top` or `htop` may be misleading. They are not showing the minimal amount of memory required to run the service.
If the RSS memory usage is 10 GB, it doesn&rsquo;t mean that it won&rsquo;t work on a machine with 8 GB of RAM.
Qdrant uses many techniques to reduce search latency, including caching disk data in RAM and preloading data from disk to RAM.
As a result, the Qdrant process might use more memory than the minimum required to run the service.
> Unused RAM is wasted RAM
If you want to limit the memory usage of the service, we recommend using [limits in Docker](https://docs.docker.com/config/containers/resource_constraints/#memory) or Kubernetes.
### My requests are very slow or time out. What should I do?
There are several possible reasons for that:
* **Using filters without payload index** &ndash; If you&rsquo;re performing a search with a filter but you don&rsquo;t have a payload index, Qdrant will have to load whole payload data from disk to check the filtering condition. Ensure you have adequately configured [payload indexes](https://qdrant.tech/documentation/manage-data/indexing/#payload-index).
* **Usage of on-disk vector storage with slow disks** &ndash; If you&rsquo;re using on-disk vector storage, ensure you have fast enough disks. We recommend using local SSDs with at least 50k IOPS. Read more about the influence of the disk speed on the search latency in the article about [Memory Consumption](https://qdrant.tech/articles/memory-consumption/).
* **Large limit or non-optimal query parameters** &ndash; A large limit or offset might lead to significant performance degradation. Please pay close attention to the query/collection parameters that significantly diverge from the defaults. They might be the reason for the performance issues.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/faq/database-optimization.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/faq/database-optimization/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/faq/database-optimization.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)