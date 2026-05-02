Releases · Tautulli/Tautulli · GitHub
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
# Releases: Tautulli/Tautulli
</option></form>
## Tautulli v2.17.0
28 Mar 01:24
[github-actions](/apps/github-actions)
[
v2.17.0
](/Tautulli/Tautulli/tree/v2.17.0)
[
`5610c16`](/Tautulli/Tautulli/commit/5610c167a17b0898d93d0588a0df81c03306ac52)
This commit was signed with the committer’s **verified signature**.
[
](/JonnyWong16)
[JonnyWong16](/JonnyWong16)
GPG key ID: 9BF4EF4DEC41163A
Verified
[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).
Compare
#
Choose a tag to compare
Filter
[View all tags](/Tautulli/Tautulli/tags)
[Tautulli v2.17.0](/Tautulli/Tautulli/releases/tag/v2.17.0)
[Latest](/Tautulli/Tautulli/releases/latest)
[Latest](/Tautulli/Tautulli/releases/latest)
## Changelog
#### v2.17.0 (2026-03-27)
* Important Note!
* Several security vulnerabilities have been identified in Tautulli versions \<=2.16.1. Users are strongly encouraged to update to the latest Tautulli version 2.17.x.
* Notes:
* Support for Python 3.9 has been dropped. The minimum Python version is now 3.10.
* Notifications:
* Fix: Prevent RCE in notification text evaluation. (CVE-2026-28505) (Thanks [@q1uf3ng](https://github.com/q1uf3ng))
* Newsletters:
* Fix: Media from other video libraries using the modern Plex agents not showing up on newsletter.
* Fix: Unauthenticated path traversal in /newsletter/image/images endpoint. (CVE-2026-31831) (Thanks [@JakePeralta7](https://github.com/JakePeralta7))
* Exporter:
* Fix: Logo images incorrectly exported as jpg instead of png.
* New: Added ability to export square art images.
* New: Added ability to export theme music. ([#2654](https://github.com/Tautulli/Tautulli/issues/2654))
* Graphs:
* Fix: History modal not opening when clicking on graphs. ([#2652](https://github.com/Tautulli/Tautulli/issues/2652))
* API:
* Fix: SQL injection in get\_home\_stats API command. (CVE-2026-31799) (Thanks [@mandreko](https://github.com/mandreko))
* Fix: Unsanitized JSONP callback parameter. (CVE-2026-32275) (Thanks [@mandreko](https://github.com/mandreko))
* New: Added rating to get\_home\_stats API command. ([#2655](https://github.com/Tautulli/Tautulli/pull/2655)) (Thanks [@jma1ice](https://github.com/jma1ice))
* Removed: get\_apikey API command.
* Other:
* Fix: Validate log path for Plex log files. ([#2632](https://github.com/Tautulli/Tautulli/issues/2632))
* Fix: Add authentication to /pms\_image\_proxy endpoint. (CVE-2026-31804) (Thanks [@mandreko](https://github.com/mandreko))
* New: Updated third party donation logos. ([#2646](https://github.com/Tautulli/Tautulli/pull/2646)) (Thanks [@aisgbnok](https://github.com/aisgbnok))
* New: Update Bootstrap CSS to v3.4.1 and decouple overrides ([#2662](https://github.com/Tautulli/Tautulli/pull/2662)) (Thanks [@aisgbnok](https://github.com/aisgbnok))
* New: Update Bootstrap-select to v1.13.18 ([#2666](https://github.com/Tautulli/Tautulli/pull/2666)) (Thanks [@aisgbnok](https://github.com/aisgbnok))
🛡 [VirusTotal GitHub Action](https://github.com/crazy-max/ghaction-virustotal) analysis:
* [`Tautulli-macos-v2.17.0-universal.pkg`](https://www.virustotal.com/gui/file-analysis/NDQ1MTkyOGFhY2MzYzQ3Y2Q3ZTFhMzMzYTYyNGM2ZTc6MTc3NDY2MTA2Mg==/detection)
* [`Tautulli-windows-v2.17.0-x64.exe`](https://www.virustotal.com/gui/file-analysis/YjRjMDAzMTI4ZWZkNDE5NzRjMGJhZTkwZjk2MDhjYmI6MTc3NDY2MTA2MA==/detection)
### Contributors
* [](https://github.com/mandreko)
* [](https://github.com/aisgbnok)
* [](https://github.com/JakePeralta7)
* [](https://github.com/q1uf3ng)
* [](https://github.com/jma1ice)
mandreko, aisgbnok, and 3 other contributors
Assets
4
Loading
</option></form>
👍
3
war59312, amanda-wee, and Vallle reacted with thumbs up emoji
3 people reacted
## Tautulli v2.16.1
15 Feb 20:40
[JonnyWong16](/JonnyWong16)
[
v2.16.1
](/Tautulli/Tautulli/tree/v2.16.1)
[
`0a83704`](/Tautulli/Tautulli/commit/0a837049c1a62124087cca27f82d96603b75eede)
This commit was signed with the committer’s **verified signature**.
[
](/JonnyWong16)
[JonnyWong16](/JonnyWong16)
GPG key ID: 9BF4EF4DEC41163A
Verified
[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).
Compare
#
Choose a tag to compare
Filter
[View all tags](/Tautulli/Tautulli/tags)
[Tautulli v2.16.1](/Tautulli/Tautulli/releases/tag/v2.16.1)
## Changelog
#### v2.16.1 (2026-12-15)
* Notifications:
* New: Add Tautulli Plex token expired notification trigger.
* Newsletters:
* New: Add Ace editor for syntax highlighting and code formatting for newsletter message text ([#2585](https://github.com/Tautulli/Tautulli/pull/2585)) (Thanks [@mcclown](https://github.com/mcclown))
* Graphs:
* Change: Restrict graphs to guest user.
* UI:
* New: Add DD:HH:MM time format for home stats.
* New: Add HH:MM:SS time format for activity cards.
* Removed: Timezone from IP address modal.
* Other:
* Change: Zip backup files to reduce file size.
🛡 [VirusTotal GitHub Action](https://github.com/crazy-max/ghaction-virustotal) analysis:
* [`Tautulli-macos-v2.16.1-universal.pkg`](https://www.virustotal.com/gui/file-analysis/NmFiNjFlZTk0OTllMzMxYzA0ZmU0ZGQyYWJlZWIwZDQ6MTc3MTE4ODAzNQ==/detection)
* [`Tautulli-windows-v2.16.1-x64.exe`](https://www.virustotal.com/gui/file-analysis/YmFlYzBlNmU3YzUzYTdiYjgzMDYyMGIyYjMwYmNjYjE6MTc3MTE4ODAzNA==/detection)
### Contributors
* [](https://github.com/mcclown)
mcclown
Assets
4
Loading
</option></form>
👍
7
stevenya97, vb2007, war59312, z-wilson, kribjo, mordradus, and THEMACGOD reacted with thumbs up emoji
🎉
3
WillPresley, PCLeonel, and DanielG9d9 reacted with hooray emoji
10 people reacted
## Tautulli v2.16.0
09 Sep 01:05
[JonnyWong16](/JonnyWong16)
[
v2.16.0
](/Tautulli/Tautulli/tree/v2.16.0)
[
`cc0150a`](/Tautulli/Tautulli/commit/cc0150a1b2b745980467003a73aa1be51c1e426a)
This commit was signed with the committer’s **verified signature**.
[
](/JonnyWong16)
[JonnyWong16](/JonnyWong16)
GPG key ID: B1F1F9807184697A
Verified
[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).
Compare
#
Choose a tag to compare
Filter
[View all tags](/Tautulli/Tautulli/tags)
[Tautulli v2.16.0](/Tautulli/Tautulli/releases/tag/v2.16.0)
## Changelog
#### v2.16.0 (2025-09-08)
* Important Note!
* Several security vulnerabilities have been identified in Tautulli versions \<=2.15.3. Users are strongly encouraged to update to the latest Tautulli version 2.16.x.
* UI:
* Fix: Update poster click-through overlay to new Plex logo. ([#2584](https://github.com/Tautulli/Tautulli/pull/2584)) (Thanks [@TheMeanCanEHdian](https://github.com/TheMeanCanEHdian))
* Other:
* Fix: Race condition in image cache directory creation. ([#2580](https://github.com/Tautulli/Tautulli/pull/2580)) (Thanks [@keithah](https://github.com/keithah))
* Fix: Validate image path in /image endpoints. (CVE-2025-58760) (Thanks [@d-xuan](https://github.com/d-xuan))
* Fix: Validate image path in /pms\_image\_proxy endpoints. (CVE-2025-58761) (Thanks [@d-xuan](https://github.com/d-xuan))
* Fix: Validate image format in /pms\_image\_proxy endpoint. (CVE-2025-58762) (Thanks [@d-xuan](https://github.com/d-xuan))
* Fix: Don't run git command with shell. (CVE-2025-58763) (Thanks [@d-xuan](https://github.com/d-xuan))
🛡 [VirusTotal GitHub Action](https://github.com/crazy-max/ghaction-virustotal) analysis:
* [`Tautulli-macos-v2.16.0-universal.pkg`](https://www.virustotal.com/gui/file-analysis/MjEwYmYxZWU3NzEwYjgyYzZiMDMyMWJiNzAzNTliNzM6MTc1NzM3OTk0OA==/detection)
* [`Tautulli-windows-v2.16.0-x64.exe`](https://www.virustotal.com/gui/file-analysis/NWY3ZWY2NDVlM2FjZTYxOGFjM2QwZjhmYzQzYjNiNTM6MTc1NzM3OTk0Ng==/detection)
### Contributors
* [](https://github.com/keithah)
* [](https://github.com/TheMeanCanEHdian)
* [](https://github.com/d-xuan)
keithah, TheMeanCanEHdian, and d-xuan
Assets
4
Loading
</option></form>
👍
16
perfectly-preserved-pie, JiSiN3000, C8opmBM, zerbey, amanda-wee, o-JOHN-o, itakestime, z-wilson, walkermc20, MahZ1991, and 6 more reacted with thumbs up emoji
🎉
2
walkermc20 and professionaltart reacted with hooray emoji
17 people reacted
## Tautulli v2.15.3
03 Aug 17:27
[JonnyWong16](/JonnyWong16)
[
v2.15.3
](/Tautulli/Tautulli/tree/v2.15.3)
[
`1144bba`](/Tautulli/Tautulli/commit/1144bba580fff1fbb220e104b9e66be78482842b)
This commit was signed with the committer’s **verified signature**.
[
](/JonnyWong16)
[JonnyWong16](/JonnyWong16)
GPG key ID: B1F1F9807184697A
Verified
[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).
Compare
#
Choose a tag to compare
Filter
[View all tags](/Tautulli/Tautulli/tags)
[Tautulli v2.15.3](/Tautulli/Tautulli/releases/tag/v2.15.3)
## Changelog
#### v2.15.3 (2025-08-03)
* Exporter:
* New: Added hearingImpaired for subtitles and visualImpaired for audio attributes to exporter fields.
* Graphs:
* Fix: Remove duplicate "Total" entry in graph tooltips. (Thanks [@zdimension](https://github.com/zdimension)) ([#2534](https://github.com/Tautulli/Tautulli/pull/2534))
* UI:
* Fix: Failing to retrieve collections / playlists with over 1000 items.
* Fix: Scrollbar not showing on macosx and webkit browsers. ([#2221](https://github.com/Tautulli/Tautulli/issues/2221))
* Fix: Incorrect rounding of minutes in global stats play duration.
* Fix: Disable browser autocomplete for notification agent and newsletter agent configurations. ([#2557](https://github.com/Tautulli/Tautulli/issues/2557))
* API:
* New: Added ability to return svg files using pms\_image\_proxy API command.
* Other:
* New: Added ability to set config values using environment variables. (Thanks [@komuw](https://github.com/komuw)) ([#2309](https://github.com/Tautulli/Tautulli/issues/2309), [#2543](https://github.com/Tautulli/Tautulli/pull/2543))
🛡 [VirusTotal GitHub Action](https://github.com/crazy-max/ghaction-virustotal) analysis:
* [`Tautulli-macos-v2.15.3-universal.pkg`](https://www.virustotal.com/gui/file-analysis/MmZhOTUwMjU5OThkY2IwYTM2ZDlmN2U4OWIxNzQ0NTE6MTc1NDI0MjAzNg==/detection)
* [`Tautulli-windows-v2.15.3-x64.exe`](https://www.virustotal.com/gui/file-analysis/NjM4YzhmMDg2YzgwM2RiMGM3YTIyOGExODZlN2E4OWI6MTc1NDI0MjAzNA==/detection)
### Contributors
* [](https://github.com/zdimension)
* [](https://github.com/komuw)
zdimension and komuw
Assets
4
Loading
</option></form>
👍
7
war59312, DanielG9d9, ExtremeFiretop, o-JOHN-o, mooseburgr, Juiceman8686, and LEMQN reacted with thumbs up emoji
🚀
1
mooseburgr reacted with rocket emoji
7 people reacted
## Tautulli v2.15.2
12 Apr 23:27
[JonnyWong16](/JonnyWong16)
[
v2.15.2
](/Tautulli/Tautulli/tree/v2.15.2)
[
`76f6a2d`](/Tautulli/Tautulli/commit/76f6a2da6b3b394765203b7317cd97e7701a3067)
This commit was signed with the committer’s **verified signature**.
[
](/JonnyWong16)
[JonnyWong16](/JonnyWong16)
GPG key ID: B1F1F9807184697A
Verified
[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).
Compare
#
Choose a tag to compare
Filter
[View all tags](/Tautulli/Tautulli/tags)
[Tautulli v2.15.2](/Tautulli/Tautulli/releases/tag/v2.15.2)
## Changelog
#### v2.15.2 (2025-04-12)
* Activity:
* New: Added link to library by clicking media type icon.
* New: Added stream count to tab title on homepage. ([#2517](https://github.com/Tautulli/Tautulli/issues/2517))
* History:
* Fix: Check stream watched status before stream stopped status. ([#2506](https://github.com/Tautulli/Tautulli/issues/2506))
* Notifications:
* Fix: ntfy notifications failing to send if provider link is blank.
* Fix: Check Pushover notification attachment is under 5MB limit. ([#2396](https://github.com/Tautulli/Tautulli/issues/2396))
* Fix: Track URLs redirecting to the correct media page. ([#2513](https://github.com/Tautulli/Tautulli/issues/2513))
* New: Added audio profile notification parameters.
* New: Added PATCH method for Webhook notifications.
* Graphs:
* New: Added Total line to daily streams graph. (Thanks [@zdimension](https://github.com/zdimension)) ([#2497](https://github.com/Tautulli/Tautulli/pull/2497))
* UI:
* Fix: Do not redirect API requests to the login page. ([#2490](https://github.com/Tautulli/Tautulli/issues/2490))
* Change: Swap source and stream columns in stream info modal.
* Other:
* Fix: Various typos. (Thanks [@luzpaz](https://github.com/luzpaz)) ([#2520](https://github.com/Tautulli/Tautulli/pull/2520))
* Fix: CherryPy CORS response header not being set correctly. ([#2279](https://github.com/Tautulli/Tautulli/issues/2279))
🛡 [VirusTotal GitHub Action](https://github.com/crazy-max/ghaction-virustotal) analysis:
* [`Tautulli-macos-v2.15.2-universal.pkg`](https://www.virustotal.com/gui/file-analysis/YzU0MmY4MGM2NzkzODhkYTc2NTlkZGIzYWE5NmU4M2I6MTc0NDUwMDQ3MA==/detection)
* [`Tautulli-windows-v2.15.2-x64.exe`](https://www.virustotal.com/gui/file-analysis/NDAyY2UxYzJiNmZkNzFmOTA3NzQ5MGIwN2I1YzEwNTE6MTc0NDUwMDQ2Nw==/detection)
### Contributors
* [](https://github.com/luzpaz)
* [](https://github.com/zdimension)
luzpaz and zdimension
Assets
4
Loading
</option></form>
👍
11
war59312, scukro, TempestWales, heyChristo, xenago, 357leo, ibra-coding, YRZiTO, thewriteway, lmfl1956, and LEMQN reacted with thumbs up emoji
🎉
5
Larosen, luzpaz, trop1kal, 357leo, and thewriteway reacted with hooray emoji
🚀
1
thewriteway reacted with rocket emoji
14 people reacted
## Tautulli v2.15.1
11 Jan 23:38
[JonnyWong16](/JonnyWong16)
[
v2.15.1
](/Tautulli/Tautulli/tree/v2.15.1)
[
`a96fd23`](/Tautulli/Tautulli/commit/a96fd23d72f5aa3042d6f9a55d8051653ff6f0b8)
This commit was signed with the committer’s **verified signature**.
[
](/JonnyWong16)
[JonnyWong16](/JonnyWong16)
GPG key ID: B1F1F9807184697A
Verified
[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).
Compare
#
Choose a tag to compare
Filter
[View all tags](/Tautulli/Tautulli/tags)
[Tautulli v2.15.1](/Tautulli/Tautulli/releases/tag/v2.15.1)
### Windows installer removed due to antivirus flagging it as a false positive ([#2454](https://github.com/Tautulli/Tautulli/issues/2454)). Install [v2.14.6](https://github.com/Tautulli/Tautulli/releases/tag/v2.14.6).
## Changelog
#### v2.15.1 (2025-01-11)
* Activity:
* Fix: Detection of HDR transcodes. (Thanks [@cdecker08](https://github.com/cdecker08)) ([#2412](https://github.com/Tautulli/Tautulli/issues/2412), [#2466](https://github.com/Tautulli/Tautulli/pull/2466))
* Newsletters:
* Fix: Disable basic authentication for /newsletter and /image endpoints. ([#2472](https://github.com/Tautulli/Tautulli/issues/2472))
* Exporter:
* New: Added logos to season and episode exports.
* Other:
* Fix Docker container https health check.
🛡 [VirusTotal GitHub Action](https://github.com/crazy-max/ghaction-virustotal) analysis:
* [`Tautulli-macos-v2.15.1-universal.pkg`](https://www.virustotal.com/gui/file-analysis/YmUwZDUyMGQ0MzdjZDc3Njg5OWM3OWQ2NWQ5YWM0NmE6MTczNjYzODcxMA==/detection)
* [`Tautulli-windows-v2.15.1-x64.exe`](https://www.virustotal.com/gui/file-analysis/MWYyZjIwNzhmODEwNTA3ZDI2OGIzNzFkMWYxNTNmOTQ6MTczNjYzODcwOA==/detection)
### Contributors
* [](https://github.com/cdecker08)
cdecker08
Assets
3
Loading
</option></form>
👍
8
war59312, StephenCYang, heyChristo, o-JOHN-o, gromflomite, trop1kal, NunoVilhenaSantos, and Proximal19 reacted with thumbs up emoji
❤️
5
heyChristo, stripzest, IguanaXL, jaw8, and Proximal19 reacted with heart emoji
🚀
4
cmennens, l33xu, romayojr, and mjonkus reacted with rocket emoji
👀
1
JDA88 reacted with eyes emoji
16 people reacted
## Tautulli v2.15.0
24 Nov 23:20
[JonnyWong16](/JonnyWong16)
[
v2.15.0
](/Tautulli/Tautulli/tree/v2.15.0)
[
`78864d7`](/Tautulli/Tautulli/commit/78864d7a97ab94d433f5eca205897f2b10be455b)
This commit was signed with the committer’s **verified signature**.
[
](/JonnyWong16)
[JonnyWong16](/JonnyWong16)
GPG key ID: B1F1F9807184697A
Verified
[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).
Compare
#
Choose a tag to compare
Filter
[View all tags](/Tautulli/Tautulli/tags)
[Tautulli v2.15.0](/Tautulli/Tautulli/releases/tag/v2.15.0)
### Windows installer removed due to antivirus flagging it as a false positive ([#2454](https://github.com/Tautulli/Tautulli/issues/2454)). Install [v2.14.6](https://github.com/Tautulli/Tautulli/releases/tag/v2.14.6).
## Changelog
#### v2.15.0 (2024-11-24)
* Notes:
* Support for Python 3.8 has been dropped. The minimum Python version is now 3.9.
* Notifications:
* New: Allow Telegram blockquote and tg-emoji HTML tags. (Thanks [@MythodeaLoL](https://github.com/MythodeaLoL)) ([#2427](https://github.com/Tautulli/Tautulli/pull/2427))
* New: Added Plex slug and Plex Watch URL notification parameters. ([#2420](https://github.com/Tautulli/Tautulli/issues/2420))
* Change: Update OneSignal API calls to use the new API endpoint for Tautulli Remote App notifications.
* Newsletters:
* Fix: Dumping custom dates in raw newsletter json.
* History:
* Fix: Unable to fix match for artists. ([#2429](https://github.com/Tautulli/Tautulli/issues/2429))
* Exporter:
* New: Added movie and episode hasVoiceActivity attribute to exporter fields.
* New: Added subtitle canAutoSync attribute to exporter fields.
* New: Added logos to the exporter fields.
* UI:
* New: Add friendly name to the top bar of config modals. (Thanks [@peagravel](https://github.com/peagravel)) ([#2432](https://github.com/Tautulli/Tautulli/pull/2432))
* API:
* New: Added plex slugs to metadata in the get\_metadata API command.
* Other:
* Fix: Tautulli failing to start with Python 3.13. ([#2426](https://github.com/Tautulli/Tautulli/issues/2426))
### Contributors
* [](https://github.com/MythodeaLoL)
* [](https://github.com/peagravel)
MythodeaLoL and peagravel
Assets
3
Loading
</option></form>
👍
1
war59312 reacted with thumbs up emoji
😄
1
travis-cleary reacted with laugh emoji
❤️
3
RomainPastureau, jaw8, and MythodeaLoL reacted with heart emoji
🚀
2
JakePeralta7 and MythodeaLoL reacted with rocket emoji
👀
3
deviat3d, Al3xPdx007, and ZiadNaseriddin reacted with eyes emoji
9 people reacted
## Tautulli v2.14.6
13 Oct 00:30
[JonnyWong16](/JonnyWong16)
[
v2.14.6
](/Tautulli/Tautulli/tree/v2.14.6)
[
`940c2ae`](/Tautulli/Tautulli/commit/940c2ae6cd064817512aa7646386a31fa9f465fa)
This commit was signed with the committer’s **verified signature**.
[
](/JonnyWong16)
[JonnyWong16](/JonnyWong16)
GPG key ID: B1F1F9807184697A
Verified
[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).
Compare
#
Choose a tag to compare
Filter
[View all tags](/Tautulli/Tautulli/tags)
[Tautulli v2.14.6](/Tautulli/Tautulli/releases/tag/v2.14.6)
## Changelog
#### v2.14.6 (2024-10-12)
* Newsletters:
* Fix: Allow formatting newsletter date parameters.
* Change: Support apscheduler compatible cron expressions.
* UI:
* Fix: Round runtime before converting to human duration.
* Fix: Make recently added/watched rows touch scrollable.
* Other:
* Fix: Auto-updater not running.
Assets
4
Loading
</option></form>
👍
12
moshechaikin, AnthonyBe, JiSiN3000, IrmaIsfot, labdiynez, trevordavies095, Sandbox8888, brian163, JakePeralta7, samba48rus, and 2 more reacted with thumbs up emoji
❤️
2
trevordavies095 and kvalle22 reacted with heart emoji
12 people reacted
## Tautulli v2.14.5
21 Sep 03:38
[JonnyWong16](/JonnyWong16)
[
v2.14.5
](/Tautulli/Tautulli/tree/v2.14.5)
[
`6979a40`](/Tautulli/Tautulli/commit/6979a4025fbf332694e10c3e264aa4a3cfdda065)
This commit was signed with the committer’s **verified signature**.
[
](/JonnyWong16)
[JonnyWong16](/JonnyWong16)
GPG key ID: B1F1F9807184697A
Verified
[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).
Compare
#
Choose a tag to compare
Filter
[View all tags](/Tautulli/Tautulli/tags)
[Tautulli v2.14.5](/Tautulli/Tautulli/releases/tag/v2.14.5)
## Changelog
#### v2.14.5 (2024-09-20)
* Activity:
* Fix: Display of 2k resolution on activity card.
* Notifications:
* Fix: ntfy notifications with special characters failing to send.
* Other:
* Fix: Memory leak with database closing. ([#2404](https://github.com/Tautulli/Tautulli/issues/2404))
Assets
4
Loading
</option></form>
🎉
7
Sandbox8888, Erwan-loot, fliiiix, SirMaggot, NunoVilhenaSantos, teodorstelian, and DiegoFleitas reacted with hooray emoji
7 people reacted
## Tautulli v2.14.4
11 Aug 02:48
[JonnyWong16](/JonnyWong16)
[
v2.14.4
](/Tautulli/Tautulli/tree/v2.14.4)
[
`623a9f2`](/Tautulli/Tautulli/commit/623a9f291926fd279bc2f15e17d40429e1d78219)
This commit was signed with the committer’s **verified signature**.
[
](/JonnyWong16)
[JonnyWong16](/JonnyWong16)
GPG key ID: B1F1F9807184697A
Verified
[Learn about vigilant mode](https://docs.github.com/github/authenticating-to-github/displaying-verification-statuses-for-all-of-your-commits).
Compare
#
Choose a tag to compare
Filter
[View all tags](/Tautulli/Tautulli/tags)
[Tautulli v2.14.4](/Tautulli/Tautulli/releases/tag/v2.14.4)
## Changelog
#### v2.14.4 (2024-08-10)
* Notifications:
* Fix: Update Slack notification info card.
* New: Added ntfy notification agent. (Thanks [@nwithan8](https://github.com/nwithan8)) ([#2356](https://github.com/Tautulli/Tautulli/pull/2356), [#2000](https://github.com/Tautulli/Tautulli/issues/2000))
* UI:
* Fix: macOS platform capitalization.
* Other:
* Fix: Remove deprecated getdefaultlocale (Thanks [@teodorstelian](https://github.com/teodorstelian)) ([#2364](https://github.com/Tautulli/Tautulli/pull/2364), [#2345](https://github.com/Tautulli/Tautulli/issues/2345))
### Contributors
* [](https://github.com/nwithan8)
* [](https://github.com/teodorstelian)
nwithan8 and teodorstelian
Assets
4
Loading
</option></form>
👍
12
labdiynez, Sandbox8888, 2fersen, teodorstelian, nwithan8, JakePeralta7, gromflomite, CreamyG31337, adamlynes, trevordavies095, and 2 more reacted with thumbs up emoji
🎉
7
teodorstelian, nwithan8, JakePeralta7, WillPresley, frameshift18, DevDema, and johndfowler reacted with hooray emoji
14 people reacted