Tailscale v1.10 & GitHub Auth
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|June 25, 2021
# Tailscale v1.10 & GitHub Auth
Tailscale 1.10 is now available on all platforms (pending iOS approval to the App Store — we expect it to go through this weekend). While this was generally a bug fix and cleanup release, a few noteworthy changes happened in and around this release worth highlighting.
#### Sign Up for Tailscale with GitHub
Users can now sign up for Tailscale using their GitHub account. We do not (yet) support creating your own teams, but if you are part of an existing GitHub org you’ll get the option to join that org when you sign up.
#### v1.10 Bug fixes, improvements
As mentioned at the top of this post, Tailscale v1.10 is primarily a bugfix and stabilization release. It also lays the groundwork for an upcoming feature to support HTTPS certificates that we’re hoping to release in the coming weeks. For all platforms `tailscale ping --until-direct` (the default) now exits with a non-zero exit code if no direct connection was established.
On macOS we’ve added a UI to allow access to the local LAN while using an exit node. We’ve also added support for the new macOS 12 beta, and iOS 15 betas announced at WWDC. For Android and iOS we have fixed use of Tailscale IP addresses as DNS servers. As always we’d love to hear any feedback you have about how we can make Tailscale better. [Send us an email](mailto:support@tailscale.com) or [reply to @Tailscale on Twitter](https://twitter.com/tailscale).
#### In case you missed it: Taildrop (alpha)
We announced Taildrop in v1.8 but it is worth mentioning again. Taildrop makes it easy to send files between your personal devices on a Tailscale network. Like all traffic sent over Tailscale, Taildrop transfers files over encrypted peer-to-peer connections, using the fastest available path. This makes sending sensitive or large files without third-party servers in the middle painless. Read more about [the process behind building Taildrop](/blog/2021-06-taildrop-was-easy/) and [what you can do with Taildrop](/kb/1106/taildrop).
#### One last thing
As a remote team, one of the things we do to stay connected is play games on Friday afternoons. Sometimes when we play [Skribbl.io](https://skribbl.io), the drawings become part of our custom Slack emojis. We thought it would be nice to share our `:friday\_deploy:` emoji with the community, drawn in less than 60 seconds by our designer Ross Zurowski. The original word was ‘flamethrower’ but ‘Friday deploy’ was the best guess.
Share
Author
Laura Franzese
Author
Laura Franzese
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