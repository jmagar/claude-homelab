Configuration | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Configuration
Configuration allows you to identify all of your notification services in one place, while supporting grouping, tagging, and keeping secrets out of your shell history.
Apprise configuration is **portable**. The same configuration file can be used by the CLI, the API server, and the Python library without modification.
Consider using configuration files when:
* You want to reuse the same notification setup across scripts or systems
* You want to keep credentials out of your shell history
* You want to group services or simplify references to your Apprise URLs with tags
* You want the same configuration to work with the CLI, API, and Python library
If you only need a one-off notification, inline URLs are sufficient. For anything beyond that, configuration files are recommended.
## Supported Configuration Formats
[Section titled “Supported Configuration Formats”](#supported-configuration-formats)
Apprise supports two configuration formats. Both describe the same information, but YAML can express more structure.
* **TEXT**: Simple, line-based, and easy to read. Best for small or manual setups.
* **YAML**: Structured and standardised. Better suited for larger configurations and automation tools.
* [ TEXT ](#tab-panel-32)
* [ YAML ](#tab-panel-33)
## TEXT Configuration
[Section titled “TEXT Configuration”](#text-configuration)
TEXT configuration is line-based.
* Blank lines are ignored
* Comments start with `#` or `;`
* Each URL can optionally be prefixed with one or more tags
* You can define tag groups
* You can include other configuration sources
TEXT configuration is ideal when:
* You want the simplest possible setup
* You are managing only a few services
* You prefer minimal syntax
### Basic TEXT Syntax
[Section titled “Basic TEXT Syntax”](#basic-text-syntax)
```
`
# Email notifications
mailto://user:password@gmail.com
# Discord notifications
discord://webhook\_id/webhook\_token
`
```
## TEXT Tagging and Grouping
[Section titled “TEXT Tagging and Grouping”](#text-tagging-and-grouping)
Tags let you organize notification services into logical groups such as `personal`, `ops`, or `critical`. You can then target groups without changing your destination URLs.
### TEXT Tagging Examples
[Section titled “TEXT Tagging Examples”](#text-tagging-examples)
You can categorize services by placing tags before the URL, separated by an equals sign (`=`).
```
`
# Syntax: tag=url
# Associates the 'desktop' tag with this notification
desktop=gnome://
# You can assign multiple tags using commas or spaces
# This URL is part of 'tv' AND 'kitchen'
tv,kitchen=kodi://user:pass@kitchen.host
`
```
### Grouping Tags with TEXT Configuration
[Section titled “Grouping Tags with TEXT Configuration”](#grouping-tags-with-text-configuration)
You can include other configuration files to keep your setup clean. This is excellent for separating secrets from general logic.
```
`
# 1. Define your base services
user1=mailto://credentials
user2=mailto://credentials
# 2. Define a group
# Notifying 'friends' will notify 'user1' and 'user2'
friends = user1, user2
`
```
### TEXT Includes
[Section titled “TEXT Includes”](#text-includes)
You can import other configuration files (local or remote) using the `include` keyword.
```
`
# Read from another Apprise configuation file on the local server
include /etc/apprise/secrets.conf
# Read from an Apprise API server
include https://my-config-server.com/get/my-key/
`
```
The Apprise API Server will not `include` files identified as being stored local to the server for security reasons.
## Targeting Tags when Sending
[Section titled “Targeting Tags when Sending”](#targeting-tags-when-sending)
Tag filtering is consistent across tools. For example, with the CLI you can target a group by tag:
General filter expressions follow:
|Filter|Selected services|
|`--tag TagA`|Has `TagA`|
|`--tag TagA,TagB`|Has `TagA`**AND**`TagB`|
|`--tag 'TagA' --tag 'TagB`|Has `TagA`**OR**`TagB`|
|`--tag 'TagA,TagC --tag TagB`|Has ( `TagA`**AND**`TagC`) **OR**`TagB`|
When you use a comma, you are applying a filter: you are telling Apprise to narrow down the list to only those specific services that possess every tag you listed. To widen the list to include multiple different groups, simply repeat the `--tag` (`-g`) switch.
Example:
Terminal window
```
`
apprise --tag="ops,critical" \\
--body="Notify services that have the tag ops AND critical associated with it"
apprise --tag="ops" --tag "critical" \\
--body="Notify all services that have either 'ops' AND/OR 'critical' associated with it"
`
```
## Loading Configuration
[Section titled “Loading Configuration”](#loading-configuration)
Whether you use TEXT or YAML, you load your configuration into the CLI or Library the same way.
### CLI Usage
[Section titled “CLI Usage”](#cli-usage)
You can load a file using the `--config` (or `-c`) flag. You can specify this flag multiple times to load multiple files.
Terminal window
```
`
# Load a local file
apprise --config=/etc/apprise/config.yml --body="test"
# Load from a URL
apprise --config=https://myserver.com/cfg/apprise --body="test"
`
```
## Default Configuration Locations
[Section titled “Default Configuration Locations”](#default-configuration-locations)
If you do not specify a configuration file via the CLI (`--config`), Apprise automatically loads a default configuration file for you.
* [ Linux/BSD/Apple ](#tab-panel-34)
* [ Microsoft Windows ](#tab-panel-35)
The following configuration files are scanned in the order identified below; the first match is loaded and nothing further is processed thereafter.
1. `\~/.apprise`
2. `\~/.apprise.conf`
3. `\~/.apprise.yml`
4. `\~/.apprise.yaml`
5. `\~/.config/apprise`
6. `\~/.config/apprise.conf`
7. `\~/.config/apprise.yml`
8. `\~/.config/apprise.yaml`
9. `\~/.apprise/apprise`
10. `\~/.apprise/apprise.conf`
11. `\~/.apprise/apprise.yml`
12. `\~/.apprise/apprise.yaml`
13. `\~/.config/apprise/apprise`
14. `\~/.config/apprise/apprise.conf`
15. `\~/.config/apprise/apprise.yml`
16. `\~/.config/apprise/apprise.yaml`
The following global paths are also searched if nothing is found above:
1. `/etc/apprise`
2. `/etc/apprise.yml`
3. `/etc/apprise.yaml`
4. `/etc/apprise/apprise`
5. `/etc/apprise/apprise.conf`
6. `/etc/apprise/apprise.yml`
7. `/etc/apprise/apprise.yaml`
Apprise automatically determines the format (TEXT vs YAML) based on the file extension (`.yml` or `.yaml`). If your file has no extension, it defaults to TEXT unless valid YAML structure is detected.
## Reserved Tags
[Section titled “Reserved Tags”](#reserved-tags)
There are two special tags you can use to control notification behavior.
|Tag|Description|
|`always`|If you assign the tag `always` to a URL in your config, it will **ALWAYS** trigger, even if you are filtering for a different tag via the CLI.|
|`all`|Used when *sending* a notification (e.g. `apprise --tag=all`). This tells Apprise to ignore all filters and notify **every** service defined in your configuration.|
## Private Web Hosted Configuration
[Section titled “Private Web Hosted Configuration”](#private-web-hosted-configuration)
If you are hosting your configuration on a private web server, Apprise detects the format based on the **Content-Type** header returned by the server, or by an explicit URL parameter.
|Format|HTTP Content-Type|URL Force Override|
|**YAML**|`text/yaml`, `application/x-yaml`|`http://...?format=yaml`|
|**TEXT**|`text/plain`|`http://...?format=text`|
If you’re using a hosting of the Apprise API, your `include` URLs look like: `http://apprise-host/get/\<key\>`
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