SSH endpoint discovery on your tailnet with Charm Wishlist
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|July 19, 2023
# SSH endpoint discovery on your tailnet with Charm Wishlist
[Wishlist](https://github.com/charmbracelet/wishlist) is a surprisingly fun personalized directory you can run in your terminal to browse and connect to multiple SSH services, made by the command line tool company [Charm](https://charm.sh/). You can think of Wishlist like a homepage for your SSH apps and servers. And starting today, you can tie Wishlist into Tailscale, so that Wishlist [discovers the SSH endpoints available on the nodes on your tailnet](https://charm.sh/blog/wishlist-sd/) and makes it easy to navigate them.
Wishlist sits alongside other popular Charm tools such as [Wish, a specialized SSH server](https://github.com/charmbracelet/wish) that can be used to make terminal applications available over the protocol, and [bubbletea, a framework for making TUI applications](https://github.com/charmbracelet/bubbletea). Taken together these and other Charm tools have helped support a thriving ecosystem of command line software. Wishlist is of course compatible with Wish apps, but also with other SSH endpoints.
To use Wishlist’s new endpoint discovery feature with Tailscale, ensure you are using the most recent Wishlist release and run `wishlist` with the flags `--tailscale.key` (or the environment variable `TAILSCALE\_KEY`) set to a Tailscale API key—you can generate one from the [**Keys**](https://login.tailscale.com/admin/settings/keys) page in the admin console—and the flag `--tailscale.net` set to the name of your tailnet. Note that Tailscale API keys aren’t intended to be long-lived, so you may want to create an OAuth client and [script the generation of new keys](/kb/1215/oauth-clients/).
You’ll then be able to browse through SSH applications available on your tailnet. If you’d like to expand that list, check out some of the [CLI applications offered by Charm](https://charm.sh/apps/).
You can read more about the [new options available over on Charm’s blog](https://charm.sh/blog/wishlist-sd/), where they discuss other newly supported mechanisms for endpoint discovery and a `hints` configuration to set additional connection rules.
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