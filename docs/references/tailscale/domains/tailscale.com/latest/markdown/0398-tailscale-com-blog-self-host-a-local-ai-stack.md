Self-host a local AI stack and access it from anywhere
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsMay 29, 2025
# Self-host a local AI stack and access it from anywhere
Lately, I’ve been obsessed with running AI locally. Not because it’s trendy, but because it’s finally practical and, more importantly, private. With new local models like Llama 4, Gemma 3, and DeepSeek, it’s now possible to both use cutting-edge LLMs while staying in complete control of your data. There’s a one-time, upfront hardware cost, but after that, there are no monthly fees, and zero worries about where your prompts and data are going.
So, in this video, I walk you through setting up your own offline AI lab using a few of my favorite building blocks: Proxmox for virtualization, NixOS for repeatability, Docker for packaging, and Tailscale for secure access from anywhere. We’ll wire up an NVIDIA A4000 GPU to a NixOS VM via PCIe passthrough, set up Ollama and Open WebUI, and get chatting with local large language models all entirely within your Tailnet.
You don’t need to be a Linux wizard to follow along, though you will need compatible hardware for passthrough (including the right BIOS and CPU support). But once that’s sorted, we build a fully declarative NixOS VM that’s got everything: Docker, NVIDIA drivers, Tailscale, and more. You’ll end up with what I’m calling your “AI Basecamp”—a lightweight, reproducible launchpad for self-hosted models.
The magic sauce here is Ollama, which abstracts away a lot of the complexity of working with LLMs locally. Combine it with Open WebUI, and you’ve got a slick front end that behaves a lot like ChatGPT, only it’s running entirely on your box. With Tailscale Serve, you can access it securely from anywhere on your Tailnet (including connected phones and tablets), complete with TLS and no reverse proxy configuration required.
After that, I show how to wire this whole thing up with Ansible for easy reuse and automation, including how to drop in secrets like Tailscale auth keys into your deployment safely. It’s a bit opinionated, sure, but it’s fast and tidy.
By the end, you’ll have a system that can run LLMs, fully offline. You can use it for Home Assistant integrations, code generation, or even share access with friends and family using Tailscale’s node sharing features. Imagine splitting the cost of a good GPU with your friends and everyone getting private AI access from anywhere. That’s the kind of networked future I want to live in.
The video above has the full walkthrough, and as always, all the code and configs are linked in the description over on GitHub.
Share
Author
Alex Kretzschmar
Author
Alex Kretzschmar
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