;ustawiæ tabulacjê na 6 znaków

;æwiczenie 20

;w CSDB zatrzaskiwany jest wzorek zapalaj¹cy wszystkie segmenty ("8" z kropk¹)
;w CSDS "grzebieñ bitowy" w³¹czaj¹cy wszystkie wyœwietlacze

CSDS16	EQU	0FF30H	;adres zatrzasku wyboru wskaŸnika/wyœwietlacza
CSDB16	EQU	0FF38H	;adres zatrzasku wzorków na wskaŸniku/wyœwietlaczu

SEGOFF	EQU	P1.6	;w³¹cza (0) / wy³¹cza (1) wyœwietlacze 7S
LDTEST	EQU	P1.7	;w³¹cza (0) / wy³¹cza (1) diodê TEST
SEQKEY	EQU	P3.5	;testuje naciœniêcie (1) klawisza KSQ

KeyCount	EQU	7Ah	;zlicza powtórzenia klawisza

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

	MOV	DPTR, #CSDB16	;adres zatrzasku wzorków do DPTR
	MOV	A, #11111111B	;wyœwietli wszystkie segmenty ("8" z kropk¹)
	MOVX	@DPTR, A		;wzorek do zatrzasku

	MOV	DPTR, #CSDS16	;adres zatrzasku wzorków do DPTR
	MOV	A, #00111111B	;wybierze wszystkie wyœwietlacze
	MOVX	@DPTR, A		;wybierz wyœwietlacze

LoopKey:

	MOV	7Eh, #2			;wykonanie tej pêtli trwa oko³o 1ms
	MOV	7Fh, #204			;w ten prosty i niezbyt dok³adny sposób
LoopKeyWait1ms:				;zast¹pimy oczekianie na przerwanie zegarowe
	DJNZ	7Fh, LoopKeyWait1ms	;mo¿na ten kod wykorzystaæ do celów testowych
	DJNZ	7Eh, LoopKeyWait1ms	;ale nie nadaje siê do prawdziwego zegarka

	MOV	C, SEQKEY		;stan klawiatury do Carry
	JNC	LoopKeyNoKey	;nie naciœniêto klawisza

	MOV	A, KeyCount       ;tutaj jeœli jest naciœniêty klawisz
	JZ	LoopKey		;klawisz ju¿ wczeœniej zosta³ zauwa¿ony

	DJNZ	KeyCount, LoopKey	;za ma³a liczba powtórzeñ aby obs³u¿yæ klawisz

					;licznk powtórzeñ klawisza zszed³ do zera
	CPL	LDTEST		;mo¿emy regularnie obs³u¿yæ klawisz
					;w tym przypadku prze³¹czyæ stan diody TEST
	SJMP	LoopKey     	;i pomin¹æ inicjowanie zliczania powtórzeñ klawisza

LoopKeyNoKey:
	MOV	KeyCount, #25	;inicjuje zliczanie powtórzeñ klawisza
					;zazwyczaj 6 wystarcza, a przy 25 klawiatura
					;dzia³a absolutnie niezawodnie
					;przy 200 widaæ wyraŸne opóŸnienie reakcji
					;na naciœniêcie klawisza
	SJMP	LoopKey		;never ending loop
