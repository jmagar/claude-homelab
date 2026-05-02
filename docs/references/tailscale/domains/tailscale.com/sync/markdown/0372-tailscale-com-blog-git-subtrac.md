Introducing git-subtrac: all your git submodules in one place
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|November 09, 2019
# Introducing git-subtrac: all your git submodules in one place
Long ago, I wrote [git-subtree](https://github.com/git/git/blob/master/contrib/subtree/git-subtree.txt) to work around some of my annoyances with git submodules. I’ve learned a lot since then, and the development ecosystem has improved a lot (shell scripts are no longer the best way to manipulate git repos? Whoa!).
Thus, I bring you: [git-subtrac](https://github.com/apenwarr/git-subtrac).
It’s a bit like git-subtree, except it uses real git submodules. The difference from plain submodules is that, like git-subtree, it encourages you to put all the contents from all your submodules into your superproject repo, rather than scattering it around across multiple repositories (which might be owned by multiple people, randomly disappear or get rebased, etc).
As a result, it’s easy to push, pull, fork, merge, and rebase your entire project no matter how many submodules you like to use. When someone does a ‘fetch’ of your repo, they get all the submodule repos as well.
I wrote a longer [git-subtrac README](https://github.com/apenwarr/git-subtrac/blob/main/README.md) describing how to use it and its internal workings. I think it’s pretty cool. Feedback is welcome.
Share
Author
Avery Pennarun
Author
Avery Pennarun
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