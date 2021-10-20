_RECV_FLG BIT	00h
_SEND_FLG BIT	01h
_RECV_BUF DATA	030h
_RECV_BUF_INDEKS	DATA 031h
_SEND_BUF	DATA 032h
_SEND_BUF_INDEKS	DATA 030h

ORG	0000h
_RESET:
LJMP _INIT

ORG 0023h
_INT_SERIAL:
	JB	TI,_INT_SERIAL_TI
	
_INT_SERIAL_RI:
	MOV A,_RECV_BUF
	INC _RECV_BUF_INDEKS
	ADD A,_RECV_BUF_INDEKS

	MOV R1,A
	MOV A,SBUF
	MOV SBUF,A
	MOV @R1,A

	CLR RI
	SETB _RECV_FLG
	RETI

_INT_SERIAL_TI:
	CLR TI
	SETB _SEND_FLG
	RETI
	
ORG 0100h
_INIT:
	SETB ES
	SETB EA

	MOV _SEND_BUF,#0d
	MOV _SEND_BUF_INDEKS,#0d

	MOV _RECV_BUF_INDEKS,#0d
	
	CLR _RECV_FLG
	CLR _SEND_FLG
	MOV _RECV_BUF,#0d

	MOV SCON,#01010000b
	ANL TMOD,#00101111b
	ORL TMOD,#00100000b
	
	MOV TL1,#0FDh
	MOV TH1,#0FDh
	ANL PCON,#01111111b
	
	CLR TF1
	SETB TR1
	
	
_LOOP:
	JNB _RECV_FLG,_LOOP10
	
	MOV A,_RECV_BUF_INDEKS
	CLR CY
	SUBB A,#8d
	JC _LOOP5
	LCALL _CALCULATE

_LOOP5:
	CLR _RECV_FLG
	
_LOOP10:
	JNB _SEND_FLG,_LOOP
	CLR _SEND_FLG
	
	MOV A,_SEND_BUF_INDEKS
	JZ _LOOP
	
	ADD A,#_SEND_BUF
	DEC _SEND_BUF_INDEKS

	MOV R1,A
	MOV A,@R1

	MOV SBUF,A

	LJMP _LOOP

_CALCULATE:
	CPL P1.7

	MOV A,#_RECV_BUF
	ADD A,@R1
	
	MOV R1,A
	MOV A,@R1

	SUBB A,#48d
	MOV R6,A

	MOV A, #_RECV_BUF
	ADD A,#7d
	MOV R1,A
	MOV A,@R1
	SUBB A,#48d
	ADD A,R6

	ADD A,#48d
	;MOV SBUF,A
	CALL _BUFOR_NADAWANIA

	MOV _RECV_BUF_INDEKS,#0d
	RET

_BUFOR_NADAWANIA:
	MOV R6,A

	MOV A,#_SEND_BUF
	INC _SEND_BUF_INDEKS
	ADD A,_SEND_BUF_INDEKS

	MOV R1,A
	MOV A,R6
	MOV @R1,A

	INC R1
	INC _SEND_BUF_INDEKS
	MOV @R1,#'0'

	INC R1
	INC _SEND_BUF_INDEKS
	MOV @R1,#'0'

	SETB _SEND_FLG

	MOV _RECV_BUF_INDEKS,#0d
	RET
	

_MESSAGE:
DB	'WITAJ',013d,010d,0d
END