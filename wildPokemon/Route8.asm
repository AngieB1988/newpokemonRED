Route8Mons: 
	db $0F
	
	IF _RED
		db 18,PIDGEY
		db 18,MANKEY
		db 17,EKANS
		db 16,GROWLITHE
		db 20,PIDGEY
		db 20,MANKEY
		db 19,EKANS
		db 17,GROWLITHE
		db 15,GROWLITHE
		db 18,GROWLITHE
	ENDC
	
	IF _GREEN || !_JAPAN && _BLUE
		db 18,PIDGEY
		db 18,MEOWTH
		db 17,SANDSHREW
		db 16,VULPIX
		db 20,PIDGEY
		db 20,MEOWTH
		db 19,SANDSHREW
		db 17,VULPIX
		db 15,VULPIX
		db 18,VULPIX
	ENDC
	
	IF _JAPAN && _BLUE
		db 18,PIDGEY
		db 18,MEOWTH
		db 17,SANDSHREW
		db 16,GROWLITHE
		db 20,PIDGEY
		db 20,MEOWTH
		db 19,SANDSHREW
		db 17,GROWLITHE
		db 15,GROWLITHE
		db 18,GROWLITHE
	ENDC
	
	IF _YELLOW
		db 20,PIDGEY
		db 22,PIDGEY
		db 20,RATTATA
		db 15,ABRA
		db 19,ABRA
		db 24,PIDGEOTTO
		db 19,JIGGLYPUFF
		db 24,JIGGLYPUFF
		db 20,KADABRA
		db 27,KADABRA
	ENDC
	
	db $00

