FAQ – Codex Security | OpenAI Developers
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
### Getting Started
* [ Overview ](/codex)
* [ Quickstart ](/codex/quickstart)
* [ Explore use cases ](/codex/use-cases)
* [ Pricing ](/codex/pricing)
* Concepts
* [ Prompting ](/codex/prompting)
* [ Customization ](/codex/concepts/customization)
* [ Memories ](/codex/memories)
* [ Chronicle ](/codex/memories/chronicle)
* [ Sandboxing ](/codex/concepts/sandboxing)
* [ Subagents ](/codex/concepts/subagents)
* [ Workflows ](/codex/workflows)
* [ Models ](/codex/models)
* [ Cyber Safety ](/codex/concepts/cyber-safety)
### Using Codex
* App
* [ Overview ](/codex/app)
* [ Features ](/codex/app/features)
* [ Settings ](/codex/app/settings)
* [ Review ](/codex/app/review)
* [ Automations ](/codex/app/automations)
* [ Worktrees ](/codex/app/worktrees)
* [ Local Environments ](/codex/app/local-environments)
* [ In-app browser ](/codex/app/browser)
* [ Computer Use ](/codex/app/computer-use)
* [ Commands ](/codex/app/commands)
* [ Windows ](/codex/app/windows)
* [ Troubleshooting ](/codex/app/troubleshooting)
* IDE Extension
* [ Overview ](/codex/ide)
* [ Features ](/codex/ide/features)
* [ Settings ](/codex/ide/settings)
* [ IDE Commands ](/codex/ide/commands)
* [ Slash commands ](/codex/ide/slash-commands)
* CLI
* [ Overview ](/codex/cli)
* [ Features ](/codex/cli/features)
* [ Command Line Options ](/codex/cli/reference)
* [ Slash commands ](/codex/cli/slash-commands)
* Web
* [ Overview ](/codex/cloud)
* [ Environments ](/codex/cloud/environments)
* [ Internet Access ](/codex/cloud/internet-access)
* Integrations
* [ GitHub ](/codex/integrations/github)
* [ Slack ](/codex/integrations/slack)
* [ Linear ](/codex/integrations/linear)
* Codex Security
* [ Overview ](/codex/security)
* [ Setup ](/codex/security/setup)
* [ Improving the threat model ](/codex/security/threat-model)
* [ FAQ ](/codex/security/faq)
### Configuration
* Config File
* [ Config Basics ](/codex/config-basic)
* [ Advanced Config ](/codex/config-advanced)
* [ Config Reference ](/codex/config-reference)
* [ Sample Config ](/codex/config-sample)
* [ Speed ](/codex/speed)
* [ Rules ](/codex/rules)
* [ Hooks ](/codex/hooks)
* [ AGENTS.md ](/codex/guides/agents-md)
* [ MCP ](/codex/mcp)
* Plugins
* [ Overview ](/codex/plugins)
* [ Build plugins ](/codex/plugins/build)
* [ Skills ](/codex/skills)
* [ Subagents ](/codex/subagents)
### Administration
* [ Authentication ](/codex/auth)
* [ Agent approvals & security ](/codex/agent-approvals-security)
* [ Remote connections ](/codex/remote-connections)
* Enterprise
* [ Admin Setup ](/codex/enterprise/admin-setup)
* [ Governance ](/codex/enterprise/governance)
* [ Managed configuration ](/codex/enterprise/managed-configuration)
* [ Windows ](/codex/windows)
### Automation
* [ Non-interactive Mode ](/codex/noninteractive)
* [ Codex SDK ](/codex/sdk)
* [ App Server ](/codex/app-server)
* [ MCP Server ](/codex/guides/agents-sdk)
* [ GitHub Action ](/codex/github-action)
### Learn
* [ Best practices ](/codex/learn/best-practices)
* [ Videos ](/codex/videos)
* [ Community ](/community)
* Blog
* [ Using skills to accelerate OSS maintenance ](/blog/skills-agents-sdk)
* [ Building frontend UIs with Codex and Figma ](/blog/building-frontend-uis-with-codex-and-figma)
* [ View all ](/blog/topic/codex)
* Cookbooks
* [ Codex Prompting Guide ](/cookbook/examples/gpt-5/codex_prompting_guide)
* [ Modernizing your Codebase with Codex ](/cookbook/examples/codex/code_modernization)
* [ View all ](/cookbook/topic/codex)
* [ Building AI Teams ](/codex/guides/build-ai-native-engineering-team)
### Releases
* [ Changelog ](/codex/changelog)
* [ Feature Maturity ](/codex/feature-maturity)
* [ Open Source ](/codex/open-source)
[API Dashboard](https://platform.openai.com/login)
Copy Page
## Getting started
### What is Codex Security?
Software security remains one of the hardest and most important problems in engineering. Codex Security is an LLM-driven security analysis toolkit that inspects source code and returns structured, ranked vulnerability findings with proposed patches. It helps developers and security teams discover and fix security issues at scale.
### Why does it matter?
Software is foundational to modern industry and society, and vulnerabilities create systemic risk. Codex Security supports a defender-first workflow by continuously identifying likely issues, validating them when possible, and proposing fixes. That helps teams improve security without slowing development.
### What business problem does Codex Security solve?
Codex Security shortens the path from a suspected issue to a confirmed, reproducible finding with evidence and a proposed patch. That reduces triage load and cuts false positives compared with traditional scanners alone.
### How does Codex Security work?
Codex Security runs analysis in an ephemeral, isolated container and temporarily clones the target repository. It performs code-level analysis and returns structured findings with a description, file and location, criticality, root cause, and a suggested remediation.
For findings that include verification steps, the system executes proposed commands or tests in the same sandbox, records success or failure, exit codes, stdout, stderr, test results, and any generated diffs or artifacts, and attaches that output as evidence for review.
### Does it replace SAST?
No. Codex Security complements SAST. It adds semantic, LLM-based reasoning and automated validation, while existing SAST tools still provide broad deterministic coverage.
## Features
### What is the analysis pipeline?
Codex Security follows a staged pipeline:
1. **Analysis** builds a threat model for the repository.
2. **Commit scanning** reviews merged commits and repository history for likely issues.
3. **Validation** tries to reproduce likely vulnerabilities in a sandbox to reduce false positives.
4. **Patching** integrates with Codex to propose patches that reviewers can inspect before opening a PR.
It works alongside engineers in GitHub, Codex, and standard review workflows.
### What languages are supported?
Codex Security is language-agnostic. In practice, performance depends on the model’s reasoning ability for the language and framework used by the repository.
### What outputs do I get after the scan completes?
You get ranked findings with criticality, validation status, and a proposed patch when one is available. Findings can also include crash output, reproduction evidence, call-path context, and related annotations.
### How is customer code isolated?
Each analysis and validation job runs in an ephemeral Codex container with session-scoped tools. Artifacts are extracted for review, and the container is torn down after the job completes.
### Does Codex Security auto-apply patches?
No. The proposed patch is a recommended remediation. Users can review it and push it as a PR to GitHub from the findings UI, but Codex Security does not auto-apply changes to the repository.
### Does the project need to be built for scanning?
No. Codex Security can produce findings from repository and commit context without a compile step. During auto-validation, it may try to build the project inside the container if that helps reproduce the issue. For environment setup details, see [Codex cloud environments](/codex/cloud/environments).
### How does Codex Security reduce false positives and avoid broken patches?
Codex Security uses two stages. First, the model ranks likely issues. Then auto-validation tries to reproduce each issue in a clean container. Findings that successfully reproduce are marked as validated, which helps reduce false positives before human review.
### How long do initial scans take, and what happens after that?
Initial scan time depends on repository size, build time, and how many findings proceed to validation. For some repositories, scans can take several hours. For larger repositories, they can take multiple days. Later scans are usually faster because they focus on new commits and incremental changes.
### What is a threat model?
A threat model is the scan-time security context for a repository. It combines a concise project overview with attack-surface details such as entry points, trust boundaries, auth assumptions, and risky components. For more detail, see [Improving the threat model](/codex/security/threat-model).
### How is a threat model generated?
Codex Security prompts the model to summarize the repository architecture and security entry points, classify the repository type, run specialized extractors, and merge the results into a project overview or threat model artifact used throughout the scan.
### Does it replace manual security review?
No. Codex Security accelerates review and helps rank findings, but it does not replace code-level validation, exploitability checks, or human threat assessment.
### Can I edit the threat model?
Yes. Codex Security creates the initial threat model, and you can update it as the architecture, risks, and business context change. For the editing workflow, see [Improving the threat model](/codex/security/threat-model).
### Do I need to configure a scan before using threat modeling?
Yes. Threat-model guidance is tied to how and what you scan, so you need to configure the repository first. See [Codex Security setup](/codex/security/setup).
### What does the proposed patch contain?
The proposed patch contains a minimal actionable diff with filename and line context when a remediation can be generated for the finding.
### Does the patch directly modify my PR branch?
No. The workflow generates a diff, patch file, or suggested change for maintainers and reviewers to inspect before applying.
## Validation
### What is auto-validation?
Auto-validation is the phase that tries to reproduce a suspected issue in an isolated container. It records whether reproduction succeeded or failed and captures logs, commands, and related artifacts as evidence.
### What happens if validation fails?
The finding remains unvalidated. Logs and reports still capture what was attempted so engineers can retry, investigate further, or adjust the reproduction steps.