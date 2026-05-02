Spring AI - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Frameworks](https://qdrant.tech/documentation/frameworks/)
*
* Spring AI# Spring AI
[Spring AI](https://docs.spring.io/spring-ai/reference/) is a Java framework that provides a [Spring-friendly](https://spring.io/) API and abstractions for developing AI applications.
Qdrant is available as supported vector database for use within your Spring AI projects.
## Installation
You can find the Spring AI installation instructions [here](https://docs.spring.io/spring-ai/reference/getting-started.html).
Add the Qdrant boot starter package.
```
`\<dependency\>
\<groupId\>org.springframework.ai\</groupId\>
\<artifactId\>spring-ai-qdrant-store-spring-boot-starter\</artifactId\>
\</dependency\>
`
```
## Usage
Configure Qdrant with Spring Boot’s `application.properties`.
```
`spring.ai.vectorstore.qdrant.host=\<host of your qdrant instance\>
spring.ai.vectorstore.qdrant.port=\<the GRPC port of your qdrant instance\>
spring.ai.vectorstore.qdrant.api-key=\<your api key\>
spring.ai.vectorstore.qdrant.collection-name=\<The name of the collection to use in Qdrant\>
`
```
Learn more about these options in the [configuration reference](https://docs.spring.io/spring-ai/reference/api/vectordbs/qdrant.html#qdrant-vectorstore-properties).
Or you can set up the Qdrant vector store with the `QdrantVectorStoreConfig` options.
```
`@Bean
public QdrantVectorStoreConfig qdrantVectorStoreConfig() {
return QdrantVectorStoreConfig.builder()
.withHost("\<QDRANT\_HOSTNAME\>")
.withPort(\<QDRANT\_GRPC\_PORT\>)
.withCollectionName("\<QDRANT\_COLLECTION\_NAME\>")
.withApiKey("\<QDRANT\_API\_KEY\>")
.build();
}
`
```
Build the vector store using the config and any of the support [Spring AI embedding providers](https://docs.spring.io/spring-ai/reference/api/embeddings.html#available-implementations).
```
`@Bean
public VectorStore vectorStore(QdrantVectorStoreConfig config, EmbeddingClient embeddingClient) {
return new QdrantVectorStore(config, embeddingClient);
}
`
```
You can now use the `VectorStore` instance backed by Qdrant as a vector store in the Spring AI APIs.
If the collection is not [created in advance](https://qdrant.tech/documentation/manage-data/collections/#create-a-collection), `QdrantVectorStore` will attempt to create one using cosine similarity and the dimension of the configured `EmbeddingClient`.## 📚 Further Reading
* Spring AI [Qdrant reference](https://docs.spring.io/spring-ai/reference/api/vectordbs/qdrant.html)
* Spring AI [API reference](https://docs.spring.io/spring-ai/reference/index.html)
* [Source Code](https://github.com/spring-projects/spring-ai/tree/main/vector-stores/spring-ai-qdrant-store)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/spring-ai.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/frameworks/spring-ai/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/spring-ai.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)