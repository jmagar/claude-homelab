SABnzbd -
Wiki -
FAQ
[
](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=wc1)
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+FAQ&amp;body=##+URL:+/wiki/faq.html
Improvement:
>)
FAQ
* [About SABnzbd](#toc0)
* [What is SABnzbd?](#toc1)
* [Why should I use SABnzbd over other programs such as Grabit?](#toc2)
* [What do I need to get started with using SABnzbd?](#toc3)
* [Which versions of Python are supported?](#toc4)
* [Can SABnzbd run on NAS / Android / operating system XYZ / … ?](#toc5)
* [Troubleshooting SABnzbd](#toc6)
* [Beware of Firewalls and Virus scanners](#toc7)
* [SABnzbd won't start!](#toc9)
* [I'm using Opera! Why doesn't it work?](#toc10)
* [SABnzbd says "Out of your server's retention?". What does that mean?](#toc11)
* [SABnzbd shows a very slow download speed, with a extremely high ETA, but is progressing quite fast through the post, and then fails.](#toc12)
* [SABnzbd is stuck repairing a file, how do I fix it?](#toc13)
* [An NZB just failed post-processing, how do I re-process it?](#toc14)
* [An NZB died halfway through downloading. Do I really have to re-download all 600 gigs?](#toc15)
* [What are CRC errors, and how do I fix them?](#toc16)
* [Where are are my files?](#toc17)
* [SABnzbd is asking for a password and I didn't set one/forgotten the password, what do I do?](#why-login)
* [Error: (10049, "Can't assign requested address")](#toc22)
* ["API Key incorrect, Use the api key from Config-\>General in your 3rd party program" what does that mean?](#toc33)
* [[Errno 111] Failed to connect: (110, 'timed out') -1 @news.example.com:119" when clicking on Test Server](#toc35)
* [SABnzbd slows down when getting very close to the end of a job - News server timeouts](#endslow)
* [Starting SABnzbd with default settings](#freshstart)
* [Using SABnzbd](#toc23)
* [If I close my Internet browser does SABnzbd close too?](#toc24)
* [Why doesn't SABnzbd download all PARs for a post?](#toc25)
* [How can I download a set of PAR files without activating auto-par2 mode?](#toc26)
* [How do I upgrade SABnzbd to a new version?](#toc27)
* [Virus scanners and false positives with new SABnzbd releases](#virusscanners)
* [What does R/U/D or Repair/Unpack/Delete mean?](#toc28)
* [How do I change my download folder to another drive?](#toc29)
* [How do I run SABnzbd as a portable/self contained program?](#toc30)
* ["My Internet connection is 200Mbps, and SABnzbd only downloads at 20MB/s"?](#toc31)
* ["Repair failed, not enough repair blocks (585 short)" what does that mean?](#toc32)
* [A download says "ENCRYPTED". What does that mean, and is there anything I can do?](#toc36)
* [Do I need port forwarding for SABnzbd usage?](#toc37)
* [Some of the files after unpacking have very strange names (deobfuscation)](#deobfuscate)
# About SABnzbd
## What is SABnzbd?
SABnzbd is a multi-platform binary newsgroup downloader.
The program works in the background and simplifies the downloading verifying and extracting of files from [Usenet](http://en.wikipedia.org/wiki/Usenet).
SABnzbd uses [NZB](http://en.wikipedia.org/wiki/Nzb) files (similar to .torrent files, but for Usenet), instead of browsing Usenet directly. NZBs can be acquired from a [variety of usenet indexing services](/wiki/introduction/nzb-sources).
SABnzbd's main interface is web-based, this means with a little bit of configuration you can easily check and add files from other PC's around the world or on other devices such as the iPhone.
## Why should I use SABnzbd over other programs such as Grabit?
Grabit is great for manually downloading a few moderately-sized posts, or for browsing newsgroups. Generally, tasks that require a lot of direct interaction.
SABnzbd's goal is to be as automated as possible. Once configured, you should never really have to look directly at SABnzbd ever again, you just send it NZBs and files appear at the other end. Our full-featured [API](/wiki/configuration/5.0/api) means that browser plugins can seamlessly handle all the transferring of NZBs from the web to SABnzbd, and provide you with a method to check on your queue's progress.
You can even put SABnzbd on a lowly server and let it work night and day. It can even schedule, so that, for instance, you only download at night. Since it has a web interface, SABnzbd is built from the ground-up to be accessed remotely just as easily as it can be accessed locally, so it works great on little servers.
## What do I need to get started with using SABnzbd?
Usenet/Newsgroup Provider
NZB Website
Third Party tools
## Which versions of Python are supported?
SABnzbd only supports Python 3.8 or higher. Python 2 is no longer supported.
## Can SABnzbd run on NAS / Android / operating system XYZ / … ?
SABnzbd can run on an operating system that provides / runs:
1. Python 3.8 (or higher) and pip
2. the Python library Cheetah (installed using pip)
3. par2 and unrar
4. optionally the Python library yEnc
The creators of SABnzbd provide the source code of SABnzbd, plus ready-to-install-and-run packages for Windows and macOS.
Others provide (or don't provide) packages for other operating systems. If you want SABnzbd on another operating system, search for an existing package for that OS, or make it work yourself.
On top of the above, SABnzbd requires some amount of RAM: more is better, especially for high-speed Internet connections and/or big downloads. 256MB of RAM (or less) without swap space will cause problems and crashes.
As Python is not available on Android, SABnzbd cannot run on Android.
# Troubleshooting SABnzbd
## Beware of Firewalls and Virus scanners
These are useful but many are too eager to interfere with our software.
Firewalls are suspicious of Internet activity and surprise: SABnzbd does that.
For more info see: [How do I survive my firewall and virus scanner?](/wiki/extra/firewalls-and-virus-scanners)
## SABnzbd won't start!
This typically occurs because for some reason SABnzbd can't open port 8080, or whatever port you've set it to run on. Unfortunately, this could be caused by a wide variety of issues. Here are a few of them:
* Something else is running on the port. Either stop it, or have SABnzbd run on another port.
* Something is preventing SABnzbd from opening any port, like a firewall application, or antivirus, or something else that might be trying to "protect" you. Either whitelist SABnzbd or reconsider your antivirus software choice. (The very good and free [Microsoft Security Essentials](http://www.microsoft.com/Security_Essentials/) has no problem with SABnzbd)
* You lack the permissions to open the port you're trying. This tends to crop up on Linux systems, where ports under 1024 (like port 80) require root permissions to open.
A way to discover what's going on, is to open a command prompt or terminal and go to the directory that contains the SABnzbd executable, and start that.
On Windows, you should run `.\\SABnzbd-consolese.exe`. On MacOS you should run `/Applications/SABnzbd.app/Contents/MacOS/SABnzbd --console`. You should now see the output in the command prompt or terminal.
If somehow the host and/or port was changed, you can reset them by starting `SABnzbd - SafeMode` on Windows or clicking the SABnzbd icon in the top bar and use the `Troubleshoot` options.
On other systems you can edit `sabnzbd.ini`.
## I'm using Opera! Why doesn't it work?
Opera sometimes has a different interpretation of localhost than SABnzbd has. Try `http://[::1]:8080/sabnzbd` or `http://127.0.0.1:8080/sabnzbd`, one of the two should work.
This happens because many operating systems have an ambiguous definition of localhost. They list both `127.0.0.1` and `[::1]` has IP addresses (IPv4 and IPv6 respectively), while these are in reality two independent addresses.
## SABnzbd says "Out of your server's retention?". What does that mean?
This means the post you're trying to download is not available on the news server you're using. This might because the post is older than the your news server's retention time (number of days the post will stay on the news server, somewhere between 10 and 1000 days), or the specific post has been removed by the server's administrator. Also read our information about [Downloads cannot be completed
](/wiki/introduction/downloads-cannot-be-completed.html).
You can see the age of a post in the search engine (like binsearch) you use, and by hovering above the line containing the download while it's being downloaded.
Solution: find a 'younger' post, or find a newsprovider with a longer retention.
If you think it's SABnzbd's fault, you should try to download the same post with another program like Grabit (Windows) or nzbget (Linux) to see if that works.
## SABnzbd shows a very slow download speed, with a extremely high ETA, but is progressing quite fast through the post, and then fails.
These are the symptoms of a post that's not available on your news server. Easy check: during the download, hover your mouse above the item; it will show a high number of missing articles.
## SABnzbd is stuck repairing a file, how do I fix it?
SABnzbd processes files sequentially, so if Par2 stops working the rest of your downloaded files will get hung up. To fix this, open your operating system's task manager and manually kill the par2 process. The item it was working on will be marked as "failed", so you'll have to manually verify and unrar that job.
## An NZB just failed post-processing, how do I re-process it?
At the moment there is no method to do this automatically in SABnzbd. However, the only time doing this should actually accomplish anything is if you had to kill a stalled Par2 or Unrar process. In all other cases, having SABnzbd try to re-try a download shouldn't do anything, since if SABnzbd failed it likely failed for a *good reason*. However, at a future date we may implement re-try post-processing as part of a broader post-processing queue rewrite.
## An NZB died halfway through downloading. Do I really have to re-download all 600 gigs?
When you used a partial NZB or did not have enough par2 files, all is not lost.
A failed job will have an entry in History. If it's just a case of a full destination disk, click Retry.
If you now have a larger NZB with either more RAR files or just more PAR2 file, click Retry and enter the new NZB in the dialog.
SABnzbd will skip each files that has already been downloaded and then proceed to download the additional files.
Please note that SABnzbd cannot add missing articles to existing files.
## Where are are my files?
See: [Folder Setup](/wiki/advanced/directory-setup).
## SABnzbd is asking for a password and I didn't set one/forgotten the password, what do I do?
Most likely your browser or password manager automatically filled your news server username and password as the main SABnzbd username and password. You can reset them by starting `SABnzbd - SafeMode` on Windows or clicking the SABnzbd icon in the top bar and use the `Troubleshoot` options.
On other systems you can edit `sabnzbd.ini`.
Shut down SABnzbd, find the file [sabnzbd.ini](/wiki/advanced/directory-setup) and open it with an editor. Look for:
```
`username = user
password = pass`
```
and change the lines to:
```
`username = ""
password = ""`
```
Save the .ini and restart SABnzbd.
## Error: (10049, "Can't assign requested address")
If you start up SABnzbd, and you get 'error: (10049, "Can't assign requested address")', you very likely entered the IP address of your system in Config -\> General -\> Host and now your router has assigned another address.
To set the host quickly on a Windows system: Open and CMD.EXE prompt (use Start menu) and type (including quotes):
```
`"C:\\Program Files\\SABnzbd\\SABnzbd-console.exe" --server 0.0.0.0:8080`
```
Then press Enter
If you're using a 32-bit Windows system use:
```
`"C:\\Program Files (x86)\\SABnzbd\\SABnzbd-console.exe" --server 0.0.0.0:8080`
```
On Linux:
```
`sabnzbdplus --server 0.0.0.0:8080`
```
Or you can edit the `host` field in your `sabnzbd.ini` file to `0.0.0.0`.
## "API Key incorrect, Use the api key from Config-\>General in your 3rd party program:" … what does that mean?
If you get "API Key incorrect, Use the api key from Config-\>General in your 3rd party program:" in your log file, it is probably caused by a program or by a browser plugin (for example SABconnect++) that is accessing SABnzbd's API interface without an API key or with an incorrect API key. This message is just a warning; you could ignore it if you want to.
To get rid of this message you have to find the program or browser plugin, and configure it with the correct API key.
## "[Errno 111] Failed to connect: (110, 'timed out') -1 @news.example.com:119" when clicking on Test Server
You can test your connection to your news server by clicking on Test Server (in Config -\> Servers). If the popup says "[Errno 111] Failed to connect: (110, 'timed out') [[emailprotected]](/cdn-cgi/l/email-protection):119", SABnzbd cannot connect to the newserver you filled out. You should check two things: the correct name for the news server and the correct port (119 is the normal port).
If you're sure everything is filled out OK and you still get the error message, as a test you can fill out an additional news server. You can use news.astraweb.com or newsreader.eweka.nl. After filling out and Save Change, you can click on Test Server. If you get "[Errno 111] Failed to connect: (110, 'timed out') [[emailprotected]](/cdn-cgi/l/email-protection):119" for this extra server too, the problem is local: possibly a firewall is blocking outgoing connections. So check your firewall. Or temporarily disable / deinstall your firewall. Then check again with Test Server.
NB: after your own server is working, disable the extra setting, or you will see warnings in your log file of SABnzbd still trying to access this server for which you have no account.
## SABnzbd slows down when getting very close to the end of a job - News server timeouts
You might see instances where a job is 99% completed but still not done and your download speed might be very slow. If you hover over the job and click the icon you can list the files still waiting. You might see 1 or 2 files that are not done. Additionally, in Connections tab of the Status and Interface settings () you can see that 1 article is still being fetched from one of your servers.
You are experiencing news server timeouts, somehow the connection between you and the server was lost while SABnzbd was getting the article.
You have these options:
* If you experience this very often, consider checking all parts in your connection. The QoS-settings of your router/modem, throttling by your ISP, wrong VPN settings (if you use one) or the geographical location of your server. SABnzbd cannot force the connection to become alive again if network packets get lost in transit.
* Try a different hostname of your provider.
* Reduce timeout for your server in Config -\> Servers, click Advanced.
* Reduce Maximum Retries in Config -\> Switches.
* Enable `no\_penalties` in Config -\> Specials.
NOTE Connections work both ways: if it times out on your side, the server might still consider the connection alive until it reaches the timeout defined by the server's internal configuration. If SABnzbd reconnects before this internal server timeout, the server might count this new connection towards your connection limit, this can result in getting "Connection limit reached" errors.
## Starting SABnzbd with default settings
When troubleshooting, we might ask you to start SABnzbd with basic settings.
This is what we would like you to do:
* Shutdown SABnzbd.
* Make a backup of your `sabnzbd.ini` file, the location is listed on the first page of the Config or can be found [here](/wiki/advanced/directory-setup).
* Delete both the `sabnzbd.ini` and the `sabnzbd.ini.bak` file.
* Start SABnzbd.
* The wizard will be shown, fill only the requested info.
* Open the Status and Interface settings () and click the 1000MB Test-download button to verify.
When you want to get back to your old setup, just shutdown SABnzbd, restore the original `sabnzbd.ini` and start SABnzbd again.
# Using SABnzbd
## If I close my Internet browser does SABnzbd close too?
No, SABnzbd will continue to run in the background. Restart the browser to connect to SABnzbd again.
You can only stop SABznbd by using the shutdown function in the web-interface or by manually killing the process.
## Why doesn't SABnzbd download all PARs for a post?
SABnzbd only downloads the PAR files it needs. It starts by downloading all normal files and the smallest par. If the files don't pass our QuickCheck function, we run a full par2 verification. Once SABnzbd determines how many files are broken or missing it will go back and intelligently download only however many pars it needs and repair.
## How can I download a set of PAR files without activating auto-par2 mode?
Select None as your PostProcess option while importing your nzb file.
You will have to do your post-processing manually!
## How do I upgrade SABnzbd to a new version?
It's simple! All your settings are stored away from the main SABnzbd folder, and will be kept between upgrades.
If you are moving between major versions (such as a 0.4 version to a 0.5 version) it is recommended that you finish your current queue. As major versions may create new queue files (your old queue file will still exist if you choose to go back to it and finish up downloading)
**For Windows** just run the installer and it will replace your old version!
**For macOS / Linux** just overwrite your current SABnzbd folder with the new files.
## Virus scanners and false positives with new SABnzbd releases
Within the first few weeks after a new SABnzbd release, a virus scanner (like Windows Defender/Avast/McAfee) might say the new SABnzbd release contains a virus or that it's malicious. These results are **false-positives**.
If your antivirus has quarantined/removed SABnzbd or a provided utilities, you would need to restore/release it from your antivirus quarantine after you have updated your antivirus application. If you are having problems you can try re-installing SABnzbd again to restore missing files.
SABnzbd triggers plenty of antivirus red flags: Packing/executable compression, multiple executables inside, lots of network connections, a listening socket/web interface, scheduler, database stuff.
AV makers may give their products fancy names loaded with buzzwords, "smart-this", "cloud-that", "AI" and so on but under all that varnish is still just a bunch of 'best guess' scoring mechanisms.
Thus false positives remain until they add a manual override for the stuff they get enough complaints about, or enough time passes and their algorithms catch up.
You can upload the SABnzbd binary yourself to [www.virustotal.com](https://www.virustotal.com/), which checks the binary against all available virus scanners.
If the binary did contain some virus, all the scanners would be triggered. Usually, it's just a few false-positives due to lack of reputation of seeing the release before.
After one or two weeks, most virus scanners are updated and will no longer react to SABnzbd.
## What does R/U/D or Repair/Unpack/Delete mean?
|Long Name|Short Name|Description|
|||The blank option does nothing extra to the download files|
|+Repair|R|Verifies and repairs the downloaded files|
|+Unpack|U|Verifies and repairs the downloaded files
+Unpacks downloaded files
|
|+Delete|D|Verifies and repairs the downloaded files
+Unpacks downloaded files
+Deletes the left over rar files
|
## How do I change my download folder to another drive?
Simply enter in the full path, such as D:\\Downloads
A tip for macOS users, to save to an external drive, enter /Volumes/nameofdrive/Downloads
To save to a network share, make sure it has write access and enter \\\\NameOfPc\\\\Folder
You currently cannot use this for the incomplete folder in windows due to a par2 bug.
## How do I run SABnzbd as a portable/self contained program?
See [How to make a portable installation](/wiki/extra/howto-portable).
## "My Internet connection is 200Mbps, and SABnzbd only downloads at 20MB/s"?
This is bits versus bytes: ISPs advertise in bits/sec, SABnzbd shows you bytes/sec.
Multiply SABnzbd's results by 8 or 10 to get bits/sec.
## "Repair failed, not enough repair blocks (585 short) " … what does that mean?
If you get something like "Repair failed, not enough repair blocks (585 short)", there can be different causes:
* the post is not available (anymore) on the news server you use because the post is older than the news server retention
* the post is not available (anymore) on the news server you use because the post has been (partly) removed (possibly because of DMCA notices)
* the post itself has too little repair block (par files)
* the NZB you created did not include par files
* The post has an unusual naming convention and SABnzbd doesn't understand the relation between RAR files and PAR2 files. Manual repair is the only solution (Windows users can use QuickPar).
Things worth trying:
* use another or - better an additional news server
* find another post with the same contents
* check on binsearch.info to see the post was completely available there
## A download says "ENCRYPTED". What does that mean, and is there anything I can do?
"ENCRYPTED" means you're trying to download that has a password on it (on the rar files, to be precise). SABnzbd will detect this during the download and will stop the download.
Often the ENCRYPTED posts are useless, as they are only trying to lure you towards useless websites. In the end you will probably not get a password at all.
So, it is advised not to download these kind of posts.
## Do I need port forwarding for SABnzbd usage?
For normal usage of SABnzbd, you don't need any port forwarding in your modem/router/NAT-device. Reasons:
- SABnzbd only uses outgoing connections for content downloading.
- You can access SABnzbd's webinterface from the PC it's running on, and from other device on your LAN.
You will only need port forwarding if you want to access SABnzbd's interface (Web or API) from a 'remote' device. 'Remote' means outside your LAN, or - more specifically - from the other side of your NAT-device.
Port forwarding can be a bit tricky. Here are some hints:
- Port forwarding is done in your NAT-device. How to do that depends on your specific NAT-device. The site [http://portforward.com/](http://portforward.com/) could be useful
- Port forwarding needs to know the internal IP address of the SABnzbd system. This often means the SABnzbd needs to have a fixed internal IP address
- To check if your port forwarding is setup correctly, you can use [http://www.whatsmyip.org/port-scanner/](http://www.whatsmyip.org/port-scanner/)
## Some of the files after unpacking have very strange names (deobfuscation)
Some posters hide the content of their uploads by naming the files within them randomly, for example `5a93f7298ba2465c98010207642bb0cf.mkv`. There are 2 ways to let SABnzbd fix this for you:
* Turn on SABnzbd's builtin deobfuscation: Config -\> Switches -\> "Deobfuscate final filenames". Or
* In Config [Sorting](/wiki/configuration/5.0/sorting) **and** enable each of the sorting options for the right category. So enable Series Sorting for the `tv` category and Movie Sorting for the `movies` category. Hold Ctrl-button to select multiple categories.
Then select the preset `Job Name as Filename` for each Sorting.
This doesn't always work perfectly, if it cannot correctly parse the name of the job.
Footnotes
1. Often administrators receive so-called DMCA notifications
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)