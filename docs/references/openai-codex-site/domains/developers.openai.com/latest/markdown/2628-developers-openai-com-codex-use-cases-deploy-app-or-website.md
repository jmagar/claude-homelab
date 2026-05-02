Deploy an app or website | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Deploy an app or website
Build or update a web app, deploy a preview, and get a live URL.
Difficulty **Intermediate**
Time horizon **30m**
Use Codex with Build Web Apps and Vercel to turn a repo, screenshot, design, or rough app idea into a working preview deployment you can share.
## Best for
* Turning a screenshot, map, design brief, or rough app idea into a working web preview
* Deploying a branch or local app without manually wiring Vercel commands
* Sharing a live URL after Codex runs the build and checks the deployment
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/deploy-app-or-website/?export=pdf)
Use Codex with Build Web Apps and Vercel to turn a repo, screenshot, design, or rough app idea into a working preview deployment you can share.
Intermediate
30m
Related links
[ Build Web Apps plugin ](https://github.com/openai/plugins/tree/main/plugins/build-web-apps)[ Vercel plugin ](https://github.com/openai/plugins/tree/main/plugins/vercel)[ Vercel deployments ](https://vercel.com/docs/deployments/overview)
##
Best for
* Turning a screenshot, map, design brief, or rough app idea into a working web preview
* Deploying a branch or local app without manually wiring Vercel commands
* Sharing a live URL after Codex runs the build and checks the deployment
##
Skills & Plugins
*
[ Build Web Apps ](https://github.com/openai/plugins/tree/main/plugins/build-web-apps)
Build, review, and prepare web apps with React, UI, deployment, payments, and database guidance.
*
[ Vercel ](https://github.com/openai/plugins/tree/main/plugins/vercel)
Deploy previews, inspect deployments, read build logs, and manage Vercel project settings.
|
Skill
|
Why use it
|
|[ Build Web Apps ](https://github.com/openai/plugins/tree/main/plugins/build-web-apps)| Build, review, and prepare web apps with React, UI, deployment, payments, and database guidance. |
|[ Vercel ](https://github.com/openai/plugins/tree/main/plugins/vercel)| Deploy previews, inspect deployments, read build logs, and manage Vercel project settings. |
##
Starter prompt
Use @build-web-apps to turn [repo, screenshot, design, or rough app idea] into a working website.
Then use @vercel to deploy a preview and hand me the live URL.
Context:
- [what the site should do]
- [source data, API, docs, or assets to use]
- [style or product constraints]
- [anything not to change]
Before you hand it back, run the local build and verify the deployment is ready.
[Open in the Codex app](<codex://new?prompt=Use+@build-web-apps+to+turn+[repo,+screenshot,+design,+or+rough+app+idea]+into+a+working+website.
Then+use+@vercel+to+deploy+a+preview+and+hand+me+the+live+URL.
Context:
-+[what+the+site+should+do]
-+[source+data,+API,+docs,+or+assets+to+use]
-+[style+or+product+constraints]
-+[anything+not+to+change]
Before+you+hand+it+back,+run+the+local+build+and+verify+the+deployment+is+ready.>)
Use @build-web-apps to turn [repo, screenshot, design, or rough app idea] into a working website.
Then use @vercel to deploy a preview and hand me the live URL.
Context:
- [what the site should do]
- [source data, API, docs, or assets to use]
- [style or product constraints]
- [anything not to change]
Before you hand it back, run the local build and verify the deployment is ready.
## Start with the site and the deploy target
Codex can build or update a website or app, run the project checks, deploy it with Vercel, and return the URL.
The useful handoff is concrete: a repo, screenshot, map, design brief, product note, API doc, or data source. Codex should inspect the project before changing it, then use the Vercel plugin to deploy a preview by default.
Use `@build-web-apps` when Codex needs to build or polish the app. Use `@vercel` when it should deploy, inspect the deployment, or read Vercel build logs.
Use @build-web-apps to turn [repo, screenshot, design, or rough app idea] into a working website.
Then use @vercel to deploy a preview and hand me the live URL.
Context:
- [what the site should do]
- [source data, API, docs, or assets to use]
- [style or product constraints]
- [anything not to change]
Before you hand it back, run the local build and verify the deployment is ready.
## Check the result before you share it
Codex should tell you what it changed, which command it used to build the project, and whether the Vercel deployment is ready. If the deploy needs an environment variable, team choice, domain setting, or login step, Codex should call that out instead of pretending the site is finished.
Keep production changes explicit. A preview deployment is the default; ask for production only when you mean it.
## Iterate from the live URL
Once you have the preview, keep the same thread open. Ask Codex to open the URL, fix layout issues, update copy, wire missing data, or read Vercel logs if the deploy fails. The thread already has the repo, deployment, and build context.
Good follow-ups are specific:
* “The mobile layout is cramped. Fix it and redeploy the preview.”
* “Use the same project and add the latest data from [source].”
* “Read the failed build logs and fix the deploy.”
##
Related use cases
[
### Bring your app to ChatGPT
Build one narrow ChatGPT app outcome end to end: define the tools, scaffold the MCP server...
Integrations Code
](/codex/use-cases/chatgpt-apps)[
### Add iOS app intents
Use Codex and the Build iOS Apps plugin to identify the actions and entities your app should...
iOS Code
](/codex/use-cases/ios-app-intents)[
### Adopt liquid glass
Use Codex and the Build iOS Apps plugin to audit existing iPhone and iPad UI, replace custom...
iOS Code
](/codex/use-cases/ios-liquid-glass)