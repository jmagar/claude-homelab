GitOps for Tailscale with GitLab CI · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# GitOps for Tailscale with GitLab CI
Last validated: Dec 4, 2025
[Access control policies](/docs/features/access-control) define what users or devices are permitted to access in your Tailscale network (known as a tailnet). An alternative to managing the access control policy changes in the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console is to use [GitOps for Tailscale](/docs/gitops) to manage the access control policy changes. This topic provides details on how to use [GitLab CI/CD](https://docs.gitlab.com/ee/ci) to automatically apply and test access control policy changes to your tailnet.
GitOps for Tailscale is available for [all plans](/pricing).
## [Prerequisites](#prerequisites)
In addition to already having your own Tailscale network, you need:
* A GitLab account.
* Working knowledge of GitLab procedures including committing changes, creating merge requests, and merging requests.
* A private GitLab repository that will contain your tailnet policy file.
Make sure this repository is private, as tailnet policy files contain personally identifiable information (PII), such as users email addresses.
* A Tailscale [API access token](/docs/reference/tailscale-api) for your tailnet. You can create an API access token in the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console.
## [GitLab CI file to sync Tailscale access control policies](#gitlab-ci-file-to-sync-tailscale-access-control-policies)
Tailscale publishes a GitLab CI Template to [Sync Tailscale access control policies](https://gitlab.com/tailscale-dev/gitops-acl-ci), available to include in your own CI file.
You do not need to use this GitLab CI Template to set up a GitOps pattern — you can also write your own or use another CI/CD tool.
### [What this template does](#what-this-template-does)
On merge requests that target the `main` branch, the `test` stage will send your tailnet policy file to Tailscale to determine whether the ACL is valid and whether all [tests](/docs/reference/syntax/policy-file#tests) pass. Tailscale will provide your workflow with the result of those checks.
On push (merge) operations that target the `main` branch, the `apply` stage will again check access control policy validity and run tests, with Tailscale reporting back the results to your workflow. If the tests succeed, the merge will complete and the workflow will automatically apply your access control policy changes to your tailnet. If the tests fail, an error will prevent the merge from continuing.
You can refer to the status of the workflow in the GitLab CI/CD tab for your project. Look for a job with the name `test` or `apply`.
### [Inputs](#inputs)
The following inputs apply to the Sync Tailscale ACLs CI.
* **`api-key`** (Required): An [API access token](/docs/reference/tailscale-api) authorized for your tailnet. You can create an API access token in the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console.
* **`policy-file`** (Optional): The path to your tailnet policy file in the repository. If not set this defaults to `policy.hujson` in the root of your repository.
* **`tailnet`** (Required): This is your organization, which you can find in the [General](https://login.tailscale.com/admin/settings/general) settings page of the admin console.
## [Set up your GitOps configuration](#set-up-your-gitops-configuration)
1. In your GitLab repository, create a file named `policy.hujson`. Copy your tailnet policy file contents from the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console into this file.
If you want to change the tailnet policy file name to something else, you will need to add the `policy-file` argument to the `with` blocks in your GitLab CI configuration discussed below. Otherwise, the template will default to `policy.hujson` as the tailnet policy file.
2. Commit the tailnet policy file and push it to GitLab. For example, if you are using the command line:
```
`git add .
git commit -sm "policy: import from admin console"
git push -u origin main
`
```
3. Create the following [GitLab CI secrets](https://docs.gitlab.com/ee/ci/variables) in your repository's settings:
* `TS\_API\_KEY`: Use your Tailscale API access token as the value.
* `TS\_TAILNET`: Use your tailnet ID as the value. You can find your tailnet ID in the [General](https://login.tailscale.com/admin/settings/general) page of the admin console.
These secrets provide the configuration for the CI Job. For both of these secrets, within the GitLab CI secrets UI, enable the **Expand variable reference** option. For more information about GitLab CI environment variable expansion, refer to [GitLab CI/CD variables](https://docs.gitlab.com/ee/ci/variables).
* Make a new GitLab CI job that uses the [Sync Tailscale ACLs](https://gitlab.com/tailscale-dev/gitops-acl-ci) template.
Create a file named `.gitlab-ci.yml` and paste in the following:
```
`include:
- project: 'tailscale-dev/gitops-acl-ci'
ref: main
file: 'acls.gitlab-ci.yaml'
inputs:
api-key: $TS\_API\_KEY
tailnet: $TS\_TAILNET
stages:
- test
- apply
test:
rules:
- if: '$CI\_PIPELINE\_SOURCE == "merge\_request\_event" && $CI\_MERGE\_REQUEST\_TARGET\_BRANCH\_NAME == $CI\_DEFAULT\_BRANCH'
apply:
rules:
- if: '$CI\_PIPELINE\_SOURCE == "push" && $CI\_COMMIT\_BRANCH == $CI\_DEFAULT\_BRANCH'
`
```
This workflow appropriately uses the `TS\_API\_KEY` and `TS\_TAILNET` environment variables to access your secrets.
Do not place your actual secret *values* in `.gitlab-ci.yml`—use the environment values as depicted in the example.
For an example that has set up this workflow, refer to the [GitLab CI to Sync Tailscale ACLs](https://gitlab.com/tailscale-dev/gitops-acl-ci) repository.
* Commit and push `.gitlab-ci.yml`.
* Follow the instructions to [prevent others from accidentally modifying your tailnet policy file](#prevent-others-from-accidentally-modifying-your-tailnet-policy-file) in the admin console.
The main steps in the CI are installing [gitops-pusher](https://github.com/tailscale/tailscale/tree/main/cmd/gitops-pusher),
setting the correct environment variables and flags, and then running the workflow. For more information, refer to [GitLab CI Template](https://gitlab.com/tailscale-dev/gitops-acl-ci/-/blob/main/acls.gitlab-ci.yaml).
With this setup, you have created a continuous integration (CI) that automatically tests and pushes your tailnet policy file changes to
Tailscale!
## [Push changes to your tailnet policy file](#push-changes-to-your-tailnet-policy-file)
Now that your configuration has been set up, any time your want to update your tailnet policy file, modify the tailnet policy file in your repository and use the typical GitLab authoring/review/merge flow. You can check the status of the access control policy validity checks and tests in the GitLab UI in the **Actions** tab for your pull request. Look for a job with the names `test` or `apply`.
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
## [Revert the most recent change to your tailnet policy file](#revert-the-most-recent-change-to-your-tailnet-policy-file)
If you need to revert the most recent change, use the GitLab UI to [revert the merged pull request](https://docs.gitlab.com/ee/user/project/merge_requests/revert_changes.html).
## [Remove your GitOps configuration](#remove-your-gitops-configuration)
1. Open the [Policy file management](https://login.tailscale.com/admin/settings/policy-file-management) page in the Tailscale admin console and disable the **Prevent edits in the admin console** toggle.
2. Optionally, delete the **External reference link** and select **Save**.
3. [Revoke](/docs/features/access-control/auth-keys#revoke-an-auth-key) any associated Tailscale API access tokens for this configuration.
4. Archive or delete the associated GitLab repository.
## [Additional information](#additional-information)
* Any manual tailnet policy file changes in the admin console won't be reflected in your GitLab version of the tailnet policy file. The next time you use the Sync Tailscale ACLs GitLab CI, any changes made in the Tailscale admin console will be overwritten.
* Tailscale [API access tokens expire](/docs/reference/tailscale-api#authentication) and currently there is no mechanism to have them automatically renewed. To handle the expiration, create a new API access token and update the GitLab `TS\_API\_KEY` secret to use the new value.
Tailscale API access tokens expire after 90 days (or less if the key has a shorter expiry) but updating the GitLab secret monthly is a good practice.
When you no longer need to use a Tailscale API access token, make sure you revoke it in the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console.
* Tailscale tailnet policy files are in [HuJSON](https://nigeltao.github.io/blog/2021/json-with-commas-comments.html), a JSON format with trailing commas and comments. If you don't want to write your tailnet policy files in HuJSON directly, you can use a tool that lets you generate JSON in the same schema as the HuJSON format. Make sure your tool puts the file in the same place as the `policy-file` setting in the GitLab CI.
On this page
* [Prerequisites](#prerequisites)
* [GitLab CI file to sync Tailscale access control policies](#gitlab-ci-file-to-sync-tailscale-access-control-policies)
* [What this template does](#what-this-template-does)
* [Inputs](#inputs)
* [Set up your GitOps configuration](#set-up-your-gitops-configuration)
* [Push changes to your tailnet policy file](#push-changes-to-your-tailnet-policy-file)
* [Prevent others from accidentally modifying your tailnet policy file](#prevent-others-from-accidentally-modifying-your-tailnet-policy-file)
* [Revert the most recent change to your tailnet policy file](#revert-the-most-recent-change-to-your-tailnet-policy-file)
* [Remove your GitOps configuration](#remove-your-gitops-configuration)
* [Additional information](#additional-information)
Scroll to top