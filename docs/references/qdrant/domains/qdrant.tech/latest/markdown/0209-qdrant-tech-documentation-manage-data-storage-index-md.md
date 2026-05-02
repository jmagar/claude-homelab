# Storage
# Storage
All data within one collection is divided into segments.
Each segment has its independent vector and payload storage as well as indexes.
Data stored in segments usually do not overlap.
However, storing the same point in different segments will not cause problems since the search contains a deduplication mechanism.
The segments consist of vector and payload storages, vector and payload [indexes](/documentation/manage-data/indexing/index.md), and id mapper, which stores the relationship between internal and external ids.
A segment can be `appendable` or `non-appendable` depending on the type of storage and index used.
You can freely add, delete and query data in the `appendable` segment.
With `non-appendable` segment can only read and delete data.
The configuration of the segments in the collection can be different and independent of one another, but at least one `appendable' segment must be present in a collection.
## Vector storage
Depending on the requirements of the application, Qdrant can use one of the data storage options.
The choice has to be made between the search speed and the size of the RAM used.
**In-memory storage** - Stores all vectors in RAM, has the highest speed since disk access is required only for persistence.
**Memmap storage** - Creates a virtual address space associated with the file on disk. [Wiki](https://en.wikipedia.org/wiki/Memory-mapped_file).
Mmapped files are not directly loaded into RAM. Instead, they use page cache to access the contents of the file.
This scheme allows flexible use of available memory. With sufficient RAM, it is almost as fast as in-memory storage.
### Configuring Memmap storage
There are two ways to configure the usage of memmap(also known as on-disk) storage:
- Set up `on_disk` option for the vectors in the collection create API:
*Available as of v1.2.0*
```http
PUT /collections/{collection_name}
{
"vectors": {
"size": 768,
"distance": "Cosine",
"on_disk": true
}
}
```
```python
from qdrant_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create_collection(
collection_name="{collection_name}",
vectors_config=models.VectorParams(
size=768, distance=models.Distance.COSINE, on_disk=True
),
)
```
```typescript
import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection_name}", {
vectors: {
size: 768,
distance: "Cosine",
on_disk: true,
},
});
```
```rust
use qdrant_client::qdrant::{CreateCollectionBuilder, Distance, VectorParamsBuilder};
use qdrant_client::Qdrant;
let client = Qdrant::from_url("http://localhost:6334").build()?;
client
.create_collection(
CreateCollectionBuilder::new("{collection_name}")
.vectors_config(VectorParamsBuilder::new(768, Distance::Cosine).on_disk(true)),
)
.await?;
```
```java
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.Distance;
import io.qdrant.client.grpc.Collections.VectorParams;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createCollectionAsync(
"{collection_name}",
VectorParams.newBuilder()
.setSize(768)
.setDistance(Distance.Cosine)
.setOnDisk(true)
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateCollectionAsync(
"{collection_name}",
new VectorParams
{
Size = 768,
Distance = Distance.Cosine,
OnDisk = true
}
);
```
```go
import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateCollection(context.Background(), &qdrant.CreateCollection{
CollectionName: "{collection_name}",
VectorsConfig: qdrant.NewVectorsConfig(&qdrant.VectorParams{
Size: 768,
Distance: qdrant.Distance_Cosine,
OnDisk: qdrant.PtrOf(true),
}),
})
```
This will create a collection with all vectors immediately stored in memmap storage.
This is the recommended way, in case your Qdrant instance operates with fast disks and you are working with large collections.
- Set up `memmap_threshold` option. This option will set the threshold after which the segment will be converted to memmap storage.
There are two ways to do this:
1. You can set the threshold globally in the [configuration file](/documentation/ops-configuration/configuration/index.md). The parameter is called `memmap_threshold` (previously `memmap_threshold_kb`).
2. You can set the threshold for each collection separately during [creation](/documentation/manage-data/collections/index.md#create-collection) or [update](/documentation/manage-data/collections/index.md#update-collection-parameters).
```http
PUT /collections/{collection_name}
{
"vectors": {
"size": 768,
"distance": "Cosine"
},
"optimizers_config": {
"indexing_threshold": 20000
}
}
```
```python
from qdrant_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create_collection(
collection_name="{collection_name}",
vectors_config=models.VectorParams(size=768, distance=models.Distance.COSINE),
optimizers_config=models.OptimizersConfigDiff(indexing_threshold=20000),
)
```
```typescript
import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection_name}", {
vectors: {
size: 768,
distance: "Cosine",
},
optimizers_config: {
indexing_threshold: 20000,
},
});
```
```rust
use qdrant_client::qdrant::{
CreateCollectionBuilder, Distance, OptimizersConfigDiffBuilder, VectorParamsBuilder,
};
use qdrant_client::Qdrant;
let client = Qdrant::from_url("http://localhost:6334").build()?;
client
.create_collection(
CreateCollectionBuilder::new("{collection_name}")
.vectors_config(VectorParamsBuilder::new(768, Distance::Cosine))
.optimizers_config(OptimizersConfigDiffBuilder::default().indexing_threshold(20000)),
)
.await?;
```
```java
import io.qdrant.client.QdrantClient;
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
.setCollectionName("{collection_name}")
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
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateCollectionAsync(
collectionName: "{collection_name}",
vectorsConfig: new VectorParams { Size = 768, Distance = Distance.Cosine },
optimizersConfig: new OptimizersConfigDiff { IndexingThreshold = 20000 }
);
```
```go
import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateCollection(context.Background(), &qdrant.CreateCollection{
CollectionName: "{collection_name}",
VectorsConfig: qdrant.NewVectorsConfig(&qdrant.VectorParams{
Size: 768,
Distance: qdrant.Distance_Cosine,
}),
OptimizersConfig: &qdrant.OptimizersConfigDiff{
IndexingThreshold: qdrant.PtrOf(uint64(20000)),
},
})
```
The rule of thumb to set the memmap threshold parameter is simple:
- if you have a balanced use scenario - set memmap threshold the same as `indexing_threshold` (default is 10000). In this case the optimizer will not make any extra runs and will optimize all thresholds at once.
- if you have a high write load and low RAM - set memmap threshold lower than `indexing_threshold` to e.g. 5000. In this case the optimizer will convert the segments to memmap storage first and will only apply indexing after that.
In addition, you can use memmap storage not only for vectors, but also for HNSW index.
To enable this, you need to set the `hnsw_config.on_disk` parameter to `true` during collection [creation](/documentation/manage-data/collections/index.md#create-a-collection) or [updating](/documentation/manage-data/collections/index.md#update-collection-parameters).
```http
PUT /collections/{collection_name}
{
"vectors": {
"size": 768,
"distance": "Cosine",
"on_disk": true
},
"hnsw_config": {
"on_disk": true
}
}
```
```python
from qdrant_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create_collection(
collection_name="{collection_name}",
vectors_config=models.VectorParams(size=768, distance=models.Distance.COSINE, on_disk=True),
hnsw_config=models.HnswConfigDiff(on_disk=True),
)
```
```typescript
import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection_name}", {
vectors: {
size: 768,
distance: "Cosine",
on_disk: true,
},
hnsw_config: {
on_disk: true,
},
});
```
```rust
use qdrant_client::qdrant::{
CreateCollectionBuilder, Distance, HnswConfigDiffBuilder,
VectorParamsBuilder,
};
use qdrant_client::Qdrant;
let client = Qdrant::from_url("http://localhost:6334").build()?;
client
.create_collection(
CreateCollectionBuilder::new("{collection_name}")
.vectors_config(VectorParamsBuilder::new(768, Distance::Cosine).on_disk(true))
.hnsw_config(HnswConfigDiffBuilder::default().on_disk(true)),
)
.await?;
```
```java
import io.qdrant.client.QdrantClient;
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
.setCollectionName("{collection_name}")
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
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateCollectionAsync(
collectionName: "{collection_name}",
vectorsConfig: new VectorParams { Size = 768, Distance = Distance.Cosine, OnDisk = true },
hnswConfig: new HnswConfigDiff { OnDisk = true }
);
```
```go
import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client.CreateCollection(context.Background(), &qdrant.CreateCollection{
CollectionName: "{collection_name}",
VectorsConfig: qdrant.NewVectorsConfig(&qdrant.VectorParams{
Size: 768,
Distance: qdrant.Distance_Cosine,
OnDisk: qdrant.PtrOf(true),
}),
HnswConfig: &qdrant.HnswConfigDiff{
OnDisk: qdrant.PtrOf(true),
},
})
```
## Payload storage
Qdrant supports two types of payload storages: InMemory and OnDisk.
InMemory payload storage is organized in the same way as in-memory vectors.
The payload data is loaded into RAM at service startup while disk and [Gridstore](/articles/gridstore-key-value-storage/index.md) are used for persistence only.
This type of storage works quite fast, but it may require a lot of space to keep all the data in RAM, especially if the payload has large values attached - abstracts of text or even images.
In the case of large payload values, it might be better to use OnDisk payload storage.
This type of storage will read and write payload directly to RocksDB, so it won't require any significant amount of RAM to store.
The downside, however, is the access latency.
If you need to query vectors with some payload-based conditions - checking values stored on disk might take too much time.
In this scenario, we recommend creating a payload index for each field used in filtering conditions to avoid disk access.
Once you create the field index, Qdrant will preserve all values of the indexed field in RAM regardless of the payload storage type.
You can specify the desired type of payload storage with [configuration file](/documentation/ops-configuration/configuration/index.md) or with collection parameter `on_disk_payload` during [creation](/documentation/manage-data/collections/index.md#create-collection) of the collection.
## Versioning
To ensure data integrity, Qdrant performs all data changes in 2 stages.
In the first step, the data is written to the Write-ahead-log(WAL), which orders all operations and assigns them a sequential number.
Once a change has been added to the WAL, it will not be lost even if a power loss occurs.
Then the changes go into the segments.
Each segment stores the last version of the change applied to it as well as the version of each individual point.
If the new change has a sequential number less than the current version of the point, the updater will ignore the change.
This mechanism allows Qdrant to safely and efficiently restore the storage from the WAL in case of an abnormal shutdown.