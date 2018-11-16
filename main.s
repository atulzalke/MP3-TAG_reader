	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"clear"
.LC1:
	.string	"rb"
.LC2:
	.string	"fopen"
.LC3:
	.string	"ID TAG is not read"
.LC4:
	.string	"--------------------"
.LC5:
	.string	"TIT2"
.LC6:
	.string	"SongName: "
.LC7:
	.string	"TPE1"
.LC8:
	.string	"Artist\t: "
.LC9:
	.string	"TALB"
.LC10:
	.string	"Album\t: "
.LC11:
	.string	"TYER"
.LC12:
	.string	"Year\t: "
.LC13:
	.string	"COMM"
.LC14:
	.string	"Comment\t: "
.LC15:
	.string	"w"
.LC16:
	.string	"New.mp3"
.LC17:
	.string	"-T"
.LC18:
	.string	"\n\n\t\tEnter Title name: "
.LC19:
	.string	"%[^\n]s"
	.align 8
.LC20:
	.string	"\n\t\t!!!!  Succesfully Done  !!!!"
.LC21:
	.string	"\n\t\tTitle changed as %s\n\n"
.LC22:
	.string	"-AR"
.LC23:
	.string	"\n\n\t\tEnter Artist name: "
.LC24:
	.string	"\n\t\tArtist changed as %s\n\n"
.LC25:
	.string	"-AL"
.LC26:
	.string	"\n\n\t\tEnter Album name: "
.LC27:
	.string	"\n\t\tAblum changed as %s\n\n"
.LC28:
	.string	"-Y"
.LC29:
	.string	"\n\n\t\tEnter The year: "
.LC30:
	.string	"\n\t\tYear changed as %s\n\n"
.LC31:
	.string	"-C"
.LC32:
	.string	"\n\n\t\tEnter the Comment: "
.LC33:
	.string	"\n\t\tComment changed as %s\n\n"
	.align 8
.LC34:
	.string	"\n\n\t!!!!!!!!   ERROR !! ERROR !! ERROR   !!!!!!!!\n"
	.align 8
.LC35:
	.string	"Check the TAG\nIt should be like:"
	.align 8
.LC36:
	.string	"./mp3_TagReader -T file_name.mp3"
	.align 8
.LC37:
	.string	"\ne.g. For\nTitle: -T, Album: -AL, Artist: -AR, Year: -Y, Comment: -C\n"
	.align 8
.LC38:
	.string	"\n\n\t!!!!!!!!  ERROR !! ERROR !! ERROR  !!!!!!!!\n"
