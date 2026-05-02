What are Vector Embeddings? - Revolutionize Your Search Experience - Qdrant
* [Qdrant Articles](https://qdrant.tech/articles/)
*
* What are Vector Embeddings? - Revolutionize Your Search Experience
[
Back to
Vector Search Manuals](https://qdrant.tech/articles/vector-search-manuals/)# What are Vector Embeddings? - Revolutionize Your Search Experience
Sabrina Aquino
&#183;
February 06, 2024
**> Embeddings
**> are numerical machine learning representations of the semantic of the input data. They capture the meaning of complex, high-dimensional data, like text, images, or audio, into vectors. Enabling algorithms to process and analyze the data more efficiently.
You know when you’re scrolling through your social media feeds and the content just feels incredibly tailored to you? There&rsquo;s the news you care about, followed by a perfect tutorial with your favorite tech stack, and then a meme that makes you laugh so hard you snort.
Or what about how YouTube recommends videos you ended up loving. It’s by creators you&rsquo;ve never even heard of and you didn’t even send YouTube a note about your ideal content lineup.
This is the magic of embeddings.
These are the result of **deep learning models** analyzing the data of your interactions online. From your likes, shares, comments, searches, the kind of content you linger on, and even the content you decide to skip. It also allows the algorithm to predict future content that you are likely to appreciate.
The same embeddings can be repurposed for search, ads, and other features, creating a highly personalized user experience.
They make [high-dimensional](https://www.sciencedirect.com/topics/computer-science/high-dimensional-data) data more manageable. This reduces storage requirements, improves computational efficiency, and makes sense of a ton of **unstructured** data.
## Why use vector embeddings?
The **nuances** of natural language or the hidden **meaning** in large datasets of images, sounds, or user interactions are hard to fit into a table. Traditional relational databases can&rsquo;t efficiently query most types of data being currently used and produced, making the **retrieval** of this information very limited.
In the embeddings space, synonyms tend to appear in similar contexts and end up having similar embeddings. The space is a system smart enough to understand that &ldquo;pretty&rdquo; and &ldquo;attractive&rdquo; are playing for the same team. Without being explicitly told so.
That’s the magic.
At their core, vector embeddings are about semantics. They take the idea that &ldquo;a word is known by the company it keeps&rdquo; and apply it on a grand scale.
This capability is crucial for creating search systems, recommendation engines, retrieval augmented generation (RAG) and any application that benefits from a deep understanding of content.
## How do embeddings work?
Embeddings are created through neural networks. They capture complex relationships and semantics into [dense vectors](https://www1.se.cuhk.edu.hk/~seem5680/lecture/semantics-with-dense-vectors-2018.pdf) which are more suitable for machine learning and data processing applications. They can then project these vectors into a proper **high-dimensional** space, specifically, a [Vector Database](https://qdrant.tech/articles/what-is-a-vector-database/).
The meaning of a data point is implicitly defined by its **position** on the vector space. After the vectors are stored, we can use their spatial properties to perform [nearest neighbor searches](<https://en.wikipedia.org/wiki/Nearest_neighbor_search#:~:text=Nearest neighbor search (NNS),,the larger the function values.>). These searches retrieve semantically similar items based on how close they are in this space.
> The quality of the vector representations drives the performance. The embedding model that works best for you depends on your use case.
### Creating vector embeddings
Embeddings translate the complexities of human language to a format that computers can understand. It uses neural networks to assign **numerical values** to the input data, in a way that similar data has similar values.
For example, if I want to make my computer understand the word &lsquo;right&rsquo;, I can assign a number like 1.3. So when my computer sees 1.3, it sees the word &lsquo;right’.
Now I want to make my computer understand the context of the word ‘right’. I can use a two-dimensional vector, such as [1.3, 0.8], to represent &lsquo;right&rsquo;. The first number 1.3 still identifies the word &lsquo;right&rsquo;, but the second number 0.8 specifies the context.
We can introduce more dimensions to capture more nuances. For example, a third dimension could represent formality of the word, a fourth could indicate its emotional connotation (positive, neutral, negative), and so on.
The evolution of this concept led to the development of embedding models like [Word2Vec](https://en.wikipedia.org/wiki/Word2vec) and [GloVe](https://en.wikipedia.org/wiki/GloVe). They learn to understand the context in which words appear to generate high-dimensional vectors for each word, capturing far more complex properties.
However, these models still have limitations. They generate a single vector per word, based on its usage across texts. This means all the nuances of the word &ldquo;right&rdquo; are blended into one vector representation. That is not enough information for computers to fully understand the context.
So, how do we help computers grasp the nuances of language in different contexts? In other words, how do we differentiate between:
* &ldquo;your answer is right&rdquo;
* &ldquo;turn right at the corner&rdquo;
* &ldquo;everyone has the right to freedom of speech&rdquo;
Each of these sentences use the word &lsquo;right&rsquo;, with different meanings.
More advanced models like [BERT](https://en.wikipedia.org/wiki/BERT_(language_model)) and [GPT](https://en.wikipedia.org/wiki/Generative_pre-trained_transformer) use deep learning models based on the [transformer architecture](https://arxiv.org/abs/1706.03762), which helps computers consider the full context of a word. These models pay attention to the entire context. The model understands the specific use of a word in its **surroundings**, and then creates different embeddings for each.
But how does this process of understanding and interpreting work in practice? Think of the term: &ldquo;biophilic design&rdquo;, for example. To generate its embedding, the transformer architecture can use the following contexts:
* &ldquo;Biophilic design incorporates natural elements into architectural planning.&rdquo;
* &ldquo;Offices with biophilic design elements report higher employee well-being.&rdquo;
* &ldquo;&mldr;plant life, natural light, and water features are key aspects of biophilic design.&rdquo;
And then it compares contexts to known architectural and design principles:
* &ldquo;Sustainable designs prioritize environmental harmony.&rdquo;
* &ldquo;Ergonomic spaces enhance user comfort and health.&rdquo;
The model creates a vector embedding for &ldquo;biophilic design&rdquo; that encapsulates the concept of integrating natural elements into man-made environments. Augmented with attributes that highlight the correlation between this integration and its positive impact on health, well-being, and environmental sustainability.
### Integration with embedding APIs
Selecting the right embedding model for your use case is crucial to your application performance. Qdrant makes it easier by offering seamless integration with the best selection of embedding APIs, including [Cohere](https://qdrant.tech/documentation/embeddings/cohere/), [Gemini](https://qdrant.tech/documentation/embeddings/gemini/), [Jina Embeddings](https://qdrant.tech/documentation/embeddings/jina-embeddings/), [OpenAI](https://qdrant.tech/documentation/embeddings/openai/), [Aleph Alpha](https://qdrant.tech/documentation/embeddings/aleph-alpha/), [Fastembed](https://github.com/qdrant/fastembed), and [AWS Bedrock](https://qdrant.tech/documentation/embeddings/bedrock/).
If you’re looking for NLP and rapid prototyping, including language translation, question-answering, and text generation, OpenAI is a great choice. Gemini is ideal for image search, duplicate detection, and clustering tasks.
Fastembed, which we’ll use on the example below, is designed for efficiency and speed, great for applications needing low-latency responses, such as autocomplete and instant content recommendations.
We plan to go deeper into selecting the best model based on performance, cost, integration ease, and scalability in a future post.
## Create a neural search service with Fastmbed
Now that you’re familiar with the core concepts around vector embeddings, how about start building your own [Neural Search Service](https://qdrant.tech/documentation/tutorials-search-engineering/neural-search/)?
Tutorial guides you through a practical application of how to use Qdrant for document management based on descriptions of companies from [startups-list.com](https://www.startups-list.com/). From embedding data, integrating it with Qdrant&rsquo;s vector database, constructing a search API, and finally deploying your solution with FastAPI.
Check out what the final version of this project looks like on the [live online demo](https://qdrant.to/semantic-search-demo).
Let us know what you’re building with embeddings! Join our [Discord](https://discord.gg/qdrant-907569970500743200) community and share your projects!
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/what-are-embeddings.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/articles/what-are-embeddings/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/what-are-embeddings.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)