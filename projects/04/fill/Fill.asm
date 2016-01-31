// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

@screenstatus
M=0

(KEYBOARD)
@KBD
D=M
@BLACKSCREEN
D;JNE
@WHITESCREEN
D;JEQ

(POSTBLACK)
@screenstatus
M=M+1
@KEYBOARD
0;JMP

(BLACKSCREEN)
@screenstatus
D=M
@KEYBOARD
D;JNE

@offset
M=0

@8192
D=A
@pixels
M=D

(BLOOP)
@offset
D=M
@SCREEN
A=A+D
M=-1

// compare pixels and count
@offset
M=M+1
@pixels
D=M
@offset
D=D-M
@POSTBLACK
D;JEQ
@BLOOP
0;JMP

(POSTWHITE)
@screenstatus
M=0
@KEYBOARD
0;JMP

(WHITESCREEN)
@screenstatus
D=M
@KEYBOARD
D;JEQ

@offset
M=0

@8192
D=A
@pixels
M=D

(WLOOP)
@offset
D=M
@SCREEN
A=A+D
M=0

// compare pixels and count
@offset
M=M+1
@pixels
D=M
@offset
D=D-M
@POSTWHITE
D;JEQ
@WLOOP
0;JMP
