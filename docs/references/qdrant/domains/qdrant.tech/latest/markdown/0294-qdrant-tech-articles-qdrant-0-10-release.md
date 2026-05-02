Qdrant 0.10 released
* [Qdrant Articles](https://qdrant.tech/articles/)
*
* Qdrant 0.10 released
[
Back to
Qdrant Articles](https://qdrant.tech/articles/)# Qdrant 0.10 released
Kacper Łukawski
&#183;
September 19, 2022
[Qdrant 0.10 is a new version](https://github.com/qdrant/qdrant/releases/tag/v0.10.0) that brings a lot of performance
improvements, but also some new features which were heavily requested by our users. Here is an overview of what has changed.
## Storing multiple vectors per object
Previously, if you wanted to use semantic search with multiple vectors per object, you had to create separate collections
for each vector type. This was even if the vectors shared some other attributes in the payload. With Qdrant 0.10, you can
now store all of these vectors together in the same collection, which allows you to share a single copy of the payload.
This makes it easier to use semantic search with multiple vector types, and reduces the amount of work you need to do to
set up your collections.
## Batch vector search
Previously, you had to send multiple requests to the Qdrant API to perform multiple non-related tasks. However, this
can cause significant network overhead and slow down the process, especially if you have a poor connection speed.
Fortunately, the [new batch search feature](https://qdrant.tech/documentation/search/search/#batch-search-api) allows
you to avoid this issue. With just one API call, Qdrant will handle multiple search requests in the most efficient way
possible. This means that you can perform multiple tasks simultaneously without having to worry about network overhead
or slow performance.
## Built-in ARM support
To make our application accessible to ARM users, we have compiled it specifically for that platform. If it is not
compiled for ARM, the device will have to emulate it, which can slow down performance. To ensure the best possible
experience for ARM users, we have created Docker images specifically for that platform. Keep in mind that using
a limited set of processor instructions may affect the performance of your vector search. Therefore, we have tested
both ARM and non-ARM architectures using similar setups to understand the potential impact on performance.
## Full-text filtering
Qdrant is a vector database that allows you to quickly search for the nearest neighbors. However, you may need to apply
additional filters on top of the semantic search. Up until version 0.10, Qdrant only supported keyword filters. With the
release of Qdrant 0.10, [you can now use full-text filters](https://qdrant.tech/documentation/search/filtering/#full-text-match)
as well. This new filter type can be used on its own or in combination with other filter types to provide even more
flexibility in your searches.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/qdrant-0-10-release.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/articles/qdrant-0-10-release/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/qdrant-0-10-release.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)