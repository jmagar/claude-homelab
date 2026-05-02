SABnzbd -
Wiki -
Email Templates
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Email+Templates&amp;body=##+URL:+/wiki/extra/email-templates.html
Improvement:
>)
Email Templates
SABnzbd can send e-mail notifications on various events of NZB job.
There is a default format, but you can format your own email using a template.
The template markup language is [Cheetah](http://cheetahtemplate.org/), refer to their [User Guide](http://cheetahtemplate.org/users_guide/index.html) to make yourself familiar with this template language.
### SABnzbd makes these variables available for use in the relevant template files:
* [ `email-\*.tmpl`](#templateEmail)
* [ `rss-\*.tmpl`](#templateRss)
* [ `badfetch-\*.tmpl`](#templateBadFetch)
|Used for default (completed/failed) related events.|
|Variable|Description|
|$to|One or more recipients [1](#footnote-1)|
|$from|Sender|
|$status|Job status: True for success|
|$name|Name of the job|
|$msgid|Indexer's report number (if supported)|
|$end\_time|Time of job completion|
|$size|Size of the job, includes K/M/G postfix|
|$stages|Output of the post-processing = Dictionary of stages|
|$stage in $stages|Name of the stage|
|$result in $stages[$stage]|Results of the stage|
|$script|Script name (empty if no script has run)|
|$script\_ret|Output of the script|
|$cat|The category of the job|
|$path|The path of the job `\\\\?\\` long path notation will be used on windows|
|Used for RSS related events.|
|Variable|Description|
|$to|One or more recipients [1](#footnote-1)|
|$from|Sender|
|$amount|Number of jobs added|
|$feed|Feed name|
|$jobs|List of jobs|
|$job in $jobs|Job title|
|Used to report failed URL-based NZB retrievals.|
|Variable|Description|
|$to|One or more recipients [1](#footnote-1)|
|$from|Sender|
|$url|URL|
|$msg|Error message|
You can create one or more of your own templates. In the [Config-\>Folders](/wiki/configuration/5.0/folders) page you can specify a folder for the templates.
SABnzbd will look for files ending with `.tmpl` and will send an email message for *every* template.
If you want to use different email formats based on the email recipient, you can use conditional formatting (see example below).
# Standard template
WARNING do not modify the standard templates, but make a copy in your own template folder.
If you modify the standard templates, they will be lost when uninstalling or when upgrading to a new SABnzbd release.
Below is the standard template, called `email-us-en.tmpl`, which is located in the program folder of SABnzbd.
In the template whitespace and line endings are significant.
Note the empty line between the headers and the actual message. This is an essential element of the email protocol.
Also, note the **slurp** command, this removes unwanted line endings in the **for**-loops.
```
`#encoding utf-8
##
## Default Email template for SABnzbd
## This a Cheetah template
## Documentation: https://sabnzbd.org/wiki/extra/email-templates
##
## Newlines and whitespace are significant!
##
## These are the email headers
To: $to
From: $from
Date: $date
Subject: SABnzbd has \<!--#if $status then "completed" else "failed" #--\> job $name
X-priority: 5
X-MS-priority: 5
## After this comes the body, the empty line is required!
Hi,
\<!--#if $status #--\>
SABnzbd has downloaded "$name" \<!--#if $msgid=="" then "" else "(newzbin #" + $msgid + ")"#--\>
\<!--#else#--\>
SABnzbd has failed to download "$name" \<!--#if $msgid=="" then "" else "(newzbin #" + $msgid + ")"#--\>
\<!--#end if#--\>
Finished at $end\_time
Downloaded $size
Results of the job:
\<!--#for $stage in $stages #--\>
Stage $stage \<!--#slurp#--\>
\<!--#for $result in $stages[$stage]#--\>
$result \<!--#slurp#--\>
\<!--#end for#--\>
\<!--#end for#--\>
\<!--#if $script!="" #--\>
Output from user script "$script" (Exit code = $script\_ret):
$script\_output
\<!--#end if#--\>
\<!--#if $status #--\>
Enjoy!
\<!--#else#--\>
Sorry!
\<!--#end if#--\>`
```
## Languages
The email template is available in 5 languages. Given the UI language, the right template will be picked.
Note that when you have your own email template folder, SABnzbd does not support multiple languages.
It will just process all the templates in the folder, thereby assuming that you will write your templates
in the desired language anyway.
## Conditional emails
Should you want to make a conditional template, you should place your test before any of the fields.
When the end result is an empty email, SABnzbd will not send it.
A very simplified example:
```
`#encoding utf-8
\<!--#if $cat == "video" #--\>\<!--#slurp#--\>
To: $to
From: $from
Date: $date
Subject: SABnzbd has \<!--#if $status then "completed" else "failed" #--\> job $name
X-priority: 5
X-MS-priority: 5
## After this comes the body, the empty line is required!
Hi,
rest of the message
\<!--#end if#--\>`
```
Footnotes
1. Setting this variable in the template does not change the actual recipient e-mailed.
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)