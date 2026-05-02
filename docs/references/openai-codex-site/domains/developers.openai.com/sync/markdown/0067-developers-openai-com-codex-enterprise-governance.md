Governance – Codex | OpenAI Developers
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
# Governance and Observability
Codex gives enterprise teams visibility into adoption and impact, plus the auditability needed for security and compliance programs. Use the self-serve dashboard for day-to-day tracking, the Analytics API for programmatic reporting, and the Compliance API to export detailed logs into your governance stack.
## Ways to track Codex usage
There are three ways to monitor Codex usage, depending on what you need:
* **Analytics Dashboard**: quick visibility into adoption and code review impact.
* **Analytics API**: pull structured daily metrics into your data warehouse or BI tools.
* **Compliance API**: exports detailed activity logs for audit, monitoring, and investigations.
## Analytics Dashboard
### Dashboards
The [analytics dashboard](https://chatgpt.com/codex/settings/analytics) allows ChatGPT workspace administrators to track feature adoption.
Codex provides the following dashboards:
* Daily users by product (CLI, IDE, cloud, Code Review)
* Daily code review users
* Daily code reviews
* Code reviews by priority level
* Daily code reviews by feedback sentiment
* Daily cloud tasks
* Daily cloud users
* Daily VS Code extension users
* Daily CLI users
### Data export
Administrators can also export Codex analytics data in CSV or JSON format. Codex provides the following export options:
* Code review users and reviews (Daily unique users and total reviews completed in Code Review)
* Code review findings and feedback (Daily counts of comments, reactions, replies, and priority-level findings)
* cloud users and tasks (daily unique cloud users and tasks completed)
* CLI and VS Code users (Daily unique users for the Codex CLI and VS Code extension)
* Sessions and messages per user (Daily session starts and user message counts for each Codex user across surfaces)
## Analytics API
Use the [Analytics API](https://chatgpt.com/codex/settings/apireference) when you want to automate reporting, build internal dashboards, or join Codex metrics with your existing engineering data.
### What it measures
The Analytics API provides daily, time-series metrics for a workspace, with optional per-user breakdowns and per-client usage.
### Endpoints
#### Daily usage and adoption
* Daily totals for threads, turns, and credits
* Breakdown by client surface
* Optional per-user reporting for adoption and power-user analysis
#### Code review activity
* Pull request reviews completed by Codex
* Total comments generated by Codex
* Severity breakdown of comments
#### User engagement with code review
* Replies to Codex comments
* Reactions, including upvotes and downvotes
* Engagement breakdowns for how teams respond to Codex feedback
### How it works
Analytics is daily and time-windowed. Results are time-ordered and returned in pages with cursor-based pagination. You can query by workspace and optionally group by user or aggregate at the workspace level.
### Common use cases
* Engineering observability dashboards
* Adoption reporting for leadership updates
* Usage governance and cost monitoring
## Compliance API
Use the [Compliance API](https://chatgpt.com/admin/api-reference) when you need auditable records for security, legal, and governance workflows.
### What it measures
The Compliance API gives enterprises a way to export logs and metadata for Codex activity so you can connect that data to your existing audit, monitoring, and security workflows. It is designed for use with tools like eDiscovery, DLP, SIEM, or other compliance systems.
For Codex usage authenticated through ChatGPT, Compliance API exports provide audit records for Codex activity and can be used in investigations and compliance workflows. These audit logs are retained for up to 30 days. API-key-authenticated Codex usage follows your API organization settings and is not included in Compliance API exports.
### What you can export
#### Activity logs
* Prompt text sent to Codex
* Responses Codex generated
* Identifiers such as workspace, user, timestamp, and model
* Token usage and related request metadata
#### Metadata for audit and investigation
Use record metadata to answer questions like:
* Who ran a task
* When it ran
* Which model was used
* How much content was processed
#### Common use cases
* Security investigations
* Compliance reporting
* Policy enforcement audits
* Routing events into SIEM and eDiscovery pipelines
### What it does not provide
* Lines of code generated (a bit of a noisy proxy for productivity and can incentivize the wrong behavior)
* Acceptance rate of suggestions (almost 100% since users usually accept the change first)
* Code quality or performance KPIs
## Recommended pattern
Most enterprises use a combination of:
1. **Analytics Dashboard** for self-serve monitoring and quick answers
2. **Analytics API** for automated reporting and BI integration
3. **Compliance API** for audit exports and investigations