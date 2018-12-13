; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isprint.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ebaudet <ebaudet@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/12/13 14:28:59 by ebaudet           #+#    #+#              ;
;    Updated: 2018/12/13 16:09:04 by ebaudet          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global _ft_isprint

_ft_isprint:
	cmp rdi, 32
	jl false
	cmp rdi, 126
	jg false
true:
	mov rax, 1
	ret
false:
	mov rax, 0
	ret