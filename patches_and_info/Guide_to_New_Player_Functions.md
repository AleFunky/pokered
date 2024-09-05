#Updating an Old Save File
-----------------------------------------------
If the old save was from an earlier Shin Pokemon version, deactivate all special options and NPC toggles.  
Make a copy of the old save file. This will be your new save file.  
Load the new save with the latest version of Shin Pokemon.  
You will be automatically warped to Pallet Town.  
Save the game. Your save file is now updated.  

**Troubleshooting**  
If you are blocked by invisible walls, use the Softlock Warp (detailed below).  
On the old save, before transferring it over, saving outside in Pallet town can solve certain issues.  


#Some Changes to Particular Mechanics
-----------------------------------------------
**Trade Evolutions**  
Except for the Lite patches, pokemon that evolve by trade can also evolve by other means.  
  - Kadabra: Hinted at by a Pewter Museum NPC that comments on the moon stone
  - Haunter: Hinted at by the Lavender Town NPC that asks if you believe in ghosts
  - Graveler: Hinted at by a Cinnabar Island NPC that talks about the mansion
  - Machoke: Hinted at by a house NPC in Pewter City that talks about trainers teaching pokemon

**Rage**  
This move now lasts 2 to 3 turns to prevent getting stuck in an infinite loop.  
Any attack boosts gained during Rage are retained when it ends.  
In this way, Rage is almost like an alternate take on Bide.  
Having your Raging pokemon tank a multi-hit move is a great way to setup for a physical sweep.  

**Bide**  
Each hit of a multi-hit move now adds to Bide's damage instead of just the first.  
Needless to say, using Double Kick on a Bide-user has the potential to backfire horribly.  

**Transform**  
Move slots cannot be rearranged when transformed to prevent acquiring glitch moves.  
When transforming into a pokemon and copying its Transform move, the PP of the copied move is set thusly.  
- The PP of the Transform move getting copied is read at the current instant.
- If > 5, then the copy Transform is set to 5 PP.
- If <= 5, then the copy transform is set to the current instant PP - 1.
This will prevent endless battles between two pokemon who can only transform.  

**Sleep Status**  
You can choose a move while asleep, and the move is used upon waking up.  
Sleep starts with a counter of at least 2 in order to maintain the accuracy of sleep effect moves.  
Rest now sets the sleep counter to 3 in order to preserve its lose-2-turns penalty.  
These changes help to remove the "infinite combo" that could be done by high-speed users of sleep moves.  
Overall, the only loss is that sleep has a maximum possible lost-turn number of 6 instead of 7.  

**Trapping Moves**  
Switching out of trapping moves (Wrap, Clamp, Fire Spin, etc) ends the move and wastes the trapper's turn.  
This matches what Pokemon Stadium enforces upon trapping moves.  
Additionally,except for the Lite patches, a 'poof' animation plays to signal the last turn of a trapping move.  

**Critical Hits**  
If a critical hit would do less damage than its non-critical value, the non-critical value will be used instead.  
Furthermore, the effect for Dire Hit and Focus Energy now work correctly and quadruple the critical hit rate.  

**X-Accuracy and One-Hit-K.O. Moves**  
X-Accuracy no longer gives OHKO moves 100% accuracy.  
X-Accuracy now allows OHKO moves to hit a faster opponent.  

**New Random Number Engine**  
The game now uses an XOR-shift-style pseudorandom number generator.  
This method is a good and speedy solution for 8-bit processors.  
The random seeds are taken from garbage values in HRAM on boot-up. Power-cycle your game if your luck is bad.  
Of note, all wild pokemon DV combinations are now possible regardless of the current map.  

**Fixes/Improvements to Catching Mechanics and Safari Zone**  
- The ball factors of 8 for Great balls and 12 for Safari balls have been swapped.  
  - This means that Great balls are no better at catching full-health pokemon than its peers.  
  - It also means that Safari balls are much better for catching full-health pokemon, as was likely intended.  
