Route24Mons:;joenote - added oddish/bellsprout
	db $19
	IF DEF(_ENCRED)
		db 7,WEEDLE
		db 8,KAKUNA
		db 12,PIDGEY
		db 13,ODDISH
		db 10,ABRA
		db 14,ODDISH
		db 13,PIDGEY
		db 8,ABRA
		db 12,BELLSPROUT
		db 12,ABRA
	ELIF DEF(_ENCBLUEJP)
		db  7, CATERPIE
		db  8, METAPOD
		db 12, PIDGEY
		db 13, ODDISH
		db 10, ABRA
		db 14, ODDISH
		db 13,PIDGEY
		db 8,ABRA
		db 12,BELLSPROUT
		db 12,ABRA
	ELIF DEF(_ENCBLUEGREEN)
		db 7,CATERPIE
		db 8,METAPOD
		db 12,PIDGEY
		db 13,BELLSPROUT
		db 10,ABRA
		db 14,BELLSPROUT
		db 13,PIDGEY
		db 8,ABRA
		db 12,ODDISH
		db 12,ABRA
	ENDC
	db $00
