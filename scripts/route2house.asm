;joenote - allow for getting a free paras so as not to be blocked from having a pokemon that can learn CUT
Route2HouseScript:
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	jp EnableAutoTextBoxDrawing

Route2HouseTextPointers:
	dw Route2HouseText1
	dw Route2HouseText2
	dw Route2HouseText3

Route2HouseText1:
	TX_ASM
	ld hl, Route2HouseText1_cont
	ld a, [wRoute2HouseCurScript]
	and a
	jr nz, .end
	
	ld hl, Route2HouseText3
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .end2
	
	lb bc, PARAS, 5
	call GivePokemon
	jr nc, .end2
	
	ld a, 1
	ld [wRoute2HouseCurScript], a
	jr .end2
	
.end
	call PrintText
.end2
	jp TextScriptEnd

Route2HouseText2:
	TX_ASM
	ld a, $1
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

Route2HouseText3:
	TX_FAR _Route2HouseText3
	db "@"

Route2HouseText1_cont:
	TX_FAR _Route2HouseText1
	db "@"