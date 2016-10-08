	.ORIG x0000

	LEA R0,ch
	JSR route
	ADD R0,R1,0
	BR ffin
	
;;; routine qui convertie une chaine situé dans R0 en entier dans R1
route:	ADD R6,R7,0
	AND R1,R1,0
loop:	LDR R2,R0,0
	BRz fin

	JSR m10
	JSR digit
	ADD R1,R1,R2

	ADD R0,R0,1

	BR loop

fin:	JMP R6
	
;;; multiplie R1 par 10, utilise R5
m10:	ADD R1,R1,R1
	ADD R5,R1,R1
	ADD R5,R5,R5
	ADD R1,R1,R5
	RET

;;; convertie R2 en entier, utilise R5
digit:	LD R5, asc0
	ADD R2,R2,R5
	RET

asc0:	.FILL -48

ch:	.STRINGZ "1234"

ffin:	NOP
	
	.END
