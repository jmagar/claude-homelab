Creating Agent Skills | Gemini CLI
[Skip to content](#_top)
# Creating Agent Skills
Copy as Markdown Copied!
Agent Skills let you extend Gemini CLI with specialized expertise, procedural
workflows, and task-specific resources. This guide walks you through both
automated and manual methods for creating and organizing your skills.
## Quickstart: Create a skill with a prompt
[Section titled “Quickstart: Create a skill with a prompt”](#quickstart-create-a-skill-with-a-prompt)
The fastest way to create a new skill is to use the built-in `skill-creator`.
This meta-skill guides you through designing, scaffolding, and validating your
expertise.
Simply ask Gemini CLI to create a skill for you:
>
> “Create a new skill called ‘code-reviewer’ that analyzes local files forcommon errors and style violations.”
>
Gemini will then:
1. Generate a new directory for your skill (for example, `my-new-skill/`).
2. Create a `SKILL.md` file with the necessary YAML frontmatter (`name` and
`description`).
3. Create the standard resource directories: `scripts/`, `references/`, and
`assets/`.
Once created, you can find your new skill in `.gemini/skills/code-reviewer/`.
## Manual creation
[Section titled “Manual creation”](#manual-creation)
1. **Create a directory** for your skill (for example, `my-new-skill/`).
2. **Create a `SKILL.md` file** inside the new directory.
### 1. Create the directory structure
[Section titled “1. Create the directory structure”](#1-create-the-directory-structure)
The first step is to create the necessary folders for your skill and its
scripts.
**macOS/Linux**
Terminal window
```
`
mkdir -p .gemini/skills/code-reviewer/scripts
`
```
**Windows (PowerShell)**
Terminal window
```
`
New-Item -ItemType Directory -Force -Path ".gemini\\skills\\code-reviewer\\scripts"
`
```
### 2. Define the skill (`SKILL.md`)
[Section titled “2. Define the skill (SKILL.md)”](#2-define-the-skill-skillmd)
The `SKILL.md` file defines the skill’s purpose and instructions for the agent.
Create a file at `.gemini/skills/code-reviewer/SKILL.md`.
```
`
---
name: code-reviewer
description:
Expertise in reviewing code changes for correctness, security, and style. Use
when the user asks to "review" their code or a PR.
---
# Code Reviewer Instructions
You act as a senior software engineer specialized in code quality. When this
skill is active, you MUST:
1. \*\*Analyze\*\*: Review the provided code for logical errors, security
vulnerabilities, and style violations.
2. \*\*Review\*\*: Use the bundled `scripts/review.js` utility to perform an
automated check.
3. \*\*Feedback\*\*: Provide constructive feedback, clearly distinguishing between
critical issues and minor improvements.
`
```
### 3. Add the tool logic
[Section titled “3. Add the tool logic”](#3-add-the-tool-logic)
Skills can bundle resources like scripts to perform deterministic tasks. Create
a file at `.gemini/skills/code-reviewer/scripts/review.js`.
.gemini/skills/code-reviewer/scripts/review.js
```
`
const file = process.argv[2];
if (!file) {
console.error('Usage: node review.js \<file\>');
process.exit(1);
}
console.log(`Reviewing ${file}...`);
// Simple mock review logic
setTimeout(() =\> {
console.log(`Result: Success (No major issues found in ${file})`);
}, 500);
`
```
### 4. Test the skill
[Section titled “4. Test the skill”](#4-test-the-skill)
Gemini CLI automatically discovers skills in the `.gemini/skills` directory.
1. Start a new session and ask a question that triggers the skill’s
description: “Can you review index.js”
2. Gemini identifies the request matches the `code-reviewer` description and
asks for permission to activate it.
3. Once you approve, Gemini executes the bundled script:
`node .gemini/skills/code-reviewer/scripts/review.js index.js`
To determine whether your skill has been correctly loaded, run the command:
Terminal window
```
`
/skills
`
```
### 5. Optional: Share your skill
[Section titled “5. Optional: Share your skill”](#5-optional-share-your-skill)
You can share your skills in several ways depending on your target audience.
* **Workspace skills**: Commit your skill to a `.gemini/skills/` directory in
your project repository.
* **Extensions**: Bundle your skill within a
[Gemini CLI extension](/docs/extensions/writing-extensions).
* **Git repositories**: Share the skill directory as a standalone Git repo and
install it using `gemini skills install \<url\>`.
## Core concepts
[Section titled “Core concepts”](#core-concepts)
Now that you’ve built your first skill, let’s explore the core components and
workflows for developing more complex expertise.
### Skill structure
[Section titled “Skill structure”](#skill-structure)
While a `SKILL.md` file is the only required component, we recommend the
following structure for organizing your skill’s resources.
```
`
my-skill/
├── SKILL.md (Required) Instructions and metadata
├── scripts/ (Optional) Executable scripts
├── references/ (Optional) Static documentation
└── assets/ (Optional) Templates and other resources
`
```
When a skill is activated, the model is granted access to this entire directory.
You can instruct the model to use the tools and files found within these
folders.
### Metadata and triggers
[Section titled “Metadata and triggers”](#metadata-and-triggers)
The `SKILL.md` file uses YAML frontmatter for metadata.
* **`name`**: A unique identifier for the skill. This should match the directory
name.
* **`description`**: **CRITICAL.** This is how Gemini decides when to use the
skill. Be specific about the tasks it handles and the keywords that should
trigger it.
### Discovery tiers
[Section titled “Discovery tiers”](#discovery-tiers)
Gemini CLI discovers skills from several locations, following a specific order
of precedence (lowest to highest):
1. **Built-in Skills**: Included with Gemini CLI (pre-approved).
2. **Extension Skills**: Bundled within [extensions](/docs/extensions).
3. **User Skills**: `\~/.gemini/skills/` or the `\~/.agents/skills/` alias.
4. **Workspace Skills**: `.gemini/skills/` or the `.agents/skills/` alias.
### Discovery aliases
[Section titled “Discovery aliases”](#discovery-aliases)
You can use `.agents/skills` as an alternative to `.gemini/skills`. This alias
is compatible with other AI agent tools following the
[Agent Skills](https://agentskills.io) standard.
## Advanced development
[Section titled “Advanced development”](#advanced-development)
Once you’ve built a basic skill, you can use specialized scripts and workflows
to streamline your development process.
### Creation scripts
[Section titled “Creation scripts”](#creation-scripts)
If you are developing a skill and want to use the same scripts the built-in
tools use, you can find them in the core package. These scripts help automate
the initialization, validation, and packaging of skills.
* **Initialize**: `node scripts/init\_skill.cjs \<name\> --path \<dir\>`
* **Validate**: `node scripts/validate\_skill.cjs \<path/to/skill\>`
* **Package**: `node scripts/package\_skill.cjs \<path/to/skill\>` (Creates a
`.skill` zip file)
### Linking for local development
[Section titled “Linking for local development”](#linking-for-local-development)
If you are developing a skill in a separate directory, you can link it to your
user skills directory for testing:
Terminal window
```
`
gemini skills link .
`
```
## Next steps
[Section titled “Next steps”](#next-steps)
* [Skill best practices](/docs/cli/skills-best-practices): Learn strategies for
building reliable and effective skills.
* [Agent Skills overview](/docs/cli/skills): Deep dive into discovery tiers and the
skill lifecycle.
* [Get started with Agent Skills](/docs/cli/tutorials/skills-getting-started): A
quick walkthrough of triggering and using skills.
Last updated: Apr 30, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.