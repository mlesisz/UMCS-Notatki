;�wiczenie 00

;po zaj�ciach z ubieg�ego tygodnia studenci powinni by� mniej wi�cej na takim etapie:
;zdefiniowane s� wzorki i jest kawa�ek kodu, kt�ry pobiera z pami�ci programu
;wzorek odpowiadaj�cy liczbie (0-F) wpisanej do akumulatora
;w CSDB zatrzaskiwany jest wzorek, w CSDS "grzebie� bitowy" w��czaj�cy wszystkie wy�wietlacze

CSDS16	EQU	0FF30H	;adres zatrzasku wyboru wska�nika/wy�wietlacza
CSDB16	EQU	0FF38H	;adres zatrzasku wyboru segment�w/wzork�w
SEGOFF	EQU	P1.6	;ten bit w��cza wy�wietlacze

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

				;trzeba przetestowa� podstawiaj�c
	MOV	A, #00		;do A kolejne warto�ci od 0 do 15

	MOV	DPTR, #WZORY	;adres wzork�w do DPTR
	MOVC	A, @A+DPTR	;wzorek z pami�ci programu do A

	MOV	DPTR, #CSDB16	;adres zatrzasku wzork�w do DPTR
	MOVX	@DPTR, A	;wzorek do zatrzasku

	MOV	A, #7FH		;zapal� si� diody F1-ER i wszystkie wska�niki
	MOV	DPTR, #CSDS16	;adres zatrzasku wyboru wska�nik�w do DPTR
	MOVX	@DPTR, A	;wybierz wska�niki

	SJMP	$		;never ending loop

WZORY:
	DB	00111111B, 00000110B, 01011011B, 01001111B	;0123
	DB	01100110B, 01101101B, 01111101B, 00000111B	;4567
	DB	01111111B, 01101111B, 01110111B, 01111100B	;89Ab
	DB	01011000B, 01011110B, 01111001B, 01110001B	;cdEF

END
