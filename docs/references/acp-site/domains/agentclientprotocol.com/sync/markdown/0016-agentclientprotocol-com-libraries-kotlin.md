Kotlin - Agent Client Protocol
[Protocol
](/get-started/introduction)[RFDs
](/rfds/about)[Community
](/community/communication)[Publications
](/publications)[Updates
](/updates)[Brand
](/brand)
## > Documentation Index
> Fetch the complete documentation index at:
[> https://agentclientprotocol.com/llms.txt
](https://agentclientprotocol.com/llms.txt)
> Use this file to discover all available pages before exploring further.
The [kotlin-sdk](https://github.com/agentclientprotocol/kotlin-sdk) provides implementations of both sides of the Agent Client Protocol that
you can use to build your own agent server or client.
**It currently supports JVM, other targets are in progress.**
To get started, add the repository to your build file:
```
`repositories {
mavenCentral()
}
`
```
Add the dependency:
```
`dependencies {
implementation("com.agentclientprotocol:acp:0.1.0-SNAPSHOT")
}
`
```
The [sample](https://github.com/agentclientprotocol/kotlin-sdk/tree/master/samples/kotlin-acp-client-sample) demonstrates how to implement both sides of the protocol.