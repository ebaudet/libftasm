; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    libc.s                                             :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/11 14:36:12 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/12 14:33:57 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .data
hello:
	.string db "Hello World !", 10
	.len equ $ - hello.string

section .text
	global start
	global _main
	extern _printf

start:
	call _main
	ret

_main:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	lea rdi, [rel hello.string]
	call _printf
	leave
	ret