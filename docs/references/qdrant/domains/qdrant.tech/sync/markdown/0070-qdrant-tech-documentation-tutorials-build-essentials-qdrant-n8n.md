n8n Workflow Automation - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Essential Examples](https://qdrant.tech/documentation/tutorials-build-essentials/)
*
* n8n Workflow Automation# Automate Qdrant Workflows with n8n
|Time: 45 min|Level: Intermediate|
This tutorial shows how to combine Qdrant with [n8n](https://n8n.io/) low-code automation platform to cover **use cases beyond basic Retrieval-Augmented Generation (RAG)**. You&rsquo;ll learn how to use vector search for **recommendations** and **unstructured big data analysis**.
Since this tutorial was created, [an official Qdrant node for n8n](https://qdrant.tech/documentation/platforms/n8n/) has been released. It simplifies workflows and replaces the HTTP request nodes used in the examples below. Watch [a quick video introduction](https://youtu.be/sYP_kHWptHY) to it.## Setting Up Qdrant in n8n
To start using Qdrant with n8n, you need to provide your Qdrant instance credentials in the [credentials](https://docs.n8n.io/integrations/builtin/credentials/qdrant/#using-api-key) tab. Select `QdrantApi` from the list.
### Qdrant Cloud
To connect [Qdrant Cloud](https://qdrant.tech/documentation/cloud/) to n8n:
1. Open the [Cloud Dashboard](https://qdrant.to/cloud) and select a cluster.
2. From the **Cluster Details**, copy the `Endpoint` address—this will be used as the `Qdrant URL` in n8n.
3. Navigate to the **API Keys** tab and copy your API key—this will be the `API Key` in n8n.
For a walkthrough, see this [step-by-step video guide](https://youtu.be/fYMGpXyAsfQ?feature=shared&amp;t=177).
### Local Mode
For a fully local experimnets-driven setup, a valuable option is n8n&rsquo;s [Self-hosted AI Starter Kit](https://github.com/n8n-io/self-hosted-ai-starter-kit). This is an open-source Docker Compose template for local AI & low-code development environment.
This kit includes a [local instance of Qdrant](https://qdrant.tech/documentation/quickstart/). To get started:
1. Follow the instructions in the repository to install the AI Starter Kit.
2. Use the values from the `docker-compose.yml` file to fill in the connection details.Remember to update to the latest Qdrant Docker image using `docker-compose pull`.
The default Qdrant configuration in AI Starter Kit&rsquo;s `docker-compose.yml` looks like this:
```
`qdrant:
image: qdrant/qdrant
hostname: qdrant
container\_name: qdrant
networks: ['demo']
restart: unless-stopped
ports:
- 6333:6333
volumes:
- qdrant\_storage:/qdrant/storage
`
```
From this configuration, the `Qdrant URL` in n8n Qdrant credentials is `http://qdrant:6333/`.
To set up a local Qdrant API key, add the following lines to the YAML file:
```
`qdrant:
...
volumes:
- qdrant\_storage:/qdrant/storage
environment:
- QDRANT\_API\_KEY=test
`
```
After saving the configuration and running the Starter Kit, use `QDRANT\_API\_KEY` value (e.g., `test`) as the `API Key` and `http://qdrant:6333/` as the `Qdrant URL`.
## Qdrant + n8n Beyond Simple Similarity Search
Vector search&rsquo;s ability to determine semantic similarity between objects is often used to address models&rsquo; hallucinations, powering the memory of Retrieval-Augmented Generation-based applications. Yet there&rsquo;s more to vector search than just a &ldquo;knowledge base&rdquo; role.
The combination of similarity and dissimilarity metrics in vector space expands vector search to recommendations, discovery search, and large-scale unstructured data analysis.
### Recommendations
When searching for new music, films, books, or food, it can be difficult to articulate exactly what we want. Instead, we often rely on discovering new content through comparison to examples of what we like or dislike.
The [Qdrant Recommendation API](https://qdrant.tech/articles/new-recommendation-api/) is built to make these discovery searches possible by using positive and negative examples as anchors. It helps find new relevant results based on your preferences.
#### Movie Recommendations
Imagine a home cinema night—you&rsquo;ve already watched Harry Potter 666 times and crave a new series featuring young wizards. Your favorite streaming service repetitively recommends all seven parts of the millennial saga. Frustrated, you turn to n8n to create an **Agentic Movie Recommendation tool**.
**Setup:**
1. **Dataset**: We use movie descriptions from the [IMDB Top 1000 Kaggle dataset](https://www.kaggle.com/datasets/omarhanyy/imdb-top-1000).
2. **Embedding Model**: We&rsquo;ll use OpenAI `text-embedding-3-small`, but you can opt for any other suitable embedding model.
**Workflow:**
A [Template Agentic Movie Recommendation Workflow](https://n8n.io/workflows/2440-building-rag-chatbot-for-movie-recommendations-with-qdrant-and-open-ai/) consists of three parts:
1. **Movie Data Uploader**: Embeds movie descriptions and uploads them to Qdrant using the [Qdrant Vector Store Node](https://docs.n8n.io/integrations/builtin/cluster-nodes/root-nodes/n8n-nodes-langchain.vectorstoreqdrant) (now this can also be done using the [official Qdrant Node for n8n](https://github.com/qdrant/n8n-nodes-qdrant)). In the template workflow, the dataset is fetched from GitHub, but you can use any supported storage, for example [Google Cloud Storage node](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.googlecloudstorage).
2. **AI Agent**: Uses the [AI Agent Node](https://docs.n8n.io/integrations/builtin/cluster-nodes/root-nodes/n8n-nodes-langchain.agent) to formulate Recommendation API calls based on your natural language requests. Choose an LLM as a &ldquo;brain&rdquo; and define a [JSON schema](https://docs.n8n.io/integrations/builtin/cluster-nodes/sub-nodes/n8n-nodes-langchain.toolworkflow/#specify-input-schema) for the recommendations tool powered by Qdrant. This schema lets the LLM map your requests to the tool input format.
3. **Recommendations Tool**: A [subworkflow](https://docs.n8n.io/flow-logic/subworkflows/) that calls the Qdrant Recommendation API using the [HTTP Request Node](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.httprequest) (now this can also be done using the [official Qdrant Node for n8n](https://github.com/qdrant/n8n-nodes-qdrant)). The agent extracts relevant and irrelevant movie descriptions from your chat message and passes them to the tool. The tool embeds them with `text-embedding-3-small` and uses the Qdrant Recommendation API to get movie recommendations, which are passed back to the agent.
Set it up, run a chat and ask for &ldquo;*something about wizards but not Harry Potter*.&rdquo;
What results do you get?
If you&rsquo;d like a detailed walkthrough of building this workflow step-by-step, watch the video below:
This recommendation scenario is easily adaptable to any language or data type (images, audio, video).
### Big Data Analysis
The ability to map data to a vector space that reflects items&rsquo; similarity and dissimilarity relationships provides a range of mathematical tools for data analysis.
Vector search dedicated solutions are built to handle billions of data points and quickly compute distances between them, simplifying **clustering, classification, dissimilarity sampling, deduplication, interpolation**, and **anomaly detection at scale**.
The combination of this vector search feature with automation tools like n8n creates production-level solutions capable of monitoring data temporal shifts, managing data drift, and discovering patterns in seemingly unstructured data.
A practical example is worth a thousand words. Let&rsquo;s look at **Qdrant-based anomaly detection and classification tools**, which are designed to be used by the [n8n AI Agent node](https://docs.n8n.io/integrations/builtin/cluster-nodes/root-nodes/n8n-nodes-langchain.agent) for data analysis automation.
To make it more interesting, this time we&rsquo;ll focus on image data.
#### Anomaly Detection Tool
One definition of &ldquo;anomaly&rdquo; comes intuitively after projecting vector representations of data points into a 2D space—[Qdrant webUI](https://qdrant.tech/documentation/web-ui/) provides this functionality.
Points that don&rsquo;t belong to any clusters are more likely to be anomalous.
With that intuition comes the recipe for building an anomaly detection tool. We will demonstrate it on anomaly detection in agricultural crops. Qdrant will be used to:
1. Store vectorized images.
2. Identify a &ldquo;center&rdquo; (representative) for each crop cluster.
3. Define the borders of each cluster.
4. Check if new images fall within these boundaries. If an image does not fit within any cluster, it is flagged as anomalous. Alternatively, you can check if an image is anomalous to a specific cluster.
**Setup:**
1. **Dataset**: We use the [Agricultural Crops Image Classification dataset](https://www.kaggle.com/datasets/mdwaquarazam/agricultural-crops-image-classification).
2. **Embedding Model**: The [Voyage AI multimodal embedding model](https://docs.voyageai.com/docs/multimodal-embeddings). It can project images and text data into a shared vector space.
**1. Uploading Images to Qdrant**
Since the [Qdrant Vector Store node](https://docs.n8n.io/integrations/builtin/cluster-nodes/root-nodes/n8n-nodes-langchain.vectorstoreqdrant/) does not support embedding models outside the predefined list (which doesn&rsquo;t include Voyage AI), we embed and upload data to Qdrant via direct API calls in [HTTP Request nodes](https://docs.n8n.io/integrations/builtin/core-nodes/n8n-nodes-base.httprequest/).
With the release of the [official Qdrant node](https://github.com/qdrant/n8n-nodes-qdrant), which supports arbitrary vectorized input, the HTTP Request node can now be replaced with this native integration.
**Workflow:**
*There are three workflows: (1) Uploading images to Qdrant (2) Setting up cluster centers and thresholds (3) Anomaly detection tool itself.*
An [1/3 Uploading Images to Qdrant Template Workflow](https://n8n.io/workflows/2654-vector-database-as-a-big-data-analysis-tool-for-ai-agents-13-anomaly12-knn/) consists of the following blocks:
1. **Check Collection**: Verifies if a collection with the specified name exists in Qdrant. If not, it creates one.
2. **Payload Index**: Adds a [payload index](https://qdrant.tech/documentation/manage-data/indexing/#payload-index) on the `crop\_name` payload (metadata) field. This field stores crop class labels, and indexing it improves the speed of filterable searches in Qdrant. It changes the way a vector index is constructed, adapting it for fast vector search under filtering constraints. For more details, refer to this [guide on filtering in Qdrant](https://qdrant.tech/articles/vector-search-filtering/).
3. **Fetch Images**: Fetches images from Google Cloud Storage using the [Google Cloud Storage node](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.googlecloudstorage).
4. **Generate IDs**: Assigns UUIDs to each data point.
5. **Embed Images**: Embeds the images using the Voyage API.
6. **Batch Upload**: Uploads the embeddings to Qdrant in batches.
**2. Defining a Cluster Representative**
We used two approaches (it&rsquo;s not an exhaustive list) to defining a cluster representative, depending on the availability of labeled data:
|Method|Description|
|**Medoids**|A point within the cluster that has the smallest total distance to all other cluster points. This approach needs labeled data for each cluster.|
|**Perfect Representative**|A representative defined by a textual description of the ideal cluster member—the multimodality of Voyage AI embeddings allows for this trick. For example, for cherries: *&ldquo;Small, glossy red fruits on a medium-sized tree with slender branches and serrated leaves.&rdquo;* The closest image to this description in the vector space is selected as the representative. This method requires experimentation to align descriptions with real data.|
**Workflow:**
Both methods are demonstrated in the [2/3 Template Workflow for Anomaly Detection](https://n8n.io/workflows/2655-vector-database-as-a-big-data-analysis-tool-for-ai-agents-23-anomaly/).
|**Method**|**Steps**|
|**Medoids**|1. Sample labeled cluster points from Qdrant.
2. Compute a **pairwise distance matrix** for the cluster using Qdrant&rsquo;s [Distance Matrix API](https://qdrant.tech/documentation/search/explore/?q=distance+#distance-matrix). This API helps with scalable cluster analysis and data points relationship exploration. Learn more in [this article](https://qdrant.tech/articles/distance-based-exploration/).
3. For each point, calculate the sum of its distances to all other points. The point with the smallest total distance (or highest similarity for COSINE distance metric) is the medoid.
4. Mark this point as the cluster representative.|
|**Perfect Representative**|1. Define textual descriptions for each cluster (e.g., AI-generated).
2. Embed these descriptions using Voyage.
3. Find the image embedding closest to the description one.
4. Mark this image as the cluster representative.|
**3. Defining the Cluster Border**
**Workflow:**
The approach demonstrated in [2/3 Template Workflow for Anomaly Detection](https://n8n.io/workflows/2655-vector-database-as-a-big-data-analysis-tool-for-ai-agents-23-anomaly/) works similarly for both types of cluster representatives.
1. Within a cluster, identify the furthest data point from the cluster representative (it can also be the 2nd or Xth furthest point; the best way to define it is through experimentation—for us, the 5th furthest point worked well). Since we use COSINE similarity, this is equivalent to the most similar point to the [opposite](https://mathinsight.org/image/vector_opposite) of the cluster representative (its vector multiplied by -1).
2. Save the distance between the representative and respective furthest point as the cluster border (threshold).
**4. Anomaly Detection Tool**
**Workflow:**
With the preparatory steps complete, you can set up the anomaly detection tool, demonstrated in the [3/3 Template Workflow for Anomaly Detection](https://n8n.io/workflows/2656-vector-database-as-a-big-data-analysis-tool-for-ai-agents-33-anomaly/).
Steps:
1. Choose the method of the cluster representative definition.
2. Fetch all the clusters to compare the candidate image against.
3. Using Voyage AI, embed the candidate image in the same vector space.
4. Calculate the candidate&rsquo;s similarity to each cluster representative. The image is flagged as anomalous if the similarity is below the threshold for all clusters (outside the cluster borders). Alternatively, you can check if it&rsquo;s anomalous to a particular cluster, for example, the cherries one.
Anomaly detection in image data has diverse applications, including:
* Moderation of advertisements.
* Anomaly detection in vertical farming.
* Quality control in the food industry, such as [detecting anomalies in coffee beans](https://qdrant.tech/articles/detecting-coffee-anomalies/).
* Identifying anomalies in map tiles for tasks like automated map updates or ecological monitoring.
This tool is easily adaptable to these use cases.
#### Classification Tool
The anomaly detection tool can also be used for classification, but there&rsquo;s a simpler approach: K-Nearest Neighbors (KNN) classification.
> &ldquo;Show me your friends, and I will tell you who you are.&rdquo;
The KNN method labels a data point by analyzing its classified neighbors and assigning this point the majority class in the neighborhood. This approach doesn&rsquo;t require all data points to be labeled—a subset of labeled examples can serve as anchors to propagate labels across the dataset.
Let&rsquo;s build a KNN-based image classification tool.
**Setup**
1. **Dataset**: We&rsquo;ll use the [Land-Use Scene Classification dataset](https://www.kaggle.com/datasets/apollo2506/landuse-scene-classification). Satellite imagery analysis has applications in ecology, rescue operations, and map updates.
2. **Embedding Model**: As for anomaly detection, we&rsquo;ll use the [Voyage AI multimodal embedding model](https://docs.voyageai.com/docs/multimodal-embeddings).
Additionally, it&rsquo;s good to have test and validation data to determine the optimal value of K for your dataset.
**Workflow:**
Uploading images to Qdrant can be done using the same workflow—[1/3 Uploading Images to Qdrant Template Workflow](https://n8n.io/workflows/2654-vector-database-as-a-big-data-analysis-tool-for-ai-agents-13-anomaly12-knn/), just by swapping the dataset.
The [KNN-Classification Tool Template](https://n8n.io/workflows/2657-vector-database-as-a-big-data-analysis-tool-for-ai-agents-22-knn/) has the following steps:
1. **Embed Image**: Embeds the candidate for classification using Voyage.
2. **Fetch neighbors**: Retrieves the K closest labeled neighbors from Qdrant.
3. **Majority Voting**: Determines the prevailing class in the neighborhood by simple majority voting.
4. **Optional: Ties Resolving**: In case of ties, expands the neighborhood radius.
Of course, this is a simple solution, and there exist more advanced approaches with higher precision & no need for labeled data—for example, you could try [metric learning with Qdrant](https://qdrant.tech/articles/metric-learning-tips/).
Though classification seems like a task that was solved in machine learning decades ago, it&rsquo;s not so trivial to deal with in production. Issues like data drift, shifting class definitions, mislabeled data, and fuzzy differences between classes create unexpected problems, which require continuous adjustments of classifiers, and vector search can be an unusual but effective solution, due to its scalability.
#### Live Walkthrough
To see how n8n agents use these tools in practice, and to revisit the main ideas of the &ldquo;*Big Data Analysis*&rdquo; section, watch our integration webinar:
## Conclusion
Vector search is not limited to similarity search or basic RAG. When combined with automation platforms like n8n, it becomes a powerful tool for building smarter systems. Think dynamic routing in customer support, content moderation based on user behavior, or AI-driven alerts in data monitoring dashboards.
This tutorial showed how to use Qdrant and n8n for AI-backed recommendations, classification, and anomaly detection. But that&rsquo;s just the start—try vector search for:
* **Deduplication**
* **Dissimilarity search**
* **Diverse sampling**
With Qdrant and n8n, there&rsquo;s plenty of room to create something unique!
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/tutorials-build-essentials/qdrant-n8n.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/tutorials-build-essentials/qdrant-n8n/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/tutorials-build-essentials/qdrant-n8n.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)