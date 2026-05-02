Why Tailscale Doesn't Want Your Passwords: Passkeys Are Here
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|June 07, 2023
# Tailscale doesn't want your password
Tailscale has never supported password-based authentication. As [security-conscious](https://tailscale.com/security) software that connects your private devices across the internet, we had to face a harsh reality: the password is outdated technology that requires kludges to use safely. Passwords must be complex enough that a human cannot remember them and they must not be reused across services, which means we now need software to manage our passwords.
To keep logins sane, Tailscale started by requiring users log in using reasonably well-managed Google and Microsoft auth providers. Over time we expanded [our login options](https://tailscale.com/kb/1013/sso-providers/) to include GitHub, Apple, and [custom OIDC providers](https://tailscale.com/kb/1240/sso-custom-oidc/). Now, we are happy to offer a modern replacement for passwords that meets our security requirements: passkeys.
### [What are passkeys?](#what-are-passkeys)
Passkeys are a secure and convenient alternative to passwords. They are a form of user authentication that doesn't require the user to remember yet another password, and are guaranteed to be unique for each account and site you visit. Each passkey is tied to the specific app or website it was created for, and can’t be phished by a lookalike domain name or fake login page design. Passkeys are synchronized across devices using services you already use and trust, like iCloud Keychain from Apple, Google Password Manager, and 1Password. For a detailed understanding of passkeys, we recommend the [overview on passkeys](https://developer.apple.com/passkeys/) from Apple.
### [How do passkeys work with Tailscale?](#how-do-passkeys-work-with-tailscale)
To add a user with a passkey to your tailnet, if you’re an admin, you can generate an invite from the [**Users** page](https://login.tailscale.com/admin/users) of the admin console. Click **Invite users**, then **Invite via link...**, and select the role you’d like the invited user to have. Then, share the unique invite URL with that user. When the invited user opens the link, they'll be able to create a unique username and join your tailnet.
Your browser does not support the video tag.
A tailnet admin creates a unique invitation, tied to a specific role, which can be shared with the user you want to invite.
Your browser does not support the video tag.
Users can accept an invite to a tailnet using any identity provider they choose, including passkeys, as shown here.
When a user joins a tailnet with a passkey, a public/private key pair unique to Tailscale is generated. The public key is sent to Tailscale, and the private key is stored on your device. The passkey identity is unique across all of Tailscale — the new user is a member of the inviting tailnet, but they don’t belong to the domain, and receive their own personal tailnet, as well. They can use this new passkey identity to join other tailnets if invited.
Only admins who can invite users can invite users with passkeys.
### [Why use a passkey?](#why-use-a-passkey)
Passkeys allow you to go passwordless — rather than a password that can still be phished — you get strong credential that syncs securely across your devices, using your chosen password/passkey manager.
If you’re not ready to make the move to passkeys, here’s another reason you might want to use them — to create a backup user for your tailnet. Invite yourself as an admin of your tailnet, with a [passkey user on a yubikey](https://www.yubico.com/blog/a-yubico-faq-about-passkeys/). Just as you might register multiple hardware second factors for an account, create a backup Tailscale user in case you get locked out of your primary account. At this time, you cannot add a passkey to an existing login, so this method of creating backup access to your tailnet does require an additional user.
### [Passkeys for all tailnets](#passkeys-for-all-tailnets)
Available in beta, you can use passkeys with Apple’s macOS and iOS, Google Chrome and Android, as well as 1Password, Yubikey, and any other passkey provider.
To get started, see the documentation [Setting up passkeys to work with Tailscale](https://www.tailscale.com/kb/1269/passkeys/).
Share
Authors
Ben Lee-Cohen
Jeff Spencer
Authors
Ben Lee-Cohen
Jeff Spencer
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