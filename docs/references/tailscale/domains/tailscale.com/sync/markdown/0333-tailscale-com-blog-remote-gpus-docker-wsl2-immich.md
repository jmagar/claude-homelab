Remote machine learning on Windows with Docker and WSL2 from anywhere
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsApril 24, 2024
# Remote machine learning on Windows with Docker and WSL2 from anywhere
As a computer nerd, I am what you might call in the “pro utilization” camp for my hardware. In other words, that graphics card which is sitting there doing practically nothing all day in my gaming PC could be put to work, couldn’t it?
Lately, we’ve been on a bit of a mission to help folks looking to bring hosted services in-house. Today’s target is photos, using [Immich](https://immich.app/) — a self-hosted photo and video management solution. Think Google Photos, only it runs on your hardware and the data it harvests remains yours.
The obvious downside to hosting these things yourself is that you can’t outsource the facial recognition or smart search object detection to someone else. Instead, it’s up to you. In today’s video I walk you through the process of hooking up Immich’s machine learning components to a Windows 11 system, primarily used as my personal gaming rig, running on WSL2, inside of a docker container with Nvidia hardware acceleration support. And of course, we’ll discuss how to do this on any GPU that is in your tailnet (even a friend's remote GPU!).
This video builds upon concepts we’ve been exploring on the channel lately, such as running Tailscale in a docker container to add individual services to your tailnet.
Central to our mission here at Tailscale is to help you create small, trusted networks with your friends, family and coworkers. Are you using Tailscale to this end? Let us know with a post in [our subreddit](https://www.reddit.com/r/Tailscale/), in the [Fediverse](https://tailscale.com/blog/2022-11-16-fediverse), or on [X (formerly Twitter)](https://twitter.com/tailscale). Until next time, I’ve been Alex from Tailscale.
Share
Author
Alex Kretzschmar
Author
Alex Kretzschmar
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