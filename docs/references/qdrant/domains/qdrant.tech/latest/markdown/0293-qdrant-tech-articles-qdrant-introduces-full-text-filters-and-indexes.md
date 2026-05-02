Full-text filter and index are already available! - Qdrant
* [Qdrant Articles](https://qdrant.tech/articles/)
*
* Full-text filter and index are already available!
[
Back to
Qdrant Articles](https://qdrant.tech/articles/)# Full-text filter and index are already available!
Kacper Łukawski
&#183;
November 16, 2022
Qdrant is designed as an efficient vector database, allowing for a quick search of the nearest neighbours. But, you may find yourself in need of applying some extra filtering on top of the semantic search. Up to version 0.10, Qdrant was offering support for keywords only. Since 0.10, there is a possibility to apply full-text constraints as well. There is a new type of filter that you can use to do that, also combined with every other filter type.
## Using full-text filters without the payload index
Full-text filters without the index created on a field will return only those entries which contain all the terms included in the query. That is effectively a substring match on all the individual terms but **not a substring on a whole query**.
An example of how to search for “long\_sleeves” in a “detail\_desc” payload field.
## Full-text search behaviour on an indexed payload field
There are more options if you create a full-text index on a field you will filter by.
Full-text search behaviour on an indexed payload field There are more options if you create a full-text index on a field you will filter by.
First and foremost, you can choose the tokenizer. It defines how Qdrant should split the text into tokens. There are three options available:
* **word** — spaces, punctuation marks and special characters define the token boundaries
* **whitespace** — token boundaries defined by whitespace characters
* **prefix** — token boundaries are the same as for the “word” tokenizer, but in addition to that, there are prefixes created for every single token. As a result, “Qdrant” will be indexed as “Q”, “Qd”, “Qdr”, “Qdra”, “Qdran”, and “Qdrant”.
There are also some additional parameters you can provide, such as
* **min\_token\_len** — minimal length of the token
* **max\_token\_len** — maximal length of the token
* **lowercase** — if set to *true*, then the index will be case-insensitive, as Qdrant will convert all the texts to lowercase## Using text filters in practice
There are also some additional parameters you can provide, such as min\_token\_len — minimal length of the token max\_token\_len — maximal length of the token lowercase — if set to true, then the index will be case-insensitive, as Qdrant will convert all the texts to lowercase Using text filters in practice
The main difference between using full-text filters on the indexed vs non-indexed field is the performance of such query. In a simple benchmark, performed on the [H&M dataset](https://www.kaggle.com/competitions/h-and-m-personalized-fashion-recommendations) (with over 105k examples), the average query time looks as follows (n=1000):
It is evident that creating a filter on a field that we’ll query often, may lead us to substantial performance gains without much effort.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/full-text-filter-and-index-are-already-available.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/articles/qdrant-introduces-full-text-filters-and-indexes/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/full-text-filter-and-index-are-already-available.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)