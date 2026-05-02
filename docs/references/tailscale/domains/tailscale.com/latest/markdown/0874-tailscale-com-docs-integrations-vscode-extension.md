Use the Tailscale extension for Visual Studio Code · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Use the Tailscale extension for Visual Studio Code
Last validated: Jan 5, 2026
The Tailscale extension for [Visual Studio Code](https://code.visualstudio.com) lets you interact with resources in your tailnet from within the VS Code IDE.
## [Download and install the extension](#download-and-install-the-extension)
You can find the extension in the [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=Tailscale.vscode-tailscale), or [open the extension in VS Code](vscode:extension/Tailscale.vscode-tailscale).
## [Using the Machine explorer](#using-the-machine-explorer)
You can interact with the machines in your tailnet from the primary sidebar in VS Code. Select the Tailscale icon, open the Tailscale Machine explorer, then select the machine that you want to access.
[Tailscale SSH](/docs/features/tailscale-ssh) must be enabled on a machine to connect to it. Currently, this is only available on Linux devices or macOS devices running our [open source tailscale + tailscaled CLI](/docs/concepts/macos-variants).
### [Connecting to a machine in your tailnet](#connecting-to-a-machine-in-your-tailnet)
You can start a new terminal session or attach VS Code to a machine for remote development in one selection. Hover over the machine you'd like to connect to, then select either the icon to start a terminal session, or the icon to attach the VS Code window to the machine.
#### [Resolving common issues with SSH usernames](#resolving-common-issues-with-ssh-usernames)
If you are using the VS Code remote connection feature and your username on the remote instance is different from your local username, you'll need to specify the remote username in your local SSH configuration. Otherwise, you may encounter connection issues.
Follow the steps below to configure your SSH settings:
1. Find the remote instance by opening the Tailscale machine explorer. Right-click on the node you want to connect to, and select **Copy DNS name**.
2. Edit your SSH configuration by opening your local SSH configuration file. This is typically located in `\~/.ssh/config`.
3. Add the remote user configuration by inserting a new section into the configuration file for the remote server. Replace `my-server.example.ts.net` with the copied DNS name from the first step and `alice` with your remote username.
```
`Host my-server.example.ts.net
User alice
`
```
By configuring the SSH settings with the correct remote username, you should be able to successfully connect to the remote instance using VS Code.
### [Editing files on a machine in your tailnet](#editing-files-on-a-machine-in-your-tailnet)
To read and edit files on a machine in your tailnet, expand the machine, then select the **File explorer** item. You must have [enabled Tailscale SSH](/docs/features/tailscale-ssh) on the machine to use the file explorer.
The first time you open the file explorer for a machine, the extension will prompt you for an SSH username to use for that machine. This username will be locally cached to use for future connections to this machine. If you'd like to change the SSH username later, right-click on the machine and select **Change SSH username** from the context menu.
You can add new files or directories in the file explorer by right-clicking on a directory and selecting **New file** or **New directory**. To rename or delete an existing file or directory, right-click on the item and select **Rename** or **Delete** from the context menu.
Deleting a file or folder from the file explorer is a permanent action and cannot be undone.
#### [Changing the root directory](#changing-the-root-directory)
By default, the File explorer will open the home folder (`\~/`) of the username you provided. You can change the root folder by right-clicking on the machine and selecting **Change root directory** from the context menu.
## [Start Tailscale Funnel](#start-tailscale-funnel)
You can set up [Tailscale Funnel](/docs/features/tailscale-funnel) inside of VS Code using the command palette or the Tailscale panel. You must have Funnel [enabled in your tailnet access control policies](/docs/features/tailscale-funnel#setup) to take advantage of this feature.
The VS Code extension lets you expose one port on your local machine to the public internet with Funnel. To expose multiple ports, use the [Funnel CLI](/docs/reference/examples/funnel).
To use Funnel, you must [enable MagicDNS](/docs/features/magicdns#enabling-magicdns) and [HTTPS certificates](/docs/how-to/set-up-https-certificates) in the admin console, and [add the appropriate node attribute](/docs/features/tailscale-funnel#node-attribute-required) (`nodeAttrs`) to your tailnet policy file.
### [Using the Funnel panel](#using-the-funnel-panel)
Your browser does not support the video tag.
1. Open the panel. You can use the keyboard shortcut `CMD` + `J`.
2. Enter the local port you want to expose over the internet in the **port** field.
3. Select **Start** to begin serving this port over the internet.
You can open the public URL in your default browser or copy it to your clipboard. To edit the existing Funnel configuration in this panel, change the port number and select the **Update** button.
### [Using Funnel from the command palette](#using-funnel-from-the-command-palette)
Your browser does not support the video tag.
1. Open the command palette with the keyboard shortcut `CMD` + `Shift` + `P`.
2. Type **Tailscale** to explore all the extension's commands.
3. To start Tailscale Funnel, choose **Tailscale: Share port publicly using Funnel**.
4. Enter the port number that you wish to share through Funnel.
### [Port discovery](#port-discovery)
Your browser does not support the video tag.
When you start a local server from VS Code, Tailscale will ask if you'd like to share that port over the internet with Funnel.
## [Troubleshooting](#troubleshooting)
### [Troubleshooting the machine explorer in the VS Code extension](#troubleshooting-the-machine-explorer-in-the-vs-code-extension)
If the Machine explorer isn't working as expected, we recommend the following steps:
1. Check that Tailscale SSH is enabled in access control policies on the machines you want to connect to. For now, this functionality is only available on Linux devices and macOS devices running our [open source Tailscale + tailscaled CLI](/docs/concepts/macos-variants). This means that some features of the Machine explorer won't work for Windows devices, iOS/Android devices, or macOS devices running the App Store or Standalone variant of the macOS app.
2. Check that your [access control policies](/docs/features/access-control) are set to [allow Tailscale SSH access](/docs/features/tailscale-ssh) between your local machine and the machine you want to connect to.
3. Ensure that you're using a valid username that already exists on the machine. If you need to change the username to something else, right-click on the machine and select **Change SSH username** from the context menu.
### [Troubleshooting Funnel in the VS Code extension](#troubleshooting-funnel-in-the-vs-code-extension)
If Funnel isn't working as expected, we recommend the following steps:
1. Check to ensure that Tailscale is signed in and active. On macOS and Windows, you can do this by selecting the Tailscale icon in your OS status bar. On Linux, run `tailscale status` in your CLI.
If you have signed in to multiple Tailscale accounts on your device, ensure that the correct account is active.
2. Ensure that your tailnet [access controls](/docs/features/access-control) are [configured to allow Tailscale Funnel](/docs/features/tailscale-funnel#setup) on your device.
3. Ensure that [MagicDNS and HTTPS Certificates are enabled](/docs/how-to/set-up-https-certificates) in your tailnet.
4. Ensure `tailscale` is available in the environment path. You can check this by running `tailscale status` in your CLI; if no command is found, you may need to add the Tailscale executable to your path. Alternatively, you can set its path using the `tailscale.path` setting in VS Code.
## [Configuration](#configuration)
* `tailscale.path`: A path to the `tailscale` executable. If unset, the extension will use
the environment path to resolve the `tailscale` executable. If set, the extension
will use the supplied path. The path should include the executable name (for example,
`/usr/bin/tailscale`, `C:\\Program Files\\tailscale\\tailscale.exe`).
On this page
* [Download and install the extension](#download-and-install-the-extension)
* [Using the Machine explorer](#using-the-machine-explorer)
* [Connecting to a machine in your tailnet](#connecting-to-a-machine-in-your-tailnet)
* [Resolving common issues with SSH usernames](#resolving-common-issues-with-ssh-usernames)
* [Editing files on a machine in your tailnet](#editing-files-on-a-machine-in-your-tailnet)
* [Changing the root directory](#changing-the-root-directory)
* [Start Tailscale Funnel](#start-tailscale-funnel)
* [Using the Funnel panel](#using-the-funnel-panel)
* [Using Funnel from the command palette](#using-funnel-from-the-command-palette)
* [Port discovery](#port-discovery)
* [Troubleshooting](#troubleshooting)
* [Troubleshooting the machine explorer in the VS Code extension](#troubleshooting-the-machine-explorer-in-the-vs-code-extension)
* [Troubleshooting Funnel in the VS Code extension](#troubleshooting-funnel-in-the-vs-code-extension)
* [Configuration](#configuration)
Scroll to top