How to remotely access NAS with Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|June 09, 2021
# How to access your NAS drive remotely
Network-Attached Storage devices (NAS) are a great way to store and share large amounts of data. Using a NAS allows multiple users and multiple devices to be able to read and write to the same stored data. Inside a secure local network, it is flexible, reliable and safe.
But what if your users aren’t actually on the same local network? As the trend towards remote work continues, increasing the flexibility and portability of your data has big benefits, but also comes with security risks.
There are options out there for sharing data between networks, but finding one that is also encrypted and simple to set up is a challenge. Security is crucial, whether your NAS stores business-critical data, personal creative work, or your media library.
A common suggestion is to open a TCP/IP connection over a FireWire port. It’s simple, but it’s a risky idea. Assigning a public IP address to your NAS exposes everything on it to potential attackers, who have tools to scan for exactly this kind of vulnerability. Any weak passwords, missed patches, or personal data will be available to anyone looking for it.
Meanwhile, the traditionally secure approach of setting up a VPN is time-consuming and challenging. Even an experienced network administrator might spend a week or two setting up a personal VPN, so for individuals or businesses without an IT staff, it’s a daunting option.
Tailscale offers the best of both worlds through network attached storage remote access. Using Tailscale, you can quickly set up an encrypted pathway between your NAS for any user you authorize, and on any device they choose, wherever they are.
## What is a NAS?
A NAS, or Network Attached Storage device, is a network-enabled evolution of the external harddrive. You might have used an external harddrive to store music to play through your desktop computer 20 years ago. You could plug it in to a different computer, but only one at a time.
Now, with a NAS drive, users have greater flexibility and scale. A NAS drive can store movies and watch them on any device on your home network, or provide access to large data sets to every machine in your office simultaneously. Compared to the old external harddrive, the volume of data you can store is greater, and the retrieval times are faster. A NAS can be optimized for the primary type of data it serves, making it more reliable and leaner than a desktop computer.
But while a NAS drive is much more flexible than the old external harddrive, by default it is only accessible within a local network. The next step is to make that same data available anywhere, regardless of what network you are connected to.
## Why access your NAS drive remotely?
You want to be able to access your data from any device, any time, anywhere—not only from devices connected to a local network. Remote work is increasingly the norm, and the progress in technology to facilitate it is continuing.
Making the data on your NAS drive more portable is an obvious step down that path, and there are a lot of potential use cases. Secure, stable, flexible data storage is useful for remote workers, business travelers, digital nomads, creative collaborators, digital artists, and many others.
For all of these users, though, security is equally important to flexibility. You want to achieve remote access nas storage from any device, but ONLY the devices you permit.
## What are the different options for NAS remote access?
The common options for NAS remote access fall into two categories.
First, there are low-config web-based solutions that offer some flexibility with some major trade-offs.
Some of the recommended choices aren’t NAS options at all. Google Drive, Windows OneDrive, and similar cloud storage solutions do offer easy remote access and good security, but storing significant amounts of data can be expensive and you are handing custody of your data over to another company. As you pay for more storage, you don’t receive any better service, either. The servers are optimized for storage, not retrieval, and likely have a lot of functionality you don’t need.
DropBox and its competitors have less unnecessary functionality than Google Drive, but are still not optimized for media. These services are really intended for file backup and storage, not for frequent read-write access, and they can be clunky and slow for larger file types.
A remote desktop client allows you to keep custody of your own data, but you are limited to what is stored on a single desktop computer. A remote desktop connection isn’t optimized to serve data, either, so it can be very slow.
The most popular recommended method to connect to NAS drives is very risky. It’s relatively simple to enable FTP or WebDAV on your NAS device, enable a TCP/IP connection, and get a dynamically assigned IP address from a DNS service. There are minor concerns—the cost of the DNS, and potential complications with maintaining permissions for different User accounts on your NAS. But the bigger issue is that this method is extremely insecure. By opening a discoverable TCP/IP connection, you expose all the data on your NAS to the public web. For any business use—and for most personal uses, too—that’s an unacceptable risk.
The second option is to set up a VPN, or virtual private network. A VPN is highly performant and highly secure, taking that risk out of the equation without compromising functionality. But VPNs can be very complicated to set up.
For most individuals—and even many cost-conscious businesses—traditional VPNs are not a practical solution. An experienced person might spend a week or more finding necessary components, installing software, setting up appropriate connections and permissions—a daunting and costly task for anyone without a dedicated IT professional to manage the process.
Tailscale is changing the game by combining the state-of-the-art encryption and performance of VPNs with zero-config setup that anyone can manage.
A Tailscale VPN is highly secure, performant, and flexible, and about as easy to set up as a new shared calendar. Tailscale makes it possible for anyone to have the benefits of a professional-quality VPN without the headache or cost of traditional setup.
## How to access NAS remotely with Tailscale
Tailscale is a zero-config VPN. Setting it up is as easy as installing an app and logging in. Follow the step by step or long form instructions to learn how to connect to NAS drives remotely.
### Instructions
1. Create a Tailscale account
2. Download and install Tailscale on devices
3. Log in to Tailscale on devices
4. Verify your connection by pinging the server
Begin the process by creating a [Tailscale account](https://login.tailscale.com/start) using your Google or Microsoft account or another [supported SSO identity provider](/kb/1013/sso-providers/). Note that, for now, if you want to [invite collaborators](/kb/1064/invite-team-members/), you will need to have a shared email domain.
[Download Tailscale](/download) and install it on the device you plan to use to access NAS remotely. Log in with the SSO account you used to register.
After signing in, you can test your connection by pinging [our test server](/kb/1073/hello-ipn-dev), which is a part of every new Tailscale network. Open your terminal and type:
```
`ping 100.101.102.103
`
```
If your ping works — congrats, you’re connected via Tailscale!
You’ll want to install Tailscale on the other devices you plan to use, including your NAS, and spend some time exploring your new network, but once you are logged in on both ends, you are ready to go! With that simple setup done, Tailscale encrypts all traffic between your devices, and offers smooth, secure data delivery wherever you are.
Share
Author
Laura Franzese
Author
Laura Franzese
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