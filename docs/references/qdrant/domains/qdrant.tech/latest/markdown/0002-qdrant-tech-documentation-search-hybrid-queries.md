Hybrid Queries - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Search](https://qdrant.tech/documentation/search/)
*
* Hybrid Queries# Hybrid and Multi-Stage Queries
*Available as of v1.10.0*
With the introduction of [multiple named vectors per point](https://qdrant.tech/documentation/manage-data/vectors/#named-vectors), there are use-cases when the best search is obtained by combining multiple queries,
or by performing the search in more than one stage.
Qdrant has a flexible and universal interface to make this possible, called `Query API` ([API reference](https://api.qdrant.tech/api-reference/search/query-points)).
The main component for making the combinations of queries possible is the `prefetch` parameter, which enables making sub-requests.
Specifically, whenever a query has at least one prefetch, Qdrant will:
1. Perform the prefetch query (or queries),
2. Apply the main query over the results of its prefetch(es).
Additionally, prefetches can have prefetches themselves, so you can have nested prefetches.
Using `offset` parameter only affects the main query. This means that the prefetches must have a `limit` of at least `limit + offset` of the main query, otherwise you can get an empty result.## Hybrid Search
One of the most common problems when you have different representations of the same data is to combine the queried points for each representation into a single result.
Fusing results from multiple queries
For example, in text search, it is often useful to combine dense and sparse vectors to get the best of both worlds: semantic understanding from dense vectors and precise word matching from sparse vectors.
Qdrant has a few ways of fusing the results from different queries: `rrf` and `dbsf`
### Reciprocal Rank Fusion (RRF)
[RRF](https://plg.uwaterloo.ca/~gvcormac/cormacksigir09-rrf.pdf) considers the positions of results within each query and boosts those that appear closer to the top in multiple sets of results. The score of a document is calculated using its rank in each result set:
$$ score(d\\in D) = \\sum\_{r\_d\\in R(d)} \\frac{1}{k + \\frac{r\_d + 1}{w\_r} - 1} $$
Where:
* $D$ the set of points across all results
* $R(d)$ is the set of rankings for a particular document
* $k$ is a constant (set to 2 by default)
* $r$ is an ordered set of results from one source
* $r\_d$ is the rank of document $d$ in ranking $r$
* $w\_r$ is the weight of ranking $r$ (set to 1 by default)
Because $w\_r$ defaults to 1, without setting explicit weights, the formula can be simplified to the original RRF function:
$$ score(d\\in D) = \\sum\_{r\_d\\in R(d)} \\frac{1}{k + r\_d} $$
Here is an example of RRF for a query containing two prefetches against different named vectors configured to hold sparse and dense vectors, respectively.
```
`POST /collections/{collection\_name}/points/query
{
"prefetch": [
{
"query": {
"indices": [1, 42], // \<┐
"values": [0.22, 0.8] // \<┴─sparse vector
},
"using": "sparse",
"limit": 20
},
{
"query": [0.01, 0.45, 0.67, ...], // \<-- dense vector
"using": "dense",
"limit": 20
}
],
"query": { "fusion": "rrf" }, // \<--- reciprocal rank fusion
"limit": 10
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.query\_points(
collection\_name="{collection\_name}",
prefetch=[
models.Prefetch(
query=models.SparseVector(indices=[1, 42], values=[0.22, 0.8]),
using="sparse",
limit=20,
),
models.Prefetch(
query=[0.01, 0.45, 0.67], # \<-- dense vector
using="dense",
limit=20,
),
],
query=models.FusionQuery(fusion=models.Fusion.RRF),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.query("{collection\_name}", {
prefetch: [
{
query: {
values: [0.22, 0.8],
indices: [1, 42],
},
using: 'sparse',
limit: 20,
},
{
query: [0.01, 0.45, 0.67],
using: 'dense',
limit: 20,
},
],
query: {
fusion: 'rrf',
},
});
`
```
```
`use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{Fusion, PrefetchQueryBuilder, Query, QueryPointsBuilder};
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client.query(
QueryPointsBuilder::new("{collection\_name}")
.add\_prefetch(PrefetchQueryBuilder::default()
.query(Query::new\_nearest([(1, 0.22), (42, 0.8)].as\_slice()))
.using("sparse")
.limit(20u64)
)
.add\_prefetch(PrefetchQueryBuilder::default()
.query(Query::new\_nearest(vec![0.01, 0.45, 0.67]))
.using("dense")
.limit(20u64)
)
.query(Query::new\_fusion(Fusion::Rrf))
).await?;
`
```
```
`import static io.qdrant.client.QueryFactory.fusion;
import static io.qdrant.client.QueryFactory.nearest;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.Fusion;
import io.qdrant.client.grpc.Points.PrefetchQuery;
import io.qdrant.client.grpc.Points.QueryPoints;
import java.util.List;
QdrantClient client = new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("{collection\_name}")
.addPrefetch(PrefetchQuery.newBuilder()
.setQuery(nearest(List.of(0.22f, 0.8f), List.of(1, 42)))
.setUsing("sparse")
.setLimit(20)
.build())
.addPrefetch(PrefetchQuery.newBuilder()
.setQuery(nearest(List.of(0.01f, 0.45f, 0.67f)))
.setUsing("dense")
.setLimit(20)
.build())
.setQuery(fusion(Fusion.RRF))
.build())
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.QueryAsync(
collectionName: "{collection\_name}",
prefetch: new List \< PrefetchQuery \> {
new() {
Query = new(float, uint)[] {
(0.22f, 1), (0.8f, 42),
},
Using = "sparse",
Limit = 20
},
new() {
Query = new float[] {
0.01f, 0.45f, 0.67f
},
Using = "dense",
Limit = 20
}
},
query: Fusion.Rrf
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
Prefetch: []\*qdrant.PrefetchQuery{
{
Query: qdrant.NewQuerySparse([]uint32{1, 42}, []float32{0.22, 0.8}),
Using: qdrant.PtrOf("sparse"),
},
{
Query: qdrant.NewQueryDense([]float32{0.01, 0.45, 0.67}),
Using: qdrant.PtrOf("dense"),
},
},
Query: qdrant.NewQueryFusion(qdrant.Fusion\_RRF),
})
`
```
#### Setting RRF Constant k
*Available as of v1.16.0*
To change the value of constant $k$ in the formula, use the dedicated `rrf` query.
```
`POST /collections/{collection\_name}/points/query
{
"prefetch": [
// 2+ prefetches here
],
"query": { "rrf": {"k": 60 } }, // \<--- parameterized reciprocal rank fusion
"limit": 10
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.query\_points(
collection\_name="{collection\_name}",
prefetch=[
# 2+ prefetches here
],
query=models.RrfQuery(rrf=models.Rrf(k=60)),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.query("{collection\_name}", {
prefetch: [
// 2+ prefetches here
],
query: { rrf: { k: 60 } },
});
`
```
```
`use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{RrfBuilder, Query, QueryPointsBuilder};
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client.query(
QueryPointsBuilder::new("{collection\_name}")
// .add\_prefetch(...) \<┐
// .add\_prefetch(...) \<┴─ 2+ prefetches here
.query(Query::new\_rrf(RrfBuilder::with\_k(60)))
).await?;
`
```
```
`import static io.qdrant.client.QueryFactory.rrf;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.PrefetchQuery;
import io.qdrant.client.grpc.Points.QueryPoints;
import io.qdrant.client.grpc.Points.Rrf;
import java.util.List;
QdrantClient client = new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("{collection\_name}")
// .addPrefetch(...) \<┐
// .addPrefetch(...) \<┴─ 2+ prefetches here
.setQuery(rrf(Rrf.newBuilder().setK(60).build()))
.build())
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.QueryAsync(
collectionName: "{collection\_name}",
prefetch: new List\<PrefetchQuery\>
{
// 2+ prefetches here
},
query: new Rrf
{
K = 60,
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
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "{collection\_name}",
Prefetch: []\*qdrant.PrefetchQuery{
// 2+ prefetches here
},
Query: qdrant.NewQueryRRF(
&qdrant.Rrf{
K: qdrant.PtrOf(uint32(60)),
}),
})
`
```
#### Weighted RRF
*Available as of v1.17.0*
By default, each query is assigned an equal weight. In reality, some queries are stronger, more discriminative, or more domain-specific than others. For example, a semantic search model understands meaning better than a simple keyword matcher. Assigning equal weight to both can cause the weaker model to negatively influence results, leading to a suboptimal search experience. To address this, you can assign greater weight to rankers that perform well.
The `rrf` query allows you to configure relative weights for each of the prefetches. For example, if you have two prefetches and assign a weight of 3.0 to the first and 1.0 to the second, a document ranked third in the first query scores the same as a document ranked first in the second query. In the case of non-overlapping result sets, these weights return three results from the first set for every one result from the second set.
Weights should be provided as an array of numbers, where each weight is applied to the corresponding prefetch in the order they are defined. The number of weights must match the number of prefetches.
```
`POST /collections/{collection\_name}/points/query
{
"prefetch": [
// Prefetches here
],
"query": {
"rrf": {
"weights": [3.0, 1.0]
}
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
prefetch=[
# 2+ prefetches here
],
query=models.RrfQuery(rrf=models.Rrf(weights=[3.0, 1.0])),
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.query("{collection\_name}", {
prefetch: [
// Prefetches here
],
query: {
rrf: {
weights: [3.0, 1.0],
},
},
limit: 10,
});
`
```
```
`use qdrant\_client::qdrant::{Query, QueryPointsBuilder, RrfBuilder};
use qdrant\_client::Qdrant;
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client
.query(
QueryPointsBuilder::new("{collection\_name}")
// .add\_prefetch(...) \<┐
// .add\_prefetch(...) \<┴─ 2+ prefetches here
.query(Query::new\_rrf(RrfBuilder::new().weights(vec![3.0, 1.0]))),
)
.await?;
`
```
```
`import static io.qdrant.client.QueryFactory.rrf;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.PrefetchQuery;
import io.qdrant.client.grpc.Points.QueryPoints;
import io.qdrant.client.grpc.Points.Rrf;
import java.util.List;
QdrantClient client = new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("{collection\_name}")
// .addPrefetch(...) \<┐
// .addPrefetch(...) \<┴─ Prefetches here
.setQuery(rrf(Rrf.newBuilder().addAllWeights(List.of(3.0f, 1.0f)).build()))
.build())
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.QueryAsync(
collectionName: "{collection\_name}",
prefetch: new List\<PrefetchQuery\>
{
// 2+ prefetches here
},
query: new Rrf
{
Weights = {3.0f, 1.0f},
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
client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "{collection\_name}",
Prefetch: []\*qdrant.PrefetchQuery{
// Prefetches here
},
Query: qdrant.NewQueryRRF(
&qdrant.Rrf{
Weights: []float32{3.0, 1.0},
}),
})
`
```
### Distribution-Based Score Fusion (DBSF)
*Available as of v1.11.0*
[DBSF](https://medium.com/plain-simple-software/distribution-based-score-fusion-dbsf-a-new-approach-to-vector-search-ranking-f87c37488b18)
normalizes the scores of the points in each query, using the mean +/- the 3rd standard deviation as limits, and then sums the scores of the same point across different queries.`dbsf` is stateless and calculates the normalization limits only based on the results of each query, not on all the scores that it has seen.## Multi-stage queries
In general, larger vector representations give more accurate search results, but makes them more expensive to compute.
Splitting the search into two stages is a known technique to mitigate this effect:
* First, use a smaller and cheaper representation to get a large list of candidates.
* Then, re-score the candidates using the larger and more accurate representation.
There are a few ways to build search architectures around this idea:
* The quantized vectors as a first stage, and the full-precision vectors as a second stage.
* Leverage Matryoshka Representation Learning ([MRL](https://arxiv.org/abs/2205.13147)) to generate candidate vectors with a shorter vector, and then refine them with a longer one.
* Use regular dense vectors to pre-fetch the candidates, and then re-score them with a multi-vector model like [ColBERT](https://arxiv.org/abs/2112.01488).
To get the best of all worlds, Qdrant has a convenient interface to perform the queries in stages,
such that the coarse results are fetched first, and then they are refined later with larger vectors.
Disable the HNSW index for vectors used only for rescoring by setting `m=0` in the vector's HNSW configuration. Rescoring does not use the HNSW index, so disabling it will free up memory.### Re-scoring examples
Fetch 1000 results using a shorter MRL byte vector, then re-score them using the full vector and get the top 10.
```
`POST /collections/{collection\_name}/points/query
{
"prefetch": {
"query": [1, 23, 45, 67], // \<------------- small byte vector
"using": "mrl\_byte",
"limit": 1000
},
"query": [0.01, 0.299, 0.45, 0.67, ...], // \<-- full vector
"using": "full",
"limit": 10
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.query\_points(
collection\_name="{collection\_name}",
prefetch=models.Prefetch(
query=[1, 23, 45, 67], # \<------------- small byte vector
using="mrl\_byte",
limit=1000,
),
query=[0.01, 0.299, 0.45, 0.67], # \<-- full vector
using="full",
limit=10,
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.query("{collection\_name}", {
prefetch: {
query: [1, 23, 45, 67], // \<------------- small byte vector
using: 'mrl\_byte',
limit: 1000,
},
query: [0.01, 0.299, 0.45, 0.67], // \<-- full vector,
using: 'full',
limit: 10,
});
`
```
```
`use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{PrefetchQueryBuilder, Query, QueryPointsBuilder};
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client.query(
QueryPointsBuilder::new("{collection\_name}")
.add\_prefetch(PrefetchQueryBuilder::default()
.query(Query::new\_nearest(vec![1.0, 23.0, 45.0, 67.0]))
.using("mlr\_byte")
.limit(1000u64)
)
.query(Query::new\_nearest(vec![0.01, 0.299, 0.45, 0.67]))
.using("full")
.limit(10u64)
).await?;
`
```
```
`import static io.qdrant.client.QueryFactory.nearest;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.PrefetchQuery;
import io.qdrant.client.grpc.Points.QueryPoints;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("{collection\_name}")
.addPrefetch(
PrefetchQuery.newBuilder()
.setQuery(nearest(1, 23, 45, 67)) // \<------------- small byte vector
.setLimit(1000)
.setUsing("mrl\_byte")
.build())
.setQuery(nearest(0.01f, 0.299f, 0.45f, 0.67f)) // \<-- full vector
.setUsing("full")
.setLimit(10)
.build())
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.QueryAsync(
collectionName: "{collection\_name}",
prefetch: new List\<PrefetchQuery\> {
new() {
Query = new float[] { 1,23, 45, 67 }, // \<------------- small byte vector
Using = "mrl\_byte",
Limit = 1000
}
},
query: new float[] { 0.01f, 0.299f, 0.45f, 0.67f }, // \<-- full vector
usingVector: "full",
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
Prefetch: []\*qdrant.PrefetchQuery{
{
Query: qdrant.NewQueryDense([]float32{1, 23, 45, 67}),
Using: qdrant.PtrOf("mrl\_byte"),
Limit: qdrant.PtrOf(uint64(1000)),
},
},
Query: qdrant.NewQueryDense([]float32{0.01, 0.299, 0.45, 0.67}),
Using: qdrant.PtrOf("full"),
})
`
```
Fetch 100 results using the default vector, then re-score them using a multi-vector to get the top 10.
```
`POST /collections/{collection\_name}/points/query
{
"prefetch": {
"query": [0.01, 0.45, 0.67, ...], // \<-- dense vector
"limit": 100
},
"query": [ // \<─┐
[0.1, 0.2, ...], // \< │
[0.2, 0.1, ...], // \< ├─ multi-vector
[0.8, 0.9, ...] // \< │
], // \<─┘
"using": "colbert",
"limit": 10
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.query\_points(
collection\_name="{collection\_name}",
prefetch=models.Prefetch(
query=[0.01, 0.45, 0.67, 0.53], # \<-- dense vector
limit=100,
),
query=[
[0.1, 0.2, 0.32], # \<─┐
[0.2, 0.1, 0.52], # \< ├─ multi-vector
[0.8, 0.9, 0.93], # \< ┘
],
using="colbert",
limit=10,
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.query("{collection\_name}", {
prefetch: {
query: [1, 23, 45, 67], // \<------------- small byte vector
limit: 100,
},
query: [
[0.1, 0.2], // \<─┐
[0.2, 0.1], // \< ├─ multi-vector
[0.8, 0.9], // \< ┘
],
using: 'colbert',
limit: 10,
});
`
```
```
`use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{PrefetchQueryBuilder, Query, QueryPointsBuilder};
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client.query(
QueryPointsBuilder::new("{collection\_name}")
.add\_prefetch(PrefetchQueryBuilder::default()
.query(Query::new\_nearest(vec![0.01, 0.45, 0.67]))
.limit(100u64)
)
.query(Query::new\_nearest(vec![
vec![0.1, 0.2],
vec![0.2, 0.1],
vec![0.8, 0.9],
]))
.using("colbert")
.limit(10u64)
).await?;
`
```
```
`import static io.qdrant.client.QueryFactory.nearest;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.PrefetchQuery;
import io.qdrant.client.grpc.Points.QueryPoints;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("{collection\_name}")
.addPrefetch(
PrefetchQuery.newBuilder()
.setQuery(nearest(0.01f, 0.45f, 0.67f)) // \<-- dense vector
.setLimit(100)
.build())
.setQuery(
nearest(
new float[][] {
{0.1f, 0.2f}, // \<─┐
{0.2f, 0.1f}, // \< ├─ multi-vector
{0.8f, 0.9f} // \< ┘
}))
.setUsing("colbert")
.setLimit(10)
.build())
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.QueryAsync(
collectionName: "{collection\_name}",
prefetch: new List \<PrefetchQuery\> {
new() {
Query = new float[] { 0.01f, 0.45f, 0.67f }, // \<-- dense vector\*\*\*\*
Limit = 100
}
},
query: new float[][] {
[0.1f, 0.2f], // \<─┐
[0.2f, 0.1f], // \< ├─ multi-vector
[0.8f, 0.9f] // \< ┘
},
usingVector: "colbert",
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
Prefetch: []\*qdrant.PrefetchQuery{
{
Query: qdrant.NewQueryDense([]float32{0.01, 0.45, 0.67}),
Limit: qdrant.PtrOf(uint64(100)),
},
},
Query: qdrant.NewQueryMulti([][]float32{
{0.1, 0.2},
{0.2, 0.1},
{0.8, 0.9},
}),
Using: qdrant.PtrOf("colbert"),
})
`
```
It is possible to combine all the above techniques in a single query:
```
`POST /collections/{collection\_name}/points/query
{
"prefetch": {
"prefetch": {
"query": [1, 23, 45, 67], // \<------ small byte vector
"using": "mrl\_byte",
"limit": 1000
},
"query": [0.01, 0.45, 0.67, ...], // \<-- full dense vector
"using": "full",
"limit": 100
},
"query": [ // \<─┐
[0.1, 0.2, ...], // \< │
[0.2, 0.1, ...], // \< ├─ multi-vector
[0.8, 0.9, ...] // \< │
], // \<─┘
"using": "colbert",
"limit": 10
}
`
```
```
`from qdrant\_client import QdrantClient, models
client = QdrantClient(url="http://localhost:6333")
client.query\_points(
collection\_name="{collection\_name}",
prefetch=models.Prefetch(
prefetch=models.Prefetch(
query=[1, 23, 45, 67], # \<------ small byte vector
using="mrl\_byte",
limit=1000,
),
query=[0.01, 0.45, 0.67], # \<-- full dense vector
using="full",
limit=100,
),
query=[
[0.17, 0.23, 0.52], # \<─┐
[0.22, 0.11, 0.63], # \< ├─ multi-vector
[0.86, 0.93, 0.12], # \< ┘
],
using="colbert",
limit=10,
)
`
```
```
`import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({ host: "localhost", port: 6333 });
client.query("{collection\_name}", {
prefetch: {
prefetch: {
query: [1, 23, 45, 67], // \<------------- small byte vector
using: 'mrl\_byte',
limit: 1000,
},
query: [0.01, 0.45, 0.67], // \<-- full dense vector
using: 'full',
limit: 100,
},
query: [
[0.1, 0.2], // \<─┐
[0.2, 0.1], // \< ├─ multi-vector
[0.8, 0.9], // \< ┘
],
using: 'colbert',
limit: 10,
});
`
```
```
`use qdrant\_client::Qdrant;
use qdrant\_client::qdrant::{PrefetchQueryBuilder, Query, QueryPointsBuilder};
let client = Qdrant::from\_url("http://localhost:6334").build()?;
client.query(
QueryPointsBuilder::new("{collection\_name}")
.add\_prefetch(PrefetchQueryBuilder::default()
.add\_prefetch(PrefetchQueryBuilder::default()
.query(Query::new\_nearest(vec![1.0, 23.0, 45.0, 67.0]))
.using("mlr\_byte")
.limit(1000u64)
)
.query(Query::new\_nearest(vec![0.01, 0.45, 0.67]))
.using("full")
.limit(100u64)
)
.query(Query::new\_nearest(vec![
vec![0.1, 0.2],
vec![0.2, 0.1],
vec![0.8, 0.9],
]))
.using("colbert")
.limit(10u64)
).await?;
`
```
```
`import static io.qdrant.client.QueryFactory.nearest;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.PrefetchQuery;
import io.qdrant.client.grpc.Points.QueryPoints;
QdrantClient client =
new QdrantClient(QdrantGrpcClient.newBuilder("localhost", 6334, false).build());
client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("{collection\_name}")
.addPrefetch(
PrefetchQuery.newBuilder()
.addPrefetch(
PrefetchQuery.newBuilder()
.setQuery(nearest(1, 23, 45, 67)) // \<------------- small byte vector
.setUsing("mrl\_byte")
.setLimit(1000)
.build())
.setQuery(nearest(0.01f, 0.45f, 0.67f)) // \<-- dense vector
.setUsing("full")
.setLimit(100)
.build())
.setQuery(
nearest(
new float[][] {
{0.1f, 0.2f}, // \<─┐
{0.2f, 0.1f}, // \< ├─ multi-vector
{0.8f, 0.9f} // \< ┘
}))
.setUsing("colbert")
.setLimit(10)
.build())
.get();
`
```
```
`using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient("localhost", 6334);
await client.QueryAsync(
collectionName: "{collection\_name}",
prefetch: new List \<PrefetchQuery\> {
new() {
Prefetch = {
new List \<PrefetchQuery\> {
new() {
Query = new float[] { 1, 23, 45, 67 }, // \<------------- small byte vector
Using = "mrl\_byte",
Limit = 1000
},
}
},
Query = new float[] {0.01f, 0.45f, 0.67f}, // \<-- dense vector
Using = "full",
Limit = 100
}
},
query: new float[][] {
[0.1f, 0.2f], // \<─┐
[0.2f, 0.1f], // \< ├─ multi-vector
[0.8f, 0.9f] // \< ┘
},
usingVector: "colbert",
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
Prefetch: []\*qdrant.PrefetchQuery{
{
Prefetch: []\*qdrant.PrefetchQuery{
{
Query: qdrant.NewQueryDense([]float32{1, 23, 45, 67}),
Using: qdrant.PtrOf("mrl\_byte"),
Limit: qdrant.PtrOf(uint64(1000)),
},
},
Query: qdrant.NewQueryDense([]float32{0.01, 0.45, 0.67}),
Limit: qdrant.PtrOf(uint64(100)),
Using: qdrant.PtrOf("full"),
},
},
Query: qdrant.NewQueryMulti([][]float32{
{0.1, 0.2},
{0.2, 0.1},
{0.8, 0.9},
}),
Using: qdrant.PtrOf("colbert"),
})
`
```
## Grouping
*Available as of v1.11.0*
It is possible to group results by a certain field. This is useful when you have multiple points for the same item, and you want to avoid redundancy of the same item in the results.
REST API ([Schema](https://api.qdrant.tech/master/api-reference/search/query-points-groups)):
```
`POST /collections/{collection\_name}/points/query/groups
{
// Same as in the regular query API
"query": [1.1],
// Grouping parameters
"group\_by": "document\_id", // Path of the field to group by
"limit": 4, // Max amount of groups
"group\_size": 2 // Max amount of points per group
}
`
```
```
`client.query\_points\_groups(
collection\_name="{collection\_name}",
# Same as in the regular query\_points() API
query=[1.1],
# Grouping parameters
group\_by="document\_id", # Path of the field to group by
limit=4, # Max amount of groups
group\_size=2, # Max amount of points per group
)
`
```
```
`client.queryGroups("{collection\_name}", {
query: [1.1],
group\_by: "document\_id",
limit: 4,
group\_size: 2,
});
`
```
```
`use qdrant\_client::qdrant::QueryPointGroupsBuilder;
client
.query\_groups(
QueryPointGroupsBuilder::new("{collection\_name}", "document\_id")
.query(vec![0.2, 0.1, 0.9, 0.7])
.group\_size(2u64)
.with\_payload(true)
.with\_vectors(true)
.limit(4u64),
)
.await?;
`
```
```
`import static io.qdrant.client.QueryFactory.nearest;
import io.qdrant.client.grpc.Points.QueryPointGroups;
import io.qdrant.client.grpc.Points.SearchPointGroups;
import java.util.List;
client.queryGroupsAsync(
QueryPointGroups.newBuilder()
.setCollectionName("{collection\_name}")
.setQuery(nearest(0.2f, 0.1f, 0.9f, 0.7f))
.setGroupBy("document\_id")
.setLimit(4)
.setGroupSize(2)
.build())
.get();
`
```
```
`using Qdrant.Client;
var client = new QdrantClient("localhost", 6334);
await client.QueryGroupsAsync(
collectionName: "{collection\_name}",
query: new float[] { 0.2f, 0.1f, 0.9f, 0.7f },
groupBy: "document\_id",
limit: 4,
groupSize: 2
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
client.QueryGroups(context.Background(), &qdrant.QueryPointGroups{
CollectionName: "{collection\_name}",
Query: qdrant.NewQuery(0.2, 0.1, 0.9, 0.7),
GroupBy: "document\_id",
GroupSize: qdrant.PtrOf(uint64(2)),
})
`
```
For more information on the `grouping` capabilities refer to the reference documentation for search with [grouping](https://qdrant.tech/documentation/search/search/#search-groups) and [lookup](https://qdrant.tech/documentation/search/search/#lookup-in-groups).
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/search/hybrid-queries.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/search/hybrid-queries/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/search/hybrid-queries.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)