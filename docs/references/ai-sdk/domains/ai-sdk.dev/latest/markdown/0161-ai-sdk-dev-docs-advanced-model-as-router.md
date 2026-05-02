Advanced: Language Models as Routers
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
# [Generative User Interfaces](#generative-user-interfaces)
Since language models can render user interfaces as part of their generations, the resulting model generations are referred to as generative user interfaces.
In this section we will learn more about generative user interfaces and their impact on the way AI applications are built.
## [Deterministic Routes and Probabilistic Routing](#deterministic-routes-and-probabilistic-routing)
Generative user interfaces are not deterministic in nature because they depend on the model's generation output. Since these generations are probabilistic in nature, it is possible for every user query to result in a different user interface.
Users expect their experience using your application to be predictable, so non-deterministic user interfaces can sound like a bad idea at first. However, language models can be set up to limit their generations to a particular set of outputs using their ability to call functions.
When language models are provided with a set of function definitions and instructed to execute any of them based on user query, they do either one of the following things:
* Execute a function that is most relevant to the user query.
* Not execute any function if the user query is out of bounds of the set of functions available to them.
Gateway
Provider
Custom
Claude Sonnet 4.5
app/actions.ts
```
`
const sendMessage = (prompt: string) =\>
generateText({
model: "anthropic/claude-sonnet-4.5",
system: 'you are a friendly weather assistant!',
prompt,
tools: {
getWeather: {
description: 'Get the weather in a location',
inputSchema: z.object({
location: z.string().describe('The location to get the weather for'),
}),
execute: async ({ location }: { location: string }) =\> ({
location,
temperature: 72 + Math.floor(Math.random() \* 21) - 10,
}),
},
},
});
sendMessage('What is the weather in San Francisco?'); // getWeather is called
sendMessage('What is the weather in New York?'); // getWeather is called
sendMessage('What events are happening in London?'); // No function is called
`
```
This way, it is possible to ensure that the generations result in deterministic outputs, while the choice a model makes still remains to be probabilistic.
This emergent ability exhibited by a language model to choose whether a function needs to be executed or not based on a user query is believed to be models emulating "reasoning".
As a result, the combination of language models being able to reason which function to execute as well as render user interfaces at the same time gives you the ability to build applications where language models can be used as a router.
## [Language Models as Routers](#language-models-as-routers)
Historically, developers had to write routing logic that connected different parts of an application to be navigable by a user and complete a specific task.
In web applications today, most of the routing logic takes place in the form of routes:
* `/login` would navigate you to a page with a login form.
* `/user/john` would navigate you to a page with profile details about John.
* `/api/events?limit=5` would display the five most recent events from an events database.
While routes help you build web applications that connect different parts of an application into a seamless user experience, it can also be a burden to manage them as the complexity of applications grow.
Next.js has helped reduce complexity in developing with routes by introducing:
* File-based routing system
* Dynamic routing
* API routes
* Middleware
* App router, and so on...
With language models becoming better at reasoning, we believe that there is a future where developers only write core application specific components while models take care of routing them based on the user's state in an application.
With generative user interfaces, the language model decides which user interface to render based on the user's state in the application, giving users the flexibility to interact with your application in a conversational manner instead of navigating through a series of predefined routes.
### [Routing by parameters](#routing-by-parameters)
For routes like:
* `/profile/[username]`
* `/search?q=[query]`
* `/media/[id]`
that have segments dependent on dynamic data, the language model can generate the correct parameters and render the user interface.
For example, when you're in a search application, you can ask the language model to search for artworks from different artists. The language model will call the search function with the artist's name as a parameter and render the search results.
Art made by Van Gogh?
searchImages("Van Gogh")
Here are a few of his notable works
Starry Night
Sunflowers
Olive Trees
Wow, these look great! How about Monet?
searchImages("Monet")
Sure! Here are a few of his paintings
Frau im Gartenfrau
Cliff Walk
Waves
Media Search
Let your users see more than words can say by rendering components directly within your search experience.
### [Routing by sequence](#routing-by-sequence)
For actions that require a sequence of steps to be completed by navigating through different routes, the language model can generate the correct sequence of routes to complete in order to fulfill the user's request.
For example, when you're in a calendar application, you can ask the language model to schedule a happy hour evening with your friends. The language model will then understand your request and will perform the right sequence of [tool calls](/docs/ai-sdk-core/tools-and-tool-calling) to:
1. Lookup your calendar
2. Lookup your friends' calendars
3. Determine the best time for everyone
4. Search for nearby happy hour spots
5. Create an event and send out invites to your friends
I'd like to get drinks with Max tomorrow evening after studio!
searchContacts("Max")
max
@mleiter
shu
@shuding
getEvents("2023-10-18", ["jrmy", "mleiter"])
4PM
5PM
6PM
7PM
studio
4-6 PM
searchNearby("Bar")
wild colonial
200m
the eddy
1.3km
createEvent("2023-10-18", ["jrmy", "mleiter"])
4PM
5PM
6PM
7PM
studio
4-6 PM
Drinks at Wild Colonial
6-7 PM
Exciting! Max is free around that time and Wild Colonial is right around the corner, would you like me to mark it on your calendar?
Sure, sounds good!
Planning an Event
The model calls functions and generates interfaces based on user intent, acting like a router.
Just by defining functions to lookup contacts, pull events from a calendar, and search for nearby locations, the model is able to sequentially navigate the routes for you.
To learn more, check out these [examples](/examples/next-app/interface) using the `streamUI` function to stream generative user interfaces to the client based on the response from the language model.
On this page
[Generative User Interfaces](#generative-user-interfaces)
[Deterministic Routes and Probabilistic Routing](#deterministic-routes-and-probabilistic-routing)
[Language Models as Routers](#language-models-as-routers)
[Routing by parameters](#routing-by-parameters)
[Routing by sequence](#routing-by-sequence)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)