Memory Import Processor | Gemini CLI
[Skip to content](#_top)
# Memory Import Processor
Copy as Markdown Copied!
The Memory Import Processor is a feature that lets you modularize your GEMINI.md
files by importing content from other files using the `@file.md` syntax.
## Overview
[Section titled “Overview”](#overview)
This feature enables you to break down large GEMINI.md files into smaller, more
manageable components that can be reused across different contexts. The import
processor supports both relative and absolute paths, with built-in safety
features to prevent circular imports and ensure file access security.
## Syntax
[Section titled “Syntax”](#syntax)
Use the `@` symbol followed by the path to the file you want to import:
```
`
# Main GEMINI.md file
This is the main content.
@./components/instructions.md
More content here.
@./shared/configuration.md
`
```
## Supported path formats
[Section titled “Supported path formats”](#supported-path-formats)
### Relative paths
[Section titled “Relative paths”](#relative-paths)
* `@./file.md` - Import from the same directory
* `@../file.md` - Import from parent directory
* `@./components/file.md` - Import from subdirectory
### Absolute paths
[Section titled “Absolute paths”](#absolute-paths)
* `@/absolute/path/to/file.md` - Import using absolute path
## Examples
[Section titled “Examples”](#examples)
### Basic import
[Section titled “Basic import”](#basic-import)
```
`
# My GEMINI.md
Welcome to my project!
@./get-started.md
## Features
@./features/overview.md
`
```
### Nested imports
[Section titled “Nested imports”](#nested-imports)
The imported files can themselves contain imports, creating a nested structure:
main.md
```
`
@./header.md @./content.md @./footer.md
`
```
header.md
```
`
# Project Header
@./shared/title.md
`
```
## Safety features
[Section titled “Safety features”](#safety-features)
### Circular import detection
[Section titled “Circular import detection”](#circular-import-detection)
The processor automatically detects and prevents circular imports:
file-a.md
```
`
@./file-b.md
`
```
file-b.md
```
`
@./file-a.md \<!-- This will be detected and prevented --\>
`
```
### File access security
[Section titled “File access security”](#file-access-security)
The `validateImportPath` function ensures that imports are only allowed from
specified directories, preventing access to sensitive files outside the allowed
scope.
### Maximum import depth
[Section titled “Maximum import depth”](#maximum-import-depth)
To prevent infinite recursion, there’s a configurable maximum import depth
(default: 5 levels).
## Error handling
[Section titled “Error handling”](#error-handling)
### Missing files
[Section titled “Missing files”](#missing-files)
If a referenced file doesn’t exist, the import will fail gracefully with an
error comment in the output.
### File access errors
[Section titled “File access errors”](#file-access-errors)
Permission issues or other file system errors are handled gracefully with
appropriate error messages.
## Code region detection
[Section titled “Code region detection”](#code-region-detection)
The import processor uses the `marked` library to detect code blocks and inline
code spans, ensuring that `@` imports inside these regions are properly ignored.
This provides robust handling of nested code blocks and complex Markdown
structures.
## Import tree structure
[Section titled “Import tree structure”](#import-tree-structure)
The processor returns an import tree that shows the hierarchy of imported files,
similar to Claude’s `/memory` feature. This helps users debug problems with
their GEMINI.md files by showing which files were read and their import
relationships.
Example tree structure:
```
`
Memory Files
L project: GEMINI.md
L a.md
L b.md
L c.md
L d.md
L e.md
L f.md
L included.md
`
```
The tree preserves the order that files were imported and shows the complete
import chain for debugging purposes.
## Comparison to Claude Code’s `/memory` (`claude.md`) approach
[Section titled “Comparison to Claude Code’s /memory (claude.md) approach”](#comparison-to-claude-codes-memory-claudemd-approach)
Claude Code’s `/memory` feature (as seen in `claude.md`) produces a flat, linear
document by concatenating all included files, always marking file boundaries
with clear comments and path names. It does not explicitly present the import
hierarchy, but the LLM receives all file contents and paths, which is sufficient
for reconstructing the hierarchy if needed.
The import tree is mainly for clarity during development and has
limited relevance to LLM consumption.
## API reference
[Section titled “API reference”](#api-reference)
### `processImports(content, basePath, debugMode?, importState?)`
[Section titled “processImports(content, basePath, debugMode?, importState?)”](#processimportscontent-basepath-debugmode-importstate)
Processes import statements in GEMINI.md content.
**Parameters:**
* `content` (string): The content to process for imports
* `basePath` (string): The directory path where the current file is located
* `debugMode` (boolean, optional): Whether to enable debug logging (default:
false)
* `importState` (ImportState, optional): State tracking for circular import
prevention
**Returns:** Promise\<ProcessImportsResult\> - Object containing processed
content and import tree
### `ProcessImportsResult`
[Section titled “ProcessImportsResult”](#processimportsresult)
```
`
interface ProcessImportsResult {
content: string; // The processed content with imports resolved
importTree: MemoryFile; // Tree structure showing the import hierarchy
}
`
```
### `MemoryFile`
[Section titled “MemoryFile”](#memoryfile)
```
`
interface MemoryFile {
path: string; // The file path
imports?: MemoryFile[]; // Direct imports, in the order they were imported
}
`
```
### `validateImportPath(importPath, basePath, allowedDirectories)`
[Section titled “validateImportPath(importPath, basePath, allowedDirectories)”](#validateimportpathimportpath-basepath-alloweddirectories)
Validates import paths to ensure they are safe and within allowed directories.
**Parameters:**
* `importPath` (string): The import path to validate
* `basePath` (string): The base directory for resolving relative paths
* `allowedDirectories` (string[]): Array of allowed directory paths
**Returns:** boolean - Whether the import path is valid
### `findProjectRoot(startDir)`
[Section titled “findProjectRoot(startDir)”](#findprojectrootstartdir)
Finds the project root by searching for a `.git` directory upwards from the
given start directory. Implemented as an **async** function using non-blocking
file system APIs to avoid blocking the Node.js event loop.
**Parameters:**
* `startDir` (string): The directory to start searching from
**Returns:** Promise\<string\> - The project root directory (or the start
directory if no `.git` is found)
## Best Practices
[Section titled “Best Practices”](#best-practices)
1. **Use descriptive file names** for imported components
2. **Keep imports shallow** - avoid deeply nested import chains
3. **Document your structure** - maintain a clear hierarchy of imported files
4. **Test your imports** - ensure all referenced files exist and are accessible
5. **Use relative paths** when possible for better portability
## Troubleshooting
[Section titled “Troubleshooting”](#troubleshooting)
### Common issues
[Section titled “Common issues”](#common-issues)
1. **Import not working**: Check that the file exists and the path is correct
2. **Circular import warnings**: Review your import structure for circular
references
3. **Permission errors**: Ensure the files are readable and within allowed
directories
4. **Path resolution issues**: Use absolute paths if relative paths aren’t
resolving correctly
### Debug mode
[Section titled “Debug mode”](#debug-mode)
Enable debug mode to see detailed logging of the import process:
```
`
const result = await processImports(content, basePath, true);
`
```
Last updated: Apr 10, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.