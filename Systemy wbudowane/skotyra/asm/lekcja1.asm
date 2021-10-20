; LEKCJA ASEMBLERA 8051
;	© 2013 S. Kotyra
; komentarze rozpoczynaj¹ siê znakiem ; (œrednik) i ci¹gn¹ siê do koñca wiersza

;kompilator DSM51ASS wymaga, by kod by³ pisany wielkimi literami
;operatorem modulo jest %
;dopuszczalne s¹ konstrukcje
;EQU	EQU 30H
;BIT	BIT 7FH
;instrukcje asemblera NIE mog¹ rozpoczynaæ siê w pierwszej kolumnie
;z regu³y poprzedzamy je znakiem tabulacji
;jako aplikacja 16 bitowa nie dzia³a na systemach 64 bitowych

;kompilator ASEMW dopuszcza u¿ywanie ma³ych i wielkich liter
;operatorem modulo jest MOD
;NIEDOPUSZCZALNE s¹ konstrukcje
;EQU	EQU 30H
;BIT	BIT 7FH
;instrukcje asemblera mog¹ rozpoczynaæ siê w pierwszej kolumnie
;jest to aplikacja 32 bitowa (dzia³a na systemach 64 bitowych)

;w przypadku DSM51ASS dobrze sprawdza siê ustawienie szerokoœci tabulacji na 6 znaków
;w przypadku ASEMW plik LST jest lepiej czytelny przy ustawieniu szerokoœci tabulacji na 8 znaków

$NOPAGING	;LST w ASEMW wygl¹da lepiej, niedopuszczalne dla DSM51ASS

;=======================================
;
;	TAK BÊDZIE WYGL¥DA£ POCZ¥TEK KA¯DEGO PROGRAMU
;

	ORG 0			;to jest dyrektywa kompilatora,
				;a nie instrukcja asemblera
				;kod zostanie umieszczony pod adresem 0 (RESET)
	LJMP START		;d³ugi skok do adresu/etykiety START
				;(przeskakujemy przez procedury obs³ugi przerwañ)

	ORG 100H		;kod zostanie umieszczony pod adresem 100H
START:				;etykieta

;=======================================
;
;	SPOSOBY ADRESOWANIA DANYCH
;

	MOV	31H, #98H	;do komórki pamiêci o adresie 31H
				;zostanie za³adowana wartoœæ (zzw) 98H
ADRES	EQU	30H		;od tej chwili zamiast liczby 30H
				;mo¿na u¿ywaæ napisu ADRES
	MOV	ADRES, #76H	;do komórki pamiêci o adresie ADRES (30H) zzw 76H
				;*ADRES = 0x76
	MOV	B, #54H		;do rejestru B zzw 54H // B = 0x54
	MOV	0F0H, #32H	;do rejestru B zzw 32H (zamiast nazwy B
				;mo¿na u¿yæ adresu 0F0H) // *(0xF0)=0x32
	MOV	A, B		;do akumulatora zzw rejestru B // A = B
	MOV	R0, ADRES	;do rejestru R0 zzw komórki o adresie ADRES // R0=*ADRES
	MOV	R0, #ADRES	;do rejestru R0 zzw ADRES // R0=ADRES
	MOV	A, R0		;do akumulatora zzw rejestru R0   // A=R0
	MOV	A, @R0		;do akumulatora zzw pamiêci RAM o adresie
				;przechowywanym przez rejestr R0 // A=*R0
				;(jako rejestry indeksowe mo¿na wykorzystaæ
				;tylko rejestry R0 i R1)
	MOV	A, #60H		;do akumulatora zzw 60H // A=0x60

	MOV	R7, B		;do rejestru R7 zzw rejestru B // R7=B
	MOV	R6, A		;do rejestru R6 zzw akumulatora // R6=A
	MOV	R5, 30H		;do rejestru R5 zzw komórki pamiêci RAM o adresie 30H // R5=*(0x30)
	MOV	R4, #60H	;do rejestru R4 zostanie za³adowana wartoœæ 60H // R4=0x60

	SETB	RS0		;wybiera pierwszy bank rejestrów R

	MOV	R7, #60H	;do rejestru R7 banku #1 zzw 30H
	MOV	R6, 30H		;do rejestru R6 banku #1 zzw komórki pamiêci RAM
				;o adresie 60H
	MOV	R5, A		;do rejestru R5 banku #1 zzw akumulatora
	MOV	R4, B		;do rejestru R4 banku #1 zzw rejestru B

	SETB	RS1		;wybiera trzeci bank rejestrów R

				;rejestry R mo¿na adresowaæ bezpoœrednio
	MOV	R7, 07H		;do rejestru R7 banku #3 zzw R7 banku #0
	MOV	R6, 06H		;do rejestru R7 banku #3 zzw R7 banku #0
	MOV	R5, 05H		;do rejestru R7 banku #3 zzw R7 banku #0
	MOV	R4, 04H		;do rejestru R7 banku #3 zzw R7 banku #0

	ANL	PSW, #11100111B	;wybiera #0 bank rejestrów R (zamiast CLR RS0, CLR RS1)

