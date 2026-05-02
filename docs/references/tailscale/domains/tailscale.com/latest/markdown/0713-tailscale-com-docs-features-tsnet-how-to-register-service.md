Register a tsnet application as a Tailscale Service · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Register a tsnet application as a Tailscale Service
Last validated: Jan 27, 2026
## [Introduction](#introduction)
In this guide you will use the [`tsnet`](/docs/features/tsnet) package to register an application as a [Tailscale Service](/docs/features/tailscale-services) host. This pattern can be applied to other `tsnet` applications.
The example code for this demo is available in the [`tailscale/tailscale` repository](https://github.com/tailscale/tailscale/blob/v1.94.1/tsnet/example/tsnet-services/tsnet-services.go).
## [Prerequisites](#prerequisites)
Before you begin this guide you'll need the following:
* The [Go compiler toolchain](https://go.dev/dl).
* A terminal window (command prompt).
* An active tailnet.
* One or more devices running Tailscale v1.86.0 or later.
* [Owner, Admin, or Network admin](/docs/reference/user-roles) account permissions.
## [Step 1: Update your tailnet policy file](#step-1-update-your-tailnet-policy-file)
Add `tagOwners`, `autoApprovers`, and `grants` to your tailnet policy file.
### [Create a tag](#create-a-tag)
Use the Tailscale admin console to create a [Tailscale tag](/docs/features/tags).
1. Open the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Tags** pane.
3. Select **Create tag**.
4. Add the **Tag name**.
```
`tsnet-demo-host
`
```
5. Add the **Tag owner**.
```
`autogroup:member
`
```
6. Select **Save**.
### [Define a service](#define-a-service)
Use the Tailscale admin console to add a Tailscale Service.
1. Open the [Services](https://login.tailscale.com/admin/services) page of the admin console.
2. Select the **Advertised** pane.
3. Select **Define Service**.
4. Add the **Service name**.
```
`tsnet-demo
`
```
5. Add the **Ports**.
```
`443
`
```
6. Select **Define Service**.
For the purposes of this example, the Service will not require a tag.
### [Define auto approval](#define-auto-approval)
Use the Tailscale admin console to add auto approval.
1. Open the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Auto approvers** pane.
3. Select the **Select service** dropdown and choose the example service.
```
`svc:tsnet-demo
`
```
4. Select the **Service can automatically accept devices** dropdown and choose the example tag.
```
`tag:tsnet-demo-host
`
```
5. Select **Save service auto approver**.
### [Define grants](#define-grants)
Use the Tailscale admin console to add grants.
1. Open the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **General access rule** pane.
3. Select **Add rule**.
4. Add **All users and devices** for **Source**.
5. Add the example service for **Destination**.
```
`svc:tsnet-demo
`
```
6. Add \*\*All ports and protocols" for **Port and protocol**.
7. Select **Save grant**.
### [Example tailnet policy file](#example-tailnet-policy-file)
At this point, your policy file should include:
```
`"tagOwners": {
"tag:tsnet-demo-host": ["autogroup:member"],
},
"autoApprovers": {
"services": {
"svc:tsnet-demo": ["tag:tsnet-demo-host"],
},
},
"grants": [
"src": ["\*"],
"dst": ["svc:tsnet-demo"],
"ip": ["\*"],
],
`
```
## [Step 2: Generate an auth key](#step-2-generate-an-auth-key)
Use the Tailscale admin console to [generate an auth key](/docs/features/access-control/auth-keys#generate-an-auth-key).
1. Open the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console.
2. Select **Generate auth key**.
3. Enable **Tags**.
4. Select **Add tags** and choose the example tag.
5. Select **Generate key**.
6. Copy the auth key to your clipboard for use later.
7. Select **Done**.
Open a command terminal and save the auth key as an environment variable.
```
`export TS\_AUTHKEY=\<your-authkey\>
`
```
## [Step 3: Use the `tsnet` package](#step-3-use-the-tsnet-package)
1. Open your text editor.
2. Create a `tsnet-services.go` file:
```
`package main
import (
"flag"
"fmt"
"log"
"net/http"
"tailscale.com/tsnet"
)
var (
svcName = flag.String("service", "", "the name of your Service, e.g. svc:tsnet-demo")
)
func main() {
flag.Parse()
if \*svcName == "" {
log.Fatal("a Service name must be provided")
}
s := &tsnet.Server{
Hostname: "tsnet-services-demo",
}
defer s.Close()
ln, err := s.ListenService(\*svcName, tsnet.ServiceModeHTTP{
HTTPS: true,
Port: 443,
})
if err != nil {
log.Fatal(err)
}
defer ln.Close()
log.Printf("Listening on https://%v\\n", ln.FQDN)
err = http.Serve(ln, http.HandlerFunc(func(w http.ResponseWriter, r \*http.Request) {
fmt.Fprintln(w, "\<html\>\<body\>\<h1\>Hello, tailnet!\</h1\>")
}))
log.Fatal(err)
}
`
```
In this example program, you will create a `tsnet.Server` instance with the hostname `tsnet-services-demo`. This server acts as a virtual node on your tailnet. The program instructs the node to listen for HTTPS connections to a Service on port `443`. The listener uses the `tsnet` package's [`ListenService`](/docs/reference/tsnet-server-api#serverlistenservice) and `ServiceModeHTTP`. The program also uses the Go standard library's `net/http` package to run an HTTP server on top of the listener. When other nodes on the tailnet connect to the Service, those connections will be routed to the virtual node defined by this program.
## [Step 4: Run the program](#step-4-run-the-program)
1. Run the command:
```
`go run tsnet-services.go --service=svc:tsnet-demo
`
```
## [Step 5: Connect to the application](#step-5-connect-to-the-application)
1. Visit the example server:
```
`open https://tsnet-demo.\<your-tailnet-DNS-name\>
`
```
For more information about tailnet DNS names, refer to [tailnet name](/docs/concepts/tailnet-name#tailnet-dns-name).
## [Conclusion](#conclusion)
This pattern can be applied to other `tsnet` applications as Tailscale Services hosts.
On this page
* [Introduction](#introduction)
* [Prerequisites](#prerequisites)
* [Step 1: Update your tailnet policy file](#step-1-update-your-tailnet-policy-file)
* [Create a tag](#create-a-tag)
* [Define a service](#define-a-service)
* [Define auto approval](#define-auto-approval)
* [Define grants](#define-grants)
* [Example tailnet policy file](#example-tailnet-policy-file)
* [Step 2: Generate an auth key](#step-2-generate-an-auth-key)
* [Step 3: Use the tsnet package](#step-3-use-the-tsnet-package)
* [Step 4: Run the program](#step-4-run-the-program)
* [Step 5: Connect to the application](#step-5-connect-to-the-application)
* [Conclusion](#conclusion)
Scroll to top