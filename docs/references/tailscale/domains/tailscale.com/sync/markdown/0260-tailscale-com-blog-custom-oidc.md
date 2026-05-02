Enhance Security with Tailscale and Custom OIDC Support
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|March 27, 2023
# Secure Networking with Tailscale and Custom OIDC Integration
At Tailscale, we don’t want your users (or us) managing a separate list of usernames and passwords, which is why you must use single sign-on with an identity provider to create and manage your network. Until now, that meant you needed to choose from a handful of trusted identity providers including Google, Okta, GitHub, and Azure AD. [Custom OIDC](/kb/1240/sso-custom-oidc), now in beta (and available for everyone), changes all that.
It doesn’t matter if you’re an enterprise customer with complex identity requirements or a privacy-minded power user self-hosting your own authentication solution — you’re now able to use Tailscale with an OpenID Connect (OIDC) compliant identity provider of your choice. Custom OIDC requires a [WebFinger endpoint](/kb/1240/sso-custom-oidc/) configured on the domain used for authentication, to prove administrative control of the domain, and for identity provider discovery.
New users can set up custom OIDC and sign in at [login.tailscale.com/start/oidc](https://login.tailscale.com/start/oidc), and existing customers can [contact our support team](/contact/support/?type=sso) to request account migration.
## Custom OIDC, *The Slightly Questionable Way*
Now the serious part of this blog post is out of the way, it’s time for some shenanigans. For the rest of this post, we’ll describe how one *might* build a janky (Totally Professional, not at all chaotic) identity provider (IdP) to test this functionality, and give you a whirlwind tour of OIDC along the way.
### Spec (non)compliance
WebFinger, OAuth 2.0, and OpenID Connect are all chonky specs with many many pages of SHALL, MUST NOTs, and what have yous. This ain’t that vibe — we wanted to see how many of these requirements we could ignore, and still end up with a working IdP.
### WebFinger
WebFinger is a protocol for discovering information about accounts on a domain, and Tailscale’s control plane uses it to determine the OIDC issuer URL for an account during sign-up. Because WebFinger responses must be served over HTTPS, we can be confident that any valid response is authoritative for that domain.
Fortunately for us, we already had the domain `example.com` lying around.
*UPDATE 2024-02-28: We'd previously used a custom domain as an example. To avoid any shenanigans with that domain, we've changed it to example.com throughout this post.*
So with a lil’ bit of code…
```
`acme := &autocert.Manager{
Cache: autocert.DirCache("/var/lib/yolocerts"),
Prompt: autocert.AcceptTOS,
HostPolicy: autocert.HostWhitelist("example.com"),
}
S := &http.Server{
Handler: http.NewServeMux(),
TLSConfig: &tls.Config{GetCertificate: acme.GetCertificate}
}
s.ListenAndServeTLS("", "")
`
```
We now have a *✨HTTPS server✨*.
What’s that? What about WebFinger? Oh yea, *soooooo* technically WebFinger is meant to serve specialized information about the account that was queried, but given everything on this domain is going to use the same OIDC issuer we can just yeet a static response:
```
`s.Handler.(\*http.ServeMux).Handle("/.well-known/webfinger", func(w http.ResponseWriter, req \*http.Request) {
w.Header().Set("Content-Type", "application/json")
w.Write([]byte(`{
"subject" : "acct:felix@example.com",
"links" :
[
{
"rel" : "http://openid.net/specs/connect/1.0/issuer",
"href" : "https://example.com/"
}
]
}`))
})
`
```
### OpenID discovery document
Now that, thanks to WebFinger, Tailscale knows where to look when dancing the OIDC tune, we need to implement enough to tango. The control plane learns our moves by reading the discovery document from our `\<OIDC issuer URL\>/.well-known/openid-configuration`:
```
`{
"issuer": "https://example.com/",
"authorization\_endpoint": "https://example.com/authorize",
"token\_endpoint": "https://example.com/token",
"jwks\_uri": "https://example.com/.well-known/jwks.json",
"userinfo\_endpoint": "https://example.com/userinfo",
"grant\_types\_supported": ["authorization\_code", "refresh\_token"],
"response\_types\_supported": ["code"],
"subject\_types\_supported": ["public"],
"id\_token\_signing\_alg\_values\_supported": ["RS256"],
"scopes\_supported": ["openid", "email", "groups", "profile"],
"token\_endpoint\_auth\_methods\_supported": ["client\_secret\_basic","client\_secret\_post"],
"claims\_supported": ["sub", "email", "email\_verified", "preferred\_username", "phone\_number", "address", "groups", "iss", "aud"],
"code\_challenge\_methods\_supported": ["plain", "S256"]
}
`
```
That looks complicated but we’re just trying to do #hackz. Hrm, let’s just wire up a library that should roughly know what it’s doing instead:
```
`go get github.com/oauth2-proxy/mockoidc
`
```
*(A testing library? We did warn you that there would be shenanigans.)*
While our testing library wires us up with reasonable defaults, OpenID Connect IdPs need a little configuration to work. Most notably, we need to pick the OAuth client ID and secret, as well as set up a keypair which can be used for signatures.
```
`kp, \_ := mockoidc.RandomKeypair(2048)
oidc := &mockoidc.MockOIDC{
ClientID: "AzureDiamond",
ClientSecret: "hunter2",
AccessTTL: 5 \* time.Minute,
RefreshTTL: 5 \* time.Hour,
CodeChallengeMethodsSupported: []string{"plain", "S256"},
Keypair: kp,
SessionStore: mockoidc.NewSessionStore(),
UserQueue: &mockoidc.UserQueue{},
ErrorQueue: &mockoidc.ErrorQueue{},
Server: &http.Server{Addr: "example.com"},
}
`
```
Our last step to serve the discovery document is wiring the `mockoidc` handler to our server:
```
`s.Handler.(\*http.ServeMux).Handle("/.well-known/openid-configuration", oidc.Discovery)
`
```
Huzzah! 😎
### OAuth, we meet again
The gory details of any OAuth 2.0 IdP are its handlers for `authorize` and `token` endpoints, which complete a login flow for an authorization code, and exchange an authorization code for an access token respectively. Together, these two endpoints implement the bulk of an OIDC identity provider, and combined with the `userinfo` endpoint (which exchanges an access token for information about the user), these endpoints implement everything Tailscale needs from an identity provider.
The OAuth 2 [specification](https://www.rfc-editor.org/rfc/rfc6749) is big and complicated, so it’d be great if we could avoid reading all 76 pages of the RFC and rolling this ourselves. Fortunately, `mockoidc` can handle all of this. Love that for us.
```
`s.Handler.(\*http.ServeMux).Handle("/oidc/authorize", oidc.Authorize)
s.Handler.(\*http.ServeMux).Handle("/oidc/token", oidc.Token)
s.Handler.(\*http.ServeMux).Handle("/oidc/userinfo", oidc.Userinfo)
`
```
You may be asking: where’s the actual login flow? Isn’t the `authorize` endpoint meant to provide a UI and some logic for checking credentials and actually logging in a user?
That would involve actually building a login flow! We’re just testing the OIDC bits here, so let’s just be twitchy and do something much simpler.
### Thanks, I hate it
Nothing I say or do will ever make this okay, so I’ll just go ahead and post the code:
```
`s.Handler.(\*http.ServeMux).Handle("/uwu/secret-url/next-login-as", func(w http.ResponseWriter, req \*http.Request) {
oidc.UserQueue.Push(&mockoidc.MockUser{
Subject: req.FormValue("user"),
Email: req.FormValue("user") + "@example.com",
PreferredUsername: req.FormValue("user"),
Phone: "555-987-6543",
Address: "123 Main Street",
Groups: []string{"engineering", "design"},
EmailVerified: true,
})
})
`
```
When anyone makes a request to [https://example.com/uwu/secret-url/next-login-as](https://example.com/uwu/secret-url/next-login-as), they configure that the next login request will proceed using the username specified as the *user* URL parameter. This way we don’t need to implement user sessions, handle credentials, or even store state!
This is horribly insecure in dozens of ways: see if you can list them all!
## Will it work?
At this point we have everything in place we need to test our custom OIDC flow – that is, the vaguely minimalist OIDC issuer and the questionably compliant WebFinger server. To test this out, we would need to:
1. Hit the [https://example.com/uwu/secret-url/next-login-as](https://example.com/uwu/secret-url/next-login-as) endpoint to tell our `mockoidc` service the next user that should be logged in.
2. Go to [https://login.tailscale.com/start/oidc](https://login.tailscale.com/start/oidc) and sign up for Tailscale.
3. Use the @example.com as the email.
4. Tailscale sends a request to [https://example.com/.well-known/webfinger](https://example.com/.well-known/webfinger) to get the OIDC issuer associated with @example.com.
5. Input the client ID and secret configured on the `mockoidc` server.
6. Tailscale starts the OIDC authentication flow with the `mockoidc` server, redirecting to the authorize endpoint. Since the `mockoidc` server won’t ask for a password, it should just log right in.
With any luck, tada! Authentication should succeed and a tailnet will be created. Since that Tailscale’s control plane has observed successful authentication, OIDC configuration parameters will be remembered and any user will be able to login with Tailscale, much to the dismay of security experts everywhere (we are sorry).
## Please don’t roll your own IdP
If you’ve gotten this far, it should be very obvious that this is a terrible idea, and as we said, all entirely hypothetical. The whole point of this was to highlight just how bad of an idea this actually was, show you how it works, and encourage you to please, please, use a real IdP… Please.
If you do want to host your own IdP, we advise you to use a solution like [Keycloak](https://www.keycloak.org/), [Dex](https://dexidp.io/), or [Ory](https://www.ory.sh/). [Check out the docs on Custom OIDC](/kb/1240/sso-custom-oidc/) to set up your not artisanal, handcrafted, or bespoke IdP with Tailscale.
Share
Authors
Charlotte Brandhorst-Satzkorn
Tom D'Netto
Authors
Charlotte Brandhorst-Satzkorn
Tom D'Netto
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