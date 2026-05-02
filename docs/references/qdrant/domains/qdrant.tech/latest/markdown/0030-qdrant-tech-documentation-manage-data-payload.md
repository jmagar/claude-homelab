Payload - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Manage Data](https://qdrant.tech/documentation/manage-data/)
*
* Payload# Payload
One of the significant features of Qdrant is the ability to store additional information along with vectors.
This information is called `payload` in Qdrant terminology.
Qdrant allows you to store any information that can be represented using JSON.
Here is an example of a typical payload:
```
`{
"name": "jacket",
"colors": ["red", "blue"],
"count": 10,
"price": 11.99,
"locations": [
{
"lon": 52.5200,
"lat": 13.4050
}
],
"reviews": [
{
"user": "alice",
"score": 4
},
{
"user": "bob",
"score": 5
}
]
}
`
```
## Payload types
In addition to storing payloads, Qdrant also allows you search based on certain kinds of values.
This feature is implemented as additional filters during the search and will enable you to incorporate custom logic on top of semantic similarity.
During the filtering, Qdrant will check the conditions over those values that match the type of the filtering condition. If the stored value type does not fit the filtering condition - it will be considered not satisfied.
For example, you will get an empty output if you apply the [range condition](https://qdrant.tech/documentation/search/filtering/#range) on the string data.
However, arrays (multiple values of the same type) are treated a little bit different. When we apply a filter to an array, it will succeed if at least one of the values inside the array meets the condition.
The filtering process is discussed in detail in the section [Filtering](https://qdrant.tech/documentation/search/filtering/).
Let&rsquo;s look at the data types that Qdrant supports for searching:
### Integer
`integer` - 64-bit integer in the range from `-9223372036854775808` to `9223372036854775807`.
Example of single and multiple `integer` values:
```
`{
"count": 10,
"sizes": [35, 36, 38]
}
`
```
### Float
`float` - 64-bit floating point number.
Example of single and multiple `float` values:
```
`{
"price": 11.99,
"ratings": [9.1, 9.2, 9.4]
}
`
```
### Bool
Bool - binary value. Equals to `true` or `false`.
Example of single and multiple `bool` values:
```
`{
"is\_delivered": true,
"responses": [false, false, true, false]
}
`
```
### Keyword
`keyword` - string value.
Example of single and multiple `keyword` values:
```
`{
"name": "Alice",
"friends": [
"bob",
"eva",
"jack"
]
}
`
```
### Geo
`geo` is used to represent geographical coordinates.
Example of single and multiple `geo` values:
```
`{
"location": {
"lon": 52.5200,
"lat": 13.4050
},
"cities": [
{
"lon": 51.5072,
"lat": 0.1276
},
{
"lon": 40.7128,
"lat": 74.0060
}
]
}
`
```
Coordinate should be described as an object containing two fields: `lon` - for longitude, and `lat` - for latitude.
### Datetime
*Available as of v1.8.0*
`datetime` - date and time in [RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339#section-5.6) format.
See the following examples of single and multiple `datetime` values:
```
`{
"created\_at": "2023-02-08T10:49:00Z",
"updated\_at": [
"2023-02-08T13:52:00Z",
"2023-02-21T21:23:00Z"
]
}
`
```
The following formats are supported:
* `"2023-02-08T10:49:00Z"` ([RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339#section-5.6), UTC)
* `"2023-02-08T11:49:00+01:00"` ([RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339#section-5.6), with timezone)
* `"2023-02-08T10:49:00"` (without timezone, UTC is assumed)
* `"2023-02-08T10:49"` (without timezone and seconds)
* `"2023-02-08"` (only date, midnight is assumed)
Notes about the format:
* `T` can be replaced with a space.
* The `T` and `Z` symbols are case-insensitive.
* UTC is always assumed when the timezone is not specified.
* Timezone can have the following formats: `±HH:MM`, `±HHMM`, `±HH`, or `Z`.
* Seconds can have up to 6 decimals, so the finest granularity for `datetime` is microseconds.### UUID
*Available as of v1.11.0*
In addition to the basic `keyword` type, Qdrant supports `uuid` type for storing UUID values.
Functionally, it works the same as `keyword`, internally stores parsed UUID values.
```
`{
"uuid": "550e8400-e29b-41d4-a716-446655440000",
"uuids": [
"550e8400-e29b-41d4-a716-446655440000",
"550e8400-e29b-41d4-a716-446655440001"
]
}
`
```
String representation of UUID (e.g. `550e8400-e29b-41d4-a716-446655440000`) occupies 36 bytes.
But when numeric representation is used, it is only 128 bits (16 bytes).
Usage of `uuid` index type is recommended in payload-heavy collections to save RAM and improve search performance.
## Create point with payload
REST API ([Schema](https://api.qdrant.tech/api-reference/points/upsert-points))
```
`PUT /collections/{collection\_name}/points
{
"points": [
{
"id": 1,
"vector": [0.05, 0.61, 0.76, 0.74],
"payload": {"city": "Berlin", "price": 1.99}
},
{
"id": 2,
"vector": [0.19, 0.81, 0.75, 0.11],
"payload": {"city": ["Berlin", "London"], "price": 1.99}
},
{
"id": 3,
"vector": [0.36, 0.55, 0.47, 0.94],
"payload": {"city": ["Berlin", "Moscow"], "price": [1.99, 2.99]}
}
]
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.upsert(
collection\_name="{collection\_name}",
points=[
models.PointStruct(
id=1,
vector=[0.05, 0.61, 0.76, 0.74],
payload={
"city": "Berlin",
"price": 1.99,
},
),
models.PointStruct(
id=2,
vector=[0.19, 0.81, 0.75, 0.11],
payload={
"city": ["Berlin", "London"],
"price": 1.99,
},
),
models.PointStruct(
id=3,
vector=[0.36, 0.55, 0.47, 0.94],
payload={
"city": ["Berlin", "Moscow"],
"price": [1.99, 2.99],
},
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
vector: [0.05, 0.61, 0.76, 0.74],
payload: {
city: "Berlin",
price: 1.99,
},
},
{
id: 2,
vector: [0.19, 0.81, 0.75, 0.11],
payload: {
city: ["Berlin", "London"],
price: 1.99,
},
},
{
id: 3,
vector: [0.36, 0.55, 0.47, 0.94],
payload: {
city: ["Berlin", "Moscow"],
price: [1.99, 2.99],
},
},
],
});
`
```
```
`use qdrant\_client::qdrant::{PointStruct, UpsertPointsBuilder};
use qdrant\_client::{Payload, Qdrant};
use serde\_json::json;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
let points = vec![
PointStruct::new(
1,
vec![0.05, 0.61, 0.76, 0.74],
Payload::try\_from(json!({"city": "Berlin", "price": 1.99})).unwrap(),
),
PointStruct::new(
2,
vec![0.19, 0.81, 0.75, 0.11],
Payload::try\_from(json!({"city": ["Berlin", "London"]})).unwrap(),
),
PointStruct::new(
3,
vec![0.36, 0.55, 0.47, 0.94],
Payload::try\_from(json!({"city": ["Berlin", "Moscow"], "price": [1.99, 2.99]}))
.unwrap(),
),
];
client
.upsert\_points(UpsertPointsBuilder::new("{collection\_name}", points).wait(true))
.await?;
`
```
```
`import static io.qdrant.client.PointIdFactory.id;
import static io.qdrant.client.ValueFactory.list;
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
.setVectors(vectors(0.05f, 0.61f, 0.76f, 0.74f))
.putAllPayload(Map.of("city", value("Berlin"), "price", value(1.99)))
.build(),
PointStruct.newBuilder()
.setId(id(2))
.setVectors(vectors(0.19f, 0.81f, 0.75f, 0.11f))
.putAllPayload(
Map.of("city", list(List.of(value("Berlin"), value("London")))))
.build(),
PointStruct.newBuilder()
.setId(id(3))
.setVectors(vectors(0.36f, 0.55f, 0.47f, 0.94f))
.putAllPayload(
Map.of(
"city",
list(List.of(value("Berlin"), value("London"))),
"price",
list(List.of(value(1.99), value(2.99)))))
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
new PointStruct
{
Id = 1,
Vectors = new[] { 0.05f, 0.61f, 0.76f, 0.74f },
Payload = { ["city"] = "Berlin", ["price"] = 1.99 }
},
new PointStruct
{
Id = 2,
Vectors = new[] { 0.19f, 0.81f, 0.75f, 0.11f },
Payload = { ["city"] = new[] { "Berlin", "London" } }
},
new PointStruct
{
Id = 3,
Vectors = new[] { 0.36f, 0.55f, 0.47f, 0.94f },
Payload =
{
["city"] = new[] { "Berlin", "Moscow" },
["price"] = new Value[] { 1.99, 2.99 }
}
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
Vectors: qdrant.NewVectors(0.05, 0.61, 0.76, 0.74),
Payload: qdrant.NewValueMap(map[string]any{
"city": "Berlin", "price": 1.99}),
},
{
Id: qdrant.NewIDNum(2),
Vectors: qdrant.NewVectors(0.19, 0.81, 0.75, 0.11),
Payload: qdrant.NewValueMap(map[string]any{
"city": []any{"Berlin", "London"}}),
},
{
Id: qdrant.NewIDNum(3),
Vectors: qdrant.NewVectors(0.36, 0.55, 0.47, 0.94),
Payload: qdrant.NewValueMap(map[string]any{
"city": []any{"Berlin", "London"},
"price": []any{1.99, 2.99}}),
},
},
})
`
```
## Update payload
Updating payloads in Qdrant offers flexible methods to manage vector metadata. The **set payload** method updates specific fields while keeping others unchanged, while the **overwrite** method replaces the entire payload. Developers can also use **clear payload** to remove all metadata or delete fields to remove specific keys without affecting the rest. These options provide precise control for adapting to dynamic datasets.
### Set payload
Set only the given payload values on a point.
REST API ([Schema](https://api.qdrant.tech/api-reference/points/set-payload)):
```
`POST /collections/{collection\_name}/points/payload
{
"payload": {
"property1": "string",
"property2": "string"
},
"points": [
0, 3, 100
]
}
`
```
```
`client.set\_payload(
collection\_name="{collection\_name}",
payload={
"property1": "string",
"property2": "string",
},
points=[0, 3, 10],
)
`
```
```
`client.setPayload("{collection\_name}", {
payload: {
property1: "string",
property2: "string",
},
points: [0, 3, 10],
});
`
```
```
`use qdrant\_client::qdrant::{
PointsIdsList, SetPayloadPointsBuilder,
};
use qdrant\_client::Payload;
use serde\_json::json;
client
.set\_payload(
SetPayloadPointsBuilder::new(
"{collection\_name}",
Payload::try\_from(json!({
"property1": "string",
"property2": "string",
}))
.unwrap(),
)
.points\_selector(PointsIdsList {
ids: vec![0.into(), 3.into(), 10.into()],
})
.wait(true),
)
.await?;
`
```
```
`import static io.qdrant.client.PointIdFactory.id;
import static io.qdrant.client.ValueFactory.value;
import java.util.List;
import java.util.Map;
client
.setPayloadAsync(
"{collection\_name}",
Map.of("property1", value("string"), "property2", value("string")),
List.of(id(0), id(3), id(10)),
true,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.SetPayloadAsync(
collectionName: "{collection\_name}",
payload: new Dictionary\<string, Value\> { { "property1", "string" }, { "property2", "string" } },
ids: new ulong[] { 0, 3, 10 }
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
client.SetPayload(context.Background(), &qdrant.SetPayloadPoints{
CollectionName: "{collection\_name}",
Payload: qdrant.NewValueMap(
map[string]any{"property1": "string", "property2": "string"}),
PointsSelector: qdrant.NewPointsSelector(
qdrant.NewIDNum(0),
qdrant.NewIDNum(3)),
})
`
```
You don&rsquo;t need to know the ids of the points you want to modify. The alternative
is to use filters.
```
`POST /collections/{collection\_name}/points/payload
{
"payload": {
"property1": "string",
"property2": "string"
},
"filter": {
"must": [
{
"key": "color",
"match": {
"value": "red"
}
}
]
}
}
`
```
```
`client.set\_payload(
collection\_name="{collection\_name}",
payload={
"property1": "string",
"property2": "string",
},
points=models.Filter(
must=[
models.FieldCondition(
key="color",
match=models.MatchValue(value="red"),
),
],
),
)
`
```
```
`client.setPayload("{collection\_name}", {
payload: {
property1: "string",
property2: "string",
},
filter: {
must: [
{
key: "color",
match: {
value: "red",
},
},
],
},
});
`
```
```
`use qdrant\_client::qdrant::{Condition, Filter, SetPayloadPointsBuilder};
use qdrant\_client::Payload;
use serde\_json::json;
client
.set\_payload(
SetPayloadPointsBuilder::new(
"{collection\_name}",
Payload::try\_from(json!({
"property1": "string",
"property2": "string",
}))
.unwrap(),
)
.points\_selector(Filter::must([Condition::matches(
"color",
"red".to\_string(),
)]))
.wait(true),
)
.await?;
`
```
```
`import static io.qdrant.client.ConditionFactory.matchKeyword;
import static io.qdrant.client.ValueFactory.value;
import io.qdrant.client.grpc.Common.Filter;
import java.util.Map;
client
.setPayloadAsync(
"{collection\_name}",
Map.of("property1", value("string"), "property2", value("string")),
Filter.newBuilder().addMust(matchKeyword("color", "red")).build(),
true,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
using static Qdrant.Client.Grpc.Conditions;
var client = new QdrantClient("localhost", 6334);
await client.SetPayloadAsync(
collectionName: "{collection\_name}",
payload: new Dictionary\<string, Value\> { { "property1", "string" }, { "property2", "string" } },
filter: MatchKeyword("color", "red")
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
client.SetPayload(context.Background(), &qdrant.SetPayloadPoints{
CollectionName: "{collection\_name}",
Payload: qdrant.NewValueMap(
map[string]any{"property1": "string", "property2": "string"}),
PointsSelector: qdrant.NewPointsSelectorFilter(&qdrant.Filter{
Must: []\*qdrant.Condition{
qdrant.NewMatch("color", "red"),
},
}),
})
`
```
*Available as of v1.8.0*
It is possible to modify only a specific key of the payload by using the `key` parameter.
For instance, given the following payload JSON object on a point:
```
`{
"property1": {
"nested\_property": "foo",
},
"property2": {
"nested\_property": "bar",
}
}
`
```
You can modify the `nested\_property` of `property1` with the following request:
```
`POST /collections/{collection\_name}/points/payload
{
"payload": {
"nested\_property": "qux",
},
"key": "property1",
"points": [1]
}
`
```
Resulting in the following payload:
```
`{
"property1": {
"nested\_property": "qux",
},
"property2": {
"nested\_property": "bar",
}
}
`
```
### Overwrite payload
Fully replace any existing payload with the given one.
REST API ([Schema](https://api.qdrant.tech/api-reference/points/overwrite-payload)):
```
`PUT /collections/{collection\_name}/points/payload
{
"payload": {
"property1": "string",
"property2": "string"
},
"points": [
0, 3, 100
]
}
`
```
```
`client.overwrite\_payload(
collection\_name="{collection\_name}",
payload={
"property1": "string",
"property2": "string",
},
points=[0, 3, 10],
)
`
```
```
`client.overwritePayload("{collection\_name}", {
payload: {
property1: "string",
property2: "string",
},
points: [0, 3, 10],
});
`
```
```
`use qdrant\_client::qdrant::{PointsIdsList, SetPayloadPointsBuilder};
use qdrant\_client::Payload;
use serde\_json::json;
client
.overwrite\_payload(
SetPayloadPointsBuilder::new(
"{collection\_name}",
Payload::try\_from(json!({
"property1": "string",
"property2": "string",
}))
.unwrap(),
)
.points\_selector(PointsIdsList {
ids: vec![0.into(), 3.into(), 10.into()],
})
.wait(true),
)
.await?;
`
```
```
`import static io.qdrant.client.PointIdFactory.id;
import static io.qdrant.client.ValueFactory.value;
import java.util.List;
import java.util.Map;
client
.overwritePayloadAsync(
"{collection\_name}",
Map.of("property1", value("string"), "property2", value("string")),
List.of(id(0), id(3), id(10)),
true,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.OverwritePayloadAsync(
collectionName: "{collection\_name}",
payload: new Dictionary\<string, Value\> { { "property1", "string" }, { "property2", "string" } },
ids: new ulong[] { 0, 3, 10 }
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
client.OverwritePayload(context.Background(), &qdrant.SetPayloadPoints{
CollectionName: "{collection\_name}",
Payload: qdrant.NewValueMap(
map[string]any{"property1": "string", "property2": "string"}),
PointsSelector: qdrant.NewPointsSelector(
qdrant.NewIDNum(0),
qdrant.NewIDNum(3)),
})
`
```
Like [set payload](#set-payload), you don&rsquo;t need to know the ids of the points
you want to modify. The alternative is to use filters.
### Clear payload
This method removes all payload keys from specified points
REST API ([Schema](https://api.qdrant.tech/api-reference/points/clear-payload)):
```
`POST /collections/{collection\_name}/points/payload/clear
{
"points": [0, 3, 100]
}
`
```
```
`client.clear\_payload(
collection\_name="{collection\_name}",
points\_selector=[0, 3, 100],
)
`
```
```
`client.clearPayload("{collection\_name}", {
points: [0, 3, 100],
});
`
```
```
`use qdrant\_client::qdrant::{ClearPayloadPointsBuilder, PointsIdsList};
client
.clear\_payload(
ClearPayloadPointsBuilder::new("{collection\_name}")
.points(PointsIdsList {
ids: vec![0.into(), 3.into(), 10.into()],
})
.wait(true),
)
.await?;
`
```
```
`import static io.qdrant.client.PointIdFactory.id;
import java.util.List;
client
.clearPayloadAsync("{collection\_name}", List.of(id(0), id(3), id(100)), true, null, null)
.get();
`
```
```
`using Qdrant.Client;
var client = new QdrantClient("localhost", 6334);
await client.ClearPayloadAsync(collectionName: "{collection\_name}", ids: new ulong[] { 0, 3, 100 });
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client.ClearPayload(context.Background(), &qdrant.ClearPayloadPoints{
CollectionName: "{collection\_name}",
Points: qdrant.NewPointsSelector(
qdrant.NewIDNum(0),
qdrant.NewIDNum(3)),
})
`
```
You can also use `models.FilterSelector` to remove the points matching given filter criteria, instead of providing the ids.### Delete payload keys
Delete specific payload keys from points.
REST API ([Schema](https://api.qdrant.tech/api-reference/points/delete-payload)):
```
`POST /collections/{collection\_name}/points/payload/delete
{
"keys": ["color", "price"],
"points": [0, 3, 100]
}
`
```
```
`client.delete\_payload(
collection\_name="{collection\_name}",
keys=["color", "price"],
points=[0, 3, 100],
)
`
```
```
`client.deletePayload("{collection\_name}", {
keys: ["color", "price"],
points: [0, 3, 100],
});
`
```
```
`use qdrant\_client::qdrant::{DeletePayloadPointsBuilder, PointsIdsList};
client
.delete\_payload(
DeletePayloadPointsBuilder::new(
"{collection\_name}",
vec!["color".to\_string(), "price".to\_string()],
)
.points\_selector(PointsIdsList {
ids: vec![0.into(), 3.into(), 10.into()],
})
.wait(true),
)
.await?;
`
```
```
`import static io.qdrant.client.PointIdFactory.id;
import java.util.List;
client
.deletePayloadAsync(
"{collection\_name}",
List.of("color", "price"),
List.of(id(0), id(3), id(100)),
true,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
var client = new QdrantClient("localhost", 6334);
await client.DeletePayloadAsync(
collectionName: "{collection\_name}",
keys: ["color", "price"],
ids: new ulong[] { 0, 3, 100 }
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
client.DeletePayload(context.Background(), &qdrant.DeletePayloadPoints{
CollectionName: "{collection\_name}",
Keys: []string{"color", "price"},
PointsSelector: qdrant.NewPointsSelector(
qdrant.NewIDNum(0),
qdrant.NewIDNum(3)),
})
`
```
Alternatively, you can use filters to delete payload keys from the points.
```
`POST /collections/{collection\_name}/points/payload/delete
{
"keys": ["color", "price"],
"filter": {
"must": [
{
"key": "color",
"match": {
"value": "red"
}
}
]
}
}
`
```
```
`client.delete\_payload(
collection\_name="{collection\_name}",
keys=["color", "price"],
points=models.Filter(
must=[
models.FieldCondition(
key="color",
match=models.MatchValue(value="red"),
),
],
),
)
`
```
```
`client.deletePayload("{collection\_name}", {
keys: ["color", "price"],
filter: {
must: [
{
key: "color",
match: {
value: "red",
},
},
],
},
});
`
```
```
`use qdrant\_client::qdrant::{Condition, DeletePayloadPointsBuilder, Filter};
client
.delete\_payload(
DeletePayloadPointsBuilder::new(
"{collection\_name}",
vec!["color".to\_string(), "price".to\_string()],
)
.points\_selector(Filter::must([Condition::matches(
"color",
"red".to\_string(),
)]))
.wait(true),
)
.await?;
`
```
```
`import static io.qdrant.client.ConditionFactory.matchKeyword;
import io.qdrant.client.grpc.Common.Filter;
import java.util.List;
client
.deletePayloadAsync(
"{collection\_name}",
List.of("color", "price"),
Filter.newBuilder().addMust(matchKeyword("color", "red")).build(),
true,
null,
null)
.get();
`
```
```
`using Qdrant.Client;
using static Qdrant.Client.Grpc.Conditions;
var client = new QdrantClient("localhost", 6334);
await client.DeletePayloadAsync(
collectionName: "{collection\_name}",
keys: ["color", "price"],
filter: MatchKeyword("color", "red")
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
client.DeletePayload(context.Background(), &qdrant.DeletePayloadPoints{
CollectionName: "{collection\_name}",
Keys: []string{"color", "price"},
PointsSelector: qdrant.NewPointsSelectorFilter(
&qdrant.Filter{
Must: []\*qdrant.Condition{qdrant.NewMatch("color", "red")},
},
),
})
`
```
## Payload indexing
To search more efficiently with filters, Qdrant allows you to create indexes for payload fields by specifying the name and type of field it is intended to be.
The indexed fields also affect the vector index. See [Indexing](https://qdrant.tech/documentation/manage-data/indexing/) for details.
In practice, we recommend creating an index on those fields that could potentially constrain the results the most.
For example, using an index for the object ID will be much more efficient, being unique for each record, than an index by its color, which has only a few possible values.
In compound queries involving multiple fields, Qdrant will attempt to use the most restrictive index first.
To create index for the field, you can use the following:
REST API ([Schema](https://api.qdrant.tech/api-reference/indexes/create-field-index))
```
`PUT /collections/{collection\_name}/index
{
"field\_name": "name\_of\_the\_field\_to\_index",
"field\_schema": "keyword"
}
`
```
```
`client.create\_payload\_index(
collection\_name="{collection\_name}",
field\_name="name\_of\_the\_field\_to\_index",
field\_schema=models.PayloadSchemaType.KEYWORD,
)
`
```
```
`client.createPayloadIndex("{collection\_name}", {
field\_name: "name\_of\_the\_field\_to\_index",
field\_schema: "keyword",
});
`
```
```
`use qdrant\_client::qdrant::{CreateFieldIndexCollectionBuilder, FieldType};
client
.create\_field\_index(
CreateFieldIndexCollectionBuilder::new(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
FieldType::Keyword,
)
.wait(true),
)
.await?;
`
```
```
`import io.qdrant.client.grpc.Collections.PayloadSchemaType;
client.createPayloadIndexAsync(
"{collection\_name}",
"name\_of\_the\_field\_to\_index",
PayloadSchemaType.Keyword,
null,
true,
null,
null);
`
```
```
`using Qdrant.Client;
var client = new QdrantClient("localhost", 6334);
await client.CreatePayloadIndexAsync(
collectionName: "{collection\_name}",
fieldName: "name\_of\_the\_field\_to\_index"
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
FieldName: "name\_of\_the\_field\_to\_index",
FieldType: qdrant.FieldType\_FieldTypeKeyword.Enum(),
})
`
```
The index usage flag is displayed in the payload schema with the [collection info API](https://api.qdrant.tech/api-reference/collections/get-collection).
Payload schema example:
```
`{
"payload\_schema": {
"property1": {
"data\_type": "keyword"
},
"property2": {
"data\_type": "integer"
}
}
}
`
```
## Facet counts
*Available as of v1.12.0*
Faceting is a special counting technique that can be used for various purposes:
* Know which unique values exist for a payload key.
* Know the number of points that contain each unique value.
* Know how restrictive a filter would become by matching a specific value.
Specifically, it is a counting aggregation for the values in a field, akin to a `GROUP BY` with `COUNT(\*)` commands in SQL.
These results for a specific field is called a &ldquo;facet&rdquo;. For example, when you look at an e-commerce search results page, you might see a list of brands on the sidebar, showing the number of products for each brand. This would be a facet for a `"brand"` field.
In Qdrant you can facet on a field **only** if you have created a field index that supports `MatchValue` conditions for it, like a `keyword` index.
To get the facet counts for a field, you can use the following:
By default, the number of `hits` returned is limited to 10. To change this, use the `limit` parameter. Keep this in mind when checking the number of unique values a payload field contains.
REST API ([Facet](https://api.qdrant.tech/v-1-13-x/api-reference/points/facet))
```
`POST /collections/{collection\_name}/facet
{
"key": "size",
"filter": {
"must": {
"key": "color",
"match": { "value": "red" }
}
}
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.facet(
collection\_name="{collection\_name}",
key="size",
facet\_filter=models.Filter(
must=[
models.FieldCondition(
key="color",
match=models.MatchValue(value="red"),
)
]
),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.facet("{collection\_name}", {
filter: {
must: [
{
key: "color",
match: {
value: "red",
},
},
],
},
key: "size",
});
`
```
```
`use qdrant\_client::qdrant::{Condition, FacetCountsBuilder, Filter};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.facet(
FacetCountsBuilder::new("{collection\_name}", "size")
.limit(10)
.filter(Filter::must(vec![Condition::matches(
"color",
"red".to\_string(),
)])),
)
.await?;
`
```
```
`import static io.qdrant.client.ConditionFactory.matchKeyword;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Common.Filter;
import io.qdrant.client.grpc.Points;
QdrantClient client = new QdrantClient(
QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.facetAsync(
Points.FacetCounts.newBuilder()
.setCollectionName("{collection\_name}")
.setKey("size")
.setFilter(Filter.newBuilder().addMust(matchKeyword("color", "red")).build())
.build())
.get();
`
```
```
`using Qdrant.Client;
using static Qdrant.Client.Grpc.Conditions;
var client = new QdrantClient("localhost", 6334);
await client.FacetAsync(
"{collection\_name}",
key: "size",
filter: MatchKeyword("color", "red")
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
res, err := client.Facet(context.Background(), &qdrant.FacetCounts{
CollectionName: "{collection\_name}",
Key: "size",
Filter: &qdrant.Filter{
Must: []\*qdrant.Condition{
qdrant.NewMatch("color", "red"),
},
},
})
`
```
The response will contain the counts for each unique value in the field:
```
`{
"response": {
"hits": [
{"value": "L", "count": 19},
{"value": "S", "count": 10},
{"value": "M", "count": 5},
{"value": "XL", "count": 1},
{"value": "XXL", "count": 1}
]
},
"time": 0.0001
}
`
```
The results are sorted by the count in descending order, then by the value in ascending order.
Only values with non-zero counts will be returned.
By default, the way Qdrant the counts for each value is approximate to achieve fast results. This should accurate enough for most cases, but if you need to debug your storage, you can use the `exact` parameter to get exact counts.
```
`POST /collections/{collection\_name}/facet
{
"key": "size",
"exact": true
}
`
```
```
`client.facet(
collection\_name="{collection\_name}",
key="size",
exact=True,
)
`
```
```
`client.facet("{collection\_name}", {
key: "size",
exact: true,
});
`
```
```
`use qdrant\_client::qdrant::FacetCountsBuilder;
client
.facet(
FacetCountsBuilder::new("{collection\_name}", "size")
.limit(10)
.exact(true),
)
.await?;
`
```
```
`import io.qdrant.client.grpc.Points.FacetCounts;
client
.facetAsync(
FacetCounts.newBuilder()
.setCollectionName("{collection\_name}")
.setKey("foo")
.setExact(true)
.build())
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
await client.FacetAsync(
"{collection\_name}",
key: "size",
exact: true
);
`
```
```
`res, err := client.Facet(context.Background(), &qdrant.FacetCounts{
CollectionName: "{collection\_name}",
Key: "key",
Exact: qdrant.PtrOf(true),
})
`
```
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/manage-data/payload.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/manage-data/payload/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/manage-data/payload.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)