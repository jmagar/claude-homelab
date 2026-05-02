Set up a teammate | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Set up a teammate
Give Codex a durable view of your work so it can notice what changed.
Difficulty **Easy**
Time horizon **Long-running**
Connect the tools where work happens, teach one thread what matters, then add an automation so Codex can notice changed docs, buried asks, blocked handoffs, and decisions that need your judgment.
## Best for
* Roles working with context across Slack, Gmail, calendar, docs, trackers, code, and notes
* Understanding active work, recurring decisions, collaborators, and cutting through noise
* Teams that need to escalate what deserves attention
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/proactive-teammate/?export=pdf)
Connect the tools where work happens, teach one thread what matters, then add an automation so Codex can notice changed docs, buried asks, blocked handoffs, and decisions that need your judgment.
Easy
Long-running
Related links
[ Codex automations ](/codex/app/automations)[ Codex plugins ](/codex/plugins)
##
Best for
* Roles working with context across Slack, Gmail, calendar, docs, trackers, code, and notes
* Understanding active work, recurring decisions, collaborators, and cutting through noise
* Teams that need to escalate what deserves attention
##
Skills & Plugins
*
[ Slack ](https://github.com/openai/plugins/tree/main/plugins/slack)
Find the Slack context around asks, owner changes, blockers, and decisions.
*
[ Gmail ](https://github.com/openai/plugins/tree/main/plugins/gmail)
Find reply-worthy threads and cross-check them against the rest of the workstream.
*
[ Google Calendar ](https://github.com/openai/plugins/tree/main/plugins/google-calendar)
Use the day's meetings to decide which updates matter now and which can wait.
*
[ Notion ](/codex/plugins)
Read the project notes, trackers, or decision logs that define the workstream.
|
Skill
|
Why use it
|
|[ Slack ](https://github.com/openai/plugins/tree/main/plugins/slack)| Find the Slack context around asks, owner changes, blockers, and decisions. |
|[ Gmail ](https://github.com/openai/plugins/tree/main/plugins/gmail)| Find reply-worthy threads and cross-check them against the rest of the workstream. |
|[ Google Calendar ](https://github.com/openai/plugins/tree/main/plugins/google-calendar)| Use the day's meetings to decide which updates matter now and which can wait. |
|[ Notion ](/codex/plugins)| Read the project notes, trackers, or decision logs that define the workstream. |
##
Starter prompt
Can you check @slack, @gmail, @google-calendar, and @notion and tell me what needs my attention?
Look for anything important or surprising that I might miss.
[Open in the Codex app](<codex://new?prompt=Can+you+check+@slack,+@gmail,+@google-calendar,+and+@notion+and+tell+me+what+needs+my+attention?
Look+for+anything+important+or+surprising+that+I+might+miss.>)
Can you check @slack, @gmail, @google-calendar, and @notion and tell me what needs my attention?
Look for anything important or surprising that I might miss.
## Use Codex as a teammate
Codex gets more useful when it can see the places where your work happens: Slack, Gmail, calendar, project trackers, docs, code, and local notes. Together, those sources show what you work on, who you work with, and which asks or decisions can get buried during the day.
With that view, one Codex thread can become a proactive teammate. It learns what you care about as you use it, then an automation sends Codex back through the same sources and returns the signal worth interrupting you for.
Your browser does not support the video tag.
## Start a teammate thread
1. Connect the plugins or MCPs for the tools where your work happens.
2. Start a new Codex thread and ask it to check those sources.
3. Tell Codex which items were useful and which were noise.
4. Add an automation to the thread, then pin the thread and watch for notifications.
5. Operate from the same thread: ask questions, get drafts, and tell Codex what action to take next.
## Run one useful check
Start with the tools that already hold your work context. For one person, that might be Gmail, Slack, calendar, Notion, GitHub, Linear, and a local notes folder. Ask Codex to check those sources and tell you what needs attention.
Use the starter prompt on this page for the first check. You can keep it general or make it specific to a workstream, account, launch, team, or project.
A useful Codex response can look like this:
Codex
**One thing changed.**
The renewal prep now says the customer needs security export wording before
the partner note goes out. The partner update still frames the work as broad
reporting automation.
The useful move is to keep Lina’s note narrow: say the export helps audit
prep, link the renewal prep, and leave the broader automation claim out
until Owen signs off.
**Priority:** update the partner line before sending the review
packet.
Useful output names the trigger, shows the source, explains the implication, and recommends the next move. When you correct the thread, Codex learns more about how you operate: which sources matter, which owners already have the work, how direct drafts should sound, and what is worth bringing back.
## Turn the thread into an automation
Once the thread becomes useful, ask Codex to keep watching in that same thread. An automation is a scheduled check-in that sends Codex back through the sources you named, then posts a new message if it finds signal worth your attention. It can run hourly, every weekday morning, or at another specific time.
Can you keep an eye on these sources and let me know if anything useful pops up?
Check [hourly, every weekday morning, or at 9 AM].
This is the right shape for Codex [automations](/codex/app/automations): test the prompt in a normal thread first, then add an automation to that thread. Because Codex can compact long conversations, the same thread can keep improving with your corrections instead of starting over each morning.
## Operate from the same thread
The teammate becomes more valuable after the alert. Operate as if Codex were your coworker: ask questions in the same thread, then have it turn the signal into a reply, handoff note, or decision brief.
Look for anything here that should surprise me.
What changed since the last run?
Which source changed your recommendation?
What should I do next?
Draft the next move from this signal.
Use the context from this thread, keep the draft short, and show the source that supports it.
Do not send or post it.
Codex can watch, explain, and draft. You still approve external actions.
##
Tech stack
Need
Default options
Why it's needed
Need
Sources to check
Default options
Slack for active asks, Gmail for pending replies, Google Calendar for timing, and Notion or docs for project state. Add GitHub, Linear, MCPs, or local notes when they are where the work happens.
Why it's needed
The stronger the view, the easier it is for Codex to understand the bigger picture and find signal across sources.
|
Need
|
Default options
|
Why it's needed
|
| Sources to check | Slack for active asks, Gmail for pending replies, Google Calendar for timing, and Notion or docs for project state. Add GitHub, Linear, MCPs, or local notes when they are where the work happens. | The stronger the view, the easier it is for Codex to understand the bigger picture and find signal across sources. |
##
Related use cases
[
### Coordinate new-hire onboarding
Use Codex to gather approved new-hire context, stage tracker updates, draft team-by-team...
Integrations Data
](/codex/use-cases/new-hire-onboarding)[
### Manage your inbox
Use Codex with Gmail to find emails that need attention, draft responses in your voice, pull...
Automation Integrations
](/codex/use-cases/manage-your-inbox)[
### Turn feedback into actions
Connect Codex to multiple data sources such as Slack, GitHub, Linear, or Google Drive to...
Data Integrations
](/codex/use-cases/feedback-synthesis)