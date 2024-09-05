FarCopyData::
; Copy bc bytes from a:hl to de.
	ld [wBuffer], a
	ld a, [H_LOADEDROMBANK]
	push af
	ld a, [wBuffer]
	ld [H_LOADEDROMBANK], a
	ld [MBC1RomBank], a
	call CopyData
	pop af
	ld [H_LOADEDROMBANK], a
	ld [MBC1RomBank], a
	ret

CopyData::
;joenote - Allow a flag to control writes only being performed within a period where VRAM can be accessed
	ld a, [hFlagsFFFA]
	bit 3, a
	jr z, _CopyData

;wait if in mode 2 or mode 3
;HBLANK length (mode 0) is highly variable. Worst case scenario is 21 cycles.
;Can also write VRAM during OAM scan (mode 2) which is always 20 cycles.
;For more info about timing the HBLANK, see https://gbdev.io/guides/lyc_timing.html
.loop
	di	;prevent vblank functions from running
;.waitMode3
;	ldh a, [rSTAT]		;read from stat register to get the mode
;	and %11				;4 cycles
;	cp 3				;4 cycles
;	jr nz, .waitMode3	;6 cycles to pass or 10 to loop
.waitVRAM
	ldh a, [rSTAT]		;2 cycles - read from stat register to get the mode
	and %10				;4 cycles
	jr nz, .waitVRAM	;6 cycles to pass or 10 to loop
; Copy bc bytes from hl to de.
	ld a, [hli]			;4 cycles
	ld [de], a			;2 cycles
;this should result in 9 cycles of wiggle-room in the worst case
	inc de
	dec bc
	ei	;re-enable vblank functions
	ld a, c
	or b
	jr nz, .loop
	ret
	
_CopyData::
; Copy bc bytes from hl to de.
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, _CopyData
	ret
