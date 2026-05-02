Practical guide to data-intensive apps with the Realtime API
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ Home ](/cookbook)
### Topics
* [ Agents ](/cookbook/topic/agents)
* [ Evals ](/cookbook/topic/evals)
* [ Multimodal ](/cookbook/topic/multimodal)
* [ Text ](/cookbook/topic/text)
* [ Guardrails ](/cookbook/topic/guardrails)
* [ Optimization ](/cookbook/topic/optimization)
* [ ChatGPT ](/cookbook/topic/chatgpt)
* [ Codex ](/cookbook/topic/codex)
* [ gpt-oss ](/cookbook/topic/gpt-oss)
### Contribute
* [ Cookbook on GitHub ](https://github.com/openai/openai-cookbook)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Copy Page
May 29, 2025
# Practical guide to data-intensive apps with the Realtime API
[ AG ](https://www.linkedin.com/in/alistair-gillespie/)[ RK ](https://robinkoenig.com)[ PH ](https://www.linkedin.com/in/phundal/)
[ Alistair Gillespie , ](https://www.linkedin.com/in/alistair-gillespie/)[ Robin Koenig
(OpenAI)
, ](https://robinkoenig.com)[ Patrick Hundal ](https://www.linkedin.com/in/phundal/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Data-intensive-Realtime-apps.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Data-intensive-Realtime-apps.ipynb)
This cookbook serves as a practical guide to help AI Engineers maximize the effectiveness of OpenAI’s Realtime API, specifically when dealing with data-intensive function calls. We’ll focus on scenarios common in speech-to-speech agents, where vast amounts of data must be handled smoothly and efficiently.
This post won’t cover the basics of setting up a Realtime API solution. Instead, you’ll gain clear insights and actionable strategies to enhance the performance and reliability of your real-time conversational agents. It addresses specific challenges unique to handling large amounts of data in real-time conversational contexts.
### What is the Realtime API?
Before we dive in, let’s quickly recap the API for those who are new. The OpenAI Realtime API is a recent offering that supports low-latency, multimodal interactions—such as speech-to-speech conversations and live transcription. Picture scenarios like real-time voice-based customer support or live movie transcriptions.
### What is a data-intensive function call?
Agents need access to tools and relevant data to perform their tasks. For instance, a financial analyst agent might pull real-time market data. In many cases, services already exist in your environment that expose this information through APIs.
Historically, APIs weren’t designed with agents in mind and often return large volumes of data, depending on the service. As engineers, we frequently wrap these APIs with function calls to accelerate agent development—which makes perfect sense. Why reinvent what already exists?
If not carefully optimized, these data-intensive function calls can quickly overwhelm the Realtime API—leading to slow responses or even failures to process user requests.
### Setting the stage
Our example centers on an NBA Scouting Agent that calls multiple functions to deliver in-depth analysis of upcoming draft prospects. To demonstrate practical guidelines for Realtime API interactions, we use large, realistic payloads inspired by NBA draft prospects. Below, you’ll find a monolithic `searchDraftProspects` function defined in the Realtime session to set the stage.
```
`// "Hey, pull up point guards projected in the top 10 in the 2025 draft"
{
"type": "session.update",
"session": {
"tools": [
{
"type": "function",
"name": "searchDraftProspects",
"description": "Search draft prospects for a given year e.g., Point Guard",
"parameters": {
"type": "object",
"properties": {
"sign": {
"type": "string",
"description": "The player position",
"enum": [
"Point Guard",
"Shooting Guard",
"Small Forward",
"Power Forward",
"Center",
"Any"
]
},
year: { type: "number", description: "Draft year e.g., 2025" },
mockDraftRanking: { type: "number", description: "Predicted Draft Ranking" },
},
"required": ["position", "year"]
}
}
],
"tool\_choice": "auto",
}
}`
```
The searchDraftProspects function call returns a hefty payload. The example’s structure and size are drawn from real-world scenarios we’ve encountered.
```
`// Example Payload
{
"status": {
"code": 200,
"message": "SUCCESS"
},
"found": 4274,
"offset": 0,
"limit": 10,
"data": [
{
"prospectId": 10001,
"data": {
"ProspectInfo": {
"league": "NCAA",
"collegeId": 301,
"isDraftEligible": true,
"Player": {
"personalDetails": {
"firstName": "Jalen",
"lastName": "Storm",
"dateOfBirth": "2003-01-15",
"nationality": "USA"
},
"physicalAttributes": {
"position": "PG",
"height": {
"feet": 6,
"inches": 4
},
"weightPounds": 205
},
"hometown": {
"city": "Springfield",
"state": "IL"
}
},
"TeamInfo": {
"collegeTeam": "Springfield Tigers",
"conference": "Big West",
"teamRanking": 12,
"coach": {
"coachId": 987,
"coachName": "Marcus Reed",
"experienceYears": 10
}
}
},
"Stats": {
"season": "2025",
"gamesPlayed": 32,
"minutesPerGame": 34.5,
"shooting": {
"FieldGoalPercentage": 47.2,
"ThreePointPercentage": 39.1,
"FreeThrowPercentage": 85.6
},
"averages": {
"points": 21.3,
"rebounds": 4.1,
"assists": 6.8,
"steals": 1.7,
"blocks": 0.3
}
},
"Scouting": {
"evaluations": {
"strengths": ["Court vision", "Clutch shooting"],
"areasForImprovement": ["Defensive consistency"]
},
"scouts": [
{
"scoutId": 501,
"name": "Greg Hamilton",
"organization": "National Scouting Bureau"
}
]
},
"DraftProjection": {
"mockDraftRanking": 5,
"lotteryPickProbability": 88,
"historicalComparisons": [
{
"player": "Chris Paul",
"similarityPercentage": 85
}
]
},
"Media": {
"highlightReelUrl": "https://example.com/highlights/jalen-storm",
"socialMedia": {
"twitter": "@jstorm23",
"instagram": "@jstorm23\_ig"
}
},
"Agent": {
"agentName": "Rick Allen",
"agency": "Elite Sports Management",
"contact": {
"email": "rallen@elitesports.com",
"phone": "555-123-4567"
}
}
}
},
// ... Many thousands of tokens later.
]
}`
```
## Guiding principles
### 1. Break down unwieldy functions into smaller ones with clear roles and responsibilities
It almost goes without saying—when building function calls, your top priority is to design clear, well-defined functions. This makes it easy to trim response sizes and avoid overwhelming the model. Each function call should be straightforward to explain, sharply scoped, and return only the information needed for its purpose. Overlapping responsibilities between functions inevitably invites confusion.
For example, we can limit the `searchDraftProspects` function call to return only general details—such as player stats—for each prospect, dramatically reducing the response size. If more information is needed, the new `getProspectDetails` function call provides expanded details. There’s no universal solution; the right approach depends on your use case and data model.
```
`{
"tools": [
{
"type": "function",
"name": "searchDraftProspects",
"description": "Search NBA draft prospects by position, draft year, and projected ranking, returning only general statistics to optimize response size.",
"parameters": {
"type": "object",
"properties": {
"position": {
"type": "string",
"description": "The player's basketball position.",
"enum": [
"Point Guard",
"Shooting Guard",
"Small Forward",
"Power Forward",
"Center",
"Any"
]
},
"year": {
"type": "number",
"description": "Draft year, e.g., 2025"
},
"maxMockDraftRanking": {
"type": "number",
"description": "Maximum predicted draft ranking (e.g., top 10)"
}
},
"required": ["position", "year"]
}
},
{
"type": "function",
"name": "getProspectDetails",
"description": "Fetch detailed information for a specific NBA prospect, including comprehensive stats, agent details, and scouting reports.",
"parameters": {
"type": "object",
"properties": {
"playerName": {
"type": "string",
"description": "Full name of the prospect (e.g., Jalen Storm)"
},
"year": {
"type": "number",
"description": "Draft year, e.g., 2025"
},
"includeAgentInfo": {
"type": "boolean",
"description": "Include agent information"
},
"includeStats": {
"type": "boolean",
"description": "Include detailed player statistics"
},
"includeScoutingReport": {
"type": "boolean",
"description": "Include scouting report details"
}
},
"required": ["playerName", "year"]
}
}
],
"tool\_choice": "auto"
}`
```
### 2. As conversations unfold, optimize the context
Realtime conversations allow for generous 30-minute sessions—but the rolling context window only supports \~16,000 tokens (depending on the model snapshot, context window limitations are improving). As a result, you may notice performance gradually decline during extended exchanges. As conversations progress and more function calls are made, the conversation state can expand quickly with both important information and unnecessary noise—so it’s important to focus on keeping the most relevant details. This approach helps maintain strong performance and reduces cost.
**i) Periodically summarize the conversation state**
Periodically summarizing the conversation as it unfolds is an excellent way to reduce context size—cutting both cost and latency.
See @Minhajul’s’ epic guide on implementing automatic summarization in Realtime conversations ([link](https://cookbook.openai.com/examples/context_summarization_with_realtime_api)).
**ii) Periodically remind the the model of its role and responsibilities**
Data-heavy payloads can quickly fill the context window. If you notice the model losing track of instructions or available tools, periodically remind it of its system prompt and tools by calling `session.update`—this keeps it focused on its role and responsibilities.
### 3. Data processing and optimization
**i) Use filtering in your function calls to trim data-heavy responses down to only the essential fields needed to answer the question**
Generally, fewer tokens returned by function calls lead to better quality responses. Common pitfalls occur when function calls return excessively large payloads spanning thousands of tokens. Focus on applying filters in each function call, either at the data-level or function-level, to minimize response sizes.
```
`// Filtered response
{
"status": {
"code": 200,
"message": "SUCCESS"
},
"found": 4274,
"offset": 0,
"limit": 5,
"data": [
{
"zpid": 7972122,
"data": {
"PropertyInfo": {
"houseNumber": "19661",
"directionPrefix": "N ",
"streetName": "Central",
"streetSuffix": "Ave",
"city": "Phoenix",
"state": "AZ",
"postalCode": "85024",
"zipPlusFour": "1641"
"bedroomCount": 2,
"bathroomCount": 2,
"storyCount": 1,
"livingAreaSize": 1089,
"livingAreaSizeUnits": "Square Feet",
"yearBuilt": "1985"
}
}
}
]
// ...
}`
```
**ii) Flatten hierarchical payloads—without losing key information**
Hierarchical payloads from API calls can sometimes include repeated level titles—like “ProspectInfo” or “Stats”—which may add extra noise and make things harder for the model to process. As you explore ways to make your data more efficient, you might try flattening these structures by trimming away some of the unnecessary labels. This can help improve performance, but consider what information is important to keep for your particular use case.
```
`// Flattened payload
{
"status": {
"code": 200,
"message": "SUCCESS"
},
"found": 4274,
"offset": 0,
"limit": 2,
"data": [
{
"prospectId": 10001,
"league": "NCAA",
"collegeId": 301,
"isDraftEligible": true,
"firstName": "Jalen",
"lastName": "Storm",
"position": "PG",
"heightFeet": 6,
"heightInches": 4,
"weightPounds": 205,
"hometown": "Springfield",
"state": "IL",
"collegeTeam": "Springfield Tigers",
"conference": "Big West",
"teamRanking": 12,
"coachId": 987,
"coachName": "Marcus Reed",
"gamesPlayed": 32,
"minutesPerGame": 34.5,
"FieldGoalPercentage": 47.2,
"ThreePointPercentage": 39.1,
"FreeThrowPercentage": 85.6,
"averagePoints": 21.3,
"averageRebounds": 4.1,
"averageAssists": 6.8,
"stealsPerGame": 1.7,
"blocksPerGame": 0.3,
"strengths": ["Court vision", "Clutch shooting"],
"areasForImprovement": ["Defensive consistency"],
"mockDraftRanking": 5,
"lotteryPickProbability": 88,
"highlightReelUrl": "https://example.com/highlights/jalen-storm",
"agentName": "Rick Allen",
"agency": "Elite Sports Management",
"contactEmail": "rallen@elitesports.com"
},
...
}`
```
**iii) Experiment with different data formats**
The way you structure your data has a direct impact on how well the model processes and summarizes API responses. In our experience, clear, key-based formats like JSON or YAML help the model interpret data more accurately than tabular formats such as Markdown. Large tables, especially, tend to overwhelm the model—resulting in less fluent and less accurate outputs. Still, it’s worth experimenting with different formats to find what works best for your use case.
```
`status:
code: 200
message: "SUCCESS"
found: 4274
offset: 0
limit: 10
data:
- prospectId: 10001
data:
ProspectInfo:
league: "NCAA"
collegeId: 301
isDraftEligible: true
Player:
firstName: "Jalen"
lastName: "Storm"
position: "PG"
heightFeet: 6
heightInches: 4
weightPounds: 205
hometown: "Springfield"
state: "IL"
TeamInfo:
collegeTeam: "Springfield Tigers"
conference: "Big West"
teamRanking: 12
coachId: 987
coachName: "Marcus Reed"
Stats:
gamesPlayed: 32
minutesPerGame: 34.5
FieldGoalPercentage: 47.2
ThreePointPercentage: 39.1
FreeThrowPercentage: 85.6
averagePoints: 21.3
averageRebounds: 4.1
averageAssists: 6.8
stealsPerGame: 1.7
blocksPerGame: 0.3
Scouting:
strengths:
- "Court vision"
- "Clutch shooting"
areasForImprovement:
- "Defensive consistency"
DraftProjection:
mockDraftRanking: 5
lotteryPickProbability: 88
Media:
highlightReelUrl: "https://example.com/highlights/jalen-storm"
Agent:
agentName: "Rick Allen"
agency: "Elite Sports Management"
contactEmail: "rallen@elitesports.com"`
```
## 4. After data-heavy function calls, follow up with hint prompts
Underlying models often struggle to transition smoothly from data-heavy responses to accurate answers. To improve fluency and accuracy when working with complex data, provide a function call hint immediately after the function call. These hints guide the model on the specific task—teaching it how to interpret key fields and domain-specific values.
The following example illustrates an effective hint prompt.
```
`// Function call hint
let prospectSearchPrompt = `
Parse NBA prospect data and provide a concise, engaging response.
General Guidelines
- Act as an NBA scouting expert.
- Highlight key strengths and notable attributes.
- Use conversational language.
- Mention identical attributes once.
- Ignore IDs and URLs.
Player Details
- State height conversationally ("six-foot-eight").
- Round weights to nearest 5 lbs.
Stats & Draft Info
- Round stats to nearest whole number.
- Use general terms for draft ranking ("top-five pick").
Experience
- Refer to players as freshman, sophomore, etc., or mention professional experience.
- Location & TeamMention hometown city and state/country.
- Describe teams conversationally.
Skip (unless asked explicitly)
- Exact birth dates
- IDs
- Agent/contact details
- URLs
Examples
- "Jalen Storm, a dynamic six-foot-four point guard from Springfield, Illinois, averages 21 points per game."
- "Known for his clutch shooting, he's projected as a top-five pick."
Important: Respond based strictly on provided data, without inventing details.
`;`
```
In practice, we first append the function call result to the conversation. Then, we emit a response from the Realtime API with the hint prompt. Voilà—the model gracefully handles all the information.
```
`// Add new conversation item for the model
const conversationItem = {
type: 'conversation.item.create',
previous\_item\_id: output.id,
item: {
call\_id: output.call\_id,
type: 'function\_call\_output',
output: `Draft Prospect Search Results: ${result}`
}
};
dataChannel.send(JSON.stringify(conversationItem));
// Emit a response from the model including the hint prompt
const event = {
type: 'response.create',
conversation: "none",
response: {
instructions: prospectSearchPrompt # function call hint
}
};
dataChannel.send(JSON.stringify(event));`
```
## Wrapping up
Building effective agents with the Realtime API is an ongoing process of exploration and adaptation.
**Summary of Key Recommendations**
* **Filter data:** Only include fields and details that are directly relevant to the user’s request or the model’s next step. Trim the rest.
* **Flatten and simplify structures:** Reduce deeply nested or redundant data. Present information in a way that’s easy for both models and humans to scan.
* **Prefer clear, structured formats:** Use JSON (or YAML) with consistent field names and minimal noise. Avoid large tables or markdown for data-heavy responses.
* **Guide the model with hint prompts:** After returning lots of data, follow up with a targeted prompt that explains exactly what the model should extract or summarize.
Remember—experimentation is essential. Realtime models keep improving, and we’ll continue sharing tips to help you get the most out of the Realtime API.