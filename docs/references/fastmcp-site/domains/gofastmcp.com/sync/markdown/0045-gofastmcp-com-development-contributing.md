Contributing - FastMCP
Documentation
##### Get Started
* [
Welcome!
](/getting-started/welcome)
* [
Installation
](/getting-started/installation)
* [
Quickstart
](/getting-started/quickstart)
##### Servers
* [
Overview
](/servers/server)
*
Core Components
*
FeaturesUPDATED
*
Providers
*
Transforms
*
Auth
*
Deployment
##### Apps
* [
Overview
NEW
](/apps/overview)
* [
Quickstart
NEW
](/apps/quickstart)
* [
Examples
NEW
](/apps/examples)
*
Building AppsNEW
*
ProvidersNEW
*
AdvancedNEW
##### Clients
* [
Overview
](/clients/client)
* [
Transports
](/clients/transports)
*
Core Operations
*
HandlersUPDATED
*
AuthenticationUPDATED
##### Integrations
*
Auth
*
Web Frameworks
*
AI Assistants
*
AI SDKs
* [
MCP.json
](/integrations/mcp-json-configuration)
##### CLI
* [
Overview
](/cli/overview)
* [
Running
](/cli/running)
* [
Install MCPs
](/cli/install-mcp)
* [
Inspecting
](/cli/inspecting)
* [
Client
](/cli/client)
* [
Generate CLI
](/cli/generate-cli)
* [
Auth
](/cli/auth)
##### More
* [
Settings
](/more/settings)
*
Upgrading
*
Development
* [
Contributing
](/development/contributing)
* [
Tests
](/development/tests)
* [
Releases
](/development/releases)
* [
Contrib Modules
](/patterns/contrib)
*
What's New
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
Contributing to FastMCP means joining a community that values clean, maintainable code and thoughtful API design. All contributions are valued - from fixing typos in documentation to implementing major features.
##
[​
](#design-principles)
Design Principles
Every contribution should advance these principles:
* 🚀 **Fast** — High-level interfaces mean less code and faster development
* 🍀 **Simple** — Minimal boilerplate; the obvious way should be the right way
* 🐍 **Pythonic** — Feels natural to Python developers; no surprising patterns
* 🔍 **Complete** — Everything needed for production: auth, testing, deployment, observability
PRs are evaluated against these principles. Code that makes FastMCP slower, harder to reason about, less Pythonic, or less complete will be rejected.
##
[​
](#issues)
Issues
###
[​
](#issue-first-code-second)
Issue First, Code Second
**Every pull request requires a corresponding issue - no exceptions.** This requirement creates a collaborative space where approach, scope, and alignment are established before code is written. Issues serve as design documents where maintainers and contributors discuss implementation strategy, identify potential conflicts with existing patterns, and ensure proposed changes advance FastMCP’s vision.
**FastMCP is an opinionated framework, not a kitchen sink.** The maintainers have strong beliefs about what FastMCP should and shouldn’t do. Just because something takes N lines of code and you want it in fewer lines doesn’t mean FastMCP should take on the maintenance burden or endorse that pattern. This is judged at the maintainers’ discretion.
Use issues to understand scope BEFORE opening PRs. The issue discussion determines whether a feature belongs in core, contrib, or not at all.
###
[​
](#writing-good-issues)
Writing Good Issues
FastMCP is an extremely highly-trafficked repository maintained by a very small team. Issues that appear to transfer burden to maintainers without any effort to validate the problem will be closed. Please help the maintainers help you by always providing a minimal reproducible example and clearly describing the problem.
**LLM-generated issues will be closed immediately.** Issues that contain paragraphs of unnecessary explanation, verbose problem descriptions, or obvious LLM authorship patterns obfuscate the actual problem and transfer burden to maintainers.
Write clear, concise issues that:
* State the problem directly
* Provide a minimal reproducible example
* Skip unnecessary background or context
* Take responsibility for clear communication
Issues may be labeled “Invalid” simply due to confusion caused by verbosity or not adhering to the guidelines outlined here.
##
[​
](#pull-requests)
Pull Requests
PRs that deviate from FastMCP’s core principles will be rejected regardless of implementation quality. **PRs are NOT for iterating on ideas** - they should only be opened for ideas that already have a bias toward acceptance based on issue discussion.
###
[​
](#development-environment)
Development Environment
####
[​
](#installation)
Installation
To contribute to FastMCP, you’ll need to set up a development environment with all necessary tools and dependencies.
```
`# Clone the repository
git clone https://github.com/PrefectHQ/fastmcp.git
cd fastmcp
# Install all dependencies including dev tools
uv sync
# Install prek hooks
uv run prek install
`
```
In addition, some development commands require [just](https://github.com/casey/just) to be installed.
Prek hooks will run automatically on every commit to catch issues before they reach CI. If you see failures, fix them before committing - never commit broken code expecting to fix it later.
###
[​
](#development-standards)
Development Standards
####
[​
](#scope)
Scope
Large pull requests create review bottlenecks and quality risks. Unless you’re fixing a discrete bug or making an incredibly well-scoped change, keep PRs small and focused.
A PR that changes 50 lines across 3 files can be thoroughly reviewed in minutes. A PR that changes 500 lines across 20 files requires hours of careful analysis and often hides subtle issues.
Breaking large features into smaller PRs:
* Creates better review experiences
* Makes git history clear
* Simplifies debugging with bisect
* Reduces merge conflicts
* Gets your code merged faster
####
[​
](#code-quality)
Code Quality
FastMCP values clarity over cleverness. Every line you write will be maintained by someone else - possibly years from now, possibly without context about your decisions.
**PRs can be rejected for two opposing reasons:**
1. **Insufficient quality** - Code that doesn’t meet our standards for clarity, maintainability, or idiomaticity
2. **Overengineering** - Code that is overbearing, unnecessarily complex, or tries to be too clever
The focus is on idiomatic, high-quality Python. FastMCP uses patterns like `NotSet` type as an alternative to `None` in certain situations - follow existing patterns.
####
[​
](#required-practices)
Required Practices
**Full type annotations** on all functions and methods. They catch bugs before runtime and serve as inline documentation.
**Async/await patterns** for all I/O operations. Even if your specific use case doesn’t need concurrency, consistency means users can compose features without worrying about blocking operations.
**Descriptive names** make code self-documenting. `auth\_token` is clear; `tok` requires mental translation.
**Specific exception types** make error handling predictable. Catching `ValueError` tells readers exactly what error you expect. Never use bare `except` clauses.
####
[​
](#anti-patterns-to-avoid)
Anti-Patterns to Avoid
**Complex one-liners** are hard to debug and modify. Break operations into clear steps.
**Mutable default arguments** cause subtle bugs. Use `None` as the default and create the mutable object inside the function.
**Breaking established patterns** confuses readers. If you must deviate, discuss in the issue first.
###
[​
](#prek-checks)
Prek Checks
```
`# Runs automatically on commit, or manually:
uv run prek run --all-files
`
```
This runs three critical tools:
* **Ruff**: Linting and formatting
* **Prettier**: Code formatting
* **ty**: Static type checking
Pytest runs separately as a distinct workflow step after prek checks pass. CI will reject PRs that fail these checks. Always run them locally first.
###
[​
](#testing)
Testing
Tests are documentation that shows how features work. Good tests give reviewers confidence and help future maintainers understand intent.
```
`# Run specific test directory
uv run pytest tests/server/ -v
# Run all tests before submitting PR
uv run pytest
`
```
Every new feature needs tests. See the [Testing Guide](/development/tests) for patterns and requirements.
###
[​
](#documentation)
Documentation
A feature doesn’t exist unless it’s documented. Note that FastMCP’s hosted documentation always tracks the main branch - users who want historical documentation can clone the repo, checkout a specific tag, and host it themselves.
```
`# Preview documentation locally
just docs
`
```
Documentation requirements:
* **Explain concepts in prose first** - Code without context is just syntax
* **Complete, runnable examples** - Every code block should be copy-pasteable
* **Register in docs.json** - Makes pages appear in navigation
* **Version badges** - Mark when features were added using `\<VersionBadge /\>`
####
[​
](#sdk-documentation)
SDK Documentation
FastMCP’s SDK documentation is auto-generated from the source code docstrings and type annotations. It is automatically updated on every merge to main by a GitHub Actions workflow, so users are *not* responsible for keeping the documentation up to date. However, to generate it proactively, you can use the following command:
```
`just api-ref-all
`
```
###
[​
](#submitting-your-pr)
Submitting Your PR
####
[​
](#before-submitting)
Before Submitting
1. **Run all checks**: `uv run prek run --all-files && uv run pytest`
2. **Keep scope small**: One feature or fix per PR
3. **Write clear description**: Your PR description becomes permanent documentation
4. **Update docs**: Include documentation for API changes
####
[​
](#pr-description)
PR Description
Write PR descriptions that explain:
* What problem you’re solving
* Why you chose this approach
* Any trade-offs or alternatives considered
* Migration path for breaking changes
Focus on the “why” - the code shows the “what”. Keep it concise but complete.
####
[​
](#what-we-look-for)
What We Look For
**Framework Philosophy**: FastMCP is NOT trying to do all things or provide all shortcuts. Features are rejected when they don’t align with the framework’s vision, even if perfectly implemented. The burden of proof is on the PR to demonstrate value.
**Code Quality**: We verify code follows existing patterns. Consistency reduces cognitive load. When every module works similarly, developers understand new code quickly.
**Test Coverage**: Not every line needs testing, but every behavior does. Tests document intent and protect against regressions.
**Breaking Changes**: May be acceptable in minor versions but must be clearly documented. See the [versioning policy](/development/releases#versioning-policy).
##
[​
](#special-modules)
Special Modules
**`contrib`**: Community-maintained patterns and utilities. Original authors maintain their contributions. Not representative of the core framework.
**`experimental`**: Maintainer-developed features that may preview future functionality. Can break or be deleted at any time without notice. Pin your FastMCP version when using these features.