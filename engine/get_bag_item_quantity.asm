;joenote - modified to check the backup bag space as well as regular bag space
GetQuantityOfItemInBag:
; In: b = item ID
; Out: b = how many of that item are in the bag
	call GetPredefRegisters

	;check the main bag space
	ld hl, wNumBagItems
	call .loop
	ret nz	;return if item was found
	;else item was not found in main bag space
	
	;return if the backup space has never been used
	ld a, $FF
	ld hl, wBagItemsBackupTerminator
	cp [hl]
	jr nz, .notInBag
	
	;check the backup bag space
	ld hl, wBagNumBackup
	call .loop
	ret nz	;return if item was found
	;else item was not found in backup bag space either
	
.notInBag
	ld b, 0
	ret

; gives z and b = b_initial if item not found
; gives nz and b = qty if item found
.loop
	inc hl
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr nz, .loop
	ld a, [hl]
	ld b, a
	ld a, 1
	and a
	ret

