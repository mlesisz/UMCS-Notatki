; LEKCJA ASEMBLERA 8051
;	� 2013 S. Kotyra
; komentarze rozpoczynaj� si� znakiem ; (�rednik) i ci�gn� si� do ko�ca wiersza

;kompilator DSM51ASS wymaga, by kod by� pisany wielkimi literami
;operatorem modulo jest %
;dopuszczalne s� konstrukcje
;EQU	EQU 30H
;BIT	BIT 7FH
;instrukcje asemblera NIE mog� rozpoczyna� si� w pierwszej kolumnie
;z regu�y poprzedzamy je znakiem tabulacji
;jako aplikacja 16 bitowa nie dzia�a na systemach 64 bitowych

;kompilator ASEMW dopuszcza u�ywanie ma�ych i wielkich liter
;operatorem modulo jest MOD
;NIEDOPUSZCZALNE s� konstrukcje
;EQU	EQU 30H
;BIT	BIT 7FH
;instrukcje asemblera mog� rozpoczyna� si� w pierwszej kolumnie
;jest to aplikacja 32 bitowa (dzia�a na systemach 64 bitowych)

;w przypadku DSM51ASS dobrze sprawdza si� ustawienie szeroko�ci tabulacji na 6 znak�w
;w przypadku ASEMW plik LST jest lepiej czytelny przy ustawieniu szeroko�ci tabulacji na 8 znak�w

$NOPAGING	;LST w ASEMW wygl�da lepiej, niedopuszczalne dla DSM51ASS

;=======================================
;
;	TAK B�DZIE WYGL�DA� POCZ�TEK KA�DEGO PROGRAMU
;

	ORG 0			;to jest dyrektywa kompilatora,
				;a nie instrukcja asemblera
				;kod zostanie umieszczony pod adresem 0 (RESET)
	LJMP START		;d�ugi skok do adresu/etykiety START
				;(przeskakujemy przez procedury obs�ugi przerwa�)

	ORG 100H		;kod zostanie umieszczony pod adresem 100H
START:				;etykieta

;=======================================
;
;	SPOSOBY ADRESOWANIA DANYCH
;

	MOV	31H, #98H	;do kom�rki pami�ci o adresie 31H
				;zostanie za�adowana warto�� (zzw) 98H
ADRES	EQU	30H		;od tej chwili zamiast liczby 30H
				;mo�na u�ywa� napisu ADRES
	MOV	ADRES, #76H	;do kom�rki pami�ci o adresie ADRES (30H) zzw 76H
				;*ADRES = 0x76
	MOV	B, #54H		;do rejestru B zzw 54H // B = 0x54
	MOV	0F0H, #32H	;do rejestru B zzw 32H (zamiast nazwy B
				;mo�na u�y� adresu 0F0H) // *(0xF0)=0x32
	MOV	A, B		;do akumulatora zzw rejestru B // A = B
	MOV	R0, ADRES	;do rejestru R0 zzw kom�rki o adresie ADRES // R0=*ADRES
	MOV	R0, #ADRES	;do rejestru R0 zzw ADRES // R0=ADRES
	MOV	A, R0		;do akumulatora zzw rejestru R0   // A=R0
	MOV	A, @R0		;do akumulatora zzw pami�ci RAM o adresie
				;przechowywanym przez rejestr R0 // A=*R0
				;(jako rejestry indeksowe mo�na wykorzysta�
				;tylko rejestry R0 i R1)
	MOV	A, #60H		;do akumulatora zzw 60H // A=0x60

	MOV	R7, B		;do rejestru R7 zzw rejestru B // R7=B
	MOV	R6, A		;do rejestru R6 zzw akumulatora // R6=A
	MOV	R5, 30H		;do rejestru R5 zzw kom�rki pami�ci RAM o adresie 30H // R5=*(0x30)
	MOV	R4, #60H	;do rejestru R4 zostanie za�adowana warto�� 60H // R4=0x60

	SETB	RS0		;wybiera pierwszy bank rejestr�w R

	MOV	R7, #60H	;do rejestru R7 banku #1 zzw 30H
	MOV	R6, 30H		;do rejestru R6 banku #1 zzw kom�rki pami�ci RAM
				;o adresie 60H
	MOV	R5, A		;do rejestru R5 banku #1 zzw akumulatora
	MOV	R4, B		;do rejestru R4 banku #1 zzw rejestru B

	SETB	RS1		;wybiera trzeci bank rejestr�w R

				;rejestry R mo�na adresowa� bezpo�rednio
	MOV	R7, 07H		;do rejestru R7 banku #3 zzw R7 banku #0
	MOV	R6, 06H		;do rejestru R7 banku #3 zzw R7 banku #0
	MOV	R5, 05H		;do rejestru R7 banku #3 zzw R7 banku #0
	MOV	R4, 04H		;do rejestru R7 banku #3 zzw R7 banku #0

	ANL	PSW, #11100111B	;wybiera #0 bank rejestr�w R (zamiast CLR RS0, CLR RS1)

