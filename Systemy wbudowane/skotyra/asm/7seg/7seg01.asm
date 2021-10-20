;æwiczenie 01

;krêcimy pêtlê przebiegaj¹c¹ po wskaŸnikach
;wyœwietlaj¹c na wszystkich ten sam wzór
;na pierwszy rzut oka wygl¹da tak samo jak poprzednio

CSDS16	EQU	0FF30H	;adres zatrzasku wyboru wskaŸnika/wyœwietlacza
CSDB16	EQU	0FF38H	;adres zatrzasku wyboru segmentów/wzorków
SEGOFF	EQU	P1.6		;ten bit w³¹cza wyœwietlacze

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

				;mo¿na przetestowaæ podstawiaj¹c
	MOV	A, #00		;do A kilka wartoœci od 0 do 15

	MOV	DPTR, #WZORY	;adres wzorków do DPTR
	MOVC	A, @A+DPTR	;wzorek do A

	MOV	DPTR, #CSDB16	;adres zatrzasku wzorków do DPTR
	MOVX	@DPTR, A	;wzorek do zatrzasku

	MOV	DPTR, #CSDS16	;adres zatrzasku wyboru wskaŸników do DPTR

	MOV	A, #1		;ustawia tylko jeden bit - tutaj najm³odszy
				;na tym etapie jest wszystko jedno który
LoopRun:
	MOVX	@DPTR, A	;wybierz wskaŸnik
	RL	A		;¿eby by³o ³atwiej na razie krêcimy pêtlê po wszystkich 8 bitach
	SJMP	LoopRun

WZORY:
	DB	00111111B, 00000110B, 01011011B, 01001111B	;0123
	DB	01100110B, 01101101B, 01111101B, 00000111B	;4567
	DB	01111111B, 01101111B, 01110111B, 01111100B	;89Ab
	DB	01011000B, 01011110B, 01111001B, 01110001B	;cdEF

END
