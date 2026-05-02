SABnzbd -
Wiki -
SABnzbd as a Windows Service
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+SABnzbd+as+a+Windows+Service&amp;body=##+URL:+/wiki/advanced/sabnzbd-as-a-windows-service.html
Improvement:
>)
SABnzbd as a Windows Service
## Introduction
Running SABnzbd as a Windows Service can be helpful to those needing the program to operate in an "always on" state. When installed this way, SABnzbd will start automatically as soon as Windows starts, even when no user account is logged in, and will remain running even when all users have logged out.
NOTE While the functionality of SABnzbd is generally the same when running as a service, there are some restrictions and limitations. Most importantly, you will need to take additional steps after installing the service if you use network shares for your download folders. Details on these steps, and other considerations when running SABnzbd as a service, can be found after the basic installation instructions, below.
## Basic Installation
The following procedure will install SABnzbd as a service using the same settings used by the graphical web-based interface. This should satisfy most users' needs, but if you need to run the service with different settings than those used in the web interface, please read through the "Specifying additional options" section that follows this section before proceeding.
1.
Make sure SABnzbd is not running.
2.
Open a DOS window with Administrative (elevated) privileges
* Click your Windows Start button
* Type `cmd`
* Right click "Command Prompt" in the search window and choose "Run As Administrator" in the drop-down menu that appears.
* Access the directory in which you installed SABnzbd.
If you installed SABnzbd in its default location (`C:\\Program Files\\SABnzbd`) just type (or paste) the below command exactly as it appears, then hit the RETURN key. If you installed it to a different drive or folder, however, make sure to edit the path to reflect that location.
```
`cd "C:\\Program Files\\Sabnzbd"`
```
* Install SABnzbd service, set it to automatically start, and launch it, by typing or pasting the below commands into the DOS command window and hitting RETURN after each.
```
`SABnzbd-console.exe -f "%localappdata%\\sabnzbd\\sabnzbd.ini" install
sc config SABnzbd start= auto
net start SABnzbd`
```
NOTE The first command uses the `%localappdata%` system variable to point to the LOCAL folder within your user's APPDATA folder, which should work on all versions of Windows. If for some reason that does not work on your system and you get a `sabnzbd.ini file not found` type error you will need to replace the path portion of the above command to explicitly point to your `sabnzbd.ini` file within your `C:\\Users\\USERNAME\\APPDATA\\Local\\sabnzbd` folder.
NOTE If you used Powershell instead of Command Prompt you will need to use `$env:LOCALAPPDATA` instead of `%localappdata%`!
* You can check SABnzbd is running as a service, with
```
`net start | find /i "sabnzbd"`
```
That’s it! SABnzbd is now installed and running as an "always on" service!
If all you need is to run SABnzbd as a service using the same settings used in the SABnzbd web interface-and you are not using network shares for your downloaded files-your work here is done.
However, if you want to customize the way that the service runs, or if you need to have SABnzbd access shared drives across the network, please read through the following sections for further information.
* NOTE SABnzbd will not present an icon in the Notification (lower right) area of the Windows screen when run as a service. This will not affect normal operation of the software.
* NOTE The Windows firewall will not warn you if it blocks SABnzbd as it does when blocking SABnzbd when running "normally", so you may need to add it to the firewall exception list using the normal procedures for your version of Windows if you run into an access problem. However, if you have already run SABnzbd successfully before installing it as a service, using the same port number, it is likely the exception will already be in effect.
* NOTE Before upgrading SABnzbd, it is recommended you stop both services to ensure there are no problems overwriting busy files. See the section below for details on stopping the service via the command line or through the Windows Service Manager.
## Specifying additional options
By default, installing SABnzbd as a service (as detailed in step 4 of the above installation instructions) will cause it to run using the same settings used by the SABnzbd web interface on your system.
You can, however, override many of these settings with [command line parameters](/wiki/advanced/command-line-parameters). Simply add the pertinent command to the line that installs the SABnzbd service. Be aware that not all of the available command line options are appropriate when SABnzbd is running as a service—for instance, parameters like `–b` (start browser) will be ignored even if specified.
NOTE Any parameter you set in the command line will override the equivalent parameter in the web interface and any changes to the interface settings will be ignored by the service for that parameter. For parameters not set through the command line, the service will use whatever was set in the GUI at the time the service is launched or updated.
For example, the following will install the SABnzbd service with the `-s host:port` command to reflect a different server address:
```
`SABnzbd-console.exe -f %localappdata%\\sabnzbd\\sabnzbd.ini –s 127.0.0.1:8081 install`
```
In this example, the SABnzbd service will continue to use the specified port (8081) even if you subsequently specify a different port within the web interface. You would need to reinstall the service by re-entering the above command without the `-s 127.0.0.1:8081` argument to have the SABnzbd service once again go back to using the value set in the web interface.
### Updating the service settings
Each time the SABnzbd service starts, it reads the SABnzbd ini file for configuration options. If you change settings within the SABnzbd web interface you can force the service to reread the ini file by typing the following the command in an elevated DOS command window after changing directories to the SABnzbd folder. Of course, you can also simply reboot the computer to cause the service to restart and reread the ini file again.
```
`SABnzbd-console.exe -f %localappdata%\\sabnzbd\\sabnzbd.ini update`
```
## Service actions
### Removing the services
To completely remove the SABnzbd services, follow steps 1 and 2 in the Installation instructions above to open an elevated DOS command window and access the SABnzbd folder, then type or paste the following commands into it, hitting RETURN after each.
```
`SABnzbd-console.exe remove`
```
### Start the services
```
`net start SABnzbd`
```
### Stop the services
```
`net stop SABnzbd`
```
## Enabling Network Share Access
By default the SABnzbd service will be installed to run as the "Local System" account. This allows full access to local hard drives, but not to network shares.
If you are using network shares within SABnzbd to save or process your downloads, the main SABnsdb-server service must run as a local user account with network privileges instead of "Local System". Here’s how to make that change:
* Install SABnzbd as a service using the instructions in the above Installation section.
* Launch the Windows Service Manager utility. (Typically that’s done by typing SERVICES into your Windows Start menu’s search and choosing SERVICES from the results list)
* In the Windows Services Manager, find the SABnzbd-service (it will be displayed as "SABnzbd Binary Newsreader") in the list of services and double-click it to access its settings.
* Click the Logon tab.
* Specify a different "Log on" account. (Make sure it is one that has administrative privileges and access to network shares).
* Apply the changes and close the Service Manager window.
NOTE When using network shares with the SABnzbd service, you must use network (UNC) paths (`\\\\server\\share`) instead of drive letters (`P:\\`).
NOTE Even after doing the above to enable network share access, you will still be restricted to local drives only for the admin, log and incomplete folders due to limitations in those functions. Make sure, in your SABnzbd web interface configuration that those folders are not pointing to network shares.
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)