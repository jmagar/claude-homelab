Dailymotion's Journey to Crafting the Ultimate Content-Driven Video Recommendation Engine with Qdrant Vector Search
0
# Dailymotion's Journey to Crafting the Ultimate Content-Driven Video Recommendation Engine with Qdrant Vector Search
Atita Arora
&#183;
February 27, 2024
* [Home](https://qdrant.tech/)
* /
* [Blog](https://qdrant.tech/blog/)
* /
* Dailymotion's Journey to Crafting the Ultimate Content-Driven Video Recommendation Engine with Qdrant Vector Search
On this page:
* [
Share on X](<https://twitter.com/intent/tweet?url=https://qdrant.tech/blog/case-study-dailymotion/&amp;text=Dailymotion's Journey to Crafting the Ultimate Content-Driven Video Recommendation Engine with Qdrant Vector Search>)
* [
Share on LinkedIn](https://www.linkedin.com/sharing/share-offsite/?url=https://qdrant.tech/blog/case-study-dailymotion/)
## Dailymotion&rsquo;s Journey to Crafting the Ultimate Content-Driven Video Recommendation Engine with Qdrant Vector Search
In today&rsquo;s digital age, the consumption of video content has become ubiquitous, with an overwhelming abundance of options available at our fingertips. However, amidst this vast sea of videos, the challenge lies not in finding content, but in discovering the content that truly resonates with individual preferences and interests and yet is diverse enough to not throw users into their own filter bubble. As viewers, we seek meaningful and relevant videos that enrich our experiences, provoke thought, and spark inspiration.
Dailymotion is not just another video application; it&rsquo;s a beacon of curated content in an ocean of options. With a steadfast commitment to providing users with meaningful and ethical viewing experiences, Dailymotion stands as the bastion of videos that truly matter.
They aim to boost a dynamic visual dialogue, breaking echo chambers and fostering discovery.
### Scale
* **420 million+ videos**
* **2k+ new videos / hour**
* **13 million+ recommendations / day**
* **300+ languages in videos**
* **Required response time \< 100 ms**### Challenge
* **Improve video recommendations** across all 3 applications of Dailymotion (mobile app, website and embedded video player on all major French and International sites) as it is the main driver of audience engagement and revenue stream of the platform.
* Traditional [collaborative recommendation model](https://en.wikipedia.org/wiki/Collaborative_filtering) tends to recommend only popular videos, fresh and niche videos suffer due to zero or minimal interaction
* Video content based recommendation system required processing all the video embedding at scale and in real time, as soon as they are added to the platform
* Exact neighbor search at the scale and keeping them up to date with new video updates in real time at Dailymotion was unreasonable and unrealistic
* Precomputed [KNN](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm) would be expensive and may not work due to video updates every hour
* Platform needs fast recommendations \~ \< 100ms
* Needed fast ANN search on a vector search engine which could support the scale and performance requirements of the platform### Background / Journey
The quest of Dailymotion to deliver an intelligent video recommendation engine providing a curated selection of videos to its users started with a need to present more relevant videos to the first-time users of the platform (cold start problem) and implement an ideal home feed experience to allow users to watch videos that are expected to be relevant, diverse, explainable, and easily tunable.
This goal accounted for their efforts focused on[ Optimizing Video Recommender for Dailymotion&rsquo;s Home Feed ](https://medium.com/dailymotion/optimizing-video-feed-recommendations-with-diversity-machine-learning-first-steps-4cf9abdbbffd)back in the time.
They continued their work in [Optimising the recommender engine with vector databases and opinion mining](https://medium.com/dailymotion/reinvent-your-recommender-system-using-vector-database-and-opinion-mining-a4fadf97d020) later with emphasis on ranking videos based on features like freshness, real views ratio, watch ratio, and aspect ratio to enhance user engagement and optimise watch time per user on the home feed. Furthermore, the team continued to focus on diversifying user interests by grouping videos based on interest and using stratified sampling to ensure a balanced experience for users.
By now it was clear to the Dailymotion team that the future initiatives will involve overcoming obstacles related to data processing, sentiment analysis, and user experience to provide meaningful and diverse recommendations. The main challenge stayed at the candidate generation process, textual embeddings, opinion mining, along with optimising the efficiency and accuracy of these processes and tackling the complexities of large-scale content curation.
### Solution at glance
The solution involved implementing a content based Recommendation System leveraging Qdrant to power the similar videos, with the following characteristics.
**Fields used to represent each video** -
Title , Tags , Description , Transcript (generated by [OpenAI whisper](https://openai.com/research/whisper))
**Encoding Model used** - [MUSE - Multilingual Universal Sentence Encoder](https://www.tensorflow.org/hub/tutorials/retrieval_with_tf_hub_universal_encoder_qa)
* Supports - 16 languages### Why Qdrant?
Looking at the complexity, scale and adaptability of the desired solution, the team decided to leverage Qdrant’s vector search to implement a content-based video recommendation that undoubtedly offered several advantages over other methods:
**1. Efficiency in High-Dimensional Data Handling:**
Video content is inherently high-dimensional, comprising various features such as audio, visual, textual, and contextual elements.
Qdrant excels in efficiently handling high-dimensional data and out-of-the-box support for all the models with up to 65536 dimensions, making it well-suited for representing and processing complex video features with choice of any embedding model.
**2. Scalability:**
As the volume of video content and user interactions grows, scalability becomes paramount. Qdrant is meticulously designed to scale vertically as well as horizontally, allowing for seamless expansion to accommodate large volumes of data and user interactions without compromising performance.
**3. Fast and Accurate Similarity Search:**
Efficient video recommendation systems rely on identifying similarities between videos to make relevant recommendations. Qdrant leverages advanced HNSW indexing and similarity search algorithms to support fast and accurate retrieval of similar videos based on their feature representations nearly instantly (20ms for this use case)
**4. Flexibility in vector representation with metadata through payloads:**
Qdrant offers flexibility in storing vectors with metadata in form of payloads and offers support for advanced metadata filtering during the similarity search to incorporate custom logic.
**5. Reduced Dimensionality and Storage Requirements:**
Vector representations in Qdrant offer various Quantization and memory mapping techniques to efficiently store and retrieve vectors, leading to reduced storage requirements and computational overhead compared to alternative methods such as content-based filtering or collaborative filtering.
**6. Impressive Benchmarks:**
[Qdrant’s benchmarks](https://qdrant.tech/benchmarks/) has definitely been one of the key motivations for the Dailymotion’s team to try the solution and the team comments that the performance has been only better than the benchmarks.
**7. Ease of usage:**
Qdrant API’s have been immensely easy to get started with as compared to Google Vertex Matching Engine (which was Dailymotion’s initial choice) and the support from the team has been of a huge value to us.
**8. Being able to fetch data by id**
Qdrant allows to retrieve vector point / videos by ids while the Vertex Matching Engine requires a vector input to be able to search for other vectors which was another really important feature for Dailymotion
### Data Processing pipeline
Figure shows the streaming architecture of the data processing pipeline that processes everytime a new video is uploaded or updated (Title, Description, Tags, Transcript), an updated embedding is computed and fed directly into Qdrant.
### Results
There has been a big improvement in the recommended content processing time and quality as the existing system had issues like:
1. Subpar video recommendations due to long processing time \~ 5 hours
2. Collaborative recommender tended to recommend and focused on high signal / popular videos
3. Metadata based recommender focussed only on a very small scope of trusted video sources
4. The recommendations did not take contents of the video into consideration
The new recommender system implementation leveraging Qdrant along with the collaborative recommender offered various advantages :
1. The processing time for the new video content reduced significantly to a few minutes which enabled the fresh videos to be part of recommendations.
2. The performant & scalable scope of video recommendation currently processes 22 Million videos and can provide recommendation for videos with fewer interactions too.
3. The overall huge performance gain on the low signal videos has contributed to more than 3 times increase on the interaction and CTR ( number of clicks) on the recommended videos.
4. Seamlessly solved the initial cold start and low performance problems with the fresh content.### Outlook / Future plans
The team is very excited with the results they achieved on their recommender system and wishes to continue building with it.
They aim to work on Perspective feed next and say
> ”We&rsquo;ve recently integrated this new recommendation system into our mobile app through a feature called Perspective. The aim of this feature is to disrupt the vertical feed algorithm, allowing users to discover new videos. When browsing their feed, users may encounter a video discussing a particular movie. With Perspective, they have the option to explore different viewpoints on the same topic. Qdrant plays a crucial role in this feature by generating candidate videos related to the subject, ensuring users are exposed to diverse perspectives and preventing them from being confined to an echo chamber where they only encounter similar viewpoints.”
> Gladys Roch - Machine Learning Engineer
The team is also interested in leveraging advanced features like [Qdrant’s Discovery API](https://qdrant.tech/documentation/search/explore/#recommendation-api) to promote exploration of content to enable finding not only similar but dissimilar content too by using positive and negative vectors in the queries and making it work with the existing collaborative recommendation model.
### References
**2024 -** [https://www.youtube.com/watch?v=1ULpLpWD0Aw](https://www.youtube.com/watch?v=1ULpLpWD0Aw)
**2023 -** [https://medium.com/dailymotion/reinvent-your-recommender-system-using-vector-database-and-opinion-mining-a4fadf97d020](https://medium.com/dailymotion/reinvent-your-recommender-system-using-vector-database-and-opinion-mining-a4fadf97d020)
**2022 -** [https://medium.com/dailymotion/optimizing-video-feed-recommendations-with-diversity-machine-learning-first-steps-4cf9abdbbffd](https://medium.com/dailymotion/optimizing-video-feed-recommendations-with-diversity-machine-learning-first-steps-4cf9abdbbffd)
### Get Started with Qdrant Free
[Get Started](https://cloud.qdrant.io/signup)
Up!