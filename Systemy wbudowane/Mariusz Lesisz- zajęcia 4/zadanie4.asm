	ORG 0000H
_REEST:
	LJMP _INIT
	
	ORG 0100H
_INIT:
	
	MOV 030H, #5d
	MOV 031H, #4d
	
	MOV A, 030H
	SUBB A, 31H
	
_WHILE:
	CLR C
	MOV A, 030H
	SUBB A, 31H

	JZ  _FI

	INC 031H
	CPL P1.7

	LJMP _WHILE
_FI:

_LOOP:
	NOP
	LJMP _LOOP
END