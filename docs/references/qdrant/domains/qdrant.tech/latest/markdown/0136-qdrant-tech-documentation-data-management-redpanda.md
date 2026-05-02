Redpanda Connect - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Data Management](https://qdrant.tech/documentation/data-management/)
*
* Redpanda Connect
[Redpanda Connect](https://www.redpanda.com/connect) is a declarative data-agnostic streaming service designed for efficient, stateless processing steps. It offers transaction-based resiliency with back pressure, ensuring at-least-once delivery when connecting to at-least-once sources with sinks, without the need to persist messages during transit.
Connect pipelines are configured using a YAML file, which organizes components hierarchically. Each section represents a different component type, such as inputs, processors and outputs, and these can have nested child components and [dynamic values](https://docs.redpanda.com/redpanda-connect/configuration/interpolation/).
The [Qdrant Output](https://docs.redpanda.com/redpanda-connect/components/outputs/qdrant/) component enables streaming vector data into Qdrant collections in your RedPanda pipelines.
## Example
An example configuration of the output once the inputs and processors are set, would look like:
```
`input:
# https://docs.redpanda.com/redpanda-connect/components/inputs/about/
pipeline:
processors:
# https://docs.redpanda.com/redpanda-connect/components/processors/about/
output:
label: "qdrant-output"
qdrant:
max\_in\_flight: 64
batching:
count: 8
grpc\_host: xyz-example.eu-central.aws.cloud.qdrant.io:6334
api\_token: "\<provide-your-own-key\>"
tls:
enabled: true
# skip\_cert\_verify: false
# enable\_renegotiation: false
# root\_cas: ""
# root\_cas\_file: ""
# client\_certs: []
collection\_name: "\<collection\_name\>"
id: root = uuid\_v4()
vector\_mapping: 'root = {"some\_dense": this.vector, "some\_sparse": {"indices": [23,325,532],"values": [0.352,0.532,0.532]}}'
payload\_mapping: 'root = {"field": this.value, "field\_2": 987}'
`
```
## Further Reading
* [Getting started with Connect](https://docs.redpanda.com/redpanda-connect/guides/getting_started/)
* [Qdrant Output Reference](https://docs.redpanda.com/redpanda-connect/components/outputs/qdrant/)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/data-management/redpanda.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/data-management/redpanda/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/data-management/redpanda.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)