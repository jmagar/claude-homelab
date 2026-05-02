Automate and Secure Access Control with GitHub Actions
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|September 02, 2022
# GitOps for Tailscale ACLs
Tailscale lets you manage access permissions within a tailnet, including which users are allowed to connect to which machines, using powerful [Access Control Lists (ACLs)](/kb/1018/acls/). ACLs are controlled by a HuJSON tailnet policy file that you can edit directly in the admin console. This makes managing permissions simple, but unlike other controls defined in code, there is no way to require approval or review before accepting changes made to ACLs directly in Tailscale’s admin console. In the industry, there’s a pattern called [GitOps](https://opengitops.dev/) that suggests you should maintain anything that defines your infrastructure, like this policy file, in a Git repository and use CI to validate, test, and automatically deploy changes.
In this post, I’m going to cover how you can set up a GitOps workflow for your tailnet policy file with [GitHub Actions](https://github.com/features/actions) so you can maintain ACLs in a central repository, apply the same controls for changes to your configuration file as you do for code (“config as code”)— such as requiring review, and how to automatically apply these configuration changes to your network.
**To make this easier, we’ve released a [Sync Tailscale ACLs GitHub Action](https://github.com/marketplace/actions/sync-tailscale-acls) you can use for automatically updating your tailnet policy file from GitHub**. If you’re using this action, or another GitOps workflow you’ve built yourself, you can surface it in the [Access Controls page of the admin console](https://login.tailscale.com/admin/acls) to prevent colleagues from accidentally making unapproved changes.
When using GitOps, a warning is shown in the admin console.
### Set up an automated workflow with GitHub Actions
To get started, you’ll need to create a new GitHub repository for your tailnet policy file. This should be a private repository, as you are going to have personally identifiable information such as users’ email addresses in it. I’ve created the policy file for my personal tailnet in [cetacean/tailscale-acls](https://github.com/cetacean/tailscale-acls) if you need an example of what this repository should look like.
If you don’t want to write things in the [HuJSON](https://nigeltao.github.io/blog/2021/json-with-commas-comments.html) (JSON with trailing commas and comments) format directly, you can use a tool that lets you generate JSON to the same schema as the HuJSON format. Just make sure your tool puts the file in the same place as the `policy-file` setting in the GitHub Action.
In your repo, create a file named `policy.hujson` and copy your ACL from the [admin console](https://login.tailscale.com/admin/acls) into it. Once you’ve copied that in, commit the policy file and push it to GitHub.
If you want to change the policy file name to something else, you will need to add the `policy-file` argument to the `with` blocks in your GitHub Actions config. Otherwise, it will default to `policy.hujson`.
```
`$ git add .
$ git commit -sm "policy: import from admin console"
$ git push -u origin main
`
```
Next, create two GitHub Actions secrets in that repository’s settings:
1. `TS\_API\_KEY`—put your [Tailscale API key](/kb/1101/api/) here
2. `TS\_TAILNET`—put your organization here (`[example.com](https://example.com/)`, `myemail@example.com`, `example.github`, or `example.org.github`).
You can find your organization in the [Settings](https://login.tailscale.com/admin/settings/) page of the admin console.
These will act as the configuration for the action. Next, create your own GitHub Actions workflow in `.github/workflows/tailscale.yml` and have it use the [Sync Tailscale ACLs action in GitHub Actions marketplace](https://github.com/marketplace/actions/sync-tailscale-acls). Copy the following YAML to your Action:
```
`name: Sync Tailscale ACLs
on:
push:
branches: [ "main" ]
pull\_request:
branches: [ "main" ]
jobs:
acls:
runs-on: ubuntu-latest
steps:
- uses: actions/checkout@v3
- name: Fetch old version info
id: fetch-old-version
uses: actions/cache@v3
with:
path: .
key: version-cache.json
- name: Deploy ACL
if: github.event\_name == 'push'
id: deploy-acl
uses: tailscale/gitops-acl-action@v1
with:
api-key: ${{ secrets.TS\_API\_KEY }}
tailnet: ${{ secrets.TS\_TAILNET }}
action: apply
- name: Test ACL
if: github.event\_name == 'pull\_request'
id: test-acl
uses: tailscale/gitops-acl-action@v1
with:
api-key: ${{ secrets.TS\_API\_KEY }}
tailnet: ${{ secrets.TS\_TAILNET }}
action: test
`
```
The same setup should transfer to other CI systems easily. The main thing you need to do is install [`gitops-pusher`](https://github.com/tailscale/tailscale/tree/main/cmd/gitops-pusher), set the correct environment variables and flags, then run it. See [the GitHub Action configuration](https://github.com/tailscale/gitops-acl-action/blob/main/action.yml) for what you need to do.
This workflow will push the tailnet policy file to Tailscale on commits to the `main` branch, and it ensures that all ACLs are valid (and all ACL tests pass) when running on pull requests that target the `main` branch. If you don’t use the name `main` for your default branch, change it here as appropriate. When you apply this workflow, `gitops-pusher` will automatically run ACL tests for pull requests and apply ACL changes on commits that are merged to the default branch.
Use the Sync Tailscale ACLs GitHub Action to run ACL tests as part of a pull request before merging changes to your tailnet policy file.
[See the documentation](/kb/1204/gitops-acls/) to set up this workflow.
### Warn users in the admin console that you’re using a GitOps workflow
If you’re using a GitOps workflow, then you want to have a single source of truth for your ACLs — in this case, the tailnet policy file you’re keeping in Git.
To prevent users from accidentally overwriting your ACLs or from making unauthorized changes, you can include a specific comment in your tailnet policy file to indicate that you’re using a GitOps workflow:
```
`// This tailnet’s ACLs are maintained in https://github.com/cetacean/tailscale-acls
`
```
Tailscale’s admin console will display a warning to users, pointing them to where your ACLs are managed. This comment also applies to any other workflow you’re using to manage your tailnet policy file — not just Tailscale’s GitHub Action. However, we understand that there may be a need for emergency changes, so users can still edit ACLs if necessary. (If your users are able to edit ACLs, but they shouldn’t be, consider [changing user roles](/kb/1171/changing-user-roles/), e.g., to [IT admin or Auditor](/kb/1138/user-roles/).)
When using GitOps, a warning in the admin console prevent you from accidentally editing your tailnet policy file. You can still edit the file, such as in an emergency.
With this setup, you can create a GitOps workflow for your Tailscale ACLs. As implemented, there’s one clear shortcoming: Tailscale API keys expire every 90 days, and there is currently no mechanism to have them renew automatically. We’re working on this, but it’s not ready yet. For now, you will need to have an admin create a new API key regularly, and update the GitHub secret accordingly.
If you run into any trouble setting this up, please get in touch! If you haven’t had any trouble setting this up, also please get in touch! Ping us on Twitter [@Tailscale](https://twitter.com/Tailscale) or let us know on [the forum](https://forum.tailscale.com/). We’re happy to make things that make your life easier.
Share
Author
Xe Iaso
Author
Xe Iaso
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