.LC39:
	.string	"Please write the tag\nLike:"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movl	%edi, -180(%rbp)
	movq	%rsi, -192(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	call	system@PLT
	movl	-180(%rbp), %eax
	cmpl	$2, %eax
	je	.L3
	cmpl	$3, %eax
	je	.L4
	jmp	.L19
.L3:
	movq	-192(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -160(%rbp)
	cmpq	$0, -160(%rbp)
	jne	.L5
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L5:
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	id3v2_head@PLT
	testl	%eax, %eax
	jne	.L6
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	jmp	.L7
.L6:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
.L7:
	leaq	.LC5(%rip), %rax
	movq	%rax, -144(%rbp)
	movq	-160(%rbp), %rax
	movl	$0, %edx
	movl	$10, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	leaq	-144(%rbp), %rdx
	movq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tag@PLT
	movl	%eax, -164(%rbp)
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-164(%rbp), %edx
	movq	-160(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str_info@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, -144(%rbp)
	movq	-160(%rbp), %rax
	movl	$0, %edx
	movl	$10, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	leaq	-144(%rbp), %rdx
	movq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tag@PLT
	movl	%eax, -164(%rbp)
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-164(%rbp), %edx
	movq	-160(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str_info@PLT
	leaq	.LC9(%rip), %rax
	movq	%rax, -144(%rbp)
	movq	-160(%rbp), %rax
	movl	$0, %edx
	movl	$10, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	leaq	-144(%rbp), %rdx
	movq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tag@PLT
	movl	%eax, -164(%rbp)
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-164(%rbp), %edx
	movq	-160(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str_info@PLT
	leaq	.LC11(%rip), %rax
	movq	%rax, -144(%rbp)
	movq	-160(%rbp), %rax
	movl	$0, %edx
	movl	$10, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	leaq	-144(%rbp), %rdx
	movq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tag@PLT
	movl	%eax, -164(%rbp)
	leaq	.LC12(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-164(%rbp), %edx
	movq	-160(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str_info@PLT
	leaq	.LC13(%rip), %rax
	movq	%rax, -144(%rbp)
	movq	-160(%rbp), %rax
	movl	$0, %edx
	movl	$10, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	leaq	-144(%rbp), %rdx
	movq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tag@PLT
	movl	%eax, -164(%rbp)
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-164(%rbp), %edx
	movq	-160(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	str_info@PLT
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L8
.L4:
	movq	-192(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -160(%rbp)
	cmpq	$0, -160(%rbp)
	jne	.L9
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L9:
	leaq	.LC15(%rip), %rsi
	leaq	.LC16(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -152(%rbp)
	cmpq	$0, -152(%rbp)
	jne	.L10
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L10:
	movq	-192(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L11
	leaq	.LC18(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rdi
	movl	$0, %eax
	call	scanf@PLT
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, -144(%rbp)
	leaq	-144(%rbp), %rdx
	movq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tag@PLT
	movl	%eax, -164(%rbp)
	movl	-164(%rbp), %ecx
	leaq	-112(%rbp), %rdx
	movq	-152(%rbp), %rsi
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	change_info@PLT
	leaq	.LC20(%rip), %rdi
	call	puts@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC21(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L8
.L11:
	movq	-192(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L13
	leaq	.LC23(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rdi
	movl	$0, %eax
	call	scanf@PLT
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, -144(%rbp)
	leaq	-144(%rbp), %rdx
	movq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tag@PLT
	movl	%eax, -164(%rbp)
	movl	-164(%rbp), %ecx
	leaq	-112(%rbp), %rdx
	movq	-152(%rbp), %rsi
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	change_info@PLT
	leaq	.LC20(%rip), %rdi
	call	puts@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L8
.L13:
	movq	-192(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L14
	leaq	.LC26(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rdi
	movl	$0, %eax
	call	scanf@PLT
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	leaq	.LC9(%rip), %rax
	movq	%rax, -144(%rbp)
	leaq	-144(%rbp), %rdx
	movq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tag@PLT
	movl	%eax, -164(%rbp)
	movl	-164(%rbp), %ecx
	leaq	-112(%rbp), %rdx
	movq	-152(%rbp), %rsi
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	change_info@PLT
	leaq	.LC20(%rip), %rdi
	call	puts@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC27(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L8
.L14:
	movq	-192(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC28(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L15
	leaq	.LC29(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rdi
	movl	$0, %eax
	call	scanf@PLT
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	leaq	.LC11(%rip), %rax
	movq	%rax, -144(%rbp)
	leaq	-144(%rbp), %rdx
	movq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tag@PLT
	movl	%eax, -164(%rbp)
	movl	-164(%rbp), %ecx
	leaq	-112(%rbp), %rdx
	movq	-152(%rbp), %rsi
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	change_info@PLT
	leaq	.LC20(%rip), %rdi
	call	puts@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L8
.L15:
	movq	-192(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC31(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L16
	leaq	.LC32(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rdi
	movl	$0, %eax
	call	scanf@PLT
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	leaq	.LC13(%rip), %rax
	movq	%rax, -144(%rbp)
	leaq	-144(%rbp), %rdx
	movq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	tag@PLT
	movl	%eax, -164(%rbp)
	movl	-164(%rbp), %ecx
	leaq	-112(%rbp), %rdx
	movq	-152(%rbp), %rsi
	movq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	change_info_comm@PLT
	leaq	.LC20(%rip), %rdi
	call	puts@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC33(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L8
.L16:
	leaq	.LC34(%rip), %rdi
	call	puts@PLT
	leaq	.LC35(%rip), %rdi
	call	puts@PLT
	leaq	.LC36(%rip), %rdi
	call	puts@PLT
	leaq	.LC37(%rip), %rdi
	call	puts@PLT
	jmp	.L8
.L19:
	leaq	.LC38(%rip), %rdi
	call	puts@PLT
	leaq	.LC39(%rip), %rdi
	call	puts@PLT
	leaq	.LC36(%rip), %rdi
	call	puts@PLT
	leaq	.LC37(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L8:
	call	fcloseall@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
