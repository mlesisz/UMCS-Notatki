	
_LICZNIK DATA 030H

	ORG 0000H
_REEST:
	LJMP _INIT
	
	ORG 0100H
_INIT:
	
	MOV _LICZNIK, #0d

_FOR:
	MOV R0, #_LICZNIK
	CJNE @R0, #16D, _FOR_INSTR
	JMP _FI

_FOR_INSTR:
	;instrukcje
	CPL P1.7
	INC _LICZNIK
	JMP _FOR
_FI:

_LOOP:
	NOP
	LJMP _LOOP
END