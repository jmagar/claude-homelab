FastEmbed - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* FastEmbed# What is FastEmbed?
FastEmbed is a lightweight Python library built for embedding generation. It supports popular embedding models and offers a user-friendly experience for embedding data into vector space.
By using FastEmbed, you can ensure that your embedding generation process is not only fast and efficient but also highly accurate, meeting the needs of various machine learning and natural language processing applications.
FastEmbed easily integrates with Qdrant for a variety of multimodal search purposes.
## Using FastEmbed
|Type|Guide|What you&rsquo;ll learn|
|**Beginner**|[Generate Text Embeddings](https://qdrant.tech/documentation/fastembed/fastembed-quickstart/)|Install FastEmbed and generate dense text embeddings|
||[Dense Embeddings + Qdrant](https://qdrant.tech/documentation/fastembed/fastembed-semantic-search/)|Generate and index dense embeddings for semantic similarity search|
|**Advanced**|[miniCOIL Sparse Embeddings + Qdrant](https://qdrant.tech/documentation/fastembed/fastembed-minicoil/)|Use Qdrant&rsquo;s sparse neural retriever for exact text search|
||[SPLADE Sparse Embeddings + Qdrant](https://qdrant.tech/documentation/fastembed/fastembed-splade/)|Generate sparse neural embeddings for exact text search|
||[ColBERT Multivector Embeddings + Qdrant](https://qdrant.tech/documentation/fastembed/fastembed-colbert/)|Generate and index multi-vector representations; **ideal for rescoring, or small-scale retrieval**|
||[Reranking with FastEmbed](https://qdrant.tech/documentation/fastembed/fastembed-rerankers/)|Re-rank top-K results using FastEmbed cross-encoders|
||[Postprocessing](https://qdrant.tech/documentation/fastembed/fastembed-postprocessing/)|Apply postprocessing techniques to embeddings after generation|
## Why is FastEmbed useful?
* Light: Unlike other inference frameworks, such as PyTorch, FastEmbed requires very little external dependencies. Because it uses the ONNX runtime, it is perfect for serverless environments like AWS Lambda.
* Fast: By using ONNX, FastEmbed ensures high-performance inference across various hardware platforms.
* Accurate: FastEmbed aims for better accuracy and recall than models like OpenAI&rsquo;s `Ada-002`. It always uses model which demonstrate strong results on the MTEB leaderboard.
* Support: FastEmbed supports a wide range of models, including multilingual ones, to meet diverse use case needs.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/fastembed/_index.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/fastembed/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/fastembed/_index.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)