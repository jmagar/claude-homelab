Explore, Edit Transfer with Machine Explorer in Tailscale’s VS Code extension
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|August 18, 2023
# Introducing Machine Explorer, now in Tailscale’s VS Code extension
Tailscale for VS Code just got a major upgrade, bringing you the ability to explore, edit, and transfer the files on any of the nodes in your tailnet that you can reach through [Tailscale SSH](/tailscale-ssh/). For the millions of developers who use VS Code regularly, this new extension brings all of your remote files into a familiar and powerful editing environment. That helps you get stuff done with your code without worrying about using an ancient version of `nano` on some remote server or getting the syntax of `scp` commands just right.
The new Machine Explorer is simple enough to stay out of your way when you just want to make a quick edit to a remote file, but power users will find a lot to like about how it works under the hood.
* Highlight any node in the explorer pane, and you can instantly open a VS Code terminal window or attach to its remote VS Code server
* Right click and get quick access to the machine’s DNS name, IPv4 or IPv6 address, and a link to its extended information in your Tailscale admin console
* Explore the filesystem of any node that you can access through Tailscale SSH, without having to juggle keys or passwords
These features add to the existing functionality of the Tailscale VS Code extension, including its support for [Tailscale Funnel](/kb/1223/tailscale-funnel/), which allows users to share services running on a localhost port out with the public internet.
To show how the new extension works Alex created this demo video documenting a common workflow: stand up a server for the game Factorio, fix some config files with VS Code’s advanced syntax highlighting options, and then transfer a save file directly to the remote node.
Even if you’re not familiar with Factorio, there’s still plenty of ways this new extension can save you time — which is good, because you’ll need those hours for your new Factorio habit. For example:
* A web developer working on a portfolio site can do some work locally, run Funnel to show that local version to friends or colleagues around the world, and then transfer all the changes over to the server hosting the production version.
* A programmer can spin up a new node with a VPS provider, and then pull down a Docker image or Github repo and move an existing config file into place without ever leaving their text editor.
* A Kubernetes administrator can copy kubeconfig files to their local system and make system configuration changes across multiple nodes with ease.
### How to install
The Tailscale extension for VS Code works with your system’s Tailscale client. Step zero here, then, is to make sure you’ve got a [Tailscale account set up](https://login.tailscale.com/start), the machine you’re on is connected to your tailnet and [configured to use Tailscale SSH](/kb/1193/tailscale-ssh/).
Then search for Tailscale in VS Code’s Extensions tab, [open the extension directly](vscode:extension/Tailscale.vscode-tailscale), or find us [in the Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=tailscale.vscode-tailscale).
Once you’ve installed the extension, click the Tailscale icon in the left pane to see the nodes available to you. Your other machines will appear under the “Managed by you” heading; If you’ve got external nodes shared into your tailnet, they’ll be under “All machines.”
If you click a node and see the text “⚠️ Enable Tailscale SSH,” ensure [your ACLs allow SSH access](/kb/1018/acls/) and that the remote machine’s Tailscale process was started with the `--ssh` flag. If you’re accessing an external node that has been [shared](/kb/1084/sharing/) into your tailnet, the ACLs on the sharing tailnet must allow ssh access.
The Tailscale extension for VS Code is open source, and the code that powers it [is available on GitHub](https://github.com/tailscale-dev/vscode-tailscale).
Now you’ve got the Tailscale for VS Code extension installed and you can get to exploring, editing, and transferring files throughout your tailnet, all from your editor. How are you going to use it? What do you want to see next? Let us know on [Twitter](https://twitter.com/tailscale), [Mastodon](https://hachyderm.io/@tailscale), or [Reddit](https://www.reddit.com/r/Tailscale/)!
Share
Author
Parker Higgins
Author
Parker Higgins
Share
Loading...
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)