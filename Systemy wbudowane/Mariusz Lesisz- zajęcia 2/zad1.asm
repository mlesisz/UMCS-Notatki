	ORG 0000H
	_RESET:
	LJMP _INIT
	LJMP _INIT
	
	ORG 0100H
	_INIT:
	NOP
	CLR C
	JC _IF
	
	_FI:
	LJMP _KONIEC
	
	_IF:
	CLR P1.7
	_KONIEC:
	_LOOP:
	NOP
	LJMP _LOOP
END