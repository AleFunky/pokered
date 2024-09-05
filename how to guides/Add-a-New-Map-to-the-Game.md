*Date created: 2020-12-01*

This tutorial is for adding a new map to the game. This is NOT a map making tutorial--this tutorial shows the exact files that need edited to add a map into the game. Therefore it is assumed that you have already created your own custom map. I'll be using the name 'TestMap1' for the tutorial, but you should swap in your own map name.

### 1. Put your .blk map file (testmap1.blk) in the [/maps/](../blob/master/maps/) folder

### 2. Edit [/constants/map_constants.asm](../blob/master/constants/map_constants.asm)

Look for a line that says 'UNUSED'.

***You need to pay attention to which line you use, because you'll need to replace that exact same line in a few other files later.***

For this tutorial, I am replacing 'UNUSED_MAP_F4' with my custom map.

Replace that line with a line like so:

```diff
-	mapconst UNUSED_MAP_F4,                  0,  0 ; $F4
+	mapconst TEST_MAP_1,                     6,  5 ; $F4
```

- The first part 'mapconst' is required and can't be changed
- The second part 'TEST_MAP_1' is where you put the name of your map
	- NOTE: You should follow the same naming format the other maps use to avoid issues down the road
- The two numbers after the name are the height and width of the map
	- This needs to match the height and width you used when creating the .blk map file
- Anything after a semi-colon at the end of a line is a comment, it's not actual code and just used for reference

### 3. Create the following file: /data/mapHeaders/testmap1.asm

```
TestMap1_h:
	db CEMETERY ; tileset
	db TEST_MAP_1_HEIGHT, TEST_MAP_1_WIDTH ; dimensions (y, x)
	dw TestMap1Blocks, TestMap1TextPointers, TestMap1Script ; blocks, texts, scripts
	db 0 ; connections
	dw TestMap1Object ; objects
```

Change 'CEMETERY' to whatever tileset your map uses.

Keep the rest the same (use your map's name in place of TestMap1 of course).

***Remember to follow the naming scheme--if they use all caps and underscores, do the same thing.***

### 4. Create the following file: /data/mapObjects/testmap1.asm

```
TestMap1Object:
	db $0 ; border block

	db 1 ; warps
	warp 4, 11, 0, REDS_HOUSE_2F

	db 0 ; signs

	db 0 ; objects

	; warp-to
	warp_to 4, 11, TEST_MAP_1_WIDTH
```

- The first 'db' line, '*db $0*' sets the block used for the outside border of the map
- The second 'db' line sets how many warps the map has
- Under that, each warp is defined
    - The word 'warp' is required at the beginning of each warp
	- The first and second numbers are coordinates of where the warp is on the map
		- Use a map editor like Polished Map to find map coordinates
    - The third number is a 'warp ID' that indicates which warp to go to on the following map
		- Warps are counted in the order they are listed in the file, starting from 0
        - So the first warp in a file has an ID of 0, the second has an ID of 1, etc.
        - In my example, I'm warping from my TestMap1 to REDS_HOUSE_2F. If you open data/mapObjects/redshouse2f.asm and look at the list of warps, you'll only see one warp (the stairway going downstairs). This is the first (and only) warp on that map, so it's ID is 0
		- The name after the warp ID is the name of the map you are warping to
			- Notice the capitalization and underscores, this is required
    - You'll need to define the warps again at the end of this file or they won't work, don't forget that step!!
- The third 'db' line is for signs that display text
    - This is not required and isn't covered in this tutorial
- The fourth 'db' line is for objects (NPCs, trainers, etc)
    - This is not required and isn't covered in this tutorial
- At the end of the file is where you define the warps again
	- Change 'warp' to 'warp-to'
    - Keep the 2 coordinate numbers
    - Remove the warp ID
    - The last part needs to be the name of the current map with '_WIDTH' at the end
        - I have no idea why, but it's required

### 5. Edit [/data/map_header_banks.asm](../blob/master/data/map_header_banks.asm)

Remember that line I told you to remember earlier? You need to find that line in this file, and then replace it:

```diff
-	db $11 ; UNUSED_MAP_F4
+	db BANK(TestMap1_h)
```

You don't have to use 'UNUSED_MAP_F4', you can replace any map including maps that already exist in the game.

### 6. Edit [/data/map_header_pointers.asm](../blob/master/data/map_header_pointers.asmm)

Just like the last file, find the corresponding line and then replace it:

```diff
-	dw SilphCo2F_h ; UNUSED_MAP_F4
+	dw TestMap1_h
```

### 7. Create the following file: /scripts/testmap1.asm

```
TestMap1Script:
	jp EnableAutoTextBoxDrawing

TestMap1TextPointers:
	db "@"
```

As far as I can tell, these two parts are required, even if you have no scripts or texts for the map

### 8. Edit [/main.asm](../blob/master/main,asm)

We need to include our map's files in this list somewhere. I decided to add mine after the last map in the file, which is Agataha's Room. Look for the line *AgathaBlocks: INCBIN "maps/agatha.blk"* and add the following underneath:

```diff
INCLUDE "data/mapHeaders/agatha.asm"
INCLUDE "scripts/agatha.asm"
INCLUDE "data/mapObjects/agatha.asm"
AgathaBlocks: INCBIN "maps/agatha.blk"

+INCLUDE "data/mapHeaders/testmap1.asm"
+INCLUDE "scripts/testmap1.asm"
+INCLUDE "data/mapObjects/testmap1.asm"
+TestMap1Blocks: INCBIN "maps/testmap1.blk"
```

That's all the required steps to add a new map. All you need to do is set up a warp to your map from another map.

At this point you'll probably want to add trainers, NPCs, text etc. There should already be some tutorials out there for those, but I may make my own tutorials later if need be.
