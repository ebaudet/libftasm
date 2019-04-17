; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_puts.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:29:31 by ebaudet           #+#    #+#              ;
;    Updated: 2019/04/17 18:56:44 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define WRITE				4

section .data
null:
	.string db "(null)", 10
	.len equ $ - null.string

section .text
	global _ft_puts
	extern _ft_strlen

_ft_puts:
	cmp rdi, 0
	je _put_null
	call _ft_strlen
	cmp rax, 0
	je end

_ft_putchar:
	mov rsi, rdi
	mov rdi, STDOUT
	mov rdx, rax
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	ret

_put_null:
	mov rdi, STDOUT
	lea rsi, [rel null.string]
	mov rdx, null.len
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	ret

end:
	ret

