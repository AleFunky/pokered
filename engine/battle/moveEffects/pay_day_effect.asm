PayDayEffect_:	;joenote - re-writing for efficiency
	xor a
	ld hl, wcd6d
	ld [hli], a
	ld a, [H_WHOSETURN]
	and a
	ld a, [wBattleMonLevel]
	jr z, .payDayEffect
	ld a, [wEnemyMonLevel]
.payDayEffect
; level * 2
;	add a

	ld [H_DIVIDEND + 3], a
	xor a
	ld [H_DIVIDEND], a
	ld [H_DIVIDEND + 1], a
	ld [H_DIVIDEND + 2], a
	
; convert to BCD
	ld a, 100
	ld [H_DIVISOR], a
	ld b, $4
	call Divide
	ld a, [H_QUOTIENT + 3]
	ld [hli], a
	ld a, [H_REMAINDER]
	ld [H_DIVIDEND + 3], a
	ld a, 10
	ld [H_DIVISOR], a
	ld b, $4
	call Divide
	ld a, [H_QUOTIENT + 3]
	swap a
	ld b, a
	ld a, [H_REMAINDER]
	add b
	ld [hl], a
	
	ld c, $3
	ld b, 5	;joenote - make it a 5x multiplier like later generations
.loop	
	ld hl, wcd6d + 2
	ld de, wTotalPayDayMoney + 2
	push bc
	predef AddBCDPredef
	pop bc
	dec b
	jr nz, .loop
	
	ld hl, CoinsScatteredText
	jp PrintText

CoinsScatteredText:
	TX_FAR _CoinsScatteredText
	db "@"
