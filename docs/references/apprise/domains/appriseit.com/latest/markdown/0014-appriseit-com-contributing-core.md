Core Library | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Core Library
## Contributing to the Apprise Core Library
[Section titled “Contributing to the Apprise Core Library”](#contributing-to-the-apprise-core-library)
Thank you for your interest in contributing to Apprise.
Contributions are welcome across code, bug fixes, CLI improvements, documentation, and deployment tooling.
This repository is the core application and CLI layer that makes up the heart of Apprise.
## Development Requirements
[Section titled “Development Requirements”](#development-requirements)
### Supported Python Versions
[Section titled “Supported Python Versions”](#supported-python-versions)
Apprise supports **Python 3.9 and newer**. All contributions must remain compatible with the lowest supported version unless explicitly discussed.
### Tooling Expectations
[Section titled “Tooling Expectations”](#tooling-expectations)
Apprise development uses a small toolchain:
* **tox** for environment orchestration. It leverages the following:
* **pytest** for testing;
* **ruff** for linting and formatting
* **coverage** for reporting
* **pyproject.toml** as the authoritative project definition
Local development environments are expected to mirror CI behaviour.
## Retrieve from GitHub
[Section titled “Retrieve from GitHub”](#retrieve-from-github)
Terminal window
```
`
git clone git@github.com:caronc/apprise.git
cd apprise
`
```
## Install Tox
[Section titled “Install Tox”](#install-tox)
The most common way to install this dependency is:
Terminal window
```
`
pip install tox
`
```
If you are not using a virtual environment or have proper rights on the machine you’re using, you may need to use `pip3` or add the `--user` flag:
Terminal window
```
`
pip3 install tox --user
`
```
## Development Environment
[Section titled “Development Environment”](#development-environment)
Apprise works best just using a simple bare metal setup. The following commands can assist you:
Run the `apprise` cli from within the pulled code against any changes you made:
Terminal window
```
`
# Print version and exit
tox -e apprise -- -v
`
```
Simply use `tox -e apprise --` to act equivalently to the `apprise` CLI in an installed environment:
Terminal window
```
`
# Test a new or modified plugin (example: foobar://)
tox -e apprise -- -t "my title" -b "my body" \\
"foobar://credentials/direction?options="
`
```
### Running Tests
[Section titled “Running Tests”](#running-tests)
Test your added test coverage in `tests/` a similar way:
Terminal window
```
`
# 'minimal' just pulls in less dependencies which is usually adequate:
tox -e minimal
`
```
A Full QA can be run by swapping `minimal` with `qa`.
Terminal window
```
`
# 'qa' loads all dev libraries
tox -e qa
`
```
There is a ‘lot’ of tests; Apprise aims to maintain 100% test coverage. To avoid running through everything and only focus on your new tests, you can scope the tests runner to do this like so;
Terminal window
```
`
# use -k to filter the tests are run:
tox -e minimal -- -k "test\_foobar"
`
```
`-k test\_foobar` performs substring matching and would match:
```
`
- tests/test\_plugin\_foobar.py
├── def test\_foobar\_urls():
└── def test\_foobar\_advance():
`
```
You could add `-k test\_foobar\_urls` to just test 1 specific test:
```
`
- tests/test\_plugin\_foobar.py
├── def test\_foobar\_urls():
└── def test\_foobar\_advance():
`
```
## Quality Assurance and Testing
[Section titled “Quality Assurance and Testing”](#quality-assurance-and-testing)
Keep linting and formatting consistent across contributor environments:
Terminal window
```
`
# Lint (calls ruff under the hood)
tox -e lint
`
```
If you get an error with the above, you can use the auto-formatting which fixes most mistakes.
Terminal window
```
`
# Auto-format
tox -e format
`
```
## Test Expectations
[Section titled “Test Expectations”](#test-expectations)
Changes to core behaviour **must** include tests unless there is a strong justification.
General expectations:
* Test coverage for Apprise to remain at 100%
* Tests should reflect actual runtime behaviour
* Edge cases should be explicitly covered
* Existing test patterns should be followed
* Logging noise should be avoided in tests
Tests are part of the public contract of the project.
## Pull Request Guidelines
[Section titled “Pull Request Guidelines”](#pull-request-guidelines)
Before submitting a pull request:
* Tests pass locally for relevant environments
* Linting and formatting checks pass
* Changes are scoped and well-described
* Behavioural changes include rationale
If you added a new plugin, ensure that:
* The `README.md` in the root of the Apprise Repository is updated to reflect the change if necessary.
* The `packaging/redhat/apprise.spec` is updated to reflect the new service
* The `pyproject.toml` section called `keywords` includes the name of the new plugin
* Documentation has been prepared for the [Apprise Docs](https://github.com/caronc/apprise-docs) Repository (later reflected on [https://appriseit.com](https://appriseit.com)).
Pull requests are reviewed for correctness, maintainability, and long-term impact.
## Quick Checklist Before You Submit
[Section titled “Quick Checklist Before You Submit”](#quick-checklist-before-you-submit)
* Your change includes tests when practical.
* `tox -e qa` passes locally.
* `tox -e lint` passes locally.
* You run `tox -e format` when formatting changes are needed.
* Your pull request description clearly explains what changed and why.
## Licensing and Attribution
[Section titled “Licensing and Attribution”](#licensing-and-attribution)
Apprise is released under the BSD 2-Clause licence.
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