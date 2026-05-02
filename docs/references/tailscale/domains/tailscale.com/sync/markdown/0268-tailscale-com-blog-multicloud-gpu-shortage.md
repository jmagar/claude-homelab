Countering GPU shortages with multi-cloud setups
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsMarch 19, 2025
# Countering GPU shortages with multi-cloud setups
As the boom in AI technologies has progressed over the past few years, the reasons for [multi-cloud requirements](https://tailscale.com/use-cases/multi-cloud-networking) have evolved. Developers and teams on the cutting edge of that technology still have to worry about how to get access to the compute resources they need—and how to connect those resources with their existing infrastructure once they do.
Things are not quite as bleak on the GPU availability front as they were in stretches of the last two years, when cloud infrastructure buyers would routinely bump against caps on how many GPU-equipped VMs they could spin up. But global GPU demand continues to outstrip supply, and questions of cost have emerged alongside questions of access.
This was the subject of a webinar we hosted over the summer, “Bridging the GPU availability gap with Tailscale.” We’re revisiting it now because, while some of the model numbers may have changed, the core point has only gotten more relevant: teams with specific compute needs find they have to embrace multi-cloud or hybrid cloud solutions, and Tailscale helps simplify that story.
## [Why AI startups embrace multi-cloud solutions to access GPUs](#why-ai-startups-embrace-multi-cloud-solutions-to-access-gpus)
This is one of the reasons Tailscale has continued to be so [popular with AI startups](https://tailscale.com/blog/ai-normal). Their networking needs may not be unusual, but their specific requirements have led them to embrace multi-cloud setups that would otherwise be a challenge to maintain. These AI companies want to keep their focus on their core product, [not on the networking hurdles they face](https://tailscale.com/blog/infra-team-stays-small) in developing that product.
Two of the trends that Lee highlights in the webinar above have become even more pronounced in the months since.
* **Securing access to local LLMs**: For those who can get their hands on physical GPU chips, technology for local LLMs has never been more powerful. We hear this from dedicated teams of AI engineers and from individual developers who are experimenting with the latest tech. Essentially, they are applying this same multi-cloud logic to hybrid solutions that incorporate on-prem hardware.
* **Using Kubernetes to orchestrate AI workloads across cloud providers**: It really can’t be overstated how critical k8s has become for this kind of workload management. The constraints that legacy connectivity approaches impose on scalability have led teams to incorporate k8s into their workflows early. Tailscale plugs into that approach neatly, and we’ve seen a lot of uptake of [our Kubernetes operator](https://tailscale.com/kb/1236/kubernetes-operator).
Expanding on that last point: If there is an upside to the ongoing GPU shortages, it’s that lots of teams have been nudged into adopting flexible solutions that abstract away as much of the underlying infrastructure layer as possible to create uniform connectivity.
Combining [Infrastructure-as-Code tools like Terraform](https://tailscale.com/kb/1210/terraform-provider) with software like Tailscale, Kubernetes may have been something that teams adopted to address the particular problem at hand here. But it will come in handy the next time those teams are facing a bottleneck in some resource or looking to optimize their cloud spend.
And if you’re part of an AI startup that doesn’t want to spend precious time drawing up network architectures just to enable GPU access, check out [our AI startup program](https://tailscale.com/ai-startup-program).
Share
Author
Parker Higgins
Author
Parker Higgins
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