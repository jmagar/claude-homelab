tsnet · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# tsnet
Last validated: Jan 27, 2026
`tsnet` is a library that lets you embed Tailscale inside a Go program. With `tsnet`, you can programmatically make direct connections to devices on your Tailscale network (known as a tailnet), just like any other device in your tailnet would. When combined with other features of Tailscale, you can create new and interesting ways to use your tailnet.
## [Overview](#overview)
Typically, every IP address in your tailnet has to be strongly associated with a single device. This makes it difficult to run multiple services on a single device, especially if all of those services have different [access control](/docs/features/access-control) rules. `tsnet` lets you run multiple services on the same device with different IP addresses, access control rules, and even user identities.
`tsnet` uses a [userspace](/docs/concepts/userspace-networking) TCP/IP networking stack.
Inside Tailscale, we built and constantly use tools on top of `tsnet`. `tsnet` powers our internal URL shortener [golink](https://github.com/tailscale/golink). It powers the support tooling that our support team uses daily to help you resolve problems. Without `tsnet`, our Tailscale-enabled tools would be far more difficult to create and maintain.
Externally, people have used `tsnet` to provide metrics, deliver administrative endpoints, and create other functionality. For examples, visit the Go [`tsnet` known importers](https://pkg.go.dev/tailscale.com/tsnet?tab=importedby) page.
## [Include `tsnet` in your program](#include-tsnet-in-your-program)
Run the following command to add `tsnet` to your dependencies and make it available for use in your Go program:
```
`go get tailscale.com/tsnet
`
```
In your Go program, add the `tailscale.com/tsnet` package to the list of imports:
```
`package main
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
## [Make calls with `tsnet.Server`](#make-calls-with-tsnetserver)
The [`tsnet.Server`](/docs/reference/tsnet-server-api) object provides the entry point for your program to connect with other devices in your tailnet. Initialize `tsnet.Server` by specifying an address to listen on and a hostname for the device that will be created.
```
`var (
addr = flag.String("addr", ":80", "address to listen on")
hostname = flag.String("hostname", "tshello", "hostname to use in the tailnet")
)
func main() {
flag.Parse()
srv := new(tsnet.Server)
srv.Addr = \*addr
srv.Hostname = \*hostname
if err := srv.Start(); err != nil {
log.Fatalf("can't start tsnet server: %v", err)
}
defer srv.Close()
// Use the tsnet.Server object to interact with your tailnet
...
}
`
```
## [Device creation and authentication](#device-creation-and-authentication)
If you are not using an [auth key](/docs/features/access-control/auth-keys), or [trust credentials](/docs/reference/trust-credentials), the call to the [`Server.Start`](/docs/reference/tsnet-server-api#serverstart) function will result in creation and display of a Tailscale authentication URL. Use the URL to log in to Tailscale, same as you would for other devices in your tailnet. If [device approval](/docs/features/access-control/device-management/device-approval) is enabled for the tailnet, a tailnet admin will need to [approve the device](/docs/features/access-control/device-management/device-approval#approve-devices-from-the-admin-console).
As an alternative to logging in by using a Tailscale authentication URL, you can use an auth key as part of your `tsnet.Server` initialization. This lets you [pre-approve a device](/docs/features/access-control/device-management/device-approval#pre-approve-devices-with-an-auth-key).
The authentication process can occur even if `Server.Start` itself is not directly called in your code, because some `Server` functions will implicitly call `Server.Start`if it has not yet been called.
## [Additional information](#additional-information)
* For more information about the `tsnet.Server` functions, refer to [`tsnet.Server`](/docs/reference/tsnet-server-api).
* For a complete example that uses `tsnet`, refer to [Hello tsnet](/docs/features/tsnet/how-to/create-basic-tsnet-app).
* For a complete example that uses `Server.ListenService` and `ServiceModeHTTP` with Tailscale Services, refer to [`tsnet` and Tailscale Services](/docs/features/tsnet/how-to/register-service).
On this page
* [Overview](#overview)
* [Include tsnet in your program](#include-tsnet-in-your-program)
* [Make calls with tsnet.Server](#make-calls-with-tsnetserver)
* [Device creation and authentication](#device-creation-and-authentication)
* [Additional information](#additional-information)
Scroll to top