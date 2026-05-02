Web search tool (`google\_web\_search`) | Gemini CLI
[Skip to content](#_top)
# Web search tool (`google\_web\_search`)
Copy as Markdown Copied!
The `google\_web\_search` tool allows the Gemini agent to retrieve up-to-date
information, news, and facts from the internet via Google Search.
## Technical reference
[Section titled “Technical reference”](#technical-reference)
The agent uses this tool when your request requires knowledge of current events
or specific online documentation not available in its internal training data.
### Arguments
[Section titled “Arguments”](#arguments)
* `query` (string, required): The search query to be executed.
## Technical behavior
[Section titled “Technical behavior”](#technical-behavior)
* **Grounding:** Returns a generated summary based on search results.
* **Citations:** Includes source URIs and titles for factual grounding.
* **Processing:** The Gemini API processes the search results before returning a
synthesized response to the agent.
## Use cases
[Section titled “Use cases”](#use-cases)
* Researching the latest version of a software library or API.
* Finding solutions to recent software bugs or security vulnerabilities.
* Retrieving news or documentation updated after the model’s knowledge cutoff.
## Next steps
[Section titled “Next steps”](#next-steps)
* Follow the [Web tools guide](/docs/cli/tutorials/web-tools) for practical
usage examples.
* Explore the [Web fetch tool reference](/docs/tools/web-fetch) for direct URL access.
Last updated: Feb 13, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.