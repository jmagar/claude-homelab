RCE via eval() sandbox bypass using lambda nested scope to escape co\_names whitelist check · Advisory · Tautulli/Tautulli · GitHub
[Skip to content](#start-of-content)
{{ message }}
[
Tautulli
](/Tautulli)
/
**
[Tautulli](/Tautulli/Tautulli)
**
Public
*
* [ Notifications
](/login?return_to=/Tautulli/Tautulli) You must be signed in to change notification settings
* [ Fork
623
](/login?return_to=/Tautulli/Tautulli)
*
[
Star
6.5k
](/login?return_to=/Tautulli/Tautulli)
#
RCE via eval() sandbox bypass using lambda nested scope to escape co\_names whitelist check
High
[JonnyWong16](/JonnyWong16)
published
GHSA-m62j-gwm9-7p8m
Mar 28, 2026
## Software
Tautulli
## Affected versions
\<= 2.16.1
## Patched versions
2.16.2
## Description
## Summary
The `str\_eval()` function in `notification\_handler.py` (line 1928) implements a sandboxed `eval()` for notification text templates. The sandbox attempts to restrict callable names by inspecting `code.co\_names` of the compiled code object. However, `co\_names` only contains names from the **outer** code object. When a `lambda` expression is used, it creates a **nested** code object whose attribute accesses are stored in `code.co\_consts`, NOT in `code.co\_names`. The sandbox never inspects nested code objects.
## Root Cause
**File:** `plexpy/notification\_handler.py`, lines 1928-1944
```
def str\_eval(field\_name, kwargs):
field\_name = field\_name.strip('`')
allowed\_names = {
'bool': bool,
'divmod': helpers.helper\_divmod,
'float': helpers.cast\_to\_float,
'int': helpers.cast\_to\_int,
'len': helpers.helper\_len,
'round': helpers.helper\_round,
'str': str
}
allowed\_names.update(kwargs)
code = compile(field\_name, '\<string\>', 'eval')
for name in code.co\_names: # BUG: only checks OUTER code object
if name not in allowed\_names:
raise NameError('Use of {name} not allowed'.format(name=name))
return eval(code, {'\_\_builtins\_\_': {}}, allowed\_names)
```
The `allowed\_names` dict includes `int` which maps to `helpers.cast\_to\_int` — a regular Python function (not a C builtin). This function's `\_\_globals\_\_` provides access to the `plexpy.helpers` module scope, which imports `os` at line 37.
## PoC
Notification template expression (backtick-delimited eval):
```
`{`(lambda f: f.\_\_globals\_\_["os"].popen("id").read())(int)`}
`
```
**Why it bypasses the sandbox:**
```
`Outer co\_names: ('int',) --\> 'int' IS in allowed\_names --\> PASSES CHECK
Inner co\_names: ('\_\_globals\_\_', 'popen', 'read') --\> NEVER INSPECTED
`
```
**Trigger path:**
1. `NOTIFY\_TEXT\_EVAL` must be enabled in Advanced Settings (default: OFF)
2. Admin configures a notification template containing `{\\`(lambda f: f.**globals**["os"].popen("id").read())(int)`}`
3. Any notification event fires (play, stop, recently added, etc.)
4. The eval sandbox is bypassed and `os.popen("id")` executes on the server
## Why This Matters Despite Being Admin-Gated
* The `NOTIFY\_TEXT\_EVAL` feature was explicitly designed with a safety sandbox (name whitelist + empty `\_\_builtins\_\_`). This bypass completely defeats that security layer.
* This escalates from "evaluate simple math expressions" to "arbitrary OS command execution."
* Combined with lack of CSRF protection on admin endpoints, a remote attacker could enable `NOTIFY\_TEXT\_EVAL` and configure a malicious notification template via CSRF to achieve unauthenticated RCE.
* API key leakage (in logs, screenshots) combined with this bypass also leads to RCE.
## Recommended Fix
Replace `co\_names`-only check with recursive inspection of nested code objects:
```
import types
def \_check\_names(code, allowed\_names):
for name in code.co\_names:
if name not in allowed\_names:
raise NameError('Use of {name} not allowed'.format(name=name))
for const in code.co\_consts:
if isinstance(const, types.CodeType):
\_check\_names(const, allowed\_names)
```
Or better: use `ast.parse()` with a whitelist-based AST visitor instead of bytecode inspection.
### Severity
High
### CVE ID
CVE-2026-28505
### Weaknesses
No CWEs
### Credits
* [](/q1uf3ng)[
q1uf3ng](/q1uf3ng)
Reporter