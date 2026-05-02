Kotaemon - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Platforms](https://qdrant.tech/documentation/platforms/)
*
* Kotaemon# Kotaemon
[Kotaemon](https://github.com/Cinnamon/kotaemon) is open-source clean & customizable RAG UI for chatting with your documents. Built with both end users and developers in mind.
Qdrant is supported as a vectorstore in Kotaemon for ingesting and retrieving documents.
## Configuration
* Refer to [Getting started](https://cinnamon.github.io/kotaemon/) guide to set up Kotaemon.
* To configure Kotaemon to use Qdrant as the vector store, update the `flowsettings.py` as follows.
```
`KH\_VECTORSTORE = {
"\_\_type\_\_": "kotaemon.storages.QdrantVectorStore",
"url": "https://xyz-example.eu-central.aws.cloud.qdrant.io:6333",
"api\_key": "\<provide-your-own-key\>'",
"client\_kwargs": {} # Additional options to pass to qdrant\_client.QdrantClient
}
`
```
* Restart Kotaemon for the changes to take effect.
The reference for all the Qdrant client options can be found [here](https://python-client.qdrant.tech/qdrant_client.qdrant_client)
## Further reading
* [Kotaemon Documentation](https://cinnamon.github.io/kotaemon/)
* [Source](https://github.com/Cinnamon/kotaemon)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/platforms/kotaemon.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/platforms/kotaemon/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/platforms/kotaemon.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)