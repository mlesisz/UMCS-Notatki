;ustawiæ tabulacjê na 6 znaków

;æwiczenie 30

;docelowe rozwi¹zanie obs³ugi klawiatury sekwencyjnej
;powstaje z po³¹czenia i programu obs³uguj¹cego wyœwietlacz 7 segmentowy 7seg13.asm
;i programu ksq20.dsm z odpowiednimi modyfikacjami.

CSDS16	EQU	0FF30H	;adres zatrzasku wyboru wskaŸnika/wyœwietlacza
CSDB16	EQU	0FF38H	;adres zatrzasku wyboru segmentów/wzorków

SEGOFF	BIT	P1.6	;w³¹cza (0) / wy³¹cza (1) wyœwietlacze 7S
LDTEST	EQU	P1.7	;w³¹cza (0) / wy³¹cza (1) diodê TEST
SEQKEY	EQU	P3.5	;testuje naciœniêcie (1) klawisza KSQ

KeyCount	EQU	7Ah	;zlicza powtórzenia klawisza
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
	MOV	R7, #1		;zaczynamy od najm³odszego wyœwietlacza/klawisza
	MOV	R6, #1		;to jest najm³odszy wyœwietlacz/klawisz bitowo
	MOV	AgrKey, #0		;za³o¿enie: ¿aden klawisz nie jest naciœniêty

LoopRun:

	MOV	7Eh, #2			;wykonanie tej pêtli trwa oko³o 1ms
	MOV	7Fh, #204			;w ten prosty i niezbyt dok³adny sposób
LoopKeyWait1ms:				;zast¹pimy oczekianie na przerwanie zegarowe
	DJNZ	7Fh, LoopKeyWait1ms	;mo¿na ten kod wykorzystaæ do celów testowych
	DJNZ	7Eh, LoopKeyWait1ms	;ale nie nadaje siê do prawdziwego zegarka

	SETB	SEGOFF		;wy³¹cz wyœwietlacze

	MOV	DPTR, #CSDS16	;adres zatrzasku wyboru wskaŸników do DPTR
	MOV	A, R6			;maska bitowa wybieraj¹ca wyœwietlacz do A
	MOVX	@DPTR, A		;wybierz wskaŸnik

	JNB	SEQKEY, LoopRunNoKey	;je¿eli klawisz odpowiadaj¹cy masce w R6
						;nie jest naciœniêty

	ORL	AgrKey, A		;agreguj bit naciœniêtego klawisza do AgrKey

LoopRunNoKey:
	RL	A			;w nastêpnym obrocie pêtli wybierz nastêpny
	MOV	R6, A			;starszy wyœwietlacz - i zapamiêtaj to w R6

	CJNE	R7, #7, LoopRunCyfra	;je¿eli wyœwietlacz za³aduj cyfrê
	MOV	A, AgrKey		;wpr za³aduj do akumulatora stan klawiatury
	SJMP	LoopRunKeyInAcc	;i przeskocz ³adowanie cyfry

LoopRunCyfra:
	MOV	A, R7			;wskaŸnik wyœwietlacza z R7 do A

	MOV	DPTR, #WZORY	;adres wzorków do DPTR
	MOVC	A, @A+DPTR		;wzorek odpowiadaj¹cy R7 do A

LoopRunKeyInAcc:
	MOV	DPTR, #CSDB16	;adres zatrzasku wzorków do DPTR
	MOVX	@DPTR, A		;wzorek do zatrzasku

	CLR	SEGOFF		;w³¹cz wyœwietlacze

	INC	R7			;nastêpny, starszy wskaŸnik
	CJNE	R7, #8, LoopRun	;"8" w R7 oznacza miniêcie diod F1-ER

	MOV	A, AgrKey		;po obiegniêciu wszystkich wyœwietlaczy/klawiszy
					;sprawdzamy stan klawiatury

	JZ	LoopRunNewKey	;je¿eli nic nie jest naciœniête

LoopRunKey:
	CJNE	A, PrvKey, LoopRunNewKey	;je¿eli stan klawiatury siê zmieni³

	MOV	A, KeyCount		;je¿eli licznik powtórzeñ ma wartoœæ 0 to znaczy
	JZ	LoopIni		;¿e klawisz ju¿ wczeœniej zosta³ zauwa¿ony i obs³u¿ony

	DJNZ	KeyCount, LoopIni	;klawiatura mo¿e jeszcze nie byæ ustabilizowana
					;wiêc ponownie zacznij od najm³odszego wyœwietlacza

					;licznik powtórzeñ akurat osi¹gn¹³ wartoœæ 0
	CPL	LDTEST		;tutaj mo¿na regularnie obs³u¿yæ klawiaturê, w tym programie
					;ogranicza siê to wy³¹cznie do odwrócenia stanu diody TEST
	SJMP	LoopIni		;ponownie zacznij od najm³odszego wyœwietlacza

LoopRunNewKey:
	MOV	KeyCount, #7	;odnawiamy licznik powtórzeñ
	MOV	PrvKey, AgrKey	;zapamiêtuje "poprzedni" stan klawiatury
	SJMP	LoopIni		;ponownie zacznij od najm³odszego wyœwietlacza

WZORY:
	DB	00111111B, 00000110B, 01011011B, 01001111B	;0123
	DB	01100110B, 01101101B, 01111101B, 00000111B	;4567
	DB	01111111B, 01101111B, 01110111B, 01111100B	;89Ab
	DB	01011000B, 01011110B, 01111001B, 01110001B	;cdEF
