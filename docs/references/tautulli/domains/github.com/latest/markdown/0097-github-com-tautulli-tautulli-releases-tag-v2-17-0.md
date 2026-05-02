Release Tautulli v2.17.0 · Tautulli/Tautulli · GitHub
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
# Tautulli v2.17.0
[Latest](/Tautulli/Tautulli/releases/latest)
[Latest](/Tautulli/Tautulli/releases/latest)
Compare
#
Choose a tag to compare
Filter
[View all tags](/Tautulli/Tautulli/tags)
[github-actions](/apps/github-actions)
released this
28 Mar 01:24
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