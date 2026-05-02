Use your computer with Codex | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Use your computer with Codex
Let Codex click, type, and navigate apps on your Mac.
Difficulty **Easy**
Time horizon **5m**
Use Computer Use to hand off multi-step tasks across Mac apps, windows, and files.
## Best for
* Tasks that move across apps, windows, browser sessions, or local files on your Mac
* Work you want to hand off and let Codex continue in the background
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/use-your-computer-with-codex/?export=pdf)
Use Computer Use to hand off multi-step tasks across Mac apps, windows, and files.
Easy
5m
Related links
[ Computer Use ](/codex/app/computer-use)[ Plugins ](/codex/plugins)[ Customize Codex ](/codex/concepts/customization)
##
Best for
* Tasks that move across apps, windows, browser sessions, or local files on your Mac
* Work you want to hand off and let Codex continue in the background
##
Starter prompt
@Computer Use [do the task you want completed across your Mac]
For example:
- Play some music to help me focus.
- Help me add my interview notes from Notes to Ashby.
- Look through my Messages app for the trip ideas Brooke sent me this week, add the best options to a new note called "Yosemite ideas", and draft a reply back to her.
[Open in the Codex app](<codex://new?prompt=@Computer+Use+[do+the+task+you+want+completed+across+your+Mac]
For+example:
-+Play+some+music+to+help+me+focus.
-+Help+me+add+my+interview+notes+from+Notes+to+Ashby.
-+Look+through+my+Messages+app+for+the+trip+ideas+Brooke+sent+me+this+week,+add+the+best+options+to+a+new+note+called+"Yosemite+ideas",+and+draft+a+reply+back+to+her.>)
@Computer Use [do the task you want completed across your Mac]
For example:
- Play some music to help me focus.
- Help me add my interview notes from Notes to Ashby.
- Look through my Messages app for the trip ideas Brooke sent me this week, add the best options to a new note called "Yosemite ideas", and draft a reply back to her.
## Introduction
You can let Codex operate an app the same way you would: by clicking, seeing, and typing. [Computer Use](/codex/app/computer-use) is useful when the task lives inside a normal app UI, even if that app does not have a dedicated plugin.
This works especially well for tasks that jump between apps or windows, such as collecting notes, updating a system of record, copying details from one place to another, or drafting a reply after checking context in a few different apps.
## How to use
1. Install the [Computer Use plugin](/codex/app/computer-use).
2. Start your request with `@Computer Use`, or mention a specific app such as `@Slack` or `@Messages`.
3. Describe the task and the outcome you want.
4. Approve access when Codex needs it, then let it continue the task in the background.
If you mention a specific app and a plugin exists for that app, Codex may prefer the plugin over Computer Use. That is usually what you want. If no plugin exists, Codex can fall back to Computer Use and operate the app directly.
For example:
* `@Computer Use Play some music to help me focus.`
* `@Computer Use Help me add my interview notes from Notes to Ashby.`
* `@Computer Use Go through my Slack and add reminders for everything I need to do by end of day.`
## Practical tips
### Choose the browser Codex should use
Computer Use takes control of the app it is operating. If you want to keep working in one browser while Codex browses in another, tell it which browser to use. You can also set a default in [customization](/codex/concepts/customization), for example: “When using Computer Use for web browsing tasks, default to Chrome instead of Safari.”
### Avoid parallel runs in the same app
Do not run two Computer Use tasks against the same app at the same time. That makes it much harder for Codex to keep stable context about the current window and state.
### Stay signed in
For smoother runs, make sure you are already signed in to the apps and services you want Codex to use. If your Mac locks while Computer Use is running, the activity will stop.
## Good follow-ups
Once the task finishes, keep the same thread open if you want Codex to summarize what it changed, double-check the result, or turn the workflow into a more repeatable pattern through [customization](/codex/concepts/customization).
## Suggested prompt
**Hand Off One Computer Task**
@Computer Use [do the task you want completed across your Mac]
For example:
- Play some music to help me focus.
- Help me add my interview notes from Notes to Ashby.
- Look through my Messages app for the trip ideas Brooke sent me this week, add the best options to a new note called "Yosemite ideas", and draft a reply back to her.
##
Related use cases
[
### Clean and prepare messy data
Drag in or mention a messy CSV or spreadsheet, describe the problems you see, and ask Codex...
Data Knowledge Work
](/codex/use-cases/clean-messy-data)[
### Complete tasks from messages
Use Computer Use to read one Messages thread, complete the task, and draft a reply.
Knowledge Work Integrations
](/codex/use-cases/complete-tasks-from-messages)[
### Coordinate new-hire onboarding
Use Codex to gather approved new-hire context, stage tracker updates, draft team-by-team...
Integrations Data
](/codex/use-cases/new-hire-onboarding)