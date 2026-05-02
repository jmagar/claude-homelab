Simplify Secure URL Sharing with Tailscale's golink
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|November 30, 2022
# Private go links for your tailnet
Today, we’re sharing [golink](https://github.com/tailscale/golink), an open source private URL shortener service for [tailnets](/kb/1136/tailnet/).
Using golink, you can create and share simple *go/name* links for commonly accessed websites, so that anyone in your network can access them no matter the device they’re on — without requiring browser extensions or fiddling with DNS settings.
And because golink integrates with Tailscale, links are private to users in your tailnet without any separate user management, logins, or security policies.
The first go link service was an internal tool built at Google around 2006, and was eventually copied by dozens of other tech companies (as good ideas have a tendency to be).
These go link services are a convenient way to provide memorable links to commonly used resources like design docs (*go/foo-design*), monitoring dashboards (*go/mon*), or the menu at your favorite lunch spot (*go/lunch*).
Rather than bookmarking or trying to remember the URL, you can just type *go/lunch* in your browser and it takes you right to the page.
Because the data model is so simple (just a key-value store in the simplest form),
it’s a popular type of service to build as a weekend project, right up there with [to-do lists](https://todomvc.com/) and [Hacker News clients](https://github.com/topics/hacker-news).
There are thousands of open source [URL shorteners](https://github.com/topics/url-shortener), and even multiple startups providing go links as a service.
So why did we bother building a new one?
## go links, meet Tailscale
Tailscale’s golink service started in the first few hours of my first day of work.
[Brad](http://github.com/bradfitz) had just built a simple internal company directory called “who” (inspired by another Google tool), and I immediately asked where “go” was.
Within the hour, Brad had the [first version of golink](https://github.com/tailscale/golink/commit/3cb4c6cb) that stored link metadata in simple [JSON files on disk](/blog/an-unlikely-database-migration/) running locally and serving links for the company.
Even though I had been using Tailscale at home for months, as I started using and working on golink,
a few unique things about building services on top of Tailscale [became more apparent](https://web.archive.org/web/20220604002735/https://twitter.com/willnorris/status/1532881581475368960):
* Applications can really run anywhere.
golink ran on a developer laptop for two days before moving to a production environment, and no one could tell the difference.
Even the transition to production was as trivial as [renaming](/kb/1098/machine-names/#renaming-a-machine) two nodes.
* [tsnet](/blog/tsnet-virtual-private-services/) allows an application to join your tailnet directly, which simplifies deployment.
golink is a single static go binary that can run practically anywhere.
It doesn’t require a Tailscale client to be installed and doesn’t require root access, since tsnet manages its own Tailscale connection.
* [MagicDNS](/kb/1081/magicdns/) makes it possible to host golink at the short URL *http://go/* without needing any browser extensions or DNS hacks to resolve the host name.
It just works, even on mobile devices.
* Because Tailscale authenticates all peer connections, users are automatically authenticated without needing to do anything.
There is no separate identity provider, no protocols to implement, and no user database.
By running golink on your tailnet, Tailscale doesn’t see the links you create or the content of the links.
Your DNS queries pass through your device’s local Tailscale DNS proxy, but they are not logged.
## Just enough features
After completing the initial prototype, we migrated the JSON files to sqlite ([as we do](/blog/database-for-2022/))
and set out to add just enough additional features to make golink useful but not too heavy.
I drew some inspiration from the go link service at Twitter, adding support for getting link metadata by appending a “+” to a URL:
*go/name* will resolve the link, but *go/name+* just serves information about the link without resolving it.
We made links case insensitive and ignored dashes, eliminating a common problem in some implementations where *go/enghandbook* and *go/eng-handbook* might resolve to different destinations.
We kept a simple ownership model where links can only be updated by their owner, ownership can be transferred simply by editing the link, and orphaned links can be taken over by anyone on the tailnet.
We track basic stats so that the golink homepage can list popular links to help with discovery.
But my favorite feature by far is templated links.
It’s pretty common for go links to have any remaining path segments after the link be appended to the destination.
So, for example, if *go/who* redirects to *http://who/*, then *go/who/amelie* would go to *http://who/amelie*.
But what if you don’t simply want to append the remaining path, and instead include it in a query parameter?
golink solves this by using [go templates](https://pkg.go.dev/text/template) for all destinations links.
We provide a simple data object containing the remaining path data, as well as some basic functions for escaping values.
Seeing templates inside of URLs looks a little unusual at first, but you can quickly see how incredibly powerful it is.
Here are some of my favorite go links that we use at Tailscale, and the destination link templates:
* **go/prs**: Without a path, this list [GitHub pull requests in the Tailscale organization that are awaiting my review](https://github.com/pulls?q=is:open+is:pr+review-requested:@me+archived:false+org:tailscale).
With a path (like *go/prs/bradfitz*), it shows pull requests awaiting review by the specified GitHub user.
```
`https://github.com/pulls?q=is:open+is:pr+review-requested:{{with .Path}}{{QueryEscape .}}{{else}}@me{{end}}+archived:false+org:tailscale
`
```
* **go/cs**: This uses the path to perform a code search for the specified term in all GitHub repositories in the Tailscale organization.
```
`https://github.com/search?type=code&q=org:tailscale{{with .Path}}+{{QueryEscape .}}{{end}}
`
```
* **go/code**: Given a code path, such as *go/code/cmd/tailscale*, this link opens that path in the main Tailscale GitHub repository.
```
`https://github.com/tailscale/tailscale{{with .Path}}/tree/main/{{PathEscape .}}{{end}}
`
```
* **go/meet**: With an extra path, this creates impromptu Google Meet meetings like *go/meet/breakroom*. (This is actually our most used link at Tailscale by a 2-to-1 margin!)
```
`https://meet.google.com/lookup/
`
```
* **go/cal** or **go/c**: Without a path, this opens Google Calendar. With a path, it opens a given Tailscalar’s calendar.
```
`https://calendar.google.com/{{with .Path}}calendar/embed?mode=week&src={{.}}@tailscale.com{{end}}
`
```
* **go/slack**: Without a path, this opens Tailscale’s Slack. With a path, it opens a specific Slack channel.
```
`https://tailscale.slack.com/{{with .Path}}channels/{{PathEscape .}}{{end}}
`
```
* **go/wwwpr**: Given a pull request number for the tailscale.com GitHub repository, this opens the automatically provisioned staging site to preview the change.
Note that this uses the path to modify the destination hostname rather than the path or query string.
```
`{{if .Path}}https://website-preview-{{.Path}}.fly.dev{{end}}
`
```
* **go/go/gadget**: Okay, this is really two links.
*go/go* is a recursive link to *http://go/*, and *go/gadget* redirects to [https://www.youtube.com/watch?v=EcF2LOaLgA0](https://www.youtube.com/watch?v=EcF2LOaLgA0).
We also use go links to link to monitoring dashboards, specific reports on metrics, design docs, popular blog posts or references,
our internal tools (like our support ticketing system, or our HR system), production runbooks, frequently rerun CI/CD jobs,
our product roadmap, and — of course — a long-form document on all the ways DNS is broken (*go/how-dns-works*).
golink is still [experimental](/kb/1167/release-stages/#experimental), but we’ve been using it daily for the last six months and have been quite happy with it.
To start using go links on your tailnet, head to [https://github.com/tailscale/golink](https://github.com/tailscale/golink).
Share
Author
Will Norris
Author
Will Norris
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