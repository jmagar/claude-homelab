Data Overflow | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Data Overflow
## Introduction
[Section titled “Introduction”](#introduction)
Out of the box, Apprise passes the full message (and title) you provide right along to the notification source(s). Some sources can handle a large surplus of data while others might not. These limitations are documented (*to the best of my knowledge*) on each of the [individual services corresponding wiki pages](../../services/).
However if you don’t want to be bothered with upstream restrictions, Apprise has a somewhat *elegant* way of handling these kinds of situations that you can leverage. You simply need to tack on the **overflow** parameter somewhere in your Apprise URL; for example:
* `schema://path/?overflow=split`
* `schema://path/?overflow=truncate`
* `schema://path/?overflow=upstream`
* `schema://path/?other=options&more=settings&overflow=split`
The possible **overflow=** options are defined as:
|Variable|Description|
|**split**|This will break the message body into as many smaller chunks as it takes to ensure the full delivery of what you wanted to notify with. The smaller chunk sizes are based on the very restrictions put out by the notification service itself.
For example, *Twitter* restricts public tweets to 280 characters. If your Apprise/Twitter URL was updated to look like this: `twitter://\<auth data\>/?overflow=split`, A message of say 1000 characters would be broken (and sent) via 4 smaller messages (280 + 280 + 280 + 160).|
|**truncate**|This just ensures that regardless of how much content you’re passing along to a remote notification service, the contents will never exceed the restrictions set by the service itself.
Take our *Twitter* example again (which restricts public tweets to 280 characters), If your Apprise/Twitter URL was updated to look like this: `twitter://\<auth data\>/?overflow=truncate`, A message of say 1000 characters would only send the first 280 characters to it. The rest would just be *truncated* and ignored.|
|**upstream**|Simply let the the upstream notification service handle all of the data passed to it (large or small). Apprise will not mangle/change its content in any way.
**Note**: This is the default configuration option used when the `overflow=` directive is not set.|
Please note that the **overflow=** option isn’t a perfect solution:
* It can fail for services like Telegram which can take content in the format of *HTML* (in addition to *Markdown*). If you’re using *HTML*, then there is a very strong possibility that both the `overflow=split` and/or `overflow=truncate` option could cut your message in the middle of an un-closed HTML tag. Telegram doesn’t fair to well to this and in the past (at the time of writing this wiki entry) would error and not display the data.
* It does however do its best to elegantly split/truncate messages at the end of a word (near the message limits).
* The `overflow=split` can work against you. Consider a situation where you send thousands of log entries accidentally to you via an SMS notification service. Be prepared to get hundreds of text messages to re-construct all of the data you asked it to deliver! This may or may not be what you wanted to happen; in this case, perhaps `overflow=truncate` is a better choice. Some services might even concur extra costs on you if you exceed a certain message threshold. The point is, just be open minded when you choose to enable the *split* option with notification services that have very small message size limits. The good news that each [supported notification plugin](../../services/) identifies what each hard limit is set to.
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