Multivector Document Retrieval - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Search Engineering](https://qdrant.tech/documentation/tutorials-search-engineering/)
*
* Multivector Document Retrieval# Qdrant Multivector Document Retrieval with ColPali/ColQwen
|Time: 30 min|Level: Intermediate|Output: [GitHub](https://github.com/qdrant/examples/blob/master/pdf-retrieval-at-scale/ColPali_ColQwen2_Tutorial.ipynb)|[](https://githubtocolab.com/qdrant/examples/blob/master/pdf-retrieval-at-scale/ColPali_ColQwen2_Tutorial.ipynb)|
Efficient PDF documents retrieval is a common requirement in tasks like **(agentic) retrieval-augmented generation (RAG)** and many other search-based applications. At the same time, setting up PDF documents retrieval is rarely possible without additional challenges.
Many traditional PDF retrieval solutions rely on **optical character recognition (OCR)** together with use case-specific heuristics to handle visually complex elements like tables, images and charts. These algorithms are often non-transferable &ndash; even within the same domain &ndash; with their task-customized parsing and chunking strategies, labor-intensive, prone to errors, and difficult to scale.
Recent advancements in **Vision Large Language Models (VLLMs)**, such as [**ColPali**](https://huggingface.co/blog/manu/colpali) and its successor [**ColQwen**](https://huggingface.co/vidore/colqwen2-v0.1), started the transformation of the PDF retrieval. These multimodal models work directly with PDF pages as inputs, no pre-processing required. Anything that can be converted into an **image** (think of PDFs as screenshots of document pages) can be effectively processed by these models. Being far simpler in use, VLLMs achieve state-of-the-art performance in PDF retrieval benchmarks like the [Visual Document Retrieval (ViDoRe) Benchmark](https://huggingface.co/spaces/vidore/vidore-leaderboard).
## How VLLMs Work for PDF Retrieval
VLLMs like **ColPali** and **ColQwen** generate **multivector representations** for each PDF page; the representations are stored and indexed in a vector database. During the retrieval process, models dynamically create multivector representations for (textual) user queries, and precise retrieval &ndash; matching between PDF pages and queries &ndash; is achieved through [late-interaction mechanism](https://qdrant.tech/blog/qdrant-colpali/#how-colpali-works-under-the-hood).
Qdrant supports [multivector representations](https://qdrant.tech/documentation/manage-data/vectors/#multivectors), making it well-suited for using embedding models such as ColPali, ColQwen, or [ColBERT](https://qdrant.tech/documentation/fastembed/fastembed-colbert/)## Challenges of Scaling VLLMs
The heavy multivector representations produced by VLLMs make PDF retrieval at scale computationally intensive. These models are inefficient for large-scale PDF retrieval tasks if used without optimization.
### Math Behind the Scaling
**ColPali** generates over **1,000 vectors per PDF page**, while its successor, **ColQwen**, generates slightly fewer — up to **768 vectors**, dynamically adjusted based on the image size. Typically, ColQwen produces **\~700 vectors per page**.
To understand the impact, consider the construction of an [**HNSW index**](https://qdrant.tech/articles/what-is-a-vector-database/#1-indexing-hnsw-index-and-sending-data-to-qdrant), a common indexing algorithm for vector databases. Let&rsquo;s roughly estimate the number of comparisons needed to insert a new PDF page into the index.
* **Vectors per page:** \~700 (ColQwen) or \~1,000 (ColPali)
* **[ef\_construct](https://qdrant.tech/documentation/manage-data/indexing/#vector-index):** 100 (default)
The lower bound estimation for the number of vector comparisons would be:
$$
700 \\times 700 \\times 100 = 49 \\ \\text{millions}
$$
Now imagine how much it will take to build an index on **20,000 pages**!
For ColPali, this number doubles. The result is **extremely slow index construction time**.
### Our Solution
We recommend reducing the number of vectors in a PDF page representation for the **first-stage retrieval**. After the first stage retrieval with a reduced amount of vectors, we propose to **rerank** retrieved subset with the original uncompressed representation.
You might consider using **quantization** (e.g., binary quantization) to reduce computational resources. However, as you can see above, quantization does not impact the parameters that determine the number of comparisons, so it will only affect memory consumption.
The reduction of vectors can be achieved by applying a **mean pooling operation** to the multivector VLLM-generated outputs. Mean pooling averages the values across all vectors within a selected subgroup, condensing multiple vectors into a single representative vector. If done right, it allows the preservation of important information from the original page while significantly reducing the number of vectors.
VLLMs generate vectors corresponding to patches that represent different portions of a PDF page. These patches can be grouped in columns and rows of a PDF page.
For example:
* ColPali divides PDF page into **1,024 patches**.
* Applying mean pooling by rows (or columns) of this patch matrix reduces the page representation to just **32 vectors**.
We tested this approach with the ColPali model, mean pooling its multivectors by PDF page rows. The results showed:
* **Indexing time faster by an order of magnitude**
* **Retrieval quality comparable to the original model**
For details of this experiment refer to our [gitHub repository](https://github.com/qdrant/demo-colpali-optimized), [ColPali optimization blog post](https://qdrant.tech/blog/colpali-qdrant-optimization/) or [webinar &ldquo;PDF Retrieval at Scale&rdquo;](https://www.youtube.com/watch?v=_h6SN1WwnLs)
## Goal of This Tutorial
In this tutorial, we will demonstrate a scalable approach to PDF retrieval using **Qdrant** and **ColPali** & **ColQwen2** VLLMs.
The presented approach is **highly recommended** to avoid the common pitfalls of long indexing times and slow retrieval speeds.
In the following sections, we will demonstrate an optimized retrieval algorithm born out of our successful experimentation:
**First-Stage Retrieval with Mean-Pooled Vectors:**
* Construct an HNSW index using **only mean-pooled vectors**.
* Use them for the first-stage retrieval.
**Reranking with Original Model Multivectors:**
* Use the original multivectors from ColPali or ColQwen2 **to rerank** the results retrieved in the first stage.## Setup
Install & import required libraries
```
`# pip install colpali\_engine\>=0.3.1
from colpali\_engine.models import ColPali, ColPaliProcessor
# pip install qdrant-client\>=1.12.0
from qdrant\_client import QdrantClient, models
`
```
To run these experiments, we’re using a **Qdrant cluster**. If you’re just getting started, you can set up a **free-tier cluster** for testing and exploration. Follow the instructions in the documentation [&ldquo;How to Create a Free-Tier Qdrant Cluster&rdquo;](https://qdrant.tech/documentation/cloud/create-cluster/#free-clusters)
```
`client = QdrantClient(
url=\<YOUR CLUSTER URL\>,
api\_key=\<YOUR API KEY\>
)
`
```
Download **ColPali** model along with its input processors. Make sure to select the backend that suits your setup.
```
`colpali\_model = ColPali.from\_pretrained(
"vidore/colpali-v1.3",
torch\_dtype=torch.bfloat16,
device\_map="mps", # Use "cuda:0" for GPU, "cpu" for CPU, or "mps" for Apple Silicon
).eval()
colpali\_processor = ColPaliProcessor.from\_pretrained("vidore/colpali-v1.3")
`
```
For **ColQwen** model
```
`from colpali\_engine.models import ColQwen2, ColQwen2Processor
colqwen\_model = ColQwen2.from\_pretrained(
"vidore/colqwen2-v0.1",
torch\_dtype=torch.bfloat16,
device\_map="mps", # Use "cuda:0" for GPU, "cpu" for CPU, or "mps" for Apple Silicon
).eval()
colqwen\_processor = ColQwen2Processor.from\_pretrained("vidore/colqwen2-v0.1")
`
```
## Create Qdrant Collections
We can now create a collection in Qdrant to store the multivector representations of PDF pages generated by **ColPali** or **ColQwen**.
Collection will include **mean pooled** by rows and columns representations of a PDF page, as well as the **original** multivector representation.
For the original multivectors generated by the models, we will disable HNSW index construction
```
`client.create\_collection(
collection\_name=collection\_name,
vectors\_config={
"original":
models.VectorParams( #switch off HNSW
size=128,
distance=models.Distance.COSINE,
multivector\_config=models.MultiVectorConfig(
comparator=models.MultiVectorComparator.MAX\_SIM
),
hnsw\_config=models.HnswConfigDiff(
m=0 #switching off HNSW
)
),
"mean\_pooling\_columns": models.VectorParams(
size=128,
distance=models.Distance.COSINE,
multivector\_config=models.MultiVectorConfig(
comparator=models.MultiVectorComparator.MAX\_SIM
)
),
"mean\_pooling\_rows": models.VectorParams(
size=128,
distance=models.Distance.COSINE,
multivector\_config=models.MultiVectorConfig(
comparator=models.MultiVectorComparator.MAX\_SIM
)
)
}
)
`
```
## Choose a dataset
We’ll use the **UFO Dataset** by Daniel van Strien for this tutorial. It’s available on Hugging Face; you can download it directly from there.
```
`from datasets import load\_dataset
ufo\_dataset = "davanstrien/ufo-ColPali"
dataset = load\_dataset(ufo\_dataset, split="train")
`
```
## Embedding and Mean Pooling
We&rsquo;ll use a function that generates multivector representations and their mean pooled versions of each PDF page (aka image) in batches.
For complete understanding, it&rsquo;s important to consider the following specifics of **ColPali** and **ColQwen**:
**ColPali:**
In theory, ColPali is designed to generate 1,024 vectors per PDF page, but in practice, it produces 1,030 vectors. This discrepancy is due to ColPali&rsquo;s pre-processor, which appends the text `\<bos\>Describe the image.` to each input. This additional text generates an extra 6 multivectors.
**ColQwen:**
ColQwen dynamically determines the number of patches in &ldquo;rows and columns&rdquo; of a PDF page based on its size. Consequently, the number of multivectors can vary between inputs. ColQwen pre-processor prepends `\<|im\_start|\>user\<|vision\_start|\>` and appends `\<|vision\_end|\>Describe the image.\<|im\_end|\>\<|endoftext|\>`.
For example, that&rsquo;s how ColQwen multivector output is formed.
The `get\_patches` function is to get the number of `x\_patches` (rows) and `y\_patches` (columns) ColPali/ColQwen2 models will divide a PDF page into.
For ColPali, the numbers will always be 32 by 32; ColQwen will define them dynamically based on the PDF page size.
```
`x\_patches, y\_patches = model\_processor.get\_n\_patches(
image\_size,
patch\_size=model.patch\_size
)
`
```
For **ColQwen** model
```
`model\_processor.get\_n\_patches(
image\_size,
patch\_size=model.patch\_size,
spatial\_merge\_size=model.spatial\_merge\_size
)
`
```
We choose to **preserve prefix and postfix multivectors**. Our **pooling** operation compresses the multivectors representing **the image tokens** based on the number of rows and columns determined by the model (static 32x32 for ColPali, dynamic XxY for ColQwen). Function retains and integrates the additional multivectors produced by the model back to pooled representations.
Simplified version of pooling for **ColPali** model:
(see the full version &ndash; also applicable for **ColQwen** &ndash; in the [tutorial notebook](https://githubtocolab.com/qdrant/examples/blob/master/pdf-retrieval-at-scale/ColPali_ColQwen2_Tutorial.ipynb))
```
`
processed\_images = model\_processor.process\_images(image\_batch)
# Image embeddings of shape (batch\_size, 1030, 128)
image\_embeddings = model(\*\*processed\_images)
# (1030, 128)
image\_embedding = image\_embeddings[0] # take the first element of the batch
# Now we need to identify vectors that correspond to the image tokens
# It can be done by selecting tokens corresponding to special `image\_token\_id`
# (1030, ) - boolean mask (for the first element in the batch), True for image tokens
mask = processed\_images.input\_ids[0] == model\_processor.image\_token\_id
# For convenience, we now select only image tokens
# and reshape them to (x\_patches, y\_patches, dim)
# (x\_patches, y\_patches, 128)
image\_patch\_embeddings = image\_embedding[mask].view(x\_patches, y\_patches, model.dim)
# Now we can apply mean pooling by rows and columns
# (x\_patches, 128)
pooled\_by\_rows = image\_patch\_embeddings.mean(dim=0)
# (y\_patches, 128)
pooled\_by\_columns = image\_patch\_embeddings.mean(dim=1)
# [Optionally] we can also concatenate special tokens to the pooled representations,
# For ColPali, it's only postfix
# (x\_patches + 6, 128)
pooled\_by\_rows = torch.cat([pooled\_by\_rows, image\_embedding[\~mask]])
# (y\_patches + 6, 128)
pooled\_by\_columns = torch.cat([pooled\_by\_columns, image\_embedding[\~mask]])
`
```
</details>## Upload to Qdrant
The upload process is trivial; the only thing to pay attention to is the compute cost for ColPali and ColQwen2 models.
In low-resource environments, it&rsquo;s recommended to use a smaller batch size for embedding and mean pooling.
Full version of the upload code is available in the [tutorial notebook](https://githubtocolab.com/qdrant/examples/blob/master/pdf-retrieval-at-scale/ColPali_ColQwen2_Tutorial.ipynb)
## Querying PDFs
After indexing PDF documents, we can move on to querying them using our two-stage retrieval approach.
```
`query = "Lee Harvey Oswald's involvement in the JFK assassination"
processed\_queries = model\_processor.process\_queries([query]).to(model.device)
# Resulting query embedding is a tensor of shape (22, 128)
query\_embedding = model(\*\*processed\_queries)[0]
`
```
Now let&rsquo;s design a function for the two-stage retrieval with multivectors produced by VLLMs:
* **Step 1:** Prefetch results using a compressed multivector representation & HNSW index.
* **Step 2:** Re-rank the prefetched results using the original multivector representation.
Let&rsquo;s query our collections using combined mean pooled representations for the first stage of retrieval.
```
`# Final amount of results to return
search\_limit = 10
# Amount of results to prefetch for reranking
prefetch\_limit = 100
response = client.query\_points(
collection\_name=collection\_name,
query=query\_embedding,
prefetch=[
models.Prefetch(
query=query\_embedding,
limit=prefetch\_limit,
using="mean\_pooling\_columns"
),
models.Prefetch(
query=query\_embedding,
limit=prefetch\_limit,
using="mean\_pooling\_rows"
),
],
limit=search\_limit,
with\_payload=True,
with\_vector=False,
using="original"
)
`
```
And check the top retrieved result to our query *&ldquo;Lee Harvey Oswald&rsquo;s involvement in the JFK assassination&rdquo;*.
```
`dataset[response.points[0].payload['index']]['image']
`
```
## Conclusion
In this tutorial, we demonstrated an optimized approach using **Qdrant for PDF retrieval at scale** with VLLMs producing **heavy multivector representations** like **ColPali** and **ColQwen2**.
Without such optimization, the performance of retrieval systems can degrade severely, both in terms of indexing time and query latency, especially as the dataset size grows.
We **strongly recommend** implementing this approach in your workflows to ensure efficient and scalable PDF retrieval. Neglecting to optimize the retrieval process could result in unacceptably slow performance, hindering the usability of your system.
Start scaling your PDF retrieval today!
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/tutorials-search-engineering/pdf-retrieval-at-scale.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/tutorials-search-engineering/pdf-retrieval-at-scale/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/tutorials-search-engineering/pdf-retrieval-at-scale.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)