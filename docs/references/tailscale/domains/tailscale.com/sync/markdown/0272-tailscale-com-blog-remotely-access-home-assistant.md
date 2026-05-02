Access Home Assistant Remotely with Tailscale | Guide
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsApril 11, 2024
# Remotely access Home Assistant via Tailscale for free
In our latest video, we walk through how to remotely access your Home Assistant by adding it to your Tailscale network. For those not familiar, [Home Assistant](https://www.home-assistant.io/) is an open source home automation platform that puts local control and privacy first. It's a Python application designed to be run 24/7 in your house, on your hardware.
It’s become a behemoth in the space: At the time of writing, Home Assistant is the [second most active project on GitHub](https://github.blog/2023-11-08-the-state-of-open-source-and-ai/) and has [over 2,750 different integrations](https://www.home-assistant.io/integrations/). These allow Home Assistant to communicate with other devices or services, including proprietary ones. Gone are the days of juggling 10 different apps to control each individual "smart" thing in your life—it all flows through Home Assistant.
For those moments when you need to set the [climate controls](https://www.home-assistant.io/integrations/climate/) from afar, or put your mind at ease that you did in fact feed the [goldfish today](https://community.home-assistant.io/t/ilonda-fish-feeder/181675/3), Tailscale can help you access your Home Assistant install while on the go. And if you have an existing domain and reverse proxy setup and would like to slot Tailscale into that mix, I walk you through that as well.
## Supporting code
In the video, I use the unofficial [Tailscale add-on](https://github.com/hassio-addons/addon-tailscale) maintained by Frenck. It requires some specific YAML code to verify ownership of a personal domain, such as `https://alexshouse.example.com`. Here's that code in YAML form.
```
`domains:
- ha.dotsandstuff.dev
email: atailandscales@gmail.com
keyfile: privkey.pem
certfile: fullchain.pem
challenge: dns
dns:
provider: dns-cloudflare
cloudflare\_email: atailandscales@gmail.com
cloudflare\_api\_token: NOTAREALTOKEN\_vsfKyyrRai
dns-cloudflare-propagation-seconds: 15
`
```
Instructions on where to place it [start at 6:36 in the video](https://www.youtube.com/watch?v=vDxmtRByXDY&amp;t=396s). Note that this tutorial assumes you're using Cloudflare for your public DNS needs; other providers are supported but you'll need to modify the code accordingly.
Happy Home Assistanting!
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