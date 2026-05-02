# Collections
# Collections
A collection is a named set of points (vectors with a payload) among which you can search. The vector of each point within the same collection must have the same dimensionality and be compared by a single metric. [Named vectors](#collection-with-multiple-vectors) can be used to have multiple vectors in a single point, each of which can have their own dimensionality and metric requirements.
Distance metrics are used to measure similarities among vectors.
The choice of metric depends on the way vectors obtaining and, in particular, on the method of neural network encoder training.
Qdrant supports these most popular types of metrics:
* Dot product: `Dot` - [[wiki]](https://en.wikipedia.org/wiki/Dot_product)
* Cosine similarity: `Cosine` - [[wiki]](https://en.wikipedia.org/wiki/Cosine_similarity)
* Euclidean distance: `Euclid` - [[wiki]](https://en.wikipedia.org/wiki/Euclidean_distance)
* Manhattan distance: `Manhattan` - [[wiki]](https://en.wikipedia.org/wiki/Taxicab_geometry)
For search efficiency, Cosine similarity is implemented as dot-product over normalized vectors. Vectors are automatically normalized during upload
In addition to metrics and vector size, each collection uses its own set of parameters that controls collection optimization, index construction, and vacuum.
These settings can be changed at any time by a corresponding request.
## Setting up multitenancy
**How many collections should you create?** In most cases, you should only use a single collection with payload-based partitioning. This approach is called [multitenancy](https://en.wikipedia.org/wiki/Multitenancy). It is efficient for most of users, but it requires additional configuration. [Learn how to set it up](/documentation/manage-data/collections/index.md#multitenancy)
**When should you create multiple collections?** When you have a limited number of users and you need isolation. This approach is flexible, but it may be more costly, since creating numerous collections may result in resource overhead. Also, you need to ensure that they do not affect each other in any way, including performance-wise.
## Create a collection
```http
PUT /collections/{collection_name}
{
"vectors": {
"size": 300,
"distance": "Cosine"
}
}
```
```bash
curl -X PUT http://localhost:6333/collections/{collection_name} \
-H 'Content-Type: application/json' \
--data-raw '{
"vectors": {
"size": 100,
"distance": "Cosine"
}
}'
```
```python
from qdrant_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create_collection(
collection_name="{collection_name}",
vectors_config=models.VectorParams(size=100, distance=models.Distance.COSINE),
)
```
```typescript
import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection_name}", {
vectors: { size: 100, distance: "Cosine" },
});
```
```rust
use qdrant_client::Qdrant;
use qdrant_client::qdrant::{CreateCollectionBuilder, VectorParamsBuilder, Distance};
let client = Qdrant::from_url("http://localhost:6334").build()?;
client
.create_collection(
CreateCollectionBuilder::new("{collection_name}")
.vectors_config(VectorParamsBuilder::new(100, Distance::Cosine)),
)
.await?;
```
```java
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.Distance;
import io.qdrant.client.grpc.Collections.VectorParams;
QdrantClient client = new QdrantClient(
QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client.createCollectionAsync("{collection_name}",
VectorParams.newBuilder().setDistance(Distance.Cosine).setSize(100).build()).get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateCollectionAsync(
collectionName: "{collection_name}",
vectorsConfig: new VectorParams { Size = 100, Distance = Distance.Cosine }
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
Size: 100,
Distance: qdrant.Distance_Cosine,
}),
})
```
In addition to the required options, you can also specify custom values for the following collection options:
* `hnsw_config` - see [indexing](/documentation/manage-data/indexing/index.md#vector-index) for details.
* `wal_config` - Write-Ahead-Log related configuration. See more details about [WAL](/documentation/manage-data/storage/index.md#versioning)
* `optimizers_config` - see [optimizer](/documentation/ops-optimization/optimizer/index.md) for details.
* `shard_number` - which defines how many shards the collection should have. See [distributed deployment](/documentation/distributed_deployment/index.md#sharding) section for details.
* `on_disk_payload` - defines where to store payload data. If `true` - payload will be stored on disk only. Might be useful for limiting the RAM usage in case of large payload.
* `quantization_config` - see [quantization](/documentation/manage-data/quantization/index.md#setting-up-quantization-in-qdrant) for details.
* `strict_mode_config` - see [strict mode](/documentation/ops-configuration/administration/index.md#strict-mode) for details.
Default parameters for the optional collection parameters are defined in [configuration file](https://github.com/qdrant/qdrant/blob/master/config/config.yaml).
See [schema definitions](https://api.qdrant.tech/api-reference/collections/create-collection) and a [configuration file](https://github.com/qdrant/qdrant/blob/master/config/config.yaml) for more information about collection and vector parameters.
*Available as of v1.2.0*
Vectors all live in RAM for very quick access. The `on_disk` parameter can be
set in the vector configuration. If true, all vectors will live on disk. This
will enable the use of
[memmaps](/documentation/manage-data/storage/index.md#configuring-memmap-storage),
which is suitable for ingesting a large amount of data.
### Collection with multiple vectors
*Available as of v0.10.0*
It is possible to have multiple vectors per record.
This feature allows for multiple vector storages per collection.
To distinguish vectors in one record, they should have a unique name defined when creating the collection.
Each named vector in this mode has its distance and size:
```http
PUT /collections/{collection_name}
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
```
```bash
curl -X PUT http://localhost:6333/collections/{collection_name} \
-H 'Content-Type: application/json' \
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
```
```python
from qdrant_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create_collection(
collection_name="{collection_name}",
vectors_config={
"image": models.VectorParams(size=4, distance=models.Distance.DOT),
"text": models.VectorParams(size=8, distance=models.Distance.COSINE),
},
)
```
```typescript
import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection_name}", {
vectors: {
image: { size: 4, distance: "Dot" },
text: { size: 8, distance: "Cosine" },
},
});
```
```rust
use qdrant_client::Qdrant;
use qdrant_client::qdrant::{
CreateCollectionBuilder, Distance, VectorParamsBuilder, VectorsConfigBuilder,
};
let client = Qdrant::from_url("http://localhost:6334").build()?;
let mut vectors_config = VectorsConfigBuilder::default();
vectors_config
.add_named_vector_params("image", VectorParamsBuilder::new(4, Distance::Dot).build());
vectors_config.add_named_vector_params(
"text",
VectorParamsBuilder::new(8, Distance::Cosine).build(),
);
client
.create_collection(
CreateCollectionBuilder::new("{collection_name}").vectors_config(vectors_config),
)
.await?;
```
```java
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.Distance;
import io.qdrant.client.grpc.Collections.VectorParams;
import java.util.Map;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createCollectionAsync(
"{collection_name}",
Map.of(
"image", VectorParams.newBuilder().setSize(4).setDistance(Distance.Dot).build(),
"text",
VectorParams.newBuilder().setSize(8).setDistance(Distance.Cosine).build()))
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateCollectionAsync(
collectionName: "{collection_name}",
vectorsConfig: new VectorParamsMap
{
Map =
{
["image"] = new VectorParams { Size = 4, Distance = Distance.Dot },
["text"] = new VectorParams { Size = 8, Distance = Distance.Cosine },
}
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
VectorsConfig: qdrant.NewVectorsConfigMap(
map[string]*qdrant.VectorParams{
"image": {
Size: 4,
Distance: qdrant.Distance_Dot,
},
"text": {
Size: 8,
Distance: qdrant.Distance_Cosine,
},
}),
})
```
For rare use cases, it is possible to create a collection without any vector storage.
*Available as of v1.1.1*
For each named vector you can optionally specify
[`hnsw_config`](/documentation/manage-data/indexing/index.md#vector-index) or
[`quantization_config`](/documentation/manage-data/quantization/index.md#setting-up-quantization-in-qdrant) to
deviate from the collection configuration. This can be useful to fine-tune
search performance on a vector level.
*Available as of v1.2.0*
Vectors all live in RAM for very quick access. On a per-vector basis you can set
`on_disk` to true to store all vectors on disk at all times. This will enable
the use of
[memmaps](/documentation/manage-data/storage/index.md#configuring-memmap-storage),
which is suitable for ingesting a large amount of data.
### Vector datatypes
*Available as of v1.9.0*
Some embedding providers may provide embeddings in a pre-quantized format.
One of the most notable examples is the [Cohere int8 & binary embeddings](https://cohere.com/blog/int8-binary-embeddings).
Qdrant has direct support for uint8 embeddings, which you can also use in combination with binary quantization.
To create a collection with uint8 embeddings, you can use the following configuration:
```http
PUT /collections/{collection_name}
{
"vectors": {
"size": 1024,
"distance": "Cosine",
"datatype": "uint8"
}
}
```
```bash
curl -X PUT http://localhost:6333/collections/{collection_name} \
-H 'Content-Type: application/json' \
--data-raw '{
"vectors": {
"size": 1024,
"distance": "Cosine",
"datatype": "uint8"
}
}'
```
```python
from qdrant_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create_collection(
collection_name="{collection_name}",
vectors_config=models.VectorParams(
size=1024,
distance=models.Distance.COSINE,
datatype=models.Datatype.UINT8,
),
)
```
```typescript
import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection_name}", {
vectors: {
image: { size: 1024, distance: "Cosine", datatype: "uint8" },
},
});
```
```rust
use qdrant_client::Qdrant;
use qdrant_client::qdrant::{
CreateCollectionBuilder, Datatype, Distance, VectorParamsBuilder,
};
let client = Qdrant::from_url("http://localhost:6334").build()?;
client
.create_collection(
CreateCollectionBuilder::new("{collection_name}").vectors_config(
VectorParamsBuilder::new(1024, Distance::Cosine).datatype(Datatype::Uint8),
),
)
.await?;
```
```java
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.Datatype;
import io.qdrant.client.grpc.Collections.Distance;
import io.qdrant.client.grpc.Collections.VectorParams;
QdrantClient client = new QdrantClient(
QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createCollectionAsync("{collection_name}",
VectorParams.newBuilder()
.setSize(1024)
.setDistance(Distance.Cosine)
.setDatatype(Datatype.Uint8)
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateCollectionAsync(
collectionName: "{collection_name}",
vectorsConfig: new VectorParams {
Size = 1024, Distance = Distance.Cosine, Datatype = Datatype.Uint8
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
Size: 1024,
Distance: qdrant.Distance_Cosine,
Datatype: qdrant.Datatype_Uint8.Enum(),
}),
})
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
```http
PUT /collections/{collection_name}
{
"sparse_vectors": {
"text": { }
}
}
```
```bash
curl -X PUT http://localhost:6333/collections/{collection_name} \
-H 'Content-Type: application/json' \
--data-raw '{
"sparse_vectors": {
"text": { }
}
}'
```
```python
from qdrant_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create_collection(
collection_name="{collection_name}",
vectors_config={},
sparse_vectors_config={
"text": models.SparseVectorParams(),
},
)
```
```typescript
import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection_name}", {
sparse_vectors: {
text: { },
},
});
```
```rust
use qdrant_client::Qdrant;
use qdrant_client::qdrant::{
CreateCollectionBuilder, SparseVectorParamsBuilder, SparseVectorsConfigBuilder,
};
let client = Qdrant::from_url("http://localhost:6334").build()?;
let mut sparse_vector_config = SparseVectorsConfigBuilder::default();
sparse_vector_config.add_named_vector_params("text", SparseVectorParamsBuilder::default());
client
.create_collection(
CreateCollectionBuilder::new("{collection_name}")
.sparse_vectors_config(sparse_vector_config),
)
.await?;
```
```java
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.CreateCollection;
import io.qdrant.client.grpc.Collections.SparseVectorConfig;
import io.qdrant.client.grpc.Collections.SparseVectorParams;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createCollectionAsync(
CreateCollection.newBuilder()
.setCollectionName("{collection_name}")
.setSparseVectorsConfig(
SparseVectorConfig.newBuilder()
.putMap("text", SparseVectorParams.getDefaultInstance()))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateCollectionAsync(
collectionName: "{collection_name}",
sparseVectorsConfig: ("text", new SparseVectorParams())
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
SparseVectorsConfig: qdrant.NewSparseVectorsConfig(
map[string]*qdrant.SparseVectorParams{
"text": {},
}),
})
```
Outside of a unique name, there are no required configuration parameters for sparse vectors.
The distance function for sparse vectors is always `Dot` and does not need to be specified.
However, there are optional parameters to tune the underlying [sparse vector index](/documentation/manage-data/indexing/index.md#sparse-vector-index).
### Create collection from another collection
To create a collection from another collection, use the [Migration Tool](https://github.com/qdrant/migration/). You can use it to either copy a collection within the same Qdrant instance or to copy a collection to another instance.
For example, to copy a collection from a local instance to a Qdrant Cloud instance, run the following command:
```bash
docker run --net=host --rm -it registry.cloud.qdrant.io/library/qdrant-migration qdrant \
--source.url 'http://localhost:6334' \
--source.collection 'source-collection' \
--target.url 'https://example.cloud-region.cloud-provider.cloud.qdrant.io:6334' \
--target.api-key 'qdrant-key' \
--target.collection 'target-collection' \
--migration.batch-size 64
```
## Check collection existence
*Available as of v1.8.0*
```http
GET /collections/{collection_name}/exists
```
```bash
curl -X GET http://localhost:6333/collections/{collection_name}/exists
```
```python
client.collection_exists(collection_name="{collection_name}")
```
```typescript
client.collectionExists("{collection_name}");
```
```rust
client.collection_exists("{collection_name}").await?;
```
```java
client.collectionExistsAsync("{collection_name}").get();
```
```csharp
await client.CollectionExistsAsync("{collection_name}");
```
```go
import "context"
client.CollectionExists(context.Background(), "my_collection")
```
## Delete collection
```http
DELETE /collections/{collection_name}
```
```bash
curl -X DELETE http://localhost:6333/collections/{collection_name}
```
```python
client.delete_collection(collection_name="{collection_name}")
```
```typescript
client.deleteCollection("{collection_name}");
```
```rust
client.delete_collection("{collection_name}").await?;
```
```java
client.deleteCollectionAsync("{collection_name}").get();
```
```csharp
await client.DeleteCollectionAsync("{collection_name}");
```
```go
import "context"
client.DeleteCollection(context.Background(), "{collection_name}")
```
## Update collection parameters
Dynamic parameter updates may be helpful, for example, for more efficient initial loading of vectors.
For example, you can disable indexing during the upload process, and enable it immediately after the upload is finished.
As a result, you will not waste extra computation resources on rebuilding the index.
The following command enables indexing for segments that have more than 10000 kB of vectors stored:
```http
PATCH /collections/{collection_name}
{
"optimizers_config": {
"indexing_threshold": 10000
}
}
```
```bash
curl -X PATCH http://localhost:6333/collections/{collection_name} \
-H 'Content-Type: application/json' \
--data-raw '{
"optimizers_config": {
"indexing_threshold": 10000
}
}'
```
```python
client.update_collection(
collection_name="{collection_name}",
optimizers_config=models.OptimizersConfigDiff(indexing_threshold=10000),
)
```
```typescript
client.updateCollection("{collection_name}", {
optimizers_config: {
indexing_threshold: 10000,
},
});
```
```rust
use qdrant_client::qdrant::{OptimizersConfigDiffBuilder, UpdateCollectionBuilder};
client
.update_collection(
UpdateCollectionBuilder::new("{collection_name}").optimizers_config(
OptimizersConfigDiffBuilder::default().indexing_threshold(10000),
),
)
.await?;
```
```java
import io.qdrant.client.grpc.Collections.OptimizersConfigDiff;
import io.qdrant.client.grpc.Collections.UpdateCollection;
client
.updateCollectionAsync(
UpdateCollection.newBuilder()
.setCollectionName("{collection_name}")
.setOptimizersConfig(
OptimizersConfigDiff.newBuilder().setIndexingThreshold(10000).build())
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.UpdateCollectionAsync(
collectionName: "{collection_name}",
optimizersConfig: new OptimizersConfigDiff { IndexingThreshold = 10000 }
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
client.UpdateCollection(context.Background(), &qdrant.UpdateCollection{
CollectionName: "{collection_name}",
OptimizersConfig: &qdrant.OptimizersConfigDiff{
IndexingThreshold: qdrant.PtrOf(uint64(10000)),
},
})
```
The following parameters can be updated:
* `optimizers_config` - see [optimizer](/documentation/ops-optimization/optimizer/index.md) for details.
* `hnsw_config` - see [indexing](/documentation/manage-data/indexing/index.md#vector-index) for details.
* `quantization_config` - see [quantization](/documentation/manage-data/quantization/index.md#setting-up-quantization-in-qdrant) for details.
* `vectors_config` - vector-specific configuration, including individual `hnsw_config`, `quantization_config` and `on_disk` settings.
* `params` - other collection parameters, including `read_fan_out_delay_ms`, `write_consistency_factor` and `on_disk_payload`.
* `strict_mode_config` - see [strict mode](/documentation/ops-configuration/administration/index.md#strict-mode) for details.
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
```http
PATCH /collections/{collection_name}
{
"vectors": {
"": {
"on_disk": true
}
}
}
```
```bash
curl -X PATCH http://localhost:6333/collections/{collection_name} \
-H 'Content-Type: application/json' \
--data-raw '{
"vectors": {
"": {
"on_disk": true
}
}
}'
```
To put vector data on disk for a collection that **does have** named vectors:
Note: To create a vector name, follow the procedure from our [Points](/documentation/manage-data/points/index.md#create-vector-name).
```http
PATCH /collections/{collection_name}
{
"vectors": {
"my_vector": {
"on_disk": true
}
}
}
```
```bash
curl -X PATCH http://localhost:6333/collections/{collection_name} \
-H 'Content-Type: application/json' \
--data-raw '{
"vectors": {
"my_vector": {
"on_disk": true
}
}
}'
```
In the following example the HNSW index and quantization parameters are updated,
both for the whole collection, and for `my_vector` specifically:
```http
PATCH /collections/{collection_name}
{
"vectors": {
"my_vector": {
"hnsw_config": {
"m": 32,
"ef_construct": 123
},
"quantization_config": {
"product": {
"compression": "x32",
"always_ram": true
}
},
"on_disk": true
}
},
"hnsw_config": {
"ef_construct": 123
},
"quantization_config": {
"scalar": {
"type": "int8",
"quantile": 0.8,
"always_ram": false
}
}
}
```
```bash
curl -X PATCH http://localhost:6333/collections/{collection_name} \
-H 'Content-Type: application/json' \
--data-raw '{
"vectors": {
"my_vector": {
"hnsw_config": {
"m": 32,
"ef_construct": 123
},
"quantization_config": {
"product": {
"compression": "x32",
"always_ram": true
}
},
"on_disk": true
}
},
"hnsw_config": {
"ef_construct": 123
},
"quantization_config": {
"scalar": {
"type": "int8",
"quantile": 0.8,
"always_ram": false
}
}
}'
```
```python
client.update_collection(
collection_name="{collection_name}",
vectors_config={
"my_vector": models.VectorParamsDiff(
hnsw_config=models.HnswConfigDiff(
m=32,
ef_construct=123,
),
quantization_config=models.ProductQuantization(
product=models.ProductQuantizationConfig(
compression=models.CompressionRatio.X32,
always_ram=True,
),
),
on_disk=True,
),
},
hnsw_config=models.HnswConfigDiff(
ef_construct=123,
),
quantization_config=models.ScalarQuantization(
scalar=models.ScalarQuantizationConfig(
type=models.ScalarType.INT8,
quantile=0.8,
always_ram=False,
),
),
)
```
```typescript
client.updateCollection("{collection_name}", {
vectors: {
my_vector: {
hnsw_config: {
m: 32,
ef_construct: 123,
},
quantization_config: {
product: {
compression: "x32",
always_ram: true,
},
},
on_disk: true,
},
},
hnsw_config: {
ef_construct: 123,
},
quantization_config: {
scalar: {
type: "int8",
quantile: 0.8,
always_ram: true,
},
},
});
```
```rust
use std::collections::HashMap;
use qdrant_client::qdrant::{
quantization_config_diff::Quantization, vectors_config_diff::Config, HnswConfigDiffBuilder,
QuantizationType, ScalarQuantizationBuilder, UpdateCollectionBuilder, VectorParamsDiffBuilder,
VectorParamsDiffMap,
};
client
.update_collection(
UpdateCollectionBuilder::new("{collection_name}")
.hnsw_config(HnswConfigDiffBuilder::default().ef_construct(123))
.vectors_config(Config::ParamsMap(VectorParamsDiffMap {
map: HashMap::from([(
("my_vector".into()),
VectorParamsDiffBuilder::default()
.hnsw_config(HnswConfigDiffBuilder::default().m(32).ef_construct(123))
.build(),
)]),
}))
.quantization_config(Quantization::Scalar(
ScalarQuantizationBuilder::default()
.r#type(QuantizationType::Int8.into())
.quantile(0.8)
.always_ram(true)
.build(),
)),
)
.await?;
```
```java
import io.qdrant.client.grpc.Collections.HnswConfigDiff;
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
.setCollectionName("{collection_name}")
.setHnswConfig(HnswConfigDiff.newBuilder().setEfConstruct(123).build())
.setVectorsConfig(
VectorsConfigDiff.newBuilder()
.setParamsMap(
VectorParamsDiffMap.newBuilder()
.putMap(
"my_vector",
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
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.UpdateCollectionAsync(
collectionName: "{collection_name}",
hnswConfig: new HnswConfigDiff { EfConstruct = 123 },
vectorsConfig: new VectorParamsDiffMap
{
Map =
{
{
"my_vector",
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
client.UpdateCollection(context.Background(), &qdrant.UpdateCollection{
CollectionName: "{collection_name}",
VectorsConfig: qdrant.NewVectorsConfigDiffMap(
map[string]*qdrant.VectorParamsDiff{
"my_vector": {
HnswConfig: &qdrant.HnswConfigDiff{
M: qdrant.PtrOf(uint64(3)),
EfConstruct: qdrant.PtrOf(uint64(123)),
},
},
}),
QuantizationConfig: qdrant.NewQuantizationDiffScalar(
&qdrant.ScalarQuantization{
Type: qdrant.QuantizationType_Int8,
Quantile: qdrant.PtrOf(float32(0.8)),
AlwaysRam: qdrant.PtrOf(true),
}),
})
```
## Collection info
Qdrant allows determining the configuration parameters of an existing collection to better understand how the points are
distributed and indexed.
```http
GET /collections/{collection_name}
```
```bash
curl -X GET http://localhost:6333/collections/{collection_name}
```
```python
client.get_collection(collection_name="{collection_name}")
```
```typescript
client.getCollection("{collection_name}");
```
```rust
client.collection_info("{collection_name}").await?;
```
```java
client.getCollectionInfoAsync("{collection_name}").get();
```
```csharp
await client.GetCollectionInfoAsync("{collection_name}");
```
```go
import "context"
client.GetCollectionInfo(context.Background(), "{collection_name}")
```
Expected result
```json
{
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
```
If you insert the vectors into the collection, the `status` field may become
`yellow` whilst it is optimizing. It will become `green` once all the points are
successfully processed.
The following color statuses are possible:
- 🟢 `green`: collection is ready
- 🟡 `yellow`: collection is optimizing
- ⚫ `grey`: collection is pending optimization ([help](#grey-collection-status))
- 🔴 `red`: an error occurred which the engine could not recover from
### Grey collection status
_Available as of v1.9.0_
A collection may have the grey ⚫ status or show "optimizations pending,
awaiting update operation" as optimization status. This state is normally caused
by restarting a Qdrant instance while optimizations were ongoing.
It means the collection has optimizations pending, but they are paused. You must
send any update operation to trigger and start the optimizations again.
For example:
```http
PATCH /collections/{collection_name}
{
"optimizers_config": {}
}
```
```bash
curl -X PATCH http://localhost:6333/collections/{collection_name} \
-H 'Content-Type: application/json' \
--data-raw '{
"optimizers_config": {}
}'
```
```python
client.update_collection(
collection_name="{collection_name}",
optimizer_config=models.OptimizersConfigDiff(),
)
```
```typescript
client.updateCollection("{collection_name}", {
optimizers_config: {},
});
```
```rust
use qdrant_client::qdrant::{OptimizersConfigDiffBuilder, UpdateCollectionBuilder};
client
.update_collection(
UpdateCollectionBuilder::new("{collection_name}")
.optimizers_config(OptimizersConfigDiffBuilder::default()),
)
.await?;
```
```java
import io.qdrant.client.grpc.Collections.OptimizersConfigDiff;
import io.qdrant.client.grpc.Collections.UpdateCollection;
client.updateCollectionAsync(
UpdateCollection.newBuilder()
.setCollectionName("{collection_name}")
.setOptimizersConfig(
OptimizersConfigDiff.getDefaultInstance())
.build());
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.UpdateCollectionAsync(
collectionName: "{collection_name}",
optimizersConfig: new OptimizersConfigDiff { }
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
client.UpdateCollection(context.Background(), &qdrant.UpdateCollection{
CollectionName: "{collection_name}",
OptimizersConfig: &qdrant.OptimizersConfigDiff{},
})
```
Alternatively you may use the `Trigger Optimizers` button in the [Qdrant Web UI](/documentation/web-ui/index.md).
It is shown next to the grey collection status on the collection info page.
### Approximate point and vector counts
You may be interested in the count attributes:
- `points_count` - total number of objects (vectors and their payloads) stored in the collection
- `indexed_vectors_count` - total number of vectors stored in the HNSW or sparse index. Qdrant does not store all the vectors in the index, but only if an index segment might be created for a given configuration.
The above counts are not exact, but should be considered approximate. Depending
on how you use Qdrant these may give very different numbers than what you may
expect. It's therefore important **not** to rely on them.
More specifically, these numbers represent the count of points and vectors in
Qdrant's internal storage. Internally, Qdrant may temporarily duplicate points
as part of automatic optimizations. It may keep changed or deleted points for a
bit. And it may delay indexing of new points. All of that is for optimization
reasons.
Updates you do are therefore not directly reflected in these numbers. If you see
a wildly different count of points, it will likely resolve itself once a new
round of automatic optimizations is completed.
To clarify: these numbers don't represent the exact amount of points or vectors
you have inserted, nor does it represent the exact number of distinguishable
points or vectors you can query. If you want to know exact counts, refer to the
[count API](/documentation/manage-data/points/index.md#counting-points).
_Note: these numbers may be removed in a future version of Qdrant._
### Indexing vectors in HNSW
In some cases, you might be surprised the value of `indexed_vectors_count` is lower than you expected. This is an intended behaviour and
depends on the [optimizer configuration](/documentation/ops-optimization/optimizer/index.md). A new index segment is built if the size of non-indexed vectors is higher than the
value of `indexing_threshold`(in kB). If your collection is very small or the dimensionality of the vectors is low, there might be no HNSW segment
created and `indexed_vectors_count` might be equal to `0`.
It is possible to reduce the `indexing_threshold` for an existing collection by [updating collection parameters](#update-collection-parameters).
### Collection metadata
*Available as of v1.16.0*
For convenience and better data organization, Qdrant allows attaching custom metadata to collections in the form of key-value pairs.
Adding metadata is treated as a part of collection configuration and synchronized across all nodes in a cluster with consensus protocol.
Collection metadata can be specified during collection creation:
```http
PUT /collections/{collection_name}
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
```
```bash
curl -X PUT http://localhost:6333/collections/{collection_name} \
-H 'Content-Type: application/json' \
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
```
```python
from qdrant_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create_collection(
collection_name="{collection_name}",
metadata={
"my-metadata-field": "value-1",
"another-field": 123
},
)
```
```typescript
import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection_name}", {
vectors: { size: 100, distance: "Cosine" },
metadata: {
"my-metadata-field": "value-1",
"another-field": 123
}
});
```
```rust
use qdrant_client::qdrant::{CreateCollectionBuilder, Distance, VectorParamsBuilder};
use qdrant_client::Qdrant;
use serde_json::{json, Value};
use std::collections::HashMap;
let client = Qdrant::from_url("http://localhost:6334").build()?;
let mut metadata: HashMap = HashMap::new();
metadata.insert("my-metadata-field".to\_string(), json!("value-1"));
metadata.insert("another-field".to\_string(), json!(123));
client
.create\_collection(
CreateCollectionBuilder::new("{collection\_name}")
.vectors\_config(VectorParamsBuilder::new(100, Distance::Cosine))
.metadata(metadata),
)
.await?;
```
```java
import static io.qdrant.client.ValueFactory.value;
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
```
```csharp
using Qdrant.Client;
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
```
as well as updated later:
```http
PATCH /collections/{collection\_name}
{
"metadata": {
"my-metadata-field": {
"key-a": "value-a",
"key-b": 42
}
}
}
```
```bash
curl -X PATCH http://localhost:6333/collections/{collection\_name} \\
-H 'Content-Type: application/json' \\
--data-raw '{
"metadata": {
"my-metadata-field": {
"key-a": "value-a",
"key-b": 42
}
}
}'
```
```python
client.update\_collection(
collection\_name="{collection\_name}",
metadata={
"my-metadata-field": {
"key-a": "value-a",
"key-b": 42
}
},
)
```
```typescript
client.updateCollection("{collection\_name}", {
metadata: {
"my-metadata-field": {
"key-a": "value-a",
"key-b": 42
}
},
});
```
```rust
use qdrant\_client::qdrant::{UpdateCollectionBuilder};
use qdrant\_client::Qdrant;
use serde\_json::{json, Value};
use std::collections::HashMap;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
let mut metadata: HashMap = HashMap::new();
metadata.insert("my-metadata-field".to\_string(), json!({
"key-a": "value-a",
"key-b": 42
}));
client
.update\_collection(
UpdateCollectionBuilder::new("{collection\_name}").metadata(metadata),
)
.await?;
```
```java
import static io.qdrant.client.ValueFactory.value;
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
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.UpdateCollectionAsync(
collectionName: "{collection\_name}",
optimizersConfig: new OptimizersConfigDiff { IndexingThreshold = 10000 },
metadata: new()
{
["my-metadata-field"] = new Dictionary
{
["key-a"] = "value-a",
["key-b"] = 42
},
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
```
Note, that update operation only modifies the specified metadata fields, leaving other fields unchanged.
When specified, metadata is returned as part of collection info:
``` json
{
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
```http
POST /collections/aliases
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
```
```bash
curl -X POST http://localhost:6333/collections/aliases \\
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
```
```python
client.update\_collection\_aliases(
change\_aliases\_operations=[
models.CreateAliasOperation(
create\_alias=models.CreateAlias(
collection\_name="example\_collection", alias\_name="production\_collection"
)
)
]
)
```
```typescript
client.updateCollectionAliases({
actions: [
{
create\_alias: {
collection\_name: "example\_collection",
alias\_name: "production\_collection",
},
},
],
});
```
```rust
use qdrant\_client::qdrant::CreateAliasBuilder;
client
.create\_alias(CreateAliasBuilder::new(
"example\_collection",
"production\_collection",
))
.await?;
```
```java
client.createAliasAsync("production\_collection", "example\_collection").get();
```
```csharp
await client.CreateAliasAsync(aliasName: "production\_collection", collectionName: "example\_collection");
```
```go
import "context"
client.CreateAlias(context.Background(), "production\_collection", "example\_collection")
```
### Remove alias
```http
POST /collections/aliases
{
"actions": [
{
"delete\_alias": {
"alias\_name": "production\_collection"
}
}
]
}
```
```bash
curl -X POST http://localhost:6333/collections/aliases \\
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
```
```python
client.update\_collection\_aliases(
change\_aliases\_operations=[
models.DeleteAliasOperation(
delete\_alias=models.DeleteAlias(alias\_name="production\_collection")
),
]
)
```
```typescript
client.updateCollectionAliases({
actions: [
{
delete\_alias: {
alias\_name: "production\_collection",
},
},
],
});
```
```rust
client.delete\_alias("production\_collection").await?;
```
```java
client.deleteAliasAsync("production\_collection").get();
```
```csharp
await client.DeleteAliasAsync("production\_collection");
```
```go
import "context"
client.DeleteAlias(context.Background(), "production\_collection")
```
### Switch collection
Multiple alias actions are performed atomically.
For example, you can switch underlying collection with the following command:
```http
POST /collections/aliases
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
```
```bash
curl -X POST http://localhost:6333/collections/aliases \\
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
```
```python
client.update\_collection\_aliases(
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
```
```typescript
client.updateCollectionAliases({
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
```
```rust
use qdrant\_client::qdrant::CreateAliasBuilder;
client.delete\_alias("production\_collection").await?;
client
.create\_alias(CreateAliasBuilder::new(
"example\_collection",
"production\_collection",
))
.await?;
```
```java
client.deleteAliasAsync("production\_collection").get();
client.createAliasAsync("production\_collection", "example\_collection").get();
```
```csharp
await client.DeleteAliasAsync("production\_collection");
await client.CreateAliasAsync(aliasName: "production\_collection", collectionName: "example\_collection");
```
```go
import "context"
client.DeleteAlias(context.Background(), "production\_collection")
client.CreateAlias(context.Background(), "production\_collection", "example\_collection")
```
### List collection aliases
```http
GET /collections/{collection\_name}/aliases
```
```bash
curl -X GET http://localhost:6333/collections/{collection\_name}/aliases
```
```python
from qdrant\_client import QdrantClient
client = QdrantClient(url="http://localhost:6333")
client.get\_collection\_aliases(collection\_name="{collection\_name}")
```
```typescript
import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.getCollectionAliases("{collection\_name}");
```
```rust
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client.list\_collection\_aliases("{collection\_name}").await?;
```
```java
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client.listCollectionAliasesAsync("{collection\_name}").get();
```
```csharp
using Qdrant.Client;
var client = new QdrantClient("localhost", 6334);
await client.ListCollectionAliasesAsync("{collection\_name}");
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
client.ListCollectionAliases(context.Background(), "{collection\_name}")
```
### List all aliases
```http
GET /aliases
```
```bash
curl -X GET http://localhost:6333/aliases
```
```python
from qdrant\_client import QdrantClient
client = QdrantClient(url="http://localhost:6333")
client.get\_aliases()
```
```typescript
import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.getAliases();
```
```rust
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client.list\_aliases().await?;
```
```java
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client.listAliasesAsync().get();
```
```csharp
using Qdrant.Client;
var client = new QdrantClient("localhost", 6334);
await client.ListAliasesAsync();
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
client.ListAliases(context.Background())
```
### List all collections
```http
GET /collections
```
```bash
curl -X GET http://localhost:6333/collections
```
```python
from qdrant\_client import QdrantClient
client = QdrantClient(url="http://localhost:6333")
client.get\_collections()
```
```typescript
import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.getCollections();
```
```rust
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client.list\_collections().await?;
```
```java
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client.listCollectionsAsync().get();
```
```csharp
using Qdrant.Client;
var client = new QdrantClient("localhost", 6334);
await client.ListCollectionsAsync();
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
client.ListCollections(context.Background())
```