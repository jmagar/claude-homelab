OpenAI showcase - Swifty Dungeon
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ Home ](/showcase)
* [ API examples ](/showcase/api-examples)
[API Dashboard](https://platform.openai.com/login)
[
← All projects
](/showcase)
Description
Swifty Dungeon is a playable native macOS dungeon crawler created end-to-end in Codex with GPT-5.5. It combines a raycast-style first-person viewport, procedural labyrinth floors, turn-based movement and combat, equipment, inventory, item pickups, potions, leveling, animated enemy sprites, sidebars, minimap, HUD controls, and unified logging telemetry.
##
Build notes
###
Initial prompt
Copy prompt
```
Use $imagegen and @Build macOS apps to build a native macOS first-person dungeon crawler.
First, use $imagegen to generate a screenshot/interface of the ideal app: a native SwiftUI Liquid Glass app with the playable dungeon view in the center, the character and on-screen arrow keys in the bottom area, and player status plus inventory in the right sidebar.
The game should be a turn-by-turn dungeon crawler where you navigate randomly generated labyrinths, fight monsters, level up, and reach the next floor. Use $imagegen again to generate dungeon tilesets, wall textures, and floor themes. Build the app with enough telemetry to debug it, and make the deliverable playable end to end.
```
[
Try in Codex
](<codex://new?prompt=Use+$imagegen+and+@Build+macOS+apps+to+build+a+native+macOS+first-person+dungeon+crawler.
First,+use+$imagegen+to+generate+a+screenshot/interface+of+the+ideal+app:+a+native+SwiftUI+Liquid+Glass+app+with+the+playable+dungeon+view+in+the+center,+the+character+and+on-screen+arrow+keys+in+the+bottom+area,+and+player+status+plus+inventory+in+the+right+sidebar.
The+game+should+be+a+turn-by-turn+dungeon+crawler+where+you+navigate+randomly+generated+labyrinths,+fight+monsters,+level+up,+and+reach+the+next+floor.+Use+$imagegen+again+to+generate+dungeon+tilesets,+wall+textures,+and+floor+themes.+Build+the+app+with+enough+telemetry+to+debug+it,+and+make+the+deliverable+playable+end+to+end.>)
###
Iterations
1. Use $imagegen to generate the ideal app screenshot/interface: native SwiftUI Liquid Glass, center dungeon view, bottom movement controls, and right status/inventory sidebar.
2. Use the generated image as direction for a first playable version, then use $imagegen to create dungeon sprites and wall textures.
3. Use $imagegen to generate a monster sprite sheet with animation frames, then bring those animations into the game engine.
4. Use $imagegen again to generate dungeon tilesets, wall textures, and floor themes.
5. Polish the native macOS interface and tidy the code.
6. Make the deliverable playable end to end.
7.
Final step
An open-sourced Swifty Dungeon prototype with generated visual direction, a playable end-to-end game loop, telemetry, screenshot, README, and build scripts.
Built with
Codex + GPT-5.5 + ImageGen
Models
GPT-5.5GPT Image 2
APIs / Products
Codex
Tech stack
Swift[ SwiftUI ](/showcase?tech_stack=SwiftUI)SwiftPMmacOS
Use case
[ Games ](/showcase?use_case=games)[ Visual experience ](/showcase?use_case=visual-experience)
Harness
Codex
Type
[ Game ](/showcase?app_type=game)
##
Related projects
[
### Swifty Roguelike
Swifty Roguelike is a playable native macOS prototype created with Codex...
GPT-5.5 Codex Swift
](/showcase/swifty-roguelike)[
### Brick Platformer
This platformer game was generated with Codex + GPT-5
GPT-5.5 Codex React
](/showcase/brick-platformer)[
### Neon FPS
This browser FPS game was generated with Codex + GPT-5
GPT-5.5 Codex React
](/showcase/rift-vox)