//
// version
//
	.vers	4

//
// execution framework
//
__start:
	call	_main
	call	_exit
__stop:
	jmp	__stop

//
// Integer readInteger()
//
_readInteger:
	asf	0
	rdint
	popr
	rsf
	ret

//
// void writeInteger(Integer)
//
_writeInteger:
	asf	0
	pushl	-3
	wrint
	rsf
	ret

//
// Character readCharacter()
//
_readCharacter:
	asf	0
	rdchr
	popr
	rsf
	ret

//
// void writeCharacter(Character)
//
_writeCharacter:
	asf	0
	pushl	-3
	wrchr
	rsf
	ret

//
// Integer char2int(Character)
//
_char2int:
	asf	0
	pushl	-3
	popr
	rsf
	ret

//
// Character int2char(Integer)
//
_int2char:
	asf	0
	pushl	-3
	popr
	rsf
	ret

//
// void exit()
//
_exit:
	asf	0
	halt
	rsf
	ret

//
// Integer ack(Integer, Integer)
//
_ack:
	asf	0
	pushl	-4
	pushc	0
	eq
	brf	__1
	pushl	-3
	pushc	1
	add
	popr
	jmp	__0
	jmp	__2
__1:
	pushl	-3
	pushc	0
	eq
	brf	__3
	pushl	-4
	pushc	1
	sub
	pushc	1
	call	_ack
	drop	2
	pushr
	popr
	jmp	__0
	jmp	__4
__3:
	pushl	-4
	pushc	1
	sub
	pushl	-4
	pushl	-3
	pushc	1
	sub
	call	_ack
	drop	2
	pushr
	call	_ack
	drop	2
	pushr
	popr
	jmp	__0
__4:
__2:
__0:
	rsf
	ret

//
// void main()
//
_main:
	asf	3
	call	_readInteger
	pushr
	popl	0
	call	_readInteger
	pushr
	popl	1
	pushl	0
	pushl	0
	call	_ack
	drop	2
	pushr
	popl	2
	pushl	2
	call	_writeInteger
	drop	1
	pushc	10
	call	_writeCharacter
	drop	1
__5:
	rsf
	ret
