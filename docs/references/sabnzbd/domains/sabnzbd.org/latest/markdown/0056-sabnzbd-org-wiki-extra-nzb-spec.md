SABnzbd -
Wiki -
NZB Format Specification
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+NZB+Format+Specification&amp;body=##+URL:+/wiki/extra/nzb-spec.html
Improvement:
>)
NZB Format Specification
*Mirrored from the now defunct [docs.newzbin.com](http://docs.newzbin.com). References to "We" throughout the document should be assumed to be referring to Newzbin, not SABnzbd.*
## NZB (Message-ID List) File Specification
Here follows a sample NZB for a single small file:
```
`\<?xml version="1.0" encoding="iso-8859-1" ?\>
\<!DOCTYPE nzb PUBLIC "-//newzBin//DTD NZB 1.1//EN" "http://www.newzbin.com/DTD/nzb/nzb-1.1.dtd"\>
\<nzb xmlns="http://www.newzbin.com/DTD/2003/nzb"\>
\<head\>
\<meta type="title"\>Your File!\</meta\>
\<meta type="password"\>secret\</meta\>
\<meta type="tag"\>HD\</meta\>
\<meta type="category"\>TV\</meta\>
\</head\>
\<file poster="Joe Bloggs &lt;[[emailprotected]](/cdn-cgi/l/email-protection)&gt;" date="1071674882" subject="Here's your file! abc-mr2a.r01 (1/2)"\>
\<groups\>
\<group\>alt.binaries.newzbin\</group\>
\<group\>alt.binaries.mojo\</group\>
\</groups\>
\<segments\>
\<segment bytes="102394" number="1"\>[[emailprotected]](/cdn-cgi/l/email-protection)\</segment\>
\<segment bytes="4501" number="2"\>[[emailprotected]](/cdn-cgi/l/email-protection)\</segment\>
\</segments\>
\</file\>
\</nzb\>`
```
This example is for one file, consisting of two segments, which are 102,394 bytes and 4,501 bytes. The file is posted into two groups, alt.binaries.newzbin and alt.binaries.mojo; it was posted by Joe Bloggs, at unixtime 1071674882. The subject is slightly munged; the segment counter always starts at 1; but you can see it has 2 segments; confirmed by the segments tags below.
This is a fully populated nzb file, all the tags and attributes you can expect to see are there, but clients are expected to cope should more be added.
Since this is an XML format, clients are encouraged to use an XML parser to process it; minor changes to the nzb files we generate such as with attribute ordering, indentation, and even new tags and attributes must be taken into account. XML PI's and CDATA sections are not expected to be used, so clients should be free to cut some corners using lightweight parsers.
We will, where possible, avoid changes which may break clients; even those which use simple pattern matchers. Significant changes to the format are unlikely at this point, but users of the format should try not to get too complacent.
## XML Tag breakdown
|\<nzb\> .. \</nzb\>|
|Description|Root element for the NZB|
|Attributes|None|
|Body|None (placeholder)|
|Children|\<head\>, \<file\>|
|\<head\> .. \</head\>|
|Description|Contains all metadata relating to contents of NZB|
|Attributes|None|
|Body|None|
|Children|\<meta\>|
|\<meta\> .. \</meta\>|
|Description|Creator-definable metadata for the contents of the NZB (e.g. title)|
|Attributes|**type***string* - Identifier for the metadata content|
|Body|*string* - The metadata content corresponding to the given type|
|Children|None|
|\<file\> .. \</file\>|
|Description||Represents a list of messageids that make up a file|
|Attributes|**poster**|*string* - Copy of the From: field from the article header.|
||**date**|*int* - Unixtime representation of the date the server saw this article. This is not completely reliable; timezones can break this value, and incorrectly configured news servers will make it almost useless.|
||**subject**|*string* - A slightly munged copy of the article's subject. The segment counter (xx/yy) usually found at the end, is replaced with (1/yy). You can use the yy to confirm all segments are present.|
|Body||None (placeholder)|
|Children||\<groups\>, \<segments\>|
|\<groups\> .. \</groups\>|
|Description|Placeholder element for a list of groups that reference the file|
|Attributes|None|
|Body|None (placeholder)|
|Children|\<group\>|
|\<group\> .. \</group\>|
|Description|One \<group\> element represents a group, multiple may be used|
|Attributes|None|
|Body|*string* - The name of the group (e.g. alt.binaries.newzbin)|
|Children|None|
|\<segments\> .. \</segments\>|
|Description|Placeholder element for a list of segments that make up a file|
|Attributes|None|
|Body|None (placeholder)|
|Children|\<segment\>|
|\<segment\> .. \</segment\>|
|Description||One part segment of a file|
|Attributes|**bytes**|*int* - Size of the article, in bytes, as a number, with no comma separation.|
||**number**|*int* - Segment number of the article, gleaned by parsing (yy/zz)|
|Body||*string* - The Message-ID of this article, without the surrounding \< and \> (e.g. [[emailprotected]](/cdn-cgi/l/email-protection#e3d2d1d0d7d6d5d4dbda828180878685a38d869490cd8d869499818a8dcd808c8e))|
|Children||None|
## Metadata Defined Types
The meta tag (as a child of the head tag), added in NZB 1.1, is designed to allow posters to include arbitrary data in any NZB file, which decoders might find useful. It's a very simple key-value system, where the key is the 'type' attribute.
In order to create some consistency, we define the following types; if you'd like one added, let us know so others will know of it's existence and may choose to use it. As per usual XML, these types are case sensitive so take care.
* title - a human-readable identifiable title for the contents of the NZB, ie the body of a metadata tag with the title attribute could be "Ubuntu Linux 9.1064bit Desktop CD"
* tag - An attribute, like h246 or SD (multiple tags allowed)
* category - A category as used by your indexing service (preferably one)
* password - if any password is required for the contents of the NZB, it can be specified in a password meta-tag. If there are multiple passwords, this tag could simply be specified more than once and they can all be tried. If it becomes a common requirement we may develop a way to associate a password tag (or indeed any meta tag) with a specific file block.
If you'd like to create your own private type which will never clash with any that we define, prefix it with X- as per HTTP.. ie, X-Some-Private-Type
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)