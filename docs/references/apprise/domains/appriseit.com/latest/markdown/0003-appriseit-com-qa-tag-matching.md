Tag Matching | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Tag Matching
## Introduction
[Section titled “Introduction”](#introduction)
If you tagged your URLs, they’re not going to be notified unless you explicitly reference them with **—tag=** (or **-g**). You can always check to see what URLs have been loaded using the `all` tag directive paired with **—dry-run**:
### Tag Association Debugging
[Section titled “Tag Association Debugging”](#tag-association-debugging)
If you have access to the Apprise CLI (installed via `pip install apprise`) then you can easily trace what aligns with different tag combinations. The `--dry-run` will cause `apprise` to not perform any action, but merely list what matches to the terminal.
This simply lists all entries found in the `apprise.txt` file whether they have a tag or not:
Terminal window
```
`
apprise --dry-run --tag=all \\
--config=/my/path/to/my/config/apprise.txt
`
```
Without a `--tag` specified, you’ll only match URLs that have no tag associated with them:
Terminal window
```
`
# List notifications that would otherwise be triggered without a tag specified:
apprise --dry-run \\
--config=/my/path/to/my/config/apprise.txt
`
```
Now we can list all defined URLs that have the tag `devops` assigned to them:
Terminal window
```
`
apprise --dry-run --tag=devops \\
--config=/my/path/to/my/config/apprise.txt
`
```
Once you have identified your tagging issue in your configuration to the point it lists correctly using the above commands above, you can send your notification by removing the `--dry-run` switch and add the `--body` (`-b`) at a minimum to send your notification(s).
General filter expressions follow:
|Filter|Selected services|
|`--tag TagA`|Match `TagA`|
|`--tag TagA,TagB`|Match `TagA`**AND**`TagB` (Strict)|
|`--tag 'TagA' --tag 'TagB`|Match `TagA`**OR**`TagB` (Union)|
|`--tag 'TagA,TagC --tag TagB`|Match ( `TagA`**AND**`TagC`) **OR**`TagB`. This is a mix of Strict and Union|
|`--tag all`|Match **ALL** services (tagged and untagged).|
|`(Omitted)`|Notify **untagged** services only.|
When you use a comma, you are applying a filter: you are telling Apprise to narrow down the list to only those specific services that possess every tag you listed. To widen the list to include multiple different groups, simply repeat the -g switch.
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