- The catch rate in Safari battles will now reset when either the "eating" or "angry" state end.  
- Throwing a Safari ball in the Safari Zone simplifies to the following process.  
  - Generate two random numbers: Rand1 in the range of [0, 125] and Rand2 in the range of [0, 255].  
  - A catch is made if (Rand1 <= pokemon's catch rate) and (Rand2 <= 127), effectively a chance of [catch rate / 252].  
- Except for the Lite patches, fleeing chance in the Safari Zone now uses [1.5 x Level] instead of [current speed].  
  - This greatly reins in fleeing by fast pokemon and slightly boosts fleeing by slow pokemon.  
  - The "angry" state flees at about 26%-36% per turn.  
  - Likewise, the "eating" state flees at about 3%-5% percent per turn.  
  - Therefore, rocks are fewer-turns-high-risk while bait is more-turns-low-risk.  
  - Try the following strategy:
    - Push your luck with the "angry" state by throwing rocks, doubling the catch rate each time.
    - Then throw a single bait, switching to the "eating" state at the cost halving the catch rate once.
    - Now throw Safari balls while enjoying a low flee chance with an increased catch rate.  


#Debug Functions
-----------------------------------------------
**Softlock Warp**  
This will instantly teleport you back to your mom's house in Pallet Town if you get stuck.  
It also sets your money to at least 1000 if you have less than that.  
Use this warp if you find yourself unable to move after updating to a new patch.  
Instructions to perform:  
1 - Go to the start menu and put the cursor on OPTION.  
2 - Press and hold DOWN on the d-pad. The cursor will now be on EXIT.  
3 - While continuing to hold DOWN, press and hold SELECT.  
4 - While still continuing to hold the two aforementioned buttons, press B.  
5 - The start menu should close and you will warp back to your mom's house.  

**Vanilla Options Reset**  
This will undo all of the special options in case you are updating to a new patch.  
Instructions to perform:  
1 - Go to the start menu and put the cursor on the top option (usually POKEDEX).  
2 - Press and hold UP on the d-pad. The cursor will now be on EXIT.  
3 - While continuing to hold UP, press and hold SELECT.  
4 - While still continuing to hold the two aforementioned buttons, press B.  
5 - The start menu should close and you will will hear a jingle.  

**Debug Damage Display**  
As a debugging cheat, damage values will be displayed in battle as the UI updates.  
Toggled on/off via the following method:  
1 - Go to the start menu and put the cursor on OPTION.  
2 - Press and hold DOWN on the d-pad. The cursor will now be on EXIT.  
3 - While continuing to hold DOWN, press and hold SELECT.  
4 - While still continuing to hold the two aforementioned buttons, press A.  
5 - The start menu should close. A PC "boot up" sfx will play to indicate ON, or "shutdown" sfx to indicate OFF.  
Zero damage is not displayed.  
Damage is not displayed if either pokemon has zero HP remaining.  

**Debug RNG Seed Display**  
At the title screen, press and hold A + SELECT until the main menu appears.  
This will display the 4-byte RNG seed at the main menu for debugging purposes.  

**Debug DV / Stat EXP Reset**  
Not available in the Lite patches.  
On your POKEMON party screen from the start menu, place the cursor over a desired pokemon.  
Then press A while holding LEFT + SELECT.  
You will be prompted to confirm your decision.  
If YES, that pokemon will have all its Stat EXP reset to zero.  
Also, it's DVs will be set to match the quantities of the first four items in your active bag.  


#Engine Functions
-----------------------------------------------
**Extra Options Menu**  
Press SELECT on the main options menu to go to the extra menu where several new features can be toggled.  

**Activate Color Correction**  
This applies when playing or emulating as a Gameboy Color game.  
It's assumed you are using a modern backlit screen with no other color correction.  
Under these stated conditions, the colors will be highly saturated.  
Press SELECT at the copyright screen when the game first boots (before the Gamefreak logo). 
- A sfx will play and a symbol with appear at the bottom right to let you know that it worked.  
- This will fix the saturated colors.  
Note: Can also be toggled in the extra options menu.  

Changing the destination code of the rom header to 00 (JP) defaults this to ON and pressing SELECT turns it OFF.  
Use the BGB emulator to easily change the destination code and fix the header checksum (https://youtu.be/2AaCkM597iU).  

**Change the Audio Type**  
Updated Audio mixing has been ported over from Pokemon Yellow.  
Cycle through audio types on the extra options menu.  
You can cycle through mono sound and three types of stereo mixing.  

**60 FPS Mode**  
This feature is more of a proof-of-concept and is still kinda rusty.  
Toggle this on the extra options menu.  
Playing as a GBC game will take advantage of the GBC's double-speed processor mode.  

**Zero-Delay Text**  
This feature reinstitutes a speed-running trick that makes text print with zero frame delay.  
Toggle this on the extra options menu.  
Please note that other text speed selections do nothing while this feature is active.  


#Difficulty Settings
-----------------------------------------------
**Hard Mode**  
A NEW GAME now defaults to the SET battle style and hard mode in the options menu, except for the Lite patches.  
Toggle this on the extra options menu.  
Playing in hard mode imposes several changes to the game's systems that increase difficulty:  
1 - Enemy trainer pokemon are assigned level-appropriate StatEXP whereas they previously had none.  
2 - Enemy trainer pokemon have above-average DVs whereas they previously all had values of 8 or 9.  
3 - Stat boosts granted by badges are disabled during trainer battles.  
4 - X-stat items increase by two stages instead of one like in more recent generations.  
5 - Revive items can only be used outside of battle.  
6 - Wild Mewtwo uses trainer AI to choose its moves, and it also blocks you from using a Master Ball.  
7 - Non-link battles in hard mode use the Stadium 1 formulas for critical hit probability.  
8 - Wild pokemon DVs get 1 re-roll each if less than 4, biasing them upwards a little bit

**AI Trainer Switching**  
- Toggle this on the extra options menu.  
- This feature allows enemy trainers to switch somewhat intelligently.
- Note: If disabled, Jugglers are unaffected because their official gimmick is that they switch randomly.

**Obedience Level Cap**  
Not available in the Lite patches.  
There is now an obedience level cap that can be toggled in the extra options menu.  
While active, the current maximum obedience level will display in the extra options menu.  
All pokemon, not just trades, will start to disobey if over the displayed level cap.  
The cap will change based on which badge you have.  
This is intended as an alternative to, and not to be used with, the Scale Enemy Trainer Levels feature.  
It provides a different challenge where one is forced to keep a team within the game's level curve.  
Players should deactivate this feature for post-game adventuring past the level-cap.  

**Scale Enemy Trainer Levels**  
Not available in the Lite patches.  
Talk to the aide in the lower-right section of Oak's lab to toggle this feature.  
While active, enemy trainer roster levels will scale upwards relative to the highest-level pokemon in your party.  
Enemy pokemon will evolve by level if applicable (biased to higher levels).  
Gym leaders and the Elite-4 scale slightly higher than normal trainers.  
Warning - The difficulty will be compounded if both trainer scaling and hard mode are active.  


#Battle Modifiers
-----------------------------------------------
Note: These are not available in the Lite patches.    

**Wild & Starter Pokemon Randomization**  
The girl in Oak's lab toggles on/off a built-in randomizer for wild pokemon.  
It shuffles all pokemon that can be gained through walking, surfing, fishing, or from the game corner.  
If activated early enough in the game, your starter pokemon choices are randomized as well.  
Scripted events are unaffected (gifts, in-game trades, static encounters, etc).  
The game's five legendary pokemon are also excluded from randomization.  
A saved seed value is used, so the shuffled order is always preserved between play sessions.  
This lets the AREA feature of the pokedex automatically adjust for the new pokemon locations.  
And a new random seed is generated upon each new game.  
Talking to the girl in Oak's lab allows the player to generate a new randomization seed value.  
Shuffling is done using three internal pokemon lists defined by base-stat-total: A, B, and C tiers.  
Pokemon are only shuffled within their own tier list in order to maintain some modicum of balance.  
The girl will also ask if full randomization is preferred, which will combine the tiers into one big list.  

**Regular Trainer Randomization**  
One of Oak's Aides has been added to the Viridian Pokemon Center. Talk to him to toggle this feature.  
This randomizes the teams of regular no-name trainers that do not have roster customization.  
The randomization method is the same as for the previously mentioned wild pokemon.  

**Sleep, Freeze, and Item Clauses**  
The house to the lower-left of Viridian Gym is home to three new NPCs named the Clause Brothers.  
Each one toggles enforcement of either the item, sleep, or freeze clause from Pokemon Stadium.  
The sleep clause in particular works like it does in Stadium with respect to using the Rest move.  
The clauses apply to the player and AI equally, and they only apply during non-link trainer battles.  

**Trapping Move Clause**  
- A fourth brother has been added for this new clause.
  - A counter tracks if the player or the opponent use trapping moves like Wrap multiple times in a row. 
  - The counter increments only if a trapping effect move is selected to be used and it does not miss.
  - After the counter has incremented to 2, 
    - selecting a trapping effect move additional times will make the move to go 2nd in the round. 
	- this is the same priority as the move Counter.
  - The counter only gets reset by switching or using a move that does not have the trapping effect. 
  - Resetting the counter will restore normal priority to trapping effect moves.

**Hyper Beam Clause**  
- Added a fifth Clause Brother for the hyper beam clause.
- Hyper beam will recharge if it KOs the opponent.


#Button-Activated Features
-----------------------------------------------
Note: These are not available in the Lite patches.    

**Running Shoes**  
Hold the B button to move at double your normal speed.  
This also works when surfing or using your bike.  

**One-Button HM Usage**  
You must still have the correct badge and move on one of your pokemon to use a HM in this way.  
HM01 - Press SELECT when facing a shrub or grass tile to use CUT.  
HM03 - Press SELECT when facing a shore to use SURF.  
HM05 - Press SELECT in a dark area to light it with FLASH.  
HM04 - Press SELECT while facing a boulder to activate STRENGTH. Your pokemon's cry plays and the screen will flash.  

**Quick Fishing Button Combo**  
You must have a fishing rod in your bag.  
Face against a shore. You may have to bump against it a single time.  
Press and hold A. While doing that, press SELECT. You can now release the two buttons.  
This will prompt the game to choose the best rod in your bag and use it.  

**Quick Bike Button Combo**  
You must have the bicycle in your bag.  
You must not be facing a shore.  
Text for NPCs, signs, objects, etc, have priority, so do not face toward these things.  
Press and hold A. While doing that, press SELECT. You can now release the two buttons.  
This will tell the game to get on your bike. You can also get off your bike the same way.  

**Extra Bag Pocket**  
The bag now supports an additional item list for an extra 20 slots of space.  
Press START while in the bag menu to hot-swap the item list that populates the active bag.  
This also works in battle or when depositing items into the PC.  
In general, the non-active item list gets recognized by the game's systems.  
For example, you can enter the Cinnabar Gym even if the Secret Key is in the non-active bag space.  
For certain unique systems, like Pokemon Stadium compatibility, only the active bag list is detected.  

**Bag Auto-Sort**  
You can now automatically sort all the items in the active bag space or the PC item box.  
Hold SELECT and press START while on the bag or box menu to auto-sort your items.  

**Display Pokemon DVs**  
Determinant Values (DVs) are the predecessors to the Individual Values (IVs) used in Gen 3 and onwards.  
Unlike IVs, DV are on a scale from 0 to 15.  
On the pokemon menu, select a pokemon and place the cursor over STATS.  
While holding the START button, press the A button to enter the pokemon's status screen.  
In place of the pokemon's HP and stat values, it's corresponding DVs will be displayed instead.  

**Display Pokemon StatEXP**  
Stat Experience (StatEXP) is the predecessor to the Effort Values (EVs) used in Gen 3 and onwards.  
Unlike EVs, StatEXP values are on a scale from 0 to 65535 and there is no sum total limit between stats.  
At level 100, a pokemon gains extra points in a stat equal to 0.25 x SQRT(StatEXP) rounded down.  
On the pokemon menu, select a pokemon and place the cursor over STATS.  
While holding the SELECT button, press the A button to enter the pokemon's status screen.  
In place of the pokemon's HP and stat values, it's corresponding StatEXP values will be displayed instead.  

**Forfeit Trainer Battles**  
You can now forfeit a trainer battle to force yourself to black out.  
This can be useful for escaping in-battle softlock scenarios or creating variants of Nuzlocke rules.  
On the main battle menu, place the cursor over RUN.  
While holding the SELECT button, press the A button.  
You will be asked to confirm your decision. Choose YES to forfeit or NO to cancel.  

**View a Shiny Palette**  
This applies when playing or emulating as a Gameboy Color or Super Gameboy game.  
Choose a pokemon in the pokedex and place the cursor over DATA.  
While holding the SELECT button, press the A button to view it's pokedex entry.  
The pokedex entry will display the pokemon with its shiny palette swap.  

**Audio Cue for Owned Pokemon**  
On the main battle menu, place the cursor over an option in the left column (FIGHT or ITEM).  
Press the SELECT button.  
The active enemy pokemon will play its cry if that species is registered as Owned in your pokedex.  

**New Game Plus**  
Still somewhat experimental.  
Activated under these conditions:  
1 - Must have an existing non-corrupt game save on-file.  
2 - Must have beaten the Elite-4 in the on-file save.  
3 - Press and hold SELECT while choosing the NEW GAME option.  
4 - A jingle will play to indicate NG+ has activated and the SELECT button can now be released.  
Preserves ONLY the following information (your current party will be lost):  
- Boxed pokemon  
- Play clock  
- Pokedex seen/owned registry  
- Hall of Fame (experimental)  
- Option screen selections  
- Trainer ID (boxed pokemon won't count as traded)  
- Wild pokemon randomizer seed
The player can now choose whether or not to generate a new Trainer ID when selecting New Game Plus.  


#Gameplay-Related Features
-----------------------------------------------
Note: These are not available in the Lite patches.    

**Play as a Female Trainer**  
When choosing NEW GAME, you will be asked if you are a boy or a girl.  
Choose GIRL to play as the female trainer.  
Choose BOY to play as the usual male trainer.  

**Temporary Field Move Slots**  
When teaching a pokemon a field move outside of battle, such as with a HM, this feature becomes apparent.  
You will be asked if you would like to teach it as a temporary field move.  
If so, it will be learned into a special field move slot that is separate from the normal list of four moves.  
Such a temporary move cannot be used in battle, but it can be used in the overworld as normal.  
Each pokemon on your team can have one temporary field move at a time.  
Having one will display it on the status screen above the pokemon's other moves.  
A temporary field move cannot be overwritten with another field move.  
But it will be erased if its owning pokemon leaves the party (such as by being deposited in the PC).  
If all four of a pokemon's regular moves are field moves, its temporary field move cannot be menu-selected.  
But if a fifth field move in the temporary slot is a HM, it can still be activated via One-Button HM Usage.  
Teaching a TM as a field move will not consume the TM.  

**Rematch Enemy Trainers**  
The gym leaders and most trainers can be rematched.  
Simply talk to them once or twice. Select YES when prompted.  
If Giovanni has disappeared from his gym, exit and re-enter the gym to bring him back.  

**Reworked Fishing**  
- The locations of the Good Rod and the Super Rod have been swapped.  
- Route 12 has been altered to give access to its Fishing Guru without needing the Pokeflute.  
- All rods now randomly add 0 to 7 levels to anything it hooks.  
- The Old Rod can fish up two kinds of pokemon (depending on the current map).  
  - Magikarp or Goldeen
  - Magikarp or Poliwag 
- When using the Old Rod, press and hold B within about 1 second to always hook a magikarp.  
- The Good Rod can fish up three or four kinds of pokemon (depending on the current map).  
  - Poliwag, Horsea, Krabby
  - Poliwag, Krabby, Goldeen, Psyduck
  - Goldeen, Psyduck, Shellder
  - Goldeen, Shellder, Horsea, Tentacool
  
**Improved itemfinder function**  
- If an item is detected, it will play 1 to 3 chimes depending on how close it is (more chimes means closer to the item).
- Lines will point in the direction of the item and flash with the chimes.
- If the player is right on top of the item, no lines will show and the chime will play four times.
- If the SELECT button is held while selecting to USE the itemfinder, then the original itemfinder function is used.
	
**Reworked Daycare**  
The daycare lets you select moves to forget (if any) upon retreiving your pokemon.  
Retrieving a daycare pokemon that could have evolved via level will trigger evolution and learn any missed-out moves.  
The daycare experience gain has been recalibrated.  
It no longer gives 1 exp per step.  
Instead, it falsifies the act of farming wild encounters against a pokemon with a base exp value of 56.  
The falsified encounter starts at level 5, and it increases 5 more levels per badge obtained.  
With 8 badges, using the daycare is essentially a faster way of farming level 45 basic pokemon.  
The downside of not gaining statexp in the daycare still remains as a tradeoff.  
Consider using the daycare as a way to outsource some grinding while you go focus on other things.  
And yes, pokemon with HM moves are now allowed in the daycare.  

**The Shimmer**  
- This is a cheat feature for those who want more viability when using certain low-regarded pokemon.
  - Toggled ON/OFF via the glass pokeball decoration in the rival's house.
  - Pokemon Eligible: EKANS, CATERPIE, METAPOD, WEEDLE, KAKUNA, ZUBAT, PSYDUCK, PARAS, PONYTA, RATTATA, SANDSHREW, HORSEA, GOLDEEN, VENONAT, JIGGLYPUFF, ARBOK, BEEDRILL, BUTTERFREE, DITTO, FARFETCHD, GOLBAT, GOLDUCK, HITMONCHAN, LICKITUNG, ONIX, PARASECT, PINSIR, PORYGON, RAPIDASH, RATICATE, SANDSLASH, SEADRA, SEAKING, VENOMOTH, WIGGLYTUFF
  - The shimmer factor appears randomly and secretly, being more likely to occur by training and sending out eligible 'mons.
  - The shimmer only manifests in 'mons that are fully evolved, even if their pre-evos gained the secret shimmer factor.
  - When the shimmer manifests as a 'mon gets sent out, that 'mon gets a large boost to some stats that are low-to-poor.
  - There is a slight chance that the shimmer will manifest on applicable enemy trainer pokemon.
  - Certain select enemy trainers will always manifest the shimmer on their applicable pokemon.


#Trainer-Aiding Features
-----------------------------------------------
Note: These are not available in the Lite patches.    

**Caught Symbol and Gender Symbol**  
Talk to the aide in the lower-left section of Oak's lab to toggle this feature after obtaining the pokedex.  
While active, it has the following effects:  
1 - Wild pokemon have a gender symbol by their names if applicable.  
2 - If applicable, a gender symbol is added to a pokemon's status screen.  
3 - Enemy wild pokemon that have already been registered as Owned will display a pokeball symbol in battle.  
Gender is determined the same way as Gen 2 for the purposes of cross-generation transfers.  

**Move Deleter and Relearner**  
Two new NPCs are added to the Saffron City house below COPYCAT's house.  
Talk to the little girl to delete moves.  
Talk to her tutor to relearn moves for a small fee.  

**Coin Gentleman**  
There is a gentleman added to the Celadon Hotel as an alternative to playing the slots.  
He will give you free game corner coins if you show him the pokemon he requests.  
His request changes every time you enter the hotel, so make use of the hotel's PC to the right.  
Place his requested pokemon at the top of your team and speak to him to get your reward.  

**Catch-Up EXP Booster**  
Talk to the aide in the Celadon Diner to toggle this feature.  
While active, EXP gained is boosted if the active pokemon's level is lower than that of the fainted enemy.  
The boost is 1.5 multiplied by an additional 1.5 for every 3 levels of difference.  
For example, a level difference of 9 results in an EXP multiplier of (1.5)^4 = 5.0625.  
Use this feature to help you train-up new team members in the mid-to-late game.  

**Get a Free Paras**  
Go to the small house on Route 2 just below the exit of Diglett's Cave.  
The Aide NPC inside the house will now gift you a Paras.  
You can use this Paras if you ever find yourself without a pokemon that can learn Cut.  

**Drink Stand**  
A new drink stand has been set up on the Route 19 beach below Fuschia City.  
It sells vending machine drinks in multiples like a pokemart.  

**Cloning Genetically Modified Pokemon**  
This process clones your 1st spot pokemon and modifies it with DNA from your 2nd spot pokemon.  
It does this by treating a pokemon's two bytes of DV values as if they were two genes with two alleles each.  
Gene-A has the Attack DV as its hi-side allele and the Defense DV as its lo-side allele.  
Gene-B has the Speed DV as its hi-side allele and the Special DV as its lo-side allele.  
The A-genes from the two donor pokemon will be mixed to make the clone's A-gene.  
The B-genes from the two donor pokemon will be mixed to make the clone's B-gene.  
Mixing two genes is done via Punnett Squares, and a random result is chosen based on its ratios.  
Within a Punnett quadrant, a hi allele makes the upper digits and a lo allele makes the lower digits.  
If two hi allels or two lo alleles fall within a Punnet quadrant, their order is randomly selected.  

Example: Mixing gene hexadecimal values of $AB from one pokemon with $CD from another pokemon.  
One of the four quadrants will be randomly chosen as a new value containing two DVs.  
__ __ __ _C_ __ __ __ __ D  
__ xxxxxxxxxxxxxxxxxxxx  
A | AC or CA | __ _AD_ __ |  
__ xxxxxxxxxxxxxxxxxxxx  
B | __ _CB_ __ | BD or DB |  
__ xxxxxxxxxxxxxxxxxxxx  

Talk to the new scientist in the fossil room of the Cinnabar Lab to get started.  
For a small fee, a gene sequence listing the clone's new DV alleles in order is randomly determined.  
If the clone's genes are acceptable, you may pay a larger fee to gestate the clone.  
Pro-Tip: This makes it possible to selectively breed for shiny pokemon in a more realistic way.  

Example of selecting for a shiny pokemon:  
- A shiny pokemon in gen 2 has the 2-byte hex value of $XAAA for its DVs.
  - Wherein 'X' is the Attack DV composed of the 4 bits yy1y.
  - And 'y' bits are "don't care" values that can be either 0 or 1.
- The first goal is to get $AA as the value for the B-gene.
  - The minium requirement is to cross two pokemon that both have at least one $A in their B-genes.
  - This minimum requirement results in a 25% chance of getting a value of $AA. 
- The second goal is to get $A as the lo-side allele value for the A-gene.
  - The minium requirement is that one of the donor pokemon have at least one $A in its A-gene.
  - This minimum requirement has a 12.5% chance of fulfilling the goal if the donor $A is a hi-side allele.
  - Note: Said chance increases to 37.5% if the donor $A is a lo-side allele.
- The third goal is to get a 'X' value (previously described) as the hi-side allele value for the A-gene.
  - The minium requirement is that one of the donor pokemon have at least one 'X' in its A-gene.
  - This minimum requirement has a 12.5% chance of fulfilling the goal if the donor 'X' is a lo-side allele.
  - Note: Said chance increases to 37.5% if the donor 'X' is a hi-side allele.
- Assuming only the most minimal requirements are met, the chance of a shiny is [12.5% * 12.5% * 25%] = 1/256.
  - Keep in mind that the default chance of a shiny pokemon is 1/8192.
  - You can boost the chances higher by increasing the number of donor $A alleles and optimizing allele placement.
  - The chances of getting a shiny by crossing two shiny donors is 50%.
  

#Additions to the Post-Game
-----------------------------------------------
Note: These are not available in the Lite patches.    

**SS Anne Tournament**  
You can return to the SS Anne after beating the Elite-4. Find the Gym Guy hanging out in the kitchen.  
He is organizing a little tournament with the following rules:  
1 - Seven matches to win.  
2 - Must use a team of exactly three pokemon.  
3 - Your pokemon are healed after every match.  
4 - Enemy pokemon levels are based on the level of your strongest party pokemon.  
5 - You must have an open item slot to claim your prize.  
6 - Any trainer can appear with any three pokemon (excluding mew and mewtwo).  
7 - No breaks allowed in-between battles.  
Winning the tournament rewards you with a Master Ball.  

**Rare Item Shop**  
The 3rd floor of the Celadon Dept. Store has a shop open up after beating the Elite-4.  
It sells things like Fossils, Rare Candy, and Moon Stones.  

**Uncapped Vitamins**  
After beating the Elite-4, vitamins have no limit placed upon them when used on pokemon of level > 30.  

**Selling Pokemon**  
Find the house with the game corner CHIEF in Celadon City.  
Talk to him after beating the Elite-4 to find he's in some dire straights.  
He will offer to buy the pokemon in your team's first slot from you.  

**Bulk Coin Seller**  
One of the Rocket grunts walking around Celadon City will now sell you 1000 coins at a time.  

**Special Safari Event**  
A new NPC can be utilized in the Safari Zone Gate after beating the Elite-4.  
Talk to him to toggle special parameters that have the following effects on the Safari Zone:  
1 - All pokemon encountered will have above-average DVs.  
2 - There is a rare chance for any non-legendary pokemon to appear.  

**Random Battle Generator and the M.GENE**  
There is a sketchy guy added to the west-east underground path.  
After the Elite-4 are beaten, he will offer to engage you in randomized battles.  
Win 5 matches in a row against him without leaving the area to get the new M.GENE item.  
The M.Gene can be used on a pokemon out of battle in order to re-randomize its DVs with above-average values.  

**Mirror Match Battle Generator**  
Pagliacco, A pokemaniac with a flair for theatrics, has been added to the north-south underground path.  
After the Elite-4 are beaten, he will offer to engage you in a mirror match against your own party.  

**Special Trainer Battles**  
There are four special trainers to find and defeat after beating the Elite-4.  
Talk to Oak at his lab to start a chain of hints for finding the four trainers.  

**The Secret of the MIST STONE**  
The MIST STONE will max-out all the stat exp of the lvl > 30 pokemon on which it is used.  
If all the stat exp is already at max, then it will set all the DVs to maximum instead.  
But this assumes you are able to find the secret room for obtaining it.  


#Pro-Tips
-----------------------------------------------
Note: These are not applicable to the Lite patches, except for increased trainer aggression. Really...buy healing items.  

**Gift, Prize, and Trade Pokemon**  
Pokemon that are given to you by NPCs have above-average DVs.  
This applies whether it is a gift, in-game trade, or a purchase.  
This means that prize pokemon from the game corner will always have good stats.  
And buying a magikarp from a shady figure might not be such a bad investment.  

**Use Those TMs**  
Though still single-use, all TMs can be repurchased from pokemarts around the region.  
So don't be shy about using TMs acquired from NPCs and exploration.  

**Stock-Up on Items**  
Enemy trainers are more aggressive about attacking, so your team incurs more damage over time.  
Be sure to purchase a reasonable stock of healing items to counter the increased attrition.  

**Big EXP Gains**  
The Catch-Up Booster bonus compounds with other 1.5x EXP bonuses in the game.  
With this is in mind, activate level-scaling and do trainer rematches with a traded pokemon to gain loads of EXP.  

**Training in Post-Game Without Battling**  
Here is an alternative to grinding out battles in the post-game.  
1 - Catch some pokemon.  
2 - Sell them to the game corner chief.  
3 - Buy rare candies and vitamins with the proceeds.  
4 - Take note that vitamins are uncapped in the post-game for 'mons with lvl > 30.  
5 - Use your purchases to train your roster pokemon without battling.  

**Secret Hints**  
1 - Try winning the SS Anne tournament with a Pikachu in your party.  
2 - Want your 1st-roster-slot Dragonite to be able to learn Fly? Maybe Lance can help you.  
3 - The fourth special trainer hints at the method to find Mew. But Mew only appears once.  
4 - There is a fifth special trainer outside Bill's house. Victory respawns the legendaries, Mew, and mist stone.  
5 - The Vermilion Dock has three hidden items.  
6 - Fish in the lowest level of Cerulean Cave for something strange.  
7 - Place a level 100 Chansey at the top of your party and use a repel. You're bound to find something shiny.  
8 - When going to the game corner, try having your 1st-slot pokemon know Pay Day. It may tip you off.  
9 - After getting your 'dex diploma, Missingno can be activated on either Seafoam or Cinnabar. Prepare your sixth item slot for victory. Beating the seafoam Missingo battle will add an achievement to your diploma.  
10 - Mercy is granted if you encounter an enemy trainer with a shiny pokemon.  
11 - Put Mewtwo at the top of your party in the post-game. How will Mr. Fuji react?  
12 - Bill's secret garden? He'll never tell! Could showing him a new species pokemon persuade him?  
13 - Search all over the Kanto overworld to find a secret cave room, or else you'll never get a mist stone.   

**Gameshark Codes**  
Here are some freshly-baked cheat codes unique to Shin Pokemon.  
  - 010042DA: If your play-clock was maxed at 255 from a previous save file, this will unlock the expanded game clock.  
  - 0180C4CF: The next encounter will be a shiny pokemon.
  - 01xx21D7: Resets the options and changes the player graphics to male (xx=00) or female (xx=01).


#Built-In Nuzlocke Mode
-----------------------------------------------
Note: Not available in the Lite patches.    

- Toggle this mode in the extra options menu.  
  
- Default Options
  - Some options are automatically changed when nuzlocke mode is turned on.
  - The battle style will change to SET and hard mode with trainer switching.
  - Also, the Obedience Level Cap will be activated if the Scale Enemy Trainer Levels feature is inactive.
  - These are not mandatory changes, and you may reconfigure your options as you wish.
  
- Rule 1: A pokemon that faints is considered dead and can no longer be used.
  - Revival items cannot be used in battle.
  - If a battle ends with no forfeiture, all pokemon with 0 HP are marked dead.
  - If a battle ends in a forfeit, all pokemon with 0 HP before the forfeit are marked dead.
  - Pokemon marked as dead have $05 written to their catch rate to permanently mark them.
  - Even if they are traded back and forth, dead pokemon remain marked as dead while in nuzlocke mode.
  - Medicinal items will not work on pokemon marked as dead, nor will Soft-boiled.
  - Party healing (Mom, Pokemon Center, blacking out, etc) makes a dead pokemon effectively useless.
  - To clarify, it gives a dead pokemon 1 HP, the FRZ status, and 0 PP for all moves.
  - This allows a player to continue the game with boxed pokemon in case of a total party loss.
  - Dead pokemon transferred to Gen-2 games will be holding a pokeball.

- Rule 2: You can only catch the 1st wild pokemon that you encounter in an area.
  - An "area" is defined by the name displayed on the town map.
  - You will be unable to throw balls in subsequent wild battles in that area.
  - Static wild battles count for this as well.
  - Wild battles before you can get pokeballs also count.
  - In light of this, you may want to delay activating nuzlocke mode until pokeballs are available.
  - Story wild battles (Old Man tutorial, Ghost Marowak, and Tower Ghosts) do not apply.
  - Pokemon gained outside of battle (gifts, prizes, in-game trades, etc) do not apply.
  
- Rule 3 (Optional): Nickname every pokemon you obtain.
  - You will always go straight to the nickname screen without a Yes/No prompt.
  - You can still opt out of a nickname by leaving the entry field blank.
  
- Built-in exceptions:
  - Shiny Clause: Nothing prevents you from throwing balls to catch a wild shiny pokemon.
  - Duplication Clause: Encountering a wild "owned" pokemon will not activate Rule 2.
  - Rule 2 resets for the Safari Zone area upon paying the entrance fee.
  - Catching a pokemon, even if owned, always activates Rule 2. Important for the Safari Zone and New Game+.
  - Dead pokemon can still use field moves (HM moves, Teleport, etc).

- Visual Aides:
  - An Up-Down-Arrow symbol will display on the HUD of a wild pokemon if a ball is allowed to be tossed.
  - This symbol follows Rule 2 and any built-in exceptions previously described.

- Nuzlocke and the Safari Zone:
  - The Safari Zone is not inherently limited to a single catch opportunity in nuzlocke mode.
  - Entering the Safari Zone gives the player an opportunity to catch 1 pokemon per visit.
  - This opportunity presents itself again each time the player pays the entry fee.

- Nuzlocke and New Game+:
  - New Game+ preserves the pokedex.
  - This means the Duplication Clause will prevent Rule 2 from activating.
  - In light of this, Rule 2 will always activate on an area upon the first catch made there.
  
- Dead pokemon and toggling Nuzlocke mode:
  - It is possible to cheat by turning off nuzlocke mode, healing a dead pokemon, then turning it back on.
  - If this is done, the healed pokemon is still considered dead.
  - This means that party-wide healing will make it useless and medicine still has no effect.
  - This has the potential for a kind of "undead run" rule variant.
 
- Removing the death marker:
  - The only way to undo this is by modifying the dead pokemon's catch rate.
  - This is usually done via the Gen-2 time capsule and trading it back without a hold item or a different hold item.
