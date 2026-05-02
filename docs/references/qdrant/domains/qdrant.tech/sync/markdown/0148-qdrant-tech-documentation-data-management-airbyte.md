Airbyte - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Data Management](https://qdrant.tech/documentation/data-management/)
*
* Airbyte# Airbyte
[Airbyte](https://airbyte.com/) is an open-source data integration platform that helps you replicate your data
between different systems. It has a [growing list of connectors](https://docs.airbyte.io/integrations) that can
be used to ingest data from multiple sources. Building data pipelines is also crucial for managing the data in
Qdrant, and Airbyte is a great tool for this purpose.
Airbyte may take care of the data ingestion from a selected source, while Qdrant will help you to build a search
engine on top of it. There are three supported modes of how the data can be ingested into Qdrant:
* **Full Refresh Sync**
* **Incremental - Append Sync**
* **Incremental - Append + Deduped**
You can read more about these modes in the [Airbyte documentation](https://docs.airbyte.io/integrations/destinations/qdrant).
## Prerequisites
Before you start, make sure you have the following:
1. Airbyte instance, either [Open Source](https://airbyte.com/solutions/airbyte-open-source),
[Self-Managed](https://airbyte.com/solutions/airbyte-enterprise), or [Cloud](https://airbyte.com/solutions/airbyte-cloud).
2. Running instance of Qdrant. It has to be accessible by URL from the machine where Airbyte is running.
You can follow the [installation guide](https://qdrant.tech/documentation/installation/) to set up Qdrant.## Setting up Qdrant as a destination
Once you have a running instance of Airbyte, you can set up Qdrant as a destination directly in the UI.
Airbyte&rsquo;s Qdrant destination is connected with a single collection in Qdrant.
### Text processing
Airbyte has some built-in mechanisms to transform your texts into embeddings. You can choose how you want to
chunk your fields into pieces before calculating the embeddings, but also which fields should be used to
create the point payload.
### Embeddings
You can choose the model that will be used to calculate the embeddings. Currently, Airbyte supports multiple
models, including OpenAI and Cohere.
Using some precomputed embeddings from your data source is also possible. In this case, you can pass the field
name containing the embeddings and their dimensionality.
### Qdrant connection details
Finally, we can configure the target Qdrant instance and collection. In case you use the built-in authentication
mechanism, here is where you can pass the token.
Once you confirm creating the destination, Airbyte will test if a specified Qdrant cluster is accessible and
might be used as a destination.
## Setting up connection
Airbyte combines sources and destinations into a single entity called a connection. Once you have a destination
configured and a source, you can create a connection between them. It doesn&rsquo;t matter what source you use, as
long as Airbyte supports it. The process is pretty straightforward, but depends on the source you use.
## Further Reading
* [Airbyte documentation](https://docs.airbyte.com/understanding-airbyte/connections/).
* [Source Code](https://github.com/airbytehq/airbyte/tree/master/airbyte-integrations/connectors/destination-qdrant)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/data-management/airbyte.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/data-management/airbyte/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/data-management/airbyte.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)