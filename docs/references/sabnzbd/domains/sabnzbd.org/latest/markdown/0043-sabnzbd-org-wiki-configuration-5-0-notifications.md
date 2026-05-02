SABnzbd -
Wiki -
Notifications
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Notifications&amp;body=##+URL:+/wiki/configuration/5.0/notifications.html
Improvement:
>)
Notifications
## Email notifications
SABnzbd can send you emails about completion of jobs and about disk almost full condition.
You can send email through the SMTP server of your ISP. This is generally the easiest option, that doesn't require you to set a user account and password.
SABnzbd will try to use SSL secured email when supported by the mail server (this normally requires a user account and password).
Even Google mail (gmail.com) is possible.
It's possible to create your own email format by using [templates](/wiki/extra/email-templates).
### Email options
|**Errors**|Send an email when a download fails for any reason|
|**End-of-job notifications**|Send an email after each job is completed and fully post-processed|
|**Disk full notifications**|Send an email when SABnzbd paused because the disk is almost full|
### Email Account Settings
Check your email provider's instructions for the proper values.
|**SMTP server**|The mail server you use (eg smtp.my-isp.com). If needed you can append a non-standard mail port (e.g. special.my-isp.com:455)|
|**Email recipient**|The email address to which the emails must be sent.|
|**Email sender**|The email address of the sender. This can be a fake address, but you emails may be flagged as spam. Especially when you also set an account name and password, it is better to use your own real email address.|
|**Account name**|User name of the email account used to send the emails.|
|**Account password**|Password of the email account used to send the emails.
WARNING this password is stored as plain text in the INI file.|
### Gmail example
|**SMTP server**|smtp.gmail.com:587|
|**Email recipient**|***you***@gmail.com|
|**Email sender**|***you***@gmail.com This can be a fake address, but you will have to put it in your Gmail contact list, otherwise Google will think you are sending spam.|
|**Account name**|***you***@gmail.com|
|**Account password**|***password***|
Please note that Gmail security has become a lot stricter.
If you are using two-factor authentication then you need to create an "application-specific" password for SABnzbd.
See: [https://support.google.com/mail/answer/1173270?hl=en](https://support.google.com/mail/answer/1173270?hl=en)
If not, then SABnzbd is only allowed to access Gmail when you allow "less secure apps".
See: [https://www.google.com/settings/security/lesssecureapps](https://www.google.com/settings/security/lesssecureapps)
For security reasons we recommend that you create a separate email account, just to send SABnzbd emails.
## Notification Services
SABnzbd can send notifications to several notification services.
All events that can produce a notification are assigned to a group.
Such groups can be enabled per notification services.
Additionally, you can specify for the job related notifications if they only should be send for specific categories.
|Group|Events|
|Startup/Shutdown|Startup, Shutdown|
|Pause/Resume|Pause, Resume|
|Added NZB|New NZB's are added|
|Post-processing|Post-processing started|
|Job finished|Job finished|
|Job failed|Job failed|
|Queue finished|Queue finished|
|User logged in|Successful login (HTML form only)|
|Warning|Warning|
|Error|Error|
|Other|URL fetching failed, Shutdown finished, New release available|
### Windows balloons
Windows will show a modest text balloon connected to SABnzbd's System Tray icon.
### macOS Notification Center
Standard macOS Notification Service.
Only when you're using our signed app, you will see SABnzbd's icon.
### NotifyOSD
Some Linux systems support the NotifyOSD protocol.
When SABnzbd detects support for this protocol, it will allow you to enable the service.
### Apprise
SABnzbd has built-in support for Apprise, which allows you to connect to basically any notification service out there.
The full list of supported services and how to configure them can be found on the [Apprise documentation](https://appriseit.com/).
Use a comma and/or space to identify more than one URL.
You can override the default URLs for specific notification types, if desired.
### Notification script
Allows implementation of custom notification services. See [Notification Scripts](/wiki/configuration/5.0/scripts/notification-scripts).
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)