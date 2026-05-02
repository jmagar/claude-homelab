LangChain4j - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Frameworks](https://qdrant.tech/documentation/frameworks/)
*
* LangChain4j# LangChain for Java
LangChain for Java, also known as [Langchain4J](https://github.com/langchain4j/langchain4j), is a community port of [Langchain](https://www.langchain.com/) for building context-aware AI applications in Java
You can use Qdrant as a vector store in LangChain4j through the [`langchain4j-qdrant`](https://central.sonatype.com/artifact/dev.langchain4j/langchain4j-qdrant) module.
## Setup
Add the `langchain4j-qdrant` to your project dependencies.
```
`\<dependency\>
\<groupId\>dev.langchain4j\</groupId\>
\<artifactId\>langchain4j-qdrant\</artifactId\>
\<version\>VERSION\</version\>
\</dependency\>
`
```
## Usage
Before you use the following code sample, customize the following values for your configuration:
* `YOUR\_COLLECTION\_NAME`: Use our [Collections](https://qdrant.tech/documentation/manage-data/collections/) guide to create or
list collections.
* `YOUR\_HOST\_URL`: Use the GRPC URL for your system. If you used the [Quick Start](https://qdrant.tech/documentation/quickstart/) guide,
it may be http://localhost:6334. If you&rsquo;ve deployed in the [Qdrant Cloud](https://qdrant.tech/documentation/cloud/), you may have a
longer URL such as `https://example.location.cloud.qdrant.io:6334`.
* `YOUR\_API\_KEY`: Substitute the API key associated with your configuration.
```
`import dev.langchain4j.store.embedding.EmbeddingStore;
import dev.langchain4j.store.embedding.qdrant.QdrantEmbeddingStore;
EmbeddingStore\<TextSegment\> embeddingStore =
QdrantEmbeddingStore.builder()
// Ensure the collection is configured with the appropriate dimensions
// of the embedding model.
// Reference: https://qdrant.tech/documentation/manage-data/collections/
.collectionName("YOUR\_COLLECTION\_NAME")
.host("YOUR\_HOST\_URL")
// GRPC port of the Qdrant server
.port(6334)
.apiKey("YOUR\_API\_KEY")
.build();
`
```
`QdrantEmbeddingStore` supports all the semantic features of LangChain4j.
## Further Reading
* You can refer to the [LangChain4j examples](https://github.com/langchain4j/langchain4j-examples/) to get started.
* [Source Code](https://github.com/langchain4j/langchain4j/tree/main/langchain4j-qdrant)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/langchain4j.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/frameworks/langchain4j/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/langchain4j.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)