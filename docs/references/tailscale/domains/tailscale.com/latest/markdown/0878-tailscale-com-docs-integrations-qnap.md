Access QNAP NAS from anywhere · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Access QNAP NAS from anywhere
Last validated: Jan 5, 2026
Tailscale makes it easy to securely connect to your QNAP NAS devices over WireGuard®.
Tailscale is free for most personal uses, including accessing your NAS.
## [Supported QNAP hardware](#supported-qnap-hardware)
* x86-64bit devices
* arm-64bit devices
## [Installation steps](#installation-steps)
1. Open the QNAP App Center.
2. Open the **Communications** section.
3. Locate the Tailscale application and select **Install**.
4. After the Tailscale app installation is completed, select the Tailscale app icon, and select **Open**.
5. Log in to your Tailscale network.
6. In the **Connect device** page, select **Connect**.
The app can also be downloaded from the [QNAP App Center](https://www.qnap.com/en/app-center/?os=qts&amp;type=Communications) website.
### [Manual installation steps](#manual-installation-steps)
An alternative to the recommended approach of installing Tailscale from the QNAP App Center is to install Tailscale using a downloadable QNAP package (QPKG). A reason you might want to install from a QPKG is to access new Tailscale features that are not yet released in the Tailscale version that is available from the QNAP App Center.
To manually install Tailscale:
1. Download the QPKG for your QNAP device from the [Tailscale Packages server](https://pkgs.tailscale.com/). QNAP QPKGs are available from both [stable](https://pkgs.tailscale.com/stable/#qpkgs) and [unstable](https://pkgs.tailscale.com/unstable/#qpkgs) release tracks.
2. Open the **App Center** on your QNAP device.
3. Select **Install Manually** in the upper right-hand corner, select **Browse**, select the QPKG (`.qpkg`) file that you downloaded, and then select **Install**.
4. Once installation completes, tailscaled should be up and running on your QNAP device, and you should find a new **Tailscale** app in your My Apps section.
## [Features](#features)
When used with QNAP, Tailscale supports these features:
* Receive [Taildrop](/docs/features/taildrop) files from other tailnet devices automatically, when you create a shared folder named "Tailnet" on your NAS.
* Web-based login to any [supported identity provider](/docs/integrations/identity).
* Access your QNAP NAS from anywhere, [without opening firewall ports](/blog/how-nat-traversal-works).
* Share your NAS with designated Tailscale users, using [node sharing](/docs/features/sharing).
* Restrict access to your NAS using [access control policies](/docs/features/access-control).
* Use your NAS as a [subnet router](/docs/features/subnet-routers) to provide external access to your LAN. This requires using [`tailscale`](#using-the-tailscale-cli) command line steps.
* Use your NAS as an [exit node](/docs/features/exit-nodes) for secure internet access from anywhere.
## [Using the Tailscale CLI](#using-the-tailscale-cli)
Some Tailscale functionality, such as configuring QNAP to be a subnet router, requires using the [`tailscale`](/docs/reference/tailscale-cli) CLI. After you install the Tailscale app, the `tailscale` CLI is available as part of the mounted `qpkg` package. You can access the QNAP terminal and run CLI commands [using SSH](https://www.qnap.com/en/how-to/faq/article/how-do-i-access-my-qnap-nas-using-ssh).
You can find the mounted package path using this command:
```
`echo $(getcfg SHARE\_DEF defVolMP -f /etc/config/def\_share.info)/.qpkg/Tailscale/
`
```
You can run the `tailscale` CLI using this command:
```
`$(getcfg SHARE\_DEF defVolMP -f /etc/config/def\_share.info)/.qpkg/Tailscale/tailscale [...]
`
```
For convenience, you can add the package path to your `$PATH` environment variable.
```
`export PATH=$PATH:$(getcfg SHARE\_DEF defVolMP -f /etc/config/def\_share.info)/.qpkg/Tailscale/
`
```
This lets you run `tailscale` commands without the full path:
```
`tailscale [...]
`
```
## [Special thanks](#special-thanks)
Special thanks to [ivokub](https://github.com/ivokub), who has contributed a community-maintained [Tailscale QPKG package builder](https://github.com/ivokub/tailscale-qpkg).
On this page
* [Supported QNAP hardware](#supported-qnap-hardware)
* [Installation steps](#installation-steps)
* [Manual installation steps](#manual-installation-steps)
* [Features](#features)
* [Using the Tailscale CLI](#using-the-tailscale-cli)
* [Special thanks](#special-thanks)
Scroll to top