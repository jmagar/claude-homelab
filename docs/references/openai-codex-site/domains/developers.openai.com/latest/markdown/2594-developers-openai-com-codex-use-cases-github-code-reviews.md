Codex code review for GitHub pull requests | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Codex code review for GitHub pull requests
Catch regressions and potential issues before human review.
Difficulty **Easy**
Time horizon **5s**
Use Codex code review in GitHub to automatically surface regressions, missing tests, and documentation issues directly on a pull request.
## Best for
* Teams that want another review signal before human merge approval
* Large codebases for projects in production
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/github-code-reviews/?export=pdf)
Use Codex code review in GitHub to automatically surface regressions, missing tests, and documentation issues directly on a pull request.
Easy
5s
Related links
[ Codex code review in GitHub ](/codex/integrations/github)[ Custom instructions with AGENTS.md ](/codex/guides/agents-md)
##
Best for
* Teams that want another review signal before human merge approval
* Large codebases for projects in production
##
Skills & Plugins
*
[ Security Best Practices ](https://github.com/openai/skills/tree/main/skills/.curated/security-best-practices)
Focus the review on risky surfaces such as secrets, auth, and dependency changes.
|
Skill
|
Why use it
|
|[ Security Best Practices ](https://github.com/openai/skills/tree/main/skills/.curated/security-best-practices)| Focus the review on risky surfaces such as secrets, auth, and dependency changes. |
##
Starter prompt
@codex review for security regressions, missing tests, and risky behavior changes.
@codex review for security regressions, missing tests, and risky behavior changes.
## How to use
Start by adding Codex code review to your GitHub organization or repository.
See [Codex code review in GitHub](/codex/integrations/github) for more details.
You can set up Codex to automatically review every pull request, or you can request a review with `@codex review` in a pull request comment.
If Codex flags a regression or potential issue, you can ask it to fix it by commenting on the pull request with a follow-up prompt like `@codex fix it`.
This will start a new cloud task that will fix the issue and update the pull request.
## Define review guidance
To customize what Codex reviews, add or update a top-level `AGENTS.md` with a section like this:
```
`## Review guidelines
- Flag typos and grammar issues as P0 issues.
- Flag potential missing documentation as P1 issues.
- Flag missing tests as P1 issues.
...`
```
Codex applies guidance from the closest `AGENTS.md` to each changed file. You can place more specific instructions deeper in the tree when particular packages need extra scrutiny.
##
Related use cases
[
### Deploy an app or website
Use Codex with Build Web Apps and Vercel to turn a repo, screenshot, design, or rough app...
Front-end Integrations
](/codex/use-cases/deploy-app-or-website)[
### Bring your app to ChatGPT
Build one narrow ChatGPT app outcome end to end: define the tools, scaffold the MCP server...
Integrations Code
](/codex/use-cases/chatgpt-apps)[
### Complete tasks from messages
Use Computer Use to read one Messages thread, complete the task, and draft a reply.
Knowledge Work Integrations
](/codex/use-cases/complete-tasks-from-messages)