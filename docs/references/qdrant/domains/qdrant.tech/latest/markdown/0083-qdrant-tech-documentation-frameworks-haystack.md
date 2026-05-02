Haystack - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Frameworks](https://qdrant.tech/documentation/frameworks/)
*
* Haystack# Haystack
[Haystack](https://haystack.deepset.ai/) serves as a comprehensive NLP framework, offering a modular methodology for constructing
cutting-edge generative AI, QA, and semantic knowledge base search systems. A critical element in contemporary NLP systems is an
efficient database for storing and retrieving extensive text data. Vector databases excel in this role, as they house vector
representations of text and implement effective methods for swift retrieval. Thus, we are happy to announce the integration
with Haystack - `QdrantDocumentStore`. This document store is unique, as it is maintained externally by the Qdrant team.
The new document store comes as a separate package and can be updated independently of Haystack:
```
`pip install qdrant-haystack
`
```
`QdrantDocumentStore` supports [all the configuration properties](https://qdrant.tech/documentation/manage-data/collections/#create-collection) available in
the Qdrant Python client. If you want to customize the default configuration of the collection used under the hood, you can
provide that settings when you create an instance of the `QdrantDocumentStore`. For example, if you&rsquo;d like to enable the
Scalar Quantization, you&rsquo;d make that in the following way:
```
`from qdrant\_haystack.document\_stores import QdrantDocumentStore
from qdrant\_client import models
document\_store = QdrantDocumentStore(
":memory:",
index="Document",
embedding\_dim=512,
recreate\_index=True,
quantization\_config=models.ScalarQuantization(
scalar=models.ScalarQuantizationConfig(
type=models.ScalarType.INT8,
quantile=0.99,
always\_ram=True,
),
),
)
`
```
## Further Reading
* [Haystack Documentation](https://haystack.deepset.ai/integrations/qdrant-document-store)
* [Source Code](https://github.com/deepset-ai/haystack-core-integrations/tree/main/integrations/qdrant)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/haystack.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/frameworks/haystack/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/haystack.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)