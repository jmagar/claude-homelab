Collections - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Manage Data](https://qdrant.tech/documentation/manage-data/)
*
* Collections# Collections
A collection is a named set of points (vectors with a payload) among which you can search. The vector of each point within the same collection must have the same dimensionality and be compared by a single metric. [Named vectors](#collection-with-multiple-vectors) can be used to have multiple vectors in a single point, each of which can have their own dimensionality and metric requirements.
Distance metrics are used to measure similarities among vectors.
The choice of metric depends on the way vectors obtaining and, in particular, on the method of neural network encoder training.
Qdrant supports these most popular types of metrics:
* Dot product: `Dot` - [[wiki]](https://en.wikipedia.org/wiki/Dot_product)
* Cosine similarity: `Cosine` - [[wiki]](https://en.wikipedia.org/wiki/Cosine_similarity)
* Euclidean distance: `Euclid` - [[wiki]](https://en.wikipedia.org/wiki/Euclidean_distance)
* Manhattan distance: `Manhattan` - [[wiki]](https://en.wikipedia.org/wiki/Taxicab_geometry)For search efficiency, Cosine similarity is implemented as dot-product over normalized vectors. Vectors are automatically normalized during upload
In addition to metrics and vector size, each collection uses its own set of parameters that controls collection optimization, index construction, and vacuum.
These settings can be changed at any time by a corresponding request.
## Setting up multitenancy
**How many collections should you create?** In most cases, you should only use a single collection with payload-based partitioning. This approach is called [multitenancy](https://en.wikipedia.org/wiki/Multitenancy). It is efficient for most of users, but it requires additional configuration. [Learn how to set it up](https://qdrant.tech/documentation/manage-data/collections/#multitenancy)
**When should you create multiple collections?** When you have a limited number of users and you need isolation. This approach is flexible, but it may be more costly, since creating numerous collections may result in resource overhead. Also, you need to ensure that they do not affect each other in any way, including performance-wise.
## Create a collection
```
`PUT /collections/{collection\_name}
{
"vectors": {
"size": 300,
"distance": "Cosine"
}
}
`
```
```
`curl -X PUT http://localhost:6333/collections/{collection\_name} \\
-H 'Content-Type: application/json' \\
--data-raw '{
"vectors": {
"size": 100,
"distance": "Cosine"
}
}'
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_collection(
collection\_name="{collection\_name}",
vectors\_config=models.VectorParams(size=100, distance=models.Distance.COSINE),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection\_name}", {
vectors: { size: 100, distance: "Cosine" },
});
`
```
```
`use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{CreateCollectionBuilder, VectorParamsBuilder, Distance};
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.create\_collection(
CreateCollectionBuilder::new("{collection\_name}")
.vectors\_config(VectorParamsBuilder::new(100, Distance::Cosine)),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.Distance;
import io.qdrant.client.grpc.Collections.VectorParams;
QdrantClient client = new QdrantClient(
QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client.createCollectionAsync("{collection\_name}",
VectorParams.newBuilder().setDistance(Distance.Cosine).setSize(100).build()).get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateCollectionAsync(
collectionName: "{collection\_name}",
vectorsConfig: new VectorParams { Size = 100, Distance = Distance.Cosine }
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
Size: 100,
Distance: qdrant.Distance\_Cosine,
}),
})
`
```
In addition to the required options, you can also specify custom values for the following collection options:
* `hnsw\_config` - see [indexing](https://qdrant.tech/documentation/manage-data/indexing/#vector-index) for details.
* `wal\_config` - Write-Ahead-Log related configuration. See more details about [WAL](https://qdrant.tech/documentation/manage-data/storage/#versioning)
* `optimizers\_config` - see [optimizer](https://qdrant.tech/documentation/ops-optimization/optimizer/) for details.
* `shard\_number` - which defines how many shards the collection should have. See [distributed deployment](https://qdrant.tech/documentation/distributed_deployment/#sharding) section for details.
* `on\_disk\_payload` - defines where to store payload data. If `true` - payload will be stored on disk only. Might be useful for limiting the RAM usage in case of large payload.
* `quantization\_config` - see [quantization](https://qdrant.tech/documentation/manage-data/quantization/#setting-up-quantization-in-qdrant) for details.
* `strict\_mode\_config` - see [strict mode](https://qdrant.tech/documentation/ops-configuration/administration/#strict-mode) for details.
Default parameters for the optional collection parameters are defined in [configuration file](https://github.com/qdrant/qdrant/blob/master/config/config.yaml).
See [schema definitions](https://api.qdrant.tech/api-reference/collections/create-collection) and a [configuration file](https://github.com/qdrant/qdrant/blob/master/config/config.yaml) for more information about collection and vector parameters.
*Available as of v1.2.0*
Vectors all live in RAM for very quick access. The `on\_disk` parameter can be
set in the vector configuration. If true, all vectors will live on disk. This
will enable the use of
[memmaps](https://qdrant.tech/documentation/manage-data/storage/#configuring-memmap-storage),
which is suitable for ingesting a large amount of data.
### Collection with multiple vectors
*Available as of v0.10.0*
It is possible to have multiple vectors per record.
This feature allows for multiple vector storages per collection.
To distinguish vectors in one record, they should have a unique name defined when creating the collection.
Each named vector in this mode has its distance and size:
```
`PUT /collections/{collection\_name}
{
"vectors": {
"image": {
"size": 4,
"distance": "Dot"
},
"text": {
"size": 8,
"distance": "Cosine"
}
}
}
`
```
```
`curl -X PUT http://localhost:6333/collections/{collection\_name} \\
-H 'Content-Type: application/json' \\
--data-raw '{
"vectors": {
"image": {
"size": 4,
"distance": "Dot"
},
"text": {
"size": 8,
"distance": "Cosine"
}
}
}'
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_collection(
collection\_name="{collection\_name}",
vectors\_config={
"image": models.VectorParams(size=4, distance=models.Distance.DOT),
"text": models.VectorParams(size=8, distance=models.Distance.COSINE),
},
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection\_name}", {
vectors: {
image: { size: 4, distance: "Dot" },
text: { size: 8, distance: "Cosine" },
},
});
`
```
```
`use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{
CreateCollectionBuilder, Distance, VectorParamsBuilder, VectorsConfigBuilder,
};
let client = Qdrant::from\_url("http://localhost:6334").build()?;
let mut vectors\_config = VectorsConfigBuilder::default();
vectors\_config
.add\_named\_vector\_params("image", VectorParamsBuilder::new(4, Distance::Dot).build());
vectors\_config.add\_named\_vector\_params(
"text",
VectorParamsBuilder::new(8, Distance::Cosine).build(),
);
client
.create\_collection(
CreateCollectionBuilder::new("{collection\_name}").vectors\_config(vectors\_config),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.Distance;
import io.qdrant.client.grpc.Collections.VectorParams;
import java.util.Map;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createCollectionAsync(
"{collection\_name}",
Map.of(
"image", VectorParams.newBuilder().setSize(4).setDistance(Distance.Dot).build(),
"text",
VectorParams.newBuilder().setSize(8).setDistance(Distance.Cosine).build()))
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateCollectionAsync(
collectionName: "{collection\_name}",
vectorsConfig: new VectorParamsMap
{
Map =
{
["image"] = new VectorParams { Size = 4, Distance = Distance.Dot },
["text"] = new VectorParams { Size = 8, Distance = Distance.Cosine },
}
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
VectorsConfig: qdrant.NewVectorsConfigMap(
map[string]\*qdrant.VectorParams{
"image": {
Size: 4,
Distance: qdrant.Distance\_Dot,
},
"text": {
Size: 8,
Distance: qdrant.Distance\_Cosine,
},
}),
})
`
```
For rare use cases, it is possible to create a collection without any vector storage.
*Available as of v1.1.1*
For each named vector you can optionally specify
[`hnsw\_config`](https://qdrant.tech/documentation/manage-data/indexing/#vector-index) or
[`quantization\_config`](https://qdrant.tech/documentation/manage-data/quantization/#setting-up-quantization-in-qdrant) to
deviate from the collection configuration. This can be useful to fine-tune
search performance on a vector level.
*Available as of v1.2.0*
Vectors all live in RAM for very quick access. On a per-vector basis you can set
`on\_disk` to true to store all vectors on disk at all times. This will enable
the use of
[memmaps](https://qdrant.tech/documentation/manage-data/storage/#configuring-memmap-storage),
which is suitable for ingesting a large amount of data.
### Vector datatypes
*Available as of v1.9.0*
Some embedding providers may provide embeddings in a pre-quantized format.
One of the most notable examples is the [Cohere int8 & binary embeddings](https://cohere.com/blog/int8-binary-embeddings).
Qdrant has direct support for uint8 embeddings, which you can also use in combination with binary quantization.
To create a collection with uint8 embeddings, you can use the following configuration:
```
`PUT /collections/{collection\_name}
{
"vectors": {
"size": 1024,
"distance": "Cosine",
"datatype": "uint8"
}
}
`
```
```
`curl -X PUT http://localhost:6333/collections/{collection\_name} \\
-H 'Content-Type: application/json' \\
--data-raw '{
"vectors": {
"size": 1024,
"distance": "Cosine",
"datatype": "uint8"
}
}'
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_collection(
collection\_name="{collection\_name}",
vectors\_config=models.VectorParams(
size=1024,
distance=models.Distance.COSINE,
datatype=models.Datatype.UINT8,
),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection\_name}", {
vectors: {
image: { size: 1024, distance: "Cosine", datatype: "uint8" },
},
});
`
```
```
`use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{
CreateCollectionBuilder, Datatype, Distance, VectorParamsBuilder,
};
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.create\_collection(
CreateCollectionBuilder::new("{collection\_name}").vectors\_config(
VectorParamsBuilder::new(1024, Distance::Cosine).datatype(Datatype::Uint8),
),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.Datatype;
import io.qdrant.client.grpc.Collections.Distance;
import io.qdrant.client.grpc.Collections.VectorParams;
QdrantClient client = new QdrantClient(
QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createCollectionAsync("{collection\_name}",
VectorParams.newBuilder()
.setSize(1024)
.setDistance(Distance.Cosine)
.setDatatype(Datatype.Uint8)
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
vectorsConfig: new VectorParams {
Size = 1024, Distance = Distance.Cosine, Datatype = Datatype.Uint8
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
Size: 1024,
Distance: qdrant.Distance\_Cosine,
Datatype: qdrant.Datatype\_Uint8.Enum(),
}),
})
`
```
Vectors with `uint8` datatype are stored in a more compact format, which can save memory and improve search speed at the cost of some precision.
If you choose to use the `uint8` datatype, elements of the vector will be stored as unsigned 8-bit integers, which can take values **from 0 to 255**.
### Collection with sparse vectors
*Available as of v1.7.0*
Qdrant supports sparse vectors as a first-class citizen.
Sparse vectors are useful for text search, where each word is represented as a separate dimension.
Collections can contain sparse vectors as additional [named vectors](#collection-with-multiple-vectors) along side regular dense vectors in a single point.
Unlike dense vectors, sparse vectors must be named.
And additionally, sparse vectors and dense vectors must have different names within a collection.
```
`PUT /collections/{collection\_name}
{
"sparse\_vectors": {
"text": { }
}
}
`
```
```
`curl -X PUT http://localhost:6333/collections/{collection\_name} \\
-H 'Content-Type: application/json' \\
--data-raw '{
"sparse\_vectors": {
"text": { }
}
}'
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_collection(
collection\_name="{collection\_name}",
vectors\_config={},
sparse\_vectors\_config={
"text": models.SparseVectorParams(),
},
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection\_name}", {
sparse\_vectors: {
text: { },
},
});
`
```
```
`use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{
CreateCollectionBuilder, SparseVectorParamsBuilder, SparseVectorsConfigBuilder,
};
let client = Qdrant::from\_url("http://localhost:6334").build()?;
let mut sparse\_vector\_config = SparseVectorsConfigBuilder::default();
sparse\_vector\_config.add\_named\_vector\_params("text", SparseVectorParamsBuilder::default());
client
.create\_collection(
CreateCollectionBuilder::new("{collection\_name}")
.sparse\_vectors\_config(sparse\_vector\_config),
)
.await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.CreateCollection;
import io.qdrant.client.grpc.Collections.SparseVectorConfig;
import io.qdrant.client.grpc.Collections.SparseVectorParams;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createCollectionAsync(
CreateCollection.newBuilder()
.setCollectionName("{collection\_name}")
.setSparseVectorsConfig(
SparseVectorConfig.newBuilder()
.putMap("text", SparseVectorParams.getDefaultInstance()))
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
sparseVectorsConfig: ("text", new SparseVectorParams())
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
SparseVectorsConfig: qdrant.NewSparseVectorsConfig(
map[string]\*qdrant.SparseVectorParams{
"text": {},
}),
})
`
```
Outside of a unique name, there are no required configuration parameters for sparse vectors.
The distance function for sparse vectors is always `Dot` and does not need to be specified.
However, there are optional parameters to tune the underlying [sparse vector index](https://qdrant.tech/documentation/manage-data/indexing/#sparse-vector-index).
### Create collection from another collection
To create a collection from another collection, use the [Migration Tool](https://github.com/qdrant/migration/). You can use it to either copy a collection within the same Qdrant instance or to copy a collection to another instance.
For example, to copy a collection from a local instance to a Qdrant Cloud instance, run the following command:
```
`docker run --net=host --rm -it registry.cloud.qdrant.io/library/qdrant-migration qdrant \\
--source.url 'http://localhost:6334' \\
--source.collection 'source-collection' \\
--target.url 'https://example.cloud-region.cloud-provider.cloud.qdrant.io:6334' \\
--target.api-key 'qdrant-key' \\
--target.collection 'target-collection' \\
--migration.batch-size 64
`
```
## Check collection existence
*Available as of v1.8.0*
```
`GET /collections/{collection\_name}/exists
`
```
```
`curl -X GET http://localhost:6333/collections/{collection\_name}/exists
`
```
```
`client.collection\_exists(collection\_name="{collection\_name}")
`
```
```
`client.collectionExists("{collection\_name}");
`
```
```
`client.collection\_exists("{collection\_name}").await?;
`
```
```
`client.collectionExistsAsync("{collection\_name}").get();
`
```
```
`await client.CollectionExistsAsync("{collection\_name}");
`
```
```
`import "context"
client.CollectionExists(context.Background(), "my\_collection")
`
```
## Delete collection
```
`DELETE /collections/{collection\_name}
`
```
```
`curl -X DELETE http://localhost:6333/collections/{collection\_name}
`
```
```
`client.delete\_collection(collection\_name="{collection\_name}")
`
```
```
`client.deleteCollection("{collection\_name}");
`
```
```
`client.delete\_collection("{collection\_name}").await?;
`
```
```
`client.deleteCollectionAsync("{collection\_name}").get();
`
```
```
`await client.DeleteCollectionAsync("{collection\_name}");
`
```
```
`import "context"
client.DeleteCollection(context.Background(), "{collection\_name}")
`
```
## Update collection parameters
Dynamic parameter updates may be helpful, for example, for more efficient initial loading of vectors.
For example, you can disable indexing during the upload process, and enable it immediately after the upload is finished.
As a result, you will not waste extra computation resources on rebuilding the index.
The following command enables indexing for segments that have more than 10000 kB of vectors stored:
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
`curl -X PATCH http://localhost:6333/collections/{collection\_name} \\
-H 'Content-Type: application/json' \\
--data-raw '{
"optimizers\_config": {
"indexing\_threshold": 10000
}
}'
`
```
```
`client.update\_collection(
collection\_name="{collection\_name}",
optimizers\_config=models.OptimizersConfigDiff(indexing\_threshold=10000),
)
`
```
```
`client.updateCollection("{collection\_name}", {
optimizers\_config: {
indexing\_threshold: 10000,
},
});
`
```
```
`use qdrant\_client::qdrant::{OptimizersConfigDiffBuilder, UpdateCollectionBuilder};
client
.update\_collection(
UpdateCollectionBuilder::new("{collection\_name}").optimizers\_config(
OptimizersConfigDiffBuilder::default().indexing\_threshold(10000),
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
OptimizersConfigDiff.newBuilder().setIndexingThreshold(10000).build())
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
optimizersConfig: new OptimizersConfigDiff { IndexingThreshold = 10000 }
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
IndexingThreshold: qdrant.PtrOf(uint64(10000)),
},
})
`
```
The following parameters can be updated:
* `optimizers\_config` - see [optimizer](https://qdrant.tech/documentation/ops-optimization/optimizer/) for details.
* `hnsw\_config` - see [indexing](https://qdrant.tech/documentation/manage-data/indexing/#vector-index) for details.
* `quantization\_config` - see [quantization](https://qdrant.tech/documentation/manage-data/quantization/#setting-up-quantization-in-qdrant) for details.
* `vectors\_config` - vector-specific configuration, including individual `hnsw\_config`, `quantization\_config` and `on\_disk` settings.
* `params` - other collection parameters, including `read\_fan\_out\_delay\_ms`, `write\_consistency\_factor` and `on\_disk\_payload`.
* `strict\_mode\_config` - see [strict mode](https://qdrant.tech/documentation/ops-configuration/administration/#strict-mode) for details.
Full API specification is available in [schema definitions](https://api.qdrant.tech/api-reference/collections/update-collection).
Calls to this endpoint may be blocking as it waits for existing optimizers to
finish. We recommended against using this in a production database as it may
introduce huge overhead due to the rebuilding of the index.
#### Update vector parameters
*Available as of v1.4.0*
To update vector parameters using the collection update API, you must always specify a vector name. If your collection does not have named vectors, use an empty (`""`) name.
Qdrant 1.4 adds support for updating more collection parameters at runtime. HNSW
index, quantization and disk configurations can now be changed without
recreating a collection. Segments (with index and quantized data) will
automatically be rebuilt in the background to match updated parameters.
To put vector data on disk for a collection that **does not have** named vectors,
use `""` as name:
```
`PATCH /collections/{collection\_name}
{
"vectors": {
"": {
"on\_disk": true
}
}
}
`
```
```
`curl -X PATCH http://localhost:6333/collections/{collection\_name} \\
-H 'Content-Type: application/json' \\
--data-raw '{
"vectors": {
"": {
"on\_disk": true
}
}
}'
`
```
To put vector data on disk for a collection that **does have** named vectors:
Note: To create a vector name, follow the procedure from our [Points](https://qdrant.tech/documentation/manage-data/points/#create-vector-name).
```
`PATCH /collections/{collection\_name}
{
"vectors": {
"my\_vector": {
"on\_disk": true
}
}
}
`
```
```
`curl -X PATCH http://localhost:6333/collections/{collection\_name} \\
-H 'Content-Type: application/json' \\
--data-raw '{
"vectors": {
"my\_vector": {
"on\_disk": true
}
}
}'
`
```
In the following example the HNSW index and quantization parameters are updated,
both for the whole collection, and for `my\_vector` specifically:
```
`PATCH /collections/{collection\_name}
{
"vectors": {
"my\_vector": {
"hnsw\_config": {
"m": 32,
"ef\_construct": 123
},
"quantization\_config": {
"product": {
"compression": "x32",
"always\_ram": true
}
},
"on\_disk": true
}
},
"hnsw\_config": {
"ef\_construct": 123
},
"quantization\_config": {
"scalar": {
"type": "int8",
"quantile": 0.8,
"always\_ram": false
}
}
}
`
```
```
`curl -X PATCH http://localhost:6333/collections/{collection\_name} \\
-H 'Content-Type: application/json' \\
--data-raw '{
"vectors": {
"my\_vector": {
"hnsw\_config": {
"m": 32,
"ef\_construct": 123
},
"quantization\_config": {
"product": {
"compression": "x32",
"always\_ram": true
}
},
"on\_disk": true
}
},
"hnsw\_config": {
"ef\_construct": 123
},
"quantization\_config": {
"scalar": {
"type": "int8",
"quantile": 0.8,
"always\_ram": false
}
}
}'
`
```
```
`client.update\_collection(
collection\_name="{collection\_name}",
vectors\_config={
"my\_vector": models.VectorParamsDiff(
hnsw\_config=models.HnswConfigDiff(
m=32,
ef\_construct=123,
),
quantization\_config=models.ProductQuantization(
product=models.ProductQuantizationConfig(
compression=models.CompressionRatio.X32,
always\_ram=True,
),
),
on\_disk=True,
),
},
hnsw\_config=models.HnswConfigDiff(
ef\_construct=123,
),
quantization\_config=models.ScalarQuantization(
scalar=models.ScalarQuantizationConfig(
type=models.ScalarType.INT8,
quantile=0.8,
always\_ram=False,
),
),
)
`
```
```
`client.updateCollection("{collection\_name}", {
vectors: {
my\_vector: {
hnsw\_config: {
m: 32,
ef\_construct: 123,
},
quantization\_config: {
product: {
compression: "x32",
always\_ram: true,
},
},
on\_disk: true,
},
},
hnsw\_config: {
ef\_construct: 123,
},
quantization\_config: {
scalar: {
type: "int8",
quantile: 0.8,
always\_ram: true,
},
},
});
`
```
```
`use std::collections::HashMap;
use qdrant\_client::qdrant::{
quantization\_config\_diff::Quantization, vectors\_config\_diff::Config, HnswConfigDiffBuilder,
QuantizationType, ScalarQuantizationBuilder, UpdateCollectionBuilder, VectorParamsDiffBuilder,
VectorParamsDiffMap,
};
client
.update\_collection(
UpdateCollectionBuilder::new("{collection\_name}")
.hnsw\_config(HnswConfigDiffBuilder::default().ef\_construct(123))
.vectors\_config(Config::ParamsMap(VectorParamsDiffMap {
map: HashMap::from([(
("my\_vector".into()),
VectorParamsDiffBuilder::default()
.hnsw\_config(HnswConfigDiffBuilder::default().m(32).ef\_construct(123))
.build(),
)]),
}))
.quantization\_config(Quantization::Scalar(
ScalarQuantizationBuilder::default()
.r#type(QuantizationType::Int8.into())
.quantile(0.8)
.always\_ram(true)
.build(),
)),
)
.await?;
`
```
```
`import io.qdrant.client.grpc.Collections.HnswConfigDiff;
import io.qdrant.client.grpc.Collections.QuantizationConfigDiff;
import io.qdrant.client.grpc.Collections.QuantizationType;
import io.qdrant.client.grpc.Collections.ScalarQuantization;
import io.qdrant.client.grpc.Collections.UpdateCollection;
import io.qdrant.client.grpc.Collections.VectorParamsDiff;
import io.qdrant.client.grpc.Collections.VectorParamsDiffMap;
import io.qdrant.client.grpc.Collections.VectorsConfigDiff;
client
.updateCollectionAsync(
UpdateCollection.newBuilder()
.setCollectionName("{collection\_name}")
.setHnswConfig(HnswConfigDiff.newBuilder().setEfConstruct(123).build())
.setVectorsConfig(
VectorsConfigDiff.newBuilder()
.setParamsMap(
VectorParamsDiffMap.newBuilder()
.putMap(
"my\_vector",
VectorParamsDiff.newBuilder()
.setHnswConfig(
HnswConfigDiff.newBuilder()
.setM(3)
.setEfConstruct(123)
.build())
.build())))
.setQuantizationConfig(
QuantizationConfigDiff.newBuilder()
.setScalar(
ScalarQuantization.newBuilder()
.setType(QuantizationType.Int8)
.setQuantile(0.8f)
.setAlwaysRam(true)
.build()))
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
hnswConfig: new HnswConfigDiff { EfConstruct = 123 },
vectorsConfig: new VectorParamsDiffMap
{
Map =
{
{
"my\_vector",
new VectorParamsDiff
{
HnswConfig = new HnswConfigDiff { M = 3, EfConstruct = 123 }
}
}
}
},
quantizationConfig: new QuantizationConfigDiff
{
Scalar = new ScalarQuantization
{
Type = QuantizationType.Int8,
Quantile = 0.8f,
AlwaysRam = true
}
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
client.UpdateCollection(context.Background(), &qdrant.UpdateCollection{
CollectionName: "{collection\_name}",
VectorsConfig: qdrant.NewVectorsConfigDiffMap(
map[string]\*qdrant.VectorParamsDiff{
"my\_vector": {
HnswConfig: &qdrant.HnswConfigDiff{
M: qdrant.PtrOf(uint64(3)),
EfConstruct: qdrant.PtrOf(uint64(123)),
},
},
}),
QuantizationConfig: qdrant.NewQuantizationDiffScalar(
&qdrant.ScalarQuantization{
Type: qdrant.QuantizationType\_Int8,
Quantile: qdrant.PtrOf(float32(0.8)),
AlwaysRam: qdrant.PtrOf(true),
}),
})
`
```
## Collection info
Qdrant allows determining the configuration parameters of an existing collection to better understand how the points are
distributed and indexed.
```
`GET /collections/{collection\_name}
`
```
```
`curl -X GET http://localhost:6333/collections/{collection\_name}
`
```
```
`client.get\_collection(collection\_name="{collection\_name}")
`
```
```
`client.getCollection("{collection\_name}");
`
```
```
`client.collection\_info("{collection\_name}").await?;
`
```
```
`client.getCollectionInfoAsync("{collection\_name}").get();
`
```
```
`await client.GetCollectionInfoAsync("{collection\_name}");
`
```
```
`import "context"
client.GetCollectionInfo(context.Background(), "{collection\_name}")
`
```
Expected result
```
`{
"result": {
"status": "green",
"optimizer\_status": "ok",
"indexed\_vectors\_count": 1024232,
"points\_count": 1068786,
"segments\_count": 31,
"config": {
"params": {
"vectors": {
"size": 384,
"distance": "Cosine"
},
"shard\_number": 1,
"replication\_factor": 1,
"write\_consistency\_factor": 1,
"on\_disk\_payload": false
},
"hnsw\_config": {
"m": 16,
"ef\_construct": 100,
"full\_scan\_threshold": 10000,
"max\_indexing\_threads": 0
},
"optimizer\_config": {
"deleted\_threshold": 0.2,
"vacuum\_min\_vector\_number": 1000,
"default\_segment\_number": 0,
"max\_segment\_size": null,
"memmap\_threshold": null,
"indexing\_threshold": 20000,
"flush\_interval\_sec": 5,
"max\_optimization\_threads": 1
},
"wal\_config": {
"wal\_capacity\_mb": 32,
"wal\_segments\_ahead": 0
}
},
"payload\_schema": {}
},
"status": "ok",
"time": 0.00010143
}
`
```
If you insert the vectors into the collection, the `status` field may become
`yellow` whilst it is optimizing. It will become `green` once all the points are
successfully processed.
The following color statuses are possible:
* 🟢 `green`: collection is ready
* 🟡 `yellow`: collection is optimizing
* ⚫ `grey`: collection is pending optimization ([help](#grey-collection-status))
* 🔴 `red`: an error occurred which the engine could not recover from### Grey collection status
*Available as of v1.9.0*
A collection may have the grey ⚫ status or show &ldquo;optimizations pending,
awaiting update operation&rdquo; as optimization status. This state is normally caused
by restarting a Qdrant instance while optimizations were ongoing.
It means the collection has optimizations pending, but they are paused. You must
send any update operation to trigger and start the optimizations again.
For example:
```
`PATCH /collections/{collection\_name}
{
"optimizers\_config": {}
}
`
```
```
`curl -X PATCH http://localhost:6333/collections/{collection\_name} \\
-H 'Content-Type: application/json' \\
--data-raw '{
"optimizers\_config": {}
}'
`
```
```
`client.update\_collection(
collection\_name="{collection\_name}",
optimizer\_config=models.OptimizersConfigDiff(),
)
`
```
```
`client.updateCollection("{collection\_name}", {
optimizers\_config: {},
});
`
```
```
`use qdrant\_client::qdrant::{OptimizersConfigDiffBuilder, UpdateCollectionBuilder};
client
.update\_collection(
UpdateCollectionBuilder::new("{collection\_name}")
.optimizers\_config(OptimizersConfigDiffBuilder::default()),
)
.await?;
`
```
```
`import io.qdrant.client.grpc.Collections.OptimizersConfigDiff;
import io.qdrant.client.grpc.Collections.UpdateCollection;
client.updateCollectionAsync(
UpdateCollection.newBuilder()
.setCollectionName("{collection\_name}")
.setOptimizersConfig(
OptimizersConfigDiff.getDefaultInstance())
.build());
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.UpdateCollectionAsync(
collectionName: "{collection\_name}",
optimizersConfig: new OptimizersConfigDiff { }
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
OptimizersConfig: &qdrant.OptimizersConfigDiff{},
})
`
```
Alternatively you may use the `Trigger Optimizers` button in the [Qdrant Web UI](https://qdrant.tech/documentation/web-ui/).
It is shown next to the grey collection status on the collection info page.
### Approximate point and vector counts
You may be interested in the count attributes:
* `points\_count` - total number of objects (vectors and their payloads) stored in the collection
* `indexed\_vectors\_count` - total number of vectors stored in the HNSW or sparse index. Qdrant does not store all the vectors in the index, but only if an index segment might be created for a given configuration.
The above counts are not exact, but should be considered approximate. Depending
on how you use Qdrant these may give very different numbers than what you may
expect. It&rsquo;s therefore important **not** to rely on them.
More specifically, these numbers represent the count of points and vectors in
Qdrant&rsquo;s internal storage. Internally, Qdrant may temporarily duplicate points
as part of automatic optimizations. It may keep changed or deleted points for a
bit. And it may delay indexing of new points. All of that is for optimization
reasons.
Updates you do are therefore not directly reflected in these numbers. If you see
a wildly different count of points, it will likely resolve itself once a new
round of automatic optimizations is completed.
To clarify: these numbers don&rsquo;t represent the exact amount of points or vectors
you have inserted, nor does it represent the exact number of distinguishable
points or vectors you can query. If you want to know exact counts, refer to the
[count API](https://qdrant.tech/documentation/manage-data/points/#counting-points).
*Note: these numbers may be removed in a future version of Qdrant.*
### Indexing vectors in HNSW
In some cases, you might be surprised the value of `indexed\_vectors\_count` is lower than you expected. This is an intended behaviour and
depends on the [optimizer configuration](https://qdrant.tech/documentation/ops-optimization/optimizer/). A new index segment is built if the size of non-indexed vectors is higher than the
value of `indexing\_threshold`(in kB). If your collection is very small or the dimensionality of the vectors is low, there might be no HNSW segment
created and `indexed\_vectors\_count` might be equal to `0`.
It is possible to reduce the `indexing\_threshold` for an existing collection by [updating collection parameters](#update-collection-parameters).
### Collection metadata
*Available as of v1.16.0*
For convenience and better data organization, Qdrant allows attaching custom metadata to collections in the form of key-value pairs.
Adding metadata is treated as a part of collection configuration and synchronized across all nodes in a cluster with consensus protocol.
Collection metadata can be specified during collection creation:
```
`PUT /collections/{collection\_name}
{
"vectors": {
"size": 300,
"distance": "Cosine"
},
"metadata": {
"my-metadata-field": "value-1",
"another-field": 123
}
}
`
```
```
`curl -X PUT http://localhost:6333/collections/{collection\_name} \\
-H 'Content-Type: application/json' \\
--data-raw '{
"vectors": {
"size": 300,
"distance": "Cosine"
},
"metadata": {
"my-metadata-field": "value-1",
"another-field": 123
}
}'
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_collection(
collection\_name="{collection\_name}",
metadata={
"my-metadata-field": "value-1",
"another-field": 123
},
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection\_name}", {
vectors: { size: 100, distance: "Cosine" },
metadata: {
"my-metadata-field": "value-1",
"another-field": 123
}
});
`
```
```
`use qdrant\_client::qdrant::{CreateCollectionBuilder, Distance, VectorParamsBuilder};
use qdrant\_client::Qdrant;
use serde\_json::{json, Value};
use std::collections::HashMap;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
let mut metadata: HashMap\<String, Value\> = HashMap::new();
metadata.insert("my-metadata-field".to\_string(), json!("value-1"));
metadata.insert("another-field".to\_string(), json!(123));
client
.create\_collection(
CreateCollectionBuilder::new("{collection\_name}")
.vectors\_config(VectorParamsBuilder::new(100, Distance::Cosine))
.metadata(metadata),
)
.await?;
`
```
```
`import static io.qdrant.client.ValueFactory.value;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.CreateCollection;
import io.qdrant.client.grpc.Collections.Distance;
import io.qdrant.client.grpc.Collections.VectorParams;
import io.qdrant.client.grpc.Collections.VectorsConfig;
import java.util.Map;
QdrantClient client = new QdrantClient(
QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createCollectionAsync(
CreateCollection.newBuilder()
.setCollectionName("{collection\_name}")
.setVectorsConfig(
VectorsConfig.newBuilder()
.setParams(
VectorParams.newBuilder()
.setDistance(Distance.Cosine)
.setSize(100)
.build())
.build())
.putAllMetadata(
Map.of(
"my-metadata-field", value("value-1"),
"another-field", value(123)))
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
vectorsConfig: new VectorParams { Size = 100, Distance = Distance.Cosine },
metadata: new()
{
["my-metadata-field"] = "value-1",
["another-field"] = 123
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
Size: 100,
Distance: qdrant.Distance\_Cosine,
}),
Metadata: qdrant.NewValueMap(map[string]any{
"my-metadata-field": "value-1",
"another-field": 123,
}),
})
`
```
as well as updated later:
```
`PATCH /collections/{collection\_name}
{
"metadata": {
"my-metadata-field": {
"key-a": "value-a",
"key-b": 42
}
}
}
`
```
```
`curl -X PATCH http://localhost:6333/collections/{collection\_name} \\
-H 'Content-Type: application/json' \\
--data-raw '{
"metadata": {
"my-metadata-field": {
"key-a": "value-a",
"key-b": 42
}
}
}'
`
```
```
`client.update\_collection(
collection\_name="{collection\_name}",
metadata={
"my-metadata-field": {
"key-a": "value-a",
"key-b": 42
}
},
)
`
```
```
`client.updateCollection("{collection\_name}", {
metadata: {
"my-metadata-field": {
"key-a": "value-a",
"key-b": 42
}
},
});
`
```
```
`use qdrant\_client::qdrant::{UpdateCollectionBuilder};
use qdrant\_client::Qdrant;
use serde\_json::{json, Value};
use std::collections::HashMap;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
let mut metadata: HashMap\<String, Value\> = HashMap::new();
metadata.insert("my-metadata-field".to\_string(), json!({
"key-a": "value-a",
"key-b": 42
}));
client
.update\_collection(
UpdateCollectionBuilder::new("{collection\_name}").metadata(metadata),
)
.await?;
`
```
```
`import static io.qdrant.client.ValueFactory.value;
import io.qdrant.client.grpc.Collections.OptimizersConfigDiff;
import io.qdrant.client.grpc.Collections.UpdateCollection;
import java.util.Map;
client
.updateCollectionAsync(
UpdateCollection.newBuilder()
.setCollectionName("{collection\_name}")
.setOptimizersConfig(
OptimizersConfigDiff.newBuilder().setIndexingThreshold(10000).build())
.putAllMetadata(
Map.of(
"my-metadata-field",
value(
Map.of(
"key-a", value("value-a"),
"key-b", value(42)))))
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
optimizersConfig: new OptimizersConfigDiff { IndexingThreshold = 10000 },
metadata: new()
{
["my-metadata-field"] = new Dictionary\<string, Value\>
{
["key-a"] = "value-a",
["key-b"] = 42
},
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
client.UpdateCollection(context.Background(), &qdrant.UpdateCollection{
CollectionName: "{collection\_name}",
OptimizersConfig: &qdrant.OptimizersConfigDiff{
IndexingThreshold: qdrant.PtrOf(uint64(10000)),
},
Metadata: qdrant.NewValueMap(map[string]any{
"my-metadata-field": map[string]any{
"key-a": "value-a",
"key-b": 42,
},
}),
})
`
```
Note, that update operation only modifies the specified metadata fields, leaving other fields unchanged.
When specified, metadata is returned as part of collection info:
```
`{
"result": {
"config": {
"metadata": {
"my-metadata-field": {
"key-a": "value-a",
"key-b": 42
},
"another-field": 123
}
}
}
}
`
```
## Collection aliases
In a production environment, it is sometimes necessary to switch different versions of vectors seamlessly.
For example, when upgrading to a new version of the neural network.
There is no way to stop the service and rebuild the collection with new vectors in these situations.
Aliases are additional names for existing collections.
All queries to the collection can also be done identically, using an alias instead of the collection name.
Thus, it is possible to build a second collection in the background and then switch alias from the old to the new collection.
Since all changes of aliases happen atomically, no concurrent requests will be affected during the switch.
### Create alias
```
`POST /collections/aliases
{
"actions": [
{
"create\_alias": {
"collection\_name": "example\_collection",
"alias\_name": "production\_collection"
}
}
]
}
`
```
```
`curl -X POST http://localhost:6333/collections/aliases \\
-H 'Content-Type: application/json' \\
--data-raw '{
"actions": [
{
"create\_alias": {
"collection\_name": "example\_collection",
"alias\_name": "production\_collection"
}
}
]
}'
`
```
```
`client.update\_collection\_aliases(
change\_aliases\_operations=[
models.CreateAliasOperation(
create\_alias=models.CreateAlias(
collection\_name="example\_collection", alias\_name="production\_collection"
)
)
]
)
`
```
```
`client.updateCollectionAliases({
actions: [
{
create\_alias: {
collection\_name: "example\_collection",
alias\_name: "production\_collection",
},
},
],
});
`
```
```
`use qdrant\_client::qdrant::CreateAliasBuilder;
client
.create\_alias(CreateAliasBuilder::new(
"example\_collection",
"production\_collection",
))
.await?;
`
```
```
`client.createAliasAsync("production\_collection", "example\_collection").get();
`
```
```
`await client.CreateAliasAsync(aliasName: "production\_collection", collectionName: "example\_collection");
`
```
```
`import "context"
client.CreateAlias(context.Background(), "production\_collection", "example\_collection")
`
```
### Remove alias
```
`POST /collections/aliases
{
"actions": [
{
"delete\_alias": {
"alias\_name": "production\_collection"
}
}
]
}
`
```
```
`curl -X POST http://localhost:6333/collections/aliases \\
-H 'Content-Type: application/json' \\
--data-raw '{
"actions": [
{
"delete\_alias": {
"alias\_name": "production\_collection"
}
}
]
}'
`
```
```
`client.update\_collection\_aliases(
change\_aliases\_operations=[
models.DeleteAliasOperation(
delete\_alias=models.DeleteAlias(alias\_name="production\_collection")
),
]
)
`
```
```
`client.updateCollectionAliases({
actions: [
{
delete\_alias: {
alias\_name: "production\_collection",
},
},
],
});
`
```
```
`client.delete\_alias("production\_collection").await?;
`
```
```
`client.deleteAliasAsync("production\_collection").get();
`
```
```
`await client.DeleteAliasAsync("production\_collection");
`
```
```
`import "context"
client.DeleteAlias(context.Background(), "production\_collection")
`
```
### Switch collection
Multiple alias actions are performed atomically.
For example, you can switch underlying collection with the following command:
```
`POST /collections/aliases
{
"actions": [
{
"delete\_alias": {
"alias\_name": "production\_collection"
}
},
{
"create\_alias": {
"collection\_name": "example\_collection",
"alias\_name": "production\_collection"
}
}
]
}
`
```
```
`curl -X POST http://localhost:6333/collections/aliases \\
-H 'Content-Type: application/json' \\
--data-raw '{
"actions": [
{
"delete\_alias": {
"alias\_name": "production\_collection"
}
},
{
"create\_alias": {
"collection\_name": "example\_collection",
"alias\_name": "production\_collection"
}
}
]
}'
`
```
```
`client.update\_collection\_aliases(
change\_aliases\_operations=[
models.DeleteAliasOperation(
delete\_alias=models.DeleteAlias(alias\_name="production\_collection")
),
models.CreateAliasOperation(
create\_alias=models.CreateAlias(
collection\_name="example\_collection", alias\_name="production\_collection"
)
),
]
)
`
```
```
`client.updateCollectionAliases({
actions: [
{
delete\_alias: {
alias\_name: "production\_collection",
},
},
{
create\_alias: {
collection\_name: "example\_collection",
alias\_name: "production\_collection",
},
},
],
});
`
```
```
`use qdrant\_client::qdrant::CreateAliasBuilder;
client.delete\_alias("production\_collection").await?;
client
.create\_alias(CreateAliasBuilder::new(
"example\_collection",
"production\_collection",
))
.await?;
`
```
```
`client.deleteAliasAsync("production\_collection").get();
client.createAliasAsync("production\_collection", "example\_collection").get();
`
```
```
`await client.DeleteAliasAsync("production\_collection");
await client.CreateAliasAsync(aliasName: "production\_collection", collectionName: "example\_collection");
`
```
```
`import "context"
client.DeleteAlias(context.Background(), "production\_collection")
client.CreateAlias(context.Background(), "production\_collection", "example\_collection")
`
```
### List collection aliases
```
`GET /collections/{collection\_name}/aliases
`
```
```
`curl -X GET http://localhost:6333/collections/{collection\_name}/aliases
`
```
```
`from qdrant\_client import QdrantClient
client = QdrantClient(url="http://localhost:6333")
client.get\_collection\_aliases(collection\_name="{collection\_name}")
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.getCollectionAliases("{collection\_name}");
`
```
```
`use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client.list\_collection\_aliases("{collection\_name}").await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client.listCollectionAliasesAsync("{collection\_name}").get();
`
```
```
`using Qdrant.Client;
var client = new QdrantClient("localhost", 6334);
await client.ListCollectionAliasesAsync("{collection\_name}");
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
client.ListCollectionAliases(context.Background(), "{collection\_name}")
`
```
### List all aliases
```
`GET /aliases
`
```
```
`curl -X GET http://localhost:6333/aliases
`
```
```
`from qdrant\_client import QdrantClient
client = QdrantClient(url="http://localhost:6333")
client.get\_aliases()
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.getAliases();
`
```
```
`use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client.list\_aliases().await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client.listAliasesAsync().get();
`
```
```
`using Qdrant.Client;
var client = new QdrantClient("localhost", 6334);
await client.ListAliasesAsync();
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
client.ListAliases(context.Background())
`
```
### List all collections
```
`GET /collections
`
```
```
`curl -X GET http://localhost:6333/collections
`
```
```
`from qdrant\_client import QdrantClient
client = QdrantClient(url="http://localhost:6333")
client.get\_collections()
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.getCollections();
`
```
```
`use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client.list\_collections().await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client.listCollectionsAsync().get();
`
```
```
`using Qdrant.Client;
var client = new QdrantClient("localhost", 6334);
await client.ListCollectionsAsync();
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
client.ListCollections(context.Background())
`
```
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/manage-data/collections.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/manage-data/collections/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/manage-data/collections.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)