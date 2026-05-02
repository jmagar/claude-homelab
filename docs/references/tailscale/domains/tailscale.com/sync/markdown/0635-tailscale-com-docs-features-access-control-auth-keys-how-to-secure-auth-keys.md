Securely handle an auth key · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Securely handle an auth key
Last validated: Jul 23, 2025
Tailscale CLI commands such as [`tailscale login`](/docs/reference/tailscale-cli#login) and [`tailscale up`](/docs/reference/tailscale-cli/up) let you pass in a [pre-authentication key](/docs/features/access-control/auth-keys) (auth key) so you can connect a new device without needing to sign in using a web browser. These commands use an `--auth-key` flag to specify the auth key. If you pass in the auth key directly to these commands, the auth key may persist in the shell history file. Any other process with access to the history file could reuse the key to add an unauthorized device to your Tailscale network. One way to mitigate this security risk is to use a [one-off auth key](/docs/features/access-control/auth-keys#authkey-one-off) instead of a [reusable auth key](/docs/features/access-control/auth-keys#authkey-reusable).
If you must use a reusable auth key, pass the auth key into the command by using an environment variable. For example, if you define an environment variable named `TS\_AUTH\_KEY` and set it to the auth key value, you can make a CLI call without disclosing the auth key:
```
`tailscale login --auth-key=$TS\_AUTH\_KEY
`
```
You don't need to use `TS\_AUTH\_KEY` as the environment variable name although examples in this topic do.
Handling of environment variables themselves varies by platform and operating system version. The examples shown are for a recent version of Bash, available on many Linux and macOS systems. If you are not using Bash, consult your platform documentation for ways to use environment variables.
## [Create the environment variable](#create-the-environment-variable)
Use the `export` command to create the environment variable.
This example shows how to set an environment variable without passing in the auth key value as an argument, meaning the auth key will not persist in history. When you [generate an auth key](/docs/features/access-control/auth-keys#generate-an-auth-key), you can copy its value to your clipboard. Once you have the auth key value in your clipboard, you can assign it to an environment variable by using standard input. Set the environment variable to `$(cat)`, and then press `Ctrl+v` (or `Cmd+v` on macOS), followed by `Ctrl+d`:
```
`# Use standard input to prevent the auth key from appearing in history
export TS\_AUTH\_KEY=$(cat)
\<Ctrl+v\>\<Ctrl+d\>
`
```
If you cannot use the `$(cat)` technique, you can assign the auth key value directly to the environment variable:
```
` export TS\_AUTH\_KEY=\<your-auth-key\>
`
```
If your [`HISTCONTROL`](https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html) value includes `ignorespace` or `ignoreboth`, you can insert a space prior to the `export` command to prevent the auth key from appearing in your `history` file:
```
`# Use a space in front of the command to prevent the command from appearing
# in history output.
export TS\_AUTH\_KEY=\<your-auth-key\>
`
```
Ensure you test the use of `HISTCONTROL` with `ignorespace` or `ignoreboth` on your device before relying on this technique to export your auth key. Specifically, test to ensure that a command that contains a preceding space does not appear in your `history` file.
If your platform or operating system version doesn't support omitting a command from the history file, or if you accidentally pass the auth key to a command, you can manually delete the command from your history. Possible ways include editing `\~/.bash\_history` or `\~/.zsh\_history` and then deleting the line that contains the auth key. In some cases you can also run `history` to determine the line number that shows the auth key, then running `history -d \<line-number\>`. Consult your platform documentation for ways to delete a line in your `history` file.
## [Use the environment variable](#use-the-environment-variable)
Pass the environment variable to the command. For example:
```
`tailscale login --auth-key=$TS\_AUTH\_KEY
`
```
## [Remove the environment variable](#remove-the-environment-variable)
If you no longer want to have the environment variable set to your auth key, run the following command:
```
`unset TS\_AUTH\_KEY
`
```
If you no longer want to keep the auth key itself, you can [revoke the auth key](/docs/features/access-control/auth-keys#revoke-an-auth-key).
On this page
* [Create the environment variable](#create-the-environment-variable)
* [Use the environment variable](#use-the-environment-variable)
* [Remove the environment variable](#remove-the-environment-variable)
Scroll to top