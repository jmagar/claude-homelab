Migrate a Legacy Codebase with Sandbox Agents
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
Apr 7, 2026
# Migrate a Legacy Codebase with Sandbox Agents
[ KK ](https://www.linkedin.com/in/kahadze/)
[ Konstantine Kahadze
(OpenAI)
](https://www.linkedin.com/in/kahadze/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/agents_sdk/sandboxed-code-migration/sandboxed_code_migration_agent.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/agents_sdk/sandboxed-code-migration/sandboxed_code_migration_agent.ipynb)
Code modernization never really ends. Outdated dependencies, security risks, compliance pressure, and legacy patterns keep accumulating across large codebases, and one massive migration PR is hard to review and risky to merge. A code-migration agent should work in a controlled environment, one scoped task at a time: inspect the relevant repo, edit files, run checks, and return a patch.
This cookbook uses the Agents SDK with the harness *outside* the sandbox: orchestration stays in the trusted host process, while shell commands and file edits run in isolated execution environments. This separation lets the host harness use secrets, tools, and external services while giving the sandbox only the files and commands needed for the task.
By the end of this cookbook, you’ll be able to:
* Keep the agent harness outside the execution environment that runs shell commands and file edits
* Segment a modernization job into task-sized repo shards
* Validate each shard with tests, checks, artifacts, and an audit log
* Swap sandbox providers without rewriting the agent
The example is a two-service code migration. Each service runs in its own sandbox and returns its own patch bundle, the same shape you could use to open separate pull requests for review and CI. In each sandbox, the agent migrates an OpenAI client wrapper from [Chat Completions](https://platform.openai.com/docs/api-reference/chat) to the [Responses API](https://platform.openai.com/docs/api-reference/responses). Along the way it runs tests, patches the app and tests, runs a compile check, reruns tests, and returns a typed migration report with a patch.
We’ll run the sandbox with Docker locally. Provider-specific code is isolated to sandbox creation, so the same harness and agent can point at hosted sandbox providers such as E2B or Cloudflare without changing the `SandboxAgent`, tools, manifest, or prompt.
## Architecture: sandbox as a tool
The trusted host process owns the Agents SDK harness, tools, MCP servers, credentials, policy, and audit. The execution environment receives only the scoped workspace for the current task and the sandbox-facing capabilities needed to run commands and edit files.
Another pattern is to launch a coding agent whose harness, agent loop, tools, and filesystem all live inside the sandbox. That can work, but it pushes orchestration and tool integration into the same environment that runs generated code.
In this pattern, the sandbox is something the harness calls when the agent needs a filesystem, terminal command, test run, or patch. The broader agent stack stays on the harness side.
Flow:
1. Your app receives a migration request and splits it into task-sized repo shards.
2. For each task, the host-side Agents SDK harness starts an agent and creates a fresh sandbox.
3. The harness stages that task’s repo and migration brief into the sandbox.
4. The agent uses sandbox tools to inspect files, edit code, and run tests.
5. The host receives the task’s report and patch, writes an audit log, deletes the sandbox, and moves to the next task.
## Requirements
* Python 3.10+
* Docker, running locally for the Docker sandbox example
* An OpenAI API key, exported as `OPENAI\_API\_KEY`
* The OpenAI Agents SDK with sandbox support
* Optional: hosted sandbox provider credentials, such as `E2B\_API\_KEY` for E2B or a Cloudflare Worker URL and API key for Cloudflare
Keep API keys in the host environment. Do not add them to the mounted repo or sandbox manifest.
## Install dependencies
Clone the cookbook and move into this example directory:
```
`git clone https://github.com/openai/openai-cookbook.git
cd openai-cookbook/examples/agents\_sdk/sandboxed-code-migration`
```
Open `sandboxed\_code\_migration\_agent.ipynb` from that directory and install the dependencies below. Start Docker before running the full agent demo.
```
`%pip install -r requirements.txt --quiet`
```
## Import the host-side harness
Import the small host-side runner used by this example. It creates sandbox sessions, starts the agent loop, writes returned artifacts, records an audit log, and keeps provider credentials out of the mounted repo. The full file is included at [`src/run\_migration\_agent.py`](src/run_migration_agent.py); the notebook pulls the important pieces into the walkthrough below.
```
`from \_\_future\_\_ import annotations
import os
import subprocess
import sys
from pathlib import Path
from agents import ModelSettings
from agents.mcp import MCPServer
from agents.sandbox import Manifest, SandboxAgent
from agents.sandbox.capabilities import ApplyPatch, Shell
from agents.sandbox.entries import LocalDir, LocalFile
EXAMPLE\_ROOT = Path.cwd()
sys.path.insert(0, str(EXAMPLE\_ROOT))
from src.run\_migration\_agent import (
AGENT\_INSTRUCTIONS,
DEFAULT\_MIGRATION\_TASKS,
DEVELOPER\_INSTRUCTIONS,
MigrationResult,
MigrationTask,
OPENAI\_RESPONSES\_MIGRATION\_DOC\_URL,
run\_migration\_campaign,
)
migration\_tasks = list(DEFAULT\_MIGRATION\_TASKS)
task = migration\_tasks[0]
print("Migration campaign:")
for migration\_task in migration\_tasks:
print(f"- {migration\_task.name}: {migration\_task.repo\_path}")
print(f"\\nInspecting first task: {task.name}")`
```
## 1. Define the migration tasks
This cookbook includes two small fixture repos in `repo\_fixtures/`. If you run the notebook as-is, the host harness mounts each fixture repo into a fresh sandbox as `/workspace/repo` and asks the agent to follow that repo’s `MIGRATION.md`.
The task list points each migration shard at a local repo:
```
`@dataclass(frozen=True)
class MigrationTask:
name: str
repo\_path: Path
@property
def migration\_brief\_path(self) -\> Path:
return self.repo\_path / "MIGRATION.md"
DEFAULT\_MIGRATION\_TASKS = (
MigrationTask(
name="support\_reply\_service",
repo\_path=EXAMPLE\_ROOT / "repo\_fixtures" / "support\_reply\_service",
),
MigrationTask(
name="case\_summary\_service",
repo\_path=EXAMPLE\_ROOT / "repo\_fixtures" / "case\_summary\_service",
),
)`
```
To adapt this to your own codebase, replace the task’s `repo\_path` and edit its `MIGRATION.md`. The generic run prompt can stay the same because it tells the agent to follow the mounted repo’s brief.
Inspect one task before the agent touches it: the migration brief, the OpenAI client wrapper, and the application call site.
```
`print(task.migration\_brief\_path.read\_text())`
```
Now inspect the two main code targets: the OpenAI client wrapper and the application call site that uses it.
```
`print((task.repo\_path / "customer\_support\_bot" / "client.py").read\_text())`
```
```
`print((task.repo\_path / "customer\_support\_bot" / "replies.py").read\_text())`
```
## 2. Verify the baseline before the agent edits anything
Before the agent edits a repo, run the same tests yourself. The agent will run this baseline test command inside that task’s sandbox before it changes any files.
```
`baseline = subprocess.run(
[sys.executable, "-m", "unittest", "discover", "-s", "tests", "-t", "."],
cwd=task.repo\_path,
text=True,
capture\_output=True,
check=False,
)
print(baseline.stdout)
print(baseline.stderr)
assert baseline.returncode == 0`
```
```
`check = subprocess.run(
[sys.executable, "-m", "compileall", "-q", "customer\_support\_bot", "tests"],
cwd=task.repo\_path,
text=True,
capture\_output=True,
check=False,
)
print(check.stdout)
print(check.stderr)
assert check.returncode == 0`
```
## 3. Stage the sandbox workspace
The manifest is the sandbox boundary. It tells the sandbox client which host files to stage and where they should appear in the execution environment. Here, we copy the agent instructions and one task repo into `/workspace`.
For a real migration, stage only the target checkout, task instructions, and files required for that run. Keep credentials, customer storage, and memory in the host harness. The helper below stays small for that reason: it stages only the shared agent instructions and the repo for the current migration task.
```
`def build\_manifest(task: MigrationTask | None = None) -\> Manifest:
task = task or DEFAULT\_MIGRATION\_TASKS[0]
return Manifest(
root="/workspace",
entries={
"migration\_agent/AGENTS.md": LocalFile(
src=EXAMPLE\_ROOT / "migration\_agent" / "AGENTS.md"
),
"repo": LocalDir(src=task.repo\_path),
},
)
manifest = build\_manifest(task)
print(f"manifest root: {manifest.root}")
for workspace\_path in manifest.entries:
print(workspace\_path)`
```
## 4. Define the sandbox agent
The agent gets two sandbox-facing capabilities: `Shell()` for terminal work and `ApplyPatch()` for file edits. Everything else in the definition stays with the host harness: instructions, model settings, MCP servers, and the typed output contract.
```
`def build\_agent(
\*,
model: str,
manifest: Manifest,
mcp\_servers: list[MCPServer] | None = None,
) -\> SandboxAgent:
return SandboxAgent(
name="Code Migration Agent",
model=model,
instructions=AGENT\_INSTRUCTIONS,
developer\_instructions=DEVELOPER\_INSTRUCTIONS,
default\_manifest=manifest,
capabilities=[Shell(), ApplyPatch()],
mcp\_servers=list(mcp\_servers or []),
model\_settings=ModelSettings(tool\_choice="required"),
output\_type=MigrationResult,
)
agent = build\_agent(model="gpt-5.4", manifest=manifest)
print(agent.name)
print([capability.type for capability in agent.capabilities])
print(agent.output\_type)`
```
### Optional: connect a host-side MCP server
Because the harness runs outside the sandbox, it can connect MCP servers from the trusted host process. The sandbox does not need MCP credentials or broad network access.
This runner can optionally connect the public OpenAI docs MCP from the host harness. The agent can use that docs context while shell commands and patches still run in the sandbox.
Keep this deterministic for migrations. Fetch the approved migration guide instead of asking the agent to search the docs during every run.
```
`OPTIONAL\_OPENAI\_DOCS\_MCP\_URL = "https://developers.openai.com/mcp"
print("Optional host-side MCP:")
print(f" server: {OPTIONAL\_OPENAI\_DOCS\_MCP\_URL}")
print(f" pinned doc: {OPENAI\_RESPONSES\_MIGRATION\_DOC\_URL}")
print("To opt in for the full run, set this before the agent cell:")
print(f' os.environ["OPENAI\_DOCS\_MCP\_URL"] = "{OPTIONAL\_OPENAI\_DOCS\_MCP\_URL}"')`
```
## 5. Run the migration campaign
The full run is a host-side loop over migration tasks. For each task, the harness builds the manifest and agent, creates a fresh sandbox session, and passes that session into `Runner.run\_streamed`. After the task finishes, the host writes the returned patch bundle under `outputs/\<task\_name\>/` and deletes the sandbox before starting the next task.
```
`manifest = build\_manifest(task)
agent = build\_agent(model=model, manifest=manifest, mcp\_servers=mcp\_servers)
client, session = await create\_sandbox(backend, manifest, docker\_image=docker\_image)
try:
async with session:
result = Runner.run\_streamed(
agent,
[{"role": "user", "content": f"Task name: {task.name}\\n\\n{prompt}"}],
max\_turns=30,
run\_config=RunConfig(
sandbox=SandboxRunConfig(session=session),
workflow\_name=f"Sandboxed code migration: {task.name} ({backend})",
tracing\_disabled=not enable\_hosted\_tracing,
),
)
async for event in result.stream\_events():
if event.type == "run\_item\_stream\_event" and event.name in {"tool\_called", "tool\_output"}:
append\_audit\_event(audit\_log\_path, {"event": event.name})
finally:
await client.delete(session)`
```
The snippet above is the core of `run\_migration\_task`; the runnable cell below calls the full helper. The run is guarded so the notebook can execute without calling the model. Change `RUN\_FULL\_AGENT\_DEMO` to `True` when you want to run the Docker-backed migration end to end.
```
`RUN\_FULL\_AGENT\_DEMO = False
enable\_hosted\_tracing = False
# Optional: uncomment to let the host harness fetch the pinned Responses migration guide.
# os.environ["OPENAI\_DOCS\_MCP\_URL"] = "https://developers.openai.com/mcp"
if RUN\_FULL\_AGENT\_DEMO:
campaign = await run\_migration\_campaign(
tasks=migration\_tasks,
backend=os.getenv("SANDBOX\_BACKEND", "docker"),
model=os.getenv("OPENAI\_MODEL", "gpt-5.4"),
prompt=(
"Migrate the mounted repo from Chat Completions to the Responses API. "
"Follow migration\_agent/AGENTS.md and repo/MIGRATION.md. "
"Run the required baseline tests, patch the app and tests, "
"run the check command, run the final tests, produce a diff, "
"and return the structured migration result."
),
docker\_image=os.getenv("SANDBOX\_DOCKER\_IMAGE", "python:3.14-slim"),
output\_root=EXAMPLE\_ROOT / "outputs",
enable\_hosted\_tracing=enable\_hosted\_tracing,
)
for summary in campaign.task\_summaries:
print(f"{summary.task\_name}: {summary.patch\_path}")
else:
print("Skipped. Set RUN\_FULL\_AGENT\_DEMO=True to run the Docker-backed campaign.")`
```
## 6. Inspect returned artifacts
The host runner writes each task’s typed result to disk. The sandboxes can disappear after the run; each task’s report, patch, JSON result, and audit log remain in `outputs/\<task\_name\>/`, with a campaign summary at `outputs/batch\_summary.json`.
```
`artifact\_names = [
"migration\_report.md",
"migration.patch",
"migration\_result.json",
"migration\_audit.jsonl",
]
for migration\_task in migration\_tasks:
print(f"\\n=== {migration\_task.name} ===")
task\_output\_dir = EXAMPLE\_ROOT / "outputs" / migration\_task.name
for artifact\_name in artifact\_names:
path = task\_output\_dir / artifact\_name
if path.exists():
print(f"\\n--- {path.name} ---")
print(path.read\_text()[:3000])
else:
print(f"not generated yet: {path}")`
```
### Optional: validate the generated artifacts
The host can check each returned patch, typed result, and audit log before showing a patch to a user or applying it to a real repo. This eval is deterministic: it reads the campaign outputs and fails if any task did not produce the expected contract.
```
`if (EXAMPLE\_ROOT / "outputs" / "batch\_summary.json").exists():
subprocess.run([sys.executable, "evals.py"], cwd=EXAMPLE\_ROOT, check=True)
else:
print("Skipped. Run the full agent demo before running artifact evals.")`
```
## 7. Optional: swap sandbox providers
This section shows three sandbox backends: Docker for local runs, E2B for a hosted sandbox, and Cloudflare for a hosted worker-backed sandbox. The pattern is the same: change the sandbox client, not the agent.
Docker:
```
`client = DockerSandboxClient(docker.from\_env())
session = await client.create(
manifest=manifest,
options=DockerSandboxClientOptions(image="python:3.14-slim"),
)`
```
E2B:
```
`client = E2BSandboxClient()
session = await client.create(
manifest=manifest,
options=E2BSandboxClientOptions(
sandbox\_type=E2BSandboxType.E2B,
),
)`
```
Run E2B from the CLI:
```
`export E2B\_API\_KEY="..."
python src/run\_migration\_agent.py --backend e2b`
```
Cloudflare:
```
`client = CloudflareSandboxClient()
session = await client.create(
manifest=manifest,
options=CloudflareSandboxClientOptions(
worker\_url=os.environ["CLOUDFLARE\_SANDBOX\_WORKER\_URL"],
api\_key=os.environ.get("CLOUDFLARE\_SANDBOX\_API\_KEY"),
),
)`
```
Run Cloudflare from the CLI:
```
`export CLOUDFLARE\_SANDBOX\_WORKER\_URL="https://..."
export CLOUDFLARE\_SANDBOX\_API\_KEY="..."
python src/run\_migration\_agent.py --backend cloudflare`
```
Run Docker from the CLI:
```
`python src/run\_migration\_agent.py --backend docker`
```
## Production notes
Production code should keep orchestration, execution, data access, and returned outputs behind separate trust boundaries. Treat each migration task as its own unit of review.
|Boundary|Production pattern|
|Harness|Keep orchestration, tools, credentials, policy, and audit on the host.|
|Sandbox|Stage only the task workspace. Run commands and edits there. Tear it down after the task.|
|Data access|Route customer storage and network access through the host, not directly through the sandbox.|
|Output|Validate sandbox output in the host before showing it to users or applying changes.|
## Tracing and ZDR
This example disables hosted tracing per run with `RunConfig.tracing\_disabled=True`. To opt in while running this cookbook’s CLI, pass `--enable-hosted-tracing`. The Agents SDK also supports the global `OPENAI\_AGENTS\_DISABLE\_TRACING=1` environment variable when you want tracing disabled process-wide.
## Next steps
To adapt this pattern, replace `migration\_tasks` with your own repos, packages, or services. Give each task one checkout and one `MIGRATION.md`. Keep the validation commands explicit, and return a patch for review instead of applying host-side changes automatically. Add deterministic evals that check the migration contract, not just whether the test suite passes.
When the job spans many packages, such as a Jest-to-Vitest migration, the host harness can use repo metadata or a manager agent to plan shards. Each shard should produce the same thing this cookbook produces: a validated patch, report, and audit trail from an isolated sandbox.