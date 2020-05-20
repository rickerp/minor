	.file	"dbl.c"
	.text
	.globl	mypow
	.type	mypow, @function
mypow:
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
	.size	mypow, .-mypow
	.globl	_readr
	.type	_readr, @function
_readr:
.LFB1:
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
	jne	.L6
	movl	$0, %eax
	jmp	.L8
.L6:
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
.L8:
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	_readr, .-_readr
	.globl	_printr
	.type	_printr, @function
_printr:
.LFB2:
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
.LFE2:
	.size	_printr, .-_printr
	.globl	_readd
	.type	_readd, @function
_readd:
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
	subl	$8, %esp
	pushl	$80
	leal	-96(%ebp), %eax
	pushl	%eax
	call	_readln@PLT
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L11
	fldz
	jmp	.L13
.L11:
	subl	$12, %esp
	leal	-96(%ebp), %eax
	pushl	%eax
	call	_atod
	addl	$16, %esp
	fstpl	-16(%ebp)
	fldl	-16(%ebp)
.L13:
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	_readd, .-_readd
	.globl	_printd
	.type	_printd, @function
_printd:
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
.LFE4:
	.size	_printd, .-_printd
	.globl	_atod
	.type	_atod, @function
_atod:
.LFB5:
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
	jmp	.L16
.L17:
	addl	$1, 8(%ebp)
.L16:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$32, %al
	je	.L17
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$45, %al
	jne	.L19
	movl	$-1, -28(%ebp)
	addl	$1, 8(%ebp)
	jmp	.L19
.L20:
	addl	$1, 8(%ebp)
.L19:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$48, %al
	je	.L20
	jmp	.L21
.L23:
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
.L21:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$47, %al
	jle	.L22
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$57, %al
	jle	.L23
.L22:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$46, %al
	jne	.L24
	addl	$1, 8(%ebp)
	jmp	.L25
.L26:
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
	jg	.L25
	subl	$1, -24(%ebp)
.L25:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$47, %al
	jle	.L24
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$57, %al
	jle	.L26
.L24:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$69, %al
	je	.L27
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$101, %al
	jne	.L28
.L27:
	movl	8(%ebp), %eax
	addl	$1, %eax
	subl	$12, %esp
	pushl	%eax
	call	_atoi@PLT
	addl	$16, %esp
	movl	%eax, -20(%ebp)
.L28:
	movl	-24(%ebp), %eax
	addl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	jle	.L33
	jmp	.L30
.L31:
	fldl	-16(%ebp)
	fldl	.LC1@GOTOFF(%ebx)
	fmulp	%st, %st(1)
	fstpl	-16(%ebp)
.L30:
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	%edx, -20(%ebp)
	testl	%eax, %eax
	jg	.L31
	jmp	.L32
.L34:
	fldl	-16(%ebp)
	fldl	.LC1@GOTOFF(%ebx)
	fdivrp	%st, %st(1)
	fstpl	-16(%ebp)
