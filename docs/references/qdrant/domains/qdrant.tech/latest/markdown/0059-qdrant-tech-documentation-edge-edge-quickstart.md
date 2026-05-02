Quickstart - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Qdrant Edge](https://qdrant.tech/documentation/edge/)
*
* Quickstart# Qdrant Edge Quickstart
## Install Qdrant Edge
First, install the [Python Bindings for Qdrant Edge](https://pypi.org/project/qdrant-edge-py/) or the [Rust crate](https://crates.io/crates/qdrant-edge).
## Create a Storage Directory
A Qdrant Edge Shard stores its data in a local directory on disk. Create the directory if it doesn&rsquo;t exist yet:
```
`from pathlib import Path
SHARD\_DIRECTORY = "./qdrant-edge-directory"
Path(SHARD\_DIRECTORY).mkdir(parents=True, exist\_ok=True)
`
```
```
`const SHARD\_DIRECTORY: &str = "./qdrant-edge-directory";
fs\_err::create\_dir\_all(SHARD\_DIRECTORY)?;
`
```
## Configure the Edge Shard
An Edge Shard is configured with a definition of the dense and sparse vectors that can be stored in the Edge Shard, similar to how you would configure a Qdrant collection.
Set up a configuration by creating an instance of `EdgeConfig`. For example:
```
`from qdrant\_edge import (
Distance,
EdgeConfig,
EdgeVectorParams,
)
VECTOR\_NAME="my-vector"
VECTOR\_DIMENSION=4
config = EdgeConfig(
vectors={
VECTOR\_NAME: EdgeVectorParams(
size=VECTOR\_DIMENSION,
distance=Distance.Cosine,
)
}
)
`
```
```
`const VECTOR\_NAME: &str = "my-vector";
const VECTOR\_DIMENSION: usize = 4;
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
optimizers: Default::default(),
};
`
```
## Initialize the Edge Shard
Now you can create a new `EdgeShard` using `EdgeShard.create` (Python) or `EdgeShard::new` (Rust), passing the storage directory and configuration:
```
`from qdrant\_edge import EdgeShard
edge\_shard = EdgeShard.create(SHARD\_DIRECTORY, config)
`
```
```
`let edge\_shard = EdgeShard::new(
Path::new(SHARD\_DIRECTORY),
config,
)?;
`
```
Note that `create` and `new` will fail if the storage directory already contains data. To initialize an Edge Shard with existing data, see [Load Existing Edge Shard from Disk](#load-existing-edge-shard-from-disk).
## Work with Points
An Edge Shard has several methods to work with points. To add points, use the `update` method:
```
`from qdrant\_edge import ( Point, UpdateOperation )
point = Point(
id=1,
vector={VECTOR\_NAME: [0.1, 0.2, 0.3, 0.4]},
payload={"color": "red"}
)
edge\_shard.update(UpdateOperation.upsert\_points([point]))
`
```
```
`let points: Vec\<PointStructPersisted\> = vec![
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
`
```
To retrieve a point by ID, use the `retrieve` method:
```
`records = edge\_shard.retrieve(
point\_ids=[1],
with\_payload=True,
with\_vector=False
)
`
```
```
`let retrieved = edge\_shard.retrieve(
&[PointId::NumId(1)],
Some(WithPayloadInterface::Bool(true)),
Some(WithVector::Bool(false)),
)?;
`
```
## Create a Payload Index
To optimize operations like [filtering](#filtering) and [faceting](#faceting) on payload fields, first create a payload index on the fields you plan to use with these operations:
```
`from qdrant\_edge import PayloadSchemaType
edge\_shard.update(UpdateOperation.create\_field\_index("color", PayloadSchemaType.Keyword))
`
```
```
`edge\_shard.update(UpdateOperation::FieldIndexOperation(
FieldIndexOperations::CreateIndex(CreateIndex {
field\_name: "color".try\_into().unwrap(),
field\_schema: Some(PayloadFieldSchema::FieldType(
PayloadSchemaType::Keyword,
)),
}),
))?;
`
```
## Query Points
To query points in the Edge Shard, use the `query` method:
```
`from qdrant\_edge import Query, QueryRequest
results = edge\_shard.query(
QueryRequest(
query=Query.Nearest([0.2, 0.1, 0.9, 0.7], using=VECTOR\_NAME),
limit=10,
with\_vector=False,
with\_payload=True
)
)
`
```
```
`let results = edge\_shard.query(QueryRequest {
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
`
```
## Filter points
You can also filter points based on payload fields:
```
`from qdrant\_edge import FieldCondition, Filter, MatchValue
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
`
```
```
`let filter = Filter {
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
`
```
## Create Facets
To create facets on a payload field, use the `facet` method.
```
`from qdrant\_edge import FacetRequest
facet\_response = edge\_shard.facet(FacetRequest(key="color", limit=10, exact=False))
`
```
```
`let facet\_response = edge\_shard.facet(FacetRequest {
key: "color".try\_into().unwrap(),
limit: 10,
filter: None,
exact: false,
})?;
`
```
## Optimize the Edge Shard
Optimization is the process of removing data marked for deletion, merging segments, and creating indexes. Qdrant Edge does not have a background optimizer. Instead, an application can call the `optimize` method to synchronously run optimization at a suitable time, such as during low-traffic periods or after a batch of updates.
```
`edge\_shard.optimize()
`
```
```
`edge\_shard.optimize()?;
`
```
The optimizer can be configured using the `optimizers` parameter of `EdgeConfig` when initializing the Edge Shard. For example:
```
`from qdrant\_edge import EdgeOptimizersConfig
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
`
```
```
`let config = EdgeConfig {
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
`
```
## Close the Edge Shard
When shutting down your application, close the Edge Shard to ensure all data is flushed to disk. The data is persisted on disk and can be used to reopen the Edge Shard.
```
`edge\_shard.close()
`
```
```
`drop(edge\_shard);
`
```
## Load Existing Edge Shard from Disk
After closing an Edge Shard, you can reopen it by loading its data and configuration from disk using the `load` method:
```
`edge\_shard = EdgeShard.load(SHARD\_DIRECTORY)
`
```
```
`let edge\_shard = EdgeShard::load(Path::new(SHARD\_DIRECTORY), None)?;
`
```
## More Examples
The Qdrant GitHub repository contains examples of using the Qdrant Edge API in [Python](https://github.com/qdrant/qdrant/tree/dev/lib/edge/python/examples) and [Rust](https://github.com/qdrant/qdrant/tree/dev/lib/edge/publish/examples).
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/edge/edge-quickstart.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/edge/edge-quickstart/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/edge/edge-quickstart.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)