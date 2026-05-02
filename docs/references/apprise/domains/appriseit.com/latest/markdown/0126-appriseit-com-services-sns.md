Amazon Web Service (AWS) - Simple Notification Service (SNS) Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Amazon Web Service (AWS) - Simple Notification Service (SNS) Notifications
## Overview
* **Source:** [https://aws.amazon.com/sns/](https://aws.amazon.com/sns/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 160
* [ Build Your Apprise URL](/url-builder/?schema=sns)
## Account Setup
[Section titled “Account Setup”](#account-setup)
You’ll need to create an account with Amazon Web Service (AWS) first to use this. If you don’t have one, you’ll need your credit card (even though the first 12 months are free). Alternatively, if you already have one (or are using it through your company), you’re good to go to the next step.
The next thing you’ll need to do is generate an *Access Key ID* and *Secret Access Key*.:
1. From the [AWS Management Console](https://console.aws.amazon.com) search for **IAM** under the *AWS services* section or simply click [here](https://console.aws.amazon.com/iam/home?#/security_credentials).
2. Expand the section reading **Access keys (access key ID and secret access key)**
3. Click on **Create New Access Key**
4. It will present the information to you on screen and let you download a file containing the same information. I suggest you do so since there is no way to retrieve this key again later on (unless you delete it and create a new one).
So at this point, it is presumed you’re set up, and you got your *Access Key ID* and *Secret Access Key* on hand.
You now have all the tools you need to send SMS messages.
If you want to take advantage of sending your notifications to *topics*: from the [AWS Management Console](https://console.aws.amazon.com) search for **Simple Notification Service** under the *AWS services* section and configure as many topics as you want. You’ll be able to reference them as well using this notification service.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `sns://{AccessKeyID}/{AccessKeySecret}/{Region}/+{PhoneNo}`
* `sns://{AccessKeyID}/{AccessKeySecret}/{Region}/+{PhoneNo1}/+{PhoneNo2}/+{PhoneNoN}`
* `sns://{AccessKeyID}/{AccessKeySecret}/{Region}/#{Topic}`
* `sns://{AccessKeyID}/{AccessKeySecret}/{Region}/#{Topic1}/#{Topic2}/#{TopicN}`
You can mix and match these entries as well:
* `sns://{AccessKeyID}/{AccessKeySecret}/{Region}/+{PhoneNo1}/#{Topic1}`
Enforcing a hashtag (#) for *topics* and a plus sign (+) in-front of phone numbers helps eliminate cases where ambiguity could be an issue such as a *topic* that is comprised of all numbers. These characters are purely optional.
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|AccessKeyID|Yes|The generated *Access Key ID* from the AWS Management Console|
|AccessKeySecret|Yes|The generated *Access Key Secret* from the AWS Management Console|
|Region|Yes|The region code might look like **us-east-1**, **us-west-2**, **cn-north-1**, etc|
|PhoneNo|No|The phone number MUST include the country codes dialling prefix as well when placed. You can optionally prefix the entire number with a plus symbol (+) to enforce that the value be interpreted as a phone number (in the event it can’t be auto-detected otherwise). This field is also very friendly and supports brackets, spaces and hyphens in the event you want to format the number in an easy to read fashion.|
|Topic|No|The topic you want to publish your message to.|
This notification service does not use the title field; only the *body* is passed along.
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
Send an SMS message:
Terminal window
```
`
# Assuming our {AccessKeyID} is AHIAJGNT76XIMXDBIJYA
# Assuming our {AccessKeySecret} is bu1dHSdO22pfaaVy/wmNsdljF4C07D3bndi9PQJ9
# Assuming our {Region} is us-east-2
# Assuming our {PhoneNo} - is in the US somewhere making our country code +1
# - identifies as 800-555-1223
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
sns://AHIAJGNT76XIMXDBIJYA/bu1dHSdO22pfaaVy/wmNsdljF4C07D3bndi9PQJ9/us-east-2/+18005551223
# the following would also have worked (spaces, brackets,
# dashes are accepted in a phone no field):
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
sns://AHIAJGNT76XIMXDBIJYA/bu1dHSdO22pfaaVy/wmNsdljF4C07D3bndi9PQJ9/us-east-2/+1(800)555-1223
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