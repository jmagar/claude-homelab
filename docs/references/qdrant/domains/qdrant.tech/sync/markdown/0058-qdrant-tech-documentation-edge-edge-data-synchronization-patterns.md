Data Synchronization Patterns - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Qdrant Edge](https://qdrant.tech/documentation/edge/)
*
* Data Synchronization Patterns# Data Synchronization Patterns
This page describes patterns for synchronizing data between Qdrant Edge Shards and Qdrant server collections. For a practical end-to-end guide on implementing these patterns, refer to the [Qdrant Edge Synchronization Guide](https://qdrant.tech/documentation/edge/edge-synchronization-guide/).
## Initialize Edge Shard from Existing Qdrant Collection
Instead of starting with an empty Edge Shard, you may want to initialize it with pre-existing data from a collection on a Qdrant server. You can achieve this by restoring a snapshot of a shard in the server-side collection.
When creating a snapshot for synchronization, specify the applicable server-side shard ID in the snapshot URL. This allows for a single collection to serve multiple independent users or devices, each with its own Edge Shard. Read more about Qdrant&rsquo;s sharding strategy in the [Tiered Multitenancy Documentation](https://qdrant.tech/documentation/manage-data/multitenancy/#tiered-multitenancy).
First, craft a snapshot URL:
```
`COLLECTION\_NAME="edge-collection"
snapshot\_url = f"{QDRANT\_URL}/collections/{COLLECTION\_NAME}/shards/0/snapshot"
`
```
```
`const COLLECTION\_NAME: &str = "edge-collection";
let snapshot\_url = format!(
"{QDRANT\_URL}/collections/{COLLECTION\_NAME}/shards/0/snapshot"
);
`
```
Note that this example uses shard ID `0`.
Using the snapshot URL, you can download the snapshot to the local disk and use its data to initialize a new Edge Shard.
```
`from pathlib import Path
from qdrant\_edge import EdgeShard
import requests
import shutil
import tempfile
SHARD\_DIRECTORY = "./qdrant-edge-directory"
data\_dir = Path(SHARD\_DIRECTORY)
with tempfile.TemporaryDirectory(dir=data\_dir.parent) as restore\_dir:
snapshot\_path = Path(restore\_dir) / "shard.snapshot"
with requests.get(snapshot\_url, headers={"api-key": QDRANT\_API\_KEY}, stream=True) as r:
r.raise\_for\_status()
with open(snapshot\_path, "wb") as f:
for chunk in r.iter\_content(chunk\_size=8192):
f.write(chunk)
if data\_dir.exists():
shutil.rmtree(data\_dir)
data\_dir.mkdir(parents=True, exist\_ok=True)
EdgeShard.unpack\_snapshot(str(snapshot\_path), str(data\_dir))
edge\_shard = EdgeShard.load(SHARD\_DIRECTORY)
`
```
```
`const SHARD\_DIRECTORY: &str = "./qdrant-edge-directory";
let data\_dir = Path::new(SHARD\_DIRECTORY);
let restore\_dir = tempfile::Builder::new()
.tempdir\_in(data\_dir.parent().unwrap\_or(Path::new(".")))?;
let snapshot\_path = restore\_dir.path().join("shard.snapshot");
let mut bytes = Vec::new();
std::io::copy(
&mut ureq::get(&snapshot\_url)
.header("api-key", QDRANT\_API\_KEY)
.call()?
.into\_body()
.into\_reader(),
&mut bytes,
)?;
fs\_err::write(&snapshot\_path, &bytes)?;
if data\_dir.exists() {
fs\_err::remove\_dir\_all(data\_dir)?;
}
fs\_err::create\_dir\_all(data\_dir)?;
EdgeShard::unpack\_snapshot(&snapshot\_path, data\_dir)?;
let edge\_shard = EdgeShard::load(data\_dir, None)?;
`
```
This code first downloads the snapshot to a temporary directory. Next, `EdgeShard.unpack\_snapshot` unpacks the downloaded snapshot into the data directory, and an EdgeShard is initialized using the unpacked data and configuration.
The `edge\_shard` will use the same configuration and the same file structure as the source collection from which the snapshot was created, including vector and payload indexes.
## Update Qdrant Edge with Server-Side Changes
To keep an Edge Shard updated with new data from a server collection, you can periodically download and apply a snapshot. Restoring a full snapshot every time would create unnecessary overhead. Instead, you can use partial snapshots to restore changes since the last snapshot. A partial snapshot contains only those segments that have changed, based on the Edge Shard&rsquo;s manifest that describes all its segments and metadata.
```
`manifest = edge\_shard.snapshot\_manifest()
url = f"{QDRANT\_URL}/collections/{COLLECTION\_NAME}/shards/0/snapshot/partial/create"
with tempfile.TemporaryDirectory(dir=data\_dir) as temp\_dir:
partial\_snapshot\_path = Path(temp\_dir) / "partial.snapshot"
response = requests.post(url, headers={"api-key": QDRANT\_API\_KEY}, json=manifest, stream=True)
response.raise\_for\_status()
with open(partial\_snapshot\_path, "wb") as f:
for chunk in response.iter\_content(chunk\_size=8192):
f.write(chunk)
edge\_shard.update\_from\_snapshot(str(partial\_snapshot\_path))
`
```
```
`let current\_manifest = edge\_shard.snapshot\_manifest()?;
let update\_url = format!(
"{QDRANT\_URL}/collections/{COLLECTION\_NAME}/shards/0/snapshot\\
/partial/create"
);
let temp\_dir = tempfile::tempdir\_in(data\_dir)?;
let partial\_snapshot\_path = temp\_dir.path().join("partial.snapshot");
let mut bytes = Vec::new();
std::io::copy(
&mut ureq::post(&update\_url)
.header("api-key", QDRANT\_API\_KEY)
.send\_json(&current\_manifest)?
.into\_body()
.into\_reader(),
&mut bytes,
)?;
fs\_err::write(&partial\_snapshot\_path, &bytes)?;
let unpacked\_dir = tempfile::tempdir\_in(data\_dir)?;
EdgeShard::unpack\_snapshot(&partial\_snapshot\_path, unpacked\_dir.path())?;
let snapshot\_manifest = SnapshotManifest::load\_from\_snapshot(
unpacked\_dir.path(),
None,
)?;
let edge\_shard = EdgeShard::recover\_partial\_snapshot(
data\_dir,
&current\_manifest,
unpacked\_dir.path(),
&snapshot\_manifest,
)?;
`
```
## Update a Server Collection from an Edge Shard
To synchronize data from an Edge Shard to a server collection, implement a dual-write mechanism in your application. When you add or update a point in the Edge Shard, simultaneously store it in a server collection using the Qdrant client.
Instead of writing to the server collection directly, you may want to set up a background job or a message queue that handles the synchronization asynchronously. The application may not always have a stable internet connection, so queuing updates ensures that data is eventually synchronized when connectivity is restored.
First, initialize:
* an Edge Shard from scratch or from server-side snapshot
* a Qdrant server connection.Details
Initialize an Edge Shard:
```
`from pathlib import Path
from qdrant\_edge import (
Distance,
EdgeConfig,
EdgeVectorParams,
)
SHARD\_DIRECTORY = "./qdrant-edge-directory"
VECTOR\_NAME="my-vector"
VECTOR\_DIMENSION=4
Path(SHARD\_DIRECTORY).mkdir(parents=True, exist\_ok=True)
config = EdgeConfig(
vectors={
VECTOR\_NAME: EdgeVectorParams(
size=VECTOR\_DIMENSION,
distance=Distance.Cosine,
)
}
)
edge\_shard = EdgeShard.create(SHARD\_DIRECTORY, config)
`
```
```
`const VECTOR\_DIMENSION: usize = 4;
const VECTOR\_NAME: &str = "my-vector";
fs\_err::create\_dir\_all(SHARD\_DIRECTORY)?;
let config = EdgeConfig {
on\_disk\_payload: true,
vectors: HashMap::from([(
VECTOR\_NAME.to\_string(),
EdgeVectorParams {
size: VECTOR\_DIMENSION,
distance: qdrant\_edge::Distance::Cosine,
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
let edge\_shard = EdgeShard::new(
Path::new(SHARD\_DIRECTORY),
config,
)?;
`
```
Initialize a Qdrant client connection to the server and create the target collection if it does not exist:
```
`from qdrant\_client import QdrantClient, models
server\_client = QdrantClient(url=QDRANT\_URL, api\_key=QDRANT\_API\_KEY)
COLLECTION\_NAME="edge-collection"
if not server\_client.collection\_exists(collection\_name=COLLECTION\_NAME):
server\_client.create\_collection(
collection\_name=COLLECTION\_NAME,
vectors\_config={VECTOR\_NAME: models.VectorParams(size=VECTOR\_DIMENSION, distance=models.Distance.COSINE)}
)
`
```
```
`let server\_client = Qdrant::from\_url(QDRANT\_URL)
.api\_key(QDRANT\_API\_KEY)
.build()?;
if !server\_client.collection\_exists(COLLECTION\_NAME).await? {
server\_client
.create\_collection(
CreateCollectionBuilder::new(COLLECTION\_NAME).vectors\_config(
VectorParamsBuilder::new(
VECTOR\_DIMENSION as u64,
Distance::Cosine,
),
),
)
.await?;
}
`
```
Next, instantiate the queue that will hold the points that need to be synchronized with the server:
```
`from queue import Empty, Queue
# This is in-memory queue
# For production use cases consider persisting changes
upload\_queue: Queue[models.PointStruct] = Queue()
`
```
```
`// This is an in-memory queue.
// For production use cases consider persisting changes.
let mut upload\_queue: std::collections::VecDeque\<PointStruct\> =
std::collections::VecDeque::new();
`
```
When adding or updating points in the Edge Shard, also enqueue the point for synchronization with the server.
```
`from qdrant\_edge import ( Point, UpdateOperation )
from qdrant\_client import models
id=1
vector=[0.1, 0.2, 0.3, 0.4]
payload={"color": "red"}
point = Point(
id=id,
vector={VECTOR\_NAME: vector},
payload=payload
)
edge\_shard.update(UpdateOperation.upsert\_points([point]))
rest\_point = models.PointStruct(id=id, vector={VECTOR\_NAME: vector}, payload=payload)
upload\_queue.put(rest\_point)
`
```
```
`let id = 1u64;
let vector = vec![0.1f32, 0.2, 0.3, 0.4];
let payload = json!({"color": "red"});
let edge\_points: Vec\<PointStructPersisted\> = vec![
EdgePoint::new(
PointId::NumId(id),
Vectors::new\_named([(VECTOR\_NAME, vector.clone())]),
payload.clone(),
)
.into(),
];
edge\_shard.update(UpdateOperation::PointOperation(
PointOperations::UpsertPoints(
PointInsertOperations::PointsList(edge\_points),
),
))?;
let server\_point = PointStruct::new(
id,
HashMap::from([(VECTOR\_NAME.to\_string(), vector)]),
payload.as\_object().cloned().unwrap\_or\_default(),
);
upload\_queue.push\_back(server\_point);
`
```
A background worker can process the upload queue and synchronize points with the server collection.
This example uploads points in batches of up to 10 points at a time:
```
`BATCH\_SIZE = 10
points\_to\_upload: list[models.PointStruct] = []
while len(points\_to\_upload) \< BATCH\_SIZE:
try:
points\_to\_upload.append(upload\_queue.get\_nowait())
except Empty:
break
if points\_to\_upload:
server\_client.upsert(
collection\_name=COLLECTION\_NAME, points=points\_to\_upload
)
`
```
```
`const BATCH\_SIZE: usize = 10;
let points\_to\_upload: Vec\<PointStruct\> = upload\_queue
.drain(..BATCH\_SIZE.min(upload\_queue.len()))
.collect();
if !points\_to\_upload.is\_empty() {
server\_client
.upsert\_points(UpsertPointsBuilder::new(
COLLECTION\_NAME,
points\_to\_upload,
))
.await?;
}
`
```
Make sure to properly handle errors and retries in case of network issues or server unavailability.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/edge/edge-data-synchronization-patterns.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/edge/edge-data-synchronization-patterns/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/edge/edge-data-synchronization-patterns.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)