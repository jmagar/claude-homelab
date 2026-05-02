Reintroducing Serve and Funnel: even simpler sharing with your tailnet (or the world!)
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 30, 2023
# Reintroducing Serve and Funnel: even simpler sharing with your tailnet (or the world!)
Tailscale Serve and Funnel aren’t new features, but today, we’re enhancing their user experience based on insights from how users actually interact with them. Not to get too philosophical, but the most useful features are the features you actually use, and we hope that today’s relaunch of Serve and Funnel moves them closer to the top of our users’ toolkits.
Bottom line up front: In Tailscale 1.52 or later, Funnel is now a single command, and in most cases, sharing a local port is as easy as `tailscale funnel 3000`.
But wait, wait, wait. Let’s back up. What are Tailscale Serve and Funnel, anyways? Read on for more background and info on today’s changes.
**Tailscale Funnel** lets you expose a local service, file, or directory to the entire internet. You can use it to host a website on a Raspberry Pi, test your local webhook development project, or share the web app you’re developing on your laptop with the world. [Learn more about how Funnel works behind the scenes](/kb/1223/funnel/).
**Tailscale Serve** is a lot like Funnel, but instead of serving content to the entire internet, it’s only accessible to other devices and people in your tailnet. If you want to share a service or a directory or a page with all of your machines and the members of your team, no matter where they are in the world, Serve can help you do so privately and securely. You can use it to set up a reverse proxy for containers and VMs in your homelab, to share an API server you’re developing with a coworker, or to quickly open a directory from your laptop on your phone. And of course, you can regulate access to shared resources within your tailnet using your ACLs. [Learn more about Tailscale Serve](/kb/1312/serve/).
Serve and Funnel are really powerful tools, and you can find even more ways to use them in our docs:
* [Tailscale Funnel examples](/kb/1247/funnel-examples/)
* [Tailscale Serve examples](/kb/1313/serve-examples/)
## Okay, so what’s changing?
The most common way that you use Serve and Funnel can now be expressed in one short command:
```
`tailscale funnel 3000 // share port 3000 with the internet
tailscale serve 3000 // share port 3000 with your tailnet
`
```
These simple commands make `http://localhost:3000` available to the internet or your tailnet at `your-computer.pango-lin.ts.net` over HTTPS. It’s great for sharing your local development server or setting up an easy URL for a service in your homelab.
When you run these commands, they’ll start a foreground session by default, which ends when you press `Ctrl+C` or quit the terminal session. If you want to persist the configuration even when the terminal session is over, add the `--bg` flag:
```
`tailscale funnel --bg 3000
tailscale serve --bg 3000
`
```
Even though we’ve made the most common use for Serve and Funnel easier, we’ve retained all of the more advanced features that we know are key to so many of your workflows.
```
`# Serve a file, directory, or plain text:
$ tailscale serve /path/to/file.html
$ tailscale funnel /path/to/directory
$ tailscale serve text:"hello from tailscale"
# Start an HTTPS reverse proxy to port 3000
$ tailscale serve 3000
$ tailscale funnel localhost:3000
$ tailscale serve http://localhost:3000
$ tailscale funnel http://127.0.0.1:3000
# The same, but at a path
$ tailscale serve localhost:3000/foo
$ tailscale funnel http://localhost:3000/foo
$ tailscale serve http://127.0.0.1:3000/foo
# The same, but listen on alternate port 8443
$ tailscale serve --https=8443 3000
$ tailscale funnel --https=8443 3000
# Run Funnel or Serve in the background
$ tailscale serve --bg 3000
$ taiscale funnel --bg 3000
# Specify a multiple mount point- all of these can be active at the same time
$ tailscale serve --set-path=/ --bg 3000
$ tailscale funnel --set-path=/foo --bg localhost:5000
$ tailscale serve --set-path=/bar --bg /path/to/file.html
# Ignore an invalid or self-signed certificate
$ tailscale serve https+insecure://localhost:5454
$ tailscale funnel https+insecure://localhost:5454
# Forward incoming TCP connections on port 10000 to a local TCP server on port 22
# (eg.g to run OpenSSH in parallel with Tailscale SSH):
$ tailscale serve --tcp=2222 22
$ tailscale serve --tcp=2222 tcp://localhost:22
`
```
## What’s behind these changes
The previous method for using Funnel—a two-step command—reflected the underlying infrastructure, but we saw room for improvement. After seeing Serve and Funnel out in the wild, we’ve adjusted the commands to be more aligned with how you use our tools. We hope that the new Serve and Funnel experience will be more intuitive and tailored to your needs.
As we had conversations with the community, used these tools ourselves internally, and studied the most common questions we got about Funnel, we realized a few things.
* Users want to either serve content to their tailnet, or to the internet, but it’s not very common to want to move between the two for a particular service.
* We marketed Tailscale Funnel as a feature, but made `tailscale serve` just a CLI command. This led folks to think of Tailscale Serve as a “magic incantation”—a command they had to utter into their CLI on the way to using Funnel, instead of what it is: a really powerful little server for sharing content with your tailnet.
* This meant that fewer people knew they could use Serve to allow for tailnet-only connections. And so people missed out on some of the cool tools we’ve built on top of Tailscale’s WireGuard connections—things like [populate identity headers](/kb/1312/serve/#identity-headers) for a super-simple auth mechanism.
* When you’re hosting a website with Funnel on your Raspberry Pi, you want to set-it-and-forget-it. However, when you’re just using Funnel on your laptop to temporarily share a development server, it’s important to remember to turn it off when you’re done.
We put together the new syntax for these tools to make these most common use cases easier to get right quickly. But if you’ve gotten used to the old syntax, we’ve got you covered—enter the old CLI command, and we’ll translate it to the new syntax and print that out for you. We hope this makes the transition seamless.
To see the full command syntax definition, run `tailscale funnel --help` or `tailscale serve --help` in the CLI, or visit [our CLI documentation](/kb/1080/cli/).
If you’re already a regular user of Serve and Funnel, or if this post gives you a nudge to check them out for the first time, we would love to hear your feedback—that’s what powered these updates in the first place.
Share
Authors
Sam Linville
Parker Higgins
Authors
Sam Linville
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