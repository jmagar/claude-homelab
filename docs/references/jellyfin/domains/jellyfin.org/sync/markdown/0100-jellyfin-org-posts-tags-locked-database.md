One post tagged with "locked-database" | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
SQLite is a powerful database engine, but due to its design, it has limitations that should not be overlooked.
Jellyfin has used a SQLite-based database for storing most of its data for years, but it has also encountered issues on many systems. In this blog post, I will explain how we address these limitations and how developers using SQLite can apply the same solutions.
This will be a technical blog post intended for developers and everyone wanting to learn about concurrency.
Also Jellyfin's implementation of locking for SQLite should be fairly easy to be implemented into another EF Core application if you are facing the same issue.
- JPVenson