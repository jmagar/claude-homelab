Library Statistics Graph Tab by herby2212 · Pull Request #1472 · Tautulli/Tautulli · GitHub
[Skip to content](#start-of-content)
{{ message }}
[
Tautulli
](/Tautulli)
/
**
[Tautulli](/Tautulli/Tautulli)
**
Public
*
* [ Notifications
](/login?return_to=/Tautulli/Tautulli) You must be signed in to change notification settings
* [ Fork
623
](/login?return_to=/Tautulli/Tautulli)
*
[
Star
6.5k
](/login?return_to=/Tautulli/Tautulli)
## Conversation
[
](/herby2212)
Copy link
Copy Markdown
Contributor
###
**
[herby2212](/herby2212)
**
commented
[Jul 21, 2021](#issue-949817864)
&#8226;
edited
Loading
## Description
Addition of a new graph tab called "**Library Statistics**" which features currently two new graphs.
The first one called "**Daily addition by media type**" shows the added movies, shows, seasons and episodes on a per day basis. *The time range is set like for the other graphs.*
The second one called "**Addition count by media type**" shows the total count of movies, shows, seasons and episodes added in the set time range split in two categories: Movies and TV which includes shows, seasons and episodes.
**Update 01/08/2021:** [#1472 (comment)](https://github.com/Tautulli/Tautulli/pull/1472#issuecomment-898540262)
Third graph added called "**Addition count by source resolution**" which shows the total count of movies, shows, seasons and episodes added in the set time range by the different resolutions your media have. *(Currently supported: 4k, 1080p, 720p, 576p, 480p, SD)*
**Update 19/08/2021:** [#1472 (comment)](https://github.com/Tautulli/Tautulli/pull/1472#issuecomment-902040474)
Fourth graph called "**Library Growth**" shows the library growth by the library stats on a per day basis. It is synced with the "**Daily addition by media type**" graph above so the influence of the additions in regards to the overall growth can be seen instantly.
This feature is work in progress and there are the following things planned before its finished:
* ~~When clicking on a day show the corresponding movies/shows/seasons/episodes (depending on which media type clicked) added on that day.~~ - Moving to a future update.
* Music category including artist, album and track count [Library Statistics Graph Tab #1472 (comment)](https://github.com/Tautulli/Tautulli/pull/1472#issuecomment-903318421)
* Graph improvements (removing not required options and maybe visual improvements)
* Optimize queries
* Data Connection (new table sourced from Plex) [Library Statistics Graph Tab #1472 (comment)](https://github.com/Tautulli/Tautulli/pull/1472#issuecomment-902791388)
* Moving the episode count in the "Daily addition by media type" graph on a second y-axis with bigger incremental steps (for better scaling)
* Library Growth/Stats Graph
* Check active libraries
* Handle in Tautulli deleted libraries [f87fce6](https://github.com/Tautulli/Tautulli/commit/f87fce6ab9321a2f64ecfb1789f16fcfb1699137)
I decided to open this request now so improvements, ideas or changes required (that come up through a review for example) can be implemented while in development.
*This feature is based on the ideas mentioned in issue [#1403](https://github.com/Tautulli/Tautulli/issues/1403).*
### Screenshot
#### Library Statistics Graph Tab
General Tab that might get expanded with additional graphs related to library statistics.
[](https://user-images.githubusercontent.com/12448284/127778499-84840fc0-8100-4195-80f7-7450be038136.png)
#### Addition count by media type
[](https://user-images.githubusercontent.com/12448284/126507252-e2c77de5-c4ab-4601-9475-ed85d5d58eea.png)
*TV category combines Shows, Seasons and Episodes count.*
#### Daily addition by media type
[](https://user-images.githubusercontent.com/12448284/127694000-c1a6da67-8918-4200-a932-967161ed64bd.png)
*Updated version with Episode count moved to a second axis.*
[](https://user-images.githubusercontent.com/12448284/126507282-fc8303e9-a0b6-424d-9b9a-42c9d95aea3b.png)
*Broader view of Movies, Shows and Seasons added over time. Episodes filtered out here for a better overview.*
## Type of Change
* New feature (non-breaking change which adds functionality)
## Checklist
* My code follows the style guidelines of this project
* I have performed a self-review of my own code
* I have commented my code, particularly in hard-to-understand areas
* I have added or updated the docstring for new or existing methods
</option></form>
</option></form>
👍
3
Jerome2103, blacktwin, and luzpaz reacted with thumbs up emoji
[herby2212](/herby2212)
added 10 commits
[July 20, 2021 15:29](#commits-pushed-099148b)
[
](/herby2212)
`
[Additions count by media type graph](/Tautulli/Tautulli/pull/1472/commits/099148b2fbf2e23659eab066af63104ba73e696c)
`
`
[099148b](/Tautulli/Tautulli/pull/1472/commits/099148b2fbf2e23659eab066af63104ba73e696c)
`
[
](/herby2212)
`
[addition of seasons and episodes count](/Tautulli/Tautulli/pull/1472/commits/5fa5e68c7cfd88372abdfa552fbacf36f58d3126)
`
`
[5fa5e68](/Tautulli/Tautulli/pull/1472/commits/5fa5e68c7cfd88372abdfa552fbacf36f58d3126)
`
[
](/herby2212)
`
[fix show count including tracks](/Tautulli/Tautulli/pull/1472/commits/0f9692426e7961c81d2b32e887d0c25e3636decc)
`
`
[0f96924](/Tautulli/Tautulli/pull/1472/commits/0f9692426e7961c81d2b32e887d0c25e3636decc)
`
[
](/herby2212)
`
[Library Statistics tab and move + new graph](/Tautulli/Tautulli/pull/1472/commits/01bce8ba31095b207d6c471588e63973b2ea5437)
`
`
[01bce8b](/Tautulli/Tautulli/pull/1472/commits/01bce8ba31095b207d6c471588e63973b2ea5437)
`
[
](/herby2212)
`
[Daily addition by media type graph](/Tautulli/Tautulli/pull/1472/commits/0c5832bd4bb236371510785f4382e536b1bda244)
`
`
[0c5832b](/Tautulli/Tautulli/pull/1472/commits/0c5832bd4bb236371510785f4382e536b1bda244)
`
[
](/herby2212)
`
[fixed highlighting of weekends](/Tautulli/Tautulli/pull/1472/commits/8ce93697c4ee16822e4d6d9b6c8612171f47ca7c)
`
`
[8ce9369](/Tautulli/Tautulli/pull/1472/commits/8ce93697c4ee16822e4d6d9b6c8612171f47ca7c)
`
[
](/herby2212)
`
[move episode count on second yAxis](/Tautulli/Tautulli/pull/1472/commits/1811e879cece4ec885c6ad6fa6a39bbac5799ea8)
`
`
[1811e87](/Tautulli/Tautulli/pull/1472/commits/1811e879cece4ec885c6ad6fa6a39bbac5799ea8)
`
[
](/herby2212)
`
[addition count by source resolution graph](/Tautulli/Tautulli/pull/1472/commits/2a7a211ad7860f299768cca2bd8dcc787e1c2ce1)
`
`
[2a7a211](/Tautulli/Tautulli/pull/1472/commits/2a7a211ad7860f299768cca2bd8dcc787e1c2ce1)
`
[
](/herby2212)
`
[optimizing query with resolution\_identifier](/Tautulli/Tautulli/pull/1472/commits/a524630ba71953cb0f1909883db174905c17ed9b)
`
`
[a524630](/Tautulli/Tautulli/pull/1472/commits/a524630ba71953cb0f1909883db174905c17ed9b)
`
[
](/herby2212)
`
[optimized query and fixed sorting for ByResolution](/Tautulli/Tautulli/pull/1472/commits/039bead3b0961d7af2c6d3a83e497657ddde7d00)
`
`
[039bead](/Tautulli/Tautulli/pull/1472/commits/039bead3b0961d7af2c6d3a83e497657ddde7d00)
`
[](/herby2212)
Copy link
Copy Markdown
Contributor
Author
###
**
[herby2212](/herby2212)
**
commented
[Aug 13, 2021](#issuecomment-898540262)
&#8226;
edited
Loading
|
**Addition count by resolution** [Added 01.08.2021]
[](https://user-images.githubusercontent.com/12448284/130367773-8f726d5e-17e2-42da-83b2-b164ceb5fb43.png)
*Shows the total count of movies, shows, seasons and episodes added in the set time range by the different resolutions your media have. (Currently supported: 4k, 1080p, 720p, 576p, 480p, SD)*
|
</option></form>
</option></form>
[](/JonnyWong16)
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
commented
[Aug 14, 2021](#issuecomment-898928606)
|
The graphs are a good idea, but we really shouldn't be using the `recently\_added` table for the data. That is only a temporary table that can get erased.
A new permanent table should be created to cache the libraries.
|
</option></form>
</option></form>
[](/herby2212)
Copy link
Copy Markdown
Contributor
Author
###
**
[herby2212](/herby2212)
**
commented
[Aug 15, 2021](#issuecomment-899100837)
&#8226;
edited
Loading
|>
> The graphs are a good idea, but we really shouldn't be using the
`> recently_added
`> table for the data. That is only a temporary table that can get erased.
>
> A new permanent table should be created to cache the libraries.
>
Oh. Under what circumstances does the table get erased? As the table is quite good to analyse the library growth. An alternative would be to create a new permanent table for this and get the initial data from the Plex server itself. Which in the end could also just be done by making a permanent table based on `recently\_added`. Though I'm not sure if this table is still in tact for all users.
|
</option></form>
</option></form>
[herby2212](/herby2212)
added 6 commits
[August 18, 2021 17:23](#commits-pushed-65fcb9a)
[
](/herby2212)
`
[query optimizing + library growth graph synced](/Tautulli/Tautulli/pull/1472/commits/65fcb9ab37b6a12d89967548b795c5a1a3eb07d6)
`
`
[65fcb9a](/Tautulli/Tautulli/pull/1472/commits/65fcb9ab37b6a12d89967548b795c5a1a3eb07d6)
`
[
](/herby2212)
`
[Merge branch 'feature-library-statistics-graph' of](/Tautulli/Tautulli/pull/1472/commits/8e6cf7c6413313f71f4e8523aaf6b54412e5ca81) [https://github.com…](https://github.com/herby2212/Tautulli)
`
&hellip;
`
[8e6cf7c](/Tautulli/Tautulli/pull/1472/commits/8e6cf7c6413313f71f4e8523aaf6b54412e5ca81)
`
```
[…/herby2212/Tautulli](https://github.com/herby2212/Tautulli) into feature-library-statistics-graph
```
[
](/herby2212)
`
[library growth graph content](/Tautulli/Tautulli/pull/1472/commits/799a8069ba95eaa12a89d9ad21c56e14214bfa22)
`
`
[799a806](/Tautulli/Tautulli/pull/1472/commits/799a8069ba95eaa12a89d9ad21c56e14214bfa22)
`
[
](/herby2212)
`
[fix console error, tooltip shadow, cursor](/Tautulli/Tautulli/pull/1472/commits/13e01c751aa15175fd5767afd79e55dd687efb4c)
`
`
[13e01c7](/Tautulli/Tautulli/pull/1472/commits/13e01c751aa15175fd5767afd79e55dd687efb4c)
`
[
](/herby2212)
`
[sync enable/disable axis, labels, storage](/Tautulli/Tautulli/pull/1472/commits/76581f3ab522e01f9dbd874aee913915d522804a)
`
`
[76581f3](/Tautulli/Tautulli/pull/1472/commits/76581f3ab522e01f9dbd874aee913915d522804a)
`
[
](/herby2212)
`
[fix tooltip position-\>sync graphs based on x value](/Tautulli/Tautulli/pull/1472/commits/5c8abd30488be4b89ae658220f75595fb41bb628)
`
`
[5c8abd3](/Tautulli/Tautulli/pull/1472/commits/5c8abd30488be4b89ae658220f75595fb41bb628)
`
[](/herby2212)
Copy link
Copy Markdown
Contributor
Author
###
**
[herby2212](/herby2212)
**
commented
[Aug 19, 2021](#issuecomment-902040474)
|
**Library Growth** graph synced with **Daily addition by media type** graph [Added 19.08.2021]
This fourth graph called "**Library Growth**" shows the library growth by the library stats on a per day basis. It is synced with the "**Daily addition by media type**" graph above so the influence of the additions in regards to the overall growth can be seen instantly.
Enabling/disabling of a axis is also synced as well as the local storage (so both graphs get loaded with the same axis selected) and the Episode axis (including yAxis and label).
**Demo:**
[](https://user-images.githubusercontent.com/12448284/130101796-3ae2ac56-e73f-4d52-965f-1690619a00f7.gif)
**If your library is a bit older like this one the more significant growth phase can be seen at a higher day count:**
[](https://user-images.githubusercontent.com/12448284/130103408-4fc73431-e43f-464b-99bd-9c5e3aa596a5.png)
*This graph also includes the year in the date which is helpful when inspecting longer time periods.*
|
</option></form>
</option></form>
[](/JonnyWong16)
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
commented
[Aug 19, 2021](#issuecomment-902084023)
|>
> Oh. Under what circumstances does the table get erased?
>
Clicking this button
[](https://user-images.githubusercontent.com/9099342/130111191-91945214-0afb-43c9-a402-97ad2c7618c7.png)
Or running the `update\_metadata.py` script after moving media/libraries.
The `recently\_added` table also only stores data from after Tautulli was installed, but I don't see anything in these graphs that would be limited by Tautulli. It's all data from the Plex server.
A new table should be created and sourced directly from Plex. Or a table might not even be required if the data can be loaded live from Plex, but that will have to be tested for performance to see if it's viable.
|
</option></form>
</option></form>
[](/herby2212)
Copy link
Copy Markdown
Contributor
Author
###
**
[herby2212](/herby2212)
**
commented
[Aug 19, 2021](#issuecomment-902093308)
|>
> >
> > Oh. Under what circumstances does the table get erased?
> >
>
> Clicking this button
>
[](https://user-images.githubusercontent.com/9099342/130111191-91945214-0afb-43c9-a402-97ad2c7618c7.png)
>
> Or running the
`> update_metadata.py
`> script after moving media/libraries.
>
> The
`> recently_added
`> table also only stores data from after Tautulli was installed, but I don't see anything in these graphs that would be limited by Tautulli. It's all data from the Plex server.
>
> A new table should be created and sourced directly from Plex. Or a table might not even be required if the data can be loaded live from Plex, but that will have to be tested for performance to see if it's viable.
>
Thanks for the information.
Agreed. I would go with a table in Tautulli as (besides the performance side) it would be bad if the user can't use the graphs, because there is no connection at this moment to Plex. As the rest of Tautulli can still be used even when there is no connection so we should stay coherent here.
I will add the point data connection to the ToDo's.
|
</option></form>
</option></form>
[herby2212](/herby2212)
added 4 commits
[August 19, 2021 19:54](#commits-pushed-13bf9f9)
[
](/herby2212)
`
[cleanup; fix sync data range change or tab switch](/Tautulli/Tautulli/pull/1472/commits/13bf9f9b4b42385b4c94124a4deabf434440000f)
`
`
[13bf9f9](/Tautulli/Tautulli/pull/1472/commits/13bf9f9b4b42385b4c94124a4deabf434440000f)
`
[
](/herby2212)
`
[library\_stats\_items table creation and data setup](/Tautulli/Tautulli/pull/1472/commits/94f2dbeaffc94f778a12feadb652b56bd6f5e822)
`
`
[94f2dbe](/Tautulli/Tautulli/pull/1472/commits/94f2dbeaffc94f778a12feadb652b56bd6f5e822)
`
[
](/herby2212)
`
[library stats data refresh settings implementation](/Tautulli/Tautulli/pull/1472/commits/e4122a04c1dc125f8289fd067d87f818aad1d13d)
`
`
[e4122a0](/Tautulli/Tautulli/pull/1472/commits/e4122a04c1dc125f8289fd067d87f818aad1d13d)
`
[
](/herby2212)
`
[optimized & based queries on library\_stats\_items](/Tautulli/Tautulli/pull/1472/commits/dafb09c8f558df0d508593a5461416a8f1368b7f)
`
`
[dafb09c](/Tautulli/Tautulli/pull/1472/commits/dafb09c8f558df0d508593a5461416a8f1368b7f)
`
[](/herby2212)
Copy link
Copy Markdown
Contributor
Author
###
**
[herby2212](/herby2212)
**
commented
[Aug 20, 2021](#issuecomment-902791388)
|
**Database Implementation** [Added 20.08.2021]
Added the library\_stats\_item table with a corresponding refresh function and options for refresh on startup and interval + corresponding implementation in the settings (see picture below):
[](https://user-images.githubusercontent.com/12448284/130259313-88ec5217-4043-4b6c-947f-f8667c0f0d71.png)
Through this table I was able to optimize my queries.
The initial creation of the table and the update takes quit long (which is why I set the min. hour interval to 6).
Times for my around 16000 items (movies + shows + seasons + episodes + tracks + albums + artists):
* Creation: 16min
* Update: 8min
The best would be to disable the refresh on startup by default and only trigger it once after the update (and have the interval running) with something like a special db upgrade function. Still unsure about that so feedback would be appreciated.
|
</option></form>
</option></form>
[](/JonnyWong16)
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
commented
[Aug 20, 2021](#issuecomment-902806507)
|
What is the change in database size before and after? How many rows in the table?
|
</option></form>
</option></form>
[](/herby2212)
Copy link
Copy Markdown
Contributor
Author
###
**
[herby2212](/herby2212)
**
commented
[Aug 20, 2021](#issuecomment-902828270)
&#8226;
edited
Loading
|>
> What is the change in database size before and after? How many rows in the table?
>
16694 rows. Datasize before: 67152 KB after: 97764 KB = \~30 MB
|
</option></form>
</option></form>
[
](/herby2212)
`
[cleanup & switch to updated\_at](/Tautulli/Tautulli/pull/1472/commits/827fff30af84ee389130f2778af2429c804eb7b9)
`
`
[827fff3](/Tautulli/Tautulli/pull/1472/commits/827fff30af84ee389130f2778af2429c804eb7b9)
`
[herby2212](/herby2212)
added 2 commits
[August 21, 2021 19:04](#commits-pushed-0b4c733)
[
](/herby2212)
`
[bug fixing and robustness improvements](/Tautulli/Tautulli/pull/1472/commits/0b4c73395f1382916f107584c801e0e3cd569502)
`
`
[0b4c733](/Tautulli/Tautulli/pull/1472/commits/0b4c73395f1382916f107584c801e0e3cd569502)
`
[
](/herby2212)
`
[bug fixing & music integration for library stats](/Tautulli/Tautulli/pull/1472/commits/5988652af8836ad5b0fa34e66968c8c44c7fb74d)
`
`
[5988652](/Tautulli/Tautulli/pull/1472/commits/5988652af8836ad5b0fa34e66968c8c44c7fb74d)
`
[](/herby2212)
Copy link
Copy Markdown
Contributor
Author
###
**
[herby2212](/herby2212)
**
commented
[Aug 22, 2021](#issuecomment-903318421)
&#8226;
edited
Loading
|
**Music Integration** [Added 22.08.2021]
**Daily addition by media type** and **Library Growth**:
[](https://user-images.githubusercontent.com/12448284/130367436-14a0e85c-745a-4dca-944c-b8b297dc3901.png)
*All other categories disabled for a better visibility.*
**Additions by media type**:
[](https://user-images.githubusercontent.com/12448284/130367462-6f8d7f34-0cd2-4441-a5e2-442e15952099.png)
**Done for visual elements/additions.**
|
</option></form>
</option></form>
[](/JonnyWong16)
[JonnyWong16](/JonnyWong16)
added
the
[
status:in-progress
](</Tautulli/Tautulli/issues?q=state:open label:status:in-progress>)
label
[Aug 27, 2021](#event-5220392372)
[](/herby2212)
Copy link
Copy Markdown
Contributor
Author
###
**
[herby2212](/herby2212)
**
commented
[Sep 4, 2021](#issuecomment-913054199)
&#8226;
edited
Loading
|
Notice: It can happen that some media items have a timestamp that is in the future or in a time period before the server existed. This issue comes from the way how Plex handels the `date added` when scanning in files during the creation of a new library.
>
> if you create a fresh library and in the course of this library creation you add a folder full of media files, Plex will read the datetime stamp of the media files and use this instead as ‘date added’.
>
Taken from [https://forums.plex.tv/t/date-added-wrong/302575/12](https://forums.plex.tv/t/date-added-wrong/302575/12).
A way to solve this would be to set the `added\_at` field for those media items in the `library\_stats\_items` table to the library section `created\_at` timestamp upon initial creation of the table.
This field is currently not in the `library\_sections` table of Tautulli present, only in Plex.
**UPDATE:** Fixed in commit [herby2212@2386cab](https://github.com/herby2212/Tautulli/commit/2386cab8b2145a178d473eab40d5b8a908861a74).
Media items with a timestamp older then their corresponding library instead receive the library creation timestamp.
|
</option></form>
🎉
1
engels74 reacted with hooray emoji
</option></form>
[
](/herby2212)
`
[bug fix for graph out of scope and timestamp](/Tautulli/Tautulli/pull/1472/commits/2386cab8b2145a178d473eab40d5b8a908861a74)
`
`
[2386cab](/Tautulli/Tautulli/pull/1472/commits/2386cab8b2145a178d473eab40d5b8a908861a74)
`
[](/herby2212)
**
[herby2212](/herby2212)
**
commented
[
Oct 17, 2021
](#pullrequestreview-781428936)
[
View reviewed changes
](/Tautulli/Tautulli/pull/1472/files/2386cab8b2145a178d473eab40d5b8a908861a74)
Comment thread
[plexpy/graphs.py](/Tautulli/Tautulli/pull/1472/files/2386cab8b2145a178d473eab40d5b8a908861a74#diff-1ff48d9c0517cc882598d53217a4584a5c688c4a4d7d549e3583e39c4f369f12)
Show resolved
Hide resolved
[herby2212](/herby2212)
added 2 commits
[February 13, 2022 18:51](#commits-pushed-c78c721)
[
](/herby2212)
`
[remove detail dialog for additions\_by\_day](/Tautulli/Tautulli/pull/1472/commits/c78c7218c0c0a0dc3d4cf87c2410f1b0324b488d)
`
`
[c78c721](/Tautulli/Tautulli/pull/1472/commits/c78c7218c0c0a0dc3d4cf87c2410f1b0324b488d)
`
[
](/herby2212)
`
[factor in deleted and active libraries](/Tautulli/Tautulli/pull/1472/commits/f87fce6ab9321a2f64ecfb1789f16fcfb1699137)
`
`
[f87fce6](/Tautulli/Tautulli/pull/1472/commits/f87fce6ab9321a2f64ecfb1789f16fcfb1699137)
`
[](/herby2212)
[herby2212](/herby2212)
marked this pull request as ready for review
[February 13, 2022 17:53](#event-6062113655)
[herby2212](/herby2212)
added 2 commits
[February 17, 2022 15:24](#commits-pushed-9379932)
[
](/herby2212)
`
[query optimization](/Tautulli/Tautulli/pull/1472/commits/937993264f0c7e896096fd884c961ccb132e7270)
`
`
[9379932](/Tautulli/Tautulli/pull/1472/commits/937993264f0c7e896096fd884c961ccb132e7270)
`
[
](/herby2212)
`
[hide not needed options on lib stats graph tab](/Tautulli/Tautulli/pull/1472/commits/42d5ad57876e3d145f6f6812c375434fe2757ee9)
`
`
[42d5ad5](/Tautulli/Tautulli/pull/1472/commits/42d5ad57876e3d145f6f6812c375434fe2757ee9)
`
[](/herby2212)
[herby2212](/herby2212)
marked this pull request as draft
[January 7, 2023 14:44](#event-8174819935)
[herby2212](/herby2212)
added 5 commits
[January 7, 2023 17:02](#commits-pushed-4350c9a)
[
](/herby2212)
`
[update chart and tooltip date format](/Tautulli/Tautulli/pull/1472/commits/4350c9a47e1ef243d61479cc70e590735232017d)
`
`
[4350c9a](/Tautulli/Tautulli/pull/1472/commits/4350c9a47e1ef243d61479cc70e590735232017d)
`
[
](/herby2212)
`
[tooltip und points fadeout for synced graphs + fix](/Tautulli/Tautulli/pull/1472/commits/6d7b9a566eb6f84fc42dd09f7ff917e304836914)
`
`
[6d7b9a5](/Tautulli/Tautulli/pull/1472/commits/6d7b9a566eb6f84fc42dd09f7ff917e304836914)
`
[
](/herby2212)
`
[code update for conform structure](/Tautulli/Tautulli/pull/1472/commits/95670fb84a277a3b4707f74a514cd96924fa1995)
`
`
[95670fb](/Tautulli/Tautulli/pull/1472/commits/95670fb84a277a3b4707f74a514cd96924fa1995)
`
[
](/herby2212)
`
[Merge branch 'nightly' into feature-library-statistics-graph](/Tautulli/Tautulli/pull/1472/commits/668d7d3eed045546ab0db59f73cbe1ad8dae53af)
`
`
[668d7d3](/Tautulli/Tautulli/pull/1472/commits/668d7d3eed045546ab0db59f73cbe1ad8dae53af)
`
[
](/herby2212)
`
[update config](/Tautulli/Tautulli/pull/1472/commits/0cc69c275b237c3b1d56fc1600ede03a6b996ecf)
`
`
[0cc69c2](/Tautulli/Tautulli/pull/1472/commits/0cc69c275b237c3b1d56fc1600ede03a6b996ecf)
`
[](/herby2212)
[herby2212](/herby2212)
mentioned this pull request
[
Oct 7, 2023
](#ref-issue-1871618087)
[
Show total runtime of media
#2141
](/Tautulli/Tautulli/issues/2141)
Open
[](/herby2212)
[herby2212](/herby2212)
marked this pull request as ready for review
[October 11, 2023 16:06](#event-10620888361)
</option></form>
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
[Sign up for free](/join?source=comment-repo)
**to join this conversation on GitHub**.
Already have an account?
[Sign in to comment](/login?return_to=https://github.com/Tautulli/Tautulli/pull/1472)
</option></form>
###
Reviewers
No reviews
</option></form>
###
Assignees
No one assigned
###
Labels
[
status:in-progress
](</Tautulli/Tautulli/issues?q=state:open label:status:in-progress>)
</option></form>
###
Milestone
No milestone
</option></form>
###
Development
Successfully merging this pull request may close these issues.
###
2 participants
[
](/herby2212) [
](/JonnyWong16)