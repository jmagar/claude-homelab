Qdrant Edge
* [Documentation](https://qdrant.tech/documentation/)
*
* Qdrant EdgeQdrant Edge is in beta. The API and functionality may change in future releases.# What Is Qdrant Edge?
Qdrant Edge is a lightweight, embedded vector search engine for in-process retrieval with a minimal memory footprint and no background services. Qdrant Edge is designed for applications requiring low-latency vector search in environments with limited or intermittent connectivity, such as robots, kiosks, home assistants, and mobile phones.
Unlike Qdrant Server, which uses a client-server architecture, Qdrant Edge runs inside the application process. Think of it as SQLite, but for vector search. Data is stored and queried locally, ensuring low-latency access and enhanced privacy since data does not need to be transmitted to an external server. That said, Qdrant Edge provides APIs to [synchronize data with a Qdrant server](https://qdrant.tech/documentation/edge/edge-data-synchronization-patterns/). This enables you to offload heavy computations such as indexing to more powerful server instances, back up and restore data, and centrally aggregate data from multiple edge devices.
## Qdrant Edge Shard
Qdrant Edge is built around the concept of an **Edge Shard**: a self-contained storage unit that can operate independently. Each Edge Shard manages its own data, including vector and payload storage, and can perform local search and retrieval operations.
To work with a Qdrant Edge Shard, use the [Python Bindings for Qdrant Edge](https://pypi.org/project/qdrant-edge-py/) package or the [`qdrant-edge` Rust crate](https://crates.io/crates/qdrant-edge). This library provides an `EdgeShard` class with methods to manage data, query it, and restore snapshots:
* `new` (Rust) / `create` (Python): Creates a new Edge Shard at the given path with the provided configuration. Fails if the path already contains data.
* `load`: Initializes an Edge Shard by reading existing data and optionally the configuration from disk.
* `update`: Updates the data.
* `query`: Queries the data.
* `facet`: Returns the top N distinct values of a payload field, sorted by the number of points that have each value.
* `scroll`: Returns all points.
* `count`: Returns the number of points.
* `retrieve`: Retrieves points with the given IDs.
* `flush`: Flushes the data to ensure that all writes have been persisted to disk.
* `close`: Cleanly destroys the shard instance, ensuring the data is flushed (Python). The data is persisted on disk and can be used to create another shard. In Rust, use the `Drop` trait to ensure the shard is closed when it goes out of scope.
* `optimize`: Optimizes the Edge Shard by removing data marked for deletion, merging segments, and creating indexes.
* `info`: Returns metadata information about the shard.
* `unpack\_snapshot`: Unpacks a snapshot on disk.
* `snapshot\_manifest`: Returns the current shard’s snapshot manifest.
* `recover\_partial\_snapshot` (Rust) / `update\_from\_snapshot` (Python): Applies a snapshot to the shard.## Using Qdrant Edge
|Type|Guide|What you&rsquo;ll learn|
|**Beginner**|[Qdrant Edge Quickstart](https://qdrant.tech/documentation/edge/edge-quickstart/)|Get started with Qdrant Edge and learn the basics of managing and querying data|
|**Beginner**|[On-Device Embeddings](https://qdrant.tech/documentation/edge/edge-fastembed-embeddings/)|Generate vector embeddings directly on edge devices using FastEmbed|
|**Reference**|[Data Synchronization Patterns](https://qdrant.tech/documentation/edge/edge-data-synchronization-patterns/)|Overview of patterns for synchronizing data between Edge Shards and Qdrant server collections|
|**Advanced**|[Synchronize with a Server](https://qdrant.tech/documentation/edge/edge-synchronization-guide/)|Synchronize an Edge Shard with a Qdrant server collection to offload indexing and synchronize data between devices|
### More Examples
The Qdrant GitHub repository contains examples of using the Qdrant Edge API in [Python](https://github.com/qdrant/qdrant/tree/dev/lib/edge/python/examples) and [Rust](https://github.com/qdrant/qdrant/tree/dev/lib/edge/publish/examples).
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/edge/_index.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/edge/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/edge/_index.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)