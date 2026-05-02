Changelog – Codex | OpenAI Developers
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
[ All updates ](/codex/changelog)[ General ](/codex/changelog?type=general)[ Codex app ](/codex/changelog?type=codex-app)[ Codex CLI ](/codex/changelog?type=codex-cli)
[ April 2026 ](#month-2026-04)[ March 2026 ](#month-2026-03)[ February 2026 ](#month-2026-02)[ January 2026 ](#month-2026-01)[ December 2025 ](#month-2025-12)[ November 2025 ](#month-2025-11)[ October 2025 ](#month-2025-10)[ September 2025 ](#month-2025-09)[ August 2025 ](#month-2025-08)[ June 2025 ](#month-2025-06)[ May 2025 ](#month-2025-05)
## April 2026
*
2026-04-30
### Codex CLI 0.128.0
```
`$ npm install -g @openai/codex@0.128.0`
```
View details
## New Features
* Added persisted `/goal` workflows with app-server APIs, model tools, runtime continuation, and TUI controls for create, pause, resume, and clear. ([#18073](https://github.com/openai/codex/pull/18073), [#18074](https://github.com/openai/codex/pull/18074), [#18075](https://github.com/openai/codex/pull/18075), [#18076](https://github.com/openai/codex/pull/18076), [#18077](https://github.com/openai/codex/pull/18077), [#20082](https://github.com/openai/codex/pull/20082))
* Added `codex update`, configurable TUI keymaps, plan-mode nudges, action-required terminal titles, and active-turn `/statusline` and `/title` edits. ([#19933](https://github.com/openai/codex/pull/19933), [#18593](https://github.com/openai/codex/pull/18593), [#19901](https://github.com/openai/codex/pull/19901), [#18372](https://github.com/openai/codex/pull/18372), [#19917](https://github.com/openai/codex/pull/19917))
* Expanded permission profiles with built-in defaults, sandbox CLI profile selection, cwd controls, and active-profile metadata for clients. ([#19900](https://github.com/openai/codex/pull/19900), [#20117](https://github.com/openai/codex/pull/20117), [#20118](https://github.com/openai/codex/pull/20118), [#20095](https://github.com/openai/codex/pull/20095))
* Improved plugin workflows with marketplace installation, remote bundle caching, remote uninstall, plugin-bundled hooks, hook enablement state, and external-agent config import. ([#18704](https://github.com/openai/codex/pull/18704), [#19914](https://github.com/openai/codex/pull/19914), [#19456](https://github.com/openai/codex/pull/19456), [#19705](https://github.com/openai/codex/pull/19705), [#19840](https://github.com/openai/codex/pull/19840), [#19949](https://github.com/openai/codex/pull/19949))
* Added external agent session import, including background imports and imported-session title handling. ([#19895](https://github.com/openai/codex/pull/19895), [#20284](https://github.com/openai/codex/pull/20284), [#20261](https://github.com/openai/codex/pull/20261))
* Made MultiAgentV2 configuration more explicit with thread caps, wait-time controls, root/subagent hints, and v2-specific depth handling. ([#19360](https://github.com/openai/codex/pull/19360), [#19792](https://github.com/openai/codex/pull/19792), [#19805](https://github.com/openai/codex/pull/19805), [#20052](https://github.com/openai/codex/pull/20052), [#20180](https://github.com/openai/codex/pull/20180))
## Bug Fixes
* Fixed several resume and interruption issues, including stale interrupt hangs, persisted provider restoration, large remote resume responses, and slow filtered resume lists. ([#18392](https://github.com/openai/codex/pull/18392), [#19287](https://github.com/openai/codex/pull/19287), [#19920](https://github.com/openai/codex/pull/19920), [#19591](https://github.com/openai/codex/pull/19591))
* Improved TUI reliability around terminal resize reflow, markdown list spacing, slash-command popup layout, keyboard cleanup, shell-mode escape, and working status updates. ([#18575](https://github.com/openai/codex/pull/18575), [#19706](https://github.com/openai/codex/pull/19706), [#19511](https://github.com/openai/codex/pull/19511), [#19625](https://github.com/openai/codex/pull/19625), [#19986](https://github.com/openai/codex/pull/19986), [#19939](https://github.com/openai/codex/pull/19939))
* Hardened managed network behavior for deferred denials, proxy bypass defaults, resolved target checks, IPv6 host matching, and `git -C` approval handling. ([#19184](https://github.com/openai/codex/pull/19184), [#20002](https://github.com/openai/codex/pull/20002), [#19999](https://github.com/openai/codex/pull/19999), [#19995](https://github.com/openai/codex/pull/19995), [#20085](https://github.com/openai/codex/pull/20085))
* Fixed Windows sandbox and PTY edge cases, including pseudoconsole startup, elevated runner process handling, core shell environment inheritance, and named-pipe validation. ([#20042](https://github.com/openai/codex/pull/20042), [#19211](https://github.com/openai/codex/pull/19211), [#20089](https://github.com/openai/codex/pull/20089), [#19283](https://github.com/openai/codex/pull/19283))
* Fixed Bedrock model support for `apply\_patch`, GPT-5.4 reasoning levels, and updated Bedrock GPT-5.4 endpoint/model metadata. ([#19416](https://github.com/openai/codex/pull/19416), [#19461](https://github.com/openai/codex/pull/19461), [#20109](https://github.com/openai/codex/pull/20109))
* Fixed MCP/plugin edge cases around stdio server cleanup, plugin MCP approval persistence, and custom MCP metadata isolation. ([#19753](https://github.com/openai/codex/pull/19753), [#19537](https://github.com/openai/codex/pull/19537), [#19836](https://github.com/openai/codex/pull/19836), [#19875](https://github.com/openai/codex/pull/19875))
## Documentation
* Updated the bundled OpenAI Docs skill for GPT-5.5, `gpt-image-2`, and clearer upgrade guidance. ([#19407](https://github.com/openai/codex/pull/19407), [#19443](https://github.com/openai/codex/pull/19443), [#19422](https://github.com/openai/codex/pull/19422))
* Clarified contributor-facing docs, including the PR template, Rust async trait guidance, and README wording. ([#19912](https://github.com/openai/codex/pull/19912), [#20242](https://github.com/openai/codex/pull/20242), [#19514](https://github.com/openai/codex/pull/19514))
* Added a checked-in `codex-core` public API listing and a ThreadManager sample crate. ([#20243](https://github.com/openai/codex/pull/20243), [#20141](https://github.com/openai/codex/pull/20141))
## Chores
* Published `codex-app-server` release artifacts, stopped publishing GNU Linux binaries, and increased release workflow timeouts. ([#19447](https://github.com/openai/codex/pull/19447), [#19445](https://github.com/openai/codex/pull/19445), [#20271](https://github.com/openai/codex/pull/20271), [#20343](https://github.com/openai/codex/pull/20343))
* Added Codex-pinned versioning for the Python app-server SDK package. ([#18996](https://github.com/openai/codex/pull/18996))
* Deprecated `--full-auto` while steering users toward explicit permission profiles and trust flows. ([#20133](https://github.com/openai/codex/pull/20133))
* Stabilized CI and release plumbing with Bazel setup migration, release smoke-test pinning, and updated workflow pins/timeouts. ([#19851](https://github.com/openai/codex/pull/19851), [#19854](https://github.com/openai/codex/pull/19854), [#19472](https://github.com/openai/codex/pull/19472), [#19609](https://github.com/openai/codex/pull/19609))
## Changelog
Full Changelog: [rust-v0.125.0...rust-v0.128.0](https://github.com/openai/codex/compare/rust-v0.125.0...rust-v0.128.0)
* [#19124](https://github.com/openai/codex/pull/19124) Make MultiAgentV2 interruption markers assistant-authored [@jif-oai](https://github.com/jif-oai)
* [#19354](https://github.com/openai/codex/pull/19354) chore: alias max\_concurrent\_threads\_per\_session [@jif-oai](https://github.com/jif-oai)
* [#19360](https://github.com/openai/codex/pull/19360) feat: surface multi-agent thread limit in spawn description [@jif-oai](https://github.com/jif-oai)
* [#19351](https://github.com/openai/codex/pull/19351) Add agents.interrupt\_message for interruption markers [@jif-oai](https://github.com/jif-oai)
* [#18392](https://github.com/openai/codex/pull/18392) Fix hang on turn/interrupt [@danwang-oai](https://github.com/danwang-oai)
* [#19380](https://github.com/openai/codex/pull/19380) chore: drop MCP Plugins and App from Morpheus [@jif-oai](https://github.com/jif-oai)
* [#18907](https://github.com/openai/codex/pull/18907) respect workspace option for disabling plugins [@zamoshchin-openai](https://github.com/zamoshchin-openai)
* [#19283](https://github.com/openai/codex/pull/19283) check PID of named pipe consumer [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#19407](https://github.com/openai/codex/pull/19407) Update bundled OpenAI Docs skill for GPT-5.5 [@kkahadze-oai](https://github.com/kkahadze-oai)
* [#19163](https://github.com/openai/codex/pull/19163) Harden package-manager install policy [@mcgrew-oai](https://github.com/mcgrew-oai)
* [#19416](https://github.com/openai/codex/pull/19416) Fix: use function apply\_patch tool for Bedrock model [@celia-oai](https://github.com/celia-oai)
* [#19093](https://github.com/openai/codex/pull/19093) [codex] Omit fork turns from thread started notifications [@euroelessar](https://github.com/euroelessar)
* [#19244](https://github.com/openai/codex/pull/19244) Update unix socket transport to use WebSocket upgrade [@willwang-openai](https://github.com/willwang-openai)
* [#19170](https://github.com/openai/codex/pull/19170) Skip disabled rows in selection menu numbering and default focus [@canvrno-oai](https://github.com/canvrno-oai)
* [#19414](https://github.com/openai/codex/pull/19414) permissions: make legacy profile conversion cwd-free [@bolinfest](https://github.com/bolinfest)
* [#18900](https://github.com/openai/codex/pull/18900) Migrate fork and resume reads to thread store [@wiltzius-openai](https://github.com/wiltzius-openai)
* [#19445](https://github.com/openai/codex/pull/19445) ci: stop publishing GNU Linux release artifacts [@bolinfest](https://github.com/bolinfest)
* [#19443](https://github.com/openai/codex/pull/19443) Add gpt-image-2 to bundled OpenAI Docs skill [@kkahadze-oai](https://github.com/kkahadze-oai)
* [#18584](https://github.com/openai/codex/pull/18584) [4/4] Honor Streamable HTTP MCP placement [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#19447](https://github.com/openai/codex/pull/19447) ci: publish codex-app-server release artifacts [@bolinfest](https://github.com/bolinfest)
* [#19422](https://github.com/openai/codex/pull/19422) Clarify bundled OpenAI Docs upgrade guide wording [@kkahadze-oai](https://github.com/kkahadze-oai)
* [#19266](https://github.com/openai/codex/pull/19266) [codex] add non-local thread store regression harness [@wiltzius-openai](https://github.com/wiltzius-openai)
* [#19098](https://github.com/openai/codex/pull/19098) feat: Compress skill paths with root aliases [@xl-openai](https://github.com/xl-openai)
* [#19207](https://github.com/openai/codex/pull/19207) [codex] Forward Codex Apps tool call IDs to backend metadata [@rreichel3-oai](https://github.com/rreichel3-oai)
* [#19453](https://github.com/openai/codex/pull/19453) Serialize legacy Windows PowerShell sandbox tests [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#19234](https://github.com/openai/codex/pull/19234) Refactor log DB into LogWriter interface [@rasmusrygaard](https://github.com/rasmusrygaard)
* [#19461](https://github.com/openai/codex/pull/19461) fix: Bedrock GPT-5.4 reasoning levels [@celia-oai](https://github.com/celia-oai)
* [#19449](https://github.com/openai/codex/pull/19449) permissions: remove legacy read-only access modes [@bolinfest](https://github.com/bolinfest)
* [#19472](https://github.com/openai/codex/pull/19472) ci: pin codex-action v1.7 [@viyatb-oai](https://github.com/viyatb-oai)
* [#19468](https://github.com/openai/codex/pull/19468) Fix Bazel cargo\_bin runfiles paths [@fjord-oai](https://github.com/fjord-oai)
* [#19410](https://github.com/openai/codex/pull/19410) Remove js\_repl feature [@fjord-oai](https://github.com/fjord-oai)
* [#18073](https://github.com/openai/codex/pull/18073) Add goal persistence foundation (1 / 5) [@etraut-openai](https://github.com/etraut-openai)
* [#18074](https://github.com/openai/codex/pull/18074) Add goal app-server API (2 / 5) [@etraut-openai](https://github.com/etraut-openai)
* [#18075](https://github.com/openai/codex/pull/18075) Add goal model tools (3 / 5) [@etraut-openai](https://github.com/etraut-openai)
* [#18076](https://github.com/openai/codex/pull/18076) Add goal core runtime (4 / 5) [@etraut-openai](https://github.com/etraut-openai)
* [#18077](https://github.com/openai/codex/pull/18077) Add goal TUI UX (5 / 5) [@etraut-openai](https://github.com/etraut-openai)
* [#19454](https://github.com/openai/codex/pull/19454) Split approval matrix test groups [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#19514](https://github.com/openai/codex/pull/19514) Fix codex-rs README grammar [@etraut-openai](https://github.com/etraut-openai)
* [#19459](https://github.com/openai/codex/pull/19459) Enable unavailable dummy tools by default [@mzeng-openai](https://github.com/mzeng-openai)
* [#19524](https://github.com/openai/codex/pull/19524) [codex] Prune unused codex-mcp API and duplicate helpers [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#19526](https://github.com/openai/codex/pull/19526) [codex] Order codex-mcp items by visibility [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#19578](https://github.com/openai/codex/pull/19578) fix: increase Bazel timeout to 45 minutes [@bolinfest](https://github.com/bolinfest)
* [#19287](https://github.com/openai/codex/pull/19287) Restore persisted model provider on thread resume [@etraut-openai](https://github.com/etraut-openai)
* [#19593](https://github.com/openai/codex/pull/19593) test: isolate remote thread store regression from plugin warmups [@bolinfest](https://github.com/bolinfest)
* [#19511](https://github.com/openai/codex/pull/19511) Keep slash command popup columns stable while scrolling [@etraut-openai](https://github.com/etraut-openai)
* [#19595](https://github.com/openai/codex/pull/19595) [codex] Bypass managed network for escalated exec [@viyatb-oai](https://github.com/viyatb-oai)
* [#19604](https://github.com/openai/codex/pull/19604) test: stabilize app-server path assertions on Windows [@bolinfest](https://github.com/bolinfest)
* [#19609](https://github.com/openai/codex/pull/19609) fix: restore 30-minute timeout for Bazel builds [@bolinfest](https://github.com/bolinfest)
* [#19389](https://github.com/openai/codex/pull/19389) Guard npm update readiness [@shijie-oai](https://github.com/shijie-oai)
* [#18575](https://github.com/openai/codex/pull/18575) fix(tui): reflow scrollback on terminal resize [@fcoury-oai](https://github.com/fcoury-oai)
* [#19610](https://github.com/openai/codex/pull/19610) Support end\_turn in response.completed [@andmis](https://github.com/andmis)
* [#19640](https://github.com/openai/codex/pull/19640) [codex] remove responses command [@tibo-openai](https://github.com/tibo-openai)
* [#19683](https://github.com/openai/codex/pull/19683) test: harden app-server integration tests [@bolinfest](https://github.com/bolinfest)
* [#18904](https://github.com/openai/codex/pull/18904) feat: load AgentIdentity from JWT login/env [@efrazer-oai](https://github.com/efrazer-oai)
* [#19606](https://github.com/openai/codex/pull/19606) permissions: make runtime config profile-backed [@bolinfest](https://github.com/bolinfest)
* [#19392](https://github.com/openai/codex/pull/19392) permissions: derive compatibility policies from profiles [@bolinfest](https://github.com/bolinfest)
* [#19484](https://github.com/openai/codex/pull/19484) Lift app-server JSON-RPC error handling to request boundary [@pakrym-oai](https://github.com/pakrym-oai)
* [#19487](https://github.com/openai/codex/pull/19487) [codex] Move config loading into codex-config [@pakrym-oai](https://github.com/pakrym-oai)
* [#19393](https://github.com/openai/codex/pull/19393) permissions: migrate approval and sandbox consumers to profiles [@bolinfest](https://github.com/bolinfest)
* [#19726](https://github.com/openai/codex/pull/19726) Fix codex-core config test type paths [@pakrym-oai](https://github.com/pakrym-oai)
* [#19727](https://github.com/openai/codex/pull/19727) test: increase core-all-test shard count to 16 [@bolinfest](https://github.com/bolinfest)
* [#19725](https://github.com/openai/codex/pull/19725) Split MCP connection modules [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#19605](https://github.com/openai/codex/pull/19605) Delete unused ResponseItem::Message.end\_turn [@andmis](https://github.com/andmis)
* [#19394](https://github.com/openai/codex/pull/19394) permissions: remove core legacy policy round trips [@bolinfest](https://github.com/bolinfest)
* [#19733](https://github.com/openai/codex/pull/19733) Allow agents.max\_threads to work with multi\_agent\_v2 [@andmis](https://github.com/andmis)
* [#19395](https://github.com/openai/codex/pull/19395) permissions: finish profile-backed app surfaces [@bolinfest](https://github.com/bolinfest)
* [#19739](https://github.com/openai/codex/pull/19739) inline hostname resolution for remote sandbox config [@abhinav-oai](https://github.com/abhinav-oai)
* [#19734](https://github.com/openai/codex/pull/19734) permissions: centralize legacy sandbox projection [@bolinfest](https://github.com/bolinfest)
* [#19058](https://github.com/openai/codex/pull/19058) Add /auto-review-denials retry approval flow [@won-openai](https://github.com/won-openai)
* [#19735](https://github.com/openai/codex/pull/19735) permissions: store only constrained permission profiles [@bolinfest](https://github.com/bolinfest)
* [#19736](https://github.com/openai/codex/pull/19736) permissions: constrain requirements as profiles [@bolinfest](https://github.com/bolinfest)
* [#19737](https://github.com/openai/codex/pull/19737) permissions: derive legacy exec policies at boundaries [@bolinfest](https://github.com/bolinfest)
* [#19779](https://github.com/openai/codex/pull/19779) Add Codex issue digest skill [@etraut-openai](https://github.com/etraut-openai)
* [#19792](https://github.com/openai/codex/pull/19792) multi\_agent\_v2: move thread cap into feature config [@jif-oai](https://github.com/jif-oai)
* [#18982](https://github.com/openai/codex/pull/18982) feat: use git-backed workspace diffs for memory consolidation [@jif-oai](https://github.com/jif-oai)
* [#19809](https://github.com/openai/codex/pull/19809) Allow Phase 2 memory claims after retry exhaustion [@jif-oai](https://github.com/jif-oai)
* [#19812](https://github.com/openai/codex/pull/19812) Avoid rewriting Phase 2 selection on clean workspace [@jif-oai](https://github.com/jif-oai)
* [#19813](https://github.com/openai/codex/pull/19813) nit: one more fix [@jif-oai](https://github.com/jif-oai)
* [#19818](https://github.com/openai/codex/pull/19818) chore: split memories part 1 [@jif-oai](https://github.com/jif-oai)
* [#19510](https://github.com/openai/codex/pull/19510) Hide rewind preview when no user message exists [@etraut-openai](https://github.com/etraut-openai)
* [#19618](https://github.com/openai/codex/pull/19618) Persist shell mode commands in prompt history [@etraut-openai](https://github.com/etraut-openai)
* [#19709](https://github.com/openai/codex/pull/19709) Render delegated patch approval details [@etraut-openai](https://github.com/etraut-openai)
* [#19490](https://github.com/openai/codex/pull/19490) Streamline plugin, apps, and skills handlers [@pakrym-oai](https://github.com/pakrym-oai)
* [#19762](https://github.com/openai/codex/pull/19762) refactor: make auth loading async [@efrazer-oai](https://github.com/efrazer-oai)
* [#19854](https://github.com/openai/codex/pull/19854) ci: pin npm staging smoke test to a recent rust-release run [@bolinfest](https://github.com/bolinfest)
* [#19851](https://github.com/openai/codex/pull/19851) ci: migrate Bazel setup away from archived setup-bazelisk [@bolinfest](https://github.com/bolinfest)
* [#19491](https://github.com/openai/codex/pull/19491) Streamline account and command handlers [@pakrym-oai](https://github.com/pakrym-oai)
* [#19771](https://github.com/openai/codex/pull/19771) fix: filter dynamic deferred tools from model\_visible\_specs [@sayan-oai](https://github.com/sayan-oai)
* [#19863](https://github.com/openai/codex/pull/19863) [codex-analytics] remove ga flag [@rhan-oai](https://github.com/rhan-oai)
* [#19865](https://github.com/openai/codex/pull/19865) Cap original-detail image token estimates [@fjord-oai](https://github.com/fjord-oai)
* [#19591](https://github.com/openai/codex/pull/19591) Fix filtered thread-list resume regression in TUI [@etraut-openai](https://github.com/etraut-openai)
* [#19513](https://github.com/openai/codex/pull/19513) Delay approval prompts while typing [@etraut-openai](https://github.com/etraut-openai)
* [#19706](https://github.com/openai/codex/pull/19706) Preserve TUI markdown list spacing after code blocks [@etraut-openai](https://github.com/etraut-openai)
* [#19841](https://github.com/openai/codex/pull/19841) permissions: remove cwd special path [@bolinfest](https://github.com/bolinfest)
* [#19492](https://github.com/openai/codex/pull/19492) Streamline thread start handler [@pakrym-oai](https://github.com/pakrym-oai)
* [#19874](https://github.com/openai/codex/pull/19874) [codex-backend] Prefer state git metadata in filtered thread lists [@joeytrasatti-openai](https://github.com/joeytrasatti-openai)
* [#19493](https://github.com/openai/codex/pull/19493) Streamline thread mutation handlers [@pakrym-oai](https://github.com/pakrym-oai)
* [#19862](https://github.com/openai/codex/pull/19862) [codex] Shard exec Bazel integration test [@starr-openai](https://github.com/starr-openai)
* [#18996](https://github.com/openai/codex/pull/18996) Publish Python SDK with Codex-pinned versioning [@sdcoffey](https://github.com/sdcoffey)
* [#19494](https://github.com/openai/codex/pull/19494) Streamline thread read handlers [@pakrym-oai](https://github.com/pakrym-oai)
* [#19839](https://github.com/openai/codex/pull/19839) [codex] Trace cancelled inference streams [@cassirer-openai](https://github.com/cassirer-openai)
* [#19495](https://github.com/openai/codex/pull/19495) Streamline thread resume and fork handlers [@pakrym-oai](https://github.com/pakrym-oai)
* [#19497](https://github.com/openai/codex/pull/19497) Streamline turn and realtime handlers [@pakrym-oai](https://github.com/pakrym-oai)
* [#18372](https://github.com/openai/codex/pull/18372) Show action required in terminal title [@canvrno-oai](https://github.com/canvrno-oai)
* [#19884](https://github.com/openai/codex/pull/19884) Add MCP app feature flag [@mzeng-openai](https://github.com/mzeng-openai)
* [#19498](https://github.com/openai/codex/pull/19498) Streamline review and feedback handlers [@pakrym-oai](https://github.com/pakrym-oai)
* [#19772](https://github.com/openai/codex/pull/19772) permissions: derive config defaults as profiles [@bolinfest](https://github.com/bolinfest)
* [#19836](https://github.com/openai/codex/pull/19836) disallow fileparams metadata for custom mcps [@colby-oai](https://github.com/colby-oai)
* [#19892](https://github.com/openai/codex/pull/19892) Refactor exec-server filesystem API into codex-file-system [@miz-openai](https://github.com/miz-openai)
* [#19452](https://github.com/openai/codex/pull/19452) Stabilize plugin MCP fixture tests [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#19481](https://github.com/openai/codex/pull/19481) Remove ghost snapshots [@pakrym-oai](https://github.com/pakrym-oai)
* [#19773](https://github.com/openai/codex/pull/19773) permissions: require profiles in TUI thread state [@bolinfest](https://github.com/bolinfest)
* [#19917](https://github.com/openai/codex/pull/19917) Allow /statusline and /title slash commands during active turns [@canvrno-oai](https://github.com/canvrno-oai)
* [#19763](https://github.com/openai/codex/pull/19763) refactor: load agent identity runtime eagerly [@efrazer-oai](https://github.com/efrazer-oai)
* [#17689](https://github.com/openai/codex/pull/17689) [codex-analytics] include user agent in default headers [@marksteinbrick-oai](https://github.com/marksteinbrick-oai)
* [#19912](https://github.com/openai/codex/pull/19912) Clarify PR template invitation requirement [@etraut-openai](https://github.com/etraut-openai)
* [#19630](https://github.com/openai/codex/pull/19630) Avoid persisting ShutdownComplete after thread shutdown [@etraut-openai](https://github.com/etraut-openai)
* [#19774](https://github.com/openai/codex/pull/19774) permissions: make SessionConfigured profile-only [@bolinfest](https://github.com/bolinfest)
* [#19775](https://github.com/openai/codex/pull/19775) permissions: derive snapshot sandbox projections [@bolinfest](https://github.com/bolinfest)
* [#19920](https://github.com/openai/codex/pull/19920) Allow large remote app-server resume responses [@etraut-openai](https://github.com/etraut-openai)
* [#19776](https://github.com/openai/codex/pull/19776) permissions: store thread sessions as profiles [@bolinfest](https://github.com/bolinfest)
* [#19899](https://github.com/openai/codex/pull/19899) app-server-protocol: mark permission profiles experimental [@bolinfest](https://github.com/bolinfest)
* [#19933](https://github.com/openai/codex/pull/19933) Add `codex update` command [@etraut-openai](https://github.com/etraut-openai)
* [#19914](https://github.com/openai/codex/pull/19914) feat: Cache remote plugin bundles on install [@xl-openai](https://github.com/xl-openai)
* [#19456](https://github.com/openai/codex/pull/19456) Add remote plugin uninstall API [@xli-oai](https://github.com/xli-oai)
* [#19805](https://github.com/openai/codex/pull/19805) Add MultiAgentV2 root and subagent context hints [@jif-oai](https://github.com/jif-oai)
* [#19860](https://github.com/openai/codex/pull/19860) feat: split memories part 2 [@jif-oai](https://github.com/jif-oai)
* [#19961](https://github.com/openai/codex/pull/19961) feat: fix hinting 2 [@jif-oai](https://github.com/jif-oai)
* [#19963](https://github.com/openai/codex/pull/19963) feat: fix hinting 3 [@jif-oai](https://github.com/jif-oai)
* [#19967](https://github.com/openai/codex/pull/19967) Stabilize memory Phase 2 input ordering [@jif-oai](https://github.com/jif-oai)
* [#19970](https://github.com/openai/codex/pull/19970) feat: trigger memories from user turns with cooldown [@jif-oai](https://github.com/jif-oai)
* [#19904](https://github.com/openai/codex/pull/19904) fix: configure AgentIdentity AuthAPI base URL [@efrazer-oai](https://github.com/efrazer-oai)
* [#19990](https://github.com/openai/codex/pull/19990) feat: skip memory startup when Codex rate limits are low [@jif-oai](https://github.com/jif-oai)
* [#19998](https://github.com/openai/codex/pull/19998) feat: house-keeping memories 1 [@jif-oai](https://github.com/jif-oai)
* [#20000](https://github.com/openai/codex/pull/20000) feat: house-keeping memories 2 [@jif-oai](https://github.com/jif-oai)
* [#19832](https://github.com/openai/codex/pull/19832) Preserve assistant phase for replayed messages [@friel-openai](https://github.com/friel-openai)
* [#19625](https://github.com/openai/codex/pull/19625) Reset TUI keyboard reporting on exit [@etraut-openai](https://github.com/etraut-openai)
* [#18593](https://github.com/openai/codex/pull/18593) feat(tui): add configurable keymap support [@fcoury-oai](https://github.com/fcoury-oai)
* [#19846](https://github.com/openai/codex/pull/19846) [sandbox] Enforce protected workspace metadata paths [@evawong-oai](https://github.com/evawong-oai)
* [#20005](https://github.com/openai/codex/pull/20005) feat: house-keeping memories 3 [@jif-oai](https://github.com/jif-oai)
* [#19929](https://github.com/openai/codex/pull/19929) TUI: use cumulative turn duration for worked-for separator [@etraut-openai](https://github.com/etraut-openai)
* [#19753](https://github.com/openai/codex/pull/19753) Terminate stdio MCP servers on shutdown to avoid process leaks [@etraut-openai](https://github.com/etraut-openai)
* [#19473](https://github.com/openai/codex/pull/19473) Add turn start timestamp to turn metadata [@mchen-oai](https://github.com/mchen-oai)
* [#19875](https://github.com/openai/codex/pull/19875) Strip connector provenance metadata from custom MCP tools [@colby-oai](https://github.com/colby-oai)
* [#19764](https://github.com/openai/codex/pull/19764) feat: verify agent identity JWTs with JWKS [@efrazer-oai](https://github.com/efrazer-oai)
* [#19847](https://github.com/openai/codex/pull/19847) Enforce workspace metadata protections in Seatbelt [@evawong-oai](https://github.com/evawong-oai)
* [#19509](https://github.com/openai/codex/pull/19509) Record MCP result telemetry on mcp.tools.call spans [@mchen-oai](https://github.com/mchen-oai)
* [#19907](https://github.com/openai/codex/pull/19907) Clarify network approval auto-review prompts [@maja-openai](https://github.com/maja-openai)
* [#19901](https://github.com/openai/codex/pull/19901) feat(tui): suggest plan mode from composer drafts [@fcoury-oai](https://github.com/fcoury-oai)
* [#19931](https://github.com/openai/codex/pull/19931) Move local /resume cwd filtering into thread/list [@canvrno-oai](https://github.com/canvrno-oai)
* [#19986](https://github.com/openai/codex/pull/19986) fix(tui): let esc exit empty shell mode [@fcoury-oai](https://github.com/fcoury-oai)
* [#19895](https://github.com/openai/codex/pull/19895) External agent session support [@stefanstokic-oai](https://github.com/stefanstokic-oai)
* [#20002](https://github.com/openai/codex/pull/20002) fix(network-proxy): tighten network proxy bypass defaults [@viyatb-oai](https://github.com/viyatb-oai)
* [#19900](https://github.com/openai/codex/pull/19900) permissions: add built-in default profiles [@bolinfest](https://github.com/bolinfest)
* [#20045](https://github.com/openai/codex/pull/20045) Fix plan mode nudge test after task completion signature change [@canvrno-oai](https://github.com/canvrno-oai)
* [#19432](https://github.com/openai/codex/pull/19432) [codex] Add token usage to turn tracing spans [@charley-openai](https://github.com/charley-openai)
* [#20001](https://github.com/openai/codex/pull/20001) fix(network-proxy): harden linux proxy bridge helpers [@viyatb-oai](https://github.com/viyatb-oai)
* [#19959](https://github.com/openai/codex/pull/19959) Fix log db batch flush flake [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#17373](https://github.com/openai/codex/pull/17373) app-server: run initialized rpcs with keyed serialization [@euroelessar](https://github.com/euroelessar)
* [#19708](https://github.com/openai/codex/pull/19708) Load cloud requirements for agent identity [@shijie-oai](https://github.com/shijie-oai)
* [#19999](https://github.com/openai/codex/pull/19999) fix(network-proxy): recheck network proxy connect targets [@viyatb-oai](https://github.com/viyatb-oai)
* [#20047](https://github.com/openai/codex/pull/20047) app-server: allow remote\_control runtime feature override [@euroelessar](https://github.com/euroelessar)
* [#20052](https://github.com/openai/codex/pull/20052) Make MultiAgentV2 wait minimum configurable [@jif-oai](https://github.com/jif-oai)
* [#20008](https://github.com/openai/codex/pull/20008) tui: use permission profiles for sandbox state [@bolinfest](https://github.com/bolinfest)
* [#20068](https://github.com/openai/codex/pull/20068) app-server: disable remote control without sqlite [@euroelessar](https://github.com/euroelessar)
* [#20066](https://github.com/openai/codex/pull/20066) [rollout-trace] Include x-request-id in rollout trace. [@cassirer-openai](https://github.com/cassirer-openai)
* [#19705](https://github.com/openai/codex/pull/19705) Discover hooks bundled with plugins [@abhinav-oai](https://github.com/abhinav-oai)
* [#18704](https://github.com/openai/codex/pull/18704) /plugins: add marketplace install flow [@canvrno-oai](https://github.com/canvrno-oai)
* [#20085](https://github.com/openai/codex/pull/20085) fix: don't auto approve git -C ... [@owenlin0](https://github.com/owenlin0)
* [#20088](https://github.com/openai/codex/pull/20088) Fix flaky plugin hook env test [@abhinav-oai](https://github.com/abhinav-oai)
* [#19995](https://github.com/openai/codex/pull/19995) fix(network-proxy): normalize network proxy host matching [@viyatb-oai](https://github.com/viyatb-oai)
* [#20010](https://github.com/openai/codex/pull/20010) core tests: submit turns with permission profiles [@bolinfest](https://github.com/bolinfest)
* [#20092](https://github.com/openai/codex/pull/20092) Return None when auth refresh fails [@gpeal](https://github.com/gpeal)
* [#19919](https://github.com/openai/codex/pull/19919) app-server: notify clients of remote-control status changes [@euroelessar](https://github.com/euroelessar)
* [#20097](https://github.com/openai/codex/pull/20097) Refine Codex issue digest summaries [@etraut-openai](https://github.com/etraut-openai)
* [#20011](https://github.com/openai/codex/pull/20011) core tests: build user turns from permission profiles [@bolinfest](https://github.com/bolinfest)
* [#20013](https://github.com/openai/codex/pull/20013) core tests: migrate more turns to permission profiles [@bolinfest](https://github.com/bolinfest)
* [#20015](https://github.com/openai/codex/pull/20015) core tests: configure profiles directly [@bolinfest](https://github.com/bolinfest)
* [#20016](https://github.com/openai/codex/pull/20016) core tests: send model turns with permission profiles [@bolinfest](https://github.com/bolinfest)
* [#20100](https://github.com/openai/codex/pull/20100) Increase plugin hook env test timeout [@abhinav-oai](https://github.com/abhinav-oai)
* [#20018](https://github.com/openai/codex/pull/20018) core tests: migrate model/personality turns to profiles [@bolinfest](https://github.com/bolinfest)
* [#20021](https://github.com/openai/codex/pull/20021) core tests: migrate view image turns to profiles [@bolinfest](https://github.com/bolinfest)
* [#20024](https://github.com/openai/codex/pull/20024) core tests: migrate safety check turns to profiles [@bolinfest](https://github.com/bolinfest)
* [#20026](https://github.com/openai/codex/pull/20026) core tests: migrate plan item turns to profiles [@bolinfest](https://github.com/bolinfest)
* [#20027](https://github.com/openai/codex/pull/20027) core tests: migrate tools tests to permission profiles [@bolinfest](https://github.com/bolinfest)
* [#20028](https://github.com/openai/codex/pull/20028) core tests: migrate permissions message tests to profiles [@bolinfest](https://github.com/bolinfest)
* [#20030](https://github.com/openai/codex/pull/20030) core tests: migrate exec policy turns to profiles [@bolinfest](https://github.com/bolinfest)
* [#20032](https://github.com/openai/codex/pull/20032) core tests: migrate prompt caching turns to profiles [@bolinfest](https://github.com/bolinfest)
* [#20033](https://github.com/openai/codex/pull/20033) core tests: migrate request permissions tool turns to profiles [@bolinfest](https://github.com/bolinfest)
* [#20034](https://github.com/openai/codex/pull/20034) core tests: migrate zsh-fork permissions to profiles [@bolinfest](https://github.com/bolinfest)
* [#20035](https://github.com/openai/codex/pull/20035) core tests: migrate compact turns to profiles [@bolinfest](https://github.com/bolinfest)
* [#20037](https://github.com/openai/codex/pull/20037) core tests: migrate rmcp turns to profiles [@bolinfest](https://github.com/bolinfest)
* [#20040](https://github.com/openai/codex/pull/20040) core tests: migrate apply patch turns to profiles [@bolinfest](https://github.com/bolinfest)
* [#20041](https://github.com/openai/codex/pull/20041) core tests: migrate hook turns to profiles [@bolinfest](https://github.com/bolinfest)
* [#20072](https://github.com/openai/codex/pull/20072) Support disabling tool suggest for specific tools. [@mzeng-openai](https://github.com/mzeng-openai)
* [#19949](https://github.com/openai/codex/pull/19949) Support detect and import MCP, Subagents, hooks, commands from external [@alexsong-oai](https://github.com/alexsong-oai)
* [#19442](https://github.com/openai/codex/pull/19442) feat: disable capabilities by model provider [@celia-oai](https://github.com/celia-oai)
* [#20108](https://github.com/openai/codex/pull/20108) fix: restore live event submit path for apply patch tests [@bolinfest](https://github.com/bolinfest)
* [#19939](https://github.com/openai/codex/pull/19939) Restore TUI working status after steer message is set [@canvrno-oai](https://github.com/canvrno-oai)
* [#20086](https://github.com/openai/codex/pull/20086) Fix plugin list workspace settings test isolation [@canvrno-oai](https://github.com/canvrno-oai)
* [#20049](https://github.com/openai/codex/pull/20049) feat: expose provider capability bounds to app server clients [@celia-oai](https://github.com/celia-oai)
* [#20109](https://github.com/openai/codex/pull/20109) feat: update Bedrock Mantle endpoint and GPT-5.4 model ID [@celia-oai](https://github.com/celia-oai)
* [#20106](https://github.com/openai/codex/pull/20106) linux-sandbox: switch helper plumbing to PermissionProfile [@bolinfest](https://github.com/bolinfest)
* [#20112](https://github.com/openai/codex/pull/20112) Soften skill description budget warnings [@xl-openai](https://github.com/xl-openai)
* [#20058](https://github.com/openai/codex/pull/20058) Add environment provider snapshot [@starr-openai](https://github.com/starr-openai)
* [#20133](https://github.com/openai/codex/pull/20133) chore(cli) deprecate --full-auto [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#20117](https://github.com/openai/codex/pull/20117) feat(cli): add explicit sandbox permission profiles [@viyatb-oai](https://github.com/viyatb-oai)
* [#20139](https://github.com/openai/codex/pull/20139) Delete multi\_agent\_v2 followup\_task interrupt parameter [@andmis](https://github.com/andmis)
* [#20118](https://github.com/openai/codex/pull/20118) feat(cli): add sandbox profile config controls [@viyatb-oai](https://github.com/viyatb-oai)
* [#20144](https://github.com/openai/codex/pull/20144) Fix migrated hook path rewriting [@alexsong-oai](https://github.com/alexsong-oai)
* [#20042](https://github.com/openai/codex/pull/20042) Fix Windows pseudoconsole attribute handling for sandboxed PTY sessions [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#20186](https://github.com/openai/codex/pull/20186) nit: drop old memories things [@jif-oai](https://github.com/jif-oai)
* [#20180](https://github.com/openai/codex/pull/20180) Make multi-agent v2 ignore agents.max\_depth [@jif-oai](https://github.com/jif-oai)
* [#20082](https://github.com/openai/codex/pull/20082) Use /goal resume for paused goals [@etraut-openai](https://github.com/etraut-openai)
* [#20172](https://github.com/openai/codex/pull/20172) TUI: Remove core protocol dependency [1/7] [@etraut-openai](https://github.com/etraut-openai)
* [#19211](https://github.com/openai/codex/pull/19211) Improve Windows process management edge cases [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#20123](https://github.com/openai/codex/pull/20123) [rollout-tracer] Match analysis messages on encrypted id. [@cassirer-openai](https://github.com/cassirer-openai)
* [#20173](https://github.com/openai/codex/pull/20173) TUI: Remove core protocol dependency [2/7] [@etraut-openai](https://github.com/etraut-openai)
* [#20174](https://github.com/openai/codex/pull/20174) TUI: Remove core protocol dependency [3/7] [@etraut-openai](https://github.com/etraut-openai)
* [#20228](https://github.com/openai/codex/pull/20228) [codex-backend] Prefer sqlite git info for rollout-path reads [@joeytrasatti-openai](https://github.com/joeytrasatti-openai)
* [#20141](https://github.com/openai/codex/pull/20141) Add ThreadManager sample crate [@pakrym-oai](https://github.com/pakrym-oai)
* [#20046](https://github.com/openai/codex/pull/20046) test protocol: lock inter-agent commentary phase [@friel-openai](https://github.com/friel-openai)
* [#20064](https://github.com/openai/codex/pull/20064) Include auto-review rollout in feedback uploads [@won-openai](https://github.com/won-openai)
* [#20096](https://github.com/openai/codex/pull/20096) feat: Use remote installed plugin cache for skills and MCP [@xl-openai](https://github.com/xl-openai)
* [#19184](https://github.com/openai/codex/pull/19184) fix: handle deferred network proxy denials [@viyatb-oai](https://github.com/viyatb-oai)
* [#20089](https://github.com/openai/codex/pull/20089) expand the set of core shell env vars for Windows. [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#17088](https://github.com/openai/codex/pull/17088) [codex-analytics] ingest server requests and responses [@rhan-oai](https://github.com/rhan-oai)
* [#20091](https://github.com/openai/codex/pull/20091) [tool\_suggest] Improve tool\_suggest triggering conditions. [@mzeng-openai](https://github.com/mzeng-openai)
* [#20258](https://github.com/openai/codex/pull/20258) app-server: fix outgoing sender test setup [@sayan-oai](https://github.com/sayan-oai)
* [#20050](https://github.com/openai/codex/pull/20050) [app-server] type client response payloads [@rhan-oai](https://github.com/rhan-oai)
* [#19966](https://github.com/openai/codex/pull/19966) Require remote plugin detail before uninstall [@xli-oai](https://github.com/xli-oai)
* [#20059](https://github.com/openai/codex/pull/20059) [app-server] centralize client response analytics [@rhan-oai](https://github.com/rhan-oai)
* [#19334](https://github.com/openai/codex/pull/19334) Fallback login callback port when default is busy [@xli-oai](https://github.com/xli-oai)
* [#20231](https://github.com/openai/codex/pull/20231) [apps] Add apps MCP path override [@adaley-openai](https://github.com/adaley-openai)
* [#20242](https://github.com/openai/codex/pull/20242) docs: discourage `#[async\_trait]` and `#[allow(async\_fn\_in\_trait)]` [@bolinfest](https://github.com/bolinfest)
* [#19620](https://github.com/openai/codex/pull/19620) Escape turn metadata headers as ASCII JSON [@etraut-openai](https://github.com/etraut-openai)
* [#19537](https://github.com/openai/codex/pull/19537) [mcp] Fix plugin MCP approval policy. [@mzeng-openai](https://github.com/mzeng-openai)
* [#19229](https://github.com/openai/codex/pull/19229) Add agent graph store interface [@rasmusrygaard](https://github.com/rasmusrygaard)
* [#20243](https://github.com/openai/codex/pull/20243) Add codex-core public API listing [@pakrym-oai](https://github.com/pakrym-oai)
* [#19435](https://github.com/openai/codex/pull/19435) stop blocking unified\_exec on Windows [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#19852](https://github.com/openai/codex/pull/19852) Enforce workspace metadata protections in Linux sandbox [@evawong-oai](https://github.com/evawong-oai)
* [#20136](https://github.com/openai/codex/pull/20136) Update Codex login success page UX [@rafael-jac](https://github.com/rafael-jac)
* [#20271](https://github.com/openai/codex/pull/20271) chore: increase release build timeout from 60 min to 90 [@bolinfest](https://github.com/bolinfest)
* [#19778](https://github.com/openai/codex/pull/19778) Add hooks/list app-server RPC [@abhinav-oai](https://github.com/abhinav-oai)
* [#20261](https://github.com/openai/codex/pull/20261) Consume ai-title from external sessions and add end marker [@alexsong-oai](https://github.com/alexsong-oai)
* [#20284](https://github.com/openai/codex/pull/20284) Import external agent sessions in background [@stefanstokic-oai](https://github.com/stefanstokic-oai)
* [#20149](https://github.com/openai/codex/pull/20149) Reduce the surface of collaboration modes [@pakrym-oai](https://github.com/pakrym-oai)
* [#20282](https://github.com/openai/codex/pull/20282) tui: return from side chat on Ctrl-D [@etraut-openai](https://github.com/etraut-openai)
* [#20250](https://github.com/openai/codex/pull/20250) update codex\_plugins\_beta\_setting (from workspace settings) [@zamoshchin-openai](https://github.com/zamoshchin-openai)
* [#20080](https://github.com/openai/codex/pull/20080) [codex-analytics] prevent stale guardian events from satisfying reused reviews [@rhan-oai](https://github.com/rhan-oai)
* [#20291](https://github.com/openai/codex/pull/20291) app-server: remove dead api version handling from bespoke events [@pakrym-oai](https://github.com/pakrym-oai)
* [#20304](https://github.com/openai/codex/pull/20304) [plugins] Allow MSFT curated plugins in tool\_suggest [@mzeng-openai](https://github.com/mzeng-openai)
* [#20095](https://github.com/openai/codex/pull/20095) permissions: expose active profile metadata [@bolinfest](https://github.com/bolinfest)
* [#19840](https://github.com/openai/codex/pull/19840) Add persisted hook enablement state [@abhinav-oai](https://github.com/abhinav-oai)
* [#20343](https://github.com/openai/codex/pull/20343) ci: increase Windows release workflow timeouts [@bolinfest](https://github.com/bolinfest)
[
Full release on Github
](https://github.com/openai/codex/releases/tag/rust-v0.128.0)
*
2026-04-24
### Codex CLI 0.125.0
```
`$ npm install -g @openai/codex@0.125.0`
```
View details
## New Features
* App-server integrations now support Unix socket transport, pagination-friendly resume/fork, sticky environments, and remote thread config/store plumbing. ([#18255](https://github.com/openai/codex/pull/18255), [#18892](https://github.com/openai/codex/pull/18892), [#18897](https://github.com/openai/codex/pull/18897), [#18908](https://github.com/openai/codex/pull/18908), [#19008](https://github.com/openai/codex/pull/19008), [#19014](https://github.com/openai/codex/pull/19014))
* App-server plugin management can install remote plugins and upgrade configured marketplaces. ([#18917](https://github.com/openai/codex/pull/18917), [#19074](https://github.com/openai/codex/pull/19074))
* Permission profiles now round-trip across TUI sessions, user turns, MCP sandbox state, shell escalation, and app-server APIs. ([#18284](https://github.com/openai/codex/pull/18284), [#18285](https://github.com/openai/codex/pull/18285), [#18286](https://github.com/openai/codex/pull/18286), [#18287](https://github.com/openai/codex/pull/18287), [#19231](https://github.com/openai/codex/pull/19231))
* Model providers now own model discovery, with AWS/Bedrock account state exposed to app clients. ([#18950](https://github.com/openai/codex/pull/18950), [#19048](https://github.com/openai/codex/pull/19048))
* `codex exec --json` now reports reasoning-token usage for programmatic consumers. ([#19308](https://github.com/openai/codex/pull/19308))
* Rollout tracing now records tool, code-mode, session, and multi-agent relationships, with a debug reducer command for inspection. ([#18878](https://github.com/openai/codex/pull/18878), [#18879](https://github.com/openai/codex/pull/18879), [#18880](https://github.com/openai/codex/pull/18880))
## Bug Fixes
* Interrupting `/review` and exiting the TUI no longer leaves the interface wedged on delegate startup or unsubscribe. ([#18921](https://github.com/openai/codex/pull/18921))
* Exec-server no longer drops buffered output after process exit and now waits correctly for stream closure. ([#18946](https://github.com/openai/codex/pull/18946), [#19130](https://github.com/openai/codex/pull/19130))
* App-server now respects explicitly untrusted project config instead of auto-persisting trust. ([#18626](https://github.com/openai/codex/pull/18626))
* WebSocket app-server clients are less likely to disconnect during bursts of turn and tool-output notifications. ([#19246](https://github.com/openai/codex/pull/19246))
* Windows sandbox startup handles multiple CLI versions and installed app directories better, and background `Start-Process` calls avoid visible PowerShell windows. ([#19044](https://github.com/openai/codex/pull/19044), [#19180](https://github.com/openai/codex/pull/19180), [#19214](https://github.com/openai/codex/pull/19214))
* Config/schema handling now rejects conflicting MultiAgentV2 thread limits, resolves relative agent-role config paths, hides unsupported MCP bearer-token fields, and rejects invalid `js\_repl` image MIME types. ([#19129](https://github.com/openai/codex/pull/19129), [#19261](https://github.com/openai/codex/pull/19261), [#19294](https://github.com/openai/codex/pull/19294), [#19292](https://github.com/openai/codex/pull/19292))
## Documentation
* App-server docs and generated schemas were refreshed for the new transport, thread, marketplace, sticky environment, and permission-profile APIs. ([#18255](https://github.com/openai/codex/pull/18255), [#18897](https://github.com/openai/codex/pull/18897), [#19014](https://github.com/openai/codex/pull/19014), [#19074](https://github.com/openai/codex/pull/19074), [#19231](https://github.com/openai/codex/pull/19231))
* Rollout-trace documentation now covers the debug trace reduction workflow. ([#18880](https://github.com/openai/codex/pull/18880))
## Chores
* Refreshed `models.json` and related core, app-server, SDK, and TUI fixtures for the latest model catalog and reasoning defaults. ([#19323](https://github.com/openai/codex/pull/19323))
* Windows Bazel CI now uses a stable PATH and shared query startup path for better cache reuse. ([#19161](https://github.com/openai/codex/pull/19161), [#19232](https://github.com/openai/codex/pull/19232))
* Plugin marketplace add/remove/startup-sync internals moved out of `codex-core`, and curated plugin cache versions now use short SHAs. ([#19099](https://github.com/openai/codex/pull/19099), [#19095](https://github.com/openai/codex/pull/19095))
* Reverted a macOS signing entitlement change after it caused alpha startup failures. ([#19167](https://github.com/openai/codex/pull/19167), [#19350](https://github.com/openai/codex/pull/19350))
* Stabilized flaky approval-popup and plugin MCP tool-discovery tests. ([#19178](https://github.com/openai/codex/pull/19178), [#19191](https://github.com/openai/codex/pull/19191))
## Changelog
Full Changelog: [rust-v0.124.0...rust-v0.125.0](https://github.com/openai/codex/compare/rust-v0.124.0...rust-v0.125.0)
* [#19129](https://github.com/openai/codex/pull/19129) Reject agents.max\_threads with multi\_agent\_v2 [@jif-oai](https://github.com/jif-oai)
* [#19130](https://github.com/openai/codex/pull/19130) exec-server: wait for close after observed exit [@jif-oai](https://github.com/jif-oai)
* [#19149](https://github.com/openai/codex/pull/19149) Update safety check wording [@etraut-openai](https://github.com/etraut-openai)
* [#18284](https://github.com/openai/codex/pull/18284) tui: sync session permission profiles [@bolinfest](https://github.com/bolinfest)
* [#18710](https://github.com/openai/codex/pull/18710) [codex] Fix plugin marketplace help usage [@xli-oai](https://github.com/xli-oai)
* [#19127](https://github.com/openai/codex/pull/19127) feat: drop spawned-agent context instructions [@jif-oai](https://github.com/jif-oai)
* [#18892](https://github.com/openai/codex/pull/18892) Add remote thread config loader protos [@rasmusrygaard](https://github.com/rasmusrygaard)
* [#19014](https://github.com/openai/codex/pull/19014) Add excludeTurns parameter to thread/resume and thread/fork [@ddr-oai](https://github.com/ddr-oai)
* [#18882](https://github.com/openai/codex/pull/18882) [codex] Route live thread writes through ThreadStore [@wiltzius-openai](https://github.com/wiltzius-openai)
* [#19008](https://github.com/openai/codex/pull/19008) [codex] Implement remote thread store methods [@wiltzius-openai](https://github.com/wiltzius-openai)
* [#18626](https://github.com/openai/codex/pull/18626) Respect explicit untrusted project config [@etraut-openai](https://github.com/etraut-openai)
* [#18255](https://github.com/openai/codex/pull/18255) app-server: add Unix socket transport [@euroelessar](https://github.com/euroelessar)
* [#19167](https://github.com/openai/codex/pull/19167) ci: add macOS keychain entitlements [@euroelessar](https://github.com/euroelessar)
* [#19099](https://github.com/openai/codex/pull/19099) Move marketplace add/remove and startup sync out of core. [@xl-openai](https://github.com/xl-openai)
* [#19168](https://github.com/openai/codex/pull/19168) Use Auto-review wording for fallback rationale [@maja-openai](https://github.com/maja-openai)
* [#18908](https://github.com/openai/codex/pull/18908) Add remote thread config endpoint [@rasmusrygaard](https://github.com/rasmusrygaard)
* [#18285](https://github.com/openai/codex/pull/18285) tui: carry permission profiles on user turns [@bolinfest](https://github.com/bolinfest)
* [#18286](https://github.com/openai/codex/pull/18286) mcp: include permission profiles in sandbox state [@bolinfest](https://github.com/bolinfest)
* [#18878](https://github.com/openai/codex/pull/18878) [rollout\_trace] Trace tool and code-mode boundaries [@cassirer-openai](https://github.com/cassirer-openai)
* [#18287](https://github.com/openai/codex/pull/18287) shell-escalation: carry resolved permission profiles [@bolinfest](https://github.com/bolinfest)
* [#18946](https://github.com/openai/codex/pull/18946) fix(exec-server): retain output until streams close [@bolinfest](https://github.com/bolinfest)
* [#19074](https://github.com/openai/codex/pull/19074) Add app-server marketplace upgrade RPC [@xli-oai](https://github.com/xli-oai)
* [#19180](https://github.com/openai/codex/pull/19180) use a version-specific suffix for command runner binary in .sandbox-bin [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#19178](https://github.com/openai/codex/pull/19178) Stabilize approvals popup disabled-row test [@etraut-openai](https://github.com/etraut-openai)
* [#18921](https://github.com/openai/codex/pull/18921) Fix /review interrupt and TUI exit wedges [@etraut-openai](https://github.com/etraut-openai)
* [#19191](https://github.com/openai/codex/pull/19191) Stabilize plugin MCP tools test [@etraut-openai](https://github.com/etraut-openai)
* [#19194](https://github.com/openai/codex/pull/19194) Mark hooks schema fixtures as generated [@abhinav-oai](https://github.com/abhinav-oai)
* [#18288](https://github.com/openai/codex/pull/18288) tests: isolate approval fixtures from host rules [@bolinfest](https://github.com/bolinfest)
* [#19044](https://github.com/openai/codex/pull/19044) guide Windows to use -WindowStyle Hidden for Start-Process calls [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#19214](https://github.com/openai/codex/pull/19214) do not attempt ACLs on installed codex dir [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#19161](https://github.com/openai/codex/pull/19161) ci: derive cache-stable Windows Bazel PATH [@bolinfest](https://github.com/bolinfest)
* [#18811](https://github.com/openai/codex/pull/18811) refactor: route Codex auth through AuthProvider [@efrazer-oai](https://github.com/efrazer-oai)
* [#19246](https://github.com/openai/codex/pull/19246) Increase app-server WebSocket outbound buffer [@etraut-openai](https://github.com/etraut-openai)
* [#19048](https://github.com/openai/codex/pull/19048) feat: expose AWS account state from account/read [@celia-oai](https://github.com/celia-oai)
* [#18880](https://github.com/openai/codex/pull/18880) [rollout\_trace] Add debug trace reduction command [@cassirer-openai](https://github.com/cassirer-openai)
* [#18897](https://github.com/openai/codex/pull/18897) Add sticky environment API and thread state [@starr-openai](https://github.com/starr-openai)
* [#18879](https://github.com/openai/codex/pull/18879) [rollout\_trace] Trace sessions and multi-agent edges [@cassirer-openai](https://github.com/cassirer-openai)
* [#19095](https://github.com/openai/codex/pull/19095) feat: Use short SHA versions for curated plugin cache entries [@xl-openai](https://github.com/xl-openai)
* [#18950](https://github.com/openai/codex/pull/18950) feat: let model providers own model discovery [@celia-oai](https://github.com/celia-oai)
* [#19206](https://github.com/openai/codex/pull/19206) app-server: persist device key bindings in sqlite [@euroelessar](https://github.com/euroelessar)
* [#18917](https://github.com/openai/codex/pull/18917) [codex] Support remote plugin install writes [@xli-oai](https://github.com/xli-oai)
* [#19231](https://github.com/openai/codex/pull/19231) permissions: make profiles represent enforcement [@bolinfest](https://github.com/bolinfest)
* [#19261](https://github.com/openai/codex/pull/19261) Resolve relative agent role config paths from layers [@etraut-openai](https://github.com/etraut-openai)
* [#19232](https://github.com/openai/codex/pull/19232) ci: reuse Bazel CI startup for target-discovery queries [@bolinfest](https://github.com/bolinfest)
* [#19292](https://github.com/openai/codex/pull/19292) Reject unsupported js\_repl image MIME types [@etraut-openai](https://github.com/etraut-openai)
* [#19247](https://github.com/openai/codex/pull/19247) chore: apply truncation policy to unified\_exec [@sayan-oai](https://github.com/sayan-oai)
* [#19294](https://github.com/openai/codex/pull/19294) Hide unsupported MCP bearer\_token from config schema [@etraut-openai](https://github.com/etraut-openai)
* [#19308](https://github.com/openai/codex/pull/19308) Surface reasoning tokens in exec JSON usage [@etraut-openai](https://github.com/etraut-openai)
* [#19323](https://github.com/openai/codex/pull/19323) Update models.json and related fixtures [@sayan-oai](https://github.com/sayan-oai)
* [#19350](https://github.com/openai/codex/pull/19350) fix alpha build [@jif-oai](https://github.com/jif-oai)
[
Full release on Github
](https://github.com/openai/codex/releases/tag/rust-v0.125.0)
*
2026-04-23
### GPT-5.5 and Codex app updates
[GPT-5.5 is now available in Codex](https://openai.com/index/introducing-gpt-5-5/)
as OpenAI’s newest frontier model for complex coding, computer use, knowledge
work, and research workflows.
#### GPT-5.5 in Codex
GPT-5.5 is the recommended choice for most Codex tasks when it appears in your
model picker. It’s especially useful for implementation, refactors, debugging,
testing, validation, and knowledge-work artifacts.
To switch to GPT-5.5:
* In the CLI, start a new thread with:
```
`codex --model gpt-5.5`
```
Or use `/model` during a session.
* In the IDE extension, choose GPT-5.5 from the model selector in the composer.
* In the Codex app, choose GPT-5.5 from the model selector in the composer.
If you don’t see GPT-5.5 yet, update the CLI, IDE extension, or Codex app to
the latest version. During the rollout, continue using GPT-5.4 if GPT-5.5 is
not yet available.
#### Browser use in the Codex app
The Codex app can now let Codex operate the in-app browser for local
development servers and file-backed pages. Ask Codex to use the browser when it
needs to click through a rendered UI, reproduce a visual bug, or verify a local
fix inside the app.
Browser use runs through the bundled Browser plugin. In settings, you can
manage the plugin and review allowed or blocked websites.
#### Automatic approval reviews
Codex can route eligible approval prompts through an automatic reviewer agent
before the request runs. When configured, the Codex app shows an automatic
review item with the review status and risk level, so you can see whether the
reviewer approved, denied, stopped, or timed out before deciding.
*
2026-04-23
### Codex CLI 0.124.0
```
`$ npm install -g @openai/codex@0.124.0`
```
View details
## New Features
* The TUI now has quick reasoning controls: `Alt+,` lowers reasoning, `Alt+.` raises it, and accepted model upgrades now reset reasoning to the new model’s default instead of carrying over stale settings. ([#18866](https://github.com/openai/codex/pull/18866), [#19085](https://github.com/openai/codex/pull/19085))
* App-server sessions can now manage multiple environments and choose an environment and working directory per turn, which makes multi-workspace and remote setups easier to target precisely. ([#18401](https://github.com/openai/codex/pull/18401), [#18416](https://github.com/openai/codex/pull/18416))
* Added first-class Amazon Bedrock support for OpenAI-compatible providers, including AWS SigV4 signing and AWS credential-based auth. ([#17820](https://github.com/openai/codex/pull/17820))
* Remote plugin marketplaces can now be listed and read directly, with more reliable detail lookups and larger result pages. ([#18452](https://github.com/openai/codex/pull/18452), [#19079](https://github.com/openai/codex/pull/19079))
* Hooks are now stable, can be configured inline in `config.toml` and managed `requirements.toml`, and can observe MCP tools as well as `apply\_patch` and long-running Bash sessions. ([#18893](https://github.com/openai/codex/pull/18893), [#18385](https://github.com/openai/codex/pull/18385), [#18391](https://github.com/openai/codex/pull/18391), [#18888](https://github.com/openai/codex/pull/18888), [#19012](https://github.com/openai/codex/pull/19012))
* Eligible ChatGPT plans now default to the Fast service tier unless you explicitly opt out. ([#19053](https://github.com/openai/codex/pull/19053))
## Bug Fixes
* Preserved Cloudflare cookies across approved ChatGPT hosts, reducing auth breakage in HTTP-backed ChatGPT flows. ([#17783](https://github.com/openai/codex/pull/17783))
* Fixed remote app-server reliability issues so websocket events keep draining under load and shutdown no longer fails when the remote worker exits during cleanup. ([#18932](https://github.com/openai/codex/pull/18932), [#18936](https://github.com/openai/codex/pull/18936))
* Fixed permission-mode drift so `/permissions` changes survive side conversations and updated Full Access state is correctly reflected in MCP approval handling. ([#18924](https://github.com/openai/codex/pull/18924), [#19033](https://github.com/openai/codex/pull/19033))
* Fixed `wait\_agent` so it returns promptly when mailbox work is already queued instead of waiting for a fresh notification or timing out. ([#18968](https://github.com/openai/codex/pull/18968))
* Fixed local stdio MCP launches for relative commands without an explicit `cwd`, bringing fallback path resolution in line with CLI behavior. ([#19031](https://github.com/openai/codex/pull/19031))
* Startup now fails less often on managed config edge cases: unknown feature requirements warn instead of aborting, and cloud-requirements errors are clearer about what failed. ([#19038](https://github.com/openai/codex/pull/19038), [#19078](https://github.com/openai/codex/pull/19078))
## Changelog
Full Changelog: [rust-v0.123.0...rust-v0.124.0](https://github.com/openai/codex/compare/rust-v0.123.0...rust-v0.124.0)
* [#18870](https://github.com/openai/codex/pull/18870) Load app-server config through ConfigManager [@pakrym-oai](https://github.com/pakrym-oai)
* [#18866](https://github.com/openai/codex/pull/18866) feat(tui): shortcuts to change reasoning level temporarily [@fcoury-oai](https://github.com/fcoury-oai)
* [#18430](https://github.com/openai/codex/pull/18430) app-server: implement device key v2 methods [@euroelessar](https://github.com/euroelessar)
* [#18757](https://github.com/openai/codex/pull/18757) fix: fully revert agent identity runtime wiring [@efrazer-oai](https://github.com/efrazer-oai)
* [#17783](https://github.com/openai/codex/pull/17783) Preserve Cloudfare HTTP cookies in codex [@shijie-oai](https://github.com/shijie-oai)
* [#18876](https://github.com/openai/codex/pull/18876) [rollout\_trace] Add rollout trace crate [@cassirer-openai](https://github.com/cassirer-openai)
* [#18401](https://github.com/openai/codex/pull/18401) Support multiple managed environments [@starr-openai](https://github.com/starr-openai)
* [#18797](https://github.com/openai/codex/pull/18797) Allow guardian bare allow output [@maja-openai](https://github.com/maja-openai)
* [#18886](https://github.com/openai/codex/pull/18886) Normalize /statusline & /title items [@canvrno-oai](https://github.com/canvrno-oai)
* [#18768](https://github.com/openai/codex/pull/18768) [codex] Tighten external migration prompt tests [@alexsong-oai](https://github.com/alexsong-oai)
* [#18909](https://github.com/openai/codex/pull/18909) Update /statusline and /title snapshots [@canvrno-oai](https://github.com/canvrno-oai)
* [#18867](https://github.com/openai/codex/pull/18867) sandboxing: materialize cwd-relative permission globs [@bolinfest](https://github.com/bolinfest)
* [#18915](https://github.com/openai/codex/pull/18915) fix: windows snapshot for external\_agent\_config\_migration::tests::prompt\_snapshot did not match windows output [@bolinfest](https://github.com/bolinfest)
* [#18416](https://github.com/openai/codex/pull/18416) Add turn-scoped environment selections [@starr-openai](https://github.com/starr-openai)
* [#18391](https://github.com/openai/codex/pull/18391) fix(core): emit hooks for apply\_patch edits [@fcoury-oai](https://github.com/fcoury-oai)
* [#18916](https://github.com/openai/codex/pull/18916) test(core): move prompt debug coverage to integration suite [@bolinfest](https://github.com/bolinfest)
* [#17820](https://github.com/openai/codex/pull/17820) feat: add AWS SigV4 auth for OpenAI-compatible model providers [@celia-oai](https://github.com/celia-oai)
* [#18913](https://github.com/openai/codex/pull/18913) bazel: run wrapped Rust unit test shards [@bolinfest](https://github.com/bolinfest)
* [#18452](https://github.com/openai/codex/pull/18452) feat: Support remote plugin list/read. [@xl-openai](https://github.com/xl-openai)
* [#18936](https://github.com/openai/codex/pull/18936) Fix remote app-server shutdown race [@bolinfest](https://github.com/bolinfest)
* [#18871](https://github.com/openai/codex/pull/18871) refactor: add agent identity crate [@efrazer-oai](https://github.com/efrazer-oai)
* [#18276](https://github.com/openai/codex/pull/18276) exec-server: carry filesystem sandbox profiles [@bolinfest](https://github.com/bolinfest)
* [#18926](https://github.com/openai/codex/pull/18926) ci: keep argument comment lint checks materialized [@bolinfest](https://github.com/bolinfest)
* [#18935](https://github.com/openai/codex/pull/18935) Keep TUI status surfaces in sync [@etraut-openai](https://github.com/etraut-openai)
* [#18923](https://github.com/openai/codex/pull/18923) chore(tui) debug-config guardian\_policy\_config [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#18943](https://github.com/openai/codex/pull/18943) tests: serialize process-heavy Windows CI suites [@bolinfest](https://github.com/bolinfest)
* [#18934](https://github.com/openai/codex/pull/18934) [codex] Clean guardian instructions [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#18948](https://github.com/openai/codex/pull/18948) chore: remove unused Bedrock auth lazy loading [@celia-oai](https://github.com/celia-oai)
* [#18277](https://github.com/openai/codex/pull/18277) core: derive active permission profiles [@bolinfest](https://github.com/bolinfest)
* [#18785](https://github.com/openai/codex/pull/18785) feat: add explicit AgentIdentity auth mode [@efrazer-oai](https://github.com/efrazer-oai)
* [#18953](https://github.com/openai/codex/pull/18953) use long-lived sessions for codex sandbox windows [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#18278](https://github.com/openai/codex/pull/18278) app-server: expose thread permission profiles [@bolinfest](https://github.com/bolinfest)
* [#17693](https://github.com/openai/codex/pull/17693) [codex-analytics] guardian review analytics events emission [@rhan-oai](https://github.com/rhan-oai)
* [#17695](https://github.com/openai/codex/pull/17695) [codex-analytics] guardian review truncation [@rhan-oai](https://github.com/rhan-oai)
* [#17696](https://github.com/openai/codex/pull/17696) [codex-analytics] guardian review TTFT plumbing and emission [@rhan-oai](https://github.com/rhan-oai)
* [#18962](https://github.com/openai/codex/pull/18962) nit: expose lib [@jif-oai](https://github.com/jif-oai)
* [#18502](https://github.com/openai/codex/pull/18502) Support multiple cwd filters for thread list [@acrognale-oai](https://github.com/acrognale-oai)
* [#18968](https://github.com/openai/codex/pull/18968) fix: wait\_agent timeout for queued mailbox mail [@jif-oai](https://github.com/jif-oai)
* [#18971](https://github.com/openai/codex/pull/18971) fix: cargo deny [@jif-oai](https://github.com/jif-oai)
* [#18973](https://github.com/openai/codex/pull/18973) chore: prep memories for AB [@jif-oai](https://github.com/jif-oai)
* [#18852](https://github.com/openai/codex/pull/18852) [codex] Update imagegen system skill [@vb-openai](https://github.com/vb-openai)
* [#18865](https://github.com/openai/codex/pull/18865) Stage publishable Python runtime wheels [@sdcoffey](https://github.com/sdcoffey)
* [#18932](https://github.com/openai/codex/pull/18932) TUI: Keep remote app-server events draining [@etraut-openai](https://github.com/etraut-openai)
* [#18877](https://github.com/openai/codex/pull/18877) [rollout\_trace] Record core session rollout traces [@cassirer-openai](https://github.com/cassirer-openai)
* [#18959](https://github.com/openai/codex/pull/18959) feat(auto-review) policy config [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#18955](https://github.com/openai/codex/pull/18955) Add plumbing to approve stored Auto-Review denials [@won-openai](https://github.com/won-openai)
* [#18999](https://github.com/openai/codex/pull/18999) arg0: keep dispatch aliases alive during async main [@bolinfest](https://github.com/bolinfest)
* [#18925](https://github.com/openai/codex/pull/18925) feat: Fairly trim skill descriptions within context budget [@xl-openai](https://github.com/xl-openai)
* [#18890](https://github.com/openai/codex/pull/18890) feat(auto-review) short-circuit [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#18279](https://github.com/openai/codex/pull/18279) app-server: accept permission profile overrides [@bolinfest](https://github.com/bolinfest)
* [#18582](https://github.com/openai/codex/pull/18582) [2/4] Implement executor HTTP request runner [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#18197](https://github.com/openai/codex/pull/18197) feat: add guardian network approval trigger context [@viyatb-oai](https://github.com/viyatb-oai)
* [#19033](https://github.com/openai/codex/pull/19033) Fix MCP permission policy sync [@leoshimo-oai](https://github.com/leoshimo-oai)
* [#19016](https://github.com/openai/codex/pull/19016) exec-server: expose arg0 alias root to fs sandbox [@bolinfest](https://github.com/bolinfest)
* [#19036](https://github.com/openai/codex/pull/19036) Overlay state DB git metadata for filtered thread lists [@joeytrasatti-openai](https://github.com/joeytrasatti-openai)
* [#18956](https://github.com/openai/codex/pull/18956) [Codex] Register browser requirements feature keys [@khoi-oai](https://github.com/khoi-oai)
* [#19043](https://github.com/openai/codex/pull/19043) Update bundled OpenAI Docs skill freshness check [@kkahadze-oai](https://github.com/kkahadze-oai)
* [#18504](https://github.com/openai/codex/pull/18504) Rebrand approvals reviewer config to auto-review [@won-openai](https://github.com/won-openai)
* [#19046](https://github.com/openai/codex/pull/19046) exec-server: require explicit filesystem sandbox cwd [@bolinfest](https://github.com/bolinfest)
* [#18280](https://github.com/openai/codex/pull/18280) clients: send permission profiles to app-server [@bolinfest](https://github.com/bolinfest)
* [#18281](https://github.com/openai/codex/pull/18281) rollout: persist turn permission profiles [@bolinfest](https://github.com/bolinfest)
* [#18888](https://github.com/openai/codex/pull/18888) hooks: emit Bash PostToolUse when exec\_command completes via write\_stdin [@eternal-openai](https://github.com/eternal-openai)
* [#19056](https://github.com/openai/codex/pull/19056) Rename approvals reviewer variant to auto-review [@won-openai](https://github.com/won-openai)
* [#18583](https://github.com/openai/codex/pull/18583) [3/4] Add executor-backed RMCP HTTP client [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#19059](https://github.com/openai/codex/pull/19059) core: box multi-agent wrapper futures [@bolinfest](https://github.com/bolinfest)
* [#19031](https://github.com/openai/codex/pull/19031) Fix relative stdio MCP cwd fallback [@mzeng-openai](https://github.com/mzeng-openai)
* [#19063](https://github.com/openai/codex/pull/19063) chore(auto-review) feature =\> stable [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#19050](https://github.com/openai/codex/pull/19050) feat(request-permissions) approve with strict review [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#19067](https://github.com/openai/codex/pull/19067) test: set Rust test thread stack size [@bolinfest](https://github.com/bolinfest)
* [#19072](https://github.com/openai/codex/pull/19072) tui: fix approvals popup disabled shortcut test [@bolinfest](https://github.com/bolinfest)
* [#18893](https://github.com/openai/codex/pull/18893) codex: support hooks in config.toml and requirements.toml [@eternal-openai](https://github.com/eternal-openai)
* [#18282](https://github.com/openai/codex/pull/18282) protocol: report session permission profiles [@bolinfest](https://github.com/bolinfest)
* [#19053](https://github.com/openai/codex/pull/19053) Default Fast service tier for eligible ChatGPT plans [@shijie-oai](https://github.com/shijie-oai)
* [#19055](https://github.com/openai/codex/pull/19055) Add safety check notification and error handling [@etraut-openai](https://github.com/etraut-openai)
* [#18283](https://github.com/openai/codex/pull/18283) app-server: accept command permission profiles [@bolinfest](https://github.com/bolinfest)
* [#19012](https://github.com/openai/codex/pull/19012) Mark codex\_hooks stable [@abhinav-oai](https://github.com/abhinav-oai)
* [#18924](https://github.com/openai/codex/pull/18924) TUI: preserve permission state after side conversations [@etraut-openai](https://github.com/etraut-openai)
* [#19071](https://github.com/openai/codex/pull/19071) Add computer\_use feature requirement key [@leoshimo-oai](https://github.com/leoshimo-oai)
* [#19079](https://github.com/openai/codex/pull/19079) Use remote plugin IDs for detail reads and enlarge list pages [@xl-openai](https://github.com/xl-openai)
* [#19038](https://github.com/openai/codex/pull/19038) feat: Warn and continue on unknown feature requirements [@xl-openai](https://github.com/xl-openai)
* [#19078](https://github.com/openai/codex/pull/19078) Clarify cloud requirements error messages [@gverma-openai](https://github.com/gverma-openai)
* [#19085](https://github.com/openai/codex/pull/19085) Persist target default reasoning on model upgrade [@shijie-oai](https://github.com/shijie-oai)
* [#19086](https://github.com/openai/codex/pull/19086) app-server: include filesystem entries in permission requests [@bolinfest](https://github.com/bolinfest)
* [#18385](https://github.com/openai/codex/pull/18385) Support MCP tools in hooks [@abhinav-oai](https://github.com/abhinav-oai)
* [#19113](https://github.com/openai/codex/pull/19113) Fix auto-review config compatibility across protocol and SDK [@won-openai](https://github.com/won-openai)
[
Full release on Github
](https://github.com/openai/codex/releases/tag/rust-v0.124.0)
*
2026-04-23
### Codex CLI 0.123.0
```
`$ npm install -g @openai/codex@0.123.0`
```
View details
## New Features
* Added a built-in `amazon-bedrock` model provider with configurable AWS profile support ([#18744](https://github.com/openai/codex/pull/18744)).
* Added `/mcp verbose` for full MCP server diagnostics, resources, and resource templates while keeping plain `/mcp` fast ([#18610](https://github.com/openai/codex/pull/18610)).
* Made plugin MCP loading accept both `mcpServers` and top-level server maps in `.mcp.json` ([#18780](https://github.com/openai/codex/pull/18780)).
* Improved realtime handoffs so background agents receive transcript deltas and can explicitly stay silent when appropriate ([#18597](https://github.com/openai/codex/pull/18597), [#18761](https://github.com/openai/codex/pull/18761), [#18635](https://github.com/openai/codex/pull/18635)).
* Added host-specific `remote\_sandbox\_config` requirements for remote environments ([#18763](https://github.com/openai/codex/pull/18763)).
* Refreshed bundled model metadata, including the current `gpt-5.4` default ([#18586](https://github.com/openai/codex/pull/18586), [#18388](https://github.com/openai/codex/pull/18388), [#18719](https://github.com/openai/codex/pull/18719)).
## Bug Fixes
* Fixed `/copy` after rollback so it copies the latest visible assistant response, not a pre-rollback response ([#18739](https://github.com/openai/codex/pull/18739)).
* Queued normal follow-up text submitted while a manual shell command is running, preventing stuck `Working` states ([#18820](https://github.com/openai/codex/pull/18820)).
* Fixed Unicode/dead-key input in VS Code WSL terminals by disabling the enhanced keyboard mode there ([#18741](https://github.com/openai/codex/pull/18741)).
* Prevented stale proxy environment variables from being restored from shell snapshots ([#17271](https://github.com/openai/codex/pull/17271)).
* Made `codex exec` inherit root-level shared flags such as sandbox and model options ([#18630](https://github.com/openai/codex/pull/18630)).
* Removed leaked review prompts from TUI transcripts ([#18659](https://github.com/openai/codex/pull/18659)).
## Documentation
* Added and tightened the Code Review skill instructions used by Codex-driven reviews ([#18746](https://github.com/openai/codex/pull/18746), [#18818](https://github.com/openai/codex/pull/18818)).
* Documented intentional await-across-lock cases and enabled Clippy linting for them ([#18423](https://github.com/openai/codex/pull/18423), [#18698](https://github.com/openai/codex/pull/18698)).
* Updated app-server protocol docs for threadless MCP resource reads and namespaced dynamic tools ([#18292](https://github.com/openai/codex/pull/18292), [#18413](https://github.com/openai/codex/pull/18413)).
## Chores
* Fixed high-severity dependency alerts by pinning patched JS and Rust dependencies ([#18167](https://github.com/openai/codex/pull/18167)).
* Reduced Rust dev build debug-info overhead while preserving useful backtraces ([#18844](https://github.com/openai/codex/pull/18844)).
* Refreshed generated Python app-server SDK types from the current schema ([#18862](https://github.com/openai/codex/pull/18862)).
## Changelog
Full Changelog: [rust-v0.122.0...rust-v0.123.0](https://github.com/openai/codex/compare/rust-v0.122.0...rust-v0.123.0)
* [#18662](https://github.com/openai/codex/pull/18662) feat: add metric to track the number of turns with memory usage [@jif-oai](https://github.com/jif-oai)
* [#18659](https://github.com/openai/codex/pull/18659) chore: drop review prompt from TUI UX [@jif-oai](https://github.com/jif-oai)
* [#18661](https://github.com/openai/codex/pull/18661) feat: log client use min log level [@jif-oai](https://github.com/jif-oai)
* [#18094](https://github.com/openai/codex/pull/18094) [codex] Use background agent task auth for backend calls [@adrian-openai](https://github.com/adrian-openai)
* [#18441](https://github.com/openai/codex/pull/18441) Avoid false shell snapshot cleanup warnings [@etraut-openai](https://github.com/etraut-openai)
* [#18260](https://github.com/openai/codex/pull/18260) [codex] Use background task auth for additional backend calls [@adrian-openai](https://github.com/adrian-openai)
* [#18657](https://github.com/openai/codex/pull/18657) fix: auth.json leak in tests [@jif-oai](https://github.com/jif-oai)
* [#18610](https://github.com/openai/codex/pull/18610) Add verbose diagnostics for /mcp [@etraut-openai](https://github.com/etraut-openai)
* [#18633](https://github.com/openai/codex/pull/18633) Use app server thread names in TUI picker [@etraut-openai](https://github.com/etraut-openai)
* [#18591](https://github.com/openai/codex/pull/18591) Surface parent thread status in side conversations [@etraut-openai](https://github.com/etraut-openai)
* [#18361](https://github.com/openai/codex/pull/18361) codex: move thread/name/set and thread/memoryModeSet into ThreadStore [@wiltzius-openai](https://github.com/wiltzius-openai)
* [#18274](https://github.com/openai/codex/pull/18274) protocol: canonicalize file system permissions [@bolinfest](https://github.com/bolinfest)
* [#18403](https://github.com/openai/codex/pull/18403) refactor: use semaphores for async serialization gates [@bolinfest](https://github.com/bolinfest)
* [#18586](https://github.com/openai/codex/pull/18586) Update models.json [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#18289](https://github.com/openai/codex/pull/18289) Wire the PatchUpdated events through app\_server [@akshaynathan](https://github.com/akshaynathan)
* [#18631](https://github.com/openai/codex/pull/18631) Remove simple TUI legacy\_core reexports [@etraut-openai](https://github.com/etraut-openai)
* [#18697](https://github.com/openai/codex/pull/18697) [codex] Fix agent identity auth test fixture [@adrian-openai](https://github.com/adrian-openai)
* [#18388](https://github.com/openai/codex/pull/18388) Update models.json @github-actions
* [#18167](https://github.com/openai/codex/pull/18167) [codex] Fix high severity dependency alerts [@caseysilver-oai](https://github.com/caseysilver-oai)
* [#17692](https://github.com/openai/codex/pull/17692) [codex-analytics] guardian review analytics schema polishing [@rhan-oai](https://github.com/rhan-oai)
* [#18722](https://github.com/openai/codex/pull/18722) chore(guardian) disable mcps and plugins [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#18597](https://github.com/openai/codex/pull/18597) Update realtime handoff transcript handling [@guinness-oai](https://github.com/guinness-oai)
* [#18627](https://github.com/openai/codex/pull/18627) Surface TUI skills refresh failures [@etraut-openai](https://github.com/etraut-openai)
* [#18719](https://github.com/openai/codex/pull/18719) Fix stale model test fixtures [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#18714](https://github.com/openai/codex/pull/18714) Add experimental remote thread store config [@wiltzius-openai](https://github.com/wiltzius-openai)
* [#18739](https://github.com/openai/codex/pull/18739) fix(tui): keep /copy aligned with rollback [@fcoury-oai](https://github.com/fcoury-oai)
* [#18701](https://github.com/openai/codex/pull/18701) [codex] prefer inherited spawn agent model [@tibo-openai](https://github.com/tibo-openai)
* [#18632](https://github.com/openai/codex/pull/18632) Use app server metadata for fork parent titles [@etraut-openai](https://github.com/etraut-openai)
* [#18112](https://github.com/openai/codex/pull/18112) feat: cascade thread archive [@jif-oai](https://github.com/jif-oai)
* [#18716](https://github.com/openai/codex/pull/18716) Read conversation summaries through thread store [@wiltzius-openai](https://github.com/wiltzius-openai)
* [#18635](https://github.com/openai/codex/pull/18635) Add realtime silence tool [@guinness-oai](https://github.com/guinness-oai)
* [#18254](https://github.com/openai/codex/pull/18254) uds: add async Unix socket crate [@euroelessar](https://github.com/euroelessar)
* [#18746](https://github.com/openai/codex/pull/18746) Add Code Review skill [@pakrym-oai](https://github.com/pakrym-oai)
* [#18208](https://github.com/openai/codex/pull/18208) Add session config loader interface [@rasmusrygaard](https://github.com/rasmusrygaard)
* [#18753](https://github.com/openai/codex/pull/18753) Refactor TUI app module into submodules [@etraut-openai](https://github.com/etraut-openai)
* [#18630](https://github.com/openai/codex/pull/18630) Fix exec inheritance of root shared flags [@etraut-openai](https://github.com/etraut-openai)
* [#18027](https://github.com/openai/codex/pull/18027) [6/6] Fail exec client operations after disconnect [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17271](https://github.com/openai/codex/pull/17271) fix: fix stale proxy env restoration after shell snapshots [@viyatb-oai](https://github.com/viyatb-oai)
* [#18602](https://github.com/openai/codex/pull/18602) Warn when trusting Git subdirectories [@etraut-openai](https://github.com/etraut-openai)
* [#18761](https://github.com/openai/codex/pull/18761) [codex] Send realtime transcript deltas on handoff [@guinness-oai](https://github.com/guinness-oai)
* [#18435](https://github.com/openai/codex/pull/18435) /statusline & /title - Shared preview values [@canvrno-oai](https://github.com/canvrno-oai)
* [#18744](https://github.com/openai/codex/pull/18744) feat: add a built-in Amazon Bedrock model provider [@celia-oai](https://github.com/celia-oai)
* [#18581](https://github.com/openai/codex/pull/18581) [1/4] Add executor HTTP request protocol [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#18418](https://github.com/openai/codex/pull/18418) refactor: narrow async lock scopes [@bolinfest](https://github.com/bolinfest)
* [#18780](https://github.com/openai/codex/pull/18780) feat: Support more plugin MCP file shapes. [@xl-openai](https://github.com/xl-openai)
* [#18713](https://github.com/openai/codex/pull/18713) protocol: preserve glob scan depth in permission profiles [@bolinfest](https://github.com/bolinfest)
* [#18795](https://github.com/openai/codex/pull/18795) fix(guardian) Dont hard error on feature disable [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#18292](https://github.com/openai/codex/pull/18292) Make MCP resource read threadless [@mzeng-openai](https://github.com/mzeng-openai)
* [#18786](https://github.com/openai/codex/pull/18786) Fallback display names for TUI skill mentions [@canvrno-oai](https://github.com/canvrno-oai)
* [#18807](https://github.com/openai/codex/pull/18807) chore(app-server) linguist-generated [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#18393](https://github.com/openai/codex/pull/18393) feat(auto-review) Handle request\_permissions calls [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#18763](https://github.com/openai/codex/pull/18763) Add remote\_sandbox\_config to our config requirements [@abhinav-oai](https://github.com/abhinav-oai)
* [#18794](https://github.com/openai/codex/pull/18794) Organize context fragments [@pakrym-oai](https://github.com/pakrym-oai)
* [#18423](https://github.com/openai/codex/pull/18423) chore: document intentional await-holding cases [@bolinfest](https://github.com/bolinfest)
* [#18698](https://github.com/openai/codex/pull/18698) chore: enable await-holding clippy lints [@bolinfest](https://github.com/bolinfest)
* [#18413](https://github.com/openai/codex/pull/18413) [tool search] support namespaced deferred dynamic tools [@pash-openai](https://github.com/pash-openai)
* [#18818](https://github.com/openai/codex/pull/18818) [codex] Tighten code review skill wording [@pakrym-oai](https://github.com/pakrym-oai)
* [#18271](https://github.com/openai/codex/pull/18271) show bash mode in the TUI [@abhinav-oai](https://github.com/abhinav-oai)
* [#18741](https://github.com/openai/codex/pull/18741) fix(tui): disable enhanced keys for VS Code WSL [@fcoury-oai](https://github.com/fcoury-oai)
* [#18850](https://github.com/openai/codex/pull/18850) Move external agent config out of core [@pakrym-oai](https://github.com/pakrym-oai)
* [#18844](https://github.com/openai/codex/pull/18844) build: reduce Rust dev debuginfo [@bolinfest](https://github.com/bolinfest)
* [#18848](https://github.com/openai/codex/pull/18848) feat: baseline lib [@jif-oai](https://github.com/jif-oai)
* [#18846](https://github.com/openai/codex/pull/18846) core: make test-log a dev dependency [@bolinfest](https://github.com/bolinfest)
* [#18428](https://github.com/openai/codex/pull/18428) app-server: define device key v2 protocol [@euroelessar](https://github.com/euroelessar)
* [#18093](https://github.com/openai/codex/pull/18093) Propagate thread id in MCP tool metadata [@rennie-openai](https://github.com/rennie-openai)
* [#17836](https://github.com/openai/codex/pull/17836) [codex] Add tmux-aware OSC 9 notifications [@caseychow-oai](https://github.com/caseychow-oai)
* [#18820](https://github.com/openai/codex/pull/18820) Queue follow-up input during user shell commands [@etraut-openai](https://github.com/etraut-openai)
* [#18858](https://github.com/openai/codex/pull/18858) Stabilize debug clear memories integration test [@jif-oai](https://github.com/jif-oai)
* [#18799](https://github.com/openai/codex/pull/18799) Move TUI app tests to modules they cover [@etraut-openai](https://github.com/etraut-openai)
* [#18442](https://github.com/openai/codex/pull/18442) Refactor app-server config loading into ConfigManager [@pakrym-oai](https://github.com/pakrym-oai)
* [#18813](https://github.com/openai/codex/pull/18813) Split DeveloperInstructions into individual fragments. [@pakrym-oai](https://github.com/pakrym-oai)
* [#18275](https://github.com/openai/codex/pull/18275) sandboxing: intersect permission profiles semantically [@bolinfest](https://github.com/bolinfest)
* [#18862](https://github.com/openai/codex/pull/18862) Refresh generated Python app-server SDK types [@sdcoffey](https://github.com/sdcoffey)
* [#15578](https://github.com/openai/codex/pull/15578) Add Windows sandbox unified exec runtime support [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#18429](https://github.com/openai/codex/pull/18429) app-server: add codex-device-key crate [@euroelessar](https://github.com/euroelessar)
* [#18872](https://github.com/openai/codex/pull/18872) app-server: fix Bazel clippy in tracing tests [@euroelessar](https://github.com/euroelessar)
* [#18885](https://github.com/openai/codex/pull/18885) skip busted tests while I fix them [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#18873](https://github.com/openai/codex/pull/18873) chore: default multi-agent v2 fork to all [@jif-oai](https://github.com/jif-oai)
[
Full release on Github
](https://github.com/openai/codex/releases/tag/rust-v0.123.0)
*
2026-04-20
### Codex CLI 0.122.0
```
`$ npm install -g @openai/codex@0.122.0`
```
View details
## New Features
* Standalone installs are more self-contained, and `codex app` now opens or installs Desktop correctly on Windows and Intel Macs ([#17022](https://github.com/openai/codex/pull/17022), [#18500](https://github.com/openai/codex/pull/18500)).
* The TUI can open `/side` conversations for quick side questions, and queued input now supports slash commands and `!` shell prompts while work is running ([#18190](https://github.com/openai/codex/pull/18190), [#18542](https://github.com/openai/codex/pull/18542)).
* Plan Mode can start implementation in a fresh context, with context-usage shown before deciding whether to carry the planning thread forward ([#17499](https://github.com/openai/codex/pull/17499), [#18573](https://github.com/openai/codex/pull/18573)).
* Plugin workflows now include tabbed browsing, inline enable/disable toggles, marketplace removal, and remote, cross-repo, or local marketplace sources ([#18222](https://github.com/openai/codex/pull/18222), [#18395](https://github.com/openai/codex/pull/18395), [#17752](https://github.com/openai/codex/pull/17752), [#17751](https://github.com/openai/codex/pull/17751), [#17277](https://github.com/openai/codex/pull/17277), [#18017](https://github.com/openai/codex/pull/18017), [#18246](https://github.com/openai/codex/pull/18246)).
* Filesystem permissions now support deny-read glob policies, managed deny-read requirements, platform sandbox enforcement, and isolated `codex exec` runs that ignore user config or rules ([#15979](https://github.com/openai/codex/pull/15979), [#17740](https://github.com/openai/codex/pull/17740), [#18096](https://github.com/openai/codex/pull/18096), [#18646](https://github.com/openai/codex/pull/18646)).
* Tool discovery and image generation are now enabled by default, with higher-detail image handling and original-detail metadata support for MCP and `js\_repl` image outputs ([#17854](https://github.com/openai/codex/pull/17854), [#17153](https://github.com/openai/codex/pull/17153), [#17714](https://github.com/openai/codex/pull/17714), [#18386](https://github.com/openai/codex/pull/18386)).
## Bug Fixes
* App-server approvals, user-input prompts, and MCP elicitations now disappear from the TUI when another client resolves them, instead of leaving stale prompts behind ([#15134](https://github.com/openai/codex/pull/15134)).
* Remote-control startup now tolerates missing ChatGPT auth, and MCP startup cancellation works again through app-server sessions ([#18117](https://github.com/openai/codex/pull/18117), [#18078](https://github.com/openai/codex/pull/18078)).
* Resumed and forked app-server threads now replay token usage immediately so context/status UI starts with the restored state ([#18023](https://github.com/openai/codex/pull/18023)).
* Security-sensitive flows were tightened: logout revokes managed ChatGPT tokens, project hooks and exec policies require trusted workspaces, and Windows sandbox setup avoids broad user-profile and SSH-root grants ([#17825](https://github.com/openai/codex/pull/17825), [#14718](https://github.com/openai/codex/pull/14718), [#18443](https://github.com/openai/codex/pull/18443), [#18493](https://github.com/openai/codex/pull/18493)).
* Sandboxed `apply\_patch` writes work correctly with split filesystem policies, and file watchers now notice files created after watching begins ([#18296](https://github.com/openai/codex/pull/18296), [#18492](https://github.com/openai/codex/pull/18492)).
* Several TUI rough edges were fixed, including fatal skills-list failures, invalid resume hints, duplicate context statusline entries, `/model` menu loops, redundant memory notices, and terminal title quoting in iTerm2 ([#18061](https://github.com/openai/codex/pull/18061), [#18059](https://github.com/openai/codex/pull/18059), [#18054](https://github.com/openai/codex/pull/18054), [#18154](https://github.com/openai/codex/pull/18154), [#18580](https://github.com/openai/codex/pull/18580), [#18261](https://github.com/openai/codex/pull/18261)).
## Documentation
* Added a security-boundaries reference to `SECURITY.md` for sandboxing, approvals, and network controls ([#17848](https://github.com/openai/codex/pull/17848), [#18004](https://github.com/openai/codex/pull/18004)).
* Documented custom MCP server approval defaults and exec-server stdin behavior ([#17843](https://github.com/openai/codex/pull/17843), [#18086](https://github.com/openai/codex/pull/18086)).
* Updated app-server docs for plugin API changes, marketplace removal, resume/fork token-usage replay, and warning notifications ([#17277](https://github.com/openai/codex/pull/17277), [#17751](https://github.com/openai/codex/pull/17751), [#18023](https://github.com/openai/codex/pull/18023), [#18298](https://github.com/openai/codex/pull/18298)).
* Added a short guide for the responses API proxy ([#18604](https://github.com/openai/codex/pull/18604)).
## Chores
* Split plugin and marketplace code into `codex-core-plugins`, moved more connector code into `connectors`, and continued breaking up the large core session/turn modules ([#18070](https://github.com/openai/codex/pull/18070), [#18158](https://github.com/openai/codex/pull/18158), [#18200](https://github.com/openai/codex/pull/18200), [#18206](https://github.com/openai/codex/pull/18206), [#18244](https://github.com/openai/codex/pull/18244), [#18249](https://github.com/openai/codex/pull/18249)).
* Refactored config loading and `AGENTS.md` discovery behind narrower filesystem and manager abstractions ([#18209](https://github.com/openai/codex/pull/18209), [#18035](https://github.com/openai/codex/pull/18035)).
* Stabilized Bazel and CI with flake fixes, native Rust test sharding, scoped repository caches, stronger Windows clippy coverage, and updated `rules\_rs`/LLVM pins ([#17791](https://github.com/openai/codex/pull/17791), [#18082](https://github.com/openai/codex/pull/18082), [#18366](https://github.com/openai/codex/pull/18366), [#18350](https://github.com/openai/codex/pull/18350), [#18397](https://github.com/openai/codex/pull/18397)).
* Added core CODEOWNERS and a smaller development build profile ([#18362](https://github.com/openai/codex/pull/18362), [#18612](https://github.com/openai/codex/pull/18612)).
* Removed the stale core `models.json` and updated release preparation to refresh the active model catalog ([#18585](https://github.com/openai/codex/pull/18585)).
## Changelog
Full Changelog: [rust-v0.121.0...rust-v0.122.0](https://github.com/openai/codex/compare/rust-v0.121.0...rust-v0.122.0)
* [#17958](https://github.com/openai/codex/pull/17958) Support remote compaction for Azure responses providers [@ivanmurashko](https://github.com/ivanmurashko)
* [#17848](https://github.com/openai/codex/pull/17848) [docs] Add security boundaries reference in SECURITY.md [@evawong-oai](https://github.com/evawong-oai)
* [#17990](https://github.com/openai/codex/pull/17990) Auto install start-codex-exec.sh dependencies [@pakrym-oai](https://github.com/pakrym-oai)
* [#17892](https://github.com/openai/codex/pull/17892) Migrate archive/unarchive to local ThreadStore [@wiltzius-openai](https://github.com/wiltzius-openai)
* [#17989](https://github.com/openai/codex/pull/17989) [codex] Restore remote exec-server filesystem tests [@starr-openai](https://github.com/starr-openai)
* [#15134](https://github.com/openai/codex/pull/15134) Dismiss stale app-server requests after remote resolution [@ebrevdo](https://github.com/ebrevdo)
* [#18002](https://github.com/openai/codex/pull/18002) Re-enable it [@jif-oai](https://github.com/jif-oai)
* [#17885](https://github.com/openai/codex/pull/17885) feat: Support alternate marketplace manifests and local string [@xl-openai](https://github.com/xl-openai)
* [#18003](https://github.com/openai/codex/pull/18003) [docs] Revert extra changes from PR 17848 [@evawong-oai](https://github.com/evawong-oai)
* [#17714](https://github.com/openai/codex/pull/17714) Support original-detail metadata on MCP image outputs [@fjord-oai](https://github.com/fjord-oai)
* [#17022](https://github.com/openai/codex/pull/17022) Significantly improve standalone installer [@efrazer-oai](https://github.com/efrazer-oai)
* [#17853](https://github.com/openai/codex/pull/17853) [mcp] Add dummy tools for previously called but currently missing tools. [@mzeng-openai](https://github.com/mzeng-openai)
* [#18004](https://github.com/openai/codex/pull/18004) [docs] Restore SECURITY.md update from PR 17848 [@evawong-oai](https://github.com/evawong-oai)
* [#17896](https://github.com/openai/codex/pull/17896) Clarify realtime v2 context and handoff messages [@bxie-openai](https://github.com/bxie-openai)
* [#17742](https://github.com/openai/codex/pull/17742) removing network proxy for yolo [@won-openai](https://github.com/won-openai)
* [#17999](https://github.com/openai/codex/pull/17999) [codex] Make command exec delta tests chunk tolerant [@euroelessar](https://github.com/euroelessar)
* [#18033](https://github.com/openai/codex/pull/18033) feat: introduce codex-pr-body skill [@bolinfest](https://github.com/bolinfest)
* [#17877](https://github.com/openai/codex/pull/17877) Display YOLO mode permissions if set when launching TUI [@canvrno-oai](https://github.com/canvrno-oai)
* [#18022](https://github.com/openai/codex/pull/18022) Async config loading [@pakrym-oai](https://github.com/pakrym-oai)
* [#17854](https://github.com/openai/codex/pull/17854) Update ToolSearch to be enabled by default [@mzeng-openai](https://github.com/mzeng-openai)
* [#17831](https://github.com/openai/codex/pull/17831) [codex][mcp] Add resource uri meta to tool call item. [@mzeng-openai](https://github.com/mzeng-openai)
* [#18070](https://github.com/openai/codex/pull/18070) Extract plugin loading and marketplace logic into codex-core-plugins [@xl-openai](https://github.com/xl-openai)
* [#18078](https://github.com/openai/codex/pull/18078) Fix MCP startup cancellation through app server [@etraut-openai](https://github.com/etraut-openai)
* [#17151](https://github.com/openai/codex/pull/17151) [codex] Route Fed ChatGPT auth through Fed edge [@jackz-oai](https://github.com/jackz-oai)
* [#18006](https://github.com/openai/codex/pull/18006) fix: more flake [@jif-oai](https://github.com/jif-oai)
* [#18127](https://github.com/openai/codex/pull/18127) fix: windows flake [@jif-oai](https://github.com/jif-oai)
* [#18137](https://github.com/openai/codex/pull/18137) nit: add min values for memories [@jif-oai](https://github.com/jif-oai)
* [#18135](https://github.com/openai/codex/pull/18135) debug: windows flake [@jif-oai](https://github.com/jif-oai)
* [#18138](https://github.com/openai/codex/pull/18138) chore: more pollution filtering [@jif-oai](https://github.com/jif-oai)
* [#18134](https://github.com/openai/codex/pull/18134) chore: unify memory drop endpoints [@jif-oai](https://github.com/jif-oai)
* [#18144](https://github.com/openai/codex/pull/18144) nit: get rid of an expect [@jif-oai](https://github.com/jif-oai)
* [#17791](https://github.com/openai/codex/pull/17791) Stabilize Bazel tests (timeout tweaks and flake fixes) [@ddr-oai](https://github.com/ddr-oai)
* [#18117](https://github.com/openai/codex/pull/18117) fix: auth preflight [@jif-oai](https://github.com/jif-oai)
* [#18146](https://github.com/openai/codex/pull/18146) chore: use `justfile\_directory` in just file [@jif-oai](https://github.com/jif-oai)
* [#18085](https://github.com/openai/codex/pull/18085) [1/8] Add MCP server environment config [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#18054](https://github.com/openai/codex/pull/18054) fix(tui): remove duplicate context statusline item [@etraut-openai](https://github.com/etraut-openai)
* [#17287](https://github.com/openai/codex/pull/17287) [code mode] defer mcp tools from exec description [@sayan-oai](https://github.com/sayan-oai)
* [#18057](https://github.com/openai/codex/pull/18057) Prefill rename prompt with current thread name [@etraut-openai](https://github.com/etraut-openai)
* [#18059](https://github.com/openai/codex/pull/18059) Fix invalid TUI resume hints [@etraut-openai](https://github.com/etraut-openai)
* [#17153](https://github.com/openai/codex/pull/17153) Launch image generation by default [@won-openai](https://github.com/won-openai)
* [#18042](https://github.com/openai/codex/pull/18042) Make yolo skip managed-network tool enforcement [@won-openai](https://github.com/won-openai)
* [#18154](https://github.com/openai/codex/pull/18154) fix: model menu pop [@jif-oai](https://github.com/jif-oai)
* [#17826](https://github.com/openai/codex/pull/17826) [codex] Add remote thread store implementation [@wiltzius-openai](https://github.com/wiltzius-openai)
* [#18086](https://github.com/openai/codex/pull/18086) [2/8] Support piped stdin in exec process API [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#18061](https://github.com/openai/codex/pull/18061) Avoid fatal TUI errors on skills list failure [@etraut-openai](https://github.com/etraut-openai)
* [#15979](https://github.com/openai/codex/pull/15979) feat(permissions): add glob deny-read policy support [@viyatb-oai](https://github.com/viyatb-oai)
* [#18055](https://github.com/openai/codex/pull/18055) Improve external agent plugin migration for configured marketplaces [@alexsong-oai](https://github.com/alexsong-oai)
* [#17425](https://github.com/openai/codex/pull/17425) Auto-upgrade configured marketplaces [@xli-oai](https://github.com/xli-oai)
* [#18035](https://github.com/openai/codex/pull/18035) Refactor AGENTS.md discovery into AgentsMdManager [@pakrym-oai](https://github.com/pakrym-oai)
* [#18158](https://github.com/openai/codex/pull/18158) Move more connector logic into connectors crate [@pakrym-oai](https://github.com/pakrym-oai)
* [#17843](https://github.com/openai/codex/pull/17843) Add server-level approval defaults for custom MCP servers [@mzeng-openai](https://github.com/mzeng-openai)
* [#18178](https://github.com/openai/codex/pull/18178) fix: drop lock earlier; was held across send\_event().await unnecessarily [@bolinfest](https://github.com/bolinfest)
* [#18000](https://github.com/openai/codex/pull/18000) Make thread unsubscribe test deterministic [@starr-openai](https://github.com/starr-openai)
* [#17996](https://github.com/openai/codex/pull/17996) Add codex\_hook\_run analytics event [@abhinav-oai](https://github.com/abhinav-oai)
* [#18184](https://github.com/openai/codex/pull/18184) fix: fix clippy issue in examples/ folder [@bolinfest](https://github.com/bolinfest)
* [#18023](https://github.com/openai/codex/pull/18023) fix(app-server): replay token usage after resume and fork [@fcoury-oai](https://github.com/fcoury-oai)
* [#18172](https://github.com/openai/codex/pull/18172) [codex] Make realtime startup context truncation deterministic [@bxie-openai](https://github.com/bxie-openai)
* [#18192](https://github.com/openai/codex/pull/18192) Throttle Windows Bazel test concurrency [@starr-openai](https://github.com/starr-openai)
* [#18200](https://github.com/openai/codex/pull/18200) [codex] Split codex op handlers [@pakrym-oai](https://github.com/pakrym-oai)
* [#17387](https://github.com/openai/codex/pull/17387) Register agent tasks behind use\_agent\_identity [@adrian-openai](https://github.com/adrian-openai)
* [#18026](https://github.com/openai/codex/pull/18026) Add OTEL metrics for hook runs [@abhinav-oai](https://github.com/abhinav-oai)
* [#18092](https://github.com/openai/codex/pull/18092) [codex] Update realtime V2 VAD silence delay and 1.5 prompt [@bxie-openai](https://github.com/bxie-openai)
* [#18188](https://github.com/openai/codex/pull/18188) Add tabbed lists, single line rendering, col width changes [@canvrno-oai](https://github.com/canvrno-oai)
* [#18206](https://github.com/openai/codex/pull/18206) [codex] Split codex turn logic [@pakrym-oai](https://github.com/pakrym-oai)
* [#18169](https://github.com/openai/codex/pull/18169) Use codex-auto-review for guardian reviews [@jeffsharris](https://github.com/jeffsharris)
* [#18196](https://github.com/openai/codex/pull/18196) Use in-process app-server for unknown-thread MCP read test [@mzeng-openai](https://github.com/mzeng-openai)
* [#18116](https://github.com/openai/codex/pull/18116) Move marketplace add under plugin command [@xli-oai](https://github.com/xli-oai)
* [#18096](https://github.com/openai/codex/pull/18096) feat(sandbox): add glob deny-read platform enforcement [@viyatb-oai](https://github.com/viyatb-oai)
* [#17971](https://github.com/openai/codex/pull/17971) fix: deprecate use\_legacy\_landlock feature flag [@viyatb-oai](https://github.com/viyatb-oai)
* [#18209](https://github.com/openai/codex/pull/18209) Refactor config loading to use filesystem abstraction [@pakrym-oai](https://github.com/pakrym-oai)
* [#17862](https://github.com/openai/codex/pull/17862) Stream apply\_patch changes [@akshaynathan](https://github.com/akshaynathan)
* [#18244](https://github.com/openai/codex/pull/18244) Split codex session modules [@pakrym-oai](https://github.com/pakrym-oai)
* [#17713](https://github.com/openai/codex/pull/17713) feat: add opt-in provider runtime abstraction [@celia-oai](https://github.com/celia-oai)
* [#18182](https://github.com/openai/codex/pull/18182) feat: Handle alternate plugin manifest paths [@xl-openai](https://github.com/xl-openai)
* [#18219](https://github.com/openai/codex/pull/18219) Move Computer Use tool suggestion to core [@leoshimo-oai](https://github.com/leoshimo-oai)
* [#18231](https://github.com/openai/codex/pull/18231) codex: split thread/read view loading [@wiltzius-openai](https://github.com/wiltzius-openai)
* [#18126](https://github.com/openai/codex/pull/18126) fix(exec-policy) rules parsing [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#17825](https://github.com/openai/codex/pull/17825) [codex] Revoke ChatGPT tokens on logout [@sashank-oai](https://github.com/sashank-oai)
* [#18304](https://github.com/openai/codex/pull/18304) Fix Windows exec policy test flake [@etraut-openai](https://github.com/etraut-openai)
* [#17947](https://github.com/openai/codex/pull/17947) fix: reduce writable root [@jif-oai](https://github.com/jif-oai)
* [#18246](https://github.com/openai/codex/pull/18246) Sync local plugin imports, async remote imports, refresh caches after… [@alexsong-oai](https://github.com/alexsong-oai)
* [#18097](https://github.com/openai/codex/pull/18097) defer all tools behind feature flag [@sayan-oai](https://github.com/sayan-oai)
* [#17563](https://github.com/openai/codex/pull/17563) Add PermissionRequest hooks support [@abhinav-oai](https://github.com/abhinav-oai)
* [#18338](https://github.com/openai/codex/pull/18338) nit: phase 2 ephemeral [@jif-oai](https://github.com/jif-oai)
* [#18267](https://github.com/openai/codex/pull/18267) Support Ctrl+P/Ctrl+N in resume picker [@etraut-openai](https://github.com/etraut-openai)
* [#18261](https://github.com/openai/codex/pull/18261) fix(tui): use BEL for terminal title updates [@etraut-openai](https://github.com/etraut-openai)
* [#17740](https://github.com/openai/codex/pull/17740) feat(config): support managed deny-read requirements [@viyatb-oai](https://github.com/viyatb-oai)
* [#18249](https://github.com/openai/codex/pull/18249) Move codex module under session [@pakrym-oai](https://github.com/pakrym-oai)
* [#18351](https://github.com/openai/codex/pull/18351) Fix config-loader tests after filesystem abstraction race [@bolinfest](https://github.com/bolinfest)
* [#18021](https://github.com/openai/codex/pull/18021) Guardian -\> Auto-Review [@won-openai](https://github.com/won-openai)
* [#18140](https://github.com/openai/codex/pull/18140) feat: config aliases [@jif-oai](https://github.com/jif-oai)
* [#17232](https://github.com/openai/codex/pull/17232) Make app tool hint defaults pessimistic for app policies [@colby-oai](https://github.com/colby-oai)
* [#17499](https://github.com/openai/codex/pull/17499) feat(tui): add clear-context plan implementation [@fcoury-oai](https://github.com/fcoury-oai)
* [#18352](https://github.com/openai/codex/pull/18352) codex: route thread/read persistence through thread store [@wiltzius-openai](https://github.com/wiltzius-openai)
* [#18263](https://github.com/openai/codex/pull/18263) enable tool search over dynamic tools [@sayan-oai](https://github.com/sayan-oai)
* [#18350](https://github.com/openai/codex/pull/18350) ci: make Windows Bazel clippy catch core test imports [@bolinfest](https://github.com/bolinfest)
* [#18362](https://github.com/openai/codex/pull/18362) Add core CODEOWNERS [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#18366](https://github.com/openai/codex/pull/18366) ci: scope Bazel repository cache by job [@bolinfest](https://github.com/bolinfest)
* [#17305](https://github.com/openai/codex/pull/17305) Add sorting/backwardsCursor to thread/list and new thread/turns/list api [@ddr-oai](https://github.com/ddr-oai)
* [#18020](https://github.com/openai/codex/pull/18020) [3/6] Add pushed exec process events [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#12640](https://github.com/openai/codex/pull/12640) Update models.json @github-actions
* [#18373](https://github.com/openai/codex/pull/18373) Show default reasoning in /status [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#18379](https://github.com/openai/codex/pull/18379) Attribute automated PR Babysitter review replies [@etraut-openai](https://github.com/etraut-openai)
* [#18087](https://github.com/openai/codex/pull/18087) [4/6] Abstract MCP stdio server launching [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#18370](https://github.com/openai/codex/pull/18370) perf(tui): defer startup skills refresh [@fcoury-oai](https://github.com/fcoury-oai)
* [#18222](https://github.com/openai/codex/pull/18222) /plugins: Add v2 tabbed marketplace menu [@canvrno-oai](https://github.com/canvrno-oai)
* [#18227](https://github.com/openai/codex/pull/18227) [codex] Propagate rate limit reached type [@richardopenai](https://github.com/richardopenai)
* [#18380](https://github.com/openai/codex/pull/18380) exec-server: preserve fs helper runtime env [@starr-openai](https://github.com/starr-openai)
* [#18381](https://github.com/openai/codex/pull/18381) Remove the tier constraint from connectors directory requests [@xl-openai](https://github.com/xl-openai)
* [#18211](https://github.com/openai/codex/pull/18211) refactor: narrow async lock guard lifetimes [@bolinfest](https://github.com/bolinfest)
* [#18017](https://github.com/openai/codex/pull/18017) [codex] Add cross-repo plugin sources to marketplace manifests [@xli-oai](https://github.com/xli-oai)
* [#18398](https://github.com/openai/codex/pull/18398) refactor: use cloneable async channels for shared receivers [@bolinfest](https://github.com/bolinfest)
* [#18296](https://github.com/openai/codex/pull/18296) fix: fix fs sandbox helper for apply\_patch [@viyatb-oai](https://github.com/viyatb-oai)
* [#18397](https://github.com/openai/codex/pull/18397) [codex] Upgrade rules\_rs and llvm to latest BCR versions [@zbarsky-openai](https://github.com/zbarsky-openai)
* [#18082](https://github.com/openai/codex/pull/18082) bazel: use native rust test sharding [@bolinfest](https://github.com/bolinfest)
* [#18384](https://github.com/openai/codex/pull/18384) Update image resizing to fit 2048 square bounds [@pakrym-oai](https://github.com/pakrym-oai)
* [#17277](https://github.com/openai/codex/pull/17277) feat: Add remote plugin fields to plugin API [@xl-openai](https://github.com/xl-openai)
* [#18395](https://github.com/openai/codex/pull/18395) /plugins: Add inline enablement toggles [@canvrno-oai](https://github.com/canvrno-oai)
* [#14718](https://github.com/openai/codex/pull/14718) fix: trust-gate project hooks and exec policies [@viyatb-oai](https://github.com/viyatb-oai)
* [#17891](https://github.com/openai/codex/pull/17891) [TUI] add external config migration prompt when start TUI [@alexsong-oai](https://github.com/alexsong-oai)
* [#18369](https://github.com/openai/codex/pull/18369) Feat/auto review dev message marker [@won-openai](https://github.com/won-openai)
* [#18298](https://github.com/openai/codex/pull/18298) feat: Budget skill metadata and surface trimming as a warning [@xl-openai](https://github.com/xl-openai)
* [#18449](https://github.com/openai/codex/pull/18449) [codex] Describe uninstalled cross-repo plugin reads [@xli-oai](https://github.com/xli-oai)
* [#18220](https://github.com/openai/codex/pull/18220) [codex] Add owner nudge app-server API [@richardopenai](https://github.com/richardopenai)
* [#17752](https://github.com/openai/codex/pull/17752) [codex] Add marketplace remove command and shared logic [@xli-oai](https://github.com/xli-oai)
* [#18382](https://github.com/openai/codex/pull/18382) Add max context window model metadata [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#18325](https://github.com/openai/codex/pull/18325) Revert "[codex] drain mailbox only at request boundaries" [@jif-oai](https://github.com/jif-oai)
* [#18386](https://github.com/openai/codex/pull/18386) Update image outputs to default to high detail [@pakrym-oai](https://github.com/pakrym-oai)
* [#18499](https://github.com/openai/codex/pull/18499) Fix plugin cache panic when cwd is unavailable [@etraut-openai](https://github.com/etraut-openai)
* [#18212](https://github.com/openai/codex/pull/18212) [5/6] Wire executor-backed MCP stdio [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#18573](https://github.com/openai/codex/pull/18573) feat(tui): show context used in plan implementation prompt [@fcoury-oai](https://github.com/fcoury-oai)
* [#18500](https://github.com/openai/codex/pull/18500) Support `codex app` on macOS (Intel) and Windows [@etraut-openai](https://github.com/etraut-openai)
* [#18542](https://github.com/openai/codex/pull/18542) Queue slash and shell prompts in the TUI [@etraut-openai](https://github.com/etraut-openai)
* [#18524](https://github.com/openai/codex/pull/18524) Add fallback source for external official marketplace [@alexsong-oai](https://github.com/alexsong-oai)
* [#18571](https://github.com/openai/codex/pull/18571) Log realtime session id [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#18585](https://github.com/openai/codex/pull/18585) Remove unused models.json [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#18190](https://github.com/openai/codex/pull/18190) Add `/side` conversations [@etraut-openai](https://github.com/etraut-openai)
* [#18580](https://github.com/openai/codex/pull/18580) Avoid redundant memory enable notice [@etraut-openai](https://github.com/etraut-openai)
* [#18443](https://github.com/openai/codex/pull/18443) Do not grant Windows sandbox ACLs on USERPROFILE [@efrazer-oai](https://github.com/efrazer-oai)
* [#18493](https://github.com/openai/codex/pull/18493) Filter Windows sandbox roots from SSH config dependencies [@efrazer-oai](https://github.com/efrazer-oai)
* [#17978](https://github.com/openai/codex/pull/17978) Persist and prewarm agent tasks per thread [@adrian-openai](https://github.com/adrian-openai)
* [#18604](https://github.com/openai/codex/pull/18604) Add tldr docs for responses-api-proxy [@andmis](https://github.com/andmis)
* [#18601](https://github.com/openai/codex/pull/18601) Soften Fast mode plan usage copy [@pash-openai](https://github.com/pash-openai)
* [#18596](https://github.com/openai/codex/pull/18596) chore(multiagent) skills instructions toggle [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#18599](https://github.com/openai/codex/pull/18599) fix(guardian) disable skills message in guardian thread [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#18612](https://github.com/openai/codex/pull/18612) Create dev-small build profile [@andmis](https://github.com/andmis)
* [#18440](https://github.com/openai/codex/pull/18440) Use thread IDs in TUI resume hints [@etraut-openai](https://github.com/etraut-openai)
* [#18605](https://github.com/openai/codex/pull/18605) TUI: remove simple legacy\_core re-exports [@etraut-openai](https://github.com/etraut-openai)
* [#18625](https://github.com/openai/codex/pull/18625) Add `codex debug models` to show model catalog [@andmis](https://github.com/andmis)
* [#18221](https://github.com/openai/codex/pull/18221) [codex] Add workspace owner usage nudge UI [@richardopenai](https://github.com/richardopenai)
* [#17980](https://github.com/openai/codex/pull/17980) [codex] Use AgentAssertion downstream behind use\_agent\_identity [@adrian-openai](https://github.com/adrian-openai)
* [#17751](https://github.com/openai/codex/pull/17751) [codex] Add marketplace/remove app-server RPC [@xli-oai](https://github.com/xli-oai)
* [#18644](https://github.com/openai/codex/pull/18644) feat: add mem 2 agent header [@jif-oai](https://github.com/jif-oai)
* [#18353](https://github.com/openai/codex/pull/18353) chore: morpheus to path [@jif-oai](https://github.com/jif-oai)
* [#18649](https://github.com/openai/codex/pull/18649) fix: main 2 [@jif-oai](https://github.com/jif-oai)
* [#17721](https://github.com/openai/codex/pull/17721) Stabilize marketplace/remove installedRoot test [@xli-oai](https://github.com/xli-oai)
* [#18492](https://github.com/openai/codex/pull/18492) fix: FS watcher when file does not exist yet [@jif-oai](https://github.com/jif-oai)
* [#18646](https://github.com/openai/codex/pull/18646) feat: add `--ignore-user-config` and `--ignore-rules` [@jif-oai](https://github.com/jif-oai)
* [#18652](https://github.com/openai/codex/pull/18652) nit: telepathy to chronicle in tests [@jif-oai](https://github.com/jif-oai)
* [#18654](https://github.com/openai/codex/pull/18654) fix: exec policy loading for sub-agents [@jif-oai](https://github.com/jif-oai)
* [#18651](https://github.com/openai/codex/pull/18651) feat: chronicle alias [@jif-oai](https://github.com/jif-oai)
[
Full release on Github
](https://github.com/openai/codex/releases/tag/rust-v0.122.0)
*
2026-04-16
### Codex can now help with more of your work 26.415
Codex is becoming a broader workspace for getting work done with AI. This
update makes it easier to start work with less setup, verify what Codex is
building, create richer outputs, and keep momentum across longer-running tasks.
#### Verify more of your work
The Codex app now includes an early [**in-app browser**](/codex/app/browser). You
can open local or public pages that don’t require sign-in, comment directly on
the rendered page, and ask Codex to address page-level feedback.
[**Computer use**](/codex/app/computer-use) lets Codex operate macOS apps by seeing,
clicking, and typing, which helps with native app testing, simulator flows,
low-risk app settings, and GUI-only bugs.
The feature isn’t available in the European Economic Area, the United Kingdom, or
Switzerland at launch.
#### Start, follow, and steer work
[**Chats**](/codex/app/features#projectless-threads) are threads you can start
without choosing a project folder first. They’re useful for research, writing,
planning, analysis, source gathering, and tool-driven work that doesn’t begin in
a codebase.
For work that needs a later check-in,
[**thread automations**](/codex/app/automations#thread-automations) can wake up
the same thread on a schedule while preserving the conversation context. Use
them to check a long-running process, watch for updates, or continue a
follow-up loop without starting from scratch.
[**The task sidebar**](/codex/app/features#task-sidebar) makes plans, sources,
generated artifacts, and summaries easier to follow while Codex works.
[**Context-aware suggestions**](/codex/app/settings#context-aware-suggestions)
can also help you pick up relevant follow-ups when you start or return to Codex.
#### Stronger for software development
Codex now brings more of the **pull request workflow** into the app. You can
inspect [**GitHub pull requests**](/codex/app/review#pull-request-reviews) in the
sidebar, review comments in the diff, review changed files, then ask Codex to
explain feedback, make changes, check them, and keep the review moving.
#### Review richer outputs
The [**artifact viewer**](/codex/app/features#artifact-viewer) can preview
generated files such as PDF files, spreadsheets, documents, and presentations in
the sidebar before you commit or share them. [**Memories**](/codex/memories),
where available, can also carry useful context from past tasks into future
threads, including stable preferences, project conventions, and recurring work
patterns.
#### Other features
* [Remote connections](/codex/remote-connections) - We are gradually rolling out SSH remote connections in alpha
* Support for [multiple terminals](/codex/app/features#integrated-terminal)
* macOS menu bar and [Windows system tray](/codex/app/windows) support
* [Multi-window support](/codex/app/features#floating-pop-out-window)
* [Intel Mac support](/codex/app)
* [New plugins](/codex/plugins)
* Improved thread and tool rendering
*
2026-04-15
### Codex CLI 0.121.0
```
`$ npm install -g @openai/codex@0.121.0`
```
View details
## New Features
* Added `codex marketplace add` and app-server support for installing plugin marketplaces from GitHub, git URLs, local directories, and direct `marketplace.json` URLs ([#17087](https://github.com/openai/codex/pull/17087), [#17717](https://github.com/openai/codex/pull/17717), [#17756](https://github.com/openai/codex/pull/17756)).
* Added TUI prompt history improvements, including `Ctrl+R` reverse search and local recall for accepted slash commands ([#17550](https://github.com/openai/codex/pull/17550), [#17336](https://github.com/openai/codex/pull/17336)).
* Added TUI and app-server controls for memory mode, memory reset/deletion, and memory-extension cleanup ([#17632](https://github.com/openai/codex/pull/17632), [#17626](https://github.com/openai/codex/pull/17626), [#17913](https://github.com/openai/codex/pull/17913), [#17937](https://github.com/openai/codex/pull/17937), [#17844](https://github.com/openai/codex/pull/17844)).
* Expanded MCP/plugin support with MCP Apps tool calls, namespaced MCP registration, parallel-call opt-in, and sandbox-state metadata for MCP servers ([#17364](https://github.com/openai/codex/pull/17364), [#17404](https://github.com/openai/codex/pull/17404), [#17667](https://github.com/openai/codex/pull/17667), [#17763](https://github.com/openai/codex/pull/17763)).
* Added realtime and app-server APIs for output modality, transcript completion events, raw turn item injection, and symlink-aware filesystem metadata ([#17701](https://github.com/openai/codex/pull/17701), [#17703](https://github.com/openai/codex/pull/17703), [#17719](https://github.com/openai/codex/pull/17719)).
* Added a secure devcontainer profile with bubblewrap support, plus macOS sandbox allowlists for Unix sockets ([#10431](https://github.com/openai/codex/pull/10431), [#17547](https://github.com/openai/codex/pull/17547), [#17654](https://github.com/openai/codex/pull/17654)).
## Bug Fixes
* Fixed macOS sandbox/proxy handling for private DNS and removed the `danger-full-access` denylist-only network mode ([#17370](https://github.com/openai/codex/pull/17370), [#17732](https://github.com/openai/codex/pull/17732)).
* Fixed Windows cwd/session matching so `resume --last` and `thread/list` work when paths use verbatim prefixes ([#17414](https://github.com/openai/codex/pull/17414)).
* Fixed rate-limit/account handling for `prolite` plans and made unknown WHAM plan values decodable ([#17419](https://github.com/openai/codex/pull/17419)).
* Made Guardian timeouts distinct from policy denials, with timeout-specific guidance and visible TUI history entries ([#17381](https://github.com/openai/codex/pull/17381), [#17486](https://github.com/openai/codex/pull/17486), [#17521](https://github.com/openai/codex/pull/17521), [#17557](https://github.com/openai/codex/pull/17557)).
* Stabilized app-server behavior by avoiding premature thread unloads, tolerating failed trust persistence on startup, and skipping broken symlinks in `fs/readDirectory` ([#17398](https://github.com/openai/codex/pull/17398), [#17595](https://github.com/openai/codex/pull/17595), [#17907](https://github.com/openai/codex/pull/17907)).
* Fixed MCP/tool-call edge cases including flattened deferred tool names, elicitation timeout accounting, and empty namespace descriptions ([#17556](https://github.com/openai/codex/pull/17556), [#17566](https://github.com/openai/codex/pull/17566), [#17946](https://github.com/openai/codex/pull/17946)).
## Documentation
* Documented the secure devcontainer profile and its bubblewrap requirements ([#10431](https://github.com/openai/codex/pull/10431), [#17547](https://github.com/openai/codex/pull/17547)).
* Added TUI composer documentation for history search behavior ([#17550](https://github.com/openai/codex/pull/17550)).
* Updated app-server docs for new MCP, marketplace, turn injection, memory reset, filesystem metadata, external-agent migration, and websocket token-hash APIs ([#17364](https://github.com/openai/codex/pull/17364), [#17717](https://github.com/openai/codex/pull/17717), [#17703](https://github.com/openai/codex/pull/17703), [#17913](https://github.com/openai/codex/pull/17913), [#17719](https://github.com/openai/codex/pull/17719), [#17855](https://github.com/openai/codex/pull/17855), [#17871](https://github.com/openai/codex/pull/17871)).
* Documented WSL1 bubblewrap limitations and WSL2 behavior ([#17559](https://github.com/openai/codex/pull/17559)).
* Added memory pipeline documentation for extension cleanup ([#17844](https://github.com/openai/codex/pull/17844)).
## Chores
* Hardened supply-chain and CI inputs by pinning GitHub Actions, cargo installs, git dependencies, V8 checksums, and cargo-deny source allowlists ([#17471](https://github.com/openai/codex/pull/17471)).
* Added Bazel release-build verification so release-only Rust code is compiled in PR CI ([#17704](https://github.com/openai/codex/pull/17704), [#17705](https://github.com/openai/codex/pull/17705)).
* Introduced the `codex-thread-store` crate/interface and moved local thread listing behind it ([#17659](https://github.com/openai/codex/pull/17659), [#17824](https://github.com/openai/codex/pull/17824)).
* Required reviewed pnpm dependency build scripts for workspace installs ([#17558](https://github.com/openai/codex/pull/17558)).
* Reduced Rust maintenance surface with broader absolute-path types and removal of unused helper APIs ([#17407](https://github.com/openai/codex/pull/17407), [#17792](https://github.com/openai/codex/pull/17792), [#17146](https://github.com/openai/codex/pull/17146)).
## Changelog
Full Changelog: [rust-v0.120.0...rust-v0.121.0](https://github.com/openai/codex/compare/rust-v0.120.0...rust-v0.121.0)
* [#17087](https://github.com/openai/codex/pull/17087) Add marketplace command [@xli-oai](https://github.com/xli-oai)
* [#17409](https://github.com/openai/codex/pull/17409) Fix Windows exec-server output test flake [@etraut-openai](https://github.com/etraut-openai)
* [#17381](https://github.com/openai/codex/pull/17381) representing guardian review timeouts in protocol types [@won-openai](https://github.com/won-openai)
* [#17399](https://github.com/openai/codex/pull/17399) TUI: enforce core boundary [@etraut-openai](https://github.com/etraut-openai)
* [#17370](https://github.com/openai/codex/pull/17370) fix: unblock private DNS in macOS sandbox [@viyatb-oai](https://github.com/viyatb-oai)
* [#17396](https://github.com/openai/codex/pull/17396) update cloud requirements parse failure msg [@alexsong-oai](https://github.com/alexsong-oai)
* [#17364](https://github.com/openai/codex/pull/17364) [mcp] Support MCP Apps part 3 - Add mcp tool call support. [@mzeng-openai](https://github.com/mzeng-openai)
* [#17424](https://github.com/openai/codex/pull/17424) Stabilize marketplace add local source test [@ningyi-oai](https://github.com/ningyi-oai)
* [#17414](https://github.com/openai/codex/pull/17414) Fix thread/list cwd filtering for Windows verbatim paths [@etraut-openai](https://github.com/etraut-openai)
* [#10431](https://github.com/openai/codex/pull/10431) feat(devcontainer): add separate secure customer profile [@viyatb-oai](https://github.com/viyatb-oai)
* [#17314](https://github.com/openai/codex/pull/17314) Pass turn id with feedback uploads [@ningyi-oai](https://github.com/ningyi-oai)
* [#17336](https://github.com/openai/codex/pull/17336) fix(tui): recall accepted slash commands locally [@fcoury-oai](https://github.com/fcoury-oai)
* [#17430](https://github.com/openai/codex/pull/17430) Handle closed TUI input stream as shutdown [@etraut-openai](https://github.com/etraut-openai)
* [#17385](https://github.com/openai/codex/pull/17385) Add use\_agent\_identity feature flag [@adrian-openai](https://github.com/adrian-openai)
* [#17483](https://github.com/openai/codex/pull/17483) Update issue labeler agent labels [@etraut-openai](https://github.com/etraut-openai)
* [#17493](https://github.com/openai/codex/pull/17493) fix [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17419](https://github.com/openai/codex/pull/17419) Support prolite plan type [@etraut-openai](https://github.com/etraut-openai)
* [#17416](https://github.com/openai/codex/pull/17416) Clear /ps after /stop [@etraut-openai](https://github.com/etraut-openai)
* [#17415](https://github.com/openai/codex/pull/17415) Restore codex-tui resume hint on exit [@etraut-openai](https://github.com/etraut-openai)
* [#17402](https://github.com/openai/codex/pull/17402) chore: refactor name and namespace to single type [@sayan-oai](https://github.com/sayan-oai)
* [#17486](https://github.com/openai/codex/pull/17486) changing decision semantics after guardian timeout [@won-openai](https://github.com/won-openai)
* [#17521](https://github.com/openai/codex/pull/17521) Clarify guardian timeout guidance [@won-openai](https://github.com/won-openai)
* [#17547](https://github.com/openai/codex/pull/17547) [codex] Support bubblewrap in secure Docker devcontainer [@viyatb-oai](https://github.com/viyatb-oai)
* [#17519](https://github.com/openai/codex/pull/17519) Budget realtime current thread context [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17556](https://github.com/openai/codex/pull/17556) [codex] Support flattened deferred MCP tool calls [@fc-oai](https://github.com/fc-oai)
* [#17558](https://github.com/openai/codex/pull/17558) build(pnpm): require reviewed dependency build scripts [@mcgrew-oai](https://github.com/mcgrew-oai)
* [#17559](https://github.com/openai/codex/pull/17559) fix(sandboxing): reject WSL1 bubblewrap sandboxing [@viyatb-oai](https://github.com/viyatb-oai)
* [#17520](https://github.com/openai/codex/pull/17520) Mirror user text into realtime [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17550](https://github.com/openai/codex/pull/17550) feat(tui): add reverse history search to composer [@fcoury-oai](https://github.com/fcoury-oai)
* [#17420](https://github.com/openai/codex/pull/17420) Remove context status-line meter [@etraut-openai](https://github.com/etraut-openai)
* [#17506](https://github.com/openai/codex/pull/17506) Expose instruction sources (AGENTS.md) via app server [@etraut-openai](https://github.com/etraut-openai)
* [#17566](https://github.com/openai/codex/pull/17566) fix(mcp) pause timer for elicitations [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#17406](https://github.com/openai/codex/pull/17406) Add MCP tool wall time to model output [@pakrym-oai](https://github.com/pakrym-oai)
* [#17294](https://github.com/openai/codex/pull/17294) Run exec-server fs operations through sandbox helper [@starr-openai](https://github.com/starr-openai)
* [#17605](https://github.com/openai/codex/pull/17605) Stabilize exec-server process tests [@etraut-openai](https://github.com/etraut-openai)
* [#17221](https://github.com/openai/codex/pull/17221) feat: ignore keyring on 0.0.0 [@jif-oai](https://github.com/jif-oai)
* [#17216](https://github.com/openai/codex/pull/17216) Build remote exec env from exec-server policy [@jif-oai](https://github.com/jif-oai)
* [#17633](https://github.com/openai/codex/pull/17633) nit: change consolidation model [@jif-oai](https://github.com/jif-oai)
* [#17640](https://github.com/openai/codex/pull/17640) fix: stability exec server [@jif-oai](https://github.com/jif-oai)
* [#17643](https://github.com/openai/codex/pull/17643) fix: dedup compact [@jif-oai](https://github.com/jif-oai)
* [#17247](https://github.com/openai/codex/pull/17247) Make forked agent spawns keep parent model config [@friel-openai](https://github.com/friel-openai)
* [#17470](https://github.com/openai/codex/pull/17470) Fix custom tool output cleanup on stream failure [@etraut-openai](https://github.com/etraut-openai)
* [#17417](https://github.com/openai/codex/pull/17417) Emit plan-mode prompt notifications for questionnaires [@etraut-openai](https://github.com/etraut-openai)
* [#17481](https://github.com/openai/codex/pull/17481) Wrap status reset timestamps in narrow layouts [@etraut-openai](https://github.com/etraut-openai)
* [#17601](https://github.com/openai/codex/pull/17601) Suppress duplicate compaction and terminal wait events [@etraut-openai](https://github.com/etraut-openai)
* [#17657](https://github.com/openai/codex/pull/17657) Fix TUI compaction item replay [@etraut-openai](https://github.com/etraut-openai)
* [#17595](https://github.com/openai/codex/pull/17595) Do not fail thread start when trust persistence fails [@etraut-openai](https://github.com/etraut-openai)
* [#17407](https://github.com/openai/codex/pull/17407) Use AbsolutePathBuf in skill loading and codex\_home [@pakrym-oai](https://github.com/pakrym-oai)
* [#17626](https://github.com/openai/codex/pull/17626) feat: disable memory endpoint [@jif-oai](https://github.com/jif-oai)
* [#17365](https://github.com/openai/codex/pull/17365) Include legacy deny paths in elevated Windows sandbox setup [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#17638](https://github.com/openai/codex/pull/17638) feat: Avoid reloading curated marketplaces for tool-suggest discovera… [@jif-oai](https://github.com/jif-oai)
* [#17398](https://github.com/openai/codex/pull/17398) app-server: Only unload threads which were unused for some time [@euroelessar](https://github.com/euroelessar)
* [#17669](https://github.com/openai/codex/pull/17669) only specify remote ports when the rule needs them [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#17691](https://github.com/openai/codex/pull/17691) Fix tui compilation [@davidhao3300](https://github.com/davidhao3300)
* [#17384](https://github.com/openai/codex/pull/17384) Update phase 2 memory model to gpt-5.4 [@kliu128](https://github.com/kliu128)
* [#17395](https://github.com/openai/codex/pull/17395) Remove unnecessary tests [@kliu128](https://github.com/kliu128)
* [#17685](https://github.com/openai/codex/pull/17685) Cap realtime mirrored user turns [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17699](https://github.com/openai/codex/pull/17699) change realtime tool description [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17667](https://github.com/openai/codex/pull/17667) Add `supports\_parallel\_tool\_calls` flag to included mcps [@josiah-openai](https://github.com/josiah-openai)
* [#17703](https://github.com/openai/codex/pull/17703) Add turn item injection API [@pakrym-oai](https://github.com/pakrym-oai)
* [#17671](https://github.com/openai/codex/pull/17671) Stabilize exec-server filesystem tests in CI [@starr-openai](https://github.com/starr-openai)
* [#17557](https://github.com/openai/codex/pull/17557) guardian timeout fix pr 3 - ux touch for timeouts [@won-openai](https://github.com/won-openai)
* [#17719](https://github.com/openai/codex/pull/17719) [codex] Add symlink flag to fs metadata [@pakrym-oai](https://github.com/pakrym-oai)
* [#17146](https://github.com/openai/codex/pull/17146) [codex] Remove unused Rust helpers [@pakrym-oai](https://github.com/pakrym-oai)
* [#17471](https://github.com/openai/codex/pull/17471) fix: pin inputs [@viyatb-oai](https://github.com/viyatb-oai)
* [#17717](https://github.com/openai/codex/pull/17717) [codex] Refactor marketplace add into shared core flow [@xli-oai](https://github.com/xli-oai)
* [#17747](https://github.com/openai/codex/pull/17747) Refactor plugin loading to async [@pakrym-oai](https://github.com/pakrym-oai)
* [#17709](https://github.com/openai/codex/pull/17709) [codex] Initialize ICU data for code mode V8 [@pakrym-oai](https://github.com/pakrym-oai)
* [#17749](https://github.com/openai/codex/pull/17749) [codex] drain mailbox only at request boundaries [@tibo-openai](https://github.com/tibo-openai)
* [#16640](https://github.com/openai/codex/pull/16640) [codex-analytics] feature plumbing and emittance [@rhan-oai](https://github.com/rhan-oai)
* [#17761](https://github.com/openai/codex/pull/17761) Tighten realtime handoff finalization [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17701](https://github.com/openai/codex/pull/17701) Add realtime output modality and transcript events [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17777](https://github.com/openai/codex/pull/17777) nit: feature flag [@jif-oai](https://github.com/jif-oai)
* [#17637](https://github.com/openai/codex/pull/17637) feat: add context percent to status line [@jif-oai](https://github.com/jif-oai)
* [#17665](https://github.com/openai/codex/pull/17665) Always enable original image detail on supported models [@fjord-oai](https://github.com/fjord-oai)
* [#17374](https://github.com/openai/codex/pull/17374) [codex-analytics] add session source to client metadata [@marksteinbrick-oai](https://github.com/marksteinbrick-oai)
* [#17489](https://github.com/openai/codex/pull/17489) Moving updated-at timestamps to unique millisecond times [@ddr-oai](https://github.com/ddr-oai)
* [#17784](https://github.com/openai/codex/pull/17784) feat: codex sampler [@jif-oai](https://github.com/jif-oai)
* [#17732](https://github.com/openai/codex/pull/17732) fix: Revert danger-full-access denylist-only mode [@viyatb-oai](https://github.com/viyatb-oai)
* [#17234](https://github.com/openai/codex/pull/17234) Redirect debug client output to a file [@rasmusrygaard](https://github.com/rasmusrygaard)
* [#17803](https://github.com/openai/codex/pull/17803) Keep image\_detail\_original as a removed feature flag [@fjord-oai](https://github.com/fjord-oai)
* [#17372](https://github.com/openai/codex/pull/17372) app-server: prepare to run initialized rpcs concurrently [@euroelessar](https://github.com/euroelessar)
* [#17704](https://github.com/openai/codex/pull/17704) Refactor Bazel CI job setup [@bolinfest](https://github.com/bolinfest)
* [#17674](https://github.com/openai/codex/pull/17674) Route apply\_patch through the environment filesystem [@starr-openai](https://github.com/starr-openai)
* [#17702](https://github.com/openai/codex/pull/17702) Fix remote skill popup loading [@starr-openai](https://github.com/starr-openai)
* [#17830](https://github.com/openai/codex/pull/17830) [codex] Fix app-server initialized request analytics build [@etraut-openai](https://github.com/etraut-openai)
* [#17389](https://github.com/openai/codex/pull/17389) [codex-analytics] enable general analytics by default [@rhan-oai](https://github.com/rhan-oai)
* [#17659](https://github.com/openai/codex/pull/17659) thread store interface [@wiltzius-openai](https://github.com/wiltzius-openai)
* [#17792](https://github.com/openai/codex/pull/17792) Spread AbsolutePathBuf [@pakrym-oai](https://github.com/pakrym-oai)
* [#17808](https://github.com/openai/codex/pull/17808) fix: apply patch bin refresh [@jif-oai](https://github.com/jif-oai)
* [#17838](https://github.com/openai/codex/pull/17838) Add realtime wire trace logs [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17684](https://github.com/openai/codex/pull/17684) Adjust default tool search result caps [@malone-oai](https://github.com/malone-oai)
* [#17705](https://github.com/openai/codex/pull/17705) Add Bazel verify-release-build job [@bolinfest](https://github.com/bolinfest)
* [#17720](https://github.com/openai/codex/pull/17720) Make skill loading filesystem-aware [@pakrym-oai](https://github.com/pakrym-oai)
* [#17756](https://github.com/openai/codex/pull/17756) [codex] Support local marketplace sources [@xli-oai](https://github.com/xli-oai)
* [#17846](https://github.com/openai/codex/pull/17846) Fix for Guardian CI Tests stack overflow, applying Box to reduce stack pressure [@won-openai](https://github.com/won-openai)
* [#17855](https://github.com/openai/codex/pull/17855) support plugins in external agent config migration [@alexsong-oai](https://github.com/alexsong-oai)
* [#17872](https://github.com/openai/codex/pull/17872) Disable hooks in guardian review sessions [@abhinav-oai](https://github.com/abhinav-oai)
* [#17868](https://github.com/openai/codex/pull/17868) Wrap delegated input text [@guinness-oai](https://github.com/guinness-oai)
* [#17884](https://github.com/openai/codex/pull/17884) Fix clippy warnings in external agent config migration [@canvrno-oai](https://github.com/canvrno-oai)
* [#17837](https://github.com/openai/codex/pull/17837) Reuse remote exec-server in core tests [@starr-openai](https://github.com/starr-openai)
* [#17859](https://github.com/openai/codex/pull/17859) sandbox: remove dead seatbelt helper and update tests [@bolinfest](https://github.com/bolinfest)
* [#17870](https://github.com/openai/codex/pull/17870) fix: cleanup the contract of the general-purpose exec() function [@bolinfest](https://github.com/bolinfest)
* [#17871](https://github.com/openai/codex/pull/17871) fix: add websocket capability token hash support [@viyatb-oai](https://github.com/viyatb-oai)
* [#17763](https://github.com/openai/codex/pull/17763) Send sandbox state through MCP tool metadata [@aaronl-openai](https://github.com/aaronl-openai)
* [#17654](https://github.com/openai/codex/pull/17654) Support Unix socket allowlists in macOS sandbox [@aaronl-openai](https://github.com/aaronl-openai)
* [#17915](https://github.com/openai/codex/pull/17915) fix: cargo deny [@jif-oai](https://github.com/jif-oai)
* [#17913](https://github.com/openai/codex/pull/17913) feat: add endpoint to delete memories [@jif-oai](https://github.com/jif-oai)
* [#17844](https://github.com/openai/codex/pull/17844) feat: cleaning of memories extension [@jif-oai](https://github.com/jif-oai)
* [#17921](https://github.com/openai/codex/pull/17921) chore: exp flag [@jif-oai](https://github.com/jif-oai)
* [#17917](https://github.com/openai/codex/pull/17917) [codex] Fix current main CI blockers [@sayan-oai](https://github.com/sayan-oai)
* [#17919](https://github.com/openai/codex/pull/17919) chore: do not disable memories for past rollouts on reset [@jif-oai](https://github.com/jif-oai)
* [#17924](https://github.com/openai/codex/pull/17924) nit: stable test [@jif-oai](https://github.com/jif-oai)
* [#17632](https://github.com/openai/codex/pull/17632) feat: memories menu [@jif-oai](https://github.com/jif-oai)
* [#17404](https://github.com/openai/codex/pull/17404) register all mcp tools with namespace [@sayan-oai](https://github.com/sayan-oai)
* [#17941](https://github.com/openai/codex/pull/17941) nit: doc [@jif-oai](https://github.com/jif-oai)
* [#17938](https://github.com/openai/codex/pull/17938) feat: sanitize rollouts before phase 1 [@jif-oai](https://github.com/jif-oai)
* [#17937](https://github.com/openai/codex/pull/17937) feat: reset memories button [@jif-oai](https://github.com/jif-oai)
* [#17883](https://github.com/openai/codex/pull/17883) Remove exec-server fs sandbox request preflight [@pakrym-oai](https://github.com/pakrym-oai)
* [#17386](https://github.com/openai/codex/pull/17386) Register agent identities behind use\_agent\_identity [@adrian-openai](https://github.com/adrian-openai)
* [#17907](https://github.com/openai/codex/pull/17907) Fix fs/readDirectory to skip broken symlinks [@willwang-openai](https://github.com/willwang-openai)
* [#17960](https://github.com/openai/codex/pull/17960) chore(features) codex dependencies feat [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#17965](https://github.com/openai/codex/pull/17965) fix: rename is\_azure\_responses\_wire\_base\_url to is\_azure\_responses\_provider [@bolinfest](https://github.com/bolinfest)
* [#17946](https://github.com/openai/codex/pull/17946) Fix empty tool descriptions [@shijie-oai](https://github.com/shijie-oai)
* [#17824](https://github.com/openai/codex/pull/17824) [codex] Add local thread store listing [@wiltzius-openai](https://github.com/wiltzius-openai)
* [#17942](https://github.com/openai/codex/pull/17942) Add CLI update announcement [@shijie-oai](https://github.com/shijie-oai)
* [#17866](https://github.com/openai/codex/pull/17866) Refactor auth providers to mutate request headers [@pakrym-oai](https://github.com/pakrym-oai)
* [#17902](https://github.com/openai/codex/pull/17902) app-server: track remote-control seq IDs per stream [@euroelessar](https://github.com/euroelessar)
* [#17957](https://github.com/openai/codex/pull/17957) mcp: remove codex/sandbox-state custom request support [@bolinfest](https://github.com/bolinfest)
* [#17953](https://github.com/openai/codex/pull/17953) fix: propagate log db [@jif-oai](https://github.com/jif-oai)
* [#17920](https://github.com/openai/codex/pull/17920) chore(tui) cleanup [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#17981](https://github.com/openai/codex/pull/17981) chore: tmp disable [@jif-oai](https://github.com/jif-oai)
[
Full release on Github
](https://github.com/openai/codex/releases/tag/rust-v0.121.0)
*
2026-04-11
### Codex CLI 0.120.0
```
`$ npm install -g @openai/codex@0.120.0`
```
View details
## New Features
* Realtime V2 can now stream background agent progress while work is still running and queue follow-up responses until the active response completes ([#17264](https://github.com/openai/codex/pull/17264), [#17306](https://github.com/openai/codex/pull/17306))
* Hook activity in the TUI is easier to scan, with live running hooks shown separately and completed hook output kept only when useful ([#17266](https://github.com/openai/codex/pull/17266))
* Custom TUI status lines can include the renamed thread title ([#17187](https://github.com/openai/codex/pull/17187))
* Code-mode tool declarations now include MCP `outputSchema` details so structured tool results are typed more precisely ([#17210](https://github.com/openai/codex/pull/17210))
* SessionStart hooks can distinguish sessions created by `/clear` from fresh startup or resume sessions ([#17073](https://github.com/openai/codex/pull/17073))
## Bug Fixes
* Fixed Windows elevated sandbox handling for split filesystem policies, including read-only carveouts under writable roots ([#14568](https://github.com/openai/codex/pull/14568))
* Fixed sandbox permission handling for symlinked writable roots and carveouts, preventing failures in shell and `apply\_patch` workflows ([#15981](https://github.com/openai/codex/pull/15981))
* Fixed `codex --remote wss://...` panics by installing the Rustls crypto provider before TLS websocket connections ([#17288](https://github.com/openai/codex/pull/17288))
* Preserved tool search result ordering instead of alphabetically reordering results ([#17263](https://github.com/openai/codex/pull/17263))
* Fixed live Stop-hook prompts so they appear immediately instead of only after thread history reloads ([#17189](https://github.com/openai/codex/pull/17189))
* Fixed app-server MCP cleanup on disconnect so unsubscribed threads and resources are torn down correctly ([#17223](https://github.com/openai/codex/pull/17223))
## Documentation
* Documented the elevated vs restricted-token Windows sandbox support split in the core README ([#14568](https://github.com/openai/codex/pull/14568))
* Updated app-server protocol documentation for the new `/clear` SessionStart source ([#17073](https://github.com/openai/codex/pull/17073))
## Chores
* Made rollout recording more reliable by retrying failed flushes and surfacing durability failures instead of dropping buffered items ([#17214](https://github.com/openai/codex/pull/17214))
* Added analytics schemas and metadata wiring for compaction and Guardian review events ([#17155](https://github.com/openai/codex/pull/17155), [#17055](https://github.com/openai/codex/pull/17055))
* Improved Guardian follow-up efficiency by sending transcript deltas instead of repeatedly resending full history ([#17269](https://github.com/openai/codex/pull/17269))
* Added stable Guardian review IDs across app-server events and internal approval state ([#17298](https://github.com/openai/codex/pull/17298))
## Changelog
Full Changelog: [rust-v0.119.0...rust-v0.120.0](https://github.com/openai/codex/compare/rust-v0.119.0...rust-v0.120.0)
* [#17268](https://github.com/openai/codex/pull/17268) remove windows gate that disables hooks [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#17267](https://github.com/openai/codex/pull/17267) Stop Realtime V2 response.done delegation [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#14568](https://github.com/openai/codex/pull/14568) fix: support split carveouts in windows elevated sandbox [@viyatb-oai](https://github.com/viyatb-oai)
* [#17263](https://github.com/openai/codex/pull/17263) preserve search results order in tool\_search\_output [@sayan-oai](https://github.com/sayan-oai)
* [#17189](https://github.com/openai/codex/pull/17189) Emit live hook prompts before raw-event filtering [@abhinav-oai](https://github.com/abhinav-oai)
* [#17288](https://github.com/openai/codex/pull/17288) Install rustls provider for remote websocket client [@etraut-openai](https://github.com/etraut-openai)
* [#16969](https://github.com/openai/codex/pull/16969) Option to Notify Workspace Owner When Usage Limit is Reached [@richardopenai](https://github.com/richardopenai)
* [#17278](https://github.com/openai/codex/pull/17278) Rename Realtime V2 tool to background\_agent [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17280](https://github.com/openai/codex/pull/17280) Extract realtime input task handlers [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17249](https://github.com/openai/codex/pull/17249) adding parent\_thread\_id in guardian [@won-openai](https://github.com/won-openai)
* [#17264](https://github.com/openai/codex/pull/17264) Stream Realtime V2 background agent progress [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17210](https://github.com/openai/codex/pull/17210) Add output\_schema to code mode render [@vivi](https://github.com/vivi)
* [#16344](https://github.com/openai/codex/pull/16344) feat: move exec-server ownership [@jif-oai](https://github.com/jif-oai)
* [#17214](https://github.com/openai/codex/pull/17214) feat: make rollout recorder reliable against errors [@jif-oai](https://github.com/jif-oai)
* [#17223](https://github.com/openai/codex/pull/17223) fix: MCP leaks in app-server [@jif-oai](https://github.com/jif-oai)
* [#17338](https://github.com/openai/codex/pull/17338) feat: description multi-agent v2 [@jif-oai](https://github.com/jif-oai)
* [#17269](https://github.com/openai/codex/pull/17269) feat(guardian): send only transcript deltas on guardian followups [@owenlin0](https://github.com/owenlin0)
* [#17306](https://github.com/openai/codex/pull/17306) Queue Realtime V2 response.create while active [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17352](https://github.com/openai/codex/pull/17352) fix: main [@jif-oai](https://github.com/jif-oai)
* [#17363](https://github.com/openai/codex/pull/17363) Strengthen realtime backend delegation prompt [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17155](https://github.com/openai/codex/pull/17155) [codex-analytics] add compaction analytics event [@rhan-oai](https://github.com/rhan-oai)
* [#17187](https://github.com/openai/codex/pull/17187) Add thread title to configurable TUI status line [@canvrno-oai](https://github.com/canvrno-oai)
* [#17194](https://github.com/openai/codex/pull/17194) add parent-id to guardian context [@won-openai](https://github.com/won-openai)
* [#17266](https://github.com/openai/codex/pull/17266) [codex] Improve hook status rendering [@abhinav-oai](https://github.com/abhinav-oai)
* [#17073](https://github.com/openai/codex/pull/17073) Support clear SessionStart source [@abhinav-oai](https://github.com/abhinav-oai)
* [#17298](https://github.com/openai/codex/pull/17298) fix(guardian, app-server): introduce guardian review ids [@owenlin0](https://github.com/owenlin0)
* [#17391](https://github.com/openai/codex/pull/17391) Revert "Option to Notify Workspace Owner When Usage Limit is Reached" [@shijie-oai](https://github.com/shijie-oai)
* [#17371](https://github.com/openai/codex/pull/17371) app-server: add pipelined config rpc regression test [@euroelessar](https://github.com/euroelessar)
* [#15981](https://github.com/openai/codex/pull/15981) fix(permissions): fix symlinked writable roots in sandbox permissions [@viyatb-oai](https://github.com/viyatb-oai)
* [#17055](https://github.com/openai/codex/pull/17055) feat(analytics): add guardian review event schema [@owenlin0](https://github.com/owenlin0)
[
Full release on Github
](https://github.com/openai/codex/releases/tag/rust-v0.120.0)
*
2026-04-10
### Codex CLI 0.119.0
```
`$ npm install -g @openai/codex@0.119.0`
```
View details
## New Features
* Realtime voice sessions now default to the v2 WebRTC path, with configurable transport, voice selection, native TUI media support, and app-server coverage for the new flow ([#16960](https://github.com/openai/codex/pull/16960), [#17057](https://github.com/openai/codex/pull/17057), [#17058](https://github.com/openai/codex/pull/17058), [#17093](https://github.com/openai/codex/pull/17093), [#17097](https://github.com/openai/codex/pull/17097), [#17145](https://github.com/openai/codex/pull/17145), [#17165](https://github.com/openai/codex/pull/17165), [#17176](https://github.com/openai/codex/pull/17176), [#17183](https://github.com/openai/codex/pull/17183), [#17188](https://github.com/openai/codex/pull/17188)).
* MCP Apps and custom MCP servers gained richer support, including resource reads, tool-call metadata, custom-server tool search, server-driven elicitations, file-parameter uploads, and more reliable plugin cache refreshes ([#16082](https://github.com/openai/codex/pull/16082), [#16465](https://github.com/openai/codex/pull/16465), [#16944](https://github.com/openai/codex/pull/16944), [#17043](https://github.com/openai/codex/pull/17043), [#15197](https://github.com/openai/codex/pull/15197), [#16191](https://github.com/openai/codex/pull/16191), [#16947](https://github.com/openai/codex/pull/16947)).
* Remote/app-server workflows now support egress websocket transport, remote `--cd` forwarding, runtime remote-control enablement, sandbox-aware filesystem APIs, and an experimental `codex exec-server` subcommand ([#15951](https://github.com/openai/codex/pull/15951), [#16700](https://github.com/openai/codex/pull/16700), [#16973](https://github.com/openai/codex/pull/16973), [#16751](https://github.com/openai/codex/pull/16751), [#17059](https://github.com/openai/codex/pull/17059), [#17142](https://github.com/openai/codex/pull/17142), [#17162](https://github.com/openai/codex/pull/17162)).
* The TUI can copy the latest agent response with `Ctrl+O`, including better clipboard behavior over SSH and across platforms ([#16966](https://github.com/openai/codex/pull/16966)).
* `/resume` can now jump directly to a session by ID or name from the TUI ([#17222](https://github.com/openai/codex/pull/17222)).
* TUI notifications are more configurable, including Warp OSC 9 support and an opt-in mode for notifications even while the terminal is focused ([#17174](https://github.com/openai/codex/pull/17174), [#17175](https://github.com/openai/codex/pull/17175)).
## Bug Fixes
* The TUI starts faster by fetching rate limits asynchronously, and `/status` now refreshes stale limits instead of showing frozen or misleading quota information ([#16201](https://github.com/openai/codex/pull/16201), [#17039](https://github.com/openai/codex/pull/17039)).
* Resume flows are more stable: the picker no longer flashes false empty states, uses fresher thread names, stabilizes timestamp labels, preserves resume hints on zero-token exits, and avoids crashing when resuming the current thread ([#16591](https://github.com/openai/codex/pull/16591), [#16601](https://github.com/openai/codex/pull/16601), [#16822](https://github.com/openai/codex/pull/16822), [#16987](https://github.com/openai/codex/pull/16987), [#17086](https://github.com/openai/codex/pull/17086)).
* Composer and chat behavior are smoother, including fixed paste teardown, CJK word navigation, stale `/copy` output, percent-decoded local file links, and clearer truncated exec-output hints ([#16202](https://github.com/openai/codex/pull/16202), [#16829](https://github.com/openai/codex/pull/16829), [#16648](https://github.com/openai/codex/pull/16648), [#16810](https://github.com/openai/codex/pull/16810), [#17076](https://github.com/openai/codex/pull/17076)).
* Fast Mode no longer stays stuck on after `/fast off` in app-server-backed TUI sessions ([#16833](https://github.com/openai/codex/pull/16833)).
* MCP status and startup are less noisy and faster: hyphenated server names list tools correctly, `/mcp` avoids slow full inventory probes, disabled servers skip auth probing, and residency headers are honored by `codex mcp-server` ([#16674](https://github.com/openai/codex/pull/16674), [#16831](https://github.com/openai/codex/pull/16831), [#17098](https://github.com/openai/codex/pull/17098), [#16952](https://github.com/openai/codex/pull/16952)).
* Sandbox, network, and platform edge cases were tightened, including clearer read-only `apply\_patch` errors, refreshed network proxy policy after sandbox changes, suppressed irrelevant bubblewrap warnings, a macOS HTTP-client sandbox panic fix, and Windows firewall address handling ([#16885](https://github.com/openai/codex/pull/16885), [#17040](https://github.com/openai/codex/pull/17040), [#16667](https://github.com/openai/codex/pull/16667), [#16670](https://github.com/openai/codex/pull/16670), [#17053](https://github.com/openai/codex/pull/17053)).
## Documentation
* The README now uses the current ChatGPT Business plan name ([#16348](https://github.com/openai/codex/pull/16348)).
* Developer guidance for `argument\_comment\_lint` was updated to favor getting CI started instead of blocking on slow local lint runs ([#16375](https://github.com/openai/codex/pull/16375)).
* Obsolete `codex-cli` README content was removed to avoid stale setup guidance ([#17096](https://github.com/openai/codex/pull/17096)).
* `codex exec --help` now shows clearer usage and approval-mode wording ([#16881](https://github.com/openai/codex/pull/16881), [#16888](https://github.com/openai/codex/pull/16888)).
## Chores
* `codex-core` was slimmed down through major crate extractions for MCP, tools, config, model management, auth, feedback, protocol, and related ownership boundaries ([#15919](https://github.com/openai/codex/pull/15919), [#16379](https://github.com/openai/codex/pull/16379), [#16508](https://github.com/openai/codex/pull/16508), [#16523](https://github.com/openai/codex/pull/16523), [#16962](https://github.com/openai/codex/pull/16962)).
* Rust CI and workspace guardrails were simplified by blocking new crate features and dropping routine `--all-features` runs ([#16455](https://github.com/openai/codex/pull/16455), [#16473](https://github.com/openai/codex/pull/16473)).
* Core compile times were reduced by removing expensive async-trait expansion from hot tool/task abstractions ([#16630](https://github.com/openai/codex/pull/16630), [#16631](https://github.com/openai/codex/pull/16631)).
* Bazel diagnostics and dependency wiring improved with compact execution logs, repository-cache persistence, remote downloader support, and several platform-specific build fixes ([#16577](https://github.com/openai/codex/pull/16577), [#16926](https://github.com/openai/codex/pull/16926), [#16928](https://github.com/openai/codex/pull/16928), [#16634](https://github.com/openai/codex/pull/16634), [#16744](https://github.com/openai/codex/pull/16744)).
## Changelog
Full Changelog: [rust-v0.118.0...rust-v0.119.0](https://github.com/openai/codex/compare/rust-v0.118.0...rust-v0.119.0)
* [#16308](https://github.com/openai/codex/pull/16308) fix: one shot end of turn [@jif-oai](https://github.com/jif-oai)
* [#16238](https://github.com/openai/codex/pull/16238) fix: ma2 [@jif-oai](https://github.com/jif-oai)
* [#16317](https://github.com/openai/codex/pull/16317) chore: clean wait v2 [@jif-oai](https://github.com/jif-oai)
* [#16318](https://github.com/openai/codex/pull/16318) nit: update aborted line [@jif-oai](https://github.com/jif-oai)
* [#15771](https://github.com/openai/codex/pull/15771) feat: fork pattern v2 [@jif-oai](https://github.com/jif-oai)
* [#16322](https://github.com/openai/codex/pull/16322) fix: update fork boundaries computation [@jif-oai](https://github.com/jif-oai)
* [#16325](https://github.com/openai/codex/pull/16325) feat: restrict spawn\_agent v2 to messages [@jif-oai](https://github.com/jif-oai)
* [#16324](https://github.com/openai/codex/pull/16324) chore: drop interrupt from send\_message [@jif-oai](https://github.com/jif-oai)
* [#16345](https://github.com/openai/codex/pull/16345) fix: fix clippy issue caught by cargo but not bazel [@bolinfest](https://github.com/bolinfest)
* [#16184](https://github.com/openai/codex/pull/16184) Route TUI `/feedback` submission through the app server [@etraut-openai](https://github.com/etraut-openai)
* [#16330](https://github.com/openai/codex/pull/16330) feat: log db better maintenance [@jif-oai](https://github.com/jif-oai)
* [#15690](https://github.com/openai/codex/pull/15690) [codex-analytics] thread events [@rhan-oai](https://github.com/rhan-oai)
* [#16363](https://github.com/openai/codex/pull/16363) Fix PR babysitter review comment monitoring [@etraut-openai](https://github.com/etraut-openai)
* [#16356](https://github.com/openai/codex/pull/16356) Refactor external auth to use a single trait [@etraut-openai](https://github.com/etraut-openai)
* [#16366](https://github.com/openai/codex/pull/16366) Fix Windows external bearer refresh test [@bolinfest](https://github.com/bolinfest)
* [#16353](https://github.com/openai/codex/pull/16353) ci: verify codex-rs Cargo manifests inherit workspace settings [@bolinfest](https://github.com/bolinfest)
* [#16361](https://github.com/openai/codex/pull/16361) Refactor chatwidget tests into topical modules [@etraut-openai](https://github.com/etraut-openai)
* [#16201](https://github.com/openai/codex/pull/16201) Fix stale /status rate limits in active TUI sessions [@etraut-openai](https://github.com/etraut-openai)
* [#16351](https://github.com/openai/codex/pull/16351) ci: sync Bazel clippy lints and fix uncovered violations [@bolinfest](https://github.com/bolinfest)
* [#16378](https://github.com/openai/codex/pull/16378) fix: suppress status card expect\_used warnings after [#16351](https://github.com/openai/codex/pull/16351) [@bolinfest](https://github.com/bolinfest)
* [#16406](https://github.com/openai/codex/pull/16406) Use message string in v2 spawn\_agent [@jif-oai](https://github.com/jif-oai)
* [#16409](https://github.com/openai/codex/pull/16409) Use message string in v2 send\_message [@jif-oai](https://github.com/jif-oai)
* [#16419](https://github.com/openai/codex/pull/16419) Use message string in v2 assign\_task [@jif-oai](https://github.com/jif-oai)
* [#16424](https://github.com/openai/codex/pull/16424) feat: tasks can't be assigned to root agent [@jif-oai](https://github.com/jif-oai)
* [#16425](https://github.com/openai/codex/pull/16425) nit: update wait v2 desc [@jif-oai](https://github.com/jif-oai)
* [#16426](https://github.com/openai/codex/pull/16426) chore: interrupted as state [@jif-oai](https://github.com/jif-oai)
* [#16427](https://github.com/openai/codex/pull/16427) nit: deny field v2 [@jif-oai](https://github.com/jif-oai)
* [#16433](https://github.com/openai/codex/pull/16433) chore: drop log DB [@jif-oai](https://github.com/jif-oai)
* [#16434](https://github.com/openai/codex/pull/16434) feat: auto vaccum state DB [@jif-oai](https://github.com/jif-oai)
* [#16422](https://github.com/openai/codex/pull/16422) fix(core) rm execute\_exec\_request sandbox\_policy [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#16375](https://github.com/openai/codex/pull/16375) docs: update argument\_comment\_lint instructions in AGENTS.md [@bolinfest](https://github.com/bolinfest)
* [#16449](https://github.com/openai/codex/pull/16449) fix: remove unused import [@bolinfest](https://github.com/bolinfest)
* [#15772](https://github.com/openai/codex/pull/15772) Make fuzzy file search case insensitive [@meyers-oai](https://github.com/meyers-oai)
* [#16455](https://github.com/openai/codex/pull/16455) ci: block new workspace crate features [@bolinfest](https://github.com/bolinfest)
* [#16456](https://github.com/openai/codex/pull/16456) cloud-tasks: split the mock client out of cloud-tasks-client [@bolinfest](https://github.com/bolinfest)
* [#16457](https://github.com/openai/codex/pull/16457) tui: remove debug/test-only crate features [@bolinfest](https://github.com/bolinfest)
* [#16467](https://github.com/openai/codex/pull/16467) tui: remove the voice-input crate feature [@bolinfest](https://github.com/bolinfest)
* [#16379](https://github.com/openai/codex/pull/16379) Extract tool config into codex-tools [@bolinfest](https://github.com/bolinfest)
* [#16469](https://github.com/openai/codex/pull/16469) otel: remove the last workspace crate feature [@bolinfest](https://github.com/bolinfest)
* [#16471](https://github.com/openai/codex/pull/16471) Extract tool spec helpers into codex-tools [@bolinfest](https://github.com/bolinfest)
* [#16473](https://github.com/openai/codex/pull/16473) ci: stop running rust CI with --all-features [@bolinfest](https://github.com/bolinfest)
* [#16477](https://github.com/openai/codex/pull/16477) Extract tool discovery helpers into codex-tools [@bolinfest](https://github.com/bolinfest)
* [#16480](https://github.com/openai/codex/pull/16480) login: treat provider auth refresh\_interval\_ms=0 as no auto-refresh [@bolinfest](https://github.com/bolinfest)
* [#16448](https://github.com/openai/codex/pull/16448) fix(guardian): make GuardianAssessmentEvent.action strongly typed [@owenlin0](https://github.com/owenlin0)
* [#16481](https://github.com/openai/codex/pull/16481) Extract update\_plan tool spec into codex-tools [@bolinfest](https://github.com/bolinfest)
* [#15919](https://github.com/openai/codex/pull/15919) Extract MCP into codex-mcp crate [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#16482](https://github.com/openai/codex/pull/16482) Remove client\_common tool re-exports [@bolinfest](https://github.com/bolinfest)
* [#16495](https://github.com/openai/codex/pull/16495) fix: remove unused import [@bolinfest](https://github.com/bolinfest)
* [#16493](https://github.com/openai/codex/pull/16493) Extract built-in tool spec constructors into codex-tools [@bolinfest](https://github.com/bolinfest)
* [#16273](https://github.com/openai/codex/pull/16273) Fix regression: "not available in TUI" error message [@etraut-openai](https://github.com/etraut-openai)
* [#16497](https://github.com/openai/codex/pull/16497) Extract tool-search output helpers into codex-tools [@bolinfest](https://github.com/bolinfest)
* [#16498](https://github.com/openai/codex/pull/16498) fix: guard guardian\_command\_source\_tool\_name with cfg(unix) [@bolinfest](https://github.com/bolinfest)
* [#16499](https://github.com/openai/codex/pull/16499) Extract tool-suggest wire helpers into codex-tools [@bolinfest](https://github.com/bolinfest)
* [#16284](https://github.com/openai/codex/pull/16284) Fix TUI app-server permission profile conversions [@etraut-openai](https://github.com/etraut-openai)
* [#16202](https://github.com/openai/codex/pull/16202) Fix paste-driven bottom pane completion teardown [@etraut-openai](https://github.com/etraut-openai)
* [#16504](https://github.com/openai/codex/pull/16504) core: use codex-tools config types directly [@bolinfest](https://github.com/bolinfest)
* [#16503](https://github.com/openai/codex/pull/16503) Extract request\_user\_input normalization into codex-tools [@bolinfest](https://github.com/bolinfest)
* [#16510](https://github.com/openai/codex/pull/16510) core: use codex-mcp APIs directly [@bolinfest](https://github.com/bolinfest)
* [#16509](https://github.com/openai/codex/pull/16509) Extract code-mode nested tool collection into codex-tools [@bolinfest](https://github.com/bolinfest)
* [#16512](https://github.com/openai/codex/pull/16512) core: remove cross-crate re-exports from lib.rs [@bolinfest](https://github.com/bolinfest)
* [#16516](https://github.com/openai/codex/pull/16516) fix: add update to Cargo.lock that was missed in [#16512](https://github.com/openai/codex/pull/16512) [@bolinfest](https://github.com/bolinfest)
* [#16513](https://github.com/openai/codex/pull/16513) Extract tool registry planning into codex-tools [@bolinfest](https://github.com/bolinfest)
* [#16521](https://github.com/openai/codex/pull/16521) Move tool registry plan tests into codex-tools [@bolinfest](https://github.com/bolinfest)
* [#16523](https://github.com/openai/codex/pull/16523) [codex] Move config types into codex-config [@bolinfest](https://github.com/bolinfest)
* [#16524](https://github.com/openai/codex/pull/16524) fix: move some test utilities out of codex-rs/core/src/tools/spec.rs [@bolinfest](https://github.com/bolinfest)
* [#16529](https://github.com/openai/codex/pull/16529) [codex] Remove codex-core config type shim [@bolinfest](https://github.com/bolinfest)
* [#16559](https://github.com/openai/codex/pull/16559) chore: memories mini model [@jif-oai](https://github.com/jif-oai)
* [#16561](https://github.com/openai/codex/pull/16561) fix: race pending [@jif-oai](https://github.com/jif-oai)
* [#16564](https://github.com/openai/codex/pull/16564) nit: lint [@jif-oai](https://github.com/jif-oai)
* [#16566](https://github.com/openai/codex/pull/16566) fix: races in end of turn [@jif-oai](https://github.com/jif-oai)
* [#16567](https://github.com/openai/codex/pull/16567) chore: rework state machine further [@jif-oai](https://github.com/jif-oai)
* [#16569](https://github.com/openai/codex/pull/16569) nit: state machine desc [@jif-oai](https://github.com/jif-oai)
* [#16571](https://github.com/openai/codex/pull/16571) chore: rename assign\_task for followup\_task [@jif-oai](https://github.com/jif-oai)
* [#16577](https://github.com/openai/codex/pull/16577) ci: upload compact Bazel execution logs for bazel.yml [@bolinfest](https://github.com/bolinfest)
* [#16581](https://github.com/openai/codex/pull/16581) chore: move codex-exec unit tests into sibling files [@bolinfest](https://github.com/bolinfest)
* [#16590](https://github.com/openai/codex/pull/16590) Fix non-determinism in rules\_rs/crate\_git\_repository.bzl [@tyler-french](https://github.com/tyler-french)
* [#16604](https://github.com/openai/codex/pull/16604) test: deflake external bearer auth token tests on Windows [@bolinfest](https://github.com/bolinfest)
* [#16606](https://github.com/openai/codex/pull/16606) fix: add more detail to test assertion [@bolinfest](https://github.com/bolinfest)
* [#16608](https://github.com/openai/codex/pull/16608) fix: increase timeout to account for slow PowerShell startup [@bolinfest](https://github.com/bolinfest)
* [#16591](https://github.com/openai/codex/pull/16591) Fix resume picker initial loading state [@etraut-openai](https://github.com/etraut-openai)
* [#16613](https://github.com/openai/codex/pull/16613) fix: increase another startup timeout for PowerShell [@bolinfest](https://github.com/bolinfest)
* [#16601](https://github.com/openai/codex/pull/16601) Fix resume picker stale thread names [@etraut-openai](https://github.com/etraut-openai)
* [#16616](https://github.com/openai/codex/pull/16616) Fixed some existing labels and added a few new ones [@etraut-openai](https://github.com/etraut-openai)
* [#16588](https://github.com/openai/codex/pull/16588) Fix stale turn steering during TUI review follow-ups [@etraut-openai](https://github.com/etraut-openai)
* [#16617](https://github.com/openai/codex/pull/16617) fix: add shell fallback paths for pwsh/powershell that work on GitHub Actions Windows runners [@bolinfest](https://github.com/bolinfest)
* [#16596](https://github.com/openai/codex/pull/16596) Fix fork source display in /status (expose forked\_from\_id in app server) [@etraut-openai](https://github.com/etraut-openai)
* [#16578](https://github.com/openai/codex/pull/16578) fix(tui): handle zellij redraw and composer rendering [@fcoury-oai](https://github.com/fcoury-oai)
* [#16630](https://github.com/openai/codex/pull/16630) core: cut codex-core compile time 63% with native async ToolHandler [@bolinfest](https://github.com/bolinfest)
* [#16631](https://github.com/openai/codex/pull/16631) core: cut codex-core compile time 48% with native async SessionTask [@bolinfest](https://github.com/bolinfest)
* [#16492](https://github.com/openai/codex/pull/16492) Auto-trust cwd on thread start [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#16633](https://github.com/openai/codex/pull/16633) fix: address unused variable on windows [@bolinfest](https://github.com/bolinfest)
* [#16635](https://github.com/openai/codex/pull/16635) app-server: make thread/shellCommand tests shell-aware [@bolinfest](https://github.com/bolinfest)
* [#16629](https://github.com/openai/codex/pull/16629) test: use cmd.exe for ProviderAuthScript on Windows [@bolinfest](https://github.com/bolinfest)
* [#16634](https://github.com/openai/codex/pull/16634) build: fix Bazel lzma-sys wiring [@starr-openai](https://github.com/starr-openai)
* [#16658](https://github.com/openai/codex/pull/16658) Fix deprecated login --api-key parsing [@etraut-openai](https://github.com/etraut-openai)
* [#16508](https://github.com/openai/codex/pull/16508) extract models manager and related ownership from core [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#16662](https://github.com/openai/codex/pull/16662) fix: changes to test that should help them pass on Windows under Bazel [@bolinfest](https://github.com/bolinfest)
* [#16665](https://github.com/openai/codex/pull/16665) fix: use COMSPEC in Windows unicode shell test [@bolinfest](https://github.com/bolinfest)
* [#16668](https://github.com/openai/codex/pull/16668) fix: use cmd.exe in Windows unicode shell test [@bolinfest](https://github.com/bolinfest)
* [#16626](https://github.com/openai/codex/pull/16626) remove temporary ownership re-exports [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#16648](https://github.com/openai/codex/pull/16648) Fix stale /copy output after commentary-only turns [@etraut-openai](https://github.com/etraut-openai)
* [#16674](https://github.com/openai/codex/pull/16674) Fix MCP tool listing for hyphenated server names [@etraut-openai](https://github.com/etraut-openai)
* [#16667](https://github.com/openai/codex/pull/16667) Suppress bwrap warning when sandboxing is bypassed [@etraut-openai](https://github.com/etraut-openai)
* [#16670](https://github.com/openai/codex/pull/16670) Fix macOS sandbox panic in Codex HTTP client [@etraut-openai](https://github.com/etraut-openai)
* [#16699](https://github.com/openai/codex/pull/16699) Fix macOS malloc diagnostics leaking into TUI composer [@etraut-openai](https://github.com/etraut-openai)
* [#16700](https://github.com/openai/codex/pull/16700) Add remote --cd forwarding for app-server sessions [@etraut-openai](https://github.com/etraut-openai)
* [#16707](https://github.com/openai/codex/pull/16707) fix: preserve platform-specific core shell env vars [@bolinfest](https://github.com/bolinfest)
* [#16715](https://github.com/openai/codex/pull/16715) fix: address clippy violations that sneaked in [@bolinfest](https://github.com/bolinfest)
* [#16722](https://github.com/openai/codex/pull/16722) fix windows-only clippy lint violation [@bolinfest](https://github.com/bolinfest)
* [#16710](https://github.com/openai/codex/pull/16710) fix(tui): sort skill mentions by display name first [@fcoury-oai](https://github.com/fcoury-oai)
* [#16709](https://github.com/openai/codex/pull/16709) Sanitize forked child history [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#16711](https://github.com/openai/codex/pull/16711) Fix Windows Bazel app-server trust tests [@bolinfest](https://github.com/bolinfest)
* [#16720](https://github.com/openai/codex/pull/16720) Remove OPENAI\_BASE\_URL config fallback [@etraut-openai](https://github.com/etraut-openai)
* [#16528](https://github.com/openai/codex/pull/16528) Codex/windows bazel rust test coverage no rs [@bolinfest](https://github.com/bolinfest)
* [#16450](https://github.com/openai/codex/pull/16450) bazel: lint rust\_test targets in clippy workflow [@bolinfest](https://github.com/bolinfest)
* [#16735](https://github.com/openai/codex/pull/16735) [codex] allow disabling prompt instruction blocks [@tibo-openai](https://github.com/tibo-openai)
* [#16745](https://github.com/openai/codex/pull/16745) [codex] allow disabling environment context injection [@tibo-openai](https://github.com/tibo-openai)
* [#16725](https://github.com/openai/codex/pull/16725) Preempt mailbox mail after reasoning/commentary items [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#16755](https://github.com/openai/codex/pull/16755) Use Node 24 for npm publish [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#16753](https://github.com/openai/codex/pull/16753) [codex] add responses proxy JSON dumps [@tibo-openai](https://github.com/tibo-openai)
* [#16746](https://github.com/openai/codex/pull/16746) Add spawn context for MultiAgentV2 children [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#16757](https://github.com/openai/codex/pull/16757) Back out "bazel: lint rust\_test targets in clippy workflow ([#16450](https://github.com/openai/codex/pull/16450))" [@bolinfest](https://github.com/bolinfest)
* [#16737](https://github.com/openai/codex/pull/16737) test: avoid PowerShell startup in Windows auth fixture [@bolinfest](https://github.com/bolinfest)
* [#16740](https://github.com/openai/codex/pull/16740) ci: align Bazel repo cache and Windows clippy target handling [@bolinfest](https://github.com/bolinfest)
* [#16758](https://github.com/openai/codex/pull/16758) [codex] add context-window lineage headers [@tibo-openai](https://github.com/tibo-openai)
* [#16763](https://github.com/openai/codex/pull/16763) Add CODEX\_SKIP\_VENDORED\_BWRAP [@andmis](https://github.com/andmis)
* [#15915](https://github.com/openai/codex/pull/15915) [codex-analytics] subagent analytics [@rhan-oai](https://github.com/rhan-oai)
* [#16823](https://github.com/openai/codex/pull/16823) Fix flaky test relating to metadata remote URL [@etraut-openai](https://github.com/etraut-openai)
* [#16825](https://github.com/openai/codex/pull/16825) Fix flaky permissions escalation test on Windows [@etraut-openai](https://github.com/etraut-openai)
* [#16881](https://github.com/openai/codex/pull/16881) Fix misleading codex exec help usage [@etraut-openai](https://github.com/etraut-openai)
* [#16888](https://github.com/openai/codex/pull/16888) Clarify `codex exec` approval help [@etraut-openai](https://github.com/etraut-openai)
* [#16876](https://github.com/openai/codex/pull/16876) [codex] add response proxy subagent header test [@tibo-openai](https://github.com/tibo-openai)
* [#16829](https://github.com/openai/codex/pull/16829) Fix CJK word navigation in the TUI composer [@etraut-openai](https://github.com/etraut-openai)
* [#16833](https://github.com/openai/codex/pull/16833) Fix TUI fast mode toggle regression [@etraut-openai](https://github.com/etraut-openai)
* [#16795](https://github.com/openai/codex/pull/16795) [regression] Fix ephemeral turn backfill in exec [@etraut-openai](https://github.com/etraut-openai)
* [#16822](https://github.com/openai/codex/pull/16822) Fix resume picker timestamp labels and stability [@etraut-openai](https://github.com/etraut-openai)
* [#16813](https://github.com/openai/codex/pull/16813) Annotate skill doc reads with skill names [@etraut-openai](https://github.com/etraut-openai)
* [#16810](https://github.com/openai/codex/pull/16810) (tui): Decode percent-escaped bare local file links [@etraut-openai](https://github.com/etraut-openai)
* [#16877](https://github.com/openai/codex/pull/16877) [codex-backend] Make thread metadata updates tolerate pending backfill [@joeytrasatti-openai](https://github.com/joeytrasatti-openai)
* [#16701](https://github.com/openai/codex/pull/16701) feat(requirements): support allowed\_approval\_reviewers [@owenlin0](https://github.com/owenlin0)
* [#16925](https://github.com/openai/codex/pull/16925) fix(bazel): fix simdutf [@owenlin0](https://github.com/owenlin0)
* [#16926](https://github.com/openai/codex/pull/16926) bazel: Always save bazel repository cache [@euroelessar](https://github.com/euroelessar)
* [#16928](https://github.com/openai/codex/pull/16928) bazel: Enable `--experimental\_remote\_downloader` [@euroelessar](https://github.com/euroelessar)
* [#16462](https://github.com/openai/codex/pull/16462) fix(guardian): fix ordering of guardian events [@owenlin0](https://github.com/owenlin0)
* [#16924](https://github.com/openai/codex/pull/16924) fix(sqlite): don't hard fail migrator if DB is newer [@owenlin0](https://github.com/owenlin0)
* [#16744](https://github.com/openai/codex/pull/16744) build: restore lzma-sys Bazel wiring for devbox codex run [@starr-openai](https://github.com/starr-openai)
* [#16764](https://github.com/openai/codex/pull/16764) app-server: centralize AuthManager initialization [@euroelessar](https://github.com/euroelessar)
* [#16939](https://github.com/openai/codex/pull/16939) Fix clippy warning [@mzeng-openai](https://github.com/mzeng-openai)
* [#16923](https://github.com/openai/codex/pull/16923) Revert "[codex-backend] Make thread metadata updates tolerate pending backfill" [@joeytrasatti-openai](https://github.com/joeytrasatti-openai)
* [#15951](https://github.com/openai/codex/pull/15951) app-server: Add egress websocket transport [@euroelessar](https://github.com/euroelessar)
* [#16945](https://github.com/openai/codex/pull/16945) [codex] Allow PyTorch libomp shm in Seatbelt [@viyatb-oai](https://github.com/viyatb-oai)
* [#16947](https://github.com/openai/codex/pull/16947) feat: fallback curated plugin download from backend endpint. [@xl-openai](https://github.com/xl-openai)
* [#16191](https://github.com/openai/codex/pull/16191) feat: refresh non-curated cache from plugin list. [@xl-openai](https://github.com/xl-openai)
* [#16952](https://github.com/openai/codex/pull/16952) Respect residency requirements in mcp-server [@etraut-openai](https://github.com/etraut-openai)
* [#16827](https://github.com/openai/codex/pull/16827) tui: route device-code auth through app server [@etraut-openai](https://github.com/etraut-openai)
* [#16638](https://github.com/openai/codex/pull/16638) [codex-analytics] add protocol-native turn timestamps [@rhan-oai](https://github.com/rhan-oai)
* [#16831](https://github.com/openai/codex/pull/16831) Speed up /mcp inventory listing [@etraut-openai](https://github.com/etraut-openai)
* [#16349](https://github.com/openai/codex/pull/16349) Disable env-bound tools when exec server is none [@starr-openai](https://github.com/starr-openai)
* [#16957](https://github.com/openai/codex/pull/16957) Promote image\_detail\_original to experimental [@fjord-oai](https://github.com/fjord-oai)
* [#16962](https://github.com/openai/codex/pull/16962) Refactor config types into a separate crate [@pakrym-oai](https://github.com/pakrym-oai)
* [#16153](https://github.com/openai/codex/pull/16153) Add setTimeout support to code mode [@pakrym-oai](https://github.com/pakrym-oai)
* [#16961](https://github.com/openai/codex/pull/16961) app-server: Unify config changes handling a bit [@euroelessar](https://github.com/euroelessar)
* [#16890](https://github.com/openai/codex/pull/16890) Validate exec input before starting app-server [@etraut-openai](https://github.com/etraut-openai)
* [#16082](https://github.com/openai/codex/pull/16082) [mcp] Support MCP Apps part 1. [@mzeng-openai](https://github.com/mzeng-openai)
* [#15893](https://github.com/openai/codex/pull/15893) fix: warn when bwrap cannot create user namespaces [@viyatb-oai](https://github.com/viyatb-oai)
* [#16946](https://github.com/openai/codex/pull/16946) [codex] Add danger-full-access denylist-only network mode [@viyatb-oai](https://github.com/viyatb-oai)
* [#16972](https://github.com/openai/codex/pull/16972) app-server: Fix compilation of a test in mcp\_resource [@euroelessar](https://github.com/euroelessar)
* [#15826](https://github.com/openai/codex/pull/15826) Make AGENTS.md discovery FS-aware [@pakrym-oai](https://github.com/pakrym-oai)
* [#16964](https://github.com/openai/codex/pull/16964) Honor null thread instructions [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#16988](https://github.com/openai/codex/pull/16988) collapse dev message into one [@won-openai](https://github.com/won-openai)
* [#16724](https://github.com/openai/codex/pull/16724) [codex] ez - rename env=\>request in codex-rs/core/src/unified\_exec/process\_manager.rs [@starr-openai](https://github.com/starr-openai)
* [#16999](https://github.com/openai/codex/pull/16999) feat: empty role ok [@jif-oai](https://github.com/jif-oai)
* [#17002](https://github.com/openai/codex/pull/17002) chore: debug flag to hide some parameters [@jif-oai](https://github.com/jif-oai)
* [#17005](https://github.com/openai/codex/pull/17005) feat: drop agent ID from v2 [@jif-oai](https://github.com/jif-oai)
* [#17008](https://github.com/openai/codex/pull/17008) chore: send\_message and followup\_task do not return anything [@jif-oai](https://github.com/jif-oai)
* [#17007](https://github.com/openai/codex/pull/17007) chore: hide nickname for debug flag [@jif-oai](https://github.com/jif-oai)
* [#16442](https://github.com/openai/codex/pull/16442) feat: /feedback cascade [@jif-oai](https://github.com/jif-oai)
* [#16978](https://github.com/openai/codex/pull/16978) [codex] reduce module visibility [@pakrym-oai](https://github.com/pakrym-oai)
* [#17009](https://github.com/openai/codex/pull/17009) chore: keep request\_user\_input tool to persist cache on multi-agents [@jif-oai](https://github.com/jif-oai)
* [#16739](https://github.com/openai/codex/pull/16739) Stabilize flaky multi-agent followup interrupt test [@etraut-openai](https://github.com/etraut-openai)
* [#16885](https://github.com/openai/codex/pull/16885) Fix read-only apply\_patch rejection message [@etraut-openai](https://github.com/etraut-openai)
* [#16882](https://github.com/openai/codex/pull/16882) Fix nested exec thread ID restore [@etraut-openai](https://github.com/etraut-openai)
* [#16976](https://github.com/openai/codex/pull/16976) Preserve null developer instructions [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#16987](https://github.com/openai/codex/pull/16987) Fix missing resume hint on zero-token exits [@etraut-openai](https://github.com/etraut-openai)
* [#16912](https://github.com/openai/codex/pull/16912) feat(analytics): generate an installation\_id and pass it in responsesapi client\_metadata [@owenlin0](https://github.com/owenlin0)
* [#16956](https://github.com/openai/codex/pull/16956) fix(guardian): don't throw away transcript when over budget [@owenlin0](https://github.com/owenlin0)
* [#16981](https://github.com/openai/codex/pull/16981) [codex] Make AbsolutePathBuf joins infallible [@pakrym-oai](https://github.com/pakrym-oai)
* [#16348](https://github.com/openai/codex/pull/16348) Update README [@romainhuet](https://github.com/romainhuet)
* [#16977](https://github.com/openai/codex/pull/16977) [codex] Make unified exec tests remote aware [@pakrym-oai](https://github.com/pakrym-oai)
* [#16465](https://github.com/openai/codex/pull/16465) [mcp] Support MCP Apps part 2 - Add meta to mcp tool call result. [@mzeng-openai](https://github.com/mzeng-openai)
* [#17026](https://github.com/openai/codex/pull/17026) app-server: Move watch\_id to request of fs/watch [@euroelessar](https://github.com/euroelessar)
* [#16980](https://github.com/openai/codex/pull/16980) Add full-ci branch trigger [@pakrym-oai](https://github.com/pakrym-oai)
* [#16973](https://github.com/openai/codex/pull/16973) app-server: Allow enabling remote control in runtime [@euroelessar](https://github.com/euroelessar)
* [#17032](https://github.com/openai/codex/pull/17032) [codex] Fix unified exec test build [@pakrym-oai](https://github.com/pakrym-oai)
* [#17031](https://github.com/openai/codex/pull/17031) fix(core) revert Command line in unified exec output [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#17027](https://github.com/openai/codex/pull/17027) [codex] Migrate apply\_patch to executor filesystem [@pakrym-oai](https://github.com/pakrym-oai)
* [#17044](https://github.com/openai/codex/pull/17044) [app-server-protocol] introduce generic ServerResponse for app-server-protocol [@rhan-oai](https://github.com/rhan-oai)
* [#17047](https://github.com/openai/codex/pull/17047) fix(app-server) revert null instructions changes [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#16960](https://github.com/openai/codex/pull/16960) Add WebRTC transport to realtime start [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17053](https://github.com/openai/codex/pull/17053) Fix remote address format to work with Windows Firewall rules. [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#17048](https://github.com/openai/codex/pull/17048) [codex] Apply patches through executor filesystem [@pakrym-oai](https://github.com/pakrym-oai)
* [#16949](https://github.com/openai/codex/pull/16949) Use model metadata for Fast Mode status [@pash-openai](https://github.com/pash-openai)
* [#17039](https://github.com/openai/codex/pull/17039) fix(tui): reduce startup and new-session latency [@fcoury-oai](https://github.com/fcoury-oai)
* [#17052](https://github.com/openai/codex/pull/17052) Add regression tests for JsonSchema [@vivi](https://github.com/vivi)
* [#17059](https://github.com/openai/codex/pull/17059) Add remote exec start script [@pakrym-oai](https://github.com/pakrym-oai)
* [#17064](https://github.com/openai/codex/pull/17064) Add project-local codex bug triage skill [@etraut-openai](https://github.com/etraut-openai)
* [#17040](https://github.com/openai/codex/pull/17040) fix: refresh network proxy settings when sandbox mode changes [@viyatb-oai](https://github.com/viyatb-oai)
* [#16698](https://github.com/openai/codex/pull/16698) Remove expired April 2nd tooltip copy [@etraut-openai](https://github.com/etraut-openai)
* [#17096](https://github.com/openai/codex/pull/17096) Remove obsolete codex-cli README [@etraut-openai](https://github.com/etraut-openai)
* [#16875](https://github.com/openai/codex/pull/16875) Support anyOf and enum in JsonSchema [@vivi](https://github.com/vivi)
* [#16880](https://github.com/openai/codex/pull/16880) Render function attribute descriptions [@vivi](https://github.com/vivi)
* [#16879](https://github.com/openai/codex/pull/16879) Render namespace description for tools [@vivi](https://github.com/vivi)
* [#16582](https://github.com/openai/codex/pull/16582) feat: single app-server bootstrap in TUI [@jif-oai](https://github.com/jif-oai)
* [#17117](https://github.com/openai/codex/pull/17117) codex debug 1 (guardian approved) [@jif-oai](https://github.com/jif-oai)
* [#17119](https://github.com/openai/codex/pull/17119) codex debug 3 (guardian approved) [@jif-oai](https://github.com/jif-oai)
* [#17121](https://github.com/openai/codex/pull/17121) codex debug 5 (guardian approved) [@jif-oai](https://github.com/jif-oai)
* [#17123](https://github.com/openai/codex/pull/17123) codex debug 7 (guardian approved) [@jif-oai](https://github.com/jif-oai)
* [#17125](https://github.com/openai/codex/pull/17125) codex debug 9 (guardian approved) [@jif-oai](https://github.com/jif-oai)
* [#17127](https://github.com/openai/codex/pull/17127) codex debug 11 (guardian approved) [@jif-oai](https://github.com/jif-oai)
* [#17129](https://github.com/openai/codex/pull/17129) codex debug 13 (guardian approved) [@jif-oai](https://github.com/jif-oai)
* [#17131](https://github.com/openai/codex/pull/17131) codex debug 15 (guardian approved) [@jif-oai](https://github.com/jif-oai)
* [#17118](https://github.com/openai/codex/pull/17118) codex debug 2 (guardian approved) [@jif-oai](https://github.com/jif-oai)
* [#17120](https://github.com/openai/codex/pull/17120) codex debug 4 (guardian approved) [@jif-oai](https://github.com/jif-oai)
* [#17122](https://github.com/openai/codex/pull/17122) codex debug 6 (guardian approved) [@jif-oai](https://github.com/jif-oai)
* [#17124](https://github.com/openai/codex/pull/17124) codex debug 8 (guardian approved) [@jif-oai](https://github.com/jif-oai)
* [#17126](https://github.com/openai/codex/pull/17126) codex debug 10 (guardian approved) [@jif-oai](https://github.com/jif-oai)
* [#17128](https://github.com/openai/codex/pull/17128) codex debug 12 (guardian approved) [@jif-oai](https://github.com/jif-oai)
* [#17130](https://github.com/openai/codex/pull/17130) codex debug 14 (guardian approved) [@jif-oai](https://github.com/jif-oai)
* [#17071](https://github.com/openai/codex/pull/17071) Configure multi\_agent\_v2 spawn agent hints [@pakrym-oai](https://github.com/pakrym-oai)
* [#17091](https://github.com/openai/codex/pull/17091) Show global AGENTS.md in /status [@etraut-openai](https://github.com/etraut-openai)
* [#17086](https://github.com/openai/codex/pull/17086) Fix TUI crash when resuming the current thread [@etraut-openai](https://github.com/etraut-openai)
* [#17098](https://github.com/openai/codex/pull/17098) Skip MCP auth probing for disabled servers [@etraut-openai](https://github.com/etraut-openai)
* [#17097](https://github.com/openai/codex/pull/17097) Add realtime transport config [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17043](https://github.com/openai/codex/pull/17043) [mcp] Support server-driven elicitations [@mzeng-openai](https://github.com/mzeng-openai)
* [#17058](https://github.com/openai/codex/pull/17058) Add WebRTC media transport to realtime TUI [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17063](https://github.com/openai/codex/pull/17063) Use AbsolutePathBuf for exec cwd plumbing [@pakrym-oai](https://github.com/pakrym-oai)
* [#17138](https://github.com/openai/codex/pull/17138) fix(debug-config, guardian): fix /debug-config rendering and guardian… [@owenlin0](https://github.com/owenlin0)
* [#17046](https://github.com/openai/codex/pull/17046) release ready, enabling only for siwc users [@won-openai](https://github.com/won-openai)
* [#16751](https://github.com/openai/codex/pull/16751) Add sandbox support to filesystem APIs [@starr-openai](https://github.com/starr-openai)
* [#17142](https://github.com/openai/codex/pull/17142) [codex] Support remote exec cwd in TUI startup [@pakrym-oai](https://github.com/pakrym-oai)
* [#17149](https://github.com/openai/codex/pull/17149) Fix missing fields [@canvrno-oai](https://github.com/canvrno-oai)
* [#17154](https://github.com/openai/codex/pull/17154) Fix ToolsConfigParams initializer in tool registry test [@won-openai](https://github.com/won-openai)
* [#17145](https://github.com/openai/codex/pull/17145) Wire realtime WebRTC native media into Bazel [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17057](https://github.com/openai/codex/pull/17057) Attach WebRTC realtime starts to sideband websocket [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17162](https://github.com/openai/codex/pull/17162) Add top-level exec-server subcommand [@starr-openai](https://github.com/starr-openai)
* [#17061](https://github.com/openai/codex/pull/17061) Update guardian output schema [@maja-openai](https://github.com/maja-openai)
* [#17164](https://github.com/openai/codex/pull/17164) Auto-approve MCP server elicitations in Full Access mode [@leoshimo-oai](https://github.com/leoshimo-oai)
* [#17093](https://github.com/openai/codex/pull/17093) Add WebRTC realtime app-server e2e tests [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17174](https://github.com/openai/codex/pull/17174) Support Warp for OSC 9 notifications [@etraut-openai](https://github.com/etraut-openai)
* [#16646](https://github.com/openai/codex/pull/16646) Fix stale thread-name resume lookups [@etraut-openai](https://github.com/etraut-openai)
* [#17165](https://github.com/openai/codex/pull/17165) Move default realtime prompt into core [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17176](https://github.com/openai/codex/pull/17176) Add realtime voice selection [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17175](https://github.com/openai/codex/pull/17175) Add TUI notification condition config [@etraut-openai](https://github.com/etraut-openai)
* [#17183](https://github.com/openai/codex/pull/17183) Default realtime startup to v2 model [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17186](https://github.com/openai/codex/pull/17186) Skip update prompts for source builds [@etraut-openai](https://github.com/etraut-openai)
* [#17188](https://github.com/openai/codex/pull/17188) make webrtc the default experience [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#17163](https://github.com/openai/codex/pull/17163) [codex] Defer steering until after sampling the model post-compaction [@jgershen-oai](https://github.com/jgershen-oai)
* [#17222](https://github.com/openai/codex/pull/17222) feat: /resume per ID/name [@jif-oai](https://github.com/jif-oai)
* [#17226](https://github.com/openai/codex/pull/17226) feat: advanced announcements per OS and plans [@jif-oai](https://github.com/jif-oai)
* [#17170](https://github.com/openai/codex/pull/17170) Render statusline context as a meter [@etraut-openai](https://github.com/etraut-openai)
* [#17217](https://github.com/openai/codex/pull/17217) Skip local shell snapshots for remote unified exec [@jif-oai](https://github.com/jif-oai)
* [#17116](https://github.com/openai/codex/pull/17116) chore: merge name and title [@jif-oai](https://github.com/jif-oai)
* [#16276](https://github.com/openai/codex/pull/16276) [codex] add memory extensions [@kliu128](https://github.com/kliu128)
* [#17168](https://github.com/openai/codex/pull/17168) refactor(proxy): clarify sandbox block messages [@viyatb-oai](https://github.com/viyatb-oai)
* [#17076](https://github.com/openai/codex/pull/17076) [codex] Show ctrl + t hint on truncated exec output in TUI [@mom-oai](https://github.com/mom-oai)
* [#15197](https://github.com/openai/codex/pull/15197) Add Codex Apps sediment file remapping [@caseychow-oai](https://github.com/caseychow-oai)
* [#16009](https://github.com/openai/codex/pull/16009) Forward app-server turn clientMetadata to Responses [@neil-oai](https://github.com/neil-oai)
* [#17256](https://github.com/openai/codex/pull/17256) app-server: Use shared receivers for app-server message processors [@euroelessar](https://github.com/euroelessar)
* [#16944](https://github.com/openai/codex/pull/16944) [mcp] Expand tool search to custom MCPs. [@mzeng-openai](https://github.com/mzeng-openai)
* [#16966](https://github.com/openai/codex/pull/16966) feat(tui): Ctrl+O copy hotkey and harden copy-as-markdown behavior [@fcoury-oai](https://github.com/fcoury-oai)
* [#17262](https://github.com/openai/codex/pull/17262) app-server: Fix clippy by removing extra `mut` [@euroelessar](https://github.com/euroelessar)
* [#17258](https://github.com/openai/codex/pull/17258) Omit empty app-server instruction overrides [@aibrahim-oai](https://github.com/aibrahim-oai)
[
Full release on Github
](https://github.com/openai/codex/releases/tag/rust-v0.119.0)
*
2026-04-07
### Codex model availability update
We’re updating model availability for users who sign in with ChatGPT. Starting
April 7, the model picker no longer shows `gpt-5.2-codex`,
`gpt-5.1-codex-mini`, `gpt-5.1-codex-max`, `gpt-5.1-codex`, `gpt-5.1`, or
`gpt-5`. On April 14, we’ll remove those models from Codex for ChatGPT sign-in.
Users can still choose from `gpt-5.4`, `gpt-5.4-mini`, `gpt-5.3-codex`, and
`gpt-5.2`. ChatGPT Pro users can also choose `gpt-5.3-codex-spark`.
To use another API-supported model in Codex, sign in with an API key or
configure a model provider.
## March 2026
*
2026-03-31
### Codex CLI 0.118.0
```
`$ npm install -g @openai/codex@0.118.0`
```
View details
## New Features
* Windows sandbox runs can now enforce proxy-only networking with OS-level egress rules, instead of relying on environment variables alone. ([#12220](https://github.com/openai/codex/pull/12220))
* App-server clients can now start ChatGPT sign-in with a device code flow, which helps when browser callback login is unreliable or unavailable. ([#15525](https://github.com/openai/codex/pull/15525))
* `codex exec` now supports the prompt-plus-stdin workflow, so you can pipe input and still pass a separate prompt on the command line. ([#15917](https://github.com/openai/codex/pull/15917))
* Custom model providers can now fetch and refresh short-lived bearer tokens dynamically, instead of being limited to static credentials from config or environment variables. ([#16286](https://github.com/openai/codex/pull/16286), [#16287](https://github.com/openai/codex/pull/16287), [#16288](https://github.com/openai/codex/pull/16288))
## Bug Fixes
* Project-local `.codex` files are now protected even on first creation, closing a gap where the initial write could bypass normal approval checks. ([#15067](https://github.com/openai/codex/pull/15067))
* Linux sandbox launches are more reliable because Codex once again finds a trusted system `bwrap` on normal multi-entry `PATH`s. ([#15791](https://github.com/openai/codex/pull/15791), [#15973](https://github.com/openai/codex/pull/15973))
* The app-server-backed TUI regained several missing workflows: hook notifications replay correctly, `/copy` and `/resume \<name\>` work again, `/agent` no longer shows stale threads, and the skills picker scrolls past the first page. ([#16013](https://github.com/openai/codex/pull/16013), [#16021](https://github.com/openai/codex/pull/16021), [#16050](https://github.com/openai/codex/pull/16050), [#16014](https://github.com/openai/codex/pull/16014), [#16109](https://github.com/openai/codex/pull/16109), [#16110](https://github.com/openai/codex/pull/16110))
* MCP startup is more robust: local servers get a longer startup window, and failed handshakes surface warnings in the TUI again instead of looking like clean startups. ([#16080](https://github.com/openai/codex/pull/16080), [#16041](https://github.com/openai/codex/pull/16041))
* On Windows, `apply\_patch` is less likely to fail because it no longer adds redundant writable roots that could trigger unnecessary ACL churn. ([#16030](https://github.com/openai/codex/pull/16030))
## Changelog
Full Changelog: [rust-v0.117.0...rust-v0.118.0](https://github.com/openai/codex/compare/rust-v0.117.0...rust-v0.118.0)
* [#15891](https://github.com/openai/codex/pull/15891) [plugins] Polish tool suggest prompts. [@mzeng-openai](https://github.com/mzeng-openai)
* [#15791](https://github.com/openai/codex/pull/15791) fix: resolve bwrap from trusted PATH entry [@viyatb-oai](https://github.com/viyatb-oai)
* [#15900](https://github.com/openai/codex/pull/15900) skills: remove unused skill permission metadata [@bolinfest](https://github.com/bolinfest)
* [#15811](https://github.com/openai/codex/pull/15811) app-server: Split transport module [@euroelessar](https://github.com/euroelessar)
* [#15067](https://github.com/openai/codex/pull/15067) Protect first-time project .codex creation across Linux and macOS sandboxes [@rreichel3-oai](https://github.com/rreichel3-oai)
* [#15903](https://github.com/openai/codex/pull/15903) [codex] import token\_data from codex-login directly [@bolinfest](https://github.com/bolinfest)
* [#15897](https://github.com/openai/codex/pull/15897) sandboxing: use OsString for SandboxCommand.program [@bolinfest](https://github.com/bolinfest)
* [#15910](https://github.com/openai/codex/pull/15910) docs: update AGENTS.md to discourage adding code to codex-core [@bolinfest](https://github.com/bolinfest)
* [#15898](https://github.com/openai/codex/pull/15898) chore: move bwrap config helpers into dedicated module [@viyatb-oai](https://github.com/viyatb-oai)
* [#15906](https://github.com/openai/codex/pull/15906) chore: remove skill metadata from command approval payloads [@bolinfest](https://github.com/bolinfest)
* [#15909](https://github.com/openai/codex/pull/15909) fix(network-proxy): fail closed on network-proxy DNS lookup errors [@viyatb-oai](https://github.com/viyatb-oai)
* [#14495](https://github.com/openai/codex/pull/14495) Preserve bazel repository cache in github actions [@siggisim](https://github.com/siggisim)
* [#15522](https://github.com/openai/codex/pull/15522) bazel: re-organize bazelrc [@sluongng](https://github.com/sluongng)
* [#15923](https://github.com/openai/codex/pull/15923) codex-tools: extract shared tool schema parsing [@bolinfest](https://github.com/bolinfest)
* [#15918](https://github.com/openai/codex/pull/15918) permissions: remove macOS seatbelt extension profiles [@bolinfest](https://github.com/bolinfest)
* [#12220](https://github.com/openai/codex/pull/12220) feat(windows-sandbox): add network proxy support [@viyatb-oai](https://github.com/viyatb-oai)
* [#15931](https://github.com/openai/codex/pull/15931) fix: make MACOS\_DEFAULT\_PREFERENCES\_POLICY part of MACOS\_SEATBELT\_BASE\_POLICY [@bolinfest](https://github.com/bolinfest)
* [#15933](https://github.com/openai/codex/pull/15933) fix: use matrix.target instead of matrix.os for actions/cache build action [@bolinfest](https://github.com/bolinfest)
* [#15928](https://github.com/openai/codex/pull/15928) codex-tools: extract MCP schema adapters [@bolinfest](https://github.com/bolinfest)
* [#15948](https://github.com/openai/codex/pull/15948) fix: increase timeout for rust-ci to 45 minutes for now [@bolinfest](https://github.com/bolinfest)
* [#15921](https://github.com/openai/codex/pull/15921) [app-server-protocol] introduce generic ClientResponse for app-server-protocol [@rhan-oai](https://github.com/rhan-oai)
* [#15120](https://github.com/openai/codex/pull/15120) chore: refactor network permissions to use explicit domain and unix socket rule maps [@celia-oai](https://github.com/celia-oai)
* [#15525](https://github.com/openai/codex/pull/15525) Add ChatGPT device-code login to app server [@daniel-oai](https://github.com/daniel-oai)
* [#15876](https://github.com/openai/codex/pull/15876) chore: drop useless stuff [@jif-oai](https://github.com/jif-oai)
* [#15954](https://github.com/openai/codex/pull/15954) chore: move pty and windows sandbox to Rust 2024 [@bolinfest](https://github.com/bolinfest)
* [#15986](https://github.com/openai/codex/pull/15986) feat: spawn v2 make task name as mandatory [@jif-oai](https://github.com/jif-oai)
* [#16000](https://github.com/openai/codex/pull/16000) Use codex-utils-template for login error page [@jif-oai](https://github.com/jif-oai)
* [#16001](https://github.com/openai/codex/pull/16001) Use codex-utils-template for review prompts [@jif-oai](https://github.com/jif-oai)
* [#15998](https://github.com/openai/codex/pull/15998) Use codex-utils-template for sandbox mode prompts [@jif-oai](https://github.com/jif-oai)
* [#15995](https://github.com/openai/codex/pull/15995) Use codex-utils-template for collaboration mode presets [@jif-oai](https://github.com/jif-oai)
* [#15996](https://github.com/openai/codex/pull/15996) Use codex-utils-template for search tool descriptions [@jif-oai](https://github.com/jif-oai)
* [#15999](https://github.com/openai/codex/pull/15999) Use codex-utils-template for review exit XML [@jif-oai](https://github.com/jif-oai)
* [#15985](https://github.com/openai/codex/pull/15985) feat: spawn v2 as inter agent communication [@jif-oai](https://github.com/jif-oai)
* [#15973](https://github.com/openai/codex/pull/15973) fix(sandbox): fix bwrap lookup for multi-entry PATH [@viyatb-oai](https://github.com/viyatb-oai)
* [#15944](https://github.com/openai/codex/pull/15944) codex-tools: extract dynamic tool adapters [@bolinfest](https://github.com/bolinfest)
* [#15955](https://github.com/openai/codex/pull/15955) ci: add Bazel clippy workflow for codex-rs [@bolinfest](https://github.com/bolinfest)
* [#15953](https://github.com/openai/codex/pull/15953) codex-tools: introduce named tool definitions [@bolinfest](https://github.com/bolinfest)
* [#16027](https://github.com/openai/codex/pull/16027) fix: fix Windows CI regression introduced in [#15999](https://github.com/openai/codex/pull/15999) [@bolinfest](https://github.com/bolinfest)
* [#16036](https://github.com/openai/codex/pull/16036) fix: disable plugins in SDK integration tests [@bolinfest](https://github.com/bolinfest)
* [#15946](https://github.com/openai/codex/pull/15946) Normalize /mcp tool grouping for hyphenated server names [@pakrym-oai](https://github.com/pakrym-oai)
* [#16035](https://github.com/openai/codex/pull/16035) plugins: Clean up stale curated plugin sync temp dirs and add sync metrics [@xl-openai](https://github.com/xl-openai)
* [#15934](https://github.com/openai/codex/pull/15934) Add usage-based business plan types [@bwanner-oai](https://github.com/bwanner-oai)
* [#16031](https://github.com/openai/codex/pull/16031) codex-tools: extract responses API tool models [@bolinfest](https://github.com/bolinfest)
* [#16013](https://github.com/openai/codex/pull/16013) Fix tui\_app\_server hook notification rendering and replay [@etraut-openai](https://github.com/etraut-openai)
* [#16021](https://github.com/openai/codex/pull/16021) Fix /copy regression in tui\_app\_server turn completion [@etraut-openai](https://github.com/etraut-openai)
* [#16044](https://github.com/openai/codex/pull/16044) [mcp] Bypass read-only tool checks. [@mzeng-openai](https://github.com/mzeng-openai)
* [#16030](https://github.com/openai/codex/pull/16030) don't include redundant write roots in apply\_patch [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#15922](https://github.com/openai/codex/pull/15922) Remove the legacy TUI split [@etraut-openai](https://github.com/etraut-openai)
* [#15828](https://github.com/openai/codex/pull/15828) [codex] Pin GitHub Actions workflow references [@hintz-openai](https://github.com/hintz-openai)
* [#16046](https://github.com/openai/codex/pull/16046) ci: run SDK tests with a Bazel-built codex [@bolinfest](https://github.com/bolinfest)
* [#16050](https://github.com/openai/codex/pull/16050) Fix tui\_app\_server resume-by-name lookup regression [@etraut-openai](https://github.com/etraut-openai)
* [#16014](https://github.com/openai/codex/pull/16014) Fix tui\_app\_server agent picker closed-state regression [@etraut-openai](https://github.com/etraut-openai)
* [#16054](https://github.com/openai/codex/pull/16054) chore: clean up argument-comment lint and roll out all-target CI on macOS [@bolinfest](https://github.com/bolinfest)
* [#15917](https://github.com/openai/codex/pull/15917) Support Codex CLI stdin piping for `codex exec` [@jliccini](https://github.com/jliccini)
* [#16057](https://github.com/openai/codex/pull/16057) shell-command: reuse a PowerShell parser process on Windows [@bolinfest](https://github.com/bolinfest)
* [#16063](https://github.com/openai/codex/pull/16063) refactor: rewrite argument-comment lint wrappers in Python [@bolinfest](https://github.com/bolinfest)
* [#15952](https://github.com/openai/codex/pull/15952) bazel: enable the full Windows gnullvm CI path [@bolinfest](https://github.com/bolinfest)
* [#16067](https://github.com/openai/codex/pull/16067) ci: run Bazel clippy on Windows gnullvm [@bolinfest](https://github.com/bolinfest)
* [#16071](https://github.com/openai/codex/pull/16071) fix: clean up remaining Windows argument-comment-lint violations [@bolinfest](https://github.com/bolinfest)
* [#16072](https://github.com/openai/codex/pull/16072) ci: split fast PR Rust CI from full post-merge Cargo CI [@bolinfest](https://github.com/bolinfest)
* [#16074](https://github.com/openai/codex/pull/16074) bazel: add Windows gnullvm stack flags to unit test binaries [@bolinfest](https://github.com/bolinfest)
* [#16026](https://github.com/openai/codex/pull/16026) fix(tui): refresh footer on collaboration mode changes [@fcoury](https://github.com/fcoury)
* [#16112](https://github.com/openai/codex/pull/16112) Update PR babysitter skill for review replies and resolution [@etraut-openai](https://github.com/etraut-openai)
* [#16104](https://github.com/openai/codex/pull/16104) Rename tui\_app\_server to tui [@etraut-openai](https://github.com/etraut-openai)
* [#16118](https://github.com/openai/codex/pull/16118) fix: fix comment linter lint violations in Linux-only code [@bolinfest](https://github.com/bolinfest)
* [#16106](https://github.com/openai/codex/pull/16106) build: migrate argument-comment-lint to a native Bazel aspect [@bolinfest](https://github.com/bolinfest)
* [#16115](https://github.com/openai/codex/pull/16115) Remove remaining custom prompt support [@etraut-openai](https://github.com/etraut-openai)
* [#16116](https://github.com/openai/codex/pull/16116) Remove the codex-tui app-server originator workaround [@etraut-openai](https://github.com/etraut-openai)
* [#16047](https://github.com/openai/codex/pull/16047) codex-tools: extract tool spec models [@bolinfest](https://github.com/bolinfest)
* [#16128](https://github.com/openai/codex/pull/16128) bazel: refresh the expired macOS SDK pin [@bolinfest](https://github.com/bolinfest)
* [#16129](https://github.com/openai/codex/pull/16129) codex-tools: extract configured tool specs [@bolinfest](https://github.com/bolinfest)
* [#16130](https://github.com/openai/codex/pull/16130) ci: keep rust-ci-full Windows argument-comment-lint on packaged wrapper [@bolinfest](https://github.com/bolinfest)
* [#16126](https://github.com/openai/codex/pull/16126) core: fix stale curated plugin cache refresh races [@bolinfest](https://github.com/bolinfest)
* [#16132](https://github.com/openai/codex/pull/16132) codex-tools: extract code mode tool spec adapters [@bolinfest](https://github.com/bolinfest)
* [#16136](https://github.com/openai/codex/pull/16136) ci: use BuildBuddy for rust-ci-full non-Windows argument-comment-lint [@bolinfest](https://github.com/bolinfest)
* [#16137](https://github.com/openai/codex/pull/16137) exec: make review-policy tests hermetic [@bolinfest](https://github.com/bolinfest)
* [#16109](https://github.com/openai/codex/pull/16109) Fix skills picker scrolling in tui app server [@etraut-openai](https://github.com/etraut-openai)
* [#16138](https://github.com/openai/codex/pull/16138) codex-tools: extract local host tool specs [@bolinfest](https://github.com/bolinfest)
* [#16114](https://github.com/openai/codex/pull/16114) Remove TUI voice transcription feature [@etraut-openai](https://github.com/etraut-openai)
* [#16080](https://github.com/openai/codex/pull/16080) [mcp] Increase MCP startup timeout. [@mzeng-openai](https://github.com/mzeng-openai)
* [#16141](https://github.com/openai/codex/pull/16141) codex-tools: extract collaboration tool specs [@bolinfest](https://github.com/bolinfest)
* [#16041](https://github.com/openai/codex/pull/16041) Fix app-server TUI MCP startup warnings regression [@etraut-openai](https://github.com/etraut-openai)
* [#16110](https://github.com/openai/codex/pull/16110) Fix tui\_app\_server ghost subagent entries in /agent [@etraut-openai](https://github.com/etraut-openai)
* [#16154](https://github.com/openai/codex/pull/16154) codex-tools: extract utility tool specs [@bolinfest](https://github.com/bolinfest)
* [#16204](https://github.com/openai/codex/pull/16204) [codex] Normalize Windows path in MCP startup snapshot test [@etraut-openai](https://github.com/etraut-openai)
* [#16010](https://github.com/openai/codex/pull/16010) feat: add mailbox concept for wait [@jif-oai](https://github.com/jif-oai)
* [#16237](https://github.com/openai/codex/pull/16237) fix: ma1 [@jif-oai](https://github.com/jif-oai)
* [#16193](https://github.com/openai/codex/pull/16193) codex-tools: extract discovery tool specs [@bolinfest](https://github.com/bolinfest)
* [#16254](https://github.com/openai/codex/pull/16254) codex-tools: extract discoverable tool models [@bolinfest](https://github.com/bolinfest)
* [#16253](https://github.com/openai/codex/pull/16253) fix: close Bazel argument-comment-lint CI gaps [@bolinfest](https://github.com/bolinfest)
* [#16225](https://github.com/openai/codex/pull/16225) [codex-analytics] refactor analytics to use reducer architecture [@rhan-oai](https://github.com/rhan-oai)
* [#16279](https://github.com/openai/codex/pull/16279) Update code mode exec() instructions [@andmis](https://github.com/andmis)
* [#16120](https://github.com/openai/codex/pull/16120) ci: run Windows argument-comment-lint via native Bazel [@bolinfest](https://github.com/bolinfest)
* [#16286](https://github.com/openai/codex/pull/16286) auth: generalize external auth tokens for bearer-only sources [@bolinfest](https://github.com/bolinfest)
* [#16287](https://github.com/openai/codex/pull/16287) auth: let AuthManager own external bearer auth [@bolinfest](https://github.com/bolinfest)
* [#16288](https://github.com/openai/codex/pull/16288) core: support dynamic auth tokens for model providers [@bolinfest](https://github.com/bolinfest)
[
Full release on Github
](https://github.com/openai/codex/releases/tag/rust-v0.118.0)
*
2026-03-26
### Codex CLI 0.117.0
```
`$ npm install -g @openai/codex@0.117.0`
```
View details
## New Features
* Plugins are now a first-class workflow: Codex can sync product-scoped plugins at startup, browse them in `/plugins`, and install or remove them with clearer auth/setup handling. ([#15041](https://github.com/openai/codex/pull/15041), [#15042](https://github.com/openai/codex/pull/15042), [#15195](https://github.com/openai/codex/pull/15195), [#15215](https://github.com/openai/codex/pull/15215), [#15217](https://github.com/openai/codex/pull/15217), [#15264](https://github.com/openai/codex/pull/15264), [#15275](https://github.com/openai/codex/pull/15275), [#15342](https://github.com/openai/codex/pull/15342), [#15580](https://github.com/openai/codex/pull/15580), [#15606](https://github.com/openai/codex/pull/15606), [#15802](https://github.com/openai/codex/pull/15802))
* Sub-agents now use readable path-based addresses like `/root/agent\_a`, with structured inter-agent messaging and agent listing for multi-agent v2 workflows. ([#15313](https://github.com/openai/codex/pull/15313), [#15515](https://github.com/openai/codex/pull/15515), [#15556](https://github.com/openai/codex/pull/15556), [#15570](https://github.com/openai/codex/pull/15570), [#15621](https://github.com/openai/codex/pull/15621), [#15647](https://github.com/openai/codex/pull/15647))
* The `/title` terminal-title picker now works in both the classic TUI and the app-server TUI, making parallel sessions easier to tell apart. ([#12334](https://github.com/openai/codex/pull/12334), [#15860](https://github.com/openai/codex/pull/15860))
* App-server clients can now send `!` shell commands, watch filesystem changes, and connect to remote websocket servers with bearer-token auth. ([#14988](https://github.com/openai/codex/pull/14988), [#14533](https://github.com/openai/codex/pull/14533), [#14847](https://github.com/openai/codex/pull/14847), [#14853](https://github.com/openai/codex/pull/14853))
* Image workflows got smoother: `view\_image` now returns image URLs for code mode, generated images are reopenable from the TUI, and image-generation history survives resume. ([#15072](https://github.com/openai/codex/pull/15072), [#15154](https://github.com/openai/codex/pull/15154), [#15223](https://github.com/openai/codex/pull/15223))
* Prompt history recall now works in the app-server TUI, including across sessions. ([#14945](https://github.com/openai/codex/pull/14945))
## Bug Fixes
* `tui\_app\_server` no longer duplicates live reasoning summaries or `/review` output, and it preserves transcript text instead of dropping it under backpressure. ([#15758](https://github.com/openai/codex/pull/15758), [#15839](https://github.com/openai/codex/pull/15839), [#15759](https://github.com/openai/codex/pull/15759))
* ChatGPT login in `tui\_app\_server` now opens the local browser again, cancels cleanly on `Ctrl+C`, and no longer fails startup when you're logged out. ([#15672](https://github.com/openai/codex/pull/15672), [#15673](https://github.com/openai/codex/pull/15673), [#15670](https://github.com/openai/codex/pull/15670))
* Early exits now restore terminal state reliably, avoiding broken shell state after quitting; tmux users also get a working queued-message edit shortcut on `Shift+Left`. ([#15671](https://github.com/openai/codex/pull/15671), [#15480](https://github.com/openai/codex/pull/15480))
* Linux sandboxed tool calls are more reliable on older distributions with older `bubblewrap`, and Windows restricted-token sandboxing now supports more split-policy carveout layouts. ([#15693](https://github.com/openai/codex/pull/15693), [#14172](https://github.com/openai/codex/pull/14172))
* Remote multi-agent sessions now show agent names instead of raw IDs and recover more gracefully from stale turn-steering races. ([#15513](https://github.com/openai/codex/pull/15513), [#15714](https://github.com/openai/codex/pull/15714), [#15163](https://github.com/openai/codex/pull/15163))
* Plugin-backed mentions and product gating now behave more predictably, fixing cases where explicit mentions lost context or plugins were filtered incorrectly. ([#15372](https://github.com/openai/codex/pull/15372), [#15263](https://github.com/openai/codex/pull/15263), [#15279](https://github.com/openai/codex/pull/15279))
## Documentation
* Expanded the app-server and exec-server docs/schema fixtures to cover exec-server setup, filesystem watch RPCs, realtime transcript notifications, and the new Python `thread.run(...)` quickstart flow. ([#15089](https://github.com/openai/codex/pull/15089), [#14533](https://github.com/openai/codex/pull/14533), [#15344](https://github.com/openai/codex/pull/15344), [#15088](https://github.com/openai/codex/pull/15088))
## Chores
* The app-server-backed TUI is now enabled by default, and the plugin/app rollout flags have been flipped on in normal builds. ([#15661](https://github.com/openai/codex/pull/15661), [#15713](https://github.com/openai/codex/pull/15713), [#15719](https://github.com/openai/codex/pull/15719), [#15820](https://github.com/openai/codex/pull/15820))
* Removed the legacy artifact tool and retired the old `read\_file` and `grep\_files` handlers as part of ongoing tool-surface cleanup. ([#15851](https://github.com/openai/codex/pull/15851), [#15864](https://github.com/openai/codex/pull/15864), [#15773](https://github.com/openai/codex/pull/15773), [#15775](https://github.com/openai/codex/pull/15775))
## Changelog
Full Changelog: [rust-v0.116.0...rust-v0.117.0](https://github.com/openai/codex/compare/rust-v0.116.0...rust-v0.117.0)
* [#14945](https://github.com/openai/codex/pull/14945) feat(tui): restore composer history in app-server tui [@fcoury](https://github.com/fcoury)
* [#15092](https://github.com/openai/codex/pull/15092) fix: try to fix "Stage npm package" step in ci.yml [@bolinfest](https://github.com/bolinfest)
* [#15075](https://github.com/openai/codex/pull/15075) Propagate tool errors to code mode [@pakrym-oai](https://github.com/pakrym-oai)
* [#15072](https://github.com/openai/codex/pull/15072) Return image URL from view\_image tool [@pakrym-oai](https://github.com/pakrym-oai)
* [#15076](https://github.com/openai/codex/pull/15076) Add a startup deprecation warning for custom prompts [@etraut-openai](https://github.com/etraut-openai)
* [#15102](https://github.com/openai/codex/pull/15102) Revert "fix: harden plugin feature gating" [@xl-openai](https://github.com/xl-openai)
* [#15077](https://github.com/openai/codex/pull/15077) Add final message prefix to realtime handoff output [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#13494](https://github.com/openai/codex/pull/13494) Align SQLite feedback logs with feedback formatter [@charley-oai](https://github.com/charley-oai)
* [#14888](https://github.com/openai/codex/pull/14888) Feat: reuse persisted model and reasoning effort on thread resume [@shijie-oai](https://github.com/shijie-oai)
* [#15111](https://github.com/openai/codex/pull/15111) don't add transcript for v2 realtime [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#15103](https://github.com/openai/codex/pull/15103) Add update\_plan code mode result [@pakrym-oai](https://github.com/pakrym-oai)
* [#15100](https://github.com/openai/codex/pull/15100) Add apply\_patch code mode result [@pakrym-oai](https://github.com/pakrym-oai)
* [#15104](https://github.com/openai/codex/pull/15104) fix: harden plugin feature gating [@xl-openai](https://github.com/xl-openai)
* [#15089](https://github.com/openai/codex/pull/15089) Add exec-server stub server and protocol docs [@starr-openai](https://github.com/starr-openai)
* [#15042](https://github.com/openai/codex/pull/15042) Support featured plugins [@alexsong-oai](https://github.com/alexsong-oai)
* [#15088](https://github.com/openai/codex/pull/15088) Add Python SDK thread.run convenience methods [@shaqayeq-oai](https://github.com/shaqayeq-oai)
* [#15119](https://github.com/openai/codex/pull/15119) Remove stdio transport from exec server [@pakrym-oai](https://github.com/pakrym-oai)
* [#14632](https://github.com/openai/codex/pull/14632) feat(core, tracing): create turn spans over websockets [@owenlin0](https://github.com/owenlin0)
* [#15011](https://github.com/openai/codex/pull/15011) Forward session and turn headers to MCP HTTP requests [@nicholasclark-openai](https://github.com/nicholasclark-openai)
* [#15118](https://github.com/openai/codex/pull/15118) [hooks] turn\_id extension for Stop & UserPromptSubmit [@eternal-openai](https://github.com/eternal-openai)
* [#14970](https://github.com/openai/codex/pull/14970) Simple directory mentions [@canvrno-oai](https://github.com/canvrno-oai)
* [#14988](https://github.com/openai/codex/pull/14988) Add thread/shellCommand to app server API surface [@etraut-openai](https://github.com/etraut-openai)
* [#15041](https://github.com/openai/codex/pull/15041) feat: support product-scoped plugins. [@xl-openai](https://github.com/xl-openai)
* [#15056](https://github.com/openai/codex/pull/15056) feat: add graph representation of agent network [@jif-oai](https://github.com/jif-oai)
* [#15163](https://github.com/openai/codex/pull/15163) fix: case where agent is already closed [@jif-oai](https://github.com/jif-oai)
* [#15125](https://github.com/openai/codex/pull/15125) Move environment abstraction into exec server [@pakrym-oai](https://github.com/pakrym-oai)
* [#15180](https://github.com/openai/codex/pull/15180) chore: add metrics for profile [@jif-oai](https://github.com/jif-oai)
* [#15175](https://github.com/openai/codex/pull/15175) chore: morpheus does not generate memories [@jif-oai](https://github.com/jif-oai)
* [#15185](https://github.com/openai/codex/pull/15185) Revert "Forward session and turn headers to MCP HTTP requests" [@nicholasclark-openai](https://github.com/nicholasclark-openai)
* [#14867](https://github.com/openai/codex/pull/14867) [hooks] use a user message \> developer message for prompt continuation [@eternal-openai](https://github.com/eternal-openai)
* [#15196](https://github.com/openai/codex/pull/15196) Add experimental exec server URL handling [@pakrym-oai](https://github.com/pakrym-oai)
* [#15198](https://github.com/openai/codex/pull/15198) Publish runnable DotSlash package for argument-comment lint [@bolinfest](https://github.com/bolinfest)
* [#15090](https://github.com/openai/codex/pull/15090) Add exec-server process and filesystem RPCs [@starr-openai](https://github.com/starr-openai)
* [#15201](https://github.com/openai/codex/pull/15201) Log automated reviewer approval sources distinctly [@gabec-openai](https://github.com/gabec-openai)
* [#12334](https://github.com/openai/codex/pull/12334) feat(tui): add /title terminal title configuration [@yvolovich-cyber](https://github.com/yvolovich-cyber)
* [#15206](https://github.com/openai/codex/pull/15206) feat(tracing): tag app-server turn spans with turn\_id [@owenlin0](https://github.com/owenlin0)
* [#15216](https://github.com/openai/codex/pull/15216) Move terminal module to terminal-detection crate [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#15207](https://github.com/openai/codex/pull/15207) add specific tool guidance for Windows destructive commands [@iceweasel-oai](https://github.com/iceweasel-oai)
* [#15154](https://github.com/openai/codex/pull/15154) adding full imagepath to tui [@won-openai](https://github.com/won-openai)
* [#15217](https://github.com/openai/codex/pull/15217) feat: expose needs\_auth for plugin/read. [@xl-openai](https://github.com/xl-openai)
* [#15190](https://github.com/openai/codex/pull/15190) Plumb MCP turn metadata through \_meta [@nicholasclark-openai](https://github.com/nicholasclark-openai)
* [#15220](https://github.com/openai/codex/pull/15220) feat(app-server): add mcpServer/startupStatus/updated notification [@owenlin0](https://github.com/owenlin0)
* [#15222](https://github.com/openai/codex/pull/15222) changed save directory to codex\_home [@won-openai](https://github.com/won-openai)
* [#15232](https://github.com/openai/codex/pull/15232) Refactor ExecServer filesystem split between local and remote [@pakrym-oai](https://github.com/pakrym-oai)
* [#15021](https://github.com/openai/codex/pull/15021) V8 Bazel Build [@cconger](https://github.com/cconger)
* [#15150](https://github.com/openai/codex/pull/15150) Move auth code into login crate [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#15195](https://github.com/openai/codex/pull/15195) [plugins] Install MCPs when calling plugin/install [@mzeng-openai](https://github.com/mzeng-openai)
* [#15254](https://github.com/openai/codex/pull/15254) core: add a full-buffer exec capture policy [@bolinfest](https://github.com/bolinfest)
* [#15263](https://github.com/openai/codex/pull/15263) fix: Distinguish missing and empty plugin products [@xl-openai](https://github.com/xl-openai)
* [#15253](https://github.com/openai/codex/pull/15253) Split features into codex-features crate [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#15233](https://github.com/openai/codex/pull/15233) Split exec process into local and remote implementations [@starr-openai](https://github.com/starr-openai)
* [#15199](https://github.com/openai/codex/pull/15199) Use released DotSlash package for argument-comment lint [@bolinfest](https://github.com/bolinfest)
* [#15215](https://github.com/openai/codex/pull/15215) Initial plugins TUI menu - list and read only. tui + tui\_app\_server [@canvrno-oai](https://github.com/canvrno-oai)
* [#15252](https://github.com/openai/codex/pull/15252) Disable hooks on windows for now [@eternal-openai](https://github.com/eternal-openai)
* [#15264](https://github.com/openai/codex/pull/15264) feat: Add One-Time Startup Remote Plugin Sync [@xl-openai](https://github.com/xl-openai)
* [#15262](https://github.com/openai/codex/pull/15262) Add guardian follow-up reminder [@charley-oai](https://github.com/charley-oai)
* [#15223](https://github.com/openai/codex/pull/15223) Feat/restore image generation history [@won-openai](https://github.com/won-openai)
* [#15275](https://github.com/openai/codex/pull/15275) feat: prefer git for curated plugin sync [@xl-openai](https://github.com/xl-openai)
* [#14869](https://github.com/openai/codex/pull/14869) Add remote env CI matrix and integration test [@pakrym-oai](https://github.com/pakrym-oai)
* [#15218](https://github.com/openai/codex/pull/15218) Add temporary app-server originator fallback for codex-tui [@etraut-openai](https://github.com/etraut-openai)
* [#15328](https://github.com/openai/codex/pull/15328) try to fix bazel [@jif-oai](https://github.com/jif-oai)
* [#15324](https://github.com/openai/codex/pull/15324) Add remote test skill [@pakrym-oai](https://github.com/pakrym-oai)
* [#15313](https://github.com/openai/codex/pull/15313) feat: change multi-agent to use path-like system instead of uuids [@jif-oai](https://github.com/jif-oai)
* [#15244](https://github.com/openai/codex/pull/15244) Pin Python SDK app-server stdio to UTF-8 on Windows [@shaqayeq-oai](https://github.com/shaqayeq-oai)
* [#15337](https://github.com/openai/codex/pull/15337) Bump aws-lc-rs [@cconger](https://github.com/cconger)
* [#15203](https://github.com/openai/codex/pull/15203) Add v8-poc consumer of our new built v8 [@cconger](https://github.com/cconger)
* [#15273](https://github.com/openai/codex/pull/15273) [apps] Use ARC for yolo mode. [@mzeng-openai](https://github.com/mzeng-openai)
* [#15128](https://github.com/openai/codex/pull/15128) chore(core) Remove Feature::PowershellUtf8 [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#15344](https://github.com/openai/codex/pull/15344) Add realtime transcript notification in v2 [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#15285](https://github.com/openai/codex/pull/15285) Gate tui /plugins menu behind flag [@canvrno-oai](https://github.com/canvrno-oai)
* [#15114](https://github.com/openai/codex/pull/15114) fix: allow restricted filesystem profiles to read helper executables [@celia-oai](https://github.com/celia-oai)
* [#15231](https://github.com/openai/codex/pull/15231) chore(core) update prefix\_rule guidance [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#15036](https://github.com/openai/codex/pull/15036) fix(core) disable command\_might\_be\_dangerous when unsandboxed [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#15348](https://github.com/openai/codex/pull/15348) Pass platform param to featured plugins [@alexsong-oai](https://github.com/alexsong-oai)
* [#15276](https://github.com/openai/codex/pull/15276) Code mode on v8 [@cconger](https://github.com/cconger)
* [#15372](https://github.com/openai/codex/pull/15372) [plugins] Fix plugin explicit mention context management. [@mzeng-openai](https://github.com/mzeng-openai)
* [#15366](https://github.com/openai/codex/pull/15366) chore(context) Include guardian approval context [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#15390](https://github.com/openai/codex/pull/15390) Remove legacy app-server notification handling from tui\_app\_server [@etraut-openai](https://github.com/etraut-openai)
* [#15409](https://github.com/openai/codex/pull/15409) Add JIT entitlement for macosx [@cconger](https://github.com/cconger)
* [#15414](https://github.com/openai/codex/pull/15414) Remove legacy auth and notification handling from tui\_app\_server [@etraut-openai](https://github.com/etraut-openai)
* [#15376](https://github.com/openai/codex/pull/15376) [apps] Improve app tools loading for TUI. [@mzeng-openai](https://github.com/mzeng-openai)
* [#15415](https://github.com/openai/codex/pull/15415) chore(exec\_policy) ExecPolicyRequirementScenario tests [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#15464](https://github.com/openai/codex/pull/15464) Remove smart\_approvals alias migration [@charley-oai](https://github.com/charley-oai)
* [#15443](https://github.com/openai/codex/pull/15443) core: snapshot fork startup context injection [@charley-oai](https://github.com/charley-oai)
* [#15480](https://github.com/openai/codex/pull/15480) Use Shift+Left to edit queued messages in tmux [@charley-oai](https://github.com/charley-oai)
* [#15317](https://github.com/openai/codex/pull/15317) nit: guard -\> registry [@jif-oai](https://github.com/jif-oai)
* [#15338](https://github.com/openai/codex/pull/15338) fix: fall back to vendored bubblewrap when system bwrap lacks --argv0 [@bolinfest](https://github.com/bolinfest)
* [#15520](https://github.com/openai/codex/pull/15520) fix: cargo deny [@jif-oai](https://github.com/jif-oai)
* [#15279](https://github.com/openai/codex/pull/15279) Label plugins as plugins, and hide skills/apps for given plugin [@canvrno-oai](https://github.com/canvrno-oai)
* [#15259](https://github.com/openai/codex/pull/15259) tui: queue follow-ups during manual /compact [@charley-oai](https://github.com/charley-oai)
* [#15515](https://github.com/openai/codex/pull/15515) feat: structured multi-agent output [@jif-oai](https://github.com/jif-oai)
* [#15357](https://github.com/openai/codex/pull/15357) Fix: proactive auth refresh to reload guarded disk state first [@celia-oai](https://github.com/celia-oai)
* [#15342](https://github.com/openai/codex/pull/15342) Plugins TUI install/uninstall [@canvrno-oai](https://github.com/canvrno-oai)
* [#15540](https://github.com/openai/codex/pull/15540) chore: split sub-agent v2 implementation [@jif-oai](https://github.com/jif-oai)
* [#15516](https://github.com/openai/codex/pull/15516) Thread guardian Responses API errors into denial rationale [@charley-oai](https://github.com/charley-oai)
* [#15378](https://github.com/openai/codex/pull/15378) feat: support disable skills by name. [@xl-openai](https://github.com/xl-openai)
* [#15529](https://github.com/openai/codex/pull/15529) Unify realtime stop handling in TUI [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#15557](https://github.com/openai/codex/pull/15557) fix: main tui [@jif-oai](https://github.com/jif-oai)
* [#15556](https://github.com/openai/codex/pull/15556) feat: new op type for sub-agents communication [@jif-oai](https://github.com/jif-oai)
* [#15211](https://github.com/openai/codex/pull/15211) [hooks] add non-streaming (non-stdin style) shell-only PreToolUse support [@eternal-openai](https://github.com/eternal-openai)
* [#15560](https://github.com/openai/codex/pull/15560) feat: use serde to differenciate inter agent communication [@jif-oai](https://github.com/jif-oai)
* [#15426](https://github.com/openai/codex/pull/15426) chore(core) Add approvals reviewer to UserTurn [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#15562](https://github.com/openai/codex/pull/15562) [codex] Add rollback context duplication snapshot [@charley-oai](https://github.com/charley-oai)
* [#15570](https://github.com/openai/codex/pull/15570) feat: custom watcher for multi-agent v2 [@jif-oai](https://github.com/jif-oai)
* [#15575](https://github.com/openai/codex/pull/15575) feat: custom watcher for multi-agent v2 [@jif-oai](https://github.com/jif-oai)
* [#15576](https://github.com/openai/codex/pull/15576) feat: custom watcher for multi-agent v2 [@jif-oai](https://github.com/jif-oai)
* [#15360](https://github.com/openai/codex/pull/15360) fix: build PATH env var using OsString instead of String [@bolinfest](https://github.com/bolinfest)
* [#15239](https://github.com/openai/codex/pull/15239) Add fork snapshot modes [@charley-oai](https://github.com/charley-oai)
* [#15554](https://github.com/openai/codex/pull/15554) Add plugin-creator as system skill [@alexsong-oai](https://github.com/alexsong-oai)
* [#15592](https://github.com/openai/codex/pull/15592) Extract landlock helpers into codex-sandboxing [@pakrym-oai](https://github.com/pakrym-oai)
* [#15593](https://github.com/openai/codex/pull/15593) Move macOS sandbox builders into codex-sandboxing [@pakrym-oai](https://github.com/pakrym-oai)
* [#15478](https://github.com/openai/codex/pull/15478) [codex-cli][app-server] Update self-serve business usage limit copy in error returned [@dhruvgupta-oai](https://github.com/dhruvgupta-oai)
* [#15600](https://github.com/openai/codex/pull/15600) move imagegen skill into system skills [@dkundel-openai](https://github.com/dkundel-openai)
* [#15599](https://github.com/openai/codex/pull/15599) Move sandbox policy transforms into codex-sandboxing [@pakrym-oai](https://github.com/pakrym-oai)
* [#15580](https://github.com/openai/codex/pull/15580) Remove filter from plugins/list result [@canvrno-oai](https://github.com/canvrno-oai)
* [#15581](https://github.com/openai/codex/pull/15581) Stabilize macOS CI test timeouts [@dylan-hurd-oai](https://github.com/dylan-hurd-oai)
* [#15613](https://github.com/openai/codex/pull/15613) nit: split v2 wait [@jif-oai](https://github.com/jif-oai)
* [#15614](https://github.com/openai/codex/pull/15614) fix: flaky test [@jif-oai](https://github.com/jif-oai)
* [#15621](https://github.com/openai/codex/pull/15621) feat: list agents for sub-agent v2 [@jif-oai](https://github.com/jif-oai)
* [#15623](https://github.com/openai/codex/pull/15623) nit: optim on list agents [@jif-oai](https://github.com/jif-oai)
* [#15549](https://github.com/openai/codex/pull/15549) Allow global network allowlist wildcard [@rreichel3-oai](https://github.com/rreichel3-oai)
* [#15424](https://github.com/openai/codex/pull/15424) Finish moving codex exec to app-server [@etraut-openai](https://github.com/etraut-openai)
* [#15603](https://github.com/openai/codex/pull/15603) Extract sandbox manager and transforms into codex-sandboxing [@pakrym-oai](https://github.com/pakrym-oai)
* [#15484](https://github.com/openai/codex/pull/15484) chore(deps): bump pnpm/action-setup from 4 to 5 [@dependabot](https://github.com/dependabot)
* [#14777](https://github.com/openai/codex/pull/14777) Bump vedantmgoyal9/winget-releaser from 19e706d4c9121098010096f9c495a70a7518b30f to 7bd472be23763def6e16bd06cc8b1cdfab0e2fd5 [@dependabot](https://github.com/dependabot)
* [#15558](https://github.com/openai/codex/pull/15558) [Codex TUI] - Sort /plugins TUI menu by installed status first, alpha second [@canvrno-oai](https://github.com/canvrno-oai)
* [#15598](https://github.com/openai/codex/pull/15598) Refresh mentions list after plugin install/uninstall [@canvrno-oai](https://github.com/canvrno-oai)
* [#15624](https://github.com/openai/codex/pull/15624) feat: disable notifier v2 and start turn on agent interaction [@jif-oai](https://github.com/jif-oai)
* [#15605](https://github.com/openai/codex/pull/15605) [codex] Stabilize compact resume and fork snapshot flaky tests [@charley-oai](https://github.com/charley-oai)
* [#15658](https://github.com/openai/codex/pull/15658) try to fix git glitch [@jif-oai](https://github.com/jif-oai)
* [#15657](https://github.com/openai/codex/pull/15657) try to fix git glitch [@jif-oai](https://github.com/jif-oai)
* [#15656](https://github.com/openai/codex/pull/15656) try to fix git glitch [@jif-oai](https://github.com/jif-oai)
* [#15655](https://github.com/openai/codex/pull/15655) try to fix git glitch [@jif-oai](https://github.com/jif-oai)
* [#15654](https://github.com/openai/codex/pull/15654) try to fix git glitch [@jif-oai](https://github.com/jif-oai)
* [#15653](https://github.com/openai/codex/pull/15653) try to fix git glitch [@jif-oai](https://github.com/jif-oai)
* [#15652](https://github.com/openai/codex/pull/15652) try to fix git glitch [@jif-oai](https://github.com/jif-oai)
* [#15651](https://github.com/openai/codex/pull/15651) try to fix git glitch [@jif-oai](https://github.com/jif-oai)
* [#15650](https://github.com/openai/codex/pull/15650) try to fix git glitch [@jif-oai](https://github.com/jif-oai)
* [#15606](https://github.com/openai/codex/pull/15606) Pretty plugin labels, preserve plugin app provenance during MCP tool refresh [@canvrno-oai](https://github.com/canvrno-oai)
* [#15579](https://github.com/openai/codex/pull/15579) Increase voice space hold timeout to 1s [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#15093](https://github.com/openai/codex/pull/15093) core: Make FileWatcher reusable [@euroelessar](https://github.com/euroelessar)
* [#15547](https://github.com/openai/codex/pull/15547) app-server: Add back pressure and batching to `command/exec` [@euroelessar](https://github.com/euroelessar)
* [#15647](https://github.com/openai/codex/pull/15647) feat: communication pattern v2 [@jif-oai](https://github.com/jif-oai)
* [#15438](https://github.com/openai/codex/pull/15438) feat: include marketplace loading error in plugin/list [@xl-openai](https://github.com/xl-openai)
* [#15545](https://github.com/openai/codex/pull/15545) chore: use access token expiration for proactive auth refresh [@celia-oai](https://github.com/celia-oai)
* [#15530](https://github.com/openai/codex/pull/15530) chore: stop app-server auth refresh storms after permanent token failure [@celia-oai](https://github.com/celia-oai)
* [#15577](https://github.com/openai/codex/pull/15577) Trim pre-turn context updates during rollback [@charley-oai](https://github.com/charley-oai)
* [#15660](https://github.com/openai/codex/pull/15660) Hide numeric prefixes on disabled TUI list rows [@canvrno-oai](https://github.com/canvrno-oai)
* [#15644](https://github.com/openai/codex/pull/15644) fix: keep zsh-fork release assets after removing shell-tool-mcp [@bolinfest](https://github.com/bolinfest)
* [#15670](https://github.com/openai/codex/pull/15670) tui\_app\_server: tolerate missing rate limits while logged out [@etraut-openai](https://github.com/etraut-openai)
* [#15564](https://github.com/openai/codex/pull/15564) Move git utilities into a dedicated crate [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#15669](https://github.com/openai/codex/pull/15669) Clean up TUI /plugins row allignment [@canvrno-oai](https://github.com/canvrno-oai)
* [#15671](https://github.com/openai/codex/pull/15671) tui: always restore the terminal on early exit [@etraut-openai](https://github.com/etraut-openai)
* [#15672](https://github.com/openai/codex/pull/15672) tui\_app\_server: open ChatGPT login in the local browser [@etraut-openai](https://github.com/etraut-openai)
* [#15673](https://github.com/openai/codex/pull/15673) tui\_app\_server: cancel active login before Ctrl+C exit [@etraut-openai](https://github.com/etraut-openai)
* [#15676](https://github.com/openai/codex/pull/15676) Tweak /plugin menu wording [@canvrno-oai](https://github.com/canvrno-oai)
* [#15666](https://github.com/openai/codex/pull/15666) Suppress plugin-install MCP OAuth URL console spam [@canvrno-oai](https://github.com/canvrno-oai)
* [#15573](https://github.com/openai/codex/pull/15573) [plugins] Additional gating for tool suggest and apps. [@mzeng-openai](https://github.com/mzeng-openai)
* [#15665](https://github.com/openai/codex/pull/15665) Drop sandbox\_permissions from sandbox exec requests [@pakrym-oai](https://github.com/pakrym-oai)
* [#15572](https://github.com/openai/codex/pull/15572) Move string truncation helpers into codex-utils-string [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#14533](https://github.com/openai/codex/pull/14533) app-server: add filesystem watch support [@euroelessar](https://github.com/euroelessar)
* [#15674](https://github.com/openai/codex/pull/15674) Use delayed shimmer for plugin loading headers in tui and tui\_app\_server [@canvrno-oai](https://github.com/canvrno-oai)
* [#15689](https://github.com/openai/codex/pull/15689) app-server: Return codex home in initialize response [@euroelessar](https://github.com/euroelessar)
* [#15363](https://github.com/openai/codex/pull/15363) fix: keep rmcp-client env vars as OsString [@bolinfest](https://github.com/bolinfest)
* [#15700](https://github.com/openai/codex/pull/15700) Remove provenance filtering in $mentions for apps and skills from plugins [@canvrno-oai](https://github.com/canvrno-oai)
* [#15692](https://github.com/openai/codex/pull/15692) Add legal link to TUI /plugin details [@canvrno-oai](https://github.com/canvrno-oai)
* [#15351](https://github.com/openai/codex/pull/15351) Expand \~ in MDM workspace write roots [@evawong-oai](https://github.com/evawong-oai)
* [#15548](https://github.com/openai/codex/pull/15548) Extract rollout into its own crate [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#15699](https://github.com/openai/codex/pull/15699) [codex] Defer fork context injection until first turn [@charley-oai](https://github.com/charley-oai)
* [#15601](https://github.com/openai/codex/pull/15601) [app-server] Add a method to override feature flags. [@mzeng-openai](https://github.com/mzeng-openai)
* [#15708](https://github.com/openai/codex/pull/15708) TUI plugin menu cleanup - hide app ID [@canvrno-oai](https://github.com/canvrno-oai)
* [#15677](https://github.com/openai/codex/pull/15677) Fix stale quickstart integration assertion [@shaqayeq-oai](https://github.com/shaqayeq-oai)
* [#15713](https://github.com/openai/codex/pull/15713) [plugins] Flip the flags. [@mzeng-openai](https://github.com/mzeng-openai)
* [#15719](https://github.com/openai/codex/pull/15719) [plugins] Flip on additional flags. [@mzeng-openai](https://github.com/mzeng-openai)
* [#14172](https://github.com/openai/codex/pull/14172) fix: support split carveouts in windows restricted-token sandbox [@viyatb-oai](https://github.com/viyatb-oai)
* [#15714](https://github.com/openai/codex/pull/15714) Fix stale turn steering fallback in tui\_app\_server [@etraut-openai](https://github.com/etraut-openai)
* [#15722](https://github.com/openai/codex/pull/15722) [plugins] Add a flag for tool search. [@mzeng-openai](https://github.com/mzeng-openai)
* [#15734](https://github.com/openai/codex/pull/15734) Update plugin creator skill. [@xl-openai](https://github.com/xl-openai)
* [#15766](https://github.com/openai/codex/pull/15766) chore: tty metric [@jif-oai](https://github.com/jif-oai)
* [#15519](https://github.com/openai/codex/pull/15519) fix(core): default approval behavior for mcp missing annotations [@fouad-openai](https://github.com/fouad-openai)
* [#15775](https://github.com/openai/codex/pull/15775) chore: remove grep\_files handler [@jif-oai](https://github.com/jif-oai)
* [#15710](https://github.com/openai/codex/pull/15710) Use AbsolutePathBuf for cwd state [@pakrym-oai](https://github.com/pakrym-oai)
* [#15778](https://github.com/openai/codex/pull/15778) feat: rendering library v1 [@jif-oai](https://github.com/jif-oai)
* [#15758](https://github.com/openai/codex/pull/15758) fix(tui): avoid duplicate live reasoning summaries [@fcoury](https://github.com/fcoury)
* [#15773](https://github.com/openai/codex/pull/15773) chore: remove read\_file handler [@jif-oai](https://github.com/jif-oai)
* [#15776](https://github.com/openai/codex/pull/15776) feat: add multi-thread log query [@jif-oai](https://github.com/jif-oai)
* [#15744](https://github.com/openai/codex/pull/15744) Extract codex-instructions crate [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#15339](https://github.com/openai/codex/pull/15339) Add non-interactive resume filter option [@nornagon-openai](https://github.com/nornagon-openai)
* [#15746](https://github.com/openai/codex/pull/15746) Extract codex-utils-plugins crate [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#15747](https://github.com/openai/codex/pull/15747) Extract codex-plugin crate [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#15748](https://github.com/openai/codex/pull/15748) Extract codex-analytics crate [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#15707](https://github.com/openai/codex/pull/15707) Clarify codex\_home base for MDM path resolution [@evawong-oai](https://github.com/evawong-oai)
* [#15513](https://github.com/openai/codex/pull/15513) fix(tui\_app\_server): fix remote subagent switching and agent names [@fcoury](https://github.com/fcoury)
* [#14856](https://github.com/openai/codex/pull/14856) [apps][tool\_suggest] Remove tool\_suggest's dependency on tool search. [@mzeng-openai](https://github.com/mzeng-openai)
* [#14847](https://github.com/openai/codex/pull/14847) feat: add websocket auth for app-server [@viyatb-oai](https://github.com/viyatb-oai)
* [#15759](https://github.com/openai/codex/pull/15759) fix(tui\_app\_server): preserve transcript events under backpressure [@fcoury](https://github.com/fcoury)
* [#15749](https://github.com/openai/codex/pull/15749) Extract codex-core-skills crate [@aibrahim-oai](https://github.com/aibrahim-oai)
* [#15798](https://github.com/openai/codex/pull/15798) Avoid duplicate auth refreshes in `getAuthStatus` [@etraut-openai](https://github.com/etraut-openai)
* [#15659](https://github.com/openai/codex/pull/15659) Add MCP tool call spans [@nicholasclark-openai](https://github.com/nicholasclark-openai)
* [#15789](https://github.com/openai/codex/pull/15789) Treat ChatGPT `hc` plan as Enterprise [@arnavdugar-openai](https://github.com/arnavdugar-openai)
* [#15802](https://github.com/openai/codex/pull/15802) TUI plugin menu polish [@canvrno-oai](https://github.com/canvrno-oai)
* [#15785](https://github.com/openai/codex/pull/15785) Add cached environment manager for exec server URL [@pakrym-oai](https://github.com/pakrym-oai)
* [#15806](https://github.com/openai/codex/pull/15806) Add ReloadUserConfig to tui\_app\_server [@canvrno-oai](https://github.com/canvrno-oai)
* [#15810](https://github.com/openai/codex/pull/15810) app-server: Organize app-server to allow more transports [@euroelessar](https://github.com/euroelessar)
* [#15800](https://github.com/openai/codex/pull/15800) [mcp] Improve custom MCP elicitation [@mzeng-openai](https://github.com/mzeng-openai)
* [#15531](https://github.com/openai/codex/pull/15531) [hooks] add non-streaming (non-stdin style) shell-only PostToolUse support [@eternal-openai](https://github.com/eternal-openai)
* [#15820](https://github.com/openai/codex/pull/15820) [plugins] Flip flags on. [@mzeng-openai](https://github.com/mzeng-openai)
* [#15825](https://github.com/openai/codex/pull/15825) Fix quoted command rendering in tui\_app\_server [@etraut-openai](https://github.com/etraut-openai)
* [#14853](https://github.com/openai/codex/pull/14853) Wire remote app-server auth through the client [@etraut-openai](https://github.com/etraut-openai)
* [#15817](https://github.com/openai/codex/pull/15817) Expand home-relative paths on Windows [@tiffanycitra](https://github.com/tiffanycitra)
* [#15693](https://github.com/openai/codex/pull/15693) fix: fix old system bubblewrap compatibility without falling back to vendored bwrap [@viyatb-oai](https://github.com/viyatb-oai)
* [#15784](https://github.com/openai/codex/pull/15784) feat: replace askama by custom lib [@jif-oai](https://github.com/jif-oai)
* [#15851](https://github.com/openai/codex/pull/15851) feat: drop artifact tool and feature [@jif-oai](https://github.com/jif-oai)
* [#15861](https://github.com/openai/codex/pull/15861) feat: clean spawn v1 [@jif-oai](https://github.com/jif-oai)
* [#15691](https://github.com/openai/codex/pull/15691) feat: exec-server prep for unified exec [@jif-oai](https://github.com/jif-oai)
* [#15864](https://github.com/openai/codex/pull/15864) chore: drop artifacts lib [@jif-oai](https://github.com/jif-oai)
* [#15812](https://github.com/openai/codex/pull/15812) core: remove special execve handling for skill scripts [@bolinfest](https://github.com/bolinfest)
* [#15869](https://github.com/openai/codex/pull/15869) fix: flaky [@jif-oai](https://github.com/jif-oai)
* [#15877](https://github.com/openai/codex/pull/15877) chore: ask agents md not to play with PIDs [@jif-oai](https://github.com/jif-oai)
* [#15866](https://github.com/openai/codex/pull/15866) feat: use `ProcessId` in `exec-server` [@jif-oai](https://github.com/jif-oai)
* [#15829](https://github.com/openai/codex/pull/15829) [plugins] Update the suggestable plugins list. [@mzeng-openai](https://github.com/mzeng-openai)
* [#15880](https://github.com/openai/codex/pull/15880) fix: max depth agent still has v2 tools [@jif-oai](https://github.com/jif-oai)
* [#15839](https://github.com/openai/codex/pull/15839) Fix duplicate /review messages in app-server TUI [@etraut-openai](https://github.com/etraut-openai)
* [#15805](https://github.com/openai/codex/pull/15805) Add MCP connector metrics [@nicholasclark-openai](https://github.com/nicholasclark-openai)
* [#15661](https://github.com/openai/codex/pull/15661) Enable `tui\_app\_server` feature by default [@etraut-openai](https://github.com/etraut-openai)
* [#15835](https://github.com/openai/codex/pull/15835) fix: box apply\_patch test harness futures [@bolinfest](https://github.com/bolinfest)
* [#15796](https://github.com/openai/codex/pull/15796) [codex] Block unsafe git global options from safe allowlist [@adrian-openai](https://github.com/adrian-openai)
* [#15813](https://github.com/openai/codex/pull/15813) Add wildcard in the middle test coverage [@evawong-oai](https://github.com/evawong-oai)
* [#15881](https://github.com/openai/codex/pull/15881) fix: root as std agent [@jif-oai](https://github.com/jif-oai)
* [#15860](https://github.com/openai/codex/pull/15860) feat(tui): add terminal title support to tui app server [@fcoury](https://github.com/fcoury)
* [#15885](https://github.com/openai/codex/pull/15885) [mcp] Fix legacy\_tools [@mzeng-openai](https://github.com/mzeng-openai)
[
Full release on Github
](https://github.com/openai/codex/releases/tag/rust-v0.117.0)
*
2026-03-25
### Build and install plugins in Codex
Codex now supports **plugins**: installable bundles that package skills, app
integrations, and MCP server configuration for reusable workflows.
Plugins are available in the Codex app, CLI, and IDE extensions.
You can install curated plugins from the plugin directory, or scaffold a local
plugin with `@plugin-creator` and test it with workspace-scoped or home-scoped
marketplaces.
Learn more in the [plugins documentation](/codex/plugins).
#### Plugin structure
Every plugin is a folder with a required `.codex-plugin/plugin.json` manifest
and optional supporting files:
```
`my-plugin/
.codex-plugin/
plugin.json # Required: plugin manifest
skills/ # Optional: packaged skills
.app.json # Optional: app or connector mappings
.mcp.json # Optional: MCP server configuration
assets/ # Optional: icons, logos, screenshots`
```
#### Install plugins per-user or per-repo
You can install plugins for just yourself with
`\~/.agents/plugins/marketplace.json` and `\~/.codex/plugins/`, or for everyone
on a project with `.agents/plugins/marketplace.json` and a repo-local plugin
directory such as `./plugins/`.
#### Curated plugins and local development
Codex surfaces curated public plugins in the plugin directory. Codex also ships
with the built-in `@plugin-creator` skill to help you scaffold a plugin, add a
local marketplace entry, and test it before sharing it with teammates.
*
2026-03-24
### Codex app 26.323
### New features
* Added search for past Codex app threads, including a sidebar shortcut and keyboard shortcuts for jumping to recent threads.
* Added a one-click option to archive all local threads in a project.
* Synced key settings between the Codex app and the VS Code extension, and added a settings entry point in the extension.
### Performance improvements and bug fixes
* Additional performance improvements and bug fixes.
*
2026-03-19
### Codex app 26.318
### New features
* Added skills to the `@` menu so you can insert them from the composer alongside other mentions.
* `Cmd/Ctrl+F` now starts with your current text selection, which makes searching reviews and diffs faster.
### Performance improvements and bug fixes
* Additional performance improvements and bug fixes.
*
2026-03-18
### Codex app 26.317
### New features
* You can now fork a conversation from an earlier message, not just the latest turn.
* Added slash commands for switching models and reasoning levels, and made slash commands work in the middle of a draft prompt.
* Added notifications for plan mode questions so it’s easier to notice when Codex needs input.
### Performance improvements and bug fixes
* Fixed thread handoff and subagent navigation issues across worktrees and the VS Code extension.
* Additional performance improvements and bug fixes.
*
2026-03-17
### Introducing GPT-5.4 mini in Codex
GPT-5.4 mini is now available in Codex as a fast, efficient model for lighter
coding tasks and subagents.
It improves over GPT-5 mini across coding, reasoning, image understanding, and
tool use while running more than 2x faster. In Codex, GPT-5.4 mini uses 30% as
much of your included limits as GPT-5.4, so comparable tasks can last about
3.3x longer before you hit those limits.
GPT-5.4 mini is available in the Codex app, the CLI, the IDE extension, and
Codex on the web. GPT-5.4 mini is also available in the API.
Use GPT-5.4 mini for codebase exploration, large-file review, processing
supporting documents, and other less reasoning-intensive subagent work. For
more complex planning, coordination, and final judgment, start with GPT-5.4.
To switch to GPT-5.4 mini:
* In the CLI, start a new thread with:
```
`codex --model gpt-5.4-mini`
```
Or use `/model` during a session.
* In the IDE extension, choose GPT-5.4 mini from the model selector in the
composer.
* In the Codex app, choose GPT-5.4 mini from the model selector in the
composer.
If you don’t see GPT-5.4 mini yet, update the CLI, IDE extension, or Codex app
to the latest version.
*
2026-03-16
### Codex app 26.313
### New features
* Added back and forward buttons in the header so you can move between recent screens more quickly.
* Added an **Open in Finder**, **Open in Explorer**, or **Open in File Manager** action from thread menus to jump straight to a thread’s project folder.
### Performance improvements and bug fixes
* Improved resume and thread error toasts with clearer details when something goes wrong.
* Additional performance improvements and bug fixes.
*
2026-03-12
### Codex app 26.312
### Themes
Change the Codex app appearance in **Settings** by choosing a base theme,
adjusting accent, background, and foreground colors, and changing the UI and
code fonts. You can also share your custom theme with friends.
### Revamped Automations
You can now choose whether automations run locally or on a worktree, define
custom reasoning levels and models, and use templates to find inspiration for
new automations.
### Performance improvements and bug fixes
Various bug fixes and performance improvements.
*
2026-03-11
### Codex app 26.311
### New features
* Codex can now read the integrated terminal for the current thread, so it can check the status of a running development server or refer back to failed build output while it works with you.
### Performance improvements and bug fixes
* Additional performance improvements and bug fixes.
*
2026-03-05
### Introducing GPT-5.4 in Codex
GPT-5.4 is now available in Codex as OpenAI’s most capable and efficient
frontier model for professional work.
It combines recent advances in reasoning, coding, and agentic workflows in one
model, and it’s the recommended choice for most Codex tasks.
In Codex, GPT-5.4 is the first general-purpose model with native computer-use
capabilities. GPT-5.4 in Codex includes experimental support for the 1M
context window. It supports complex workflows across applications and
long-horizon tasks, with stronger tool use and tool search that help agents
find and use the right tools more efficiently.
GPT-5.4 is available everywhere you can use Codex: the Codex app, the CLI, the
IDE extension, and Codex Cloud on the web. GPT-5.4 is also available in the
API.
To switch to GPT-5.4:
* In the CLI, start a new thread with:
```
`codex --model gpt-5.4`
```
Or use `/model` during a session.
* In the IDE extension, choose GPT-5.4 from the model selector in the
composer.
* In the Codex app, choose GPT-5.4 from the model selector in the composer.
If you don’t see GPT-5.4 yet, update the CLI, IDE extension, or Codex app to
the latest version.
*
2026-03-05
### Codex app 26.305
### Performance improvements and bug fixes
* Improved remote connections with clearer connection errors, better status updates, and clearer host labels in thread and settings views.
* Fixed copy and paste shortcuts in the integrated terminal on Windows.
* Fixed an issue where archived pinned threads could reappear in the sidebar.
* Fixed an issue where repeated `codex://new` links could stop prefilling a new conversation when the app was already open.
* Additional performance improvements and bug fixes.
*
2026-03-04
### Codex app 26.304
#### Codex app for Windows
The Codex app is now available on Windows. The app gives you one interface
for working across projects, running parallel agent threads, and reviewing
results in one place.
The Codex app runs natively on Windows using PowerShell and a native Windows
sandbox for bounded permissions, so you can use Codex on Windows without
moving your workflow into WSL, onto a virtual machine, or by deactivating the
sandbox.
The Windows app includes the same core features as the rest of the Codex app:
* [Skills](/codex/app/features#skills-support) to discover and extend Codex
capabilities.
* [Automations](/codex/app/automations) to run work in the background.
* [Worktrees](/codex/app/worktrees) to handle independent tasks in the same
project.
If you prefer to develop in WSL, you can also switch the Codex agent and the
integrated terminal to run there.
Download it from the
[Microsoft Store](https://get.microsoft.com/installer/download/9PLM9XGG6VKS?cid=website_cta_psi)
and sign in with your ChatGPT account or an API key. For setup and
configuration details, see [Setup](/codex/app/windows#setup), [Use WSL with the
Codex app](/codex/app/windows#use-wsl-with-the-codex-app), and [Customize the
app for your development setup](/codex/app/windows#customize-the-app-for-your-development-setup).
*
2026-03-03
### Codex app 26.303
### New features
* Added a Worktrees setting to turn automatic cleanup of Codex-managed worktrees on or off.
* Added Handoff support for moving a thread between Local and [Worktree](/codex/app/worktrees).
* Added an explicit English option in the language menu.
### Performance improvements and bug fixes
* Improved GitHub and pull request workflows.
* Improved approval prompts and app connection sign-in flows.
* Additional performance improvements and bug fixes.
## February 2026
*
2026-02-28
### Codex app 26.228
### Performance improvements and bug fixes
* Fixed a regression where conversation and task views could stop updating while Codex was streaming a response.
* Additional performance improvements and bug fixes.
*
2026-02-27
### Codex app 26.227
### New features
* Added pull request status badges in task rows and PR buttons, including draft, open, merged, and closed states.
* Added a Worktrees setting to choose how many Codex-managed worktrees to keep before older ones are cleaned up.
### Performance improvements and bug fixes
* Improved scrolling and navigation in long conversations and code review, including fixes for thread jumpiness, sidebar jitter, and diff scrolling.
* Improved app startup reliability and keyboard zoom behavior.
* Additional performance improvements and bug fixes.
*
2026-02-26
### Codex app 26.226
### New features
* Added new MCP shortcuts in the composer, including install keyword suggestions and an MCP server submenu in **Add context**.
* Added support for `@mentions` and skill mentions in inline review comments.
### Performance improvements and bug fixes
* Improved rendering of MCP tool calls and Mermaid diagram error handling.
* Fixed an issue where stopped terminal commands could continue appearing as running.
* Additional performance improvements and bug fixes.
*
2026-02-17
### Codex app 26.217
### New features
* Added drag-and-drop support to reorder queued messages.
* Added a warning when the selected model is downgraded.
### Improvements and bug fixes
* Improved file workflows with fuzzy file search and better attachment recovery after restart.
* Additional performance improvements and bug fixes.
*
2026-02-12
### Introducing GPT-5.3-Codex-Spark
[Today, we’re releasing a research preview of GPT-5.3-Codex-Spark](https://openai.com/index/introducing-gpt-5-3-codex-spark/),
a smaller version of GPT-5.3-Codex and our first model designed for real-time
coding. Codex-Spark is optimized to feel near-instant, delivering more than 1000 tokens per second while remaining highly capable for real-world coding tasks.
Codex-Spark is available in research preview for ChatGPT Pro users in
the latest Codex app, CLI, and IDE extension. This release also marks the first
milestone in our partnership with Cerebras.
At launch, Codex-Spark is text-only with a 128k context window. During
the research preview, usage has separate model-specific limits and doesn’t
count against standard Codex limits. During high demand, access may slow down
or queue while we balance reliability across users.
To switch to GPT-5.3-Codex-Spark:
* In the CLI, start a new thread with:
```
`codex --model gpt-5.3-codex-spark`
```
Or use `/model` during a session.
* In the IDE extension, choose GPT-5.3-Codex-Spark from the model selector in
the composer.
* In the Codex app, choose GPT-5.3-Codex-Spark from the model selector in the
composer.
If you don’t see GPT-5.3-Codex-Spark yet, update the CLI, IDE extension, or
Codex app to the latest version.
GPT-5.3-Codex-Spark isn’t available in the API at launch.
For API-key workflows, continue using `gpt-5.2-codex`.
*
2026-02-12
### Codex app 26.212
### New features
* Support for GPT-5.3-Codex-Spark
* Added conversation forking
* Added [floating pop-out window](/codex/app/features#floating-pop-out-window) to take a conversation with you
### Bug fixes
* Improved performance and bug fixes
Alpha testing for the Codex app on Windows is also starting. [Sign up here](https://openai.com/form/codex-app/) to be a potential alpha tester.
*
2026-02-10
### Codex app 26.210
### New features
* Added branch search in the branch picker.
* Added clearer guidance for entering plan mode when you type `plan` in the composer.
* Added support for parallel approvals.
### Improvements and bug fixes
* Additional performance improvements and bug fixes.
*
2026-02-09
### GPT-5.3-Codex in Cursor and VS Code
Starting today, GPT-5.3-Codex is available natively in Cursor and VS Code.
API access is starting with a small set of customers as part of a phased
release.
This is the first model treated as a high security capability under the
Preparedness Framework.
Safety controls will continue to scale, and API access will expand over the
next few weeks.
*
2026-02-08
### Codex app 26.208
### New features
* Added MCP and personality actions to the command palette.
* Updated follow-up behavior to queue by default.
### Improvements and bug fixes
* Additional performance improvements and bug fixes.
*
2026-02-06
### Codex app 26.206
### New features
* Added a file-reference action to reveal files directly in your OS file manager.
### Improvements and bug fixes
* Improved handling of large reviews by removing the overall diff-size cap in the review pane.
* Additional performance improvements and bug fixes.
*
2026-02-05
### Introducing GPT-5.3-Codex
[Today we’re releasing GPT-5.3-Codex](https://openai.com/index/introducing-gpt-5-3-codex/),
the most capable agentic coding model to date for complex, real-world software
engineering.
GPT-5.3-Codex combines the frontier coding performance of GPT-5.2-Codex with
stronger reasoning and professional knowledge capabilities, and runs 25% faster
for Codex users. It’s also better at collaboration while the agent is
working—delivering more frequent progress updates and responding to steering in
real time.
GPT-5.3-Codex is available with paid ChatGPT plans everywhere you can use
Codex: the Codex app, the CLI, the IDE extension, and Codex Cloud on the web.
API access for the model will come soon.
To switch to GPT-5.3-Codex:
* In the CLI, start a new thread with:
```
`codex --model gpt-5.3-codex`
```
Or use `/model` during a session.
* In the IDE extension, make sure you are signed in with ChatGPT, then choose
GPT-5.3-Codex from the model selector in the composer.
* In the Codex app, make sure you are signed in with ChatGPT, then choose
GPT-5.3-Codex from the model selector in the composer.
* If you don’t see GPT-5.3-Codex, update the CLI, IDE extension, or Codex app
to the latest version.
For API-key workflows, continue using `gpt-5.2-codex` while API support rolls
out.
*
2026-02-05
### Codex app 26.205
### New features
* Support for **[GPT-5.3-Codex](https://openai.com/index/introducing-gpt-5-3-codex/)**.
* Added mid-turn steering. Submit a message while Codex is working to direct its behavior.
* Attach or drop any file type.
### Bug fixes
* Fix flickering of the app.
*
2026-02-04
### Codex app 26.204
### New features
* Added **Zed** and **Textmate** as options to open files and folders.
* Added PDF preview in the review panel.
### Bug fixes
* Performance improvements.
*
2026-02-03
### Codex app 26.203
### New features
* Added thread renaming on double-click in the thread list.
### Improvements and bug fixes
* Renamed **Sync** to **Handoff** and added clearer source/destination stats in the handoff UI.
* Additional performance improvements and bug fixes.
*
2026-02-02
### Introducing the Codex app
#### Codex app
The Codex app for macOS is a desktop interface for running agent threads in parallel and collaborating with agents on long-running tasks. It includes a project sidebar, thread list, and review pane for tracking work across projects.
Key features:
* [Multitask across projects](/codex/app/features#multitask-across-projects)
* [Built-in worktree support](/codex/app/worktrees)
* [Voice dictation](/codex/app/features#voice-dictation)
* [Built-in Git tooling](/codex/app/features#built-in-git-tools)
* [Skills](/codex/app/features#skills-support)
* [Automations](/codex/app/automations)
For a limited time, **ChatGPT Free and Go include Codex**, and **Plus, Pro, Business, Enterprise, and Edu** plans get **double rate limits**. Those higher limits apply in the app, the CLI, your IDE, and the cloud.
Learn more in the [Introducing the Codex app](https://openai.com/index/introducing-the-codex-app/) blog post.
Check out the [Codex app documentation](/codex/app) for more.
[ Get started with the Codex app ](https://persistent.oaistatic.com/codex-app-prod/Codex.dmg)
## January 2026
*
2026-01-28
### Web search is now enabled by default
Codex now enables web search for local tasks in the Codex CLI and IDE Extension.
By default, Codex uses a web search cache, which is an OpenAI-maintained index of web results. Cached mode returns pre-indexed results instead of fetching live pages, while live mode fetches the most recent data from the web. If you are using `--yolo` or another [full access sandbox setting](/codex/agent-approvals-security), web search defaults to live results. To disable this behavior or switch modes, use the `web\_search` configuration option:
* `web\_search = "cached"` (default; serves results from the web search cache)
* `web\_search = "live"` (fetches the most recent data from the web; same as `--search`)
* `web\_search = "disabled"` to remove the tool
To learn more, check out the [configuration documentation](/codex/config-basic).
*
2026-01-23
### Team Config for shared configuration
Team Config groups the files teams use to standardize Codex across repositories and machines. Use it to share:
* `config.toml` defaults
* `rules/` for command controls outside the sandbox
* `skills/` for reusable workflows
Codex loads these layers from `.codex/` folders in the current working directory, parent folders, and the repo root, plus user (`\~/.codex/`) and system (`/etc/codex/`) locations. Higher-precedence locations override lower-precedence ones.
Admins can still enforce constraints with `requirements.toml`, which overrides defaults regardless of location.
Learn more in [Team Config](/codex/enterprise/admin-setup#team-config).
*
2026-01-22
### Custom prompts deprecated
Custom prompts are now deprecated. Use [skills](/codex/skills) for reusable instructions and workflows instead.
*
2026-01-14
### GPT-5.2-Codex API availability
GPT-5.2-Codex is now available in the API and for users who sign into Codex with the API.
To learn more about using GPT-5.2-Codex check out our [API documentation](https://platform.openai.com/docs/models/gpt-5.2-codex).
## December 2025
*
2025-12-19
### Agent skills in Codex
Codex now supports **agent skills**: reusable bundles of instructions (plus optional scripts and resources) that help Codex reliably complete specific tasks.
Skills are available in both the Codex CLI and IDE extensions.
You can invoke a skill explicitly by typing `$skill-name` (for example, `$skill-installer` or the experimental `$create-plan` skill after installing it), or let Codex select a skill automatically based on your prompt.
Learn more in the [skills documentation](/codex/skills).
#### Folder-based standard (agentskills.io)
Following the open [agent skills specification](https://agentskills.io/specification), a skill is a folder with a required `SKILL.md` and optional supporting files:
```
`my-skill/
SKILL.md # Required: instructions + metadata
scripts/ # Optional: executable code
references/ # Optional: documentation
assets/ # Optional: templates, resources`
```
#### Install skills per-user or per-repo
You can install skills for just yourself in `\~/.codex/skills`, or for everyone on a project by checking them into `.codex/skills` in the repository.
Codex also ships with a few built-in system skills to get started, including `$skill-creator` and `$skill-installer`. The `$create-plan` skill is experimental and needs to be installed (for example: `$skill-installer install the create-plan skill from the .experimental folder`).
#### Curated skills directory
Codex ships with a [small curated set of skills](https://github.com/openai/skills) inspired by popular workflows at OpenAI. Install them with `$skill-installer`, and expect more over time.
*
2025-12-18
### Introducing GPT-5.2-Codex
[Today we are releasing GPT-5.2-Codex](https://openai.com/index/gpt-5-2-codex), the most advanced agentic coding model yet for complex, real-world software engineering.
GPT-5.2-Codex is a version of [GPT-5.2](https://openai.com/index/introducing-gpt-5-2/) further optimized for agentic coding in Codex, including improvements on long-horizon work through context compaction, stronger performance on large code changes like refactors and migrations, improved performance in Windows environments, and significantly stronger cybersecurity capabilities.
Starting today, the CLI and IDE Extension will default to `gpt-5.2-codex` for users who are signed in with ChatGPT. API access for the model will come soon.
If you have a model specified in your [`config.toml` configuration file](/codex/local-config), you can instead try out `gpt-5.2-codex` for a new Codex CLI session using:
```
`codex --model gpt-5.2-codex`
```
You can also use the `/model` slash command in the CLI. In the Codex IDE Extension you can select GPT-5.2-Codex from the dropdown menu.
If you want to switch for all sessions, you can change your default model to `gpt-5.2-codex` by updating your `config.toml` [configuration file](/codex/local-config):
```
`model = "gpt-5.2-codex”`
```
*
2025-12-04
### Introducing Codex for Linear
Assign or mention @Codex in an issue to kick-off a Codex cloud task. As Codex works, it posts updates back to Linear, providing a link to the completed task so you can review, open a PR, or keep working.
To learn more about how to connect Codex to Linear both locally through MCP and through the new integration, check out the [Codex for Linear documentation](/codex/integrations/linear).
## November 2025
*
2025-11-24
### Usage and credits fixes
Minor updates to address a few issues with Codex usage and credits:
* Adjusted all usage dashboards to show “limits remaining” for consistency. The CLI previously displayed “limits used.”
* Fixed an issue preventing users from buying credits if their ChatGPT subscription was purchased via iOS or Google Play.
* Fixed an issue where the CLI could display stale usage information; it now refreshes without needing to send a message first.
* Optimized the backend to help smooth out usage throughout the day, irrespective of overall Codex load or how traffic is routed. Before, users could get unlucky and hit a few cache misses in a row, leading to much less usage.
*
2025-11-18
### Introducing GPT-5.1-Codex-Max
[Today we are releasing GPT-5.1-Codex-Max](https://openai.com/index/gpt-5-1-codex-max), our new frontier agentic coding model.
GPT‑5.1-Codex-Max is built on an update to our foundational reasoning model, which is trained on agentic tasks across software engineering, math, research, and more. GPT‑5.1-Codex-Max is faster, more intelligent, and more token-efficient at every stage of the development cycle–and a new step towards becoming a reliable coding partner.
Starting today, the CLI and IDE Extension will default to `gpt-5.1-codex-max` for users that are signed in with ChatGPT. API access for the model will come soon.
For non-latency-sensitive tasks, we’ve also added a new Extra High (`xhigh`) reasoning effort, which lets the model think for an even longer period of time for a better answer. We still recommend medium as your daily driver for most tasks.
If you have a model specified in your [`config.toml` configuration file](/codex/local-config), you can instead try out `gpt-5.1-codex-max` for a new Codex CLI session using:
```
`codex --model gpt-5.1-codex-max`
```
You can also use the `/model` slash command in the CLI. In the Codex IDE Extension you can select GPT-5.1-Codex from the dropdown menu.
If you want to switch for all sessions, you can change your default model to `gpt-5.1-codex-max` by updating your `config.toml` [configuration file](/codex/local-config):
```
`model = "gpt-5.1-codex-max”`
```
*
2025-11-13
### Introducing GPT-5.1-Codex and GPT-5.1-Codex-Mini
Along with the [GPT-5.1 launch in the API](https://openai.com/index/gpt-5-1-for-developers/), we are introducing new `gpt-5.1-codex-mini` and `gpt-5.1-codex` model options in Codex, a version of GPT-5.1 optimized for long-running, agentic coding tasks and use in coding agent harnesses in Codex or Codex-like harnesses.
Starting today, the CLI and IDE Extension will default to `gpt-5.1-codex` on macOS and Linux and `gpt-5.1` on Windows.
If you have a model specified in your [`config.toml` configuration file](/codex/local-config), you can instead try out `gpt-5.1-codex` for a new Codex CLI session using:
```
`codex --model gpt-5.1-codex`
```
You can also use the `/model` slash command in the CLI. In the Codex IDE Extension you can select GPT-5.1-Codex from the dropdown menu.
If you want to switch for all sessions, you can change your default model to `gpt-5.1-codex` by updating your `config.toml` [configuration file](/codex/local-config):
```
`model = "gpt-5.1-codex”`
```
*
2025-11-07
### Introducing GPT-5-Codex-Mini
Today we are introducing a new `gpt-5-codex-mini` model option to Codex CLI and the IDE Extension. The model is a smaller, more cost-effective, but less capable version of `gpt-5-codex` that provides approximately 4x more usage as part of your ChatGPT subscription.
Starting today, the CLI and IDE Extension will automatically suggest switching to `gpt-5-codex-mini` when you reach 90% of your 5-hour usage limit, to help you work longer without interruptions.
You can try the model for a new Codex CLI session using:
```
`codex --model gpt-5-codex-mini`
```
You can also use the `/model` slash command in the CLI. In the Codex IDE Extension you can select GPT-5-Codex-Mini from the dropdown menu.
Alternatively, you can change your default model to `gpt-5-codex-mini` by updating your `config.toml` [configuration file](/codex/local-config):
```
`model = "gpt-5-codex-mini”`
```
*
2025-11-06
### GPT-5-Codex model update
We’ve shipped a minor update to GPT-5-Codex:
* More reliable file edits with `apply\_patch`.
* Fewer destructive actions such as `git reset`.
* More collaborative behavior when encountering user edits in files.
* 3% more efficient in time and usage.
## October 2025
*
2025-10-30
### Credits on ChatGPT Pro and Plus
Codex users on ChatGPT Plus and Pro can now use on-demand credits for more Codex usage beyond what’s included in your plan. [Learn more.](/codex/pricing)
*
2025-10-22
### Tag @Codex on GitHub Issues and PRs
You can now tag `@codex` on a teammate’s pull request to ask clarifying questions, request a follow-up, or ask Codex to make changes. GitHub Issues now also support `@codex` mentions, so you can kick off tasks from any issue, without leaving your workflow.
*
2025-10-06
### Codex is now GA
Codex is now generally available with 3 new features — @Codex in Slack, Codex SDK, and new admin tools.
#### @Codex in Slack
You can now questions and assign tasks to Codex directly from Slack. See the [Slack guide](/codex/integrations/slack) to get started.
#### Codex SDK
Integrate the same agent that powers the Codex CLI inside your own tools and workflows with the Codex SDK in Typescript. With the new Codex GitHub Action, you can easily add Codex to CI/CD workflows. See the [Codex SDK guide](/codex/sdk) to get started.
```
`import { Codex } from "@openai/codex-sdk";
const agent = new Codex();
const thread = await agent.startThread();
const result = await thread.run("Explore this repo");
console.log(result);
const result2 = await thread.run("Propose changes");
console.log(result2);`
```
#### New admin controls and analytics
ChatGPT workspace admins can now edit or delete Codex Cloud environments. With managed config files, they can set safe defaults for CLI and IDE usage and monitor how Codex uses commands locally. New analytics dashboards help you track Codex usage and code review feedback. Learn more in the [enterprise admin guide.](/codex/enterprise/admin-setup)
#### Availability and pricing updates
The Slack integration and Codex SDK are available to developers on ChatGPT Plus, Pro, Business, Edu, and Enterprise plans starting today, while the new admin features will be available to Business, Edu, and Enterprise.
Beginning October 20, Codex Cloud tasks will count toward your Codex usage. Review the [Codex pricing guide](/codex/pricing) for plan-specific details.
## September 2025
*
2025-09-23
### GPT-5-Codex in the API
GPT-5-Codex is now available in the Responses API, and you can also use it with your API Key in the Codex CLI.
We plan on regularly updating this model snapshot.
It is available at the same price as GPT-5. You can learn more about pricing and rate limits for this model on our [model page](https://platform.openai.com/docs/models/gpt-5-codex).
*
2025-09-15
### Introducing GPT-5-Codex
#### New model: GPT-5-Codex
GPT-5-Codex is a version of GPT-5 further optimized for agentic coding in Codex.
It’s available in the IDE extension and CLI when you sign in with your ChatGPT account.
It also powers the cloud agent and Code Review in GitHub.
To learn more about GPT-5-Codex and how it performs compared to GPT-5 on software engineering tasks, see our [announcement blog post](https://openai.com/index/introducing-upgrades-to-codex/).
#### Image outputs
When working in the cloud on front-end engineering tasks, GPT-5-Codex can now display screenshots of the UI in Codex web for you to review. With image output, you can iterate on the design without needing to check out the branch locally.
#### New in Codex CLI
* You can now resume sessions where you left off with `codex resume`.
* Context compaction automatically summarizes the session as it approaches the context window limit.
Learn more in the [latest release notes](https://github.com/openai/codex/releases/tag/rust-v0.36.0)
## August 2025
*
2025-08-27
### Late August update
#### IDE extension (Compatible with VS Code, Cursor, Windsurf)
Codex now runs in your IDE with an interactive UI for fast local iteration. Easily switch between modes and reasoning efforts.
#### Sign in with ChatGPT (IDE & CLI)
One-click authentication that removes API keys and uses ChatGPT Enterprise credits.
#### Move work between local ↔ cloud
Hand off tasks to Codex web from the IDE with the ability to apply changes locally so you can delegate jobs without leaving your editor.
#### Code Reviews
Codex goes beyond static analysis. It checks a PR against its intent, reasons across the codebase and dependencies, and can run code to validate the behavior of changes.
*
2025-08-21
### Mid August update
#### Image inputs
You can now attach images to your prompts in Codex web. This is great for asking Codex to implement frontend changes or follow up on whiteboarding sessions.
#### Container caching
Codex now caches containers to start new tasks and followups 90% faster, dropping the median start time from 48 seconds to 5 seconds. You can optionally configure a maintenance script to update the environment from its cached state to prepare for new tasks. See the docs for more.
#### Automatic environment setup
Now, environments without manual setup scripts automatically run the standard installation commands for common package managers like yarn, pnpm, npm, go mod, gradle, pip, poetry, uv, and cargo. This reduces test failures for new environments by 40%.
## June 2025
*
2025-06-13
### Best of N
Codex can now generate multiple responses simultaneously for a single task, helping you quickly explore possible solutions to pick the best approach.
#### Fixes & improvements
* Added some keyboard shortcuts and a page to explore them. Open it by pressing ⌘-/ on macOS and Ctrl+/ on other platforms.
* Added a “branch” query parameter in addition to the existing “environment”, “prompt” and “tab=archived” parameters.
* Added a loading indicator when downloading a repo during container setup.
* Added support for cancelling tasks.
* Fixed issues causing tasks to fail during setup.
* Fixed issues running followups in environments where the setup script changes files that are gitignored.
* Improved how the agent understands and reacts to network access restrictions.
* Increased the update rate of text describing what Codex is doing.
* Increased the limit for setup script duration to 20 minutes for Pro and Business users.
* Polished code diffs: You can now option-click a code diff header to expand/collapse all of them.
*
2025-06-03
### June update
#### Agent internet access
Now you can give Codex access to the internet during task execution to install dependencies, upgrade packages, run tests that need external resources, and more.
Internet access is off by default. Plus, Pro, and Business users can enable it for specific environments, with granular control of which domains and HTTP methods Codex can access. Internet access for Enterprise users is coming soon.
Learn more about usage and risks in the [docs](/codex/cloud/agent-internet).
#### Update existing PRs
Now you can update existing pull requests when following up on a task.
#### Voice dictation
Now you can dictate tasks to Codex.
#### Fixes & improvements
* Added a link to this changelog from the profile menu.
* Added support for binary files: When applying patches, all file operations are supported. When using PRs, only deleting or renaming binary files is supported for now.
* Fixed an issue on iOS where follow up tasks where shown duplicated in the task list.
* Fixed an issue on iOS where pull request statuses were out of date.
* Fixed an issue with follow ups where the environments were incorrectly started with the state from the first turn, rather than the most recent state.
* Fixed internationalization of task events and logs.
* Improved error messages for setup scripts.
* Increased the limit on task diffs from 1 MB to 5 MB.
* Increased the limit for setup script duration from 5 to 10 minutes.
* Polished GitHub connection flow.
* Re-enabled Live Activities on iOS after resolving an issue with missed notifications.
* Removed the mandatory two-factor authentication requirement for users using SSO or social logins.
## May 2025
*
2025-05-22
### Reworked environment page
It’s now easier and faster to set up code execution.
#### Fixes & improvements
* Added a button to retry failed tasks
* Added indicators to show that the agent runs without network access after setup
* Added options to copy git patches after pushing a PR
* Added support for unicode branch names
* Fixed a bug where secrets were not piped to the setup script
* Fixed creating branches when there’s a branch name conflict.
* Fixed rendering diffs with multi-character emojis.
* Improved error messages when starting tasks, running setup scripts, pushing PRs, or disconnected from GitHub to be more specific and indicate how to resolve the error.
* Improved onboarding for teams.
* Polished how new tasks look while loading.
* Polished the followup composer.
* Reduced GitHub disconnects by 90%.
* Reduced PR creation latency by 35%.
* Reduced tool call latency by 50%.
* Reduced task completion latency by 20%.
* Started setting page titles to task names so Codex tabs are easier to tell apart.
* Tweaked the system prompt so that agent knows it’s working without network, and can suggest that the user set up dependencies.
* Updated the docs.
*
2025-05-19
### Codex in the ChatGPT iOS app
Start tasks, view diffs, and push PRs—while you’re away from your desk.