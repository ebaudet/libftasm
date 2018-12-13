; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_puts.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:29:31 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/13 18:17:13 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define WRITE				4

section .text
	global _ft_puts

_ft_puts:
	call _ft_putchar


_ft_putchar:
	mov rdi, STDOUT
	mov rsi, r12
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	ret