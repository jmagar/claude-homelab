Tools reference | Gemini CLI
[Skip to content](#_top)
# Tools reference
Copy as Markdown Copied!
Gemini CLI uses tools to interact with your local environment, access
information, and perform actions on your behalf. These tools extend the model’s
capabilities beyond text generation, letting it read files, execute commands,
and search the web.
## How to use Gemini CLI’s tools
[Section titled “How to use Gemini CLI’s tools”](#how-to-use-gemini-clis-tools)
Tools are generally invoked automatically by Gemini CLI when it needs to perform
an action. However, you can also trigger specific tools manually using shorthand
syntax.
### Automatic execution and security
[Section titled “Automatic execution and security”](#automatic-execution-and-security)
When the model wants to use a tool, Gemini CLI evaluates the request against its
security policies.
* **User confirmation:** You must manually approve tools that modify files or
execute shell commands (mutators). The CLI shows you a diff or the exact
command before you confirm.
* **Sandboxing:** You can run tool executions in secure, containerized
environments to isolate changes from your host system. For more details, see
the [Sandboxing](/docs/cli/sandbox) guide.
* **Trusted folders:** You can configure which directories allow the model to
use system tools. For more details, see the
[Trusted folders](/docs/cli/trusted-folders) guide.
Review confirmation prompts carefully before allowing a tool to execute.
### How to use manually-triggered tools
[Section titled “How to use manually-triggered tools”](#how-to-use-manually-triggered-tools)
You can directly trigger key tools using special syntax in your prompt:
* **[File access](/docs/tools/file-system#read_many_files) (`@`):** Use the `@`
symbol followed by a file or directory path to include its content in your
prompt. This triggers the `read\_many\_files` tool.
* **[Shell commands](/docs/tools/shell) (`!`):** Use the `!` symbol followed by
a system command to execute it directly. This triggers the `run\_shell\_command`
tool.
## How to manage tools
[Section titled “How to manage tools”](#how-to-manage-tools)
Using built-in commands, you can inspect available tools and configure how they
behave.
### Tool discovery
[Section titled “Tool discovery”](#tool-discovery)
Use the `/tools` command to see what tools are currently active in your session.
* **`/tools`**: Lists all registered tools with their display names.
* **`/tools desc`**: Lists all tools with their full descriptions.
This is especially useful for verifying that
[MCP servers](/docs/tools/mcp-server) or custom tools are loaded correctly.
### Tool configuration
[Section titled “Tool configuration”](#tool-configuration)
You can enable, disable, or configure specific tools in your settings. For
example, you can set a specific pager for shell commands or configure the
browser used for web searches. See the [Settings](/docs/cli/settings) guide for
details.
## Available tools
[Section titled “Available tools”](#available-tools)
The following sections list all available tools, categorized by their primary
function. For detailed parameter information, see the linked documentation for
each tool.
### Execution
[Section titled “Execution”](#execution)
|Tool|Kind|Description|
|[`run\_shell\_command`](/docs/tools/shell)|`Execute`|Executes arbitrary shell commands. Supports interactive sessions and background processes. Requires manual confirmation.|
### File System
[Section titled “File System”](#file-system)
|Tool|Kind|Description|
|[`glob`](/docs/tools/file-system)|`Search`|Finds files matching specific glob patterns across the workspace.|
|[`grep\_search`](/docs/tools/file-system)|`Search`|Searches for a regular expression pattern within file contents. Legacy alias: `search\_file\_content`.|
|[`list\_directory`](/docs/tools/file-system)|`Read`|Lists the names of files and subdirectories within a specified path.|
|[`read\_file`](/docs/tools/file-system)|`Read`|Reads the content of a specific file. Supports text, images, audio, and PDF.|
|[`read\_many\_files`](/docs/tools/file-system)|`Read`|Reads and concatenates content from multiple files. Often triggered by the `@` symbol in your prompt.|
|[`replace`](/docs/tools/file-system)|`Edit`|Performs precise text replacement within a file. Requires manual confirmation.|
|[`write\_file`](/docs/tools/file-system)|`Edit`|Creates or overwrites a file with new content. Requires manual confirmation.|
### Interaction
[Section titled “Interaction”](#interaction)
|Tool|Kind|Description|
|[`ask\_user`](/docs/tools/ask-user)|`Communicate`|Requests clarification or missing information via an interactive dialog.|
|[`write\_todos`](/docs/tools/todos)|`Other`|Maintains an internal list of subtasks. The model uses this to track its own progress.|
### Task Tracker (Experimental)
[Section titled “Task Tracker (Experimental)”](#task-tracker-experimental)
This is an experimental feature currently under active development. Enable via `experimental.taskTracker`.
|Tool|Kind|Description|
|[`tracker\_create\_task`](/docs/tools/tracker)|`Other`|Creates a new task in the experimental tracker.|
|[`tracker\_update\_task`](/docs/tools/tracker)|`Other`|Updates an existing task’s status, description, or dependencies.|
|[`tracker\_get\_task`](/docs/tools/tracker)|`Other`|Retrieves the full details of a specific task.|
|[`tracker\_list\_tasks`](/docs/tools/tracker)|`Other`|Lists tasks in the tracker, optionally filtered by status, type, or parent.|
|[`tracker\_add\_dependency`](/docs/tools/tracker)|`Other`|Adds a dependency between two tasks, ensuring topological execution.|
|[`tracker\_visualize`](/docs/tools/tracker)|`Other`|Renders an ASCII tree visualization of the current task graph.|
### MCP
[Section titled “MCP”](#mcp)
|Tool|Kind|Description|
|[`list\_mcp\_resources`](/docs/tools/mcp-resources)|`Search`|Lists all available resources exposed by connected MCP servers.|
|[`read\_mcp\_resource`](/docs/tools/mcp-resources)|`Read`|Reads the content of a specific Model Context Protocol (MCP) resource.|
### Memory
[Section titled “Memory”](#memory)
|Tool|Kind|Description|
|[`activate\_skill`](/docs/tools/activate-skill)|`Other`|Loads specialized procedural expertise from the `.gemini/skills` directory.|
|[`get\_internal\_docs`](/docs/tools/internal-docs)|`Think`|Accesses Gemini CLI’s own documentation for accurate answers about its capabilities.|
|[`save\_memory`](/docs/tools/memory)|`Think`|Persists specific facts and project details to your `GEMINI.md` file.|
### Planning
[Section titled “Planning”](#planning)
|Tool|Kind|Description|
|[`enter\_plan\_mode`](/docs/tools/planning)|`Plan`|Switches the CLI to a safe, read-only “Plan Mode” for researching complex changes.|
|[`exit\_plan\_mode`](/docs/tools/planning)|`Plan`|Finalizes a plan, presents it for review, and requests approval to start implementation.|
### System
[Section titled “System”](#system)
|Tool|Kind|Description|
|`complete\_task`|`Other`|Finalizes a subagent’s mission and returns the result to the parent agent. This tool is not available to the user.|
### Task Tracking
[Section titled “Task Tracking”](#task-tracking)
|Tool|Kind|Description|
|`tracker\_add\_dependency`|`Think`|Adds a dependency between two existing tasks in the tracker.|
|`tracker\_create\_task`|`Think`|Creates a new task in the internal tracker to monitor progress.|
|`tracker\_get\_task`|`Think`|Retrieves the details and current status of a specific tracked task.|
|`tracker\_list\_tasks`|`Think`|Lists all tasks currently being tracked.|
|`tracker\_update\_task`|`Think`|Updates the status or details of an existing task.|
|`tracker\_visualize`|`Think`|Generates a visual representation of the current task dependency graph.|
|`update\_topic`|`Think`|Updates the current topic and status to keep the user informed of progress.|
### Web
[Section titled “Web”](#web)
|Tool|Kind|Description|
|[`google\_web\_search`](/docs/tools/web-search)|`Search`|Performs a Google Search to find up-to-date information.|
|[`web\_fetch`](/docs/tools/web-fetch)|`Fetch`|Retrieves and processes content from specific URLs. **Warning:** This tool can access local and private network addresses (for example, localhost), which may pose a security risk if used with untrusted prompts. In Plan Mode, this tool requires explicit user confirmation.|
## Under the hood
[Section titled “Under the hood”](#under-the-hood)
For developers, the tool system is designed to be extensible and robust. The
`ToolRegistry` class manages all available tools.
You can extend Gemini CLI with custom tools by configuring
`tools.discoveryCommand` in your settings or by connecting to MCP servers.
For a deep dive into the internal Tool API and how to implement your
own tools in the codebase, see the `packages/core/src/tools/` directory in
GitHub.
## Next steps
[Section titled “Next steps”](#next-steps)
* Learn how to [Set up an MCP server](/docs/tools/mcp-server).
* Explore [Agent Skills](/docs/cli/skills) for specialized expertise.
* See the [Command reference](/docs/reference/commands) for slash commands.
Last updated: Apr 20, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.