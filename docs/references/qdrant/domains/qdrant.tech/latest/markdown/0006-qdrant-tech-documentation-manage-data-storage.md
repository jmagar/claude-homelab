Storage - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Manage Data](https://qdrant.tech/documentation/manage-data/)
*
* Storage# Storage
All data within one collection is divided into segments.
Each segment has its independent vector and payload storage as well as indexes.
Data stored in segments usually do not overlap.
However, storing the same point in different segments will not cause problems since the search contains a deduplication mechanism.
The segments consist of vector and payload storages, vector and payload [indexes](https://qdrant.tech/documentation/manage-data/indexing/), and id mapper, which stores the relationship between internal and external ids.
A segment can be `appendable` or `non-appendable` depending on the type of storage and index used.
You can freely add, delete and query data in the `appendable` segment.
With `non-appendable` segment can only read and delete data.
The configuration of the segments in the collection can be different and independent of one another, but at least one `appendable&rsquo; segment must be present in a collection.
## Vector storage
Depending on the requirements of the application, Qdrant can use one of the data storage options.
The choice has to be made between the search speed and the size of the RAM used.
**In-memory storage** - Stores all vectors in RAM, has the highest speed since disk access is required only for persistence.
**Memmap storage** - Creates a virtual address space associated with the file on disk. [Wiki](https://en.wikipedia.org/wiki/Memory-mapped_file).
Mmapped files are not directly loaded into RAM. Instead, they use page cache to access the contents of the file.
This scheme allows flexible use of available memory. With sufficient RAM, it is almost as fast as in-memory storage.
### Configuring Memmap storage
There are two ways to configure the usage of memmap(also known as on-disk) storage:
* Set up `on\_disk` option for the vectors in the collection create API:
*Available as of v1.2.0*
```
`PUT /collections/{collection\_name}
{
"vectors": {
"size": 768,
"distance": "Cosine",
"on\_disk": true
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_collection(
collection\_name="{collection\_name}",
vectors\_config=models.VectorParams(
size=768, distance=models.Distance.COSINE, on\_disk=True
),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection\_name}", {
vectors: {
size: 768,
distance: "Cosine",
on\_disk: true,
},
});
`
```
```
`use qdrant\_client::qdrant::{CreateCollectionBuilder, Distance, VectorParamsBuilder};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.create\_collection(
CreateCollectionBuilder::new("{collection\_name}")
.vectors\_config(VectorParamsBuilder::new(768, Distance::Cosine).on\_disk(true)),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.Distance;
import io.qdrant.client.grpc.Collections.VectorParams;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createCollectionAsync(
"{collection\_name}",
VectorParams.newBuilder()
.setSize(768)
.setDistance(Distance.Cosine)
.setOnDisk(true)
.build())
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateCollectionAsync(
"{collection\_name}",
new VectorParams
{
Size = 768,
Distance = Distance.Cosine,
OnDisk = true
}
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateCollection(context.Background(), &qdrant.CreateCollection{
CollectionName: "{collection\_name}",
VectorsConfig: qdrant.NewVectorsConfig(&qdrant.VectorParams{
Size: 768,
Distance: qdrant.Distance\_Cosine,
OnDisk: qdrant.PtrOf(true),
}),
})
`
```
This will create a collection with all vectors immediately stored in memmap storage.
This is the recommended way, in case your Qdrant instance operates with fast disks and you are working with large collections.
* Set up `memmap\_threshold` option. This option will set the threshold after which the segment will be converted to memmap storage.
There are two ways to do this:
1. You can set the threshold globally in the [configuration file](https://qdrant.tech/documentation/ops-configuration/configuration/). The parameter is called `memmap\_threshold` (previously `memmap\_threshold\_kb`).
2. You can set the threshold for each collection separately during [creation](https://qdrant.tech/documentation/manage-data/collections/#create-collection) or [update](https://qdrant.tech/documentation/manage-data/collections/#update-collection-parameters).
```
`PUT /collections/{collection\_name}
{
"vectors": {
"size": 768,
"distance": "Cosine"
},
"optimizers\_config": {
"indexing\_threshold": 20000
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_collection(
collection\_name="{collection\_name}",
vectors\_config=models.VectorParams(size=768, distance=models.Distance.COSINE),
optimizers\_config=models.OptimizersConfigDiff(indexing\_threshold=20000),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection\_name}", {
vectors: {
size: 768,
distance: "Cosine",
},
optimizers\_config: {
indexing\_threshold: 20000,
},
});
`
```
```
`use qdrant\_client::qdrant::{
CreateCollectionBuilder, Distance, OptimizersConfigDiffBuilder, VectorParamsBuilder,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.create\_collection(
CreateCollectionBuilder::new("{collection\_name}")
.vectors\_config(VectorParamsBuilder::new(768, Distance::Cosine))
.optimizers\_config(OptimizersConfigDiffBuilder::default().indexing\_threshold(20000)),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.CreateCollection;
import io.qdrant.client.grpc.Collections.Distance;
import io.qdrant.client.grpc.Collections.OptimizersConfigDiff;
import io.qdrant.client.grpc.Collections.VectorParams;
import io.qdrant.client.grpc.Collections.VectorsConfig;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createCollectionAsync(
CreateCollection.newBuilder()
.setCollectionName("{collection\_name}")
.setVectorsConfig(
VectorsConfig.newBuilder()
.setParams(
VectorParams.newBuilder()
.setSize(768)
.setDistance(Distance.Cosine)
.build())
.build())
.setOptimizersConfig(
OptimizersConfigDiff.newBuilder().setIndexingThreshold(20000).build())
.build())
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateCollectionAsync(
collectionName: "{collection\_name}",
vectorsConfig: new VectorParams { Size = 768, Distance = Distance.Cosine },
optimizersConfig: new OptimizersConfigDiff { IndexingThreshold = 20000 }
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateCollection(context.Background(), &qdrant.CreateCollection{
CollectionName: "{collection\_name}",
VectorsConfig: qdrant.NewVectorsConfig(&qdrant.VectorParams{
Size: 768,
Distance: qdrant.Distance\_Cosine,
}),
OptimizersConfig: &qdrant.OptimizersConfigDiff{
IndexingThreshold: qdrant.PtrOf(uint64(20000)),
},
})
`
```
The rule of thumb to set the memmap threshold parameter is simple:
* if you have a balanced use scenario - set memmap threshold the same as `indexing\_threshold` (default is 10000). In this case the optimizer will not make any extra runs and will optimize all thresholds at once.
* if you have a high write load and low RAM - set memmap threshold lower than `indexing\_threshold` to e.g. 5000. In this case the optimizer will convert the segments to memmap storage first and will only apply indexing after that.
In addition, you can use memmap storage not only for vectors, but also for HNSW index.
To enable this, you need to set the `hnsw\_config.on\_disk` parameter to `true` during collection [creation](https://qdrant.tech/documentation/manage-data/collections/#create-a-collection) or [updating](https://qdrant.tech/documentation/manage-data/collections/#update-collection-parameters).
```
`PUT /collections/{collection\_name}
{
"vectors": {
"size": 768,
"distance": "Cosine",
"on\_disk": true
},
"hnsw\_config": {
"on\_disk": true
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_collection(
collection\_name="{collection\_name}",
vectors\_config=models.VectorParams(size=768, distance=models.Distance.COSINE, on\_disk=True),
hnsw\_config=models.HnswConfigDiff(on\_disk=True),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection\_name}", {
vectors: {
size: 768,
distance: "Cosine",
on\_disk: true,
},
hnsw\_config: {
on\_disk: true,
},
});
`
```
```
`use qdrant\_client::qdrant::{
CreateCollectionBuilder, Distance, HnswConfigDiffBuilder,
VectorParamsBuilder,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.create\_collection(
CreateCollectionBuilder::new("{collection\_name}")
.vectors\_config(VectorParamsBuilder::new(768, Distance::Cosine).on\_disk(true))
.hnsw\_config(HnswConfigDiffBuilder::default().on\_disk(true)),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.CreateCollection;
import io.qdrant.client.grpc.Collections.Distance;
import io.qdrant.client.grpc.Collections.HnswConfigDiff;
import io.qdrant.client.grpc.Collections.VectorParams;
import io.qdrant.client.grpc.Collections.VectorsConfig;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createCollectionAsync(
CreateCollection.newBuilder()
.setCollectionName("{collection\_name}")
.setVectorsConfig(
VectorsConfig.newBuilder()
.setParams(
VectorParams.newBuilder()
.setSize(768)
.setDistance(Distance.Cosine)
.setOnDisk(true)
.build())
.build())
.setHnswConfig(HnswConfigDiff.newBuilder().setOnDisk(true).build())
.build())
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateCollectionAsync(
collectionName: "{collection\_name}",
vectorsConfig: new VectorParams { Size = 768, Distance = Distance.Cosine, OnDisk = true },
hnswConfig: new HnswConfigDiff { OnDisk = true }
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateCollection(context.Background(), &qdrant.CreateCollection{
CollectionName: "{collection\_name}",
VectorsConfig: qdrant.NewVectorsConfig(&qdrant.VectorParams{
Size: 768,
Distance: qdrant.Distance\_Cosine,
OnDisk: qdrant.PtrOf(true),
}),
HnswConfig: &qdrant.HnswConfigDiff{
OnDisk: qdrant.PtrOf(true),
},
})
`
```
## Payload storage
Qdrant supports two types of payload storages: InMemory and OnDisk.
InMemory payload storage is organized in the same way as in-memory vectors.
The payload data is loaded into RAM at service startup while disk and [Gridstore](https://qdrant.tech/articles/gridstore-key-value-storage/) are used for persistence only.
This type of storage works quite fast, but it may require a lot of space to keep all the data in RAM, especially if the payload has large values attached - abstracts of text or even images.
In the case of large payload values, it might be better to use OnDisk payload storage.
This type of storage will read and write payload directly to RocksDB, so it won&rsquo;t require any significant amount of RAM to store.
The downside, however, is the access latency.
If you need to query vectors with some payload-based conditions - checking values stored on disk might take too much time.
In this scenario, we recommend creating a payload index for each field used in filtering conditions to avoid disk access.
Once you create the field index, Qdrant will preserve all values of the indexed field in RAM regardless of the payload storage type.
You can specify the desired type of payload storage with [configuration file](https://qdrant.tech/documentation/ops-configuration/configuration/) or with collection parameter `on\_disk\_payload` during [creation](https://qdrant.tech/documentation/manage-data/collections/#create-collection) of the collection.
## Versioning
To ensure data integrity, Qdrant performs all data changes in 2 stages.
In the first step, the data is written to the Write-ahead-log(WAL), which orders all operations and assigns them a sequential number.
Once a change has been added to the WAL, it will not be lost even if a power loss occurs.
Then the changes go into the segments.
Each segment stores the last version of the change applied to it as well as the version of each individual point.
If the new change has a sequential number less than the current version of the point, the updater will ignore the change.
This mechanism allows Qdrant to safely and efficiently restore the storage from the WAL in case of an abnormal shutdown.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/manage-data/storage.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/manage-data/storage/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/manage-data/storage.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)