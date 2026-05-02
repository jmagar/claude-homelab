Bulk Operations - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Develop & Implement](https://qdrant.tech/documentation/tutorials-develop/)
*
* Bulk Operations# Bulk Upload Vectors to a Qdrant Collection
|Time: 20 min|Level: Intermediate|
Uploading a large-scale dataset fast might be a challenge, but Qdrant has a few tricks to help you with that.
The first important detail about data uploading is that the bottleneck is usually located on the client side, not on the server side.
This means that if you are uploading a large dataset, you should prefer a high-performance client library.
We recommend using our [Rust client library](https://github.com/qdrant/rust-client) for this purpose, as it is the fastest client library available for Qdrant.
If you are not using Rust, you might want to consider parallelizing your upload process.
## Choose an Indexing Strategy
Qdrant incrementally builds an HNSW index for dense vectors as new data arrives. This ensures fast search, but indexing is memory- and CPU-intensive. During bulk ingestion, frequent index updates can reduce throughput and increase resource usage.
To control this behavior and optimize for your system’s limits, adjust the following parameters:
|Your Goal|What to Do|Configuration|
|Fastest upload, tolerate high RAM usage|Disable indexing completely|`indexing\_threshold: 0`|
|Low memory usage during upload|Defer HNSW graph construction (recommended)|`m: 0`|
|Faster index availability after upload|Keep indexing enabled (default behavior)|`m: 16`, `indexing\_threshold: 10000`*(default)*|
Indexing must be re-enabled after upload to activate fast HNSW search if it was disabled during ingestion.
### Defer HNSW graph construction (`m: 0`)
For dense vectors, setting the HNSW `m` parameter to `0` disables index building entirely. Vectors will still be stored, but not indexed until you enable indexing later.
```
`PUT /collections/{collection\_name}
{
"vectors": {
"size": 768,
"distance": "Cosine"
},
"hnsw\_config": {
"m": 0
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
hnsw\_config=models.HnswConfigDiff(
m=0,
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
},
hnsw\_config: {
m: 0,
},
});
`
```
```
`use qdrant\_client::qdrant::{
CreateCollectionBuilder, Distance, HnswConfigDiffBuilder, VectorParamsBuilder,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.create\_collection(
CreateCollectionBuilder::new("{collection\_name}")
.vectors\_config(VectorParamsBuilder::new(768, Distance::Cosine))
.hnsw\_config(HnswConfigDiffBuilder::default().m(0)),
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
.build())
.build())
.setHnswConfig(HnswConfigDiff.newBuilder().setM(0).build())
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
hnswConfig: new HnswConfigDiff { M = 0 }
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
HnswConfig: &qdrant.HnswConfigDiff{
M: qdrant.PtrOf(uint64(0)),
},
})
`
```
Once ingestion is complete, re-enable HNSW by setting `m` to your production value (usually 16 or 32).
```
`PATCH /collections/{collection\_name}
{
"vectors": {
"size": 768,
"distance": "Cosine"
},
"hnsw\_config": {
"m": 16
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.update\_collection(
collection\_name="{collection\_name}",
vectors\_config=models.VectorParams(size=768, distance=models.Distance.COSINE),
hnsw\_config=models.HnswConfigDiff(
m=16,
),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.updateCollection("{collection\_name}", {
vectors: {
size: 768,
distance: "Cosine",
},
hnsw\_config: {
m: 16,
},
});
`
```
```
`use qdrant\_client::qdrant::{
UpdateCollectionBuilder, HnswConfigDiffBuilder,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.update\_collection(
UpdateCollectionBuilder::new("{collection\_name}")
.hnsw\_config(HnswConfigDiffBuilder::default().m(16)),
)
.await?;
`
```
```
`import io.qdrant.client.grpc.Collections.UpdateCollection;
import io.qdrant.client.grpc.Collections.HnswConfigDiff;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client.updateCollectionAsync(
UpdateCollection.newBuilder()
.setCollectionName("{collection\_name}")
.setHnswConfig(HnswConfigDiff.newBuilder().setM(16).build())
.build())
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.UpdateCollectionAsync(
collectionName: "{collection\_name}",
hnswConfig: new HnswConfigDiff { M = 16 }
);
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
client, err := client.UpdateCollection(context.Background(), &qdrant.UpdateCollection{
CollectionName: "{collection\_name}",
HnswConfig: &qdrant.HnswConfigDiff{
M: qdrant.PtrOf(uint64(16)),
},
})
`
```
### Disable indexing completely (`indexing\_threshold: 0`)
In case you are doing an initial upload of a large dataset, you might want to disable indexing during upload. It will enable to avoid unnecessary indexing of vectors, which will be overwritten by the next batch.
Setting `indexing\_threshold` to `0` disables indexing altogether:
```
`PUT /collections/{collection\_name}
{
"vectors": {
"size": 768,
"distance": "Cosine"
},
"optimizers\_config": {
"indexing\_threshold": 0
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
optimizers\_config=models.OptimizersConfigDiff(
indexing\_threshold=0,
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
},
optimizers\_config: {
indexing\_threshold: 0,
},
});
`
```
```
`use qdrant\_client::qdrant::{
OptimizersConfigDiffBuilder, UpdateCollectionBuilder,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.create\_collection(
CreateCollectionBuilder::new("{collection\_name}")
.optimizers\_config(OptimizersConfigDiffBuilder::default().indexing\_threshold(0)),
)
.await?;
`
```
```
`import io.qdrant.client.grpc.Collections.CreateCollection;
import io.qdrant.client.grpc.Collections.Distance;
import io.qdrant.client.grpc.Collections.VectorParams;
import io.qdrant.client.grpc.Collections.VectorsConfig;
import io.qdrant.client.grpc.Collections.OptimizersConfigDiff;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client.createCollectionAsync(
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
OptimizersConfigDiff.newBuilder()
.setIndexingThreshold(0)
.build())
.build()
).get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateCollectionAsync(
collectionName: "{collection\_name}",
vectorsConfig: new VectorParams { Size = 768, Distance = Distance.Cosine },
optimizersConfig: new OptimizersConfigDiff { IndexingThreshold = 0 }
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
IndexingThreshold: qdrant.PtrOf(uint64(0)),
},
})
`
```
With indexing\_threshold set to 0, storage won't be optimized properly, which can lead to high RAM usage as segments accumulate in memory.
After upload is done, you can enable indexing by setting `indexing\_threshold` to a desired value (default is 10000):
```
`PATCH /collections/{collection\_name}
{
"optimizers\_config": {
"indexing\_threshold": 10000
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.update\_collection(
collection\_name="{collection\_name}",
optimizers\_config=models.OptimizersConfigDiff(indexing\_threshold=20000),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.updateCollection("{collection\_name}", {
optimizers\_config: {
indexing\_threshold: 10000,
},
});
`
```
```
`use qdrant\_client::qdrant::{
OptimizersConfigDiffBuilder, UpdateCollectionBuilder,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.update\_collection(
UpdateCollectionBuilder::new("{collection\_name}")
.optimizers\_config(OptimizersConfigDiffBuilder::default().indexing\_threshold(10000)),
)
.await?;
`
```
```
`import io.qdrant.client.grpc.Collections.UpdateCollection;
import io.qdrant.client.grpc.Collections.OptimizersConfigDiff;
client.updateCollectionAsync(
UpdateCollection.newBuilder()
.setCollectionName("{collection\_name}")
.setOptimizersConfig(
OptimizersConfigDiff.newBuilder()
.setIndexingThreshold(20000)
.build()
)
.build()
).get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.UpdateCollectionAsync(
collectionName: "{collection\_name}",
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
client.UpdateCollection(context.Background(), &qdrant.UpdateCollection{
CollectionName: "{collection\_name}",
OptimizersConfig: &qdrant.OptimizersConfigDiff{
IndexingThreshold: qdrant.PtrOf(uint64(20000)),
},
})
`
```
At this point, Qdrant will begin indexing new and previously unindexed segments in the background.
## Upload directly to disk
When the vectors you upload do not all fit in RAM, you likely want to use
[memmap](https://qdrant.tech/documentation/manage-data/storage/#configuring-memmap-storage)
support.
During collection
[creation](https://qdrant.tech/documentation/manage-data/collections/#create-collection),
memmaps may be enabled on a per-vector basis using the `on\_disk` parameter. This
will store vector data directly on disk at all times. It is suitable for
ingesting a large amount of data, essential for the billion scale benchmark.
Using `memmap\_threshold` is not recommended in this case. It would require
the [optimizer](https://qdrant.tech/documentation/ops-optimization/optimizer/) to constantly
transform in-memory segments into memmap segments on disk. This process is
slower, and the optimizer can be a bottleneck when ingesting a large amount of
data.
Read more about this in
[Configuring Memmap Storage](https://qdrant.tech/documentation/manage-data/storage/#configuring-memmap-storage).
## Parallel upload into multiple shards
In Qdrant, each collection is split into shards. Each shard has a separate Write-Ahead-Log (WAL), which is responsible for ordering operations.
By creating multiple shards, you can parallelize upload of a large dataset. From 2 to 4 shards per one machine is a reasonable number.
```
`PUT /collections/{collection\_name}
{
"vectors": {
"size": 768,
"distance": "Cosine"
},
"shard\_number": 2
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_collection(
collection\_name="{collection\_name}",
vectors\_config=models.VectorParams(size=768, distance=models.Distance.COSINE),
shard\_number=2,
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
shard\_number: 2,
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
.vectors\_config(VectorParamsBuilder::new(768, Distance::Cosine))
.shard\_number(2),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.CreateCollection;
import io.qdrant.client.grpc.Collections.Distance;
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
.setShardNumber(2)
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
shardNumber: 2
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
ShardNumber: qdrant.PtrOf(uint32(2)),
})
`
```
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/tutorials-develop/bulk-upload.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/tutorials-develop/bulk-upload/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/tutorials-develop/bulk-upload.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)