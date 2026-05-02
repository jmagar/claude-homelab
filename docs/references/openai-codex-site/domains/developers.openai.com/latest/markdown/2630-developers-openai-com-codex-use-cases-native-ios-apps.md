Build for iOS | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Build for iOS
Use Codex to scaffold, build, and debug SwiftUI apps for iPhone and iPad.
Difficulty **Advanced**
Time horizon **1h**
Use Codex to scaffold iOS SwiftUI projects, keep the build loop CLI-first with `xcodebuild` or Tuist, and add XcodeBuildMCP or focused SwiftUI skills when the work gets deeper.
## Best for
* Greenfield iOS SwiftUI apps where you want Codex to scaffold the app and build loop from scratch
* Existing iPhone and iPad projects where Codex needs schemes, simulator output, screenshots, or UI automation before the work is done
* Teams that want long-running iOS UI tasks to stay agentic and CLI-first instead of depending on the Xcode GUI
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/native-ios-apps/?export=pdf)
Use Codex to scaffold iOS SwiftUI projects, keep the build loop CLI-first with `xcodebuild` or Tuist, and add XcodeBuildMCP or focused SwiftUI skills when the work gets deeper.
Advanced
1h
Related links
[ Model Context Protocol ](/codex/mcp)[ Agent skills ](/codex/skills)
##
Best for
* Greenfield iOS SwiftUI apps where you want Codex to scaffold the app and build loop from scratch
* Existing iPhone and iPad projects where Codex needs schemes, simulator output, screenshots, or UI automation before the work is done
* Teams that want long-running iOS UI tasks to stay agentic and CLI-first instead of depending on the Xcode GUI
##
Skills & Plugins
*
[ Build iOS Apps ](https://github.com/openai/plugins/tree/main/plugins/build-ios-apps)
Build or refactor SwiftUI UI, adopt modern iOS patterns such as Liquid Glass, audit runtime performance, and debug apps on simulators with XcodeBuildMCP-backed workflows.
|
Skill
|
Why use it
|
|[ Build iOS Apps ](https://github.com/openai/plugins/tree/main/plugins/build-ios-apps)| Build or refactor SwiftUI UI, adopt modern iOS patterns such as Liquid Glass, audit runtime performance, and debug apps on simulators with XcodeBuildMCP-backed workflows. |
##
Starter prompt
Scaffold a starter SwiftUI app and add a build-and-launch script I can wire to a `Build` action in my local environment.
Constraints:
- Stay CLI-first. Prefer Apple's `xcodebuild`; if a cleaner setup helps, it's okay to use Tuist.
- If this repo already contains a full Xcode project, use XcodeBuildMCP to list targets, pick the right scheme, build, launch, and capture screenshots while you iterate.
- Reuse existing models, navigation patterns, and shared utilities when they already exist.
- Keep the app focused on iPhone and iPad unless I explicitly ask for a shared Apple-platform implementation.
- Use a small trustworthy validation loop after each change, then expand to broader builds only when the narrower check passes.
- Tell me whether you treated this as a greenfield scaffold or an existing-project change.
Deliver:
- the app scaffold or requested feature slice
- a small build-and-launch script with the exact commands
- the smallest relevant validation steps you ran
- the exact scheme, simulator, and checks you used
[Open in the Codex app](<codex://new?prompt=Scaffold+a+starter+SwiftUI+app+and+add+a+build-and-launch+script+I+can+wire+to+a+`Build`+action+in+my+local+environment.
Constraints:
-+Stay+CLI-first.+Prefer+Apple's+`xcodebuild`;+if+a+cleaner+setup+helps,+it's+okay+to+use+Tuist.
-+If+this+repo+already+contains+a+full+Xcode+project,+use+XcodeBuildMCP+to+list+targets,+pick+the+right+scheme,+build,+launch,+and+capture+screenshots+while+you+iterate.
-+Reuse+existing+models,+navigation+patterns,+and+shared+utilities+when+they+already+exist.
-+Keep+the+app+focused+on+iPhone+and+iPad+unless+I+explicitly+ask+for+a+shared+Apple-platform+implementation.
-+Use+a+small+trustworthy+validation+loop+after+each+change,+then+expand+to+broader+builds+only+when+the+narrower+check+passes.
-+Tell+me+whether+you+treated+this+as+a+greenfield+scaffold+or+an+existing-project+change.
Deliver:
-+the+app+scaffold+or+requested+feature+slice
-+a+small+build-and-launch+script+with+the+exact+commands
-+the+smallest+relevant+validation+steps+you+ran
-+the+exact+scheme,+simulator,+and+checks+you+used>)
Scaffold a starter SwiftUI app and add a build-and-launch script I can wire to a `Build` action in my local environment.
Constraints:
- Stay CLI-first. Prefer Apple's `xcodebuild`; if a cleaner setup helps, it's okay to use Tuist.
- If this repo already contains a full Xcode project, use XcodeBuildMCP to list targets, pick the right scheme, build, launch, and capture screenshots while you iterate.
- Reuse existing models, navigation patterns, and shared utilities when they already exist.
- Keep the app focused on iPhone and iPad unless I explicitly ask for a shared Apple-platform implementation.
- Use a small trustworthy validation loop after each change, then expand to broader builds only when the narrower check passes.
- Tell me whether you treated this as a greenfield scaffold or an existing-project change.
Deliver:
- the app scaffold or requested feature slice
- a small build-and-launch script with the exact commands
- the smallest relevant validation steps you ran
- the exact scheme, simulator, and checks you used
## Scaffold the app and build loop
For greenfield work, start with plain prompting. Ask Codex to scaffold a starter iOS SwiftUI app and write a small build-and-launch script you can wire to a `Build` action in a [local environment](/codex/app/local-environments).
Keep the loop CLI-first. Apple’s `xcodebuild` can list schemes and handle build, test, archive, `build-for-testing`, and `test-without-building` actions from the terminal, which lets Codex stay in an agentic loop instead of bouncing into the Xcode GUI.
If you want a cleaner project generator and you’re comfortable with third-party tooling, [Tuist](https://tuist.dev/) is a good next step. It can generate and build Xcode projects without needing the GUI, while still letting Codex build and launch the app from the terminal.
Use [XcodeBuildMCP](https://www.xcodebuildmcp.com/) once you’re inside a full Xcode project and need deeper automation. That’s when schemes, targets, simulator control, screenshots, logs, and UI interaction matter enough that plain shell commands stop being the whole story.
## Leverage skills
For the first pass, you often don’t need a skill or MCP server. Add skills once the work gets specialized or you want stronger SwiftUI conventions baked into the run.
* [SwiftUI expert](https://github.com/AvdLee/SwiftUI-Agent-Skill) is a strong general-purpose SwiftUI skill with a lot of best practices already baked in.
* [SwiftUI Pro](https://github.com/twostraws/SwiftUI-Agent-Skill/blob/main/swiftui-pro/SKILL.md) is a broad SwiftUI review skill for modern APIs, maintainability, accessibility, and performance.
* [Liquid Glass expert](https://github.com/Dimillian/Skills/blob/main/swiftui-liquid-glass/SKILL.md) helps Codex adopt the new iOS 26 Liquid Glass APIs and tune custom components so they fit the latest system design.
* [SwiftUI performance](https://github.com/Dimillian/Skills/blob/main/swiftui-performance-audit/SKILL.md) helps when a feature feels slow or a SwiftUI view update path looks suspicious. It scans for common SwiftUI mistakes and produces a prioritized report of what to fix and where the biggest gains are.
* [Swift concurrency expert](https://github.com/Dimillian/Skills/blob/main/swift-concurrency-expert/SKILL.md) helps when cryptic errors and compiler warnings start fighting the change you want to make. On GPT-5.4, you may need it less often, but it’s still useful when Swift concurrency diagnostics get noisy.
* [SwiftUI view refactor](https://github.com/Dimillian/Skills/blob/main/swiftui-view-refactor/SKILL.md) helps keep files smaller and make SwiftUI code more consistent across the repo.
* [SwiftUI patterns](https://github.com/Dimillian/Skills/blob/main/swiftui-ui-patterns/SKILL.md) helps reach for predictable `@Observable` and `@Environment` architecture patterns as the app grows.
To learn more about how to install and use skills, see our [skills documentation](/codex/skills).
## Iterate
Once you have a first pass working, or if you’re starting from an existing project, you can start iterating on the UI or behavior.
For this part, be specific about what you want to change and how you want to change it.
Make that prompting layer explicit: tell Codex whether it’s working in a greenfield repo or an existing Xcode project, which iOS devices or deployment targets must keep working, and what validation loop you expect.
### Example prompt
For example, if you want to add a feature to an existing app, you can ask Codex for a change like this:
Add the onboarding flow for this SwiftUI app.
Constraints:
- Reuse existing models, navigation patterns, and shared utilities.
- Use XcodeBuildMCP to list the right targets or schemes, build the app, launch it, and capture screenshots if you need visual verification.
- Keep the implementation focused on iPhone and iPad unless I explicitly ask for a shared iOS/macOS abstraction.
- Tell me exactly which scheme, simulator, and checks you used.
Implement the slice, verify it with the smallest relevant build or run loop, and summarize what changed.
## Practical tips
### Start with basics
Start with plain prompting for greenfield work. Ask Codex to scaffold a starter SwiftUI app and write a small build-and-launch script you can wire to a `Build` action in a [local environment](/codex/app/local-environments). For that first pass, you often don’t need any skill or MCP server.
### Use a small trustworthy validation loop
After each change, tell Codex to run the narrowest command that actually proves the contract you touched. Expand to broader builds later. This keeps Codex fast without pretending a full app build is required for every edit.
### Keep the loop CLI-first
Keep the loop CLI-first. Apple’s `xcodebuild` tool can list schemes and run build, test, archive, `build-for-testing`, and `test-without-building` actions from the terminal, which lets Codex stay in an agentic loop instead of bouncing into the Xcode GUI.
### Leverage XcodeBuildMCP
Use XcodeBuildMCP as soon as you are inside a full Xcode project and need deeper automation. That’s the point where schemes, targets, simulator control, screenshots, logs, and UI interaction matter enough that plain shell commands stop being the whole story.
##
Tech stack
Need
Default options
Why it's needed
Need
UI framework
Default options
[ SwiftUI ](https://developer.apple.com/documentation/swiftui/)
Why it's needed
The fastest way to prototype views, navigation, and shared state for iPhone and iPad while keeping the UI code readable.
Need
Build tooling
Default options
xcodebuild or [ Tuist ](https://docs.tuist.dev/)
Why it's needed
Both keep the native build loop in the terminal instead of depending on the Xcode GUI.
Need
Project automation
Default options
[ XcodeBuildMCP ](https://www.xcodebuildmcp.com/)
Why it's needed
A strong option once you need Codex to inspect schemes and targets, launch the app, capture screenshots, and keep iterating without leaving the agentic loop.
Need
Distribution tooling
Default options
[ App Store Connect CLI ](https://asccli.sh/)
Why it's needed
Keep your agent fully in the loop and send your app build directly to the App Store.
|
Need
|
Default options
|
Why it's needed
|
| UI framework |[ SwiftUI ](https://developer.apple.com/documentation/swiftui/)| The fastest way to prototype views, navigation, and shared state for iPhone and iPad while keeping the UI code readable. |
| Build tooling | xcodebuild or [ Tuist ](https://docs.tuist.dev/)| Both keep the native build loop in the terminal instead of depending on the Xcode GUI. |
| Project automation |[ XcodeBuildMCP ](https://www.xcodebuildmcp.com/)| A strong option once you need Codex to inspect schemes and targets, launch the app, capture screenshots, and keep iterating without leaving the agentic loop. |
| Distribution tooling |[ App Store Connect CLI ](https://asccli.sh/)| Keep your agent fully in the loop and send your app build directly to the App Store. |
##
Related use cases
[
### Add iOS app intents
Use Codex and the Build iOS Apps plugin to identify the actions and entities your app should...
iOS Code
](/codex/use-cases/ios-app-intents)[
### Adopt liquid glass
Use Codex and the Build iOS Apps plugin to audit existing iPhone and iPad UI, replace custom...
iOS Code
](/codex/use-cases/ios-liquid-glass)[
### Debug in iOS simulator
Use Codex to discover the right Xcode scheme and simulator, launch the app, inspect the UI...
iOS Code
](/codex/use-cases/ios-simulator-bug-debugging)