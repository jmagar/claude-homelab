File system tools reference | Gemini CLI
[Skip to content](#_top)
# File system tools reference
Copy as Markdown Copied!
Gemini CLI core provides a suite of tools for interacting with the local file
system. These tools allow the model to explore and modify your codebase.
## Technical reference
[Section titled “Technical reference”](#technical-reference)
All file system tools operate within a `rootDirectory` (the current working
directory or workspace root) for security.
### `list\_directory` (ReadFolder)
[Section titled “list\_directory (ReadFolder)”](#list_directory-readfolder)
Lists the names of files and subdirectories directly within a specified path.
* **Tool name:** `list\_directory`
* **Arguments:**
* `dir\_path` (string, required): Absolute or relative path to the directory.
* `ignore` (array, optional): Glob patterns to exclude.
* `file\_filtering\_options` (object, optional): Configuration for `.gitignore`
and `.geminiignore` compliance.
### `read\_file` (ReadFile)
[Section titled “read\_file (ReadFile)”](#read_file-readfile)
Reads and returns the content of a specific file. Supports text, images, audio,
and PDF.
* **Tool name:** `read\_file`
* **Arguments:**
* `file\_path` (string, required): Path to the file.
* `offset` (number, optional): Start line for text files (0-based).
* `limit` (number, optional): Maximum lines to read.
### `write\_file` (WriteFile)
[Section titled “write\_file (WriteFile)”](#write_file-writefile)
Writes content to a specified file, overwriting it if it exists or creating it
if not.
* **Tool name:** `write\_file`
* **Arguments:**
* `file\_path` (string, required): Path to the file.
* `content` (string, required): Data to write.
* **Confirmation:** Requires manual user approval.
### `glob` (FindFiles)
[Section titled “glob (FindFiles)”](#glob-findfiles)
Finds files matching specific glob patterns across the workspace.
* **Tool name:** `glob`
* **Display name:** FindFiles
* **File:** `glob.ts`
* **Parameters:**
* `pattern` (string, required): The glob pattern to match against (for
example, `"\*.py"`, `"src/\*\*/\*.js"`).
* `path` (string, optional): The absolute path to the directory to search
within. If omitted, searches the tool’s root directory.
* `case\_sensitive` (boolean, optional): Whether the search should be
case-sensitive. Defaults to `false`.
* `respect\_git\_ignore` (boolean, optional): Whether to respect .gitignore
patterns when finding files. Defaults to `true`.
* **Behavior:**
* Searches for files matching the glob pattern within the specified directory.
* Returns a list of absolute paths, sorted with the most recently modified
files first.
* Ignores common nuisance directories like `node\_modules` and `.git` by
default.
* **Output (`llmContent`):** A message like:
`Found 5 file(s) matching "\*.ts" within src, sorted by modification time (newest first):\\nsrc/file1.ts\\nsrc/subdir/file2.ts...`
* **Confirmation:** No.
### `grep\_search` (SearchText)
[Section titled “grep\_search (SearchText)”](#grep_search-searchtext)
`grep\_search` searches for a regular expression pattern within the content of
files in a specified directory. Can filter files by a glob pattern. Returns the
lines containing matches, along with their file paths and line numbers.
* **Tool name:** `grep\_search`
* **Display name:** SearchText
* **File:** `grep.ts`
* **Parameters:**
* `pattern` (string, required): The regular expression (regex) to search for
(for example, `"function\\s+myFunction"`).
* `path` (string, optional): The absolute path to the directory to search
within. Defaults to the current working directory.
* `include` (string, optional): A glob pattern to filter which files are
searched (for example, `"\*.js"`, `"src/\*\*/\*.{ts,tsx}"`). If omitted,
searches most files (respecting common ignores).
* **Behavior:**
* Uses `git grep` if available in a Git repository for speed; otherwise, falls
back to system `grep` or a JavaScript-based search.
* Returns a list of matching lines, each prefixed with its file path (relative
to the search directory) and line number.
* **Output (`llmContent`):** A formatted string of matches, for example:
```
`
Found 3 matches for pattern "myFunction" in path "." (filter: "\*.ts"):
---
File: src/utils.ts
L15: export function myFunction() {
L22: myFunction.call();
---
File: src/index.ts
L5: import { myFunction } from './utils';
---
`
```
* **Confirmation:** No.
### `replace` (Edit)
[Section titled “replace (Edit)”](#replace-edit)
`replace` replaces text within a file. By default, the tool expects to find and
replace exactly ONE occurrence of `old\_string`. If you want to replace multiple
occurrences of the exact same string, set `allow\_multiple` to `true`. This tool
is designed for precise, targeted changes and requires significant context
around the `old\_string` to ensure it modifies the correct location.
* **Tool name:** `replace`
* **Arguments:**
* `file\_path` (string, required): Path to the file.
* `instruction` (string, required): Semantic description of the change.
* `old\_string` (string, required): Exact literal text to find.
* `new\_string` (string, required): Exact literal text to replace with.
* `allow\_multiple` (boolean, optional): If `true`, replaces all occurrences.
If `false` (default), only succeeds if exactly one occurrence is found.
* **Confirmation:** Requires manual user approval.
## Next steps
[Section titled “Next steps”](#next-steps)
* Follow the [File management tutorial](/docs/cli/tutorials/file-management) for
practical examples.
* Learn about [Trusted folders](/docs/cli/trusted-folders) to manage access
permissions.
Last updated: Apr 10, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.