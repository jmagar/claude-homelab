LaMetric Time/Clock Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# LaMetric Time/Clock Notifications
## Overview
* **Source:** [https://lametric.com](https://lametric.com)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=lametric)
## Account Setup
[Section titled “Account Setup”](#account-setup)
You now have to methods of notifying your LaMetric Device:
1. **Device Mode**: Directly query your LaMetric Device on your local network to send it a notification.
2. **Cloud Mode**: A secure query to LaMetric’s API server in the cloud to send a message to your clock. You will have limited options with this method.
### Device Mode Setup
[Section titled “Device Mode Setup”](#device-mode-setup)
With Device Mode, your Apprise query will directly interface with the LaMetric Time Device on your local network.
1. Sign Up and login to the [Developer Webpage](https://developer.lametric.com).
2. Locate your Device **API Key**; you can find it [here](https://developer.lametric.com/user/devices):
3. You now need to know the IP address your device resides on. Your devices **IP Address** can be found in LaMetric Time app at: **Settings** -\> **Wi-Fi** -\> **IP Address**
### Cloud Mode Setup
[Section titled “Cloud Mode Setup”](#cloud-mode-setup)
**Note**: It appears that at some point in time Lametric dropped support and usage of their cloud mode. While documented in their forums with screenshots and usage examples. None of this seems to be available for the end user anymore to play/work with. For those who still have access to their upstream servers can leverage this. Alternatively those who use this Apprise plugin will need to focus on the normal Device Mode (explained above) instead.
Using Cloud Mode, you will interface with your LaMetric Time device through the internet.
1. Sign Up and login to the [Developer Webpage](https://developer.lametric.com).
2. Create a **Indicator App** if you haven’t already done so from [here](https://developer.lametric.com/applications/sources).
* There is a great official tutorial on how to do this [here](https://lametric-documentation.readthedocs.io/en/latest/guides/first-steps/first-lametric-indicator-app.html#publish-app-and-install-it-to-your-lametric-time)
* Make sure to set the **Communication Type** to **PUSH**
* You will be able to **Publish** your app once you’ve finished setting it up. This will allow it to be accessible from the internet using the `cloud` mode of this Apprise Plugin. The **Publish** button shows up from within the settings of your Lametric App upon clicking on the **Draft Vx** folder (where `x` is the version - usually a 1)
* When you’ve completed the above steps, the site would have provided you a **PUSH URL** that looks like this:
* `https://developer.lametric.com/api/v1/dev/widget/update/com.lametric.{app\_id}/{app\_ver}`
You will need to record the `{app\_id}` and `{app\_ver}` to use the `cloud` mode.
The same page should also provide you with an Application **Access Token**. It’s approximately 86 characters with two equal (`=`) characters at the end of it. This becomes your `{app\_access\_token}`. Here is an example of what one might look like:
* `K2MxWI0NzU0ZmI2NjJlZYTgViMDgDRiN8YjlmZjRmNTc4NDVhJzk0RiNjNh0EyKWW==`
## Syntax
[Section titled “Syntax”](#syntax)
Valid *Device Mode* syntax is as follows:
* `lametric://{apikey}@{hostname}`
* `lametric://{apikey}@{hostname}:{port}`
* `lametric://{userid}:{apikey}@{hostname}`
* `lametric://{userid}:{apikey}@{hostname}:{port}`
Valid *Cloud Mode* syntax is as follows:
* `lametric://{app\_access\_token}@{app\_id}`
* `lametric://{app\_access\_token}@{app\_id}/{app\_version}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
The breakdown of parameters depend on whether you are using the Cloud Mode or Device Mode.
### Device Mode
[Section titled “Device Mode”](#device-mode)
|Variable|Required|Description|
|apikey|Yes|Your Device **API Key** can be found on LaMetric’s website [here](https://developer.lametric.com/user/devices)|
|hostname|No|This is the IP address or hostname of your Lametric device on your local network.|
|port|No|The port your LaMetric device is listening on. By default the port is **8080**.|
|userid|No|The account login to your Lametric device on your local network. By default the user is set to `dev`.|
|mode|No|Define the Apprise/Lametric mode to use. This can be either set to `cloud` or `device`. It’s worth pointing out that Apprise is smart enough to detect the mode you’re using based on the URL you provide it. But for those who want to explicitly provide its value, they can do so.|
|cycles|No|The number of times message should be displayed. If cycles is set to `0`, notification will stay on the screen until user dismisses it manually. By default it is set to `1`.|
|sound|No|An audible alarm that can be sent with the notification. The following keywords are supported: `bicycle`, `car`, `cash`, `cat`, `dog`, `dog2`, `energy`, `knock-knock`, `letter\_email`, `lose1`, `lose2`, `negative1`, `negative2`, `negative3`, `negative4`, `negative5`, `notification`, `notification2`, `notification3`, `notification4`, `open\_door`, `positive1`, `positive2`, `positive3`, `positive4`, `positive5`, `positive6`, `statistic`, `thunder`, `water1`, `water2`, `win`, `win2`, `wind`, `wind\_short`, `alarm1`, `alarm2`, `alarm3`, `alarm4`, `alarm5`, `alarm6`, `alarm7`, `alarm8`, `alarm9`, `alarm10`, `alarm11`, `alarm12`, and `alarm13`.|
|priority|No|The priority of the message; the possible values are `info`, `warning`, and `critical`. By default `info` is used if nothing is specified.|
|icon\_type|No|Represents the nature of notification; the possible values are `info`, `alert`, and `none`. By default `none` is used if nothing is specified.|
### Cloud Mode
[Section titled “Cloud Mode”](#cloud-mode)
|Variable|Required|Description|
|app\_id|Yes|Your Indicator App’s **Application ID** can be found in your \*Indicator App Configuration\*\*. You can access your application’s configuration from the LaMetric’s website [here](https://developer.lametric.com/applications/).|
|app\_access\_token|Yes|Your Indicator App’s **Access Token** can be found in your \*Indicator App Configuration\*\*. You can access your application’s configuation from the LaMetric’s website [here](https://developer.lametric.com/applications/).|
|app\_ver|No|The version associated with your Indicator App. If this isn’t specified, then the default value of `1` (One) is used.|
|mode|No|Define the Apprise/Lametric mode to use. This can be either set to `cloud` or `device`. It’s worth pointing out that Apprise is smart enough to detect the mode you’re using based on the URL you provide it. But for those who want to explicitly provide its value, they can do so.|
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
Send a LaMetric Time notification using Device Mode (local to our network):
Terminal window
```
`
# Assuming our {apikey} is abc123
# Assuming our {hostname} is 192.168.1.3
apprise -vv -b "Test Message Body" lametric://abc123@192.168.1.3
`
```
Send a LaMetric Time notification using Cloud Mode (using LaMetrics Developer API):
Terminal window
```
`
# Assuming our {app\_id} ABCD1234
# Assuming our {app\_access\_token} is abcdefg==
apprise -vv -b "Test Message Body" lametric://abcdefg==@ABCD1234
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