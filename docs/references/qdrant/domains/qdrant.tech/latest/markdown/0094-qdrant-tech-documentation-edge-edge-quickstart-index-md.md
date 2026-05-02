# Quickstart
# Qdrant Edge Quickstart
## Install Qdrant Edge
First, install the [Python Bindings for Qdrant Edge](https://pypi.org/project/qdrant-edge-py/) or the [Rust crate](https://crates.io/crates/qdrant-edge).
## Create a Storage Directory
A Qdrant Edge Shard stores its data in a local directory on disk. Create the directory if it doesn't exist yet:
```python
from pathlib import Path
SHARD_DIRECTORY = "./qdrant-edge-directory"
Path(SHARD_DIRECTORY).mkdir(parents=True, exist_ok=True)
```
```rust
const SHARD_DIRECTORY: &str = "./qdrant-edge-directory";
fs_err::create_dir_all(SHARD_DIRECTORY)?;
```
## Configure the Edge Shard
An Edge Shard is configured with a definition of the dense and sparse vectors that can be stored in the Edge Shard, similar to how you would configure a Qdrant collection.
Set up a configuration by creating an instance of `EdgeConfig`. For example:
```python
from qdrant_edge import (
Distance,
EdgeConfig,
EdgeVectorParams,
)
VECTOR_NAME="my-vector"
VECTOR_DIMENSION=4
config = EdgeConfig(
vectors={
VECTOR_NAME: EdgeVectorParams(
size=VECTOR_DIMENSION,
distance=Distance.Cosine,
)
}
)
```
```rust
const VECTOR_NAME: &str = "my-vector";
const VECTOR_DIMENSION: usize = 4;
let config = EdgeConfig {
on_disk_payload: true,
vectors: HashMap::from([(
VECTOR_NAME.to_string(),
EdgeVectorParams {
size: VECTOR_DIMENSION,
distance: Distance::Cosine,
on_disk: Some(true),
quantization_config: None,
multivector_config: None,
datatype: None,
hnsw_config: None,
},
)]),
sparse_vectors: HashMap::new(),
hnsw_config: Default::default(),
quantization_config: None,
optimizers: Default::default(),
};
```
## Initialize the Edge Shard
Now you can create a new `EdgeShard` using `EdgeShard.create` (Python) or `EdgeShard::new` (Rust), passing the storage directory and configuration:
```python
from qdrant_edge import EdgeShard
edge_shard = EdgeShard.create(SHARD_DIRECTORY, config)
```
```rust
let edge_shard = EdgeShard::new(
Path::new(SHARD_DIRECTORY),
config,
)?;
```
Note that `create` and `new` will fail if the storage directory already contains data. To initialize an Edge Shard with existing data, see [Load Existing Edge Shard from Disk](#load-existing-edge-shard-from-disk).
## Work with Points
An Edge Shard has several methods to work with points. To add points, use the `update` method:
```python
from qdrant_edge import ( Point, UpdateOperation )
point = Point(
id=1,
vector={VECTOR_NAME: [0.1, 0.2, 0.3, 0.4]},
payload={"color": "red"}
)
edge_shard.update(UpdateOperation.upsert_points([point]))
```
```rust
let points: Vec = vec![
PointStruct::new(
1u64,
Vectors::new\_named([(VECTOR\_NAME, vec![0.1f32, 0.2, 0.3, 0.4])]),
json!({"color": "red"}),
)
.into(),
];
edge\_shard.update(UpdateOperation::PointOperation(
PointOperations::UpsertPoints(
PointInsertOperations::PointsList(points),
),
))?;
```
To retrieve a point by ID, use the `retrieve` method:
```python
records = edge\_shard.retrieve(
point\_ids=[1],
with\_payload=True,
with\_vector=False
)
```
```rust
let retrieved = edge\_shard.retrieve(
&[PointId::NumId(1)],
Some(WithPayloadInterface::Bool(true)),
Some(WithVector::Bool(false)),
)?;
```
## Create a Payload Index
To optimize operations like [filtering](#filtering) and [faceting](#faceting) on payload fields, first create a payload index on the fields you plan to use with these operations:
```python
from qdrant\_edge import PayloadSchemaType
edge\_shard.update(UpdateOperation.create\_field\_index("color", PayloadSchemaType.Keyword))
```
```rust
edge\_shard.update(UpdateOperation::FieldIndexOperation(
FieldIndexOperations::CreateIndex(CreateIndex {
field\_name: "color".try\_into().unwrap(),
field\_schema: Some(PayloadFieldSchema::FieldType(
PayloadSchemaType::Keyword,
)),
}),
))?;
```
## Query Points
To query points in the Edge Shard, use the `query` method:
```python
from qdrant\_edge import Query, QueryRequest
results = edge\_shard.query(
QueryRequest(
query=Query.Nearest([0.2, 0.1, 0.9, 0.7], using=VECTOR\_NAME),
limit=10,
with\_vector=False,
with\_payload=True
)
)
```
```rust
let results = edge\_shard.query(QueryRequest {
prefetches: vec![],
query: Some(ScoringQuery::Vector(QueryEnum::Nearest(NamedQuery {
query: vec![0.2f32, 0.1, 0.9, 0.7].into(),
using: Some(VECTOR\_NAME.to\_string()),
}))),
filter: None,
score\_threshold: None,
limit: 10,
offset: 0,
params: None,
with\_vector: WithVector::Bool(false),
with\_payload: WithPayloadInterface::Bool(true),
})?;
```
## Filter points
You can also filter points based on payload fields:
```python
from qdrant\_edge import FieldCondition, Filter, MatchValue
results = edge\_shard.query(
QueryRequest(
query=Query.Nearest([0.2, 0.1, 0.9, 0.7], using=VECTOR\_NAME),
filter=Filter(
must=[
FieldCondition(
key="color",
match=MatchValue(value="red"),
)
]
),
limit=10,
with\_vector=False,
with\_payload=True
)
)
```
```rust
let filter = Filter {
should: None,
min\_should: None,
must: Some(vec![Condition::Field(FieldCondition::new\_match(
"color".try\_into().unwrap(),
Match::Value(MatchValue {
value: ValueVariants::String("red".to\_string()),
}),
))]),
must\_not: None,
};
let results = edge\_shard.query(QueryRequest {
prefetches: vec![],
query: Some(ScoringQuery::Vector(QueryEnum::Nearest(NamedQuery {
query: vec![0.2f32, 0.1, 0.9, 0.7].into(),
using: Some(VECTOR\_NAME.to\_string()),
}))),
filter: Some(filter),
score\_threshold: None,
limit: 10,
offset: 0,
params: None,
with\_vector: WithVector::Bool(false),
with\_payload: WithPayloadInterface::Bool(true),
})?;
```
## Create Facets
To create facets on a payload field, use the `facet` method.
```python
from qdrant\_edge import FacetRequest
facet\_response = edge\_shard.facet(FacetRequest(key="color", limit=10, exact=False))
```
```rust
let facet\_response = edge\_shard.facet(FacetRequest {
key: "color".try\_into().unwrap(),
limit: 10,
filter: None,
exact: false,
})?;
```
## Optimize the Edge Shard
Optimization is the process of removing data marked for deletion, merging segments, and creating indexes. Qdrant Edge does not have a background optimizer. Instead, an application can call the `optimize` method to synchronously run optimization at a suitable time, such as during low-traffic periods or after a batch of updates.
```python
edge\_shard.optimize()
```
```rust
edge\_shard.optimize()?;
```
The optimizer can be configured using the `optimizers` parameter of `EdgeConfig` when initializing the Edge Shard. For example:
```python
from qdrant\_edge import EdgeOptimizersConfig
config = EdgeConfig(
vectors={
VECTOR\_NAME: EdgeVectorParams(
size=VECTOR\_DIMENSION,
distance=Distance.Cosine,
)
},
optimizers=EdgeOptimizersConfig(
deleted\_threshold=0.2,
vacuum\_min\_vector\_number=100,
default\_segment\_number=2,
),
)
```
```rust
let config = EdgeConfig {
on\_disk\_payload: true,
vectors: HashMap::from([(
VECTOR\_NAME.to\_string(),
EdgeVectorParams {
size: VECTOR\_DIMENSION,
distance: Distance::Cosine,
on\_disk: Some(true),
quantization\_config: None,
multivector\_config: None,
datatype: None,
hnsw\_config: None,
},
)]),
sparse\_vectors: HashMap::new(),
hnsw\_config: Default::default(),
quantization\_config: None,
optimizers: EdgeOptimizersConfig {
deleted\_threshold: Some(0.2),
vacuum\_min\_vector\_number: Some(100),
default\_segment\_number: Some(2),
..Default::default()
},
};
```
## Close the Edge Shard
When shutting down your application, close the Edge Shard to ensure all data is flushed to disk. The data is persisted on disk and can be used to reopen the Edge Shard.
```python
edge\_shard.close()
```
```rust
drop(edge\_shard);
```
## Load Existing Edge Shard from Disk
After closing an Edge Shard, you can reopen it by loading its data and configuration from disk using the `load` method:
```python
edge\_shard = EdgeShard.load(SHARD\_DIRECTORY)
```
```rust
let edge\_shard = EdgeShard::load(Path::new(SHARD\_DIRECTORY), None)?;
```
## More Examples
The Qdrant GitHub repository contains examples of using the Qdrant Edge API in [Python](https://github.com/qdrant/qdrant/tree/dev/lib/edge/python/examples) and [Rust](https://github.com/qdrant/qdrant/tree/dev/lib/edge/publish/examples).