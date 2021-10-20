;ustawi� tabulacj� na 6 znak�w

;�wiczenie 20

;w CSDB zatrzaskiwany jest wzorek zapalaj�cy wszystkie segmenty ("8" z kropk�)
;w CSDS "grzebie� bitowy" w��czaj�cy wszystkie wy�wietlacze

CSDS16	EQU	0FF30H	;adres zatrzasku wyboru wska�nika/wy�wietlacza
CSDB16	EQU	0FF38H	;adres zatrzasku wzork�w na wska�niku/wy�wietlaczu

SEGOFF	EQU	P1.6	;w��cza (0) / wy��cza (1) wy�wietlacze 7S
LDTEST	EQU	P1.7	;w��cza (0) / wy��cza (1) diod� TEST
SEQKEY	EQU	P3.5	;testuje naci�ni�cie (1) klawisza KSQ

KeyCount	EQU	7Ah	;zlicza powt�rzenia klawisza

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

	MOV	7Eh, #2			;wykonanie tej p�tli trwa oko�o 1ms
	MOV	7Fh, #204			;w ten prosty i niezbyt dok�adny spos�b
LoopKeyWait1ms:				;zast�pimy oczekianie na przerwanie zegarowe
	DJNZ	7Fh, LoopKeyWait1ms	;mo�na ten kod wykorzysta� do cel�w testowych
	DJNZ	7Eh, LoopKeyWait1ms	;ale nie nadaje si� do prawdziwego zegarka

	MOV	C, SEQKEY		;stan klawiatury do Carry
	JNC	LoopKeyNoKey	;nie naci�ni�to klawisza

	MOV	A, KeyCount       ;tutaj je�li jest naci�ni�ty klawisz
	JZ	LoopKey		;klawisz ju� wcze�niej zosta� zauwa�ony

	DJNZ	KeyCount, LoopKey	;za ma�a liczba powt�rze� aby obs�u�y� klawisz

					;licznk powt�rze� klawisza zszed� do zera
	CPL	LDTEST		;mo�emy regularnie obs�u�y� klawisz
					;w tym przypadku prze��czy� stan diody TEST
	SJMP	LoopKey     	;i pomin�� inicjowanie zliczania powt�rze� klawisza

LoopKeyNoKey:
	MOV	KeyCount, #25	;inicjuje zliczanie powt�rze� klawisza
					;zazwyczaj 6 wystarcza, a przy 25 klawiatura
					;dzia�a absolutnie niezawodnie
					;przy 200 wida� wyra�ne op�nienie reakcji
					;na naci�ni�cie klawisza
	SJMP	LoopKey		;never ending loop
