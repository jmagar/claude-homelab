Streamlabs Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Streamlabs Notifications
## Overview
* **Source:** [https://streamlabs.com/](https://streamlabs.com/)
* **Image Support:** Yes
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=strmlabs)
## Account Setup
[Section titled “Account Setup”](#account-setup)
The process to get signed up with Streamlabs is a bit lengthy.
**Note:** The screenshots and instructions below are 100% full credit to the **[LNBits Project](https://github.com/Fittiboy/lnbits)** ([found here](https://github.com/Fittiboy/lnbits/tree/master/lnbits/extensions/streamalerts#stream-alerts)).
At the moment, the only service that has an open API to work with is Streamlabs, so this setup requires linking your Twitch/YouTube/Facebook account to Streamlabs.
1. Log into [Streamlabs](https://streamlabs.com/login?r=https://streamlabs.com/dashboard).
2. Navigate to the API settings page to register an App:
3. Fill out the form with anything it will accept as valid. Most fields can be gibberish, as the application is not supposed to ever move past the “testing” stage and is for your personal use only.
In the “Whitelist Users” field, input the username of a Twitch account you control. While this feature is *technically* limited to Twitch, you can use the alerts overlay for donations on YouTube and Facebook as well.
For now, simply set the “Redirect URI” to `http://localhost`, you will change this soon.
Then, hit create:
4. Now we’ll take the Client ID from the Streamlabs page and generate a code that will be used for apprise to communicate with Streamlabs
Replace the placeholders in the link below with your Client ID
`https://www.streamlabs.com/api/v1.0/authorize?client\_id=\<YOURCLIENTID\>&redirect\_uri=http://localhost&response\_type=code&scope=donations.read+donations.create+alerts.create`
You are redirected to localhost
copy the url param code that is specified in the browser url bar
`http://localhost/?code=\<YOURCODE\>`
5. Generate an access token using your code generated in the last step, your Client ID, and your Secret
Open a terminal and make a request to generate an access token that Apprise will utilize
Terminal window
```
`
curl --request POST --url 'https://streamlabs.com/api/v1.0/token' -d 'grant\_type=authorization\_code&code=\<YOURCODE\>&client\_id=\<YOURCLIENTID\>&client\_secret=\<YOURSECRET\>&redirect\_uri=http%3A%2F%2Flocalhost'
`
```
“Similar JSON should be returned`{"access\_token":\<YOURACCESSTOKEN\>,"token\_type":"Bearer","expires\_in":3600,"refresh\_token":""}`
Note that the access token does not expire
1. Now copy and paste your access token to build the streamlabs url
`strmlabs://\<YOURACCESSTOKEN\>/?call=DONATIONS`
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `strmlabs://{access\_token}/`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|access\_token|Yes|The access token generated from your Streamlabs account.|
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
Send a Streamlabs notification:
Terminal window
```
`
# Assuming our {access\_token} is abcdefghij1234567890
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
strmlabs://abcdefghij1234567890/
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