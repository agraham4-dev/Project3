	.file	"proj3.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"binary.out"
.LC2:
	.string	"%08x "
.LC3:
	.string	"%02x "
.LC4:
	.string	"|"
	.text
	.globl	main
	.type	main, @function
main:
.LFB22:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	fopen
	movq	%rax, 8(%rsp)
	testq	%rax, %rax
	je	.L18
	movl	$2, %edx
	movl	$0, %esi
	movq	8(%rsp), %r14
	movq	%r14, %rdi
	call	fseek
	movq	%r14, %rdi
	call	ftell
	movq	%rax, %rbx
	movl	%eax, 20(%rsp)
	movl	$0, %edx
	movl	$0, %esi
	movq	%r14, %rdi
	call	fseek
	movl	$1, %esi
	movl	$16, %edi
	call	calloc
	movq	%rax, %r15
	testl	%ebx, %ebx
	jle	.L3
	movl	$0, %r14d
	leaq	1(%rax), %rax
	movq	%rax, 24(%rsp)
	jmp	.L10
.L18:
	movl	$-1, %edi
	call	exit
.L7:
	movsbl	%dil, %edi
	call	putchar
.L8:
	addq	$1, %rbx
	cmpq	%r12, %rbx
	je	.L11
.L9:
	movzbl	(%rbx), %edi
	cmpb	$31, %dil
	jg	.L7
	movl	$46, %edi
	call	putchar
	jmp	.L8
.L4:
	movl	$124, %edi
	call	putchar
.L11:
	movl	$.LC4, %edi
	call	puts
	addl	%r13d, %r14d
	cmpl	%r14d, 20(%rsp)
	jle	.L3
.L10:
	movl	%r14d, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movq	8(%rsp), %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%r15, %rdi
	call	fread
	movq	%rax, %r13
	testl	%eax, %eax
	jle	.L4
	movq	%r15, %rbx
	leal	-1(%rax), %r12d
	addq	24(%rsp), %r12
	movq	%r15, %rbp
.L5:
	movzbl	0(%rbp), %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	addq	$1, %rbp
	cmpq	%r12, %rbp
	jne	.L5
	movl	$124, %edi
	call	putchar
	jmp	.L9
.L3:
	movq	%r15, %rdi
	call	free
	movq	8(%rsp), %rdi
	call	fclose
	movl	$0, %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
