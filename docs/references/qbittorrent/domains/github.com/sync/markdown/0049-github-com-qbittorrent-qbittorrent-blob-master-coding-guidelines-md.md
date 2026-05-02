qBittorrent/CODING\_GUIDELINES.md at master · qbittorrent/qBittorrent · GitHub
[Skip to content](#start-of-content)
{{ message }}
[
qbittorrent
](/qbittorrent)
/
**
[qBittorrent](/qbittorrent/qBittorrent)
**
Public
*
* [ Notifications
](/login?return_to=/qbittorrent/qBittorrent) You must be signed in to change notification settings
* [ Fork
4.6k
](/login?return_to=/qbittorrent/qBittorrent)
*
[
Star
36.8k
](/login?return_to=/qbittorrent/qBittorrent)
## Files
 master
# CODING\_GUIDELINES.md
Blame
Blame
## Latest commit
 
## History
[History](/qbittorrent/qBittorrent/commits/master/CODING_GUIDELINES.md)
[](/qbittorrent/qBittorrent/commits/master/CODING_GUIDELINES.md)
484 lines (370 loc) · 11 KB
 master
# CODING\_GUIDELINES.md
Top
## File metadata and controls
*
Preview
*
Code
*
Blame
484 lines (370 loc) · 11 KB
[Raw](https://github.com/qbittorrent/qBittorrent/raw/refs/heads/master/CODING_GUIDELINES.md)
# Coding Guidelines
[](#coding-guidelines)
All new code **must** follow the following coding guidelines.
If you make changes in a file that still uses another coding style, make sure that you follow these guidelines for your changes.
For programming languages other than C++ (e.g. JavaScript) used in this repository and submodules, unless otherwise specified, coding guidelines listed here applies as much as possible.
**Note 1:** I will not take your head if you forget and use another style. However, most probably the request will be delayed until you fix your coding style.
**Note 2:** You can use the `uncrustify` program/tool to clean up any source file. Use it with the `uncrustify.cfg` configuration file found in the root folder.
**Note 3:** There is also a style for QtCreator but it doesn't cover all cases. In QtCreator `Tools-\>Options...-\>C++-\>Code Style-\>Import...` and choose the `codingStyleQtCreator.xml` file found in the root folder.
## Table Of Contents
[](#table-of-contents)
* [1. New lines & curly braces](#1-new-lines--curly-braces)
* [a. Function blocks, class/struct definitions, namespaces](#a-function-blocks-classstruct-definitions-namespaces)
* [b. Other code blocks](#b-other-code-blocks)
* [c. Blocks in switch's case labels](#c-blocks-in-switchs-case-labels)
* [d. If-else statements](#d-if-else-statements)
* [e. Single statement if blocks](#e-single-statement-if-blocks)
* [f. Acceptable conditions to omit braces](#f-acceptable-conditions-to-omit-braces)
* [g. Brace enclosed initializers](#g-brace-enclosed-initializers)
* [2. Indentation](#2-indentation)
* [3. File encoding and line endings](#3-file-encoding-and-line-endings)
* [4. Initialization lists](#4-initialization-lists)
* [5. Enums](#5-enums)
* [6. Names](#6-names)
* [a. Type names and namespaces](#a-type-names-and-namespaces)
* [b. Variable names](#b-variable-names)
* [c. Private member variable names](#c-private-member-variable-names)
* [7. Header inclusion order](#7-header-inclusion-order)
* [8. Include guard](#8-include-guard)
* [9. Misc](#9-misc)
* [10. Git commit message](#10-git-commit-message)
* [11. Not covered above](#11-not-covered-above)
## 1. New lines & curly braces
[](#1-new-lines--curly-braces)
### a. Function blocks, class/struct definitions, namespaces
[](#a-function-blocks-classstruct-definitions-namespaces)
```
int myFunction(int a)
{
// code
}
void myFunction() {} // empty body
MyClass::MyClass(int \*parent)
: m\_parent {parent}
{
// initialize
}
int MyClass::myMethod(int a)
{
// code
}
class MyOtherClass
{
public:
// code
protected:
// code
private:
// code
};
namespace Name
{
// code
}
// Lambdas
[](int arg1, int arg2) -\> bool { return arg1 \< arg2; }
[this](int arg)
{
this-\>acc += arg;
}
```
### b. Other code blocks
[](#b-other-code-blocks)
```
if (condition)
{
// code
}
for (int a = 0; a \< b; ++a)
{
// code
}
switch (a)
{
case 1:
// blah
case 2:
// blah
default:
// blah
}
{
// code
}
```
### c. Blocks in switch's case labels
[](#c-blocks-in-switchs-case-labels)
```
switch (var)
{
case 1:
{
// declare local variables
// code
}
break;
case 2:
{
// declare local variables
// code
}
break;
default:
// code
}
```
### d. If-else statements
[](#d-if-else-statements)
The `else if`/`else` must be on their own lines:
```
if (condition)
{
// code
}
else if (condition)
{
// code
}
else
{
// code
}
```
### e. Single statement if blocks
[](#e-single-statement-if-blocks)
Most single statement if blocks should look like this:
```
if (condition)
a = a + b;
```
One acceptable exception to this can be `return`, `break` or `continue` statements,
provided that the test condition isn't very long and its body statement occupies only one line.
However you can still choose to use the first rule.
```
if (a \> 0) return;
while (p)
{
// ...
if (!b) continue;
}
```
### f. Acceptable conditions to omit braces
[](#f-acceptable-conditions-to-omit-braces)
When the conditional statement in `if`/`else` has only one line and its body occupy only one line,
this also applies to loops statements.
Notice that for a series of `if - else` branches, if one branch needs braces then all branches must add braces.
```
if (a \< b) // conditional statement
do(a); // body
if (a \< b)
do(a);
else if (a \> b)
do(b);
else
do(c);
if (a \< b)
{
do(a);
}
else if (a \> b)
{
// curly braces required here, then all branches should also add them
do(b);
do(d);
}
else
{
do(c);
}
```
### g. Brace enclosed initializers
[](#g-brace-enclosed-initializers)
Unlike single-line functions, you must not insert spaces between the brackets and concluded expressions.
But you must insert a space between the variable name and initializer.
```
Class obj {}; // empty
Class obj {expr};
Class obj {expr1, /\*...,\*/ exprN};
QVariantMap map {{"key1", 5}, {"key2", 10}};
```
## 2. Indentation
[](#2-indentation)
4 spaces.
## 3. File encoding and line endings
[](#3-file-encoding-and-line-endings)
UTF-8 and Unix-like line ending (LF). Unless some platform specific files need other encodings/line endings.
## 4. Initialization lists
[](#4-initialization-lists)
Initialization lists should be vertical. This will allow for more easily readable diffs. The initialization colon should be indented and in its own line along with first argument. The rest of the arguments should be indented too and have the comma prepended.
```
myClass::myClass(int a, int b, int c, int d)
: m\_a {a}
, m\_b {b}
, m\_c {c}
, m\_d {d}
{
// code
}
```
## 5. Enums
[](#5-enums)
Enums should be vertical. This will allow for more easily readable diffs. The members should be indented.
```
enum Days
{
Monday,
Tuesday,
Wednesday,
Thursday,
Friday,
Saturday,
Sunday
};
```
## 6. Names
[](#6-names)
All names should be camelCased.
### a. Type names and namespaces
[](#a-type-names-and-namespaces)
Type names and namespaces start with Upper case letter (except POD types).
```
class ClassName {};
struct StructName {};
enum EnumName {};
using SomeList = QList\<ClassName\>;
namespace NamespaceName
{
}
```
### b. Variable names
[](#b-variable-names)
Variable names start with lower case letter.
```
int myVar;
```
### c. Private member variable names
[](#c-private-member-variable-names)
Private member variable names start with lower case letter and should have `m\_` prefix.
```
class MyClass
{
int m\_myVar;
}
```
## 7. Header inclusion order
[](#7-header-inclusion-order)
The headers should be placed in the following group order:
1. Module header (in .cpp)
2. C++ Standard Library headers
3. System headers
4. Boost library headers
5. Libtorrent headers
6. Qt headers
7. qBittorrent's own headers, starting from the *base* headers.
The headers should be ordered alphabetically within each group.
If there are conditionals for the same header group, then put them at the bottom of the respective group.
If there are conditionals that contain headers from several different header groups, then put them above the "qBittorrent's own headers" group.
One exception is the header containing the library version (for example, QtVersionChecks), this particular header isn't constrained by the aforementioned order.
Example:
```
// file: examplewidget.cpp
// Module header
#include "examplewidget.h"
// exceptions, headers containing version number
#include \<boost/version.hpp\>
#include \<libtorrent/version.hpp\>
#include \<QtVersionChecks\>
// C++ Standard Library headers
#include \<cstdio\>
#ifdef Q\_OS\_WIN // conditional
#include \<cmath\>
#endif
// System headers
#ifdef Q\_OS\_WIN
#include \<windows.h\>
#endif
// Boost library headers
#include \<boost/circular\_buffer.hpp\>
// Libtorrent headers
#include \<libtorrent/session.hpp\>
// Qt headers
#include \<QString\>
#include \<QUrl\>
#ifdef Q\_OS\_MACOS // conditional
#include \<QFont\>
#endif
// conditional that contains headers from several different header groups
#if LIBTORRENT\_VERSION\_NUM \>= 10100
#include \<memory\>
#include \<QElapsedTimer\>
#endif
// qBittorrent's own headers
#include "base/bittorrent/infohash.h"
#include "anothermodule.h"
#include "ui\_examplewidget.h"
```
## 8. Include guard
[](#8-include-guard)
`#pragma once` must be used instead of a "classic include guard":
```
// examplewidget.h
#pragma once
#include \<QWidget\>
class ExampleWidget : public QWidget
{
// (some code omitted)
};
```
## 9. Misc
[](#9-misc)
* Line breaks for long lines with operation:
```
a += "b"
+ "c"
+ "d";
```
* **auto** keyword
We allow the use of the **auto** keyword only where it is strictly necessary (for example, to declare a lambda object, etc.), or where it **enhances** the readability of the code.
Declarations for which one can gather enough information about the object interface (type) from its name or the usage pattern (an iterator or a loop variable are good examples of clear patterns) or the right part of the expression nicely fit here.
When weighing whether to use an auto-typed variable please think about potential reviewers of your code, who will read it as a plain diff (on github.com, for instance).
Please make sure that such reviewers can understand the code completely and without excessive effort.
Some valid use cases:
* Container iteration and casts:
```
template \<typename List\>
void doSomethingWithList(const List &list)
{
foreach (const auto &item, list)
{
// we don't know item type here so we use 'auto' keyword
// do something with item
}
}
for (auto it = container.begin(), end = container.end(); it != end; ++it)
{
// we don't need to know the exact iterator type,
// because all iterators have the same interface
}
auto spinBox = static\_cast\<QSpinBox\*\>(sender());
// we know the variable type based on the right-hand expression
```
* Notice the spaces in the following specific situations:
```
// Before and after the assignment and other binary (and ternary) operators there should be a space
// There should not be a space between increment/decrement and its operand
a += 20;
a = (b \<= MAX\_B ? b : MAX\_B);
++a;
--b;
for (int a = 0; a \< b; ++b)
{
}
// Range-based for loop, spaces before and after the colon
for (auto i : container)
{
}
// Derived class, spaces before and after the colon
class Derived : public Base
{
};
```
* Prefer pre-increment, pre-decrement operators
```
++i, --j; // yes
i++, j--; // no
```
* private/public/protected must not be indented
* Preprocessor commands must go at line start
* Method definitions aren't allowed in header files
## 10. Git commit message
[](#10-git-commit-message)
1. Limit the subject line to 50 characters. Subject should contain only the very essence of the changes (you should avoid extra details and internals)
2. Separate subject from body with a blank line
3. Capitalize the subject line
4. Do not end the subject line with a period
5. Use the imperative mood in the subject line (it's like you're ordering the program to do something (e.g. "Don't create temporary substrings")
6. Wrap the body at 72 characters
7. Use the body to explain what and why vs. how
8. If commit fixes a reported issue, mention it in the message body (e.g. `Closes #4134.`)
## 11. Not covered above
[](#11-not-covered-above)
If something isn't covered above, just follow the same style the file you are editing has.
*This guide is not exhaustive and the style for a particular piece of code not specified here will be determined by project members on code review.*