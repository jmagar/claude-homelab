FastAPI 🤝 FastMCP - FastMCP
Documentation
##### Get Started
* [
Welcome!
](/getting-started/welcome)
* [
Installation
](/getting-started/installation)
* [
Quickstart
](/getting-started/quickstart)
##### Servers
* [
Overview
](/servers/server)
*
Core Components
*
FeaturesUPDATED
*
Providers
*
Transforms
*
Auth
*
Deployment
##### Apps
* [
Overview
NEW
](/apps/overview)
* [
Quickstart
NEW
](/apps/quickstart)
* [
Examples
NEW
](/apps/examples)
*
Building AppsNEW
*
ProvidersNEW
*
AdvancedNEW
##### Clients
* [
Overview
](/clients/client)
* [
Transports
](/clients/transports)
*
Core Operations
*
HandlersUPDATED
*
AuthenticationUPDATED
##### Integrations
*
Auth
*
Web Frameworks
* [
FastAPI
](/integrations/fastapi)
* [
OpenAPI
](/integrations/openapi)
*
AI Assistants
*
AI SDKs
* [
MCP.json
](/integrations/mcp-json-configuration)
##### CLI
* [
Overview
](/cli/overview)
* [
Running
](/cli/running)
* [
Install MCPs
](/cli/install-mcp)
* [
Inspecting
](/cli/inspecting)
* [
Client
](/cli/client)
* [
Generate CLI
](/cli/generate-cli)
* [
Auth
](/cli/auth)
##### More
* [
Settings
](/more/settings)
*
Upgrading
*
Development
*
What's New
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
FastMCP provides two powerful ways to integrate with FastAPI applications:
1. **[Generate an MCP server FROM your FastAPI app](#generating-an-mcp-server)** - Convert existing API endpoints into MCP tools
2. **[Mount an MCP server INTO your FastAPI app](#mounting-an-mcp-server)** - Add MCP functionality to your web application
When generating an MCP server from FastAPI, FastMCP uses OpenAPIProvider (v3.0.0+) under the hood to source tools from your FastAPI app’s OpenAPI spec. See [Providers](/servers/providers/overview) to understand how FastMCP sources components.
Generating MCP servers from OpenAPI is a great way to get started with FastMCP, but in practice LLMs achieve **significantly better performance** with well-designed and curated MCP servers than with auto-converted OpenAPI servers. This is especially true for complex APIs with many endpoints and parameters.We recommend using the FastAPI integration for bootstrapping and prototyping, not for mirroring your API to LLM clients. See the post [Stop Converting Your REST APIs to MCP](https://www.jlowin.dev/blog/stop-converting-rest-apis-to-mcp) for more details.
FastMCP does *not* include FastAPI as a dependency; you must install it separately to use this integration.
##
[​
](#example-fastapi-application)
Example FastAPI Application
Throughout this guide, we’ll use this e-commerce API as our example (click the `Copy` button to copy it for use with other code blocks):
```
`# Copy this FastAPI server into other code blocks in this guide
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
# Models
class Product(BaseModel):
name: str
price: float
category: str
description: str | None = None
class ProductResponse(BaseModel):
id: int
name: str
price: float
category: str
description: str | None = None
# Create FastAPI app
app = FastAPI(title="E-commerce API", version="1.0.0")
# In-memory database
products\_db = {
1: ProductResponse(
id=1, name="Laptop", price=999.99, category="Electronics"
),
2: ProductResponse(
id=2, name="Mouse", price=29.99, category="Electronics"
),
3: ProductResponse(
id=3, name="Desk Chair", price=299.99, category="Furniture"
),
}
next\_id = 4
@app.get("/products", response\_model=list[ProductResponse])
def list\_products(
category: str | None = None,
max\_price: float | None = None,
) -\> list[ProductResponse]:
"""List all products with optional filtering."""
products = list(products\_db.values())
if category:
products = [p for p in products if p.category == category]
if max\_price:
products = [p for p in products if p.price \<= max\_price]
return products
@app.get("/products/{product\_id}", response\_model=ProductResponse)
def get\_product(product\_id: int):
"""Get a specific product by ID."""
if product\_id not in products\_db:
raise HTTPException(status\_code=404, detail="Product not found")
return products\_db[product\_id]
@app.post("/products", response\_model=ProductResponse)
def create\_product(product: Product):
"""Create a new product."""
global next\_id
product\_response = ProductResponse(id=next\_id, \*\*product.model\_dump())
products\_db[next\_id] = product\_response
next\_id += 1
return product\_response
@app.put("/products/{product\_id}", response\_model=ProductResponse)
def update\_product(product\_id: int, product: Product):
"""Update an existing product."""
if product\_id not in products\_db:
raise HTTPException(status\_code=404, detail="Product not found")
products\_db[product\_id] = ProductResponse(
id=product\_id,
\*\*product.model\_dump(),
)
return products\_db[product\_id]
@app.delete("/products/{product\_id}")
def delete\_product(product\_id: int):
"""Delete a product."""
if product\_id not in products\_db:
raise HTTPException(status\_code=404, detail="Product not found")
del products\_db[product\_id]
return {"message": "Product deleted"}
`
```
See all 83 lines
All subsequent code examples in this guide assume you have the above FastAPI application code already defined. Each example builds upon this base application, `app`.
##
[​
](#generating-an-mcp-server)
Generating an MCP Server
New in version `2.0.0`
One of the most common ways to bootstrap an MCP server is to generate it from an existing FastAPI application. FastMCP will expose your FastAPI endpoints as MCP components (tools, by default) in order to expose your API to LLM clients.
###
[​
](#basic-conversion)
Basic Conversion
Convert the FastAPI app to an MCP server with a single line:
```
`# Assumes the FastAPI app from above is already defined
from fastmcp import FastMCP
# Convert to MCP server
mcp = FastMCP.from\_fastapi(app=app)
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run()
`
```
###
[​
](#adding-components)
Adding Components
Your converted MCP server is a full FastMCP instance, meaning you can add new tools, resources, and other components to it just like you would with any other FastMCP instance.
```
`# Assumes the FastAPI app from above is already defined
from fastmcp import FastMCP
# Convert to MCP server
mcp = FastMCP.from\_fastapi(app=app)
# Add a new tool
@mcp.tool
def get\_product(product\_id: int) -\> ProductResponse:
"""Get a product by ID."""
return products\_db[product\_id]
# Run the MCP server
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run()
`
```
###
[​
](#interacting-with-the-mcp-server)
Interacting with the MCP Server
Once you’ve converted your FastAPI app to an MCP server, you can interact with it using the FastMCP client to test functionality before deploying it to an LLM-based application.
```
`# Assumes the FastAPI app from above is already defined
from fastmcp import FastMCP
from fastmcp.client import Client
import asyncio
# Convert to MCP server
mcp = FastMCP.from\_fastapi(app=app)
async def demo():
async with Client(mcp) as client:
# List available tools
tools = await client.list\_tools()
print(f"Available tools: {[t.name for t in tools]}")
# Create a product
result = await client.call\_tool(
"create\_product\_products\_post",
{
"name": "Wireless Keyboard",
"price": 79.99,
"category": "Electronics",
"description": "Bluetooth mechanical keyboard"
}
)
print(f"Created product: {result.data}")
# List electronics under $100
result = await client.call\_tool(
"list\_products\_products\_get",
{"category": "Electronics", "max\_price": 100}
)
print(f"Affordable electronics: {result.data}")
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(demo())
`
```
###
[​
](#custom-route-mapping)
Custom Route Mapping
Because FastMCP’s FastAPI integration is based on its [OpenAPI integration](/integrations/openapi), you can customize how endpoints are converted to MCP components in exactly the same way. For example, here we use a `RouteMap` to map all GET requests to MCP resources, and all POST/PUT/DELETE requests to MCP tools:
```
`# Assumes the FastAPI app from above is already defined
from fastmcp import FastMCP
from fastmcp.server.openapi import RouteMap, MCPType
# Custom mapping rules
mcp = FastMCP.from\_fastapi(
app=app,
route\_maps=[
# GET with path params → ResourceTemplates
RouteMap(
methods=["GET"],
pattern=r".\*\\{.\*\\}.\*",
mcp\_type=MCPType.RESOURCE\_TEMPLATE
),
# Other GETs → Resources
RouteMap(
methods=["GET"],
pattern=r".\*",
mcp\_type=MCPType.RESOURCE
),
# POST/PUT/DELETE → Tools (default)
],
)
# Now:
# - GET /products → Resource
# - GET /products/{id} → ResourceTemplate
# - POST/PUT/DELETE → Tools
`
```
To learn more about customizing the conversion process, see the [OpenAPI Integration guide](/integrations/openapi).
###
[​
](#authentication-and-headers)
Authentication and Headers
You can configure headers and other client options via the `httpx\_client\_kwargs` parameter. For example, to add authentication to your FastAPI app, you can pass a `headers` dictionary to the `httpx\_client\_kwargs` parameter:
```
`# Assumes the FastAPI app from above is already defined
from fastmcp import FastMCP
# Add authentication to your FastAPI app
from fastapi import Depends, Header
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
security = HTTPBearer()
def verify\_token(credentials: HTTPAuthorizationCredentials = Depends(security)):
if credentials.credentials != "secret-token":
raise HTTPException(status\_code=401, detail="Invalid authentication")
return credentials.credentials
# Add a protected endpoint
@app.get("/admin/stats", dependencies=[Depends(verify\_token)])
def get\_admin\_stats():
return {
"total\_products": len(products\_db),
"categories": list(set(p.category for p in products\_db.values()))
}
# Create MCP server with authentication headers
mcp = FastMCP.from\_fastapi(
app=app,
httpx\_client\_kwargs={
"headers": {
"Authorization": "Bearer secret-token",
}
}
)
`
```
##
[​
](#mounting-an-mcp-server)
Mounting an MCP Server
New in version `2.3.1`
In addition to generating servers, FastMCP can facilitate adding MCP servers to your existing FastAPI application. You can do this by mounting the MCP ASGI application.
###
[​
](#basic-mounting)
Basic Mounting
To mount an MCP server, you can use the `http\_app` method on your FastMCP instance. This will return an ASGI application that can be mounted to your FastAPI application.
```
`from fastmcp import FastMCP
from fastapi import FastAPI
# Create MCP server
mcp = FastMCP("Analytics Tools")
@mcp.tool
def analyze\_pricing(category: str) -\> dict:
"""Analyze pricing for a category."""
products = [p for p in products\_db.values() if p.category == category]
if not products:
return {"error": f"No products in {category}"}
prices = [p.price for p in products]
return {
"category": category,
"avg\_price": round(sum(prices) / len(prices), 2),
"min": min(prices),
"max": max(prices),
}
# Create ASGI app from MCP server
mcp\_app = mcp.http\_app(path='/mcp')
# Key: Pass lifespan to FastAPI
app = FastAPI(title="E-commerce API", lifespan=mcp\_app.lifespan)
# Mount the MCP server
app.mount("/analytics", mcp\_app)
# Now: API at /products/\*, MCP at /analytics/mcp/
`
```
##
[​
](#offering-an-llm-friendly-api)
Offering an LLM-Friendly API
A common pattern is to generate an MCP server from your FastAPI app and serve both interfaces from the same application. This provides an LLM-optimized interface alongside your regular API:
```
`# Assumes the FastAPI app from above is already defined
from fastmcp import FastMCP
from fastapi import FastAPI
# 1. Generate MCP server from your API
mcp = FastMCP.from\_fastapi(app=app, name="E-commerce MCP")
# 2. Create the MCP's ASGI app
mcp\_app = mcp.http\_app(path='/mcp')
# 3. Create a new FastAPI app that combines both sets of routes
combined\_app = FastAPI(
title="E-commerce API with MCP",
routes=[
\*mcp\_app.routes, # MCP routes
\*app.routes, # Original API routes
],
lifespan=mcp\_app.lifespan,
)
# Now you have:
# - Regular API: http://localhost:8000/products
# - LLM-friendly MCP: http://localhost:8000/mcp
# Both served from the same FastAPI application!
`
```
This approach lets you maintain a single codebase while offering both traditional REST endpoints and MCP-compatible endpoints for LLM clients.
##
[​
](#key-considerations)
Key Considerations
###
[​
](#operation-ids)
Operation IDs
FastAPI operation IDs become MCP component names. Always specify meaningful operation IDs:
```
`# Good - explicit operation\_id
@app.get("/users/{user\_id}", operation\_id="get\_user\_by\_id")
def get\_user(user\_id: int):
return {"id": user\_id}
# Less ideal - auto-generated name
@app.get("/users/{user\_id}")
def get\_user(user\_id: int):
return {"id": user\_id}
`
```
###
[​
](#lifespan-management)
Lifespan Management
When mounting MCP servers, always pass the lifespan context:
```
`# Correct - lifespan passed, path="/" since we mount at /mcp
mcp\_app = mcp.http\_app(path="/")
app = FastAPI(lifespan=mcp\_app.lifespan)
app.mount("/mcp", mcp\_app) # MCP endpoint at /mcp
# Incorrect - missing lifespan
app = FastAPI()
app.mount("/mcp", mcp.http\_app(path="/")) # Session manager won't initialize
`
```
If you’re mounting an authenticated MCP server under a path prefix, see [Mounting Authenticated Servers](/deployment/http#mounting-authenticated-servers) for important OAuth routing considerations.
###
[​
](#cors-middleware)
CORS Middleware
If your FastAPI app uses `CORSMiddleware` and you’re mounting an OAuth-protected FastMCP server, avoid adding application-wide CORS middleware. FastMCP and the MCP SDK already handle CORS for OAuth routes, and layering CORS middleware can cause conflicts (such as 404 errors on `.well-known` routes or OPTIONS requests).
If you need CORS on your own FastAPI routes, use the sub-app pattern: mount your API and FastMCP as separate apps, each with their own middleware, rather than adding top-level `CORSMiddleware` to the combined application.
###
[​
](#combining-lifespans)
Combining Lifespans
If your FastAPI app already has a lifespan (for database connections, startup tasks, etc.), you can’t simply replace it with the MCP lifespan. Use `combine\_lifespans` to run both:
```
`from fastapi import FastAPI
from fastmcp import FastMCP
from fastmcp.utilities.lifespan import combine\_lifespans
from contextlib import asynccontextmanager
# Your existing lifespan
@asynccontextmanager
async def app\_lifespan(app: FastAPI):
print("Starting up the app...")
yield
print("Shutting down the app...")
# Create MCP server
mcp = FastMCP("Tools")
mcp\_app = mcp.http\_app(path="/")
# Combine both lifespans
app = FastAPI(lifespan=combine\_lifespans(app\_lifespan, mcp\_app.lifespan))
app.mount("/mcp", mcp\_app) # MCP endpoint at /mcp
`
```
`combine\_lifespans` enters lifespans in order and exits in reverse order.
###
[​
](#performance-tips)
Performance Tips
1. **Use in-memory transport for testing** - Pass MCP servers directly to clients
2. **Design purpose-built MCP tools** - Better than auto-converting complex APIs
3. **Keep tool parameters simple** - LLMs perform better with focused interfaces
For more details on configuration options, see the [OpenAPI Integration guide](/integrations/openapi).