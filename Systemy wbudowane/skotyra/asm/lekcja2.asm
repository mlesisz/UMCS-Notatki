;=======================================
;
;	ASEMBLER 8051
;	STRUKTURY STERUJ�CE
;	� 2013 S. Kotyra
;
$NOPAGING

;=======================================
;	deklaracje specyficzne dla DSM-51
WRITE_DATA	EQU 8102H	;procedura z ROM DSM
CSDB		EQU 38H		;adres bufora segment�w
CSDS		EQU 30H		;adres bufora wy�wietlaczy
;=======================================


	ORG	0
	LJMP	START

	ORG	100H

;=======================================
;IF( A == B )	//	a EQual b

START:

	MOV	A, #10H
	MOV	B, #20H

	CJNE	A, B, aEQb_ELSE	;if( a == b )
	ACALL	OK_ON		;	OK_ON();
	SJMP	aEQb_END
aEQb_ELSE:			;else
	ACALL	ERR_ON		;	ERR_ON();
aEQb_END:
	SJMP	$

;=======================================
;IF( A != B )	//	a Not Equal b

	MOV	A, #10H
	MOV	B, #20H

	CJNE	A, B, aNEb_IF	;if( a != b )
	SJMP	aNEb_ELSE
aNEb_IF:			; a != b
	ACALL	OK_ON		;	OK_ON();
	SJMP	aNEb_END
aNEb_ELSE:			;else
	ACALL	ERR_ON		;	ERR_ON();
aNEb_END:
	SJMP	$

;=======================================
;IF( A < B )	//	a Less Then b

	MOV	A, #10H
	MOV	B, #20H

;	CJNE	A, B, aLTb_TEST_CY;if( a < b )
;aLTb_TEST_CY:
	CJNE	A, B, $+3	;if( a < b )
	JC	aLTb_IF
	SJMP	aLTb_ELSE
aLTb_IF:			; a < b
	ACALL	OK_ON		;	OK_ON();
	SJMP	aLTb_END
aLTb_ELSE:			;else
	ACALL	ERR_ON		;	ERR_ON();
aLTb_END:
	SJMP	$

;=======================================
;IF( A > B )	//	a Greater Then b

	MOV	A, #10H
	MOV	B, #20H

	CJNE	A, B, aGTb_TEST_CY;if( a > b )
	SJMP	aGTb_ELSE
aGTb_TEST_CY:
	JC	aGTb_ELSE
aGTb_IF:			; a > b
	ACALL	OK_ON		;	OK_ON();
	SJMP	aGTb_END
aGTb_ELSE:			;else
	ACALL	ERR_ON		;	ERR_ON();
aGTb_END:
	SJMP	$

;=======================================
;IF( A <= B )	//	a Less or Equal b

	MOV	A, #10H
	MOV	B, #20H

	CJNE	A, B, aLEb_TEST_CY;if( a <= b )
	SJMP	aLEb_IF
aLEb_TEST_CY:
	JNC	aLEb_ELSE
aLEb_IF:		 	; a <= b
	ACALL	OK_ON		;	OK_ON();
	SJMP	aLEb_END
aLEb_ELSE:			;else
	ACALL	ERR_ON		;	ERR_ON();
aLEb_END:
	SJMP	$

;=======================================
;IF( A >= B )	//	a Greater or Equal b

	MOV	A, #10H
	MOV	B, #20H

;	CJNE	A, B, aGEb_TEST_CY;if( a >= b )
;aGEb_TEST_CY:
	CJNE	A, B, $+3	;if( a >= b )
	JC	aGEb_ELSE
aGEb_IF:			; a >= b
	ACALL	OK_ON		;	OK_ON();
	SJMP	aGEb_END
aGEb_ELSE:	 		;else
	ACALL ERR_ON		;	ERR_ON();
aGEb_END:
	SJMP	$


;=======================================
;FOR( A = 0; A < B; A++ )

	MOV	A, #00H
	MOV	B, #05H

FORaLTbLOOP:
	CJNE	A, B, $+3
	JNC	FORaLTbEND
	ACALL	BLINK_LED
	INC	A
	SJMP	FORaLTbLOOP
FORaLTbEND:
	SJMP	$

;=======================================
;WHILE( A >= B )

	MOV	A, #10
	MOV	B, #05

WHILEaGTbLOOP:
	CJNE	A, B, $+3
WHILEaGTbNE:
	JC	WHILEaGTbEND
	ACALL	BLINK_LED
	DEC	A
	SJMP	WHILEaGTbLOOP
WHILEaGTbEND:
	LJMP	STOP_LED

;=======================================
;	PRZYK�AD REKURENCJI
;Zadanie: w rejestrze A mamy liczb� o�miobitow�, kt�ra zapisana w systemie dziesi�tnym
;mo�e mie� d�ugo�� od 1 do 3 cyfr. Nale�y wy�wietli� j� na wy�wietlaczu LCD na mo�liwie
;najmniejszej liczbie pozycji poprzedzaj�c pojedyncz� spacj�.
;Idea rozwi�zania: przyjmijmy, �e A przechowuje warto�� 234. Do B �adujemy warto�� 10.
;W wyniku dzielenia DIV AB w rejestrze A uzyskujemy wynik dzielenia, a w B reszt�.
;W naszym przypadku A = 23, B = 4. Nie mo�emy jeszcze wy�wietli� B
;poniewa� znajduje si� ono na ostatniej pozycji. Wysy�amy B na stos i powtarzamy
;dzielenie tym razem 23 / 10. Uzyskujemy A = 2, B = 3. Wysy�amy B na stos.
;Je�eli nast�pnym razem podzielimy 2 / 3, da to A = 0, B = 3.
;A = 0 jest sygna�em doj�cia do szczytu procedury rekurencyjnej.
;Wracaj�c wy�wietlamy odzyskiwane ze stosu kolejne warto�ci B.

