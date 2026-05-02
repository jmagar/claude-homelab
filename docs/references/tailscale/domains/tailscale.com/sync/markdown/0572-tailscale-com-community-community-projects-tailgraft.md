tailgraft
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Community Projects](/community/community-projects)/
tailgraft
By Tailscaletools
# tailgraft
tailgraft is a script that enables you to easily bake Tailscale into a Raspberry Pi OS image. After running tailgraft, you can image the OS to your Raspberry Pi, which will join your tailnet on first boot with Tailscale SSH enabled. That means you can access it from any device on your tailnet without having to handle key exchange or locating the device on your local network.
The script takes advantage of a configuration tool called `cloud-init`, which is more commonly used in establishing default settings for newly provisioned cloud machines. `cloud-init` is available on the Ubuntu Raspberry Pi image, so tailgraft can use it to install and configure Tailscale.
## Related links
* [Blog post: Grafting Tailscale onto the Pi](https://tailscale.dev/blog/tailgraft)
### Project information
* [ View on GitHub](https://github.com/tailscale-dev/tailgraft)
* 99 stars
* 4 forks
## More projects
Loading...