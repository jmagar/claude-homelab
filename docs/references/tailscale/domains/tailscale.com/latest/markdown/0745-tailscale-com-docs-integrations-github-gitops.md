GitOps for Tailscale with GitHub Actions · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# GitOps for Tailscale with GitHub Actions
Last validated: Dec 5, 2025
[Access control policies](/docs/features/access-control) define what users or devices are permitted to access in your Tailscale network (known as a tailnet). An alternative to managing the access control policy changes in the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console is to use [GitOps](/docs/gitops) to manage the access control policy changes. This topic provides details on how to use [GitHub Actions](https://github.com/features/actions) to automatically apply and test access control policy changes to your tailnet.
GitOps for Tailscale is available for [all plans](/pricing).
## [Prerequisites](#prerequisites)
In addition to already having your own Tailscale network, you need:
* A GitHub account.
* Working knowledge of GitHub, including committing changes, creating and merging pull requests.
* A private GitHub repository that will contain your tailnet policy file.
Make sure this repository is private, as tailnet policy files contain personally identifiable information (PII), such as your users' email addresses.
* A Tailscale [API access token](/docs/reference/tailscale-api) or [OAuth client](/docs/features/oauth-clients) for your tailnet. You can create an API access token in the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console, or you can create an OAuth client in the [Trust credentials](https://login.tailscale.com/admin/settings/trust-credentials) page of the admin console. If you use an OAuth client, the client needs the `policy\_file:read` scope to be able to read and validate the tailnet policy file, or the `policy\_file` scope to be able to read, validate, and modify the tailnet policy file. For information about other scopes that are required when using the `policy\_file:read` or the `policy\_file` scopes, refer to the [trust credentials scopes](/docs/reference/trust-credentials#scopes) documentation.
## [GitHub Action to sync Tailscale access control policies](#github-action-to-sync-tailscale-access-control-policies)
Tailscale publishes a GitHub Action to [Sync Tailscale access control policies](https://github.com/marketplace/actions/sync-tailscale-acls), available in the GitHub Actions Marketplace.
You do not need to use this GitHub Action to set up a GitOps pattern — you can also write your own Action or use another CI/CD tool.
### [What this action does](#what-this-action-does)
On **pull requests** that target the `main` branch, the `Test ACL` step (action `test`) will send your tailnet policy file to Tailscale to determine whether the access control policy is valid and whether all [tests](/docs/reference/syntax/policy-file#tests) pass. Tailscale will provide your workflow with the result of those checks.
On **push** (merge) operations that target the `main` branch, the `Deploy ACL` step (action `apply`) will again check access control policy validity and run tests, with Tailscale reporting back the results to your workflow. If the tests succeed, the merge will complete and the workflow will automatically apply your access control policy changes to your tailnet. If the tests fail, an error will prevent the merge from continuing.
You can refer to the status of the workflow in the GitHub user interface's **Actions** tab for your pull request. Look for a workflow with the name you used in `.github/workflows/tailscale.yml`, **Tailscale ACL syncing**.
### [Inputs](#inputs)
The following inputs apply to the Sync Tailscale ACLs action.
* `action` (Required): One of `test` or `apply`. If `test`, the action will run [ACL tests](/docs/reference/syntax/policy-file#tests) only—it won't update your ACLs in Tailscale. If `apply`, the action will run ACL tests and, if the ACL tests succeed, then update your ACLs in Tailscale. This enables you to use pull requests to make changes, with CI preventing you from pushing a bad change out to production.
* `api-key` or `oauth-client-id`/`oauth-secret` (Required): A credential to allow the action to interact with your tailnet. You may use an `api-key` or an `oauth-client-id` and `oauth-secret`. You can create an API access token in the [Keys](https://login.tailscale.com/admin/settings/keys)
page of the admin console, or you can create an OAuth client in the [Trust credentials](https://login.tailscale.com/admin/settings/trust-credentials) page of the admin console.
* `policy-file` (Optional): The path to your tailnet policy file in the repository. If not set this defaults to `policy.hujson` in the root of your repository.
* `tailnet` (Required): This is your organization, which you can find in the [General](https://login.tailscale.com/admin/settings/general) settings page of the admin console.
## [Set up your GitOps configuration](#set-up-your-gitops-configuration)
1. In your GitHub repository, create a file named `policy.hujson`. Copy your tailnet policy file contents from the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console into this file.
If you want to change the tailnet policy file name to something else, you will need to add the `policy-file` argument to the `with` blocks in your GitHub Actions configuration discussed below. Otherwise, the GitHub action will default to `policy.hujson` as the tailnet policy file.
2. Commit the tailnet policy file and push it to GitHub. For example, if you are using the command line:
```
`git add .
git commit -sm "policy: import from admin console"
git push -u origin main
`
```
3. Create the following [GitHub Actions secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) in your repository's settings:
You may either supply Tailscale OAuth client credentials or a Tailscale API key. If you supply both, the OAuth credentials will be used.
* `TS\_TAILNET`: Use your tailnet ID as the value. You can find your tailnet ID in the [General](https://login.tailscale.com/admin/settings/general) page of the admin console.
* `TS\_OAUTH\_ID`: Use your Tailscale OAuth client ID as the value.
* `TS\_OAUTH\_SECRET`: Use your Tailscale OAuth client secret as the value.
* `TS\_API\_KEY`: Use your Tailscale API access token as the value.
These secrets provide the configuration for the action.
* Make a new GitHub Actions workflow that uses the [Sync Tailscale ACLs](https://github.com/marketplace/actions/sync-tailscale-acls) GitHub Action.
[API key](/docs/integrations/github/gitops?tab=api+key)[OAuth client](/docs/integrations/github/gitops?tab=oauth+client)
Create a file named `.github/workflows/tailscale.yml`. Paste in the following YAML:
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
If you don't use the name `main` for your default branch, update the `branches` fields in the YAML.
This workflow appropriately uses the `secrets.TS\_API\_KEY` and `secrets.TS\_TAILNET` environment variables to access your secrets.
Do not place your actual secret *values* in `.github/workflows/tailscale.yml`—use the environment values as depicted in the example.
For an example repository that has set up this workflow, see [`https://github.com/cetacean/tailscale-acls`](https://github.com/cetacean/tailscale-acls).
* Commit and push `.github/workflows/tailscale.yml`.
The main steps in the action are installing [gitops-pusher](https://github.com/tailscale/tailscale/tree/main/cmd/gitops-pusher), setting the correct environment variables and flags, and then running the workflow. For more information, refer to [GitHub Action configuration](https://github.com/tailscale/gitops-acl-action/blob/main/action.yml).
With this setup, you have created a continuous integration (CI) that automatically tests and pushes your tailnet policy file changes to Tailscale!
* Follow the instructions to [prevent others from accidentally modifying your tailnet policy file](#prevent-others-from-accidentally-modifying-your-tailnet-policy-file) in the admin console.
## [Push changes to your tailnet policy file](#push-changes-to-your-tailnet-policy-file)
Now that your configuration has been set up, any time your want to update your ACL, modify the tailnet policy file in your repository and use the typical GitHub authoring/review/merge flow. You can check the status of the ACL validity checks and ACL tests in the GitHub UI in the **Actions** tab for your pull request. Look for a workflow with the name you used in `.github/workflows/tailscale.yml`, **Sync Tailscale ACLs**.
## [Prevent others from accidentally modifying your tailnet policy file](#prevent-others-from-accidentally-modifying-your-tailnet-policy-file)
On June 3, 2025, we [announced the deprecation](/changelog#2025-06-03) of the GitOps code comment technique for locking the policy file editor in the admin console. Tailnets that were using this method were automatically migrated to use the setting in the admin console. The code comment is no longer effective for locking the policy file editor.
To prevent other admins in your organization from accidentally changing your tailnet policy file, you can lock the editor in the [Policy file management](https://login.tailscale.com/admin/settings/policy-file-management) page in the Tailscale admin console.
You must be an [Owner, Admin, or Network admin](/docs/reference/user-roles) of a tailnet to update tailnet policy file settings.
1. Open the [Policy file management](https://login.tailscale.com/admin/settings/policy-file-management) page in the Tailscale admin console.
2. If it is not already enabled, select **Prevent edits in the admin console** to prevent editing of the file.
3. For **External reference**, enter the URL of your repository. This lets other admins to know where the source of your policies is located.
4. Select **Save**.
Any [admin with permissions to edit the tailnet policy file](/docs/reference/user-roles#permissions-managed-by-user-roles) can still edit it directly by selecting **Edit anyway**. This lets admins to quickly make changes in case of an emergency.
The next time you use the GitOps flow, it overwrites the tailnet policy file changes made in the admin console.
## [Revert the most recent change to your ACL](#revert-the-most-recent-change-to-your-acl)
If you need to revert the most recent change, use the GitHub UI to [revert the merged pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/reverting-a-pull-request).
## [Remove your GitOps configuration](#remove-your-gitops-configuration)
1. Open the [Policy file management](https://login.tailscale.com/admin/settings/policy-file-management) page in the Tailscale admin console and disable the **Prevent edits in the admin console** toggle.
2. Optionally, delete the **External reference link** and select **Save**.
3. [Revoke](/docs/features/access-control/auth-keys#revoke-an-auth-key) any associated Tailscale API access tokens for this configuration.
4. Archive or delete the associated GitHub repository.
## [Additional information](#additional-information)
* Any manual tailnet policy file changes in the admin console won't be reflected in your GitHub version of the tailnet policy file. The next time you use the Sync Tailscale ACLs GitHub Action, any changes made in the Tailscale admin console will be overwritten.
* Tailscale [API access tokens expire](/docs/reference/tailscale-api#authentication) and currently there is no mechanism to have them automatically renewed. To handle the expiration, create a new API access token and update the GitHub `TS\_API\_KEY` secret to use the new value.
Tailscale API access tokens expire after 90 days (or less if the key has a shorter expiry) but updating the GitHub secret monthly is a good practice.
When you no longer need to use a Tailscale API access token, make sure you revoke it in the [Keys](https://login.tailscale.com/admin/settings/keys) page
of the admin console.
* Tailscale tailnet policy files are in [HuJSON](https://nigeltao.github.io/blog/2021/json-with-commas-comments.html), a JSON format with trailing commas and comments. If you don't want to write your tailnet policy files in HuJSON directly, you can use a tool that lets you generate JSON in the same schema as the HuJSON format. Make sure your tool puts the file in the same place as the `policy-file` setting in the GitHub Action.
On this page
* [Prerequisites](#prerequisites)
* [GitHub Action to sync Tailscale access control policies](#github-action-to-sync-tailscale-access-control-policies)
* [What this action does](#what-this-action-does)
* [Inputs](#inputs)
* [Set up your GitOps configuration](#set-up-your-gitops-configuration)
* [Push changes to your tailnet policy file](#push-changes-to-your-tailnet-policy-file)
* [Prevent others from accidentally modifying your tailnet policy file](#prevent-others-from-accidentally-modifying-your-tailnet-policy-file)
* [Revert the most recent change to your ACL](#revert-the-most-recent-change-to-your-acl)
* [Remove your GitOps configuration](#remove-your-gitops-configuration)
* [Additional information](#additional-information)
Scroll to top