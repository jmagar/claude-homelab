Web fetch tool (`web\_fetch`) | Gemini CLI
[Skip to content](#_top)
# Web fetch tool (`web\_fetch`)
Copy as Markdown Copied!
The `web\_fetch` tool allows the Gemini agent to retrieve and process content
from specific URLs provided in your prompt.
## Technical reference
[Section titled “Technical reference”](#technical-reference)
The agent uses this tool when you include URLs in your prompt and request
specific operations like summarization or extraction.
### Arguments
[Section titled “Arguments”](#arguments)
* `prompt` (string, required): A request containing up to 20 valid URLs
(starting with `http://` or `https://`) and instructions on how to process
them.
## Technical behavior
[Section titled “Technical behavior”](#technical-behavior)
* **Confirmation:** Triggers a confirmation dialog showing the converted URLs.
* **Plan Mode:** In [Plan Mode](/docs/cli/plan-mode), `web\_fetch` is available
but always requires explicit user confirmation (`ask\_user`) due to security
implications of accessing external or private network addresses.
* **Processing:** Uses the Gemini API’s `urlContext` for retrieval.
* **Fallback:** If API access fails, the tool attempts to fetch raw content
directly from your local machine.
* **Formatting:** Returns a synthesized response with source attribution.
## Use cases
[Section titled “Use cases”](#use-cases)
* Summarizing technical articles or blog posts.
* Comparing data between two or more web pages.
* Extracting specific information from a documentation site.
## Next steps
[Section titled “Next steps”](#next-steps)
* Follow the [Web tools guide](/docs/cli/tutorials/web-tools) for practical
usage examples.
* See the [Web search tool reference](/docs/tools/web-search) for general queries.
Last updated: Apr 1, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.