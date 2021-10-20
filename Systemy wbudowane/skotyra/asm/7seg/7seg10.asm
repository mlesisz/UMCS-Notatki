;�wiczenie 10

;jak ju� mamy p�tl� niezawodnie biegaj�c� po wy�wietlaczach
;spr�bujemy na ka�dym wy�wietlaczu wy�wietli� co innego

CSDS16	EQU	0FF30H	;adres zatrzasku wyboru wska�nika/wy�wietlacza
CSDB16	EQU	0FF38H	;adres zatrzasku wyboru segment�w/wzork�w

SEGOFF	BIT	P1.6	;ten bit w��cza wy�wietlacze

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

;na razie zmienia si� niewiele, przenosimy funkcje kontrolne do rejestr�w R6 i R7
;�eby zwolni� akumulator do innch zada�,
;w dalszym ci�gu ten sam wzorek na wszystkich wy�wietlaczach

LoopIni:
	MOV	R7, #1		;zaczynamy od najm�odszego wy�wietlacza
				;R7 przyjmuje warto�ci 1, 2, 3, 4, 5, 6, 7
	MOV	R6, #1		;to jest najm�odszy wy�wietlacz bitowo
				;R6 przyjmuje warto�ci 1, 2, 4, 8, 16, 32, 64

LoopRun:
	MOV	A, R6		;maska bitowa wybieraj�ca wy�wietlacz do A
	MOVX	@DPTR, A	;wybierz wska�nik

	RL	A		;w nast�pnym obrocie p�tli wybierz nast�pny,
	MOV	R6, A		;starszy wy�wietlacz - i zapami�taj to w R6

	INC	R7		;przestaw wska�nik na starszy wy�wietlacz
	CJNE	R7, #8, LoopRun	;"8" w R7 oznacza mini�cie diod F1-ER
	SJMP	LoopIni		;ponownie zacznij od najm�odszego wy�wietlacza

WZORY:
	DB	00111111B, 00000110B, 01011011B, 01001111B	;0123
	DB	01100110B, 01101101B, 01111101B, 00000111B	;4567
	DB	01111111B, 01101111B, 01110111B, 01111100B	;89Ab
	DB	01011000B, 01011110B, 01111001B, 01110001B	;cdEF

END
