; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    test.s                                             :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/12 13:24:20 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/13 15:55:06 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
%define MACH_SYSCALL(nb)	0x2000000 | nb
%define WRITE				4
%define EXIT				1
%define STDOUT				1

%macro print 1
	mov rdi, STDOUT
	lea rsi, [rel %1.string]
	mov rdx, %1.len
	mov rax, MACH_SYSCALL(WRITE)
	syscall
%endmacro

section .data
hello:
	.string	db	'Hello World como estas ?', 10
	.len equ $ - hello.string
r12sup:
	.string	db	'R12 > R13', 10
	.len equ $ - r12sup.string
r13sup:
	.string	db	'R13 > R12', 10
	.len equ $ - r13sup.string
point:
	.string	db	'.', 0
	.len equ $ - point.string
newline:
	.string	db	10
	.len equ $ - newline.string
if2true:
	.string db '((a > b) && (c <= d)) is true', 10
	.len equ $ - if2true.string
if2false:
	.string db '((a > b) && (c <= d)) is false', 10
	.len equ $ - if2false.string
txtcasea1:
	.string db 'case 1', 10
	.len equ $ - txtcasea1.string
txtcasea2:
	.string db 'case 2', 10
	.len equ $ - txtcasea2.string
txtcaseadefaut:
	.string db 'case default', 10
	.len equ $ - txtcaseadefaut.string
intForm:
	.string db '%d', 10
	.len equ $ - intForm.string
longIntForm:
	.string db '%ld', 10
	.len equ $ - longIntForm.string
stringForm:
	.string db '%s', 10
	.len equ $ - stringForm.string

section .text
	global start
	global _main
	global _print
	extern _printf
; Ordre des arguments d'une fonction
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; retour d'une fonction
; %rax

start:
	call _main
	ret

_main:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, MACH_SYSCALL(WRITE)  	; system call for write
	mov rdi, 1						; file handle 1 is stdout
	mov rsi, hello.string			; address of string to output
	mov rdx, hello.len				; number of bytes
	syscall 						; invoke operating system to do the write


	; *****			if else statment if (a>b)                     ***** ;
	mov r12, 2
	mov r13, 6
if:	cmp r12, r13
	jng else
	print r12sup
	jmp endif
else:
	print r13sup
endif:


; *****			for statment for(int a=10; a>0; a−−)               ***** ;
	mov rcx, 10
for1:
	push rcx
	print point
	pop rcx
	loop for1

print newline


; *****			for statment for(int a=1; a < 10; a++)               ***** ;
for2: mov r12, 1
	jmp test2
next2:
	print point
	inc r12
test2: cmp r12, 10
	jl next2

print newline

; *****			if statment ((a > b) && (c <= d))                  ***** ;
	mov rax, 30
	mov rbx, 1
	mov rcx, 10
	mov rdx, 12
if2: cmp rax, rbx
	jng else2
	cmp rcx, rdx
	jnle else2
	print if2true
	jmp endif2
else2:
	print if2false
endif2:


; *****			switch statment                         ***** ;
	mov rcx, 1
switcha: cmp rcx, 1
	jne casea2
	print txtcasea1
	jmp endswitcha
casea2: cmp rcx, 2
	jne defaulta
	print txtcasea2
	jmp endswitcha
defaulta:
	print txtcaseadefaut
endswitcha:



; *****			while statment                         ***** ;
	mov r12, 9
while1: cmp r12, 0
	jle endwhile1
	dec r12
	print point
	jmp while1
endwhile1:
	print newline


; *****			do while statment                         ***** ;
	mov r12, 9
do1:
	print point
	dec r12
	cmp r12, 0
	jg do1


end:
	print newline
	mov rax, MACH_SYSCALL(EXIT) 	; system call for exit
	xor rdi, rdi 					; exit code 0
	syscall 						; invoke operating system to exit

