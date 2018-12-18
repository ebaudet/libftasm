; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/18 22:38:59 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/19 00:25:29 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define READ				3
%define WRITE				4

; read(int fd, user_addr_t cbuf, user_size_t nbyte)
; write(int fd, user_addr_t cbuf, user_size_t nbyte)

section .text
	global _ft_cat

_ft_cat:
end:
	xor rax, rax
	ret

; Ordre des arguments d'une fonction
; %rdi, %rsi, %rdx, %rcx, %r8 and %r9
; retour d'une fonction
; %rax