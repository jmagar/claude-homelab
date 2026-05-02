Mastra - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Frameworks](https://qdrant.tech/documentation/frameworks/)
*
* Mastra# Mastra
[Mastra](https://mastra.ai/) is a Typescript framework to build AI applications and features quickly. It gives you the set of primitives you need: workflows, agents, RAG, integrations, syncs and evals. You can run Mastra on your local machine, or deploy to a serverless cloud.
Qdrant is available as a vector store in Mastra node to augment application with retrieval capabilities.
## Setup
```
`npm install @mastra/core
`
```
## Usage
```
`import { QdrantVector } from "@mastra/rag";
const qdrant = new QdrantVector({
url: "https://xyz-example.eu-central.aws.cloud.qdrant.io:6333"
apiKey: "\<YOUR\_API\_KEY\>",
https: true
});
`
```
## Constructor Options
|Name|Type|Description|
|`url`|`string`|REST URL of the Qdrant instance. Eg. [https://xyz-example.eu-central.aws.cloud.qdrant.io:6333](https://xyz-example.eu-central.aws.cloud.qdrant.io:6333)|
|`apiKey`|`string`|Optional Qdrant API key|
|`https`|`boolean`|Whether to use TLS when setting up the connection. Recommended.|
## Methods
### `createIndex()`
|Name|Type|Description|Default Value|
|`indexName`|`string`|Name of the index to create||
|`dimension`|`number`|Vector dimension size||
|`metric`|`string`|Distance metric for similarity search|`cosine`|
### `upsert()`
|Name|Type|Description|Default Value|
|`vectors`|`number[][]`|Array of embedding vectors||
|`metadata`|`Record\<string, any\>[]`|Metadata for each vector (optional)||
|`namespace`|`string`|Optional namespace for organization||
### `query()`
|Name|Type|Description|Default Value|
|`vector`|`number[]`|Query vector to find similar vectors||
|`topK`|`number`|Number of results to return (optional)|`10`|
|`filter`|`Record\<string, any\>`|Metadata filters for the query (optional)||
### `listIndexes()`
Returns an array of index names as strings.
### `describeIndex()`
|Name|Type|Description|
|`indexName`|`string`|Name of the index to describe|
#### Returns
```
`interface IndexStats {
dimension: number;
count: number;
metric: "cosine" | "euclidean" | "dotproduct";
}
`
```
### `deleteIndex()`
|Name|Type|Description|
|`indexName`|`string`|Name of the index to delete|
## Response Types
Query results are returned in this format:
```
`interface QueryResult {
id: string;
score: number;
metadata: Record\<string, any\>;
}
`
```
## Further Reading
* [Mastra Examples](https://github.com/mastra-ai/mastra/tree/main/examples)
* [Mastra Documentation](http://mastra.ai/docs/)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/mastra.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/frameworks/mastra/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/mastra.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)