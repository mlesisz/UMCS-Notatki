	ORG 0000H
_REEST:
	LJMP _INIT
	
	ORG 0100H
_INIT:
	CLR C
	MOV 030H, #50d
	MOV 031H, #49d
	MOV A, 030H
	SUBB A, 31H
	JC _IF
	NOP
	
_IF:
	CLR P1.5
	LJMP _KONIEC
_ELSE:
	CLR P1.7
_KONIEC:
_LOOP:
	NOP
	LJMP _LOOP
END