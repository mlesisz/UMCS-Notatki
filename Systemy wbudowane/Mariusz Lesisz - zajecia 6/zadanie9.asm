POSR 	DATA 02Fh
ER	BIT POSR.5
OK	BIT POSR.4
F4	BIT POSR.3
F3	BIT POSR.2
F2	BIT POSR.1
F1	BIT POSR.0
CSDS	EQU 0FF30h
CSDB	EQU 0FF38h	

	ORG 0000h
_RESET:
	LJMP _INIT

	ORG 0100h
_INIT:
	CLR P1.6		;ustawiam domyślnie zasilanie na włączone do wyświetlacza multi.
	MOV POSR, #00000000b	;ustawiam wszystko na off nic się nie będzie świecić
	MOV R0, #255d
	MOV R1, #255d
	
	CALL _7SEG_INIT		;wywołaj podprogram _7SEG_INIT
_FOR1:
	_FOR2:
		;instrukcje w drugiej pętli
		NOP
		NOP
		NOP
		NOP
		DJNZ R1, _FOR2
		MOV A, POSR
		RR A
		MOV POSR, A
		MOVX @DPTR, A	
		CALL _7SEG_REFRESH
	DJNZ R0,_FOR1
	
	
_LOOP:
	NOP
	LJMP _LOOP

_7SEG_REFRESH:
	CPL P1.6		;- odłącza zasilanie wyświetlacza multipleksowanego
	MOV DPTR, #CSDB		;- wprowadza do bufora danych nowy stan diod sygnalizacyjnych z bajtu pośredniczącego.
	MOV A,POSR		;-//-
	MOVX @DPTR, A		;-//-
	CLR P1.6		;- wznawia zasilanie wyświetlacza multipleksowanego
	RET

_7SEG_INIT:
	;instrukcje
	MOV DPTR, #CSDS		;- wprowadza do bufora wyboru wskaźnika wartość, dzięki której aktywnym wskaźnikiem będzie wskaźnik LED
	MOV A,#01000000b	;-//-
	MOVX @DPTR, A		;-//-
	CALL _7SEG_SET_OK_ON	;- wprowadza do bajtu pośredniczącego wartość, dzięki której początkowo aktywna będzie dioda OK
	CALL _7SEG_REFRESH	;- wywołuje podprogram _7SEG_REFRESH
	RET

_7SEG_SET_F1_ON:
	JB F1, _IF_F1
	CPL F1
_IF_F1:
	RET
_7SEG_SET_F2_ON:
	JB F2, _IF_F2
	CPL F2
_IF_F2:
	RET
_7SEG_SET_F3_ON:
	JB F3, _IF_F3
	CPL F3
_IF_F3:
	RET
_7SEG_SET_F4_ON:
	JB F4, _IF_F4
	CPL F4
_IF_F4:
	RET
_7SEG_SET_OK_ON:
	JB OK, _IF_OK
	CPL OK
_IF_OK:
	RET
_7SEG_SET_ER_ON:
	JB ER, _IF_ER
	CPL ER
_IF_ER:
	RET

_7SEG_SET_F1_OFF:
	CLR F1
	RET
_7SEG_SET_F2_OFF:
	CLR F2
	RET
_7SEG_SET_F3_OFF:
	CLR F3
	RET
_7SEG_SET_F4_OFF:
	CLR F4
	RET
_7SEG_SET_OK_OFF:
	CLR OK
	RET
_7SEG_SET_ER_OFF:
	CLR ER
	RET


	;CPL OK
	;MOV DPTR, #CSDS
	;MOV A,#01000000b
	;MOVX @DPTR, A
	;MOV DPTR, #CSDB
	;MOV A,POSR
	;MOVX @DPTR, A

END