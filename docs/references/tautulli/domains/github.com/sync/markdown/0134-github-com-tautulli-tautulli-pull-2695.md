Bump pyopenssl from 26.0.0 to 26.1.0 by dependabot[bot] · Pull Request #2695 · Tautulli/Tautulli · GitHub
[Skip to content](#start-of-content)
{{ message }}
[
Tautulli
](/Tautulli)
/
**
[Tautulli](/Tautulli/Tautulli)
**
Public
*
* [ Notifications
](/login?return_to=/Tautulli/Tautulli) You must be signed in to change notification settings
* [ Fork
623
](/login?return_to=/Tautulli/Tautulli)
*
[
Star
6.5k
](/login?return_to=/Tautulli/Tautulli)
## Conversation
[
](/apps/dependabot)
Copy link
Copy Markdown
Contributor
###
**
[dependabot](/apps/dependabot)
Bot
**
commented
on behalf of **github**
[Apr 27, 2026](#issue-4338852074)
Bumps [pyopenssl](https://github.com/pyca/pyopenssl) from 26.0.0 to 26.1.0.
Changelog
*Sourced from [pyopenssl's changelog](https://github.com/pyca/pyopenssl/blob/main/CHANGELOG.rst).*
>
## > 26.1.0 (2026-04-24)
>
> Backward-incompatible changes:^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> Deprecations:^^^^^^^^^^^^^
>
> Changes:^^^^^^^^
>
>
* > Maximum supported
`> cryptography
`> version is now 47.x.
>
* > Fixed
`> X509Name
`> field setters to correctly pass the value length to OpenSSL. Previously, values containing NUL bytes would be silently truncated, causing a divergence between the stored ASN.1 value and the value visible from Python. Credit to
**> BudongJW
**> for reporting the issue.
**> CVE-2026-40475
**>
>
Commits
* [`3be23b6`](https://github.com/pyca/pyopenssl/commit/3be23b621cc4797667a79f483d19514a032c7e8f) Prepare 26.1.0 release ([#1495](https://redirect.github.com/pyca/pyopenssl/issues/1495))
* [`e6be3fc`](https://github.com/pyca/pyopenssl/commit/e6be3fca7180ca47a5e45edd58ae4233635712cb) Add note on versioning policy ([#1494](https://redirect.github.com/pyca/pyopenssl/issues/1494))
* [`402177b`](https://github.com/pyca/pyopenssl/commit/402177b25d132380f6eeed2395f35c2932602763) Bump actions/upload-artifact in /.github/actions/upload-coverage ([#1492](https://redirect.github.com/pyca/pyopenssl/issues/1492))
* [`08c796c`](https://github.com/pyca/pyopenssl/commit/08c796cb41550c0973bc2c28acab7ef9b219c56c) Bump actions/upload-artifact from 7.0.0 to 7.0.1 ([#1491](https://redirect.github.com/pyca/pyopenssl/issues/1491))
* [`12478f5`](https://github.com/pyca/pyopenssl/commit/12478f53977fa6510befca9fe044404876ac3502) Bump pypa/gh-action-pypi-publish from 1.13.0 to 1.14.0 ([#1489](https://redirect.github.com/pyca/pyopenssl/issues/1489))
* [`f72218e`](https://github.com/pyca/pyopenssl/commit/f72218efff8a1e3e7ae4683793ad36d2f9610976) Add +/- 1 second tolerance for clock adjustments ([#1481](https://redirect.github.com/pyca/pyopenssl/issues/1481))
* See full diff in [compare view](https://github.com/pyca/pyopenssl/compare/26.0.0...26.1.0)
[](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)
Dependabot will resolve any conflicts with this PR as long as you don't alter it yourself. You can also trigger a rebase manually by commenting `@dependabot rebase`.
Dependabot commands and options
You can trigger Dependabot actions by commenting on this PR:
* `@dependabot rebase` will rebase this PR
* `@dependabot recreate` will recreate this PR, overwriting any edits that have been made to it
* `@dependabot show \<dependency name\> ignore conditions` will show all of the ignore conditions of the specified dependency
* `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
* `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
* `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
</option></form>
</option></form>
[
](/apps/dependabot)
`
[Bump pyopenssl from 26.0.0 to 26.1.0](/Tautulli/Tautulli/pull/2695/commits/4217ec317d7c7cae71a67242ac836b7a52e09d10)
`
&hellip;
`
[4217ec3](/Tautulli/Tautulli/pull/2695/commits/4217ec317d7c7cae71a67242ac836b7a52e09d10)
`
```
Bumps [pyopenssl]([https://github.com/pyca/pyopenssl](https://github.com/pyca/pyopenssl)) from 26.0.0 to 26.1.0.
- [Changelog]([https://github.com/pyca/pyopenssl/blob/main/CHANGELOG.rst](https://github.com/pyca/pyopenssl/blob/main/CHANGELOG.rst))
- [Commits]([pyca/pyopenssl@26.0.0...26.1.0](https://github.com/pyca/pyopenssl/compare/26.0.0...26.1.0))
---
updated-dependencies:
- dependency-name: pyopenssl
dependency-version: 26.1.0
dependency-type: direct:production
update-type: version-update:semver-minor
...
Signed-off-by: dependabot[bot] \<support@github.com\>
```
[](/apps/dependabot)
[dependabot](/apps/dependabot)
Bot
added
[
dependencies
](</Tautulli/Tautulli/issues?q=state:open label:dependencies>)
Pull requests that update a dependency file
[
python
](</Tautulli/Tautulli/issues?q=state:open label:python>)
Pull requests that update Python code
labels
[Apr 27, 2026](#event-24922965388)
</option></form>
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
[Sign up for free](/join?source=comment-repo)
**to join this conversation on GitHub**.
Already have an account?
[Sign in to comment](/login?return_to=https://github.com/Tautulli/Tautulli/pull/2695)
</option></form>
###
Reviewers
No reviews
</option></form>
###
Assignees
No one assigned
###
Labels
[
dependencies
](</Tautulli/Tautulli/issues?q=state:open label:dependencies>)
Pull requests that update a dependency file
[
python
](</Tautulli/Tautulli/issues?q=state:open label:python>)
Pull requests that update Python code
</option></form>
###
Milestone
No milestone
</option></form>
###
Development
Successfully merging this pull request may close these issues.
###
0 participants