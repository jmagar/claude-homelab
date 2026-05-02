tsnet.Server · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# tsnet.Server
Last validated: Jan 27, 2026
The [`tsnet` package](https://pkg.go.dev/tailscale.com/tsnet) provides the ability for Go programs to programmatically access a Tailscale network (known as a tailnet). A Go program using `tsnet` can connect to your tailnet as though it were a separate computer. You can also use `tsnet` to run multiple services with different confidentiality levels on the same machine. For example, you can create a support tool separate from a data analytics tool, without having to run them on multiple servers or virtual machines. The only way that the tools could be accessed is over Tailscale, so there's no way to get into them from outside your tailnet.
[`tsnet.Server`](https://pkg.go.dev/tailscale.com/tsnet#Server) provides the primary means of interacting with a tailnet, and contains all the state for your program's connection to Tailscale. Use `tsnet.Server` to provide your Go program will its own IP address, DNS name, and the ability to grab its own HTTPS certificate. This lets you listen on privileged ports like the HTTP and HTTPS ports without having to run your service as `root`. `tsnet.Server` builds on the Go standard library HTTP functionality to give you the ability to make HTTP requests and an HTTP server to handle HTTP requests, in the context of your tailnet.
If you use `tsnet.Server` without any arguments, it uses default settings until you modify a setting in a subsequent `Server` call.
```
`srv := new(tsnet.Server)
if err := srv.Start(); err != nil {
log.Fatalf("can't start tsnet server: %v", err)
}
defer s.Close()
`
```
You can change settings for a `tsnet.Server` instance up until you run any methods on it. This following sections show which settings you can change.
## [`Server.Hostname`](#serverhostname)
This setting lets you control the host name of your program in your tailnet. By default, this will be the name of your program, such as `foo` for a program stored at `/usr/local/bin/foo`. You can also override this by setting the `Hostname` field:
```
`srv := new(tsnet.Server)
srv.Hostname = "kirito"
`
```
## [`Server.Dir`](#serverdir)
This setting lets you control the directory that the `tsnet.Server` stores data in persistently. By default,`tsnet` will store data in your [user configuration directory](https://golang.org/pkg/os/#UserConfigDir) based on the name of the binary. Note that this folder must already exist or `tsnet` calls will fail.
Here is how to override this to store data in `/data/tsnet`:
```
`dir := filepath.Join("/data", "tsnet")
if err := os.MkdirAll(dir, 0700); err != nil {
log.Fatal(err)
}
srv := new(tsnet.Server)
srv.Dir = dir
`
```
You can have as many `tsnet.Server` instances as you want per OS process, but you will need to change the state directory if this is the case:
```
`baseDir := "/data"
var servers []\*tsnet.Server
for \_, hostname := range []string{"ichika", "nino", "miku", "yotsuba", "itsuki"} {
os.MkdirAll(filepath.Join(baseDir, hostname), 0700)
srv := &tsnet.Server{
Hostname: hostname,
AuthKey: os.Getenv("TS\_AUTHKEY"),
Ephemeral: true,
Dir: filepath.Join(baseDir, hostname),
}
if err := srv.Start(); err != nil {
log.Fatalf("can't start tsnet server: %v", err)
}
servers = append(servers, srv)
}
`
```
## [`Server.Ephemeral`](#serverephemeral)
This setting lets you control whether the node should be registered as an [ephemeral node](/docs/features/ephemeral-nodes). Ephemeral nodes are automatically cleaned up after they disconnect from the control plane. This is useful when using `tsnet` in serverless environments or when facts and circumstances forbid you from using persistent state.
```
`srv := new(tsnet.Server)
srv.Ephemeral = true
`
```
## [`Server.AuthKey`](#serverauthkey)
This setting lets you set an [auth key](/docs/features/access-control/auth-keys) so that your program will automatically authenticate with the Tailscale control plane. By default it pulls from the environment variable `TS\_AUTHKEY`, but you can set your own logic like this:
```
`tsAuthKey := flag.String("ts-authkey", "", "Tailscale authkey")
flag.Parse()
srv := new(tsnet.Server)
srv.AuthKey = \*tsAuthKey
`
```
This will set the auth key to the value of the flag `--ts-authkey`.
## [`Server.ClientSecret`](#serverclientsecret)
If you pass an [OAuth client](/docs/features/oauth-clients) secret in `ClientSecret`, tsnet will use it to obtain an auth key from the control plane. You can also pass the client secret in the `TS\_CLIENT\_SECRET` environment variable. The OAuth client needs to have `auth\_keys` write scope in order for this to work.
To use OAuth client authentication, you must pass at least one tag for the tsnet server in `AdvertiseTags`.
```
`tsClientSecret := flag.String("ts-client-secret", "", "Tailscale OAuth client secret")
tsAdvertiseTags := flag.String("ts-advertise-tags", "", "Comma-separated list of tags to advertise")
flag.Parse()
srv := new(tsnet.Server)
srv.ClientSecret = \*tsClientSecret
srv.AdvertiseTags = strings.Split(\*tsAdvertiseTags, ",")
`
```
## [`Server.ClientID` and `Server.IDToken`](#serverclientid-and-serveridtoken)
With [workload identity federation](/docs/features/workload-identity-federation), tsnet can use an OpenID Connect (OIDC) token from a cloud-hosted infrastructure provider like Microsoft Azure, Google Cloud Platform, or GitHub Actions to authenticate with the control plane and request an auth key for the server.
You need to set up a [federated identity](/docs/features/workload-identity-federation#get-started) to establish the trust relationship between the OIDC issuer and Tailscale and grant it the `auth\_keys` write scope. You can then start your tsnet server with the client ID of the federated identity in `ClientID` and an OIDC token from the cloud provider in `IDToken`. Alternatively, you can set them with the environment variables `TS\_CLIENT\_ID` and `TS\_ID\_TOKEN`. This will prompt tsnet to exchange them for an auth key.
To use workload identity authentication, you must pass at least one tag for the tsnet server in `AdvertiseTags`.
```
`tsClientID := flag.String("ts-client-id", "", "Tailscale federated identity client ID")
tsIDToken := flag.String("ts-id-token", "", "ID token issued by OIDC provider")
tsAdvertiseTags := flag.String("ts-advertise-tags", "", "Comma-separated list of tags to advertise")
flag.Parse()
srv := new(tsnet.Server)
srv.ClientID = \*tsClientID
srv.IDToken = \*tsIDToken
srv.AdvertiseTags = strings.Split(\*tsAdvertiseTags, ",")
`
```
## [`Server.AdvertiseTags`](#serveradvertisetags)
`AdvertiseTags` specifies tags from the tailnet's ACL policy that should be applied to this node.
```
`tsAdvertiseTags := flag.String("ts-advertise-tags", "", "Comma-separated list of tags to advertise")
flag.Parse()
srv := new(tsnet.Server)
srv.AdvertiseTags = strings.Split(\*tsAdvertiseTags, ",")
`
```
## [`Server.Logf`](#serverlogf)
This setting lets you override the logging logic for each `tsnet` instance. By default this will output everything to the [`log.Printf`](https://pkg.go.dev/log#Printf) function, which can get spammy. To disable all `tsnet` logs, you can use a value like this:
```
`srv := &tsnet.Server{
Logf: func(string, ...any) { },
}
`
```
When you need the logs, for example when debugging, use a [command line flag](https://pkg.go.dev/flag#Bool) to enable logging:
```
`tsnetVerbose := flag.Bool("tsnet-verbose", false, "if set, verbosely log tsnet information")
hostname := flag.String("tsnet-hostname", "hikari", "hostname to use in the tailnet")
srv := &tsnet.Server{
Hostname: \*hostname,
Logf: func(string, ...any) { },
}
if \*tsnetVerbose {
srv.Logf = log.New(os.Stderr, fmt.Sprintf("[tsnet:%s] ", \*hostname), log.LstdFlags).Printf
}
`
```
This will prefix all `tsnet` log lines with the prefix `[tsnet:\<hostname\>]`, which can be useful when trying to debug issues.
## [`Server.Start`](#serverstart)
Once you are done changing your settings, you start the connection to your tailnet using the `Start` method:
```
`srv := new(tsnet.Server)
if err := srv.Start(); err != nil {
log.Fatal(err)
}
defer srv.Close()
`
```
Most of the other `tsnet` calls implicitly call `Start` if it has not been called already.
Be sure to close the server instance at some point. It will stay open until either the OS process ends or the server is explicitly closed:
```
`defer srv.Close()
`
```
## [`Server.Close`](#serverclose)
This call releases all resources associated with the `tsnet` server. Any calls to the server after this call will fail. All socket connections will be closed. All listeners will be closed. The node will not respond to ping messages. It is the same as turning off Tailscale on a machine in your tailnet.
Create your `tsnet` instances in your `main` function and then use `defer` to clean them up:
```
`srv := new(tsnet.Server)
if err := srv.Start(); err != nil {
log.Fatal(err)
}
defer srv.Close()
`
```
## [`Server.Listen`](#serverlisten)
This call creates a network listener in your tailnet. It returns a [`net.Listener`](https://pkg.go.dev/net#Listener) that returns connections from your tailnet.
```
`srv := new(tsnet.Server)
srv.Hostname = "tadaima"
ln, err := srv.Listen("tcp", ":80")
if err != nil {
log.Fatal(err)
}
log.Fatal(http.Serve(ln, http.HandlerFunc(func(w http.ResponseWriter, r \*http.Request) {
fmt.Fprintln(w, "Hi there! Welcome to the tailnet!")
})))
`
```
This method implicitly calls the `Start` method if it has not been called already.
## [`Server.ListenTLS`](#serverlistentls)
This call creates a TLS-wrapped network listener in your tailnet. It returns a [`net.Listener`](https://pkg.go.dev/net#Listener) that wraps every incoming connection with TLS using the [Let's Encrypt](/docs/how-to/set-up-https-certificates) support Tailscale offers. You can use this to create HTTPS services:
```
`srv := new(tsnet.Server)
srv.Hostname = "aegis"
ln, err := srv.ListenTLS("tcp", ":443")
if err != nil {
log.Fatal(err)
}
log.Fatal(http.Serve(ln, http.HandlerFunc(func(w http.ResponseWriter, r \*http.Request) {
fmt.Fprintln(w, "Hi there! Welcome to the tailnet!")
})))
`
```
This method implicitly calls the `Start` method if it has not been called already.
## [`Server.ListenFunnel`](#serverlistenfunnel)
This call creates a TLS-wrapped network listener that accepts connections from both your tailnet and the public internet using [Funnel](/docs/features/tailscale-funnel). You can use this to expose your services to the public internet.
```
`srv := new(tsnet.Server)
srv.Hostname = "ophion"
ln, err := srv.ListenFunnel("tcp", ":443")
if err != nil {
log.Fatal(err)
}
log.Fatal(http.Serve(ln, http.HandlerFunc(func(w http.ResponseWriter, r \*http.Request) {
fmt.Fprintln(w, "Hi there! Welcome to the tailnet!")
})))
`
```
You can create a Funnel-only listener using `tsnet.FunnelOnly()`:
```
`publicLn, err := srv.ListenFunnel("tcp", ":443", tsnet.FunnelOnly())
if err != nil {
log.Fatal(err)
}
privateLn, err := srv.ListenTLS("tcp", ":443")
if err != nil {
log.Fatal(err)
}
`
```
This lets you have different logic or endpoints exposed within your tailnet and to the general public.
This method implicitly calls the `Start` method if it has not been called already.
## [`Server.ListenService`](#serverlistenservice)
`ListenService` creates a network listener for a [Tailscale Services](/docs/features/tailscale-services) host. This will advertise this node as hosting the Service.
The following [prerequisites](/docs/features/tailscale-services#prerequisites) must be met:
* Approval must be granted by [auto-approval rules](/docs/reference/syntax/policy-file#auto-approvers) or by an [Owner, Admin, or Network admin](/docs/reference/user-roles).
* Service hosts must be [tagged nodes](/docs/features/tags).
* A valid Service host must advertise all ports defined for the Service.
```
`srv := new(tsnet.Server)
srv.Hostname = "atum"
ln, err := srv.ListenService("svc:my-service", tsnet.ServiceModeHTTP{
HTTPS: true,
Port: 443,
})
if err != nil {
log.Fatal(err)
}
log.Printf("Listening on https://%v\\n", ln.FQDN)
log.Fatal(http.Serve(ln, http.HandlerFunc(func(w http.ResponseWriter, r \*http.Request) {
fmt.Fprintln(w, "Hi there! Welcome to the tailnet!")
})))
`
```
To advertise a Service with multiple ports, run `ListenService` multiple times.
It is also possible to advertise a Service targeting a reverse proxy. This is useful when the backing server is external to the `tsnet` application.
```
`// targetAddress represents the address of the backing server.
const targetAddress = "1.2.3.4:80"
srv := new(tsnet.Server)
srv.Hostname = "tefnut"
ln, err := srv.ListenService("svc:my-service", tsnet.ServiceModeHTTP{
HTTPS: true,
Port: 443,
})
if err != nil {
log.Fatal(err)
}
log.Printf("Listening on https://%v\\n", ln.FQDN)
log.Fatal(http.Serve(ln, httputil.NewSingleHostReverseProxy(&url.URL{
Scheme: "http",
Host: targetAddress,
})))
`
```
This method implicitly calls the `Start` method if it has not been called already.
## [`Server.Dial`](#serverdial)
This call lets you create outgoing connections to nodes in your tailnet. You can treat the resulting connections like any other [network connection](https://pkg.go.dev/net#Conn) in Go.
```
`srv := new(tsnet.Server)
srv.Hostname = "gaga"
conn, err := srv.Dial(r.Context(), "tcp", "yourmachine:80")
if err != nil {
log.Fatal(err)
}
`
```
If [MagicDNS](/docs/features/magicdns) is enabled, you can use MagicDNS names instead of full DNS names. For example, `yourmachine.tail-scale.ts.net`.
This method implicitly calls the `Start` method if it has not been called already.
## [`Server.HTTPClient`](#serverhttpclient)
This is a convenience wrapper that lets you create a [HTTP client](https://pkg.go.dev/net/http#Client) preconfigured to make outgoing connections in your tailnet.
```
`srv := new(tsnet.Server)
srv.Hostname = "looker"
cli := srv.HTTPClient()
resp, err := cli.Get("http://yourmachine/hello")
if err != nil {
log.Fatal(err)
}
`
```
This method does not implicitly call the `Start` method if it has not been called already, but when you make any HTTP requests with that client, it will be called at time of use. In the above example, the `Start` method will be called when `cli.Get("http://yourmachine/hello")` is called.
## [`Server.LocalClient`](#serverlocalclient)
When you install Tailscale on a computer normally, you can make changes to its configuration using the `tailscale` command line tool. `tsnet` doesn't offer the ability to use the `tailscale` command line tool to change its configuration, but you can use the [LocalClient](https://pkg.go.dev/tailscale.com/client/tailscale#LocalClient) to make all the same changes. The `tailscale` command line tool is built on the back of the LocalClient type.
One common way to use this is to look up identity information for incoming connections in a HTTP server:
```
`s := new(tsnet.Server)
s.Hostname = "aran"
defer s.Close()
ln, err := s.Listen("tcp", ":80")
if err != nil {
log.Fatal(err)
}
defer ln.Close()
lc, err := s.LocalClient()
if err != nil {
log.Fatal(err)
}
log.Fatal(http.Serve(ln, http.HandlerFunc(func(w http.ResponseWriter, r \*http.Request) {
who, err := lc.WhoIs(r.Context(), r.RemoteAddr)
if err != nil {
http.Error(w, err.Error(), 500)
return
}
fmt.Fprintf(w, "\<html\>\<body\>\<h1\>Hello, world!\</h1\>\\n")
fmt.Fprintf(w, "\<p\>You are \<b\>%s\</b\> from \<b\>%s\</b\> (%s)\</p\>",
html.EscapeString(who.UserProfile.LoginName),
html.EscapeString(firstLabel(who.Node.ComputedName)),
r.RemoteAddr)
})))
`
```
The `who` value is of type [`apitype.WhoIsResponse`](https://pkg.go.dev/tailscale.com/client/tailscale/apitype#WhoIsResponse). Depending on your jurisdiction's definition of personally-identifying information, this may contain personally-identifying information.
This method implicitly calls the `Start` method if it has not been called already.
On this page
* [Server.Hostname](#serverhostname)
* [Server.Dir](#serverdir)
* [Server.Ephemeral](#serverephemeral)
* [Server.AuthKey](#serverauthkey)
* [Server.ClientSecret](#serverclientsecret)
* [Server.ClientID and Server.IDToken](#serverclientid-and-serveridtoken)
* [Server.AdvertiseTags](#serveradvertisetags)
* [Server.Logf](#serverlogf)
* [Server.Start](#serverstart)
* [Server.Close](#serverclose)
* [Server.Listen](#serverlisten)
* [Server.ListenTLS](#serverlistentls)
* [Server.ListenFunnel](#serverlistenfunnel)
* [Server.ListenService](#serverlistenservice)
* [Server.Dial](#serverdial)
* [Server.HTTPClient](#serverhttpclient)
* [Server.LocalClient](#serverlocalclient)
Scroll to top