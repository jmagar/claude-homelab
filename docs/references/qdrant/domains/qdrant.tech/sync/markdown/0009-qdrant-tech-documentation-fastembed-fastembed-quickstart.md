Quickstart - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [FastEmbed](https://qdrant.tech/documentation/fastembed/)
*
* Quickstart# How to Generate Text Embedings with FastEmbed
## Install FastEmbed
```
`pip install fastembed
`
```
Just for demo purposes, you will use Lists and NumPy to work with sample data.
```
`from typing import List
import numpy as np
`
```
## Load default model
In this example, you will use the default text embedding model, `BAAI/bge-small-en-v1.5`.
```
`from fastembed import TextEmbedding
`
```
## Add sample data
Now, add two sample documents. Your documents must be in a list, and each document must be a string
```
`documents: List[str] = [
"FastEmbed is lighter than Transformers & Sentence-Transformers.",
"FastEmbed is supported by and maintained by Qdrant.",
]
`
```
Download and initialize the model. Print a message to verify the process.
```
`embedding\_model = TextEmbedding()
print("The model BAAI/bge-small-en-v1.5 is ready to use.")
`
```
## Embed data
Generate embeddings for both documents.
```
`embeddings\_generator = embedding\_model.embed(documents)
embeddings\_list = list(embeddings\_generator)
len(embeddings\_list[0])
`
```
Here is the sample document list. The default model creates vectors with 384 dimensions.
```
`Document: This is built to be faster and lighter than other embedding libraries e.g. Transformers, Sentence-Transformers, etc.
Vector of type: \<class 'numpy.ndarray'\> with shape: (384,)
Document: fastembed is supported by and maintained by Qdrant.
Vector of type: \<class 'numpy.ndarray'\> with shape: (384,)
`
```
## Visualize embeddings
```
`print("Embeddings:\\n", embeddings\_list)
`
```
The embeddings don&rsquo;t look too interesting, but here is a visual.
```
`Embeddings:
[[-0.11154681 0.00976555 0.00524559 0.01951888 -0.01934952 0.02943449
-0.10519084 -0.00890122 0.01831438 0.01486796 -0.05642502 0.02561352
-0.00120165 0.00637456 0.02633459 0.0089221 0.05313658 0.03955453
-0.04400245 -0.02929407 0.04691846 -0.02515868 0.00778646 -0.05410657
...
-0.00243012 -0.01820582 0.02938612 0.02108984 -0.02178085 0.02971899
-0.00790564 0.03561783 0.0652488 -0.04371546 -0.05550042 0.02651665
-0.01116153 -0.01682246 -0.05976734 -0.03143916 0.06522726 0.01801389
-0.02611006 0.01627177 -0.0368538 0.03968835 0.027597 0.03305927]]
`
```
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/fastembed/fastembed-quickstart.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/fastembed/fastembed-quickstart/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/fastembed/fastembed-quickstart.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)