REKURENCJA:
	MOV	A, #234 	;warto�� do wy�wietlenia
	JZ	NO_REKUR	;ten przypdek trzeba potraktowa� indywidualnie
	ACALL	REKUR		;przypadek typowy - pocz�tek procedury rekurencyjnej
	SJMP $			;na koniec trzeba zatrzyma� / zawiesi� program

NO_REKUR:			;wy�wietlanie samego zera
	MOV	A, #' '		;spacja do akumulatora
	LCALL	WRITE_DATA	;wy�wietl
	MOV	A, #'0'		;'0' do akumulatora
	LCALL	WRITE_DATA	;wy�wietl
	SJMP	$		;na koniec trzeba zatrzyma� / zawiesi� program

REKUR:
	JZ	REKUR_SPACJA	;czy ju� szczyt procedury rekurencyjnej? je�eli tak wy�wietl spacj�
	MOV	B, #10		;je�eli nie
	DIV	AB		;to dzielimy
	PUSH	B		;i B na stos
	ACALL	REKUR		;a ACC dzielimy rekurencyjnie dalej
	POP	ACC		;zdejmujemy w odwrotnej kolejno�ci ze stosu
	ADD	A, #48		;zamieniamy liczb� 0.. 9 na kod ASCII 48.. 57 ('0'.. '9')
	LCALL	WRITE_DATA	;wy�wietlamy na LCD
	RET			;powr�t

REKUR_SPACJA:
	MOV	A, #' '		;spacja do akumulatora
	LCALL	WRITE_DATA	;wy�wietl
	RET

;=======================================
;
;	BLINK_LED
;
BLINK_LED:
	SETB	P1.7		;wy��cza diod�
	MOV	DPTR, #00H	;maksymalnie d�ugi czas do odmierzenia
				;na liczniku 16 bitowym
LOOP_OFF:
	NOP			;przed�u�a czas
	NOP			;wykonywania p�tli
	DJNZ	DPL, LOOP_OFF	;p�tla wewn�trzna
	DJNZ	DPH, LOOP_OFF	;p�tla zewn�trzna
	CLR	P1.7		;w��cza diod�
	CLR	P1.5		;w��cza gwizdek
	DJNZ	DPL, $		;kr�tkie op�nienie
	SETB	P1.5		;wy��cza gwizdek
LOOP_ON:
	NOP			;przed�u�a czas
	NOP			;wykonywania p�tli
	DJNZ	DPL, LOOP_ON	;p�tla wewn�trzna
	DJNZ	DPH, LOOP_ON	;p�tla zewn�trzna
	SETB	P1.7		;wy��cza diod�
	RET

;=======================================
;	OK_ON / ERR_ON
;
;	zapala zielon� diod� OK albo czerwon� diod� ERR
;
OK_ON:
	MOV	A, #10H;	;czwarty bit odpowiada zielonej diodzie OK
	SJMP	OK_ERR_COMM

ERR_ON:
	MOV	A, #20H;	;pi�ty bit odpowiada czerwonej diodzie ERR

OK_ERR_COMM:
	MOV	R0, #CSDB	;bufor danych
	MOVX	@R0, A		;ustaw bit OK albo ERR
	MOV	A, #40H		;bit diod F1..F4, OK, ERR
	MOV	R0, #CSDS	;wyb�r wy�wietlacza
	MOVX	@R0, A		;wybierz
	CLR	P1.6		;w��cz
	RET

;=======================================
;	STOP_LED
;
;	wy�wietla napis STOP na wy�wietlaczu LED
;
STOP_LED:
	MOV	R0, #CSDB	;bufor danych wy�wietlacza LED
	MOV	R1, #CSDS	;bufor wyboru wy�wietlacza wy�wietlacza LED
	MOV	DPTR, #STOP_WZORKI-1	;adres wzorkow w DPTR

STOP_LED_OUTER_LOOP:
	MOV	A, #04H		;warto�ci inicjuj�ce
	MOV	B, #10H		;

STOP_LED_IL:
	PUSH	ACC			;zabezpiecza akumulator
	SETB	P1.6			;wy��cza wy�wietlacz
	MOVC	A, @A+DPTR		;�aduje wzorek
	MOVX	@R0, A			;wysy�a wzorek do bufora danych
	MOV	A, B			;pobiera wska�nik wy�wietlacza
	MOVX	@R1, A			;wybiera wy�wietlacz
	CLR	P1.6			;w��cza wy�wietlacz
	RR	A			;przesuwa wy�wietlacz w prawo
	MOV	B, A			;zapami�tuje dla nast�pego obrotu
	POP	ACC			;odzyskuje akumulator
	DJNZ	ACC, STOP_LED_IL	;je�eli nie wy�wietli� wszystkich 4 liter
	SJMP	STOP_LED_OUTER_LOOP	;przywraca warto�ci inicjuj�ce

STOP_WZORKI:
	;	P		O		T		S
	DB	1110011B,	0111111B,	0110001B,	1101101B

	END