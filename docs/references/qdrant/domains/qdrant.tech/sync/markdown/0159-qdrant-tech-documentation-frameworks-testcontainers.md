Testcontainers - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Frameworks](https://qdrant.tech/documentation/frameworks/)
*
* Testcontainers# Testcontainers
[Testcontainers](https://testcontainers.com/) is a testing library that provides easy and lightweight APIs for bootstrapping integration tests with real services wrapped in Docker containers.
Qdrant is available as a [Testcontainers module](https://testcontainers.com/modules/qdrant/) in multiple languages. It facilitates the spawning of a Qdrant instance for end-to-end testing.
## Usage
```
`import org.testcontainers.qdrant.QdrantContainer;
QdrantContainer qdrantContainer = new QdrantContainer("qdrant/qdrant");
`
```
```
`import (
"github.com/testcontainers/testcontainers-go"
"github.com/testcontainers/testcontainers-go/modules/qdrant"
)
qdrantContainer, err := qdrant.RunContainer(ctx, testcontainers.WithImage("qdrant/qdrant"))
`
```
```
`import { QdrantContainer } from "@testcontainers/qdrant";
const qdrantContainer = await new QdrantContainer("qdrant/qdrant").start();
`
```
```
`from testcontainers.qdrant import QdrantContainer
qdrant\_container = QdrantContainer("qdrant/qdrant").start()
`
```
```
`var qdrantContainer = new QdrantBuilder()
.WithImage("qdrant/qdrant")
.Build();
await qdrantContainer.StartAsync();
`
```
Testcontainers modules provide options/methods to configure ENVs, volumes, and virtually everything you can configure in a Docker container.
## Further reading
* [Testcontainers Guides](https://testcontainers.com/guides/)
* [Testcontainers Qdrant Module](https://testcontainers.com/modules/qdrant/)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/testcontainers.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/frameworks/testcontainers/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/testcontainers.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)