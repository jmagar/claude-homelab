Cheshire Cat - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Frameworks](https://qdrant.tech/documentation/frameworks/)
*
* Cheshire Cat# Cheshire Cat
[Cheshire Cat](https://cheshirecat.ai/) is an open-source framework that allows you to develop intelligent agents on top of many Large Language Models (LLM). You can develop your custom AI architecture to assist you in a wide range of tasks.
## Cheshire Cat and Qdrant
Cheshire Cat uses Qdrant as the default [Vector Memory](https://cheshire-cat-ai.github.io/docs/faq/llm-concepts/vector-memory/) for ingesting and retrieving documents.
```
`# Decide host and port for your Cat. Default will be localhost:1865
CORE\_HOST=localhost
CORE\_PORT=1865
# Qdrant server
# QDRANT\_HOST=localhost
# QDRANT\_PORT=6333
`
```
Cheshire Cat takes great advantage of the following features of Qdrant:
* [Collection Aliases](https://qdrant.tech/documentation/manage-data/collections/#collection-aliases) to manage the change from one embedder to another.
* [Quantization](https://qdrant.tech/documentation/manage-data/quantization/) to obtain a good balance between speed, memory usage and quality of the results.
* [Snapshots](https://qdrant.tech/documentation/snapshots/) to not miss any information.
* [Community](https://discord.com/invite/tdtYvXjC4h)
## How to use the Cheshire Cat
### Requirements
To run the Cheshire Cat, you need to have [Docker](https://docs.docker.com/engine/install/) and [docker-compose](https://docs.docker.com/compose/install/) already installed on your system.
```
`docker run --rm -it -p 1865:80 ghcr.io/cheshire-cat-ai/core:latest
`
```
* Chat with the Cheshire Cat on [localhost:1865/admin](http://localhost:1865/admin).
* You can also interact via REST API and try out the endpoints on [localhost:1865/docs](http://localhost:1865/docs)
Check the [instructions on github](https://github.com/cheshire-cat-ai/core/blob/main/README.md) for a more comprehensive quick start.
### First configuration of the LLM
* Open the Admin Portal in your browser at [localhost:1865/admin](http://localhost:1865/admin).
* Configure the LLM in the `Settings` tab.
* If you don&rsquo;t explicitly choose it using `Settings` tab, the Embedder follows the LLM.## Next steps
For more information, refer to the Cheshire Cat [documentation](https://cheshire-cat-ai.github.io/docs/) and [blog](https://cheshirecat.ai/blog/).
* [Getting started](https://cheshirecat.ai/hello-world/)
* [How the Cat works](https://cheshirecat.ai/how-the-cat-works/)
* [Write Your First Plugin](https://cheshirecat.ai/write-your-first-plugin/)
* [Cheshire Cat&rsquo;s use of Qdrant - Vector Space](https://cheshirecat.ai/dont-get-lost-in-vector-space/)
* [Cheshire Cat&rsquo;s use of Qdrant - Aliases](https://cheshirecat.ai/the-drunken-cat-effect/)
* [Cheshire Cat&rsquo;s use of Qdrant - Quantization](https://cheshirecat.ai/gentle-introduction-to-cheshire-cat-vector-search/)
* [Cheshire Cat at Qdrant vector Space Talks](https://qdrant.tech/blog/meow-with-cheshire-cat/)
* [Discord Community](https://discord.com/invite/bHX5sNFCYU)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/cheshire-cat.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/frameworks/cheshire-cat/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/frameworks/cheshire-cat.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)