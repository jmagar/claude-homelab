JavaScript | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
## Filenames[​](#filenames)
Filenames must be camel case and may not include underscores (`\_`) or dashes (`-`). The filename's extensions must be `.js`.
## File Structure[​](#file-structure)
All files must abide by the following general structure, with JSDoc comments being optional but preferred.
```
`
/\*\*
\* This module documents the structure used by JavaScript code in Jellyfin.
\*
\* @module path/to/this/module
\*/
import module from 'dependency';
import { myFunction, myClass } from 'dependency/submodule';
import 'otherDependency';
/\*\*
\* Defines a non-exported function, accessible only from this module.
\*
\* @param {Object} argument - The argument to pass to the function.
\* @returns {Int|null} The resulting object from the function.
\*/
function privateFunction (argument) {
// Code omitted
}
export function publicFunction (argument) {
// Code omitted
}
export default { publicFunction }
`
```
## Miscellaneous[​](#miscellaneous)
### File Encoding[​](#file-encoding)
All files must be encoded in UTF-8 and use LF line endings when committed.
### Non-ASCII Characters[​](#non-ascii-characters)
For printable characters, use the actual Unicode character directly in your code.
For non-printable characters, use the hexadecimal or Unicode escape.
* [Filenames](#filenames)
* [File Structure](#file-structure)
* [Miscellaneous](#miscellaneous)
* [File Encoding](#file-encoding)
* [Non-ASCII Characters](#non-ascii-characters)