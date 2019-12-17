; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    syscall.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/11 14:58:03 by ebaudet           #+#    #+#              ;
;    Updated: 2019/12/17 21:56:44 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define WRITE				4

section .data
hello:
	.string db "Hello World !", 10
	.len equ $ - hello.string

section .text
	global start
	global _main

start:
	call _main
	ret

_main:
	push rbp
	mov rbp, rsp
	mov rdi, STDOUT
	lea rsi, [rel hello.string]
	mov rdx, hello.len
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	pop rbp
	xor rax, rax
	ret
