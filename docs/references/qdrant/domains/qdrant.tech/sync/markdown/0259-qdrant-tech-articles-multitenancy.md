How to Implement Multitenancy and Custom Sharding in Qdrant
* [Qdrant Articles](https://qdrant.tech/articles/)
*
* How to Implement Multitenancy and Custom Sharding in Qdrant
[
Back to
Vector Search Manuals](https://qdrant.tech/articles/vector-search-manuals/)# How to Implement Multitenancy and Custom Sharding in Qdrant
David Myriel
&#183;
February 06, 2024
# Scaling Your Machine Learning Setup: The Power of Multitenancy and Custom Sharding in Qdrant
We are seeing the topics of [multitenancy](https://qdrant.tech/documentation/manage-data/multitenancy/) and [distributed deployment](https://qdrant.tech/documentation/distributed_deployment/#sharding) pop-up daily on our [Discord support channel](https://qdrant.to/discord). This tells us that many of you are looking to scale Qdrant along with the rest of your machine learning setup.
Whether you are building a bank fraud-detection system, [RAG](https://qdrant.tech/articles/what-is-rag-in-ai/) for e-commerce, or services for the federal government - you will need to leverage a multitenant architecture to scale your product.
In the world of SaaS and enterprise apps, this setup is the norm. It will considerably increase your application&rsquo;s performance and lower your hosting costs.
## Multitenancy & custom sharding with Qdrant
We have developed two major features just for this. **You can now scale a single Qdrant cluster and support all of your customers worldwide.** Under [multitenancy](https://qdrant.tech/documentation/manage-data/multitenancy/), each customer&rsquo;s data is completely isolated and only accessible by them. At times, if this data is location-sensitive, Qdrant also gives you the option to divide your cluster by region or other criteria that further secure your customer&rsquo;s access. This is called [custom sharding](https://qdrant.tech/documentation/distributed_deployment/#user-defined-sharding).
Combining these two will result in an efficiently-partitioned architecture that further leverages the convenience of a single Qdrant cluster. This article will briefly explain the benefits and show how you can get started using both features.
## One collection, many tenants
When working with Qdrant, you can upsert all your data to a single collection, and then partition each vector via its payload. This means that all your users are leveraging the power of a single Qdrant cluster, but their data is still isolated within the collection. Let&rsquo;s take a look at a two-tenant collection:
**Figure 1:** Each individual vector is assigned a specific payload that denotes which tenant it belongs to. This is how a large number of different tenants can share a single Qdrant collection.
Qdrant is built to excel in a single collection with a vast number of tenants. You should only create multiple collections when your data is not homogenous or if users&rsquo; vectors are created by different embedding models. Creating too many collections may result in resource overhead and cause dependencies. This can increase costs and affect overall performance.
## Sharding your database
With Qdrant, you can also specify a shard for each vector individually. This feature is useful if you want to [control where your data is kept in the cluster](https://qdrant.tech/documentation/distributed_deployment/#sharding). For example, one set of vectors can be assigned to one shard on its own node, while another set can be on a completely different node.
During vector search, your operations will be able to hit only the subset of shards they actually need. In massive-scale deployments, **this can significantly improve the performance of operations that do not require the whole collection to be scanned**.
This works in the other direction as well. Whenever you search for something, you can specify a shard or several shards and Qdrant will know where to find them. It will avoid asking all machines in your cluster for results. This will minimize overhead and maximize performance.
### Common use cases
A clear use-case for this feature is managing a multitenant collection, where each tenant (let it be a user or organization) is assumed to be segregated, so they can have their data stored in separate shards. Sharding solves the problem of region-based data placement, whereby certain data needs to be kept within specific locations. To do this, however, you will need to [move your shards between nodes](https://qdrant.tech/documentation/distributed_deployment/#moving-shards).
**Figure 2:** Users can both upsert and query shards that are relevant to them, all within the same collection. Regional sharding can help avoid cross-continental traffic.
Custom sharding also gives you precise control over other use cases. A time-based data placement means that data streams can index shards that represent latest updates. If you organize your shards by date, you can have great control over the recency of retrieved data. This is relevant for social media platforms, which greatly rely on time-sensitive data.
## Before I go any further&mldr;..how secure is my user data?
By design, Qdrant offers three levels of isolation. We initially introduced collection-based isolation, but your scaled setup has to move beyond this level. In this scenario, you will leverage payload-based isolation (from multitenancy) and resource-based isolation (from sharding). The ultimate goal is to have a single collection, where you can manipulate and customize placement of shards inside your cluster more precisely and avoid any kind of overhead. The diagram below shows the arrangement of your data within a two-tier isolation arrangement.
**Figure 3:** Users can query the collection based on two filters: the `group\_id` and the individual `shard\_key\_selector`. This gives your data two additional levels of isolation.
## Create custom shards for a single collection
When creating a collection, you will need to configure user-defined sharding. This lets you control the shard placement of your data, so that operations can hit only the subset of shards they actually need. In big clusters, this can significantly improve the performance of operations, since you won&rsquo;t need to go through the entire collection to retrieve data.
```
`client.create\_collection(
collection\_name="{tenant\_data}",
shard\_number=2,
sharding\_method=models.ShardingMethod.CUSTOM,
# ... other collection parameters
)
client.create\_shard\_key("{tenant\_data}", "canada")
client.create\_shard\_key("{tenant\_data}", "germany")
`
```
In this example, your cluster is divided between Germany and Canada. Canadian and German law differ when it comes to international data transfer. Let&rsquo;s say you are creating a RAG application that supports the healthcare industry. Your Canadian customer data will have to be clearly separated for compliance purposes from your German customer.
Even though it is part of the same collection, data from each shard is isolated from other shards and can be retrieved as such. For additional examples on shards and retrieval, consult [Distributed Deployments](https://qdrant.tech/documentation/distributed_deployment/) documentation and [Qdrant Client specification](https://python-client.qdrant.tech).
## Configure a multitenant setup for users
Let&rsquo;s continue and start adding data. As you upsert your vectors to your new collection, you can add a `group\_id` field to each vector. If you do this, Qdrant will assign each vector to its respective group.
Additionally, each vector can now be allocated to a shard. You can specify the `shard\_key\_selector` for each individual vector. In this example, you are upserting data belonging to `tenant\_1` to the Canadian region.
```
`client.upsert(
collection\_name="{tenant\_data}",
points=[
models.PointStruct(
id=1,
payload={"group\_id": "tenant\_1"},
vector=[0.9, 0.1, 0.1],
),
models.PointStruct(
id=2,
payload={"group\_id": "tenant\_1"},
vector=[0.1, 0.9, 0.1],
),
],
shard\_key\_selector="canada",
)
`
```
Keep in mind that the data for each `group\_id` is isolated. In the example below, `tenant\_1` vectors are kept separate from `tenant\_2`. The first tenant will be able to access their data in the Canadian portion of the cluster. However, as shown below `tenant\_2 `might only be able to retrieve information hosted in Germany.
```
`client.upsert(
collection\_name="{tenant\_data}",
points=[
models.PointStruct(
id=3,
payload={"group\_id": "tenant\_2"},
vector=[0.1, 0.1, 0.9],
),
],
shard\_key\_selector="germany",
)
`
```
## Retrieve data via filters
The access control setup is completed as you specify the criteria for data retrieval. When searching for vectors, you need to use a `query\_filter` along with `group\_id` to filter vectors for each user.
```
`client.search(
collection\_name="{tenant\_data}",
query\_filter=models.Filter(
must=[
models.FieldCondition(
key="group\_id",
match=models.MatchValue(
value="tenant\_1",
),
),
]
),
query\_vector=[0.1, 0.1, 0.9],
limit=10,
)
`
```
## Performance considerations
The speed of indexation may become a bottleneck if you are adding large amounts of data in this way, as each user&rsquo;s vector will be indexed into the same collection. To avoid this bottleneck, consider *bypassing the construction of a global vector index* for the entire collection and building it only for individual groups instead.
By adopting this strategy, Qdrant will index vectors for each user independently, significantly accelerating the process.
To implement this approach, you should:
1. Set `payload\_m` in the HNSW configuration to a non-zero value, such as 16.
2. Set `m` in hnsw config to 0. This will disable building global index for the whole collection.
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient("localhost", port=6333)
client.create\_collection(
collection\_name="{tenant\_data}",
vectors\_config=models.VectorParams(size=768, distance=models.Distance.COSINE),
hnsw\_config=models.HnswConfigDiff(
payload\_m=16,
m=0,
),
)
`
```
1. Create keyword payload index for `group\_id` field.
```
`client.create\_payload\_index(
collection\_name="{tenant\_data}",
field\_name="group\_id",
field\_schema=models.PayloadSchemaType.KEYWORD,
)
`
```
> Note: Keep in mind that global requests (without the
`> group_id
`> filter) will be slower since they will necessitate scanning all groups to identify the nearest neighbors.
## Explore multitenancy and custom sharding in Qdrant for scalable solutions
Qdrant is ready to support a massive-scale architecture for your machine learning project. If you want to see whether our [vector database](https://qdrant.tech/) is right for you, try the [quickstart tutorial](https://qdrant.tech/documentation/quickstart/) or read our [docs and tutorials](https://qdrant.tech/documentation/).
To spin up a free instance of Qdrant, sign up for [Qdrant Cloud](https://qdrant.to/cloud) - no strings attached.
Get support or share ideas in our [Discord](https://qdrant.to/discord) community. This is where we talk about vector search theory, publish examples and demos and discuss vector database setups.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/multitenancy.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/articles/multitenancy/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/multitenancy.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)