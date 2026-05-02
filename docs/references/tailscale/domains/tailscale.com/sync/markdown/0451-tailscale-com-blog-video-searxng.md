How to Host a Private Metasearch Engine to Avoid Tracking, Profiling
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsNovember 18, 2024
# Host your own metasearch engine to avoid tracking and profiling
Tailscale can make any kind of private service and resource accessible from anywhere on the internet, without exposing it to the world. In today’s video tutorial, we’re looking at how to use Tailscale with a kind of private resource that might surprise you: a search engine.
SearXNG is a fully [open-source search engine aggregator](https://docs.searxng.org/) that can combine results from services and databases across the web and present them without any compromises on your privacy. In today’s video, we’ll walk through how to install SearXNG in a container accessible from anywhere through Tailscale.
I learned about SearXNG as part of a [self-imposed challenge to avoid Google services](https://blog.ktz.me/replacing-google-with-searxng-as-the-default-in-chrome/) as much as possible for a month. I found a robust community of enthusiastic users and contributors who have their own reasons to build up the software over the past several years. Why might somebody want to operate their own self-hosted metasearch engine?
* For many people, the appeal is privacy: SearXNG delivers results without any of the constant background tracking that we’ve grown to expect from the biggest search providers. For the real privacy nerds, a self-hosted instance accessible only over Tailscale is even more locked down!
* For others, it’s configurability. Not only is SearXNG open source, but it’s also built to be hackable, and you have total freedom over what data sources your instance uses and how results get presented.
* For still others, there’s the feeling of control. If you ever get the feeling Google keeps changing the layout and contents of its search engine results page out from under you, maybe you’d be happier with a version that you get to change when you see fit.
In the video tutorial, we use Docker to install SearXNG in an LXC container on top of Proxmox. We also configure Tailscale Serve to make the resulting container accessible on your tailnet (our term for a Tailscale network), and to automatically configure the TLS certificates so your browser is happy.
I hope you found exactly what you were looking for in that video. If you want to keep searching, though, you can stay involved in the Tailscale community — in our YouTube comments, on [the bustling subreddit](https://www.reddit.com/r/Tailscale/), and in [replies on X](https://twitter.com/tailscale), on[ Mastodon](https://hachyderm.io/@tailscale), and newly on [Bluesky](https://bsky.app/profile/tailscale.com). We love getting feedback on Tailscale and want to hear from you.
Share
Author
Alex Kretzschmar
Contributor
Parker Higgins
Author
Alex Kretzschmar
Contributor
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