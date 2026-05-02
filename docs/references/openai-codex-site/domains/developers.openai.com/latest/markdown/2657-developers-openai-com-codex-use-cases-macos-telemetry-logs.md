Add Mac telemetry | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Add Mac telemetry
Use Codex to instrument one Mac feature with Logger, run the app, and verify the action from unified logs.
Difficulty **Advanced**
Time horizon **30m**
Use Codex and the Build macOS Apps plugin to add a few high-signal `Logger` events around windows, sidebars, commands, or sync flows, then run the app and prove from Console or `log stream` that the right actions fired.
## Best for
* Mac app features where Codex needs a reliable trace of window opening, sidebar selection, menu commands, menu bar actions, sync milestones, or fallback paths
* Agentic debugging loops where Codex should patch code, rerun the app, inspect logs, and decide the next fix from evidence instead of guessing
* Local app-session collection loops where you want a compact sequence of user actions and app lifecycle events that can be compared across repeated runs
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/macos-telemetry-logs/?export=pdf)
Use Codex and the Build macOS Apps plugin to add a few high-signal `Logger` events around windows, sidebars, commands, or sync flows, then run the app and prove from Console or `log stream` that the right actions fired.
Advanced
30m
Related links
[ Build macOS Apps plugin ](https://github.com/openai/plugins/tree/main/plugins/build-macos-apps)[ Agent skills ](/codex/skills)
##
Best for
* Mac app features where Codex needs a reliable trace of window opening, sidebar selection, menu commands, menu bar actions, sync milestones, or fallback paths
* Agentic debugging loops where Codex should patch code, rerun the app, inspect logs, and decide the next fix from evidence instead of guessing
* Local app-session collection loops where you want a compact sequence of user actions and app lifecycle events that can be compared across repeated runs
##
Skills & Plugins
*
[ Build macOS Apps ](https://github.com/openai/plugins/tree/main/plugins/build-macos-apps)
Use the macOS telemetry and build/run skills to add structured `OSLog` instrumentation, launch the app, exercise the UI path, and verify the emitted events from Console or `log stream`.
|
Skill
|
Why use it
|
|[ Build macOS Apps ](https://github.com/openai/plugins/tree/main/plugins/build-macos-apps)| Use the macOS telemetry and build/run skills to add structured `OSLog` instrumentation, launch the app, exercise the UI path, and verify the emitted events from Console or `log stream`. |
##
Starter prompt
Use the Build macOS Apps plugin to add lightweight unified logging around [name one Mac feature or action flow], then run the app and verify from logs that those events fire in the expected order.
Constraints:
- Prefer `Logger` from `OSLog`, not `print`, and create a clear subsystem/category pair for this feature so the logs are easy to filter.
- Log one concise line for each important action boundary or state transition: for example window opened, sidebar selection changed, menu command invoked, sync started, sync finished, or fallback path taken.
- Keep permanent `info` logs stable and high signal. Use `debug` only for noisy local details, and remove or demote temporary instrumentation before finishing.
- Do not log secrets, auth tokens, personal data, or raw document contents. If an identifier must be logged, choose the safest privacy annotation and explain why.
- Build and run the app, exercise the feature path yourself, and verify the events with Console or a focused `log stream` predicate.
- If the flow is long, intermittent, or easier to reproduce by hand, save the filtered log stream to a small local session trace file, let me manually exercise the app if needed, then read that file back and summarize the event timeline.
- If an expected event does not appear, move the log closer to the suspected control path, rerun the flow, and continue until the logs explain what happened.
Deliver:
- the new logger setup and the exact events you added
- the Console filter or `log stream` predicate you used
- a short before/after summary of what the logs now make observable
- the saved trace file and timeline summary if this became a longer capture session
- one or two representative log lines that prove the flow is instrumented correctly
[Open in the Codex app](<codex://new?prompt=Use+the+Build+macOS+Apps+plugin+to+add+lightweight+unified+logging+around+[name+one+Mac+feature+or+action+flow],+then+run+the+app+and+verify+from+logs+that+those+events+fire+in+the+expected+order.
Constraints:
-+Prefer+`Logger`+from+`OSLog`,+not+`print`,+and+create+a+clear+subsystem/category+pair+for+this+feature+so+the+logs+are+easy+to+filter.
-+Log+one+concise+line+for+each+important+action+boundary+or+state+transition:+for+example+window+opened,+sidebar+selection+changed,+menu+command+invoked,+sync+started,+sync+finished,+or+fallback+path+taken.
-+Keep+permanent+`info`+logs+stable+and+high+signal.+Use+`debug`+only+for+noisy+local+details,+and+remove+or+demote+temporary+instrumentation+before+finishing.
-+Do+not+log+secrets,+auth+tokens,+personal+data,+or+raw+document+contents.+If+an+identifier+must+be+logged,+choose+the+safest+privacy+annotation+and+explain+why.
-+Build+and+run+the+app,+exercise+the+feature+path+yourself,+and+verify+the+events+with+Console+or+a+focused+`log+stream`+predicate.
-+If+the+flow+is+long,+intermittent,+or+easier+to+reproduce+by+hand,+save+the+filtered+log+stream+to+a+small+local+session+trace+file,+let+me+manually+exercise+the+app+if+needed,+then+read+that+file+back+and+summarize+the+event+timeline.
-+If+an+expected+event+does+not+appear,+move+the+log+closer+to+the+suspected+control+path,+rerun+the+flow,+and+continue+until+the+logs+explain+what+happened.
Deliver:
-+the+new+logger+setup+and+the+exact+events+you+added
-+the+Console+filter+or+`log+stream`+predicate+you+used
-+a+short+before/after+summary+of+what+the+logs+now+make+observable
-+the+saved+trace+file+and+timeline+summary+if+this+became+a+longer+capture+session
-+one+or+two+representative+log+lines+that+prove+the+flow+is+instrumented+correctly>)
Use the Build macOS Apps plugin to add lightweight unified logging around [name one Mac feature or action flow], then run the app and verify from logs that those events fire in the expected order.
Constraints:
- Prefer `Logger` from `OSLog`, not `print`, and create a clear subsystem/category pair for this feature so the logs are easy to filter.
- Log one concise line for each important action boundary or state transition: for example window opened, sidebar selection changed, menu command invoked, sync started, sync finished, or fallback path taken.
- Keep permanent `info` logs stable and high signal. Use `debug` only for noisy local details, and remove or demote temporary instrumentation before finishing.
- Do not log secrets, auth tokens, personal data, or raw document contents. If an identifier must be logged, choose the safest privacy annotation and explain why.
- Build and run the app, exercise the feature path yourself, and verify the events with Console or a focused `log stream` predicate.
- If the flow is long, intermittent, or easier to reproduce by hand, save the filtered log stream to a small local session trace file, let me manually exercise the app if needed, then read that file back and summarize the event timeline.
- If an expected event does not appear, move the log closer to the suspected control path, rerun the flow, and continue until the logs explain what happened.
Deliver:
- the new logger setup and the exact events you added
- the Console filter or `log stream` predicate you used
- a short before/after summary of what the logs now make observable
- the saved trace file and timeline summary if this became a longer capture session
- one or two representative log lines that prove the flow is instrumented correctly
## Add one Logger where debugging gets vague
This use case is for Mac app flows where “something happened” is too fuzzy to debug from code review alone. Ask Codex to add a few high-signal unified logs around one behavior, run the app, trigger that behavior, and verify from Console or `log stream` that the expected events fired.
Use the [Build macOS Apps plugin](https://github.com/openai/plugins/tree/main/plugins/build-macos-apps) for that loop. Its macOS telemetry skill is intentionally lightweight: use Apple’s `Logger`, choose a clear subsystem/category pair, log action boundaries and state transitions, avoid sensitive payloads, and verify the event after a local build/run instead of assuming the instrumentation is wired correctly.
## Why telemetry is useful for agentic engineering
Good logs give Codex a repeatable feedback loop after each patch. Instead of asking you to manually inspect every window, menu action, or sync transition, the agent can run the app, exercise the flow, inspect filtered logs, and decide the next code change from evidence.
That is especially useful for three agentic loops:
* **Hands-free debug loop:** Codex instruments a suspicious flow, launches the app, clicks the sidebar or triggers a command, reads the emitted log sequence, patches the state update path, and reruns the same flow until the logs and UI behavior agree.
* **App session collection loop:** Codex adds one event for app launch, window open, sidebar selection, import started, import finished, and import failed, then runs a local session and summarizes the resulting timeline so missing or out-of-order transitions become obvious.
* **Human-driven capture loop:** Codex launches the app with logging enabled, keeps a focused log stream running while you manually exercise a tricky flow, then inspects the captured session afterward and proposes the next patch from that trace.
## Keep the instrumentation small and filterable
Ask Codex for one logger per feature area, not one permanent log line for every state mutation. Feature categories such as `Windowing`, `Commands`, `MenuBar`, `Sidebar`, `Sync`, or `Import` make logs much easier to filter during the next debugging pass.
```
`import OSLog
private let logger = Logger(
subsystem: Bundle.main.bundleIdentifier ?? "SampleApp",
category: "Sidebar"
)
@MainActor
func selectItem(\_ item: SidebarItem) {
logger.info("Selected sidebar item: \\(item.id, privacy: .public)")
selection = item.id
}`
```
Use `info` for concise action and lifecycle events that should remain useful over time, and `debug` for noisier local state details that may be removed or demoted before the task is done. Add signposts only when you are measuring a timing span, not by default.
## Ask Codex to prove the event from logs
The useful part is not just adding `Logger` calls. Ask Codex to run the app, trigger the instrumented flow, and give you the exact Console filter or `log stream` predicate it used plus one or two representative log lines.
```
`log stream --style compact --predicate 'subsystem == "com.example.app" && category == "Sidebar"'`
```
If an expected event does not appear, ask Codex to move the log closer to the suspected control path, rerun the same flow, and keep iterating until the logs explain what happened. If the task turns into a crash or backtrace analysis, pivot to the plugin’s build/run debugging workflow and keep the telemetry focused on the action boundaries.
## Save a session trace for a later Codex pass
For longer or intermittent bugs, ask Codex to save a focused log stream to a small local trace file, summarize the timeline, and leave that artifact in the workspace so a later Codex run can inspect the same evidence without replaying the whole session from memory. That makes multi-pass debugging easier when you want one agent run to collect a trace and another run to compare behavior before and after a patch.
This also works well when the human needs to drive part of the session. Ask Codex to launch the app in a logging-friendly debug loop, start a filtered capture, wait while you reproduce the issue manually, and then read the saved trace file once you are done.
## Practical tips
### Instrument one feature at a time
Start with one sidebar, window, command, or sync path so the log sequence stays easy to inspect. If that path becomes reliable, Codex can expand the same pattern to neighboring flows.
### Make privacy part of the prompt
Ask Codex to explain every logged identifier and to avoid writing secrets, personal data, or raw content to unified logs. A tiny event vocabulary is usually enough for local debugging.
### Keep sample output in the final summary
Representative log lines make the change much easier to trust than “telemetry was added.” Ask Codex to include the filter predicate and a short action timeline so the next agent run can reuse the same verification loop.
##
Tech stack
Need
Default options
Why it's needed
Need
App logging
Default options
[ OSLog Logger ](https://developer.apple.com/documentation/os/logger)
Why it's needed
Structured unified logging gives Codex a narrow, filterable feedback loop without turning the codebase into a wall of `print` statements.
Need
Agent workflow
Default options
[ Build macOS Apps plugin ](https://github.com/openai/plugins/tree/main/plugins/build-macos-apps)
Why it's needed
The plugin's telemetry and build/run skills are designed to work together: instrument one flow, launch the app, inspect logs, and tighten the event set.
Need
Runtime verification
Default options
Console.app and `log stream --predicate ...`
Why it's needed
A concrete log filter plus sample output gives the agent a repeatable handoff and makes the new instrumentation easy to verify across runs.
|
Need
|
Default options
|
Why it's needed
|
| App logging |[ OSLog Logger ](https://developer.apple.com/documentation/os/logger)| Structured unified logging gives Codex a narrow, filterable feedback loop without turning the codebase into a wall of ` print ` statements. |
| Agent workflow |[ Build macOS Apps plugin ](https://github.com/openai/plugins/tree/main/plugins/build-macos-apps)| The plugin's telemetry and build/run skills are designed to work together: instrument one flow, launch the app, inspect logs, and tighten the event set. |
| Runtime verification | Console.app and ` log stream --predicate ... `| A concrete log filter plus sample output gives the agent a repeatable handoff and makes the new instrumentation easy to verify across runs. |
##
Related use cases
[
### Build a Mac app shell
Use Codex and the Build macOS Apps plugin to turn an app idea into a desktop-native...
macOS Code
](/codex/use-cases/macos-sidebar-detail-inspector)[
### Build for macOS
Use Codex to build macOS SwiftUI apps, wire a shell-first build-and-run loop, and add...
macOS Code
](/codex/use-cases/native-macos-apps)[
### Debug in iOS simulator
Use Codex to discover the right Xcode scheme and simulator, launch the app, inspect the UI...
iOS Code
](/codex/use-cases/ios-simulator-bug-debugging)