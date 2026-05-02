Apify - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Platforms](https://qdrant.tech/documentation/platforms/)
*
* Apify# Apify
[Apify](https://apify.com/) is a web scraping and browser automation platform featuring an [app store](https://apify.com/store) with over 1,500 pre-built micro-apps known as Actors. These serverless cloud programs, which are essentially dockers under the hood, are designed for various web automation applications, including data collection.
One such Actor, built especially for AI and RAG applications, is [Website Content Crawler](https://apify.com/apify/website-content-crawler).
It&rsquo;s ideal for this purpose because it has built-in HTML processing and data-cleaning functions. That means you can easily remove fluff, duplicates, and other things on a web page that aren&rsquo;t relevant, and provide only the necessary data to the language model.
The Markdown can then be used to feed Qdrant to train AI models or supply them with fresh web content.
Qdrant is available as an [official integration](https://apify.com/apify/qdrant-integration) to load Apify datasets into a collection.
You can refer to the [Apify documentation](https://docs.apify.com/platform/integrations/qdrant) to set up the integration via the Apify UI.
## Programmatic Usage
Apify also supports programmatic access to integrations via the [Apify Python SDK](https://docs.apify.com/sdk/python/).
1. Install the Apify Python SDK by running the following command:
```
`pip install apify-client
`
```
2. Create a Python script and import all the necessary modules:
```
`from apify\_client import ApifyClient
APIFY\_API\_TOKEN = "YOUR-APIFY-TOKEN"
OPENAI\_API\_KEY = "YOUR-OPENAI-API-KEY"
# COHERE\_API\_KEY = "YOUR-COHERE-API-KEY"
QDRANT\_URL = "YOUR-QDRANT-URL"
QDRANT\_API\_KEY = "YOUR-QDRANT-API-KEY"
client = ApifyClient(APIFY\_API\_TOKEN)
`
```
3. Call the [Website Content Crawler](https://apify.com/apify/website-content-crawler) Actor to crawl the Qdrant documentation and extract text content from the web pages:
```
`actor\_call = client.actor("apify/website-content-crawler").call(
run\_input={"startUrls": [{"url": "https://qdrant.tech/documentation/"}]}
)
`
```
4. Call the Qdrant integration and store all data in the Qdrant Vector Database:
```
`qdrant\_integration\_inputs = {
"qdrantUrl": QDRANT\_URL,
"qdrantApiKey": QDRANT\_API\_KEY,
"qdrantCollectionName": "apify",
"qdrantAutoCreateCollection": True,
"datasetId": actor\_call["defaultDatasetId"],
"datasetFields": ["text"],
"enableDeltaUpdates": True,
"deltaUpdatesPrimaryDatasetFields": ["url"],
"expiredObjectDeletionPeriodDays": 30,
"embeddingsProvider": "OpenAI", # "Cohere"
"embeddingsApiKey": OPENAI\_API\_KEY,
"performChunking": True,
"chunkSize": 1000,
"chunkOverlap": 0,
}
actor\_call = client.actor("apify/qdrant-integration").call(run\_input=qdrant\_integration\_inputs)
`
```
Upon running the script, the data from [https://qdrant.tech/documentation/](https://qdrant.tech/documentation/) will be scraped, transformed into vector embeddings and stored in the Qdrant collection.
## Further Reading
* Apify [Documentation](https://docs.apify.com/)
* Apify [Templates](https://apify.com/templates)
* Integration [Source Code](https://github.com/apify/actor-vector-database-integrations)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/platforms/apify.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/platforms/apify/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/platforms/apify.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)