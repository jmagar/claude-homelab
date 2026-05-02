Sending Files with Taildrop
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|May 25, 2021
# Sending Files with Taildrop
Taildrop is a feature that makes it easy to send files between your personal devices on a Tailscale network. Unlike cloud-based file transfer services, Taildrop’s peer-to-peer design makes it well-suited for lots of kinds of files you might want to send:
This feature is in public alpha, with many planned improvements to the UX and capabilities. To try Taildrop today, you’ll need to [opt-in for your network](/kb/1106/taildrop#enabling-taildrop-for-your-network) and use Tailscale v1.8 or later.
#### Example: Securely transfer sensitive documents from your computer to mobile device for easier on-the-go access
Finding a way to transfer sensitive files (such as medical or tax documents) between your devices can be fairly involved. Cloud-based transfer or file storage solutions carry the security and vulnerability risks of having your documents accessible via the internet. Airdrop works without needing to upload anything to the internet, but only between Apple devices and only when they’re close to one another.
Taildrop provides an easy way to share your sensitive files between any of your devices. And no matter where your devices are, the files are sent over encrypted peer-to-peer connections. So, you’re guaranteed the only machines that will ever have access to the files during the transfer are the sending and receiving devices.
#### Example: Send family photos from your phone to your computer
Taildrop lets you share your photos cross-platform without needing to upload them anywhere.
#### Example: Share screenshots to your computer
Ever take screenshots or screen recordings but don’t actually need them on the device you captured them on? Here at Tailscale we take a lot of screenshots of our client apps during the development process that we then have to transfer to our computers so we can upload them to a desktop tool such as GitHub or Figma. Taildrop helps you quickly transfer these, so you can seamlessly switch back and forth between working on the sending and receiving devices.
#### Example: Transfer Google Photos albums to a personal photos server
On June 1st, Google Photos is [ending their unlimited free storage tier](https://www.news18.com/news/tech/google-photos-free-storage-is-ending-after-this-month-how-to-download-all-images-to-your-laptoppc-3730058.html). Unless you upgrade to one of their paid plans, if you surpass the free storage limit, your photos will automatically be compressed to lower quality. If you’re looking to transfer your photos out of Google Photos and to a personal media server, Taildrop may be able to help you out. The steps below describe how to move an album from Google Photos to a remote personal machine.
**Steps:**
1. From your computer’s browser, go to the Google Photos website and select an album.
2. In the top right corner, select the rightmost menu item and choose “Download all.”
3. This will download a zip file of the album to your computer. If this computer is the end destination that you want your photos on, you can stop here, no need to Taildrop.
4. But if you want to transfer your photos to a remote device (maybe a device you’ve dedicated as a media server), you can right click on the zip file and choose to share with Taildrop.
5. From the Taildrop modal, select your media server and the zip file will be transferred to that device.
6. After the transfer completes, you can delete the zip file from your original device.
Share
Author
Sonia Appasamy
Author
Sonia Appasamy
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