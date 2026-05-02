API & SDKs - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* API & SDKs# Interfaces
Qdrant supports these &ldquo;official&rdquo; clients.
**> Note:
**> If you are using a language that is not listed here, you can use the REST API directly or generate a client for your languageusing
[> OpenAPI
](https://github.com/qdrant/qdrant/blob/master/docs/redoc/master/openapi.json)> or
[> protobuf
](https://github.com/qdrant/qdrant/tree/master/lib/api/src/grpc/proto)> definitions.
## Client Libraries
||Client Repository|Installation|Version|
|[](https://python-client.qdrant.tech/)|**[Python](https://github.com/qdrant/qdrant-client)** + **[(Client Docs)](https://python-client.qdrant.tech/)**|`pip install qdrant-client[fastembed]`|[Latest Release](https://github.com/qdrant/qdrant-client/releases)|
||**[JavaScript / Typescript](https://github.com/qdrant/qdrant-js)**|`npm install @qdrant/js-client-rest`|[Latest Release](https://github.com/qdrant/qdrant-js/releases)|
||**[Rust](https://github.com/qdrant/rust-client)**|`cargo add qdrant-client`|[Latest Release](https://github.com/qdrant/rust-client/releases)|
||**[Go](https://github.com/qdrant/go-client)**|`go get github.com/qdrant/go-client`|[Latest Release](https://github.com/qdrant/go-client/releases)|
||**[.NET](https://github.com/qdrant/qdrant-dotnet)**|`dotnet add package Qdrant.Client`|[Latest Release](https://github.com/qdrant/qdrant-dotnet/releases)|
||**[Java](https://github.com/qdrant/java-client)**|[Available on Maven Central](https://central.sonatype.com/artifact/io.qdrant/client)|[Latest Release](https://github.com/qdrant/java-client/releases)|
## API Reference
All interaction with Qdrant takes place via the REST API. We recommend using REST API if you are using Qdrant for the first time or if you are working on a prototype.
|API|Documentation|
|REST API|[OpenAPI Specification](https://api.qdrant.tech/api-reference)|
|gRPC API|[gRPC protobuf definitions](https://github.com/qdrant/qdrant/tree/master/lib/api/src/grpc/proto)|
### gRPC Interface
The gRPC methods follow the same principles as REST. For each REST endpoint, there is a corresponding gRPC method.
As per the [configuration file](https://github.com/qdrant/qdrant/blob/master/config/config.yaml), the gRPC interface is available on the specified port.
```
`service:
grpc\_port: 6334
`
```
If you decide to use gRPC, you must expose the port when starting Qdrant.
Running the service inside of Docker will look like this:
```
`docker run -p 6333:6333 -p 6334:6334 \\
-v $(pwd)/qdrant\_storage:/qdrant/storage:z \\
qdrant/qdrant
`
```
**When to use gRPC:** The choice between gRPC and the REST API is a trade-off between convenience and speed. gRPC is a binary protocol and can be more challenging to debug. We recommend using gRPC if you are already familiar with Qdrant and are trying to optimize the performance of your application.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/interfaces.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/interfaces/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/interfaces.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)