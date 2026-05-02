CocoIndex - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Data Management](https://qdrant.tech/documentation/data-management/)
*
* CocoIndex# CocoIndex
[CocoIndex](https://cocoindex.io) is a high performance ETL framework to transform data for AI, with real-time incremental processing.
Qdrant is available as a native built-in vector database to store and retrieve embeddings.
Install CocoIndex:
```
`pip install -U cocoindex
`
```
Install Postgres with [Docker Compose](https://docs.docker.com/compose/install/):
```
`docker compose -f \<(curl -L https://raw.githubusercontent.com/cocoindex-io/cocoindex/refs/heads/main/dev/postgres.yaml) up -d
`
```
CocoIndex is a stateful ETL framework and only processes data that has changed. It uses Postgres as a metadata store to track the state of the data.
```
`import cocoindex
doc\_embeddings.export(
"doc\_embeddings",
cocoindex.storages.Qdrant(
collection\_name="cocoindex",
grpc\_url="https://xyz-example.cloud-region.cloud-provider.cloud.qdrant.io:6334/",
api\_key="\<your-api-key-here\>",
),
primary\_key\_fields=["id\_field"],
setup\_by\_user=True,
)
`
```
The spec takes the following fields:
* `collection\_name` (type: str, required): The name of the collection to export the data to.
* `grpc\_url` (type: str, optional): The gRPC URL of the Qdrant instance. Defaults to http://localhost:6334/.
* `api\_key` (type: str, optional). API key to authenticate requests with.
Before exporting, you must create a collection with a vector name that matches the vector field name in CocoIndex, and set `setup\_by\_user=True` during export.
## Further Reading
* [CocoIndex Documentation](https://cocoindex.io/docs/ops/storages#qdrant)
* [Example Code to build text embeddings with Qdrant](https://github.com/cocoindex-io/cocoindex/tree/main/examples/text_embedding_qdrant)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/data-management/cocoindex.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/data-management/cocoindex/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/data-management/cocoindex.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)