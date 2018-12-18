; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memset.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/11 16:04:09 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/18 04:58:32 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_memset

_ft_memset:
	push rdi
	cld
	mov rcx, rdx
	mov rax, rsi
	rep stosb
	pop rax
	ret
