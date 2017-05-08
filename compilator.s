	.file	"compilator.c"
	.globl	firstToken
	.bss
	.align 8
	.type	firstToken, @object
	.size	firstToken, 8
firstToken:
	.zero	8
	.globl	lastToken
	.align 8
	.type	lastToken, @object
	.size	lastToken, 8
lastToken:
	.zero	8
	.globl	currentToken
	.align 8
	.type	currentToken, @object
	.size	currentToken, 8
currentToken:
	.zero	8
	.globl	consumedToken
	.align 8
	.type	consumedToken, @object
	.size	consumedToken, 8
consumedToken:
	.zero	8
	.comm	syntacticAnalysisLogFile,4,4
	.comm	symbols,24,16
	.globl	crtDepth
	.align 4
	.type	crtDepth, @object
	.size	crtDepth, 4
crtDepth:
	.zero	4
	.globl	crtFunc
	.align 8
	.type	crtFunc, @object
	.size	crtFunc, 8
crtFunc:
	.zero	8
	.globl	crtStruct
	.align 8
	.type	crtStruct, @object
	.size	crtStruct, 8
crtStruct:
	.zero	8
	.text
	.globl	initSymbols
	.type	initSymbols, @function
initSymbols:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	initSymbols, .-initSymbols
	.section	.rodata
.LC0:
	.string	"Not enough memory.\n"
	.text
	.globl	addSymbol
	.type	addSymbol, @function
addSymbol:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L3
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	sarq	$3, %rax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L4
	movl	$1, -4(%rbp)
.L4:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L5
	movl	$28, %esi
	movl	$.LC0, %edi
	call	error
.L5:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 16(%rax)
.L3:
	movl	$72, %edi
	call	malloc
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	leaq	8(%rax), %rcx
	movq	-24(%rbp), %rdx
	movq	%rcx, 8(%rdx)
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movl	-36(%rbp), %edx
	movl	%edx, 8(%rax)
	movl	crtDepth(%rip), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 40(%rax)
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	addSymbol, .-addSymbol
	.globl	findSymbol
	.type	findSymbol, @function
findSymbol:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L8
.L11:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L9
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	jmp	.L10
.L9:
	addq	$8, -8(%rbp)
.L8:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	-8(%rbp), %rax
	jne	.L11
	movl	$0, %eax
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	findSymbol, .-findSymbol
	.globl	consume
	.type	consume, @function
consume:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movq	currentToken(%rip), %rax
	movl	(%rax), %eax
	cmpl	-4(%rbp), %eax
	jne	.L13
	movq	currentToken(%rip), %rax
	movq	%rax, consumedToken(%rip)
	movq	currentToken(%rip), %rax
	movq	16(%rax), %rax
	movq	%rax, currentToken(%rip)
	movl	$1, %eax
	jmp	.L14
.L13:
	movl	$0, %eax
.L14:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	consume, .-consume
	.section	.rodata
.LC1:
	.string	"No error message to show.\n"
	.align 8
.LC2:
	.string	"ERROR: At line %d -> Expected token of type: %s\n"
	.text
	.globl	syntacticErrorForTypes
	.type	syntacticErrorForTypes, @function
syntacticErrorForTypes:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movl	-68(%rbp), %eax
	movl	%eax, %edi
	call	codeToStringForTypes
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L16
	movl	$.LC1, %edi
	call	perror
	movl	$16, %edi
	call	exit
.L16:
	movq	currentToken(%rip), %rax
	movl	4(%rax), %edx
	movq	-8(%rbp), %rcx
	leaq	-64(%rbp), %rax
	movl	$.LC2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	perror
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$15, %edi
	call	exit
	.cfi_endproc
.LFE6:
	.size	syntacticErrorForTypes, .-syntacticErrorForTypes
	.section	.rodata
	.align 8
.LC3:
	.string	"ERROR: At line %d -> Expected keyword: %s\n"
	.text
	.globl	syntacticErrorForKeywords
	.type	syntacticErrorForKeywords, @function
syntacticErrorForKeywords:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movl	-68(%rbp), %eax
	movl	%eax, %edi
	call	codeToStringForKeywords
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L18
	movl	$.LC1, %edi
	call	perror
	movl	$16, %edi
	call	exit
.L18:
	movq	currentToken(%rip), %rax
	movl	4(%rax), %edx
	movq	-8(%rbp), %rcx
	leaq	-64(%rbp), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	perror
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$15, %edi
	call	exit
	.cfi_endproc
.LFE7:
	.size	syntacticErrorForKeywords, .-syntacticErrorForKeywords
	.section	.rodata
	.align 8
.LC4:
	.string	"ERROR: At line %d -> Expected delimiter: %s\n"
	.text
	.globl	syntacticErrorForDelimiters
	.type	syntacticErrorForDelimiters, @function
syntacticErrorForDelimiters:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movl	-68(%rbp), %eax
	movl	%eax, %edi
	call	codeToStringForDelimiters
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L20
	movl	$.LC1, %edi
	call	perror
	movl	$16, %edi
	call	exit
.L20:
	movq	currentToken(%rip), %rax
	movl	4(%rax), %edx
	movq	-8(%rbp), %rcx
	leaq	-64(%rbp), %rax
	movl	$.LC4, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	perror
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$15, %edi
	call	exit
	.cfi_endproc
.LFE8:
	.size	syntacticErrorForDelimiters, .-syntacticErrorForDelimiters
	.section	.rodata
	.align 8
.LC5:
	.string	"ERROR: At line %d -> Expected operator: %s\n"
	.text
	.globl	syntacticErrorForOperators
	.type	syntacticErrorForOperators, @function
syntacticErrorForOperators:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movl	-68(%rbp), %eax
	movl	%eax, %edi
	call	codeToStringForOperators
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L22
	movl	$.LC1, %edi
	call	perror
	movl	$16, %edi
	call	exit
.L22:
	movq	currentToken(%rip), %rax
	movl	4(%rax), %edx
	movq	-8(%rbp), %rcx
	leaq	-64(%rbp), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	perror
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$15, %edi
	call	exit
	.cfi_endproc
.LFE9:
	.size	syntacticErrorForOperators, .-syntacticErrorForOperators
	.section	.rodata
	.align 8
.LC6:
	.string	"ERROR: At line %d -> Expected %s\n"
	.text
	.globl	syntacticErrorForOthers
	.type	syntacticErrorForOthers, @function
syntacticErrorForOthers:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movq	currentToken(%rip), %rax
	movl	4(%rax), %edx
	movq	-72(%rbp), %rcx
	leaq	-64(%rbp), %rax
	movl	$.LC6, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	perror
	movl	$15, %edi
	call	exit
	.cfi_endproc
.LFE10:
	.size	syntacticErrorForOthers, .-syntacticErrorForOthers
	.globl	unit
	.type	unit, @function
