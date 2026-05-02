Build an MCP server - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
In this tutorial, we’ll build a simple MCP weather server and connect it to a host, Claude for Desktop.
###
[​
](#what-we’ll-be-building)
What we’ll be building
We’ll build a server that exposes two tools: `get\_alerts` and `get\_forecast`. Then we’ll connect the server to an MCP host (in this case, Claude for Desktop):
Servers can connect to any client. We’ve chosen Claude for Desktop here for simplicity, but we also have guides on [building your own client](/docs/develop/build-client) as well as a [list of other clients here](/clients).
###
[​
](#core-mcp-concepts)
Core MCP Concepts
MCP servers can provide three main types of capabilities:
1. **[Resources](/docs/learn/server-concepts#resources)**: File-like data that can be read by clients (like API responses or file contents)
2. **[Tools](/docs/learn/server-concepts#tools)**: Functions that can be called by the LLM (with user approval)
3. **[Prompts](/docs/learn/server-concepts#prompts)**: Pre-written templates that help users accomplish specific tasks
This tutorial will primarily focus on tools.
*
Python
*
TypeScript
*
Java
*
Kotlin
*
C#
*
Ruby
*
Rust
*
Go
Let’s get started with building our weather server! [You can find the complete code for what we’ll be building here.](https://github.com/modelcontextprotocol/quickstart-resources/tree/main/weather-server-python)###
[​
](#prerequisite-knowledge)
Prerequisite knowledge
This quickstart assumes you have familiarity with:
* Python
* LLMs like Claude
###
[​
](#logging-in-mcp-servers)
Logging in MCP Servers
When implementing MCP servers, be careful about how you handle logging:**For STDIO-based servers:** Never write to stdout. Writing to stdout will corrupt the JSON-RPC messages and break your server. The `print()` function writes to stdout by default, but can be used safely with `file=sys.stderr`.**For HTTP-based servers:** Standard output logging is fine since it doesn’t interfere with HTTP responses.###
[​
](#best-practices)
Best Practices
* Use a logging library that writes to stderr or files.
###
[​
](#quick-examples)
Quick Examples
```
`import sys
import logging
# ❌ Bad (STDIO)
print("Processing request")
# ✅ Good (STDIO)
print("Processing request", file=sys.stderr)
# ✅ Good (STDIO)
logging.info("Processing request")
`
```
###
[​
](#system-requirements)
System requirements
* Python 3.10 or higher installed.
* You must use the Python MCP SDK 1.2.0 or higher.
###
[​
](#set-up-your-environment)
Set up your environment
First, let’s install `uv` and set up our Python project and environment:
macOS/Linux
Windows
```
`curl -LsSf https://astral.sh/uv/install.sh | sh
`
```
Make sure to restart your terminal afterwards to ensure that the `uv` command gets picked up.Now, let’s create and set up our project:
macOS/Linux
Windows
```
`# Create a new directory for our project
uv init weather
cd weather
# Create virtual environment and activate it
uv venv
source .venv/bin/activate
# Install dependencies
uv add "mcp[cli]" httpx
# Create our server file
touch weather.py
`
```
Now let’s dive into building your server.##
[​
](#building-your-server)
Building your server
###
[​
](#importing-packages-and-setting-up-the-instance)
Importing packages and setting up the instance
Add these to the top of your `weather.py`:
```
`from typing import Any
import httpx
from mcp.server.fastmcp import FastMCP
# Initialize FastMCP server
mcp = FastMCP("weather")
# Constants
NWS\_API\_BASE = "https://api.weather.gov"
USER\_AGENT = "weather-app/1.0"
`
```
The FastMCP class uses Python type hints and docstrings to automatically generate tool definitions, making it easy to create and maintain MCP tools.###
[​
](#helper-functions)
Helper functions
Next, let’s add our helper functions for querying and formatting the data from the National Weather Service API:
```
`async def make\_nws\_request(url: str) -\> dict[str, Any] | None:
"""Make a request to the NWS API with proper error handling."""
headers = {"User-Agent": USER\_AGENT, "Accept": "application/geo+json"}
async with httpx.AsyncClient() as client:
try:
response = await client.get(url, headers=headers, timeout=30.0)
response.raise\_for\_status()
return response.json()
except Exception:
return None
def format\_alert(feature: dict) -\> str:
"""Format an alert feature into a readable string."""
props = feature["properties"]
return f"""
Event: {props.get("event", "Unknown")}
Area: {props.get("areaDesc", "Unknown")}
Severity: {props.get("severity", "Unknown")}
Description: {props.get("description", "No description available")}
Instructions: {props.get("instruction", "No specific instructions provided")}
"""
`
```
###
[​
](#implementing-tool-execution)
Implementing tool execution
The tool execution handler is responsible for actually executing the logic of each tool. Let’s add it:
```
`@mcp.tool()
async def get\_alerts(state: str) -\> str:
"""Get weather alerts for a US state.
Args:
state: Two-letter US state code (e.g. CA, NY)
"""
url = f"{NWS\_API\_BASE}/alerts/active/area/{state}"
data = await make\_nws\_request(url)
if not data or "features" not in data:
return "Unable to fetch alerts or no alerts found."
if not data["features"]:
return "No active alerts for this state."
alerts = [format\_alert(feature) for feature in data["features"]]
return "\\n---\\n".join(alerts)
@mcp.tool()
async def get\_forecast(latitude: float, longitude: float) -\> str:
"""Get weather forecast for a location.
Args:
latitude: Latitude of the location
longitude: Longitude of the location
"""
# First get the forecast grid endpoint
points\_url = f"{NWS\_API\_BASE}/points/{latitude},{longitude}"
points\_data = await make\_nws\_request(points\_url)
if not points\_data:
return "Unable to fetch forecast data for this location."
# Get the forecast URL from the points response
forecast\_url = points\_data["properties"]["forecast"]
forecast\_data = await make\_nws\_request(forecast\_url)
if not forecast\_data:
return "Unable to fetch detailed forecast."
# Format the periods into a readable forecast
periods = forecast\_data["properties"]["periods"]
forecasts = []
for period in periods[:5]: # Only show next 5 periods
forecast = f"""
{period["name"]}:
Temperature: {period["temperature"]}°{period["temperatureUnit"]}
Wind: {period["windSpeed"]} {period["windDirection"]}
Forecast: {period["detailedForecast"]}
"""
forecasts.append(forecast)
return "\\n---\\n".join(forecasts)
`
```
###
[​
](#running-the-server)
Running the server
Finally, let’s initialize and run the server:
```
`def main():
# Initialize and run the server
mcp.run(transport="stdio")
if \_\_name\_\_ == "\_\_main\_\_":
main()
`
```
Your server is complete! Run `uv run weather.py` to start the MCP server, which will listen for messages from MCP hosts.Let’s now test your server from an existing MCP host, Claude for Desktop.##
[​
](#testing-your-server-with-claude-for-desktop)
Testing your server with Claude for Desktop
Claude for Desktop is not yet available on Linux. Linux users can proceed to the [Building a client](/docs/develop/build-client) tutorial to build an MCP client that connects to the server we just built.
First, make sure you have Claude for Desktop installed. [You can install the latest version
here.](https://claude.ai/download) If you already have Claude for Desktop, **make sure it’s updated to the latest version.**We’ll need to configure Claude for Desktop for whichever MCP servers you want to use. To do this, open your Claude for Desktop App configuration at `\~/Library/Application Support/Claude/claude\_desktop\_config.json` in a text editor. Make sure to create the file if it doesn’t exist.For example, if you have [VS Code](https://code.visualstudio.com/) installed:
macOS/Linux
Windows
```
`code \~/Library/Application\\ Support/Claude/claude\_desktop\_config.json
`
```
You’ll then add your servers in the `mcpServers` key. The MCP UI elements will only show up in Claude for Desktop if at least one server is properly configured.In this case, we’ll add our single weather server like so:
macOS/Linux
Windows
```
`{
"mcpServers": {
"weather": {
"command": "uv",
"args": [
"--directory",
"/ABSOLUTE/PATH/TO/PARENT/FOLDER/weather",
"run",
"weather.py"
]
}
}
}
`
```
You may need to put the full path to the `uv` executable in the `command` field. You can get this by running `which uv` on macOS/Linux or `where uv` on Windows.
Make sure you pass in the absolute path to your server. You can get this by running `pwd` on macOS/Linux or `cd` on Windows Command Prompt. On Windows, remember to use double backslashes (`\\\\`) or forward slashes (`/`) in the JSON path.
This tells Claude for Desktop:
1. There’s an MCP server named “weather”
2. To launch it by running `uv --directory /ABSOLUTE/PATH/TO/PARENT/FOLDER/weather run weather.py`
Save the file, and restart **Claude for Desktop**.
Let’s get started with building our weather server! [You can find the complete code for what we’ll be building here.](https://github.com/modelcontextprotocol/quickstart-resources/tree/main/weather-server-typescript)###
[​
](#prerequisite-knowledge-2)
Prerequisite knowledge
This quickstart assumes you have familiarity with:
* TypeScript
* LLMs like Claude
###
[​
](#logging-in-mcp-servers-2)
Logging in MCP Servers
When implementing MCP servers, be careful about how you handle logging:**For STDIO-based servers:** Never use `console.log()`, as it writes to standard output (stdout) by default. Writing to stdout will corrupt the JSON-RPC messages and break your server.**For HTTP-based servers:** Standard output logging is fine since it doesn’t interfere with HTTP responses.###
[​
](#best-practices-2)
Best Practices
* Use `console.error()` which writes to stderr, or use a logging library that writes to stderr or files.
###
[​
](#quick-examples-2)
Quick Examples
```
`// ❌ Bad (STDIO)
console.log("Server started");
// ✅ Good (STDIO)
console.error("Server started"); // stderr is safe
`
```
###
[​
](#system-requirements-2)
System requirements
For TypeScript, make sure you have the latest version of Node installed.###
[​
](#set-up-your-environment-2)
Set up your environment
First, let’s install Node.js and npm if you haven’t already. You can download them from [nodejs.org](https://nodejs.org/).
Verify your Node.js installation:
```
`node --version
npm --version
`
```
For this tutorial, you’ll need Node.js version 16 or higher.Now, let’s create and set up our project:
macOS/Linux
Windows
```
`# Create a new directory for our project
mkdir weather
cd weather
# Initialize a new npm project
npm init -y
# Install dependencies
npm install @modelcontextprotocol/sdk zod@3
npm install -D @types/node typescript
# Create our files
mkdir src
touch src/index.ts
`
```
Update your package.json to add type: “module” and a build script:
package.json
```
`{
"type": "module",
"bin": {
"weather": "./build/index.js"
},
"scripts": {
"build": "tsc && chmod 755 build/index.js"
},
"files": ["build"]
}
`
```
Create a `tsconfig.json` in the root of your project:
tsconfig.json
```
`{
"compilerOptions": {
"target": "ES2022",
"module": "Node16",
"moduleResolution": "Node16",
"outDir": "./build",
"rootDir": "./src",
"strict": true,
"esModuleInterop": true,
"skipLibCheck": true,
"forceConsistentCasingInFileNames": true
},
"include": ["src/\*\*/\*"],
"exclude": ["node\_modules"]
}
`
```
Now let’s dive into building your server.##
[​
](#building-your-server-2)
Building your server
###
[​
](#importing-packages-and-setting-up-the-instance-2)
Importing packages and setting up the instance
Add these to the top of your `src/index.ts`:
```
`import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import { z } from "zod";
const NWS\_API\_BASE = "https://api.weather.gov";
const USER\_AGENT = "weather-app/1.0";
// Create server instance
const server = new McpServer({
name: "weather",
version: "1.0.0",
});
`
```
###
[​
](#helper-functions-2)
Helper functions
Next, let’s add our helper functions for querying and formatting the data from the National Weather Service API:
```
`// Helper function for making NWS API requests
async function makeNWSRequest\<T\>(url: string): Promise\<T | null\> {
const headers = {
"User-Agent": USER\_AGENT,
Accept: "application/geo+json",
};
try {
const response = await fetch(url, { headers });
if (!response.ok) {
throw new Error(`HTTP error! status: ${response.status}`);
}
return (await response.json()) as T;
} catch (error) {
console.error("Error making NWS request:", error);
return null;
}
}
interface AlertFeature {
properties: {
event?: string;
areaDesc?: string;
severity?: string;
status?: string;
headline?: string;
};
}
// Format alert data
function formatAlert(feature: AlertFeature): string {
const props = feature.properties;
return [
`Event: ${props.event || "Unknown"}`,
`Area: ${props.areaDesc || "Unknown"}`,
`Severity: ${props.severity || "Unknown"}`,
`Status: ${props.status || "Unknown"}`,
`Headline: ${props.headline || "No headline"}`,
"---",
].join("\\n");
}
interface ForecastPeriod {
name?: string;
temperature?: number;
temperatureUnit?: string;
windSpeed?: string;
windDirection?: string;
shortForecast?: string;
}
interface AlertsResponse {
features: AlertFeature[];
}
interface PointsResponse {
properties: {
forecast?: string;
};
}
interface ForecastResponse {
properties: {
periods: ForecastPeriod[];
};
}
`
```
###
[​
](#implementing-tool-execution-2)
Implementing tool execution
The tool execution handler is responsible for actually executing the logic of each tool. Let’s add it:
```
`// Register weather tools
server.registerTool(
"get\_alerts",
{
description: "Get weather alerts for a state",
inputSchema: {
state: z
.string()
.length(2)
.describe("Two-letter state code (e.g. CA, NY)"),
},
},
async ({ state }) =\> {
const stateCode = state.toUpperCase();
const alertsUrl = `${NWS\_API\_BASE}/alerts?area=${stateCode}`;
const alertsData = await makeNWSRequest\<AlertsResponse\>(alertsUrl);
if (!alertsData) {
return {
content: [
{
type: "text",
text: "Failed to retrieve alerts data",
},
],
};
}
const features = alertsData.features || [];
if (!features.length) {
return {
content: [
{
type: "text",
text: `No active alerts for ${stateCode}`,
},
],
};
}
const formattedAlerts = features.map(formatAlert);
const alertsText = `Active alerts for ${stateCode}:\\n\\n${formattedAlerts.join("\\n")}`;
return {
content: [
{
type: "text",
text: alertsText,
},
],
};
},
);
server.registerTool(
"get\_forecast",
{
description: "Get weather forecast for a location",
inputSchema: {
latitude: z
.number()
.min(-90)
.max(90)
.describe("Latitude of the location"),
longitude: z
.number()
.min(-180)
.max(180)
.describe("Longitude of the location"),
},
},
async ({ latitude, longitude }) =\> {
// Get grid point data
const pointsUrl = `${NWS\_API\_BASE}/points/${latitude.toFixed(4)},${longitude.toFixed(4)}`;
const pointsData = await makeNWSRequest\<PointsResponse\>(pointsUrl);
if (!pointsData) {
return {
content: [
{
type: "text",
text: `Failed to retrieve grid point data for coordinates: ${latitude}, ${longitude}. This location may not be supported by the NWS API (only US locations are supported).`,
},
],
};
}
const forecastUrl = pointsData.properties?.forecast;
if (!forecastUrl) {
return {
content: [
{
type: "text",
text: "Failed to get forecast URL from grid point data",
},
],
};
}
// Get forecast data
const forecastData = await makeNWSRequest\<ForecastResponse\>(forecastUrl);
if (!forecastData) {
return {
content: [
{
type: "text",
text: "Failed to retrieve forecast data",
},
],
};
}
const periods = forecastData.properties?.periods || [];
if (periods.length === 0) {
return {
content: [
{
type: "text",
text: "No forecast periods available",
},
],
};
}
// Format forecast periods
const formattedForecast = periods.map((period: ForecastPeriod) =\>
[
`${period.name || "Unknown"}:`,
`Temperature: ${period.temperature || "Unknown"}°${period.temperatureUnit || "F"}`,
`Wind: ${period.windSpeed || "Unknown"} ${period.windDirection || ""}`,
`${period.shortForecast || "No forecast available"}`,
"---",
].join("\\n"),
);
const forecastText = `Forecast for ${latitude}, ${longitude}:\\n\\n${formattedForecast.join("\\n")}`;
return {
content: [
{
type: "text",
text: forecastText,
},
],
};
},
);
`
```
###
[​
](#running-the-server-2)
Running the server
Finally, implement the main function to run the server:
```
`async function main() {
const transport = new StdioServerTransport();
await server.connect(transport);
console.error("Weather MCP Server running on stdio");
}
main().catch((error) =\> {
console.error("Fatal error in main():", error);
process.exit(1);
});
`
```
Make sure to run `npm run build` to build your server! This is a very important step in getting your server to connect.Let’s now test your server from an existing MCP host, Claude for Desktop.##
[​
](#testing-your-server-with-claude-for-desktop-2)
Testing your server with Claude for Desktop
Claude for Desktop is not yet available on Linux. Linux users can proceed to the [Building a client](/docs/develop/build-client) tutorial to build an MCP client that connects to the server we just built.
First, make sure you have Claude for Desktop installed. [You can install the latest version
here.](https://claude.ai/download) If you already have Claude for Desktop, **make sure it’s updated to the latest version.**We’ll need to configure Claude for Desktop for whichever MCP servers you want to use. To do this, open your Claude for Desktop App configuration at `\~/Library/Application Support/Claude/claude\_desktop\_config.json` in a text editor. Make sure to create the file if it doesn’t exist.For example, if you have [VS Code](https://code.visualstudio.com/) installed:
macOS/Linux
Windows
```
`code \~/Library/Application\\ Support/Claude/claude\_desktop\_config.json
`
```
You’ll then add your servers in the `mcpServers` key. The MCP UI elements will only show up in Claude for Desktop if at least one server is properly configured.In this case, we’ll add our single weather server like so:
macOS/Linux
Windows
```
`{
"mcpServers": {
"weather": {
"command": "node",
"args": ["/ABSOLUTE/PATH/TO/PARENT/FOLDER/weather/build/index.js"]
}
}
}
`
```
This tells Claude for Desktop:
1. There’s an MCP server named “weather”
2. Launch it by running `node /ABSOLUTE/PATH/TO/PARENT/FOLDER/weather/build/index.js`
Save the file, and restart **Claude for Desktop**.
This is a quickstart demo based on Spring AI MCP auto-configuration and boot starters.
To learn how to create sync and async MCP Servers, manually, consult the [Java SDK Server](https://java.sdk.modelcontextprotocol.io/) documentation.
Let’s get started with building our weather server!
[You can find the complete code for what we’ll be building here.](https://github.com/spring-projects/spring-ai-examples/tree/main/model-context-protocol/weather/starter-stdio-server)For more information, see the [MCP Server Boot Starter](https://docs.spring.io/spring-ai/reference/api/mcp/mcp-server-boot-starter-docs.html) reference documentation.
For manual MCP Server implementation, refer to the [MCP Server Java SDK documentation](https://java.sdk.modelcontextprotocol.io/).###
[​
](#logging-in-mcp-servers-3)
Logging in MCP Servers
When implementing MCP servers, be careful about how you handle logging:**For STDIO-based servers:** Never use `System.out.println()` or `System.out.print()`, as they write to standard output (stdout). Writing to stdout will corrupt the JSON-RPC messages and break your server.**For HTTP-based servers:** Standard output logging is fine since it doesn’t interfere with HTTP responses.###
[​
](#best-practices-3)
Best Practices
* Use a logging library that writes to stderr or files.
* Ensure any configured logging library will not write to stdout.
###
[​
](#system-requirements-3)
System requirements
* Java 17 or higher installed.
* [Spring Boot 3.3.x](https://docs.spring.io/spring-boot/installing.html) or higher
###
[​
](#set-up-your-environment-3)
Set up your environment
Use the [Spring Initializer](https://start.spring.io/) to bootstrap the project.You will need to add the following dependencies:
Maven
Gradle
```
`\<dependencies\>
\<dependency\>
\<groupId\>org.springframework.ai\</groupId\>
\<artifactId\>spring-ai-starter-mcp-server\</artifactId\>
\</dependency\>
\<dependency\>
\<groupId\>org.springframework\</groupId\>
\<artifactId\>spring-web\</artifactId\>
\</dependency\>
\</dependencies\>
`
```
Then configure your application by setting the application properties:
application.properties
application.yml
```
`spring.main.bannerMode=off
logging.pattern.console=
`
```
The [Server Configuration Properties](https://docs.spring.io/spring-ai/reference/api/mcp/mcp-server-boot-starter-docs.html#_configuration_properties) documents all available properties.Now let’s dive into building your server.##
[​
](#building-your-server-3)
Building your server
###
[​
](#weather-service)
Weather Service
Let’s implement a [WeatherService.java](https://github.com/spring-projects/spring-ai-examples/blob/main/model-context-protocol/weather/starter-stdio-server/src/main/java/org/springframework/ai/mcp/sample/server/WeatherService.java) that uses a REST client to query the data from the National Weather Service API:
```
`@Service
public class WeatherService {
private final RestClient restClient;
public WeatherService() {
this.restClient = RestClient.builder()
.baseUrl("https://api.weather.gov")
.defaultHeader("Accept", "application/geo+json")
.defaultHeader("User-Agent", "WeatherApiClient/1.0 (your@email.com)")
.build();
}
@Tool(description = "Get weather forecast for a specific latitude/longitude")
public String getWeatherForecastByLocation(
double latitude, // Latitude coordinate
double longitude // Longitude coordinate
) {
// Returns detailed forecast including:
// - Temperature and unit
// - Wind speed and direction
// - Detailed forecast description
}
@Tool(description = "Get weather alerts for a US state")
public String getAlerts(
@ToolParam(description = "Two-letter US state code (e.g. CA, NY)") String state
) {
// Returns active alerts including:
// - Event type
// - Affected area
// - Severity
// - Description
// - Safety instructions
}
// ......
}
`
```
The `@Service` annotation will auto-register the service in your application context.
The Spring AI `@Tool` annotation makes it easy to create and maintain MCP tools.The auto-configuration will automatically register these tools with the MCP server.###
[​
](#create-your-boot-application)
Create your Boot Application
```
`@SpringBootApplication
public class McpServerApplication {
public static void main(String[] args) {
SpringApplication.run(McpServerApplication.class, args);
}
@Bean
public ToolCallbackProvider weatherTools(WeatherService weatherService) {
return MethodToolCallbackProvider.builder().toolObjects(weatherService).build();
}
}
`
```
Uses the `MethodToolCallbackProvider` utils to convert the `@Tools` into actionable callbacks used by the MCP server.###
[​
](#running-the-server-3)
Running the server
Finally, let’s build the server:
```
`./mvnw clean install
`
```
This will generate an `mcp-weather-stdio-server-0.0.1-SNAPSHOT.jar` file within the `target` folder.Let’s now test your server from an existing MCP host, Claude for Desktop.##
[​
](#testing-your-server-with-claude-for-desktop-3)
Testing your server with Claude for Desktop
Claude for Desktop is not yet available on Linux.
First, make sure you have Claude for Desktop installed.
[You can install the latest version here.](https://claude.ai/download) If you already have Claude for Desktop, **make sure it’s updated to the latest version.**We’ll need to configure Claude for Desktop for whichever MCP servers you want to use.
To do this, open your Claude for Desktop App configuration at `\~/Library/Application Support/Claude/claude\_desktop\_config.json` in a text editor.
Make sure to create the file if it doesn’t exist.For example, if you have [VS Code](https://code.visualstudio.com/) installed:
macOS/Linux
Windows
```
`code \~/Library/Application\\ Support/Claude/claude\_desktop\_config.json
`
```
You’ll then add your servers in the `mcpServers` key.
The MCP UI elements will only show up in Claude for Desktop if at least one server is properly configured.In this case, we’ll add our single weather server like so:
macOS/Linux
Windows
```
`{
"mcpServers": {
"spring-ai-mcp-weather": {
"command": "java",
"args": [
"-Dspring.ai.mcp.server.stdio=true",
"-jar",
"/ABSOLUTE/PATH/TO/PARENT/FOLDER/mcp-weather-stdio-server-0.0.1-SNAPSHOT.jar"
]
}
}
}
`
```
Make sure you pass in the absolute path to your server.
This tells Claude for Desktop:
1. There’s an MCP server named “my-weather-server”
2. To launch it by running `java -jar /ABSOLUTE/PATH/TO/PARENT/FOLDER/mcp-weather-stdio-server-0.0.1-SNAPSHOT.jar`
Save the file, and restart **Claude for Desktop**.##
[​
](#testing-your-server-with-java-client)
Testing your server with Java client
###
[​
](#create-an-mcp-client-manually)
Create an MCP Client manually
Use the `McpClient` to connect to the server:
```
`var stdioParams = ServerParameters.builder("java")
.args("-jar", "/ABSOLUTE/PATH/TO/PARENT/FOLDER/mcp-weather-stdio-server-0.0.1-SNAPSHOT.jar")
.build();
var stdioTransport = new StdioClientTransport(stdioParams);
var mcpClient = McpClient.sync(stdioTransport).build();
mcpClient.initialize();
ListToolsResult toolsList = mcpClient.listTools();
CallToolResult weather = mcpClient.callTool(
new CallToolRequest("getWeatherForecastByLocation",
Map.of("latitude", "47.6062", "longitude", "-122.3321")));
CallToolResult alert = mcpClient.callTool(
new CallToolRequest("getAlerts", Map.of("state", "NY")));
mcpClient.closeGracefully();
`
```
###
[​
](#use-mcp-client-boot-starter)
Use MCP Client Boot Starter
Create a new boot starter application using the `spring-ai-starter-mcp-client` dependency:
```
`\<dependency\>
\<groupId\>org.springframework.ai\</groupId\>
\<artifactId\>spring-ai-starter-mcp-client\</artifactId\>
\</dependency\>
`
```
and set the `spring.ai.mcp.client.stdio.servers-configuration` property to point to your `claude\_desktop\_config.json`.
You can reuse the existing Anthropic Desktop configuration:
```
`spring.ai.mcp.client.stdio.servers-configuration=file:PATH/TO/claude\_desktop\_config.json
`
```
When you start your client application, the auto-configuration will automatically create MCP clients from the claude\_desktop\_config.json.For more information, see the [MCP Client Boot Starters](https://docs.spring.io/spring-ai/reference/api/mcp/mcp-server-boot-client-docs.html) reference documentation.##
[​
](#more-java-mcp-server-examples)
More Java MCP Server examples
The [starter-webflux-server](https://github.com/spring-projects/spring-ai-examples/tree/main/model-context-protocol/weather/starter-webflux-server) demonstrates how to create an MCP server using SSE transport.
It showcases how to define and register MCP Tools, Resources, and Prompts, using the Spring Boot’s auto-configuration capabilities.
Let’s get started with building our weather server! [You can find the complete code for what we’ll be building here.](https://github.com/modelcontextprotocol/kotlin-sdk/tree/main/samples/weather-stdio-server)###
[​
](#prerequisite-knowledge-3)
Prerequisite knowledge
This quickstart assumes you have familiarity with:
* Kotlin
* LLMs like Claude
###
[​
](#logging-in-mcp-servers-4)
Logging in MCP Servers
When implementing MCP servers, be careful about how you handle logging:**For STDIO-based servers:** Never use `println()`, as it writes to standard output (stdout) by default. Writing to stdout will corrupt the JSON-RPC messages and break your server.**For HTTP-based servers:** Standard output logging is fine since it doesn’t interfere with HTTP responses.###
[​
](#best-practices-4)
Best Practices
* Use a logging library that writes to stderr or files.
###
[​
](#system-requirements-4)
System requirements
* JDK 11 or higher installed.
###
[​
](#set-up-your-environment-4)
Set up your environment
First, let’s install `java` and `gradle` if you haven’t already.
You can download `java` from [official Oracle JDK website](https://www.oracle.com/java/technologies/downloads/).
Verify your `java` installation:
```
`java --version
`
```
Now, let’s create and set up your project:
macOS/Linux
Windows
```
`# Create a new directory for our project
mkdir weather
cd weather
# Initialize a new kotlin project
gradle init
`
```
After running `gradle init`, select **Application** as the project type, **Kotlin** as the programming language.Alternatively, you can create a Kotlin application using the [IntelliJ IDEA project wizard](https://kotlinlang.org/docs/jvm-get-started.html).After creating the project, replace the contents of your `build.gradle.kts` with:
build.gradle.kts
```
`// Check latest versions at https://github.com/modelcontextprotocol/kotlin-sdk/releases
val mcpVersion = "0.9.0"
val ktorVersion = "3.2.3"
val slf4jVersion = "2.0.17"
plugins {
kotlin("jvm") version "2.3.20"
kotlin("plugin.serialization") version "2.3.20"
id("com.gradleup.shadow") version "8.3.9"
application
}
application {
mainClass.set("MainKt")
}
dependencies {
implementation("io.modelcontextprotocol:kotlin-sdk:$mcpVersion")
implementation("io.ktor:ktor-client-content-negotiation:$ktorVersion")
implementation("io.ktor:ktor-serialization-kotlinx-json:$ktorVersion")
implementation("io.ktor:ktor-client-cio:$ktorVersion")
implementation("org.slf4j:slf4j-simple:$slf4jVersion")
}
`
```
Verify that everything is set up correctly:
```
`./gradlew build
`
```
Now let’s dive into building your server.##
[​
](#building-your-server-4)
Building your server
###
[​
](#setting-up-the-instance)
Setting up the instance
Add a server initialization function:
```
`fun runMcpServer() {
val server = Server(
Implementation(
name = "weather",
version = "1.0.0",
),
ServerOptions(
capabilities = ServerCapabilities(tools = ServerCapabilities.Tools(listChanged = true)),
),
)
// register tools on server here
val transport = StdioServerTransport(
System.`in`.asInput(),
System.out.asSink().buffered(),
)
runBlocking {
val session = server.createSession(transport)
val done = Job()
session.onClose {
done.complete()
}
done.join()
}
}
`
```
###
[​
](#weather-api-helper-functions)
Weather API helper functions
Next, let’s add functions and data classes for querying and converting responses from the National Weather Service API:
```
`val httpClient = HttpClient(CIO) {
defaultRequest {
url("https://api.weather.gov")
headers {
append("Accept", "application/geo+json")
append("User-Agent", "WeatherApiClient/1.0")
}
contentType(ContentType.Application.Json)
}
install(ContentNegotiation) {
json(Json { ignoreUnknownKeys = true })
}
}
// Extension function to fetch weather alerts for a given state
suspend fun HttpClient.getAlerts(state: String): List\<String\> {
val alerts = this.get("/alerts/active/area/$state").body\<AlertsResponse\>()
return alerts.features.map { feature -\>
"""
Event: ${feature.properties.event}
Area: ${feature.properties.areaDesc}
Severity: ${feature.properties.severity}
Status: ${feature.properties.status}
Headline: ${feature.properties.headline}
""".trimIndent()
}
}
// Extension function to fetch forecast information for given latitude and longitude
suspend fun HttpClient.getForecast(latitude: Double, longitude: Double): List\<String\> {
val points = this.get("/points/$latitude,$longitude").body\<PointsResponse\>()
val forecastUrl = points.properties.forecast ?: error("No forecast URL available")
val forecast = this.get(forecastUrl).body\<ForecastResponse\>()
return forecast.properties.periods.map { period -\>
"""
${period.name}:
Temperature: ${period.temperature}°${period.temperatureUnit}
Wind: ${period.windSpeed} ${period.windDirection}
${period.shortForecast}
""".trimIndent()
}
}
@Serializable
data class PointsResponse(val properties: PointsProperties)
@Serializable
data class PointsProperties(val forecast: String? = null)
@Serializable
data class ForecastResponse(val properties: ForecastProperties)
@Serializable
data class ForecastProperties(val periods: List\<ForecastPeriod\> = emptyList())
@Serializable
data class ForecastPeriod(
val name: String? = null,
val temperature: Int? = null,
val temperatureUnit: String? = null,
val windSpeed: String? = null,
val windDirection: String? = null,
val shortForecast: String? = null,
)
@Serializable
data class AlertsResponse(val features: List\<AlertFeature\> = emptyList())
@Serializable
data class AlertFeature(val properties: AlertProperties)
@Serializable
data class AlertProperties(
val event: String? = null,
val areaDesc: String? = null,
val severity: String? = null,
val status: String? = null,
val headline: String? = null,
)
`
```
###
[​
](#implementing-tool-execution-3)
Implementing tool execution
The tool execution handler is responsible for actually executing the logic of each tool. Let’s add it:
```
`// Register weather tools
server.addTool(
name = "get\_alerts",
description = "Get weather alerts for a US state. Input is a two-letter US state code (e.g. CA, NY)",
inputSchema = ToolSchema(
properties = buildJsonObject {
putJsonObject("state") {
put("type", "string")
put("description", "Two-letter US state code (e.g. CA, NY)")
}
},
required = listOf("state"),
),
) { request -\>
val state = request.arguments?.get("state")?.jsonPrimitive?.content
?: return@addTool CallToolResult(
content = listOf(TextContent("The 'state' parameter is required.")),
)
val alerts = httpClient.getAlerts(state)
CallToolResult(content = alerts.map { TextContent(it) })
}
server.addTool(
name = "get\_forecast",
description = "Get weather forecast for a location. Note: only US locations are supported by the NWS API.",
inputSchema = ToolSchema(
properties = buildJsonObject {
putJsonObject("latitude") {
put("type", "number")
put("description", "Latitude of the location")
}
putJsonObject("longitude") {
put("type", "number")
put("description", "Longitude of the location")
}
},
required = listOf("latitude", "longitude"),
),
) { request -\>
val latitude = request.arguments?.get("latitude")?.jsonPrimitive?.doubleOrNull
val longitude = request.arguments?.get("longitude")?.jsonPrimitive?.doubleOrNull
if (latitude == null || longitude == null) {
return@addTool CallToolResult(
content = listOf(TextContent("The 'latitude' and 'longitude' parameters are required.")),
)
}
val forecast = httpClient.getForecast(latitude, longitude)
CallToolResult(content = forecast.map { TextContent(it) })
}
`
```
###
[​
](#running-the-server-4)
Running the server
Finally, implement the main function to run the server:
```
`fun main() = runMcpServer()
`
```
You can run the server directly during development:
```
`./gradlew run
`
```
For production use, build the shadow JAR:
```
`./gradlew build
java -jar build/libs/weather-0.1.0-all.jar
`
```
Let’s now test your server from an existing MCP host, Claude for Desktop.##
[​
](#testing-your-server-with-claude-for-desktop-4)
Testing your server with Claude for Desktop
Claude for Desktop is not yet available on Linux. Linux users can proceed to the [Building a client](/docs/develop/build-client) tutorial to build an MCP client that connects to the server we just built.
First, make sure you have Claude for Desktop installed. [You can install the latest version
here.](https://claude.ai/download) If you already have Claude for Desktop, **make sure it’s updated to the latest version.**We’ll need to configure Claude for Desktop for whichever MCP servers you want to use.
To do this, open your Claude for Desktop App configuration at `\~/Library/Application Support/Claude/claude\_desktop\_config.json` in a text editor.
Make sure to create the file if it doesn’t exist.For example, if you have [VS Code](https://code.visualstudio.com/) installed:
macOS/Linux
Windows
```
`code \~/Library/Application\\ Support/Claude/claude\_desktop\_config.json
`
```
You’ll then add your servers in the `mcpServers` key.
The MCP UI elements will only show up in Claude for Desktop if at least one server is properly configured.In this case, we’ll add our single weather server like so:
macOS/Linux
Windows
```
`{
"mcpServers": {
"weather": {
"command": "java",
"args": [
"-jar",
"/ABSOLUTE/PATH/TO/PARENT/FOLDER/weather/build/libs/weather-0.1.0-all.jar"
]
}
}
}
`
```
This tells Claude for Desktop:
1. There’s an MCP server named “weather”
2. Launch it by running `java -jar /ABSOLUTE/PATH/TO/PARENT/FOLDER/weather/build/libs/weather-0.1.0-all.jar`
Save the file, and restart **Claude for Desktop**.
Let’s get started with building our weather server! [You can find the complete code for what we’ll be building here.](https://github.com/modelcontextprotocol/csharp-sdk/tree/main/samples/QuickstartWeatherServer)###
[​
](#prerequisite-knowledge-4)
Prerequisite knowledge
This quickstart assumes you have familiarity with:
* C#
* LLMs like Claude
* .NET 8 or higher
###
[​
](#logging-in-mcp-servers-5)
Logging in MCP Servers
When implementing MCP servers, be careful about how you handle logging:**For STDIO-based servers:** Never use `Console.WriteLine()` or `Console.Write()`, as they write to standard output (stdout). Writing to stdout will corrupt the JSON-RPC messages and break your server.**For HTTP-based servers:** Standard output logging is fine since it doesn’t interfere with HTTP responses.###
[​
](#best-practices-5)
Best Practices
* Use a logging library that writes to stderr or files.
###
[​
](#system-requirements-5)
System requirements
* [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0) or higher installed.
###
[​
](#set-up-your-environment-5)
Set up your environment
First, let’s install `dotnet` if you haven’t already. You can download `dotnet` from [official Microsoft .NET website](https://dotnet.microsoft.com/download/). Verify your `dotnet` installation:
```
`dotnet --version
`
```
Now, let’s create and set up your project:
macOS/Linux
Windows
```
`# Create a new directory for our project
mkdir weather
cd weather
# Initialize a new C# project
dotnet new console
`
```
After running `dotnet new console`, you will be presented with a new C# project.
You can open the project in your favorite IDE, such as [Visual Studio](https://visualstudio.microsoft.com/) or [Rider](https://www.jetbrains.com/rider/).
Alternatively, you can create a C# application using the [Visual Studio project wizard](https://learn.microsoft.com/en-us/visualstudio/get-started/csharp/tutorial-console?view=vs-2022).
After creating the project, add NuGet package for the Model Context Protocol SDK and hosting:
```
`# Add the Model Context Protocol SDK NuGet package
dotnet add package ModelContextProtocol --prerelease
# Add the .NET Hosting NuGet package
dotnet add package Microsoft.Extensions.Hosting
`
```
Now let’s dive into building your server.##
[​
](#building-your-server-5)
Building your server
Open the `Program.cs` file in your project and replace its contents with the following code:
```
`using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using ModelContextProtocol;
using System.Net.Http.Headers;
var builder = Host.CreateEmptyApplicationBuilder(settings: null);
builder.Services.AddMcpServer()
.WithStdioServerTransport()
.WithToolsFromAssembly();
builder.Services.AddSingleton(\_ =\>
{
var client = new HttpClient() { BaseAddress = new Uri("https://api.weather.gov") };
client.DefaultRequestHeaders.UserAgent.Add(new ProductInfoHeaderValue("weather-tool", "1.0"));
return client;
});
var app = builder.Build();
await app.RunAsync();
`
```
When creating the `ApplicationHostBuilder`, ensure you use `CreateEmptyApplicationBuilder` instead of `CreateDefaultBuilder`. This ensures that the server does not write any additional messages to the console. This is only necessary for servers using STDIO transport.
This code sets up a basic console application that uses the Model Context Protocol SDK to create an MCP server with standard I/O transport.###
[​
](#weather-api-helper-functions-2)
Weather API helper functions
Create an extension class for `HttpClient` which helps simplify JSON request handling:
```
`using System.Text.Json;
internal static class HttpClientExt
{
public static async Task\<JsonDocument\> ReadJsonDocumentAsync(this HttpClient client, string requestUri)
{
using var response = await client.GetAsync(requestUri);
response.EnsureSuccessStatusCode();
return await JsonDocument.ParseAsync(await response.Content.ReadAsStreamAsync());
}
}
`
```
Next, define a class with the tool execution handlers for querying and converting responses from the National Weather Service API:
```
`using ModelContextProtocol.Server;
using System.ComponentModel;
using System.Globalization;
using System.Text.Json;
namespace QuickstartWeatherServer.Tools;
[McpServerToolType]
public static class WeatherTools
{
[McpServerTool, Description("Get weather alerts for a US state code.")]
public static async Task\<string\> GetAlerts(
HttpClient client,
[Description("The US state code to get alerts for.")] string state)
{
using var jsonDocument = await client.ReadJsonDocumentAsync($"/alerts/active/area/{state}");
var jsonElement = jsonDocument.RootElement;
var alerts = jsonElement.GetProperty("features").EnumerateArray();
if (!alerts.Any())
{
return "No active alerts for this state.";
}
return string.Join("\\n--\\n", alerts.Select(alert =\>
{
JsonElement properties = alert.GetProperty("properties");
return $"""
Event: {properties.GetProperty("event").GetString()}
Area: {properties.GetProperty("areaDesc").GetString()}
Severity: {properties.GetProperty("severity").GetString()}
Description: {properties.GetProperty("description").GetString()}
Instruction: {properties.GetProperty("instruction").GetString()}
""";
}));
}
[McpServerTool, Description("Get weather forecast for a location.")]
public static async Task\<string\> GetForecast(
HttpClient client,
[Description("Latitude of the location.")] double latitude,
[Description("Longitude of the location.")] double longitude)
{
var pointUrl = string.Create(CultureInfo.InvariantCulture, $"/points/{latitude},{longitude}");
using var jsonDocument = await client.ReadJsonDocumentAsync(pointUrl);
var forecastUrl = jsonDocument.RootElement.GetProperty("properties").GetProperty("forecast").GetString()
?? throw new Exception($"No forecast URL provided by {client.BaseAddress}points/{latitude},{longitude}");
using var forecastDocument = await client.ReadJsonDocumentAsync(forecastUrl);
var periods = forecastDocument.RootElement.GetProperty("properties").GetProperty("periods").EnumerateArray();
return string.Join("\\n---\\n", periods.Select(period =\> $"""
{period.GetProperty("name").GetString()}
Temperature: {period.GetProperty("temperature").GetInt32()}°F
Wind: {period.GetProperty("windSpeed").GetString()} {period.GetProperty("windDirection").GetString()}
Forecast: {period.GetProperty("detailedForecast").GetString()}
"""));
}
}
`
```
###
[​
](#running-the-server-5)
Running the server
Finally, run the server using the following command:
```
`dotnet run
`
```
This will start the server and listen for incoming requests on standard input/output.##
[​
](#testing-your-server-with-claude-for-desktop-5)
Testing your server with Claude for Desktop
Claude for Desktop is not yet available on Linux. Linux users can proceed to the [Building a client](/docs/develop/build-client) tutorial to build an MCP client that connects to the server we just built.
First, make sure you have Claude for Desktop installed. [You can install the latest version
here.](https://claude.ai/download) If you already have Claude for Desktop, **make sure it’s updated to the latest version.**
We’ll need to configure Claude for Desktop for whichever MCP servers you want to use. To do this, open your Claude for Desktop App configuration at `\~/Library/Application Support/Claude/claude\_desktop\_config.json` in a text editor. Make sure to create the file if it doesn’t exist.
For example, if you have [VS Code](https://code.visualstudio.com/) installed:
macOS/Linux
Windows
```
`code \~/Library/Application\\ Support/Claude/claude\_desktop\_config.json
`
```
You’ll then add your servers in the `mcpServers` key. The MCP UI elements will only show up in Claude for Desktop if at least one server is properly configured.
In this case, we’ll add our single weather server like so:
macOS/Linux
Windows
```
`{
"mcpServers": {
"weather": {
"command": "dotnet",
"args": ["run", "--project", "/ABSOLUTE/PATH/TO/PROJECT", "--no-build"]
}
}
}
`
```
This tells Claude for Desktop:
1. There’s an MCP server named “weather”
2. Launch it by running `dotnet run /ABSOLUTE/PATH/TO/PROJECT`
Save the file, and restart **Claude for Desktop**.
Let’s get started with building our weather server! [You can find the complete code for what we’ll be building here.](https://github.com/modelcontextprotocol/quickstart-resources/tree/main/weather-server-ruby)###
[​
](#prerequisite-knowledge-5)
Prerequisite knowledge
This quickstart assumes you have familiarity with:
* Ruby
* LLMs like Claude
###
[​
](#logging-in-mcp-servers-6)
Logging in MCP Servers
When implementing MCP servers, be careful about how you handle logging:**For STDIO-based servers:** Never use `puts` or `print`, as they write to standard output (stdout) by default. Writing to stdout will corrupt the JSON-RPC messages and break your server.**For HTTP-based servers:** Standard output logging is fine since it doesn’t interfere with HTTP responses.###
[​
](#best-practices-6)
Best Practices
* Use a logging library that writes to stderr or files.
###
[​
](#quick-examples-3)
Quick Examples
```
`# ❌ Bad (STDIO)
puts "Processing request"
# ✅ Good (STDIO)
require "logger"
logger = Logger.new($stderr)
logger.info("Processing request")
`
```
###
[​
](#system-requirements-6)
System requirements
* Ruby 2.7 or higher installed.
###
[​
](#set-up-your-environment-6)
Set up your environment
First, let’s make sure you have Ruby installed. You can check by running:
```
`ruby --version
`
```
Now, let’s create and set up our project:
macOS/Linux
Windows
```
`# Create a new directory for our project
mkdir weather
cd weather
# Create a Gemfile
bundle init
# Add the MCP SDK dependency
bundle add mcp
# Create our server file
touch weather.rb
`
```
Now let’s dive into building your server.##
[​
](#building-your-server-6)
Building your server
###
[​
](#importing-packages-and-setting-up-constants)
Importing packages and setting up constants
Open `weather.rb` and add these requires and constants at the top:
```
`require "json"
require "mcp"
require "net/http"
require "uri"
NWS\_API\_BASE = "https://api.weather.gov"
USER\_AGENT = "weather-app/1.0"
`
```
The `mcp` gem provides the Model Context Protocol SDK for Ruby, with classes for server implementation and stdio transport.###
[​
](#helper-methods)
Helper methods
Next, let’s add helper methods for querying and formatting data from the National Weather Service API:
```
`module HelperMethods
def make\_nws\_request(url)
uri = URI(url)
request = Net::HTTP::Get.new(uri)
request["User-Agent"] = USER\_AGENT
request["Accept"] = "application/geo+json"
response = Net::HTTP.start(uri.hostname, uri.port, use\_ssl: true) do |http|
http.request(request)
end
raise "HTTP #{response.code}: #{response.message}" unless response.is\_a?(Net::HTTPSuccess)
JSON.parse(response.body)
end
def format\_alert(feature)
properties = feature["properties"]
\<\<\~ALERT
Event: #{properties["event"] || "Unknown"}
Area: #{properties["areaDesc"] || "Unknown"}
Severity: #{properties["severity"] || "Unknown"}
Description: #{properties["description"] || "No description available"}
Instructions: #{properties["instruction"] || "No specific instructions provided"}
ALERT
end
end
`
```
###
[​
](#implementing-tool-execution-4)
Implementing tool execution
Now let’s define our tool classes. Each tool subclasses `MCP::Tool` and implements the tool logic:
```
`class GetAlerts \< MCP::Tool
extend HelperMethods
tool\_name "get\_alerts"
description "Get weather alerts for a US state"
input\_schema(
properties: {
state: {
type: "string",
description: "Two-letter US state code (e.g. CA, NY)"
}
},
required: ["state"]
)
def self.call(state:)
url = "#{NWS\_API\_BASE}/alerts/active/area/#{state.upcase}"
data = make\_nws\_request(url)
if data["features"].empty?
return MCP::Tool::Response.new([{
type: "text",
text: "No active alerts for this state."
}])
end
alerts = data["features"].map { |feature| format\_alert(feature) }
MCP::Tool::Response.new([{
type: "text",
text: alerts.join("\\n---\\n")
}])
end
end
class GetForecast \< MCP::Tool
extend HelperMethods
tool\_name "get\_forecast"
description "Get weather forecast for a location"
input\_schema(
properties: {
latitude: {
type: "number",
description: "Latitude of the location"
},
longitude: {
type: "number",
description: "Longitude of the location"
}
},
required: ["latitude", "longitude"]
)
def self.call(latitude:, longitude:)
# First get the forecast grid endpoint.
points\_url = "#{NWS\_API\_BASE}/points/#{latitude},#{longitude}"
points\_data = make\_nws\_request(points\_url)
# Get the forecast URL from the points response.
forecast\_url = points\_data["properties"]["forecast"]
forecast\_data = make\_nws\_request(forecast\_url)
# Format the periods into a readable forecast.
periods = forecast\_data["properties"]["periods"]
forecasts = periods.first(5).map do |period|
\<\<\~FORECAST
#{period["name"]}:
Temperature: #{period["temperature"]}°#{period["temperatureUnit"]}
Wind: #{period["windSpeed"]} #{period["windDirection"]}
Forecast: #{period["detailedForecast"]}
FORECAST
end
MCP::Tool::Response.new([{
type: "text",
text: forecasts.join("\\n---\\n")
}])
end
end
`
```
###
[​
](#running-the-server-6)
Running the server
Finally, initialize and run the server:
```
`server = MCP::Server.new(
name: "weather",
version: "1.0.0",
tools: [GetAlerts, GetForecast]
)
transport = MCP::Server::Transports::StdioTransport.new(server)
transport.open
`
```
Your server is complete! Run `bundle exec ruby weather.rb` to start the MCP server, which will listen for messages from MCP hosts.Let’s now test your server from an existing MCP host, Claude for Desktop.##
[​
](#testing-your-server-with-claude-for-desktop-6)
Testing your server with Claude for Desktop
Claude for Desktop is not yet available on Linux. Linux users can proceed to the [Building a client](/docs/develop/build-client) tutorial to build an MCP client that connects to the server we just built.
First, make sure you have Claude for Desktop installed. [You can install the latest version here.](https://claude.ai/download) If you already have Claude for Desktop, **make sure it’s updated to the latest version.**We’ll need to configure Claude for Desktop for whichever MCP servers you want to use. To do this, open your Claude for Desktop App configuration at `\~/Library/Application Support/Claude/claude\_desktop\_config.json` in a text editor. Make sure to create the file if it doesn’t exist.For example, if you have [VS Code](https://code.visualstudio.com/) installed:
macOS/Linux
Windows
```
`code \~/Library/Application\\ Support/Claude/claude\_desktop\_config.json
`
```
You’ll then add your servers in the `mcpServers` key. The MCP UI elements will only show up in Claude for Desktop if at least one server is properly configured.In this case, we’ll add our single weather server like so:
macOS/Linux
Windows
```
`{
"mcpServers": {
"weather": {
"command": "bundle",
"args": ["exec", "ruby", "weather.rb"],
"cwd": "/ABSOLUTE/PATH/TO/PARENT/FOLDER/weather"
}
}
}
`
```
Make sure you pass in the absolute path to your project directory in the `cwd` field. You can get this by running `pwd` on macOS/Linux or `cd` on Windows Command Prompt from your project directory. On Windows, remember to use double backslashes (`\\\\`) or forward slashes (`/`) in the JSON path.
This tells Claude for Desktop:
1. There’s an MCP server named “weather”
2. Launch it by running `bundle exec ruby weather.rb` in the specified directory
Save the file, and restart **Claude for Desktop**.
Let’s get started with building our weather server! [You can find the complete code for what we’ll be building here.](https://github.com/modelcontextprotocol/quickstart-resources/tree/main/weather-server-rust)###
[​
](#prerequisite-knowledge-6)
Prerequisite knowledge
This quickstart assumes you have familiarity with:
* Rust programming language
* Async/await in Rust
* LLMs like Claude
###
[​
](#logging-in-mcp-servers-7)
Logging in MCP Servers
When implementing MCP servers, be careful about how you handle logging:**For STDIO-based servers:** Never use `println!()` or `print!()`, as they write to standard output (stdout). Writing to stdout will corrupt the JSON-RPC messages and break your server.**For HTTP-based servers:** Standard output logging is fine since it doesn’t interfere with HTTP responses.###
[​
](#best-practices-7)
Best Practices
* Use a logging library that writes to stderr or files, such as `tracing` or `log` in Rust.
* Configure your logging framework to avoid stdout output.
###
[​
](#quick-examples-4)
Quick Examples
```
`// ❌ Bad (STDIO)
println!("Processing request");
// ✅ Good (STDIO)
eprintln!("Processing request"); // writes to stderr
`
```
###
[​
](#system-requirements-7)
System requirements
* Rust 1.70 or higher installed.
* Cargo (comes with Rust installation).
###
[​
](#set-up-your-environment-7)
Set up your environment
First, let’s install Rust if you haven’t already. You can install Rust from [rust-lang.org](https://www.rust-lang.org/tools/install):
macOS/Linux
Windows
```
`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
`
```
Verify your Rust installation:
```
`rustc --version
cargo --version
`
```
Now, let’s create and set up our project:
macOS/Linux
Windows
```
`# Create a new Rust project
cargo new weather
cd weather
`
```
Update your `Cargo.toml` to add the required dependencies:
Cargo.toml
```
`[package]
name = "weather"
version = "0.1.0"
edition = "2024"
[dependencies]
rmcp = { version = "0.3", features = ["server", "macros", "transport-io"] }
tokio = { version = "1.46", features = ["full"] }
reqwest = { version = "0.12", features = ["json"] }
serde = { version = "1.0", features = ["derive"] }
serde\_json = "1.0"
anyhow = "1.0"
tracing = "0.1"
tracing-subscriber = { version = "0.3", features = ["env-filter", "std", "fmt"] }
`
```
Now let’s dive into building your server.##
[​
](#building-your-server-7)
Building your server
###
[​
](#importing-packages-and-constants)
Importing packages and constants
Open `src/main.rs` and add these imports and constants at the top:
```
`use anyhow::Result;
use rmcp::{
ServerHandler, ServiceExt,
handler::server::{router::tool::ToolRouter, tool::Parameters},
model::\*,
schemars, tool, tool\_handler, tool\_router,
};
use serde::Deserialize;
use serde::de::DeserializeOwned;
const NWS\_API\_BASE: &str = "https://api.weather.gov";
const USER\_AGENT: &str = "weather-app/1.0";
`
```
The `rmcp` crate provides the Model Context Protocol SDK for Rust, with features for server implementation, procedural macros, and stdio transport.###
[​
](#data-structures)
Data structures
Next, let’s define the data structures for deserializing responses from the National Weather Service API:
```
`#[derive(Debug, Deserialize)]
struct AlertsResponse {
features: Vec\<AlertFeature\>,
}
#[derive(Debug, Deserialize)]
struct AlertFeature {
properties: AlertProperties,
}
#[derive(Debug, Deserialize)]
struct AlertProperties {
event: Option\<String\>,
#[serde(rename = "areaDesc")]
area\_desc: Option\<String\>,
severity: Option\<String\>,
description: Option\<String\>,
instruction: Option\<String\>,
}
#[derive(Debug, Deserialize)]
struct PointsResponse {
properties: PointsProperties,
}
#[derive(Debug, Deserialize)]
struct PointsProperties {
forecast: String,
}
#[derive(Debug, Deserialize)]
struct ForecastResponse {
properties: ForecastProperties,
}
#[derive(Debug, Deserialize)]
struct ForecastProperties {
periods: Vec\<ForecastPeriod\>,
}
#[derive(Debug, Deserialize)]
struct ForecastPeriod {
name: String,
temperature: i32,
#[serde(rename = "temperatureUnit")]
temperature\_unit: String,
#[serde(rename = "windSpeed")]
wind\_speed: String,
#[serde(rename = "windDirection")]
wind\_direction: String,
#[serde(rename = "detailedForecast")]
detailed\_forecast: String,
}
`
```
Now define the request types that MCP clients will send:
```
`#[derive(serde::Deserialize, schemars::JsonSchema)]
pub struct MCPForecastRequest {
latitude: f32,
longitude: f32,
}
#[derive(serde::Deserialize, schemars::JsonSchema)]
pub struct MCPAlertRequest {
state: String,
}
`
```
###
[​
](#helper-functions-3)
Helper functions
Add helper functions for making API requests and formatting responses:
```
`async fn make\_nws\_request\<T: DeserializeOwned\>(url: &str) -\> Result\<T\> {
let client = reqwest::Client::new();
let rsp = client
.get(url)
.header(reqwest::header::USER\_AGENT, USER\_AGENT)
.header(reqwest::header::ACCEPT, "application/geo+json")
.send()
.await?
.error\_for\_status()?;
Ok(rsp.json::\<T\>().await?)
}
fn format\_alert(feature: &AlertFeature) -\> String {
let props = &feature.properties;
format!(
"Event: {}\\nArea: {}\\nSeverity: {}\\nDescription: {}\\nInstructions: {}",
props.event.as\_deref().unwrap\_or("Unknown"),
props.area\_desc.as\_deref().unwrap\_or("Unknown"),
props.severity.as\_deref().unwrap\_or("Unknown"),
props
.description
.as\_deref()
.unwrap\_or("No description available"),
props
.instruction
.as\_deref()
.unwrap\_or("No specific instructions provided")
)
}
fn format\_period(period: &ForecastPeriod) -\> String {
format!(
"{}:\\nTemperature: {}°{}\\nWind: {} {}\\nForecast: {}",
period.name,
period.temperature,
period.temperature\_unit,
period.wind\_speed,
period.wind\_direction,
period.detailed\_forecast
)
}
`
```
###
[​
](#implementing-the-weather-server-and-tools)
Implementing the Weather server and tools
Now let’s implement the main Weather server struct with the tool handlers:
```
`pub struct Weather {
tool\_router: ToolRouter\<Weather\>,
}
#[tool\_router]
impl Weather {
fn new() -\> Self {
Self {
tool\_router: Self::tool\_router(),
}
}
#[tool(description = "Get weather alerts for a US state.")]
async fn get\_alerts(
&self,
Parameters(MCPAlertRequest { state }): Parameters\<MCPAlertRequest\>,
) -\> String {
let url = format!(
"{}/alerts/active/area/{}",
NWS\_API\_BASE,
state.to\_uppercase()
);
match make\_nws\_request::\<AlertsResponse\>(&url).await {
Ok(data) =\> {
if data.features.is\_empty() {
"No active alerts for this state.".to\_string()
} else {
data.features
.iter()
.map(format\_alert)
.collect::\<Vec\<\_\>\>()
.join("\\n---\\n")
}
}
Err(\_) =\> "Unable to fetch alerts or no alerts found.".to\_string(),
}
}
#[tool(description = "Get weather forecast for a location.")]
async fn get\_forecast(
&self,
Parameters(MCPForecastRequest {
latitude,
longitude,
}): Parameters\<MCPForecastRequest\>,
) -\> String {
let points\_url = format!("{NWS\_API\_BASE}/points/{latitude},{longitude}");
let Ok(points\_data) = make\_nws\_request::\<PointsResponse\>(&points\_url).await else {
return "Unable to fetch forecast data for this location.".to\_string();
};
let forecast\_url = points\_data.properties.forecast;
let Ok(forecast\_data) = make\_nws\_request::\<ForecastResponse\>(&forecast\_url).await else {
return "Unable to fetch forecast data for this location.".to\_string();
};
let periods = &forecast\_data.properties.periods;
let forecast\_summary: String = periods
.iter()
.take(5) // Next 5 periods only
.map(format\_period)
.collect::\<Vec\<String\>\>()
.join("\\n---\\n");
forecast\_summary
}
}
`
```
The `#[tool\_router]` macro automatically generates the routing logic, and the `#[tool]` attribute marks methods as MCP tools.###
[​
](#implementing-the-serverhandler)
Implementing the ServerHandler
Implement the `ServerHandler` trait to define server capabilities:
```
`#[tool\_handler]
impl ServerHandler for Weather {
fn get\_info(&self) -\> ServerInfo {
ServerInfo {
capabilities: ServerCapabilities::builder().enable\_tools().build(),
..Default::default()
}
}
}
`
```
###
[​
](#running-the-server-7)
Running the server
Finally, implement the main function to run the server with stdio transport:
```
`#[tokio::main]
async fn main() -\> Result\<()\> {
let transport = (tokio::io::stdin(), tokio::io::stdout());
let service = Weather::new().serve(transport).await?;
service.waiting().await?;
Ok(())
}
`
```
Build your server with:
```
`cargo build --release
`
```
The compiled binary will be in `target/release/weather`.Let’s now test your server from an existing MCP host, Claude for Desktop.##
[​
](#testing-your-server-with-claude-for-desktop-7)
Testing your server with Claude for Desktop
Claude for Desktop is not yet available on Linux. Linux users can proceed to the [Building a client](/docs/develop/build-client) tutorial to build an MCP client that connects to the server we just built.
First, make sure you have Claude for Desktop installed. [You can install the latest version here.](https://claude.ai/download) If you already have Claude for Desktop, **make sure it’s updated to the latest version.**We’ll need to configure Claude for Desktop for whichever MCP servers you want to use. To do this, open your Claude for Desktop App configuration at `\~/Library/Application Support/Claude/claude\_desktop\_config.json` in a text editor. Make sure to create the file if it doesn’t exist.For example, if you have [VS Code](https://code.visualstudio.com/) installed:
macOS/Linux
Windows
```
`code \~/Library/Application\\ Support/Claude/claude\_desktop\_config.json
`
```
You’ll then add your servers in the `mcpServers` key. The MCP UI elements will only show up in Claude for Desktop if at least one server is properly configured.In this case, we’ll add our single weather server like so:
macOS/Linux
Windows
```
`{
"mcpServers": {
"weather": {
"command": "/ABSOLUTE/PATH/TO/PARENT/FOLDER/weather/target/release/weather"
}
}
}
`
```
Make sure you pass in the absolute path to your compiled binary. You can get this by running `pwd` on macOS/Linux or `cd` on Windows Command Prompt from your project directory. On Windows, remember to use double backslashes (`\\\\`) or forward slashes (`/`) in the JSON path, and add the `.exe` extension.
This tells Claude for Desktop:
1. There’s an MCP server named “weather”
2. Launch it by running the compiled binary at the specified path
Save the file, and restart **Claude for Desktop**.
Let’s get started with building our weather server! [You can find the complete code for what we’ll be building here.](https://github.com/modelcontextprotocol/quickstart-resources/tree/main/weather-server-go)###
[​
](#prerequisite-knowledge-7)
Prerequisite knowledge
This quickstart assumes you have familiarity with:
* Go
* LLMs like Claude
###
[​
](#logging-in-mcp-servers-8)
Logging in MCP Servers
When implementing MCP servers, be careful about how you handle logging:**For STDIO-based servers:** Never use `fmt.Println()` or `fmt.Printf()`, as they write to standard output (stdout). Writing to stdout will corrupt the JSON-RPC messages and break your server.**For HTTP-based servers:** Standard output logging is fine since it doesn’t interfere with HTTP responses.###
[​
](#best-practices-8)
Best Practices
* Use `log.Println()` (which defaults to stderr) or a logging library that writes to stderr or files.
* Use `fmt.Fprintf(os.Stderr, ...)` to write to stderr explicitly.
###
[​
](#quick-examples-5)
Quick Examples
```
`// ❌ Bad (STDIO)
fmt.Println("Processing request")
// ✅ Good (STDIO)
log.Println("Processing request") // defaults to stderr
// ✅ Good (STDIO)
fmt.Fprintln(os.Stderr, "Processing request")
`
```
###
[​
](#system-requirements-8)
System requirements
* Go 1.24 or higher installed.
###
[​
](#set-up-your-environment-8)
Set up your environment
First, let’s install Go if you haven’t already. You can download and install Go from [go.dev](https://go.dev/dl/).Verify your Go installation:
```
`go version
`
```
Now, let’s create and set up our project:
macOS/Linux
Windows
```
`# Create a new directory for our project
mkdir weather
cd weather
# Initialize Go module
go mod init weather
# Install dependencies
go get github.com/modelcontextprotocol/go-sdk/mcp
# Create our server file
touch main.go
`
```
Now let’s dive into building your server.##
[​
](#building-your-server-8)
Building your server
###
[​
](#importing-packages-and-constants-2)
Importing packages and constants
Add these to the top of your `main.go`:
```
`package main
import (
"cmp"
"context"
"encoding/json"
"fmt"
"io"
"log"
"net/http"
"strings"
"github.com/modelcontextprotocol/go-sdk/mcp"
)
const (
NWSAPIBase = "https://api.weather.gov"
UserAgent = "weather-app/1.0"
)
`
```
###
[​
](#data-structures-2)
Data structures
Next, let’s define the data structures used by our tools:
```
`type PointsResponse struct {
Properties struct {
Forecast string `json:"forecast"`
} `json:"properties"`
}
type ForecastResponse struct {
Properties struct {
Periods []ForecastPeriod `json:"periods"`
} `json:"properties"`
}
type ForecastPeriod struct {
Name string `json:"name"`
Temperature int `json:"temperature"`
TemperatureUnit string `json:"temperatureUnit"`
WindSpeed string `json:"windSpeed"`
WindDirection string `json:"windDirection"`
DetailedForecast string `json:"detailedForecast"`
}
type AlertsResponse struct {
Features []AlertFeature `json:"features"`
}
type AlertFeature struct {
Properties AlertProperties `json:"properties"`
}
type AlertProperties struct {
Event string `json:"event"`
AreaDesc string `json:"areaDesc"`
Severity string `json:"severity"`
Description string `json:"description"`
Instruction string `json:"instruction"`
}
type ForecastInput struct {
Latitude float64 `json:"latitude" jsonschema:"Latitude of the location"`
Longitude float64 `json:"longitude" jsonschema:"Longitude of the location"`
}
type AlertsInput struct {
State string `json:"state" jsonschema:"Two-letter US state code (e.g. CA, NY)"`
}
`
```
###
[​
](#helper-functions-4)
Helper functions
Next, let’s add our helper functions for querying and formatting the data from the National Weather Service API:
```
`func makeNWSRequest[T any](ctx context.Context, url string) (\*T, error) {
req, err := http.NewRequestWithContext(ctx, http.MethodGet, url, nil)
if err != nil {
return nil, fmt.Errorf("failed to create request: %w", err)
}
req.Header.Set("User-Agent", UserAgent)
req.Header.Set("Accept", "application/geo+json")
client := http.DefaultClient
resp, err := client.Do(req)
if err != nil {
return nil, fmt.Errorf("failed to make request to %s: %w", url, err)
}
defer resp.Body.Close()
if resp.StatusCode != http.StatusOK {
body, \_ := io.ReadAll(resp.Body)
return nil, fmt.Errorf("HTTP error %d: %s", resp.StatusCode, string(body))
}
var result T
if err := json.NewDecoder(resp.Body).Decode(&result); err != nil {
return nil, fmt.Errorf("failed to decode response: %w", err)
}
return &result, nil
}
func formatAlert(alert AlertFeature) string {
props := alert.Properties
event := cmp.Or(props.Event, "Unknown")
areaDesc := cmp.Or(props.AreaDesc, "Unknown")
severity := cmp.Or(props.Severity, "Unknown")
description := cmp.Or(props.Description, "No description available")
instruction := cmp.Or(props.Instruction, "No specific instructions provided")
return fmt.Sprintf(`
Event: %s
Area: %s
Severity: %s
Description: %s
Instructions: %s
`, event, areaDesc, severity, description, instruction)
}
func formatPeriod(period ForecastPeriod) string {
return fmt.Sprintf(`
%s:
Temperature: %d°%s
Wind: %s %s
Forecast: %s
`, period.Name, period.Temperature, period.TemperatureUnit,
period.WindSpeed, period.WindDirection, period.DetailedForecast)
}
`
```
###
[​
](#implementing-tool-execution-5)
Implementing tool execution
The tool execution handler is responsible for actually executing the logic of each tool. Let’s add it:
```
`func getForecast(ctx context.Context, req \*mcp.CallToolRequest, input ForecastInput) (
\*mcp.CallToolResult, any, error,
) {
// Get points data
pointsURL := fmt.Sprintf("%s/points/%f,%f", NWSAPIBase, input.Latitude, input.Longitude)
pointsData, err := makeNWSRequest[PointsResponse](ctx, pointsURL)
if err != nil {
return &mcp.CallToolResult{
Content: []mcp.Content{
&mcp.TextContent{Text: "Unable to fetch forecast data for this location."},
},
}, nil, nil
}
// Get forecast data
forecastURL := pointsData.Properties.Forecast
if forecastURL == "" {
return &mcp.CallToolResult{
Content: []mcp.Content{
&mcp.TextContent{Text: "Unable to fetch forecast URL."},
},
}, nil, nil
}
forecastData, err := makeNWSRequest[ForecastResponse](ctx, forecastURL)
if err != nil {
return &mcp.CallToolResult{
Content: []mcp.Content{
&mcp.TextContent{Text: "Unable to fetch detailed forecast."},
},
}, nil, nil
}
// Format the periods
periods := forecastData.Properties.Periods
if len(periods) == 0 {
return &mcp.CallToolResult{
Content: []mcp.Content{
&mcp.TextContent{Text: "No forecast periods available."},
},
}, nil, nil
}
// Show next 5 periods
var forecasts []string
for i := range min(5, len(periods)) {
forecasts = append(forecasts, formatPeriod(periods[i]))
}
result := strings.Join(forecasts, "\\n---\\n")
return &mcp.CallToolResult{
Content: []mcp.Content{
&mcp.TextContent{Text: result},
},
}, nil, nil
}
func getAlerts(ctx context.Context, req \*mcp.CallToolRequest, input AlertsInput) (
\*mcp.CallToolResult, any, error,
) {
// Build alerts URL
stateCode := strings.ToUpper(input.State)
alertsURL := fmt.Sprintf("%s/alerts/active/area/%s", NWSAPIBase, stateCode)
alertsData, err := makeNWSRequest[AlertsResponse](ctx, alertsURL)
if err != nil {
return &mcp.CallToolResult{
Content: []mcp.Content{
&mcp.TextContent{Text: "Unable to fetch alerts or no alerts found."},
},
}, nil, nil
}
// Check if there are any alerts
if len(alertsData.Features) == 0 {
return &mcp.CallToolResult{
Content: []mcp.Content{
&mcp.TextContent{Text: "No active alerts for this state."},
},
}, nil, nil
}
// Format alerts
var alerts []string
for \_, feature := range alertsData.Features {
alerts = append(alerts, formatAlert(feature))
}
result := strings.Join(alerts, "\\n---\\n")
return &mcp.CallToolResult{
Content: []mcp.Content{
&mcp.TextContent{Text: result},
},
}, nil, nil
}
`
```
###
[​
](#running-the-server-8)
Running the server
Finally, implement the main function to run the server:
```
`func main() {
// Create MCP server
server := mcp.NewServer(&mcp.Implementation{
Name: "weather",
Version: "1.0.0",
}, nil)
// Add get\_forecast tool
mcp.AddTool(server, &mcp.Tool{
Name: "get\_forecast",
Description: "Get weather forecast for a location",
}, getForecast)
// Add get\_alerts tool
mcp.AddTool(server, &mcp.Tool{
Name: "get\_alerts",
Description: "Get weather alerts for a US state",
}, getAlerts)
// Run server on stdio transport
if err := server.Run(context.Background(), &mcp.StdioTransport{}); err != nil {
log.Fatal(err)
}
}
`
```
Build your server with:
```
`go build -o weather .
`
```
The compiled binary will be in `./weather`.Let’s now test your server from an existing MCP host, Claude for Desktop.##
[​
](#testing-your-server-with-claude-for-desktop-8)
Testing your server with Claude for Desktop
Claude for Desktop is not yet available on Linux. Linux users can proceed to the [Building a client](/docs/develop/build-client) tutorial to build an MCP client that connects to the server we just built.
First, make sure you have Claude for Desktop installed. [You can install the latest version here.](https://claude.ai/download) If you already have Claude for Desktop, **make sure it’s updated to the latest version.**We’ll need to configure Claude for Desktop for whichever MCP servers you want to use. To do this, open your Claude for Desktop App configuration at `\~/Library/Application Support/Claude/claude\_desktop\_config.json` in a text editor. Make sure to create the file if it doesn’t exist.For example, if you have [VS Code](https://code.visualstudio.com/) installed:
macOS/Linux
Windows
```
`code \~/Library/Application\\ Support/Claude/claude\_desktop\_config.json
`
```
You’ll then add your servers in the `mcpServers` key. The MCP UI elements will only show up in Claude for Desktop if at least one server is properly configured.In this case, we’ll add our single weather server like so:
macOS/Linux
Windows
```
`{
"mcpServers": {
"weather": {
"command": "/ABSOLUTE/PATH/TO/PARENT/FOLDER/weather/weather"
}
}
}
`
```
Make sure you pass in the absolute path to your compiled binary. You can get this by running `pwd` on macOS/Linux or `cd` on Windows Command Prompt from your project directory. On Windows, remember to use double backslashes (`\\\\`) or forward slashes (`/`) in the JSON path, and add the `.exe` extension.
This tells Claude for Desktop:
1. There’s an MCP server named “weather”
2. Launch it by running the compiled binary at the specified path
Save the file, and restart **Claude for Desktop**.
###
[​
](#test-with-commands)
Test with commands
Let’s make sure Claude for Desktop is picking up the two tools we’ve exposed in our `weather` server. You can do this by looking for the “Add files, connectors, and more /” icon:
After clicking on the plus icon, hover over the “Connectors” menu. You should see the `weather` servers listed:
If your server isn’t being picked up by Claude for Desktop, proceed to the [Troubleshooting](#troubleshooting) section for debugging tips.
If the server has shown up in the “Connectors” menu, you can now test your server by running the following commands in Claude for Desktop:
* What’s the weather in Sacramento?
* What are the active weather alerts in Texas?
Since this is the US National Weather service, the queries will only work for US locations.
##
[​
](#what’s-happening-under-the-hood)
What’s happening under the hood
When you ask a question:
1. The client sends your question to Claude
2. Claude analyzes the available tools and decides which one(s) to use
3. The client executes the chosen tool(s) through the MCP server
4. The results are sent back to Claude
5. Claude formulates a natural language response
6. The response is displayed to you!
##
[​
](#troubleshooting)
Troubleshooting
Claude for Desktop Integration Issues
**Getting logs from Claude for Desktop**Claude.app logging related to MCP is written to log files in `\~/Library/Logs/Claude`:
* `mcp.log` will contain general logging about MCP connections and connection failures.
* Files named `mcp-server-SERVERNAME.log` will contain error (stderr) logging from the named server.
You can run the following command to list recent logs and follow along with any new ones:
```
`# Check Claude's logs for errors
tail -n 20 -f \~/Library/Logs/Claude/mcp\*.log
`
```
**Server not showing up in Claude**
1. Check your `claude\_desktop\_config.json` file syntax
2. Make sure the path to your project is absolute and not relative
3. Restart Claude for Desktop completely
To properly restart Claude for Desktop, you must fully quit the application:
* **Windows**: Right-click the Claude icon in the system tray (which may be hidden in the “hidden icons” menu) and select “Quit” or “Exit”.
* **macOS**: Use Cmd+Q or select “Quit Claude” from the menu bar.
Simply closing the window does not fully quit the application, and your MCP server configuration changes will not take effect.
**Tool calls failing silently**If Claude attempts to use the tools but they fail:
1. Check Claude’s logs for errors
2. Verify your server builds and runs without errors
3. Try restarting Claude for Desktop
**None of this is working. What do I do?**Please refer to our [debugging guide](/docs/tools/debugging) for better debugging tools and more detailed guidance.
Weather API Issues
**Error: Failed to retrieve grid point data**This usually means either:
1. The coordinates are outside the US
2. The NWS API is having issues
3. You’re being rate limited
Fix:
* Verify you’re using US coordinates
* Add a small delay between requests
* Check the NWS API status page
**Error: No active alerts for [STATE]**This isn’t an error - it just means there are no current weather alerts for that state. Try a different state or check during severe weather.
For more advanced troubleshooting, check out our guide on [Debugging MCP](/docs/tools/debugging)
##
[​
](#next-steps)
Next steps
## Building a client
Learn how to build your own MCP client that can connect to your server
## Example servers
Check out our gallery of official MCP servers and implementations
## Debugging Guide
Learn how to effectively debug MCP servers and integrations
## Build with Agent Skills
Use agent skills to guide AI coding assistants through server design