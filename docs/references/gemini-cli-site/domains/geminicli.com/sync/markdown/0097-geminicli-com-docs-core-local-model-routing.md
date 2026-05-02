Manual Local Model Routing Setup (experimental) | Gemini CLI
[Skip to content](#_top)
# Manual Local Model Routing Setup (experimental)
Copy as Markdown Copied!
Gemini CLI supports using a local model for
[routing decisions](/docs/cli/model-routing). When configured, Gemini CLI will
use a locally-running **Gemma** model to make routing decisions (instead of
sending routing decisions to a hosted model).
This is an experimental feature currently under active development.
**Recommended:** We now provide a fully automated setup command. We recommend
using the [`gemini gemma` Setup Guide](/docs/core/gemma-setup) instead of following
these manual steps.
This feature can help reduce costs associated with hosted model usage while
offering similar routing decision latency and quality.
## Manual Setup
[Section titled “Manual Setup”](#manual-setup)
Using a Gemma model for routing decisions requires that an implementation of a
Gemma model be running locally on your machine, served behind an HTTP endpoint
and accessed via the Gemini API. If you cannot use the `gemini gemma setup`
command, follow these manual steps:
### Download the LiteRT-LM runtime
[Section titled “Download the LiteRT-LM runtime”](#download-the-litert-lm-runtime)
The [LiteRT-LM](https://github.com/google-ai-edge/LiteRT-LM) runtime offers
pre-built binaries for locally-serving models. Download the binary appropriate
for your system.
#### Windows
[Section titled “Windows”](#windows)
1. Download
[lit.windows\_x86\_64.exe](https://github.com/google-ai-edge/LiteRT-LM/releases/download/v0.9.0-alpha03/lit.windows_x86_64.exe).
2. Using GPU on Windows requires the DirectXShaderCompiler. Download the
[dxc zip from the latest release](https://github.com/microsoft/DirectXShaderCompiler/releases/download/v1.8.2505.1/dxc_2025_07_14.zip).
Unzip the archive and from the architecture-appropriate `bin\\` directory, and
copy the `dxil.dll` and `dxcompiler.dll` into the same location as you saved
`lit.windows\_x86\_64.exe`.
3. (Optional) Test starting the runtime:
`.\\lit.windows\_x86\_64.exe serve --verbose`
#### Linux
[Section titled “Linux”](#linux)
1. Download
[lit.linux\_x86\_64](https://github.com/google-ai-edge/LiteRT-LM/releases/download/v0.9.0-alpha03/lit.linux_x86_64).
2. Ensure the binary is executable: `chmod a+x lit.linux\_x86\_64`
3. (Optional) Test starting the runtime: `./lit.linux\_x86\_64 serve --verbose`
#### MacOS
[Section titled “MacOS”](#macos)
1. Download
[lit-macos-arm64](https://github.com/google-ai-edge/LiteRT-LM/releases/download/v0.9.0-alpha03/lit.macos_arm64).
2. Ensure the binary is executable: `chmod a+x lit.macos\_arm64`
3. (Optional) Test starting the runtime: `./lit.macos\_arm64 serve --verbose`
>
**> Note
**> : MacOS can be configured to only allows binaries from “App Store &#x26;> Known Developers”. If you encounter an error message when attempting to runthe binary, you will need to allow the application. One option is to visit
`> System Settings -> Privacy &#x26; Security
`> , scroll to
`> Security
`> , and click
`> "Allow Anyway"
`> for
`> "lit.macos_arm64"
`> . Another option is to run
`> xattr -d com.apple.quarantine lit.macos_arm64
`> from the commandline.
>
### Download the Gemma Model
[Section titled “Download the Gemma Model”](#download-the-gemma-model)
Before using Gemma, you will need to download the model (and agree to the Terms
of Service).
This can be done via the LiteRT-LM runtime.
#### Windows
[Section titled “Windows”](#windows-1)
Terminal window
```
`
$ .\\lit.windows\_x86\_64.exe pull gemma3-1b-gpu-custom
[Legal] The model you are about to download is governed by
the Gemma Terms of Use and Prohibited Use Policy. Please review these terms and ensure you agree before continuing.
Full Terms: https://ai.google.dev/gemma/terms
Prohibited Use Policy: https://ai.google.dev/gemma/prohibited\_use\_policy
Do you accept these terms? (Y/N): Y
Terms accepted.
Downloading model 'gemma3-1b-gpu-custom' ...
Downloading... 968.6 MB
Download complete.
`
```
#### Linux
[Section titled “Linux”](#linux-1)
Terminal window
```
`
$ ./lit.linux\_x86\_64 pull gemma3-1b-gpu-custom
[Legal] The model you are about to download is governed by
the Gemma Terms of Use and Prohibited Use Policy. Please review these terms and ensure you agree before continuing.
Full Terms: https://ai.google.dev/gemma/terms
Prohibited Use Policy: https://ai.google.dev/gemma/prohibited\_use\_policy
Do you accept these terms? (Y/N): Y
Terms accepted.
Downloading model 'gemma3-1b-gpu-custom' ...
Downloading... 968.6 MB
Download complete.
`
```
#### MacOS
[Section titled “MacOS”](#macos-1)
Terminal window
```
`
$ ./lit.lit.macos\_arm64 pull gemma3-1b-gpu-custom
[Legal] The model you are about to download is governed by
the Gemma Terms of Use and Prohibited Use Policy. Review these terms and ensure you agree before continuing.
Full Terms: https://ai.google.dev/gemma/terms
Prohibited Use Policy: https://ai.google.dev/gemma/prohibited\_use\_policy
Do you accept these terms? (Y/N): Y
Terms accepted.
Downloading model 'gemma3-1b-gpu-custom' ...
Downloading... 968.6 MB
Download complete.
`
```
### Start LiteRT-LM Runtime
[Section titled “Start LiteRT-LM Runtime”](#start-litert-lm-runtime)
Using the command appropriate to your system, start the LiteRT-LM runtime.
Configure the port that you want to use for your Gemma model. For the purposes
of this document, we will use port `9379`.
Example command for MacOS: `./lit.macos\_arm64 serve --port=9379 --verbose`
### (Optional) Verify Model Serving
[Section titled “(Optional) Verify Model Serving”](#optional-verify-model-serving)
Send a quick prompt to the model via HTTP to validate successful model serving.
This will cause the runtime to download the model and run it once.
You should see a short joke in the server output as an indicator of success.
#### Windows
[Section titled “Windows”](#windows-2)
```
`
# Run this in PowerShell to send a request to the server
$uri = "http://localhost:9379/v1beta/models/gemma3-1b-gpu-custom:generateContent"
$body = @{contents = @( @{
role = "user"
parts = @( @{ text = "Tell me a joke." } )
})} | ConvertTo-Json -Depth 10
Invoke-RestMethod -Uri $uri -Method Post -Body $body -ContentType "application/json"
`
```
#### Linux/MacOS
[Section titled “Linux/MacOS”](#linuxmacos)
Terminal window
```
`
$ curl "http://localhost:9379/v1beta/models/gemma3-1b-gpu-custom:generateContent" \\
-H 'Content-Type: application/json' \\
-X POST \\
-d '{"contents":[{"role":"user","parts":[{"text":"Tell me a joke."}]}]}'
`
```
## Configuration
[Section titled “Configuration”](#configuration)
To use a local Gemma model for routing, you must explicitly enable it in your
`settings.json`:
```
`
{
"experimental": {
"gemmaModelRouter": {
"enabled": true,
"classifier": {
"host": "http://localhost:9379",
"model": "gemma3-1b-gpu-custom"
}
}
}
}
`
```
>
> Use the port you started your LiteRT-LM runtime on in the setup steps.
>
### Configuration schema
[Section titled “Configuration schema”](#configuration-schema)
|Field|Type|Required|Description|
|`enabled`|boolean|Yes|Must be `true` to enable the feature.|
|`classifier`|object|Yes|The configuration for the local model endpoint. It includes the host and model specifiers.|
|`classifier.host`|string|Yes|The URL to the local model server. Should be `http://localhost:\<port\>`.|
|`classifier.model`|string|Yes|The model name to use for decisions. Must be `"gemma3-1b-gpu-custom"`.|
>
**> Note: You will need to restart after configuration changes for local modelrouting to take effect.
**
>
Last updated: Apr 29, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.