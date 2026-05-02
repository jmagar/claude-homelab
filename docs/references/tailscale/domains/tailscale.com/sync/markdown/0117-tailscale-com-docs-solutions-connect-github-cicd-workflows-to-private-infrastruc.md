Connect GitHub CI/CD workflows to private infrastructure without public exposure · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Connect GitHub CI/CD workflows to private infrastructure without public exposure
Last validated: Jan 23, 2026
Continuous integration and continuous development (CI/CD) pipelines, such as [GitHub Actions](https://docs.github.com/en/actions) workflows, often need to access private infrastructure including databases, internal APIs, and Kubernetes clusters. Traditional approaches force you into security compromises around the choice to use public infrastructure (GitHub-hosted runners) or maintain your own infrastructure (self-hosted runners). Hosted runners offer flexibility and zero maintenance, but risk exposing internal services and creating vulnerabilities. [Self-hosted runners](https://docs.github.com/en/actions/concepts/runners/self-hosted-runners) increase security but remove the benefits of GitHub's managed infrastructure and add operational overhead.
You can have the low-maintenance of GitHub-hosted runners and the security of self-hosted runners (with no need to [create complicated setups](https://docs.github.com/en/actions/concepts/runners/private-networking)) by using Tailscale to secure runner access to your private infrastructure. The Tailscale GitHub action creates ephemeral, authenticated connections that expire shortly after workflow execution. Your private resources remain unexposed while GitHub's hosted runners connect securely through your Tailscale network (known as a tailnet).
In this guide, you'll implement secure CI/CD patterns using Tailscale's [OAuth clients](/docs/features/oauth-clients), the [Tailscale GitHub Action](/docs/integrations/github/github-action), and the [`tsnet` library](/docs/features/tsnet). You'll build a demonstration app called `tshello` that proves GitHub runners can access internal services and authenticate connecting users through Tailscale's [identity](/docs/concepts/tailscale-identity) layer. The patterns you establish extend directly to production scenarios, including database migrations, API testing, and Kubernetes deployments, without exposing services or managing persistent credentials.
## [Prerequisites](#prerequisites)
Before you begin this guide you'll need:
* A [Tailscale account](/start) with [Owner, Admin, or Network admin](/docs/reference/user-roles) privileges.
* A local device with Go 1.23 or later installed for creating and testing the demonstration app. The instructions in this guide assume the device is Unix-based (such as macOS or Linux).
* A device running in your Tailscale network (known as a tailnet) to test connectivity with the [runner](https://docs.github.com/en/actions/concepts/runners).
* A GitHub repository for which you have [collaborator permissions](https://docs.github.com/en/account-and-profile/reference/permission-levels-for-a-personal-account-repository).
* Basic familiarity with [GitHub Actions workflow syntax](https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-syntax), [Tailscale tags](/docs/features/tags), [Go syntax](https://go.dev/ref/spec), and [Go tests](https://go.dev/doc/tutorial/add-a-test).
## [Step 1: Create identity and access controls for workflow runners](#step-1-create-identity-and-access-controls-for-workflow-runners)
Start by creating an identity for the workflow runners. You'll use this identity to authenticate the [ephemeral nodes](/docs/features/ephemeral-nodes) that the runners use and apply [access controls](/docs/features/access-control) that restrict what resources the runners can access.
Do this by editing your [tailnet policy file](/docs/features/tailnet-policy-file) to define ownership of the `tag:ci` tag through the `tagOwners` section and create access rules using the `grants` section.
The tag ownership section defines the tag and which users can apply it to devices while the grants determine what resources tagged devices can access.
Open the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console. If you haven't customized your policy file before, it exhibits the default configuration. You'll add new sections while preserving any existing rules. You can edit the tailnet policy file using the JSON editor or the visual editor.
### [Option 1: Use the JSON editor](#option-1-use-the-json-editor)
To use the JSON editor, select **JSON editor** at the top of the [Access controls](https://login.tailscale.com/admin/acls) page.
First, define the tag owner for the CI runners. Locate the `tagOwners` section or create it if it doesn't exist. Add the `ci` tag with an empty owner. By default, [Owners, Admins, and Network admins](/docs/reference/user-roles) can apply tags without explicit ownership.
```
`"tagOwners": {
"tag:ci": [], // No owners, so Owners, Admins, and Network admins can apply the tag
// Other tag definitions
}
`
```
[Owners, Admins, and Network admins](/docs/reference/user-roles) can manually tag devices with `tag:ci` if needed.
Next, create access rules for the CI runners. In the `grants` section, add rules that define what your GitHub runners can access. Start with a basic rule that lets CI runners to communicate with all devices in your tailnet:
```
`"grants": [
{
"src": ["tag:ci"],
"dst": ["\*"],
"ip": ["\*"]
},
// Other access rules
]
`
```
This grant lets devices using the `tag:ci` identity access any other devices. This is a lenient policy for demonstration only. Do not use this access control policy in production environments.
For production environments, you should restrict access further. Here's an example that limits CI runners to specific resources:
```
`"grants": [
{
"src": ["tag:ci"],
"dst": ["tag:prod-db"],
"ip": ["5432"]
},
{
"src": ["tag:ci"],
"dst": ["tag:staging-api"],
"ip": ["443", "8080"]
},
// Other access rules
]
`
```
These example grants let CI runners access PostgreSQL databases tagged with `tag:prod-db` on port `5432` and staging APIs tagged with `tag:staging-api` on ports `443` and `8080`. Adjust these rules based on your infrastructure and security requirements.
Save your policy file changes. The admin console validates the syntax and applies the new rules immediately.
### [Option 2: Use the visual editor](#option-2-use-the-visual-editor)
To use the visual editor, select **Visual editor** at the top of the [Access controls](https://login.tailscale.com/admin/acls) page.
Select the **Tags** tab, then **Create tag**.
Set the tag name to `ci` and add a note explaining what the tag is for (CI/CD runners). You don't need specify any owners here; leave the owner list empty. By default, [Owners, Admins, and Network admins](/docs/reference/user-roles) can apply tags without explicit ownership.
Then, select **Save tag**.
Next, create access rules for your CI runners.
Select the **General access rules** tab, then **Add rule**.
Set the source to `tag:ci`, the destination to **All users and devices**, and the port and protocol to **All ports and protocols**. Optionally, add a note to explain what the access rule is for. Then, select **Save grant**.
This grant lets devices using the `tag:ci` identity access any other devices.
This is a lenient policy for demonstration only. Do not use this access control policy in production environments.
You've set up the appropriate permissions for your tailnet. Next you'll use the `ci` tag you created to configure a Tailscale OAuth client to create on-demand authentication for your workflow.
## [Step 2: Create an OAuth client for ephemeral access](#step-2-create-an-oauth-client-for-ephemeral-access)
Before creating the GitHub Action workflow, you need to configure a [Tailscale OAuth client](/docs/features/oauth-clients) that generates ephemeral auth keys on demand. These auth keys let the GitHub runners join your tailnet as [ephemeral nodes](/docs/features/ephemeral-nodes) tagged with `tag:ci`. Each workflow run gets a unique auth key that expires shortly after job completion. This approach eliminates the need to manage long-lived credentials or manually clean up unused devices.
Go to the [Trust credentials](https://login.tailscale.com/admin/settings/trust-credentials) page of the admin console. Select **Create OAuth client** and configure it with the following settings.
For the description field, enter a meaningful name like "GitHub Actions CI/CD". This helps identify the client's purpose when reviewing access logs or managing multiple OAuth clients.
Under **OAuth client scopes**, select the checkbox for **Devices** with **Write** permissions. This scope lets the OAuth client create **auth keys** that can register new devices (your GitHub runners) to your tailnet. The write permission is essential for the runners to join the tailnet.
The **Devices** scope with write permissions can create auth keys that add devices to your tailnet. Protect the OAuth client ID and client secret as you would any other sensitive credential. Store them only in GitHub's encrypted secrets (and a password manager), never in your repository code.
In the tags field, add the `tag:ci` tag you created earlier. [Tags](/docs/features/tags) identify non-human devices in your tailnet and enable you to create specific access policies for CI/CD runners. You'll define ownership of this tag in your tailnet policy file in the next step.
Select **Create OAuth client**. The admin console displays your OAuth client ID and client secret. Copy both values immediately because you can't access the secret again. If you lose the secret, you'll need to generate a new one from the OAuth client's settings page.
Now, store these credentials as [secrets in your GitHub repository](https://docs.github.com/en/actions). Go to your repository on GitHub and go to **Settings** \> **Secrets and variables** \> **Actions**. Create two new repository secrets. Name the first secret `TS\_OAUTH\_CLIENT\_ID` and paste your OAuth client ID. Name the second secret `TS\_OAUTH\_SECRET` and paste your OAuth client secret.
Your OAuth client is now ready to authenticate GitHub Actions workflows. Each workflow run will use these credentials to generate a unique, single-use auth key.
Next, you'll create an auth key that the Go test will use to verify connectivity.
## [Step 3: Create an auth key for the Go test](#step-3-create-an-auth-key-for-the-go-test)
For the Tailscale connectivity test (that you'll create in a later step) to work, you must create a reusable [auth key](/docs/features/access-control/auth-keys) and use it to define the `TS\_AUTHKEY` environment variable locally and in the GitHub repository secrets. The connectivity test part of the Go test you will create in a later step will use this auth key.
1. Open the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console.
2. Select Generate auth key.
3. Give the auth key a description to help you remember what it's for.
4. Enable **Reusable**.
5. Keep the expiration at 90 days.
6. Enable **Ephemeral**.
7. Enable **Tags**, then add the `tag:ci` tag you created earlier.
8. Select **Generate key**.
Save the auth key to a safe location where you can retrieve it later. You won't be able to access it again, and you'll need it to run the Go test you'll create later.
Next, add the auth key as a [secret in your GitHub repository](https://docs.github.com/en/actions). Go to your repository on GitHub and go to **Settings** \> **Secrets and variables** \> **Actions**. Create a new repository secret and name the secret `TS\_AUTHKEY` and paste your auth key.
You've created an auth key for the Go test. Next, you'll create a basic `tsnet` app that the test will verify.
You've created your auth keys. Now you'll build a demo app you'll use to test your workflow.
## [Step 4: Create a basic `tsnet` app](#step-4-create-a-basic-tsnet-app)
For demonstration purposes, let's create a basic "Hello, world!" Go application that uses `tsnet`. The [`tsnet` library](/docs/features/tsnet) lets you embed Tailscale functionality inside a Go program. For more detailed steps, refer to the instructions in [Hello `tsnet`](/docs/features/tsnet/how-to/create-basic-tsnet-app#create-a-tsnet-hello-world-program).
Create a new directory for the `tshello` app:
```
`mkdir tshello
cd tshello
`
```
Start the Go module:
```
`go mod init tshello
go get tailscale.com/tsnet
`
```
Create a file named `tshello.go`. This code is from the [Hello `tsnet`](/docs/features/tsnet/how-to/create-basic-tsnet-app#create-a-tsnet-hello-world-program) guide. Visit that guide for a detailed explanation of how the code works.
Start with the package declaration and import statements. The imports include standard Go libraries for networking, HTTP operations, and TLS, along with the Tailscale `tsnet` package.
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
`
```
Define a command-line flag for the server address. This lets you specify which port the server listens on, defaulting to port `80`.
```
`var (
addr = flag.String("addr", ":80", "address to listen on")
)
`
```
The main function parses command-line flags and initializes the `tsnet` server. The server creates a TCP listener and obtains a local client for interacting with the Tailscale network.
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
lc, err := srv.LocalClient()
if err != nil {
log.Fatal(err)
}
`
```
When the server listens on port `443`, wrap the listener with TLS using Tailscale's automatic certificate provisioning. This provides HTTPS without manual certificate management.
```
` if \*addr == ":443" {
ln = tls.NewListener(ln, &tls.Config{
GetCertificate: lc.GetCertificate,
})
}
`
```
The HTTP handler uses the `WhoIs` API to identify connecting clients through Tailscale's authentication. This demonstrates how the app can verify user identity without implementing separate authentication logic.
```
` log.Fatal(http.Serve(ln, http.HandlerFunc(func(w http.ResponseWriter, r \*http.Request) {
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
`
```
Add a helper function that extracts the first label from a domain name. This utility function helps format the device name in the HTTP response.
```
`func firstLabel(s string) string {
s, \_, \_ = strings.Cut(s, ".")
return s
}
`
```
This application creates a `tsnet` server that joins your tailnet with the hostname "`tshello`". The HTTP handler identifies connecting users through [Tailscale's `WhoIs` API](https://pkg.go.dev/tailscale.com@v1.88.1/client/local#Client.WhoIs), demonstrating that the app can authenticate connections through your tailnet's identity layer.
Install the required dependencies:
```
`go mod tidy
`
```
The `go mod tidy` command downloads the `tsnet` library and its dependencies. Your `go.mod` file now includes the exact versions of all required packages.
Test the app locally to make sure it compiles and runs:
```
`go build -o tshello
./tshello -addr tshello
`
```
The app starts and attempts to join your tailnet. If you're not already authenticated with Tailscale on your local device, it prompts you to authenticate. Follow the instructions to authenticate.
After you connect, the app displays its [Tailscale IP address](/docs/concepts/tailscale-ip-addresses). You can access it from any device on your tailnet using the hostname you specified or the tailnet IP address.
Stop the local test with `CTRL+C`. Your demonstration app is ready for automated testing in GitHub Actions.
Before continuing, initialize Git and link the local repository to your GitHub repository:
```
`git init
git remote add origin https://github.com/\<username\>/\<repository-name\>.git
git commit -m "Init tshello app"
git push -u origin main
`
```
You manually verified the program, but now you'll create a test that ensures it works. You'll eventually run this test within your GitHub action.
You have a basic `tsnet` app that joins your tailnet. Next, you'll create a Go test that verifies the app can communicate over Tailscale.
You can access the complete code for the guide in the [tailscale-dev/secure-github-runners](https://github.com/tailscale-dev/secure-github-runners) repository on GitHub.
## [Step 5: Create a Go test](#step-5-create-a-go-test)
Next, you'll add a [Go test](https://go.dev/doc/tutorial/add-a-test) file with tests that verify your GitHub Actions runner can successfully communicate over the Tailscale network. These tests ensure the `tshello` app functions correctly and can identify connecting clients through Tailscale's authentication.
For this test to work, you need to have created an [auth key](/docs/features/access-control/auth-keys) and used it to define the `TS\_AUTHKEY` environment variable locally and in the GitHub repository secrets. If you skipped creating an auth key, the test will still run, but it will skip the Tailscale connectivity test.
Create a `.env` file and add the following to it (replacing the placeholder with your auth key):
```
`TS\_AUTHKEY=\<your-ts-auth-key\>
`
```
Create a Go test file named `tshello\_test.go`. The test file includes integration tests that verify Tailscale network connectivity and unit tests that validate code behavior without network access. The integration tests verify server initialization, HTTP client connectivity over the tailnet, and DNS resolution across peers.
Start by declaring the package and importing the necessary dependencies. The imports include standard Go libraries for testing, networking, and HTTP operations, along with the Tailscale `tsnet` package for creating ephemeral Tailscale nodes.
```
`package main
import (
"context"
"fmt"
"io"
"net"
"net/http"
"os"
"strings"
"testing"
"time"
"tailscale.com/tsnet"
)
`
```
The `tsnet` package provides the core functionality for creating temporary Tailscale devices (ephemeral nodes) that join your tailnet during test execution. The standard library packages handle HTTP operations, context management, and network operations.
The first test function verifies the `tshello` server can initialize correctly, create a listener, and shut down gracefully. This test creates a temporary `tsnet` server, starts an HTTP server, and validates the startup process.
```
`func TestTshelloServer(t \*testing.T) {
if testing.Short() {
t.Skip("skipping test in short mode")
}
ctx, cancel := context.WithTimeout(context.Background(), 2\*time.Minute)
defer cancel()
srv := &tsnet.Server{
Hostname: "tshello-test",
Dir: t.TempDir(),
}
defer srv.Close()
ln, err := srv.Listen("tcp", ":0")
if err != nil {
t.Fatalf("failed to listen: %v", err)
}
defer ln.Close()
lc, err := srv.LocalClient()
if err != nil {
t.Fatalf("failed to get local client: %v", err)
}
serverURL := fmt.Sprintf("http://%s", ln.Addr().String())
t.Logf("Test server listening on %s", serverURL)
httpServer := &http.Server{
Handler: http.HandlerFunc(func(w http.ResponseWriter, r \*http.Request) {
who, err := lc.WhoIs(r.Context(), r.RemoteAddr)
if err != nil {
http.Error(w, err.Error(), 500)
return
}
fmt.Fprintf(w, "Hello, %s!", who.UserProfile.LoginName)
}),
}
errCh := make(chan error, 1)
go func() {
errCh \<- httpServer.Serve(ln)
}()
select {
case \<-ctx.Done():
t.Fatal("test timed out waiting for server to start")
case err := \<-errCh:
if err != nil && err != http.ErrServerClosed {
t.Fatalf("server error: %v", err)
}
case \<-time.After(5 \* time.Second):
t.Log("Server started successfully")
}
if err := httpServer.Shutdown(ctx); err != nil {
t.Logf("server shutdown error: %v", err)
}
}
`
```
This test uses a temporary directory for the `tsnet` server state and verifies that the HTTP handler can identify connecting clients using Tailscale's authentication information. The test passes if the server starts successfully and shuts down cleanly within the timeout period.
The next test function creates a `tsnet` client and attempts to connect to running `tshello` instances over the tailnet. This integration test requires a valid auth key and attempts to reach both test and production servers.
```
`func TestTshelloHTTPClient(t \*testing.T) {
if testing.Short() {
t.Skip("skipping test in short mode")
}
authKey := os.Getenv("TS\_AUTHKEY")
if authKey == "" {
t.Skip("TS\_AUTHKEY not set, skipping Tailscale connectivity test")
}
ctx, cancel := context.WithTimeout(context.Background(), 2\*time.Minute)
defer cancel()
srv := &tsnet.Server{
Hostname: "tshello-client-test",
Dir: t.TempDir(),
AuthKey: authKey,
}
defer srv.Close()
if err := srv.Start(); err != nil {
t.Fatalf("failed to start tsnet: %v", err)
}
httpClient := srv.HTTPClient()
targets := []string{
"tshello-test",
"tshello",
}
for \_, target := range targets {
t.Run(fmt.Sprintf("ping\_%s", target), func(t \*testing.T) {
url := fmt.Sprintf("http://%s/", target)
req, err := http.NewRequestWithContext(ctx, "GET", url, nil)
if err != nil {
t.Skipf("failed to create request for %s: %v", target, err)
return
}
resp, err := httpClient.Do(req)
if err != nil {
if strings.Contains(err.Error(), "no such host") ||
strings.Contains(err.Error(), "connection refused") ||
strings.Contains(err.Error(), "timeout") {
t.Skipf("target %s not available: %v", target, err)
return
}
t.Errorf("failed to connect to %s: %v", target, err)
return
}
defer resp.Body.Close()
body, err := io.ReadAll(resp.Body)
if err != nil {
t.Errorf("failed to read response from %s: %v", target, err)
return
}
t.Logf("Response from %s (status %d): %s", target, resp.StatusCode, string(body))
if resp.StatusCode != http.StatusOK {
t.Errorf("unexpected status code from %s: %d", target, resp.StatusCode)
}
})
}
}
`
```
The test creates sub tests for each target hostname and gracefully skips targets that aren't available. When running locally without other devices in the tailnet, the test skips unavailable targets. In the GitHub Actions environment, the test connects to the runner's `tshello` instance.
Add another test function that verifies DNS lookups work correctly for peers in your tailnet. This test retrieves the list of peers from the Tailscale status and attempts to resolve each peer's hostname.
```
`func TestTshelloDNSResolution(t \*testing.T) {
if testing.Short() {
t.Skip("skipping test in short mode")
}
authKey := os.Getenv("TS\_AUTHKEY")
if authKey == "" {
t.Skip("TS\_AUTHKEY not set, skipping DNS test")
}
ctx, cancel := context.WithTimeout(context.Background(), 1\*time.Minute)
defer cancel()
srv := &tsnet.Server{
Hostname: "tshello-dns-test",
Dir: t.TempDir(),
AuthKey: authKey,
}
defer srv.Close()
if err := srv.Start(); err != nil {
t.Fatalf("failed to start tsnet: %v", err)
}
lc, err := srv.LocalClient()
if err != nil {
t.Fatalf("failed to get local client: %v", err)
}
status, err := lc.Status(ctx)
if err != nil {
t.Fatalf("failed to get status: %v", err)
}
t.Logf("Current node: %s", status.Self.HostName)
t.Logf("Tailnet name: %s", status.CurrentTailnet.Name)
t.Logf("Number of peers: %d", len(status.Peer))
for \_, peer := range status.Peer {
t.Logf("Peer: %s (%s)", peer.HostName, peer.TailscaleIPs[0])
ips, err := net.LookupIP(peer.HostName)
if err != nil {
t.Logf("Failed to resolve %s: %v", peer.HostName, err)
continue
}
for \_, ip := range ips {
t.Logf(" Resolved IP: %s", ip)
}
}
}
`
```
The test logs information about the current device, the tailnet name, and each device in the tailnet. It attempts DNS resolution for each tailnet device and logs the results, helping you verify that MagicDNS is working correctly in your test environment.
Finally, add a unit test for the `firstLabel` utility function that extracts the first label from a domain name. This test validates the function works correctly with various input formats.
```
`func TestFirstLabel(t \*testing.T) {
tests := []struct {
input string
expected string
}{
{"example.com", "example"},
{"sub.example.com", "sub"},
{"localhost", "localhost"},
{"", ""},
{"single", "single"},
}
for \_, tt := range tests {
t.Run(tt.input, func(t \*testing.T) {
result := firstLabel(tt.input)
if result != tt.expected {
t.Errorf("firstLabel(%q) = %q, want %q", tt.input, result, tt.expected)
}
})
}
}
`
```
This table-driven test creates sub tests for each input case and verifies the function produces the expected output. The unit test runs without requiring network access or authentication.
Load the auth key from the `.env` file:
```
`export $(cat .env | xargs)
`
```
Run the tests locally to verify they work:
```
`go test -v
`
```
The unit test passes. The integration test doesn't run unless you have a `tshello` instance running in your tailnet. This behavior is intentional because the integration test will run successfully in your GitHub Actions workflow when the runner joins your tailnet.
Commit and push your changes to your GitHub repository:
```
`git add .
git commit -m "Add tshello test"
git push -u origin main
`
```
You now have a unit test and integration test. You're ready to run them on GitHub as part of an action.
You can access the complete code for the guide in the [tailscale-dev/secure-github-runners](https://github.com/tailscale-dev/secure-github-runners) repository on GitHub.
## [Step 6: Create the GitHub Actions workflow](#step-6-create-the-github-actions-workflow)
Next, you'll create a [GitHub Actions workflow](https://docs.github.com/en/actions) that uses the [Tailscale GitHub Action](/docs/integrations/github/github-action) to connect your runner to your tailnet, build the `tshello` app, and verify connectivity. This workflow demonstrates the complete pattern for accessing private resources from continuous integration continuous development (CI/CD) pipelines.
Create the GitHub Actions workflow directory structure in your repository:
```
`mkdir -p .github/workflows
`
```
Create a YAML workflow file named `.github/workflows/\<name\>.yml`:
```
`touch .github/workflows/\<name\>.yml
`
```
Start by defining the workflow name and triggers. This configuration runs the workflow on pushes to the main branch, pull requests, and manual triggers through the GitHub Actions interface.
```
`name: Test tshello with Tailscale
on:
push:
branches: [ main ]
pull\_request:
branches: [ main ]
workflow\_dispatch:
`
```
Define the job and specify the runner. The workflow uses an Ubuntu runner provided by GitHub Actions.
```
`jobs:
test:
runs-on: ubuntu-latest
steps:
`
```
The first step checks out your repository code, making it available to subsequent steps in the workflow.
```
` - name: Checkout code
uses: actions/checkout@v4
`
```
The next step sets up Go with the specified version. This ensures the runner has the correct Go toolchain for building and testing your application.
```
` - name: Set up Go
uses: actions/setup-go@v5
with:
go-version: '1.23'
`
```
The [Tailscale GitHub Action](/docs/integrations/github/github-action) connects the runner to your tailnet. This step uses your OAuth credentials to authenticate and joins the runner as an [ephemeral node](/docs/features/ephemeral-nodes) tagged with `tag:ci`. The runner receives a Tailscale IP address and can resolve other devices through [MagicDNS](/docs/features/magicdns).
```
` - name: Connect to Tailscale
uses: tailscale/github-action@v4
with:
oauth-client-id: ${{ secrets.TS\_OAUTH\_CLIENT\_ID }}
oauth-secret: ${{ secrets.TS\_OAUTH\_SECRET }}
tags: tag:ci
version: latest
`
```
After connecting to Tailscale, build the `tshello` application. The build process downloads dependencies and compiles the code.
```
` - name: Build tshello
run: |
cd tshello
go mod download
go build -v ./...
`
```
Run the test suite with a timeout to prevent the tests from hanging if it encounters an issue. The tests verify that the application functions correctly and can communicate over the Tailscale network.
```
` - name: Run tests
run: |
cd tshello
go test -v -timeout 30s ./...
`
```
Verify the runner's Tailscale connection by checking its status and IP address. This step demonstrates that the runner successfully joined your tailnet and received a valid Tailscale IP address.
```
` - name: Test connectivity
run: |
# Test that we can reach the Tailscale network
tailscale status
# Show our IP address
tailscale ip -4
`
```
This workflow shows how the runner joins your tailnet as an ephemeral node with the `tag:ci` tag. The `tshello` app runs on the same runner, creating its own `tsnet` node that other devices on your tailnet can access.
Commit and push your workflow to GitHub:
```
`git add .
git commit -m "Add GitHub workflow"
git push origin main
`
```
In a web browser, go to the **Actions** tab in your GitHub repository to ensure the workflow is running. Select it to [monitor](https://docs.github.com/en/actions) the real-time logs as the runner connects to your tailnet, builds the `tshello` app, and runs the tests.
Your GitHub Actions workflow is now running with a secure connection to your tailnet. You can verify this connection and observe how ephemeral nodes behave in your infrastructure.
While your workflow runs, open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console and check to ensure a device with a name like `github-actions-runner` tagged with `tag:ci` exits. This is your ephemeral GitHub runner. The device shows as connected for the duration of the workflow, then automatically disappears when the job completes.
You can also review the workflow logs in GitHub Actions. The "Verify Tailscale connection" step shows the runner's Tailscale IP address and status. This IP address is from the `100.64.0.0/10` [CGNAT](/docs/concepts/tailscale-ip-addresses) range that Tailscale uses. Any device on your tailnet can reach this runner using this IP address during the workflow execution.
The "Test connectivity to `tshello`" step demonstrates that the `tsnet`-based app successfully joined your tailnet. The app receives its own [Tailscale identity](/docs/concepts/tailscale-identity) and can authenticate connecting clients. In a production scenario, this same pattern lets your services identify which CI runner or user is making requests.
Check the [Logs](https://login.tailscale.com/admin/logs) page of the admin console. Here, you can access audit entries for the OAuth client creating an auth key and the ephemeral node joining and leaving your tailnet. These logs provide a complete audit trail of all CI/CD access to your infrastructure.
The ephemeral nature of these connections provides security benefit because ephemeral nodes exist only during job execution, reducing the attack surface. Each job gets fresh credentials that can't be reused. There's no accumulation of stale devices in your tailnet because unused ephemeral nodes are automatically cleaned up. The automatic cleanup eliminates manual maintenance.
You've successfully created a secure GitHub Actions workflow that connects to your private infrastructure without exposing services to the internet. Next, you'll explore how to extend this pattern to production scenarios.
You can access the complete code for the guide in the [tailscale-dev/secure-github-runners](https://github.com/tailscale-dev/secure-github-runners) repository on GitHub.
## [Step 7: Extend, monitor, and optimize for production use cases](#step-7-extend-monitor-and-optimize-for-production-use-cases)
The `tshello` demonstration illustrates core capabilities that extend directly to production use cases. Your GitHub Actions workflows can now access any private resource on your tailnet using the same pattern.
For database migrations, your workflow can connect directly to PostgreSQL, MySQL, or MongoDB instances running on your tailnet. Replace the `tshello` test with actual migration commands:
```
`- name: Run database migrations
run: |
export DATABASE\_URL="postgresql://user:pass@prod-db.tail-scale.ts.net:5432/my-app"
npm run migrate:latest
npm run migrate:status
`
```
The database remains completely private with no internet-facing ports. The connection is encrypted and authenticated through Tailscale and your audit logs show exactly which workflow accessed the database and when.
For API testing, your integration tests can hit internal services that aren't exposed to the internet:
```
`- name: Run API integration tests
run: |
export API\_BASE\_URL="https://staging-api.tail-scale.ts.net"
npm test:integration
`
```
Your staging environment stays private while still being accessible for automated testing. The tests run with the same network access they'd have in production.
For Kubernetes deployments, you can use `kubectl` commands:
```
`- name: Deploy to Kubernetes
run: |
kubectl config set-cluster production --server=https://k8s-api.tail-scale.ts.net:6443
kubectl apply -f ./k8s/production/
kubectl rollout status deployment/my-app -n production
`
```
Your Kubernetes API server needs no public endpoint. The connection goes through your secure tailnet with full audit logging.
For pulling from private registries, Docker commands work without exposing your registry:
```
`- name: Build and push container
run: |
docker build -t registry.tail-scale.ts.net/my-app:${{ github.sha }} .
docker push registry.tail-scale.ts.net/my-app:${{ github.sha }}
`
```
Each of these scenarios follows the same pattern. Your workflow joins the tailnet, performs its operations with full access to private resources, then automatically disconnects. No manual cleanup, no lingering access, no exposed services.
Monitoring ephemeral nodes and optimizing workflow performance ensures your CI/CD pipelines run efficiently and securely. The Tailscale admin console provides visibility into all ephemeral connections, while strategic optimization reduces workflow execution time.
Monitor ephemeral nodes through the [Machines](https://login.tailscale.com/admin/machines) page during workflow execution. Each runner appears with its ephemeral status indicator and `tag:ci` label. The connection duration shows how long the workflow has been running. After job completion, these ephemeral nodes disappear automatically, keeping your machine list clean.
Review the authentication patterns in the [Logs](https://login.tailscale.com/admin/logs) page. Each workflow run generates log entries for auth key creation, node registration, and disconnection. Filter logs by the tag `tag:ci` to review all CI/CD activity. These logs help you understand usage patterns and troubleshoot connection issues.
Optimize workflow performance by [caching the Tailscale binary](/docs/integrations/github/github-action#cache-tailscale-binaries). The GitHub Action handles this automatically, but you can tune the behavior:
```
`- name: Connect to Tailscale
uses: tailscale/github-action@v4
with:
oauth-client-id: ${{ secrets.TS\_OAUTH\_CLIENT\_ID }}
oauth-secret: ${{ secrets.TS\_OAUTH\_SECRET }}
tags: tag:ci
version: '1.76.1' # Pin version for consistency
use-cache: 'true' # Enable caching
`
```
Pinning the Tailscale version ensures consistent behavior across workflow runs and maximizes cache hits, reducing download time.
For workflows that run multiple jobs needing Tailscale access, consider using [matrix strategies](https://docs.github.com/en/actions):
```
`strategy:
matrix:
service: [database, api, frontend]
jobs:
test:
runs-on: ubuntu-latest
steps:
- name: Connect to Tailscale
uses: tailscale/github-action@v4
with:
oauth-client-id: ${{ secrets.TS\_OAUTH\_CLIENT\_ID }}
oauth-secret: ${{ secrets.TS\_OAUTH\_SECRET }}
tags: tag:ci
- name: Test ${{ matrix.service }}
run: |
./test-${{ matrix.service }}.sh
`
```
Each matrix job gets its own ephemeral connection, allowing parallel testing against your private infrastructure.
## [Conclusion](#conclusion)
Your GitHub Actions workflows now securely access private infrastructure through temporary, authenticated Tailscale connections that exist only during job execution. You've eliminated public exposure of internal services while maintaining the simplicity of GitHub's hosted runners and removing the operational overhead of self-hosted infrastructure.
The `tshello` demonstration, while basic, proves powerful capabilities that extend to production scenarios. Database migrations execute from GitHub Actions without exposing database ports. API integration tests run against internal staging environments. Deployment scripts access on-premises resources securely. Multi-cloud architectures where GitHub Actions orchestrate resources across providers work seamlessly.
The pattern of ephemeral, tagged access provides a security model that scales with your infrastructure complexity. Each connection is authenticated, authorized, and audited. The automatic cleanup ensures no lingering access. Your security team gains complete visibility through audit logs while your development team maintains deployment velocity.
This foundation enables advanced patterns like [blue-green deployments](https://en.wikipedia.org/wiki/Blue–green_deployment) to private Kubernetes clusters, automated security scanning of internal services, performance testing against production-like environments, and compliance workflows that access regulated systems. Each use case follows the same secure pattern you've implemented here.
On this page
* [Prerequisites](#prerequisites)
* [Step 1: Create identity and access controls for workflow runners](#step-1-create-identity-and-access-controls-for-workflow-runners)
* [Option 1: Use the JSON editor](#option-1-use-the-json-editor)
* [Option 2: Use the visual editor](#option-2-use-the-visual-editor)
* [Step 2: Create an OAuth client for ephemeral access](#step-2-create-an-oauth-client-for-ephemeral-access)
* [Step 3: Create an auth key for the Go test](#step-3-create-an-auth-key-for-the-go-test)
* [Step 4: Create a basic tsnet app](#step-4-create-a-basic-tsnet-app)
* [Step 5: Create a Go test](#step-5-create-a-go-test)
* [Step 6: Create the GitHub Actions workflow](#step-6-create-the-github-actions-workflow)
* [Step 7: Extend, monitor, and optimize for production use cases](#step-7-extend-monitor-and-optimize-for-production-use-cases)
* [Conclusion](#conclusion)
Scroll to top