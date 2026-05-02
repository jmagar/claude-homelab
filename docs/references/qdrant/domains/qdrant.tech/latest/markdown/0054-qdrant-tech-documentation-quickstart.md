Local Quickstart - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* Local Quickstart# How to Get Started with Qdrant Locally
In this short example, you will use the Python Client to create a Collection, load data into it and run a basic search query.
Before you start, please make sure Docker is installed and running on your system.## Download and run
First, download the latest Qdrant image from Dockerhub:
```
`docker pull qdrant/qdrant
`
```
Then, run the service:
```
`docker run -p 6333:6333 -p 6334:6334 \\
-v "$(pwd)/qdrant\_storage:/qdrant/storage:z" \\
qdrant/qdrant
`
```
On Windows, you may need to create a named Docker volume instead of mounting a local folder.
Under the default configuration all data will be stored in the `./qdrant\_storage` directory. This will also be the only directory that both the Container and the host machine can both see.
Qdrant is now accessible:
* REST API: [localhost:6333](http://localhost:6333)
* Web UI: [localhost:6333/dashboard](http://localhost:6333/dashboard)
* GRPC API: [localhost:6334](http://localhost:6334)## Initialize the client
```
`from qdrant\_client import QdrantClient
client = QdrantClient(url="http://localhost:6333")
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
`
```
```
`use qdrant\_client::Qdrant;
// The Rust client uses Qdrant's gRPC interface
let client = Qdrant::from\_url("http://localhost:6334").build()?;
`
```
```
`import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
// The Java client uses Qdrant's gRPC interface
QdrantClient client = new QdrantClient(
QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
`
```
```
`using Qdrant.Client;
// The C# client uses Qdrant's gRPC interface
var client = new QdrantClient("localhost", 6334);
`
```
```
`import "github.com/qdrant/go-client/qdrant"
// The Go client uses Qdrant's gRPC interface
client, err := qdrant.NewClient(&qdrant.Config{
Host: "localhost",
Port: 6334,
})
`
```
By default, Qdrant starts with no encryption or authentication . This means anyone with network access to your machine can access your Qdrant container instance. Please read [Security](https://qdrant.tech/documentation/security/) carefully for details on how to secure your instance.## Create a collection
You will be storing all of your vector data in a Qdrant collection. Let&rsquo;s call it `test\_collection`. This collection will be using a dot product distance metric to compare vectors.
```
`from qdrant\_client.models import Distance, VectorParams
client.create\_collection(
collection\_name="test\_collection",
vectors\_config=VectorParams(size=4, distance=Distance.DOT),
)
`
```
```
`await client.createCollection("test\_collection", {
vectors: { size: 4, distance: "Dot" },
});
`
```
```
`use qdrant\_client::qdrant::{CreateCollectionBuilder, VectorParamsBuilder};
client
.create\_collection(
CreateCollectionBuilder::new("test\_collection")
.vectors\_config(VectorParamsBuilder::new(4, Distance::Dot)),
)
.await?;
`
```
```
`import io.qdrant.client.grpc.Collections.Distance;
import io.qdrant.client.grpc.Collections.VectorParams;
client.createCollectionAsync("test\_collection",
VectorParams.newBuilder().setDistance(Distance.Dot).setSize(4).build()).get();
`
```
```
`using Qdrant.Client.Grpc;
await client.CreateCollectionAsync(collectionName: "test\_collection", vectorsConfig: new VectorParams
{
Size = 4, Distance = Distance.Dot
});
`
```
```
`import (
"context"
"github.com/qdrant/go-client/qdrant"
)
client.CreateCollection(context.Background(), &qdrant.CreateCollection{
CollectionName: "{collection\_name}",
VectorsConfig: qdrant.NewVectorsConfig(&qdrant.VectorParams{
Size: 4,
Distance: qdrant.Distance\_Cosine,
}),
})
`
```
## Add vectors
Let&rsquo;s now add a few vectors with a payload. Payloads are other data you want to associate with the vector:
```
`from qdrant\_client.models import PointStruct
operation\_info = client.upsert(
collection\_name="test\_collection",
wait=True,
points=[
PointStruct(id=1, vector=[0.05, 0.61, 0.76, 0.74], payload={"city": "Berlin"}),
PointStruct(id=2, vector=[0.19, 0.81, 0.75, 0.11], payload={"city": "London"}),
PointStruct(id=3, vector=[0.36, 0.55, 0.47, 0.94], payload={"city": "Moscow"}),
PointStruct(id=4, vector=[0.18, 0.01, 0.85, 0.80], payload={"city": "New York"}),
PointStruct(id=5, vector=[0.24, 0.18, 0.22, 0.44], payload={"city": "Beijing"}),
PointStruct(id=6, vector=[0.35, 0.08, 0.11, 0.44], payload={"city": "Mumbai"}),
],
)
print(operation\_info)
`
```
```
`const operationInfo = await client.upsert("test\_collection", {
wait: true,
points: [
{ id: 1, vector: [0.05, 0.61, 0.76, 0.74], payload: { city: "Berlin" } },
{ id: 2, vector: [0.19, 0.81, 0.75, 0.11], payload: { city: "London" } },
{ id: 3, vector: [0.36, 0.55, 0.47, 0.94], payload: { city: "Moscow" } },
{ id: 4, vector: [0.18, 0.01, 0.85, 0.80], payload: { city: "New York" } },
{ id: 5, vector: [0.24, 0.18, 0.22, 0.44], payload: { city: "Beijing" } },
{ id: 6, vector: [0.35, 0.08, 0.11, 0.44], payload: { city: "Mumbai" } },
],
});
console.debug(operationInfo);
`
```
```
`use qdrant\_client::qdrant::{PointStruct, UpsertPointsBuilder};
let points = vec![
PointStruct::new(1, vec![0.05, 0.61, 0.76, 0.74], [("city", "Berlin".into())]),
PointStruct::new(2, vec![0.19, 0.81, 0.75, 0.11], [("city", "London".into())]),
PointStruct::new(3, vec![0.36, 0.55, 0.47, 0.94], [("city", "Moscow".into())]),
// ..truncated
];
let response = client
.upsert\_points(UpsertPointsBuilder::new("test\_collection", points).wait(true))
.await?;
dbg!(response);
`
```
```
`import java.util.List;
import java.util.Map;
import static io.qdrant.client.PointIdFactory.id;
import static io.qdrant.client.ValueFactory.value;
import static io.qdrant.client.VectorsFactory.vectors;
import io.qdrant.client.grpc.Points.PointStruct;
import io.qdrant.client.grpc.Points.UpdateResult;
UpdateResult operationInfo =
client
.upsertAsync(
"test\_collection",
List.of(
PointStruct.newBuilder()
.setId(id(1))
.setVectors(vectors(0.05f, 0.61f, 0.76f, 0.74f))
.putAllPayload(Map.of("city", value("Berlin")))
.build(),
PointStruct.newBuilder()
.setId(id(2))
.setVectors(vectors(0.19f, 0.81f, 0.75f, 0.11f))
.putAllPayload(Map.of("city", value("London")))
.build(),
PointStruct.newBuilder()
.setId(id(3))
.setVectors(vectors(0.36f, 0.55f, 0.47f, 0.94f))
.putAllPayload(Map.of("city", value("Moscow")))
.build()))
// Truncated
.get();
System.out.println(operationInfo);
`
```
```
`using Qdrant.Client.Grpc;
var operationInfo = await client.UpsertAsync(collectionName: "test\_collection", points: new List\<PointStruct\>
{
new()
{
Id = 1,
Vectors = new float[]
{
0.05f, 0.61f, 0.76f, 0.74f
},
Payload = {
["city"] = "Berlin"
}
},
new()
{
Id = 2,
Vectors = new float[]
{
0.19f, 0.81f, 0.75f, 0.11f
},
Payload = {
["city"] = "London"
}
},
new()
{
Id = 3,
Vectors = new float[]
{
0.36f, 0.55f, 0.47f, 0.94f
},
Payload = {
["city"] = "Moscow"
}
},
// Truncated
});
Console.WriteLine(operationInfo);
`
```
```
`import (
"context"
"fmt"
"github.com/qdrant/go-client/qdrant"
)
operationInfo, err := client.Upsert(context.Background(), &qdrant.UpsertPoints{
CollectionName: "test\_collection",
Points: []\*qdrant.PointStruct{
{
Id: qdrant.NewIDNum(1),
Vectors: qdrant.NewVectors(0.05, 0.61, 0.76, 0.74),
Payload: qdrant.NewValueMap(map[string]any{"city": "Berlin"}),
},
{
Id: qdrant.NewIDNum(2),
Vectors: qdrant.NewVectors(0.19, 0.81, 0.75, 0.11),
Payload: qdrant.NewValueMap(map[string]any{"city": "London"}),
},
{
Id: qdrant.NewIDNum(3),
Vectors: qdrant.NewVectors(0.36, 0.55, 0.47, 0.94),
Payload: qdrant.NewValueMap(map[string]any{"city": "Moscow"}),
},
// Truncated
},
})
if err != nil {
panic(err)
}
fmt.Println(operationInfo)
`
```
**Response:**
```
`operation\_id=0 status=\<UpdateStatus.COMPLETED: 'completed'\>
`
```
```
`{ operation\_id: 0, status: 'completed' }
`
```
```
`PointsOperationResponse {
result: Some(
UpdateResult {
operation\_id: Some(
0,
),
status: Completed,
},
),
time: 0.00094027,
}
`
```
```
`operation\_id: 0
status: Completed
`
```
```
`{ "operationId": "0", "status": "Completed" }
`
```
```
`operation\_id:0 status:Acknowledged
`
```
## Run a query
Let&rsquo;s ask a basic question - Which of our stored vectors are most similar to the query vector `[0.2, 0.1, 0.9, 0.7]`?
```
`search\_result = client.query\_points(
collection\_name="test\_collection",
query=[0.2, 0.1, 0.9, 0.7],
with\_payload=False,
limit=3
).points
print(search\_result)
`
```
```
`let searchResult = await client.query(
"test\_collection", {
query: [0.2, 0.1, 0.9, 0.7],
limit: 3
});
console.debug(searchResult.points);
`
```
```
`use qdrant\_client::qdrant::QueryPointsBuilder;
let search\_result = client
.query(
QueryPointsBuilder::new("test\_collection")
.query(vec![0.2, 0.1, 0.9, 0.7])
)
.await?;
dbg!(search\_result);
`
```
```
`import java.util.List;
import io.qdrant.client.grpc.Points.ScoredPoint;
import io.qdrant.client.grpc.Points.QueryPoints;
import static io.qdrant.client.QueryFactory.nearest;
List\<ScoredPoint\> searchResult =
client.queryAsync(QueryPoints.newBuilder()
.setCollectionName("test\_collection")
.setLimit(3)
.setQuery(nearest(0.2f, 0.1f, 0.9f, 0.7f))
.build()).get();
System.out.println(searchResult);
`
```
```
`var searchResult = await client.QueryAsync(
collectionName: "test\_collection",
query: new float[] { 0.2f, 0.1f, 0.9f, 0.7f },
limit: 3,
);
Console.WriteLine(searchResult);
`
```
```
`import (
"context"
"fmt"
"github.com/qdrant/go-client/qdrant"
)
searchResult, err := client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "test\_collection",
Query: qdrant.NewQuery(0.2, 0.1, 0.9, 0.7),
})
if err != nil {
panic(err)
}
fmt.Println(searchResult)
`
```
**Response:**
```
`[
{
"id": 4,
"version": 0,
"score": 1.362,
"payload": null,
"vector": null
},
{
"id": 1,
"version": 0,
"score": 1.273,
"payload": null,
"vector": null
},
{
"id": 3,
"version": 0,
"score": 1.208,
"payload": null,
"vector": null
}
]
`
```
The results are returned in decreasing similarity order. Note that payload and vector data is missing in these results by default.
See [payload and vector in the result](https://qdrant.tech/documentation/search/search/#payload-and-vector-in-the-result) on how to enable it.
## Add a filter
We can narrow down the results further by filtering by payload. Let&rsquo;s find the closest results that include &ldquo;London&rdquo;.
```
`from qdrant\_client.models import Filter, FieldCondition, MatchValue
search\_result = client.query\_points(
collection\_name="test\_collection",
query=[0.2, 0.1, 0.9, 0.7],
query\_filter=Filter(
must=[FieldCondition(key="city", match=MatchValue(value="London"))]
),
with\_payload=True,
limit=3,
).points
print(search\_result)
`
```
```
`searchResult = await client.query("test\_collection", {
query: [0.2, 0.1, 0.9, 0.7],
filter: {
must: [{ key: "city", match: { value: "London" } }],
},
with\_payload: true,
limit: 3,
});
console.debug(searchResult);
`
```
```
`use qdrant\_client::qdrant::{Condition, Filter, QueryPointsBuilder};
let search\_result = client
.query(
QueryPointsBuilder::new("test\_collection")
.query(vec![0.2, 0.1, 0.9, 0.7])
.filter(Filter::must([Condition::matches(
"city",
"London".to\_string(),
)]))
.with\_payload(true),
)
.await?;
dbg!(search\_result);
`
```
```
`import static io.qdrant.client.ConditionFactory.matchKeyword;
List\<ScoredPoint\> searchResult =
client.queryAsync(QueryPoints.newBuilder()
.setCollectionName("test\_collection")
.setLimit(3)
.setFilter(Filter.newBuilder().addMust(matchKeyword("city", "London")))
.setQuery(nearest(0.2f, 0.1f, 0.9f, 0.7f))
.setWithPayload(enable(true))
.build()).get();
System.out.println(searchResult);
`
```
```
`using static Qdrant.Client.Grpc.Conditions;
var searchResult = await client.QueryAsync(
collectionName: "test\_collection",
query: new float[] { 0.2f, 0.1f, 0.9f, 0.7f },
filter: MatchKeyword("city", "London"),
limit: 3,
payloadSelector: true
);
Console.WriteLine(searchResult);
`
```
```
`import (
"context"
"fmt"
"github.com/qdrant/go-client/qdrant"
)
searchResult, err := client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "test\_collection",
Query: qdrant.NewQuery(0.2, 0.1, 0.9, 0.7),
Filter: &qdrant.Filter{
Must: []\*qdrant.Condition{
qdrant.NewMatch("city", "London"),
},
},
WithPayload: qdrant.NewWithPayload(true),
})
if err != nil {
panic(err)
}
fmt.Println(searchResult)
`
```
**Response:**
```
`[
{
"id": 2,
"version": 0,
"score": 0.871,
"payload": {
"city": "London"
},
"vector": null
}
]
`
```
To make filtered search fast on real datasets, we highly recommend to create [payload indexes](https://qdrant.tech/documentation/manage-data/indexing/#payload-index)!
You have just conducted vector search. You loaded vectors into a database and queried the database with a vector of your own. Qdrant found the closest results and presented you with a similarity score.
## Next steps
Now you know how Qdrant works. Getting started with [Qdrant Cloud](https://qdrant.tech/documentation/cloud-quickstart/) is just as easy. [Create an account](https://qdrant.to/cloud) and use our SaaS completely free. We will take care of infrastructure maintenance and software updates.
To move onto some more complex examples of vector search, read our [Tutorials](https://qdrant.tech/documentation/tutorials-lp-overview/) and create your own app with the help of our [Examples](https://qdrant.tech/documentation/examples/).
**Note:** There is another way of running Qdrant locally. If you are a Python developer, we recommend that you try Local Mode in [Qdrant Client](https://github.com/qdrant/qdrant-client), as it only takes a few moments to get setup.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/quickstart.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/quickstart/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/quickstart.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)