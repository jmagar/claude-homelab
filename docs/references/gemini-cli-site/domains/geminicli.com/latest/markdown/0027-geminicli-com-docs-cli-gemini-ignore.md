Ignoring files | Gemini CLI
[Skip to content](#_top)
# Ignoring files
Copy as Markdown Copied!
This document provides an overview of the Gemini Ignore (`.geminiignore`)
feature of Gemini CLI.
Gemini CLI includes the ability to automatically ignore files, similar to
`.gitignore` (used by Git) and `.aiexclude` (used by Gemini Code Assist). Adding
paths to your `.geminiignore` file will exclude them from tools that support
this feature, although they will still be visible to other services (such as
Git).
## How it works
[Section titled “How it works”](#how-it-works)
When you add a path to your `.geminiignore` file, tools that respect this file
will exclude matching files and directories from their operations. For example,
when you use the `@` command to share files, any paths in your `.geminiignore`
file will be automatically excluded.
For the most part, `.geminiignore` follows the conventions of `.gitignore`
files:
* Blank lines and lines starting with `#` are ignored.
* Standard glob patterns are supported (such as `\*`, `?`, and `[]`).
* Putting a `/` at the end will only match directories.
* Putting a `/` at the beginning anchors the path relative to the
`.geminiignore` file.
* `!` negates a pattern.
You can update your `.geminiignore` file at any time. To apply the changes, you
must restart your Gemini CLI session.
## How to use `.geminiignore`
[Section titled “How to use .geminiignore”](#how-to-use-geminiignore)
To enable `.geminiignore`:
1. Create a file named `.geminiignore` in the root of your project directory.
To add a file or directory to `.geminiignore`:
1. Open your `.geminiignore` file.
2. Add the path or file you want to ignore, for example: `/archive/` or
`apikeys.txt`.
### `.geminiignore` examples
[Section titled “.geminiignore examples”](#geminiignore-examples)
You can use `.geminiignore` to ignore directories and files:
```
`
# Exclude your /packages/ directory and all subdirectories
/packages/
# Exclude your apikeys.txt file
apikeys.txt
`
```
You can use wildcards in your `.geminiignore` file with `\*`:
```
`
# Exclude all .md files
\*.md
`
```
Finally, you can exclude files and directories from exclusion with `!`:
```
`
# Exclude all .md files except README.md
\*.md
!README.md
`
```
To remove paths from your `.geminiignore` file, delete the relevant lines.
Last updated: Apr 10, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.