TUTAJ:

B3R7	EQU	24+7		;te obliczenia wykonywane s� na etapie kompilacji
B3R4	EQU	24+4		;
	MOV	B3R7, R4	;to te� jest adresowanie direct chocia� przez nazw�
	MOV	B3R7-1, R5	;
	MOV	B3R4+1, B3R7-1	;
	MOV	B3R4, #(B3R4+1)	;

	MOV	A, #0		;
	MOVC	A, @A+PC	;do akumulatora zzw spod adresu PC pami�ci programu
	MOV	A, #1
	MOV	DPTR, #TUTAJ	;�aduje adres etykiety TUTAJ do rejestru DPTR
	MOVC	A, @A+DPTR	;do akulumatora zzw spod adresu 1 + TUTAJ
				;pami�ci programu

	MOV	DPTR, #0010H	;adres w zewn�trznej pami�ci RAM
	MOVX	A, @DPTR	;za�aduj do akumulatora spod tego adresu

	MOV	R1, #ADRES	;do R1 zzw ADRES
	XCH	A, @R1		;zamiana zawarto�ci akumulatora i wewn�trznej pami�ci RAM
				;o adresie przechowywanym przez rejestr indeksowy R1
	MOV	A, #1BH		;do akumulatora zzw 255
	XCHD	A, @R1		;tak jak XCH ale wy��cznie dla m�odszych 4 bit�w

;=======================================
;
;	OBS�UGA STOSU
;
				;SWAP przez stos
	PUSH	B		;wysy�a rejestr B na stos
	PUSH	ACC		;wysy�a akumulator ACC na stos
	POP	0F0H		;zdejmuje warto�� ze stosu do rejestru B
	POP	0E0H		;zdejmuje akumulator
				;(osi�gni�to zamian� warto�ci rejestr�w A i B)

	POP	ACC		;TO JEST POWA�NY B��D (POP bez PUSHa)
				;WCHODZI W OBSZAR BANKU #0 I PUSH POPSUJE R7
	MOV	SP, #07H	;"naprawa" SP (wska�nika stosu)

	MOV	DPTR, #3210H
	PUSH	DPL		;operacje na stosie s� o�miobitowe
	PUSH	DPH		;nie mo�na wys�a� PUSH DPTR a potem zdj�� POP DPTR
	MOV	DPTR, #4321H
	POP	DPH		;zdejmowanie zawsze w kolejno�ci
	POP	DPL		;odwrotnej do wysy�ania

;=======================================
;
;	WYWO�ANIA FUNKCJI TE� MODYFIKUJ� STOS
;

	LCALL	FUNKCJA		;wywo�anie przez adres 16-bitowy
	ACALL	FUNKCJA + 1	;wywo�anie w obr�bie strony 2kB (adres 11 bitowy)

;=======================================
;
;	SKOKI BEZWARUNKOWE
;

	LJMP	FUNKCJA + 3	;skok pod adres 16-bitowy
	SJMP	FUNKCJA + 5	;wzgl�dny skok do adresu wyliczonego przez kompilator

FUNKCJA:			;
	NOP			;to nie jest szczeg�lnie skomplikowana funkcja
	NOP			;
	RET			;ka�da funkcja ko�czy si� instrukcj� RET

	AJMP	FUNKCJA - 2	;skok w obr�bie strony 2kB (adres 11-bitowy)

	MOV	A, #01H
	MOV	DPL, #(DPTRJMP MOD 256)
	MOV	DPH, #(DPTRJMP / 256)
	JMP	@A+DPTR		;skok do adresu b�d�cego sum� akumulatora i DPTR
	NOP

DPTRJMP:
	NOP

;=======================================
;
;	OPERACJE NA BITACH
;

	MOV	2FH, #0		;�atwiej prze�ledzi� dzia�anie kodu dalej
_BIT	BIT 7FH			;deklaracja bitu w przestrzeni RAM adresowanej bitowo
	SETB	_BIT		;ustawia bit BIT
	MOV	C, _BIT		;�aduje warto�� bitu BIT do akumulatora bitowego C/CY
	CPL	C		;neguje (odwraca) warto�� bitu C
	ANL	C, _BIT		;iloczyn logiczny na bitach
	ORL	C, _BIT		;suma logiczna
	ANL	C, /_BIT	;iloczyn logiczny C/CY z negacj� bitu BIT
	ORL	C, /CY		;suma logiczna bitu C/CY z negacj� samego siebie
	CLR	PSW.7		;wyzerowanie/skasowanie bitu C/CY jako PSW.7
	MOV	2FH.7, C	;to te� jest bit 7FH tylko zaadresowany bezwzglednie
	CPL	0D0H.7		;a to jest bit C/CY zaadresowany bezwzglednie

	MOV	A, #11110000B
	SWAP	A		;zamienia miejscami 4 m�odsze i 4 starsze bity
	MOV	A, #11111111B
	CLR	A		;zeruje zawarto�� akumulatora
	MOV	A, #01010101B
	CPL	A		;neguje akumulator bitowo
	MOV	A, #11101101B
	RR	A		;bitowy obr�t akumulatora w prawo
	RR	A
	RL	A		;bitowy obr�t akumulatora w lewo
	RL	A
	CLR	C
	RRC	A		;bitowy obr�t akumulatora w prawo przez CY
	RRC	A
	RLC	A		;bitowy obr�t akumulatora w lewo przez CY
	RLC	A

