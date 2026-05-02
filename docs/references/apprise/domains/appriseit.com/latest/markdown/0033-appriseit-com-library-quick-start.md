Quick Start | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Quick Start
## The Apprise Object
[Section titled “The Apprise Object”](#the-apprise-object)
```
`
import apprise
apobj = apprise.Apprise()
`
```
### Adding Services (`add`)
[Section titled “Adding Services (add)”](#adding-services-add)
The `add()` method registers notification services to your instance.
```
`
# Add a single service
apobj.add('json://localhost')
# Add multiple services at once
apobj.add([
'mailto://user:pass@example.com',
'slack://tokenA/tokenB/tokenC'
])
`
```
### Sending Notifications (`notify`)
[Section titled “Sending Notifications (notify)”](#sending-notifications-notify)
The `notify()` method sends messages to all registered services.
```
`
apobj.notify(
title="Server Alert",
body="CPU usage is at 99%",
)
`
```
#### Message Types
[Section titled “Message Types”](#message-types)
You can categorize your notifications using `NotifyType`. This often changes the icon or color of the notification (depending on the receiving service).
```
`
from apprise import NotifyType
apobj.notify(
title="Success",
body="Backup completed successfully.",
notify\_type=NotifyType.SUCCESS
)
`
```
|Icon|Type|Description|
||`NotifyType.INFO`|Default. General information.|
||`NotifyType.SUCCESS`|Successful operations.|
||`NotifyType.WARNING`|Issues that aren’t fatal.|
||`NotifyType.FAILURE`|Critical errors.|
### Tagging
[Section titled “Tagging”](#tagging)
Tagging allows you to send notifications to specific subgroups of services.
**1. Assign Tags**
```
`
# Assign tags when adding services
apobj.add('slack://...', tag='devops')
apobj.add('mailto://...', tag='management')
apobj.add('discord://...', tag=['devops', 'management']) # Multiple tags
`
```
**2. Filter by Tags**
```
`
# Notify ONLY services tagged 'devops'
apobj.notify(title="Deploying", body="...", tag="devops")
# Notify services tagged 'devops' OR 'management'
apobj.notify(title="Update", body="...", tag=["devops", "management"])
`
```
Programmatic tag expressions follow:
|`notify(tag=...)` expression|Selected services|
|`"TagA"`|Has `TagA`|
|`"TagA,TagB"`|Has `TagA`**AND**`TagB`|
|`["TagA", "TagB"]`|Has `TagA`**OR**`TagB`|
|`["TagA,TagC", "TagB"]`|Has (`TagA`**AND**`TagC`) **OR**`TagB`|
In Python, a list means **OR**, while a comma-separated string means **AND**.
This is the most important difference from what many people intuitively try first.
```
`
# Notify services tagged 'product' AND 'create'
apobj.notify(title="Created", body="...", tag="product,create")
# Notify services tagged 'devops' OR 'finance'
apobj.notify(title="Report", body="...", tag=["devops", "finance"])
# Notify services matching ('comment' AND 'create') OR 'admin'
apobj.notify(title="Comment Created", body="...", tag=["comment,create", "admin"])
`
```
### Loading Configuration Files
[Section titled “Loading Configuration Files”](#loading-configuration-files)
You can use the `AppriseConfig` object to load URLs from external YAML or Text files instead of hardcoding them.
```
`
import apprise
# 1. Create the Config Object
config = apprise.AppriseConfig()
# 2. Add configuration sources
config.add('/path/to/my/config.yml')
config.add('https://myserver.com/my/apprise/config')
# 3. Create Apprise instance and ingest the config
apobj = apprise.Apprise()
apobj.add(config)
# 4. Notify as usual (URLs from the file are now loaded)
apobj.notify("Loaded from config!")
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