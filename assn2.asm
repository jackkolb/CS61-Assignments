;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Kolb, Jack 
; Email: jkolb001@ucr.edu
; 
; Assignment name: Assignment 2
; Lab section: 026
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=========================================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------

;----------------------------------------------
;output prompt
;----------------------------------------------	
LEA R0, intro			; get starting address of prompt string
PUTS			    	; Invokes BIOS routine to output string

;-------------------------------
;INSERT YOUR CODE here
;--------------------------------

GETC ; get first character
OUT  ; output first character
ST R0, VALUE_A ; store value into VALUE_A
LD R0, NEWLINE ; store newline into R0
OUT ; output newline

GETC ; get second character
OUT ; output second character
ST R0, VALUE_B ; store value into VALUE_B
LD R0, NEWLINE ; store newline into R0
OUT ; output newline

LD R0, VALUE_A ; load/output value A
OUT
LD R0, SPACE ; load/output space
OUT
LD R0, MINUS ; load/output minut
OUT
LD R0, SPACE ; load/output space
OUT
LD R0, VALUE_B ; load/output value B
OUT
LD R0, SPACE ; load/output space
OUT
LD R0, EQUAL ; load/output equal sign
OUT
LD R0, SPACE ; load/output space
OUT

; conduct the subtraction!!

; load R1=value a, R2=value b
LD R1, VALUE_A
LD R2, VALUE_B

; convert ascii to number (subtract 48)
LD R4, ASCII_ADJUST ; R4 is 48
NOT R4, R4 ; 48 to -48

ADD R1, R1, R4 ; subtract 48 from R1
ADD R2, R2, R4 ; subtract 48 from R2

; subtract R2 from R1, into R3
NOT R2, R2 ; R2 to -R2
ADD R3, R1, R2 ; R1 + -R2 => R3

ADD R3, R3, #1 ; add 1 to guarantee pos 0

; if value < 0, output negative sign, invert
BRzp NO_NEGATIVE
LD R0, MINUS
OUT
NOT R3, R3
ADD R3, R3, #1

NO_NEGATIVE ; label to skip to if 0/pos

; subtract 1 to get back to original
ADD R3, R3, #-1

; convert number to ascii (add 48)
NOT R4, R4 ; -48 to 48
ADD R3, R3, R4 ; add 48 to R3
ADD R3, R3, x01 ; add 1!

ST R3, RESULT
LD R0, RESULT
OUT

LD R0, NEWLINE
OUT

HALT				; Stop execution of program

;------	
;Data
;------
; String to prompt user. Note: already includes terminating newline!
intro 	.STRINGZ	"ENTER two numbers (i.e '0'....'9')\n" 		; prompt string - use with LEA, followed by PUTS.

NEWLINE .FILL x0A	; newline character - use with LD followed by OUT

SPACE .FILL x20
MINUS .FILL x2D
EQUAL .FILL x3D

VALUE_A .FILL x00
VALUE_B .FILL x00
RESULT .fill x00

ASC_8 .FILL x38

ASCII_ADJUST .FILL x30

;---------------	
;END of PROGRAM
;---------------	
.END

