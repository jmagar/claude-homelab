Host a website using a tailnet device · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Host a website using a tailnet device
Last validated: Jan 5, 2026
This topic provides details about serving a website from a Tailscale device that is only accessible to other users in a Tailscale network (known as a tailnet) using [Tailscale Serve](/docs/features/tailscale-serve). Alternatively, you can use the instructions below to host a website that is accessible to the public internet, using [Tailscale Funnel](/docs/features/tailscale-funnel).
## [Prerequisites](#prerequisites)
* You need a [Tailscale account](/docs/how-to/quickstart).
* You need to [install Tailscale on your local machine](/download).
We recommend serving your files and website using a Linux VM. You can attempt this on macOS. However, due to the sandboxed nature of the operating system, you may encounter errors.
Here are instructions for creating various cloud-based Linux VMs and setting up Tailscale on your VM:
* [Create a Linux VM on Azure](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-portal?tabs=ubuntu)
* [Create a Linux VM on AWS](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html)
* [Create a Linux VM on GCP](https://cloud.google.com/compute/docs/create-linux-vm-instance)
After your Linux VM is created, you must also [install Tailscale on your Linux VM](/docs/install/linux).
## [Serve your files and website](#serve-your-files-and-website)
1. Start by creating a file named `index.html` on your local machine for testing. Here is an example of HTML code that you can use in your file:
```
`\<!DOCTYPE html\>
\<html\>
\<head\>
\<title\>Test Website\</title\>
\</head\>
\<body\>
\<h1\>This is a heading\</h1\>
\<p\>This is a paragraph\</p\>
\</body\>
\</html\>
`
```
2. Create a `/tmp` directory and a subdirectory on your local machine below the root directory:
```
`mkdir /tmp
mkdir /tmp/test-funnel
`
```
3. Move the `index.html` file you created into the `/tmp/test-funnel` subdirectory that you created in the previous step. In this example, the current location of the file is `/home/amelie`:
```
`mv /home/amelie/index.html /tmp/test-funnel
`
```
4. Run the following command on your machine to serve the `index.html` file to your tailnet:
```
`tailscale serve /tmp/test-funnel/index.html
`
```
Or, if you want to make the same files and website visible on the public internet, use the following command:
```
`tailscale funnel /tmp/test-funnel/index.html
`
```
## [Share your website](#share-your-website)
You can now share the website URL by combining your tailnet machine name and the name of your tailnet. The machine name can be found in the [Machines](https://login.tailscale.com/admin/machines) page of the admin console, and the tailnet DNS name can be found in the [DNS](https://login.tailscale.com/admin/dns) page of the admin console.
If your tailnet machine name is `amelie-vm`, and your tailnet DNS name is `pango-lin.ts.net`, share the URL:
`https://amelie-vm.pango-lin.ts.net`
On this page
* [Prerequisites](#prerequisites)
* [Serve your files and website](#serve-your-files-and-website)
* [Share your website](#share-your-website)
Scroll to top