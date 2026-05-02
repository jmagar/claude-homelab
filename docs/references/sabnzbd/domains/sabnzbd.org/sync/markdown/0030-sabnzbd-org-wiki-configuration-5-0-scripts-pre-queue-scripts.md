SABnzbd -
Wiki -
Pre-queue scripts
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Pre-queue+scripts&amp;body=##+URL:+/wiki/configuration/5.0/scripts/pre-queue-scripts.html
Improvement:
>)
Pre-queue scripts
You can choose to let SABnzbd run a script just before an NZB enters the queue.
This script determines whether the NZB should be accepted and can modify a number of job parameters.
Scripts may use any scripting language available on your system; common choices are Python, Unix shell, and Windows batch scripts.
All scripts must be located in the Scripts-directory, specified in [Config-\>Folders](/wiki/configuration/5.0/folders) and must be executable.
On Unix-like operating systems (Linux, BSD, etc.) this means the x-bit must be on. On Windows, the requirement is that the script's extension is listed in your system's `PATHEXT` environment variable.
Once everything is in place, the Pre-Queue Script can be set in [Config-\>Switches](/wiki/configuration/5.0/switches) (enable Advanced Settings).
The script must write results to the console.
Exit code `0` will make SABnzbd inspect the returned output.
If the script has an exit code other than `0`, script failure is assumed and the NZB accepted without changes.
## Input parameters
All parameters (except 1) can be empty, meaning a default value. Use `%1` in Windows scripts and `$1` in Unix scripts. Note that on Windows the input parameters are surrounded by quotes (e.g. `"job name"`).
NOTE **Much more information is available to scripts via environment variables, [see below](#env_vars)!**
|Position|Description|
|1|Clean version of the job name (no path info and `.nzb` removed) includes the password if present, in the `job name / password` notation|
|2|Post Processing (PP) flags:
* `0` = Download
* `1` = +Repair
* `2` = +Unpack
* `3` = +Delete|
|3|Category|
|4|Script (no path)|
|5|Priority
* `-100` = Default
* `-2` = Paused
* `-1` = Low
* `0` = Normal
* `1` = High
* `2` = Force|
|6|Size of the download (in bytes)|
|7|Group list (separated by spaces)|
## Return parameters
The script can refuse or accept the NZB and it can also return alternative parameters. These parameters should be written to the console, each parameter on a separate line.
SABnzbd uses the first 7 lines of output, so they should be empty (original value will be used) or only contain proper data.
Anything after line 7 is ignored.
NOTE To manipulate duplicate detection, you should assemble a new name and return a recognized format.
|Position|Description|
|1|
* `0` = Refuse
* `1` = Accept
* `2` = Accept but fail, this way post-processing scripts for the job will be activated if necessary.|
|2|
Clean version of the job name (no path info and `.nzb` removed) can be used to set a password when provided in the `job name / password` notation|
|3|Post Processing (PP) flags:
* `0` = Download
* `1` = +Repair
* `2` = +Unpack
* `3` = +Delete|
|4|Category|
|5|Script (no path)|
|6|Priority
* `-100` = Default
* `-2` = Paused
* `-1` = Low
* `0` = Normal
* `1` = High
* `2` = Force|
|7|Group to be used (in case your provider doesn't carry all groups and there are multiple groups in the NZB)|
## Environment variables
Your script can get extra information via environment variables (return information should still be sent as plain output):
|Variable|Description|
|`SAB\_SCRIPT`|The name of the current script|
|`SAB\_FINAL\_NAME`|The name of the job in the queue and of the final folder|
|`SAB\_FILENAME`|The NZB filename (after grabbing from the URL)|
|`SAB\_CAT`|What category was assigned|
|`SAB\_BYTES`|Total number of bytes|
|`SAB\_DUPLICATE`|Is this a duplicate and what type|
|`SAB\_DUPLICATE\_KEY`|The key used for Smart Duplicate Detection|
|`SAB\_PASSWORD`|What was the password supplied by the NZB or the user|
|`SAB\_STATUS`|Current status (completed/failed/running)|
|`SAB\_PP`|What post-processing was activated (download/repair/unpack/delete)|
|`SAB\_REPAIR`|Was repair selected by user|
|`SAB\_UNPACK`|Was unpack selected by user|
|`SAB\_PRIORITY`|Priority set by user|
|`SAB\_GROUPS`|Newsgroups listed in the NZB|
|`SAB\_VERSION`|The version of SABnzbd used|
|`SAB\_PROGRAM\_DIR`|The directory where the current SABnzbd instance is located|
|`SAB\_API\_KEY`|The API-key that you can use to communicate with the SABnzbd [API](/wiki/configuration/5.0/api).|
|`SAB\_API\_URL`|
The URL to the SABnzbd [API](/wiki/configuration/5.0/api), for example `http://127.0.0.1:8080/api`.
It does not include the required `apikey` parameter, use `SAB\_API\_KEY`.
|
|`SAB\_PAR2\_COMMAND`|The path to the `par2` command on the system that SABnzbd uses|
|`SAB\_MULTIPAR\_COMMAND`|Windows-only (empty on other systems). The path to the MultiPar command on the system that SABnzbd uses|
|`SAB\_RAR\_COMMAND`|The path to the `unrar` command on the system that SABnzbd uses|
|`SAB\_ZIP\_COMMAND`|The path to the `unzip` command on the system that SABnzbd uses|
|`SAB\_7ZIP\_COMMAND`|The path to the `7z` command on the system that SABnzbd uses. Not all systems have 7zip installed (it's optional for SABnzbd), so this can also be empty|
|`SAB\_TITLE`|Title of the movie or show|
|`SAB\_SEASON`|Season (1..99)|
|`SAB\_EPISODE`|Episode (1..99)|
|`SAB\_EPISODE\_NAME`|Episode name|
|`SAB\_IS\_PROPER`|Tagged as Proper (True or False)|
|`SAB\_RESOLUTION`|Resolution|
|`SAB\_DECADE`|Decade|
|`SAB\_YEAR`|Year|
|`SAB\_MONTH`|Month|
|`SAB\_DAY`|Day|
|`SAB\_JOB\_TYPE`|Job type (tv, date, movie, or unknown)|
## Example Script 1
Example of a Windows batch file that forces high priority on anything smaller than 2GB.
```
`@echo off
echo 1
echo.
echo.
echo.
echo.
if %6 LSS 2000000000 echo 1`
```
Save it as file `size-checker.cmd` and put in the scripts folder.
## Example Script 2
A python script to set prio to Force on downloads smaller than 50MB:
```
`import sys
try:
# Parse the input variables for SABnzbd version \>= 4.2.0
(scriptname, nzbname, postprocflags, category, script, prio, downloadsize, grouplist) = sys.argv
except Exception:
sys.exit(1) # a non-zero exit status causes SABnzbd to ignore the output of this script
prio = -100 # Default
if int(downloadsize) \< 50\*1024\*\*2:
prio = 2
print("1") # Accept the job
print()
print()
print()
print()
print(prio)
print()
# 0 means OK
sys.exit(0)`
```
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)