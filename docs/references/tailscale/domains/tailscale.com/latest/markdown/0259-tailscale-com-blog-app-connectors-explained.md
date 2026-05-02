How to Route Domain-Specific Traffic with App Connectors
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productApril 10, 2025
# Tailscale Explained: What is an app connector?
Have you ever wished you could route traffic for just one domain through a specific piece of your infrastructure? Maybe you’ve got an internal code forge (like GitHub Enterprise or Gitlab) that needs all traffic coming from a single whitelisted IP. With Tailscale app connectors, you can do just that.
Think of an app connector as a domain-specific exit node. It's like split DNS, but for routing traffic, teleporting packets through your tailnet wherever you need them to go.
In the latest *Tailscale Explained* video, I walk you through configuring an app connector and show how easy it is to direct traffic wherever it needs to exit.
In the video above for example, I demonstrate re-geolocating traffic to fool a website that reports your public IP address. I request the website [ipchicken.com](http://ipchicken.com) from a Tailscale client in the U.S., but the packets route through infrastructure in the UK and out to the public internet via the app connector. This changes the IP address the site sees.
That’s just one trick. App connectors unlock a bunch of useful patterns, especially when you need specific services to see traffic from a known location. We ship pre-configured connectors for apps like Salesforce, JIRA, GitHub, Google Workspace, and more.
Check out the Tailscale [documentation](https://tailscale.com/kb/1281/app-connectors) for full setup details, requirements, and supported integrations.
Ready to try it? You can get started with app connectors right now from the **Apps** tab in your Tailscale admin console.
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