Remote Syslog Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Remote Syslog Notifications
## Overview
* **Source:** [https://tools.ietf.org/html/rfc5424](https://tools.ietf.org/html/rfc5424)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=rsyslog)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Remote Syslog is a way for network devices to send event messages to a logging server – usually known as a Syslog server. The Syslog protocol is supported by a wide range of devices and can be used to log different types of events.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `rsyslog://{host}`
* `rsyslog://{host}:{port}`
* `rsyslog://{host}/{facility}`
* `rsyslog://{host}:{port}/{facility}`
One might change the facility on a remote syslog (rsyslog) server from its default like so:
* `syslog://localhost/local5`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|host|No|Query a remote Syslog server (rsyslog) by optionally specifying the hostname|
|port|No|The remote port associated with your rsyslog server provided. By default if this value isn’t sent port **514** is used by default.|
|facility|No|The facility to use, by default it is `user`. Valid options are **kern**, **user**, **mail**, **daemon**, **auth**, **syslog**, **lpr**, **news**, **uucp**, **cron**, **local0**, **local1**, **local2**, **local3**, **local4**, **local5**, **local6**, and **local7**|
|logpid|Yes|Include PID as part of the log output.|
### Global Parameters
[Section titled “Global Parameters”](#global-parameters)
|Variable|Description|
|overflow|This parameter can be set to either `split`, `truncate`, or `upstream`. This determines how Apprise delivers the message you pass it. By default this is set to `upstream`
👉 `upstream`: Do nothing at all; pass the message exactly as you received it to the service.
👉 `truncate`: Ensure that the message will fit within the service’s documented upstream message limit. If more information was passed then the defined limit, the overhead information is truncated.
👉 `split`: similar to truncate except if the message doesn’t fit within the service’s documented upstream message limit, it is split into smaller chunks and they are all delivered sequentially there-after.|
|format|This parameter can be set to either `text`, `html`, or `markdown`. Some services support the ability to post content by several different means. The default of this varies (it can be one of the 3 mentioned at any time depending on which service you choose). You can optionally force this setting to stray from the defaults if you wish. If the service doesn’t support different types of transmission formats, then this field is ignored.|
|verify|External requests made to secure locations (such as through the use of `https`) will have certificates associated with them. By default, Apprise will verify that these certificates are valid; if they are not then no notification will be sent to the source. In some occasions, a user might not have a certificate authority to verify the key against or they trust the source; in this case you will want to set this flag to `no`. By default it is set to `yes`.|
|cto|This stands for Socket Connect Timeout. This is the number of seconds Requests will wait for your client to establish a connection to a remote machine (corresponding to the *connect()*) call on the socket. The default value is 4.0 seconds.|
|rto|This stands for Socket Read Timeout. This is the number of seconds the client will wait for the server to send a response. The default value is 4.0 seconds.|
|emojis|Enable Emoji support (such as providing `:+1:` would translate to 👍). By default this is set to `no`.
**Note:** Depending on server side settings, the administrator has the power to disable emoji support at a global level; but default this is not the case.|
|tz|Identify the IANA Time Zone Database you wish to operate as. By default this is detected based on the configuration the server hosting Apprise is running on. You can set this to things like `America/Toronto`, or any other properly formated Timezone describing your area.|
## Examples
[Section titled “Examples”](#examples)
Send a Remote Syslog notification
Terminal window
```
`
# The following sends a syslog notification to the `user` facility
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
rsyslog://localhost
`
```
### Internal RSyslog Test Server
[Section titled “Internal RSyslog Test Server”](#internal-rsyslog-test-server)
Terminal window
```
`
# Setup a simple docker file that will run our our rsyslog server for us:
cat \<\< \_EOF \> dockerfile.syslog
FROM ubuntu
RUN apt update && apt install rsyslog -y
RUN echo '\\$ModLoad imudp\\n \\\\
\\$UDPServerRun 514\\n \\\\
\\$ModLoad imtcp\\n \\\\
\\$InputTCPServerRun 514\\n \\\\
\\$template RemoteStore, "/var/log/remote/%\\$year%-%\\$Month%-%\\$Day%.log"\\n \\\\
:source, !isequal, "localhost" -?RemoteStore\\n \\\\
:source, isequal, "last" \~ ' \> /etc/rsyslog.conf
ENTRYPOINT ["rsyslogd", "-n"]
\_EOF
# build it:
docker build -t mysyslog -f dockerfile.syslog .
# Now run it:
docker run --cap-add SYSLOG --restart always \\
-v $(pwd)/log:/var/log \\
-p 514:514 -p 514:514/udp --name rsyslog mysyslog
# In another terminal window, you can look into a directory
# relative to the location you ran the above command for a directory
# called `log`
You may need to adjust its permissions, the log file will only get
created after you send an apprise notification.
`
```
Questions or Feedback?
#### Documentation
Notice a typo or an error?
[
Report it
](https://github.com/caronc/apprise-docs/issues/)
or
[
contribute a fix
](https://github.com/caronc/apprise-docs)
.
#### Technical Issues
Having trouble with the code? Open an issue on GitHub:
* [
Apprise Core & CLI
](https://github.com/caronc/apprise/issues/)
* [
Apprise API
](https://github.com/caronc/apprise-api/issues/)
Made with love from Canada