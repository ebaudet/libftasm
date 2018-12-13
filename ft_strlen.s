; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:29:42 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/13 18:27:20 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_strlen

_ft_strlen:
	xor rax, rax ;rax = 0
	mov rcx, [rsp+4]
	test rcx, rcx
	jz pointeurInvalide
	jmp saut

iteration:
	add rax, 1
	add rcx, 1

saut:
	cmp byte[rcx], 0
	jnz iteration

pointeurInvalide:
	ret