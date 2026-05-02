Configure Clusters - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Managed Cloud](https://qdrant.tech/documentation/cloud/)
*
* Configure Clusters# Configure Qdrant Cloud Clusters
Qdrant Cloud offers several advanced configuration options to optimize clusters for your specific needs. You can access these options from the Cluster Details page in the Qdrant Cloud console.
The cloud platform does not expose all [configuration options](https://qdrant.tech/documentation/ops-configuration/configuration/) available in Qdrant. We have selected the relevant options that are explained in detail below.
In addition, the cloud platform automatically configures the following settings for your cluster to ensure optimal performance and reliability:
* The maximum number of collections in a cluster is set to 1000. Larger numbers of collections lead to performance degradation. For more information see [Multitenancy](https://qdrant.tech/documentation/manage-data/multitenancy/).
* To improve performance and reliability, [strict mode](https://qdrant.tech/documentation/ops-configuration/administration/#strict-mode) is activated by default for new collections, with the following restrictions:
* Retrieving points by filtering on a non indexed payload key is not allowed (`unindexed\_filtering\_retrieve` is set to `false`).
* Updating points by filtering on a non indexed payload key is not allowed (`unindexed\_filtering\_update` is set to `false`).
* The maximum number of payload indexes per collection is set to 100 (`max\_payload\_index\_count` is set to `100`).
* The cluster mode is automatically enabled to allow distributed deployments and horizontal scaling.
* The maximum amount of payload indexes per collection is set to 100. Larger numbers of payload indexes lead to performance degradation (starting with Qdrant v1.16.0).
## Collection Defaults
You can set default values for the configuration of new collections in your cluster. These defaults will be used when creating a new collection, unless you override them in the collection creation request.
You can configure the default *Replication Factor*, the default *Write Consistency Factor*, and if vectors should be stored on disk only, instead of being cached in RAM.
Refer to [Qdrant Configuration](https://qdrant.tech/documentation/ops-configuration/configuration/#configuration-options) for more details.
## Advanced Optimizations
Configuring these advanced settings will have an impact on performance and reliability. We recommend using the default values unless you are confident they are required for your use case.
*Optimizer CPU Budget*
Configures how many CPUs (threads) to allocate for optimization and indexing jobs:
* If 0 or empty (default) - Qdrant keeps one or more CPU cores unallocated from optimization jobs, depending on the number of available CPUs, optimization jobs, and traffic load.
* If negative - Qdrant subtracts this number of CPUs from the available CPUs and uses them for optimizations
* If positive - Qdrant uses this exact number of CPUs for optimizations
*Async Scorer*
Enables async scorer which uses io\_uring when rescoring. See [Qdrant under the hood: io\_uring](https://qdrant.tech/articles/io_uring/#and-what-about-qdrant) and [Large Scale Search](https://qdrant.tech/documentation/tutorials-operations/large-scale-search/) for more details.
## Client IP Restrictions
If configured, only the chosen IP ranges will be allowed to access the cluster. This is useful for securing your cluster and ensuring that only clients coming from trusted networks can connect to it.
## Restart Mode
The cloud platform will automatically choose the optimal restart mode during version upgrades or maintenance for your cluster. If you have a multi-node cluster and one or more collections with a replication factor of at least 2, the cloud platform will use the rolling restart mode. This means that nodes in the cluster will be restarted one at a time, ensuring that the cluster remains available during the restart process.
If you have a multi-node cluster, but all collections have a replication factor of 1, the cloud platform will use the parallel restart mode. This means that nodes in the cluster will be restarted simultaneously, which will result in a short downtime period, but will be faster than a rolling restart.
It is possible to override your cluster&rsquo;s default restart mode in the advanced configuration section of the Cluster Details page.
## Shard Rebalancing
When you scale your cluster horizontally, the cloud platform will automatically rebalance shards across all nodes in the cluster, ensuring that data is evenly distributed. This is done to ensure that all nodes are utilized and that the performance of the cluster is optimal.
Qdrant Cloud offers three strategies for shard rebalancing:
* `by\_count\_and\_size` (default): This strategy will rebalance the shards based on the number of shards and their size. It will ensure that all nodes have the same number of shards and that shard sizes are evenly distributed across nodes.
* `by\_count`: This strategy will rebalance the shards based on the number of shards only. It will ensure that all nodes have the same number of shards, but shard sizes may not be balanced evenly across nodes.
* `by\_size`: This strategy will rebalance the shards based on their size only. It will ensure that shards are evenly distributed across nodes by size, but the number of shards may not be even across all nodes.
You can deactivate automatic shard rebalancing by deselecting the `rebalancing\_strategy` option. This is useful if you want to manually control the shard distribution across nodes.
## Rename a Cluster
You can rename a Qdrant Cluster from the cluster&rsquo;s detail page.
Renaming a cluster does not affect its functionality or configuration. The cluster&rsquo;s unique ID and cluster URLs will remain the same.
## Adding Labels to a Cluster
You can add labels to a Qdrant Cluster from the cluster&rsquo;s detail page. Labels are key-value pairs that help you organize and manage your clusters.
## Audit Logging
You can activate audit logs for your cluster in the cluster configuration tab of the cluster details page. Audit logs provide a record of all API calls made to the cluster. This is useful for security and compliance purposes.
Audit logs are available for all paid clusters, starting with Qdrant v1.17.0; the endpoint for downloading logs is available from Qdrant v1.17.1.
The following information is tracked:
* The performed action (e.g. `list\_collections`, `create\_collection`, `upsert\_points`, etc.)
* The timestamp of the action
* The API key ID used to perform the action, or the User ID if the action was performed through the Web UI
* The result of the action (success or failure)
* The IP address from which the action was performed
You can configure the rotation (daily/hourly) and retention of your log files (how many of the log files should be kept).
Audit log files will be stored on your cluster&rsquo;s encrypted storage disk. You need to ensure that you have enough storage capacity available. Storage capacity and usage can be viewed in your cluster metrics.
You can download the audit logs from your cluster through the Qdrant API:
```
`curl -X POST 'https://node-N-YOUR-CLUSTER-URL:6333/audit/logs' \\
-H 'api-key: QDRANT\_API\_KEY' \\
-H 'Content-Type: application/json' \\
-d '{
"limit": 50,
"time\_from": "2026-03-26T00:00:00Z",
"time\_to": "2026-03-27T00:00:00Z",
"filters": {
"result": "denied",
"collection": "my\_collection"
}
}'
`
```
Or without a filter:
```
`curl -X POST 'https://node-N-YOUR-CLUSTER-URL:6333/audit/logs' \\
-H 'api-key: QDRANT\_API\_KEY' \\
-H 'Content-Type: application/json' \\
-d '{}'
`
```
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/cloud/configure-cluster.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/cloud/configure-cluster/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/cloud/configure-cluster.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)