.L33:
	movl	-20(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -20(%ebp)
	testl	%eax, %eax
	js	.L34
.L32:
	cmpl	$0, -28(%ebp)
	jns	.L35
	fldl	-16(%ebp)
	fchs
	fstpl	-16(%ebp)
.L35:
	fldl	-16(%ebp)
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	_atod, .-_atod
	.globl	_dtoa
	.type	_dtoa, @function
_dtoa:
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
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	8(%ebp), %edx
	movl	%edx, -48(%ebp)
	movl	12(%ebp), %edx
	movl	%edx, -44(%ebp)
	movl	$0, -20(%ebp)
	cmpl	$0, 20(%ebp)
	jne	.L38
	leal	str.1480@GOTOFF(%eax), %edx
	movl	%edx, 20(%ebp)
.L38:
	fldl	-48(%ebp)
	fldz
	fucomip	%st(1), %st
	fstp	%st(0)
	jp	.L39
	fldl	-48(%ebp)
	fldz
	fucomip	%st(1), %st
	fstp	%st(0)
	jne	.L39
	movl	20(%ebp), %eax
	movb	$48, (%eax)
	movl	20(%ebp), %eax
	addl	$1, %eax
	movb	$0, (%eax)
	movl	20(%ebp), %eax
	jmp	.L41
.L39:
	fldl	-48(%ebp)
	fldz
	fucomip	%st(1), %st
	fstp	%st(0)
	jbe	.L42
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
.L42:
	fld1
	fldl	-48(%ebp)
	fucomip	%st(1), %st
	fstp	%st(0)
	jb	.L82
	fld1
	fstpl	-32(%ebp)
	movl	$0, -16(%ebp)
	jmp	.L46
.L50:
	fldl	-32(%ebp)
	fldl	.LC1@GOTOFF(%eax)
	fmulp	%st, %st(1)
	fldl	-48(%ebp)
	fxch	%st(1)
	fucomip	%st(1), %st
	fstp	%st(0)
	ja	.L84
	fldl	-32(%ebp)
	fldl	.LC1@GOTOFF(%eax)
	fmulp	%st, %st(1)
	fstpl	-32(%ebp)
	addl	$1, -16(%ebp)
.L46:
	fldl	-32(%ebp)
	fldl	.LC3@GOTOFF(%eax)
	fucomip	%st(1), %st
	fstp	%st(0)
	ja	.L50
	jmp	.L51
.L82:
	fldl	.LC4@GOTOFF(%eax)
	fstpl	-32(%ebp)
	movl	$-1, -16(%ebp)
	jmp	.L52
.L55:
	fldl	-32(%ebp)
	fldl	-48(%ebp)
	fucomip	%st(1), %st
	fstp	%st(0)
	jnb	.L85
	fldl	-32(%ebp)
	fldl	.LC1@GOTOFF(%eax)
	fdivrp	%st, %st(1)
	fstpl	-32(%ebp)
	subl	$1, -16(%ebp)
.L52:
	fldz
	fldl	-32(%ebp)
	fucomip	%st(1), %st
	fstp	%st(0)
	ja	.L55
	jmp	.L51
.L84:
	nop
	jmp	.L51
.L85:
	nop
.L51:
	fldl	-48(%ebp)
	fdivl	-32(%ebp)
	fstpl	-48(%ebp)
	movl	$0, -12(%ebp)
	jmp	.L56
.L61:
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
	jbe	.L57
	subl	$1, -36(%ebp)
.L57:
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
	jne	.L59
	movl	-20(%ebp), %edx
	leal	1(%edx), %ecx
	movl	%ecx, -20(%ebp)
	movl	%edx, %ecx
	movl	20(%ebp), %edx
	addl	%ecx, %edx
	movb	$46, (%edx)
.L59:
	fildl	-36(%ebp)
	fldl	-48(%ebp)
	fsubp	%st, %st(1)
	fldl	.LC1@GOTOFF(%eax)
	fmulp	%st, %st(1)
	fstpl	-48(%ebp)
	addl	$1, -12(%ebp)
.L56:
	movl	-12(%ebp), %edx
	cmpl	16(%ebp), %edx
	jge	.L60
	fldl	-48(%ebp)
	fldz
	fucomip	%st(1), %st
	fstp	%st(0)
	jp	.L61
	fldl	-48(%ebp)
	fldz
	fucomip	%st(1), %st
	fstp	%st(0)
	jne	.L61
.L60:
	fldl	.LC5@GOTOFF(%eax)
	fldl	-48(%ebp)
	fucomip	%st(1), %st
	fstp	%st(0)
	jb	.L83
	jmp	.L64
.L65:
	subl	$1, -20(%ebp)
.L64:
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$57, %al
	je	.L65
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$46, %al
	je	.L66
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %edx
	addl	$1, %edx
	movb	%dl, (%eax)
	jmp	.L69
.L66:
	subl	$1, -20(%ebp)
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$57, %al
	je	.L68
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %edx
	addl	$1, %edx
	movb	%dl, (%eax)
	jmp	.L69
.L68:
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movb	$49, (%eax)
	addl	$1, -16(%ebp)
	jmp	.L69
.L83:
	jmp	.L70
.L71:
	subl	$1, -20(%ebp)
.L70:
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$48, %al
	je	.L71
.L69:
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$46, %al
	jne	.L72
	subl	$1, -20(%ebp)
.L72:
	cmpl	$0, -16(%ebp)
	je	.L73
	movl	-20(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -20(%ebp)
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movb	$69, (%eax)
	cmpl	$0, -16(%ebp)
	jns	.L74
	movl	-20(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -20(%ebp)
	movl	%eax, %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movb	$45, (%eax)
	negl	-16(%ebp)
.L74:
	cmpl	$100, -16(%ebp)
	jle	.L75
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
	jmp	.L73
.L75:
	cmpl	$10, -16(%ebp)
	jle	.L76
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
	jmp	.L73
.L76:
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
.L73:
	movl	-20(%ebp), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	movl	20(%ebp), %eax
.L41:
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	_dtoa, .-_dtoa
	.globl	_atof
	.type	_atof, @function
_atof:
.LFB7:
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
.LFE7:
	.size	_atof, .-_atof
	.globl	_ftoa
	.type	_ftoa, @function
_ftoa:
.LFB8:
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
.LFE8:
	.size	_ftoa, .-_ftoa
	.local	str.1480
	.comm	str.1480,32,32
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
.LFB9:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE9:
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB10:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE10:
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
