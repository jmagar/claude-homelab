Frequent reauth doesn't make you more secure
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsJune 10, 2025
# Frequent reauth doesn't make you more secure
Tailscale is built to make secure access seamless — but too often, security tools get in your way instead. One common offender? Frequent login prompts. They interrupt your work, frustrate users, and paradoxically, can weaken your security posture. In this post, Avery Pennarun explains why forcing users to reauthenticate constantly is outdated thinking — and how smarter, real-time approaches can deliver stronger security without the friction.
You're happily working away, fingers flying, deep in flow, and suddenly, boink, your session has expired. You sigh, re-enter your password (again), complete an MFA challenge (again), maybe approve an email notification (again), and finally — access restored. Until next time.
This wasn't *so* bad when it was just passwords; we all got pretty fast at retyping our passwords. But all those MFA challenges really slow us down. And [MFA fatigue attacks](https://fieldeffect.com/blog/what-is-an-mfa-fatigue-attack), a growing vector for phishing, get worse as more legitimate MFA requests arrive.
We all used to believe that changing passwords often was a good idea; turns out [the opposite is true](https://pages.nist.gov/800-63-4/sp800-63b.html). Similarly, we all used to believe that making people log in frequently was good security. If authentication is good, then surely more authentication is better, right? Like taking vitamins — one a day is good, so twenty must be great! Except, well, that’s not how anything works.
Security isn’t about how often you log in. It’s about how well your access is managed in the first place, how fast we can react to policy changes on your account, and how confident we are that your key hasn't been leaked since the last auth. The good news? You can get strong security guarantees without making users miserable.
## [What are we really checking?](#what-are-we-really-checking)
Authentication usually boils down to one of two things:
1. **Are you still in physical possession of the device?** (For example, Windows Hello PINs, YubiKeys, or smart cards; tests which anyone physically present can likely pass.)
2. **Are you the right person?** (Passwords, Face ID, Touch ID — things that supposedly nobody but you can replicate, but which don't prove you're physically near a given device.)
Identity providers (IdPs) focus mostly on **who you are**, since their whole job is identity verification. If they require a YubiKey, they might also check device possession, but that’s not really their main gig.
Integrated authentication *systems* like Apple’s Face ID and Touch ID, and tools like Windows Hello, are interesting because they do **both** at once. They're amazing as long as they are [securely enrolled](https://apenwarr.ca/log/20190114) and their keys are held in a highly trusted, malware resistant, TPM.
So why do frequent re-logins exist? Usually, it's because admins aren't confident that changes will take effect immediately. Sometimes, especially with SAML, an IdP is configured to send policy attributes to apps only during the user-interactive login process, which means they can't update without a new login. How long are we vulnerable if someone leaves the company or loses their laptop?! But it doesn't have to be that way.
## [Frequent logins are the wrong answer](#frequent-logins-are-the-wrong-answer)
### [1. They solve the wrong problem](#1-they-solve-the-wrong-problem)
Most attackers aren’t lurking in your office, waiting for you to step away. They’re remote, so their attack vector is phishing – it's [pretty easy for them to steal your password](https://www.sentinelone.com/blog/7-ways-hackers-steal-your-passwords/). As an administrator, the best policy is to assume *remote* attackers already have your password, and build your systems accordingly. That means the second factor (SMS, email, or preferably a Yubikey or equivalent) is the most important defense against remote attacks.
But, there's also physical attacks. If someone steals your laptop, usually your **screen is already locked**. That means open browser sessions won’t do them much good. Random cafe thieves probably don't have your password. If they do, more logins aren't much of a defense.
In fact, frequent logins give attackers, both local and remote, *more chances* to steal your credentials. That's deadly for security, in addition to creating annoyance for users.
### [2. Your OS already knows if you’re there](#2-your-os-already-knows-if-youre-there)
Modern operating systems already handle this problem with **screen locks**. If your screen locks when you step away, your OS is doing exactly what a frequent login prompt would do, except without annoying you every few hours. Consider enforcing [automatic screen lock when you walk away](https://www.xda-developers.com/windows-dynamic-lock-how-to-set-it-up/). If your screen is locked, all those other open sessions are safe too.
### [3. Website session expiry protects against almost nothing](#3-website-session-expiry-protects-against-almost-nothing)
Some web apps log you out quickly under the assumption that you might be on a shared computer. That makes sense if you’re using an Internet café in 2006. But for most people, web session expiry is just a relic of a bygone era.
A 15-minute session duration makes sense for something highly sensitive and disproportionately valuable, like your bank, where you want that little bit extra. But the "agressively mid-range" expiry times on most websites, like 7 days or 30 days, don’t help anyone with anything. They’re too long to stop real session hijacking before the damage is done, but so short they're constantly annoying. It’s the worst of both worlds. Security theatre.
## [The right way to handle security](#the-right-way-to-handle-security)
### [1. Check for device possession when it matters](#1-check-for-device-possession-when-it-matters)
If you really need to confirm someone is at their keyboard, you don’t want a login prompt every few hours — you want a check **right before a sensitive action**. That’s why [Tailscale SSH’s check mode](https://tailscale.com/kb/1193/tailscale-ssh) and the [Tailscale Slack Accessbot](https://tailscale.com/blog/jit-access-ga) exist: they verify that the user is there **only when it actually matters**, not just on an arbitrary timer.
And yes, set that OS screen lock aggressively! Now that most OSes can unlock with just a fingerprint or face, there's no reason to leave your screen unlocked when you walk away.
### [2. Use continuous verification, not frequent logins](#2-use-continuous-verification-not-frequent-logins)
Security should be continuous, not tied to arbitrary interactive cycles. Instead of nagging users, tools like [device posture checks](https://tailscale.com/kb/1288/device-posture) and [SCIM-based access control](https://tailscale.com/kb/1290/user-group-provisioning) can update security attributes and policies in real time, in the background, without users doing anything. That means you can have updated policies within seconds or minutes; you don't have to compromise between short reauth times (super annoying) and longer ones (less protection).
For example:
* If your device goes offline, is marked lost, or fails a security check, access gets revoked **instantly**.
* If your role or employment status changes, your access updates **automatically**.
This approach is **smarter and more secure** than making users re-enter their credentials over and over.
## [The best security is security without frustration](#the-best-security-is-security-without-frustration)
Frequent logins aren’t making you safer. They’re just annoying you into worse security habits (like password reuse, clicking phishing links, and MFA fatigue). The best security happens **quietly in the background**, ensuring safety without getting in the way.
At Tailscale, we believe in security that’s **adaptive, intelligent, and actually useful **— not just security theater. Instead of forcing pointless logins, we make sure authentication happens at the right moments, with as little friction as possible. If you use Tailscale to access your other apps, through [tsidp ](https://github.com/tailscale/tailscale/tree/main/cmd/tsidp)or [App Connector](https://tailscale.com/kb/1342/how-app-connectors-work), our real-time security checks can flow through to all your other login sessions as well. Even in legacy apps that don't understand SCIM or device posture.
(Want to go deeper? I wrote [Factors in authentication](https://apenwarr.ca/log/20190114) some time ago, but the principles still stand. It offers a deeper dive into authentication models and why Tailscale does things the way it does. Because security should be **smart, not frustrating**.)
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