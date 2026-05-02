Blog | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
Happy New Year and welcome to the State of the Fin!
This new blog series will regularly basis highlight the ongoing development of Jellyfin and our official clients.
We aim to keep our community informed and engaged, so feel free to share your feedback or thoughts on our progress!
From refreshed user interface elements to playback improvements, there are many changes across the board in the latest update of Jellyfin
for Android TV.
We are pleased to bring you Jellyfin 10.11.0, our new stable release. This is probably one of, if not the, biggest and most impactful releases we've done yet, with some massive backend changes to improve performance and long-term expandability and maintainability. This release has been a long time coming, with over 6 months of development and another 6 months of RC testing, throwing our planned 6-month release schedule completely out of whack, but we definitely think the results are worth it - both for users right now, and for the long-term health of the project.
If you just want a quick summary of what you **need to know** (and you **DO** need to know!) to get your system upgraded and running, please read on to the "TL; DR" section just below, or keep reading for a full explanation of all the major features and improvements in Jellyfin 10.11.0! You can also view full changelogs on the [server](https://github.com/jellyfin/jellyfin/releases/tag/v10.11.0) and [web](https://github.com/jellyfin/jellyfin-web/releases/tag/v10.11.0) GitHub releases.
- Joshua
SQLite is a powerful database engine, but due to its design, it has limitations that should not be overlooked.
Jellyfin has used a SQLite-based database for storing most of its data for years, but it has also encountered issues on many systems. In this blog post, I will explain how we address these limitations and how developers using SQLite can apply the same solutions.
This will be a technical blog post intended for developers and everyone wanting to learn about concurrency.
Also Jellyfin's implementation of locking for SQLite should be fairly easy to be implemented into another EF Core application if you are facing the same issue.
- JPVenson
Download support is (finally) coming to Jellyfin for iOS!
Better late then never. The Xbox app for Jellyfin now has a new maintainer and its first release in 5 years.
- JPVenson
You know the feeling when the assignment was to write a 500 word paper, but you have so much to cover that your first draft is 25,000 words?
...what? Just me?
That's exactly how I feel attempting to condense all the new features, bug fixes, refreshed UI components, and improvements found in Jellyfin for Roku 3.0.0 into a single blog post.
But I'll do my best, here goes.
- 1hitsong
Jellyfin for iOS is back with the first release in nearly 3 years!
EFCore has landed in unstable, and this will have consequences.
We have finally reached our first milestone in cleaning up the legacy database access code. This means that all SQL builders that targeted SQLite directly have been removed from code. This marks the first step towards a completely new database design, but we now need to take a quick look ahead and see what's next.
Unstable builds will be temporarily turned off this week, skipping the 20250127 unstable to provide a full week of in-master testing, and will be re-enabled for the 20250203 unstable next week, so ensure you have backups ready this week if you run unstable builds.
Otherwise please read on to see what exactly that means and what the future brings.
- JPVenson
Version 0.18 of our Jellyfin for Android TV app is ready! Exciting features like lyrics and media segments are now available, along with
significant improvements to subtitles and more.