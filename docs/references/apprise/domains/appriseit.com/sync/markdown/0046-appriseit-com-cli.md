Command Line Interface | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Command Line Interface
The Apprise CLI (`apprise`) is a lightweight command-line tool that allows you to send notifications to virtually any service directly from your terminal. It is ideal for system administrators, DevOps engineers, and automation scripts.
## Installing the CLI
[Section titled “Installing the CLI”](#installing-the-cli)
The `apprise` command is included with the Apprise core installation.
Most users install it via `pip install apprise`.
Docker images primarily target the **Apprise API**, though the CLI is available inside the container for operational use.
For full installation options, see [Installation](/getting-started/installation/).
## Basic Usage
[Section titled “Basic Usage”](#basic-usage)
The syntax is designed to be intuitive. You simply provide the notification details and the destination URLs.
Terminal window
```
`
# General Syntax
apprise -t "Title" -b "Body" "service-url://..."
`
```
### Sending a Simple Notification
[Section titled “Sending a Simple Notification”](#sending-a-simple-notification)
To send a notification, provide a title (`-t`) and a body (`-b`), followed by one or more Apprise URLs.
Terminal window
```
`
# Send a notification to Discord
apprise -t "Task Complete" -b " The backup finished successfully." \\
"discord://webhook\_id/webhook\_token"
`
```
### Chaining Multiple Services
[Section titled “Chaining Multiple Services”](#chaining-multiple-services)
You can notify multiple services at once by listing them sequentially. By default,
Apprise sends notifications asynchronously for better performance.
Use `--disable-async` to send notifications synchronously, processing each service
one at a time in the order they are loaded.
Terminal window
```
`
# Notify Discord and Email simultaneously
apprise -vv -t "Server Alert" -b "High CPU usage detected." \\
-n "warning" \\
"discord://webhook\_id/webhook\_token" \\
"mailto://user:pass@gmail.com"
`
```
Adding `-v` (verbose) is useful for debugging. It prints delivery status and
diagnostic information to the console. Verbosity increases with each additional
`v` (for example `-vv`, `-vvv`), with higher levels producing more detailed output.
## Piping Input (stdin)
[Section titled “Piping Input (stdin)”](#piping-input-stdin)
The CLI works seamlessly with standard input (`stdin`). If you do not specify a body (`-b`), Apprise listens for input from the pipe. This makes it perfect for monitoring logs or capturing command output.
Terminal window
```
`
# Send the contents of a file
cat /proc/cpuinfo | apprise -t "CPU Info" \\
"mailto://user:pass@gmail.com"
# Send the result of a command
uptime | apprise "discord://webhook\_id/webhook\_token"
`
```
## Loading Configuration
[Section titled “Loading Configuration”](#loading-configuration)
While you can pass URLs directly to the command, it is often cleaner to use a configuration file. This keeps secrets out of your command history and allows you to manage complex notification groups.
Terminal window
```
`
# Load configuration from a file and send a message
apprise --config "/etc/apprise/config.yml" \\
--body "System is going down for maintenance"
`
```
For more details on how to structure your configuration files, see the [Configuration](/getting-started/configuration/) guide.
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