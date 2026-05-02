SABnzbd -
Wiki -
API reference
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+API+reference&amp;body=##+URL:+/wiki/configuration/5.0/api.html
Improvement:
>)
API reference
### Jump quickly to: [Queue functions](#queue_main), [History functions](#history_main), [Status functions](#status_main) and [Other functions](#other_main).
# Introduction
The SABnzbd API can be reached via:
```
`http://host:port/api`
```
## Request types
Supported output types are `json` (default) and `xml`, which can be specified in the request:
```
`http://host:port/api?output=json`
```
## API Key and NZB key
API requires the users API key to be supplied all API requests in order for it to work. The API key is randomly generated and is static unless the user decides to change the key. The user can see their API key on the [General](/wiki/configuration/5.0/general) page of the configuration pages.
```
`http://host:port/api?output=json&apikey=APIKEY`
```
If the API-key is missing the request will return `error: API Key Required`, if it is incorrect: `error: API Key Incorrect`.
There is also a separate NZB key, which only allows for adding, modifying and removing jobs in the queue. When this key is used for something else, the request will return `error: API Key Incorrect`.
The `[version](#version)` and `[auth](#auth)` functions do not require the API key.
## Documentation
NOTE In all examples below the `apikey=APIKEY&output=json` part is not shown but still necessary.
True/False Indicates the API will return the status, for some functions it's always `true`, even if the operation failed. Sorry about that!
```
`{
"status": true
}`
```
# Queue functions
|Function|Description|
|[queue](#queue)|Full Queue output|
|[pause](#pause) (queue)|Pause whole queue|
|[resume](#resume) (queue)|Resume whole queue|
|[speedlimit](#speedlimit)|Set speedlimit|
|[change\_complete\_action](#change_complete_action)|Action on queue complete|
|[sort](#sort)|Sort the queue|
|[addurl](#addurl)|Add NZB by URL|
|[addfile](#addfile)|Add NZB by file upload|
|[addlocalfile](#addlocalfile)|Add NZB by local file path|
|[pause](#pause_single) (single job)|Pause a single job|
|[resume](#resume_single) (single job)|Resume a single job|
|[delete](#delete)|Delete job|
|[purge](#purge)|Delete all jobs or based on keyword|
|[move](#move)|Change position of job in queue|
|[change\_cat](#change_cat)|Change job category|
|[change\_script](#change_script)|Change job script|
|[priority](#priority)|Change job priority|
|[change\_opts](#change_opts)|Change job post-processing|
|[rename](#rename)|Change name and password of job|
|[get\_files](#get_files)|Get details of files in a job|
|[move\_nzf\_bulk](#move_nzf_bulk)|Move file(s) inside a job |
|[delete\_nzf](#delete_nzf)|Remove file(s) from a job|
## Full Queue output
Full queue output with details about all jobs.
```
`api?mode=queue&start=START&limit=LIMIT&cat=CATEGORY&priority=PRIORITY&search=SEARCH&nzo\_ids=NZO\_ID\_1,NZO\_ID\_2,NZO\_ID\_3`
```
NOTE Some of the less obvious output parameters are described below.
|Input parameter|Description|
|`start`optional|Index of job to start at|
|`limit`optional|Number of jobs to display|
|`search`optional|Filter job names by `search` term|
|`category` / `cat`optional|Only return jobs with the specified category or categories (separated by a comma)
Use `\*` for Default
||`priority`optional|Only return jobs with the specified priority or priorities (separated by a comma)
* `-2` = Paused
* `-1` = Low Priority
* `0` = Normal Priority
* `1` = High Priority
* `2` = Force|
|`status`optional|Only return jobs with the specified status or statuses (separated by a comma)
* `Downloading`
* `Queued`
* `Paused`
* `Propagating` = Delayed download
* `Fetching` = Job is downloading extra par2 files|
|`nzo\_ids`optional|Only return jobs with these `nzo\_ids` (separated by a comma)|
|Output parameter|Description|
|`speedlimit`|In percentage of maximum set by user|
|`speedlimit\_abs`|In bytes/s|
|`labels`|Labels like `DUPLICATE`, `ENCRYPTED` and `PROPAGATING X min`|
|`time\_added`|Unix timestamp when the job was added to the queue.|
|`unpackopts`|See [change\_opts](#change_opts)|
```
`{
"queue": {
"status": "Downloading",
"speedlimit": "9",
"speedlimit\_abs": "4718592.0",
"paused": false,
"noofslots\_total": 2,
"noofslots": 2,
"limit": 10,
"start": 0,
"timeleft": "0:16:44",
"speed": "1.3 M",
"kbpersec": "1296.02",
"size": "1.2 GB",
"sizeleft": "1.2 GB",
"mb": "1277.65",
"mbleft": "1271.58",
"slots": [
{
"status": "Downloading",
"index": 0,
"password": "",
"avg\_age": "2895d",
"time\_added": 1469172000,
"script": "None",
"direct\_unpack": "10/30",
"mb": "1277.65",
"mbleft": "1271.59",
"mbmissing": "0.0",
"size": "1.2 GB",
"sizeleft": "1.2 GB",
"filename": "TV.Show.S04E11.720p.HDTV.x264",
"labels": [],
"priority": "Normal",
"cat": "tv",
"timeleft": "0:16:44",
"percentage": "0",
"nzo\_id": "SABnzbd\_nzo\_p86tgx",
"unpackopts": "3"
},
{
"status": "Paused",
"index": 1,
"password": "",
"avg\_age": "2895d",
"time\_added": 1469171000,
"script": "None",
"direct\_unpack": null,
"mb": "1277.76",
"mbleft": "1277.76",
"mbmissing": "0.0",
"size": "1.2 GB",
"sizeleft": "1.2 GB",
"filename": "TV.Show.S04E12.720p.HDTV.x264",
"labels": [
"TOO LARGE",
"DUPLICATE"
],
"priority": "Normal",
"cat": "tv",
"timeleft": "0:00:00",
"percentage": "0",
"nzo\_id": "SABnzbd\_nzo\_ksfai6",
"unpackopts": "3"
}
],
"diskspace1": "161.16",
"diskspace2": "161.16",
"diskspacetotal1": "465.21",
"diskspacetotal2": "465.21",
"diskspace1\_norm": "161.2 G",
"diskspace2\_norm": "161.2 G",
"have\_warnings": "0",
"pause\_int": "0",
"left\_quota": "0 ",
"version": "3.x.x",
"finish": 2,
"cache\_art": "16",
"cache\_size": "6 MB",
"finishaction": null,
"paused\_all": false,
"quota": "0 ",
"have\_quota": false,
}
}`
```
## Pause queue True/False
Pauses the whole queue (do not confuse this will pausing an individual download, this is a global pause).
```
`api?mode=pause`
```
Pauses for `value` minutes.
```
`api?mode=config&name=set\_pause&value=50`
```
## Resume queue True/False
Resumes the whole queue (do not confuse this will resuming an individual download, this is a global pause).
```
`api?mode=resume`
```
## Set speedlimit True/False
Sets the speedlimit to `value` in percentage of the maximum line speed (set by user).
```
`api?mode=config&name=speedlimit&value=30`
```
It can also be followed by `K,M` to define speedlimit in `KB/s,MB/s`, respectively.
```
`api?mode=config&name=speedlimit&value=400K`
```
## Action on queue complete True/False
Set an end-of-queue action
```
`api?mode=queue&name=change\_complete\_action&value=ACTION`
```
Options:
* `hibernate\_pc`
* `standby\_pc`
* `shutdown\_program`
* Script: prefix the name of the script with `script\_`, for example `script\_test.py`
On some systems additional packages are required to allow SABnzbd to control power states, if there are problems in [queue](#queue) it will show as `power\_options=false`.
## Sort the queue True/False
Sort the queue by `avg\_age`, `name` , `remaining` (Sort by % downloaded) or `size` in `asc` (low to high) or `desc` (high to low) order.
```
`api?mode=queue&name=sort&sort=avg\_age&dir=desc`
```
## Add NZB by URL
Add NZB using an URL that needs to be accessible by SABnzbd, so make sure to include authentication information if the Indexer requires it. Example of a full request with everything set to default values is shown below, but only the `name` parameter is required.
```
`api?mode=addurl&name=https%3A%2F%indexer.info%2Fget.php%3Fguid%3Ded731c0b37f25f84aea563d6ddb210b1%26api%3D6f235b80fab0c76e1ce7da21b2c6c48c&nzbname=&cat=\*&script=Default&priority=-100&pp=-1`
```
Returns the `nzo\_id` of the job:
```
`{
"status": true,
"nzo\_ids": ["SABnzbd\_nzo\_kyt1f0"]
}`
```
|Input parameter|Description|
|`name`|[URL-encoded](http://www.w3schools.com/tags/ref_urlencode.asp) version of the link to the NZB to be fetched.|
|`nzbname`optional|
Name of the job, if empty the NZB filename is used.
|
|`password`optional|
Password to use when unpacking the job.
|
|`cat`optional|Category to be assigned, `\*` means `Default`. List of available categories can be retrieved from [get\_cats](#get_cats).|
|`script`optional|Script to be assigned, `Default` will use the script assigned to the category. List of available scripts can be retrieved from [get\_scripts](#get_scripts).|
|`priority`optional|Priority to be assigned:
* `-100` = Default Priority (of category)
* `-3` = Duplicate
* `-2` = Paused
* `-1` = Low Priority
* `0` = Normal Priority
* `1` = High Priority
* `2` = Force|
|`pp`optional|Post-processing options:
* `-1` = Default (of category)
* `0` = None
* `1` = +Repair
* `2` = +Repair/Unpack
* `3` = +Repair/Unpack/Delete|
## Add NZB by file upload
Upload NZB using `POST multipart/form-data`. In your form, set the value of the field `mode` to `addfile`; the file data should be in the field `name` or the field `nzbfile`.
For other parameters and output see [addurl](#addurl).
## Add NZB by local file path
Upload NZB from a location on the file system that SABnzbd can access. The path should be [URL-encoded](http://www.w3schools.com/tags/ref_urlencode.asp).
For other parameters and output see [addurl](#addurl).
Example of adding a file `E:\\Downloads\\Movie.BRRip.x264.1080p-NPW.nzb`:
```
`api?mode=addlocalfile&name=E%3A%5CDownloads%5CMovie.BRRip.x264.1080p-NPW.nzb&nzbname=The.Job.Name&cat=\*&script=Default&priority=-100&pp=-1`
```
## Pause single job True/False
Pause a single job based on its `nzo\_id`. Returns a boolean status, and a list of affected nzo\_ids.
```
`api?mode=queue&name=pause&value=NZO\_ID`
```
## Resume single job True/False
Resume a single job based on its `nzo\_id`. Returns a boolean status, and a list of affected nzo\_ids.
```
`api?mode=queue&name=resume&value=NZO\_ID`
```
## Delete jobs True/False
Delete job(s) based on `nzo\_id`. Returns a boolean status, and a list of affected nzo\_ids.
NOTE By default already download files of a job are not removed, add `del\_files=1` to have all files removed.
```
`api?mode=queue&name=delete&value=NZO\_ID`
```
Deleting multiple items:
```
`api?mode=queue&name=delete&value=NZO\_ID\_1,NZO\_ID\_2,NZO\_ID\_3`
```
Deleting all items:
```
`api?mode=queue&name=delete&value=all&del\_files=1`
```
## Purge queue
Remove all jobs from the queue, or only the ones matching `search`. Returns `nzb\_id` of the jobs removed.
```
`api?mode=queue&name=purge&search=SEARCH&del\_files=1`
```
NOTE By default already download files of a job are not removed, add `del\_files=1` to have all files removed.
## Move job in queue
Job's can be switched by providing 2 `nzo\_id`, `value` is the item you want to move, `value2` is the name of the job where you want to put `value` one above, shifting job `value2` down.
```
`api?mode=switch&value=NZO\_ID\_1&value2=NZO\_ID\_2`
```
You can also move to a specific location in the queue, where `0` is the top of the queue:
```
`api?mode=switch&value=NZO\_ID&value2=2`
```
Both commands will return the new position and priority, since a job's location is also dependent on its priority:
```
`{
"result": {
"priority": 0,
"position": 2
}
}`
```
## Change job category True/False
Change category of job with `nzo\_id`. List of available categories can be retrieved from [get\_cats](#get_cats).
```
`api?mode=change\_cat&value=NZO\_ID&value2=Category`
```
## Change job script True/False
Change script of job with `nzo\_id`. List of available scripts can be retrieved from [get\_scripts](#get_scripts).
```
`api?mode=change\_script&value=NZO\_ID&value2=script.py`
```
## Change job priority
Change priority of job with `nzo\_id`.
* `-100` = Default Priority (of category)
* `-4` = Stop
* `-3` = Duplicate
* `-2` = Paused
* `-1` = Low Priority
* `0` = Normal Priority
* `1` = High Priority
* `2` = Force
```
`api?mode=queue&name=priority&value=NZO\_ID&value2=0`
```
The command will return the new position, since a job's location also depends on its priority:
```
`{
"position": 42
}`
```
## Change job post-processing options True/False
Change post-processing of job with `nzo\_id`.
* `0` = None
* `1` = +Repair
* `2` = +Repair/Unpack
* `3` = +Repair/Unpack/Delete
```
`api?mode=change\_opts&value=NZO\_ID&value2=0`
```
## Change job name True/False
Change name and password of job with `nzo\_id`.
NOTE `value3` can be empty, but to set a password `value` and `value2` must also be filled, using the current name.
```
`api?mode=queue&name=rename&value=NZO\_ID&value2=NEW\_NAME&value3=PASSWORD`
```
Or you can set a password as part of the new name in `value2`, see: [RAR with password](/wiki/advanced/password-protected-rars).
```
`api?mode=queue&name=rename&value=NZO\_ID&value2=NEW\_NAME{{PASSWORD}}`
```
## Get files in job
Get files of job with `nzo\_id`.
```
`api?mode=get\_files&value=NZO\_ID`
```
The `status` indicates if a file was `finished`, in the process of being downloaded (`active`) or will only be downloaded when necessary (`queued`, like `.par2` files). The `set` shows to which part of the download the `.par2` files belong to, in case of multiple sets in 1 job. Files are sorted in order: finished, active, queued.
```
`{
"files": [
{
"status": "finished",
"mbleft": "0.00",
"mb": "0.05",
"age": "25d",
"bytes": "52161.00",
"filename": "93a4ec7c37752640deab48dabb46b164.par2",
"nzf\_id": "SABnzbd\_nzf\_1lk0ij"
},
{
"status": "active",
"mbleft": "20.58",
"mb": "98.50",
"age": "25d",
"bytes": "103287413.00",
"filename": "93a4ec7c37752640deab48dabb46b164.01",
"nzf\_id": "SABnzbd\_nzf\_zgx\_gg"
},
{
"status": "queued",
"set": "93a4ec7c37752640deab48dabb46b164",
"mbleft": "3.13",
"mb": "3.13",
"age": "25d",
"bytes": "3279083.00",
"filename": "93a4ec7c37752640deab48dabb46b164.vol000+02.par2",
"nzf\_id": "SABnzbd\_nzf\_ee63r6"
}
]
}`
```
## Move file(s) inside a job True/False
Move files specified by `nzf\_ids` inside job `nzo\_id` to `top` or `bottom`.
To move a file a `size` number of spots, use `up` or `down`.
```
`api?mode=move\_nzf\_bulk&name=LOCATION&value=NZO\_ID&nzf\_ids=NZF\_ID,NZF\_ID2&size=X`
```
## Remove file(s) from a job
Remove file(s) using `nzo\_id` of the job and `nzf\_id` of the file(s). Returns the `nzf\_ids` of removed file.
```
`api?mode=queue&name=delete\_nzf&value=NZO\_ID&value2=NZF\_ID,NZF\_ID2`
```
# History functions
|Function|Description|
|[history](#history)|Full history output|
|[retry](#retry)|Retry failed job|
|[retry\_all](#retry_all)|Retry all failed jobs|
|[delete](#delete_history)|Delete/Archive history item|
|[mark\_as\_completed](#mark_as_completed)|Mark failed job as completed|
## History output
Full history output with details about all jobs. The `queue` and the `history` output share many common fields, but the history also contains statistics about how much has been downloaded in the past day, week, month and total.
```
`api?mode=history&start=START&limit=LIMIT&cat=CATEGORY&search=SEARCH&nzo\_ids=NZO\_ID\_1,NZO\_ID\_2,NZO\_ID\_3&failed\_only=0`
```
NOTE Some of the less obvious output parameters are described below.
|Input parameter|Description|
|`start`optional|Index of job to start at|
|`limit`optional|Number of jobs to display|
|`archive`optional|Display history (default) or archived items|
|`search`optional|Filter job names by `search` term|
|`category` / `cat`optional|Only return jobs with the specified category or categories (separated by a comma)
Use `\*` for Default
||`status`optional|Only return jobs with the specified status or statuses (separated by a comma)
* `Completed`
* `Failed`
* `Queued` = Waiting for post-processing
* `QuickCheck`
* `Verifying`
* `Repairing`
* `Fetching` = Job is downloading extra par2 files
* `Extracting`
* `Moving`
* `Running` = Post-processing script is running|
|`nzo\_ids`optional|Only return jobs with these `nzo\_ids` (separated by a comma)|
|`failed\_only`optional|Only show failed jobs (shorthand for `status=Failed`)|
|`last\_history\_update`optional|Only return full output if anything has changed since `last\_history\_update`, the last update is given by a previous call to `history`|
|Output parameter|Description|
|`time\_added`|Unix timestamp when the job was added to the queue.|
|`duplicate\_key`|How SABnzbd identified the show and season/episode info|
|`pp`|Different format than the queue:
* `R` = +Repair
* `U` = +Repair/Unpack
* `D` = +Repair/Unpack/Delete|
|`path`|Temporary destination|
|`storage`|Final destination|
|`loaded`|If `true`, item is post-processing|
```
`{
"history": {
"noofslots": 220,
"ppslots": 1,
"day\_size": "1.9 G",
"week\_size": "30.4 G",
"month\_size": "167.3 G",
"total\_size": "678.1 G",
"last\_history\_update": 1469210913,
"slots": [
{
"action\_line": "",
"duplicate\_key": "TV.Show/4/2",
"meta": null,
"fail\_message": "",
"loaded": false,
"size": "2.3 GB",
"category": "tv",
"pp": "D",
"retry": 0,
"script": "None",
"nzb\_name": "TV.Show.S04E02.720p.BluRay.x264-xHD.nzb",
"download\_time": 64,
"storage": "C:\\\\Users\\\\xxx\\\\Videos\\\\Complete\\\\TV.Show.S04E02.720p.BluRay.x264-xHD",
"has\_rating": false,
"status": "Completed",
"script\_line": "",
"completed": 1469172988,
"time\_added": 1469172000,
"nzo\_id": "SABnzbd\_nzo\_sdkoun",
"downloaded": 2436906376,
"report": "",
"password": "",
"path": "\\\\\\\\?\\\\C:\\\\SABnzbd\\\\TV.Show.S04E02.720p.BluRay.x264-xHD",
"postproc\_time": 40,
"name": "TV.Show.S04E02.720p.BluRay.x264-xHD",
"url": "TV.Show.S04E02.720p.BluRay.x264-xHD.nzb",
"md5sum": "d2c16aeecbc1b1921d04422850e93013",
"archive": false,
"bytes": 2436906376,
"url\_info": "",
"stage\_log": [
{
"name": "Source",
"actions": [
"TV.Show.S04E02.720p.BluRay.x264-xHD.nzb"
]
},
{
"name": "Download",
"actions": [
"Downloaded in 1 min 4 seconds at an average of 36.2 MB/s\<br/\>Age: 550d\<br/\>10 articles were malformed"
]
},
{
"name": "Servers",
"actions": [
"Frugal=2.3 GB"
]
},
{
"name": "Repair",
"actions": [
"[pA72r5Ac6lW3bmpd20T7Hj1Zg2bymUsINBB50skrI] Repaired in 19 seconds"
]
},
{
"name": "Unpack",
"actions": [
"[pA72r5Ac6lW3bmpd20T7Hj1Zg2bymUsINBB50skrI] Unpacked 1 files/folders in 6 seconds"
]
}
]
},
{
"action\_line": "",
"duplicate\_key": "TV.Show/4/13",
"meta": null,
"fail\_message": "",
"loaded": false,
"size": "2.3 GB",
"category": "tv",
"pp": "D",
"retry": 0,
"script": "None",
"nzb\_name": "TV.Show.S04E13.720p.BluRay.x264-xHD.nzb",
"download\_time": 60,
"storage": "C:\\\\Users\\\\xxx\\\\Videos\\\\Complete\\\\TV.Show.S04E13.720p.BluRay.x264-xHD",
"has\_rating": false,
"status": "Completed",
"script\_line": "",
"completed": 1469172947,
"time\_added": 1469171000,
"nzo\_id": "SABnzbd\_nzo\_gqhp63",
"downloaded": 2491255137,
"report": "",
"password": "",
"path": "\\\\\\\\?\\\\C:\\\\SABnzbd\\\\TV.Show.S04E13.720p.BluRay.x264-xHD",
"postproc\_time": 82,
"name": "TV.Show.S04E13.720p.BluRay.x264-xHD",
"url": "TV.Show.S04E13.720p.BluRay.x264-xHD.nzb",
"md5sum": "85baf55ec0de0dc732c2af6537c5c01b",
"archive": true,
"bytes": 2491255137,
"url\_info": "",
"stage\_log": [
{
"name": "Source",
"actions": [
"TV.Show.S04E13.720p.BluRay.x264-xHD.nzb"
]
},
{
"name": "Download",
"actions": [
"Downloaded in 1 min at an average of 39.4 MB/s\<br/\>Age: 558d\<br/\>15 articles were malformed"
]
},
{
"name": "Servers",
"actions": [
"Frugal=2.3 GB"
]
},
{
"name": "Repair",
"actions": [
"[m0vklMEMKIT5L5XH9z5YTmuquoitCQ3F5LISTLFjT] Repaired in 47 seconds"
]
},
{
"name": "Unpack",
"actions": [
"[m0vklMEMKIT5L5XH9z5YTmuquoitCQ3F5LISTLFjT] Unpacked 1 files/folders in 6 seconds"
]
}
]
}
]
}
}`
```
## Retry history item True/False
Retry history item(s) based on `nzo\_id`. Optionally provide a `password` and an additional NZB as `POST multipart/form-data` in the `nzbfile` field.
NOTE Pay attention to the different variable names used here: `value` and `nzbfile`.
```
`api?mode=retry&value=NZO\_ID&password=password`
```
## Retry all history items True/False
Will retry all failed jobs in the history. However, you are not able to supply passwords or extra NZB's.
```
`api?mode=retry\_all`
```
## Delete/Archive history items True/False
Delete or archive history item(s) based on `nzo\_id`.
NOTE By default files of failed jobs are not removed, add `del\_files=1` to also have them removed.
NOTE By default items are moved to the Archive, add `archive=0` to completely remove them.
```
`api?mode=history&name=delete&value=NZO\_ID`
```
Deleting multiple items (skipping Archive):
```
`api?mode=history&name=delete&archive=0&value=NZO\_ID\_1,NZO\_ID\_2,NZO\_ID\_3`
```
Deleting all items:
```
`api?mode=history&name=delete&value=all`
```
Deleting all **failed** items:
```
`api?mode=history&name=delete&value=failed`
```
## Mark failed job as completed True/False
Mark a failed history item as completed based on `nzo\_id`. This is useful when you want to manually mark a failed job as completed without having to delete it from history.
NOTE This will automatically remove any incomplete download files associated with the job and update the job status to "Completed".
```
`api?mode=history&name=mark\_as\_completed&value=NZO\_ID`
```
Marking multiple items as completed:
```
`api?mode=history&name=mark\_as\_completed&value=NZO\_ID\_1,NZO\_ID\_2,NZO\_ID\_3`
```
# Status functions
NOTE Added in 3.4.0, older versions only have [fullstatus](#fullstatus).
|Function|Description|
|[status](#fullstatus) / [fullstatus](#fullstatus)|All status information|
|[unblock\_server](#unblock_server)|True/False Unblock server|
|[delete\_orphan](#delete_orphan)|True/False Delete orphaned job|
|`mode=status``name=delete\_all\_orphan`|True/False Delete all orphaned jobs|
|[add\_orphan](#add_orphan)|True/False Retry orphaned job|
|`mode=status``name=add\_all\_orphan`|True/False Retry all orphaned jobs|
## Status information
Get all status information available from SABnzbd. Below are only the values that are different from calls to `queue`.
NOTE Getting the public IPv4 address might take some time, so it can be skipped by setting `skip\_dashboard=1`. To calculate performance measures, add `calculate\_performance=1`.
```
`api?mode=status&skip\_dashboard=0`
```
NOTE Some of the less obvious output parameters are described below.
|Output parameter|Description|
|`darwin`|`true` when OS running SABnzbd is macOS|
|`nt`|`true` when OS running SABnzbd is Windows|
|`folders`|The orphaned job folder left in the Incomplete folder. Orphaned jobs can only be removed from a skin, not through the API|
|`pystone`|Indication of CPU speed, see [Highspeed Downloading](/wiki/advanced/highspeed-downloading)|
|`loadavg`|On Linux this will contain a string with information about system load|
```
`{
"status": {
"localipv4": "192.168.0.1",
"ipv6": null,
"publicipv4": "46.00.00.103",
"dnslookup": "OK",
"folders": [
"Lost.Folder.BRRip.x264.1080p"
],
"cpumodel": "Intel(R) Core(TM) i5-4200U CPU @ 1.60GHz",
"pystone": 88738,
"loadavg": "",
"downloaddir": "C:\\\\SABnzbd",
"downloaddirspeed": 0,
"completedir": "C:\\\\Users\\\\xxx\\\\Videos\\\\Complete",
"completedirspeed": 0,
"loglevel": "0",
"logfile": "C:\\\\Users\\\\xxx\\\\AppData\\\\Local\\\\sabnzbd\\\\logs\\\\sabnzbd.log",
"configfn": "C:\\\\Users\\\\xxx\\\\AppData\\\\Local\\\\sabnzbd\\\\sabnzbd.ini",
"nt": true,
"darwin": false,
"confighelpuri": "https://sabnzbd.org/wiki/configuration/5.0/",
"uptime": "3h",
"color\_scheme": "Default",
"webdir": "C:\\\\Program Files\\\\SABnzbd\\\\interfaces\\\\Glitter\\\\templates",
"active\_lang": "en",
"restart\_req": false,
"power\_options": true,
"pp\_pause\_event": false,
"pid": 123,
"weblogfile": null,
"new\_release": false,
"new\_rel\_url": null,
"have\_warnings": "0",
"warnings": [],
"servers": [
{
"servername": "Frugal",
"servertotalconn": 25,
"serverssl": 0,
"serveractiveconn": 25,
"serveroptional": 0,
"serveractive": true,
"servererror": "",
"serverpriority": 0,
"serverbps": "11.1 M",
"serverconnections": [
{
"thrdnum": 1,
"nzo\_name": "Movie.BRRip.x264.1080p",
"nzf\_name": "93a4ec7c37752640deab48dabb46b164.01",
"art\_name": "1467157804579212986$gps@gopoststuff"
},
{
"thrdnum": 2,
"nzo\_name": "Movie.BRRip.x264.1080p",
"nzf\_name": "93a4ec7c37752640deab48dabb46b164.02",
"art\_name": "1467157807935349477$gps@gopoststuff"
},
{
"thrdnum": 3,
"nzo\_name": "Movie.BRRip.x264.1080p",
"nzf\_name": "93a4ec7c37752640deab48dabb46b164.03",
"art\_name": "1467157811461680159$gps@gopoststuff"
}
]
},
{
"servername": "Nextgennews",
"servertotalconn": 15,
"serverssl": 0,
"serveractiveconn": 0,
"serveroptional": 0,
"serveractive": true,
"servererror": "",
"serverpriority": 1,
"serverbps": "0 ",
"serverconnections": []
}
]
}
}`
```
## Unblock server True/False
Unblock server based on `servername` from the [status](#fullstatus).
```
`api?mode=status&name=unblock\_server&value=SERVERNAME`
```
## Delete orphaned job True/False
Delete orphaned job based on the folder name from the [status](#fullstatus). Make sure that you URL-encode the folder name.
```
`api?mode=status&name=delete\_orphan&value=FOLDERNAME`
```
## Retry orphaned job True/False
Retry orphaned job based on the folder name from the [status](#fullstatus). Make sure that you URL-encode the folder name.
```
`api?mode=status&name=add\_orphan&value=FOLDERNAME`
```
# Other functions
NOTE Other functions are listed below, some straightforward commands are described only in this table and can simply be activated by calling:
```
`api?mode=FUNCTION`
```
|Function|Description|
|`version`|Get version of running SABnzbd|
|`auth`|Get authentication methods available for interaction with the API|
|[warnings](#warnings)|Get all active warnings|
|[warnings clear](#warnings_clear)|True/False Clear all active warnings|
|[get\_cats](#get_cats)|Get all categories|
|[get\_scripts](#get_scripts)|Get all scripts|
|[server\_stats](#server_stats)|Get download statistics|
|[showlog](#showlog)|Get the anonymized log file|
|[del\_config](#del_config)|True/False Delete a configuration item within the "servers", "rss", "categories", or "sorters" sections.|
|[get\_config](#get_config)|Get value of configuration item|
|[set\_config](#set_config)|Set configuration item to value|
|[set\_config\_default](#set_config_default)|True/False Reset config item to default value|
|`shutdown`|True/False Shutdown SABnzbd|
|`restart`|True/False Restart SABnzbd|
|`restart\_repair`|True/False Restart SABnzbd and perform a queue repair|
|`pause\_pp`|True/False Pause post-processing queue|
|`resume\_pp`|True/False Resume post-processing queue|
|`rss\_now`|True/False Fetch and process all RSS feeds|
|`watched\_now`|True/False Scan Watched Folder now|
|`reset\_quota`|True/False Reset the user defined quota to 0|
|`mode=config``name=set\_apikey`|Reset the API key, returns the new key|
|`mode=config``name=set\_nzbkey`|Reset the NZB key, returns the new key|
|`mode=config``name=regenerate\_certs`|True/False Regenerate the self-signed certificate for HTTPS connection to interface, requires SABnzbd restart to take effect|
|[translate](#translate)|Translate a text to user's locale|
## Get all categories
```
`api?mode=get\_cats`
```
```
`{
"categories": [
"\*",
"movies",
"series",
"tv"
]
}`
```
## Get all scripts
```
`api?mode=get\_scripts`
```
```
`{
"scripts": [
"None",
"Notify.py",
"sabnzbd-notify.py"
]
}`
```
## Download statistics
Return download statistics in bytes, total and per-server.
```
`api?mode=server\_stats`
```
```
`{
"day": 2352634799,
"week": 32934490677,
"month": 179983557488,
"total": 728426161290,
"servers": {
"eunews.server.com": {
"week": 19783288936,
"total": 163741252273,
"day": 2352634799,
"month": 90478917031,
"daily": {
"2017-01-28": 1234,
"2017-01-29": 4567
},
"articles\_tried": 929299,
"articles\_success": 8299
},
"News.server.net": {
"week": 13151201741,
"total": 165783396295,
"day": 0,
"month": 89499300889,
"daily": {
"2017-01-28": 1234,
"2017-01-29": 4567
},
"articles\_tried": 520400,
"articles\_success": 78881
}
}
}`
```
## Get the anonymized log file
The log file is automatically anonymized and a copy of the `sabnzbd.ini` is attached.
NOTE This call ignores the `output` parameter, it will always serve the file as a download.
```
`api?mode=showlog`
```
## Delete a configuration item within the "servers", "rss", "categories", or "sorters" sections.
Used to delete an entry from the limited sections.
Example of deleting a `servers` by keyword:
```
`api?mode=del\_config&section=servers&keyword=ServerName`
```
Example of deleting a `rss` by keyword:
```
`api?mode=del\_config&section=rss&keyword=Feed1`
```
Example of deleting a `categories` by keyword:
```
`api?mode=del\_config&section=categories&keyword=audio`
```
If you attempt to delete the default category `\*` from the `categories` section, the system will replace the default categories.
```
`api?mode=del\_config&section=categories&keyword=\*`
```
## Get config item(s)
You can read the whole configuration, a sub-set or a single setting.
NOTE You will never receive passwords, each character will be replaced by `\*\*\*` characters. You can set new passwords through the [set\_config](#set_config) call.
```
`api?mode=get\_config`
```
All elements in `misc` section:
```
`api?mode=get\_config&section=misc`
```
Example of filtering the server settings by keyword:
```
`api?mode=get\_config&section=servers&keyword=ServerName`
```
## Set config item
In order to change a setting, you need to provide the `section` and `keyword` of the setting:
```
`api?mode=set\_config&section=SECTION&keyword=KEYWORD&value=VALUE`
```
Returns the new setting when saved successfully.
For example, changing the Cleanup-list to `.sfv,.nzb,.nfo,.ext` would look like this:
```
`api?mode=set\_config&section=misc&keyword=cleanup\_list&value=.sfv,.nzb,.nfo,.ext`
```
## Setting server, RSS feed, category, or sorter settings
Changing settings for these sections is a bit different and requires one to specify the correct `name` of the server, RSS feed, category, or sorter. This `name` you can find in between double square brackets in the relevant section of your `sabnzbd.ini`, where it will for example say `[[news.newshosting.com]]` within the `[servers]` section, or `[[Feed1]]` in the `[rss]` section, and so on. Below the name you can see all variables you could set via the API for an item in that section. If the specified `name` doesn't match an existing one in the given section, it will be added there as a new item.
Server example:
```
`api?mode=set\_config&section=servers&name=SERVER\_NAME&username=VALUE\_1&connections=VALUE\_2`
```
Category example:
```
`api?mode=set\_config&section=categories&name=CATEGORY\_NAME&dir=CATEGORY\_DIR`
```
RSS feed example:
```
`api?mode=set\_config&section=rss&name=FEED\_NAME&enable=VALUE\_1&pp=VALUE\_2`
```
Sorter example:
```
`api?mode=set\_config&section=sorters&name=SORTER\_NAME&sort\_string=VALUE\_1&sort\_cats=VALUE\_2&sort\_type=VALUE\_3`
```
## Reset config item to default value True/False
NOTE Currently only for settings in the `misc` section of the config. Can accept multiple keywords to reset.
```
`api?mode=set\_config\_default&keyword=SETTING\_1&keyword=SETTING\_2`
```
## Get all active warnings
```
`api?mode=warnings`
```
```
`{
"warnings": [
{
"text": "API key missing, please enter the API key from Config-\>General into your 3rd party program",
"type": "WARNING",
"time": 1505153489
},
{
"text": "Thread [[emailprotected]](/cdn-cgi/l/email-protection):119: login failed",
"type": "ERROR",
"time": 1505139501
}
]
}`
```
## Clear all active warnings True/False
```
`api?mode=warnings&name=clear`
```
## Translate a text
Translate any text known to SABnzbd from English to the locale setting of the user.
```
`api?mode=translate&value=Watched%20Folder`
```
Will return for Dutch:
```
`{
"value": "Bewaakte map"
}`
```
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)