Predef::
; Call predefined function a.
; To preserve other registers, have the
; destination call GetPredefRegisters.

	; Save the predef id for GetPredefPointer.
	ld [wPredefID], a

	; A hack for LoadDestinationWarpPosition.
	; See LoadTilesetHeader (predef $19).
	ld a, [H_LOADEDROMBANK]
	ld [wPredefParentBank], a

	push af
	ld a, BANK(GetPredefPointer)
	ld [H_LOADEDROMBANK], a
	ld [MBC1RomBank], a

	call GetPredefPointer

	ld a, [wPredefBank]
	ld [H_LOADEDROMBANK], a
	ld [MBC1RomBank], a

	ld de, .done
	push de
	jp hl
.done
	;SP target is at xxxx-2 to start with
	pop af	;SP now points to target at xxxx
	ld [H_LOADEDROMBANK], a
	ld [MBC1RomBank], a
	ret

;joenote - rewrite this to preserve the f flag register
;	;SP target is at xxxx-2 to start with
;	push af		;SP target is at xxxx-4 and flags are saved there
;	add sp, $0002	;SP target is at xxxx-2
;	pop af ;SP now points to target at xxxx
;	ld [H_LOADEDROMBANK], a
;	ld [MBC1RomBank], a
;	add sp, ($FFFF - 3)		;SP target is at xxxx-4
;	pop af	;SP target is at xxxx-2
;	inc sp	;SP target is at xxxx-1
;	inc sp	;SP now points to target at xxxx
;	ret

GetPredefRegisters::
; Restore the contents of register pairs
; when GetPredefPointer was called.
	ld a, [wPredefRegisters + 0]
	ld h, a
	ld a, [wPredefRegisters + 1]
	ld l, a
	ld a, [wPredefRegisters + 2]
	ld d, a
	ld a, [wPredefRegisters + 3]
	ld e, a
	ld a, [wPredefRegisters + 4]
	ld b, a
	ld a, [wPredefRegisters + 5]
	ld c, a
	ret
