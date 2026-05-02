Apprise API | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Apprise API
## Contributing to Apprise API
[Section titled “Contributing to Apprise API”](#contributing-to-apprise-api)
Thank you for your interest in contributing to Apprise API.
This repository is the web application and API layer that wraps the Apprise core library. Contributions are welcome across code, bug fixes, UI improvements, documentation, and deployment tooling.
## Retrieve from GitHub
[Section titled “Retrieve from GitHub”](#retrieve-from-github)
Terminal window
```
`
git clone git@github.com:caronc/apprise-api.git
cd apprise-api
`
```
## Development Environment
[Section titled “Development Environment”](#development-environment)
Apprise API supports both a local (bare metal) workflow and a Docker Compose workflow.
### Bare Metal
[Section titled “Bare Metal”](#bare-metal)
Start the development server in debug mode:
Terminal window
```
`
tox -e runserver
# visit: http://localhost:8000/
`
```
You can also bind to a different address or port:
Terminal window
```
`
tox -e runserver -- "localhost:8080"
tox -e runserver -- "0.0.0.0:8080"
`
```
### Docker Compose for Development
[Section titled “Docker Compose for Development”](#docker-compose-for-development)
A fresh checkout can be run with Docker Compose, and the development flow mounts your local source tree into the container so changes are reflected without rebuilding:
Terminal window
```
`
# Pre-create the paths you will mount to
mkdir -p attach config plugin
# Run the stack
PUID=$(id -u) PGID=$(id -g) docker compose up
`
```
## Quality Assurance and Testing
[Section titled “Quality Assurance and Testing”](#quality-assurance-and-testing)
This repository uses `tox` to keep linting, tests, and formatting consistent across contributor environments:
Terminal window
```
`
# Run unit tests
tox -e test
# Lint (calls ruff under the hood)
tox -e lint
# Auto-format
tox -e format
`
```
You can combine environments as well:
Terminal window
```
`
tox -e test,lint
`
```
If you prefer running tools directly (once dev dependencies are installed), the repository documents `pytest` and `ruff` as optional manual equivalents.
## Quick Checklist Before You Submit
[Section titled “Quick Checklist Before You Submit”](#quick-checklist-before-you-submit)
* Your change includes tests when practical.
* `tox -e test` passes locally.
* `tox -e lint` passes locally.
* You ran `tox -e format` when formatting changes are needed.
* Your pull request description clearly explains what changed and why.
## Notes on Docker Compose Files
[Section titled “Notes on Docker Compose Files”](#notes-on-docker-compose-files)
* For development, `docker compose up` will apply the override file automatically in a fresh checkout, and it is designed for live iteration.
* For production-style deployments, prefer the base Compose file only, so you are running the immutable image and bundled static assets.
## Licensing and Attribution
[Section titled “Licensing and Attribution”](#licensing-and-attribution)
Apprise API is released under the MIT License
All contributions must be compatible with this licence, and new files should include appropriate headers where required.
Questions or Feedback?
#### Documentation
Notice a typo or an error?
[
Report it
](https://github.com/caronc/apprise-docs/issues/)
or
[
contribute a fix
](https://github.com/caronc/apprise-docs)
.
#### Technical Issues
Having trouble with the code? Open an issue on GitHub:
* [
Apprise Core & CLI
](https://github.com/caronc/apprise/issues/)
* [
Apprise API
](https://github.com/caronc/apprise-api/issues/)
Made with love from Canada