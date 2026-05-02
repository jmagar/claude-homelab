Hello tsnet · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Hello tsnet
Last validated: Sep 18, 2025
Create a Go program that uses package [`tsnet`](/docs/features/tsnet) to connect with other devices in your Tailscale network (known as a tailnet). The completed program will provide a basic HTTP server that responds with "Hello, world!" and some tailnet data.
## [Prerequisites](#prerequisites)
* The development machine requires:
* the [Go compiler toolchain](https://go.dev/dl)
* a terminal window (command prompt)
* An existing tailnet
* Authorization to add a device to your tailnet.
* A browser or use of a command like `curl` to watch the program in action. You can use the same device as the development machine, or you can use another device in your tailnet.
## [Create a `tsnet` Hello, world! program](#create-a-tsnet-hello-world-program)
Create a new folder, `tshello`, for your program.
```
`mkdir tshello
`
```
Set the current working directory to the new folder.
```
`cd tshello
`
```
At a command line, initialize a Go program:
```
`go mod init tshello
`
```
Run the following command to add `tsnet` to your dependencies and make it available for use in your program:
```
`go get tailscale.com/tsnet
`
```
This will add dependencies to your program and list them in the terminal window.
Create a file, `tshello.go`.
Within `tshello.go`, define `package main` and import the Go packages that will be used in the program, and also the `tailscale.com/tsnet` package:
```
`// This program demonstrates how to use tsnet as a library.
package main
import (
"flag"
"fmt"
"html"
"log"
"net/http"
"strings"
"tailscale.com/tsnet"
)
`
```
Add a `var` array to define flags that can be specified at the command line. Set the `addr` default to `:80`. `addr` will be used as the port that the HTTP server will listen on.
```
`var (
addr = flag.String("addr", ":80", "address to listen on")
)
`
```
Add the opening code for the `main()` function:
```
`func main() {
flag.Parse()
srv := new(tsnet.Server)
defer srv.Close()
ln, err := srv.Listen("tcp", \*addr)
if err != nil {
log.Fatal(err)
}
defer ln.Close()
`
```
The code above parses any command-line flags set for the program, and then creates an instance of the [`tsnet.Server`](/docs/reference/tsnet-server-api) object. This is the main object used to interact with the tailnet. The object `ln` is a listener created by the `Server.Listen()` function. In this example, it uses the TCP protocol, listening on the port specified by `addr`.
Continue adding code to `main()`.
```
`lc, err := srv.LocalClient()
if err != nil {
log.Fatal(err)
}
`
```
The code creates the `lc` object by a call to `Server.LocalClient()`, which lets your `tsnet` program communicate with the [`tailscaled` daemon](/docs/reference/tailscaled) on the local device.
Add in code to use a TLS certificate if the `addr` is `:443`. (You won't use address `:443` in the initial execution of the code.)
```
`if \*addr == ":443" {
ln = tls.NewListener(ln, &tls.Config{
GetCertificate: lc.GetCertificate,
})
}
`
```
This code configures the listener object, `ln`, to use TLS in support of making an HTTPS connection. Tailscale will automatically request a certificate for the `tsnet` program, using [Let's Encrypt](https://letsencrypt.org).
Add code to run the program as an HTTP server:
```
`log.Fatal(http.Serve(ln, http.HandlerFunc(func(w http.ResponseWriter, r \*http.Request) {
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
}
func firstLabel(s string) string {
s, \_, \_ = strings.Cut(s, ".")
return s
}
`
```
The code relies on the Go [`http.Serve`](https://pkg.go.dev/net/http#Serve) function to handle incoming requests to the `tsnet` device running the program. When the program processes a request, it uses Tailscale's `LocalClient.WhoIs()` function to customize the "Hello". Specifically, the program returns a response that shows the user's login name, client device name, and client device [Tailscale IP address](/docs/concepts/tailscale-ip-addresses).
The `firstLabel()` function is a helper function that returns the user's client device name without the domain name included.
This is the entire example:
```
`// This program demonstrates how to use tsnet as a library.
package main
import (
"crypto/tls"
"flag"
"fmt"
"html"
"log"
"net/http"
"strings"
"tailscale.com/tsnet"
)
var (
addr = flag.String("addr", ":80", "address to listen on")
)
func main() {
flag.Parse()
srv := new(tsnet.Server)
defer srv.Close()
ln, err := srv.Listen("tcp", \*addr)
if err != nil {
log.Fatal(err)
}
defer ln.Close()
lc, err := srv.LocalClient()
if err != nil {
log.Fatal(err)
}
if \*addr == ":443" {
ln = tls.NewListener(ln, &tls.Config{
GetCertificate: lc.GetCertificate,
})
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
}
func firstLabel(s string) string {
s, \_, \_ = strings.Cut(s, ".")
return s
}
`
```
Double-check that your code matches this example and save your file. You can now test your program.
## [Run the program](#run-the-program)
1. Start the program:
```
`go run .
`
```
The program will display a message that contains a Tailscale authentication URL, similar to the following:
```
`2025/01/28 15:46:08 tsnet running state path /Users/amelie/Library/Application Support/tsnet-tshello/tailscaled.state
2025/01/28 15:46:08 tsnet starting with hostname "tshello", varRoot "/Users/amelie/Library/Application Support/tsnet-tshello"
2025/01/28 15:46:13 To start this tsnet server, restart with TS\_AUTHKEY set, or go to: https://login.tailscale.com/a/1234567890
`
```
2. To add the device to your tailnet, open the URL in a browser and log in to Tailscale. If [Device approval](/docs/features/access-control/device-management/device-approval) is enabled for your tailnet, [approve the device](/docs/features/access-control/device-management/device-approval#approve-devices-from-the-admin-console) in the **Machines** page of the admin console. (Later in this topic you'll automate adding a device to your tailnet.)
3. Open another terminal window and try to ping the newly added device:
```
`ping tshello -c 2
`
```
4. Upon success, the `ping` results will look like:
```
`PING tshello.example.ts.net (100.x.y.z): 56 data bytes
64 bytes from 100.x.y.z: icmp\_seq=0 ttl=64 time=49.404 ms
64 bytes from 100.x.y.z: icmp\_seq=1 ttl=64 time=2.425 ms
--- tshello.example.ts.net ping statistics ---
2 packets transmitted, 2 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 2.425/25.915/49.404/23.490 ms
`
```
5. Connect to the device using `curl`:
```
`curl http://tshello
`
```
The output will look like:
```
`\<html\>\<body\>\<h1\>Hello, world!\</h1\>
\<p\>You are \<b\>amelie@example.com\</b\> from \<b\>amelie-workstation\</b\> (100.x.y.z:49214)\</p\>
`
```
You've written a small HTTP service that responds to requests and provides details about your tailnet and user. Next you'll explore how to authenticate automatically.
## [Use an auth key](#use-an-auth-key)
The example code previously shown relies on a Tailscale authentication URL to log the new device into the tailnet. An alternative to logging in to Tailscale is to use an [auth key](/docs/features/access-control/auth-keys) for your `tsnet.Server` initialization. This lets you [pre-approve a device](/docs/features/access-control/device-management/device-approval#pre-approve-devices-with-an-auth-key). Also, if your tailnet has [device approval](/docs/features/access-control/device-management/device-approval) enabled, and you only intend to use that to approve end-user devices, use an auth key for your `tsnet` devices.
To use an auth key in a `tsnet` program, first [create an auth key](/docs/features/access-control/auth-keys#generate-an-auth-key).
You can then either set the local environment variable `TS\_AUTHKEY` to the auth key, or you can set [`Server.AuthKey`](/docs/reference/tsnet-server-api#serverauthkey) to the auth key. If both `TS\_AUTHKEY` and `Server.AuthKey` are set, `Server.AuthKey` has precedence.
To modify the `tsnet` program to set a command-line flag for the auth key and assign it to `Server.AuthKey`:
1. Update the `var` array to define the `tsAuthKey` flag.
```
`var (
addr = flag.String("addr", ":80", "address to listen on")
tsAuthKey = flag.String("ts-authkey", "", "Tailscale auth key")
)
`
```
2. Assign the auth key to [`Server.AuthKey`](/docs/reference/tsnet-server-api#serverauthkey) when you create an instance of the [`tsnet.Server`](/docs/reference/tsnet-server-api) object.
```
`flag.Parse()
srv := new(tsnet.Server)
srv.AuthKey = \*tsAuthKey
`
```
The program will then use the value assigned to the command-line flag `--ts-authkey`.
When using environment variables (as opposed to a program flag to set the auth key), `TS\_AUTHKEY` is the recommended environment variable name. However, if `TS\_AUTHKEY` is not defined, then `tsnet` will use the legacy `TS\_AUTH\_KEY` environment variable if it is defined. `Server.AuthKey` has precedence over both of these environment variables.
## [Control the directory for persistent data](#control-the-directory-for-persistent-data)
The `tsnet.Server` object uses a directory to store and retrieve persistent data used by `tsnet`. `tsnet` uses the persistent data so your program can reconnect to your tailnet when the program is restarted. If the persistent data is deleted, your program will require authentication again (unless you are using an auth key when you start your program).
By default, `tsnet` will store data in the [user configuration directory](https://golang.org/pkg/os/#UserConfigDir), in a subdirectory with a name based on a concatenation of `tsnet-` and the name of your program. In the case of the program created by using this topic, the subdirectory name is `tsnet-tshello`. You can set [`Server.Dir`](/docs/reference/tsnet-server-api#serverdir) to use a different directory. The directory specified by `Server.Dir` must already exist or `tsnet` calls will fail.
## [`tsnet` and the Go HTTP stack](#tsnet-and-the-go-http-stack)
Building off the example, you can do anything you want with the Go standard library HTTP stack, or anything that is compatible with it (such as Gin/Gonic or Gorilla/mux). If you want to make outgoing HTTP connections to resources in your tailnet, use the `HTTPClient` object that the `tsnet.Server` object exposes:
```
`httpCli := srv.HTTPClient()
`
```
You can use this like any other [`net/http#Client`](https://pkg.go.dev/net/http#Client):
```
`resp, err := httpCli.Get("http://tshello")
if err != nil {
log.Fatal(err)
}
defer resp.Body.Close()
\_, err = io.Copy(os.Stdout, resp.Body)
if err != nil {
log.Fatal(err)
}
`
```
On this page
* [Prerequisites](#prerequisites)
* [Create a tsnet Hello, world! program](#create-a-tsnet-hello-world-program)
* [Run the program](#run-the-program)
* [Use an auth key](#use-an-auth-key)
* [Control the directory for persistent data](#control-the-directory-for-persistent-data)
* [tsnet and the Go HTTP stack](#tsnet-and-the-go-http-stack)
Scroll to top