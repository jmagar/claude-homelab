Get started with Gemini CLI | Gemini CLI
[Skip to content](#_top)
# Get started with Gemini CLI
Copy as Markdown Copied!
Welcome to Gemini CLI! This guide will help you install, configure, and start
using Gemini CLI to enhance your workflow right from your terminal.
## Quickstart: Install, authenticate, configure, and use Gemini CLI
[Section titled “Quickstart: Install, authenticate, configure, and use Gemini CLI”](#quickstart-install-authenticate-configure-and-use-gemini-cli)
Gemini CLI brings the power of advanced language models directly to your command
line interface. As an AI-powered assistant, Gemini CLI can help you with a
variety of tasks, from understanding and generating code to reviewing and
editing documents.
## Install
[Section titled “Install”](#install)
The standard method to install and run Gemini CLI uses `npm`:
Terminal window
```
`
npm install -g @google/gemini-cli
`
```
Once Gemini CLI is installed, run Gemini CLI from your command line:
Terminal window
```
`
gemini
`
```
For more installation options, see
[Gemini CLI Installation](/docs/get-started/installation).
## Authenticate
[Section titled “Authenticate”](#authenticate)
To begin using Gemini CLI, you must authenticate with a Google service. In most
cases, you can log in with your existing Google account:
1. Run Gemini CLI after installation:
Terminal window
```
`
gemini
`
```
2. When asked “How would you like to authenticate for this project?” select **1.
Sign in with Google**.
3. Select your Google account.
4. Click on **Sign in**.
Certain account types may require you to configure a Google Cloud project. For
more information, including other authentication methods, see
[Gemini CLI Authentication Setup](/docs/get-started/authentication).
## Configure
[Section titled “Configure”](#configure)
Gemini CLI offers several ways to configure its behavior, including environment
variables, command-line arguments, and settings files.
To explore your configuration options, see
[Gemini CLI Configuration](/docs/reference/configuration).
## Use
[Section titled “Use”](#use)
Once installed and authenticated, you can start using Gemini CLI by issuing
commands and prompts in your terminal. Ask it to generate code, explain files,
and more.
These examples demonstrate potential capabilities. Your actual
results can vary based on the model used and your project environment.
### Rename your photographs based on content
[Section titled “Rename your photographs based on content”](#rename-your-photographs-based-on-content)
You can use Gemini CLI to automate file management tasks that require visual
analysis. In this example, Gemini CLI renames images based on their actual
subject matter.
Scenario: You have a folder containing the following files:
Terminal window
```
`
photos/photo1.png
photos/photo2.png
photos/photo3.png
`
```
Give Gemini the following prompt:
```
`
Rename the photos in my "photos" directory based on their contents.
`
```
Result: Gemini asks for permission to rename your files.
Select **Allow once** and your files are renamed:
Terminal window
```
`
photos/yellow\_flowers.png
photos/antique\_dresser.png
photos/green\_android\_robot.png
`
```
### Explain a repository by reading its code
[Section titled “Explain a repository by reading its code”](#explain-a-repository-by-reading-its-code)
Gemini CLI is effective for rapid codebase exploration. The following example
shows how to ask Gemini CLI to fetch, analyze, and summarize a remote project.
Scenario: You want to understand how a popular open-source utility works by
inspecting its code, not just its README.
Give Gemini CLI the following prompt:
```
`
Clone the 'chalk' repository from https://github.com/chalk/chalk, read its key source files, and explain how it works.
`
```
Result: Gemini performs a sequence of actions to answer your request.
1. First, it asks for permission to run `git clone` to download the repository.
2. Next, it finds the important source files and asks for permission to read
them.
3. Finally, after analyzing the code, it provides a summary.
Gemini CLI returns an explanation based on the actual source code:
```
`
The `chalk` library is a popular npm package for styling terminal output with
colors. After analyzing the source code, here's how it works:
- \*\*Core functionality:\*\* The main file sets up a chainable API. Each color or
modifier (like `bold` or `italic`) is a getter that appends the corresponding
ANSI escape code to an internal stack.
- \*\*Chainable API:\*\* When you call `chalk.red.bold('Hello')`, you are accessing
getters. The `red` getter adds the red color code, and the `bold` getter adds
the bold code.
- \*\*Output generation:\*\* When the chain is treated as a string (for example, in
`console.log`), a final `toString()` method is called. This method joins all
the stored ANSI codes, wraps them around the input string ('Hello'), and adds
a reset code at the end. This produces the final, styled string that the
terminal can render.
`
```
### Combine two spreadsheets into one spreadsheet
[Section titled “Combine two spreadsheets into one spreadsheet”](#combine-two-spreadsheets-into-one-spreadsheet)
Gemini CLI can process and transform data across multiple files. Use this
capability to merge reports or reformat data sets without manual copying.
Scenario: You have two .csv files: `Revenue - 2023.csv` and
`Revenue - 2024.csv`. Each file contains monthly revenue figures.
Give Gemini CLI the following prompt:
```
`
Combine the two .csv files into a single .csv file, with each year a different column.
`
```
Result: Gemini CLI reads each file and then asks for permission to write a new
file. Provide your permission and Gemini CLI provides the combined data:
```
`
Month,2023,2024
January,0,1000
February,0,1200
March,0,2400
April,900,500
May,1000,800
June,1000,900
July,1200,1000
August,1800,400
September,2000,2000
October,2400,3400
November,3400,1800
December,2100,9000
`
```
### Run unit tests
[Section titled “Run unit tests”](#run-unit-tests)
Gemini CLI can generate boilerplate code and tests based on your existing
implementation. This example demonstrates how to request code coverage for a
JavaScript component.
Scenario: You’ve written a simple login page. You wish to write unit tests to
ensure that your login page has code coverage.
Give Gemini CLI the following prompt:
```
`
Write unit tests for Login.js.
`
```
Result: Gemini CLI asks for permission to write a new file and creates a test
for your login page.
## Check usage and quota
[Section titled “Check usage and quota”](#check-usage-and-quota)
You can check your current token usage and quota information using the
`/stats model` command. This command provides a snapshot of your current
session’s token usage, as well as your overall quota and usage for the supported
models.
For more information on the `/stats` command and its subcommands, see the
[Command Reference](/docs/reference/commands#stats).
## Next steps
[Section titled “Next steps”](#next-steps)
* Follow the [File management](/docs/cli/tutorials/file-management) guide to
start working with your codebase.
* See [Shell commands](/docs/cli/tutorials/shell-commands) to learn about
terminal integration.
Last updated: Apr 17, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.