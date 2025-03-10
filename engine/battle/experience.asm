GainExperience:
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z ; return if link battle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;joenote - set exp all bit for messaging
	ld a, [wBoostExpByExpAll]
	and a
	jr z, .skipexpallmsg
	ld a, [wd728]
	set 7, a
	ld [wd728], a	
.skipexpallmsg
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	call DivideExpDataByNumMonsGainingExp
	ld hl, wPartyMon1
	xor a
	ld [wWhichPokemon], a
.partyMonLoop ; loop over each mon and add gained exp
	inc hl
	ld a, [hli]
	or [hl] ; is mon's HP 0?
	jp z, .nextMon ; if so, go to next mon
	push hl
	ld hl, wPartyGainExpFlags
	ld a, [wWhichPokemon]
	ld c, a
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a ; is mon's gain exp flag set?
	pop hl
	jp z, .nextMon ; if mon's gain exp flag not set, go to next mon
	ld de, (wPartyMon1HPExp + 1) - (wPartyMon1HP + 1)
	add hl, de
	ld d, h
	ld e, l
	ld hl, wEnemyMonBaseStats
	ld c, NUM_STATS
.gainStatExpLoop
	ld a, [hli]
	ld b, a ; enemy mon base stat
	ld a, [de] ; stat exp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - bonus statexp
	;if enemy level > level cap, give 255 stat exp instead of enemy mon's base stat
	push af
	ld a, [wEnemyMonLevel]
	cp MAX_LEVEL
	jr c, .nobonus1
	jr z, .nobonus1
	ld b, $FF
.nobonus1
	pop af
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	add b ; add enemy mon base stat to stat exp
	ld [de], a
	jr nc, .nextBaseStat
; if there was a carry, increment the upper byte
	dec de
	ld a, [de]
	inc a
	jr z, .maxStatExp ; jump if the value overflowed
	ld [de], a
	inc de
	jr .nextBaseStat
.maxStatExp ; if the upper byte also overflowed, then we have hit the max stat exp
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a
.nextBaseStat
	dec c
	jr z, .statExpDone
	inc de
	inc de
	jr .gainStatExpLoop
.statExpDone
	xor a
	ld [H_MULTIPLICAND], a
	ld [H_MULTIPLICAND + 1], a
	ld a, [wEnemyMonBaseExp]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - bonus exp
	;if enemy level > level cap, it has a base exp yield of 255
	push bc
	ld c, a
	ld a, [wEnemyMonLevel]
	cp MAX_LEVEL
	ld a, c
	pop bc
	jr c, .nobonus3
	jr z, .nobonus3
	ld a, $FF
.nobonus3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ld [H_MULTIPLICAND + 2], a
	ld a, [wEnemyMonLevel]
	ld [H_MULTIPLIER], a
	call Multiply
	ld a, 7
	ld [H_DIVISOR], a
	ld b, 4
	call Divide
	ld hl, wPartyMon1OTID - (wPartyMon1DVs - 1)
	add hl, de
	ld b, [hl] ; party mon OTID
	inc hl
	ld a, [wPlayerID]
	cp b
	jr nz, .tradedMon
	ld b, [hl]
	ld a, [wPlayerID + 1]
	cp b
	ld a, 0
	jr z, .next
.tradedMon
	call BoostExp ; traded mon exp boost
	ld a, 1
.next
	ld [wGainBoostedExp], a
	ld a, [wIsInBattle]
	dec a ; is it a trainer battle?
	jr z, .nottrainerbattle
	call BoostExp ; if so, boost exp
;joenote - boost exp again in trainer battles if in hard mode
;	ld a, [wOptions]
;	bit BIT_BATTLE_HARD, a
;	call nz, BoostExp
.nottrainerbattle
	call CatchUpBoost	;joenote - boost exp if underlevelled
	inc hl
	inc hl
	inc hl
; add the gained exp to the party mon's exp
	ld b, [hl]
	ld a, [H_QUOTIENT + 3]
	ld [wExpAmountGained + 1], a
	add b
	ld [hld], a
	ld b, [hl]
	ld a, [H_QUOTIENT + 2]
	ld [wExpAmountGained], a
	adc b
	ld [hl], a
	jr nc, .noCarry
	dec hl
	inc [hl]
	inc hl
.noCarry
; calculate exp for the mon at max level, and cap the exp at that value
	inc hl
	push hl
	ld a, [wWhichPokemon]
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl] ; species
	ld [wd0b5], a
	call GetMonHeader
	ld d, MAX_LEVEL
	callab CalcExperience ; get max exp
; compare max exp with current exp
	ld a, [hExperience]
	ld b, a
	ld a, [hExperience + 1]
	ld c, a
	ld a, [hExperience + 2]
	ld d, a
	pop hl
	ld a, [hld]
	sub d
	ld a, [hld]
	sbc c
	ld a, [hl]
	sbc b
	jr c, .next2
