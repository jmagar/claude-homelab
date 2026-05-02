# Text Search
## Text Search
Qdrant is a vector search engine, making it a great tool for [semantic search](#semantic-search). However, Qdrant's capabilities go beyond just vector search. It also supports a range of lexical search features, including filtering on text fields and full-text search using popular algorithms like BM25.
### Semantic Search
Semantic search is a search technique that focuses on the meaning of the text rather than just matching on keywords. This is achieved by converting text into [vectors](/documentation/manage-data/vectors/index.md) (embeddings) using machine learning models. These vectors capture the semantic meaning of the text, enabling you to find similar text even if it doesn't share exact keywords.
The examples in this guide use [inference](/documentation/inference/) to let Qdrant generate the vectors. Inference is only available on [Qdrant Cloud](/documentation/inference/#qdrant-cloud-inference), with the exception of the BM25 model. If you are not running on Qdrant Cloud, you can use a library like [FastEmbed](/documentation/fastembed/) to generate vectors on the client side. When using FastEmbed, refer to the documentation, as its API may differ from that of server-side inference.
For example, to search through a collection of books, you could use a model like the `all-MiniLM-L6-v2` sentence transformer model. First, create a collection and configure a dense vector for the book descriptions:
```http
PUT /collections/books
{
"vectors": {
"description-dense": {
"size": 384,
"distance": "Cosine"
}
}
}
```
```python
from qdrant_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api_key="",
cloud\_inference=True,
)
client.create\_collection(
collection\_name="books",
vectors\_config={
"description-dense": models.VectorParams(size=384, distance=models.Distance.COSINE)
},
)
```
```typescript
client.createCollection("books", {
vectors: {
"description-dense": { size: 384, distance: "Cosine" },
},
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{
CreateCollectionBuilder, Distance, VectorParamsBuilder, VectorsConfigBuilder,
};
let mut vectors\_config = VectorsConfigBuilder::default();
vectors\_config.add\_named\_vector\_params(
"description-dense",
VectorParamsBuilder::new(384, Distance::Cosine),
);
client
.create\_collection(CreateCollectionBuilder::new("books").vectors\_config(vectors\_config))
.await?;
```
```java
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.\*;
QdrantClient client =
client
.createCollectionAsync(
CreateCollection.newBuilder()
.setCollectionName("books")
.setVectorsConfig(
VectorsConfig.newBuilder()
.setParamsMap(
VectorParamsMap.newBuilder()
.putMap(
"description-dense",
VectorParams.newBuilder()
.setSize(384)
.setDistance(Distance.Cosine)
.build())
.build())
.build())
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.CreateCollectionAsync(
collectionName: "books",
vectorsConfig: new VectorParamsMap
{
Map =
{
["description-dense"] = new VectorParams
{
Size = 384,
Distance = Distance.Cosine,
},
},
}
);
```
```go
client.CreateCollection(context.Background(), &qdrant.CreateCollection{
CollectionName: "books",
VectorsConfig: qdrant.NewVectorsConfigMap(
map[string]\*qdrant.VectorParams{
"description-dense": {
Size: 384,
Distance: qdrant.Distance\_Cosine,
},
}),
})
```
Next, you can ingest data:
```http
PUT /collections/books/points?wait=true
{
"points": [
{
"id": 1,
"vector": {
"description-dense": {
"text": "A Victorian scientist builds a device to travel far into the future and observes the dim trajectories of humanity. He discovers evolutionary divergence and the consequences of class division. Wells's novella established time travel as a vehicle for social commentary.",
"model": "sentence-transformers/all-minilm-l6-v2"
}
},
"payload": {
"title": "The Time Machine",
"author": "H.G. Wells",
"isbn": "9780553213515"
}
}
]
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.upsert(
collection\_name="books",
points=[
models.PointStruct(
id=1,
vector={
"description-dense": models.Document(
text="A Victorian scientist builds a device to travel far into the future and observes the dim trajectories of humanity. He discovers evolutionary divergence and the consequences of class division. Wells's novella established time travel as a vehicle for social commentary.",
model="sentence-transformers/all-minilm-l6-v2",
)
},
payload={
"title": "The Time Machine",
"author": "H.G. Wells",
"isbn": "9780553213515",
},
)
],
)
```
```typescript
client.upsert("books", {
wait: true,
points: [
{
id: 1,
vector: {
"description-dense": {
text: "A Victorian scientist builds a device to travel far into the future and observes the dim trajectories of humanity. He discovers evolutionary divergence and the consequences of class division. Wells's novella established time travel as a vehicle for social commentary.",
model: "sentence-transformers/all-minilm-l6-v2",
},
},
payload: {
title: "The Time Machine",
author: "H.G. Wells",
isbn: "9780553213515",
},
},
],
});
```
```rust
use std::collections::HashMap;
use qdrant\_client::qdrant::{Document, PointStruct, UpsertPointsBuilder};
use qdrant\_client::{Payload, Qdrant};
use serde\_json::json;
let point = PointStruct::new(
1,
HashMap::from([(
"description-dense".to\_string(),
Document::new(
"A Victorian scientist builds a device to travel far into the future and observes the dim trajectories of humanity. He discovers evolutionary divergence and the consequences of class division. Wells's novella established time travel as a vehicle for social commentary.",
"sentence-transformers/all-minilm-l6-v2",
),
)]),
Payload::try\_from(json!({
"title": "The Time Machine",
"author": "H.G. Wells",
"isbn": "9780553213515",
}))
.unwrap(),
);
client
.upsert\_points(UpsertPointsBuilder::new("books", vec![point]).wait(true))
.await?;
```
```java
import static io.qdrant.client.ConditionFactory.\*;
import static io.qdrant.client.PointIdFactory.id;
import static io.qdrant.client.ValueFactory.value;
import static io.qdrant.client.VectorFactory.vector;
import static io.qdrant.client.VectorsFactory.namedVectors;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.\*;
import io.qdrant.client.grpc.Points.\*;
import java.util.\*;
QdrantClient client =
PointStruct point =
PointStruct.newBuilder()
.setId(id(1))
.setVectors(
namedVectors(
Map.of(
"description-dense",
vector(
Document.newBuilder()
.setText(
"A Victorian scientist builds a device to travel far into the future and observes the dim trajectories of humanity. He discovers evolutionary divergence and the consequences of class division. Wells's novella established time travel as a vehicle for social commentary.")
.setModel("sentence-transformers/all-minilm-l6-v2")
.build()))))
.putAllPayload(
Map.of(
"title", value("The Time Machine"),
"author", value("H.G. Wells"),
"isbn", value("9780553213515")))
.build();
client.upsertAsync("books", List.of(point)).get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.UpsertAsync(
collectionName: "books",
wait: true,
points: new List
{
new()
{
Id = 1,
Vectors = new Dictionary
{
["description-dense"] = new Document
{
Text =
"A Victorian scientist builds a device to travel far into the future and observes the dim trajectories of humanity. He discovers evolutionary divergence and the consequences of class division. Wells's novella established time travel as a vehicle for social commentary.",
Model = "sentence-transformers/all-minilm-l6-v2",
},
},
Payload =
{
["title"] = "The Time Machine",
["author"] = "H.G. Wells",
["isbn"] = "9780553213515",
},
},
}
);
```
```go
client.Upsert(context.Background(), &qdrant.UpsertPoints{
CollectionName: "books",
Points: []\*qdrant.PointStruct{
{
Id: qdrant.NewIDNum(uint64(1)),
Vectors: qdrant.NewVectorsMap(map[string]\*qdrant.Vector{
"description-dense": qdrant.NewVectorDocument(&qdrant.Document{
Model: "sentence-transformers/all-minilm-l6-v2",
Text: "A Victorian scientist builds a device to travel far into the future and observes the dim trajectories of humanity. He discovers evolutionary divergence and the consequences of class division. Wells's novella established time travel as a vehicle for social commentary.",
}),
}),
Payload: qdrant.NewValueMap(map[string]any{
"title": "The Time Machine",
"author": "H.G. Wells",
"isbn": "9780553213515",
}),
},
},
})
```
To find books related to "time travel", use the following query:
```http
POST /collections/books/points/query
{
"query": {
"text": "time travel",
"model": "sentence-transformers/all-minilm-l6-v2"
},
"using": "description-dense",
"with\_payload": true
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.query\_points(
collection\_name="books",
query=models.Document(text="time travel", model="sentence-transformers/all-minilm-l6-v2"),
using="description-dense",
with\_payload=True,
)
```
```typescript
client.query("books", {
query: {
text: "time travel",
model: "sentence-transformers/all-minilm-l6-v2",
},
using: "description-dense",
with\_payload: true,
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{Document, Query, QueryPointsBuilder};
client
.query(
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(Document::new(
"time travel",
"sentence-transformers/all-minilm-l6-v2",
)))
.using("description-dense")
.with\_payload(true)
.build(),
)
.await?;
```
```java
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.\*;
QdrantClient client =
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder()
.setText("time travel")
.setModel("sentence-transformers/all-minilm-l6-v2")
.build()))
.setUsing("description-dense")
.setWithPayload(enable(true))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.QueryAsync(
collectionName: "books",
query: new Document
{
Text = "time travel",
Model = "sentence-transformers/all-minilm-l6-v2",
},
usingVector: "description-dense",
payloadSelector: true
);
```
```go
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{
Model: "sentence-transformers/all-minilm-l6-v2",
Text: "time travel",
}),
),
Using: qdrant.PtrOf("description-dense"),
WithPayload: qdrant.NewWithPayload(true),
})
```
In these examples, Qdrant uses [inference](/documentation/inference/index.md) to generate vectors from the `text` provided in the request using the specified `model`. Alternatively, you can generate explicit vectors on the client side with a library like [FastEmbed](/documentation/fastembed/index.md).
### Lexical Search
Lexical search, also known as keyword-based search, is a traditional search technique that relies on matching words or phrases in the text. Many applications require a combination of semantic and traditional lexical search. A good example is in e-commerce, where users may want to search for products using a product ID. ID values don't lend themselves well to vectorization, but being able to search for them is essential for a good search experience. To facilitate these use cases, Qdrant enables you to use lexical search alongside semantic search.
### Filtering Versus Querying
When it comes to lexical search in Qdrant, it's important to distinguish between filtering and querying. Filtering is used to narrow down results based on exact matches or specific criteria, while querying involves finding relevant documents based on the content of the text. In other words, filtering is about precision, while querying is about recall. A filter does not contribute to the ranking of search results, as no score is calculated for filters. A query calculates a relevance score for each matching document and that score is used to rank search results.
| Filter | Query |
|---|---|
| Does not contribute to ranking | Contributes to ranking |
| Improves precision by narrowing down results | Improves recall by finding relevant data |
## Filtering
Qdrant supports [filtering](/documentation/search/filtering/index.md) on a wide range of datatypes: numbers, dates, booleans, geolocations, and strings. In Qdrant, a filter is typically combined with a vector query. The vector query is used to score and rank the results, while the filter is used to narrow down the results based on specific criteria.
### Text and Keyword Strings
When it comes to filtering on strings, it is important to understand the difference between the two types of strings in Qdrant: text and keyword. These two string types are designed for different use cases: filtering on exact string values or filtering on individual search terms. To filter on exact string values, Qdrant uses \*\*keyword\*\* strings. Keyword strings are ideal for filtering on strings like IDs, categories, or tags. To filter on individual terms or phrases within a larger body of text, Qdrant uses \*\*text\*\* strings.
For example, take a string like "United States". If you want to filter on all points with this exact string in the payload, use a keyword filter. On the other hand, if you want to filter on all points that contain the word "united" (matching "United States" as well as "United Kingdom"), use a text filter.
| Keyword | Text |
|---|---|
| Used for exact string matches | Used for filtering on individual terms |
| Ideal for IDs, categories, tags | Ideal for larger text fields |
| Not tokenized | [Tokenized](/documentation/search/text-search/index.md#tokenization) into individual terms |
| Case-sensitive | Case-insensitive by default |
### Filtering on an Exact String
To filter on exact strings, first create a [payload index](/documentation/manage-data/indexing/index.md#payload-index) of type `keyword`for the field you want to filter on. A payload index makes filtering faster and reduces the load on the system.
Filtering on a field without an index is not possible on collections that run in [strict mode](/documentation/ops-configuration/administration/#strict-mode). Strict mode is enabled by default on Qdrant Cloud.
For example, to filter books by author name, create a keyword index on the "author" field:
```http
PUT /collections/books/index?wait=true
{
"field\_name": "author",
"field\_schema": "keyword"
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.create\_payload\_index(
collection\_name="books",
field\_name="author",
field\_schema=models.PayloadSchemaType.KEYWORD
)
```
```typescript
client.createPayloadIndex("books", {
field\_name: "author",
field\_schema: "keyword",
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{CreateFieldIndexCollectionBuilder, FieldType};
client
.create\_field\_index(CreateFieldIndexCollectionBuilder::new(
"books",
"author",
FieldType::Keyword,
))
.await?;
```
```java
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.PayloadSchemaType;
QdrantClient client =
client
.createPayloadIndexAsync(
"books", "author", PayloadSchemaType.Keyword, null, null, null, null)
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.CreatePayloadIndexAsync(
collectionName: "books",
fieldName: "author",
schemaType: PayloadSchemaType.Keyword
);
```
```go
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "books",
FieldName: "author",
FieldType: qdrant.FieldType\_FieldTypeKeyword.Enum(),
})
```
Next, when querying the data, you also add a filter clause to the request. The following example searches for books related to "time travel" but only returns books written by H.G. Wells:
```http
POST /collections/books/points/query
{
"query": {
"text": "time travel",
"model": "sentence-transformers/all-minilm-l6-v2"
},
"using": "description-dense",
"with\_payload": true,
"filter": {
"must": [
{
"key": "author",
"match": {
"value": "H.G. Wells"
}
}
]
}
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.query\_points(
collection\_name="books",
query=models.Document(text="time travel", model="sentence-transformers/all-minilm-l6-v2"),
using="description-dense",
with\_payload=True,
query\_filter=models.Filter(
must=[models.FieldCondition(key="author", match=models.MatchValue(value="H.G. Wells"))]
),
)
```
```typescript
client.query("books", {
query: {
text: "time travel",
model: "sentence-transformers/all-minilm-l6-v2",
},
using: "description-dense",
with\_payload: true,
filter: {
must: [
{
key: "author",
match: {
value: "H.G. Wells",
},
},
],
},
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{Condition, Document, Filter, Query, QueryPointsBuilder};
let filter = Filter::must([Condition::matches("author", "H.G. Wells".to\_string())]);
client
.query(
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(Document::new(
"time travel",
"sentence-transformers/all-minilm-l6-v2",
)))
.using("description-dense")
.filter(filter)
.with\_payload(true)
.build(),
)
.await?;
```
```java
import static io.qdrant.client.ConditionFactory.\*;
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Common.Filter;
import io.qdrant.client.grpc.Points.\*;
QdrantClient client =
Filter filter = Filter.newBuilder().addMust(matchKeyword("author", "H.G. Wells")).build();
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder()
.setText("time travel")
.setModel("sentence-transformers/all-minilm-l6-v2")
.build()))
.setUsing("description-dense")
.setFilter(filter)
.setWithPayload(enable(true))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
using static Qdrant.Client.Grpc.Conditions;
await client.QueryAsync(
collectionName: "books",
query: new Document
{
Text = "time travel",
Model = "sentence-transformers/all-minilm-l6-v2",
},
usingVector: "description-dense",
filter: MatchKeyword("author", "H.G. Wells"),
payloadSelector: true
);
```
```go
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{
Model: "sentence-transformers/all-minilm-l6-v2",
Text: "time travel",
}),
),
Using: qdrant.PtrOf("description-dense"),
WithPayload: qdrant.NewWithPayload(true),
Filter: &qdrant.Filter{
Must: []\*qdrant.Condition{
qdrant.NewMatch("author", "H.G. Wells"),
},
},
})
```
The ranking of the results of this request is based on the vector similarity of the query. The filter only narrows down the results to those points where the `author` field exactly matches `H.G. Wells`. Furthermore, the filter is case-sensitive. Filtering for the lowercase value `h.g. wells` would not return any results.
The previous example only returns points that match the filter value. If you want the opposite: exclude points with a specific value, use a `must\_not` clause instead of `must`. The following example only returns books \*not\* written by H.G. Wells:
```http
POST /collections/books/points/query
{
"query": {
"text": "time travel",
"model": "sentence-transformers/all-minilm-l6-v2"
},
"using": "description-dense",
"with\_payload": true,
"filter": {
"must\_not": [
{
"key": "author",
"match": {
"value": "H.G. Wells"
}
}
]
}
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.query\_points(
collection\_name="books",
query=models.Document(text="time travel", model="sentence-transformers/all-minilm-l6-v2"),
using="description-dense",
with\_payload=True,
query\_filter=models.Filter(
must\_not=[models.FieldCondition(key="author", match=models.MatchValue(value="H.G. Wells"))]
),
)
```
```typescript
client.query("books", {
query: {
text: "time travel",
model: "sentence-transformers/all-minilm-l6-v2",
},
using: "description-dense",
with\_payload: true,
filter: {
must\_not: [
{ key: "author", match: { value: "H.G. Wells" } },
],
},
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{Condition, Document, Filter, Query, QueryPointsBuilder};
let filter = Filter::must\_not([Condition::matches("author", "H.G. Wells".to\_string())]);
client
.query(
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(Document::new(
"time travel",
"sentence-transformers/all-minilm-l6-v2",
)))
.using("description-dense")
.filter(filter)
.with\_payload(true)
.build(),
)
.await?;
```
```java
import static io.qdrant.client.ConditionFactory.\*;
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Common.Filter;
import io.qdrant.client.grpc.Points.\*;
QdrantClient client =
Filter filter = Filter.newBuilder().addMustNot(matchKeyword("author", "H.G. Wells")).build();
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder()
.setText("time travel")
.setModel("sentence-transformers/all-minilm-l6-v2")
.build()))
.setUsing("description-dense")
.setFilter(filter)
.setWithPayload(enable(true))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
using static Qdrant.Client.Grpc.Conditions;
var excludeFilter = new Filter { MustNot = { MatchKeyword("author", "H.G. Wells") } };
await client.QueryAsync(
collectionName: "books",
query: new Document
{
Text = "time travel",
Model = "sentence-transformers/all-minilm-l6-v2",
},
usingVector: "description-dense",
filter: excludeFilter,
payloadSelector: true
);
```
```go
excludeFilter := qdrant.Filter{
MustNot: []\*qdrant.Condition{
qdrant.NewMatch("author", "H.G. Wells"),
},
}
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{
Model: "sentence-transformers/all-minilm-l6-v2",
Text: "time travel",
}),
),
Using: qdrant.PtrOf("description-dense"),
WithPayload: qdrant.NewWithPayload(true),
Filter: &excludeFilter,
})
```
### Filtering on Multiple Exact Strings
You can provide multiple filter clauses. For example, to find all books co-authored by Larry Niven and Jerry Pournelle, use the following filter:
```http
POST /collections/books/points/query
{
"query": {
"text": "space opera",
"model": "sentence-transformers/all-minilm-l6-v2"
},
"using": "description-dense",
"with\_payload": true,
"filter": {
"must": [
{
"key": "author",
"match": {
"value": "Larry Niven"
}
},
{
"key": "author",
"match": {
"value": "Jerry Pournelle"
}
}
]
}
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.query\_points(
collection\_name="books",
query=models.Document(text="space opera", model="sentence-transformers/all-minilm-l6-v2"),
using="description-dense",
with\_payload=True,
query\_filter=models.Filter(
must=[
models.FieldCondition(key="author", match=models.MatchValue(value="Larry Niven")),
models.FieldCondition(key="author", match=models.MatchValue(value="Jerry Pournelle")),
]
),
)
```
```typescript
client.query("books", {
query: {
text: "space opera",
model: "sentence-transformers/all-minilm-l6-v2",
},
using: "description-dense",
with\_payload: true,
filter: {
must: [
{ key: "author", match: { value: "Larry Niven" } },
{ key: "author", match: { value: "Jerry Pournelle" } },
],
},
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{Condition, Document, Filter, Query, QueryPointsBuilder};
let filter = Filter::must([
Condition::matches("author", "Larry Niven".to\_string()),
Condition::matches("author", "Jerry Pournelle".to\_string()),
]);
client
.query(
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(Document::new(
"space opera",
"sentence-transformers/all-minilm-l6-v2",
)))
.using("description-dense")
.filter(filter)
.with\_payload(true)
.build(),
)
.await?;
```
```java
import static io.qdrant.client.ConditionFactory.\*;
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Common.Filter;
import io.qdrant.client.grpc.Points.\*;
QdrantClient client =
Filter filter =
Filter.newBuilder()
.addMust(matchKeyword("author", "Larry Niven"))
.addMust(matchKeyword("author", "Jerry Pournelle"))
.build();
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder()
.setText("space opera")
.setModel("sentence-transformers/all-minilm-l6-v2")
.build()))
.setUsing("description-dense")
.setFilter(filter)
.setWithPayload(enable(true))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
using static Qdrant.Client.Grpc.Conditions;
var andFilter = new Filter
{
Must =
{
MatchKeyword("author", "Larry Niven"),
MatchKeyword("author", "Jerry Pournelle"),
},
};
await client.QueryAsync(
collectionName: "books",
query: new Document
{
Text = "space opera",
Model = "sentence-transformers/all-minilm-l6-v2",
},
usingVector: "description-dense",
filter: andFilter,
payloadSelector: true
);
```
```go
andFilter := qdrant.Filter{
Must: []\*qdrant.Condition{
qdrant.NewMatch("author", "Larry Niven"),
qdrant.NewMatch("author", "Jerry Pournelle"),
},
}
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{
Model: "sentence-transformers/all-minilm-l6-v2",
Text: "space opera",
}),
),
Using: qdrant.PtrOf("description-dense"),
WithPayload: qdrant.NewWithPayload(true),
Filter: &andFilter,
})
```
Note that both filter clauses must be true for a point to be included in the results, because a `must` clause operates like a logical `AND`. If you want to find books written by either author (as well as both), use a `should` clause, which operates like a logical `OR`:
```http
POST /collections/books/points/query
{
"query": {
"text": "space opera",
"model": "sentence-transformers/all-minilm-l6-v2"
},
"using": "description-dense",
"with\_payload": true,
"filter": {
"should": [
{
"key": "author",
"match": {
"value": "Larry Niven"
}
},
{
"key": "author",
"match": {
"value": "Jerry Pournelle"
}
}
]
}
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.query\_points(
collection\_name="books",
query=models.Document(text="space opera", model="sentence-transformers/all-minilm-l6-v2"),
using="description-dense",
with\_payload=True,
query\_filter=models.Filter(
should=[
models.FieldCondition(key="author", match=models.MatchValue(value="Larry Niven")),
models.FieldCondition(key="author", match=models.MatchValue(value="Jerry Pournelle")),
]
),
)
```
```typescript
client.query("books", {
query: {
text: "space opera",
model: "sentence-transformers/all-minilm-l6-v2",
},
using: "description-dense",
with\_payload: true,
filter: {
should: [
{ key: "author", match: { value: "Larry Niven" } },
{ key: "author", match: { value: "Jerry Pournelle" } },
],
},
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{Condition, Document, Filter, Query, QueryPointsBuilder};
let filter = Filter::should([
Condition::matches("author", "Larry Niven".to\_string()),
Condition::matches("author", "Jerry Pournelle".to\_string()),
]);
client
.query(
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(Document::new(
"space opera",
"sentence-transformers/all-minilm-l6-v2",
)))
.using("description-dense")
.filter(filter)
.with\_payload(true)
.build(),
)
.await?;
```
```java
import static io.qdrant.client.ConditionFactory.\*;
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Common.Filter;
import io.qdrant.client.grpc.Points.\*;
QdrantClient client =
Filter filter =
Filter.newBuilder()
.addShould(matchKeyword("author", "Larry Niven"))
.addShould(matchKeyword("author", "Jerry Pournelle"))
.build();
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder()
.setText("space opera")
.setModel("sentence-transformers/all-minilm-l6-v2")
.build()))
.setUsing("description-dense")
.setFilter(filter)
.setWithPayload(enable(true))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
using static Qdrant.Client.Grpc.Conditions;
var orFilter = new Filter
{
Should =
{
MatchKeyword("author", "Larry Niven"),
MatchKeyword("author", "Jerry Pournelle"),
},
};
await client.QueryAsync(
collectionName: "books",
query: new Document
{
Text = "space opera",
Model = "sentence-transformers/all-minilm-l6-v2",
},
usingVector: "description-dense",
filter: orFilter,
payloadSelector: true
);
```
```go
orFilter := qdrant.Filter{
Should: []\*qdrant.Condition{
qdrant.NewMatch("author", "Larry Niven"),
qdrant.NewMatch("author", "Jerry Pournelle"),
},
}
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{
Model: "sentence-transformers/all-minilm-l6-v2",
Text: "space opera",
}),
),
Using: qdrant.PtrOf("description-dense"),
WithPayload: qdrant.NewWithPayload(true),
Filter: &orFilter,
})
```
Alternatively, when you want to filter on one or more values of a single key, you can use the `any` condition:
```http
POST /collections/books/points/query
{
"query": {
"text": "space opera",
"model": "sentence-transformers/all-minilm-l6-v2"
},
"using": "description-dense",
"with\_payload": true,
"filter": {
"must": [
{
"key": "author",
"match": {
"any": ["Larry Niven", "Jerry Pournelle"]
}
}
]
}
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.query\_points(
collection\_name="books",
query=models.Document(text="space opera", model="sentence-transformers/all-minilm-l6-v2"),
using="description-dense",
with\_payload=True,
query\_filter=models.Filter(
must=[
models.FieldCondition(
key="author",
match=models.MatchAny(any=["Larry Niven", "Jerry Pournelle"]),
)
]
),
)
```
```typescript
client.query("books", {
query: {
text: "space opera",
model: "sentence-transformers/all-minilm-l6-v2",
},
using: "description-dense",
with\_payload: true,
filter: {
must: [
{
key: "author",
match: { any: ["Larry Niven", "Jerry Pournelle"] },
},
],
},
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{Condition, Document, Filter, Query, QueryPointsBuilder};
let filter = Filter::should([
Condition::matches("author", "Larry Niven".to\_string()),
Condition::matches("author", "Jerry Pournelle".to\_string()),
]);
client
.query(
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(Document::new(
"space opera",
"sentence-transformers/all-minilm-l6-v2",
)))
.using("description-dense")
.filter(filter)
.with\_payload(true)
.build(),
)
.await?;
```
```java
import static io.qdrant.client.ConditionFactory.\*;
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Common.Filter;
import io.qdrant.client.grpc.Points.\*;
QdrantClient client =
Filter filter =
Filter.newBuilder()
.addShould(matchKeyword("author", "Larry Niven"))
.addShould(matchKeyword("author", "Jerry Pournelle"))
.build();
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder()
.setText("space opera")
.setModel("sentence-transformers/all-minilm-l6-v2")
.build()))
.setUsing("description-dense")
.setFilter(filter)
.setWithPayload(enable(true))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
using static Qdrant.Client.Grpc.Conditions;
var anyFilter = new Filter
{
Should =
{
MatchKeyword("author", "Larry Niven"),
MatchKeyword("author", "Jerry Pournelle"),
},
};
await client.QueryAsync(
collectionName: "books",
query: new Document
{
Text = "space opera",
Model = "sentence-transformers/all-minilm-l6-v2",
},
usingVector: "description-dense",
filter: anyFilter,
payloadSelector: true
);
```
```go
anyFilter := qdrant.Filter{
Should: []\*qdrant.Condition{
qdrant.NewMatch("author", "Larry Niven"),
qdrant.NewMatch("author", "Jerry Pournelle"),
},
}
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{
Model: "sentence-transformers/all-minilm-l6-v2",
Text: "space opera",
}),
),
Using: qdrant.PtrOf("description-dense"),
WithPayload: qdrant.NewWithPayload(true),
Filter: &anyFilter,
})
```
### Full-Text Filtering
In contrast to keyword filtering, filtering on text strings enables you to filter on individual words within a larger text field in a case-insensitive manner. To understand how this works, it's important to understand how text strings are processed at index time and query time.
#### Text Processing
To enable efficient full-text filtering, Qdrant processes text strings by breaking them down into individual tokens (words) and applying several normalization steps. This process ensures that searches are more flexible and can match variations of words. At query time, Qdrant applies the same processing steps to the filter string, ensuring that the filter matches the indexed tokens correctly.
![Text processing can break down a sentence like"The quick brown fox" into the tokens "quick", "brown", and "fox".](/docs/text-processing.png)
The following text processing steps are applied to text strings:
- The string is broken down into individual tokens (words) using a process called [tokenization](/documentation/manage-data/indexing/index.md#tokenizers). By default, Qdrant uses the `word` tokenizer, which splits the string using word boundaries, discarding spaces, punctuation marks, and special characters.
- By default, each word is then [converted to lowercase](/documentation/manage-data/indexing/index.md#lowercasing). Lowercasing the tokens allows Qdrant to ignore capitalization, making full-text filters case-insensitive.
- Optionally, Qdrant can remove diacritics (accents) from characters using a process called [ASCII folding](/documentation/manage-data/indexing/index.md#ascii-folding). This ensures that diacritics are ignored. As a result, filtering for the word "cafe" matches "café".
- Optionally, tokens can be reduced to their root form using a [stemmer](/documentation/manage-data/indexing/index.md#stemmer). This ensures that filtering for "running" also matches "run" and "ran". Because stemming is language-specific, if enabled, it must be configured for a specific language.
- Certain words like "the", "is", and "and" are very common in text and do not contribute much to the meaning of text. These words are called [stopwords](/documentation/manage-data/indexing/index.md#stopwords) and can optionally be removed during indexing. Like stemming, stopword removal is language-specific. You can configure specific languages for stopword removal and/or provide a custom list of stopwords to remove.
- Optionally, you can enable [phrase matching](/documentation/manage-data/indexing/index.md#phrase-search) to allow filtering for multiple words in the exact same order as they appear in the original text.
These text processing steps can be configured when creating a [full-text index](/documentation/manage-data/indexing/index.md#full-text-index). For example, to create a text index on the `title` field with ASCII folding enabled:
```http
PUT /collections/books/index?wait=true
{
"field\_name": "title",
"field\_schema": {
"type": "text",
"ascii\_folding": true
}
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.create\_payload\_index(
collection\_name="books",
field\_name="title",
field\_schema=models.TextIndexParams(type=models.TextIndexType.TEXT, ascii\_folding=True),
)
```
```typescript
client.createPayloadIndex("books", {
field\_name: "title",
field\_schema: {
type: "text",
ascii\_folding: true,
},
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{
CreateFieldIndexCollectionBuilder, FieldType, TextIndexParamsBuilder, TokenizerType,
};
let params = TextIndexParamsBuilder::new(TokenizerType::Word)
.ascii\_folding(true)
.lowercase(true)
.build();
client
.create\_field\_index(
CreateFieldIndexCollectionBuilder::new("books", "title", FieldType::Text)
.field\_index\_params(params),
)
.await?;
```
```java
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.PayloadIndexParams;
import io.qdrant.client.grpc.Collections.PayloadSchemaType;
import io.qdrant.client.grpc.Collections.TextIndexParams;
import io.qdrant.client.grpc.Collections.TokenizerType;
QdrantClient client =
client
.createPayloadIndexAsync(
"books",
"title",
PayloadSchemaType.Text,
PayloadIndexParams.newBuilder()
.setTextIndexParams(
TextIndexParams.newBuilder()
.setTokenizer(TokenizerType.Word)
.setAsciiFolding(true)
.setLowercase(true)
.build())
.build(),
null,
null,
null)
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.CreatePayloadIndexAsync(
collectionName: "books",
fieldName: "title",
schemaType: PayloadSchemaType.Text,
indexParams: new PayloadIndexParams
{
TextIndexParams = new TextIndexParams
{
Tokenizer = TokenizerType.Word,
AsciiFolding = true,
Lowercase = true,
},
}
);
```
```go
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "books",
FieldName: "title",
FieldType: qdrant.FieldType\_FieldTypeText.Enum(),
FieldIndexParams: qdrant.NewPayloadIndexParamsText(
&qdrant.TextIndexParams{
Tokenizer: qdrant.TokenizerType\_Word,
Lowercase: qdrant.PtrOf(true),
AsciiFolding: qdrant.PtrOf(true),
}),
})
```
When querying using this index, Qdrant automatically applies the same text processing steps to the filter string before matching it against the indexed tokens.
### Filter on Text Strings
To filter on text values in a payload field, first create a [full-text index](/documentation/manage-data/indexing/index.md#full-text-index) for that field. Next, you can use a `text` condition to query the collection with a filter for titles that contain the word "space":
```http
POST /collections/books/points/query
{
"query": {
"text": "space opera",
"model": "sentence-transformers/all-minilm-l6-v2"
},
"using": "description-dense",
"with\_payload": true,
"filter": {
"must": [
{
"key": "title",
"match": {
"text": "space"
}
}
]
}
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.query\_points(
collection\_name="books",
query=models.Document(text="space opera", model="sentence-transformers/all-minilm-l6-v2"),
using="description-dense",
with\_payload=True,
query\_filter=models.Filter(
must=[models.FieldCondition(key="title", match=models.MatchText(text="space"))]
),
)
```
```typescript
client.query("books", {
query: {
text: "space opera",
model: "sentence-transformers/all-minilm-l6-v2",
},
using: "description-dense",
with\_payload: true,
filter: {
must: [
{ key: "title", match: { text: "space" } },
],
},
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{Condition, Document, Filter, Query, QueryPointsBuilder};
let filter = Filter::must([Condition::matches("title", "space".to\_string())]);
client
.query(
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(Document::new(
"space opera",
"sentence-transformers/all-minilm-l6-v2",
)))
.using("description-dense")
.filter(filter)
.with\_payload(true)
.build(),
)
.await?;
```
```java
import static io.qdrant.client.ConditionFactory.\*;
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Common.Filter;
import io.qdrant.client.grpc.Points.\*;
QdrantClient client =
Filter filter = Filter.newBuilder().addMust(matchText("title", "space")).build();
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder()
.setText("space opera")
.setModel("sentence-transformers/all-minilm-l6-v2")
.build()))
.setUsing("description-dense")
.setFilter(filter)
.setWithPayload(enable(true))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
using static Qdrant.Client.Grpc.Conditions;
await client.QueryAsync(
collectionName: "books",
query: new Document
{
Text = "space opera",
Model = "sentence-transformers/all-minilm-l6-v2",
},
usingVector: "description-dense",
filter: MatchText("title", "space"),
payloadSelector: true
);
```
```go
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{
Model: "sentence-transformers/all-minilm-l6-v2",
Text: "space opera",
}),
),
Using: qdrant.PtrOf("description-dense"),
WithPayload: qdrant.NewWithPayload(true),
Filter: &qdrant.Filter{
Must: []\*qdrant.Condition{qdrant.NewMatchText("title", "space")},
},
})
```
When filtering on more than one term, a `text` filter only matches fields that contain \*all\* the specified terms (logical `AND`). To match fields that contain \*any\* of the specified terms (logical `OR`), use the `text\_any` condition:
```http
POST /collections/books/points/query
{
"query": {
"text": "space opera",
"model": "sentence-transformers/all-minilm-l6-v2"
},
"using": "description-dense",
"with\_payload": true,
"filter": {
"must": [
{
"key": "title",
"match": {
"text\_any": "space war"
}
}
]
}
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.query\_points(
collection\_name="books",
query=models.Document(text="space opera", model="sentence-transformers/all-minilm-l6-v2"),
using="description-dense",
with\_payload=True,
query\_filter=models.Filter(
must=[models.FieldCondition(key="title", match=models.MatchTextAny(text\_any="space war"))]
),
)
```
```typescript
client.query("books", {
query: {
text: "space opera",
model: "sentence-transformers/all-minilm-l6-v2",
},
using: "description-dense",
with\_payload: true,
filter: {
must: [
{ key: "title", match: { text\_any: "space war" } },
],
},
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{Condition, Document, Filter, Query, QueryPointsBuilder};
let filter = Filter::must([Condition::matches("title", "space war".to\_string())]);
client
.query(
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(Document::new(
"space opera",
"sentence-transformers/all-minilm-l6-v2",
)))
.using("description-dense")
.filter(filter)
.with\_payload(true)
.build(),
)
.await?;
```
```java
import static io.qdrant.client.ConditionFactory.\*;
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Common.Filter;
import io.qdrant.client.grpc.Points.\*;
QdrantClient client =
Filter filter = Filter.newBuilder().addMust(matchTextAny("title", "space war")).build();
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder()
.setText("space opera")
.setModel("sentence-transformers/all-minilm-l6-v2")
.build()))
.setUsing("description-dense")
.setFilter(filter)
.setWithPayload(enable(true))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
using static Qdrant.Client.Grpc.Conditions;
await client.QueryAsync(
collectionName: "books",
query: new Document
{
Text = "space opera",
Model = "sentence-transformers/all-minilm-l6-v2",
},
usingVector: "description-dense",
filter: MatchTextAny("title", "space war"),
payloadSelector: true
);
```
```go
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{
Model: "sentence-transformers/all-minilm-l6-v2",
Text: "space opera",
}),
),
Using: qdrant.PtrOf("description-dense"),
WithPayload: qdrant.NewWithPayload(true),
Filter: &qdrant.Filter{
Must: []\*qdrant.Condition{qdrant.NewMatchTextAny("title", "space war")},
},
})
```
Qdrant also supports phrase filtering, enabling you to search for multiple words in the exact order they appear in the original text, with no other words in between. For example, a phrase filter for "time machine" matches against the title "The Time Machine" but would not match "The Time Travel Machine" (there's a word between "time" and "machine") nor "Machine Time" (the word order is incorrect).
The difference between phrase filtering and keyword filtering is that phrase filtering applies text processing and, as a result, is case-insensitive, while keyword filtering is case-sensitive and only matches the exact string. Additionally, keyword filtering has to match the entire string, whereas phrase filtering can match part of a larger string. So a keyword filter for "Space War" would not match "The Space War" because it doesn't match "The," but a phrase filter for "Space War" would.
Summarizing the differences between the four filtering methods for a multi-term filter on "Space War":
| Method | Actual⠀query⠀⠀⠀ | Matches `Space War`? | Matches `The Space War`? | Matches `War in Space`? | Matches `War of the Worlds`? |
|---|---|---|---|---|---|
| text\_any | `space` OR `war` | Yes | Yes | Yes | Yes |
| text | `space` AND `war` | Yes | Yes | Yes | No |
| phrase | `"space war"` | Yes | Yes | No | No |
| keyword | `"Space War"` | Yes | No | No | No |
To filter on phrases, use a `phrase` condition. This requires enabling [phrase searching](/documentation/manage-data/indexing/index.md#phrase-search) when creating the full-text index:
```http
PUT /collections/books/index?wait=true
{
"field\_name": "title",
"field\_schema": {
"type": "text",
"ascii\_folding": true,
"phrase\_matching": true
}
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.create\_payload\_index(
collection\_name="books",
field\_name="title",
field\_schema=models.TextIndexParams(type=models.TextIndexType.TEXT, ascii\_folding=True, phrase\_matching=True),
)
```
```typescript
client.createPayloadIndex("books", {
field\_name: "title",
field\_schema: {
type: "text",
ascii\_folding: true,
phrase\_matching: true,
},
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{
CreateFieldIndexCollectionBuilder, FieldType, TextIndexParamsBuilder, TokenizerType,
};
let params = TextIndexParamsBuilder::new(TokenizerType::Word)
.ascii\_folding(true)
.phrase\_matching(true)
.lowercase(true)
.build();
client
.create\_field\_index(
CreateFieldIndexCollectionBuilder::new("books", "title", FieldType::Text)
.field\_index\_params(params),
)
.await?;
```
```java
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.PayloadIndexParams;
import io.qdrant.client.grpc.Collections.PayloadSchemaType;
import io.qdrant.client.grpc.Collections.TextIndexParams;
import io.qdrant.client.grpc.Collections.TokenizerType;
QdrantClient client =
client
.createPayloadIndexAsync(
"books",
"title",
PayloadSchemaType.Text,
PayloadIndexParams.newBuilder()
.setTextIndexParams(
TextIndexParams.newBuilder()
.setTokenizer(TokenizerType.Word)
.setAsciiFolding(true)
.setPhraseMatching(true)
.setLowercase(true)
.build())
.build(),
null,
null,
null)
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.CreatePayloadIndexAsync(
collectionName: "books",
fieldName: "title",
schemaType: PayloadSchemaType.Text,
indexParams: new PayloadIndexParams
{
TextIndexParams = new TextIndexParams
{
Tokenizer = TokenizerType.Word,
AsciiFolding = true,
PhraseMatching = true,
Lowercase = true,
},
}
);
```
```go
client.CreateFieldIndex(context.Background(), &qdrant.CreateFieldIndexCollection{
CollectionName: "books",
FieldName: "title",
FieldType: qdrant.FieldType\_FieldTypeText.Enum(),
FieldIndexParams: qdrant.NewPayloadIndexParamsText(
&qdrant.TextIndexParams{
Tokenizer: qdrant.TokenizerType\_Word,
Lowercase: qdrant.PtrOf(true),
AsciiFolding: qdrant.PtrOf(true),
PhraseMatching: qdrant.PtrOf(true),
}),
})
```
Next, you can use a `phrase` condition to filter for titles that contain the exact phrase "time machine":
```http
POST /collections/books/points/query
{
"query": {
"text": "time travel",
"model": "sentence-transformers/all-minilm-l6-v2"
},
"using": "description-dense",
"with\_payload": true,
"filter": {
"must": [
{
"key": "title",
"match": {
"phrase": "time machine"
}
}
]
}
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.query\_points(
collection\_name="books",
query=models.Document(text="time travel", model="sentence-transformers/all-minilm-l6-v2"),
using="description-dense",
with\_payload=True,
query\_filter=models.Filter(
must=[models.FieldCondition(key="title", match=models.MatchPhrase(phrase="time machine"))]
),
)
```
```typescript
client.query("books", {
query: {
text: "time travel",
model: "sentence-transformers/all-minilm-l6-v2",
},
using: "description-dense",
with\_payload: true,
filter: {
must: [
{ key: "title", match: { phrase: "time machine" } },
],
},
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{Condition, Document, Filter, Query, QueryPointsBuilder};
let filter = Filter::must([Condition::matches("title", "time machine".to\_string())]);
client
.query(
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(Document::new(
"time travel",
"sentence-transformers/all-minilm-l6-v2",
)))
.using("description-dense")
.filter(filter)
.with\_payload(true)
.build(),
)
.await?;
```
```java
import static io.qdrant.client.ConditionFactory.\*;
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.\*;
import io.qdrant.client.grpc.Common.Filter;
import io.qdrant.client.grpc.Points.\*;
import java.util.\*;
QdrantClient client =
Filter filter = Filter.newBuilder().addMust(matchPhrase("title", "time machine")).build();
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder()
.setText("time travel")
.setModel("sentence-transformers/all-minilm-l6-v2")
.build()))
.setUsing("description-dense")
.setFilter(filter)
.setWithPayload(enable(true))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
using static Qdrant.Client.Grpc.Conditions;
await client.QueryAsync(
collectionName: "books",
query: new Document
{
Text = "time travel",
Model = "sentence-transformers/all-minilm-l6-v2",
},
usingVector: "description-dense",
filter: MatchPhrase("title", "time machine"),
payloadSelector: true
);
```
```go
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{
Model: "sentence-transformers/all-minilm-l6-v2",
Text: "time travel",
}),
),
Using: qdrant.PtrOf("description-dense"),
WithPayload: qdrant.NewWithPayload(true),
Filter: &qdrant.Filter{
Must: []\*qdrant.Condition{qdrant.NewMatchPhrase("title", "time machine")},
},
})
```
### Progressive Filtering with the Batch Search API
Even though filters are not used to rank results, you can use the [batch search API](/documentation/search/search/index.md#batch-search-api) to progressively relax filters. This is useful when you have strict filtering criteria that may not return results. Batching multiple search requests with progressively relaxed filters enables you to get results even when the strictest filter returns no results.
For example, the following batch search request first tries to find books that match all search terms in the title. The second search request relaxes the filter to match any of the search terms. The third search request removes the filter altogether:
```http
POST /collections/books/points/query/batch
{
"searches": [
{
"query": {
"text": "time travel",
"model": "sentence-transformers/all-minilm-l6-v2"
},
"using": "description-dense",
"with\_payload": true,
"filter": {
"must": [
{
"key": "title",
"match": {
"text": "time travel"
}
}
]
}
},
{
"query": {
"text": "time travel",
"model": "sentence-transformers/all-minilm-l6-v2"
},
"using": "description-dense",
"with\_payload": true,
"filter": {
"must": [
{
"key": "title",
"match": {
"text\_any": "time travel"
}
}
]
}
},
{
"query": {
"text": "time travel",
"model": "sentence-transformers/all-minilm-l6-v2"
},
"using": "description-dense",
"with\_payload": true
}
]
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.query\_batch\_points(
collection\_name="books",
requests=[
models.QueryRequest(
query=models.Document(text="time travel", model="sentence-transformers/all-minilm-l6-v2"),
using="description-dense",
with\_payload=True,
filter=models.Filter(
must=[models.FieldCondition(key="title", match=models.MatchText(text="time travel"))]
),
),
models.QueryRequest(
query=models.Document(text="time travel", model="sentence-transformers/all-minilm-l6-v2"),
using="description-dense",
with\_payload=True,
filter=models.Filter(
must=[models.FieldCondition(key="title", match=models.MatchTextAny(text\_any="time travel"))]
),
),
models.QueryRequest(
query=models.Document(text="time travel", model="sentence-transformers/all-minilm-l6-v2"),
using="description-dense",
with\_payload=True,
),
],
)
```
```typescript
client.queryBatch("books", {
searches: [
{
query: { text: "time travel", model: "sentence-transformers/all-minilm-l6-v2" },
using: "description-dense",
with\_payload: true,
filter: {
must: [{ key: "title", match: { text: "time travel" } }],
},
},
{
query: { text: "time travel", model: "sentence-transformers/all-minilm-l6-v2" },
using: "description-dense",
with\_payload: true,
filter: {
must: [{ key: "title", match: { text\_any: "time travel" } }],
},
},
{
query: { text: "time travel", model: "sentence-transformers/all-minilm-l6-v2" },
using: "description-dense",
with\_payload: true,
},
],
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{
Condition, Document, Filter, Query, QueryBatchPointsBuilder, QueryPointsBuilder,
};
let strict\_filter = Filter::must([Condition::matches("title", "time travel".to\_string())]);
let relaxed\_filter = Filter::must([Condition::matches("title", "time travel".to\_string())]);
let searches = vec![
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(Document::new(
"time travel",
"sentence-transformers/all-minilm-l6-v2",
)))
.using("description-dense")
.filter(strict\_filter)
.with\_payload(true)
.build(),
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(Document::new(
"time travel",
"sentence-transformers/all-minilm-l6-v2",
)))
.using("description-dense")
.filter(relaxed\_filter)
.with\_payload(true)
.build(),
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(Document::new(
"time travel",
"sentence-transformers/all-minilm-l6-v2",
)))
.using("description-dense")
.with\_payload(true)
.build(),
];
client
.query\_batch(QueryBatchPointsBuilder::new("books", searches))
.await?;
```
```java
import static io.qdrant.client.ConditionFactory.\*;
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Common.Filter;
import io.qdrant.client.grpc.Points.\*;
import java.util.\*;
QdrantClient client =
QueryPoints searchStrict =
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder()
.setText("time travel")
.setModel("sentence-transformers/all-minilm-l6-v2")
.build()))
.setUsing("description-dense")
.setFilter(Filter.newBuilder().addMust(matchText("title", "time travel")).build())
.setWithPayload(enable(true))
.build();
QueryPoints searchRelaxed =
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder()
.setText("time travel")
.setModel("sentence-transformers/all-minilm-l6-v2")
.build()))
.setUsing("description-dense")
.setFilter(Filter.newBuilder().addMust(matchTextAny("title", "time travel")).build())
.setWithPayload(enable(true))
.build();
QueryPoints searchVectorOnly =
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder()
.setText("time travel")
.setModel("sentence-transformers/all-minilm-l6-v2")
.build()))
.setUsing("description-dense")
.setWithPayload(enable(true))
.build();
client.queryBatchAsync("books", List.of(searchStrict, searchRelaxed, searchVectorOnly)).get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
using static Qdrant.Client.Grpc.Conditions;
var searchStrict = new QueryPoints
{
CollectionName = "books",
Query = new Document
{
Text = "time travel",
Model = "sentence-transformers/all-minilm-l6-v2",
},
Using = "description-dense",
Filter = new Filter { Must = { MatchText("title", "time travel") } },
};
var searchRelaxed = new QueryPoints
{
CollectionName = "books",
Query = new Document
{
Text = "time travel",
Model = "sentence-transformers/all-minilm-l6-v2",
},
Using = "description-dense",
Filter = new Filter { Must = { MatchTextAny("title", "time travel") } },
};
var searchVectorOnly = new QueryPoints
{
CollectionName = "books",
Query = new Document
{
Text = "time travel",
Model = "sentence-transformers/all-minilm-l6-v2",
},
Using = "description-dense",
};
await client.QueryBatchAsync(
collectionName: "books",
queries: new List { searchStrict, searchRelaxed, searchVectorOnly }
);
```
```go
strict := &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{Model: "sentence-transformers/all-minilm-l6-v2", Text: "time travel"}),
),
Using: qdrant.PtrOf("description-dense"),
Filter: &qdrant.Filter{Must: []\*qdrant.Condition{qdrant.NewMatchText("title", "time travel")}},
}
relaxed := &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{Model: "sentence-transformers/all-minilm-l6-v2", Text: "time travel"}),
),
Using: qdrant.PtrOf("description-dense"),
Filter: &qdrant.Filter{Must: []\*qdrant.Condition{qdrant.NewMatchTextAny("title", "time travel")}},
}
vectorOnly := &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{Model: "sentence-transformers/all-minilm-l6-v2", Text: "time travel"}),
),
Using: qdrant.PtrOf("description-dense"),
}
client.QueryBatch(context.Background(), &qdrant.QueryBatchPoints{
CollectionName: "books",
QueryPoints: []\*qdrant.QueryPoints{strict, relaxed, vectorOnly},
})
```
The response contains three separate result sets. You can return the first non-empty result set to the user, or you can use the three sets to assemble a single ranked list.
## Full-Text Search
Full-text search is similar to full-text filtering, with the key difference being that full-text queries are used for ranking. For each document that matches the search terms, Qdrant calculates a relevance score based on how well the document matches the search terms. That score is used to rank the results. Qdrant supports several full-text search scoring algorithms.
Full-text search in Qdrant is powered by [sparse vectors](/articles/sparse-vectors/index.md). Why sparse vectors? Because they are a flexible way to represent data for search purposes, from classic BM25-based search, to semantic search, and [collaborative filtering](/documentation/tutorials-search-engineering/collaborative-filtering/index.md). Each term in the vocabulary corresponds to one or more dimension of the sparse vector, and the values in those dimensions represent the weight of that term in the document. Weights can be calculated using document statistics for use with the [BM25](#bm25) ranking algorithm, or you can use transformer-based models that can capture semantic meaning, like [SPLADE++](#splade), and [miniCOIL](#minicoil).
### BM25
BM25 (Best Matching 25) is a popular ranking algorithm that takes a probabilistic approach to score calculation. For each search term, BM25 considers several statistics about the term and the document to calculate a relevance score:
- Term frequency (TF): the more often a term appears in a document, the more relevant that document is likely to be.
- Inverse document frequency (IDF): the rarer a term is across all documents, the higher the weight of that term.
- Document length: a term appearing in a shorter document is more relevant than the same term appearing in a longer document.
Qdrant provides native support for BM25 through an [inference model](/documentation/inference/index.md#server-side-inference-bm25) that generates sparse vectors, or you can generate vectors on the client side using the [FastEmbed](/documentation/fastembed/index.md) library.
The BM25 model supports the same [text processing](#text-processing) options as text indices, including tokenization, lowercasing, ASCII folding, stemming, and stopword removal. A notable difference with text indices is that BM25 defaults to English stemming and stopword removal. If you are using a language other than English, ensure that you [configure](#language-specific-settings) the model accordingly.
To use BM25, configure a sparse vector when creating a collection:
```http
PUT /collections/books
{
"sparse\_vectors": {
"title-bm25": {
"modifier": "idf"
}
}
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.create\_collection(
collection\_name="books",
sparse\_vectors\_config={
"title-bm25": models.SparseVectorParams(modifier=models.Modifier.IDF)
},
)
```
```typescript
client.createCollection("books", {
sparse\_vectors: {
"title-bm25": { modifier: "idf" },
},
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{
CreateCollectionBuilder, Modifier, SparseVectorParamsBuilder, SparseVectorsConfigBuilder,
};
let mut sparse = SparseVectorsConfigBuilder::default();
sparse.add\_named\_vector\_params(
"title-bm25",
SparseVectorParamsBuilder::default().modifier(Modifier::Idf),
);
client
.create\_collection(CreateCollectionBuilder::new("books").sparse\_vectors\_config(sparse))
.await?;
```
```java
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.\*;
QdrantClient client =
client
.createCollectionAsync(
CreateCollection.newBuilder()
.setCollectionName("books")
.setSparseVectorsConfig(
SparseVectorConfig.newBuilder()
.putMap(
"title-bm25",
SparseVectorParams.newBuilder().setModifier(Modifier.Idf).build())
.build())
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.CreateCollectionAsync(
collectionName: "books",
sparseVectorsConfig: ("title-bm25", new SparseVectorParams { Modifier = Modifier.Idf })
);
```
```go
client.CreateCollection(context.Background(), &qdrant.CreateCollection{
CollectionName: "books",
SparseVectorsConfig: qdrant.NewSparseVectorsConfig(
map[string]\*qdrant.SparseVectorParams{
"title-bm25": {Modifier: qdrant.Modifier\_Idf.Enum()},
}),
})
```
Note the [IDF modifier](/documentation/manage-data/indexing/index.md#idf-modifier), which configures the sparse vector for queries that use the inverse document frequency (IDF).
Now you can ingest data. The following example ingests a book with its title represented as a sparse vector generated by the BM25 model:
```http
PUT /collections/books/points?wait=true
{
"points": [
{
"id": 1,
"vector": {
"title-bm25": {
"text": "The Time Machine",
"model": "qdrant/bm25"
}
},
"payload": {
"title": "The Time Machine",
"author": "H.G. Wells",
"isbn": "9780553213515"
}
}
]
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.upsert(
collection\_name="books",
points=[
models.PointStruct(
id=1,
vector={
"title-bm25": models.Document(
text="The Time Machine",
model="qdrant/bm25",
)
},
payload={
"title": "The Time Machine",
"author": "H.G. Wells",
"isbn": "9780553213515",
},
)
],
)
```
```typescript
client.upsert("books", {
wait: true,
points: [
{
id: 1,
vector: {
"title-bm25": {
text: "The Time Machine",
model: "qdrant/bm25",
},
},
payload: {
title: "The Time Machine",
author: "H.G. Wells",
isbn: "9780553213515",
},
},
],
});
```
```rust
use std::collections::HashMap;
use qdrant\_client::qdrant::{Document, PointStruct, UpsertPointsBuilder};
use qdrant\_client::{Payload, Qdrant};
use serde\_json::json;
let point = PointStruct::new(
1,
HashMap::from([(
"title-bm25".to\_string(),
Document::new("The Time Machine", "qdrant/bm25"),
)]),
Payload::try\_from(json!({
"title": "The Time Machine",
"author": "H.G. Wells",
"isbn": "9780553213515",
}))
.unwrap(),
);
client
.upsert\_points(UpsertPointsBuilder::new("books", vec![point]).wait(true))
.await?;
```
```java
import static io.qdrant.client.PointIdFactory.id;
import static io.qdrant.client.ValueFactory.value;
import static io.qdrant.client.VectorFactory.vector;
import static io.qdrant.client.VectorsFactory.namedVectors;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.\*;
import java.util.\*;
QdrantClient client =
PointStruct point =
PointStruct.newBuilder()
.setId(id(1))
.setVectors(
namedVectors(
Map.of(
"title-bm25",
vector(
Document.newBuilder()
.setText("The Time Machine")
.setModel("qdrant/bm25")
.build()))))
.putAllPayload(
Map.of(
"title", value("The Time Machine"),
"author", value("H.G. Wells"),
"isbn", value("9780553213515")))
.build();
client.upsertAsync("books", List.of(point)).get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.UpsertAsync(
collectionName: "books",
wait: true,
points: new List
{
new()
{
Id = 1,
Vectors = new Dictionary
{
["title-bm25"] = new Document
{
Text = "The Time Machine",
Model = "qdrant/bm25",
},
},
Payload =
{
["title"] = "The Time Machine",
["author"] = "H.G. Wells",
["isbn"] = "9780553213515",
},
},
}
);
```
```go
client.Upsert(context.Background(), &qdrant.UpsertPoints{
CollectionName: "books",
Points: []\*qdrant.PointStruct{
{
Id: qdrant.NewIDNum(uint64(1)),
Vectors: qdrant.NewVectorsMap(map[string]\*qdrant.Vector{
"title-bm25": qdrant.NewVectorDocument(&qdrant.Document{
Model: "qdrant/bm25",
Text: "The Time Machine",
}),
}),
Payload: qdrant.NewValueMap(map[string]any{
"title": "The Time Machine",
"author": "H.G. Wells",
"isbn": "9780553213515",
}),
},
},
})
```
After ingesting data, you can query the sparse vector. The following example searches for books with "time travel" in the title using the BM25 model:
```http
POST /collections/books/points/query
{
"query": {
"text": "time travel",
"model": "qdrant/bm25"
},
"using": "title-bm25",
"limit": 10,
"with\_payload": true
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.query\_points(
collection\_name="books",
query=models.Document(text="time travel", model="qdrant/bm25"),
using="title-bm25",
limit=10,
with\_payload=True,
)
```
```typescript
client.query("books", {
query: {
text: "time travel",
model: "qdrant/bm25",
},
using: "title-bm25",
limit: 10,
with\_payload: true,
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{Document, Query, QueryPointsBuilder};
client
.query(
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(Document::new("time travel", "qdrant/bm25")))
.using("title-bm25")
.limit(10)
.with\_payload(true)
.build(),
)
.await?;
```
```java
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.\*;
QdrantClient client =
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder()
.setText("time travel")
.setModel("qdrant/bm25")
.build()))
.setUsing("title-bm25")
.setLimit(10)
.setWithPayload(enable(true))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.QueryAsync(
collectionName: "books",
query: new Document { Text = "time travel", Model = "qdrant/bm25" },
usingVector: "title-bm25",
payloadSelector: true,
limit: 10
);
```
```go
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{
Model: "qdrant/bm25",
Text: "time travel",
}),
),
Using: qdrant.PtrOf("title-bm25"),
WithPayload: qdrant.NewWithPayload(true),
Limit: qdrant.PtrOf(uint64(10)),
})
```
#### Configuring BM25 Parameters
The BM25 [ranking function](https://en.wikipedia.org/wiki/Okapi\_BM25#The\_ranking\_function) includes three adjustable parameters that you can set at ingest time to optimize search results for your specific use case:
- `k`. Controls term frequency saturation. Higher values increase the influence of term frequency. Defaults to 1.2.
- `b`. Controls document length normalization. Ranges from 0 (no normalization) to 1 (full normalization). A higher value means longer documents have less impact. Defaults to 0.75.
- `avg\_len`. Average number of words in the field being queried. Defaults to 256.
For instance, book titles are generally shorter than 256 words. To achieve more accurate scoring when searching for book titles, you could calculate or estimate the average title length and set the `avg\_len` parameter accordingly:
```http
PUT /collections/books/points?wait=true
{
"points": [
{
"id": 1,
"vector": {
"title-bm25": {
"text": "The Time Machine",
"model": "qdrant/bm25",
"options": {
"avg\_len": 5.0
}
}
},
"payload": {
"title": "The Time Machine",
"author": "H.G. Wells",
"isbn": "9780553213515"
}
}
]
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.upsert(
collection\_name="books",
points=[
models.PointStruct(
id=1,
vector={
"title-bm25": models.Document(
text="The Time Machine",
model="qdrant/bm25",
options={"avg\_len": 5.0}
)
},
payload={
"title": "The Time Machine",
"author": "H.G. Wells",
"isbn": "9780553213515",
},
)
],
)
```
```typescript
client.upsert("books", {
wait: true,
points: [
{
id: 1,
vector: {
"title-bm25": {
text: "The Time Machine",
model: "qdrant/bm25",
options: { avg\_len: 5.0 },
},
},
payload: {
title: "The Time Machine",
author: "H.G. Wells",
isbn: "9780553213515",
},
},
],
});
```
```rust
use std::collections::HashMap;
use qdrant\_client::qdrant::{DocumentBuilder, PointStruct, UpsertPointsBuilder, Value};
use qdrant\_client::{Payload, Qdrant};
use serde\_json::json;
let mut options = HashMap::new();
options.insert("avg\_len".to\_string(), Value::from(5.0));
let point = PointStruct::new(
1,
HashMap::from([(
"title-bm25".to\_string(),
DocumentBuilder::new("The Time Machine", "qdrant/bm25")
.options(options)
.build(),
)]),
Payload::try\_from(json!({
"title": "The Time Machine",
"author": "H.G. Wells",
"isbn": "9780553213515",
}))
.unwrap(),
);
client
.upsert\_points(UpsertPointsBuilder::new("books", vec![point]).wait(true))
.await?;
```
```java
import static io.qdrant.client.PointIdFactory.id;
import static io.qdrant.client.ValueFactory.value;
import static io.qdrant.client.VectorFactory.vector;
import static io.qdrant.client.VectorsFactory.namedVectors;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.\*;
import java.util.\*;
QdrantClient client =
PointStruct point =
PointStruct.newBuilder()
.setId(id(1))
.setVectors(
namedVectors(
Map.of(
"title-bm25",
vector(
Document.newBuilder()
.setText("The Time Machine")
.setModel("qdrant/bm25")
.putOptions("avg\_len", value(5.0))
.build()))))
.putAllPayload(
Map.of(
"title", value("The Time Machine"),
"author", value("H.G. Wells"),
"isbn", value("9780553213515")))
.build();
client.upsertAsync("books", List.of(point)).get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.UpsertAsync(
collectionName: "books",
wait: true,
points: new List
{
new()
{
Id = 1,
Vectors = new Dictionary
{
["title-bm25"] = new Document
{
Text = "The Time Machine",
Model = "qdrant/bm25",
Options = { ["avg\_len"] = 5.0 },
},
},
Payload =
{
["title"] = "The Time Machine",
["author"] = "H.G. Wells",
["isbn"] = "9780553213515",
},
},
}
);
```
```go
client.Upsert(context.Background(), &qdrant.UpsertPoints{
CollectionName: "books",
Points: []\*qdrant.PointStruct{
{
Id: qdrant.NewIDNum(uint64(1)),
Vectors: qdrant.NewVectorsMap(map[string]\*qdrant.Vector{
"title-bm25": qdrant.NewVectorDocument(&qdrant.Document{
Model: "qdrant/bm25",
Text: "The Time Machine",
Options: qdrant.NewValueMap(map[string]any{"avg\_len": 5.0}),
}),
}),
Payload: qdrant.NewValueMap(map[string]any{
"title": "The Time Machine",
"author": "H.G. Wells",
"isbn": "9780553213515",
}),
},
},
})
```
#### Language-specific Settings
By default, BM25 uses English-specific settings for tokenization, stemming, and stopword removal. Words are reduced to their English root form, and common English stopwords are removed. If your data is not in English, this leads to suboptimal search results. To achieve optimal results for other languages, configure language-specific BM25 settings.
If you set any of the options discussed in this section, ensure that you apply the same settings at ingest and query time.
\*\*Stemming and Stopwords\*\*
To configure stemming and stopword removal, use the following options:
- `language`: sets the language for stemming and stopword removal. Defaults to `english`. To disable stemming and stopword removal, set `language` to `none`.
- `stemmer`: defaults to stemming for `language` (if set), but can be configured independently.
- `stopwords`: defaults to a set of stopwords for `language` (if set) but can be configured independently. You can configure a specific `language` and/or configure an explicit set of stopwords that will be merged with the stopword set of the configured language.
For example, to use Spanish stemming and stopwords during data ingestion, use:
```http
PUT /collections/books/points?wait=true
{
"points": [
{
"id": 1,
"vector": {
"title-bm25": {
"text": "La Máquina del Tiempo",
"model": "qdrant/bm25",
"options": {
"language": "spanish"
}
}
},
"payload": {
"title": "La Máquina del Tiempo",
"author": "H.G. Wells",
"isbn": "9788411486880"
}
}
]
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.upsert(
collection\_name="books",
points=[
models.PointStruct(
id=1,
vector={
"title-bm25": models.Document(
text="La Máquina del Tiempo",
model="qdrant/bm25",
options={"language": "spanish"},
)
},
payload={
"title": "La Máquina del Tiempo",
"author": "H.G. Wells",
"isbn": "9788411486880",
},
)
],
)
```
```typescript
client.upsert("books", {
wait: true,
points: [
{
id: 1,
vector: {
"title-bm25": {
text: "La Máquina del Tiempo",
model: "qdrant/bm25",
options: { language: "spanish" },
},
},
payload: {
title: "La Máquina del Tiempo",
author: "H.G. Wells",
isbn: "9788411486880",
},
},
],
});
```
```rust
use std::collections::HashMap;
use qdrant\_client::qdrant::{DocumentBuilder, PointStruct, UpsertPointsBuilder, Value};
use qdrant\_client::{Payload, Qdrant};
use serde\_json::json;
let mut options = HashMap::new();
options.insert("language".to\_string(), Value::from("spanish"));
let point = PointStruct::new(
1,
HashMap::from([(
"title-bm25".to\_string(),
DocumentBuilder::new("La Máquina del Tiempo", "qdrant/bm25")
.options(options)
.build(),
)]),
Payload::try\_from(json!({
"title": "La Máquina del Tiempo",
"author": "H.G. Wells",
"isbn": "9788411486880",
}))
.unwrap(),
);
client
.upsert\_points(UpsertPointsBuilder::new("books", vec![point]).wait(true))
.await?;
```
```java
import static io.qdrant.client.PointIdFactory.id;
import static io.qdrant.client.ValueFactory.value;
import static io.qdrant.client.VectorFactory.vector;
import static io.qdrant.client.VectorsFactory.namedVectors;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.\*;
import java.util.\*;
QdrantClient client =
PointStruct point =
PointStruct.newBuilder()
.setId(id(1))
.setVectors(
namedVectors(
Map.of(
"title-bm25",
vector(
Document.newBuilder()
.setText("La Máquina del Tiempo")
.setModel("qdrant/bm25")
.build()))))
.putAllPayload(
Map.of(
"title", value("La Máquina del Tiempo"),
"author", value("H.G. Wells"),
"isbn", value("9788411486880")))
.build();
client.upsertAsync("books", List.of(point)).get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.UpsertAsync(
collectionName: "books",
wait: true,
points: new List
{
new()
{
Id = 1,
Vectors = new Dictionary
{
["title-bm25"] = new Document
{
Text = "La Máquina del Tiempo",
Model = "qdrant/bm25",
},
},
Payload =
{
["title"] = "La Máquina del Tiempo",
["author"] = "H.G. Wells",
["isbn"] = "9788411486880",
},
},
}
);
```
```go
client.Upsert(context.Background(), &qdrant.UpsertPoints{
CollectionName: "books",
Points: []\*qdrant.PointStruct{
{
Id: qdrant.NewIDNum(uint64(1)),
Vectors: qdrant.NewVectorsMap(map[string]\*qdrant.Vector{
"title-bm25": qdrant.NewVectorDocument(&qdrant.Document{
Model: "qdrant/bm25",
Text: "La Máquina del Tiempo",
}),
}),
Payload: qdrant.NewValueMap(map[string]any{
"title": "La Máquina del Tiempo",
"author": "H.G. Wells",
"isbn": "9788411486880",
}),
},
},
})
```
At query time, use the exact same parameters to ensure consistent text processing:
```http
POST /collections/books/points/query
{
"query": {
"text": "tiempo",
"model": "qdrant/bm25",
"options": {
"language": "spanish"
}
},
"using": "title-bm25",
"limit": 10,
"with\_payload": true
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.query\_points(
collection\_name="books",
query=models.Document(text="tiempo", model="qdrant/bm25", options={"language": "spanish"}),
using="title-bm25",
limit=10,
with\_payload=True,
)
```
```typescript
client.query("books", {
query: {
text: "tiempo",
model: "qdrant/bm25",
options: { language: "spanish" },
},
using: "title-bm25",
limit: 10,
with\_payload: true,
});
```
```rust
use std::collections::HashMap;
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{DocumentBuilder, Query, QueryPointsBuilder, Value};
let mut options = HashMap::new();
options.insert("language".to\_string(), Value::from("spanish"));
client
.query(
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(
DocumentBuilder::new("tiempo", "qdrant/bm25")
.options(options)
.build(),
))
.using("title-bm25")
.limit(10)
.with\_payload(true)
.build(),
)
.await?;
```
```java
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.\*;
QdrantClient client =
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder().setText("tiempo").setModel("qdrant/bm25").build()))
.setUsing("title-bm25")
.setLimit(10)
.setWithPayload(enable(true))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.QueryAsync(
collectionName: "books",
query: new Document
{
Text = "tiempo",
Model = "qdrant/bm25",
Options = { ["language"] = "spanish" },
},
usingVector: "title-bm25",
payloadSelector: true,
limit: 10
);
```
```go
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{
Model: "qdrant/bm25",
Text: "tiempo",
Options: qdrant.NewValueMap(map[string]any{"language": "spanish"}),
}),
),
Using: qdrant.PtrOf("title-bm25"),
WithPayload: qdrant.NewWithPayload(true),
Limit: qdrant.PtrOf(uint64(10)),
})
```
To configure only a stemmer or a stopword set, rather than both, set `language` to `none` and specify the configuration for the desired stemmer or stopwords.
\*\*ASCII Folding\*\*
ASCII folding is the process of removing diacritics (accents) from characters. By removing diacritics, ASCII folding enables you to ignore accents when searching. For instance, with ASCII folding enabled, searching for "cafe" matches both "cafe" and "café".
To enable ASCII folding, set the `ascii\_folding` option to `true` at both ingest and query time:
```http
POST /collections/books/points/query
{
"query": {
"text": "Mieville",
"model": "qdrant/bm25",
"options": {
"ascii\_folding": true
}
},
"using": "author-bm25",
"limit": 10,
"with\_payload": true
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
# Note: the ascii\_folding option is not supported by FastEmbed
client.query\_points(
collection\_name="books",
query=models.Document(text="Mieville", model="qdrant/bm25", options={"ascii\_folding": True}),
using="author-bm25",
limit=10,
with\_payload=True,
)
```
```typescript
client.query("books", {
query: {
text: "Mieville",
model: "qdrant/bm25",
options: { ascii\_folding: true },
},
using: "author-bm25",
limit: 10,
with\_payload: true,
});
```
```rust
use std::collections::HashMap;
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{DocumentBuilder, Query, QueryPointsBuilder, Value};
let mut options = HashMap::new();
options.insert("ascii\_folding".to\_string(), Value::from(true));
client
.query(
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(
DocumentBuilder::new("Mieville", "qdrant/bm25")
.options(options)
.build(),
))
.using("author-bm25")
.limit(10)
.with\_payload(true)
.build(),
)
.await?;
```
```java
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.\*;
QdrantClient client =
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder().setText("Mieville").setModel("qdrant/bm25").build()))
.setUsing("author-bm25")
.setLimit(10)
.setWithPayload(enable(true))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.QueryAsync(
collectionName: "books",
query: new Document
{
Text = "Mieville",
Model = "qdrant/bm25",
Options = { ["ascii\_folding"] = true },
},
usingVector: "author-bm25",
payloadSelector: true,
limit: 10
);
```
```go
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{
Model: "qdrant/bm25",
Text: "Mieville",
Options: qdrant.NewValueMap(map[string]any{"ascii\_folding": true}),
}),
),
Using: qdrant.PtrOf("author-bm25"),
WithPayload: qdrant.NewWithPayload(true),
Limit: qdrant.PtrOf(uint64(10)),
})
```
\*\*Tokenizer\*\*
The tokenizer breaks down text into individual tokens (words). By default, the BM25 model uses the `word` tokenizer, which splits text based on word boundaries like whitespace and punctuation. This method is effective for Latin-based languages but may not work well for languages with non-Latin alphabets or languages that do not use spaces to separate words. For those languages, use the `multilingual` tokenizer. This tokenizer supports multiple languages, including those with non-Latin alphabets and non-space delimiters.
```http
POST /collections/books/points/query
{
"query": {
"text": "村上春樹",
"model": "qdrant/bm25",
"options": {
"tokenizer": "multilingual"
}
},
"using": "author-bm25",
"limit": 10,
"with\_payload": true
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
# Note: the tokenizer option is not supported by FastEmbed
client.query\_points(
collection\_name="books",
query=models.Document(text="村上春樹", model="qdrant/bm25", options={"tokenizer": "multilingual"}),
using="author-bm25",
limit=10,
with\_payload=True,
)
```
```typescript
client.query("books", {
query: {
text: "村上春樹",
model: "qdrant/bm25",
options: { tokenizer: "multilingual" },
},
using: "author-bm25",
limit: 10,
with\_payload: true,
});
```
```rust
use std::collections::HashMap;
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{DocumentBuilder, Query, QueryPointsBuilder, Value};
let mut options = HashMap::new();
options.insert("tokenizer".to\_string(), Value::from("multilingual"));
client
.query(
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(
DocumentBuilder::new("村上春樹", "qdrant/bm25")
.options(options)
.build(),
))
.using("author-bm25")
.limit(10)
.with\_payload(true)
.build(),
)
.await?;
```
```java
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.\*;
QdrantClient client =
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(Document.newBuilder().setText("村上春樹").setModel("qdrant/bm25").build()))
.setUsing("author-bm25")
.setLimit(10)
.setWithPayload(enable(true))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.QueryAsync(
collectionName: "books",
query: new Document
{
Text = "村上春樹",
Model = "qdrant/bm25",
Options = { ["tokenizer"] = "multilingual" },
},
usingVector: "author-bm25",
payloadSelector: true,
limit: 10
);
```
```go
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{
Model: "qdrant/bm25",
Text: "村上春樹",
Options: qdrant.NewValueMap(map[string]any{"tokenizer": "multilingual"}),
}),
),
Using: qdrant.PtrOf("author-bm25"),
WithPayload: qdrant.NewWithPayload(true),
Limit: qdrant.PtrOf(uint64(10)),
})
```
\*\*Language-neutral Text Processing\*\*
In some situations, you may want to disable language-specific processing altogether. For example, when searching for author names, that don't necessarily conform to the rules of a specific language.
To disable language-specific processing, set the following options:
- `language`: set to `none` to disable language-specific stemming and stopword removal.
- `tokenizer`: set to `multilingual` for multilingual tokenization and lemmatization.
- Optionally, set `ascii\_folding` to `true` to enable ASCII folding and ignore diacritics.
```http
POST /collections/books/points/query
{
"query": {
"text": "Mieville",
"model": "qdrant/bm25",
"options": {
"language": "none",
"tokenizer": "multilingual",
"ascii\_folding": true
}
},
"using": "author-bm25",
"limit": 10,
"with\_payload": true
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
# Note: these BM25 options are not supported by FastEmbed
client.query\_points(
collection\_name="books",
query=models.Document(
text="Mieville",
model="qdrant/bm25",
options={"language": "none", "tokenizer": "multilingual", "ascii\_folding": True},
),
using="author-bm25",
limit=10,
with\_payload=True,
)
```
```typescript
client.query("books", {
query: {
text: "Mieville",
model: "qdrant/bm25",
options: { language: "none", tokenizer: "multilingual", ascii\_folding: true },
},
using: "author-bm25",
limit: 10,
with\_payload: true,
});
```
```rust
use std::collections::HashMap;
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{DocumentBuilder, Query, QueryPointsBuilder, Value};
let mut options = HashMap::new();
options.insert("language".to\_string(), Value::from("none"));
options.insert("tokenizer".to\_string(), Value::from("multilingual"));
options.insert("ascii\_folding".to\_string(), Value::from(true));
client
.query(
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(
DocumentBuilder::new("Mieville", "qdrant/bm25")
.options(options)
.build(),
))
.using("author-bm25")
.limit(10)
.with\_payload(true)
.build(),
)
.await?;
```
```java
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.\*;
QdrantClient client =
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder().setText("Mieville").setModel("qdrant/bm25").build()))
.setUsing("author-bm25")
.setLimit(10)
.setWithPayload(enable(true))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.QueryAsync(
collectionName: "books",
query: new Document
{
Text = "Mieville",
Model = "qdrant/bm25",
Options =
{
["language"] = "none",
["tokenizer"] = "multilingual",
["ascii\_folding"] = true,
},
},
usingVector: "author-bm25",
payloadSelector: true,
limit: 10
);
```
```go
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{
Model: "qdrant/bm25",
Text: "Mieville",
Options: qdrant.NewValueMap(map[string]any{"language": "none", "tokenizer": "multilingual", "ascii\_folding": true}),
}),
),
Using: qdrant.PtrOf("author-bm25"),
WithPayload: qdrant.NewWithPayload(true),
Limit: qdrant.PtrOf(uint64(10)),
})
```
### SPLADE++
The SPLADE (Sparse Lexical and Dense) family of models are transformer-based models that generate sparse vectors out of text. These models combine the benefits of traditional lexical search with the power of transformer-based models by accounting for homonyms and synonyms. SPLADE models achieve this by expanding the vocabulary of the input text using contextual embeddings from the transformer model. For example, when processing the input text "time travel", a SPLADE model may expand the input to include related terms like "temporal", "journey", and "chronology". This expansion allows SPLADE models to capture the semantic meaning of the text while still leveraging the strengths of lexical search.
The advantage of using SPLADE models is that they [perform better](/articles/sparse-vectors/index.md#splade) than traditional BM25. They also have several downsides though. First, because they use a fixed vocabulary, you can't use SPLADE models to find terms that are not in the vocabulary, such as product IDs and out-of-domain language (words not seen in training). Secondly, because they are transformer-based models, SPLADE models are slower and require more computational resources than the traditional BM25 model.
On [Qdrant Cloud](/documentation/inference/index.md#qdrant-cloud-inference), you can use the SPLADE++ model with inference. Alternatively, you can generate vectors on the client side using the [FastEmbed](/documentation/fastembed/index.md) library.
```http
POST /collections/books/points/query
{
"query": {
"text": "time travel",
"model": "prithivida/splade\_pp\_en\_v1"
},
"using": "title-splade",
"limit": 10,
"with\_payload": true
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.query\_points(
collection\_name="books",
query=models.Document(text="time travel", model="prithivida/splade\_pp\_en\_v1"),
using="title-splade",
limit=10,
with\_payload=True,
)
```
```typescript
client.query("books", {
query: {
text: "time travel",
model: "prithivida/splade\_pp\_en\_v1",
},
using: "title-splade",
limit: 10,
with\_payload: true,
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{Document, Query, QueryPointsBuilder};
client
.query(
QueryPointsBuilder::new("books")
.query(Query::new\_nearest(Document::new(
"time travel",
"prithivida/splade\_pp\_en\_v1",
)))
.using("title-splade")
.limit(10)
.with\_payload(true)
.build(),
)
.await?;
```
```java
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.\*;
QdrantClient client =
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("books")
.setQuery(
nearest(
Document.newBuilder()
.setText("time travel")
.setModel("prithivida/splade\_pp\_en\_v1")
.build()))
.setUsing("title-splade")
.setLimit(10)
.setWithPayload(enable(true))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.QueryAsync(
collectionName: "books",
query: new Document { Text = "time travel", Model = "prithivida/splade\_pp\_en\_v1" },
usingVector: "title-splade",
payloadSelector: true,
limit: 10
);
```
```go
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "books",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{
Model: "prithivida/splade\_pp\_en\_v1",
Text: "time travel",
}),
),
Using: qdrant.PtrOf("title-splade"),
WithPayload: qdrant.NewWithPayload(true),
Limit: qdrant.PtrOf(uint64(10)),
})
```
For a tutorial on using SPLADE++ with FastEmbed, refer to [How to Generate Sparse Vectors with SPLADE](/documentation/fastembed/fastembed-splade/index.md).
### miniCOIL
[miniCOIL](/articles/minicoil/index.md) strikes a balance between the flexibility of BM25 and the performance of SPLADE++. miniCOIL is a transformer-based model that generates sparse vectors for text. Unlike SPLADE++, it doesn't use a vocabulary expansion mechanism. To capture the context and meaning of terms, the model generates a four-dimensional vector for each term. miniCOIL does not use a fixed vocabulary, making it an effective model for lexical search that ranks results based on the contextual meaning of keywords.
miniCOIL can be [used with the FastEmbed library](/documentation/fastembed/fastembed-minicoil/index.md).
## Combining Semantic and Lexical Search with Hybrid Search
[Hybrid search](/documentation/search/hybrid-queries/index.md#hybrid-search) enables you to combine semantic and lexical search in a single query, returning results that match the semantic meaning, the exact keywords, or both. This is useful when you don't know whether the user is looking for a specific keyword or a semantically similar document. For example, when searching for books, a user may enter "time travel" to find books related to the concept of time travel, but they may also enter a book's ISBN to find a specific book. Hybrid queries enable you to return results for both cases in a single query.
Hybrid queries make use of Qdrant's ability to store [multiple named vectors](/documentation/manage-data/vectors/index.md#named-vectors) in a single point. For example, you can store a dense vector for semantic search and a sparse vector for lexical search in the same point. To do so, first create a collection with both a dense vector and a sparse vector:
```http
PUT /collections/books
{
"vectors": {
"description-dense": {
"size": 384,
"distance": "Cosine"
}
},
"sparse\_vectors": {
"isbn-bm25": {
"modifier": "idf"
}
}
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.create\_collection(
collection\_name="books",
vectors\_config={
"description-dense": models.VectorParams(size=384, distance=models.Distance.COSINE)
},
sparse\_vectors\_config={
"isbn-bm25": models.SparseVectorParams(modifier=models.Modifier.IDF)
},
)
```
```typescript
client.createCollection("books", {
vectors: {
"description-dense": { size: 384, distance: "Cosine" },
},
sparse\_vectors: {
"isbn-bm25": { modifier: "idf" },
},
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{
CreateCollectionBuilder, Distance, Modifier, SparseVectorParamsBuilder,
SparseVectorsConfigBuilder, VectorParamsBuilder, VectorsConfigBuilder,
};
let mut vectors = VectorsConfigBuilder::default();
vectors.add\_named\_vector\_params(
"description-dense",
VectorParamsBuilder::new(384, Distance::Cosine),
);
let mut sparse = SparseVectorsConfigBuilder::default();
sparse.add\_named\_vector\_params(
"isbn-bm25",
SparseVectorParamsBuilder::default().modifier(Modifier::Idf),
);
client
.create\_collection(
CreateCollectionBuilder::new("books")
.vectors\_config(vectors)
.sparse\_vectors\_config(sparse),
)
.await?;
```
```java
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Collections.\*;
QdrantClient client =
client
.createCollectionAsync(
CreateCollection.newBuilder()
.setCollectionName("books")
.setVectorsConfig(
VectorsConfig.newBuilder()
.setParamsMap(
VectorParamsMap.newBuilder()
.putMap(
"description-dense",
VectorParams.newBuilder()
.setSize(384)
.setDistance(Distance.Cosine)
.build())
.build())
.build())
.setSparseVectorsConfig(
SparseVectorConfig.newBuilder()
.putMap(
"isbn-bm25",
SparseVectorParams.newBuilder().setModifier(Modifier.Idf).build())
.build())
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.CreateCollectionAsync(
collectionName: "books",
vectorsConfig: new VectorParamsMap
{
Map =
{
["description-dense"] = new VectorParams
{
Size = 384,
Distance = Distance.Cosine,
},
},
},
sparseVectorsConfig: new SparseVectorConfig
{
Map = { ["isbn-bm25"] = new SparseVectorParams { Modifier = Modifier.Idf } },
}
);
```
```go
client.CreateCollection(context.Background(), &qdrant.CreateCollection{
CollectionName: "books",
VectorsConfig: qdrant.NewVectorsConfigMap(
map[string]\*qdrant.VectorParams{
"description-dense": {Size: 384, Distance: qdrant.Distance\_Cosine},
}),
SparseVectorsConfig: qdrant.NewSparseVectorsConfig(
map[string]\*qdrant.SparseVectorParams{
"isbn-bm25": {Modifier: qdrant.Modifier\_Idf.Enum()},
}),
})
```
After ingesting data with both vectors, you can use the prefetch feature to run both semantic and lexical queries in a single request. The results of both queries are then combined using a fusion method like Reciprocal Rank Fusion (RRF).
```http
POST /collections/books/points/query
{
"prefetch": [
{
"query": {
"text": "9780553213515",
"model": "sentence-transformers/all-minilm-l6-v2"
},
"using": "description-dense",
"score\_threshold": 0.5
},
{
"query": {
"text": "9780553213515",
"model": "Qdrant/bm25"
},
"using": "isbn-bm25"
}
],
"query": {
"fusion": "rrf"
},
"limit": 10,
"with\_payload": true
}
```
```python
from qdrant\_client import QdrantClient, models
client = QdrantClient(
url="https://xyz-example.qdrant.io:6333",
api\_key="",
cloud\_inference=True,
)
client.query\_points(
collection\_name="books",
prefetch=[
models.Prefetch(
query=models.Document(
text="9780553213515",
model="sentence-transformers/all-minilm-l6-v2"
),
using="description-dense",
score\_threshold=0.5,
),
models.Prefetch(
query=models.Document(
text="9780553213515",
model="Qdrant/bm25",
),
using="isbn-bm25",
),
],
query=models.FusionQuery(fusion=models.Fusion.RRF),
limit=10,
with\_payload=True,
)
```
```typescript
client.query("books", {
prefetch: [
{
query: { text: "9780553213515", model: "sentence-transformers/all-minilm-l6-v2" },
using: "description-dense",
score\_threshold: 0.5,
},
{
query: { text: "9780553213515", model: "Qdrant/bm25" },
using: "isbn-bm25",
},
],
query: { fusion: "rrf" },
limit: 10,
with\_payload: true,
});
```
```rust
use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{Document, Fusion, PrefetchQueryBuilder, Query, QueryPointsBuilder};
let dense\_prefetch = PrefetchQueryBuilder::default()
.query(Query::new\_nearest(Document::new(
"9780553213515",
"sentence-transformers/all-minilm-l6-v2",
)))
.using("description-dense")
.score\_threshold(0.5)
.build();
let bm25\_prefetch = PrefetchQueryBuilder::default()
.query(Query::new\_nearest(Document::new(
"9780553213515",
"Qdrant/bm25",
)))
.using("isbn-bm25")
.build();
client
.query(
QueryPointsBuilder::new("books")
.add\_prefetch(dense\_prefetch)
.add\_prefetch(bm25\_prefetch)
.query(Query::new\_fusion(Fusion::Rrf))
.limit(10)
.with\_payload(true)
.build(),
)
.await?;
```
```java
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.WithPayloadSelectorFactory.enable;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.\*;
QdrantClient client =
PrefetchQuery densePrefetch =
PrefetchQuery.newBuilder()
.setUsing("description-dense")
.setScoreThreshold(0.5f)
.setQuery(
nearest(
Document.newBuilder()
.setText("9780553213515")
.setModel("sentence-transformers/all-minilm-l6-v2")
.build()))
.build();
PrefetchQuery bm25Prefetch =
PrefetchQuery.newBuilder()
.setUsing("isbn-bm25")
.setQuery(
nearest(
Document.newBuilder().setText("9780553213515").setModel("Qdrant/bm25").build()))
.build();
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("books")
.addPrefetch(densePrefetch)
.addPrefetch(bm25Prefetch)
.setQuery(Query.newBuilder().setFusion(Fusion.RRF).build())
.setLimit(10)
.setWithPayload(enable(true))
.build())
.get();
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.QueryAsync(
collectionName: "books",
prefetch: new List
{
new()
{
Using = "description-dense",
Query = new Document
{
Text = "9780553213515",
Model = "sentence-transformers/all-minilm-l6-v2",
},
ScoreThreshold = 0.5f,
},
new()
{
Using = "isbn-bm25",
Query = new Document { Text = "9780553213515", Model = "Qdrant/bm25" },
},
},
query: Fusion.Rrf,
payloadSelector: true,
limit: 10
);
```
```go
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "books",
Prefetch: []\*qdrant.PrefetchQuery{
{
Using: qdrant.PtrOf("description-dense"),
Query: qdrant.NewQueryDocument(&qdrant.Document{
Text: "9780553213515",
Model: "sentence-transformers/all-minilm-l6-v2",
}),
},
{
Using: qdrant.PtrOf("isbn-bm25"),
Query: qdrant.NewQueryDocument(&qdrant.Document{
Text: "9780553213515",
Model: "qdrant/bm25",
}),
},
},
Query: qdrant.NewQueryFusion(qdrant.Fusion\_RRF),
WithPayload: qdrant.NewWithPayload(true),
Limit: qdrant.PtrOf(uint64(10)),
})
```
This query searches for an ISBN, for which only the lexical search returns a result. The `score\_threshold` for the semantic query prevents low-scoring results to be returned (0.5 is just an example threshold; you need to tune what a good threshold is for your data and model). So in this case, only the lexical result is returned to the user. If a user had searched for "time travel", only the semantic search would return results, and those would be returned to the user. If a user would search for a term that matched both the semantic and lexical vectors, the results from both searches would be combined to provide a more comprehensive set of results.
You are not limited to prefetching just two queries. Examples include, but are not limited to:
- Fuse multiple lexical queries across the `title`, `author`, and `isbn` fields alongside a semantic query to achieve a comprehensive search across all data.
- Prefetch using sparse or dense vectors and/or filters, and [rescore with dense vectors](/documentation/search/hybrid-queries/index.md#multi-stage-queries).
- [Prefetch with dense and sparse vectors, and rerank using late interaction embeddings](/documentation/tutorials-search-engineering/reranking-hybrid-search/index.md?q=late+interaction).
## Conclusion
Qdrant's text search capabilities enable you to build powerful search applications that combine the best of semantic and lexical search. By leveraging dense and sparse vectors, along with Qdrant's flexible querying capabilities, you can create search experiences that meet a wide range of user needs.