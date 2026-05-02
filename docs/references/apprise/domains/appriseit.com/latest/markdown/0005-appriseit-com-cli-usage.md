Usage & Arguments | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Usage & Arguments
This guide covers everything from basic flags to advanced scripting techniques with the Apprise CLI.
## Command Line Arguments
[Section titled “Command Line Arguments”](#command-line-arguments)
You can view the full help menu at any time by running `apprise --help`.
### Message Composition
[Section titled “Message Composition”](#message-composition)
|Flag|Long flag|Description|
|`-b`|`--body`|The message body to send. If omitted, Apprise reads from `stdin`.|
|`-t`|`--title`|The message title (optional).|
|`-n`|`--notification-type`|Notification type. Values: `info`, `success`, `warning`, `failure`. Default is `info`.|
|`-i`|`--input-format`|Input format. Values: `text`, `html`, `markdown`. Default is `text`.|
|`-e`|`--interpret-escapes`|Interpret backslash escapes in `--body` (for example `\\n`, `\\r`).|
|`-j`|`--interpret-emojis`|Interpret emoji shortcodes in `--body` (for example `:smile:`).|
|`-T`|`--theme`|Set the default theme.|
### Configuration, Filtering, and Plugins
[Section titled “Configuration, Filtering, and Plugins”](#configuration-filtering-and-plugins)
|Flag|Long flag|Description|
|`-c`|`--config`|One or more configuration locations (local file or remote URL).|
|`-g`|`--tag`|Filter which services to notify (see Tag filtering).|
|`-R`|`--recursion-depth`|Maximum number of recursive `include` directives allowed while loading config. Default is `1`. Set to `0` to ignore `include`/import statements.|
|`-P`|`--plugin-path`|Add one or more paths to scan for custom notification plugins.|
### Attachments
[Section titled “Attachments”](#attachments)
|Flag|Long flag|Description|
|`-a`|`--attach`|One or more attachment locations (local file path or URL). Can be specified multiple times.|
### Storage
[Section titled “Storage”](#storage)
Apprise supports a persistent storage cache. You can tune it with the flags below, or use the `apprise storage` subcommand.
|Flag|Long flag|Description|
|`-S`|`--storage-path`|Path to the persistent storage caching location.|
|`-SM`|`--storage-mode`|Storage mode. Values: `auto`, `flush`, `memory`. Default is `auto`.|
|`-SPD`|`--storage-prune-days`|Number of days used for `storage prune`. Default is `30`. Set to `0` to delete all accumulated content.|
|`-SUL`|`--storage-uid-length`|Number of unique characters used to store persistent cache in. Default is `8`.|
### Execution and Diagnostics
[Section titled “Execution and Diagnostics”](#execution-and-diagnostics)
|Flag|Long flag|Description|
|`-Da`|`--disable-async`|Send synchronously (one after the other) instead of in parallel.|
|`-d`|`--dry-run`|Trial run. Prints which services would be triggered to `stdout`. Does not send notifications.|
|`-l`|`--details`|Print details about currently supported services.|
|`-v`|`--verbose`|Increase verbosity. You can stack it (for example `-vvvv`).|
|`-D`|`--debug`|Debug mode, useful for troubleshooting.|
|`-V`|`--version`|Print version and exit.|
## Environment Variables
[Section titled “Environment Variables”](#environment-variables)
You can pre-set default behaviors using environment variables. This is useful for containerized environments or setting system-wide defaults.
|Variable|Description|
|`APPRISE\_URLS`|Default service URLs to notify if none are provided on the command line. Space and/or comma delimited. If `--config` is specified, it overrides any `APPRISE\_URLS` reference.|
|`APPRISE\_CONFIG\_PATH`|Override the default configuration search paths. Use `;`, `\\n`, and/or `\\r` to delimit multiple entries.|
|`APPRISE\_PLUGIN\_PATH`|Override the default plugin search paths. Use `;`, `\\n`, and/or `\\r` to delimit multiple entries.|
|`APPRISE\_STORAGE\_PATH`|Override the default persistent storage path.|
## Default Configuration Locations
[Section titled “Default Configuration Locations”](#default-configuration-locations)
If you do not specify a configuration file via the CLI (`--config`), Apprise automatically loads a default configuration file for you.
* [ Linux/BSD/Apple ](#tab-panel-30)
* [ Microsoft Windows ](#tab-panel-31)
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
## File Attachments
[Section titled “File Attachments”](#file-attachments)
You can send files alongside your notifications using the `--attach` (`-a`) flag. Apprise handles the upload logic automatically for services that support it (like Discord, Slack, and Telegram).
### Local Files
[Section titled “Local Files”](#local-files)
Send a log file or image from your local disk.
Terminal window
```
`
apprise \\
--title "System Log" \\
--body "See attached log for details" \\
--attach "/var/log/syslog" \\
"discord://webhook\_id/webhook\_token"
`
```
### Remote Attachments
[Section titled “Remote Attachments”](#remote-attachments)
Apprise can fetch a file from a URL and forward it as an attachment.
Terminal window
```
`
# Apprise downloads the image and sends it to Telegram
apprise \\
--title "Front Door" \\
--body "Motion detected" \\
--attach "http://camera-ip/snapshot.jpg" \\
"tgram://bot\_token/chat\_id"
`
```
### Multiple Attachments
[Section titled “Multiple Attachments”](#multiple-attachments)
You can specify the flag multiple times to send several files at once.
Terminal window
```
`
apprise \\
--body "Here are the build artifacts" \\
--attach "release-notes.txt" \\
--attach "build.zip" \\
"slack://tokenA/tokenB/tokenC"
`
```
## Tagging and Filtering
[Section titled “Tagging and Filtering”](#tagging-and-filtering)
Apprise allows you to target specific subsets of your configuration using tags.
### Logic Rules
[Section titled “Logic Rules”](#logic-rules)
Use `--tag` (`-g`) to specify one or more tags to filter which services to notify:
* `-g "tagA" -g "tagB"`: Match tagA **OR** tagB (Union).
* `-g "tagA,tagB"`: Match tagA **AND** tagB (Strict).
* `-g "all"`: Notify **ALL** services (tagged and untagged).
* `(Omitted)`: Notify **untagged** services only.
Another way to look at it:
* **OR Logic:** To notify services that have *either* Tag A **OR** Tag B, use the `--tag` switch multiple times.
* **AND Logic:** To notify services that have *both* Tag A **AND** Tag B, separate tags with a comma within a single switch.
### Examples
[Section titled “Examples”](#examples)
Terminal window
```
`
# Notify services tagged 'devops' OR 'admin'
apprise -t "Union Test" --config apprise.yml \\
--tag devops --tag admin
# Notify services tagged with BOTH 'devops' AND 'critical'
apprise -t "Intersection Test" --config apprise.yml \\
--tag "devops,critical"
# Trigger a configuration stored under the key 'my-alerts' on a local
# Apprise API server using the key 'my-alerts'
apprise -t "Job Finished" \\
"apprise://localhost:8000/my-alerts"
# Trigger a secure remote instance, targeting only the 'devops' tag
apprise -t "Production Issue" \\
--tag devops \\
"apprises://apprise.example.com/234-3242-23-2111-34"
`
```
## Formatting & Emojis
[Section titled “Formatting & Emojis”](#formatting--emojis)
### Input Formats
[Section titled “Input Formats”](#input-formats)
By default, Apprise treats the body as plain text. You can change this using `--input-format`.
Terminal window
```
`
# Send a Markdown formatted message
apprise -t "Build Status" -b "\*\*Success\*\*: The build passed!" \\
--input-format markdown \\
"discord://..."
`
```
### Emoji Support
[Section titled “Emoji Support”](#emoji-support)
Use `--interpret-emojis` (`-j`) to convert emoji shortcodes into actual emojis.
Terminal window
```
`
apprise \\
--title "Server Status" \\
--body "The server is on :fire:. Please send help :ambulance:." \\
--interpret-emojis \\
"slack://..."
`
```
### Escape Sequences
[Section titled “Escape Sequences”](#escape-sequences)
Use `--interpret-escapes` (`-e`) when you want `\\n` sequences in your body to become real newlines.
Terminal window
```
`
apprise \\
--title "Multi-line" \\
--body "Line 1\\\\nLine 2\\\\nLine 3" \\
--interpret-escapes \\
"discord://..."
`
```
## Using Apprise API
[Section titled “Using Apprise API”](#using-apprise-api)
If you are running a self-hosted [Apprise API](/api/) instance, you can use the CLI to trigger it using the `apprise://` schema. This allows you to centralize your configuration on the server and keep your local clients simple.
### Syntax
[Section titled “Syntax”](#syntax)
* **Insecure (HTTP):** `apprise://hostname/config\_key`
* **Secure (HTTPS):** `apprises://hostname/config\_key`
Examples:
Terminal window
```
`
# Trigger a configuration stored under the key 'my-alerts' on a local server
apprise -t "Job Finished" \\
"apprise://localhost:8000/my-alerts"
# Trigger a secure remote instance, targeting only the 'devops' tag
apprise -t "Production Issue" \\
--tag devops \\
"apprises://apprise.example.com/production-key
`
```
## Scripting & Piping
[Section titled “Scripting & Piping”](#scripting--piping)
The CLI is designed to work seamlessly with standard system pipes and scripts.
### Multi-Line Input
[Section titled “Multi-Line Input”](#multi-line-input)
If you omit `--body`, Apprise reads from `stdin`.
Terminal window
```
`
cat \<\< '\_EOF' | apprise --title "Database Status" \\
--notification-type success "discord://..."
Backup started: 10:00 AM
Backup finished: 10:05 AM
Status: SUCCESS
\_EOF
`
```
### Piping from Files
[Section titled “Piping from Files”](#piping-from-files)
Redirect the contents of a file directly into the message body.
Terminal window
```
`
cat \~/notes.txt | apprise --title "Daily Notes" \\
"mailto://user:pass@example.com"
`
```
### Using Variables
[Section titled “Using Variables”](#using-variables)
If you have a multi-line variable in your script, wrap it in quotes to preserve newlines.
Terminal window
```
`
MULTILINE\_VAR="""
This variable has been defined
with multiple lines in it.
"""
apprise --title "Variable Example" \\
--body "$MULTILINE\_VAR" \\
"gotify://localhost"
`
```
## Persistent Storage
[Section titled “Persistent Storage”](#persistent-storage)
Persistent storage writes to the following location by default, unless `APPRISE\_STORAGE\_PATH` or `--storage-path` overrides it:
* `\~/.local/share/apprise/cache`
Apprise can cache certain lookups and authentication details on disk to reduce
repeated API calls. This is enabled by default for the CLI (mode `auto`). :contentReference[oaicite:14]{index="14"}
To interact with storage, use the `storage` subcommand:
Terminal window
```
`
apprise storage
`
```
For the full explanation (UIDs, cache locations, screenshots, and cleanup workflows),
see [Persistent Storage](/cli/persistent-storage/).
## Exit Status
[Section titled “Exit Status”](#exit-status)
The Apprise CLI exits with:
* `0` if all notifications were sent successfully.
* `1` if one or more notifications could not be sent.
* `2` if there was a command line error (for example, invalid arguments).
* `3` if one or more service URLs were successfully loaded, but none could be notified due to user filtering (tags).
## Integrations
[Section titled “Integrations”](#integrations)
### Tmux Alert Bell
[Section titled “Tmux Alert Bell”](#tmux-alert-bell)
You can link the tmux `alert-bell` hook to Apprise to get notifications when long-running commands complete.
Terminal window
```
`
# 1. Set your tmux bell-action to 'other'
set-option -g bell-action other
# 2. Trigger Apprise on 'alert-bell'
set-hook -g alert-bell 'run-shell "\\
apprise \\
--title \\"Tmux notification on #{host}\\" \\
--body \\"Session #{session\_name} window #{window\_index}:#{window\_name}\\" \\
--notification-type info \\
discord://webhook\_id/webhook\_token"'
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