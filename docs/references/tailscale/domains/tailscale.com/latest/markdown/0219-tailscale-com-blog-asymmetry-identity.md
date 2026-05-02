The asymmetry of internet identity
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|September 29, 2019
# The asymmetry of internet identity
Identity on the internet is messy. The result is some things that should be easy are hard.
### The Identity Stack
This is an attempt to document how we define *a person* on the modern Internet. It is analogous to an [OSI model](https://en.wikipedia.org/wiki/OSI_model) for identity.
#### Layer 1: IP addresses
The story so far: In the beginning the IP address was created. This has made a lot of people very angry and been [widely regarded](https://en.wikipedia.org/wiki/The_Restaurant_at_the_End_of_the_Universe) as a bad move.
IP addresses give us everything, and yet surprisingly little. Scribble one on a packet, send it out, and maybe it will get somewhere. Where is anybody’s guess. After a while some packets come back with the that IP address in the sender field. Maybe it’s from them, maybe it makes sense, maybe some got lost on the way.
#### Layer 2: Brands
Next come the true foundation of the modern internet: brands. A brand is a domain name that you recognize. These used to be organizations like Universities and Military Labs and other Very Serious relics of ages past, but these days it is Facebook and Google and Disney.
In theory you resolve brands using DNS, which maps names to IP addresses. But that part of the internet is almost trivial and it doesn’t really work. The heavy lifting is done by TLS certificates, who thanks to a cast of about [180 questionable characters](https://en.wikipedia.org/wiki/Certificate_authority#Providers), you can be assured that the packets coming from somewhere, which were resolved by someone to be something, actually belong to a particular Brand.
#### Layer 3: Registering personhood
Now that a person has established they are talking to the Brand, the Brand must work out they are talking to a person.
This is wonderfully vague.
It could be as simplistic as a land rush for a particular email address and defining a password, or uploading a photo of a government ID and a selfie, bouncing a text through a somewhat-registered phone system, or performing a financial transaction. All that matters is it is done to the satisfaction of the Brand, and that is determined by whatever metrics are in the software the Brand’s fraud team has deployed.
By Layer 3, a person can talk to a brand and a brand can talk to people.
#### Layer 4: People
Brands define people.
If Alice wants to talk to Bob, she needs a Brand to facilitate it. Typically this is done entirely within the confines of the domain name and software of the brand, no data ever leaves their databases and apps.
#### Layer 5: Inter-brand Identity protocols
Some Brands outsource their identity to other Brands. “Login with Google” or “Login with Twitter” abound. The key protocols here are [OAuth2](https://en.wikipedia.org/wiki/OAuth) and [SAML](https://en.wikipedia.org/wiki/Security_Assertion_Markup_Language). Due to the inherent vagueness of Layer 3, this typically requires bouncing the person through the other Brand’s domain.
### What is missing and what does not work well
People can talk to Brands.
People can talk to other people via Brands.
That means if Alice wants to write some software and use it to talk to Bob, and doesn’t want to delegate to a megacorp, then she must first define a brand. Buy a domain name, get a [TLS certificate](https://letsencrypt.org/), give the Brand name to Bob. Bob can identify himself with Alice’s Brand using OAuth2, which works, but is always more work than it should be.
All this effort is perfectly fine if Alice spent three weeks writing sophisticated software. The extra day of work to do all of this is a tiny fraction of the whole project. But what if Alice spent 30 minutes writing a nice statistical analysis in Mathematica and wants to invite Bob to try it? Or she spent 60 minutes writing a text adventure in PHP? These are worthy pursuits and making a world where sharing them is easy is important. She can shrink the hours wrestling with OAuth2 down to minutes by hardcoding in a password and sending it to Bob. But **the remaining work of setting up the domain name and launching the service will be more effort than the original programming project**.
This is the fundamental asymmetry of the internet’s identity stack. Brands are few and easily identified by people. People are many, and cannot be identified without Brands.
Additionally, how does Bob know what Alice’s Brand is? She told him. Probably in a text message or email, that is, via some other Brand’s communication system. **There is no good way for a person to identify another person without first mutually agreeing on Brand identities.**
We should be able to do better. We have big existing Brands with open(-ish) identity systems. We should be able to write quick and dirty programs, whether it’s running on your laptop, a Raspberry Pi in a tree in your yard, or the Cloud, and share them with people.
Share
Author
David Crawshaw
Author
David Crawshaw
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