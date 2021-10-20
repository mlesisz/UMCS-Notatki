;�wiczenie 01

;kr�cimy p�tl� przebiegaj�c� po wska�nikach
;wy�wietlaj�c na wszystkich ten sam wz�r
;na pierwszy rzut oka wygl�da tak samo jak poprzednio

CSDS16	EQU	0FF30H	;adres zatrzasku wyboru wska�nika/wy�wietlacza
CSDB16	EQU	0FF38H	;adres zatrzasku wyboru segment�w/wzork�w
SEGOFF	EQU	P1.6		;ten bit w��cza wy�wietlacze

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

				;mo�na przetestowa� podstawiaj�c
	MOV	A, #00		;do A kilka warto�ci od 0 do 15

	MOV	DPTR, #WZORY	;adres wzork�w do DPTR
	MOVC	A, @A+DPTR	;wzorek do A

	MOV	DPTR, #CSDB16	;adres zatrzasku wzork�w do DPTR
	MOVX	@DPTR, A	;wzorek do zatrzasku

	MOV	DPTR, #CSDS16	;adres zatrzasku wyboru wska�nik�w do DPTR

	MOV	A, #1		;ustawia tylko jeden bit - tutaj najm�odszy
				;na tym etapie jest wszystko jedno kt�ry
LoopRun:
	MOVX	@DPTR, A	;wybierz wska�nik
	RL	A		;�eby by�o �atwiej na razie kr�cimy p�tl� po wszystkich 8 bitach
	SJMP	LoopRun

WZORY:
	DB	00111111B, 00000110B, 01011011B, 01001111B	;0123
	DB	01100110B, 01101101B, 01111101B, 00000111B	;4567
	DB	01111111B, 01101111B, 01110111B, 01111100B	;89Ab
	DB	01011000B, 01011110B, 01111001B, 01110001B	;cdEF

END