; the mon's exp is greater than the max exp, so overwrite it with the max exp
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hld], a
	dec hl
.next2
	push hl
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, GainedText
;joenote - changing exp.all text
	ld a, [wBoostExpByExpAll]
	and a
	jr z, .noexpall
	ld a, [wd728]
	bit 7, a
	jr z, .noexpprint	;print the exp.all amount only once (for the first party member)
	res 7, a
	ld [wd728], a
	ld hl, WithExpAllText
.noexpall
	call PrintText
.noexpprint
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
IF DEF(_EXPBAR)
	callba AnimateEXPBar	;joenote - animate the exp bar
ENDC
	call LoadMonData
	pop hl
	ld bc, wPartyMon1Level - wPartyMon1Exp
	add hl, bc
	push hl
	callba CalcLevelFromExperience
	pop hl
	ld a, [hl] ; current level
	ld [wTempCoins1], a	;joenote - fixing skip move-learn glitch: need to store the current level in wram
	;wTempCoins1 was chosen because it's used only for slot machine and gets defaulted to 1 during the mini-game
	cp d
	jp z, .nextMon ; if level didn't change, go to next mon
IF DEF(_EXPBAR)
	push hl
	callba KeepEXPBarFull	;joenote - animate the exp bar
	pop hl
ENDC
	ld a, [wCurEnemyLVL]
	push af
	push hl
	ld a, d
	ld [wCurEnemyLVL], a
	ld [hl], a
	ld bc, wPartyMon1Species - wPartyMon1Level
	add hl, bc
	ld a, [hl] ; species
	ld [wd0b5], a
	ld [wd11e], a
	call GetMonHeader
	ld bc, (wPartyMon1MaxHP + 1) - wPartyMon1Species
	add hl, bc
	push hl
	ld a, [hld]
	ld c, a
	ld b, [hl]
	push bc ; push max HP (from before levelling up)
	ld d, h
	ld e, l
	ld bc, (wPartyMon1HPExp - 1) - wPartyMon1MaxHP
	add hl, bc
	ld b, $1 ; consider stat exp when calculating stats
	call CalcStats
	pop bc ; pop max HP (from before levelling up)
	pop hl
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a ; bc = difference between old max HP and new max HP after levelling
	ld de, (wPartyMon1HP + 1) - wPartyMon1MaxHP
	add hl, de
; add to the current HP the amount of max HP gained when levelling
	ld a, [hl] ; wPartyMon1HP + 1
	add c
	ld [hld], a
	ld a, [hl] ; wPartyMon1HP + 1
	adc b
	ld [hl], a ; wPartyMon1HP
	ld a, [wPlayerMonNumber]
	ld b, a
	ld a, [wWhichPokemon]
	cp b ; is the current mon in battle?
	jr nz, .printGrewLevelText
; current mon is in battle
	ld de, wBattleMonHP
; copy party mon HP to battle mon HP
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
; copy other stats from party mon to battle mon
	ld bc, wPartyMon1Level - (wPartyMon1HP + 1)
	add hl, bc
	push hl
	ld de, wBattleMonLevel
	ld bc, 1 + NUM_STATS * 2 ; size of stats
	call CopyData
	pop hl
	ld a, [wPlayerBattleStatus3]
	bit 3, a ; is the mon transformed?
	jr nz, .recalcStatChanges
; the mon is not transformed, so update the unmodified stats
	ld de, wPlayerMonUnmodifiedLevel
	ld bc, 1 + NUM_STATS * 2
	call CopyData
.recalcStatChanges
	xor a ; battle mon
	ld [wCalculateWhoseStats], a
	callab CalculateModifiedStats
	callab ApplyBurnAndParalysisPenaltiesToPlayer
	callab ApplyBadgeStatBoosts
	callab DrawPlayerHUDAndHPBar
	callab PrintEmptyString
	call SaveScreenTilesToBuffer1
.printGrewLevelText
	ld hl, GrewLevelText
	call PrintText
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
IF DEF(_EXPBAR)
	callba AnimateEXPBarAgain	;joenote - animate exp bar
ENDC
	call LoadMonData
	ld d, $1
	callab PrintStatsBox
	call WaitForTextScrollButtonPress
	call LoadScreenTilesFromBuffer1
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	ld a, [wd0b5]
	ld [wd11e], a
	;;;;;;;;;;;;;;;;;;;;
	;joenote - fixing skip move-learn glitch: here is where moves are learned from level-up, but it needs some changes
	ld a, [wCurEnemyLVL]	; load the level to advance to into a. this starts out as the final level.
	ld c, a	; load the final level to grow to over to c
	ld a, [wTempCoins1]	; load the current level into a
	ld b, a	; load the current level over to b
