_LED	DATA 02Fh

_WSK1	DATA	030h
_WSK2	DATA	031h
_WSK3	DATA	032h
_WSK4	DATA	033h
_WSK5	DATA	034h
_WSK6	DATA	035h

_WSK_INDEKS	DATA	036h

_CSDS	EQU 0FF30h
_CSDB	EQU 0FF38h	

_LICZNIK	equ 7Ah		
_WPZ		bit 7Fh		;wystapilo przerwanie zegarowe

_KONFI		bit 7Bh

	ORG 0000h
_RESET:
	LJMP _INIT

	ORG 000Bh
_OVRFL:				;obsługa przerwania
	MOV TH0,#256-16		;to mi daje 1800 przerwan /sekunde w trybie 0
	SETB _WPZ		;sygnalizuje petli glownej wystapienie przerwania
	RETI			;powrot z przerwania

	ORG 0100h
_INIT:
	MOV _LICZNIK,#0
	CALL _7SEG_INIT		;Inicjalizuje wartości potrzebne do wyświetlacza
	CALL _7SEG_REF		;Wyświetlam początkowe wartości na wyświeltaczu(same zera)

	MOV IE,#0		;blokada uslugi przerwan

	MOV TH0,#256-16		;to mi daje 1800 przerwan / sekunde w trybie 0

	MOV TMOD, #01110000b	;blokada TIMER1 i tryb 0 dla TIMER0

	SETB TR0		;zgoda na zliczanie przez TIMER0/uruchomienie licznika
	SETB ET0		;zgoda na obsluge przerwania od TIMER0
	SETB EA			;globalna zgoda na obsluge przerwan

	MOV R3,#8
	MOV R4,#8

	SETB _KONFI
	
_LOOP:
	JNB _WPZ,_LOOP		;czy przerwanie zegarowe
	CLR _WPZ		;-
	CALL _KLAWIATURA
	CALL _7SEG_REF		;odswiezam wyswietlacz 1800 na sekunde	

	JNB _KONFI,_LOOP

	DJNZ R3,_LOOP		;odliczanie od 1800 do zera
	DJNZ R4,_LOOP
	MOV R3,#8		;odnowienie licznika petli
	MOV R4,#8		;-//-
	INC _LICZNIK		;zwiekszenie licznkia o 1
	CALL _ODL_CZASU		;przeliczenie licznika aby go wyswietlic
	LJMP	_LOOP

_KLAWIATURA:
	SETB P1.6
	;enter
	MOV DPTR, #_CSDS
	MOV A,#00000001b
	MOVX @DPTR,A
	JB P3.5,_ENTER

	;up
	MOV DPTR, #_CSDS
	MOV A,#00001000b
	MOVX @DPTR,A
	JB P3.5,_UP

	;down
	MOV DPTR, #_CSDS
	MOV A,#00010000b
	MOVX @DPTR,A
	JB P3.5,_DOWN

_KLAWIATURA_END:
	
	RET
_ENTER:
	CPL _KONFI
	SETB P1.7
	JMP _KLAWIATURA_END
_UP:	
	INC _LICZNIK
	CALL _ODL_CZASU
	SETB P1.5
	JMP _KLAWIATURA_END
_DOWN:	
	DEC _LICZNIK
	CALL _ODL_CZASU
	CLR P1.5
	CLR P1.7
	JMP _KLAWIATURA_END
	
_7SEG_REF:
	SETB P1.6

	MOV A,#10000000b
	MOV R7,_WSK_INDEKS

_INDEKSUJ:
	DJNZ R7,_INDEKSUJ_CD
	JMP _INDEKSUJ_END

_INDEKSUJ_CD:
	RL A
	JMP _INDEKSUJ
_INDEKSUJ_END:

	MOV DPTR,#_CSDS
	MOVX	@DPTR,A

	MOV A,#_LED
	ADD A,_WSK_INDEKS
	DEC A

	MOV R0,A
	
	MOV A,@R0
	MOV DPTR, #_CSDB
	MOVX @DPTR,A


	CLR P1.6

	DJNZ _WSK_INDEKS,_7SEG_REF_END
	MOV _WSK_INDEKS,#7d

_7SEG_REF_END:
	RET


_7SEG_INIT:
	
	MOV _WSK_INDEKS,#7d

	MOV _LED, #00010000b
	MOV _WSK1,#00111111b
	MOV _WSK2,#00111111b
	MOV _WSK3,#00111111b
	MOV _WSK4,#00111111b
	MOV _WSK5,#00111111b
	MOV _WSK6,#00111111b

	RET

_ODL_CZASU:
	;jednosci
	MOV A,_LICZNIK
	MOV B,#10d
	DIV AB
	MOV R5,A
	
	MOV DPTR,#WZORCE_CYFR
	MOV A,B
	MOVC A,@A+DPTR
	MOV _WSK1,A

	;dziesietne
	MOV A,R5
	MOV B,#10d
	DIV AB
	MOV R5,A

	MOV DPTR,#WZORCE_CYFR
	MOV A,B
	MOVC A,@A+DPTR
	MOV _WSK2,A

	;setne
	MOV DPTR,#WZORCE_CYFR
	MOV A,R5
	MOVC A,@A+DPTR
	MOV _WSK3,A
	
	RET

WZORCE_CYFR:
	DB 00111111b	;0
	DB 00000110b	;1
	DB 01011011b	;2
	DB 01001111b	;3
	DB 01100110b	;4
	DB 01101101b	;5
	DB 01111101b	;6
	DB 00000111b	;7
	DB 01111111b	;8
	DB 01101111b	;9

END