TUTAJ:

B3R7	EQU	24+7		;te obliczenia wykonywane s¹ na etapie kompilacji
B3R4	EQU	24+4		;
	MOV	B3R7, R4	;to te¿ jest adresowanie direct chocia¿ przez nazwê
	MOV	B3R7-1, R5	;
	MOV	B3R4+1, B3R7-1	;
	MOV	B3R4, #(B3R4+1)	;

	MOV	A, #0		;
	MOVC	A, @A+PC	;do akumulatora zzw spod adresu PC pamiêci programu
	MOV	A, #1
	MOV	DPTR, #TUTAJ	;³aduje adres etykiety TUTAJ do rejestru DPTR
	MOVC	A, @A+DPTR	;do akulumatora zzw spod adresu 1 + TUTAJ
				;pamiêci programu

	MOV	DPTR, #0010H	;adres w zewnêtrznej pamiêci RAM
	MOVX	A, @DPTR	;za³aduj do akumulatora spod tego adresu

	MOV	R1, #ADRES	;do R1 zzw ADRES
	XCH	A, @R1		;zamiana zawartoœci akumulatora i wewnêtrznej pamiêci RAM
				;o adresie przechowywanym przez rejestr indeksowy R1
	MOV	A, #1BH		;do akumulatora zzw 255
	XCHD	A, @R1		;tak jak XCH ale wy³¹cznie dla m³odszych 4 bitów

;=======================================
;
;	OBS£UGA STOSU
;
				;SWAP przez stos
	PUSH	B		;wysy³a rejestr B na stos
	PUSH	ACC		;wysy³a akumulator ACC na stos
	POP	0F0H		;zdejmuje wartoœæ ze stosu do rejestru B
	POP	0E0H		;zdejmuje akumulator
				;(osi¹gniêto zamianê wartoœci rejestrów A i B)

	POP	ACC		;TO JEST POWA¯NY B£¥D (POP bez PUSHa)
				;WCHODZI W OBSZAR BANKU #0 I PUSH POPSUJE R7
	MOV	SP, #07H	;"naprawa" SP (wskaŸnika stosu)

	MOV	DPTR, #3210H
	PUSH	DPL		;operacje na stosie s¹ oœmiobitowe
	PUSH	DPH		;nie mo¿na wys³aæ PUSH DPTR a potem zdj¹æ POP DPTR
	MOV	DPTR, #4321H
	POP	DPH		;zdejmowanie zawsze w kolejnoœci
	POP	DPL		;odwrotnej do wysy³ania

;=======================================
;
;	WYWO£ANIA FUNKCJI TE¯ MODYFIKUJ¥ STOS
;

	LCALL	FUNKCJA		;wywo³anie przez adres 16-bitowy
	ACALL	FUNKCJA + 1	;wywo³anie w obrêbie strony 2kB (adres 11 bitowy)

;=======================================
;
;	SKOKI BEZWARUNKOWE
;

	LJMP	FUNKCJA + 3	;skok pod adres 16-bitowy
	SJMP	FUNKCJA + 5	;wzglêdny skok do adresu wyliczonego przez kompilator

