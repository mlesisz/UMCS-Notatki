;æwiczenie 00

;po zajêciach z ubieg³ego tygodnia studenci powinni byæ mniej wiêcej na takim etapie:
;zdefiniowane s¹ wzorki i jest kawa³ek kodu, który pobiera z pamiêci programu
;wzorek odpowiadaj¹cy liczbie (0-F) wpisanej do akumulatora
;w CSDB zatrzaskiwany jest wzorek, w CSDS "grzebieñ bitowy" w³¹czaj¹cy wszystkie wyœwietlacze

CSDS16	EQU	0FF30H	;adres zatrzasku wyboru wskaŸnika/wyœwietlacza
CSDB16	EQU	0FF38H	;adres zatrzasku wyboru segmentów/wzorków
SEGOFF	EQU	P1.6	;ten bit w³¹cza wyœwietlacze

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

				;trzeba przetestowaæ podstawiaj¹c
	MOV	A, #00		;do A kolejne wartoœci od 0 do 15

	MOV	DPTR, #WZORY	;adres wzorków do DPTR
	MOVC	A, @A+DPTR	;wzorek z pamiêci programu do A

	MOV	DPTR, #CSDB16	;adres zatrzasku wzorków do DPTR
	MOVX	@DPTR, A	;wzorek do zatrzasku

	MOV	A, #7FH		;zapal¹ siê diody F1-ER i wszystkie wskaŸniki
	MOV	DPTR, #CSDS16	;adres zatrzasku wyboru wskaŸników do DPTR
	MOVX	@DPTR, A	;wybierz wskaŸniki

	SJMP	$		;never ending loop

WZORY:
	DB	00111111B, 00000110B, 01011011B, 01001111B	;0123
	DB	01100110B, 01101101B, 01111101B, 00000111B	;4567
	DB	01111111B, 01101111B, 01110111B, 01111100B	;89Ab
	DB	01011000B, 01011110B, 01111001B, 01110001B	;cdEF

END
