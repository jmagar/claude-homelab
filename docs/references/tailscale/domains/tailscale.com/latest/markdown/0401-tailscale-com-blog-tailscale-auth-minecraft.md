Tailscale Authentication for Minecraft: Secure Your Server with Tailnet
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|April 13, 2022
# Tailscale Authentication For Minecraft
You can do many things with computers. Some of them are more productive than
others. My recent blog post shows how to authenticate to any service, such as
[Grafana](https://tailscale.com/blog/grafana-auth/).
Some people took the idea of using Tailscale for authenticating to any service
as a neat fact. Others took this as a challenge to come up with even more
creative applications of Tailscale for authentication. This is the story of one
of the latter cases. This is how you can make your Minecraft server join your
tailnet and authenticate to it with Tailscale.
One big question you may be asking is, “Why on earth would you want to do this?”
I would like to counter this with another question: “Why not?” As [a great
man](https://en.wikipedia.org/wiki/Cave_Johnson_(Portal)) has said, “Science
isn’t about ‘why?’ it’s about ‘why not?’” We take this philosophy seriously at
Tailscale.
Putting your Minecraft server into your tailnet with Tailscale for
authentication gives you these advantages:
* You can lock down your Minecraft server to just your tailnet so only people
you know can access it.
* You can use [ACLs](https://tailscale.com/kb/1018/acls/) to lock down access
even further (if you want to allow everyone but the known griefer to connect).
* You can attribute Minecraft users to Tailscale users to allow you to keep a
better log of who is using the server.
* You do not have to modify your Minecraft server with Forge, Bukkit, Paper or
Spigot mods, this allows you to use a fully vanilla setup with very little
extra configuration.
* You can use [Node Sharing](https://tailscale.com/kb/1084/sharing/) to add your
friends, compatriots in blood, and squadmates to your Minecraft server without
having to expose it to the scary internet. You can also expose it to your
hopefully less scary friends that are on your tailnet already.
* Your Minecraft server will show up on your tailnet like any other machine.
This also comes with a fairly large set of disadvantages too:
* This will not work with the Bedrock version of Minecraft (the one that runs on
consoles, phones, and tablets). If you are unsure what version of Minecraft
you have, you can check
[this blog post](https://funcaptains.com/blog/java-or-bedrock-what-minecraft-version-do-i-have)
to learn how to tell the difference between the two.
* You have to disable the Minecraft server’s authentication stack.
* If your server listens on the public internet, this will allow anyone to
join it without validating who they are. This is the opposite of what we
want here.
* You can’t use Minecraft [skins](https://help.minecraft.net/hc/en-us/articles/4408894664461-Minecraft-Java-Edition-Skins).
* You may be able to work around this by using server side mods, but those
are out of scope for this article as we are focused on using unmodded
Minecraft clients and servers.
* Your tailscale username may have [characters that are
invalid](https://help.minecraft.net/hc/en-us/articles/4408950195341-Minecraft-Java-Edition-Username-VS-Gamertag-FAQ)
in Minecraft usernames.
* Use a different email address to work around this in the worst case.
This works by creating an authentication proxy much like
[we did before with Grafana](https://tailscale.com/blog/grafana-auth/). The
proxy will listen for traffic on your tailnet and then forward it to the
Minecraft server with one notable exception. At the beginning of a Minecraft
session, the client will send the server a packet that contains the username of
the person trying to log in.
Normally the server is supposed to take the contents of that packet and check it
against Mojang authentication servers to ensure that you are actually logged in
as that username in your Minecraft launcher. The server will then allow or deny
the connection based on the result. Instead of relying on Mojang for
authentication, by using Tailscale we can rely on Tailscale for authentication.
If we also had Mojang for authentication, the proxy will look up Tailscale
identity information for that Minecraft session and replace the Minecraft
username the client gave you with the user information from Tailscale—but
Mojang’s authentication servers will have no idea what to do with this. We just
bypass them with offline mode in Minecraft, which does not require any
authentication.
After the authentication dance, the proxy will forward Minecraft traffic like
any other proxy. Then you can mine and craft to your heart’s content with the
people you trust. You will be able to chat with your co-workers and create great
things together.
## Setup
If you want to set up this on your tailnet, you will need to use the [patched version of
the
proxy](https://github.com/tjhorner/infrared/commit/202226ef19cd5ee7ca7f8dbfa5c59d67d98db2bc)
[infrared](https://github.com/haveachin/infrared). Infrared is normally used by
Minecraft server networks to host giant Minecraft servers that can scale up to
thousands of total players at once, but it’s also generic enough that we can use
it to proxy to a simple vanilla Minecraft server.
Set up everything as you would normally with infrared, but be sure to set the
environment variable `TS\_AUTHKEY` to [a brand new
authkey](https://login.tailscale.com/admin/settings/keys). If you tag the key,
your Minecraft server’s node key [will not
expire](https://tailscale.com/blog/tagged-key-expiry/), so it stays connected to
your tailnet, allowing you to craft and mine forever!
Something to keep in mind is that infrared will want you to connect with the
full domain name of the Minecraft server. It is very picky about this. We will
use the [MagicDNS domain](https://tailscale.com/kb/1081/magicdns/) that every
tailnet gets for free. Assuming your Minecraft server is on port 25565, copy the
following into `configs/tailscale.json`:
```
`{
"domainName": "minecraft-proxy.$your-account-domain-name.beta.tailscale.net",
"listenTo": ":25565",
"proxyTo": "127.0.0.1:25565"
}
`
```
You can find this domain out by going to [the DNS settings
page](https://login.tailscale.com/admin/dns) and looking for the domain that
ends in `.beta.tailscale.net`—it should be your account’s domain followed by
`.beta.tailscale.net`. Add `minecraft-proxy.` at the beginning of this to get
your full domain name.
```
`minecraft-proxy.$your-account-domain-name.beta.tailscale.net
`
```
Be sure to set `server-ip` to `127.0.0.1` and `server-port` to `25565` in your
`server.properties` file so that it’s not listening on the public internet:
```
`server-ip=127.0.0.1
server-port=25565
`
```
If you have other inventive ideas for things we can do with computers, reach out
to us on Twitter [@Tailscale](https://twitter.com/Tailscale) or head to [our
forum](https://forum.tailscale.com/) to tell us the horrors beyond description
that you have created.
The forging of this beautiful creation was thanks to the efforts of [TJ
Horner](https://tjhorner.dev/). I hope this was enlightening.
Share
Authors
Xe Iaso
TJ Horner
Authors
Xe Iaso
TJ Horner
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