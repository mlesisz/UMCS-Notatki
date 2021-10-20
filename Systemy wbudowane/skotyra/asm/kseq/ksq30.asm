;ustawi� tabulacj� na 6 znak�w

;�wiczenie 30

;docelowe rozwi�zanie obs�ugi klawiatury sekwencyjnej
;powstaje z po��czenia i programu obs�uguj�cego wy�wietlacz 7 segmentowy 7seg13.asm
;i programu ksq20.dsm z odpowiednimi modyfikacjami.

CSDS16	EQU	0FF30H	;adres zatrzasku wyboru wska�nika/wy�wietlacza
CSDB16	EQU	0FF38H	;adres zatrzasku wyboru segment�w/wzork�w

SEGOFF	BIT	P1.6	;w��cza (0) / wy��cza (1) wy�wietlacze 7S
LDTEST	EQU	P1.7	;w��cza (0) / wy��cza (1) diod� TEST
SEQKEY	EQU	P3.5	;testuje naci�ni�cie (1) klawisza KSQ

KeyCount	EQU	7Ah	;zlicza powt�rzenia klawisza
AgrKey	EQU	7Bh	;agregowany stan klawiatury sekwencyjnej
PrvKey	EQU	7Ch	;poprzedni stan klawiatury sekwencyjnej

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

LoopIni:
	MOV	R7, #1		;zaczynamy od najm�odszego wy�wietlacza/klawisza
	MOV	R6, #1		;to jest najm�odszy wy�wietlacz/klawisz bitowo
	MOV	AgrKey, #0		;za�o�enie: �aden klawisz nie jest naci�ni�ty

LoopRun:

	MOV	7Eh, #2			;wykonanie tej p�tli trwa oko�o 1ms
	MOV	7Fh, #204			;w ten prosty i niezbyt dok�adny spos�b
LoopKeyWait1ms:				;zast�pimy oczekianie na przerwanie zegarowe
	DJNZ	7Fh, LoopKeyWait1ms	;mo�na ten kod wykorzysta� do cel�w testowych
	DJNZ	7Eh, LoopKeyWait1ms	;ale nie nadaje si� do prawdziwego zegarka

	SETB	SEGOFF		;wy��cz wy�wietlacze

	MOV	DPTR, #CSDS16	;adres zatrzasku wyboru wska�nik�w do DPTR
	MOV	A, R6			;maska bitowa wybieraj�ca wy�wietlacz do A
	MOVX	@DPTR, A		;wybierz wska�nik

	JNB	SEQKEY, LoopRunNoKey	;je�eli klawisz odpowiadaj�cy masce w R6
						;nie jest naci�ni�ty

	ORL	AgrKey, A		;agreguj bit naci�ni�tego klawisza do AgrKey

LoopRunNoKey:
	RL	A			;w nast�pnym obrocie p�tli wybierz nast�pny
	MOV	R6, A			;starszy wy�wietlacz - i zapami�taj to w R6

	CJNE	R7, #7, LoopRunCyfra	;je�eli wy�wietlacz za�aduj cyfr�
	MOV	A, AgrKey		;wpr za�aduj do akumulatora stan klawiatury
	SJMP	LoopRunKeyInAcc	;i przeskocz �adowanie cyfry

LoopRunCyfra:
	MOV	A, R7			;wska�nik wy�wietlacza z R7 do A

	MOV	DPTR, #WZORY	;adres wzork�w do DPTR
	MOVC	A, @A+DPTR		;wzorek odpowiadaj�cy R7 do A

LoopRunKeyInAcc:
	MOV	DPTR, #CSDB16	;adres zatrzasku wzork�w do DPTR
	MOVX	@DPTR, A		;wzorek do zatrzasku

	CLR	SEGOFF		;w��cz wy�wietlacze

	INC	R7			;nast�pny, starszy wska�nik
	CJNE	R7, #8, LoopRun	;"8" w R7 oznacza mini�cie diod F1-ER

	MOV	A, AgrKey		;po obiegni�ciu wszystkich wy�wietlaczy/klawiszy
					;sprawdzamy stan klawiatury

	JZ	LoopRunNewKey	;je�eli nic nie jest naci�ni�te

LoopRunKey:
	CJNE	A, PrvKey, LoopRunNewKey	;je�eli stan klawiatury si� zmieni�

	MOV	A, KeyCount		;je�eli licznik powt�rze� ma warto�� 0 to znaczy
	JZ	LoopIni		;�e klawisz ju� wcze�niej zosta� zauwa�ony i obs�u�ony

	DJNZ	KeyCount, LoopIni	;klawiatura mo�e jeszcze nie by� ustabilizowana
					;wi�c ponownie zacznij od najm�odszego wy�wietlacza

					;licznik powt�rze� akurat osi�gn�� warto�� 0
	CPL	LDTEST		;tutaj mo�na regularnie obs�u�y� klawiatur�, w tym programie
					;ogranicza si� to wy��cznie do odwr�cenia stanu diody TEST
	SJMP	LoopIni		;ponownie zacznij od najm�odszego wy�wietlacza

LoopRunNewKey:
	MOV	KeyCount, #7	;odnawiamy licznik powt�rze�
	MOV	PrvKey, AgrKey	;zapami�tuje "poprzedni" stan klawiatury
	SJMP	LoopIni		;ponownie zacznij od najm�odszego wy�wietlacza

WZORY:
	DB	00111111B, 00000110B, 01011011B, 01001111B	;0123
	DB	01100110B, 01101101B, 01111101B, 00000111B	;4567
	DB	01111111B, 01101111B, 01110111B, 01111100B	;89Ab
	DB	01011000B, 01011110B, 01111001B, 01110001B	;cdEF
