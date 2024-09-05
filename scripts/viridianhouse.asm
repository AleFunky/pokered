ViridianHouseScript:
	jp EnableAutoTextBoxDrawing

ViridianHouseTextPointers:
	dw ViridianHouseText1
	dw ViridianHouseText2
	dw ViridianHouseText3
	dw ViridianHouseText4
	dw ClauseBrother_Item
	dw ClauseBrother_Sleep
	dw ClauseBrother_Freeze
	dw ClauseBrother_Trap
	dw ClauseBrother_Hyperbeam

ViridianHouseText1:
	TX_FAR _ViridianHouseText1
	db "@"

ViridianHouseText2:
	TX_FAR _ViridianHouseText2
	db "@"

ViridianHouseText3:
	TX_ASM
	ld hl, ViridianHouseText_1d5b1
	call PrintText
	ld a, SPEAROW
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

ViridianHouseText_1d5b1:
	TX_FAR _ViridianHouseText_1d5b1
	db "@"

ViridianHouseText4:
	TX_FAR _ViridianHouseText4
	db "@"

;joenote - adding Clause Brothers
ClauseBrother_Item:
	TX_ASM
	ld hl, ClauseBrother_ItemIntro
	call PrintText

	CheckEvent EVENT_8DB
	jr z, .ask_turn_on
	
	ld hl, ClauseBrother_OFF
	call PrintText
	call .choose
	ld hl, ClauseBrother_REJECT
	jr z, .end
	ResetEvent EVENT_8DB
	jr .print_done

.ask_turn_on
	ld hl, ClauseBrother_ItemDesc
	call PrintText
	call .choose
	ld hl, ClauseBrother_REJECT
	jr z, .end
	SetEvent EVENT_8DB
	
.print_done
	ld hl, ClauseBrother_DONE
.end
	call PrintText
	jp TextScriptEnd
.choose
	call NoYesChoice
	ld a, [wCurrentMenuItem]
	and a
	ret

ClauseBrother_Sleep:
	TX_ASM
	ld hl, ClauseBrother_SleepIntro
	call PrintText

	CheckEvent EVENT_8DC
	jr z, .ask_turn_on
	
	ld hl, ClauseBrother_OFF
	call PrintText
	call .choose
	ld hl, ClauseBrother_REJECT
	jr z, .end
	ResetEvent EVENT_8DC
	jr .print_done

.ask_turn_on
	ld hl, ClauseBrother_SleepDesc
	call PrintText
	call .choose
	ld hl, ClauseBrother_REJECT
	jr z, .end
	SetEvent EVENT_8DC
	
.print_done
	ld hl, ClauseBrother_DONE
.end
	call PrintText
	jp TextScriptEnd
.choose
	call NoYesChoice
	ld a, [wCurrentMenuItem]
	and a
	ret
	
ClauseBrother_Freeze:
	TX_ASM
	ld hl, ClauseBrother_FreezeIntro
	call PrintText

	CheckEvent EVENT_8DD
	jr z, .ask_turn_on
	
	ld hl, ClauseBrother_OFF
	call PrintText
	call .choose
	ld hl, ClauseBrother_REJECT
	jr z, .end
	ResetEvent EVENT_8DD
	jr .print_done

.ask_turn_on
	ld hl, ClauseBrother_FreezeDesc
	call PrintText
	call .choose
	ld hl, ClauseBrother_REJECT
	jr z, .end
	SetEvent EVENT_8DD
	
.print_done
	ld hl, ClauseBrother_DONE
.end
	call PrintText
	jp TextScriptEnd
.choose
	call NoYesChoice
	ld a, [wCurrentMenuItem]
	and a
	ret
	
ClauseBrother_Trap:
	TX_ASM
	ld hl, ClauseBrother_TrapIntro
	call PrintText

	CheckEvent EVENT_8C5
	jr z, .ask_turn_on
	
	ld hl, ClauseBrother_OFF
	call PrintText
	call .choose
	ld hl, ClauseBrother_REJECT
	jr z, .end
	ResetEvent EVENT_8C5
	jr .print_done

.ask_turn_on
	ld hl, ClauseBrother_TrapDesc
	call PrintText
	call .choose
	ld hl, ClauseBrother_REJECT
	jr z, .end
	SetEvent EVENT_8C5
	
.print_done
	ld hl, ClauseBrother_DONE
.end
	call PrintText
	jp TextScriptEnd
.choose
	call NoYesChoice
	ld a, [wCurrentMenuItem]
	and a
	ret
	
ClauseBrother_Hyperbeam:
	TX_ASM
	ld hl, ClauseBrother_HyperbeamIntro
	call PrintText

	CheckEvent EVENT_8C8
	jr z, .ask_turn_on
	
	ld hl, ClauseBrother_OFF
	call PrintText
	call .choose
	ld hl, ClauseBrother_REJECT
	jr z, .end
	ResetEvent EVENT_8C8
	jr .print_done

.ask_turn_on
	ld hl, ClauseBrother_HyperbeamDesc
	call PrintText
	call .choose
	ld hl, ClauseBrother_REJECT
	jr z, .end
	SetEvent EVENT_8C8
	
.print_done
	ld hl, ClauseBrother_DONE
.end
	call PrintText
	jp TextScriptEnd
.choose
	call NoYesChoice
	ld a, [wCurrentMenuItem]
	and a
	ret
	
ClauseBrother_OFF:
	TX_FAR _ClauseBrother_OFF
	db "@"
ClauseBrother_DONE:
	TX_FAR _ClauseBrother_DONE
	db "@"	
ClauseBrother_REJECT:
	TX_FAR _ClauseBrother_REJECT
	db "@"
ClauseBrother_ItemIntro:
	TX_FAR _ClauseBrother_ItemIntro
	db "@"
ClauseBrother_ItemDesc:
	TX_FAR _ClauseBrother_ItemDesc
	db "@"
ClauseBrother_SleepIntro:
	TX_FAR _ClauseBrother_SleepIntro
	db "@"
ClauseBrother_SleepDesc:
	TX_FAR _ClauseBrother_SleepDesc
	db "@"
ClauseBrother_FreezeIntro:
	TX_FAR _ClauseBrother_FreezeIntro
	db "@"
ClauseBrother_FreezeDesc:
	TX_FAR _ClauseBrother_FreezeDesc
	db "@"
ClauseBrother_TrapIntro:
	TX_FAR _ClauseBrother_TrapIntro
	db "@"
ClauseBrother_TrapDesc:
	TX_FAR _ClauseBrother_TrapDesc
	db "@"
ClauseBrother_HyperbeamIntro:
	TX_FAR _ClauseBrother_HyperbeamIntro
	db "@"
ClauseBrother_HyperbeamDesc:
	TX_FAR _ClauseBrother_HyperbeamDesc
	db "@"