FUNKCJA:			;
	NOP			;to nie jest szczególnie skomplikowana funkcja
	NOP			;
	RET			;ka¿da funkcja koñczy siê instrukcj¹ RET

	AJMP	FUNKCJA - 2	;skok w obrêbie strony 2kB (adres 11-bitowy)

	MOV	A, #01H
	MOV	DPL, #(DPTRJMP MOD 256)
	MOV	DPH, #(DPTRJMP / 256)
	JMP	@A+DPTR		;skok do adresu bêd¹cego sum¹ akumulatora i DPTR
	NOP

DPTRJMP:
	NOP

;=======================================
;
;	OPERACJE NA BITACH
;

	MOV	2FH, #0		;³atwiej przeœledziæ dzia³anie kodu dalej
_BIT	BIT 7FH			;deklaracja bitu w przestrzeni RAM adresowanej bitowo
	SETB	_BIT		;ustawia bit BIT
	MOV	C, _BIT		;³aduje wartoœæ bitu BIT do akumulatora bitowego C/CY
	CPL	C		;neguje (odwraca) wartoœæ bitu C
	ANL	C, _BIT		;iloczyn logiczny na bitach
	ORL	C, _BIT		;suma logiczna
	ANL	C, /_BIT	;iloczyn logiczny C/CY z negacj¹ bitu BIT
	ORL	C, /CY		;suma logiczna bitu C/CY z negacj¹ samego siebie
	CLR	PSW.7		;wyzerowanie/skasowanie bitu C/CY jako PSW.7
	MOV	2FH.7, C	;to te¿ jest bit 7FH tylko zaadresowany bezwzglednie
	CPL	0D0H.7		;a to jest bit C/CY zaadresowany bezwzglednie

	MOV	A, #11110000B
	SWAP	A		;zamienia miejscami 4 m³odsze i 4 starsze bity
	MOV	A, #11111111B
	CLR	A		;zeruje zawartoœæ akumulatora
	MOV	A, #01010101B
	CPL	A		;neguje akumulator bitowo
	MOV	A, #11101101B
	RR	A		;bitowy obrót akumulatora w prawo
	RR	A
	RL	A		;bitowy obrót akumulatora w lewo
	RL	A
	CLR	C
	RRC	A		;bitowy obrót akumulatora w prawo przez CY
	RRC	A
	RLC	A		;bitowy obrót akumulatora w lewo przez CY
	RLC	A

;=======================================
;
;	SKOKI UWARUNKOWANE STANEM BITÓW
;

	JB	_BIT, JBBIT	;jump bit
	CPL	_BIT
	JB	_BIT, JBBIT	;je¿eli ustawiony jest BIT skocz do JBBIT
	NOP
	NOP
JBBIT:
	JNB	CY, JNBCY	;jump no bit
	CPL	C
	JNB	CY, JNBCY	;je¿eli skasowany jest bit (w tym przypadku CY) skocz do JNBC
	NOP
	NOP
JNBCY:
	JC	JNOCY		;jump carry, jump no carry
	JNC	JNOCY		;poniewa¿ C jest czêsto wykorzystywane wiêc mo¿na ³atwiej
	NOP
	NOP
JNOCY:
	SETB	F0		;bit flagowy do swobodnego wykorzystania
	JBC	F0, JBCF0	;if bit clear and jump
	NOP			;jesli ustawiony F0 skasuj i skocz
	NOP
JBCF0:

;=======================================
;
;	SKOKI UWARUNKOWANE STANEM AKUMULATORA
;

	MOV	A, #0
	JNZ	JAZERO		;jump no zero (ACC != 0)
	NOP
	JZ	JAZERO		;jump zero (ACC == 0)
	NOP
	NOP
JAZERO:

;=======================================
;
;	ITERACJA POWTARZANA ŒCIŒLE OKREŒLONA LICZBÊ RAZY
;

	;MOV	1FH, #03H	;dzia³a na bajcie adresowanym w dowolny sposób
	MOV	B, #03H		;ale na rejestrze B bêdzie ³atwiej pokazaæ
LOOPSTART:
	CPL	CY		;tylko po to ¿eby coœ dzia³o siê w pêtli
	DJNZ	B, LOOPSTART	;decrement jump no zero
				;odpowiednik  do {...} while( --B );  w jêzyku C
	NOP

