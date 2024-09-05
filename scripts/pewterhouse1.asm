PewterHouse1Script:
	jp EnableAutoTextBoxDrawing

PewterHouse1TextPointers:
	dw PewterHouse1Text1
	dw PewterHouse1Text2
	dw PewterHouse1Text3

PewterHouse1Text1:
	TX_FAR _PewterHouse1Text1
	TX_ASM
IF DEF(_GREEN)
	ld a, NIDORAN_F	;joenote - this cry is female in the original green version
ELSE
	ld a, NIDORAN_M
ENDC
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

PewterHouse1Text2:
	TX_FAR _PewterHouse1Text2
	db "@"

PewterHouse1Text3:
	TX_FAR _PewterHouse1Text3
	db "@"
