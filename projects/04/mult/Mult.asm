// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@count // counter for iterations
M=0 // set counter to 0

@R2
M=0 // set starting sum to 0

@R0
D=M
@END
D;JEQ // check if R0 is 0

@R1
D=M
@END
D;JEQ // check if R1 is 0

(LOOP)
@R0
D=M
@R2
M=D+M
@R1
D=M

@count
M=M+1
D=D-M
@END
D;JEQ // compare count and R1, if equal, jump to end
@LOOP
0;JMP
(END)

@END
0;JMP
