Taildrop was kind of easy, actually
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|June 11, 2021
# Taildrop was kind of easy, actually
Taildrop was the main new feature we launched in [Tailscale v1.8](https://tailscale.com/blog/tailscale-v1.8/). People seem to like it.
> >
> This is so cool. Point to point drag &amp; drop files (phone to desktop, iPhone to Android, Windows to Linux…) with Wireguard security. Reason # 376 why you should be tracking
[> @Tailscale
](https://twitter.com/Tailscale)> .
>
[](https://twitter.com/kennwhite/status/1398079738254659585)>
Taildrop works for large files, it goes point to point rather than through the cloud, it’s secured using your existing identity provider, and best of all, it doesn’t need any bluetooth.
> >
> I just shared a 3GB file from a Macbook to an iPhone using
[> @Tailscale
](https://twitter.com/Tailscale)> to test if it was able to handle big files well and it is!
> No more trying to discover Airdrop devices or dealing with broken Bluetooth to send media around!
>
[](https://twitter.com/_Felipe/status/1399117643710439426)>
It is kinda handy:
> >
> > ohhhhh!!! Being able to easily share files between devices over an encrypted socket is amazing to have!
>
[](https://twitter.com/yoshuawuyts/status/1397335182202576897)>
And it leads some users to infer world domination plans even though we are, in actuality, just very nice people, anybody would say so:
> >
> > You guys are gonna take over the world. Seriously. This is so cool.
>
[](https://twitter.com/TylerStillwater/status/1394841991209385987)>
Seriously though, Taildrop is a thing that lets you transfer files between your own devices, over your point-to-point Tailscale+WireGuard mesh network, across various different OS platforms. It never stores your files in the cloud or sends them to us. They’re end-to-end encrypted with keys that we never see. And it costs us, effectively, nothing to run, because it’s your bandwidth (mostly LAN bandwidth), not ours. We just [bust some NATs](https://tailscale.com/blog/how-nat-traversal-works/) and negotiate the session. Which is why we can give Taildrop away to everybody, for unlimited use, with no file size limits, as part of the Tailscale free plan. It’s also open source…
…although there’s so little code that it’s [hard to spot](https://github.com/tailscale/tailscale/blob/e29cec759af2ef2561706e71ed480d5f83448014/ipn/ipnlocal/peerapi.go#L578). That’s the topic of this post.
When we wrote [How Tailscale Works](https://tailscale.com/blog/how-tailscale-works/) and [How NAT Traversal Works](https://tailscale.com/blog/how-nat-traversal-works/), we had a not-so-subtle goal of explaining that, in fact, making those things work is pretty hard. We’ve spent thousands of person-hours on it, and maybe you should just use Tailscale instead. You know how this story goes.
But Taildrop is different. It’s just an unauthenticated file transfer layer on top of Tailscale. It can be unauthenticated because Tailscale is already authenticated, and controls who can access each port, and for those who are allowed, it securely tells you who’s connecting right now. Taildrop can itself be unencrypted because Tailscale is already end-to-end encrypted (an architecture called Zero Trust Networking).
I tried to write an article called How Taildrop Works but it was just the following diagram, and they wouldn’t let me publish it. I had to put a fancy font in the title to distract you from how boring the rest of the diagram is.
Illustration *not* by our intrepid designer, Ross, because honestly it was not worth his time.
Can you implement an iOS or Windows sharing pane? Can you deliver an HTTP PUT request?[1](#fn:1) Then great, you’ve built Taildrop.
As an “Internet insider” joke, we wanted to release Taildrop on the 50th anniversary of FTP (April 16, 2021), but sadly, our release date slipped just a bit too far. Still, FTP is a big inspiration for us:
* Along with telnet (the precursor to ssh), FTP was one of the first two application protocols used on the Internet.
* Transferring big files from one computer to another is one of the fundamental things we all want to do, and which, perversely, somehow is nowadays harder to do than it was with FTP [decades ago](https://tailscale.com/blog/remembering-the-lan/).
* Taildrop is fewer lines of code than the ftp command, more secure than FTP, and easier to use than FTP, even though it was easier to invent than FTP.
In short, to me, Taildrop is a sign that maybe, just maybe, the Internet is finally once again evolving in the right direction. For the first time in longer than I can remember, we can write an app that just transfers some data, and not worry about hosting costs, or privacy issues, or logins or passwords or account recovery or DNS or open ports or firewalls or expired TLS certificates. We made a server that accepts PUT requests, and a GUI that generates PUT requests, and we shipped it.
### It took 7 weeks
But Avery, you may be asking yourself, if it was so easy, why did it take 7 weeks to develop and launch? I’m sure, you say to yourself, I’m sure I can make a one-page HTTP server in less than 7 weeks.
And, you continue, I’m guessing you didn’t spend the whole 7 weeks working on this beautiful Windows GUI:
I wrote our Windows Taildrop GUI. I reserve the right to make fun of it.
Indeed, you are correct. The Windows GUI took maybe a couple of days (and deserves more than a couple of days). The HTTP PUT responder took a few hours at most. So where did the time go?
### Generalization
In truth, we didn’t set out just to build another FTP. We wanted to demonstrate, to ourselves, how to build another FTP. And we wanted to make it easy for the next people, who won’t be us, to build the next app the easy way.
Behind the scenes of that HTTP PUT request, there’s some machinery we needed to add:
* The new Tailscale **“localapi”** lets local apps query the local tailscale instance over HTTP. For example, it can get a list of peer devices that might be Taildrop targets, or which services are running on those peers.
* The new **“whois”**[2](#fn:2) service lets you find out the user identity of a secure TCP or UDP session established over the Tailscale network. (Taildrop currently restricts file transfers to only be allowed from devices that you yourself own, even on a multi-user network. That lets us safely delay a bunch of privacy and security questions for now, such as what to do when someone sends you an, er, unwanted photo. We’ll have to do more work when we allow inter-user transfers later.)
* The new **“peerapi”** lets Tailscale nodes send messages to each other, over the encrypted Tailscale link. The first useful peerapi endpoint is Taildrop, and there’s a [thingy for inspecting goroutine status](https://github.com/tailscale/tailscale/blob/e29cec759af2ef2561706e71ed480d5f83448014/ipn/ipnlocal/peerapi.go#L698). It’ll soon be expanded to include at least a few extra diagnostic features.
Some aggravation also arose around what to do with the files once we got them to their destination, especially on mobile platforms. (As of this writing, the Android client for Taildrop isn’t done yet, but it’s coming soon.) iOS gave us some pain, since the Tailscale backend isn’t allowed to write to user-visible file storage such as the Files app. Instead, we have to deliver a notification, which when clicked, can open the frontend GUI, which can move the files into their final location.
We’re not sure yet exactly where we’ll take the peerapi; maybe it’ll be useful mainly for features provided directly inside Tailscale, like Taildrop. After all, every other port you listen on is also reachable over the p2p network once established, so if you’re writing your own app, you can just use another port, like a retro 1990s Unix programmer inventing rlogin. We’ll see.
### What we didn’t do: cloud edition
It’s instructive to think about what you might have had to do if you were instead trying to transfer files between your devices without all that nice infrastructure.
First of all, you’d have to decide whether to (a) beam everything to the cloud and back, or (b) establish a p2p link between two devices and send the files directly.
Okay, that’s a trick question; almost nobody ever chooses option (b) anymore. It’s just too hard. If you could establish a secure direct link between devices, you could just use FTP, and we already know those days are gone.
So fine, let’s use the cloud. How will our protocol work?
1. We’ll host a file upload/download service somewhere, say AWS.
2. The service will store in-transit file contents in, say, S3.
3. Ah, but which S3 region? Better do a whole bunch of regions to be safe. Don’t want to be transferring files halfway around the world for no reason. That means we need a load balancer. Don’t worry, AWS can sell us one for a mostly reasonable price.
4. Our server is going to need a DNS name and an HTTPS cert. Let’s use Let’s Encrypt, I guess. Which Let’s Encrypt client to use? Meh, any of them will do. This is easy, any Senior SWE with a few years of experience can do Let’s Encrypt in their sleep.
5. Great! Now we can go build a client that uploads files to the cloud.
6. But wait, who is allowed to upload files? Time to add an identity system. Maybe Sign-in with Google? Well, not everyone uses Google. Perhaps pull in an existing user account management library. 2FA? Account recovery emails? I’m sure there’s an npm for this. Done.
7. To which region do we upload the files? Well, the closest one, of course! We’ll set up our load balancer to connect users to the closest instance. Do we need edge computing for this? I don’t know, but edge computing sounds amazing, let’s add some. I heard [fly.io](https://fly.io/) is good.
8. How long do we keep the files after uploading, if the recipient doesn’t retrieve them? I don’t know. Pick something. A week. Too long and we waste money on storage costs; too short and we get weird errors when people download too slowly. Don’t worry, they can retry.
9. How do we notify the recipient that there is a file waiting for them to download? Oh, I know this one! Push notifications! Well, on mobile we can use push notifications. On desktop, we’ll need to use HTTP long polls. Honestly I don’t know how to do [HTTP long polls](https://en.wikipedia.org/wiki/Comet_(programming)), it seems like a good way to pull out all my hair. How about we just poll periodically instead. Say, every 5 seconds.
10. Okay, uploading works, polling is implemented, and… wait, how do we connect the upload stream with the right download poller? I guess we need a database to keep track of uploaded files. And something to clear stuff out of the database and delete the S3 file after a successful download. Is that a message queue? Yes, yes, I think it is. No problem, AWS will sell me a message queue and it’s going to be awesome, with literally dozens of transactions per second per thread, like a 1960s IBM mainframe. Wait, no, 1960s mainframes could do way more transactions than that. Where was I? Anyway, dozens of transactions per second is plenty.
11. After all that, downloading is pretty easy. It authenticates through the same identity system, polls periodically, and when a file is ready to download, generates an authenticated S3 redirect so that it can securely…
12. …um, let me lock down those S3 bucket permissions real quick…
13. …AHEM so it can securely retrieve the file and nobody else can.
14. Oh. Wait. I forgot about encryption! We can’t just store people’s files, unencrypted, in S3, can we? A security breach would be a disaster, it would give the attacker access to all the in-flight files in the world. Let’s read about S3 encryption-at-rest features. Sweet, it has those! Let’s turn them on. But come to think of it, why is encryption-at-rest just a flag? Doesn’t that mean I could still easily send the files to the wrong person?
15. …Yes. If I want end-to-end encryption, I have to roll my own. So the uploader needs to encrypt the file with, uh, the downloader’s public key, and…
16. …oh no. Where can I get the downloader’s public key? Let’s go back. Okay, the downloader uploads their public key to the server in advance, before we transfer anything. Now the upload client, when it wants to upload a file, first asks for a list of public keys of the available downloaders. Then the user picks one, it encrypts the file and uploads it, and the downloader we chose will have the right key to decrypt.
17. Look. Do not even talk to me about [key rotation](https://tailscale.com/blog/rotate-ssh-keys/). I am not in the mood.
Success! And with that simple effort, and maybe some terraform or something, and some continuous integration, you have built yourself an approximate clone of [Firefox Send](https://blog.mozilla.org/en/products/firefox/introducing-firefox-send-providing-free-file-transfers-while-keeping-your-personal-information-private/), the now-canceled project that, in addition to being expensive to run, turns out to have been a [magnet for botnets and abuse](<https://www.cnet.com/news/mozilla-shuts-down-firefox-send-file-transfer-service-after-malware-abuse/#:~:text=Search-,Mozilla shuts down Firefox Send file transfer service after malware,online services isn't simple.&amp;text=Mozilla's Firefox Send used to,without having to log in.&amp;text="Firefox Send was a promising,Mozilla said in a statement.>) because of some further design problems not explored above.
If this is what it takes to transfer a file nowadays, no wonder every service that does it needs to charge money, or put arbitrary limits on file sizes, or show you ads, or worse.
You know what, on second thought, all this was a terrible idea, maybe we should have [tried the p2p method](https://help.dropbox.com/installs-integrations/sync-uploads/lan-sync-overview) after all. \<Rereads [How NAT Traversal Works](https://tailscale.com/blog/how-nat-traversal-works/)\> Okay, no, not that.
And this is why Tailscale is different.
1. Security side note: it turns out HTTP PUT requests cannot be initiated by a web browser without using [CORS](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing). This prevents [XSRF](https://owasp.org/www-community/attacks/csrf) attacks on Taildrop. Otherwise we would have needed to add a session cookie or something.[↩︎](#fnref:1)
2. To pay proper homage to the Old Ones, this perhaps should have been called `identd` instead. The Internet’s `whois` service is a different (kind of misnamed) thing entirely. And nobody knows what identd is anymore. Oh well.[↩︎](#fnref:2)
Share
Author
Avery Pennarun
Author
Avery Pennarun
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