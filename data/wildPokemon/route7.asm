Route7Mons:;joenote - added ponyta
	db $0F
	IF DEF(_ENCRED)
		db 19,PIDGEY
		db 19,ODDISH
		db 17,MANKEY
		db 22,ODDISH
		db 22,PIDGEY
		db 18,PONYTA
		db 18,GROWLITHE
		db 20,GROWLITHE
		db 19,MANKEY
		db 20,MANKEY
	ELIF DEF(_ENCBLUEJP)
		db 19,PIDGEY
		db 19, ODDISH
		db 17, MEOWTH
		db 22, ODDISH
		db 22,PIDGEY
		db 18, PONYTA
		db 18, GROWLITHE
		db 20, GROWLITHE
		db 19, MEOWTH
		db 20, MEOWTH
	ELIF DEF(_ENCBLUEGREEN)
		db 19,PIDGEY
		db 19,BELLSPROUT
		db 17,MEOWTH
		db 22,BELLSPROUT
		db 22,PIDGEY
		db 18,PONYTA
		db 18,VULPIX
		db 20,VULPIX
		db 19,MEOWTH
		db 20,MEOWTH
	ENDC
	db $00
