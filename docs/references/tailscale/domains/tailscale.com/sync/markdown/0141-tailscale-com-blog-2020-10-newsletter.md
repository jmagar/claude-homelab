October Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 06, 2020
# October Tailscale newsletter
We’re happy to write today with a few exciting Tailscale product updates.
#### Community Contributions
First off, we’d like to acknowledge a few well-written articles about Tailscale we’ve seen around the web:
* [**Tailscale is magic; even more so with NixOS**](https://fzakaria.com/2020/09/17/tailscale-is-magic-even-more-so-with-nixos.html)
Our team has several NixOS fans, excited about bringing reproducible builds to the operating system level. Farid Zakaria wrote an article detailing how to set up Tailscale with NixOS, going beyond our own setup instructions to show how to restrict SSH access to exclusively over Tailscale.
* [**How I set Tailscale up on my Wi-Fi router**](https://willangley.org/how-i-set-up-tailscale-on-my-wifi-router/)
Will Angley writes about how he set up Tailscale on his OpenWRT Wi-Fi router to access it from anywhere without putting it on the public web. Will’s post is great, walking you through his own experience dealing with bumps and hiccups to arrive at a working Tailscale installation. Until we make an official OpenWRT package, Will’s guide is the best place to go.
* [**Making my life easier with Tailscale**](https://blog.patshead.com/2020/09/making-my-life-easier-with-tailscale.html)
Pat Regan shares his experience with Tailscale, including a number of interesting uses like remotely connecting to his home automation, OctoPrint 3D printer, and NAS running inside a virtual machine.
Thanks to Farid, Will, and Pat for sharing their experiences. We’ll be reaching out to send you some of our brand new Tailscale swag.
#### MagicDNS (beta)
Tailscale assigns private 100.x.y.z IP addresses to let you connect your devices. But IP addresses are hard for humans to remember. Was the production server 100.74.78.2 or 100.74.71.5? Tailscale gives every device a static IP, which admins can use in manually assigned DNS records … but that can be cumbersome to manage. With MagicDNS (currently in beta) this gets a whole lot easier.
MagicDNS automatically assigns private, human-readable domain names so you can access your devices without IPs. For example, instead of `ssh ubuntu@100.74.78.2`, you could use `ssh ubuntu@production-toronto-1`
How does it work? MagicDNS runs a local DNS server, so domain names are accessible to your team on Tailscale, without being accessible to the outside world. What’s more, users only receive DNS records for devices they are allowed to access, so unauthorized users can’t explore your network topography via DNS. Domain names are automatically assigned based on the device’s hostname, which can be customized.
[Read our MagicDNS docs](http://tailscale.com/kb/1081/magicdns) to enable this feature today.
While in beta there are two important limitations: first, you’ll need at least one DNS server set for your network, as a fallback for non-Tailscale DNS queries. And second, you’ll need to use [the unstable build of Tailscale](http://tailscale.com/kb/1083/install-beta). We’ll be removing these limitations before we make MagicDNS publicly available, but for early adopters out there, please give it a try and share any feedback!
(And big thanks to [Dmytro](https://github.com/dshynkev), one of our summer co-op students, whose hard work brought MagicDNS to life.)
#### Recently Seen Devices
Another feature courtesy of our industrious co-op students: Wendi launched the “Recently Seen Devices” section of our admin console. Access this feature by [clicking on any of your devices from the machines page](https://login.tailscale.com/admin/machines). At the bottom of the page, you should see a live count of bytes sent and received by this particular device.
This information is processed in real-time from our logs processing pipeline, which extracts non-identifiable metadata from device logs and shares it with network administrators to help monitor and debug their network. The first of several features to come.
You can learn more about the technical details and thinking that went into this feature in Wendi’s aptly titled post, [The Log Blog](/blog/the-log-blog/).
#### ACL Editing Improvements
Teams managing their network access with our Access Control List (ACL) feature will notice [a new-and-improved editor](https://login.tailscale.com/admin/acls) in our admin console.
The new editor provides proper indentation, editor shortcuts (e.g. Cmd+/ or Ctrl+/ to comment, Tab and Shift+Tab to indent/outdent), a diff preview, and incremental syntax highlighting for better performance on large ACL files.
Additionally, a new `"Tests"` section of the ACL file lets you to write automated tests to validate your access rules. Make changes, confident that your network will work as you intend. [More details can be found on our knowledgebase](/kb/1018/acls).
Share
Author
Ross Zurowski
Author
Ross Zurowski
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