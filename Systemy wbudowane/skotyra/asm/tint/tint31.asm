;=======================================
;
;	TIMER INTERRUPT
;
;	1000 przerwañ na sekundê od timer 0 w trybie 1

TEST	BIT	P1.7
BUZZ	BIT	P1.5

T0IB	BIT	7FH		;timer 0 interrupt bit

;=======================================
;	RESET

	ORG	00H		;reset
	LJMP	START

;=======================================
;	TIMER 0 INTERRUPT
	ORG	0BH

	LJMP	TI0MAIN	;w ten sposób omijamy ograniczenie do 8 bajtów


;=======================================
;	TIMER 0 INTERRUPT MAIN
	ORG	0B0H			;od B0h do 100h jest 80 bajtów, na pewno wystarczy

TI0MAIN:
	PUSH	ACC			;zabezpieczamy wykorzystywane rejestry
	PUSH	PSW			;

	MOV	TH0, #255 - 3	;wartoœæ typowa

	MOV	A, #256 - 154 + 1	; + 1 aby nadrobiæ stratê
	ADD	A, TL0		;uwzglêdnia opóŸnienie wywo³ania przerwania
	MOV	TL0, A		;TL0 ustawione w³aœciwie

	JNC	TI0MAIN_TH0_OK	;je¿eli nie Carry to jest OK
	INC	TH0			;wpr podbijamy TH0 w stosuku do wartoœci typowej

TI0MAIN_TH0_OK:			;TH0 ustawione w³aœciwie

	POP	PSW			;odzyskujemy wykorzystywane rejestry
	POP	ACC			;

	SETB	T0IB			;informujemy pêtlê g³ówn¹ o przerwaniu

	RETI				;powrót z przerwania

;=======================================
;	PROGRAM

	ORG	100H
START:
	MOV	IE,	#00h	;blokada wszystkich przerwañ

	MOV	TMOD,	#71h	;T1.GATE=0 T1.C/T=C T1.MODE=3 T0.GATE=0 T1.C/T=T T0.MODE=1
	MOV	TCON,	#10h	;m.in. blokada zliczania przez T1, aktywuje zliczanie przez timer 0
	SETB	ET0		;aktywuje przerwanie od timer 0
	SETB	EA		;globalne zezwolenie na obs³ugê przerwañ

LoopRun:
	JNB	T0IB, LoopRun	;czeka na przerwanie

	CLR	T0IB		;zapomina ¿e by³o przerwanie

	CPL	TEST		;prze³¹cza diodê
	CPL	BUZZ		;prze³¹cza brzêczyk

	SJMP	LoopRun
