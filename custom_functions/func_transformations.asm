;joenote - Custom functions to handle experiments concerning special battle stat transformations
	

	
;This feature, called "the shimmer", is an exercise is showing how to do special states, forms, abilities, or transformations.
;Certain non-wild pokemon are able to gain the shimmer factor, with a 1-in-256 chance, when sent out to battle.
;Once the shimmer factor is attained, being a catch rate value of $6D, the final evo of the 'mon will manifest it.
;A 'mon with the shimmer will have any ATK/DEF/SPD/SPEC increased by its level value if (3/8)*stat is < level.
;It's a little cheat system for players who want some viability when playing the story using 'mons that are lambasted.
	
ShimmerTransformationPlayer:
	ld hl, wBattleMon
	ld de, wPartyMon1CatchRate
	jr ShimmerTransformationCommon
ShimmerTransformationEnemy:
	ld a, [wIsInBattle]
	dec a
	jr z, ShimmerTransformationCommon.return	;do not activate for a wild pokemon
	ld hl, wEnemyMon
	ld de, wEnemyMon1CatchRate
	;fall through
ShimmerTransformationCommon:
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr z, .return	;if link battle, then don't do anything
	
	CheckEvent EVENT_8C7	;event flag for this feature to run
	jr z, .return
	
	call CanGetShimmer
	jr nz, .return

	push hl
	call CheckForShimmerVal
	pop hl
	
	push hl
	call nz, WillGetShimmerVal
	pop hl
	
	call z, CanManifestShimmer
	call z, DoShimmerTransformation
	
.return
	call GetPredefRegisters
	ret

	
;determine if a pokemon is eligible for manifesting the shimmer factor
;sets z flag if true
;HL = active enemy or player mon battle struct
;uses BC
CanManifestShimmer: 
	ld bc, ShimmerFactorManifestPokemon
	jr CanGetShimmer.loop
	
;determine if a pokemon is eligible for ever getting the shimmer factor
;sets z flag if true
;HL = active enemy or player mon battle struct
;uses BC
CanGetShimmer: 
	ld bc, ShimmerFactorPokemon
.loop
	ld a, [bc]
	and a
	jr z, .notfound		;jump if end of list is reached
	cp [hl]	;hl is currently pointing to species byte
	ret z	;return with set z flag if found on list
	inc bc
	jr .loop
.notfound
	dec a	;clear z flag and return if not found in list
	ret


;check if a pokemon has the latent shimmer factor in its data struct
;Look for $6D in its catch rate - corresponds to holding a Miracleberry when sent to gen-2 games
;HL = active enemy or player mon battle struct
;uses BC
;sets z flag if true
CheckForShimmerVal:
	jr .checkForBoss
.back
	ld bc, (wBattleMonCatchRate - wBattleMon)
	add hl, bc
	ld a, [hl]
	cp $6D
	ret
.checkForBoss
;if wGymLeaderNo = 8 or more (for the purposes of battle music), always make the AI trainer have shimmer if applicable
	ld a, [wGymLeaderNo]
	cp 8
	jr c, .back
	;check to make sure this is the enemy
	ld bc, wEnemyMon
	ld a, b
	sub h
	add c
	sub l
	jr nz, .back
	ret

;Called if the eligible pokemon does not have the latent shimmer factor in its data struct
;This gives a chance to spontaneously modify its data to have the latent shimmer factor
;HL = active enemy or player mon battle struct
;DE = enemy or player party mon 1 catch rate
;uses BC
;sets z flag if 6D is written to the catch rate
;chance of this happening is 1-in-256 each time the pokemon becomes the active combatant
;This chance increases by +(1-in-256) per 2048 HP stat experience
WillGetShimmerVal:
	call Random
.gotnum	
	cp $6D
	jr nz, WillGetShimmerVal_tryagain
	push af
	ld bc, (wBattleMonCatchRate - wBattleMon)
	add hl, bc
	ld [hl], a
	
	ld h, d
	ld l, e
	ld bc, (wPartyMon2 - wPartyMon1)
	ld a, [wWhichPokemon]
.loop
	and a
	jr z, .next
	dec a
	add hl, bc
	jr .loop
.next
	
	pop af
	ld [hl], a
	ret

WillGetShimmerVal_tryagain:
	push hl
	push af
	
	ld h, d
	ld l, e
	ld bc, (wPartyMon2 - wPartyMon1)
	ld a, [wWhichPokemon]
.loop
	and a
	jr z, .next
	dec a
	add hl, bc
	jr .loop
.next
	;HL currently points to enemy or player party catch rate
	ld bc, (wPartyMon1HPExp - wPartyMon1CatchRate)
	add hl, bc	
	;HL now points to enemy or player party HP EXP high byte
	ld a, [hl]	;get the high byte
	ld b, a
	srl b
	srl b
	srl b
		
	pop af
	pop hl
	cp b
	jr nc, .fail 
	ld a, $6D
	jr WillGetShimmerVal.gotnum
.fail
	ld a, 1
	and a
	ret

	
DoShimmerTransformation:
	push hl
	ld bc, (wBattleMonLevel - wBattleMon)
	add hl, bc
	ld a, [hl]
	pop hl
	push af
	ld bc, (wBattleMonAttack - wBattleMon)
	add hl, bc
	pop af
	ld b, a
	
	;boost attack
	call .getThreeEiths
	cp b
	call c, .addLevel
	inc hl
	inc hl
	;boost defense
	call .getThreeEiths
	cp b
	call c, .addLevel
	inc hl
	inc hl
	;boost speed
	call .getThreeEiths
	cp b
	call c, .addLevel
	inc hl
	inc hl
	;boost special
	call .getThreeEiths
	cp b
	call c, .addLevel
	inc hl
	inc hl

	ld hl, _TXTShimmerSendOut
	call PrintText
	ret 

.getThreeEiths
	ld a, [hli]
	ld d, a
	ld a, [hld]
	ld e, a
	srl d
	rr e
	srl d
	rr e
	srl d
	rr e
	xor a
	add e
	add e
	add e
	ret
.addLevel
	ld a, [hli]
	ld d, a
	ld a, [hld]
	ld e, a
	push hl
	ld h, 0
	ld l, b
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld a, d
	ld [hli], a
	ld a, e
	ld [hld], a
	ret

	
_TXTShimmerSendOut:
	text "A ray shimmers."
	prompt
	db "@"
	
ShimmerFactorPokemon:
	db EKANS
	db CATERPIE
	db METAPOD
	db WEEDLE
	db KAKUNA
	db ZUBAT
	db PSYDUCK
	db PARAS
	db PONYTA
	db RATTATA
	db SANDSHREW
	db HORSEA
	db GOLDEEN
	db VENONAT
	db JIGGLYPUFF
	;fallthrough
ShimmerFactorManifestPokemon:
	db ARBOK        ; $2D
	db BEEDRILL     ; $72
	db BUTTERFREE   ; $7D
	db DITTO        ; $4C
	db FARFETCHD    ; $40
	db GOLBAT       ; $82
	db GOLDUCK      ; $80
	db HITMONCHAN   ; $2C
	db LICKITUNG    ; $0B
	db ONIX         ; $22
	db PARASECT     ; $2E
	db PINSIR       ; $1D
	db PORYGON      ; $AA
	db RAPIDASH     ; $A4
	db RATICATE     ; $A6
	db SANDSLASH    ; $61
	db SEADRA       ; $5D
	db SEAKING      ; $9E
	db VENOMOTH     ; $77
	db WIGGLYTUFF   ; $65
	db $00
