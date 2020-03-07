	.file	"moo.c"
	.text
	.section	.rodata
.LC0:
	.string	"                 (__) \r\n"
.LC1:
	.string	"                 (oo) \r\n"
.LC2:
	.string	"           /------\\/ \r\n"
.LC3:
	.string	"          / |    ||   \r\n"
.LC4:
	.string	"         *  /\\---/\\ \r\n"
.LC5:
	.string	"            ~~   ~~   \r\n"
	.align 8
.LC6:
	.string	"...\"Have you mooed today?\"...\r\n"
.LC7:
	.string	"\r\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %r8d
	movl	$0, %ecx
	leaq	.LC0(%rip), %rdx
	movl	$0, %esi
	movl	$33, %edi
	movl	$0, %eax
	call	interrupt@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	leaq	.LC1(%rip), %rdx
	movl	$0, %esi
	movl	$33, %edi
	movl	$0, %eax
	call	interrupt@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	leaq	.LC2(%rip), %rdx
	movl	$0, %esi
	movl	$33, %edi
	movl	$0, %eax
	call	interrupt@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	leaq	.LC3(%rip), %rdx
	movl	$0, %esi
	movl	$33, %edi
	movl	$0, %eax
	call	interrupt@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	leaq	.LC4(%rip), %rdx
	movl	$0, %esi
	movl	$33, %edi
	movl	$0, %eax
	call	interrupt@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	leaq	.LC5(%rip), %rdx
	movl	$0, %esi
	movl	$33, %edi
	movl	$0, %eax
	call	interrupt@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	leaq	.LC6(%rip), %rdx
	movl	$0, %esi
	movl	$33, %edi
	movl	$0, %eax
	call	interrupt@PLT
	movl	$0, %r8d
	movl	$0, %ecx
	leaq	.LC7(%rip), %rdx
	movl	$0, %esi
	movl	$33, %edi
	movl	$0, %eax
	call	interrupt@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