.inc_level	; marker for looping back 
	inc b	;increment 	the current level
	ld a, b	;put the current level in a
	ld [wCurEnemyLVL], a	;and reset the level to advance to as merely 1 higher
	push bc	;save b & c on the stack as they hold the current a true final level
	predef LearnMoveFromLevelUp
	pop bc	;get the current and final level values back from the stack
	ld a, b	;load the current level into a
	cp c	;compare it with the final level
	jr nz, .inc_level	;loop back again if final level has not been reached
	;;;;;;;;;;;;;;;;;;;;
	ld hl, wCanEvolveFlags
	ld a, [wWhichPokemon]
	ld c, a
	ld b, FLAG_SET
	predef FlagActionPredef
	pop hl
	pop af
	ld [wCurEnemyLVL], a

.nextMon
	ld a, [wPartyCount]
	ld b, a
	ld a, [wWhichPokemon]
	inc a
	cp b
	jr z, .done
	ld [wWhichPokemon], a
	ld bc, wPartyMon2 - wPartyMon1
	ld hl, wPartyMon1
	call AddNTimes
	jp .partyMonLoop
.done
	ld hl, wPartyGainExpFlags
	xor a
	ld [hl], a ; clear gain exp flags
	ld a, [wPlayerMonNumber]
	ld c, a
	ld b, FLAG_SET
	push bc
	predef FlagActionPredef ; set the gain exp flag for the mon that is currently out
	ld hl, wPartyFoughtCurrentEnemyFlags
	xor a
	ld [hl], a
	pop bc
	predef_jump FlagActionPredef ; set the fought current enemy flag for the mon that is currently out

; divide enemy base stats, catch rate, and base exp by the number of mons gaining exp
DivideExpDataByNumMonsGainingExp:
	ld a, [wPartyGainExpFlags]
	ld b, a
	xor a
	ld c, $8
	ld d, $0
.countSetBitsLoop ; loop to count set bits in wPartyGainExpFlags
	xor a
	srl b
	adc d
	ld d, a
	dec c
	jr nz, .countSetBitsLoop
	cp $2
	ld [wUnusedD155], a	;joenote - make a backup of number of mons gaining exp
	ret c ; return if only one mon is gaining exp
	ld [wd11e], a ; store number of mons gaining exp
	ld hl, wEnemyMonBaseStats
	ld c, wEnemyMonBaseExp + 1 - wEnemyMonBaseStats
.divideLoop
	xor a
	ld [H_DIVIDEND], a
	ld a, [hl]
	ld [H_DIVIDEND + 1], a
	ld a, [wd11e]
	ld [H_DIVISOR], a
	ld b, $2
	call Divide ; divide value by number of mons gaining exp
	ld a, [H_QUOTIENT + 3]
	ld [hli], a
	dec c
	jr nz, .divideLoop
	ret

; multiplies exp by 1.5
BoostExp:
	ld a, [H_QUOTIENT + 2]
	ld b, a
	ld a, [H_QUOTIENT + 3]
	ld c, a
	srl b
	rr c
	add c
	ld [H_QUOTIENT + 3], a
	ld a, [H_QUOTIENT + 2]
	adc b
	ld [H_QUOTIENT + 2], a
	jr c, .overflow
	ret
.overflow	;joenote - add overflow protection
	ld a, $FF
	ld [H_QUOTIENT + 2], a
	ld [H_QUOTIENT + 3], a
	ret
	
CatchUpBoost:	;joenote - boost exp if underlevelled
	CheckEvent EVENT_8D9
	ret z
	ld a, [wBattleMonLevel]
	ld b, a
	ld a, [wEnemyMonLevel]	
	sub b
	ret z	;return if enemy lvl = player level
	ret c	;return if enemy lvl < player level
.loop
	;A is currently wEnemyMonLevel - wBattleMonLevel > 0
	push af
	call BoostExp
	pop af
	sub 3	;additional boost every 3 levels of difference
	jr nc, .loop	;keep boosting until A underflows
	ret

GainedText:
	TX_FAR _GainedText
	TX_ASM
;joenote - changing exp.all text
;	ld a, [wBoostExpByExpAll]
;	ld hl, WithExpAllText
;	and a
;	ret nz
	ld hl, ExpPointsText
	ld a, [wGainBoostedExp]
	and a
	ret z
	ld hl, BoostedText
	ret

WithExpAllText:
	TX_FAR _WithExpAllText
	TX_ASM
	ld hl, ExpPointsText
	ret

BoostedText:
	TX_FAR _BoostedText

ExpPointsText:
	TX_FAR _ExpPointsText
	db "@"

GrewLevelText:
	TX_FAR _GrewLevelText
	TX_SFX_LEVEL_UP
	db "@"
