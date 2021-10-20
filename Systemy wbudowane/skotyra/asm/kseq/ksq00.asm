;ustawi� tabulacj� na 6 znak�w

;�wiczenie 00

;w CSDB zatrzaskiwany jest wzorek zapalaj�cy wszystkie segmenty ("8" z kropk�)
;w CSDS "grzebie� bitowy" w��czaj�cy wszystkie wy�wietlacze

CSDS16	EQU	0FF30H	;adres zatrzasku wyboru wska�nika/wy�wietlacza
CSDB16	EQU	0FF38H	;adres zatrzasku wzork�w na wska�niku/wy�wietlaczu

;=======================================
;
;	RESET
;
	ORG	00H	;reset
	LJMP	START	;

;=======================================
;
;	PROGRAM
;
	ORG	100H	;program
START:

	CLR	P1.6			;w��cz wy�wietlacze

	MOV	DPTR, #CSDB16	;adres zatrzasku wzork�w do DPTR
	MOV	A, #11111111B	;wy�wietli wszystkie segmenty ("8" z kropk�)
	MOVX	@DPTR, A		;wzorek do zatrzasku

	MOV	DPTR, #CSDS16	;adres zatrzasku wzork�w do DPTR
	MOV	A, #00111111B	;wybierze wszystkie wy�wietlacze
	MOVX	@DPTR, A		;wybierz wy�wietlacze

LoopKey:
	MOV	C, P3.5		;stan P3.5 do Carry
	MOV	P1.7, C		;Carry do P1.7
	SJMP	LoopKey		;never ending loop
