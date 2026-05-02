Goodbye SSO Tax: How Tailscale Made SSO Free for Everyone
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsApril 18, 2024
# SSO tax, cut
Back in 2023, we introduced [Pricing v3](https://tailscale.com/blog/pricing-v3). At the time, we made the decision to separate Single Sign-On (SSO) identity providers into two categories: standard identity providers (free-to-use identity services) that could be used on all Tailscale pricing plans, and advanced identity providers (paid-for identity services) which could only be used with our Personal, Premium, and Enterprise pricing tiers.
A few weeks ago, we quietly removed this language from our website, making Tailscale usable with any OIDC-compliant SSO identity provider on any plan.
Almost a year to the date after we made the initial decision, SSO is once again available for free for everyone. The number of users affected by this change is relatively small; most people on our paid tiers use premium features other than advanced identity providers, and most Starter users were comfortably using standard identity providers. But we made the move for reasons that were important to us, and understanding those reasons requires a little background in identity.
## [SSO and identity](#sso-and-identity)
First, some context. Single Sign-On, known as SSO, centralizes user access management. It reduces the number of login credentials users have to maintain, which in turn reduces the number of credentials vulnerable to compromise. In addition, it allows organizations to enforce uniform security policies, such as mandating the use of multifactor authentication and password strength. SSO makes it easier to grant and revoke access to applications quickly during onboarding, offboarding, and security incidents, and provides audit logs for users' access and use of applications.
These features have made SSO a fundamental tool for any modern company that takes security seriously. Internally, Tailscale employees are required to use [SSO when available](https://tailscale.com/security-policies/password#single-sign-on) as a part of our security policy. Moreover, Tailscale's product doesn't support plain username+password authentication at all. Users of Tailscale have only ever been able to authenticate using SSO.
Why do we require SSO? Our mission at Tailscale is to build the new internet, and we take a strong stance that the next internet has to be secure by default. We also want to focus on what we do really well (networking), and rely on identity experts to do the identity parts well. That’s not trivial! Identity and authentication are core security concerns, and the experts in those fields have done a lot of hard implementation work. For our users’ authentication requirements, delegating their Tailscale identity to an existing SSO is a clear winner.
## [The SSO tax](#the-sso-tax)
Many service providers do not yet share our philosophy that SSO has become a basic security requirement, and they tend to charge more (and sometimes significantly more) for the "luxury" to log in via an SSO identity provider. This practice is now infamously called the "SSO tax" in security circles. There is even an [SSO Tax wall of shame](https://sso.tax) in its honor — a publicly maintained list of companies who do it.
The core issue with this tax is that it turns basic security into a budgetary question, forcing users to choose between good security posture and their wallets. And the smaller the company, the more painful the tradeoff. As a security-first company, we don’t think this is the right tradeoff for the good of the Internet overall — so it is not a trend we want to endorse.
## [How we (partially) fell into the trap](#how-we-partially-fell-into-the-trap)
But even with those principles in mind, we found ourselves in a position of levying a (partial) SSO tax. Tailscale evolves on a daily basis, along with our user base and their needs. Designing a pricing policy for ever-changing requirements was, and continues to be, a complex challenge.
Adding to the complexity: some identity-related features really can be premium options without creating major security problems. A classic example is [user and group provisioning](https://tailscale.com/kb/1290/user-group-provisioning) (e.g. SCIM). It’s built on top of SSO, and it makes some kinds of user management a lot easier, but it doesn’t have the same security implications as SSO generally. It’s genuinely an advanced security option, not a basic one.
When we designed our pricing v3, the idea was that Starter would serve small teams (with a high degree of internal trust) that may not need advanced security features, and the Premium and Enterprise plans are for larger teams that do require more assurance. We assumed that users who use more feature-rich identity providers they were already willing to pay for would also benefit from more enterprise Tailscale features such as network flow logging, user and group provisioning or advanced user roles. We bundled these features along with “advanced” (i.e. paid) identity providers together in our pricing plans.
We’d aimed to thread the needle by separating out the two kinds of identity providers and taking comfort in the fact that SSO, in general, remained free. Which was true! But also, as we continued to examine it, this pricing felt more and more like a partial SSO tax (for certain identity providers). And that felt like a mistake.
In fact, from customer feedback and use cases, we learned that a user's choice of identity provider has little correlation to their usage and requirements for other features of Tailscale (except the aforementioned user and group provisioning). The distinction between standard and advanced identity providers did not wind up providing our users any value, nor did it align with our ethos that security isn’t a luxury.
Since the beginning, the goal of our pricing policy has been to provide the best experience and value for our users. When we identify issues that impact our users, we aim to improve or resolve them as quickly as possible. Between the time we noticed we'd fallen into the SSO tax trap, to approving its removal and updating the public policy, only a couple of weeks had elapsed.
Cutting the SSO tax is an important security win here, and we'd like to see more companies follow suit. Just as important, though, is the willingness to look at what's working — and what's not — and listen to users about what policies might be a mistake. Thanks to those users and to my Tailscale colleagues for acting quickly, now our SSO tax is gone. Good riddance.
Share
Author
Charlotte Brandhorst-Satzkorn
Author
Charlotte Brandhorst-Satzkorn
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