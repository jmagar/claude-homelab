Sycamore - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Frameworks](https://qdrant.tech/documentation/frameworks/)
*
* Sycamore## Sycamore
[Sycamore](https://sycamore.readthedocs.io/en/stable/) is an LLM-powered data preparation, processing, and analytics system for complex, unstructured documents like PDFs, HTML, presentations, and more. With Aryn, you can prepare data for GenAI and RAG applications, power high-quality document processing workflows, and run analytics on large document collections with natural language.
You can use the Qdrant connector to write into and read documents from Qdrant collections.
You can find an end-to-end example usage of the Qdrant connector [here.](https://github.com/aryn-ai/sycamore/blob/main/examples/simple_qdrant.py)## Writing to Qdrant
To write a Docset to a Qdrant collection in Sycamore, use the `docset.write.qdrant(....)` function. The Qdrant writer accepts the following arguments:
* `client\_params`: Parameters that are passed to the Qdrant client constructor. See more information in the [Client API Reference](https://python-client.qdrant.tech/qdrant_client.qdrant_client).
* `collection\_params`: Parameters that are passed into the `qdrant\_client.QdrantClient.create\_collection` method. See more information in the [Client API Reference](https://python-client.qdrant.tech/_modules/qdrant_client/qdrant_client#QdrantClient.create_collection).
* `vector\_name`: The name of the vector in the Qdrant collection. Defaults to `None`.
* `execute`: Execute the pipeline and write to Qdrant on adding this operator. If `False`, will return a `DocSet` with this write in the plan. Defaults to `True`.
* `kwargs`: Keyword arguments to pass to the underlying execution engine.
```
`ds.write.qdrant(
{
"url": "http://localhost:6333",
"timeout": 50,
},
{
"collection\_name": "{collection\_name}",
"vectors\_config": {
"size": 384,
"distance": "Cosine",
},
},
)
`
```
## Reading from Qdrant
To read a Docset from a Qdrant collection in Sycamore, use the `docset.read.qdrant(....)` function. The Qdrant reader accepts the following arguments:
* `client\_params`: Parameters that are passed to the Qdrant client constructor. See more information in the[Client API Reference](https://python-client.qdrant.tech/qdrant_client.qdrant_client).
* `query\_params`: Parameters that are passed into the `qdrant\_client.QdrantClient.query\_points` method. See more information in the [Client API Reference](https://python-client.qdrant.tech/_modules/qdrant_client/qdrant_client#QdrantClient.query_points).
* `kwargs`: Keyword arguments to pass to the underlying execution engine.
```
`docs = ctx.read.qdrant(
{
"url": "https://xyz-example.eu-central.aws.cloud.qdrant.io:6333",
"api\_key": "\<paste-your-api-key-here\>",
},
{"collection\_name": "{collection\_name}", "limit": 100, "using": "{optional\_vector\_name}"},
).take\_all()
`
```
## 📚 Further Reading
* [Sycamore Reference](https://sycamore.readthedocs.io/en/stable/)
* [Sycamore](https://github.com/aryn-ai/sycamore/tree/main/examples)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/sycamore.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/frameworks/sycamore/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/sycamore.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)