Gemini CLI authentication setup | Gemini CLI
[Skip to content](#_top)
# Gemini CLI authentication setup
Copy as Markdown Copied!
To use Gemini CLI, you’ll need to authenticate with Google. This guide helps you
quickly find the best way to sign in based on your account type and how you’re
using the CLI.
Looking for a high-level comparison of all available subscriptions?
To compare features and find the right quota for your needs, see our
[Plans page](https://geminicli.com/plans/).
For most users, we recommend starting Gemini CLI and logging in with your
personal Google account.
## Choose your authentication method
[Section titled “Choose your authentication method ”](#choose-your-authentication-method)
Select the authentication method that matches your situation in the table below:
|User Type / Scenario|Recommended Authentication Method|Google Cloud Project Required|
|Individual Google accounts|[Sign in with Google](#login-google)|No, with exceptions|
|Organization users with a company, school, or Google Workspace account|[Sign in with Google](#login-google)|[Yes](#set-gcp)|
|AI Studio user with a Gemini API key|[Use Gemini API Key](#gemini-api)|No|
|Google Cloud Vertex AI user|[Vertex AI](#vertex-ai)|[Yes](#set-gcp)|
|[Headless mode](#headless)|[Use Gemini API Key](#gemini-api) or
[Vertex AI](#vertex-ai)|No (for Gemini API Key)
[Yes](#set-gcp) (for Vertex AI)|
### What is my Google account type?
[Section titled “What is my Google account type?”](#what-is-my-google-account-type)
* **Individual Google accounts:** Includes all
[free tier accounts](/docs/resources/quota-and-pricing#free-usage) such as
Gemini Code Assist for individuals, as well as paid subscriptions for
[Google AI Pro and Ultra](https://gemini.google/subscriptions/).
* **Organization accounts:** Accounts using paid licenses through an
organization such as a company, school, or
[Google Workspace](https://workspace.google.com/). Includes
[Google AI Ultra for Business](https://support.google.com/a/answer/16345165)
subscriptions.
## (Recommended) Sign in with Google
[Section titled “(Recommended) Sign in with Google ”](#recommended-sign-in-with-google)
If you run Gemini CLI on your local machine, the simplest authentication method
is logging in with your Google account. This method requires a web browser on a
machine that can communicate with the terminal running Gemini CLI (for example,
your local machine).
If you are a **Google AI Pro** or **Google AI Ultra** subscriber, use the Google
account associated with your subscription.
To authenticate and use Gemini CLI:
1. Start the CLI:
Terminal window
```
`
gemini
`
```
2. Select **Sign in with Google**. Gemini CLI opens a sign in prompt using your
web browser. Follow the on-screen instructions. Your credentials will be
cached locally for future sessions.
### Do I need to set my Google Cloud project?
[Section titled “Do I need to set my Google Cloud project?”](#do-i-need-to-set-my-google-cloud-project)
Most individual Google accounts (free and paid) don’t require a Google Cloud
project for authentication. However, you’ll need to set a Google Cloud project
when you meet at least one of the following conditions:
* You are using a company, school, or Google Workspace account.
* You are using a Gemini Code Assist license from the Google Developer Program.
* You are using a license from a Gemini Code Assist subscription.
For instructions, see [Set your Google Cloud Project](#set-gcp).
## Use Gemini API key
[Section titled “Use Gemini API key ”](#use-gemini-api-key)
If you don’t want to authenticate using your Google account, you can use an API
key from Google AI Studio.
To authenticate and use Gemini CLI with a Gemini API key:
1. Obtain your API key from
[Google AI Studio](https://aistudio.google.com/app/apikey).
2. Set the `GEMINI\_API\_KEY` environment variable to your key. For example:
* [ macOS/Linux ](#tab-panel-8)
* [ Windows (PowerShell) ](#tab-panel-9)
Terminal window
```
`
# Replace YOUR\_GEMINI\_API\_KEY with the key from AI Studio
export GEMINI\_API\_KEY="YOUR\_GEMINI\_API\_KEY"
`
```
To make this setting persistent, see
[Persisting Environment Variables](#persisting-vars).
* Start the CLI:
Terminal window
```
`
gemini
`
```
* Select **Use Gemini API key**.
Treat API keys, especially for services like Gemini, as sensitive
credentials. Protect them to prevent unauthorized access and potential misuse
of the service under your account.
## Use Vertex AI
[Section titled “Use Vertex AI ”](#use-vertex-ai)
To use Gemini CLI with Google Cloud’s Vertex AI platform, choose from the
following authentication options:
* A. Application Default Credentials (ADC) using `gcloud`.
* B. Service account JSON key.
* C. Google Cloud API key.
Regardless of your authentication method for Vertex AI, you’ll need to set
`GOOGLE\_CLOUD\_PROJECT` to your Google Cloud project ID with the Vertex AI API
enabled, and `GOOGLE\_CLOUD\_LOCATION` to the location of your Vertex AI resources
or the location where you want to run your jobs.
For example:
* [ macOS/Linux ](#tab-panel-4)
* [ Windows (PowerShell) ](#tab-panel-5)
Terminal window
```
`
# Replace with your project ID and desired location (for example, us-central1)
export GOOGLE\_CLOUD\_PROJECT="YOUR\_PROJECT\_ID"
export GOOGLE\_CLOUD\_LOCATION="YOUR\_PROJECT\_LOCATION"
`
```
To make any Vertex AI environment variable settings persistent, see
[Persisting Environment Variables](#persisting-vars).
#### A. Vertex AI - application default credentials (ADC) using `gcloud`
[Section titled “A. Vertex AI - application default credentials (ADC) using gcloud”](#a-vertex-ai---application-default-credentials-adc-using-gcloud)
Consider this authentication method if you have Google Cloud CLI installed.
If you have previously set `GOOGLE\_API\_KEY` or `GEMINI\_API\_KEY`, you must unset
them to use ADC.
* [ macOS/Linux ](#tab-panel-0)
* [ Windows (PowerShell) ](#tab-panel-1)
Terminal window
```
`
unset GOOGLE\_API\_KEY GEMINI\_API\_KEY
`
```
1. Verify you have a Google Cloud project and Vertex AI API is enabled.
2. Log in to Google Cloud:
Terminal window
```
`
gcloud auth application-default login
`
```
3. [Configure your Google Cloud Project](#set-gcp).
4. Start the CLI:
Terminal window
```
`
gemini
`
```
5. Select **Vertex AI**.
#### B. Vertex AI - service account JSON key
[Section titled “B. Vertex AI - service account JSON key”](#b-vertex-ai---service-account-json-key)
Consider this method of authentication in non-interactive environments, CI/CD
pipelines, or if your organization restricts user-based ADC or API key creation.
If you have previously set `GOOGLE\_API\_KEY` or `GEMINI\_API\_KEY`, you must unset
them:
* [ macOS/Linux ](#tab-panel-2)
* [ Windows (PowerShell) ](#tab-panel-3)
Terminal window
```
`
unset GOOGLE\_API\_KEY GEMINI\_API\_KEY
`
```
1. [Create a service account and key](https://cloud.google.com/iam/docs/keys-create-delete)
and download the provided JSON file. Assign the “Vertex AI User” role to the
service account.
2. Set the `GOOGLE\_APPLICATION\_CREDENTIALS` environment variable to the JSON
file’s absolute path. For example:
* [ macOS/Linux ](#tab-panel-10)
* [ Windows (PowerShell) ](#tab-panel-11)
Terminal window
```
`
# Replace /path/to/your/keyfile.json with the actual path
export GOOGLE\_APPLICATION\_CREDENTIALS="/path/to/your/keyfile.json"
`
```
* [Configure your Google Cloud Project](#set-gcp).
* Start the CLI:
Terminal window
```
`
gemini
`
```
* Select **Vertex AI**.
Protect your service account key file as it gives access to
your resources.
#### C. Vertex AI - Google Cloud API key
[Section titled “C. Vertex AI - Google Cloud API key”](#c-vertex-ai---google-cloud-api-key)
1. Obtain a Google Cloud API key:
[Get an API Key](https://cloud.google.com/vertex-ai/generative-ai/docs/start/api-keys?usertype=newuser).
2. Set the `GOOGLE\_API\_KEY` environment variable:
* [ macOS/Linux ](#tab-panel-12)
* [ Windows (PowerShell) ](#tab-panel-13)
Terminal window
```
`
# Replace YOUR\_GOOGLE\_API\_KEY with your Vertex AI API key
export GOOGLE\_API\_KEY="YOUR\_GOOGLE\_API\_KEY"
`
```
If you see errors like `"API keys are not supported by this API..."`, your
organization might restrict API key usage for this service. Try the other
Vertex AI authentication methods instead.
* [Configure your Google Cloud Project](#set-gcp).
* Start the CLI:
Terminal window
```
`
gemini
`
```
* Select **Vertex AI**.
## Set your Google Cloud project
[Section titled “Set your Google Cloud project ”](#set-your-google-cloud-project)
Most individual Google accounts (free and paid) don’t require a
Google Cloud project for authentication.
When you sign in using your Google account, you may need to configure a Google
Cloud project for Gemini CLI to use. This applies when you meet at least one of
the following conditions:
* You are using a Company, School, or Google Workspace account.
* You are using a Gemini Code Assist license from the Google Developer Program.
* You are using a license from a Gemini Code Assist subscription.
To configure Gemini CLI to use a Google Cloud project, do the following:
1. [Find your Google Cloud Project ID](https://support.google.com/googleapi/answer/7014113).
2. [Enable the Gemini for Cloud API](https://cloud.google.com/gemini/docs/discover/set-up-gemini#enable-api).
3. [Configure necessary IAM access permissions](https://cloud.google.com/gemini/docs/discover/set-up-gemini#grant-iam).
4. Configure your environment variables. Set either the `GOOGLE\_CLOUD\_PROJECT`
or `GOOGLE\_CLOUD\_PROJECT\_ID` variable to the project ID to use with Gemini
CLI. Gemini CLI checks for `GOOGLE\_CLOUD\_PROJECT` first, then falls back to
`GOOGLE\_CLOUD\_PROJECT\_ID`.
For example, to set the `GOOGLE\_CLOUD\_PROJECT\_ID` variable:
* [ macOS/Linux ](#tab-panel-14)
* [ Windows (PowerShell) ](#tab-panel-15)
Terminal window
```
`
# Replace YOUR\_PROJECT\_ID with your actual Google Cloud project ID
export GOOGLE\_CLOUD\_PROJECT="YOUR\_PROJECT\_ID"
`
```
To make this setting persistent, see
[Persisting Environment Variables](#persisting-vars).
## Persisting environment variables
[Section titled “Persisting environment variables ”](#persisting-environment-variables)
To avoid setting environment variables for every terminal session, you can
persist them with the following methods:
1. **Add your environment variables to your shell configuration file:** Append
the environment variable commands to your shell’s startup file.
* [ macOS/Linux ](#tab-panel-6)
* [ Windows (PowerShell) ](#tab-panel-7)
(for example, `\~/.bashrc`, `\~/.zshrc`, or `\~/.profile`):
Terminal window
```
`
echo 'export GOOGLE\_CLOUD\_PROJECT="YOUR\_PROJECT\_ID"' \>\> \~/.bashrc
source \~/.bashrc
`
```
Be aware that when you export API keys or service account
paths in your shell configuration file, any process launched from that
shell can read them.
1. **Use a `.env` file:** Create a `.gemini/.env` file in your project
directory or home directory. Gemini CLI automatically loads variables from
the first `.env` file it finds, searching up from the current directory,
then in your home directory’s `.gemini/.env` (for example, `\~/.gemini/.env`
or `%USERPROFILE%\\.gemini\\.env`).
Example for user-wide settings:
* [ macOS/Linux ](#tab-panel-16)
* [ Windows (PowerShell) ](#tab-panel-17)
Terminal window
```
`
mkdir -p \~/.gemini
cat \>\> \~/.gemini/.env \<\<'EOF'
GOOGLE\_CLOUD\_PROJECT="your-project-id"
# Add other variables like GEMINI\_API\_KEY as needed
EOF
`
```
Variables are loaded from the first file found, not merged.
## Running in Google Cloud environments
[Section titled “Running in Google Cloud environments ”](#running-in-google-cloud-environments)
When running Gemini CLI within certain Google Cloud environments, authentication
is automatic.
In a Google Cloud Shell environment, Gemini CLI typically authenticates
automatically using your Cloud Shell credentials. In Compute Engine
environments, Gemini CLI automatically uses Application Default Credentials
(ADC) from the environment’s metadata server.
If automatic authentication fails, use one of the interactive methods described
on this page.
## Running in headless mode
[Section titled “Running in headless mode ”](#running-in-headless-mode)
[Headless mode](/docs/cli/headless) will use your existing authentication
method, if an existing authentication credential is cached.
If you have not already signed in with an authentication credential, you must
configure authentication using environment variables:
* [Use Gemini API Key](#gemini-api)
* [Vertex AI](#vertex-ai)
## What’s next?
[Section titled “What’s next?”](#whats-next)
Your authentication method affects your quotas, pricing, Terms of Service, and
privacy notices. Review the following pages to learn more:
* [Gemini CLI: Quotas and Pricing](/docs/resources/quota-and-pricing).
* [Gemini CLI: Terms of Service and Privacy Notice](/docs/resources/tos-privacy).
Last updated: Apr 17, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.