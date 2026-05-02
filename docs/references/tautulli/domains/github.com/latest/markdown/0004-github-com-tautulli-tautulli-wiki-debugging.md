Debugging · Tautulli/Tautulli Wiki · GitHub
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
# Debugging
[Jump to bottom](#wiki-pages-box)
JonnyWong16 edited this page Oct 25, 2021
&middot;
[6 revisions](/Tautulli/Tautulli/wiki/Debugging/_history)
# Debugging Tautulli
[](#debugging-tautulli)
This page guides you through some common debugging steps to verify the
information in Tautulli.
## Activity
[](#activity)
*Triple* clicking on the word `ACTIVITY` at the top of the Tautulli page will
open up the raw XML file on your Plex server that Tautulli is parsing in order
to show you the current activity on the server.
If you are accessing Tautulli from outside your network and the address that
Tautulli uses to connect to Plex isn't available you will need to fix the
location in the address bar. If you find yourself using this XML shortcut often
you can have Tautulli automatically override the link for you by shutting down
Tautulli, editing `config.ini`, and editing the `pms\_url\_override` value to the
public location of your Plex server.
*Note:* Your browser will likely block this at first since it is a pop-up!
You'll need to allow pop-ups in your browser for your Tautulli domain,
instructions for the Chrome browser can be found
[here](https://support.google.com/chrome/answer/95472?co=GENIE.Platform=Desktop&amp;hl=en).
## Stream Info
[](#stream-info)
You can view the information that Tautulli has parsed from the raw XML data for
a particular stream by *single* clicking on the `STREAM` word in an activity
card:
This information can be handy to check against when using text parameters or
conditions in a Notification Agent.
## More XML Shortcuts
[](#more-xml-shortcuts)
Similar to triple clicking on the word `ACTIVITY` on the home page, if you *triple*
click on one of the following you will be brought to the XML that the data is
being generated from:
* "All Libraries" on the Libraries page
* "All Users" on the Users page
* "Synced Items" on the Synced Items page
* "PLEX MEDIA SERVER" under Settings -\> Plex Media Server
* The [last breadcrumb](./images/debugging_breadcrumb.png) on any media info page
* "RECENTLY ADDED" on the home page
## Scheduled Tasks
[](#scheduled-tasks)
Under Settings -\> Help & Info Tautulli shows you a listing of the scheduled tasks currently active on your system. You can click on the following tasks to get a pop-up with a detailed listing of their relevant information:
* *Check for active sessions*
* Click for a listing of currently active sessions and when they will be flushed to the database if Plex fails to send a stop event for them
* *Check for recently added items*
* Click for a listing of items that Tautulli has recently seen get added to Plex, and when they are scheduled to be announced
* [Home](/Tautulli/Tautulli/wiki/Home)
* [Installation](/Tautulli/Tautulli/wiki/Installation)
* [Upgrading to Python 3 (Tautulli v2.5)](/Tautulli/Tautulli/wiki/Upgrading-to-Python-3-(Tautulli-v2.5))
* [Asking for Support](/Tautulli/Tautulli/wiki/Asking-for-Support)
* [Frequently Asked Questions](/Tautulli/Tautulli/wiki/Frequently-Asked-Questions)
* [Notification Agents Guide](/Tautulli/Tautulli/wiki/Notification-Agents-Guide)
* [Custom Notification Conditions](/Tautulli/Tautulli/wiki/Custom-Notification-Conditions)
* [Exporter Guide](/Tautulli/Tautulli/wiki/Exporter-Guide)
* [3rd Party APIs Guide](/Tautulli/Tautulli/wiki/3rd-Party-APIs-Guide)
* [Debugging](/Tautulli/Tautulli/wiki/Debugging)
* [Custom Scripts](/Tautulli/Tautulli/wiki/Custom-Scripts)
* [Tautulli API Reference](/Tautulli/Tautulli/wiki/Tautulli-API-Reference)
### Clone this wiki locally