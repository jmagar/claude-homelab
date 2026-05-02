Multitenancy - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Manage Data](https://qdrant.tech/documentation/manage-data/)
*
* Multitenancy# Configure Multitenancy
It is not recommended to create hundreds and thousands of collections per cluster as it increases resource overhead unsustainably. Eventually this will lead to increased costs and at some point performance degradation and cluster instability. In Qdrant Cloud, we limit the amount of collections per cluster to 1000.
**How many collections should you create?** In most cases, a single collection per embedding model with payload-based partitioning for different tenants and use cases. This approach is called multitenancy. It is efficient for most users, but requires additional configuration. This document will show you how to set it up.
**When should you create multiple collections?** When you have a limited number of users and you need isolation. This approach is flexible, but it may be more costly, since creating numerous collections may result in resource overhead. Also, you need to ensure that they do not affect each other in any way, including performance-wise.
## Partition by payload
When an instance is shared between multiple users, you may need to partition vectors by user. This is done so that each user can only access their own vectors and can&rsquo;t see the vectors of other users.
Note: The key doesn't necessarily need to be named `group\_id`. You can choose a name that best suits your data structure and naming conventions.
```
`PUT /collections/{collection\_name}/points
{
"points": [
{
"id": 1,
"payload": {"group\_id": "user\_1"},
"vector": [0.9, 0.1, 0.1]
},
{
"id": 2,
"payload": {"group\_id": "user\_1"},
"vector": [0.1, 0.9, 0.1]
},
{
"id": 3,
"payload": {"group\_id": "user\_2"},
"vector": [0.1, 0.1, 0.9]
},
]
}
`
```
```
`client.upsert(
collection\_name="{collection\_name}",
points=[
models.PointStruct(
id=1,
payload={"group\_id": "user\_1"},
vector=[0.9, 0.1, 0.1],
),
models.PointStruct(
id=2,
payload={"group\_id": "user\_1"},
vector=[0.1, 0.9, 0.1],
),
models.PointStruct(
id=3,
payload={"group\_id": "user\_2"},
vector=[0.1, 0.1, 0.9],
),
],
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.upsert("{collection\_name}", {
points: [
{
id: 1,
payload: { group\_id: "user\_1" },
vector: [0.9, 0.1, 0.1],
},
{
id: 2,
payload: { group\_id: "user\_1" },
vector: [0.1, 0.9, 0.1],
},
{
id: 3,
payload: { group\_id: "user\_2" },
vector: [0.1, 0.1, 0.9],
},
],
});
`
```
```
`use qdrant\_client::qdrant::{PointStruct, UpsertPointsBuilder};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.upsert\_points(UpsertPointsBuilder::new(
"{collection\_name}",
vec![
PointStruct::new(1, vec![0.9, 0.1, 0.1], [("group\_id", "user\_1".into())]),
PointStruct::new(2, vec![0.1, 0.9, 0.1], [("group\_id", "user\_1".into())]),
PointStruct::new(3, vec![0.1, 0.1, 0.9], [("group\_id", "user\_2".into())]),
],
))
.await?;
`
```
```
`import static io.qdrant.client.PointIdFactory.id;
import static io.qdrant.client.ValueFactory.value;
import static io.qdrant.client.VectorsFactory.vectors;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.PointStruct;
import java.util.List;
import java.util.Map;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.upsertAsync(
"{collection\_name}",
List.of(
PointStruct.newBuilder()
.setId(id(1))
.setVectors(vectors(0.9f, 0.1f, 0.1f))
.putAllPayload(Map.of("group\_id", value("user\_1")))
.build(),
PointStruct.newBuilder()
.setId(id(2))
.setVectors(vectors(0.1f, 0.9f, 0.1f))
.putAllPayload(Map.of("group\_id", value("user\_1")))
.build(),
PointStruct.newBuilder()
.setId(id(3))
.setVectors(vectors(0.1f, 0.1f, 0.9f))
.putAllPayload(Map.of("group\_id", value("user\_2")))
.build()))
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.UpsertAsync(
collectionName: "{collection\_name}",
points: new List\<PointStruct\>
{
new()
{
Id = 1,
Vectors = new[] { 0.9f, 0.1f, 0.1f },
Payload = { ["group\_id"] = "user\_1" }
},
new()
{
Id = 2,
Vectors = new[] { 0.1f, 0.9f, 0.1f },
Payload = { ["group\_id"] = "user\_1" }
},
new()
{
Id = 3,
Vectors = new[] { 0.1f, 0.1f, 0.9f },
Payload = { ["group\_id"] = "user\_2" }
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
client.Upsert(context.Background(), &qdrant.UpsertPoints{
CollectionName: "{collection\_name}",
Points: []\*qdrant.PointStruct{
{
Id: qdrant.NewIDNum(1),
Vectors: qdrant.NewVectors(0.9, 0.1, 0.1),
Payload: qdrant.NewValueMap(map[string]any{"group\_id": "user\_1"}),
},
{
Id: qdrant.NewIDNum(2),
Vectors: qdrant.NewVectors(0.1, 0.9, 0.1),
Payload: qdrant.NewValueMap(map[string]any{"group\_id": "user\_1"}),
},
{
Id: qdrant.NewIDNum(3),
Vectors: qdrant.NewVectors(0.1, 0.1, 0.9),
Payload: qdrant.NewValueMap(map[string]any{"group\_id": "user\_2"}),
},
},
})
`
```
1. Use a filter along with `group\_id` to filter vectors for each user.
```
`POST /collections/{collection\_name}/points/query
{
"query": [0.1, 0.1, 0.9],
"filter": {
"must": [
{
"key": "group\_id",
"match": {
"value": "user\_1"
}
}
]
},
"limit": 10
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.query\_points(
collection\_name="{collection\_name}",
query=[0.1, 0.1, 0.9],
query\_filter=models.Filter(
must=[
models.FieldCondition(
key="group\_id",
match=models.MatchValue(
value="user\_1",
),
)
]
),
limit=10,
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.query("{collection\_name}", {
query: [0.1, 0.1, 0.9],
filter: {
must: [{ key: "group\_id", match: { value: "user\_1" } }],
},
limit: 10,
});
`
```
```
`use qdrant\_client::qdrant::{Condition, Filter, QueryPointsBuilder};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.query(
QueryPointsBuilder::new("{collection\_name}")
.query(vec![0.1, 0.1, 0.9])
.limit(10)
.filter(Filter::must([Condition::matches(
"group\_id",
"user\_1".to\_string(),
)])),
)
.await?;
`
```
```
`import static io.qdrant.client.ConditionFactory.matchKeyword;
import static io.qdrant.client.QueryFactory.nearest;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Common.Filter;
import io.qdrant.client.grpc.Points.QueryPoints;
import java.util.List;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("{collection\_name}")
.setFilter(
Filter.newBuilder().addMust(matchKeyword("group\_id", "user\_1")).build())
.setQuery(nearest(0.1f, 0.1f, 0.9f))
.setLimit(10)
.build())
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
using static Qdrant.Client.Grpc.Conditions;
var client = new QdrantClient("localhost", 6334);
await client.QueryAsync(
collectionName: "{collection\_name}",
query: new float[] { 0.1f, 0.1f, 0.9f },
filter: MatchKeyword("group\_id", "user\_1"),
limit: 10
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
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "{collection\_name}",
Query: qdrant.NewQuery(0.1, 0.1, 0.9),
Filter: &qdrant.Filter{
Must: []\*qdrant.Condition{
qdrant.NewMatch("group\_id", "user\_1"),
},
},
})
`
```
## Calibrate performance
The speed of indexation may become a bottleneck in this case, as each user&rsquo;s vector will be indexed into the same collection. To avoid this bottleneck, consider *bypassing the construction of a global vector index* for the entire collection and building it only for individual groups instead.
By adopting this strategy, Qdrant will index vectors for each user independently, significantly accelerating the process.
To implement this approach, you should:
1. Set `payload\_m` in the HNSW configuration to a non-zero value, such as 16.
2. Set `m` in hnsw config to 0. This will disable building global index for the whole collection.
```
`PUT /collections/{collection\_name}
{
"vectors": {
"size": 768,
"distance": "Cosine"
},
"hnsw\_config": {
"payload\_m": 16,
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
payload\_m=16,
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
payload\_m: 16,
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
.hnsw\_config(HnswConfigDiffBuilder::default().payload\_m(16).m(0)),
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
.setHnswConfig(HnswConfigDiff.newBuilder().setPayloadM(16).setM(0).build())
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
hnswConfig: new HnswConfigDiff { PayloadM = 16, M = 0 }
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
PayloadM: qdrant.PtrOf(uint64(16)),
M: qdrant.PtrOf(uint64(0)),
},
})
`
```
1. Create keyword payload index for `group\_id` field.`is\_tenant` parameter is available as of v1.11.0. Previous versions should use default options for keyword index creation.
```
`PUT /collections/{collection\_name}/index
{
"field\_name": "group\_id",
"field\_schema": {
"type": "keyword",
"is\_tenant": true
}
}
`
```
```
`client.create\_payload\_index(
collection\_name="{collection\_name}",
field\_name="group\_id",
field\_schema=models.KeywordIndexParams(
type=models.KeywordIndexType.KEYWORD,
is\_tenant=True,
),
)
`
```
```
`client.createPayloadIndex("{collection\_name}", {
field\_name: "group\_id",
field\_schema: {
type: "keyword",
is\_tenant: true,
},
});
`
```
```
`use qdrant\_client::qdrant::{
CreateFieldIndexCollectionBuilder,
KeywordIndexParamsBuilder,
FieldType
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client.create\_field\_index(
CreateFieldIndexCollectionBuilder::new(
"{collection\_name}",
"group\_id",
FieldType::Keyword,
).field\_index\_params(
KeywordIndexParamsBuilder::default()
.is\_tenant(true)
)
).await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.KeywordIndexParams;
import io.qdrant.client.grpc.Collections.PayloadIndexParams;
import io.qdrant.client.grpc.Collections.PayloadSchemaType;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createPayloadIndexAsync(
"{collection\_name}",
"group\_id",
PayloadSchemaType.Keyword,
PayloadIndexParams.newBuilder()
.setKeywordIndexParams(
KeywordIndexParams.newBuilder()
.setIsTenant(true)
.build())
.build(),
null,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreatePayloadIndexAsync(
collectionName: "{collection\_name}",
fieldName: "group\_id",
schemaType: PayloadSchemaType.Keyword,
indexParams: new PayloadIndexParams
{
KeywordIndexParams = new KeywordIndexParams
{
IsTenant = true
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
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "{collection\_name}",
FieldName: "group\_id",
FieldType: qdrant.FieldType\_FieldTypeKeyword.Enum(),
FieldIndexParams: qdrant.NewPayloadIndexParams(
&qdrant.KeywordIndexParams{
IsTenant: qdrant.PtrOf(true),
}),
})
`
```
`is\_tenant=true` parameter is optional, but specifying it provides storage with additional information about the usage patterns the collection is going to use.
When specified, storage structure will be organized in a way to co-locate vectors of the same tenant together, which can significantly improve performance by utilizing sequential reads during queries.
Grouping tenants together by tenant ID, if `is\_tenant=true` is used
### Limitations
One downside to this approach is that global requests (without the `group\_id` filter) will be slower since they will necessitate scanning all groups to identify the nearest neighbors.
## Tiered multitenancy
In some real-world applications, tenants might not be equally distributed. For example, a SaaS application might have a few large customers and many small ones.
Large tenants might require extended resources and isolation, while small tenants should not create too much overhead.
One solution to this problem might be to introduce application-level logic to separate tenants into different collections based on their size or resource requirements.
There is, however, a downside to this approach: we might not know in advance which tenants will be large and which stay small.
In addition, application-level logic increases complexity of the system and requires additional source of truth for tenant placement management.
To address this problem, in v1.16.0 Qdrant provides a built-in mechanism for tiered multitenancy.
With tiered multitenancy, you can implement two levels of tenant isolation within a single collection, keeping small tenants together inside a shared Shard, while isolating large tenants into their own dedicated Shards.
There are 3 components in Qdrant, that allows you to implement tiered multitenancy:
* [**User-defined Sharding**](https://qdrant.tech/documentation/distributed_deployment/#user-defined-sharding) allows you to create named Shards within a collection. It allows to isolate large tenants into their own Shards.
* **Fallback shards** - a special routing mechanism that allows to route request to either a dedicated Shard (if it exists) or to a shared Fallback Shard. It allows to keep requests unified, without the need to know whether a tenant is dedicated or shared.
* **Tenant promotion** - a mechanism that allows to move tenants from the shared Fallback Shard to their own dedicated Shard when they grow large enough. This process is based on Qdrant&rsquo;s internal shard transfer mechanism, which makes promotion completely transparent for the application. Both read and write requests are supported during the promotion process.
Tiered multitenancy with tenant promotion
### Configure tiered multitenancy
To take advantage of tiered multitenancy, you need to create a collection with user-defined (aka `custom`) sharding and create a Fallback Shard in it.
```
`PUT /collections/{collection\_name}
{
"shard\_number": 1,
"sharding\_method": "custom"
// ... other collection parameters
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_collection(
collection\_name="{collection\_name}",
shard\_number=1,
sharding\_method=models.ShardingMethod.CUSTOM,
# ... other collection parameters
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createCollection("{collection\_name}", {
shard\_number: 1,
sharding\_method: "custom",
// ... other collection parameters
});
`
```
```
`use qdrant\_client::qdrant::{
CreateCollectionBuilder, Distance, ShardingMethod, VectorParamsBuilder,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.create\_collection(
CreateCollectionBuilder::new("{collection\_name}")
.vectors\_config(VectorParamsBuilder::new(300, Distance::Cosine))
.shard\_number(1)
.sharding\_method(ShardingMethod::Custom.into()),
)
.await?;
`
```
```
`import static io.qdrant.client.ShardKeyFactory.shardKey;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.CreateCollection;
import io.qdrant.client.grpc.Collections.ShardingMethod;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createCollectionAsync(
CreateCollection.newBuilder()
.setCollectionName("{collection\_name}")
// ... other collection parameters
.setShardNumber(1)
.setShardingMethod(ShardingMethod.Custom)
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
// ... other collection parameters
shardNumber: 1,
shardingMethod: ShardingMethod.Custom
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
// ... other collection parameters
ShardNumber: qdrant.PtrOf(uint32(1)),
ShardingMethod: qdrant.ShardingMethod\_Custom.Enum(),
})
`
```
Start with creating a fallback Shard, which will be used to store small tenants.
Let&rsquo;s name it `default`.
```
`PUT /collections/{collection\_name}/shards
{
"shard\_key": "default"
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_shard\_key("{collection\_name}", "default")
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createShardKey("{collection\_name}", {
shard\_key: "default"
});
`
```
```
`use qdrant\_client::qdrant::{
CreateShardKeyBuilder, CreateShardKeyRequestBuilder
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.create\_shard\_key(
CreateShardKeyRequestBuilder::new("{collection\_name}")
.request(CreateShardKeyBuilder::default().shard\_key("default".to\_string())),
)
.await?;
`
```
```
`import static io.qdrant.client.ShardKeyFactory.shardKey;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.CreateShardKey;
import io.qdrant.client.grpc.Collections.CreateShardKeyRequest;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client.createShardKeyAsync(CreateShardKeyRequest.newBuilder()
.setCollectionName("{collection\_name}")
.setRequest(CreateShardKey.newBuilder()
.setShardKey(shardKey("default"))
.build())
.build()).get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateShardKeyAsync(
"{collection\_name}",
new CreateShardKey { ShardKey = new ShardKey { Keyword = "default", } }
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
client.CreateShardKey(context.Background(), "{collection\_name}", &qdrant.CreateShardKey{
ShardKey: qdrant.NewShardKey("default"),
})
`
```
Since the collection will allow both dedicated and shared tenants, we need still need to configure payload-based tenancy for this collection the same way as described in the [Partition by payload](#partition-by-payload) section above. Namely, we need to create a payload index for the `group\_id` field with `is\_tenant=true`.
```
`PUT /collections/{collection\_name}/index
{
"field\_name": "group\_id",
"field\_schema": {
"type": "keyword",
"is\_tenant": true
}
}
`
```
```
`client.create\_payload\_index(
collection\_name="{collection\_name}",
field\_name="group\_id",
field\_schema=models.KeywordIndexParams(
type=models.KeywordIndexType.KEYWORD,
is\_tenant=True,
),
)
`
```
```
`client.createPayloadIndex("{collection\_name}", {
field\_name: "group\_id",
field\_schema: {
type: "keyword",
is\_tenant: true,
},
});
`
```
```
`use qdrant\_client::qdrant::{
CreateFieldIndexCollectionBuilder,
KeywordIndexParamsBuilder,
FieldType
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client.create\_field\_index(
CreateFieldIndexCollectionBuilder::new(
"{collection\_name}",
"group\_id",
FieldType::Keyword,
).field\_index\_params(
KeywordIndexParamsBuilder::default()
.is\_tenant(true)
)
).await?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.KeywordIndexParams;
import io.qdrant.client.grpc.Collections.PayloadIndexParams;
import io.qdrant.client.grpc.Collections.PayloadSchemaType;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.createPayloadIndexAsync(
"{collection\_name}",
"group\_id",
PayloadSchemaType.Keyword,
PayloadIndexParams.newBuilder()
.setKeywordIndexParams(
KeywordIndexParams.newBuilder()
.setIsTenant(true)
.build())
.build(),
null,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreatePayloadIndexAsync(
collectionName: "{collection\_name}",
fieldName: "group\_id",
schemaType: PayloadSchemaType.Keyword,
indexParams: new PayloadIndexParams
{
KeywordIndexParams = new KeywordIndexParams
{
IsTenant = true
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
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "{collection\_name}",
FieldName: "group\_id",
FieldType: qdrant.FieldType\_FieldTypeKeyword.Enum(),
FieldIndexParams: qdrant.NewPayloadIndexParams(
&qdrant.KeywordIndexParams{
IsTenant: qdrant.PtrOf(true),
}),
})
`
```
### Query tiered multitenant collection
Now we can start uploading data into the collection. One important difference from the simple payload-based multitenancy is that now we need to specify the **Shard Key Selector** in each request to route requests to the correct Shard.
Shard Key Selector will specify two keys:
* `target` shard - name of the tenant&rsquo;s dedicated Shard (which may or may not exist).
* `fallback` shard - name of the shared Fallback Shard (in our case, `default`).
```
`PUT /collections/{collection\_name}/points
{
"points": [
{
"id": 1,
"payload": {"group\_id": "user\_1"},
"vector": [0.9, 0.1, 0.1]
}
],
"shard\_key": {
"fallback": "default",
"target": "user\_1"
}
}
`
```
```
`client.upsert(
collection\_name="{collection\_name}",
points=[
models.PointStruct(
id=1,
payload={"group\_id": "user\_1"},
vector=[0.9, 0.1, 0.1],
),
],
shard\_key\_selector=models.ShardKeyWithFallback(
target="user\_1",
fallback="default"
)
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.upsert("{collection\_name}", {
points: [
{
id: 1,
payload: { group\_id: "user\_1" },
vector: [0.9, 0.1, 0.1],
}
],
shard\_key: {
target: "user\_1",
fallback: "default"
}
});
`
```
```
`use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{PointStruct, ShardKeySelectorBuilder, UpsertPointsBuilder};
let client = Qdrant::from\_url("http://localhost:6334").build()?;
let shard\_key\_selector = ShardKeySelectorBuilder::with\_shard\_key("user\_1")
.fallback("default")
.build();
client
.upsert\_points(
UpsertPointsBuilder::new(
"{collection\_name}",
vec![
PointStruct::new(
1,
vec![0.9, 0.1, 0.1],
[("group\_id", "user\_1".into())]
),
],
)
.shard\_key\_selector(shard\_key\_selector),
)
.await?;
`
```
```
`import static io.qdrant.client.PointIdFactory.id;
import static io.qdrant.client.ShardKeyFactory.shardKey;
import static io.qdrant.client.ValueFactory.value;
import static io.qdrant.client.VectorsFactory.vectors;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.PointStruct;
import io.qdrant.client.grpc.Points.ShardKeySelector;
import io.qdrant.client.grpc.Points.UpsertPoints;
import java.util.List;
import java.util.Map;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.upsertAsync(
UpsertPoints.newBuilder()
.setCollectionName("{collection\_name}")
.addAllPoints(
List.of(
PointStruct.newBuilder()
.setId(id(1))
.setVectors(vectors(0.9f, 0.1f, 0.1f))
.putAllPayload(Map.of("group\_id", value("user\_1")))
.build()))
.setShardKeySelector(
ShardKeySelector.newBuilder()
.addShardKeys(shardKey("user\_1"))
.setFallback(shardKey("default"))
.build())
.build())
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.UpsertAsync(
collectionName: "{collection\_name}",
points: new List\<PointStruct\>
{
new()
{
Id = 1,
Vectors = new[] { 0.9f, 0.1f, 0.1f },
Payload = { ["group\_id"] = "user\_1" }
}
},
shardKeySelector: new ShardKeySelector {
ShardKeys = { new List\<ShardKey\> { "user\_1" } },
Fallback = new ShardKey { Keyword = "default" }
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
client.Upsert(context.Background(), &qdrant.UpsertPoints{
CollectionName: "{collection\_name}",
Points: []\*qdrant.PointStruct{
{
Id: qdrant.NewIDNum(1),
Vectors: qdrant.NewVectors(0.9, 0.1, 0.1),
Payload: qdrant.NewValueMap(map[string]any{"group\_id": "user\_1"}),
},
},
ShardKeySelector: &qdrant.ShardKeySelector{
ShardKeys: []\*qdrant.ShardKey{
qdrant.NewShardKey("user\_1"),
},
Fallback: qdrant.NewShardKey("default"),
},
})
`
```
The routing logic will work as follows:
* If the `target` Shard exists and active, the request will be routed to it.
* If the `target` Shard does not exist, the request will be routed to the `fallback` Shard.
Similarly, when querying points, we need to specify the Shard Key Selector and filter by `group\_id`.
Note, that filter match value should always match the `target` Shard Key.
### Promote tenant to dedicated Shard
When a tenant grows large enough, you can promote it to its own dedicated Shard.
In order to do that, you first need to create a new Shard for the tenant:
```
`PUT /collections/{collection\_name}/shards
{
"shard\_key": "user\_1",
"initial\_state": "Partial"
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.create\_shard\_key(
"{collection\_name}",
shard\_key="user\_1",
initial\_state=models.ReplicaState.PARTIAL
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.createShardKey("{collection\_name}", {
shard\_key: "default",
initial\_state: "Partial"
});
`
```
```
`use qdrant\_client::qdrant::{
CreateShardKeyBuilder, CreateShardKeyRequestBuilder
};
use qdrant\_client::qdrant::ReplicaState;
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.create\_shard\_key(
CreateShardKeyRequestBuilder::new("{collection\_name}")
.request(
CreateShardKeyBuilder::default()
.shard\_key("user\_1".to\_string())
.initial\_state(ReplicaState::Partial)
),
)
.await?;
`
```
```
`import static io.qdrant.client.ShardKeyFactory.shardKey;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.CreateShardKey;
import io.qdrant.client.grpc.Collections.CreateShardKeyRequest;
import io.qdrant.client.grpc.Collections.ReplicaState;
import io.qdrant.client.grpc.Common.Filter;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client.createShardKeyAsync(CreateShardKeyRequest.newBuilder()
.setCollectionName("{collection\_name}")
.setRequest(CreateShardKey.newBuilder()
.setShardKey(shardKey("default"))
.setInitialState(ReplicaState.Partial)
.build())
.build()).get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.CreateShardKeyAsync(
"{collection\_name}",
new CreateShardKey {
ShardKey = new ShardKey { Keyword = "default" },
InitialState = ReplicaState.Partial
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
client.CreateShardKey(
context.Background(),
"{collection\_name}",
&qdrant.CreateShardKey{
ShardKey: qdrant.NewShardKey("default"),
InitialState: qdrant.PtrOf(qdrant.ReplicaState\_Partial),
},
)
`
```
Note, that we create a Shard in `Partial` state, since it would still need to transfer data into it.
To initiate data transfer, there is another API method called `replicate\_points`:
```
`POST /collections/{collection\_name}/cluster
{
"replicate\_points": {
"filter": {
"must": {
"key": "group\_id",
"match": {
"value": "user\_1"
}
}
},
"from\_shard\_key": "default",
"to\_shard\_key": "user\_1"
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.cluster\_collection\_update(
collection\_name="{collection\_name}",
cluster\_operation=models.ReplicatePointsOperation(
replicate\_points=models.ReplicatePoints(
from\_shard\_key="default",
to\_shard\_key="user\_1",
filter=models.Filter(
must=[
models.FieldCondition(
key="group\_id",
match=models.MatchValue(
value="user\_1",
)
)
]
)
)
)
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.updateCollectionCluster("{collection\_name}", {
replicate\_points: {
filter: {
must: {
key: "group\_id",
match: {
value: "user\_1"
}
}
},
from\_shard\_key: "default",
to\_shard\_key: "user\_1"
}
});
`
```
```
`use qdrant\_client::qdrant::{
update\_collection\_cluster\_setup\_request::Operation, Condition, Filter,
ReplicatePointsBuilder, ShardKey, UpdateCollectionClusterSetupRequest,
};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.update\_collection\_cluster\_setup(UpdateCollectionClusterSetupRequest {
collection\_name: "{collection\_name}".to\_string(),
operation: Some(Operation::ReplicatePoints(
ReplicatePointsBuilder::new(
ShardKey::from("default"),
ShardKey::from("user\_1"),
)
.filter(Filter::must([Condition::matches(
"group\_id",
"user\_1".to\_string(),
)]))
.build(),
)),
timeout: None,
})
.await?;
`
```
```
`import static io.qdrant.client.ConditionFactory.matchKeyword;
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.ShardKeyFactory.shardKey;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.ReplicatePoints;
import io.qdrant.client.grpc.Collections.UpdateCollectionClusterSetupRequest;
import io.qdrant.client.grpc.Common.Filter;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.updateCollectionClusterSetupAsync(
UpdateCollectionClusterSetupRequest.newBuilder()
.setCollectionName("{collection\_name}")
.setReplicatePoints(
ReplicatePoints.newBuilder()
.setFromShardKey(shardKey("default"))
.setToShardKey(shardKey("user\_1"))
.setFilter(
Filter.newBuilder().addMust(matchKeyword("group\_id", "user\_1")).build())
.build())
.build())
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
using static Qdrant.Client.Grpc.Conditions;
var client = new QdrantClient("localhost", 6334);
await client.UpdateCollectionClusterSetupAsync(new()
{
CollectionName = "{collection\_name}",
ReplicatePoints = new()
{
FromShardKey = "default",
ToShardKey = "user\_1",
Filter = MatchKeyword("group\_id", "user\_1")
}
});
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
client.UpdateClusterCollectionSetup(context.Background(), qdrant.NewUpdateCollectionClusterReplicatePoints(
"{collection\_name}", &qdrant.ReplicatePoints{
FromShardKey: qdrant.NewShardKey("default"),
ToShardKey: qdrant.NewShardKey("user\_1"),
Filter: &qdrant.Filter{
Must: []\*qdrant.Condition{
qdrant.NewMatch("group\_id", "user\_1"),
},
},
},
))
`
```
Once transfer is completed, target Shard will become `Active`, and all requests for the tenant will be routed to it automatically.
At this point it is safe to delete the tenant&rsquo;s data from the shared Fallback Shard to free up space.
### Limitations
* Currently, `fallback` Shard may only contain a single shard ID on its own. That means all small tenants must fit a single peer of the cluster. This restriction will be improved in future releases.
* Similar to collections, dedicated Shards introduce some resource overhead. It is not recommended to create more than a thousand dedicated Shards per cluster. Recommended threshold of promoting a tenant is the same as the indexing threshold for a single collection, which is around 20K points.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/manage-data/multitenancy.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/manage-data/multitenancy/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/manage-data/multitenancy.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)