Frequently asked questions (FAQ) | Gemini CLI
[Skip to content](#_top)
# Frequently asked questions (FAQ)
Copy as Markdown Copied!
This page provides answers to common questions and solutions to frequent
problems encountered while using Gemini CLI.
## General issues
[Section titled “General issues”](#general-issues)
This section addresses common questions about Gemini CLI usage, security, and
troubleshooting general errors.
### Why can’t I use third-party software like Claude Code, OpenClaw, or OpenCode with Gemini CLI?
[Section titled “Why can’t I use third-party software like Claude Code, OpenClaw, or OpenCode with Gemini CLI?”](#why-cant-i-use-third-party-software-like-claude-code-openclaw-or-opencode-with-gemini-cli)
Using third-party software, tools, or services to harvest or piggyback on Gemini
CLI’s OAuth authentication to access our backend services is a direct violation
of our [applicable terms and policies](/docs/resources/tos-privacy). Doing so bypasses our
intended authentication and security structures, and such actions may be grounds
for immediate suspension or termination of your account. If you would like to
use a third-party coding agent with Gemini, the supported and secure method is
to use a Vertex AI or Google AI Studio API key.
### Why am I getting an `API error: 429 - Resource exhausted`?
[Section titled “Why am I getting an API error: 429 - Resource exhausted?”](#why-am-i-getting-an-api-error-429---resource-exhausted)
This error indicates that you have exceeded your API request limit. The Gemini
API has rate limits to prevent abuse and ensure fair usage.
To resolve this, you can:
* **Check your usage:** Review your API usage in the Google AI Studio or your
Google Cloud project dashboard.
* **Optimize your prompts:** If you are making many requests in a short period,
try to batch your prompts or introduce delays between requests.
* **Request a quota increase:** If you consistently need a higher limit, you can
request a quota increase from Google.
### Why am I getting an `ERR\_REQUIRE\_ESM` error when running `npm run start`?
[Section titled “Why am I getting an ERR\_REQUIRE\_ESM error when running npm run start?”](#why-am-i-getting-an-err_require_esm-error-when-running-npm-run-start)
This error typically occurs in Node.js projects when there is a mismatch between
CommonJS and ES Modules.
This is often due to a misconfiguration in your `package.json` or
`tsconfig.json`. Ensure that:
1. Your `package.json` has `"type": "module"`.
2. Your `tsconfig.json` has `"module": "NodeNext"` or a compatible setting in
the `compilerOptions`.
If the problem persists, try deleting your `node\_modules` directory and
`package-lock.json` file, and then run `npm install` again.
### Why don’t I see cached token counts in my stats output?
[Section titled “Why don’t I see cached token counts in my stats output?”](#why-dont-i-see-cached-token-counts-in-my-stats-output)
Cached token information is only displayed when cached tokens are being used.
This feature is available for API key users (Gemini API key or Google Cloud
Vertex AI) but not for OAuth users (such as Google Personal/Enterprise accounts
like Google Gmail or Google Workspace, respectively). This is because the Gemini
Code Assist API does not support cached content creation. You can still view
your total token usage using the `/stats` command in Gemini CLI.
## Installation and updates
[Section titled “Installation and updates”](#installation-and-updates)
### How do I check which version of Gemini CLI I’m currently running?
[Section titled “How do I check which version of Gemini CLI I’m currently running?”](#how-do-i-check-which-version-of-gemini-cli-im-currently-running)
You can check your current Gemini CLI version using one of these methods:
* Run `gemini --version` or `gemini -v` from your terminal
* Check the globally installed version using your package manager:
* npm: `npm list -g @google/gemini-cli`
* pnpm: `pnpm list -g @google/gemini-cli`
* yarn: `yarn global list @google/gemini-cli`
* bun: `bun pm ls -g @google/gemini-cli`
* homebrew: `brew list --versions gemini-cli`
* Inside an active Gemini CLI session, use the `/about` command
### How do I update Gemini CLI to the latest version?
[Section titled “How do I update Gemini CLI to the latest version?”](#how-do-i-update-gemini-cli-to-the-latest-version)
If you installed it globally via `npm`, update it using the command
`npm install -g @google/gemini-cli@latest`. If you compiled it from source, pull
the latest changes from the repository, and then rebuild using the command
`npm run build`.
## Platform-specific issues
[Section titled “Platform-specific issues”](#platform-specific-issues)
### Why does the CLI crash on Windows when I run a command like `chmod +x`?
[Section titled “Why does the CLI crash on Windows when I run a command like chmod +x?”](#why-does-the-cli-crash-on-windows-when-i-run-a-command-like-chmod-x)
Commands like `chmod` are specific to Unix-like operating systems (Linux,
macOS). They are not available on Windows by default.
To resolve this, you can:
* **Use Windows-equivalent commands:** Instead of `chmod`, you can use `icacls`
to modify file permissions on Windows.
* **Use a compatibility layer:** Tools like Git Bash or Windows Subsystem for
Linux (WSL) provide a Unix-like environment on Windows where these commands
will work.
## Configuration
[Section titled “Configuration”](#configuration)
### How do I configure my `GOOGLE\_CLOUD\_PROJECT`?
[Section titled “How do I configure my GOOGLE\_CLOUD\_PROJECT?”](#how-do-i-configure-my-google_cloud_project)
You can configure your Google Cloud Project ID using an environment variable.
Set the `GOOGLE\_CLOUD\_PROJECT` environment variable in your shell:
**macOS/Linux**
Terminal window
```
`
export GOOGLE\_CLOUD\_PROJECT="your-project-id"
`
```
**Windows (PowerShell)**
Terminal window
```
`
$env:GOOGLE\_CLOUD\_PROJECT="your-project-id"
`
```
To make this setting permanent, add this line to your shell’s startup file (for
example, `\~/.bashrc`, `\~/.zshrc`).
### What is the best way to store my API keys securely?
[Section titled “What is the best way to store my API keys securely?”](#what-is-the-best-way-to-store-my-api-keys-securely)
Exposing API keys in scripts or checking them into source control is a security
risk.
To store your API keys securely, you can:
* **Use a `.env` file:** Create a `.env` file in your project’s `.gemini`
directory (`.gemini/.env`) and store your keys there. Gemini CLI will
automatically load these variables.
* **Use your system’s keyring:** For the most secure storage, use your operating
system’s secret management tool (like macOS Keychain, Windows Credential
Manager, or a secret manager on Linux). You can then have your scripts or
environment load the key from the secure storage at runtime.
### Where are Gemini CLI configuration and settings files stored?
[Section titled “Where are Gemini CLI configuration and settings files stored?”](#where-are-gemini-cli-configuration-and-settings-files-stored)
Gemini CLI configuration is stored in two `settings.json` files:
1. In your home directory: `\~/.gemini/settings.json`.
2. In your project’s root directory: `./.gemini/settings.json`.
Refer to [Gemini CLI Configuration](/docs/reference/configuration) for more
details.
## Google AI Pro/Ultra and subscription FAQs
[Section titled “Google AI Pro/Ultra and subscription FAQs”](#google-ai-proultra-and-subscription-faqs)
### Where can I learn more about my Google AI Pro or Google AI Ultra subscription?
[Section titled “Where can I learn more about my Google AI Pro or Google AI Ultra subscription?”](#where-can-i-learn-more-about-my-google-ai-pro-or-google-ai-ultra-subscription)
To learn more about your Google AI Pro or Google AI Ultra subscription, visit
**Manage subscription** in your [subscription settings](https://one.google.com).
### How do I know if I have higher limits for Google AI Pro or Ultra?
[Section titled “How do I know if I have higher limits for Google AI Pro or Ultra?”](#how-do-i-know-if-i-have-higher-limits-for-google-ai-pro-or-ultra)
If you’re subscribed to Google AI Pro or Ultra, you automatically have higher
limits to Gemini Code Assist and Gemini CLI. These are shared across Gemini CLI
and agent mode in the IDE. You can confirm you have higher limits by checking if
you are still subscribed to Google AI Pro or Ultra in your
[subscription settings](https://one.google.com).
### What is the privacy policy for using Gemini Code Assist or Gemini CLI if I’ve subscribed to Google AI Pro or Ultra?
[Section titled “What is the privacy policy for using Gemini Code Assist or Gemini CLI if I’ve subscribed to Google AI Pro or Ultra?”](#what-is-the-privacy-policy-for-using-gemini-code-assist-or-gemini-cli-if-ive-subscribed-to-google-ai-pro-or-ultra)
To learn more about your privacy policy and terms of service governed by your
subscription, visit
[Gemini Code Assist: Terms of Service and Privacy Policies](https://developers.google.com/gemini-code-assist/resources/privacy-notices).
### I’ve upgraded to Google AI Pro or Ultra but it still says I am hitting quota limits. Is this a bug?
[Section titled “I’ve upgraded to Google AI Pro or Ultra but it still says I am hitting quota limits. Is this a bug?”](#ive-upgraded-to-google-ai-pro-or-ultra-but-it-still-says-i-am-hitting-quota-limits-is-this-a-bug)
The higher limits in your Google AI Pro or Ultra subscription are for Gemini 2.5
across both Gemini 2.5 Pro and Flash. They are shared quota across Gemini CLI
and agent mode in Gemini Code Assist IDE extensions. You can learn more about
quota limits for Gemini CLI, Gemini Code Assist and agent mode in Gemini Code
Assist at
[Quotas and limits](https://developers.google.com/gemini-code-assist/resources/quotas).
### If I upgrade to higher limits for Gemini CLI and Gemini Code Assist by purchasing a Google AI Pro or Ultra subscription, will Gemini start using my data to improve its machine learning models?
[Section titled “If I upgrade to higher limits for Gemini CLI and Gemini Code Assist by purchasing a Google AI Pro or Ultra subscription, will Gemini start using my data to improve its machine learning models?”](#if-i-upgrade-to-higher-limits-for-gemini-cli-and-gemini-code-assist-by-purchasing-a-google-ai-pro-or-ultra-subscription-will-gemini-start-using-my-data-to-improve-its-machine-learning-models)
Google does not use your data to improve Google’s machine learning models if you
purchase a paid plan. Note: If you decide to remain on the free version of
Gemini Code Assist, Gemini Code Assist for individuals, you can also opt out of
using your data to improve Google’s machine learning models. See the
[Gemini Code Assist for individuals privacy notice](https://developers.google.com/gemini-code-assist/resources/privacy-notice-gemini-code-assist-individuals)
for more information.
## Not seeing your question?
[Section titled “Not seeing your question?”](#not-seeing-your-question)
Search the
[Gemini CLI Q&A discussions on GitHub](https://github.com/google-gemini/gemini-cli/discussions/categories/q-a)
or
[start a new discussion on GitHub](https://github.com/google-gemini/gemini-cli/discussions/new?category=q-a)
Last updated: Apr 10, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.