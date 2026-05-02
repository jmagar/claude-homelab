Headless mode reference | Gemini CLI
[Skip to content](#_top)
# Headless mode reference
Copy as Markdown Copied!
Headless mode provides a programmatic interface to Gemini CLI, returning
structured text or JSON output without an interactive terminal UI.
## Technical reference
[Section titled “Technical reference”](#technical-reference)
Headless mode is triggered when the CLI is run in a non-TTY environment or when
providing a query with the `-p` (or `--prompt`) flag.
### Output formats
[Section titled “Output formats”](#output-formats)
You can specify the output format using the `--output-format` flag.
#### JSON output
[Section titled “JSON output”](#json-output)
Returns a single JSON object containing the response and usage statistics.
* **Schema:**
* `response`: (string) The model’s final answer.
* `stats`: (object) Token usage and API latency metrics.
* `error`: (object, optional) Error details if the request failed.
#### Streaming JSON output
[Section titled “Streaming JSON output”](#streaming-json-output)
Returns a stream of newline-delimited JSON (JSONL) events.
* **Event types:**
* `init`: Session metadata (session ID, model).
* `message`: User and assistant message chunks.
* `tool\_use`: Tool call requests with arguments.
* `tool\_result`: Output from executed tools.
* `error`: Non-fatal warnings and system errors.
* `result`: Final outcome with aggregated statistics and per-model token usage
breakdowns.
## Exit codes
[Section titled “Exit codes”](#exit-codes)
The CLI returns standard exit codes to indicate the result of the headless
execution:
* `0`: Success.
* `1`: General error or API failure.
* `42`: Input error (invalid prompt or arguments).
* `53`: Turn limit exceeded.
## Next steps
[Section titled “Next steps”](#next-steps)
* Follow the [Automation tutorial](/docs/cli/tutorials/automation) for practical
scripting examples.
* See the [CLI reference](/docs/cli/cli-reference) for all available flags.
Last updated: Mar 10, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.