Agents: Workflow Patterns
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
[Reference](/docs/reference)
[AI SDK Core](/docs/reference/ai-sdk-core)
[AI SDK UI](/docs/reference/ai-sdk-ui)
[AI SDK RSC](/docs/reference/ai-sdk-rsc)
[AI SDK Errors](/docs/reference/ai-sdk-errors)
[Migration Guides](/docs/migration-guides)
[Troubleshooting](/docs/troubleshooting)
Copy markdown
# [Workflow Patterns](#workflow-patterns)
Combine the building blocks from the [overview](/docs/agents/overview) with these patterns to add structure and reliability to your agents:
* [Sequential Processing](#sequential-processing-chains) - Steps executed in order
* [Parallel Processing](#parallel-processing) - Independent tasks run simultaneously
* [Evaluation/Feedback Loops](#evaluator-optimizer) - Results checked and improved iteratively
* [Orchestration](#orchestrator-worker) - Coordinating multiple components
* [Routing](#routing) - Directing work based on context
## [Choose Your Approach](#choose-your-approach)
Consider these key factors:
* **Flexibility vs Control** - How much freedom does the LLM need vs how tightly you must constrain its actions?
* **Error Tolerance** - What are the consequences of mistakes in your use case?
* **Cost Considerations** - More complex systems typically mean more LLM calls and higher costs
* **Maintenance** - Simpler architectures are easier to debug and modify
**Start with the simplest approach that meets your needs**. Add complexity only when required by:
1. Breaking down tasks into clear steps
2. Adding tools for specific capabilities
3. Implementing feedback loops for quality control
4. Introducing multiple agents for complex workflows
Let's look at examples of these patterns in action.
## [Patterns with Examples](#patterns-with-examples)
These patterns, adapted from [Anthropic's guide on building effective agents](https://www.anthropic.com/research/building-effective-agents), serve as building blocks you can combine to create comprehensive workflows. Each pattern addresses specific aspects of task execution. Combine them thoughtfully to build reliable solutions for complex problems.
## [Sequential Processing (Chains)](#sequential-processing-chains)
The simplest workflow pattern executes steps in a predefined order. Each step's output becomes input for the next step, creating a clear chain of operations. Use this pattern for tasks with well-defined sequences, like content generation pipelines or data transformation processes.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText, Output } from 'ai';
import { z } from 'zod';
async function generateMarketingCopy(input: string) {
const model = "anthropic/claude-sonnet-4.5";
// First step: Generate marketing copy
const { text: copy } = await generateText({
model,
prompt: `Write persuasive marketing copy for: ${input}. Focus on benefits and emotional appeal.`,
});
// Perform quality check on copy
const { output: qualityMetrics } = await generateText({
model,
output: Output.object({
schema: z.object({
hasCallToAction: z.boolean(),
emotionalAppeal: z.number().min(1).max(10),
clarity: z.number().min(1).max(10),
}),
}),
prompt: `Evaluate this marketing copy for:
1. Presence of call to action (true/false)
2. Emotional appeal (1-10)
3. Clarity (1-10)
Copy to evaluate: ${copy}`,
});
// If quality check fails, regenerate with more specific instructions
if (
!qualityMetrics.hasCallToAction ||
qualityMetrics.emotionalAppeal \< 7 ||
qualityMetrics.clarity \< 7
) {
const { text: improvedCopy } = await generateText({
model,
prompt: `Rewrite this marketing copy with:
${!qualityMetrics.hasCallToAction ? '- A clear call to action' : ''}
${qualityMetrics.emotionalAppeal \< 7 ? '- Stronger emotional appeal' : ''}
${qualityMetrics.clarity \< 7 ? '- Improved clarity and directness' : ''}
Original copy: ${copy}`,
});
return { copy: improvedCopy, qualityMetrics };
}
return { copy, qualityMetrics };
}
`
```
## [Routing](#routing)
This pattern lets the model decide which path to take through a workflow based on context and intermediate results. The model acts as an intelligent router, directing the flow of execution between different branches of your workflow. Use this when handling varied inputs that require different processing approaches. In the example below, the first LLM call's results determine the second call's model size and system prompt.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText, Output } from 'ai';
import { z } from 'zod';
async function handleCustomerQuery(query: string) {
const model = "anthropic/claude-sonnet-4.5";
// First step: Classify the query type
const { output: classification } = await generateText({
model,
output: Output.object({
schema: z.object({
reasoning: z.string(),
type: z.enum(['general', 'refund', 'technical']),
complexity: z.enum(['simple', 'complex']),
}),
}),
prompt: `Classify this customer query:
${query}
Determine:
1. Query type (general, refund, or technical)
2. Complexity (simple or complex)
3. Brief reasoning for classification`,
});
// Route based on classification
// Set model and system prompt based on query type and complexity
const { text: response } = await generateText({
model:
classification.complexity === 'simple'
? 'openai/gpt-4o-mini'
: 'openai/o4-mini',
system: {
general:
'You are an expert customer service agent handling general inquiries.',
refund:
'You are a customer service agent specializing in refund requests. Follow company policy and collect necessary information.',
technical:
'You are a technical support specialist with deep product knowledge. Focus on clear step-by-step troubleshooting.',
}[classification.type],
prompt: query,
});
return { response, classification };
}
`
```
## [Parallel Processing](#parallel-processing)
Break down tasks into independent subtasks that execute simultaneously. This pattern uses parallel execution to improve efficiency while maintaining the benefits of structured workflows. For example, analyze multiple documents or process different aspects of a single input concurrently (like code review).
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText, Output } from 'ai';
import { z } from 'zod';
// Example: Parallel code review with multiple specialized reviewers
async function parallelCodeReview(code: string) {
const model = "anthropic/claude-sonnet-4.5";
// Run parallel reviews
const [securityReview, performanceReview, maintainabilityReview] =
await Promise.all([
generateText({
model,
system:
'You are an expert in code security. Focus on identifying security vulnerabilities, injection risks, and authentication issues.',
output: Output.object({
schema: z.object({
vulnerabilities: z.array(z.string()),
riskLevel: z.enum(['low', 'medium', 'high']),
suggestions: z.array(z.string()),
}),
}),
prompt: `Review this code:
${code}`,
}),
generateText({
model,
system:
'You are an expert in code performance. Focus on identifying performance bottlenecks, memory leaks, and optimization opportunities.',
output: Output.object({
schema: z.object({
issues: z.array(z.string()),
impact: z.enum(['low', 'medium', 'high']),
optimizations: z.array(z.string()),
}),
}),
prompt: `Review this code:
${code}`,
}),
generateText({
model,
system:
'You are an expert in code quality. Focus on code structure, readability, and adherence to best practices.',
output: Output.object({
schema: z.object({
concerns: z.array(z.string()),
qualityScore: z.number().min(1).max(10),
recommendations: z.array(z.string()),
}),
}),
prompt: `Review this code:
${code}`,
}),
]);
const reviews = [
{ ...securityReview.output, type: 'security' },
{ ...performanceReview.output, type: 'performance' },
{ ...maintainabilityReview.output, type: 'maintainability' },
];
// Aggregate results using another model instance
const { text: summary } = await generateText({
model,
system: 'You are a technical lead summarizing multiple code reviews.',
prompt: `Synthesize these code review results into a concise summary with key actions:
${JSON.stringify(reviews, null, 2)}`,
});
return { reviews, summary };
}
`
```
## [Orchestrator-Worker](#orchestrator-worker)
A primary model (orchestrator) coordinates the execution of specialized workers. Each worker optimizes for a specific subtask, while the orchestrator maintains overall context and ensures coherent results. This pattern excels at complex tasks requiring different types of expertise or processing.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText, Output } from 'ai';
import { z } from 'zod';
async function implementFeature(featureRequest: string) {
// Orchestrator: Plan the implementation
const { output: implementationPlan } = await generateText({
model: "anthropic/claude-sonnet-4.5",
output: Output.object({
schema: z.object({
files: z.array(
z.object({
purpose: z.string(),
filePath: z.string(),
changeType: z.enum(['create', 'modify', 'delete']),
}),
),
estimatedComplexity: z.enum(['low', 'medium', 'high']),
}),
}),
system:
'You are a senior software architect planning feature implementations.',
prompt: `Analyze this feature request and create an implementation plan:
${featureRequest}`,
});
// Workers: Execute the planned changes
const fileChanges = await Promise.all(
implementationPlan.files.map(async file =\> {
// Each worker is specialized for the type of change
const workerSystemPrompt = {
create:
'You are an expert at implementing new files following best practices and project patterns.',
modify:
'You are an expert at modifying existing code while maintaining consistency and avoiding regressions.',
delete:
'You are an expert at safely removing code while ensuring no breaking changes.',
}[file.changeType];
const { output: change } = await generateText({
model: "anthropic/claude-sonnet-4.5",
output: Output.object({
schema: z.object({
explanation: z.string(),
code: z.string(),
}),
}),
system: workerSystemPrompt,
prompt: `Implement the changes for ${file.filePath} to support:
${file.purpose}
Consider the overall feature context:
${featureRequest}`,
});
return {
file,
implementation: change,
};
}),
);
return {
plan: implementationPlan,
changes: fileChanges,
};
}
`
```
## [Evaluator-Optimizer](#evaluator-optimizer)
Add quality control to workflows with dedicated evaluation steps that assess intermediate results. Based on the evaluation, the workflow proceeds, retries with adjusted parameters, or takes corrective action. This creates robust workflows capable of self-improvement and error recovery.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText, Output } from 'ai';
import { z } from 'zod';
async function translateWithFeedback(text: string, targetLanguage: string) {
let currentTranslation = '';
let iterations = 0;
const MAX\_ITERATIONS = 3;
// Initial translation
const { text: translation } = await generateText({
model: "anthropic/claude-sonnet-4.5",
system: 'You are an expert literary translator.',
prompt: `Translate this text to ${targetLanguage}, preserving tone and cultural nuances:
${text}`,
});
currentTranslation = translation;
// Evaluation-optimization loop
while (iterations \< MAX\_ITERATIONS) {
// Evaluate current translation
const { output: evaluation } = await generateText({
model: "anthropic/claude-sonnet-4.5",
output: Output.object({
schema: z.object({
qualityScore: z.number().min(1).max(10),
preservesTone: z.boolean(),
preservesNuance: z.boolean(),
culturallyAccurate: z.boolean(),
specificIssues: z.array(z.string()),
improvementSuggestions: z.array(z.string()),
}),
}),
system: 'You are an expert in evaluating literary translations.',
prompt: `Evaluate this translation:
Original: ${text}
Translation: ${currentTranslation}
Consider:
1. Overall quality
2. Preservation of tone
3. Preservation of nuance
4. Cultural accuracy`,
});
// Check if quality meets threshold
if (
evaluation.qualityScore \>= 8 &&
evaluation.preservesTone &&
evaluation.preservesNuance &&
evaluation.culturallyAccurate
) {
break;
}
// Generate improved translation based on feedback
const { text: improvedTranslation } = await generateText({
model: "anthropic/claude-sonnet-4.5",
system: 'You are an expert literary translator.',
prompt: `Improve this translation based on the following feedback:
${evaluation.specificIssues.join('\\n')}
${evaluation.improvementSuggestions.join('\\n')}
Original: ${text}
Current Translation: ${currentTranslation}`,
});
currentTranslation = improvedTranslation;
iterations++;
}
return {
finalTranslation: currentTranslation,
iterationsRequired: iterations,
};
}
`
```
On this page
[Workflow Patterns](#workflow-patterns)
[Choose Your Approach](#choose-your-approach)
[Patterns with Examples](#patterns-with-examples)
[Sequential Processing (Chains)](#sequential-processing-chains)
[Routing](#routing)
[Parallel Processing](#parallel-processing)
[Orchestrator-Worker](#orchestrator-worker)
[Evaluator-Optimizer](#evaluator-optimizer)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)