Neo4j GraphRAG - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Frameworks](https://qdrant.tech/documentation/frameworks/)
*
* Neo4j GraphRAG# Neo4j GraphRAG
[Neo4j GraphRAG](https://neo4j.com/docs/neo4j-graphrag-python/current/) is a Python package to build graph retrieval augmented generation (GraphRAG) applications using Neo4j and Python. As a first-party library, it offers a robust, feature-rich, and high-performance solution, with the added assurance of long-term support and maintenance directly from Neo4j. It offers a Qdrant retriever natively to search for vectors stored in a Qdrant collection.
## Installation
```
`pip install neo4j-graphrag[qdrant]
`
```
## Usage
A vector query with Neo4j and Qdrant could look like:
```
`from neo4j import GraphDatabase
from neo4j\_graphrag.retrievers import QdrantNeo4jRetriever
from qdrant\_client import QdrantClient
from examples.embedding\_biology import EMBEDDING\_BIOLOGY
NEO4J\_URL = "neo4j://localhost:7687"
NEO4J\_AUTH = ("neo4j", "password")
with GraphDatabase.driver(NEO4J\_URL, auth=NEO4J\_AUTH) as neo4j\_driver:
retriever = QdrantNeo4jRetriever(
driver=neo4j\_driver,
client=QdrantClient(url="http://localhost:6333"),
collection\_name="{collection\_name}",
id\_property\_external="neo4j\_id",
id\_property\_neo4j="id",
)
retriever.search(query\_vector=[0.5523, 0.523, 0.132, 0.523, ...], top\_k=5)
`
```
Alternatively, you can use any [Langchain embeddings providers](https://python.langchain.com/docs/integrations/text_embedding/), to vectorize text queries automatically.
```
`from langchain\_huggingface.embeddings import HuggingFaceEmbeddings
from neo4j import GraphDatabase
from neo4j\_graphrag.retrievers import QdrantNeo4jRetriever
from qdrant\_client import QdrantClient
NEO4J\_URL = "neo4j://localhost:7687"
NEO4J\_AUTH = ("neo4j", "password")
with GraphDatabase.driver(NEO4J\_URL, auth=NEO4J\_AUTH) as neo4j\_driver:
embedder = HuggingFaceEmbeddings(model\_name="all-MiniLM-L6-v2")
retriever = QdrantNeo4jRetriever(
driver=neo4j\_driver,
client=QdrantClient(url="http://localhost:6333"),
collection\_name="{collection\_name}",
id\_property\_external="neo4j\_id",
id\_property\_neo4j="id",
embedder=embedder,
)
retriever.search(query\_text="my user query", top\_k=10)
`
```
## Further Reading
* [Neo4j GraphRAG Reference](https://neo4j.com/docs/neo4j-graphrag-python/current/index.html)
* [Qdrant Retriever Reference](https://neo4j.com/docs/neo4j-graphrag-python/current/user_guide_rag.html#qdrant-neo4j-retriever-user-guide)
* [Source](https://github.com/neo4j/neo4j-graphrag-python/tree/main/src/neo4j_graphrag/retrievers/external/qdrant)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/neo4j-graphrag.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/frameworks/neo4j-graphrag/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/neo4j-graphrag.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)