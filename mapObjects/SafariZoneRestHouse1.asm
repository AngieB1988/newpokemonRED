SafariZoneRestHouse1Object: ; 0x45cfe (size=32)
	db $a ; border tile

	db $2 ; warps
	db $7, $2, $8, SAFARI_ZONE_CENTER
	db $7, $3, $8, SAFARI_ZONE_CENTER

	db $0 ; signs

	db $2 ; people
	db SPRITE_GIRL, $2 + 4, $3 + 4, $ff, $d0, $1 ; person
	db SPRITE_OAK_AIDE, $4 + 4, $1 + 4, $fe, $1, $2 ; person

	; warp-to
	EVENT_DISP $4, $7, $2 ; SAFARI_ZONE_CENTER
	EVENT_DISP $4, $7, $3 ; SAFARI_ZONE_CENTER
