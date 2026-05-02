SABnzbd -
Wiki -
Switches
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Switches&amp;body=##+URL:+/wiki/configuration/5.0/switches.html
Improvement:
>)
Switches
## Server
|**Maximum retries**
Advanced|To prevent deadlock, SABnzbd will only try each server a limited amount of times.|
|**Disconnect on empty queue**
Advanced|Disconnect from Usenet server(s) when queue is empty or paused. This will help you switch between different systems. Set this option off when your server keeps complaining that you have too many connections open.|
## Queue
|**Pre-queue script**
Advanced|See: [pre-queue script](/wiki/configuration/5.0/scripts/pre-queue-scripts).|
|**On queue finish script**
Advanced|Executed after the queue finishes downloading. No special parameters are supplied.
For more information on running scripts, read the general information here: [pre-queue script](/wiki/configuration/5.0/scripts/pre-queue-scripts).|
|**Propagation delay**|If you experience very young posts failing due to missing blocks your server might still be in the process of receiving the posts. Delaying the these very young posts a few minutes might solve these issues. Posts will be paused until they are at least this age.
Setting job priority to Force will skip the delay.|
|**Only get articles for top of queue**|When a top-job stalls for some reason, start downloading segments for the next job. This prevents a job from blocking the queue when you have an unreliable Usenet server. If you need this behavior, set the option off. If you have a reliable server (most paid servers), you might as well set this on.|
|**Check before download**
Advanced|
To prevent wasteful downloading, you can let SABnzbd check the presence of a job on the server, before actually downloading it. If less than 100.2% of the total available data (including par2 files) is available, the job will be send to History as failed. When you click "Retry", SABnzbd will attempt the download anyway.
NOTE The check slows down the total download considerably, use only when you're not in a hurry but wish not to waste your quota instead. Also it cannot be completely reliable, due to the way some servers remove posts.
|
|**Abort jobs that cannot be completed**|If on, when during download it becomes clear that it can never be repaired, it will be aborted and send to the History as failed. Should you retry the job, the check will not be done again, but the whole job will be tried instead.|
|**Identical download detection**|See: [Duplicate Detection](/wiki/extra/duplicate-detection)|
|**Smart duplicate detection**|See: [Duplicate Detection](/wiki/extra/duplicate-detection)|
|**Allow proper releases**
Advanced|See: [Duplicate Detection](/wiki/extra/duplicate-detection)|
|**Action when encrypted RAR is downloaded**|For more info see [Password-protected RARs](/wiki/advanced/password-protected-rars). You can choose to either continue, abort or pause the download.|
|**Unwanted extensions**|
Downloads that contain files with a listed extension can be paused or aborted. Extensions are input as a comma-separated list, for example `exe,com,cmd,bat` to trigger on common Windows executable content.
Basic wildcards and regular expressions are also supported, for example `re:mp\*` or `re:r[0-9]{2}` (the latter matching `r00` through `r99`).
In `Blacklist` mode, only the listed extensions trigger the configured action; everything else is ignored. `Whitelist` mode is more paranoid: only listed extensions get a free pass; jobs that contain files with *any* other extension, no matter how small or harmless, will be considered unwanted.
NOTE Whitelist mode is best combined with the Pause action, until you have a carefully curated list of wanted extensions.
|
|**Action when unwanted extension detected**|Pause or abort downloads when an unwanted extension is detected. Setting this option to Off disables detection of unwanted extensions.|
|**Automatically sort queue**
Advanced|Every time a job is added to the queue, the queue can be sorted according to this setting.
NOTE Beware that custom sorting of the queue is lost every time a new job is added.
* `Default` = No auto sorting.
* `Sort by % downloaded` = Sort jobs by percentage downloaded (re-sorts every 30 seconds).
* `Sort by Age` = Sort jobs by their usenet date.
* `Sort by Name` = Sort jobs by their Name (not case sensitive).
* `Sort by Size` = Sort jobs by their Size/Bytes. |
|**Direct Unpack**|Jobs will start unpacking during the downloading to reduce post-processing time. Only works for jobs that do not need repair and do not have strongly obfuscated filenames.
This feature is enabled automatically when your disk-speed is greater than 40MB/s. It will not be enabled automatically again if you manual disable it.|
## Post processing
|**Pause downloading during post-processing**|Will pause the queue while verifying and repairing, only needed for resource-constrained systems (like NAS-devices).|
|**Download all par2 files**
Advanced|Download all par2 files when (after verification) the job was damaged. Prevents multiple rounds of verification.
NOTE SABnzbd will already download extra par2 files if it detects problems during the download, so usually this option is not required.|
|**External process priority**
Advanced|
Windows-only. Set process priority of programs started by SABnzbd, like the repair and unpack processes.
NOTE Setting `High` could result in significant slowdown of the system during processing!
|
|**Extra Par2 parameters**
Advanced|
Extra arguments that will be passed when running `par2` for verification and repair.
Please make sure that you use `par2cmdline-turbo`. On the first page of the Config a warning will be displayed if it is not installed. If you don't see a warning there, you already have it!
* `-m` Set the maximum amount of memory it allowed to use.
* `-t` Limit how many CPU threads it is allowed to use. By default it will use all available threads. You can use `-t1` to only force it to be single-threaded.
* `-T` When verifying files, by default it will scan 2 files at once. If you have an older system with physical drives (HDD's), you can set this to `-T1`. If you have a very fast SDD, you could set this to `-T10`.|
|**Nice parameters**
Advanced|
Linux-only. When SABnzbd runs external tools like `par2` and `unrar`, these tools may use up all CPU capacity.
If you specify any parameters here, the `nice` command will be used to reduce the load on your system.
Popular setting is `-n10`.
For more info, see the [nice man-page](http://linux.die.net/man/1/nice).
If this field is disabled, `nice` is not available on your system.
|
|**IONice parameters**
Advanced|
Linux-only. When SABnzbd runs external tools like `par2` and `unrar`, these tools may use up all disk capacity.
If you specify any parameters here, the `ionice` command will be used to reduce the load on your system.
Popular setting is `-c2 -n4`.
For more info, see the [ionice man-page](http://linux.die.net/man/1/ionice).
If this field is disabled, `ionice` is not available on your system.
|
|**Enable SFV-based checks**
Advanced|If no par2 files are available, use `.sfv` files (if present) to verify files.|
|**Post-Process only verified jobs**
Advanced|Only try to unpack jobs that passed the verification stage. If turned off, all jobs will be marked as Completed and moved to the Complete folder even if they are incomplete.|
|**Enable recursive unpacking**
Advanced|Unpack archives (rar, zip, 7z) within archives.|
|**Ignore any folders inside archives**
Advanced|All files will go into a single folder.|
|**Post-processing script can flag job as failed**
Advanced|Some scripts will return a non-zero exit code when they encounter a problem. You can opt to let a non-zero exit code mark the job as failed. This can be useful when you're using an indexer that offers alternative NZB files or use a front-end (like SickBeard) that will look for alternatives when a job fails.|
|**Ignore samples**|If enabled, delete anything that looks like sample files (containing the words `sample` or `proof`) after completion of post-processing.|
|**Deobfuscate final filenames**|
If filenames of (large) files in the final folder look obfuscated or meaningless (like `19399393.ext` or `timmof.mkv`) they will be renamed to the job name.
Additionally, attempts to set the correct file extension based on the file signature if the extension is not present or meaningless.
NOTE If [Sorting](/wiki/configuration/5.0/sorting) is active for a specific job, this feature will not be applied.
|
|**Cleanup List**|List of file (extensions) that should be deleted in the cleanup stage. Examples: `.nfo, .nfo, .sfv`. You can leave out the dots, so `nfo, nzb, sfv` will do the same.|
|**History Retention**|Automatically delete **completed** jobs from History when new jobs are added or every day at midnight.
* `Move jobs to the archive if the history exceeds specified number of jobs` = Specify exact amount of jobs to keep, moving the oldest ones to the archive.
* `Delete jobs if the history exceeds specified number of jobs` = Specify exact amount of jobs to keep, removing the oldest ones.
* `Move jobs to the archive after specified number of days` = Move jobs to the archive when they are older than the set amount of days.
* `Delete jobs after specified number of days` = Delete jobs automatically when they are older than the set amount of days.
* `Move all completed jobs to archive` = All jobs are moved to the archive.
* `Delete all completed jobs` = No jobs are saved in the History.NOTE Beware that Duplicate Detection and some external tools rely on History information, so keep items in the History or Archive if you want them checked for Duplicate Detection.
|
## Naming
|**Enable folder rename**
Advanced|
When SABnzbd unpacks, it will do so in a folder prefixed with `\_UNPACK\_`. This is to prevent users or other software from processing the file before unpacking finishes.
Some operating systems cannot handle this. Therefore, it's possible to disable the feature.
Additionally, if the unpack folder contains only a single subfolder, the contents of the subfolder will be moved to the main folder and the subfolder will be deleted.
|
|**Replace Spaces in folder name**
Advanced|Enable to replace spaces with underscores in folder names.|
|**Replace underscores in folder name**
Advanced|Enable to replace underscores with dots in folder names.|
|**Replace dots in folder name**
Advanced|Enable to replace dots with spaces in folder names.|
|**Make Windows compatible**
Advanced|Especially useful for servers and sometimes external disks. Make sure names are compatible with Windows.|
## Quota
If you're unlucky enough to have an ISP that uses strict download caps, you may want to set a monthly quota for SABnzb.
|**Size**|In bytes. Example: `5G` (for 5 GB) or `1T` (for 1 TB)|
|**Quota Period**|Daily, Weekly or Monthly quota|
|**Reset day**|The day of the week or month when your ISP will reset your cap. Use 31 for the last day of the month.
Optionally you can add a time of day, like 23:30.
* So for monthly you would enter `2023:30`, meaning the 20th of each month at 11:30PM.
* For weekly `24:00`, meaning every Tuesday at 4AM.
* Even daily is possible: `3:00`|
|**Auto resume**|Set this on when you want to resume downloading once the quota has been reset. Otherwise you will have to resume manually|
**Please note file following:**
* Jobs with `Force` priority will ignore the paused state.
* Don't set the quota too high. Leave room for other internet use.
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)