unit:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -32(%rbp)
	movabsq	$8388357230288596841, %rax
	movq	%rax, -24(%rbp)
	movl	$774777128, -16(%rbp)
	movw	$46, -12(%rbp)
	movb	$10, -33(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-32(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-33(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
.L27:
	call	declStruct
	testl	%eax, %eax
	jne	.L25
	call	declFunc
	testl	%eax, %eax
	jne	.L25
	call	declVar
	testl	%eax, %eax
	jne	.L25
	nop
	movl	$0, %edi
	call	consume
	testl	%eax, %eax
	jne	.L28
	jmp	.L30
.L25:
	jmp	.L27
.L30:
	movl	$0, %edi
	call	syntacticErrorForTypes
.L28:
	movl	$1, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	unit, .-unit
	.globl	declStruct
	.type	declStruct, @function
declStruct:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$7810197659505815401, %rax
	movq	%rax, -40(%rbp)
	movabsq	$2965748325144491091, %rax
	movq	%rax, -32(%rbp)
	movl	$3026478, -24(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	movl	$10, %edi
	call	consume
	testl	%eax, %eax
	je	.L32
	movl	$1, %edi
	call	consume
	testl	%eax, %eax
	jne	.L33
	movl	$1, %edi
	call	syntacticErrorForTypes
.L33:
	movl	$23, %edi
	call	consume
	testl	%eax, %eax
	jne	.L34
	movabsq	$8462954551432144228, %rax
	movq	%rax, -144(%rbp)
	movabsq	$7959380204762723427, %rax
	movq	%rax, -136(%rbp)
	movabsq	$7018332727991170147, %rax
	movq	%rax, -128(%rbp)
	movabsq	$12998625716431977, %rax
	movq	%rax, -120(%rbp)
	movb	$10, -99(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-144(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-99(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movl	$0, %eax
	jmp	.L41
.L34:
	call	declVar
	testl	%eax, %eax
	jne	.L36
	nop
	movl	$24, %edi
	call	consume
	testl	%eax, %eax
	jne	.L38
	jmp	.L42
.L36:
	jmp	.L34
.L42:
	movl	$24, %edi
	call	syntacticErrorForDelimiters
.L38:
	movl	$18, %edi
	call	consume
	testl	%eax, %eax
	jne	.L39
	movl	$18, %edi
	call	syntacticErrorForDelimiters
.L39:
	movabsq	$8462954551432144228, %rax
	movq	%rax, -144(%rbp)
	movabsq	$7959380204762723427, %rax
	movq	%rax, -136(%rbp)
	movabsq	$8463143783446967395, %rax
	movq	%rax, -128(%rbp)
	movabsq	$3327707561312215907, %rax
	movq	%rax, -120(%rbp)
	movw	$46, -112(%rbp)
	movb	$10, -98(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-144(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-98(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L41
.L32:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$8462954551432144228, %rax
	movq	%rax, -96(%rbp)
	movabsq	$7959380204762723427, %rax
	movq	%rax, -88(%rbp)
	movabsq	$7018332727991170147, %rax
	movq	%rax, -80(%rbp)
	movabsq	$12998625716431977, %rax
	movq	%rax, -72(%rbp)
	movb	$10, -97(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-96(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-97(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L41:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	declStruct, .-declStruct
	.globl	declVar
	.type	declVar, @function
declVar:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$7810197659505815401, %rax
	movq	%rax, -40(%rbp)
	movabsq	$3327647928980496726, %rax
	movq	%rax, -32(%rbp)
	movb	$0, -24(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	call	typeBase
	testl	%eax, %eax
	je	.L44
	movl	$1, %edi
	call	consume
	testl	%eax, %eax
	jne	.L45
	movl	$1, %edi
	call	syntacticErrorForTypes
.L45:
	call	arrayDecl
.L50:
	movl	$17, %edi
	call	consume
	testl	%eax, %eax
	je	.L46
	movl	$1, %edi
	call	consume
	testl	%eax, %eax
	jne	.L47
	movl	$1, %edi
	call	syntacticErrorForTypes
.L47:
	call	arrayDecl
	jmp	.L54
.L46:
	nop
	movl	$18, %edi
	call	consume
	testl	%eax, %eax
	jne	.L51
	jmp	.L55
.L54:
	jmp	.L50
.L55:
	movl	$18, %edi
	call	syntacticErrorForDelimiters
.L51:
	movabsq	$2914498932675667300, %rax
	movq	%rax, -112(%rbp)
	movabsq	$7598807797348048937, %rax
	movq	%rax, -104(%rbp)
	movabsq	$7305792376618905199, %rax
	movq	%rax, -96(%rbp)
	movl	$778331492, -88(%rbp)
	movw	$11822, -84(%rbp)
	movb	$0, -82(%rbp)
	movb	$10, -113(%rbp)
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-112(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-113(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L53
.L44:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$2914498932675667300, %rax
	movq	%rax, -80(%rbp)
	movabsq	$7598807797348048937, %rax
	movq	%rax, -72(%rbp)
	movabsq	$7308332162361618031, %rax
	movq	%rax, -64(%rbp)
	movl	$774778468, -56(%rbp)
	movb	$0, -52(%rbp)
	movb	$10, -81(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-81(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L53:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	declVar, .-declVar
	.globl	typeBase
	.type	typeBase, @function
typeBase:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$7309475734889590633, %rax
	movq	%rax, -40(%rbp)
	movabsq	$3327642428150866242, %rax
	movq	%rax, -32(%rbp)
	movw	$46, -24(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	movl	$8, %edi
	call	consume
	testl	%eax, %eax
	je	.L57
	movabsq	$7310293557950052724, %rax
	movq	%rax, -144(%rbp)
	movabsq	$8386668381597608232, %rax
	movq	%rax, -136(%rbp)
	movabsq	$7161696969775017833, %rax
	movq	%rax, -128(%rbp)
	movabsq	$8388366761961284709, %rax
	movq	%rax, -120(%rbp)
	movabsq	$3327648114298921064, %rax
	movq	%rax, -112(%rbp)
	movb	$0, -104(%rbp)
	movb	$10, -82(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-144(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-82(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L63
.L57:
	movl	$4, %edi
	call	consume
	testl	%eax, %eax
	je	.L59
	movabsq	$7310293557950052724, %rax
	movq	%rax, -144(%rbp)
	movabsq	$8386668381597608232, %rax
	movq	%rax, -136(%rbp)
	movabsq	$7161696969775017833, %rax
	movq	%rax, -128(%rbp)
	movabsq	$8388366761961284709, %rax
	movq	%rax, -120(%rbp)
	movabsq	$4993439021016555624, %rax
	movq	%rax, -112(%rbp)
	movl	$3026478, -104(%rbp)
	movb	$10, -83(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-144(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-83(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L63
.L59:
	movl	$3, %edi
	call	consume
	testl	%eax, %eax
	je	.L60
	movabsq	$7310293557950052724, %rax
	movq	%rax, -144(%rbp)
	movabsq	$8386668381597608232, %rax
	movq	%rax, -136(%rbp)
	movabsq	$7161696969775017833, %rax
	movq	%rax, -128(%rbp)
	movabsq	$8388366761961284709, %rax
	movq	%rax, -120(%rbp)
	movabsq	$3327687615012085864, %rax
	movq	%rax, -112(%rbp)
	movw	$46, -104(%rbp)
	movb	$10, -84(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-144(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-84(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L63
.L60:
	movl	$10, %edi
	call	consume
	testl	%eax, %eax
	je	.L61
	movl	$1, %edi
	call	consume
	testl	%eax, %eax
	jne	.L62
	movl	$1, %edi
	call	syntacticErrorForTypes
.L62:
	movabsq	$7310293557950052724, %rax
	movq	%rax, -144(%rbp)
	movabsq	$8386668381597608232, %rax
	movq	%rax, -136(%rbp)
	movabsq	$7161696969775017833, %rax
	movq	%rax, -128(%rbp)
	movabsq	$8388366761961284709, %rax
	movq	%rax, -120(%rbp)
	movabsq	$6071790534715973736, %rax
	movq	%rax, -112(%rbp)
	movl	$776227104, -104(%rbp)
	movw	$11822, -100(%rbp)
	movb	$0, -98(%rbp)
	movb	$10, -85(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-144(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-85(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L63
.L61:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$7310293557950052724, %rax
	movq	%rax, -80(%rbp)
	movabsq	$8386668381597608232, %rax
	movq	%rax, -72(%rbp)
	movabsq	$7811882119909502825, %rax
	movq	%rax, -64(%rbp)
	movl	$774792293, -56(%rbp)
	movw	$46, -52(%rbp)
	movb	$10, -81(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-81(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L63:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	typeBase, .-typeBase
	.globl	arrayDecl
	.type	arrayDecl, @function
arrayDecl:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$7021800530505527145, %rax
	movq	%rax, -40(%rbp)
	movabsq	$3326234245778982009, %rax
	movq	%rax, -32(%rbp)
	movw	$11822, -24(%rbp)
	movb	$0, -22(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	movl	$21, %edi
	call	consume
	testl	%eax, %eax
	je	.L65
	call	expr
	movl	$22, %edi
	call	consume
	testl	%eax, %eax
	jne	.L66
	movl	$22, %edi
	call	syntacticErrorForDelimiters
.L66:
	movabsq	$7162206070519263841, %rax
	movq	%rax, -144(%rbp)
	movabsq	$7164793138679720044, %rax
	movq	%rax, -136(%rbp)
	movabsq	$7166760965158955380, %rax
	movq	%rax, -128(%rbp)
	movabsq	$3327648183406060899, %rax
	movq	%rax, -120(%rbp)
	movb	$0, -112(%rbp)
	movb	$10, -98(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-144(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-98(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L68
.L65:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$7162206070519263841, %rax
	movq	%rax, -96(%rbp)
	movabsq	$7164793138679720044, %rax
	movq	%rax, -88(%rbp)
	movabsq	$7018332727991170153, %rax
	movq	%rax, -80(%rbp)
	movabsq	$12998625716431977, %rax
	movq	%rax, -72(%rbp)
	movb	$10, -97(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-96(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-97(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L68:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	arrayDecl, .-arrayDecl
	.globl	typeName
	.type	typeName, @function
typeName:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$7309475734889590633, %rax
	movq	%rax, -40(%rbp)
	movabsq	$3327642428150473038, %rax
	movq	%rax, -32(%rbp)
	movw	$46, -24(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	call	typeBase
	testl	%eax, %eax
	je	.L70
	call	arrayDecl
	movabsq	$7308604759629396340, %rax
	movq	%rax, -128(%rbp)
	movabsq	$8386668381597608232, %rax
	movq	%rax, -120(%rbp)
	movabsq	$7161696969775017833, %rax
	movq	%rax, -112(%rbp)
	movabsq	$12998625716429925, %rax
	movq	%rax, -104(%rbp)
	movb	$10, -82(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-82(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L72
.L70:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$7308604759629396340, %rax
	movq	%rax, -80(%rbp)
	movabsq	$8386668381597608232, %rax
	movq	%rax, -72(%rbp)
	movabsq	$7811882119909502825, %rax
	movq	%rax, -64(%rbp)
	movl	$774792293, -56(%rbp)
	movw	$46, -52(%rbp)
	movb	$10, -81(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-81(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L72:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	typeName, .-typeName
	.section	.rodata
.LC7:
	.string	"funcArg"
.LC8:
	.string	"stmCompound"
	.text
	.globl	declFunc
	.type	declFunc, @function
declFunc:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$7810197659505815401, %rax
	movq	%rax, -40(%rbp)
	movabsq	$3327642428116989254, %rax
	movq	%rax, -32(%rbp)
	movw	$46, -24(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
	call	typeBase
	testl	%eax, %eax
	je	.L74
	movl	$27, %edi
	call	consume
	testl	%eax, %eax
	je	.L75
	movl	$1, -4(%rbp)
.L75:
	movl	$1, %edi
	call	consume
	testl	%eax, %eax
	jne	.L76
	movl	$1, %edi
	call	syntacticErrorForTypes
.L76:
	movl	$19, %edi
	call	consume
	testl	%eax, %eax
	jne	.L77
	cmpl	$0, -4(%rbp)
	je	.L78
	movl	$19, %edi
	call	syntacticErrorForDelimiters
	jmp	.L77
.L78:
	movq	-16(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$7164793002519651684, %rax
	movq	%rax, -112(%rbp)
	movabsq	$8386668381597608232, %rax
	movq	%rax, -104(%rbp)
	movabsq	$7811882119909502825, %rax
	movq	%rax, -96(%rbp)
	movl	$774792293, -88(%rbp)
	movw	$46, -84(%rbp)
	movb	$10, -113(%rbp)
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-112(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-113(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
	jmp	.L98
.L77:
	call	funcArg
	testl	%eax, %eax
	je	.L80
.L84:
	movl	$17, %edi
	call	consume
	testl	%eax, %eax
	je	.L81
	call	funcArg
	testl	%eax, %eax
	jne	.L83
	movl	$.LC7, %edi
	call	syntacticErrorForOthers
	jmp	.L84
.L81:
	jmp	.L80
.L83:
	jmp	.L84
.L80:
	movl	$20, %edi
	call	consume
	testl	%eax, %eax
	jne	.L85
	movl	$20, %edi
	call	syntacticErrorForDelimiters
.L85:
	call	stmCompound
	testl	%eax, %eax
	jne	.L86
	movl	$.LC8, %edi
	call	syntacticErrorForOthers
.L86:
	movabsq	$7164793002519651684, %rax
	movq	%rax, -160(%rbp)
	movabsq	$8386668381597608232, %rax
	movq	%rax, -152(%rbp)
	movabsq	$7161696969775017833, %rax
	movq	%rax, -144(%rbp)
	movabsq	$12998625716429925, %rax
	movq	%rax, -136(%rbp)
	movb	$10, -82(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-160(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-82(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L98
.L74:
	movq	-16(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movl	$11, %edi
	call	consume
	testl	%eax, %eax
	je	.L88
	movl	$1, %edi
	call	consume
	testl	%eax, %eax
	jne	.L89
	movl	$1, %edi
	call	syntacticErrorForTypes
.L89:
	movl	$19, %edi
	call	consume
	testl	%eax, %eax
	jne	.L90
	movl	$19, %edi
	call	syntacticErrorForDelimiters
.L90:
	call	funcArg
	testl	%eax, %eax
	je	.L91
.L95:
	movl	$17, %edi
	call	consume
	testl	%eax, %eax
	je	.L92
	call	funcArg
	testl	%eax, %eax
	jne	.L94
	movl	$.LC7, %edi
	call	syntacticErrorForOthers
	jmp	.L95
.L92:
	jmp	.L91
.L94:
	jmp	.L95
.L91:
	movl	$20, %edi
	call	consume
	testl	%eax, %eax
	jne	.L96
	movl	$20, %edi
	call	syntacticErrorForDelimiters
.L96:
	call	stmCompound
	testl	%eax, %eax
	jne	.L97
	movl	$.LC8, %edi
	call	syntacticErrorForOthers
.L97:
	movabsq	$7164793002519651684, %rax
	movq	%rax, -160(%rbp)
	movabsq	$8386668381597608232, %rax
	movq	%rax, -152(%rbp)
	movabsq	$7161696969775017833, %rax
	movq	%rax, -144(%rbp)
	movabsq	$12998625716429925, %rax
	movq	%rax, -136(%rbp)
	movb	$10, -114(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-160(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-114(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L98
.L88:
	movq	-16(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$7164793002519651684, %rax
	movq	%rax, -80(%rbp)
	movabsq	$8386668381597608232, %rax
	movq	%rax, -72(%rbp)
	movabsq	$7811882119909502825, %rax
	movq	%rax, -64(%rbp)
	movl	$774792293, -56(%rbp)
	movw	$46, -52(%rbp)
	movb	$10, -81(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-81(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L98:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	declFunc, .-declFunc
	.globl	funcArg
	.type	funcArg, @function
funcArg:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$7164793138684260201, %rax
	movq	%rax, -40(%rbp)
	movabsq	$3327647928979780161, %rax
	movq	%rax, -32(%rbp)
	movb	$0, -24(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	call	typeBase
	testl	%eax, %eax
	je	.L100
	movl	$1, %edi
	call	consume
	testl	%eax, %eax
	jne	.L101
	movl	$1, %edi
	call	syntacticErrorForTypes
.L101:
	call	arrayDecl
	movabsq	$2911421309284939110, %rax
	movq	%rax, -112(%rbp)
	movabsq	$7598807797348048937, %rax
	movq	%rax, -104(%rbp)
	movabsq	$7305792376618905199, %rax
	movq	%rax, -96(%rbp)
	movl	$778331492, -88(%rbp)
	movw	$11822, -84(%rbp)
	movb	$0, -82(%rbp)
	movb	$10, -113(%rbp)
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-112(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-113(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L103
.L100:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$2911421309284939110, %rax
	movq	%rax, -80(%rbp)
	movabsq	$7598807797348048937, %rax
	movq	%rax, -72(%rbp)
	movabsq	$7308332162361618031, %rax
	movq	%rax, -64(%rbp)
	movl	$774778468, -56(%rbp)
	movb	$0, -52(%rbp)
	movb	$10, -81(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-81(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L103:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	funcArg, .-funcArg
	.section	.rodata
.LC9:
	.string	"expr"
.LC10:
	.string	"stm"
	.text
	.globl	stm
	.type	stm, @function
stm:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -32(%rbp)
	movabsq	$2913112571792748393, %rax
	movq	%rax, -24(%rbp)
	movl	$774778409, -16(%rbp)
	movb	$0, -12(%rbp)
	movb	$10, -33(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-32(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-33(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	call	stmCompound
	testl	%eax, %eax
	je	.L105
	movabsq	$8459484311206065267, %rax
	movq	%rax, -128(%rbp)
	movabsq	$8295751938406114158, %rax
	movq	%rax, -120(%rbp)
	movabsq	$2334101988756906869, %rax
	movq	%rax, -112(%rbp)
	movabsq	$7887055430461188471, %rax
	movq	%rax, -104(%rbp)
	movabsq	$7236850772719005507, %rax
	movq	%rax, -96(%rbp)
	movl	$774777128, -88(%rbp)
	movw	$46, -84(%rbp)
	movb	$10, -66(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-66(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L131
.L105:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movl	$7, %edi
	call	consume
	testl	%eax, %eax
	je	.L107
	movl	$19, %edi
	call	consume
	testl	%eax, %eax
	jne	.L108
	movl	$19, %edi
	call	syntacticErrorForDelimiters
.L108:
	call	expr
	testl	%eax, %eax
	jne	.L109
	movl	$.LC9, %edi
	call	syntacticErrorForOthers
.L109:
	movl	$20, %edi
	call	consume
	testl	%eax, %eax
	jne	.L110
	movl	$20, %edi
	call	syntacticErrorForDelimiters
.L110:
	call	stm
	testl	%eax, %eax
	jne	.L111
	movl	$.LC10, %edi
	call	syntacticErrorForOthers
.L111:
	movl	$5, %edi
	call	consume
	testl	%eax, %eax
	je	.L112
	call	stm
	testl	%eax, %eax
	jne	.L112
	movl	$.LC10, %edi
	call	syntacticErrorForOthers
.L112:
	movabsq	$8459484311206065267, %rax
	movq	%rax, -128(%rbp)
	movabsq	$8295751938406114158, %rax
	movq	%rax, -120(%rbp)
	movabsq	$2334101988756906869, %rax
	movq	%rax, -112(%rbp)
	movabsq	$2325626661123680631, %rax
	movq	%rax, -104(%rbp)
	movabsq	$3327711950936306274, %rax
	movq	%rax, -96(%rbp)
	movw	$46, -88(%rbp)
	movb	$10, -67(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-67(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L131
.L107:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movl	$12, %edi
	call	consume
	testl	%eax, %eax
	je	.L113
	movl	$19, %edi
	call	consume
	testl	%eax, %eax
	jne	.L114
	movl	$19, %edi
	call	syntacticErrorForDelimiters
.L114:
	call	expr
	testl	%eax, %eax
	jne	.L115
	movl	$.LC9, %edi
	call	syntacticErrorForOthers
.L115:
	movl	$20, %edi
	call	consume
	testl	%eax, %eax
	jne	.L116
	movl	$20, %edi
	call	syntacticErrorForDelimiters
.L116:
	call	stm
	testl	%eax, %eax
	jne	.L117
	movl	$.LC10, %edi
	call	syntacticErrorForOthers
.L117:
	movabsq	$8459484311206065267, %rax
	movq	%rax, -128(%rbp)
	movabsq	$8295751938406114158, %rax
	movq	%rax, -120(%rbp)
	movabsq	$2334101988756906869, %rax
	movq	%rax, -112(%rbp)
	movabsq	$5280566359794936183, %rax
	movq	%rax, -104(%rbp)
	movabsq	$7164771201093485900, %rax
	movq	%rax, -96(%rbp)
	movl	$774778472, -88(%rbp)
	movb	$0, -84(%rbp)
	movb	$10, -68(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-68(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L131
.L113:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movl	$6, %edi
	call	consume
	testl	%eax, %eax
	je	.L118
	movl	$19, %edi
	call	consume
	testl	%eax, %eax
	jne	.L119
	movl	$19, %edi
	call	syntacticErrorForDelimiters
.L119:
	call	expr
	movl	$18, %edi
	call	consume
	testl	%eax, %eax
	jne	.L120
	movl	$18, %edi
	call	syntacticErrorForDelimiters
.L120:
	call	expr
	movl	$18, %edi
	call	consume
	testl	%eax, %eax
	jne	.L121
	movl	$18, %edi
	call	syntacticErrorForDelimiters
.L121:
	call	expr
	movl	$20, %edi
	call	consume
	testl	%eax, %eax
	jne	.L122
	movl	$20, %edi
	call	syntacticErrorForDelimiters
.L122:
	call	stm
	testl	%eax, %eax
	jne	.L123
	movl	$.LC10, %edi
	call	syntacticErrorForOthers
.L123:
	movabsq	$8459484311206065267, %rax
	movq	%rax, -128(%rbp)
	movabsq	$8295751938406114158, %rax
	movq	%rax, -120(%rbp)
	movabsq	$2334101988756906869, %rax
	movq	%rax, -112(%rbp)
	movabsq	$5931036339275590007, %rax
	movq	%rax, -104(%rbp)
	movabsq	$3344032049055031840, %rax
	movq	%rax, -96(%rbp)
	movw	$11822, -88(%rbp)
	movb	$0, -86(%rbp)
	movb	$10, -69(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-69(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L131
.L118:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movl	$2, %edi
	call	consume
	testl	%eax, %eax
	je	.L124
	movl	$18, %edi
	call	consume
	testl	%eax, %eax
	jne	.L125
	movl	$18, %edi
	call	syntacticErrorForDelimiters
.L125:
	movabsq	$8459484311206065267, %rax
	movq	%rax, -128(%rbp)
	movabsq	$8295751938406114158, %rax
	movq	%rax, -120(%rbp)
	movabsq	$2334101988756906869, %rax
	movq	%rax, -112(%rbp)
	movabsq	$4995127643666147703, %rax
	movq	%rax, -104(%rbp)
	movabsq	$7164771201093487425, %rax
	movq	%rax, -96(%rbp)
	movl	$774778472, -88(%rbp)
	movb	$0, -84(%rbp)
	movb	$10, -70(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-70(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L131
.L124:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movl	$9, %edi
	call	consume
	testl	%eax, %eax
	je	.L126
	call	expr
	movl	$18, %edi
	call	consume
	testl	%eax, %eax
	jne	.L127
	movl	$18, %edi
	call	syntacticErrorForDelimiters
.L127:
	movabsq	$8459484311206065267, %rax
	movq	%rax, -128(%rbp)
	movabsq	$8295751938406114158, %rax
	movq	%rax, -120(%rbp)
	movabsq	$2334101988756906869, %rax
	movq	%rax, -112(%rbp)
	movabsq	$6072349971723872631, %rax
	movq	%rax, -104(%rbp)
	movabsq	$7953764182687371861, %rax
	movq	%rax, -96(%rbp)
	movl	$774793315, -88(%rbp)
	movw	$46, -84(%rbp)
	movb	$10, -71(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-71(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L131
.L126:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	call	expr
	testl	%eax, %eax
	je	.L128
	movl	$18, %edi
	call	consume
	testl	%eax, %eax
	jne	.L129
	movl	$18, %edi
	call	syntacticErrorForDelimiters
.L129:
	movabsq	$8459484311206065267, %rax
	movq	%rax, -128(%rbp)
	movabsq	$8295751938406114158, %rax
	movq	%rax, -120(%rbp)
	movabsq	$2334101988756906869, %rax
	movq	%rax, -112(%rbp)
	movabsq	$8104338719319026039, %rax
	movq	%rax, -104(%rbp)
	movabsq	$7953764182684936306, %rax
	movq	%rax, -96(%rbp)
	movl	$774793315, -88(%rbp)
	movw	$46, -84(%rbp)
	movb	$10, -72(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-72(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L131
.L128:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movl	$18, %edi
	call	consume
	testl	%eax, %eax
	je	.L130
	movabsq	$8459484311206065267, %rax
	movq	%rax, -128(%rbp)
	movabsq	$8295751938406114158, %rax
	movq	%rax, -120(%rbp)
	movabsq	$2334101988756906869, %rax
	movq	%rax, -112(%rbp)
	movabsq	$5567947912970004855, %rax
	movq	%rax, -104(%rbp)
	movabsq	$3327683277163021129, %rax
	movq	%rax, -96(%rbp)
	movw	$46, -88(%rbp)
	movb	$10, -73(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-73(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L131
.L130:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$8459484311206065267, %rax
	movq	%rax, -64(%rbp)
	movabsq	$7359003215913050990, %rax
	movq	%rax, -56(%rbp)
	movabsq	$3327648183406586209, %rax
	movq	%rax, -48(%rbp)
	movb	$0, -40(%rbp)
	movb	$10, -65(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-64(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-65(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L131:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	stm, .-stm
	.globl	stmCompound
	.type	stmCompound, @function
stmCompound:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$4858667610816802665, %rax
	movq	%rax, -40(%rbp)
	movabsq	$2910572709848051055, %rax
	movq	%rax, -32(%rbp)
	movl	$774778409, -24(%rbp)
	movb	$0, -20(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	movl	$23, %edi
	call	consume
	testl	%eax, %eax
	je	.L133
.L136:
	call	declVar
	testl	%eax, %eax
	jne	.L134
	call	stm
	testl	%eax, %eax
	jne	.L134
	nop
	movl	$24, %edi
	call	consume
	testl	%eax, %eax
	jne	.L137
	jmp	.L140
.L134:
	jmp	.L136
.L140:
	movl	$24, %edi
	call	syntacticErrorForDelimiters
.L137:
	movabsq	$8030038460241638515, %rax
	movq	%rax, -144(%rbp)
	movabsq	$8459484311205473909, %rax
	movq	%rax, -136(%rbp)
	movabsq	$8295751938406114158, %rax
	movq	%rax, -128(%rbp)
	movabsq	$3342908305287897973, %rax
	movq	%rax, -120(%rbp)
	movw	$11822, -112(%rbp)
	movb	$0, -110(%rbp)
	movb	$10, -98(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-144(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-98(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L139
.L133:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$8030038460241638515, %rax
	movq	%rax, -96(%rbp)
	movabsq	$7959380204762719342, %rax
	movq	%rax, -88(%rbp)
	movabsq	$7018332727991170147, %rax
	movq	%rax, -80(%rbp)
	movabsq	$12998625716431977, %rax
	movq	%rax, -72(%rbp)
	movb	$10, -97(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-96(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-97(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L139:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	stmCompound, .-stmCompound
	.globl	expr
	.type	expr, @function
expr:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -32(%rbp)
	movabsq	$8246223293446516585, %rax
	movq	%rax, -24(%rbp)
	movl	$774777128, -16(%rbp)
	movw	$46, -12(%rbp)
	movb	$10, -33(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-32(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-33(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	call	exprAssign
	testl	%eax, %eax
	je	.L142
	movabsq	$7358927044818794597, %rax
	movq	%rax, -96(%rbp)
	movabsq	$2336927755366788725, %rax
	movq	%rax, -88(%rbp)
	movabsq	$7234298763062506867, %rax
	movq	%rax, -80(%rbp)
	movl	$3026478, -72(%rbp)
	movb	$10, -97(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-96(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-97(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L144
.L142:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$7358927044818794597, %rax
	movq	%rax, -64(%rbp)
	movabsq	$2336927755366788725, %rax
	movq	%rax, -56(%rbp)
	movabsq	$3327707561446695270, %rax
	movq	%rax, -48(%rbp)
	movw	$46, -40(%rbp)
	movb	$10, -65(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-64(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-65(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L144:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	expr, .-expr
	.section	.rodata
.LC11:
	.string	"exprAssign"
	.text
	.globl	exprAssign
	.type	exprAssign, @function
exprAssign:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$8246223293446516585, %rax
	movq	%rax, -40(%rbp)
	movabsq	$2965741745053332289, %rax
	movq	%rax, -32(%rbp)
	movl	$3026478, -24(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	call	exprUnary
	testl	%eax, %eax
	je	.L146
	movl	$33, %edi
	call	consume
	testl	%eax, %eax
	je	.L146
	call	exprAssign
	testl	%eax, %eax
	jne	.L147
	movl	$.LC11, %edi
	call	syntacticErrorForOthers
.L147:
	movabsq	$7598543721234200677, %rax
	movq	%rax, -160(%rbp)
	movabsq	$7959380204762721895, %rax
	movq	%rax, -152(%rbp)
	movabsq	$8463143783446967395, %rax
	movq	%rax, -144(%rbp)
	movabsq	$8583971276407006051, %rax
	movq	%rax, -136(%rbp)
	movabsq	$8246223293446124649, %rax
	movq	%rax, -128(%rbp)
	movabsq	$8242185974023548501, %rax
	movq	%rax, -120(%rbp)
	movabsq	$12998625783410273, %rax
	movq	%rax, -112(%rbp)
	movb	$10, -98(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-160(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-98(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L150
.L146:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	call	exprOr
	testl	%eax, %eax
	je	.L149
	movabsq	$7598543721234200677, %rax
	movq	%rax, -160(%rbp)
	movabsq	$7959380204762721895, %rax
	movq	%rax, -152(%rbp)
	movabsq	$8463143783446967395, %rax
	movq	%rax, -144(%rbp)
	movabsq	$8583971276407006051, %rax
	movq	%rax, -136(%rbp)
	movabsq	$8246223293446124649, %rax
	movq	%rax, -128(%rbp)
	movabsq	$7164771201093497423, %rax
	movq	%rax, -120(%rbp)
	movl	$774778472, -112(%rbp)
	movb	$0, -108(%rbp)
	movb	$10, -99(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-160(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-99(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L150
.L149:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$7598543721234200677, %rax
	movq	%rax, -96(%rbp)
	movabsq	$7959380204762721895, %rax
	movq	%rax, -88(%rbp)
	movabsq	$7018332727991170147, %rax
	movq	%rax, -80(%rbp)
	movabsq	$12998625716431977, %rax
	movq	%rax, -72(%rbp)
	movb	$10, -97(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-96(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-97(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L150:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	exprAssign, .-exprAssign
	.section	.rodata
.LC12:
	.string	"exprAnd"
.LC13:
	.string	"exprOr1"
	.text
	.globl	exprOr1
	.type	exprOr1, @function
exprOr1:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$31, %edi
	call	consume
	testl	%eax, %eax
	je	.L152
	call	exprAnd
	testl	%eax, %eax
	jne	.L153
	movl	$.LC12, %edi
	call	syntacticErrorForOthers
.L153:
	movl	$0, %eax
	call	exprOr1
	testl	%eax, %eax
	jne	.L152
	movl	$.LC13, %edi
	call	syntacticErrorForOthers
.L152:
	movl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	exprOr1, .-exprOr1
	.globl	exprOr
	.type	exprOr, @function
exprOr:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -32(%rbp)
	movabsq	$8246223293446516585, %rax
	movq	%rax, -24(%rbp)
	movabsq	$12998624722580047, %rax
	movq	%rax, -16(%rbp)
	movb	$10, -33(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-32(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-33(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	call	exprAnd
	testl	%eax, %eax
	je	.L156
	movl	$0, %eax
	call	exprOr1
	testl	%eax, %eax
	jne	.L157
	movl	$.LC13, %edi
	call	syntacticErrorForOthers
.L157:
	movabsq	$2965746040171427941, %rax
	movq	%rax, -96(%rbp)
	movabsq	$8028075781168391712, %rax
	movq	%rax, -88(%rbp)
	movabsq	$7234297655263961198, %rax
	movq	%rax, -80(%rbp)
	movl	$774792293, -72(%rbp)
	movw	$46, -68(%rbp)
	movb	$10, -97(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-96(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-97(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L159
.L156:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$2965746040171427941, %rax
	movq	%rax, -64(%rbp)
	movabsq	$8028075781168391712, %rax
	movq	%rax, -56(%rbp)
	movabsq	$7234307576302018670, %rax
	movq	%rax, -48(%rbp)
	movl	$3026478, -40(%rbp)
	movb	$10, -65(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-64(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-65(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L159:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	exprOr, .-exprOr
	.section	.rodata
.LC14:
	.string	"exprEq"
.LC15:
	.string	"exprAnd1"
	.text
	.globl	exprAnd1
	.type	exprAnd1, @function
exprAnd1:
.LFB25:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$30, %edi
	call	consume
	testl	%eax, %eax
	je	.L161
	call	exprEq
	testl	%eax, %eax
	jne	.L162
	movl	$.LC14, %edi
	call	syntacticErrorForOthers
.L162:
	movl	$0, %eax
	call	exprAnd1
	testl	%eax, %eax
	jne	.L161
	movl	$.LC15, %edi
	call	syntacticErrorForOthers
.L161:
	movl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	exprAnd1, .-exprAnd1
	.globl	exprAnd
	.type	exprAnd, @function
exprAnd:
.LFB26:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$8246223293446516585, %rax
	movq	%rax, -40(%rbp)
	movabsq	$3327647928979582529, %rax
	movq	%rax, -32(%rbp)
	movb	$0, -24(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	call	exprEq
	testl	%eax, %eax
	je	.L165
	movl	$0, %eax
	call	exprAnd1
	testl	%eax, %eax
	jne	.L166
	movl	$.LC15, %edi
	call	syntacticErrorForOthers
.L166:
	movabsq	$2910572486560086117, %rax
	movq	%rax, -112(%rbp)
	movabsq	$7598807797348048937, %rax
	movq	%rax, -104(%rbp)
	movabsq	$7305792376618905199, %rax
	movq	%rax, -96(%rbp)
	movl	$778331492, -88(%rbp)
	movw	$11822, -84(%rbp)
	movb	$0, -82(%rbp)
	movb	$10, -113(%rbp)
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-112(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-113(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L168
.L165:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$2910572486560086117, %rax
	movq	%rax, -80(%rbp)
	movabsq	$7598807797348048937, %rax
	movq	%rax, -72(%rbp)
	movabsq	$7308332162361618031, %rax
	movq	%rax, -64(%rbp)
	movl	$774778468, -56(%rbp)
	movb	$0, -52(%rbp)
	movb	$10, -81(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-81(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L168:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	exprAnd, .-exprAnd
	.section	.rodata
.LC16:
	.string	"exprRel"
.LC17:
	.string	"exprEq1"
	.text
	.globl	exprEq1
	.type	exprEq1, @function
exprEq1:
.LFB27:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$34, %edi
	call	consume
	testl	%eax, %eax
	jne	.L170
	movl	$35, %edi
	call	consume
	testl	%eax, %eax
	je	.L171
.L170:
	call	exprRel
	testl	%eax, %eax
	jne	.L172
	movl	$.LC16, %edi
	call	syntacticErrorForOthers
.L172:
	movl	$0, %eax
	call	exprEq1
	testl	%eax, %eax
	jne	.L171
	movl	$.LC17, %edi
	call	syntacticErrorForOthers
.L171:
	movl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	exprEq1, .-exprEq1
	.globl	exprEq
	.type	exprEq, @function
exprEq:
.LFB28:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -32(%rbp)
	movabsq	$8246223293446516585, %rax
	movq	%rax, -24(%rbp)
	movabsq	$12998624722579781, %rax
	movq	%rax, -16(%rbp)
	movb	$10, -33(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-32(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-33(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	call	exprRel
	testl	%eax, %eax
	je	.L175
	movl	$0, %eax
	call	exprEq1
	testl	%eax, %eax
	jne	.L176
	movl	$.LC17, %edi
	call	syntacticErrorForOthers
.L176:
	movabsq	$2965744897710127205, %rax
	movq	%rax, -96(%rbp)
	movabsq	$8028075781168391712, %rax
	movq	%rax, -88(%rbp)
	movabsq	$7234297655263961198, %rax
	movq	%rax, -80(%rbp)
	movl	$774792293, -72(%rbp)
	movw	$46, -68(%rbp)
	movb	$10, -97(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-96(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-97(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L178
.L175:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$2965744897710127205, %rax
	movq	%rax, -64(%rbp)
	movabsq	$8028075781168391712, %rax
	movq	%rax, -56(%rbp)
	movabsq	$7234307576302018670, %rax
	movq	%rax, -48(%rbp)
	movl	$3026478, -40(%rbp)
	movb	$10, -65(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-64(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-65(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L178:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	exprEq, .-exprEq
	.section	.rodata
.LC18:
	.string	"exprAdd"
.LC19:
	.string	"exprRel1"
	.text
	.globl	exprRel1
	.type	exprRel1, @function
exprRel1:
.LFB29:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$36, %edi
	call	consume
	testl	%eax, %eax
	jne	.L180
	movl	$37, %edi
	call	consume
	testl	%eax, %eax
	jne	.L180
	movl	$38, %edi
	call	consume
	testl	%eax, %eax
	jne	.L180
	movl	$39, %edi
	call	consume
	testl	%eax, %eax
	je	.L181
.L180:
	call	exprAdd
	testl	%eax, %eax
	jne	.L182
	movl	$.LC18, %edi
	call	syntacticErrorForOthers
.L182:
	movl	$0, %eax
	call	exprRel1
	testl	%eax, %eax
	jne	.L181
	movl	$.LC19, %edi
	call	syntacticErrorForOthers
.L181:
	movl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	exprRel1, .-exprRel1
	.globl	exprRel
	.type	exprRel, @function
exprRel:
.LFB30:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$8246223293446516585, %rax
	movq	%rax, -40(%rbp)
	movabsq	$3327647928980104530, %rax
	movq	%rax, -32(%rbp)
	movb	$0, -24(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	call	exprAdd
	testl	%eax, %eax
	je	.L185
	movl	$0, %eax
	call	exprRel1
	testl	%eax, %eax
	jne	.L186
	movl	$.LC19, %edi
	call	syntacticErrorForOthers
.L186:
	movabsq	$2912814463783565413, %rax
	movq	%rax, -112(%rbp)
	movabsq	$7598807797348048937, %rax
	movq	%rax, -104(%rbp)
	movabsq	$7305792376618905199, %rax
	movq	%rax, -96(%rbp)
	movl	$778331492, -88(%rbp)
	movw	$11822, -84(%rbp)
	movb	$0, -82(%rbp)
	movb	$10, -113(%rbp)
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-112(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-113(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L188
.L185:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$2912814463783565413, %rax
	movq	%rax, -80(%rbp)
	movabsq	$7598807797348048937, %rax
	movq	%rax, -72(%rbp)
	movabsq	$7308332162361618031, %rax
	movq	%rax, -64(%rbp)
	movl	$774778468, -56(%rbp)
	movb	$0, -52(%rbp)
	movb	$10, -81(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-81(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L188:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	exprRel, .-exprRel
	.section	.rodata
.LC20:
	.string	"exprMul"
.LC21:
	.string	"exprAdd1"
	.text
	.globl	exprAdd1
	.type	exprAdd1, @function
exprAdd1:
.LFB31:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$25, %edi
	call	consume
	testl	%eax, %eax
	jne	.L190
	movl	$26, %edi
	call	consume
	testl	%eax, %eax
	je	.L191
.L190:
	call	exprMul
	testl	%eax, %eax
	jne	.L192
	movl	$.LC20, %edi
	call	syntacticErrorForOthers
.L192:
	movl	$0, %eax
	call	exprAdd1
	testl	%eax, %eax
	jne	.L191
	movl	$.LC21, %edi
	call	syntacticErrorForOthers
.L191:
	movl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	exprAdd1, .-exprAdd1
	.globl	exprAdd
	.type	exprAdd, @function
exprAdd:
.LFB32:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$8246223293446516585, %rax
	movq	%rax, -40(%rbp)
	movabsq	$3327647928979579969, %rax
	movq	%rax, -32(%rbp)
	movb	$0, -24(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	call	exprMul
	testl	%eax, %eax
	je	.L195
	movl	$0, %eax
	call	exprAdd1
	testl	%eax, %eax
	jne	.L196
	movl	$.LC21, %edi
	call	syntacticErrorForOthers
.L196:
	movabsq	$2910561491443808357, %rax
	movq	%rax, -112(%rbp)
	movabsq	$7598807797348048937, %rax
	movq	%rax, -104(%rbp)
	movabsq	$7305792376618905199, %rax
	movq	%rax, -96(%rbp)
	movl	$778331492, -88(%rbp)
	movw	$11822, -84(%rbp)
	movb	$0, -82(%rbp)
	movb	$10, -113(%rbp)
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-112(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-113(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L198
.L195:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$2910561491443808357, %rax
	movq	%rax, -80(%rbp)
	movabsq	$7598807797348048937, %rax
	movq	%rax, -72(%rbp)
	movabsq	$7308332162361618031, %rax
	movq	%rax, -64(%rbp)
	movl	$774778468, -56(%rbp)
	movb	$0, -52(%rbp)
	movb	$10, -81(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-81(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L198:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	exprAdd, .-exprAdd
	.section	.rodata
.LC22:
	.string	"exprCast"
	.text
	.globl	exprMul1
	.type	exprMul1, @function
exprMul1:
.LFB33:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$27, %edi
	call	consume
	testl	%eax, %eax
	jne	.L200
	movl	$28, %edi
	call	consume
	testl	%eax, %eax
	je	.L201
.L200:
	call	exprCast
	testl	%eax, %eax
	jne	.L202
	movl	$.LC22, %edi
	call	syntacticErrorForOthers
.L202:
	movl	$0, %eax
	call	exprMul1
	testl	%eax, %eax
	jne	.L201
	movl	$.LC20, %edi
	call	syntacticErrorForOthers
.L201:
	movl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	exprMul1, .-exprMul1
	.section	.rodata
.LC23:
	.string	"exprMul1"
	.text
	.globl	exprMul
	.type	exprMul, @function
exprMul:
.LFB34:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$8246223293446516585, %rax
	movq	%rax, -40(%rbp)
	movabsq	$3327647928980108621, %rax
	movq	%rax, -32(%rbp)
	movb	$0, -24(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	call	exprCast
	testl	%eax, %eax
	je	.L205
	movl	$0, %eax
	call	exprMul1
	testl	%eax, %eax
	jne	.L206
	movl	$.LC23, %edi
	call	syntacticErrorForOthers
.L206:
	movl	$1, %eax
	jmp	.L208
.L205:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$2912832034494773349, %rax
	movq	%rax, -80(%rbp)
	movabsq	$7598807797348048937, %rax
	movq	%rax, -72(%rbp)
	movabsq	$7308332162361618031, %rax
	movq	%rax, -64(%rbp)
	movl	$774778468, -56(%rbp)
	movb	$0, -52(%rbp)
	movb	$10, -81(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-81(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L208:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	exprMul, .-exprMul
	.globl	exprCast
	.type	exprCast, @function
exprCast:
.LFB35:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$8246223293446516585, %rax
	movq	%rax, -40(%rbp)
	movabsq	$3327642428402524483, %rax
	movq	%rax, -32(%rbp)
	movw	$46, -24(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	movl	$19, %edi
	call	consume
	testl	%eax, %eax
	je	.L210
	call	typeName
	testl	%eax, %eax
	je	.L210
	movl	$20, %edi
	call	consume
	testl	%eax, %eax
	jne	.L211
	movl	$20, %edi
	call	syntacticErrorForDelimiters
.L211:
	call	exprCast
	testl	%eax, %eax
	jne	.L212
	movl	$.LC22, %edi
	call	syntacticErrorForOthers
.L212:
	movabsq	$8391157473032042597, %rax
	movq	%rax, -144(%rbp)
	movabsq	$8386668381597608232, %rax
	movq	%rax, -136(%rbp)
	movabsq	$7161696969775017833, %rax
	movq	%rax, -128(%rbp)
	movabsq	$8388366761961284709, %rax
	movq	%rax, -120(%rbp)
	movabsq	$7070741855445196904, %rax
	movq	%rax, -112(%rbp)
	movabsq	$3327648200553030002, %rax
	movq	%rax, -104(%rbp)
	movb	$0, -96(%rbp)
	movb	$10, -82(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-144(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-82(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L215
.L210:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	call	exprUnary
	testl	%eax, %eax
	je	.L214
	movabsq	$8391157473032042597, %rax
	movq	%rax, -144(%rbp)
	movabsq	$8386668381597608232, %rax
	movq	%rax, -136(%rbp)
	movabsq	$7161696969775017833, %rax
	movq	%rax, -128(%rbp)
	movabsq	$8388366761961284709, %rax
	movq	%rax, -120(%rbp)
	movabsq	$7950386544574275688, %rax
	movq	%rax, -112(%rbp)
	movabsq	$8242185629186224737, %rax
	movq	%rax, -104(%rbp)
	movabsq	$12998625783410273, %rax
	movq	%rax, -96(%rbp)
	movb	$10, -83(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-144(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-83(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L215
.L214:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$8391157473032042597, %rax
	movq	%rax, -80(%rbp)
	movabsq	$8386668381597608232, %rax
	movq	%rax, -72(%rbp)
	movabsq	$7811882119909502825, %rax
	movq	%rax, -64(%rbp)
	movl	$774792293, -56(%rbp)
	movw	$46, -52(%rbp)
	movb	$10, -81(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-81(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L215:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	exprCast, .-exprCast
	.section	.rodata
.LC24:
	.string	"exprUnary"
	.text
	.globl	exprUnary
	.type	exprUnary, @function
exprUnary:
.LFB36:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$8246223293446516585, %rax
	movq	%rax, -40(%rbp)
	movabsq	$3326234301864963669, %rax
	movq	%rax, -32(%rbp)
	movw	$11822, -24(%rbp)
	movb	$0, -22(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	movl	$26, %edi
	call	consume
	testl	%eax, %eax
	jne	.L217
	movl	$32, %edi
	call	consume
	testl	%eax, %eax
	je	.L218
.L217:
	call	exprUnary
	testl	%eax, %eax
	jne	.L219
	movl	$.LC24, %edi
	call	syntacticErrorForOthers
.L219:
	movabsq	$8241990106335967333, %rax
	movq	%rax, -144(%rbp)
	movabsq	$7164793138679720057, %rax
	movq	%rax, -136(%rbp)
	movabsq	$7166760965158955380, %rax
	movq	%rax, -128(%rbp)
	movabsq	$7599578511780898147, %rax
	movq	%rax, -120(%rbp)
	movabsq	$8391176327731898484, %rax
	movq	%rax, -112(%rbp)
	movabsq	$3344032049055031840, %rax
	movq	%rax, -104(%rbp)
	movw	$11822, -96(%rbp)
	movb	$0, -94(%rbp)
	movb	$10, -82(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-144(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-82(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L222
.L218:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	call	exprPostfix
	testl	%eax, %eax
	je	.L221
	movabsq	$8241990106335967333, %rax
	movq	%rax, -144(%rbp)
	movabsq	$7164793138679720057, %rax
	movq	%rax, -136(%rbp)
	movabsq	$7166760965158955380, %rax
	movq	%rax, -128(%rbp)
	movabsq	$7599578511780898147, %rax
	movq	%rax, -120(%rbp)
	movabsq	$5796819332774258804, %rax
	movq	%rax, -112(%rbp)
	movabsq	$2965752748709278575, %rax
	movq	%rax, -104(%rbp)
	movabsq	$3344032049055031840, %rax
	movq	%rax, -96(%rbp)
	movw	$11822, -88(%rbp)
	movb	$0, -86(%rbp)
	movb	$10, -83(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-144(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-83(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L222
.L221:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$8241990106335967333, %rax
	movq	%rax, -80(%rbp)
	movabsq	$7164793138679720057, %rax
	movq	%rax, -72(%rbp)
	movabsq	$7593462736201148788, %rax
	movq	%rax, -64(%rbp)
	movl	$778331500, -56(%rbp)
	movw	$11822, -52(%rbp)
	movb	$0, -50(%rbp)
	movb	$10, -81(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-81(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L222:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	exprUnary, .-exprUnary
	.section	.rodata
.LC25:
	.string	"exprPostfix1"
	.text
	.globl	exprPostfix1
	.type	exprPostfix1, @function
exprPostfix1:
.LFB37:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$21, %edi
	call	consume
	testl	%eax, %eax
	je	.L224
	call	expr
	testl	%eax, %eax
	jne	.L225
	movl	$.LC9, %edi
	call	syntacticErrorForOthers
.L225:
	movl	$22, %edi
	call	consume
	testl	%eax, %eax
	jne	.L226
	movl	$21, %edi
	call	syntacticErrorForDelimiters
.L226:
	movl	$0, %eax
	call	exprPostfix1
	testl	%eax, %eax
	jne	.L227
	movl	$.LC25, %edi
	call	syntacticErrorForOthers
.L227:
	movl	$1, %eax
	jmp	.L228
.L224:
	movl	$29, %edi
	call	consume
	testl	%eax, %eax
	je	.L229
	movl	$1, %edi
	call	consume
	testl	%eax, %eax
	jne	.L230
	movl	$1, %edi
	call	syntacticErrorForTypes
.L230:
	movl	$0, %eax
	call	exprPostfix1
	testl	%eax, %eax
	jne	.L231
	movl	$.LC25, %edi
	call	syntacticErrorForOthers
.L231:
	movl	$1, %eax
	jmp	.L228
.L229:
	movl	$1, %eax
.L228:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	exprPostfix1, .-exprPostfix1
	.globl	exprPostfix
	.type	exprPostfix, @function
exprPostfix:
.LFB38:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$8246223293446516585, %rax
	movq	%rax, -40(%rbp)
	movabsq	$2916196647483699024, %rax
	movq	%rax, -32(%rbp)
	movl	$774778409, -24(%rbp)
	movb	$0, -20(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	call	exprPrimary
	testl	%eax, %eax
	je	.L233
	movl	$0, %eax
	call	exprPostfix1
	testl	%eax, %eax
	jne	.L234
	movl	$.LC25, %edi
	call	syntacticErrorForOthers
.L234:
	movabsq	$8391172922029406309, %rax
	movq	%rax, -112(%rbp)
	movabsq	$8463143485904021862, %rax
	movq	%rax, -104(%rbp)
	movabsq	$3327707561312215907, %rax
	movq	%rax, -96(%rbp)
	movw	$46, -88(%rbp)
	movb	$10, -113(%rbp)
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-112(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-113(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L236
.L233:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$8391172922029406309, %rax
	movq	%rax, -80(%rbp)
	movabsq	$7018332430448224614, %rax
	movq	%rax, -72(%rbp)
	movabsq	$12998625716431977, %rax
	movq	%rax, -64(%rbp)
	movb	$10, -81(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-81(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L236:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE38:
	.size	exprPostfix, .-exprPostfix
	.globl	exprPrimary
	.type	exprPrimary, @function
exprPrimary:
.LFB39:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movabsq	$8386668381597625929, %rax
	movq	%rax, -48(%rbp)
	movabsq	$8246223293446516585, %rax
	movq	%rax, -40(%rbp)
	movabsq	$2916487996472128080, %rax
	movq	%rax, -32(%rbp)
	movl	$774778409, -24(%rbp)
	movb	$0, -20(%rbp)
	movb	$10, -49(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-49(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	currentToken(%rip), %rax
	movq	%rax, -8(%rbp)
	movl	$1, %edi
	call	consume
	testl	%eax, %eax
	je	.L238
	movl	$19, %edi
	call	consume
	testl	%eax, %eax
	jne	.L239
	movabsq	$7883958312531687525, %rax
	movq	%rax, -160(%rbp)
	movabsq	$8463143485904089697, %rax
	movq	%rax, -152(%rbp)
	movabsq	$8583971276407006051, %rax
	movq	%rax, -144(%rbp)
	movabsq	$3327672255540393065, %rax
	movq	%rax, -136(%rbp)
	movw	$46, -128(%rbp)
	movb	$10, -99(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-160(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-99(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L254
.L239:
	call	expr
	testl	%eax, %eax
	je	.L241
.L244:
	movl	$17, %edi
	call	consume
	testl	%eax, %eax
	jne	.L242
	jmp	.L241
.L242:
	call	expr
	testl	%eax, %eax
	jne	.L243
	movl	$.LC9, %edi
	call	syntacticErrorForOthers
.L243:
	jmp	.L244
.L241:
	movl	$20, %edi
	call	consume
	testl	%eax, %eax
	jne	.L245
	movl	$20, %edi
	call	syntacticErrorForDelimiters
.L245:
	movabsq	$7883958312531687525, %rax
	movq	%rax, -160(%rbp)
	movabsq	$8459484311206851169, %rax
	movq	%rax, -152(%rbp)
	movabsq	$8295751938406114158, %rax
	movq	%rax, -144(%rbp)
	movabsq	$2334101988756906869, %rax
	movq	%rax, -136(%rbp)
	movabsq	$2325063711170259319, %rax
	movq	%rax, -128(%rbp)
	movabsq	$3327711950936306274, %rax
	movq	%rax, -120(%rbp)
	movw	$46, -112(%rbp)
	movb	$10, -98(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-160(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-98(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L254
.L238:
	movl	$13, %edi
	call	consume
	testl	%eax, %eax
	je	.L247
	movabsq	$7883958312531687525, %rax
	movq	%rax, -160(%rbp)
	movabsq	$8459484311206851169, %rax
	movq	%rax, -152(%rbp)
	movabsq	$8295751938406114158, %rax
	movq	%rax, -144(%rbp)
	movabsq	$2334101988756906869, %rax
	movq	%rax, -136(%rbp)
	movabsq	$6869189138117323127, %rax
	movq	%rax, -128(%rbp)
	movl	$777277001, -120(%rbp)
	movw	$11822, -116(%rbp)
	movb	$0, -114(%rbp)
	movb	$10, -100(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-160(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-100(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L254
.L247:
	movl	$14, %edi
	call	consume
	testl	%eax, %eax
	je	.L248
	movabsq	$7883958312531687525, %rax
	movq	%rax, -160(%rbp)
	movabsq	$8459484311206851169, %rax
	movq	%rax, -152(%rbp)
	movabsq	$8295751938406114158, %rax
	movq	%rax, -144(%rbp)
	movabsq	$2334101988756906869, %rax
	movq	%rax, -136(%rbp)
	movabsq	$6869189138117323127, %rax
	movq	%rax, -128(%rbp)
	movabsq	$12998625311409490, %rax
	movq	%rax, -120(%rbp)
	movb	$10, -101(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-160(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-101(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L254
.L248:
	movl	$15, %edi
	call	consume
	testl	%eax, %eax
	je	.L249
	movabsq	$7883958312531687525, %rax
	movq	%rax, -160(%rbp)
	movabsq	$8459484311206851169, %rax
	movq	%rax, -152(%rbp)
	movabsq	$8295751938406114158, %rax
	movq	%rax, -144(%rbp)
	movabsq	$2334101988756906869, %rax
	movq	%rax, -136(%rbp)
	movabsq	$6869189138117323127, %rax
	movq	%rax, -128(%rbp)
	movabsq	$12998625412073539, %rax
	movq	%rax, -120(%rbp)
	movb	$10, -102(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-160(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-102(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L254
.L249:
	movl	$16, %edi
	call	consume
	testl	%eax, %eax
	je	.L250
	movabsq	$7883958312531687525, %rax
	movq	%rax, -160(%rbp)
	movabsq	$8459484311206851169, %rax
	movq	%rax, -152(%rbp)
	movabsq	$8295751938406114158, %rax
	movq	%rax, -144(%rbp)
	movabsq	$2334101988756906869, %rax
	movq	%rax, -136(%rbp)
	movabsq	$6869189138117323127, %rax
	movq	%rax, -128(%rbp)
	movabsq	$3327675576236528723, %rax
	movq	%rax, -120(%rbp)
	movw	$46, -112(%rbp)
	movb	$10, -103(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-160(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-103(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L254
.L250:
	movl	$19, %edi
	call	consume
	testl	%eax, %eax
	je	.L251
	call	expr
	testl	%eax, %eax
	jne	.L252
	movl	$.LC9, %edi
	call	syntacticErrorForOthers
.L252:
	movl	$20, %edi
	call	consume
	testl	%eax, %eax
	jne	.L253
	movl	$20, %edi
	call	syntacticErrorForDelimiters
.L253:
	movabsq	$7883958312531687525, %rax
	movq	%rax, -160(%rbp)
	movabsq	$8459484311206851169, %rax
	movq	%rax, -152(%rbp)
	movabsq	$8295751938406114158, %rax
	movq	%rax, -144(%rbp)
	movabsq	$2334101988756906869, %rax
	movq	%rax, -136(%rbp)
	movabsq	$4706345312677292407, %rax
	movq	%rax, -128(%rbp)
	movabsq	$7521977167448776786, %rax
	movq	%rax, -120(%rbp)
	movl	$3026478, -112(%rbp)
	movb	$10, -104(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-160(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-104(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$1, %eax
	jmp	.L254
.L251:
	movq	-8(%rbp), %rax
	movq	%rax, currentToken(%rip)
	movabsq	$7883958312531687525, %rax
	movq	%rax, -96(%rbp)
	movabsq	$8459484311206851169, %rax
	movq	%rax, -88(%rbp)
	movabsq	$7359003215913050990, %rax
	movq	%rax, -80(%rbp)
	movabsq	$3327648183406586209, %rax
	movq	%rax, -72(%rbp)
	movb	$0, -64(%rbp)
	movb	$10, -97(%rbp)
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-96(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-97(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	$0, %eax
.L254:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE39:
	.size	exprPrimary, .-exprPrimary
	.section	.rodata
.LC26:
	.string	"SyntacticLog"
	.align 8
.LC27:
	.string	"Error opening SyntacticLog file.\n"
.LC28:
	.string	"Syntactic analysis succeded."
.LC29:
	.string	"Incorrect."
	.text
	.globl	syntacticAnalysis
	.type	syntacticAnalysis, @function
syntacticAnalysis:
.LFB40:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	$448, %edx
	movl	$577, %esi
	movl	$.LC26, %edi
	movl	$0, %eax
	call	open
	movl	%eax, syntacticAnalysisLogFile(%rip)
	movl	syntacticAnalysisLogFile(%rip), %eax
	cmpl	$-1, %eax
	jne	.L256
	movl	$16, %esi
	movl	$.LC27, %edi
	call	error
.L256:
	movabsq	$7453010382200861779, %rax
	movq	%rax, -32(%rbp)
	movabsq	$8386654083791549216, %rax
	movq	%rax, -24(%rbp)
	movabsq	$8749475302777840489, %rax
	movq	%rax, -16(%rbp)
	movl	$779315571, -8(%rbp)
	movb	$0, -4(%rbp)
	movb	$10, -33(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-32(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	syntacticAnalysisLogFile(%rip), %eax
	leaq	-33(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movq	firstToken(%rip), %rax
	movq	%rax, currentToken(%rip)
	call	unit
	testl	%eax, %eax
	je	.L257
	movl	$.LC28, %edi
	call	puts
	jmp	.L258
.L257:
	movl	$.LC29, %edi
	movl	$0, %eax
	call	printf
.L258:
	movl	syntacticAnalysisLogFile(%rip), %eax
	movl	%eax, %edi
	call	close
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE40:
	.size	syntacticAnalysis, .-syntacticAnalysis
	.section	.rodata
	.align 8
.LC30:
	.string	"Too few arguments. Expected input file.\n"
	.align 8
.LC31:
	.string	"Error calling stat function in input file.\n"
	.align 8
.LC32:
	.string	"First argument must be a regular file.\n"
.LC33:
	.string	"Error opening input file.\n"
	.align 8
.LC34:
	.string	"Error reading from input file.\n"
	.align 8
.LC35:
	.string	"%d bytes read from input file.\n\n\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4288, %rsp
	movl	%edi, -4276(%rbp)
	movq	%rsi, -4288(%rbp)
	cmpl	$1, -4276(%rbp)
	jg	.L260
	movl	$1, %esi
	movl	$.LC30, %edi
	call	error
.L260:
	movq	-4288(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-160(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	stat
	testl	%eax, %eax
	je	.L261
	movl	$2, %esi
	movl	$.LC31, %edi
	call	error
.L261:
	movl	-136(%rbp), %eax
	andl	$61440, %eax
	cmpl	$32768, %eax
	je	.L262
	movl	$3, %esi
	movl	$.LC32, %edi
	call	error
.L262:
	movq	-4288(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.L263
	movl	$4, %esi
	movl	$.LC33, %edi
	call	error
.L263:
	leaq	-4272(%rbp), %rcx
	movl	-4(%rbp), %eax
	movl	$4096, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -8(%rbp)
	cmpl	$-1, -8(%rbp)
	jne	.L264
	movl	$5, %esi
	movl	$.LC34, %edi
	call	error
.L264:
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC35, %edi
	movl	$0, %eax
	call	printf
	movl	-8(%rbp), %eax
	cltq
	movb	$0, -4272(%rbp,%rax)
	movl	-8(%rbp), %edx
	leaq	-4272(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	parseCode
	call	syntacticAnalysis
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.globl	t0
	.type	t0, @function
t0:
.LFB42:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$10, -4(%rbp)
	je	.L267
	cmpb	$13, -4(%rbp)
	je	.L267
	cmpb	$9, -4(%rbp)
	je	.L267
	cmpb	$32, -4(%rbp)
	jne	.L268
.L267:
	movl	$1, %eax
	jmp	.L269
.L268:
	movl	$0, %eax
.L269:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE42:
	.size	t0, .-t0
	.globl	t1
	.type	t1, @function
t1:
.LFB43:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$56, -4(%rbp)
	je	.L271
	cmpb	$57, -4(%rbp)
	jne	.L272
.L271:
	movl	$1, %eax
	jmp	.L273
.L272:
	movl	$0, %eax
.L273:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE43:
	.size	t1, .-t1
	.globl	t2
	.type	t2, @function
t2:
.LFB44:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	call	__ctype_b_loc
	movq	(%rax), %rax
	movsbq	-4(%rbp), %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$1024, %eax
	testl	%eax, %eax
	jne	.L275
	cmpb	$95, -4(%rbp)
	jne	.L276
.L275:
	movl	$1, %eax
	jmp	.L277
.L276:
	movl	$0, %eax
.L277:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE44:
	.size	t2, .-t2
	.globl	t3
	.type	t3, @function
t3:
.LFB45:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$97, -4(%rbp)
	je	.L279
	cmpb	$98, -4(%rbp)
	je	.L279
	cmpb	$102, -4(%rbp)
	je	.L279
	cmpb	$110, -4(%rbp)
	je	.L279
	cmpb	$114, -4(%rbp)
	je	.L279
	cmpb	$116, -4(%rbp)
	je	.L279
	cmpb	$118, -4(%rbp)
	je	.L279
	cmpb	$39, -4(%rbp)
	je	.L279
	cmpb	$63, -4(%rbp)
	je	.L279
	cmpb	$34, -4(%rbp)
	je	.L279
	cmpb	$48, -4(%rbp)
	je	.L279
	cmpb	$92, -4(%rbp)
	jne	.L280
.L279:
	movl	$1, %eax
	jmp	.L281
.L280:
	movl	$0, %eax
.L281:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE45:
	.size	t3, .-t3
	.globl	t4
	.type	t4, @function
t4:
.LFB46:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$96, -4(%rbp)
	jle	.L283
	cmpb	$102, -4(%rbp)
	jle	.L284
.L283:
	cmpb	$64, -4(%rbp)
	jle	.L285
	cmpb	$70, -4(%rbp)
	jg	.L285
.L284:
	movl	$1, %eax
	jmp	.L286
.L285:
	movl	$0, %eax
.L286:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE46:
	.size	t4, .-t4
	.globl	t5
	.type	t5, @function
t5:
.LFB47:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$47, -4(%rbp)
	jle	.L288
	cmpb	$55, -4(%rbp)
	jg	.L288
	movl	$1, %eax
	jmp	.L289
.L288:
	movl	$0, %eax
.L289:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE47:
	.size	t5, .-t5
	.globl	t6
	.type	t6, @function
t6:
.LFB48:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$48, -4(%rbp)
	jle	.L291
	cmpb	$57, -4(%rbp)
	jg	.L291
	movl	$1, %eax
	jmp	.L292
.L291:
	movl	$0, %eax
.L292:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE48:
	.size	t6, .-t6
	.globl	t7
	.type	t7, @function
t7:
.LFB49:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$39, -4(%rbp)
	jle	.L294
	cmpl	$67, -4(%rbp)
	jg	.L294
	movl	$1, %eax
	jmp	.L295
.L294:
	movl	$0, %eax
.L295:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE49:
	.size	t7, .-t7
	.section	.rodata
.LC36:
	.string	"Error: "
	.text
	.globl	error
	.type	error, @function
error:
.LFB50:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$.LC36, %edi
	call	perror
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	perror
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	exit
	.cfi_endproc
.LFE50:
	.size	error, .-error
	.globl	codeToStringForTypes
	.type	codeToStringForTypes, @function
codeToStringForTypes:
.LFB51:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	$10, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	cmpl	$16, -20(%rbp)
	ja	.L298
	movl	-20(%rbp), %eax
	movq	.L300(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L300:
	.quad	.L299
	.quad	.L301
	.quad	.L298
	.quad	.L298
	.quad	.L298
	.quad	.L298
	.quad	.L298
	.quad	.L298
	.quad	.L298
	.quad	.L298
	.quad	.L298
	.quad	.L298
	.quad	.L298
	.quad	.L302
	.quad	.L303
	.quad	.L304
	.quad	.L305
	.text
.L299:
	movq	-8(%rbp), %rax
	movl	$4476485, (%rax)
	jmp	.L306
.L301:
	movq	-8(%rbp), %rax
	movw	$17481, (%rax)
	movb	$0, 2(%rax)
	jmp	.L306
.L302:
	movq	-8(%rbp), %rax
	movl	$1230984259, (%rax)
	movw	$21582, 4(%rax)
	movb	$0, 6(%rax)
	jmp	.L306
.L303:
	movq	-8(%rbp), %rax
	movabsq	$21463864220537923, %rdx
	movq	%rdx, (%rax)
	jmp	.L306
.L304:
	movq	-8(%rbp), %rax
	movabsq	$23152726714045507, %rcx
	movq	%rcx, (%rax)
	jmp	.L306
.L305:
	movq	-8(%rbp), %rax
	movabsq	$5641130530387743811, %rsi
	movq	%rsi, (%rax)
	movw	$71, 8(%rax)
	jmp	.L306
.L298:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
	jmp	.L307
.L306:
	movq	-8(%rbp), %rax
.L307:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE51:
	.size	codeToStringForTypes, .-codeToStringForTypes
	.globl	codeToStringForKeywords
	.type	codeToStringForKeywords, @function
codeToStringForKeywords:
.LFB52:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	$10, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	cmpl	$12, -20(%rbp)
	ja	.L309
	movl	-20(%rbp), %eax
	movq	.L311(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L311:
	.quad	.L309
	.quad	.L309
	.quad	.L310
	.quad	.L312
	.quad	.L313
	.quad	.L314
	.quad	.L315
	.quad	.L316
	.quad	.L317
	.quad	.L318
	.quad	.L319
	.quad	.L320
	.quad	.L321
	.text
.L310:
	movq	-8(%rbp), %rax
	movl	$1634038370, (%rax)
	movw	$107, 4(%rax)
	jmp	.L322
.L312:
	movq	-8(%rbp), %rax
	movl	$1918986339, (%rax)
	movb	$0, 4(%rax)
	jmp	.L322
.L313:
	movq	-8(%rbp), %rax
	movl	$1651863396, (%rax)
	movw	$25964, 4(%rax)
	movb	$0, 6(%rax)
	jmp	.L322
.L314:
	movq	-8(%rbp), %rax
	movl	$1702063205, (%rax)
	movb	$0, 4(%rax)
	jmp	.L322
.L315:
	movq	-8(%rbp), %rax
	movl	$7499622, (%rax)
	jmp	.L322
.L316:
	movq	-8(%rbp), %rax
	movw	$26217, (%rax)
	movb	$0, 2(%rax)
	jmp	.L322
.L317:
	movq	-8(%rbp), %rax
	movl	$7630441, (%rax)
	jmp	.L322
.L318:
	movq	-8(%rbp), %rax
	movl	$1970562418, (%rax)
	movw	$28274, 4(%rax)
	movb	$0, 6(%rax)
	jmp	.L322
.L319:
	movq	-8(%rbp), %rax
	movl	$1970435187, (%rax)
	movw	$29795, 4(%rax)
	movb	$0, 6(%rax)
	jmp	.L322
.L320:
	movq	-8(%rbp), %rax
	movl	$1684631414, (%rax)
	movb	$0, 4(%rax)
	jmp	.L322
.L321:
	movq	-8(%rbp), %rax
	movl	$1818847351, (%rax)
	movw	$101, 4(%rax)
	jmp	.L322
.L309:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
	jmp	.L323
.L322:
	movq	-8(%rbp), %rax
.L323:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE52:
	.size	codeToStringForKeywords, .-codeToStringForKeywords
	.globl	codeToStringForDelimiters
	.type	codeToStringForDelimiters, @function
codeToStringForDelimiters:
.LFB53:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	$10, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	movl	-20(%rbp), %eax
	subl	$17, %eax
	cmpl	$7, %eax
	ja	.L325
	movl	%eax, %eax
	movq	.L327(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L327:
	.quad	.L326
	.quad	.L328
	.quad	.L329
	.quad	.L330
	.quad	.L331
	.quad	.L332
	.quad	.L333
	.quad	.L334
	.text
.L326:
	movq	-8(%rbp), %rax
	movw	$44, (%rax)
	jmp	.L335
.L328:
	movq	-8(%rbp), %rax
	movw	$59, (%rax)
	jmp	.L335
.L329:
	movq	-8(%rbp), %rax
	movw	$40, (%rax)
	jmp	.L335
.L330:
	movq	-8(%rbp), %rax
	movw	$41, (%rax)
	jmp	.L335
.L331:
	movq	-8(%rbp), %rax
	movw	$91, (%rax)
	jmp	.L335
.L332:
	movq	-8(%rbp), %rax
	movw	$93, (%rax)
	jmp	.L335
.L333:
	movq	-8(%rbp), %rax
	movw	$123, (%rax)
	jmp	.L335
.L334:
	movq	-8(%rbp), %rax
	movw	$125, (%rax)
	jmp	.L335
.L325:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
	jmp	.L336
.L335:
	movq	-8(%rbp), %rax
.L336:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE53:
	.size	codeToStringForDelimiters, .-codeToStringForDelimiters
	.globl	codeToStringForOperators
	.type	codeToStringForOperators, @function
codeToStringForOperators:
.LFB54:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	$10, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	movl	-20(%rbp), %eax
	subl	$25, %eax
	cmpl	$14, %eax
	ja	.L338
	movl	%eax, %eax
	movq	.L340(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L340:
	.quad	.L339
	.quad	.L341
	.quad	.L342
	.quad	.L343
	.quad	.L344
	.quad	.L345
	.quad	.L346
	.quad	.L347
	.quad	.L348
	.quad	.L349
	.quad	.L350
	.quad	.L351
	.quad	.L352
	.quad	.L353
	.quad	.L354
	.text
.L339:
	movq	-8(%rbp), %rax
	movw	$43, (%rax)
	jmp	.L355
.L341:
	movq	-8(%rbp), %rax
	movw	$45, (%rax)
	jmp	.L355
.L342:
	movq	-8(%rbp), %rax
	movw	$42, (%rax)
	jmp	.L355
.L343:
	movq	-8(%rbp), %rax
	movw	$47, (%rax)
	jmp	.L355
.L344:
	movq	-8(%rbp), %rax
	movw	$46, (%rax)
	jmp	.L355
.L345:
	movq	-8(%rbp), %rax
	movw	$9766, (%rax)
	movb	$0, 2(%rax)
	jmp	.L355
.L346:
	movq	-8(%rbp), %rax
	movw	$31868, (%rax)
	movb	$0, 2(%rax)
	jmp	.L355
.L347:
	movq	-8(%rbp), %rax
	movw	$33, (%rax)
	jmp	.L355
.L348:
	movq	-8(%rbp), %rax
	movw	$61, (%rax)
	jmp	.L355
.L349:
	movq	-8(%rbp), %rax
	movw	$15677, (%rax)
	movb	$0, 2(%rax)
	jmp	.L355
.L350:
	movq	-8(%rbp), %rax
	movw	$15649, (%rax)
	movb	$0, 2(%rax)
	jmp	.L355
.L351:
	movq	-8(%rbp), %rax
	movw	$60, (%rax)
	jmp	.L355
.L352:
	movq	-8(%rbp), %rax
	movw	$15676, (%rax)
	movb	$0, 2(%rax)
	jmp	.L355
.L353:
	movq	-8(%rbp), %rax
	movw	$62, (%rax)
	jmp	.L355
.L354:
	movq	-8(%rbp), %rax
	movw	$15678, (%rax)
	movb	$0, 2(%rax)
	jmp	.L355
.L338:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
	jmp	.L356
.L355:
	movq	-8(%rbp), %rax
.L356:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE54:
	.size	codeToStringForOperators, .-codeToStringForOperators
	.section	.rodata
.LC37:
	.string	"END "
.LC38:
	.string	"ID: %s "
.LC39:
	.string	"BREAK "
.LC40:
	.string	"CHAR "
.LC41:
	.string	"DOUBLE "
.LC42:
	.string	"ELSE "
.LC43:
	.string	"FOR "
.LC44:
	.string	"IF "
.LC45:
	.string	"INT "
.LC46:
	.string	"RETURN "
.LC47:
	.string	"STRUCT "
.LC48:
	.string	"VOID "
.LC49:
	.string	"WHILE "
.LC50:
	.string	"CT_INT: %ld "
.LC51:
	.string	"CT_REAL: %f "
.LC52:
	.string	"CT_CHAR: %c "
.LC53:
	.string	"CT_STRING: %s "
.LC54:
	.string	"COMMA "
.LC55:
	.string	"SEMICOLON "
.LC56:
	.string	"LPAR "
.LC57:
	.string	"RPAR "
.LC58:
	.string	"LBRACKET "
.LC59:
	.string	"RBRACKET "
.LC60:
	.string	"LACC "
.LC61:
	.string	"RACC "
.LC62:
	.string	"ADD "
.LC63:
	.string	"SUB "
.LC64:
	.string	"MUL "
.LC65:
	.string	"DIV "
.LC66:
	.string	"DOT "
.LC67:
	.string	"AND "
.LC68:
	.string	"OR "
.LC69:
	.string	"NOT "
.LC70:
	.string	"ASSIGN "
.LC71:
	.string	"EQUAL "
.LC72:
	.string	"NOTEQ "
.LC73:
	.string	"LESS "
.LC74:
	.string	"LESSEQ "
.LC75:
	.string	"GREATER "
.LC76:
	.string	"GREATEREQ "
	.text
	.globl	printTokens
	.type	printTokens, @function
printTokens:
.LFB55:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	firstToken(%rip), %rax
	movq	%rax, -8(%rbp)
	movq	firstToken(%rip), %rax
	testq	%rax, %rax
	je	.L358
	movq	firstToken(%rip), %rax
	movl	4(%rax), %eax
	movl	%eax, -12(%rbp)
.L358:
	jmp	.L359
.L403:
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	-12(%rbp), %eax
	jle	.L360
	movl	$10, %edi
	call	putchar
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, -12(%rbp)
.L360:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$39, %eax
	ja	.L361
	movl	%eax, %eax
	movq	.L363(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L363:
	.quad	.L362
	.quad	.L364
	.quad	.L365
	.quad	.L366
	.quad	.L367
	.quad	.L368
	.quad	.L369
	.quad	.L370
	.quad	.L371
	.quad	.L372
	.quad	.L373
	.quad	.L374
	.quad	.L375
	.quad	.L376
	.quad	.L377
	.quad	.L378
	.quad	.L379
	.quad	.L380
	.quad	.L381
	.quad	.L382
	.quad	.L383
	.quad	.L384
	.quad	.L385
	.quad	.L386
	.quad	.L387
	.quad	.L388
	.quad	.L389
	.quad	.L390
	.quad	.L391
	.quad	.L392
	.quad	.L393
	.quad	.L394
	.quad	.L395
	.quad	.L396
	.quad	.L397
	.quad	.L398
	.quad	.L399
	.quad	.L400
	.quad	.L401
	.quad	.L402
	.text
.L362:
	movl	$.LC37, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L364:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC38, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L365:
	movl	$.LC39, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L366:
	movl	$.LC40, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L367:
	movl	$.LC41, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L368:
	movl	$.LC42, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L369:
	movl	$.LC43, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L370:
	movl	$.LC44, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L371:
	movl	$.LC45, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L372:
	movl	$.LC46, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L373:
	movl	$.LC47, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L374:
	movl	$.LC48, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L375:
	movl	$.LC49, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L376:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC50, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L377:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	movl	$.LC51, %edi
	movl	$1, %eax
	call	printf
	jmp	.L361
.L378:
	movq	-8(%rbp), %rax
	movzbl	8(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC52, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L379:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC53, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L380:
	movl	$.LC54, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L381:
	movl	$.LC55, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L382:
	movl	$.LC56, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L383:
	movl	$.LC57, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L384:
	movl	$.LC58, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L385:
	movl	$.LC59, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L386:
	movl	$.LC60, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L387:
	movl	$.LC61, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L388:
	movl	$.LC62, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L389:
	movl	$.LC63, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L390:
	movl	$.LC64, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L391:
	movl	$.LC65, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L392:
	movl	$.LC66, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L393:
	movl	$.LC67, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L394:
	movl	$.LC68, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L395:
	movl	$.LC69, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L396:
	movl	$.LC70, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L397:
	movl	$.LC71, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L398:
	movl	$.LC72, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L399:
	movl	$.LC73, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L400:
	movl	$.LC74, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L401:
	movl	$.LC75, %edi
	movl	$0, %eax
	call	printf
	jmp	.L361
.L402:
	movl	$.LC76, %edi
	movl	$0, %eax
	call	printf
	nop
.L361:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
.L359:
	cmpq	$0, -8(%rbp)
	jne	.L403
	movl	$10, %edi
	call	putchar
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE55:
	.size	printTokens, .-printTokens
	.globl	addToken
	.type	addToken, @function
addToken:
.LFB56:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	firstToken(%rip), %rax
	testq	%rax, %rax
	jne	.L405
	movq	-8(%rbp), %rax
	movq	%rax, firstToken(%rip)
	movq	-8(%rbp), %rax
	movq	%rax, lastToken(%rip)
	jmp	.L406
.L405:
	movq	lastToken(%rip), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, lastToken(%rip)
.L406:
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE56:
	.size	addToken, .-addToken
	.section	.rodata
	.align 8
.LC77:
	.string	"Something went wrong. File may be larger than program limit.\n"
	.text
	.globl	parseCode
	.type	parseCode, @function
parseCode:
.LFB57:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -24(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L408
.L410:
	movl	-44(%rbp), %eax
	subl	-4(%rbp), %eax
	movl	-4(%rbp), %edx
	movslq	%edx, %rcx
	movq	-40(%rbp), %rdx
	addq	%rdx, %rcx
	leaq	-24(%rbp), %rdx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	addNextToken
	movl	%eax, -20(%rbp)
	cmpl	$-1, -20(%rbp)
	jne	.L409
	movl	$6, %esi
	movl	$.LC77, %edi
	call	error
.L409:
	movl	-20(%rbp), %eax
	addl	%eax, -4(%rbp)
.L408:
	movl	-4(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L410
	movl	$24, %edi
	call	malloc
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	movl	-24(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE57:
	.size	parseCode, .-parseCode
	.section	.rodata
	.align 8
.LC78:
	.string	"Invalid character: %c at line %d in state %d\n"
.LC79:
	.string	"break"
.LC80:
	.string	"char"
.LC81:
	.string	"double"
.LC82:
	.string	"else"
.LC83:
	.string	"for"
.LC84:
	.string	"if"
.LC85:
	.string	"int"
.LC86:
	.string	"return"
.LC87:
	.string	"struct"
.LC88:
	.string	"void"
.LC89:
	.string	"while"
	.align 8
.LC90:
	.string	"Invalid character: %c at line %d\n"
	.text
	.globl	addNextToken
	.type	addNextToken, @function
addNextToken:
.LFB58:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -168(%rbp)
	movl	%esi, -172(%rbp)
	movq	%rdx, -184(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -44(%rbp)
	movl	$-1, -12(%rbp)
	movl	$0, -16(%rbp)
	movq	$0, -56(%rbp)
	jmp	.L412
.L659:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -57(%rbp)
	cmpl	$67, -8(%rbp)
	ja	.L412
	movl	-8(%rbp), %eax
	movq	.L414(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L414:
	.quad	.L413
	.quad	.L415
	.quad	.L416
	.quad	.L417
	.quad	.L418
	.quad	.L419
	.quad	.L420
	.quad	.L421
	.quad	.L422
	.quad	.L423
	.quad	.L424
	.quad	.L425
	.quad	.L426
	.quad	.L427
	.quad	.L428
	.quad	.L429
	.quad	.L430
	.quad	.L431
	.quad	.L432
	.quad	.L433
	.quad	.L434
	.quad	.L435
	.quad	.L436
	.quad	.L437
	.quad	.L438
	.quad	.L439
	.quad	.L440
	.quad	.L441
	.quad	.L442
	.quad	.L443
	.quad	.L444
	.quad	.L412
	.quad	.L412
	.quad	.L412
	.quad	.L412
	.quad	.L412
	.quad	.L412
	.quad	.L412
	.quad	.L412
	.quad	.L412
	.quad	.L445
	.quad	.L446
	.quad	.L447
	.quad	.L448
	.quad	.L449
	.quad	.L450
	.quad	.L451
	.quad	.L452
	.quad	.L453
	.quad	.L454
	.quad	.L455
	.quad	.L456
	.quad	.L457
	.quad	.L458
	.quad	.L459
	.quad	.L460
	.quad	.L461
	.quad	.L462
	.quad	.L463
	.quad	.L464
	.quad	.L465
	.quad	.L466
	.quad	.L467
	.quad	.L468
	.quad	.L469
	.quad	.L470
	.quad	.L471
	.quad	.L472
	.text
.L413:
	movl	$0, -16(%rbp)
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t0
	testl	%eax, %eax
	je	.L473
	cmpb	$10, -57(%rbp)
	jne	.L474
	movq	-184(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-184(%rbp), %rax
	movl	%edx, (%rax)
.L474:
	addl	$1, -4(%rbp)
	jmp	.L475
.L473:
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t6
	testl	%eax, %eax
	je	.L476
	movl	-4(%rbp), %eax
	movl	%eax, -12(%rbp)
	addl	$1, -4(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L475
.L476:
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t2
	testl	%eax, %eax
	je	.L477
	movl	-4(%rbp), %eax
	movl	%eax, -12(%rbp)
	addl	$1, -4(%rbp)
	movl	$12, -8(%rbp)
	jmp	.L475
.L477:
	cmpb	$39, -57(%rbp)
	jne	.L478
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	addl	$1, -4(%rbp)
	movl	$13, -8(%rbp)
	jmp	.L475
.L478:
	cmpb	$44, -57(%rbp)
	jne	.L479
	addl	$1, -4(%rbp)
	movl	$42, -8(%rbp)
	jmp	.L475
.L479:
	cmpb	$59, -57(%rbp)
	jne	.L480
	addl	$1, -4(%rbp)
	movl	$43, -8(%rbp)
	jmp	.L475
.L480:
	cmpb	$40, -57(%rbp)
	jne	.L481
	addl	$1, -4(%rbp)
	movl	$44, -8(%rbp)
	jmp	.L475
.L481:
	cmpb	$41, -57(%rbp)
	jne	.L482
	addl	$1, -4(%rbp)
	movl	$45, -8(%rbp)
	jmp	.L475
.L482:
	cmpb	$91, -57(%rbp)
	jne	.L483
	addl	$1, -4(%rbp)
	movl	$46, -8(%rbp)
	jmp	.L475
.L483:
	cmpb	$93, -57(%rbp)
	jne	.L484
	addl	$1, -4(%rbp)
	movl	$47, -8(%rbp)
	jmp	.L475
.L484:
	cmpb	$123, -57(%rbp)
	jne	.L485
	addl	$1, -4(%rbp)
	movl	$48, -8(%rbp)
	jmp	.L475
.L485:
	cmpb	$125, -57(%rbp)
	jne	.L486
	addl	$1, -4(%rbp)
	movl	$49, -8(%rbp)
	jmp	.L475
.L486:
	cmpb	$43, -57(%rbp)
	jne	.L487
	addl	$1, -4(%rbp)
	movl	$50, -8(%rbp)
	jmp	.L475
.L487:
	cmpb	$34, -57(%rbp)
	jne	.L488
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	$17, -8(%rbp)
	addl	$1, -4(%rbp)
	jmp	.L475
.L488:
	cmpb	$48, -57(%rbp)
	jne	.L489
	movl	-4(%rbp), %eax
	movl	%eax, -12(%rbp)
	addl	$1, -4(%rbp)
	movl	$2, -8(%rbp)
	jmp	.L475
.L489:
	cmpb	$45, -57(%rbp)
	jne	.L490
	addl	$1, -4(%rbp)
	movl	$53, -8(%rbp)
	jmp	.L475
.L490:
	cmpb	$42, -57(%rbp)
	jne	.L491
	addl	$1, -4(%rbp)
	movl	$54, -8(%rbp)
	jmp	.L475
.L491:
	cmpb	$46, -57(%rbp)
	jne	.L492
	addl	$1, -4(%rbp)
	movl	$55, -8(%rbp)
	jmp	.L475
.L492:
	cmpb	$38, -57(%rbp)
	jne	.L493
	addl	$1, -4(%rbp)
	movl	$21, -8(%rbp)
	jmp	.L475
.L493:
	cmpb	$124, -57(%rbp)
	jne	.L494
	addl	$1, -4(%rbp)
	movl	$22, -8(%rbp)
	jmp	.L475
.L494:
	cmpb	$33, -57(%rbp)
	jne	.L495
	addl	$1, -4(%rbp)
	movl	$23, -8(%rbp)
	jmp	.L475
.L495:
	cmpb	$61, -57(%rbp)
	jne	.L496
	addl	$1, -4(%rbp)
	movl	$24, -8(%rbp)
	jmp	.L475
.L496:
	cmpb	$60, -57(%rbp)
	jne	.L497
	addl	$1, -4(%rbp)
	movl	$25, -8(%rbp)
	jmp	.L475
.L497:
	cmpb	$62, -57(%rbp)
	jne	.L498
	addl	$1, -4(%rbp)
	movl	$26, -8(%rbp)
	jmp	.L475
.L498:
	cmpb	$47, -57(%rbp)
	jne	.L499
	addl	$1, -4(%rbp)
	movl	$27, -8(%rbp)
	jmp	.L475
.L499:
	movq	-184(%rbp), %rax
	movl	(%rax), %ecx
	movsbl	-57(%rbp), %edx
	movl	-8(%rbp), %esi
	leaq	-160(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC78, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-160(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	error
.L475:
	jmp	.L412
.L415:
	cmpb	$47, -57(%rbp)
	jle	.L500
	cmpb	$57, -57(%rbp)
	jg	.L500
	addl	$1, -4(%rbp)
	jmp	.L501
.L500:
	cmpb	$46, -57(%rbp)
	jne	.L502
	addl	$1, -4(%rbp)
	movl	$10, -8(%rbp)
	jmp	.L501
.L502:
	cmpb	$101, -57(%rbp)
	je	.L503
	cmpb	$69, -57(%rbp)
	jne	.L504
.L503:
	addl	$1, -4(%rbp)
	movl	$7, -8(%rbp)
	jmp	.L501
.L504:
	movl	$1, -20(%rbp)
	movl	$51, -8(%rbp)
.L501:
	jmp	.L412
.L416:
	cmpb	$46, -57(%rbp)
	jne	.L505
	addl	$1, -4(%rbp)
	movl	$10, -8(%rbp)
	jmp	.L506
.L505:
	cmpb	$56, -57(%rbp)
	je	.L507
	cmpb	$57, -57(%rbp)
	jne	.L508
.L507:
	addl	$1, -4(%rbp)
	movl	$6, -8(%rbp)
	jmp	.L506
.L508:
	cmpb	$120, -57(%rbp)
	jne	.L509
	addl	$1, -4(%rbp)
	movl	$3, -8(%rbp)
	jmp	.L506
.L509:
	cmpb	$47, -57(%rbp)
	jle	.L510
	cmpb	$55, -57(%rbp)
	jg	.L510
	addl	$1, -4(%rbp)
	movl	$5, -8(%rbp)
	jmp	.L506
.L510:
	movl	$51, -8(%rbp)
.L506:
	jmp	.L412
.L417:
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t1
	testl	%eax, %eax
	jne	.L511
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t4
	testl	%eax, %eax
	jne	.L511
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t5
	testl	%eax, %eax
	je	.L512
.L511:
	addl	$1, -4(%rbp)
	movl	$4, -8(%rbp)
	jmp	.L513
.L512:
	movq	-184(%rbp), %rax
	movl	(%rax), %ecx
	movsbl	-57(%rbp), %edx
	movl	-8(%rbp), %esi
	leaq	-160(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC78, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-160(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	error
.L513:
	jmp	.L412
.L418:
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t1
	testl	%eax, %eax
	jne	.L514
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t4
	testl	%eax, %eax
	jne	.L514
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t5
	testl	%eax, %eax
	je	.L515
.L514:
	addl	$1, -4(%rbp)
	movl	$4, -8(%rbp)
	jmp	.L516
.L515:
	movl	$4, -20(%rbp)
	movl	$51, -8(%rbp)
.L516:
	jmp	.L412
.L419:
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t5
	testl	%eax, %eax
	je	.L517
	addl	$1, -4(%rbp)
	jmp	.L518
.L517:
	cmpb	$56, -57(%rbp)
	je	.L519
	cmpb	$57, -57(%rbp)
	jne	.L520
.L519:
	addl	$1, -4(%rbp)
	movl	$6, -8(%rbp)
	jmp	.L518
.L520:
	cmpb	$46, -57(%rbp)
	jne	.L521
	addl	$1, -4(%rbp)
	movl	$10, -8(%rbp)
	jmp	.L518
.L521:
	movl	$5, -20(%rbp)
	movl	$51, -8(%rbp)
.L518:
	jmp	.L412
.L420:
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t1
	testl	%eax, %eax
	jne	.L522
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t5
	testl	%eax, %eax
	je	.L523
.L522:
	addl	$1, -4(%rbp)
	jmp	.L524
.L523:
	cmpb	$46, -57(%rbp)
	jne	.L525
	addl	$1, -4(%rbp)
	movl	$10, -8(%rbp)
	jmp	.L524
.L525:
	cmpb	$101, -57(%rbp)
	je	.L526
	cmpb	$69, -57(%rbp)
	jne	.L527
.L526:
	addl	$1, -4(%rbp)
	movl	$7, -8(%rbp)
	jmp	.L524
.L527:
	movq	-184(%rbp), %rax
	movl	(%rax), %ecx
	movsbl	-57(%rbp), %edx
	movl	-8(%rbp), %esi
	leaq	-160(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC78, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-160(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	error
.L524:
	jmp	.L412
.L421:
	cmpb	$43, -57(%rbp)
	je	.L528
	cmpb	$45, -57(%rbp)
	jne	.L529
.L528:
	addl	$1, -4(%rbp)
	movl	$8, -8(%rbp)
	jmp	.L530
.L529:
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t1
	testl	%eax, %eax
	jne	.L531
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t5
	testl	%eax, %eax
	je	.L532
.L531:
	addl	$1, -4(%rbp)
	movl	$9, -8(%rbp)
	jmp	.L530
.L532:
	movq	-184(%rbp), %rax
	movl	(%rax), %ecx
	movsbl	-57(%rbp), %edx
	movl	-8(%rbp), %esi
	leaq	-160(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC78, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-160(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	error
.L530:
	jmp	.L412
.L422:
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t1
	testl	%eax, %eax
	jne	.L533
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t5
	testl	%eax, %eax
	je	.L534
.L533:
	addl	$1, -4(%rbp)
	movl	$9, -8(%rbp)
	jmp	.L535
.L534:
	movq	-184(%rbp), %rax
	movl	(%rax), %ecx
	movsbl	-57(%rbp), %edx
	movl	-8(%rbp), %esi
	leaq	-160(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC78, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-160(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	error
.L535:
	jmp	.L412
.L423:
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t1
	testl	%eax, %eax
	jne	.L536
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t5
	testl	%eax, %eax
	je	.L537
.L536:
	addl	$1, -4(%rbp)
	jmp	.L538
.L537:
	movl	$67, -8(%rbp)
.L538:
	jmp	.L412
.L424:
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t1
	testl	%eax, %eax
	jne	.L539
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t5
	testl	%eax, %eax
	je	.L540
.L539:
	addl	$1, -4(%rbp)
	movl	$11, -8(%rbp)
	jmp	.L541
.L540:
	movq	-184(%rbp), %rax
	movl	(%rax), %ecx
	movsbl	-57(%rbp), %edx
	movl	-8(%rbp), %esi
	leaq	-160(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC78, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-160(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	error
.L541:
	jmp	.L412
.L425:
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t1
	testl	%eax, %eax
	jne	.L542
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t5
	testl	%eax, %eax
	je	.L543
.L542:
	addl	$1, -4(%rbp)
	jmp	.L544
.L543:
	cmpb	$101, -57(%rbp)
	je	.L545
	cmpb	$69, -57(%rbp)
	jne	.L546
.L545:
	addl	$1, -4(%rbp)
	movl	$7, -8(%rbp)
	jmp	.L544
.L546:
	movl	$67, -8(%rbp)
.L544:
	jmp	.L412
.L426:
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t1
	testl	%eax, %eax
	jne	.L547
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t5
	testl	%eax, %eax
	jne	.L547
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t2
	testl	%eax, %eax
	je	.L548
.L547:
	addl	$1, -4(%rbp)
	jmp	.L549
.L548:
	movl	$40, -8(%rbp)
.L549:
	jmp	.L412
.L427:
	cmpb	$92, -57(%rbp)
	jne	.L550
	addl	$1, -4(%rbp)
	movl	$14, -8(%rbp)
	jmp	.L551
.L550:
	cmpb	$92, -57(%rbp)
	je	.L552
	cmpb	$39, -57(%rbp)
	je	.L552
	addl	$1, -4(%rbp)
	movl	$16, -8(%rbp)
	jmp	.L551
.L552:
	movq	-184(%rbp), %rax
	movl	(%rax), %ecx
	movsbl	-57(%rbp), %edx
	movl	-8(%rbp), %esi
	leaq	-160(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC78, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-160(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	error
.L551:
	jmp	.L412
.L428:
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t3
	testl	%eax, %eax
	je	.L553
	addl	$1, -4(%rbp)
	movl	$15, -8(%rbp)
	jmp	.L554
.L553:
	movq	-184(%rbp), %rax
	movl	(%rax), %ecx
	movsbl	-57(%rbp), %edx
	movl	-8(%rbp), %esi
	leaq	-160(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC78, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-160(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	error
.L554:
	jmp	.L412
.L429:
	cmpb	$39, -57(%rbp)
	jne	.L555
	addl	$1, -4(%rbp)
	movl	$41, -8(%rbp)
	jmp	.L556
.L555:
	movq	-184(%rbp), %rax
	movl	(%rax), %ecx
	movsbl	-57(%rbp), %edx
	movl	-8(%rbp), %esi
	leaq	-160(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC78, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-160(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	error
.L556:
	jmp	.L412
.L430:
	cmpb	$39, -57(%rbp)
	jne	.L557
	addl	$1, -4(%rbp)
	movl	$41, -8(%rbp)
	jmp	.L558
.L557:
	movq	-184(%rbp), %rax
	movl	(%rax), %ecx
	movsbl	-57(%rbp), %edx
	movl	-8(%rbp), %esi
	leaq	-160(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC78, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-160(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	error
.L558:
	jmp	.L412
.L431:
	cmpb	$92, -57(%rbp)
	jne	.L559
	addl	$1, -4(%rbp)
	movl	$19, -8(%rbp)
	jmp	.L560
.L559:
	cmpb	$34, -57(%rbp)
	je	.L561
	cmpb	$92, -57(%rbp)
	je	.L561
	addl	$1, -4(%rbp)
	movl	$18, -8(%rbp)
	jmp	.L560
.L561:
	movq	-184(%rbp), %rax
	movl	(%rax), %ecx
	movsbl	-57(%rbp), %edx
	movl	-8(%rbp), %esi
	leaq	-160(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC78, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-160(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	error
.L560:
	jmp	.L412
.L432:
	cmpb	$92, -57(%rbp)
	jne	.L562
	addl	$1, -4(%rbp)
	movl	$19, -8(%rbp)
	jmp	.L563
.L562:
	cmpb	$34, -57(%rbp)
	je	.L564
	cmpb	$92, -57(%rbp)
	je	.L564
	addl	$1, -4(%rbp)
	jmp	.L563
.L564:
	cmpb	$34, -57(%rbp)
	jne	.L565
	addl	$1, -4(%rbp)
	movl	$52, -8(%rbp)
	jmp	.L563
.L565:
	movq	-184(%rbp), %rax
	movl	(%rax), %ecx
	movsbl	-57(%rbp), %edx
	movl	-8(%rbp), %esi
	leaq	-160(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC78, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-160(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	error
.L563:
	jmp	.L412
.L433:
	movsbl	-57(%rbp), %eax
	movl	%eax, %edi
	call	t3
	testl	%eax, %eax
	je	.L566
	addl	$1, -4(%rbp)
	movl	$20, -8(%rbp)
	jmp	.L567
.L566:
	movq	-184(%rbp), %rax
	movl	(%rax), %ecx
	movsbl	-57(%rbp), %edx
	movl	-8(%rbp), %esi
	leaq	-160(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC78, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-160(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	error
.L567:
	jmp	.L412
.L434:
	cmpb	$92, -57(%rbp)
	jne	.L568
	addl	$1, -4(%rbp)
	movl	$19, -8(%rbp)
	jmp	.L569
.L568:
	cmpb	$34, -57(%rbp)
	jne	.L570
	addl	$1, -4(%rbp)
	movl	$52, -8(%rbp)
	jmp	.L569
.L570:
	addl	$1, -4(%rbp)
	movl	$18, -8(%rbp)
.L569:
	jmp	.L412
.L435:
	cmpb	$38, -57(%rbp)
	jne	.L571
	addl	$1, -4(%rbp)
	movl	$56, -8(%rbp)
	jmp	.L572
.L571:
	movq	-184(%rbp), %rax
	movl	(%rax), %ecx
	movsbl	-57(%rbp), %edx
	movl	-8(%rbp), %esi
	leaq	-160(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC78, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-160(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	error
.L572:
	jmp	.L412
.L436:
	cmpb	$124, -57(%rbp)
	jne	.L573
	addl	$1, -4(%rbp)
	movl	$57, -8(%rbp)
	jmp	.L574
.L573:
	movq	-184(%rbp), %rax
	movl	(%rax), %ecx
	movsbl	-57(%rbp), %edx
	movl	-8(%rbp), %esi
	leaq	-160(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC78, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-160(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	error
.L574:
	jmp	.L412
.L437:
	cmpb	$61, -57(%rbp)
	jne	.L575
	addl	$1, -4(%rbp)
	movl	$59, -8(%rbp)
	jmp	.L576
.L575:
	movl	$58, -8(%rbp)
.L576:
	jmp	.L412
.L438:
	cmpb	$61, -57(%rbp)
	jne	.L577
	addl	$1, -4(%rbp)
	movl	$61, -8(%rbp)
	jmp	.L578
.L577:
	movl	$60, -8(%rbp)
.L578:
	jmp	.L412
.L439:
	cmpb	$61, -57(%rbp)
	jne	.L579
	addl	$1, -4(%rbp)
	movl	$63, -8(%rbp)
	jmp	.L580
.L579:
	movl	$62, -8(%rbp)
.L580:
	jmp	.L412
.L440:
	cmpb	$61, -57(%rbp)
	jne	.L581
	addl	$1, -4(%rbp)
	movl	$65, -8(%rbp)
	jmp	.L582
.L581:
	movl	$64, -8(%rbp)
.L582:
	jmp	.L412
.L441:
	cmpb	$47, -57(%rbp)
	jne	.L583
	addl	$1, -4(%rbp)
	movl	$28, -8(%rbp)
	jmp	.L584
.L583:
	cmpb	$42, -57(%rbp)
	jne	.L585
	addl	$1, -4(%rbp)
	movl	$29, -8(%rbp)
	jmp	.L584
.L585:
	movl	$66, -8(%rbp)
.L584:
	jmp	.L412
.L442:
	movl	$1, -16(%rbp)
	cmpb	$10, -57(%rbp)
	je	.L586
	cmpb	$13, -57(%rbp)
	je	.L586
	cmpb	$0, -57(%rbp)
	je	.L586
	addl	$1, -4(%rbp)
	jmp	.L587
.L586:
	cmpb	$10, -57(%rbp)
	jne	.L588
	movq	-184(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-184(%rbp), %rax
	movl	%edx, (%rax)
.L588:
	movl	$0, -8(%rbp)
.L587:
	jmp	.L412
.L443:
	movl	$1, -16(%rbp)
	cmpb	$42, -57(%rbp)
	jne	.L589
	addl	$1, -4(%rbp)
	movl	$30, -8(%rbp)
	jmp	.L590
.L589:
	cmpb	$10, -57(%rbp)
	jne	.L591
	movq	-184(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-184(%rbp), %rax
	movl	%edx, (%rax)
.L591:
	addl	$1, -4(%rbp)
.L590:
	jmp	.L412
.L444:
	cmpb	$42, -57(%rbp)
	jne	.L592
	addl	$1, -4(%rbp)
	jmp	.L593
.L592:
	cmpb	$47, -57(%rbp)
	jne	.L594
	addl	$1, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L593
.L594:
	addl	$1, -4(%rbp)
	movl	$29, -8(%rbp)
.L593:
	jmp	.L412
.L445:
	movl	-4(%rbp), %eax
	subl	-12(%rbp), %eax
	movl	%eax, -44(%rbp)
	movl	$0, -24(%rbp)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movl	$5, %edx
	movl	$.LC79, %esi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L595
	movl	$1, -24(%rbp)
	jmp	.L596
.L595:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movl	$4, %edx
	movl	$.LC80, %esi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L597
	movl	$2, -24(%rbp)
	jmp	.L596
.L597:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movl	$6, %edx
	movl	$.LC81, %esi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L598
	movl	$3, -24(%rbp)
	jmp	.L596
.L598:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movl	$4, %edx
	movl	$.LC82, %esi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L599
	movl	$4, -24(%rbp)
	jmp	.L596
.L599:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movl	$3, %edx
	movl	$.LC83, %esi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L600
	movl	$5, -24(%rbp)
	jmp	.L596
.L600:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movl	$2, %edx
	movl	$.LC84, %esi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L601
	movl	$6, -24(%rbp)
	jmp	.L596
.L601:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movl	$3, %edx
	movl	$.LC85, %esi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L602
	movl	$7, -24(%rbp)
	jmp	.L596
.L602:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movl	$6, %edx
	movl	$.LC86, %esi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L603
	movl	$8, -24(%rbp)
	jmp	.L596
.L603:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movl	$6, %edx
	movl	$.LC87, %esi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L604
	movl	$9, -24(%rbp)
	jmp	.L596
.L604:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movl	$4, %edx
	movl	$.LC88, %esi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L605
	movl	$10, -24(%rbp)
	jmp	.L596
.L605:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movl	$5, %edx
	movl	$.LC89, %esi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L596
	movl	$11, -24(%rbp)
.L596:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	cmpl	$11, -24(%rbp)
	ja	.L606
	movl	-24(%rbp), %eax
	movq	.L608(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L608:
	.quad	.L607
	.quad	.L609
	.quad	.L610
	.quad	.L611
	.quad	.L612
	.quad	.L613
	.quad	.L614
	.quad	.L615
	.quad	.L616
	.quad	.L617
	.quad	.L618
	.quad	.L619
	.text
.L609:
	movq	-40(%rbp), %rax
	movl	$2, (%rax)
	jmp	.L606
.L610:
	movq	-40(%rbp), %rax
	movl	$3, (%rax)
	jmp	.L606
.L611:
	movq	-40(%rbp), %rax
	movl	$4, (%rax)
	jmp	.L606
.L612:
	movq	-40(%rbp), %rax
	movl	$5, (%rax)
	jmp	.L606
.L613:
	movq	-40(%rbp), %rax
	movl	$6, (%rax)
	jmp	.L606
.L614:
	movq	-40(%rbp), %rax
	movl	$7, (%rax)
	jmp	.L606
.L615:
	movq	-40(%rbp), %rax
	movl	$8, (%rax)
	jmp	.L606
.L616:
	movq	-40(%rbp), %rax
	movl	$9, (%rax)
	jmp	.L606
.L617:
	movq	-40(%rbp), %rax
	movl	$10, (%rax)
	jmp	.L606
.L618:
	movq	-40(%rbp), %rax
	movl	$11, (%rax)
	jmp	.L606
.L619:
	movq	-40(%rbp), %rax
	movl	$12, (%rax)
	jmp	.L606
.L607:
	movq	-40(%rbp), %rax
	movl	$1, (%rax)
	movl	-44(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 8(%rax)
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movl	-12(%rbp), %eax
	movslq	%eax, %rcx
	movq	-168(%rbp), %rax
	addq	%rax, %rcx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-44(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$0, (%rax)
	nop
.L606:
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L446:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$15, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$92, %al
	je	.L621
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movq	-40(%rbp), %rax
	movb	%dl, 8(%rax)
	jmp	.L622
.L621:
	movl	-12(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$34, %eax
	cmpl	$84, %eax
	ja	.L623
	movl	%eax, %eax
	movq	.L625(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L625:
	.quad	.L624
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L626
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L627
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L628
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L629
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L630
	.quad	.L631
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L632
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L633
	.quad	.L623
	.quad	.L623
	.quad	.L623
	.quad	.L634
	.quad	.L623
	.quad	.L635
	.quad	.L623
	.quad	.L636
	.text
.L630:
	movq	-40(%rbp), %rax
	movb	$7, 8(%rax)
	jmp	.L622
.L631:
	movq	-40(%rbp), %rax
	movb	$8, 8(%rax)
	jmp	.L622
.L632:
	movq	-40(%rbp), %rax
	movb	$12, 8(%rax)
	jmp	.L622
.L633:
	movq	-40(%rbp), %rax
	movb	$10, 8(%rax)
	jmp	.L622
.L634:
	movq	-40(%rbp), %rax
	movb	$13, 8(%rax)
	jmp	.L622
.L635:
	movq	-40(%rbp), %rax
	movb	$9, 8(%rax)
	jmp	.L622
.L636:
	movq	-40(%rbp), %rax
	movb	$11, 8(%rax)
	jmp	.L622
.L626:
	movq	-40(%rbp), %rax
	movb	$39, 8(%rax)
	jmp	.L622
.L628:
	movq	-40(%rbp), %rax
	movb	$63, 8(%rax)
	jmp	.L622
.L624:
	movq	-40(%rbp), %rax
	movb	$34, 8(%rax)
	jmp	.L622
.L629:
	movq	-40(%rbp), %rax
	movb	$92, 8(%rax)
	jmp	.L622
.L627:
	movq	-40(%rbp), %rax
	movb	$0, 8(%rax)
	jmp	.L622
.L623:
	movq	-184(%rbp), %rax
	movl	(%rax), %ecx
	movsbl	-57(%rbp), %edx
	leaq	-160(%rbp), %rax
	movl	$.LC90, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-160(%rbp), %rax
	movl	$8, %esi
	movq	%rax, %rdi
	call	error
.L622:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L447:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$17, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L448:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$18, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L449:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$19, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L450:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$20, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L451:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$21, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L452:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$22, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L453:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$23, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L454:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$24, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L455:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$25, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L456:
	movl	-4(%rbp), %eax
	subl	-12(%rbp), %eax
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -56(%rbp)
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movl	-12(%rbp), %eax
	movslq	%eax, %rcx
	movq	-168(%rbp), %rax
	addq	%rax, %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$13, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	cmpl	$1, -20(%rbp)
	jne	.L637
	movq	-56(%rbp), %rax
	movl	$10, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtol
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L638
.L637:
	cmpl	$2, -20(%rbp)
	jne	.L639
	movq	-56(%rbp), %rax
	movl	$10, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtol
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L638
.L639:
	cmpl	$4, -20(%rbp)
	jne	.L640
	movq	-56(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtol
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L638
.L640:
	movq	-56(%rbp), %rax
	movl	$8, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtol
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 8(%rax)
.L638:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	-4(%rbp), %eax
	jmp	.L662
.L457:
	movl	-4(%rbp), %eax
	subl	-12(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -44(%rbp)
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$16, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movl	-44(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 8(%rax)
	movl	$0, -28(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L641
.L658:
	movl	-12(%rbp), %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$92, %al
	jne	.L642
	movl	-12(%rbp), %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$34, %eax
	cmpl	$84, %eax
	ja	.L643
	movl	%eax, %eax
	movq	.L645(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L645:
	.quad	.L644
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L646
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L647
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L648
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L649
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L650
	.quad	.L651
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L652
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L653
	.quad	.L643
	.quad	.L643
	.quad	.L643
	.quad	.L654
	.quad	.L643
	.quad	.L655
	.quad	.L643
	.quad	.L656
	.text
.L650:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$7, (%rax)
	jmp	.L643
.L651:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$8, (%rax)
	jmp	.L643
.L652:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$12, (%rax)
	jmp	.L643
.L653:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$10, (%rax)
	jmp	.L643
.L654:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$13, (%rax)
	jmp	.L643
.L655:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$9, (%rax)
	jmp	.L643
.L656:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$11, (%rax)
	jmp	.L643
.L646:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$39, (%rax)
	jmp	.L643
.L648:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$63, (%rax)
	jmp	.L643
.L644:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$34, (%rax)
	jmp	.L643
.L649:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$92, (%rax)
	jmp	.L643
.L647:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$0, (%rax)
	nop
.L643:
	addl	$2, -24(%rbp)
	jmp	.L657
.L642:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movl	-12(%rbp), %ecx
	movl	-24(%rbp), %eax
	addl	%ecx, %eax
	movslq	%eax, %rcx
	movq	-168(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -24(%rbp)
.L657:
	addl	$1, -28(%rbp)
.L641:
	movl	-24(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L658
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L458:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$26, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L459:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$27, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L460:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$29, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L461:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$30, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L462:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$31, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L463:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$32, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L464:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$35, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L465:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$33, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L466:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$34, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L467:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$36, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L468:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$37, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L469:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$38, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L470:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$39, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L471:
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$28, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movl	-4(%rbp), %eax
	jmp	.L662
.L472:
	movl	-4(%rbp), %eax
	subl	-12(%rbp), %eax
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -56(%rbp)
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movl	-12(%rbp), %eax
	movslq	%eax, %rcx
	movq	-168(%rbp), %rax
	addq	%rax, %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movl	$24, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$14, (%rax)
	movq	-184(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	atof
	movq	%xmm0, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	addToken
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	-4(%rbp), %eax
	jmp	.L662
.L412:
	movl	-4(%rbp), %eax
	cmpl	-172(%rbp), %eax
	jl	.L659
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	t7
	testl	%eax, %eax
	jne	.L659
	cmpl	$0, -16(%rbp)
	jne	.L660
	cmpl	$0, -8(%rbp)
	jne	.L661
.L660:
	movl	-4(%rbp), %eax
	jmp	.L662
.L661:
	movl	$-1, %eax
.L662:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE58:
	.size	addNextToken, .-addNextToken
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
