Collaborative Filtering - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Search Engineering](https://qdrant.tech/documentation/tutorials-search-engineering/)
*
* Collaborative Filtering# Build a Recommendation System with Collaborative Filtering using Qdrant
|Time: 45 min|Level: Intermediate|[](https://githubtocolab.com/qdrant/examples/blob/master/collaborative-filtering/collaborative-filtering.ipynb)||
Every time Spotify recommends the next song from a band you&rsquo;ve never heard of, it uses a recommendation algorithm based on other users&rsquo; interactions with that song. This type of algorithm is known as **collaborative filtering**.
Unlike content-based recommendations, collaborative filtering excels when the objects&rsquo; semantics are loosely or unrelated to users&rsquo; preferences. This adaptability is what makes it so fascinating. Movie, music, or book recommendations are good examples of such use cases. After all, we rarely choose which book to read purely based on the plot twists.
The traditional way to build a collaborative filtering engine involves training a model that converts the sparse matrix of user-to-item relations into a compressed, dense representation of user and item vectors. Some of the most commonly referenced algorithms for this purpose include [SVD (Singular Value Decomposition)](https://en.wikipedia.org/wiki/Singular_value_decomposition) and [Factorization Machines](https://en.wikipedia.org/wiki/Matrix_factorization_(recommender_systems)). However, the model training approach requires significant resource investments. Model training necessitates data, regular re-training, and a mature infrastructure.
## Methodology
Fortunately, there is a way to build collaborative filtering systems without any model training. You can obtain interpretable recommendations and have a scalable system using a technique based on similarity search. Let’s explore how this works with an example of building a movie recommendation system.
## Implementation
To implement this, you will use a simple yet powerful resource: [Qdrant with Sparse Vectors](https://qdrant.tech/articles/sparse-vectors/).
Notebook: [You can try this code here](https://githubtocolab.com/qdrant/examples/blob/master/collaborative-filtering/collaborative-filtering.ipynb)
### Setup
You have to first import the necessary libraries and define the environment.
```
`import os
import pandas as pd
import requests
from qdrant\_client import QdrantClient, models
from qdrant\_client.models import PointStruct, SparseVector, NamedSparseVector
from collections import defaultdict
# OMDB API Key - for movie posters
omdb\_api\_key = os.getenv("OMDB\_API\_KEY")
# Collection name
collection\_name = "movies"
# Set Qdrant Client
qdrant\_client = QdrantClient(
os.getenv("QDRANT\_HOST"),
api\_key=os.getenv("QDRANT\_API\_KEY")
)
`
```
### Define output
Here, you will configure the recommendation engine to retrieve movie posters as output.
```
`# Function to get movie poster using OMDB API
def get\_movie\_poster(imdb\_id, api\_key):
url = f"https://www.omdbapi.com/?i={imdb\_id}&apikey={api\_key}"
data = requests.get(url).json()
return data.get('Poster'), data
`
```
### Prepare the data
Load the movie datasets. These include three main CSV files: user ratings, movie titles, and OMDB IDs.
```
`# Load CSV files
ratings\_df = pd.read\_csv('data/ratings.csv', low\_memory=False)
movies\_df = pd.read\_csv('data/movies.csv', low\_memory=False)
# Convert movieId in ratings\_df and movies\_df to string
ratings\_df['movieId'] = ratings\_df['movieId'].astype(str)
movies\_df['movieId'] = movies\_df['movieId'].astype(str)
rating = ratings\_df['rating']
# Normalize ratings
ratings\_df['rating'] = (rating - rating.mean()) / rating.std()
# Merge ratings with movie metadata to get movie titles
merged\_df = ratings\_df.merge(
movies\_df[['movieId', 'title']],
left\_on='movieId', right\_on='movieId', how='inner'
)
# Aggregate ratings to handle duplicate (userId, title) pairs
ratings\_agg\_df = merged\_df.groupby(['userId', 'movieId']).rating.mean().reset\_index()
ratings\_agg\_df.head()
`
```
||userId|movieId|rating|
|0|1|1|0.429960|
|1|1|1036|1.369846|
|2|1|1049|-0.509926|
|3|1|1066|0.429960|
|4|1|110|0.429960|
### Convert to sparse
If you want to search across numerous reviews from different users, you can represent these reviews in a sparse matrix.
```
`# Convert ratings to sparse vectors
user\_sparse\_vectors = defaultdict(lambda: {"values": [], "indices": []})
for row in ratings\_agg\_df.itertuples():
user\_sparse\_vectors[row.userId]["values"].append(row.rating)
user\_sparse\_vectors[row.userId]["indices"].append(int(row.movieId))
`
```
### Upload the data
Here, you will initialize the Qdrant client and create a new collection to store the data.
Convert the user ratings to sparse vectors and include the `movieId` in the payload.
```
`# Define a data generator
def data\_generator():
for user\_id, sparse\_vector in user\_sparse\_vectors.items():
yield PointStruct(
id=user\_id,
vector={"ratings": SparseVector(
indices=sparse\_vector["indices"],
values=sparse\_vector["values"]
)},
payload={"user\_id": user\_id, "movie\_id": sparse\_vector["indices"]}
)
# Upload points using the data generator
qdrant\_client.upload\_points(
collection\_name=collection\_name,
points=data\_generator()
)
`
```
### Define query
In order to get recommendations, we need to find users with similar tastes to ours.
Let&rsquo;s describe our preferences by providing ratings for some of our favorite movies.
`1` indicates that we like the movie, `-1` indicates that we dislike it.
```
`my\_ratings = {
603: 1, # Matrix
13475: 1, # Star Trek
11: 1, # Star Wars
1091: -1, # The Thing
862: 1, # Toy Story
597: -1, # Titanic
680: -1, # Pulp Fiction
13: 1, # Forrest Gump
120: 1, # Lord of the Rings
87: -1, # Indiana Jones
562: -1 # Die Hard
}
`
```
Click to see the code for `to\_vector`
```
`# Create sparse vector from my\_ratings
def to\_vector(ratings):
vector = SparseVector(
values=[],
indices=[]
)
for movie\_id, rating in ratings.items():
vector.values.append(rating)
vector.indices.append(movie\_id)
return vector
`
```
### Run the query
From the uploaded list of movies with ratings, we can perform a search in Qdrant to get the top most similar users to us.
```
`# Perform the search
results = qdrant\_client.query\_points(
collection\_name=collection\_name,
query=to\_vector(my\_ratings),
using="ratings",
limit=20
).points
`
```
Now we can find the movies liked by the other similar users, but we haven&rsquo;t seen yet.
Let&rsquo;s combine the results from found users, filter out seen movies, and sort by the score.
```
`# Convert results to scores and sort by score
def results\_to\_scores(results):
movie\_scores = defaultdict(lambda: 0)
for result in results:
for movie\_id in result.payload["movie\_id"]:
movie\_scores[movie\_id] += result.score
return movie\_scores
# Convert results to scores and sort by score
movie\_scores = results\_to\_scores(results)
top\_movies = sorted(movie\_scores.items(), key=lambda x: x[1], reverse=True)
`
```
Visualize results in Jupyter Notebook
Finally, we display the top 5 recommended movies along with their posters and titles.
```
`# Create HTML to display top 5 results
html\_content = "\<div class='movies-container'\>"
for movie\_id, score in top\_movies[:5]:
imdb\_id\_row = links.loc[links['movieId'] == int(movie\_id), 'imdbId']
if not imdb\_id\_row.empty:
imdb\_id = imdb\_id\_row.values[0]
poster\_url, movie\_info = get\_movie\_poster(imdb\_id, omdb\_api\_key)
movie\_title = movie\_info.get('Title', 'Unknown Title')
html\_content += f"""
\<div class='movie-card'\>
\<img src="{poster\_url}" alt="Poster" class="movie-poster"\>
\<div class="movie-title"\>{movie\_title}\</div\>
\<div class="movie-score"\>Score: {score}\</div\>
\</div\>
"""
else:
continue # Skip if imdb\_id is not found
html\_content += "\</div\>"
display(HTML(html\_content))
`
```
## Recommendations
For a complete display of movie posters, check the [notebook output](https://github.com/qdrant/examples/blob/master/collaborative-filtering/collaborative-filtering.ipynb). Here are the results without html content.
```
`Toy Story, Score: 131.2033799
Monty Python and the Holy Grail, Score: 131.2033799
Star Wars: Episode V - The Empire Strikes Back, Score: 131.2033799
Star Wars: Episode VI - Return of the Jedi, Score: 131.2033799
Men in Black, Score: 131.2033799
`
```
On top of collaborative filtering, we can further enhance the recommendation system by incorporating other features like user demographics, movie genres, or movie tags.
Or, for example, only consider recent ratings via a time-based filter. This way, we can recommend movies that are currently popular among users.
## Conclusion
As demonstrated, it is possible to build an interesting movie recommendation system without intensive model training using Qdrant and Sparse Vectors. This approach not only simplifies the recommendation process but also makes it scalable and interpretable. In future tutorials, we can experiment more with this combination to further enhance our recommendation systems.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/tutorials-search-engineering/collaborative-filtering.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/tutorials-search-engineering/collaborative-filtering/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/tutorials-search-engineering/collaborative-filtering.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)