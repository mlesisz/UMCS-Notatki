;====================================
; @copyright-Abdul Rehman
; @Licence Creative Common 
; This code used to display simple character...
; on character lcd with 8051 microcontroller in assembly langauge
;====================================
LCD_DATA_PORT EQU	P0
RS	BIT	P2.0
EN 	BIT	P2.1
_LCDRC	DATA	0FF82h
;====================================

ORG 0H

;------------------------------------
MAIN:
	ACALL	LCD_INIT
	MOV		A,#'D'
	ACALL	LCD_WRITE_DATA
	ACALL	_LCD_WAIT_WHILE_BUSY
	
	MOV		A,#'O'
	ACALL	LCD_WRITE_DATA
	ACALL	_LCD_WAIT_WHILE_BUSY
	
	
	MOV		A,#'N'
	ACALL	LCD_WRITE_DATA
	ACALL	_LCD_WAIT_WHILE_BUSY
	
	
	MOV		A,#'E'
	ACALL	LCD_WRITE_DATA
	ACALL	_LCD_WAIT_WHILE_BUSY
	
	
	MOV		A,#'.'
	ACALL	LCD_WRITE_DATA
	ACALL	_LCD_WAIT_WHILE_BUSY
	
	
	MOV		A,#'.'
	ACALL	LCD_WRITE_DATA
	ACALL	_LCD_WAIT_WHILE_BUSY
	
	MOV		A,#'.'
	ACALL	LCD_WRITE_DATA
	ACALL	_LCD_WAIT_WHILE_BUSY
;-----------------------------------
MLOOP:

	SJMP MLOOP



;-------------------------------------	
;	LCD INTERFACING CODE IN 8BIT MODE
;-------------------------------------
LCD_INIT:
	MOV		A,#38H		;THIS COMMAND TELLS LCD TO INITIALIZE 5x7 2LINE
	ACALL 	LCD_WRITE_CMD
	ACALL 	DELAY1
	MOV		A,#0FH		;DISPLAY ON, CURSOR ON
	ACALL 	LCD_WRITE_CMD
	ACALL 	DELAY1
	RET

LCD_CLR:
		;CLEAR ALL CHARACTERS FROM LCD DISPLAY
		MOV		A,#0H
		ACALL 	LCD_WRITE_DATA
		RET
	
LCD_WRITE_CMD:
	;THIS FUNCTION WILL PUT COMMAND 
	;INTO LCD's COMMAND REGISTER
	MOV		LCD_DATA_PORT,A
	CLR		RS
	SETB	EN
	NOP
	NOP
	NOP
	CLR		EN
	RET	
	
LCD_WRITE_DATA:
	;THIS FUNCTION WILL DISPLAY 
	;DATA ONTO LCD
	MOV		LCD_DATA_PORT,A
	SETB	RS
	SETB	EN
	NOP
	NOP
	NOP
	NOP
	CLR		EN
	RET	
		
;===================================

_LCD_WAIT_WHILE_BUSY:
	MOV DPTR,#_LCDRC
	MOVX A,@DPTR
	JB ACC.7, _LCD_WAIT_WHILE_BUSY
_LCD_WAIT_WHILE_BUSY_END:
	RET		
		
DELAY1:
	MOV		R6,#255
D1L1:
	MOV		R7,#255
	DJNZ	R7,$
	DJNZ 	R6,D1L1
	RET

;===================================
END