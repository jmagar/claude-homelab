SABnzbd -
Wiki -
RSS
#
Wiki menu
Wiki
[User Manual](/wiki/)
[FAQ](/wiki/faq)
[Contact](/wiki/contact)
[
Introduction
](#wiki-menu-start)
* [Quick Setup](/wiki/introduction/quick-setup)
* [Using SABnzbd](/wiki/introduction/usage)
* [NZB Sources](/wiki/introduction/nzb-sources)
* [How To's](/wiki/introduction/howto)
* [Known issues](/wiki/introduction/known-issues)
[
Installation
](#wiki-menu-installation)
* [Windows](/wiki/installation/install-windows)
* [macOS](/wiki/installation/install-macos)
* [Unix](/wiki/installation/install-unix)
* [NAS](/wiki/installation/install-nas)
* [From source](/wiki/installation/install-off-modules)
[
Configuration
](#wiki-menu-configure)
* [Configure](/wiki/configuration/5.0/configure)
* [General](/wiki/configuration/5.0/general)
* [Folders](/wiki/configuration/5.0/folders)
* [Servers](/wiki/configuration/5.0/servers)
* [Categories](/wiki/configuration/5.0/categories)
* [Switches](/wiki/configuration/5.0/switches)
* [Sorting](/wiki/configuration/5.0/sorting)
* [Notifications](/wiki/configuration/5.0/notifications)
* [Scheduling](/wiki/configuration/5.0/scheduling)
* [RSS](/wiki/configuration/5.0/rss)
* [Special Settings](/wiki/configuration/5.0/special)
* [API Reference](/wiki/configuration/5.0/api)
[
Scripts
](#wiki-menu-scripts)
* [Pre-queue scripts](/wiki/configuration/5.0/scripts/pre-queue-scripts)
* [Post-processing scripts](/wiki/configuration/5.0/scripts/post-processing-scripts)
* [Notification scripts](/wiki/configuration/5.0/scripts/notification-scripts)
[
Advanced Topics
](#wiki-menu-advanced)
* [High-Speed Tweaks](/wiki/advanced/highspeed-downloading)
* [HTTPS for the Web UI](/wiki/advanced/https)
* [Command line options](/wiki/advanced/command-line-parameters)
* [Folder setup](/wiki/advanced/directory-setup)
* [Unix permissions](/wiki/advanced/unix-permissions)
* [RAR with password](/wiki/advanced/password-protected-rars)
* [IPv6](/wiki/advanced/ipv6)
* [SSL/TLS security](/wiki/advanced/certificate-errors)
* [SSL Ciphers](/wiki/advanced/ssl-ciphers)
* [Windows Service](/wiki/advanced/sabnzbd-as-a-windows-service)
* [Android](/wiki/advanced/android)
[Extensions for SABnzbd](/wiki/extensions-for-sabnzbd)
[Special Newshosting offer for SABnzbd users: 70% Off + 3 FREE MONTHS!](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=wt)
##
[
Incorrect or missing information?
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+RSS&amp;body=##+URL:+/wiki/configuration/5.0/rss.html
Improvement:
>)
RSS
SABnzbd can read RSS-feeds provided by indexers or public RSS websites.
These sites offer the latest downloads or return results based on a query. For a list of supported RSS sites, [see here.](/wiki/introduction/nzb-sources)
Each feed is analyzed using filters.
A filter looks for a text-pattern in the title of entries and will reject or accept a job based on that pattern.
A filter "matches" a title if the filter text is found inside that title.
You can add `\*` to match arbitrary parts of the title or `?` for one arbitrary character at that place.
The filters are analyzed in order and the first one matched will be selected.
## An example
Suppose you subscribe to a feed and the output of titles in this feed is:
```
`My first baby steps hdtv xvid Part 1
You and me and the dog Part 1
You and me and the dog Part 2
My first teen steps hdtv xvid Part 1
My first baby steps xvid Part 1
My first baby steps hdtv xvid Part 2
The making of My first baby steps xvid hdtv`
```
Now, suppose you want to get all `My ... first steps` episodes, but only when marked `hdtv` and you're not interested in `Making of`:
```
`Reject || making of
Accept || first\*steps\*hdtv`
```
The `Reject` filter should be placed first, otherwise the `Accept` filter will also pick the `Making of`.
It's also possible to setup a `Required` filter.
This means that the following filters are only applied when a title matches the `Required` filter.
For example: if you are only interested in `hdtv` format, you would create filters like this:
```
`Reject || making of
Requires || hdtv
Accept || first\*steps
Accept || second\*steps`
```
## Categories
For each feed you can set the category or the [job options](/wiki/extra/job-options) for all jobs in the feed in the top row, or for each `Accept` filter specifically.
If all category settings are left as `Default` and the indexer category matches one of your categories (by category name or by [custom `Indexer tag`](/wiki/configuration/5.0/categories)), it will be automatically assigned to that category.
The assigned or automatically matched category is shown in the Category column.
## Filters
|Filter name|Meaning|
|`Accept`|Accept job when the title matches the expression.
If not matched, go to next filter.|
|`Requires`|Require job title to contain this expression.
If matched, go to next filter. If not matched, reject job.|
|`Reject`|Reject job when the title matches the expression.
If not matched, go to next filter.|
|`RequiresCat`|Require job to have this category (**after** mapping the indexer category to your own categories).
If matched, go to next filter. If not matched, reject job.|
|`At Least`|The size of the job should be at least this. You can use `K/M/G` notation, where `100M` means at least 100Mbyte.
If size correct, go to next filter. If size not correct, reject job.|
|`At Most`|The size of the job should be at most this. You can use `K/M/G` notation, where `200M` means at most 200Mbyte.
If size correct, go to next filter. If size not correct, reject job.|
|`From SxxEyy`|Only this season/episode and newer will be accepted.
If matched, go to next filter. If not matched, reject job.|
|`From Show SxxEyy`|
Accept this and newer episodes of this specific show.
Accept if matched. If not matched, go to next filter.
Directly accepts job, this permits multiple shows in a single feed.
|
WARNING The `,` (comma) and `#` characters are **not** allowed.
NOTE The `From SxxEyy` and `From Show SxxEyy` will only work when SABnzbd recognizes the season/episode notation in the job title. Wildcards (`\*` and `?`) are not supported.
NOTE The `RequireCat` only works for indexers whose categories have been mapped to your [own](/wiki/configuration/5.0/categories).
NOTE Some websites require the inclusion of authentication details in the URL. Please check with your feed provider.
### Feed buttons
|Read feed|Read the RSS source again and apply the filters.|
|Force download|Send all matching items to the queue.|
|Clear download|Clear the list of items already sent to the queue.|
|Apply Filters|New or altered filters are not directly applied to existing results, click this button to re-filter the results.|
## Regular expressions
If you prefix a filter with `re:` it will be interpreted as a Python regular expression (case-insensitive).
Here's a [tutorial on regular expressions](https://regexone.com/).
For all the details see [the Python manual](http://docs.python.org/dev/howto/regex.html).
Simple example: `re: this|that` will match all jobs containing `this` or `that` in the title.
## Automatic processing
If you check the checkbox next to the name of the feed, it will be automatically processed. The time between scans can be set with `RSS checking rate`. This can be overridden by using the Scheduler.
## First batch
To prevent the download of a (potentially) large backlog, the first batch of NZBs will **not** automatically download. These lines are marked with an asterisk `\*`. If you want these matched feed items in this first batch to download, click the `Force Download` button.
Then, new feed items in subsequent RSS reads will download automatically (if the feed is enabled).
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)