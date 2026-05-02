Managing usernames and passwords in-house is so 2020
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsJune 17, 2025
# Managing usernames and passwords in-house is so 2020
Tailscale helps teams build secure, private networks—but security doesn’t stop at the network layer. Identity is just as foundational. And yet, in 2025, many SaaS companies are still building and maintaining their own login systems. In this post, Tailscale CEO Avery Pennarun reflects on a recent conversation with Ben Thompson of Stratechery and makes the case for why modern apps should outsource authentication — and how our open-source OIDC server, tsidp, can help you do it without giving up control.
I was chatting with [Ben Thompson at Stratechery](https://stratechery.com/2025/an-interview-with-tailscale-co-founder-and-ceo-avery-pennarun/) recently, and we covered a lot of topics. One thing that stuck with me was the topic of identity. Specifically, why is every SaaS company still managing their own usernames and passwords in 2025?
The short answer: they shouldn’t be.
### [Authentication: how we got here](#authentication-how-we-got-here)
Back in the early days of the Internet, every company had to roll its own authentication system. You’d create an account, pick a password, and hope for the best. It worked fine — until it didn’t.
As the Internet grew, so did cyberattacks. Hackers realized that these homegrown authentication systems were easy targets. Companies were storing passwords in plain text or [trivially hashed](https://stackoverflow.com/a/30502701), reusing credentials, and generally making security mistakes that seem obvious in hindsight. And the breaches kept coming.
Take the [RockYou breach in 2009](https://en.wikipedia.org/wiki/Password_cracking), where 32 million user accounts were exposed because the company stored passwords in plaintext. Or look at today: nearly **half of employed individuals have had their personal data compromised** in a cyberattack or scam, according to a [recent report from Yubico](https://www.yubico.com/press-releases/despite-increasing-cybersecurity-attacks-people-still-believe-antiquated-username-and-passwords-are-strong-enough/).
### [How open standards fixed authentication](#how-open-standards-fixed-authentication)
At some point, the industry realized the old approach wasn’t sustainable. Security is hard, and most companies aren’t great at it, and that’s okay. Instead of every service building its own fragile login system, the tech community came together to design open, interoperable authentication protocols like [**OpenID**](https://openid.net/developers/how-connect-works/), then OAuth1 (unfortunately), [**OAuth2**](https://oauth.net/2/) (more fortunately), and later [**OIDC**](https://frontegg.com/guides/oidc-authentication). They also invented SAML, but we wish they didn't.
These standards made it possible for users to log into many services securely using a single identity, without every service having to reinvent login screens and password databases from scratch. Better yet, they enabled strong security practices — like phishing-resistant authentication and multi-factor authentication (MFA) — to be widely adopted because you could enroll the second factor in just one place and use it everywhere.
Today, instead of trusting each company you interact with to keep your password safe, you can choose a trusted identity provider (IdP) that specializes in keeping accounts secure, whether that's your employer’s SSO system, or a personal account with strong protections like passkeys and biometrics.
By basing modern authentication on open protocols, we get the best of both worlds: login security that's strong enough for billion-user platforms, and flexibility that allows any service, big or small, to plug into it.
Today, almost everyone logs into their devices, apps, and services using a centralized IdP. Your Google account unlocks your Android phone, Gmail, and countless other apps. Microsoft manages authentication for Windows and Office. Apple has iCloud accounts that connect to Face ID. Lots of corporations use Okta or another OIDC-capable provider for their employee IDs.
These IdP companies dedicate **entire teams **— hundreds, sometimes thousands of people—to making authentication and account recovery secure and seamless. Google, for example, has an entire division working on identity. If you’re a startup (or even a Fortune 500 company), you **cannot** match the level of security, usability, and reliability that these teams provide. It's not even close.
### [Why are companies still managing their own passwords?](#why-are-companies-still-managing-their-own-passwords)
Given all this, why would any company still handle identity in-house? Running your own authentication system today is like running your own power grid—it’s technically possible, but for most SaaS products, it's expensive, risky, and completely unnecessary.
If you're building a SaaS product and still making users create accounts, verify emails, and answer security questions, you're adding friction and reducing security. Use SSO instead.
If you're managing an IdP internally for your own employees, that's different — it's error-prone operational work, but it can make sense if you need the control. (Tailscale supports custom OIDC for this.)
Either way: running your own authentication stack should be a last resort, not your first instinct.
By outsourcing authentication to an IdP, you get:
* **Instant, friction free account creation** – Tailscale is famous in tech circles for how easy it is to get started. Our SSO-only policy is a big reason why. Copy us!
* **Better security** – professionally run IdPs use advanced encryption, phishing-resistant login, and machine learning to detect suspicious activity.
* **A seamless user experience** – Signing into each app with Google or Apple is often a **one-tap** process because it's integrated with your OS's keychain.
* **Simpler account recovery** – Your app doesn't have to track security questions or offer an account recovery helpdesk; you're outsourcing the most expensive part of account management to an SSO provider.
* **MFA is handled for you** – No need to build or manage multi-factor authentication (MFA) yourself. Your users get it natively through systems they already use. And they don't have to set it up again and again with every service.
And perhaps most importantly: if an app suffers a data breach, their **customers’ passwords aren’t part of the fallout.** No scrambling to reset millions of credentials.
### [But isn’t putting all your eggs in one basket a bad idea?](#but-isnt-putting-all-your-eggs-in-one-basket-a-bad-idea)
It’s a fair concern. As an end user, relying on a single provider for all your identity everywhere might feel like too much centralization. But let’s look at the trade-offs.
First, these IdPs aren’t just “one basket” — they’re **high-security vaults**. Google, Microsoft, Apple, and Okta employ some of the best security experts in the world, dedicate entire teams to monitoring and defending against threats, and invest heavily in redundant systems to ensure reliability. The level of security they provide isn’t just better than most companies can achieve — it’s **significantly** better.
Second, if someone gets access to your single login account, **you'll find out fast, and you'll do something about it.** When credentials are spread out across dozens of apps, the chance that you'll respond to, or find out about, every breach promptly is next to none.
Third, most companies already rely on third parties for critical infrastructure. Cloud hosting? AWS, Azure, or Google Cloud. Payments? Stripe or PayPal. Email? Gmail or Outlook. **Outsourcing identity is no different.**
Lastly, using an IdP doesn’t mean giving up control. Companies can still implement policies, enforce security rules, and even use multiple IDPs for redundancy if needed. The key is leveraging their expertise instead of trying to match it yourself.
### [An identity privacy hack: tsidp](#an-identity-privacy-hack-tsidp)
Taking more ownership of security policy is exactly why we built [**tsidp**](https://pkg.go.dev/tailscale.com/cmd/tsidp): Tailscale’s lightweight, open-source OIDC server.
With tsidp, you use a major identity provider like Google or Microsoft to log into Tailscale once. Then, you host your own OIDC provider on Tailscale, and use that to log in, with as few as zero clicks, to everything else. This gives you all the control of running your own authentication infrastructure, without the complexity and room for error. You get control over login policies, user experience, and integration, while the underlying security stays backed by teams who specialize in it. And as a bonus, neither your corporate IdP nor Tailscale gets visibility into who logs into what. Your self-hosted tsidp does, and you can stream those private logs to wherever you want.
It’s the same philosophy we talk about in [Backward compatible forever](https://tailscale.com/blog/community-projects): you don’t have to build everything yourself to have something reliable — you just need to own the critical interfaces.
tsidp gives you the best of both worlds: your own identity layer, built on top of the security foundations you already trust.
### [Tailscale’s approach to identity](#tailscales-approach-to-identity)
All this is why when you sign up for a [Tailscale account](https://tailscale.com/), we only use SSO logins. We could have built our own username and password system. But why? We’re experts in networking, not in authentication. It would be more work for us, worse security, and more clicks for each user. **Let’s all be experts in what we’re good at.**
If you haven’t read it yet, I recommend checking out my post,[ "The New Internet](https://tailscale.com/blog/new-internet)," where I lay out our vision for the future of networking. Maybe in a few years, we’ll see posts like this about networking: *“Why are you still managing your own network infrastructure when Tailscale exists?”* But let's take it one step at a time. If you're building a SaaS product, let the experts handle your authentication. Trust me on this.
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