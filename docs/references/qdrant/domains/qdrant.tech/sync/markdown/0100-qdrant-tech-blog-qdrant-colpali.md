Advanced Retrieval with ColPali & Qdrant Vector Database
0
# Advanced Retrieval with ColPali & Qdrant Vector Database
Sabrina Aquino
&#183;
November 05, 2024
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* Advanced Retrieval with ColPali & Qdrant Vector Database
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/qdrant-colpali/&amp;text=Advanced Retrieval with ColPali & Qdrant Vector Database>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/qdrant-colpali/)
|Time: 30 min|Level: Advanced|Notebook: [GitHub](https://github.com/qdrant/examples/blob/master/colpali-and-binary-quantization/colpali_demo_binary.ipynb)|
It’s no secret that even the most modern document retrieval systems have a hard time handling visually rich documents like **PDFs, containing tables, images, and complex layouts.**
ColPali introduces a multimodal retrieval approach that uses **Vision Language Models (VLMs)** instead of the traditional OCR and text-based extraction.
By processing document images directly, it creates **multi-vector embeddings** from both the visual and textual content, capturing the document&rsquo;s structure and context more effectively. This method outperforms traditional techniques, as demonstrated by the [**Visual Document Retrieval Benchmark (ViDoRe)**](https://huggingface.co/vidore).
**Before we go any deeper, watch our short video:**
## Standard Retrieval vs ColPali
The standard approach starts by running **Optical Character Recognition (OCR)** to extract the text from a document. Once the text is extracted, a layout detection model interprets the structure, which is followed by chunking the text into smaller sections for embedding. This method works adequately for documents where the text content is the primary focus.
Imagine you have a PDF packed with complex layouts, tables, and images, and you need to extract meaningful information efficiently. Traditionally, this would involve several steps:
1. **Text Extraction:** Using OCR to pull words from each page.
2. **Layout Detection:** Identifying page elements like tables, paragraphs, and titles.
3. **Chunking:** Experimenting with methods to determine the best fit for your use case.
4. **Embedding Creation:** Finally generating and storing the embeddings.### Why is ColPali Better?
This entire process can require too many steps, especially for complex documents, with each page often taking over seven seconds to process. For text-heavy documents, this approach might suffice, but real-world data is often rich and complex, making traditional extraction methods less effective.
This is where ColPali comes into play. **ColPali, or Contextualized Late Interaction Over PaliGemma**, uses a vision language model (VLM) to simplify and enhance the document retrieval process.
Instead of relying on text-only methods, ColPali generates contextualized **multivector embeddings** directly from an image of a document page. The VLM considers visual elements, structure, and text all at once, creating a holistic representation of each page.
## How ColPali Works Under the Hood
Rather than relying on OCR, ColPali **processes the entire document as an image** using a Vision Encoder. It creates multi-vector embeddings that capture both the textual content and the visual structure of the document which are then passed through a Large Language Model (LLM), which integrates the information into a representation that retains both text and visual features.
Here’s a step-by-step look at the ColPali architecture and how it enhances document retrieval:
1. **Image Preprocessing:** The input image is divided into a 32x32 grid, resulting in 1,024 patches.
2. **Contextual Transformation:** Each patch undergoes transformations to capture local and global context and is represented by a 128-dimensional vector.
3. **Query Processing:** When a text query is sent, ColPali generates token-level embeddings for the query, comparing it with document patches using a similarity matrix (specifically MaxSim).
4. **MaxSim Similarity:** This similarity matrix computes similarities for each query token in every document patch, selecting maximum similarities to efficiently retrieve relevant pages. This late interaction approach helps ColPali capture intricate context across a document’s structure and text.
> ColPali’s late interaction strategy is inspired by ColBERT and improves search by analyzing layout and textual content in a single pass.
## Optimizing with Binary Quantization
Binary Quantization further enhances the ColPali pipeline by **reducing storage and computational load** without compromising search performance. Binary Quantization, unlike Scalar Quantization, compresses vectors more aggressively, which can speed up search times and reduce memory usage.
In an experiment based on a [**blog post by Daniel Van Strien**](https://danielvanstrien.xyz/posts/post-with-code/colpali-qdrant/2024-10-02_using_colpali_with_qdrant.html), where ColPali and Qdrant were used to search a UFO document dataset, the results were compelling. By using Binary Quantization along with rescoring and oversampling techniques, we saw search time reduced by nearly half compared to Scalar Quantization, while maintaining similar accuracy.
## Using ColPali with Qdrant
**Now it&rsquo;s time to try the code.**</br>Here’s a simplified Notebook to test ColPali for yourself:
[](https://colab.research.google.com/github/sabrinaaquino/colpali-qdrant-demo/blob/main/colpali_demo_binary.ipynb)
Our goal is to go through a dataset of multilingual newspaper articles like the ones below. We will detect which images contain text about **UFO&rsquo;s** and **Top Secret** events.
*The full dataset is accessible from the notebook.*
### Procedure
1. **Setup ColPali and Qdrant:** Import the necessary libraries, including a fine-tuned model optimized for your dataset (in this case, a UFO document set).
2. **Dataset Preparation:** Load your document images into ColPali, previewing complex images to appreciate the challenge for traditional retrieval methods.
3. **Qdrant Configuration:** Define your Qdrant collection, setting vector dimensions to 128. Enable Binary Quantization to optimize memory usage.
4. **Batch Uploading Vectors:** Use a retry checkpoint to handle any exceptions during indexing. Batch processing allows you to adjust batch size based on available GPU resources.
5. **Query Processing and Search:** Encode queries as multivectors for Qdrant. Set up rescoring and oversampling to fine-tune accuracy while optimizing speed.### Results
> Success! Tests shows that search time is 2x faster than with Scalar Quantization.
This is significantly faster than with Scalar Quantization, and we still retrieved the top document matches with remarkable accuracy.
However, keep in mind that this is just a quick experiment. Performance may vary, so it&rsquo;s important to test Binary Quantization on your own datasets to see how it performs for your specific use case.
That said, it&rsquo;s promising to see Binary Quantization maintaining search quality while potentially offering performance improvements with ColPali.
## Future Directions with ColPali
ColPali offers a promising, streamlined approach to document retrieval, especially for visually rich, complex documents. Its integration with Qdrant enables efficient large-scale vector storage and retrieval, ideal for machine learning applications requiring sophisticated document understanding.
If you’re interested in trying ColPali on your own datasets, join our [**vector search community on Discord**](https://qdrant.to/discord) for discussions, tutorials, and more insights into advanced document retrieval methods. Let us know in how you’re using ColPali or what applications you envision for it!
Thank you for reading, and stay tuned for more insights on vector search!
**References:**
[1] Faysse, M., Sibille, H., Wu, T., Omrani, B., Viaud, G., Hudelot, C., Colombo, P. (2024). **ColPali: Efficient Document Retrieval with Vision Language Models.** arXiv. [https://doi.org/10.48550/arXiv.2407.01449](https://doi.org/10.48550/arXiv.2407.01449)
[2] van Strien, D. (2024). **Using ColPali with Qdrant to index and search a UFO document dataset.** Published October 2, 2024. Blog post: [https://danielvanstrien.xyz/posts/post-with-code/colpali-qdrant/2024-10-02\_using\_colpali\_with\_qdrant.html](https://danielvanstrien.xyz/posts/post-with-code/colpali-qdrant/2024-10-02_using_colpali_with_qdrant.html)
[3] Kacper Łukawski (2024). **Any Embedding Model Can Become a Late Interaction Model&mldr; If You Give It a Chance!** Qdrant Blog, August 14, 2024. Available at: [https://qdrant.tech/articles/late-interaction-models/](https://qdrant.tech/articles/late-interaction-models/)
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!