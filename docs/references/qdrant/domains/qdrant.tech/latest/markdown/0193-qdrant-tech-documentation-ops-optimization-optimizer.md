Optimizer - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Optimization](https://qdrant.tech/documentation/ops-optimization/)
*
* Optimizer# Optimizer
It is much more efficient to apply changes in batches than perform each change individually, as many other databases do. Qdrant here is no exception. Since Qdrant operates with data structures that are not always easy to change, it is sometimes necessary to rebuild those structures completely.
Storage optimization in Qdrant occurs at the segment level (see [storage](https://qdrant.tech/documentation/manage-data/storage/)).
In this case, the segment to be optimized remains readable for the time of the rebuild.
The availability is achieved by wrapping the segment into a proxy that transparently handles data changes.
Changed data is placed in the copy-on-write segment, which has priority for retrieval and subsequent updates.
## Vacuum Optimizer
The simplest example of a case where you need to rebuild a segment repository is to remove points.
Like many other databases, Qdrant does not delete entries immediately after a query.
Instead, it marks records as deleted and ignores them for future queries.
This strategy allows us to minimize disk access - one of the slowest operations.
However, a side effect of this strategy is that, over time, deleted records accumulate, occupy memory and slow down the system.
To avoid these adverse effects, Vacuum Optimizer is used.
It is used if the segment has accumulated too many deleted records.
The criteria for starting the optimizer are defined in the configuration file.
Here is an example of parameter values:
```
`storage:
optimizers:
# The minimal fraction of deleted vectors in a segment, required to perform segment optimization
deleted\_threshold: 0.2
# The minimal number of vectors in a segment, required to perform segment optimization
vacuum\_min\_vector\_number: 1000
`
```
## Merge Optimizer
The service may require the creation of temporary segments.
Such segments, for example, are created as copy-on-write segments during optimization itself.
It is also essential to have at least one small segment that Qdrant will use to store frequently updated data.
On the other hand, too many small segments lead to suboptimal search performance.
The merge optimizer constantly tries to reduce the number of segments if there
currently are too many. The desired number of segments is specified
with `default\_segment\_number` and defaults to the number of CPUs. The optimizer
may takes at least the three smallest segments and merges them into one.
Segments will not be merged if they&rsquo;ll exceed the maximum configured segment
size with `max\_segment\_size\_kb`. It prevents creating segments that are too
large to efficiently index. Increasing this number may help to reduce the number
of segments if you have a lot of data, and can potentially improve search performance.
The criteria for starting the optimizer are defined in the configuration file.
Here is an example of parameter values:
```
`storage:
optimizers:
# Target amount of segments optimizer will try to keep.
# Real amount of segments may vary depending on multiple parameters:
# - Amount of stored points
# - Current write RPS
#
# It is recommended to select default number of segments as a factor of the number of search threads,
# so that each segment would be handled evenly by one of the threads.
# If `default\_segment\_number = 0`, will be automatically selected by the number of available CPUs
default\_segment\_number: 0
# Do not create segments larger this size (in KiloBytes).
# Large segments might require disproportionately long indexation times,
# therefore it makes sense to limit the size of segments.
#
# If indexation speed have more priority for your - make this parameter lower.
# If search speed is more important - make this parameter higher.
# Note: 1Kb = 1 vector of size 256
# If not set, will be automatically selected considering the number of available CPUs.
max\_segment\_size\_kb: null
`
```
## Indexing Optimizer
Qdrant allows you to choose the type of indexes and data storage methods used depending on the number of records.
So, for example, if the number of points is less than 10000, using any index would be less efficient than a brute force scan.
The Indexing Optimizer is used to implement the enabling of indexes and memmap storage when the minimal amount of records is reached.
The criteria for starting the optimizer are defined in the configuration file.
Here is an example of parameter values:
```
`storage:
optimizers:
# Maximum size (in kilobytes) of vectors to store in-memory per segment.
# Segments larger than this threshold will be stored as read-only memmaped file.
# Memmap storage is disabled by default, to enable it, set this threshold to a reasonable value.
# To disable memmap storage, set this to `0`.
# Note: 1Kb = 1 vector of size 256
memmap\_threshold: 200000
# Maximum size (in KiloBytes) of vectors allowed for plain index.
# Default value based on experiments and observations.
# Note: 1Kb = 1 vector of size 256
# To explicitly disable vector indexing, set to `0`.
# If not set, the default value will be used.
indexing\_threshold\_kb: 10000
`
```
In addition to the configuration file, you can also set optimizer parameters separately for each [collection](https://qdrant.tech/documentation/manage-data/collections/).
Dynamic parameter updates may be useful, for example, for more efficient initial loading of points. You can disable indexing during the upload process with these settings and enable it immediately after it is finished. As a result, you will not waste extra computation resources on rebuilding the index.
## Prevent Reads from Large Unindexed Segments
*Available as of v1.17.1*
`prevent\_unoptimized` is an experimental feature; its behavior may change slightly in future releases and it must be used with care.
When a collection receives a high volume of updates, for example, during nightly batch updates or when processing a large backlog of updates after a period of downtime, the optimizer might not be able to index new points fast enough to keep up. When this happens, searches may slow down as Qdrant has to scan through large amounts of unindexed data for every query.
To address this, Qdrant supports [querying indexed data only](https://qdrant.tech/documentation/search/low-latency-search/#query-indexed-data-only), by setting `indexed\_only` to `true`. A side effect of searching indexed data only is that it can cause recently updated data to temporarily disappear from search results until it is indexed again (&ldquo;blinking&rdquo; points).
To mitigate this, Qdrant supports a `prevent\_unoptimized` mode. When enabled, points written to an unindexed segment that is larger than `indexing\_threshold` are accepted and durably stored but are not visible in search results. These &ldquo;deferred&rdquo; points only become visible after the optimizer has indexed the segment.
`prevent\_unoptimized` can be enabled per collection, or globally in the configuration file.
```
`PATCH /collections/{collection\_name}
{
"optimizers\_config": {
"prevent\_unoptimized": true
}
}
`
```
```
`curl -X PATCH http://localhost:6333/collections/{collection\_name} \\
-H 'Content-Type: application/json' \\
--data-raw '{
"optimizers\_config": {
"prevent\_unoptimized": true
}
}'
`
```
```
`client.update\_collection(
collection\_name="{collection\_name}",
optimizers\_config=models.OptimizersConfigDiff(prevent\_unoptimized=True),
)
`
```
```
`client.updateCollection("{collection\_name}", {
optimizers\_config: {
prevent\_unoptimized: true,
},
});
`
```
```
`use qdrant\_client::qdrant::{OptimizersConfigDiffBuilder, UpdateCollectionBuilder};
client
.update\_collection(
UpdateCollectionBuilder::new("{collection\_name}").optimizers\_config(
OptimizersConfigDiffBuilder::default().prevent\_unoptimized(true),
),
)
.await?;
`
```
```
`import io.qdrant.client.grpc.Collections.OptimizersConfigDiff;
import io.qdrant.client.grpc.Collections.UpdateCollection;
client
.updateCollectionAsync(
UpdateCollection.newBuilder()
.setCollectionName("{collection\_name}")
.setOptimizersConfig(
OptimizersConfigDiff.newBuilder().setPreventUnoptimized(true).build())
.build())
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.UpdateCollectionAsync(
collectionName: "{collection\_name}",
optimizersConfig: new OptimizersConfigDiff { PreventUnoptimized = true }
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client.UpdateCollection(context.Background(), &qdrant.UpdateCollection{
CollectionName: "{collection\_name}",
OptimizersConfig: &qdrant.OptimizersConfigDiff{
PreventUnoptimized: qdrant.PtrOf(true),
},
})
`
```
Set the `wait` parameter to `false` on write requests when `prevent\_unoptimized` is enabled. See [Effect on `wait=true`](https://qdrant.tech/documentation/ops-optimization/optimizer/#effect-on-waittrue).
With `prevent\_unoptimized` enabled, setting `indexed\_only` to `true` is not necessary. They are mutually exclusive.
### Effect on `wait=true`
Write requests support a [`wait` parameter](https://qdrant.tech/documentation/manage-data/points/#awaiting-result) that, when set to `true`, causes the request to return only after the update has been applied and is visible for search. If `prevent\_unoptimized` is enabled, `wait` should be set to `false` to avoid potential timeouts and delays.
This is particularly important for the Python, TypeScript/JavaScript, .NET, and Java clients, that set `wait` to `true` by default. The Go and Rust clients and the REST API interface already default to `false`, so no change is needed when using those clients.
Qdrant processes updates in strict order: each update is written to the write-ahead log and then applied sequentially by the update worker, preserving this order.
Under normal conditions, setting `wait=true` on a write request returns after the update has been applied to a segment. After enabling `prevent\_unoptimized`, the response is held until every deferred point, including the current update, has been indexed and is visible for search. Depending on the volume of pending updates in the update queue and the speed of the optimizer, this can take a significant amount of time and will likely lead to timeouts on the client side. If the client times out, the update can be expected to be durably stored and eventually indexed, but the client will not receive a confirmation for that specific request.
Because the update worker must finish indexing before continuing to consume the queue, a blocked `wait=true` request also delays all subsequent updates that use `wait=true`. Updates with `wait=false` are written to the write-ahead log immediately, but they are not applied until the blocked request unblocks. This head-of-line blocking means that `wait=true` can stall the entire update pipeline for as long as indexing takes. Use it with caution when `prevent\_unoptimized` is enabled and the cluster is under heavy write load.
A consequence of enabling `prevent\_unoptimized` and setting `wait=false` is eventual consistency: updates might not be immediately visible. If your application requires a guarantee that the vector will be available for searching immediately after the API responds, you can set `wait=true`, but be aware of the implications described in this section. Alternatively, you can choose to not enable `prevent\_unoptimized`, but this may lead to slower search performance under heavy write load.
### Monitoring Deferred Points
You can check the number of deferred points in a collection via the `update\_queue` section in the response of the [collection info API](https://qdrant.tech/documentation/manage-data/collections/#collection-info). The same information is also available in [telemetry and metrics](https://qdrant.tech/documentation/ops-monitoring/monitoring/), enabling dashboards and alerting.
A non-zero deferred point count means the optimizer is processing a backlog. This is expected under heavy write load; monitor the count to confirm that it is decreasing over time.
## Optimization Monitoring
*Available as of v1.17.0*
The `/collections/{collection\_name}/optimizations` API endpoint returns information about the optimization of a specific collection, including:
* A summary of optimization activity, with the number of queued optimizations, queued segments, queued points, and idle segments (segments that need no optimization).
* Details about any currently running optimization, including:
* the specific optimizer
* its status
* the segments involved
* its progress
Optionally, you can use the `with` query parameter with one or more of the following comma-separated values to retrieve additional information:
* `queued`, to return a list of queued optimizations
* `completed`, to return a list of completed optimizations
* `idle\_segments`, to return a list of idle segments
For example:
```
`GET /collections/{collection\_name}/optimizations?with=queued,completed
`
```
### Web UI
The same information is also accessible via the **Optimizations** tab within the **Collections** interface in [the Web UI](https://qdrant.tech/documentation/web-ui/). For a specific collection, this tab provides an overview of the current optimization status and a timeline of current and past optimization cycles:
Selecting a specific optimization cycle from the timeline provides detailed information about the tasks performed during that cycle, including their durations:
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/ops-optimization/optimizer.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/ops-optimization/optimizer/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/ops-optimization/optimizer.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)