;=======================================
;
;	SKOKI UWARUNKOWANE STANEM BIT�W
;

	JB	_BIT, JBBIT	;jump bit
	CPL	_BIT
	JB	_BIT, JBBIT	;je�eli ustawiony jest BIT skocz do JBBIT
	NOP
	NOP
JBBIT:
	JNB	CY, JNBCY	;jump no bit
	CPL	C
	JNB	CY, JNBCY	;je�eli skasowany jest bit (w tym przypadku CY) skocz do JNBC
	NOP
	NOP
JNBCY:
	JC	JNOCY		;jump carry, jump no carry
	JNC	JNOCY		;poniewa� C jest cz�sto wykorzystywane wi�c mo�na �atwiej
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
;	ITERACJA POWTARZANA �CI�LE OKRE�LONA LICZB� RAZY
;

	;MOV	1FH, #03H	;dzia�a na bajcie adresowanym w dowolny spos�b
	MOV	B, #03H		;ale na rejestrze B b�dzie �atwiej pokaza�
LOOPSTART:
	CPL	CY		;tylko po to �eby co� dzia�o si� w p�tli
	DJNZ	B, LOOPSTART	;decrement jump no zero
				;odpowiednik  do {...} while( --B );  w j�zyku C
	NOP

;=======================================
;
;	POR�WNYWANIE WARTO�CI
;

	MOV	A, #20H		;compare jump not equal
	CJNE	A, #20H, ANE20H	;poniewa� jest r�wne wi�c nie skoczy
	CJNE	A, #40H, ANE40H	;nie jest r�wne wi�c skoczy
ANE40H:
	NOP			;CY=1
	CJNE	A, #10H, ANE10H	;nie jest r�wne wi�c skoczy
ANE10H:
	NOP			;CY=0
ANE20H:

;=======================================
;
;	OPERACJE LOGICZNE
;
;   swobodne adresowanie!
	MOV	A, #01010000B	;�eby by�o na czym �wiczy�
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

	INC	A		;inkrementacj� (zwiekszenie o 1)
	INC	B		;mo�na wykona�
	INC	R0		;na rejestrach
	INC	01H		;na pami�ci adresowanej bezpo�rednio
	INC	@R0		;na pami�ci adresowanej po�rednio rejestrem indeksowym
	INC	DPTR		;na 16bitowym rejestrze DPTR

	DEC	@R0		;dekrementacji nie mo�na wykona� na DPTR
	DEC	01H		;ale we wszystkich pozosta�ych przypadkach
	DEC	R0		;DEC mo�na u�ywa� tak jak INC
	DEC	B
	DEC	A

;	;	;	;pozosta�e operacje arytmetyczne wykonywane s� na akumulatorze
;	;	;	;albo na parze akumulator i rejestr B
;	;	;	;operacje te wp�ywaj� na stan bit�w CY, AC i OV

	MOV	A, #2FH		;zaczynamy od AC
	ADD	A, #01H		;zwyk�e dodawanie z przeniesieniem z bitu 3 na 4 (flaga AC)

	SETB	C
	CLR	AC		;inaczej nie bedzie wida� ustawienia flagi AC
	SUBB	A, #00		;odejmowanie z po�yczk� z bitu 4

	SETB	C
	CLR	AC		;inaczej nie bedzie wida� ustawienia flagi AC
	ADDC	A, #00		;poprzednie dodawanie nie zwa�a�o na C/CY, a to owszem

	CLR	AC		;inaczej nie b�dzie wida� ustawienia flagi AC
	MOV	A, #39H
	ADD	A, #18H

	CLR	AC		;inaczej nie b�dzie wida� ustawienia flagi AC
	MOV	A, #38H
	SUBB	A, #19H		;dlaczego tutaj C nie mo�e zak��ci� odejmowania?

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

	CLR	OV		;inaczej nie b�dzie wida� reakcji OV na odejmowanie
	MOV	A, #88H		;136
	SUBB	A, #22H		;-34 = 102 < 128

	MOV	A, #15		;mno�enie
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

				;poprawka/korekta dziesi�tna
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
