; prints text for bookshelves in buildings without sign events
PrintBookshelfText: ; fb50 (3:7b50)
	ld a, [wSpriteStateData1 + 9] ; player's sprite facing direction
	cp SPRITE_FACING_UP
	jr nz, .noMatch
; facing up
	ld a, [W_CURMAPTILESET]
	ld b, a
	aCoord 8, 7
	ld c, a
	ld hl, BookshelfTileIDs
.loop
	ld a, [hli]
	cp $ff
	jr z, .noMatch
	cp b
	jr nz, .nextBookshelfEntry1
	ld a, [hli]
	cp c
	jr nz, .nextBookshelfEntry2
	ld a, [hl]
	push af
	call EnableAutoTextBoxDrawing
	pop af
	call PrintPredefTextID
	xor a
	ld [$ffdb], a
	ret
.nextBookshelfEntry1
	inc hl
.nextBookshelfEntry2
	inc hl
	jr .loop
.noMatch
	ld a, $ff
	ld [$ffdb], a
	ld b, BANK(PrintCardKeyText)
	ld hl, PrintCardKeyText
	jp Bankswitch

; format: db tileset id, bookshelf tile id, text id
BookshelfTileIDs: ; fb8b (3:7b8b)
	db LAB,40,64
	db MART,54,66
	db MART,90,66
	db MART,92,66
	db OAK_TS,92,64
	db OAK_TS,94,64
	db MANSION,50,64
	db GATE,34,64
	db SHIP,54,64
	db REDS_HOUSE_1,50,64
	db PLATEAU,48,58
	db HOUSE,60,63
	db HOUSE,50,64
	db GYM,29,64
	db POKECENTER,41,67
	db LOBBY,22,65
	db $FF

IndigoPlateauStatues: ; fbbf (3:7bbf)
	db $08 ; asm
	ld hl, IndigoPlateauStatuesText1
	call PrintText
	ld a, [W_XCOORD]
	bit 0, a
	ld hl, IndigoPlateauStatuesText2
	jr nz, .asm_fbd3
	ld hl, IndigoPlateauStatuesText3
.asm_fbd3
	call PrintText
	jp TextScriptEnd

IndigoPlateauStatuesText1: ; fbd9 (3:7bd9)
	TX_FAR _IndigoPlateauStatuesText1
	db "@"

IndigoPlateauStatuesText2: ; fbde (3:7bde)
	TX_FAR _IndigoPlateauStatuesText2
	db "@"

IndigoPlateauStatuesText3: ; fbe3 (3:7be3)
	TX_FAR _IndigoPlateauStatuesText3
	db "@"

BookOrSculptureText: ; fbe8 (3:7be8)
	db $08 ; asm
	ld hl, PokemonBooksText
	ld a, [W_CURMAPTILESET]
	cp MANSION ; Celadon Mansion tileset
	jr nz, .asm_fbfd
	ld a, [wTileMap + $80]
	cp $38
	jr nz, .asm_fbfd
	ld hl, DiglettSculptureText
.asm_fbfd
	call PrintText
	jp TextScriptEnd

PokemonBooksText: ; fc03 (3:7c03)
	TX_FAR _PokemonBooksText
	db "@"

DiglettSculptureText: ; fc08 (3:7c08)
	TX_FAR _DiglettSculptureText
	db "@"

ElevatorText: ; fc0d (3:7c0d)
	TX_FAR _ElevatorText
	db "@"

TownMapText: ; fc12 (3:7c12)
	TX_FAR _TownMapText
	db $06
	db $08 ; asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wd730
	set 6, [hl]
	call GBPalWhiteOutWithDelay3
	xor a
	ld [hWY], a
	inc a
	ld [H_AUTOBGTRANSFERENABLED], a
	call LoadFontTilePatterns
	callba DisplayTownMap
	ld hl, wd730
	res 6, [hl]
	ld de, TextScriptEnd
	push de
	ld a, [H_LOADEDROMBANK]
	push af
	jp CloseTextDisplay

PokemonStuffText: ; fc45 (3:7c45)
	TX_FAR _PokemonStuffText
	db "@"

WonderTradeMachineText:
	db $08
	callba DoWonderTradeDialogue
	jp TextScriptEnd