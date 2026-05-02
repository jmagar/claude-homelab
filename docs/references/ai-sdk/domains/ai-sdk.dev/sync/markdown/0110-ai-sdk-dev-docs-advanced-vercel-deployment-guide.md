Advanced: Vercel Deployment Guide
[](https://vercel.com/oss)
Menu
v6 (Latest)
AI SDK 6.x
[AI SDK by Vercel](/docs/introduction)
[Foundations](/docs/foundations)
[Overview](/docs/foundations/overview)
[Providers and Models](/docs/foundations/providers-and-models)
[Prompts](/docs/foundations/prompts)
[Tools](/docs/foundations/tools)
[Streaming](/docs/foundations/streaming)
[Provider Options](/docs/foundations/provider-options)
[Getting Started](/docs/getting-started)
[Choosing a Provider](/docs/getting-started/choosing-a-provider)
[Navigating the Library](/docs/getting-started/navigating-the-library)
[Next.js App Router](/docs/getting-started/nextjs-app-router)
[Next.js Pages Router](/docs/getting-started/nextjs-pages-router)
[Svelte](/docs/getting-started/svelte)
[Vue.js (Nuxt)](/docs/getting-started/nuxt)
[Node.js](/docs/getting-started/nodejs)
[Expo](/docs/getting-started/expo)
[TanStack Start](/docs/getting-started/tanstack-start)
[Coding Agents](/docs/getting-started/coding-agents)
[Agents](/docs/agents)
[Overview](/docs/agents/overview)
[Building Agents](/docs/agents/building-agents)
[Workflow Patterns](/docs/agents/workflows)
[Loop Control](/docs/agents/loop-control)
[Configuring Call Options](/docs/agents/configuring-call-options)
[Memory](/docs/agents/memory)
[Subagents](/docs/agents/subagents)
[AI SDK Core](/docs/ai-sdk-core)
[Overview](/docs/ai-sdk-core/overview)
[Generating Text](/docs/ai-sdk-core/generating-text)
[Generating Structured Data](/docs/ai-sdk-core/generating-structured-data)
[Tool Calling](/docs/ai-sdk-core/tools-and-tool-calling)
[Model Context Protocol (MCP)](/docs/ai-sdk-core/mcp-tools)
[Prompt Engineering](/docs/ai-sdk-core/prompt-engineering)
[Settings](/docs/ai-sdk-core/settings)
[Embeddings](/docs/ai-sdk-core/embeddings)
[Reranking](/docs/ai-sdk-core/reranking)
[Image Generation](/docs/ai-sdk-core/image-generation)
[Transcription](/docs/ai-sdk-core/transcription)
[Speech](/docs/ai-sdk-core/speech)
[Video Generation](/docs/ai-sdk-core/video-generation)
[Language Model Middleware](/docs/ai-sdk-core/middleware)
[Provider & Model Management](/docs/ai-sdk-core/provider-management)
[Error Handling](/docs/ai-sdk-core/error-handling)
[Testing](/docs/ai-sdk-core/testing)
[Telemetry](/docs/ai-sdk-core/telemetry)
[DevTools](/docs/ai-sdk-core/devtools)
[Event Callbacks](/docs/ai-sdk-core/event-listeners)
[AI SDK UI](/docs/ai-sdk-ui)
[Overview](/docs/ai-sdk-ui/overview)
[Chatbot](/docs/ai-sdk-ui/chatbot)
[Chatbot Message Persistence](/docs/ai-sdk-ui/chatbot-message-persistence)
[Chatbot Resume Streams](/docs/ai-sdk-ui/chatbot-resume-streams)
[Chatbot Tool Usage](/docs/ai-sdk-ui/chatbot-tool-usage)
[Generative User Interfaces](/docs/ai-sdk-ui/generative-user-interfaces)
[Completion](/docs/ai-sdk-ui/completion)
[Object Generation](/docs/ai-sdk-ui/object-generation)
[Streaming Custom Data](/docs/ai-sdk-ui/streaming-data)
[Error Handling](/docs/ai-sdk-ui/error-handling)
[Transport](/docs/ai-sdk-ui/transport)
[Reading UIMessage Streams](/docs/ai-sdk-ui/reading-ui-message-streams)
[Message Metadata](/docs/ai-sdk-ui/message-metadata)
[Stream Protocols](/docs/ai-sdk-ui/stream-protocol)
[AI SDK RSC](/docs/ai-sdk-rsc)
[Advanced](/docs/advanced)
[Prompt Engineering](/docs/advanced/prompt-engineering)
[Stopping Streams](/docs/advanced/stopping-streams)
[Backpressure](/docs/advanced/backpressure)
[Caching](/docs/advanced/caching)
[Multiple Streamables](/docs/advanced/multiple-streamables)
[Rate Limiting](/docs/advanced/rate-limiting)
[Rendering UI with Language Models](/docs/advanced/rendering-ui-with-language-models)
[Language Models as Routers](/docs/advanced/model-as-router)
[Multistep Interfaces](/docs/advanced/multistep-interfaces)
[Sequential Generations](/docs/advanced/sequential-generations)
[Vercel Deployment Guide](/docs/advanced/vercel-deployment-guide)
[Reference](/docs/reference)
[AI SDK Core](/docs/reference/ai-sdk-core)
[AI SDK UI](/docs/reference/ai-sdk-ui)
[AI SDK RSC](/docs/reference/ai-sdk-rsc)
[AI SDK Errors](/docs/reference/ai-sdk-errors)
[Migration Guides](/docs/migration-guides)
[Troubleshooting](/docs/troubleshooting)
Copy markdown
# [Vercel Deployment Guide](#vercel-deployment-guide)
In this guide, you will deploy an AI application to [Vercel](https://vercel.com) using [Next.js](https://nextjs.org) (App Router).
Vercel is a platform for developers that provides the tools, workflows, and infrastructure you need to build and deploy your web apps faster, without the need for additional configuration.
Vercel allows for automatic deployments on every branch push and merges onto the production branch of your GitHub, GitLab, and Bitbucket projects. It is a great option for deploying your AI application.
## [Before You Begin](#before-you-begin)
To follow along with this guide, you will need:
* a Vercel account
* an account with a Git provider (this tutorial will use [Github](https://github.com))
* an OpenAI API key
This guide will teach you how to deploy the application you built in the Next.js (App Router) quickstart tutorial to Vercel. If you haven’t completed the quickstart guide, you can start with [this repo](https://github.com/vercel-labs/ai-sdk-deployment-guide).
## [Commit Changes](#commit-changes)
Vercel offers a powerful git-centered workflow that automatically deploys your application to production every time you push to your repository’s main branch.
Before committing your local changes, make sure that you have a `.gitignore`. Within your `.gitignore`, ensure that you are excluding your environment variables (`.env`) and your node modules (`node\_modules`).
If you have any local changes, you can commit them by running the following commands:
```
`
git add .
git commit -m "init"
`
```
## [Create Git Repo](#create-git-repo)
You can create a GitHub repository from within your terminal, or on [github.com](https://github.com/). For this tutorial, you will use the GitHub CLI ([more info here](https://cli.github.com/)).
To create your GitHub repository:
1. Navigate to [github.com](http://github.com/)
2. In the top right corner, click the "plus" icon and select "New repository"
3. Pick a name for your repository (this can be anything)
4. Click "Create repository"
Once you have created your repository, GitHub will redirect you to your new repository.
1. Scroll down the page and copy the commands under the title "...or push an existing repository from the command line"
2. Go back to the terminal, paste and then run the commands
Note: if you run into the error "error: remote origin already exists.", this is because your local repository is still linked to the repository you cloned. To "unlink", you can run the following command:
```
`
rm -rf .git
git init
git add .
git commit -m "init"
`
```
Rerun the code snippet from the previous step.
## [Import Project in Vercel](#import-project-in-vercel)
On the [New Project](https://vercel.com/new) page, under the **Import Git Repository** section, select the Git provider that you would like to import your project from. Follow the prompts to sign in to your GitHub account.
Once you have signed in, you should see your newly created repository from the previous step in the "Import Git Repository" section. Click the "Import" button next to that project.
### [Add Environment Variables](#add-environment-variables)
Your application uses environment secrets to store your OpenAI API key using a `.env.local` file locally in development. To add this API key to your production deployment, expand the "Environment Variables" section and paste in your `.env.local` file. Vercel will automatically parse your variables and enter them in the appropriate `key:value` format.
### [Deploy](#deploy)
Press the **Deploy** button. Vercel will create the Project and deploy it based on the chosen configurations.
### [Enjoy the confetti!](#enjoy-the-confetti)
To view your deployment, select the Project in the dashboard and then select the **Domain**. This page is now visible to anyone who has the URL.
## [Considerations](#considerations)
When deploying an AI application, there are infrastructure-related considerations to be aware of.
### [Function Duration](#function-duration)
In most cases, you will call the large language model (LLM) on the server. By default, Vercel serverless functions have a maximum duration of 10 seconds on the Hobby Tier. Depending on your prompt, it can take an LLM more than this limit to complete a response. If the response is not resolved within this limit, the server will throw an error.
You can specify the maximum duration of your Vercel function using [route segment config](https://nextjs.org/docs/app/api-reference/file-conventions/route-segment-config). To update your maximum duration, add the following route segment config to the top of your route handler or the page which is calling your server action.
```
`
export const maxDuration = 30;
`
```
You can increase the max duration to 60 seconds on the Hobby Tier. For other tiers, [see the documentation](https://vercel.com/docs/functions/runtimes#max-duration) for limits.
## [Security Considerations](#security-considerations)
Given the high cost of calling an LLM, it's important to have measures in place that can protect your application from abuse.
### [Rate Limit](#rate-limit)
Rate limiting is a method used to regulate network traffic by defining a maximum number of requests that a client can send to a server within a given time frame.
Follow [this guide](https://vercel.com/guides/securing-ai-app-rate-limiting) to add rate limiting to your application.
### [Firewall](#firewall)
A firewall helps protect your applications and websites from DDoS attacks and unauthorized access.
[Vercel Firewall](https://vercel.com/docs/security/vercel-firewall) is a set of tools and infrastructure, created specifically with security in mind. It automatically mitigates DDoS attacks and Enterprise teams can get further customization for their site, including dedicated support and custom rules for IP blocking.
## [Troubleshooting](#troubleshooting)
* Streaming not working when [proxied](/docs/troubleshooting/streaming-not-working-when-proxied)
* Experiencing [Timeouts](/docs/troubleshooting/timeout-on-vercel)
On this page
[Vercel Deployment Guide](#vercel-deployment-guide)
[Before You Begin](#before-you-begin)
[Commit Changes](#commit-changes)
[Create Git Repo](#create-git-repo)
[Import Project in Vercel](#import-project-in-vercel)
[Add Environment Variables](#add-environment-variables)
[Deploy](#deploy)
[Enjoy the confetti!](#enjoy-the-confetti)
[Considerations](#considerations)
[Function Duration](#function-duration)
[Security Considerations](#security-considerations)
[Rate Limit](#rate-limit)
[Firewall](#firewall)
[Troubleshooting](#troubleshooting)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)