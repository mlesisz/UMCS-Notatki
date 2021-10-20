;ustawiæ tabulacjê na 6 znaków

;æwiczenie 10

;w CSDB zatrzaskiwany jest wzorek zapalaj¹cy wszystkie segmenty ("8" z kropk¹)
;w CSDS "grzebieñ bitowy" w³¹czaj¹cy wszystkie wyœwietlacze

CSDS16	EQU	0FF30H	;adres zatrzasku wyboru wskaŸnika/wyœwietlacza
CSDB16	EQU	0FF38H	;adres zatrzasku wzorków na wskaŸniku/wyœwietlaczu

SEGOFF	EQU	P1.6	;w³¹cza (0) / wy³¹cza (1) wyœwietlacze 7S
LDTEST	EQU	P1.7	;w³¹cza (0) / wy³¹cza (1) diodê TEST
SEQKEY	EQU	P3.5	;testuje naciœniêcie (1) klawisza KSQ
PRVKEY	BIT	F0	;pamiêta poprzedni stan klawiatury (wykorzystano bit PSW.5)

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
	MOV	C, SEQKEY		;stan klawiatury do Carry
	JNC	LoopKeyNoKey	;nie naciœniêto klawisza

						;teraz naciœniêto klawisz
	JB	PRVKEY, LoopKeyNoKey	;ale poprzednim razem te¿ by³ naciœniêty

	CPL	LDTEST		;je¿eli teraz naciœniêto klawisz, a w poprzednim obiegu pêtli
					;¿aden klawisz nie by³ nacisniêty to prze³¹cz stan diody TEST
LoopKeyNoKey:
	MOV	PRVKEY, C		;obecny stan klawiatury z Carry do PRVKEY
	SJMP	LoopKey		;never ending loop
