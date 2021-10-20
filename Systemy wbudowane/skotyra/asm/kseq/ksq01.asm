;ustawiæ tabulacjê na 6 znaków

;æwiczenie 01

;w CSDB zatrzaskiwany jest wzorek zapalaj¹cy wszystkie segmenty ("8" z kropk¹)
;w CSDS "grzebieñ bitowy" w³¹czaj¹cy wszystkie wyœwietlacze

CSDS16	EQU	0FF30H	;adres zatrzasku wyboru wskaŸnika/wyœwietlacza
CSDB16	EQU	0FF38H	;adres zatrzasku wzorków na wskaŸniku/wyœwietlaczu

SEGOFF	EQU	P1.6	;w³¹cza (0) / wy³¹cza (1) wyœwietlacze 7S
LDTEST	EQU	P1.7	;w³¹cza (0) / wy³¹cza (1) diodê TEST
SEQKEY	EQU	P3.5	;testuje naciœniêcie (1) klawisza KSQ

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

	CLR	SEGOFF		;w³¹cz wyœwietlacze

	MOV	DPTR, #CSDB16	;adres zatrzasku wzorków do DPTR
	MOV	A, #11111111B	;wyœwietli wszystkie segmenty ("8" z kropk¹)
	MOVX	@DPTR, A		;wzorek do zatrzasku

	MOV	DPTR, #CSDS16	;adres zatrzasku wzorków do DPTR
	MOV	A, #00111111B	;wybierze wszystkie wyœwietlacze
	MOVX	@DPTR, A		;wybierz wyœwietlacze

LoopKey:
	JB	SEQKEY, LoopKeyTurnOff	;testujemy stan klawiatury
	CLR	LDTEST		;w³¹cza diodê test
	SJMP	LoopKey

LoopKeyTurnOff:
	SETB	LDTEST		;wy³¹cza diodê test

	SJMP	LoopKey		;never ending loop
