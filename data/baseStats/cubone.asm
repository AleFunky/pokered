db DEX_CUBONE ; pokedex id
db 50 ; base hp
db 50 ; base attack
db 95 ; base defense
db 35 ; base speed
db 40 ; base special
db GROUND ; species type 1
db GROUND ; species type 2
db 190 ; catch rate
db 87 ; base exp yield
INCBIN CUBONE_FR,0,1 ; 55, sprite dimensions
dw CubonePicFront
dw CubonePicBack
; attacks known at lvl 0
db GROWL
db BONE_CLUB
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,11,12,13,14
	tmlearn 17,18,19,20
	tmlearn 26,27,28,31,32
	tmlearn 34,38,40
	tmlearn 44
	tmlearn 50,54
;	db 0 ; padding
	db BANK(CubonePicFront)
	assert BANK(CubonePicFront) == BANK(CubonePicBack)

