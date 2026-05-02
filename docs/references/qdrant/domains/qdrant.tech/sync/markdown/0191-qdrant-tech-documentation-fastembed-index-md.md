# FastEmbed
# What is FastEmbed?
FastEmbed is a lightweight Python library built for embedding generation. It supports popular embedding models and offers a user-friendly experience for embedding data into vector space.
By using FastEmbed, you can ensure that your embedding generation process is not only fast and efficient but also highly accurate, meeting the needs of various machine learning and natural language processing applications.
FastEmbed easily integrates with Qdrant for a variety of multimodal search purposes.
## Using FastEmbed
| Type | Guide | What you'll learn |
|--------------|----------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| **Beginner** | [Generate Text Embeddings](/documentation/fastembed/fastembed-quickstart/index.md) | Install FastEmbed and generate dense text embeddings |
| | [Dense Embeddings + Qdrant](/documentation/fastembed/fastembed-semantic-search/index.md) | Generate and index dense embeddings for semantic similarity search |
| **Advanced** | [miniCOIL Sparse Embeddings + Qdrant](/documentation/fastembed/fastembed-minicoil/index.md) | Use Qdrant's sparse neural retriever for exact text search |
| | [SPLADE Sparse Embeddings + Qdrant](/documentation/fastembed/fastembed-splade/index.md) | Generate sparse neural embeddings for exact text search |
| | [ColBERT Multivector Embeddings + Qdrant](/documentation/fastembed/fastembed-colbert/index.md) | Generate and index multi-vector representations; **ideal for rescoring, or small-scale retrieval** |
| | [Reranking with FastEmbed](/documentation/fastembed/fastembed-rerankers/index.md) | Re-rank top-K results using FastEmbed cross-encoders |
| | [Postprocessing](/documentation/fastembed/fastembed-postprocessing/index.md) | Apply postprocessing techniques to embeddings after generation |
## Why is FastEmbed useful?
- Light: Unlike other inference frameworks, such as PyTorch, FastEmbed requires very little external dependencies. Because it uses the ONNX runtime, it is perfect for serverless environments like AWS Lambda.
- Fast: By using ONNX, FastEmbed ensures high-performance inference across various hardware platforms.
- Accurate: FastEmbed aims for better accuracy and recall than models like OpenAI's `Ada-002`. It always uses model which demonstrate strong results on the MTEB leaderboard.
- Support: FastEmbed supports a wide range of models, including multilingual ones, to meet diverse use case needs.