	.file	"dbl.c"
	.text
	.globl	mpow
	.type	mpow, @function
mpow:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	$1, -4(%ebp)
	jmp	.L2
.L3:
	movl	-4(%ebp), %eax
	imull	8(%ebp), %eax
	movl	%eax, -4(%ebp)
.L2:
	movl	12(%ebp), %eax
	leal	-1(%eax), %edx
	movl	%edx, 12(%ebp)
	testl	%eax, %eax
	jne	.L3
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	mpow, .-mpow
	.globl	mstrcmp
	.type	mstrcmp, @function
mstrcmp:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
.L12:
	movl	8(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, 8(%ebp)
	movzbl	(%eax), %eax
	movb	%al, -1(%ebp)
	movl	12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, 12(%ebp)
	movzbl	(%eax), %eax
	movb	%al, -2(%ebp)
	movzbl	-1(%ebp), %eax
	cmpb	-2(%ebp), %al
	je	.L6
	movzbl	-1(%ebp), %eax
	cmpb	-2(%ebp), %al
	jnb	.L7
	movl	$-1, %eax
	jmp	.L9
.L7:
	movl	$1, %eax
	jmp	.L9
.L6:
	cmpb	$0, -1(%ebp)
	je	.L14
	jmp	.L12
.L14:
	nop
	movl	$0, %eax
.L9:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	mstrcmp, .-mstrcmp
	.globl	_readr
	.type	_readr, @function
_readr:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$116, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	subl	$8, %esp
	pushl	$80
	leal	-92(%ebp), %edx
	pushl	%edx
	movl	%eax, %ebx
	call	_readln@PLT
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L16
	movl	$0, %eax
	jmp	.L18
.L16:
	subl	$12, %esp
	leal	-92(%ebp), %eax
	pushl	%eax
	call	_atod
	addl	$16, %esp
	fstps	-108(%ebp)
	flds	-108(%ebp)
	fstps	-96(%ebp)
	leal	-96(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
.L18:
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	_readr, .-_readr
	.globl	_printr
	.type	_printr, @function
_printr:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$100, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	leal	-92(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	flds	-92(%ebp)
	leal	-88(%ebp), %eax
	pushl	%eax
	pushl	$7
	leal	-8(%esp), %esp
	fstpl	(%esp)
	call	_dtoa
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	_prints@PLT
	addl	$16, %esp
	nop
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	_printr, .-_printr
	.globl	_readd
	.type	_readd, @function
_readd:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$100, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$8, %esp
	pushl	$80
	leal	-96(%ebp), %eax
	pushl	%eax
	call	_readln@PLT
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L21
	fldz
	jmp	.L23
.L21:
	subl	$12, %esp
	leal	-96(%ebp), %eax
	pushl	%eax
	call	_atod
	addl	$16, %esp
	fstpl	-16(%ebp)
	fldl	-16(%ebp)
.L23:
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	_readd, .-_readd
	.globl	_printd
	.type	_printd, @function
_printd:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$100, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	8(%ebp), %eax
	movl	%eax, -96(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -92(%ebp)
	leal	-88(%ebp), %eax
	pushl	%eax
	pushl	$7
	pushl	-92(%ebp)
	pushl	-96(%ebp)
	call	_dtoa
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	_prints@PLT
	addl	$16, %esp
	nop
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	_printd, .-_printd
	.globl	_atod
	.type	_atod, @function
_atod:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	fldz
	fstpl	-16(%ebp)
	movl	$0, -20(%ebp)
	movl	$0, -24(%ebp)
	movl	$1, -28(%ebp)
	jmp	.L26
.L27:
	addl	$1, 8(%ebp)
.L26:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$32, %al
	je	.L27
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$45, %al
	jne	.L29
	movl	$-1, -28(%ebp)
	addl	$1, 8(%ebp)
	jmp	.L29
.L30:
	addl	$1, 8(%ebp)
.L29:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$48, %al
	je	.L30
	jmp	.L31
.L33:
	fldl	-16(%ebp)
	fldl	.LC1@GOTOFF(%ebx)
	fmulp	%st, %st(1)
	movl	8(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, 8(%ebp)
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -44(%ebp)
	fildl	-44(%ebp)
	faddp	%st, %st(1)
	fstpl	-16(%ebp)
.L31:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$47, %al
	jle	.L32
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$57, %al
	jle	.L33
.L32:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$46, %al
	jne	.L34
	addl	$1, 8(%ebp)
	jmp	.L35
.L36:
	fldl	-16(%ebp)
	fldl	.LC1@GOTOFF(%ebx)
	fmulp	%st, %st(1)
	movl	8(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, 8(%ebp)
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -44(%ebp)
	fildl	-44(%ebp)
	faddp	%st, %st(1)
	fstpl	-16(%ebp)
	cmpl	$0, -24(%ebp)
	jg	.L35
	subl	$1, -24(%ebp)
.L35:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$47, %al
	jle	.L34
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$57, %al
	jle	.L36
.L34:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$69, %al
	je	.L37
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$101, %al
	jne	.L38
.L37:
	movl	8(%ebp), %eax
	addl	$1, %eax
	subl	$12, %esp
	pushl	%eax
	call	_atoi@PLT
	addl	$16, %esp
	movl	%eax, -20(%ebp)
.L38:
	movl	-24(%ebp), %eax
	addl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	jle	.L43
	jmp	.L40
.L41:
	fldl	-16(%ebp)
	fldl	.LC1@GOTOFF(%ebx)
	fmulp	%st, %st(1)
	fstpl	-16(%ebp)
.L40:
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	%edx, -20(%ebp)
	testl	%eax, %eax
	jg	.L41
	jmp	.L42
.L44:
	fldl	-16(%ebp)
	fldl	.LC1@GOTOFF(%ebx)
	fdivrp	%st, %st(1)
	fstpl	-16(%ebp)
.L43:
	movl	-20(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -20(%ebp)
	testl	%eax, %eax
	js	.L44
.L42:
	cmpl	$0, -28(%ebp)
	jns	.L45
	fldl	-16(%ebp)
	fchs
	fstpl	-16(%ebp)
.L45:
	fldl	-16(%ebp)
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	_atod, .-_atod
	.globl	_dtoa
	.type	_dtoa, @function
_dtoa:
.LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	8(%ebp), %edx
	movl	%edx, -48(%ebp)
	movl	12(%ebp), %edx
	movl	%edx, -44(%ebp)
	movl	$0, -20(%ebp)
	cmpl	$0, 20(%ebp)
	jne	.L48
	leal	str.1488@GOTOFF(%eax), %edx
	movl	%edx, 20(%ebp)
.L48:
	fldl	-48(%ebp)
	fldz
	fucomip	%st(1), %st
	fstp	%st(0)
	jp	.L49
	fldl	-48(%ebp)
	fldz
	fucomip	%st(1), %st
	fstp	%st(0)
	jne	.L49
	movl	20(%ebp), %eax
	movb	$48, (%eax)
	movl	20(%ebp), %eax
	addl	$1, %eax
	movb	$0, (%eax)
	movl	20(%ebp), %eax
	jmp	.L51
.L49:
	fldl	-48(%ebp)
	fldz
	fucomip	%st(1), %st
	fstp	%st(0)
	jbe	.L52
	movl	-20(%ebp), %edx
	leal	1(%edx), %ecx
	movl	%ecx, -20(%ebp)
	movl	%edx, %ecx
	movl	20(%ebp), %edx
	addl	%ecx, %edx
	movb	$45, (%edx)
	fldl	-48(%ebp)
	fchs
	fstpl	-48(%ebp)
.L52:
	fld1
	fldl	-48(%ebp)
	fucomip	%st(1), %st
	fstp	%st(0)
	jb	.L92
	fld1
	fstpl	-32(%ebp)
	movl	$0, -16(%ebp)
	jmp	.L56
.L60:
	fldl	-32(%ebp)
	fldl	.LC1@GOTOFF(%eax)
	fmulp	%st, %st(1)
	fldl	-48(%ebp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	ja	.L94
	fldl	-32(%ebp)
	fldl	.LC1@GOTOFF(%eax)
	fmulp	%st, %st(1)
	fstpl	-32(%ebp)
	addl	$1, -16(%ebp)
.L56:
	fldl	-32(%ebp)
	fldl	.LC3@GOTOFF(%eax)
	fucomip	%st(1), %st
	fstp	%st(0)
	ja	.L60
	jmp	.L61
.L92:
	fldl	.LC4@GOTOFF(%eax)
	fstpl	-32(%ebp)
	movl	$-1, -16(%ebp)
	jmp	.L62
.L65:
	fldl	-32(%ebp)
	fldl	-48(%ebp)
	fucomip	%st(1), %st
	fstp	%st(0)
	jnb	.L95
	fldl	-32(%ebp)
	fldl	.LC1@GOTOFF(%eax)
	fdivrp	%st, %st(1)
	fstpl	-32(%ebp)
	subl	$1, -16(%ebp)
.L62:
	fldz
	fldl	-32(%ebp)
	fucomip	%st(1), %st
	fstp	%st(0)
	ja	.L65
	jmp	.L61
.L94:
	nop
	jmp	.L61
.L95:
	nop
.L61:
	fldl	-48(%ebp)
	fdivl	-32(%ebp)
	fstpl	-48(%ebp)
	movl	$0, -12(%ebp)
	jmp	.L66
.L71:
	fldl	-48(%ebp)
	fnstcw	-50(%ebp)
	movzwl	-50(%ebp), %edx
	orb	$12, %dh
	movw	%dx, -52(%ebp)
	fldcw	-52(%ebp)
	fistpl	-36(%ebp)
	fldcw	-50(%ebp)
	fildl	-36(%ebp)
	fldl	-48(%ebp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	jbe	.L67
	subl	$1, -36(%ebp)
.L67:
	movl	-36(%ebp), %edx
	leal	48(%edx), %ebx
	movl	-20(%ebp), %edx
	leal	1(%edx), %ecx
	movl	%ecx, -20(%ebp)
	movl	%edx, %ecx
	movl	20(%ebp), %edx
	addl	%ecx, %edx
	movl	%ebx, %ecx
	movb	%cl, (%edx)
	cmpl	$0, -12(%ebp)
	jne	.L69
	movl	-20(%ebp), %edx
	leal	1(%edx), %ecx
	movl	%ecx, -20(%ebp)
	movl	%edx, %ecx
	movl	20(%ebp), %edx
	addl	%ecx, %edx
	movb	$46, (%edx)
.L69:
	fildl	-36(%ebp)
	fldl	-48(%ebp)
	fsubp	%st, %st(1)
	fldl	.LC1@GOTOFF(%eax)
	fmulp	%st, %st(1)
	fstpl	-48(%ebp)
	addl	$1, -12(%ebp)
.L66:
	movl	-12(%ebp), %edx
	cmpl	16(%ebp), %edx
	jge	.L70
	fldl	-48(%ebp)
	fldz
	fucomip	%st(1), %st
	fstp	%st(0)
	jp	.L71
	fldl	-48(%ebp)
	fldz
	fucomip	%st(1), %st
	fstp	%st(0)
	jne	.L71
.L70:
	fldl	.LC5@GOTOFF(%eax)
	fldl	-48(%ebp)
	fucomip	%st(1), %st
	fstp	%st(0)
	jb	.L93
	jmp	.L74
.L75:
	subl	$1, -20(%ebp)
.L74:
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$57, %al
	je	.L75
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$46, %al
	je	.L76
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %edx
	addl	$1, %edx
	movb	%dl, (%eax)
	jmp	.L79
.L76:
	subl	$1, -20(%ebp)
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$57, %al
	je	.L78
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %edx
	addl	$1, %edx
	movb	%dl, (%eax)
	jmp	.L79
.L78:
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movb	$49, (%eax)
	addl	$1, -16(%ebp)
	jmp	.L79
.L93:
	jmp	.L80
.L81:
	subl	$1, -20(%ebp)
.L80:
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$48, %al
	je	.L81
.L79:
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$46, %al
	jne	.L82
	subl	$1, -20(%ebp)
.L82:
	cmpl	$0, -16(%ebp)
	je	.L83
	movl	-20(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -20(%ebp)
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movb	$69, (%eax)
	cmpl	$0, -16(%ebp)
	jns	.L84
	movl	-20(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -20(%ebp)
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movb	$45, (%eax)
	negl	-16(%ebp)
.L84:
	cmpl	$100, -16(%ebp)
	jle	.L85
	movl	-16(%ebp), %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	leal	48(%eax), %ecx
	movl	-20(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -20(%ebp)
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movl	%ecx, %edx
	movb	%dl, (%eax)
	movl	-16(%ebp), %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$100, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	leal	48(%eax), %ecx
	movl	-20(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -20(%ebp)
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movl	%ecx, %edx
	movb	%dl, (%eax)
	movl	-16(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	leal	48(%eax), %ecx
	movl	-20(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -20(%ebp)
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movl	%ecx, %edx
	movb	%dl, (%eax)
	jmp	.L83
.L85:
	cmpl	$10, -16(%ebp)
	jle	.L86
	movl	-16(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	leal	48(%eax), %ecx
	movl	-20(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -20(%ebp)
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movl	%ecx, %edx
	movb	%dl, (%eax)
	movl	-16(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	leal	48(%eax), %ecx
	movl	-20(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -20(%ebp)
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movl	%ecx, %edx
	movb	%dl, (%eax)
	jmp	.L83
.L86:
	movl	-16(%ebp), %eax
	leal	48(%eax), %ecx
	movl	-20(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -20(%ebp)
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movl	%ecx, %edx
	movb	%dl, (%eax)
.L83:
	movl	-20(%ebp), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	20(%ebp), %eax
.L51:
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	_dtoa, .-_dtoa
	.globl	_atof
	.type	_atof, @function
_atof:
.LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	subl	$12, %esp
	pushl	8(%ebp)
	call	_atod
	addl	$16, %esp
	fstps	-12(%ebp)
	flds	-12(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	_atof, .-_atof
	.globl	_ftoa
	.type	_ftoa, @function
_ftoa:
.LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	flds	8(%ebp)
	pushl	16(%ebp)
	pushl	12(%ebp)
	leal	-8(%esp), %esp
	fstpl	(%esp)
	call	_dtoa
	addl	$16, %esp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	_ftoa, .-_ftoa
	.local	str.1488
	.comm	str.1488,32,32
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1076101120
	.align 8
.LC3:
	.long	4294967294
	.long	2146435071
	.align 8
.LC4:
	.long	2576980378
	.long	1069128089
	.align 8
.LC5:
	.long	0
	.long	1075052544
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB10:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE10:
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB11:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE11:
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
