Asking for Support · Tautulli/Tautulli Wiki · GitHub
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
# Asking for Support
[Jump to bottom](#wiki-pages-box)
JonnyWong16 edited this page Oct 22, 2021
&middot;
[17 revisions](/Tautulli/Tautulli/wiki/Asking-for-Support/_history)
## Before asking for support, make sure you try these things first
[](#before-asking-for-support-make-sure-you-try-these-things-first)
* Make sure you have updated to the latest version.
* ["Have you tried turning it off and on again?"](https://www.youtube.com/watch?v=nn2FB1P_Mn8)
* Analyzing your logs, you just might find the solution yourself!
* **Search** the [Wiki](/Tautulli/Tautulli/wiki/Home),
[Installation Guides](/Tautulli/Tautulli/wiki/Installation), and
[FAQs](/Tautulli/Tautulli/wiki/Frequently-Asked-Questions).
* If you have questions, feel free to ask them on [Discord](https://tautulli.com/discord) or [Reddit](https://www.reddit.com/r/Tautulli). Please include a link to your logs. See [How can I share my logs?](#how-can-i-share-my-logs) for more details.
## What should I include when asking for support?
[](#what-should-i-include-when-asking-for-support)
When you contact support saying something like "it doesn't work" leaves little to go on to figure out what is wrong for you. When contacting support try to include information such as the following:
* What did you try to do? When you describe what you did to reach the state you are in we may notice something you did different from the instructions, or something that your unique setup requires in addition. Some examples of what to provide here:
* What command did you enter?
* What did you click on?
* What settings did you change?
* Provide a step-by-step list of what you tried.
* What do you see? We cannot see your screen so some of the following is necessary for us to know what is going on:
* Did something happen?
* Did something not happen?
* Are there any error messages showing?
* Screenshots can help us see what you are seeing
* The Tautulli logs show exactly what happened and are often critical for identifying issues (see [How can I share my logs?](#how-can-i-share-my-logs) below).
When you only provide something like "it doesn't work" think of it like going to the doctor and only telling them "I'm sick." Without you telling them things like what symptoms are you experiencing, whether you are feeling pain somewhere, or whether you are taking any medication. Just like the doctor in that situation, if you don't tell us what is wrong we have to ask you questions until we can get the basic information in place so we can start figuring out how to help you fix the issue.
## How can I share my logs?
[](#how-can-i-share-my-logs)
First you will need to download your logs by opening the web interface.
1. Go to the **Settings menu** (Gear Icon, top right) and click **View Logs**.
2. Click the Download Logs button on the *Tautulli Logs* tab to save a copy of the `tautulli.log` file.
3. Open the log file and **upload the text** by going to [gist.github.com](https://gist.github.com/) and creating a new secret Gist of the contents.
4. **Share the link** with support ([Discord](https://tautulli.com/discord), [Reddit](https://www.reddit.com/r/Tautulli)) by copying the URL of the page.
If Tautulli is unable to start, the following lists the default log file location:
* Windows exe installation: `%LOCALAPPDATA%\\Tautulli\\logs\\tautulli.log`
* macOS pkg installation: `\~/Library/Application Support/Tautulli/logs/tautulli.log`
* Snap package installation: `/root/snap/tautulli/common/logs/tautulli.log`
* Docker installation: `\<path to data\>/logs/tautulli.log` where `\<path to data\>` is the folder from your bind volume mount
* Git or zip based installation: `\<install-directory\>/logs/tautulli.log` where `\<install-directory\>` is the folder where you cloned the git repository or extracted the zip file
### Notes:
[](#notes)
* Upload the **entire** log file. Only uploading what you think is important just makes the process of figuring out what is wrong take longer.
* Not seeing any errors is just as useful as seeing errors. It could indicate that something *isn't* happening, that should be happening.
* Do not clear your logs unless asked to.
* *Notification Logs* and *Newsletter Logs* provide no information for support. These logs are only used to keep a history of what has been sent.
## What is in my logs?
[](#what-is-in-my-logs)
### Tautulli Logs
[](#tautulli-logs)
*Filename: `tautulli.log`*
Tautulli already sanitizes tokens from this log, leaving the following potentially sensitive information in there:
* Usernames
* Especially if your users leave them as email addresses
* Media titles
* For example `Session 771 started by user 18140375 (username) with ratingKey 364356 (Solo: A Star Wars Story).`
* Times that things were played
If you want to keep this private feel free to replace the usernames before uploading the logs as long as you do so consistently! For example replacing `alice` with `user1` and `bob` with `user2` is fine, but don't replace one instance of `alice` with `user1`, and another with `user2` or replacing both `alice` and `bob` with `user`.
Information that *isn't* sensitive:
* Many identifiers aren't sensitive, such as:
* Session IDs
* Session keys
* Rating keys
* User ID numbers
* Etc.
These numbers are unique to your specific Plex and Tautulli installation, but have no meaning outside of them so sharing them isn't an issue.
### Tautulli API Logs
[](#tautulli-api-logs)
*Filename: `tautulli\_api.log`*
This log contains information about calls made to Tautulli's own API and is usually not needed for support issues.
### Plex Websocket Logs
[](#plex-websocket-logs)
*Filename: `plex\_websocket.log`*
This is a log of the raw events that Plex sends to Tautulli as your users play media and you add new files. This log shouldn't contain any information more sensitive than the Tautulli Log itself, but is rarely required to diagnose issues.
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