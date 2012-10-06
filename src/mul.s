	.file	"mul.c"
	.text
.globl clean_stdin
	.type	clean_stdin, @function
clean_stdin:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
.L2:
	call	getchar
	movl	%eax, -4(%ebp)
	cmpl	$10, -4(%ebp)
	je	.L5
	cmpl	$-1, -4(%ebp)
	jne	.L2
.L5:
	leave
	ret
	.size	clean_stdin, .-clean_stdin
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.type	mul, @function
mul:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	leal	-4(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	scanf
	movl	%eax, -24(%ebp)
	cmpl	$0, -24(%ebp)
	je	.L9
	cmpl	$1, -24(%ebp)
	je	.L10
	cmpl	$-1, -24(%ebp)
	je	.L8
	jmp	.L7
.L8:
	movl	$1, -20(%ebp)
	jmp	.L11
.L9:
	call	clean_stdin
	movl	8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, (%esp)
	call	mul
	movl	%eax, -20(%ebp)
	jmp	.L11
.L10:
	movl	-4(%ebp), %eax
	testl	%eax, %eax
	je	.L12
	movl	8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, (%esp)
	call	mul
	movl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	%edx, %ecx
	imull	%eax, %ecx
	movl	%ecx, -20(%ebp)
	jmp	.L11
.L12:
	movl	$0, -20(%ebp)
	jmp	.L11
.L7:
	jmp	.L6
.L11:
	movl	-20(%ebp), %eax
	movl	%eax, -28(%ebp)
.L6:
	movl	-28(%ebp), %eax
	leave
	ret
	.size	mul, .-mul
	.section	.rodata
.LC1:
	.string	"A list of int, please"
.LC2:
	.string	"product = %d\n"
	.text
.globl main
	.type	main, @function
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ecx
	subl	$36, %esp
	movl	$.LC1, (%esp)
	call	puts
	movl	$0, (%esp)
	call	mul
	movl	%eax, -8(%ebp)
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC2, (%esp)
	call	printf
	addl	$36, %esp
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.1.2 20080704 (Red Hat 4.1.2-46)"
	.section	.note.GNU-stack,"",@progbits
