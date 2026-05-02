AWS Bedrock - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Embeddings](https://qdrant.tech/documentation/embeddings/)
*
* AWS Bedrock# Bedrock Embeddings
You can use [AWS Bedrock](https://aws.amazon.com/bedrock/) with Qdrant. AWS Bedrock supports multiple [embedding model providers](https://docs.aws.amazon.com/bedrock/latest/userguide/models-supported.html).
You&rsquo;ll need the following information from your AWS account:
* Region
* Access key ID
* Secret key
To configure your credentials, review the following AWS article: [How do I create an AWS access key](https://repost.aws/knowledge-center/create-access-key).
With the following code sample, you can generate embeddings using the [Titan Embeddings G1 - Text model](https://docs.aws.amazon.com/bedrock/latest/userguide/titan-embedding-models.html) which produces sentence embeddings of size 1536.
```
`# Install the required dependencies
# pip install boto3 qdrant\_client
import json
import boto3
from qdrant\_client import QdrantClient, models
session = boto3.Session()
bedrock\_client = session.client(
"bedrock-runtime",
region\_name="\<YOUR\_AWS\_REGION\>",
aws\_access\_key\_id="\<YOUR\_AWS\_ACCESS\_KEY\_ID\>",
aws\_secret\_access\_key="\<YOUR\_AWS\_SECRET\_KEY\>",
)
qdrant\_client = QdrantClient(url="http://localhost:6333")
qdrant\_client.create\_collection(
"{collection\_name}",
vectors\_config=models.VectorParams(size=1536, distance=models.Distance.COSINE),
)
body = json.dumps({"inputText": "Some text to generate embeddings for"})
response = bedrock\_client.invoke\_model(
body=body,
modelId="amazon.titan-embed-text-v1",
accept="application/json",
contentType="application/json",
)
response\_body = json.loads(response.get("body").read())
qdrant\_client.upsert(
"{collection\_name}",
points=[models.PointStruct(id=1, vector=response\_body["embedding"])],
)
`
```
```
`// Install the required dependencies
// npm install @aws-sdk/client-bedrock-runtime @qdrant/js-client-rest
import {
BedrockRuntimeClient,
InvokeModelCommand,
} from "@aws-sdk/client-bedrock-runtime";
import { QdrantClient } from '@qdrant/js-client-rest';
const main = async () =\> {
const bedrockClient = new BedrockRuntimeClient({
region: "\<YOUR\_AWS\_REGION\>",
credentials: {
accessKeyId: "\<YOUR\_AWS\_ACCESS\_KEY\_ID\>",,
secretAccessKey: "\<YOUR\_AWS\_SECRET\_KEY\>",
},
});
const qdrantClient = new QdrantClient({ url: 'http://localhost:6333' });
await qdrantClient.createCollection("{collection\_name}", {
vectors: {
size: 1536,
distance: 'Cosine',
}
});
const response = await bedrockClient.send(
new InvokeModelCommand({
modelId: "amazon.titan-embed-text-v1",
body: JSON.stringify({
inputText: "Some text to generate embeddings for",
}),
contentType: "application/json",
accept: "application/json",
})
);
const body = new TextDecoder().decode(response.body);
await qdrantClient.upsert("{collection\_name}", {
points: [
{
id: 1,
vector: JSON.parse(body).embedding,
},
],
});
}
main();
`
```
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/embeddings/bedrock.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/embeddings/bedrock/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/embeddings/bedrock.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)