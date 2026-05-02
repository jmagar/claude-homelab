Rig-rs - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Frameworks](https://qdrant.tech/documentation/frameworks/)
*
* Rig-rs# Rig-rs
[Rig](http://rig.rs) is a Rust library for building scalable, modular, and ergonomic LLM-powered applications. It has full support for LLM completion and embedding workflows with minimal boiler plate.
Rig supports Qdrant as a vectorstore to ingest and search for documents semantically.
## Installation
```
`cargo add rig-core rig-qdrant qdrant-client
`
```
## Usage
Here&rsquo;s an example ingest and retrieve flow using Rig and Qdrant.
```
`use qdrant\_client::{
qdrant::{PointStruct, QueryPointsBuilder, UpsertPointsBuilder},
Payload, Qdrant,
};
use rig::{
embeddings::EmbeddingsBuilder,
providers::openai::{Client, TEXT\_EMBEDDING\_3\_SMALL},
vector\_store::VectorStoreIndex,
};
use rig\_qdrant::QdrantVectorStore;
use serde\_json::json;
const COLLECTION\_NAME: &str = "rig-collection";
// Initialize Qdrant client.
let client = Qdrant::from\_url("http://localhost:6334").build()?;
// Initialize OpenAI client.
let openai\_client = Client::new("\<OPENAI\_API\_KEY\>");
let model = openai\_client.embedding\_model(TEXT\_EMBEDDING\_3\_SMALL);
let documents = EmbeddingsBuilder::new(model.clone())
.simple\_document("0981d983-a5f8-49eb-89ea-f7d3b2196d2e", "Definition of a \*flurbo\*: A flurbo is a green alien that lives on cold planets")
.simple\_document("62a36d43-80b6-4fd6-990c-f75bb02287d1", "Definition of a \*glarb-glarb\*: A glarb-glarb is a ancient tool used by the ancestors of the inhabitants of planet Jiro to farm the land.")
.simple\_document("f9e17d59-32e5-440c-be02-b2759a654824", "Definition of a \*linglingdong\*: A term used by inhabitants of the far side of the moon to describe humans.")
.build()
.await?;
let points: Vec\<PointStruct\> = documents
.into\_iter()
.map(|d| {
let vec: Vec\<f32\> = d.embeddings[0].vec.iter().map(|&x| x as f32).collect();
PointStruct::new(
d.id,
vec,
Payload::try\_from(json!({
"document": d.document,
}))
.unwrap(),
)
})
.collect();
client
.upsert\_points(UpsertPointsBuilder::new(COLLECTION\_NAME, points))
.await?;
let query\_params = QueryPointsBuilder::new(COLLECTION\_NAME).with\_payload(true);
let vector\_store = QdrantVectorStore::new(client, model, query\_params.build());
let results = vector\_store
.top\_n::\<serde\_json::Value\>("Define a glarb-glarb?", 1)
.await?;
println!("Results: {:?}", results);
`
```
## Further reading
* [Rig-rs Documentation](https://rig.rs)
* [Source Code](https://github.com/0xPlaygrounds/rig)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/rig-rs.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/frameworks/rig-rs/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/rig-rs.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)