;=======================================
;
;	PORÓWNYWANIE WARTOŒCI
;

	MOV	A, #20H		;compare jump not equal
	CJNE	A, #20H, ANE20H	;poniewa¿ jest równe wiêc nie skoczy
	CJNE	A, #40H, ANE40H	;nie jest równe wiêc skoczy
ANE40H:
	NOP			;CY=1
	CJNE	A, #10H, ANE10H	;nie jest równe wiêc skoczy
ANE10H:
	NOP			;CY=0
ANE20H:

;=======================================
;
;	OPERACJE LOGICZNE
;
;   swobodne adresowanie!
	MOV	A, #01010000B	;¿eby by³o na czym æwiczyæ
	MOV	B, #11111100B	;"	"	"	"	"
	ANL	A, B		; #01010000
	ORL	A, B		; #11111100
	MOV	A, #01010000B
	XRL	A, B		; #10101100

;=======================================
;
;	OPERACJE ARYTMETYCZNE
;
;

	INC	A		;inkrementacjê (zwiekszenie o 1)
	INC	B		;mo¿na wykonaæ
	INC	R0		;na rejestrach
	INC	01H		;na pamiêci adresowanej bezpoœrednio
	INC	@R0		;na pamiêci adresowanej poœrednio rejestrem indeksowym
	INC	DPTR		;na 16bitowym rejestrze DPTR

	DEC	@R0		;dekrementacji nie mo¿na wykonaæ na DPTR
	DEC	01H		;ale we wszystkich pozosta³ych przypadkach
	DEC	R0		;DEC mo¿na u¿ywaæ tak jak INC
	DEC	B
	DEC	A

;	;	;	;pozosta³e operacje arytmetyczne wykonywane s¹ na akumulatorze
;	;	;	;albo na parze akumulator i rejestr B
;	;	;	;operacje te wp³ywaj¹ na stan bitów CY, AC i OV

	MOV	A, #2FH		;zaczynamy od AC
	ADD	A, #01H		;zwyk³e dodawanie z przeniesieniem z bitu 3 na 4 (flaga AC)

	SETB	C
	CLR	AC		;inaczej nie bedzie widaæ ustawienia flagi AC
	SUBB	A, #00		;odejmowanie z po¿yczk¹ z bitu 4

	SETB	C
	CLR	AC		;inaczej nie bedzie widaæ ustawienia flagi AC
	ADDC	A, #00		;poprzednie dodawanie nie zwa¿a³o na C/CY, a to owszem

	CLR	AC		;inaczej nie bêdzie widaæ ustawienia flagi AC
	MOV	A, #39H
	ADD	A, #18H

	CLR	AC		;inaczej nie bêdzie widaæ ustawienia flagi AC
	MOV	A, #38H
	SUBB	A, #19H		;dlaczego tutaj C nie mo¿e zak³óciæ odejmowania?

				;teraz C/CY
	MOV	A, #0F7H	;247
	ADD	A, #026H	;+38 = 285 % 256 = 29 ( 1D h )
	JNC	NOCARRY
	INC	B
NOCARRY:
	CLR	C
	SUBB	A, #1EH

				;teraz OV
	MOV	A, #77H		;119				77h
	ADD	A, #11H		;+17 = 136 > 127	 +11h = 88h > 7Fh

	CLR	OV		;inaczej nie bêdzie widaæ reakcji OV na odejmowanie
	MOV	A, #88H		;136
	SUBB	A, #22H		;-34 = 102 < 128

	MOV	A, #15		;mno¿enie
	MOV	B, #17
	MUL	AB

	MOV	A, #16
	MOV	B, #16
	MUL	AB

	MOV	A, #251		;dzielenie
	MOV	B, #16
	DIV	AB

	MOV	A, #251		;OV przy dzieleniu
	MOV	B, #0
	DIV	AB

				;poprawka/korekta dziesiêtna
	MOV	A, #26H
	ADD	A, #19H
	DA	A
	ADD	A, #56H
	DA	A

	MOV   A, #10H
	ADD   A, #02H
	DA	A
	MOV	A, #09H
	ADD	A, #09H
	DA	A

	MOV	A, #0CH
	DA	A
	DA	A
	SETB	AC
	DA	A
	CLR	AC
	DA	A

;
;=======================================
;
	NOP
	SJMP	$

	END
;	KONIEC LEKCJI
