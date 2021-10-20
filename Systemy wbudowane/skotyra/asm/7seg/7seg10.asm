;æwiczenie 10

;jak ju¿ mamy pêtlê niezawodnie biegaj¹c¹ po wyœwietlaczach
;spróbujemy na ka¿dym wyœwietlaczu wyœwietliæ co innego

CSDS16	EQU	0FF30H	;adres zatrzasku wyboru wskaŸnika/wyœwietlacza
CSDB16	EQU	0FF38H	;adres zatrzasku wyboru segmentów/wzorków

SEGOFF	BIT	P1.6	;ten bit w³¹cza wyœwietlacze

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

;na razie zmienia siê niewiele, przenosimy funkcje kontrolne do rejestrów R6 i R7
;¿eby zwolniæ akumulator do innch zadañ,
;w dalszym ci¹gu ten sam wzorek na wszystkich wyœwietlaczach

LoopIni:
	MOV	R7, #1		;zaczynamy od najm³odszego wyœwietlacza
				;R7 przyjmuje wartoœci 1, 2, 3, 4, 5, 6, 7
	MOV	R6, #1		;to jest najm³odszy wyœwietlacz bitowo
				;R6 przyjmuje wartoœci 1, 2, 4, 8, 16, 32, 64

LoopRun:
	MOV	A, R6		;maska bitowa wybieraj¹ca wyœwietlacz do A
	MOVX	@DPTR, A	;wybierz wskaŸnik

	RL	A		;w nastêpnym obrocie pêtli wybierz nastêpny,
	MOV	R6, A		;starszy wyœwietlacz - i zapamiêtaj to w R6

	INC	R7		;przestaw wskaŸnik na starszy wyœwietlacz
	CJNE	R7, #8, LoopRun	;"8" w R7 oznacza miniêcie diod F1-ER
	SJMP	LoopIni		;ponownie zacznij od najm³odszego wyœwietlacza

WZORY:
	DB	00111111B, 00000110B, 01011011B, 01001111B	;0123
	DB	01100110B, 01101101B, 01111101B, 00000111B	;4567
	DB	01111111B, 01101111B, 01110111B, 01111100B	;89Ab
	DB	01011000B, 01011110B, 01111001B, 01110001B	;cdEF

END
