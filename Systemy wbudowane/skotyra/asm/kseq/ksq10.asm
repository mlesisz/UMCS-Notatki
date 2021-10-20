;ustawi� tabulacj� na 6 znak�w

;�wiczenie 10

;w CSDB zatrzaskiwany jest wzorek zapalaj�cy wszystkie segmenty ("8" z kropk�)
;w CSDS "grzebie� bitowy" w��czaj�cy wszystkie wy�wietlacze

CSDS16	EQU	0FF30H	;adres zatrzasku wyboru wska�nika/wy�wietlacza
CSDB16	EQU	0FF38H	;adres zatrzasku wzork�w na wska�niku/wy�wietlaczu

SEGOFF	EQU	P1.6	;w��cza (0) / wy��cza (1) wy�wietlacze 7S
LDTEST	EQU	P1.7	;w��cza (0) / wy��cza (1) diod� TEST
SEQKEY	EQU	P3.5	;testuje naci�ni�cie (1) klawisza KSQ
PRVKEY	BIT	F0	;pami�ta poprzedni stan klawiatury (wykorzystano bit PSW.5)

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

	CLR	SEGOFF		;w��cz wy�wietlacze

	MOV	DPTR, #CSDB16	;adres zatrzasku wzork�w do DPTR
	MOV	A, #11111111B	;wy�wietli wszystkie segmenty ("8" z kropk�)
	MOVX	@DPTR, A		;wzorek do zatrzasku

	MOV	DPTR, #CSDS16	;adres zatrzasku wzork�w do DPTR
	MOV	A, #00111111B	;wybierze wszystkie wy�wietlacze
	MOVX	@DPTR, A		;wybierz wy�wietlacze

LoopKey:
	MOV	C, SEQKEY		;stan klawiatury do Carry
	JNC	LoopKeyNoKey	;nie naci�ni�to klawisza

						;teraz naci�ni�to klawisz
	JB	PRVKEY, LoopKeyNoKey	;ale poprzednim razem te� by� naci�ni�ty

	CPL	LDTEST		;je�eli teraz naci�ni�to klawisz, a w poprzednim obiegu p�tli
					;�aden klawisz nie by� nacisni�ty to prze��cz stan diody TEST
LoopKeyNoKey:
	MOV	PRVKEY, C		;obecny stan klawiatury z Carry do PRVKEY
	SJMP	LoopKey		;never ending loop
