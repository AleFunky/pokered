Route10Mons:;joenote - added magnemite
	db $0F
	IF DEF(_ENCRED)
		db 16,VOLTORB
		db 16,SPEAROW
		db 14,VOLTORB
		db 11,EKANS
		db 13,SPEAROW
		db 15,EKANS
		db 17,MAGNEMITE
		db 17,SPEAROW
		db 13,EKANS
		db 17,EKANS
	ELIF DEF(_ENCBLUEJP)
		db 16,VOLTORB
		db 16,SPEAROW
		db 14,VOLTORB
		db 11, SANDSHREW
		db 13, SPEAROW
		db 15, SANDSHREW
		db 17, MAGNEMITE
		db 17, SPEAROW
		db 13, SANDSHREW
		db 17, SANDSHREW
	ELIF DEF(_ENCBLUEGREEN)
		db 16,VOLTORB
		db 16,SPEAROW
		db 14,VOLTORB
		db 11,SANDSHREW
		db 13,SPEAROW
		db 15,SANDSHREW
		db 17,MAGNEMITE
		db 17,SPEAROW
		db 13,SANDSHREW
		db 17,SANDSHREW
	ENDC
	db $00
