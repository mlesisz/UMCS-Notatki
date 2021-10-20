;ustawiæ tabulacjê na 6 znaków

;æwiczenie 00

;w CSDB zatrzaskiwany jest wzorek zapalaj¹cy wszystkie segmenty ("8" z kropk¹)
;w CSDS "grzebieñ bitowy" w³¹czaj¹cy wszystkie wyœwietlacze

CSDS16	EQU	0FF30H	;adres zatrzasku wyboru wskaŸnika/wyœwietlacza
CSDB16	EQU	0FF38H	;adres zatrzasku wzorków na wskaŸniku/wyœwietlaczu

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

	CLR	P1.6			;w³¹cz wyœwietlacze

	MOV	DPTR, #CSDB16	;adres zatrzasku wzorków do DPTR
	MOV	A, #11111111B	;wyœwietli wszystkie segmenty ("8" z kropk¹)
	MOVX	@DPTR, A		;wzorek do zatrzasku

	MOV	DPTR, #CSDS16	;adres zatrzasku wzorków do DPTR
	MOV	A, #00111111B	;wybierze wszystkie wyœwietlacze
	MOVX	@DPTR, A		;wybierz wyœwietlacze

LoopKey:
	MOV	C, P3.5		;stan P3.5 do Carry
	MOV	P1.7, C		;Carry do P1.7
	SJMP	LoopKey		;never ending loop
