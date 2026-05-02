How to contribute | Gemini CLI
[Skip to content](#_top)
# How to contribute
Copy as Markdown Copied!
We would love to accept your patches and contributions to this project. This
document includes:
* **[Before you begin](#before-you-begin):** Essential steps to take before
becoming a Gemini CLI contributor.
* **[Code contribution process](#code-contribution-process):** How to contribute
code to Gemini CLI.
* **[Development setup and workflow](#development-setup-and-workflow):** How to
set up your development environment and workflow.
* **[Documentation contribution process](#documentation-contribution-process):**
How to contribute documentation to Gemini CLI.
We’re looking forward to seeing your contributions!
## Before you begin
[Section titled “Before you begin”](#before-you-begin)
### Sign our Contributor License Agreement
[Section titled “Sign our Contributor License Agreement”](#sign-our-contributor-license-agreement)
Contributions to this project must be accompanied by a
[Contributor License Agreement](https://cla.developers.google.com/about) (CLA).
You (or your employer) retain the copyright to your contribution; this simply
gives us permission to use and redistribute your contributions as part of the
project.
If you or your current employer have already signed the Google CLA (even if it
was for a different project), you probably don’t need to do it again.
Visit [https://cla.developers.google.com/](https://cla.developers.google.com/) to see your current agreements or to
sign a new one.
### Review our Community Guidelines
[Section titled “Review our Community Guidelines”](#review-our-community-guidelines)
This project follows
[Google’s Open Source Community Guidelines](https://opensource.google/conduct/).
## Code contribution process
[Section titled “Code contribution process”](#code-contribution-process)
### Get started
[Section titled “Get started”](#get-started)
The process for contributing code is as follows:
1. **Find an issue** that you want to work on. If an issue is tagged as
`🔒Maintainers only`, this means it is reserved for project maintainers. We
will not accept pull requests related to these issues. In the near future,
we will explicitly mark issues looking for contributions using the
`help-wanted` label. If you believe an issue is a good candidate for
community contribution, please leave a comment on the issue. A maintainer
will review it and apply the `help-wanted` label if appropriate. Only
maintainers should attempt to add the `help-wanted` label to an issue.
2. **Fork the repository** and create a new branch.
3. **Make your changes** in the `packages/` directory.
4. **Ensure all checks pass** by running `npm run preflight`.
5. **Open a pull request** with your changes.
### Code reviews
[Section titled “Code reviews”](#code-reviews)
All submissions, including submissions by project members, require review. We
use [GitHub pull requests](https://docs.github.com/articles/about-pull-requests)
for this purpose.
To assist with the review process, we provide an automated review tool that
helps detect common anti-patterns, testing issues, and other best practices that
are easy to miss.
#### Using the automated review tool
[Section titled “Using the automated review tool”](#using-the-automated-review-tool)
You can run the review tool in two ways:
1. **Using the helper script (Recommended):** We provide a script that
automatically handles checking out the PR into a separate worktree,
installing dependencies, building the project, and launching the review
tool.
Terminal window
```
`
./scripts/review.sh \<PR\_NUMBER\> [model]
`
```
**Warning:** If you run `scripts/review.sh`, you must have first verified
that the code for the PR being reviewed is safe to run and does not contain
data exfiltration attacks.
**Authors are strongly encouraged to run this script on their own PRs**
immediately after creation. This allows you to catch and fix simple issues
locally before a maintainer performs a full review.
**Note on Models:** By default, the script uses the latest Pro model
(`gemini-3.1-pro-preview`). If you do not have enough Pro quota, you can run
it with the latest Flash model instead:
`./scripts/review.sh \<PR\_NUMBER\> gemini-3-flash-preview`.
2. **Manually from within Gemini CLI:** If you already have the PR checked out
and built, you can run the tool directly from the CLI prompt:
```
`
/review-frontend \<PR\_NUMBER\>
`
```
Replace `\<PR\_NUMBER\>` with your pull request number. Reviewers should use this
tool to augment, not replace, their manual review process.
### Self-assigning and unassigning issues
[Section titled “Self-assigning and unassigning issues”](#self-assigning-and-unassigning-issues)
To assign an issue to yourself, simply add a comment with the text `/assign`. To
unassign yourself from an issue, add a comment with the text `/unassign`.
The comment must contain only that text and nothing else. These commands will
assign or unassign the issue as requested, provided the conditions are met
(e.g., an issue must be unassigned to be assigned).
Please note that you can have a maximum of 3 issues assigned to you at any given
time and that only
[issues labeled “help wanted”](<https://github.com/google-gemini/gemini-cli/issues?q=is:issue state:open label:"help wanted">)
may be self-assigned.
### Pull request guidelines
[Section titled “Pull request guidelines”](#pull-request-guidelines)
To help us review and merge your PRs quickly, please follow these guidelines.
PRs that do not meet these standards may be closed.
#### 1. Link to an existing issue
[Section titled “1. Link to an existing issue”](#1-link-to-an-existing-issue)
All PRs should be linked to an existing issue in our tracker. This ensures that
every change has been discussed and is aligned with the project’s goals before
any code is written.
* **For bug fixes:** The PR should be linked to the bug report issue.
* **For features:** The PR should be linked to the feature request or proposal
issue that has been approved by a maintainer.
If an issue for your change doesn’t exist, we will automatically close your PR
along with a comment reminding you to associate the PR with an issue. The ideal
workflow starts with an issue that has been reviewed and approved by a
maintainer. Please **open the issue first** and wait for feedback before you
start coding.
#### 2. Keep it small and focused
[Section titled “2. Keep it small and focused”](#2-keep-it-small-and-focused)
We favor small, atomic PRs that address a single issue or add a single,
self-contained feature.
* **Do:** Create a PR that fixes one specific bug or adds one specific feature.
* **Don’t:** Bundle multiple unrelated changes (e.g., a bug fix, a new feature,
and a refactor) into a single PR.
Large changes should be broken down into a series of smaller, logical PRs that
can be reviewed and merged independently.
#### 3. Use draft PRs for work in progress
[Section titled “3. Use draft PRs for work in progress”](#3-use-draft-prs-for-work-in-progress)
If you’d like to get early feedback on your work, please use GitHub’s **Draft
Pull Request** feature. This signals to the maintainers that the PR is not yet
ready for a formal review but is open for discussion and initial feedback.
#### 4. Ensure all checks pass
[Section titled “4. Ensure all checks pass”](#4-ensure-all-checks-pass)
Before submitting your PR, ensure that all automated checks are passing by
running `npm run preflight`. This command runs all tests, linting, and other
style checks.
#### 5. Update documentation
[Section titled “5. Update documentation”](#5-update-documentation)
If your PR introduces a user-facing change (e.g., a new command, a modified
flag, or a change in behavior), you must also update the relevant documentation
in the `/docs` directory.
See more about writing documentation:
[Documentation contribution process](#documentation-contribution-process).
#### 6. Write clear commit messages and a good PR description
[Section titled “6. Write clear commit messages and a good PR description”](#6-write-clear-commit-messages-and-a-good-pr-description)
Your PR should have a clear, descriptive title and a detailed description of the
changes. Follow the [Conventional Commits](https://www.conventionalcommits.org/)
standard for your commit messages.
* **Good PR title:** `feat(cli): Add --json flag to 'config get' command`
* **Bad PR title:** `Made some changes`
In the PR description, explain the “why” behind your changes and link to the
relevant issue (e.g., `Fixes #123`).
### Forking
[Section titled “Forking”](#forking)
If you are forking the repository you will be able to run the Build, Test and
Integration test workflows. However in order to make the integration tests run
you’ll need to add a
[GitHub Repository Secret](https://docs.github.com/en/actions/security-for-github-actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository)
with a value of `GEMINI\_API\_KEY` and set that to a valid API key that you have
available. Your key and secret are private to your repo; no one without access
can see your key and you cannot see any secrets related to this repo.
Additionally you will need to click on the `Actions` tab and enable workflows
for your repository, you’ll find it’s the large blue button in the center of the
screen.
### Development setup and workflow
[Section titled “Development setup and workflow”](#development-setup-and-workflow)
This section guides contributors on how to build, modify, and understand the
development setup of this project.
### Setting up the development environment
[Section titled “Setting up the development environment”](#setting-up-the-development-environment)
**Prerequisites:**
1. **Node.js**:
* **Development:** Please use Node.js `\~20.19.0`. This specific version is
required due to an upstream development dependency issue. You can use a
tool like [nvm](https://github.com/nvm-sh/nvm) to manage Node.js versions.
* **Production:** For running the CLI in a production environment, any
version of Node.js `\>=20` is acceptable.
* **Git**
### Build process
[Section titled “Build process”](#build-process)
To clone the repository:
Terminal window
```
`
git clone https://github.com/google-gemini/gemini-cli.git # Or your fork's URL
cd gemini-cli
`
```
To install dependencies defined in `package.json` as well as root dependencies:
Terminal window
```
`
npm install
`
```
To build the entire project (all packages):
Terminal window
```
`
npm run build
`
```
This command typically compiles TypeScript to JavaScript, bundles assets, and
prepares the packages for execution. Refer to `scripts/build.js` and
`package.json` scripts for more details on what happens during the build.
### Enabling sandboxing
[Section titled “Enabling sandboxing”](#enabling-sandboxing)
[Sandboxing](#sandboxing) is highly recommended and requires, at a minimum,
setting `GEMINI\_SANDBOX=true` in your `\~/.env` and ensuring a sandboxing
provider (e.g. `macOS Seatbelt`, `docker`, or `podman`) is available. See
[Sandboxing](#sandboxing) for details.
To build both the `gemini` CLI utility and the sandbox container, run
`build:all` from the root directory:
Terminal window
```
`
npm run build:all
`
```
To skip building the sandbox container, you can use `npm run build` instead.
### Running the CLI
[Section titled “Running the CLI”](#running-the-cli)
To start the Gemini CLI from the source code (after building), run the following
command from the root directory:
Terminal window
```
`
npm start
`
```
If you’d like to run the source build outside of the gemini-cli folder, you can
utilize `npm link path/to/gemini-cli/packages/cli` (see:
[docs](https://docs.npmjs.com/cli/v9/commands/npm-link)) or
`alias gemini="node path/to/gemini-cli/packages/cli"` to run with `gemini`
### Running tests
[Section titled “Running tests”](#running-tests)
This project contains two types of tests: unit tests and integration tests.
#### Unit tests
[Section titled “Unit tests”](#unit-tests)
To execute the unit test suite for the project:
Terminal window
```
`
npm run test
`
```
This will run tests located in the `packages/core` and `packages/cli`
directories. Ensure tests pass before submitting any changes. For a more
comprehensive check, it is recommended to run `npm run preflight`.
#### Integration tests
[Section titled “Integration tests”](#integration-tests)
The integration tests are designed to validate the end-to-end functionality of
the Gemini CLI. They are not run as part of the default `npm run test` command.
To run the integration tests, use the following command:
Terminal window
```
`
npm run test:e2e
`
```
For more detailed information on the integration testing framework, please see
the
[Integration Tests documentation](https://geminicli.com/docs/integration-tests).
### Linting and preflight checks
[Section titled “Linting and preflight checks”](#linting-and-preflight-checks)
To ensure code quality and formatting consistency, run the preflight check:
Terminal window
```
`
npm run preflight
`
```
This command will run ESLint, Prettier, all tests, and other checks as defined
in the project’s `package.json`.
*ProTip*
after cloning create a git precommit hook file to ensure your commits are always
clean.
Terminal window
```
`
echo "
# Run npm build and check for errors
if ! npm run preflight; then
echo "npm build failed. Commit aborted."
exit 1
fi
" \> .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit
`
```
#### Formatting
[Section titled “Formatting”](#formatting)
To separately format the code in this project, run the following command from
the root directory:
Terminal window
```
`
npm run format
`
```
This command uses Prettier to format the code according to the project’s style
guidelines.
#### Linting
[Section titled “Linting”](#linting)
To separately lint the code in this project, run the following command from the
root directory:
Terminal window
```
`
npm run lint
`
```
### Coding conventions
[Section titled “Coding conventions”](#coding-conventions)
* Please adhere to the coding style, patterns, and conventions used throughout
the existing codebase.
* Consult
[GEMINI.md](https://github.com/google-gemini/gemini-cli/blob/main/GEMINI.md)
(typically found in the project root) for specific instructions related to
AI-assisted development, including conventions for React, comments, and Git
usage.
* **Imports:** Pay special attention to import paths. The project uses ESLint to
enforce restrictions on relative imports between packages.
### Debugging
[Section titled “Debugging”](#debugging)
#### VS Code
[Section titled “VS Code”](#vs-code)
1. Run the CLI to interactively debug in VS Code with `F5`
2. Start the CLI in debug mode from the root directory:
Terminal window
```
`
npm run debug
`
```
This command runs `node --inspect-brk dist/gemini.js` within the
`packages/cli` directory, pausing execution until a debugger attaches. You
can then open `chrome://inspect` in your Chrome browser to connect to the
debugger.
3. In VS Code, use the “Attach” launch configuration (found in
`.vscode/launch.json`).
Alternatively, you can use the “Launch Program” configuration in VS Code if you
prefer to launch the currently open file directly, but ‘F5’ is generally
recommended.
To hit a breakpoint inside the sandbox container run:
Terminal window
```
`
DEBUG=1 gemini
`
```
**Note:** If you have `DEBUG=true` in a project’s `.env` file, it won’t affect
gemini-cli due to automatic exclusion. Use `.gemini/.env` files for gemini-cli
specific debug settings.
### React DevTools
[Section titled “React DevTools”](#react-devtools)
To debug the CLI’s React-based UI, you can use React DevTools.
1. **Start the Gemini CLI in development mode:**
Terminal window
```
`
DEV=true npm start
`
```
2. **Install and run React DevTools version 6 (which matches the CLI’s
`react-devtools-core`):**
You can either install it globally:
Terminal window
```
`
npm install -g react-devtools@6
react-devtools
`
```
Or run it directly using npx:
Terminal window
```
`
npx react-devtools@6
`
```
Your running CLI application should then connect to React DevTools.
### Sandboxing
[Section titled “Sandboxing”](#sandboxing)
#### macOS Seatbelt
[Section titled “macOS Seatbelt”](#macos-seatbelt)
On macOS, `gemini` uses Seatbelt (`sandbox-exec`) under a `permissive-open`
profile (see `packages/cli/src/utils/sandbox-macos-permissive-open.sb`) that
restricts writes to the project folder but otherwise allows all other operations
and outbound network traffic (“open”) by default. You can switch to a
`strict-open` profile (see
`packages/cli/src/utils/sandbox-macos-strict-open.sb`) that restricts both reads
and writes to the working directory while allowing outbound network traffic by
setting `SEATBELT\_PROFILE=strict-open` in your environment or `.env` file.
Available built-in profiles are `permissive-{open,proxied}`,
`restrictive-{open,proxied}`, and `strict-{open,proxied}` (see below for proxied
networking). You can also switch to a custom profile
`SEATBELT\_PROFILE=\<profile\>` if you also create a file
`.gemini/sandbox-macos-\<profile\>.sb` under your project settings directory
`.gemini`.
#### Container-based sandboxing (all platforms)
[Section titled “Container-based sandboxing (all platforms)”](#container-based-sandboxing-all-platforms)
For stronger container-based sandboxing on macOS or other platforms, you can set
`GEMINI\_SANDBOX=true|docker|podman|\<command\>` in your environment or `.env`
file. The specified command (or if `true` then either `docker` or `podman`) must
be installed on the host machine. Once enabled, `npm run build:all` will build a
minimal container (“sandbox”) image and `npm start` will launch inside a fresh
instance of that container. The first build can take 20-30s (mostly due to
downloading of the base image) but after that both build and start overhead
should be minimal. Default builds (`npm run build`) will not rebuild the
sandbox.
Container-based sandboxing mounts the project directory (and system temp
directory) with read-write access and is started/stopped/removed automatically
as you start/stop Gemini CLI. Files created within the sandbox should be
automatically mapped to your user/group on host machine. You can easily specify
additional mounts, ports, or environment variables by setting
`SANDBOX\_{MOUNTS,PORTS,ENV}` as needed. You can also fully customize the sandbox
for your projects by creating the files `.gemini/sandbox.Dockerfile` and/or
`.gemini/sandbox.bashrc` under your project settings directory (`.gemini`) and
running `gemini` with `BUILD\_SANDBOX=1` to trigger building of your custom
sandbox.
#### Proxied networking
[Section titled “Proxied networking”](#proxied-networking)
All sandboxing methods, including macOS Seatbelt using `\*-proxied` profiles,
support restricting outbound network traffic through a custom proxy server that
can be specified as `GEMINI\_SANDBOX\_PROXY\_COMMAND=\<command\>`, where `\<command\>`
must start a proxy server that listens on `:::8877` for relevant requests. See
`docs/examples/proxy-script.md` for a minimal proxy that only allows `HTTPS`
connections to `example.com:443` (e.g. `curl https://example.com`) and declines
all other requests. The proxy is started and stopped automatically alongside the
sandbox.
### Manual publish
[Section titled “Manual publish”](#manual-publish)
We publish an artifact for each commit to our internal registry. But if you need
to manually cut a local build, then run the following commands:
```
`
npm run clean
npm install
npm run auth
npm run prerelease:dev
npm publish --workspaces
`
```
## Documentation contribution process
[Section titled “Documentation contribution process”](#documentation-contribution-process)
Our documentation must be kept up-to-date with our code contributions. We want
our documentation to be clear, concise, and helpful to our users. We value:
* **Clarity:** Use simple and direct language. Avoid jargon where possible.
* **Accuracy:** Ensure all information is correct and up-to-date.
* **Completeness:** Cover all aspects of a feature or topic.
* **Examples:** Provide practical examples to help users understand how to use
Gemini CLI.
### Getting started
[Section titled “Getting started”](#getting-started)
The process for contributing to the documentation is similar to contributing
code.
1. **Fork the repository** and create a new branch.
2. **Make your changes** in the `/docs` directory.
3. **Preview your changes locally** in Markdown rendering.
4. **Lint and format your changes.** Our preflight check includes linting and
formatting for documentation files.
Terminal window
```
`
npm run preflight
`
```
5. **Open a pull request** with your changes.
### Documentation structure
[Section titled “Documentation structure”](#documentation-structure)
Our documentation is organized using
[sidebar.json](https://github.com/google-gemini/gemini-cli/blob/main/docs/sidebar.json)
as the table of contents. When adding new documentation:
1. Create your markdown file **in the appropriate directory** under `/docs`.
2. Add an entry to `sidebar.json` in the relevant section.
3. Ensure all internal links use relative paths and point to existing files.
### Style guide
[Section titled “Style guide”](#style-guide)
We follow the
[Google Developer Documentation Style Guide](https://developers.google.com/style).
Please refer to it for guidance on writing style, tone, and formatting.
#### Key style points
[Section titled “Key style points”](#key-style-points)
* Use sentence case for headings.
* Write in second person (“you”) when addressing the reader.
* Use present tense.
* Keep paragraphs short and focused.
* Use code blocks with appropriate language tags for syntax highlighting.
* Include practical examples whenever possible.
### Linting and formatting
[Section titled “Linting and formatting”](#linting-and-formatting)
We use `prettier` to enforce a consistent style across our documentation. The
`npm run preflight` command will check for any linting issues.
You can also run the linter and formatter separately:
* `npm run lint` - Check for linting issues
* `npm run format` - Auto-format markdown files
* `npm run lint:fix` - Auto-fix linting issues where possible
Please make sure your contributions are free of linting errors before submitting
a pull request.
### Before you submit
[Section titled “Before you submit”](#before-you-submit)
Before submitting your documentation pull request, please:
1. Run `npm run preflight` to ensure all checks pass.
2. Review your changes for clarity and accuracy.
3. Check that all links work correctly.
4. Ensure any code examples are tested and functional.
5. Sign the
[Contributor License Agreement (CLA)](https://cla.developers.google.com/) if
you haven’t already.
### Need help?
[Section titled “Need help?”](#need-help)
If you have questions about contributing documentation:
* Check our [FAQ](https://geminicli.com/docs/resources/faq).
* Review existing documentation for examples.
* Open [an issue](https://github.com/google-gemini/gemini-cli/issues) to discuss
your proposed changes.
* Reach out to the maintainers.
We appreciate your contributions to making Gemini CLI documentation better!
Last updated: Oct 28, 2025
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.